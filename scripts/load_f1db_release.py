from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import zipfile


def sh(cmd: list[str]) -> None:
    subprocess.run(cmd, check=True)


def main() -> None:
    parser = argparse.ArgumentParser(description="Download f1db MySQL dump and import into local MySQL docker.")
    parser.add_argument("--tag", default="v2026.0.0", help="GitHub release tag (default: v2026.0.0)")
    parser.add_argument("--db", default="f1_db_2026", help="Target database name")
    parser.add_argument("--container", default="f1-mysql", help="MySQL container name")
    args = parser.parse_args()

    url = f"https://github.com/f1db/f1db/releases/download/{args.tag}/f1db-sql-mysql.zip"

    workdir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".tmp_f1db"))
    os.makedirs(workdir, exist_ok=True)
    zip_path = os.path.join(workdir, "f1db-sql-mysql.zip")

    # Download
    sh(["curl", "-L", "-o", zip_path, url])

    # Extract
    extract_dir = os.path.join(workdir, "extract")
    if os.path.exists(extract_dir):
        shutil.rmtree(extract_dir)
    os.makedirs(extract_dir, exist_ok=True)
    with zipfile.ZipFile(zip_path) as z:
        z.extractall(extract_dir)

    # Find SQL file
    sql_file = None
    for root, _, files in os.walk(extract_dir):
        for f in files:
            if f.lower().endswith(".sql"):
                sql_file = os.path.join(root, f)
                break
        if sql_file:
            break

    if not sql_file:
        raise SystemExit(f"No .sql file found inside {zip_path}")

    # Create DB + import (uses root password from compose default if .env not set)
    root_pw = os.getenv("MYSQL_ROOT_PASSWORD", "root_password_change_me")

    sh(
        [
            "docker",
            "exec",
            "-i",
            args.container,
            "mysql",
            "-u",
            "root",
            f"-p{root_pw}",
            "-e",
            f"DROP DATABASE IF EXISTS {args.db}; CREATE DATABASE {args.db} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;",
        ]
    )

    # Import
    # We avoid copying into container: stream the sql into mysql.
    with open(sql_file, "rb") as f:
        subprocess.run(
            ["docker", "exec", "-i", args.container, "mysql", "-u", "root", f"-p{root_pw}", args.db],
            check=True,
            stdin=f,
        )

    print(f"Imported {sql_file} into database {args.db}.")


if __name__ == "__main__":
    main()

