#!/usr/bin/env python3
"""Build submission ZIP archives and run final checks."""
from __future__ import annotations

import subprocess
import sys
import zipfile
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GROUP_SLUG = "Sarp_Matas"


def run(cmd: list[str]) -> None:
    print("$", " ".join(cmd))
    subprocess.run(cmd, cwd=ROOT, check=True)


def zip_files(name: str, files: list[Path]) -> Path:
    out = ROOT / name
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zf:
        for f in files:
            if not f.exists():
                raise FileNotFoundError(f)
            zf.write(f, arcname=f.name)
            print(f"  + {f.name}")
    print(f"Created {out} ({out.stat().st_size // 1024} KB)")
    return out


def main() -> int:
    print("=== Regenerating deliverables ===")
    run([sys.executable, "scripts/make_requirements_docx.py"])
    run([sys.executable, "scripts/make_requirements_tr_docx.py"])
    run([sys.executable, "scripts/make_report_docx.py"])

    print("\n=== Running tests ===")
    run([sys.executable, "scripts/smoke_test.py"])
    run([sys.executable, "scripts/validate_sample_queries.py"])

    print("\n=== Building ZIPs ===")
    phase12 = zip_files(
        f"F1_Phase1_Phase2_{GROUP_SLUG}.zip",
        [ROOT / "Requirements.docx", ROOT / "ERD.pdf"],
    )
    phase34 = zip_files(
        f"F1_Phase3_Phase4_{GROUP_SLUG}.zip",
        [
            ROOT / "REPORT.docx",
            ROOT / "ERD.pdf",
            ROOT / "Formula_1.sql",
            ROOT / "SAMPLE_QUERIES.sql",
            ROOT / "README.md",
        ],
    )

    print("\n=== Done ===")
    print(f"Phase 1+2: {phase12}")
    print(f"Phase 3+4: {phase34}")
    print(f"Date: {date.today().isoformat()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
