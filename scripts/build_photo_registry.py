#!/usr/bin/env python3
"""
Build year-specific driver photo registry from DB + Wikimedia Commons.

Output:
  public/f1-photo-registry.json
  public/photos/{year}/{driver_id}.jpg  (downloaded when possible)

Run from Project/ with MySQL up:
  python scripts/build_photo_registry.py
  python scripts/build_photo_registry.py --force   # re-fetch all (ignore cache)
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PUBLIC = ROOT / "public"
REGISTRY_PATH = PUBLIC / "f1-photo-registry.json"

USER_AGENT = "COM2058-F1-Project/1.0 (university coursework; local cache)"
WIKI_DELAY = 0.45
MAX_RETRIES = 3
PLACEHOLDER = "formula-1-logo.png"

# English Wikipedia article titles (drivers with non-obvious page names)
WIKI_PAGE: dict[str, str] = {
    "Carlos Sainz Jr.": "Carlos_Sainz",
    "Sergio Pérez": "Sergio_Pérez",
    "Nico Hülkenberg": "Nico_Hülkenberg",
    "Kimi Räikkönen": "Kimi_Räikkönen",
    "Daniel Ricciardo": "Daniel_Ricciardo",
    "Lance Stroll": "Lance_Stroll",
    "Esteban Ocon": "Esteban_Ocon",
    "Pierre Gasly": "Pierre_Gasly",
    "Yuki Tsunoda": "Yuki_Tsunoda",
    "Guanyu Zhou": "Zhou_Guanyu",
    "Franco Colapinto": "Franco_Colapinto",
    "Oliver Bearman": "Oliver_Bearman",
    "Gabriel Bortoleto": "Gabriel_Bortoleto",
    "Isack Hadjar": "Isack_Hadjar",
    "Kimi Antonelli": "Andrea_Kimi_Antonelli",
    "Alexander Albon": "Alexander_Albon",
    "George Russell": "George_Russell_(racing_driver)",
    "Lando Norris": "Lando_Norris",
    "Oscar Piastri": "Oscar_Piastri",
    "Charles Leclerc": "Charles_Leclerc",
    "Max Verstappen": "Max_Verstappen",
    "Lewis Hamilton": "Lewis_Hamilton",
    "Fernando Alonso": "Fernando_Alonso",
    "Sebastian Vettel": "Sebastian_Vettel",
    "Valtteri Bottas": "Valtteri_Bottas",
    "Nico Rosberg": "Nico_Rosberg",
    "Jenson Button": "Jenson_Button",
    "Daniil Kvyat": "Daniil_Kvyat",
    "Romain Grosjean": "Romain_Grosjean",
    "Kevin Magnussen": "Kevin_Magnussen",
    "Mick Schumacher": "Mick_Schumacher",
    "Robert Kubica": "Robert_Kubica",
    "Antonio Giovinazzi": "Antonio_Giovinazzi",
    "Nicholas Latifi": "Nicholas_Latifi",
    "Logan Sargeant": "Logan_Sargeant",
    "Stoffel Vandoorne": "Stoffel_Vandoorne",
    "Pascal Wehrlein": "Pascal_Wehrlein",
    "Jolyon Palmer": "Jolyon_Palmer",
    "Pastor Maldonado": "Pastor_Maldonado",
    "Felipe Massa": "Felipe_Massa",
    "Felipe Nasr": "Felipe_Nasr",
    "Marcus Ericsson": "Marcus_Ericsson",
    "Alexander Rossi": "Alexander_Rossi_(racing_driver)",
    "Roberto Merhi": "Roberto_Merhi",
    "Esteban Gutiérrez": "Esteban_Gutiérrez",
    "Sergey Sirotkin": "Sergey_Sirotkin",
    "Rio Haryanto": "Rio_Haryanto",
    "Jack Aitken": "Jack_Aitken",
    "Nikita Mazepin": "Nikita_Mazepin",
    "Liam Lawson": "Liam_Lawson",
}

BAD_TITLE = (
    "opening lap",
    "start lights",
    "starting grid",
    "podium ceremony",
    "team principal",
    "press conference",
    "car launch",
    "championship trophy",
    "victory lane",
    "parc ferme",
    "safety car",
    "formation lap",
    "race start",
    "first lap",
    "mass crash",
    "collision",
    "wreckage",
    "helicopter",
    "crowd",
    "grandstand",
)

GOOD_TITLE = (
    " fp1",
    " fp2",
    " fp3",
    " qualifying",
    " practice",
    " portrait",
    " headshot",
    " driver ",
)


def db_rows() -> list[dict]:
    try:
        import pymysql
    except ImportError:
        print("Install pymysql: pip install pymysql", file=sys.stderr)
        sys.exit(1)

    conn = pymysql.connect(
        host="127.0.0.1",
        port=3306,
        user="f1_app",
        password="f1_app_password_change_me",
        database="formula_1",
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor,
    )
    with conn:
        with conn.cursor() as cur:
            cur.execute(
                """
                SELECT
                  td.season_year AS year,
                  d.driver_id,
                  d.first_name AS forename,
                  d.last_name AS surname,
                  t.team_name AS constructor,
                  td.seat_no
                FROM team_drivers td
                JOIN drivers d ON d.driver_id = td.driver_id
                JOIN teams t ON t.team_id = td.team_id
                WHERE td.role = 'MAIN'
                ORDER BY td.season_year, d.driver_id;
                """
            )
            return list(cur.fetchall())


def normalize_name(forename: str, surname: str) -> str:
    s = f"{forename} {surname}".replace("  ", " ").strip()
    s = re.sub(r"\s+Jr\.?$", "", s, flags=re.I).strip()
    return s


def name_tokens(full_name: str) -> list[str]:
    parts = []
    for p in re.split(r"[\s\-]+", full_name):
        p = p.lower().strip()
        if len(p) > 2 and p not in ("jr", "sr", "the"):
            parts.append(p)
    return parts


def _commons_search(query: str, limit: int = 10) -> list[dict]:
    url = (
        "https://commons.wikimedia.org/w/api.php?"
        + urllib.parse.urlencode(
            {
                "action": "query",
                "format": "json",
                "generator": "search",
                "gsrsearch": query,
                "gsrnamespace": 6,
                "gsrlimit": limit,
                "prop": "imageinfo",
                "iiprop": "url",
                "iiurlwidth": 900,
            }
        )
    )
    last_err: Exception | None = None
    for attempt in range(MAX_RETRIES):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
            with urllib.request.urlopen(req, timeout=25) as resp:
                data = json.load(resp)
            return list(data.get("query", {}).get("pages", {}).values())
        except (urllib.error.URLError, TimeoutError, json.JSONDecodeError, OSError) as e:
            last_err = e
            time.sleep(WIKI_DELAY * (attempt + 2))
    if last_err:
        raise last_err
    return []


def _score_image(title: str, tokens: list[str], year: int, team: str) -> int:
    t = title.lower()
    if any(x in t for x in (".svg", "logo", "flag", "circuit map", "track map")):
        return -999
    if any(x in t for x in BAD_TITLE):
        return -999

    surname = tokens[-1] if tokens else ""
    if not surname or surname not in t:
        return -999

    score = 50
    if tokens[0] in t if len(tokens) > 1 else False:
        score += 15
    if str(year) in t:
        score += 30
    team_word = team.split()[0].lower()
    if team_word in t or team.lower() in t:
        score += 12
    if any(g in t for g in GOOD_TITLE):
        score += 10
    if "formula one" in t or "formula 1" in t or " f1 " in t or "grand prix" in t:
        score += 4
    if re.search(r"\b\d{4}\b", t) and str(year) not in t:
        score -= 15
    return score


def wiki_photo_url(full_name: str, year: int, team: str) -> tuple[str | None, str | None, int]:
    tokens = name_tokens(full_name)
    surname = tokens[-1] if tokens else full_name.split()[-1]
    queries = [
        f"{full_name} {year} {team} Formula One",
        f"{surname} {year} {team}",
        f"{full_name} {year} Grand Prix",
        f"{surname} {year} F1 driver",
    ]
    best: tuple[int, str, str] | None = None
    for q in queries:
        try:
            pages = _commons_search(q)
        except (urllib.error.URLError, TimeoutError, json.JSONDecodeError, OSError):
            time.sleep(WIKI_DELAY * 2)
            continue
        for page in pages:
            title = page.get("title") or ""
            sc = _score_image(title, tokens, year, team)
            ii = (page.get("imageinfo") or [{}])[0]
            thumb = ii.get("thumburl") or ii.get("url")
            if thumb and (best is None or sc > best[0]):
                best = (sc, thumb, title)
        time.sleep(WIKI_DELAY)
    if best and best[0] >= 55:
        return best[1], best[2], best[0]
    return None, None, 0


def wikipedia_driver_photo(full_name: str, forename: str = "", surname: str = "") -> str | None:
    raw = f"{forename} {surname}".strip() if forename else full_name
    page = WIKI_PAGE.get(raw) or WIKI_PAGE.get(full_name) or full_name.replace(" ", "_")
    url = (
        "https://en.wikipedia.org/w/api.php?"
        + urllib.parse.urlencode(
            {
                "action": "query",
                "format": "json",
                "titles": page,
                "prop": "pageimages",
                "piprop": "thumbnail",
                "pithumbsize": 720,
            }
        )
    )
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            data = json.load(resp)
    except (urllib.error.URLError, TimeoutError, json.JSONDecodeError, OSError):
        return None
    for page in data.get("query", {}).get("pages", {}).values():
        if page.get("pageid") == -1:
            continue
        return (page.get("thumbnail") or {}).get("source")
    return None


def download_file(url: str, dest: Path) -> bool:
    dest.parent.mkdir(parents=True, exist_ok=True)
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=35) as resp:
            data = resp.read()
        if len(data) < 2500:
            return False
        dest.write_bytes(data)
        return True
    except (urllib.error.URLError, OSError):
        return False


def resolve_photo(
    full_name: str,
    year: int,
    team: str,
    local: Path,
    rel_path: str,
    skip_download: bool,
    forename: str = "",
    surname: str = "",
    wikipedia_only: bool = False,
) -> tuple[str, str, str | None]:
    """Returns (photo path or URL, source, commons_title)."""
    if local.is_file() and not skip_download:
        return rel_path, "local", None

    if skip_download:
        return PLACEHOLDER, "placeholder", None

    thumb: str | None = None
    title: str | None = None
    source = "commons"
    if not wikipedia_only:
        thumb, title, _score = wiki_photo_url(full_name, year, team)
        time.sleep(WIKI_DELAY)
    if not thumb:
        thumb = wikipedia_driver_photo(full_name, forename, surname)
        source = "wikipedia"
        time.sleep(WIKI_DELAY)

    if thumb:
        if download_file(thumb, local):
            return rel_path, source, title
        return thumb, f"{source}_remote", title

    return PLACEHOLDER, "placeholder", None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--skip-download", action="store_true")
    parser.add_argument("--force", action="store_true", help="Ignore existing local files")
    parser.add_argument(
        "--fill-placeholders",
        action="store_true",
        help="Only re-resolve registry rows with source=placeholder",
    )
    parser.add_argument(
        "--wikipedia-only",
        action="store_true",
        help="Skip Commons (faster); use Wikipedia portrait or remote URL",
    )
    parser.add_argument("--limit", type=int, default=0)
    args = parser.parse_args()

    rows = db_rows()
    if args.limit:
        rows = rows[: args.limit]

    placeholder_ids: set[tuple[int, int]] = set()
    if args.fill_placeholders and REGISTRY_PATH.is_file():
        old = json.loads(REGISTRY_PATH.read_text(encoding="utf-8"))
        for ykey, drivers in old.get("by_year", {}).items():
            for did, ent in drivers.items():
                if ent.get("source") == "placeholder":
                    placeholder_ids.add((int(ykey), int(did)))
        rows = [r for r in rows if (int(r["year"]), int(r["driver_id"])) in placeholder_ids]
        print(f"Filling {len(rows)} placeholder entries…")

    if args.force and not args.skip_download:
        import shutil

        photos = PUBLIC / "photos"
        if photos.exists():
            shutil.rmtree(photos)
        print("Cleared public/photos/ for full rebuild")

    registry: dict[str, dict[str, dict]] = {}
    if args.fill_placeholders and REGISTRY_PATH.is_file():
        registry = json.loads(REGISTRY_PATH.read_text(encoding="utf-8")).get("by_year", {})

    stats: dict[str, int] = {}

    for i, row in enumerate(rows):
        year = int(row["year"])
        driver_id = int(row["driver_id"])
        forename = row["forename"]
        surname = row["surname"]
        team = row["constructor"]
        seat = row.get("seat_no") or 1
        full_name = normalize_name(forename, surname)

        ykey = str(year)
        did = str(driver_id)
        registry.setdefault(ykey, {})

        rel_path = f"photos/{year}/{driver_id}.jpg"
        local = PUBLIC / rel_path
        if args.force and local.is_file():
            local.unlink()

        photo, source, title = resolve_photo(
            full_name,
            year,
            team,
            local,
            rel_path,
            args.skip_download,
            forename,
            surname,
            wikipedia_only=args.wikipedia_only,
        )
        stats[source] = stats.get(source, 0) + 1

        entry: dict = {
            "driver_id": driver_id,
            "forename": forename,
            "surname": surname,
            "team": team,
            "seat_no": seat,
            "photo": photo,
            "source": source,
        }
        if title:
            entry["commons_title"] = title
        registry[ykey][did] = entry
        print(f"[{i+1}/{len(rows)}] {year} {full_name}: {source} -> {photo[:60]}")

    meta = {
        "version": 2,
        "generated_by": "scripts/build_photo_registry.py",
        "stats": stats,
        "total_entries": sum(len(v) for v in registry.values()),
    }
    REGISTRY_PATH.write_text(
        json.dumps({"meta": meta, "by_year": registry}, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    print(f"\nWrote {REGISTRY_PATH} ({meta['total_entries']} entries)")
    print(f"Stats: {stats}")


if __name__ == "__main__":
    main()
