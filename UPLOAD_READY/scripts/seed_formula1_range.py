from __future__ import annotations

import argparse
import os
import subprocess
from pathlib import Path


PROJECT_DIR = Path(__file__).resolve().parent.parent
TEMPLATE = PROJECT_DIR / "scripts" / "seed_formula1_from_f1dump.sql"


def run_mysql_in_container(sql_text: str) -> None:
    root_pw = os.getenv("MYSQL_ROOT_PASSWORD", "change_me_root")
    cmd = [
        "docker",
        "exec",
        "-i",
        "f1-mysql",
        "mysql",
        "-u",
        "root",
        f"-p{root_pw}",
    ]
    subprocess.run(cmd, input=sql_text.encode("utf-8"), check=True)


def main() -> None:
    p = argparse.ArgumentParser(description="Seed formula_1 from f1_dump for a year range.")
    p.add_argument("--from-year", type=int, default=2015)
    p.add_argument("--to-year", type=int, default=2025)
    args = p.parse_args()

    if not TEMPLATE.exists():
        raise SystemExit(f"Missing template SQL: {TEMPLATE}")

    template = TEMPLATE.read_text(encoding="utf-8")

    for year in range(int(args.from_year), int(args.to_year) + 1):
        sql = template.replace("__YEAR__", str(year))
        print(f"Seeding year {year}…")
        run_mysql_in_container(sql)

    print("Done.")


if __name__ == "__main__":
    main()

