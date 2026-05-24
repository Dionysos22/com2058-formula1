#!/usr/bin/env python3
"""Smoke tests for COM2058 F1 project (API + static frontend assets)."""
from __future__ import annotations

import json
import sys
import urllib.error
import urllib.request
from pathlib import Path

BASE = "http://127.0.0.1:8000"
PUBLIC = Path(__file__).resolve().parents[1] / "public"

API_ENDPOINTS = [
    "/health",
    "/api/years",
    "/api/season-status?year=2024",
    "/api/races?year=2024",
    "/api/standings/drivers?year=2024",
    "/api/standings/constructors?year=2024",
    "/api/circuits",
    "/api/seasons/2024/drivers",
]

STATIC_PAGES = [
    "/",
    "/index.html",
    "/schedule.html",
    "/result.html",
    "/drivers.html",
    "/teams.html",
    "/race-1.html",
    "/dashboard.html",
]

STATIC_ASSETS = [
    "/style.css",
    "/f1data.js",
    "/formula-1-logo.png",
    "/1melbournedetailed.avif",
    "/22yasmarinacircuitdetailed.avif",
]

DELIVERABLES = [
    "Requirements.md",
    "ERD.drawio",
    "Formula_1.sql",
    "SAMPLE_QUERIES.sql",
    "docker-compose.yml",
    "README.md",
    "SUBMISSION.md",
]


def fetch(path: str) -> tuple[int, bytes]:
    req = urllib.request.Request(BASE + path, headers={"Accept": "*/*"})
    with urllib.request.urlopen(req, timeout=10) as resp:
        return resp.status, resp.read()


def check_html_paths() -> list[str]:
    errors: list[str] = []
    for html in PUBLIC.glob("*.html"):
        text = html.read_text(encoding="utf-8")
        if "C:\\Users" in text:
            errors.append(f"{html.name}: Windows absolute path")
        if "CİRCUİT/" in text:
            errors.append(f"{html.name}: broken CİRCUİT/ prefix")
    avifs = {p.name for p in PUBLIC.glob("*.avif")}
    for html in ("schedule.html", *PUBLIC.glob("race-*.html")):
        path = html if isinstance(html, Path) else PUBLIC / html
        if not path.exists():
            continue
        text = path.read_text(encoding="utf-8")
        for line in text.splitlines():
            if "detailed.avif" in line and 'src="' in line:
                start = line.index('src="') + 5
                end = line.index('"', start)
                src = line[start:end]
                if "/" in src or "\\" in src:
                    errors.append(f"{path.name}: circuit src not flat: {src}")
                elif src not in avifs:
                    errors.append(f"{path.name}: missing asset {src}")
    return errors


def main() -> int:
    failed: list[str] = []

    print("=== Deliverables ===")
    root = Path(__file__).resolve().parents[1]
    for name in DELIVERABLES:
        ok = (root / name).exists()
        print(f"{'OK' if ok else 'MISSING':>7}  {name}")
        if not ok:
            failed.append(f"missing deliverable: {name}")
    for optional in ("Requirements.docx", "Requirements_TR.docx", "ERD.pdf"):
        ok = (root / optional).exists()
        print(f"{'OK' if ok else 'WARN':>7}  {optional} (optional for phase 3 run)")

    print("\n=== HTML circuit paths ===")
    path_errors = check_html_paths()
    if path_errors:
        for e in path_errors:
            print(f"FAIL  {e}")
            failed.append(e)
    else:
        print("OK    all circuit image paths look valid")

    print("\n=== API (server must be running) ===")
    for path in API_ENDPOINTS:
        try:
            status, body = fetch(path)
            ok = status == 200
            extra = ""
            if ok and path.endswith("/years") or "standings" in path or path.endswith("/circuits"):
                data = json.loads(body)
                extra = f" items={len(data) if isinstance(data, list) else 'obj'}"
            elif ok and path == "/health":
                extra = f" {body.decode()[:60]}"
            print(f"{'OK' if ok else 'FAIL':>7}  {path}{extra}")
            if not ok:
                failed.append(f"API {path} -> {status}")
        except urllib.error.HTTPError as exc:
            body = exc.read().decode(errors="replace")[:120]
            print(f"  FAIL  {path} (HTTP {exc.code}: {body})")
            failed.append(f"API {path} -> HTTP {exc.code}")
        except urllib.error.URLError as exc:
            print(f"  SKIP  {path} ({exc.reason})")
            failed.append(f"API unreachable: {exc.reason}")

    print("\n=== Static pages & assets ===")
    for path in STATIC_PAGES + STATIC_ASSETS:
        try:
            status, body = fetch(path)
            ok = status == 200 and len(body) > 0
            print(f"{'OK' if ok else 'FAIL':>7}  {path} ({len(body)} bytes)")
            if not ok:
                failed.append(f"static {path} -> {status}")
        except urllib.error.URLError as exc:
            print(f"  SKIP  {path} ({exc.reason})")
            failed.append(f"static unreachable: {path}")

    print("\n=== Summary ===")
    if failed:
        print(f"FAILED ({len(failed)}):")
        for f in failed:
            print(f"  - {f}")
        return 1
    print("All checks passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
