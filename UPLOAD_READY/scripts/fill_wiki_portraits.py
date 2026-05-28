#!/usr/bin/env python3
"""Assign Wikipedia portrait to remaining placeholder registry rows (one API call per driver)."""
from __future__ import annotations

import json
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from build_photo_registry import (  # noqa: E402
    PUBLIC,
    REGISTRY_PATH,
    download_file,
    normalize_name,
    wikipedia_driver_photo,
)

WIKI_DELAY = 0.4


def main() -> None:
    data = json.loads(REGISTRY_PATH.read_text(encoding="utf-8"))
    by_year = data["by_year"]
    cache: dict[str, str | None] = {}
    updated = 0

    for ykey, drivers in by_year.items():
        for did, ent in drivers.items():
            if ent.get("source") != "placeholder":
                continue
            if did not in cache:
                full = normalize_name(ent["forename"], ent["surname"])
                cache[did] = wikipedia_driver_photo(full, ent["forename"], ent["surname"])
                time.sleep(WIKI_DELAY)
                print(f"wiki lookup {did} {ent['forename']} {ent['surname']}: {'ok' if cache[did] else 'miss'}")

            url = cache[did]
            if not url:
                continue

            rel = f"photos/wiki/{did}.jpg"
            local = PUBLIC / rel
            if download_file(url, local):
                ent["photo"] = rel
                ent["source"] = "wikipedia"
            else:
                ent["photo"] = url
                ent["source"] = "wikipedia_remote"
            updated += 1

    still = sum(
        1 for drivers in by_year.values() for e in drivers.values() if e.get("source") == "placeholder"
    )
    data["meta"]["wiki_fill_updated"] = updated
    REGISTRY_PATH.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Updated {updated} rows; {still} still placeholder")


if __name__ == "__main__":
    main()
