#!/usr/bin/env python3
"""Sync f1-photo-registry.json with files already in public/photos/."""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PUBLIC = ROOT / "public"
REGISTRY = PUBLIC / "f1-photo-registry.json"


def main() -> None:
    data = json.loads(REGISTRY.read_text(encoding="utf-8"))
    fixed = 0
    for ykey, drivers in data.get("by_year", {}).items():
        for did, ent in drivers.items():
            rel = f"photos/{ykey}/{did}.jpg"
            if (PUBLIC / rel).is_file():
                if ent.get("photo") != rel or ent.get("source") == "placeholder":
                    ent["photo"] = rel
                    ent["source"] = "local"
                    fixed += 1
    REGISTRY.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Synced {fixed} entries to local photos")


if __name__ == "__main__":
    main()
