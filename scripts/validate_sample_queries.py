#!/usr/bin/env python3
"""Execute SAMPLE_QUERIES.sql statements against the running MySQL container."""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from app.db import query_all

SQL_PATH = ROOT / "SAMPLE_QUERIES.sql"


def split_queries(text: str) -> list[str]:
    chunks = re.split(r";\s*\n", text)
    out: list[str] = []
    for chunk in chunks:
        lines = []
        for line in chunk.splitlines():
            stripped = line.strip()
            if not stripped or stripped.startswith("--"):
                continue
            lines.append(line)
        stmt = "\n".join(lines).strip()
        if stmt:
            out.append(stmt)
    return out


def main() -> int:
    text = SQL_PATH.read_text(encoding="utf-8")
    queries = split_queries(text)
    print(f"Running {len(queries)} statements from SAMPLE_QUERIES.sql\n")
    failed = 0
    for i, sql in enumerate(queries, 1):
        label = sql.split("\n", 1)[0][:72]
        try:
            rows = query_all(sql)
            print(f"OK  #{i:02d}  rows={len(rows):4d}  {label}")
        except Exception as exc:
            failed += 1
            print(f"FAIL #{i:02d}  {label}\n      {exc}")
    print()
    if failed:
        print(f"{failed} query/queries failed.")
        return 1
    print("All sample queries executed successfully.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
