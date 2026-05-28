#!/usr/bin/env python3
"""
Asset audit for the static site.

Checks:
  - Every local src/href/url(...) reference points to an existing file in public/
  - Optionally (when server is running): HTTP fetch for a sample set

Usage:
  python scripts/asset_audit.py public
  python scripts/asset_audit.py UPLOAD_READY/public
"""

from __future__ import annotations

import re
import sys
import urllib.error
import urllib.request
from dataclasses import dataclass
from pathlib import Path


ASSET_EXTS = {
    ".png",
    ".jpg",
    ".jpeg",
    ".webp",
    ".gif",
    ".avif",
    ".svg",
    ".css",
    ".js",
    ".ico",
    ".json",
    ".woff",
    ".woff2",
    ".ttf",
    ".otf",
    ".mp3",
    ".mp4",
}


@dataclass(frozen=True)
class Ref:
    file: Path
    target: str
    kind: str


def is_remote(url: str) -> bool:
    u = url.strip().lower()
    return u.startswith(("http://", "https://", "data:", "//"))


def normalize_target(raw: str) -> str | None:
    s = raw.strip().strip('"').strip("'")
    if not s or is_remote(s):
        return None
    if s.startswith(("mailto:", "tel:", "#")):
        return None
    # ignore query/hash
    s = s.split("#", 1)[0].split("?", 1)[0]
    if not s:
        return None
    # For absolute paths, treat as from public root
    if s.startswith("/"):
        s = s[1:]
    return s


def extract_refs(text: str, file: Path) -> list[Ref]:
    refs: list[Ref] = []

    # HTML attributes: src=, href=, poster=
    for m in re.finditer(r"""(?i)\b(src|href|poster)\s*=\s*(['"])(.*?)\2""", text):
        t = normalize_target(m.group(3))
        if t:
            refs.append(Ref(file=file, target=t, kind=m.group(1).lower()))

    # CSS url(...)
    for m in re.finditer(r"""(?i)\burl\(\s*(['"]?)(.*?)\1\s*\)""", text):
        t = normalize_target(m.group(2))
        if t:
            refs.append(Ref(file=file, target=t, kind="css_url"))

    # JS/HTML strings that look like assets (best-effort)
    for m in re.finditer(r"""(['"])([^'"]+\.(?:png|jpe?g|webp|gif|avif|svg|css|js|json|woff2?|ttf|otf))\1""", text, re.I):
        t = normalize_target(m.group(2))
        if t:
            refs.append(Ref(file=file, target=t, kind="string"))

    return refs


def file_exists(public_dir: Path, ref: Ref) -> bool:
    # Allow references like "foo bar.avif" (spaces are real filenames)
    target = ref.target
    p = (public_dir / target).resolve()
    try:
        p.relative_to(public_dir.resolve())
    except ValueError:
        return False
    return p.is_file()


def should_check_target(t: str) -> bool:
    ext = Path(t).suffix.lower()
    return ext in ASSET_EXTS


def http_fetch(base: str, path: str) -> tuple[int, int]:
    url = base.rstrip("/") + "/" + path.lstrip("/")
    # Spaces and other characters must be URL-encoded for HTTP checks.
    url = urllib.parse.quote(url, safe=":/?&=#%+-._~")
    req = urllib.request.Request(url, headers={"Accept": "*/*"})
    with urllib.request.urlopen(req, timeout=10) as resp:
        data = resp.read()
        return resp.status, len(data)


def main() -> int:
    if len(sys.argv) < 2:
        print("Usage: python scripts/asset_audit.py <public_dir>")
        return 2
    public_dir = Path(sys.argv[1]).resolve()
    if not public_dir.is_dir():
        print(f"Not a directory: {public_dir}")
        return 2

    candidates = []
    for ext in (".html", ".css", ".js"):
        candidates.extend(public_dir.rglob(f"*{ext}"))

    refs: list[Ref] = []
    for f in candidates:
        try:
            text = f.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        refs.extend(extract_refs(text, f))

    missing: list[Ref] = []
    for r in refs:
        if not should_check_target(r.target):
            continue
        if not file_exists(public_dir, r):
            missing.append(r)

    # Optional HTTP check for a sample set
    base = "http://127.0.0.1:8000"
    sample = []
    for r in refs:
        if should_check_target(r.target) and not is_remote(r.target):
            sample.append(r.target)
    sample = sorted(set(sample))[:60]

    http_fail = []
    for t in sample:
        try:
            code, size = http_fetch(base, t)
            if code != 200 or size <= 0:
                http_fail.append((t, code, size))
        except (urllib.error.URLError, TimeoutError) as e:
            http_fail.append((t, "ERR", str(e)))
            break

    if missing:
        print(f"Missing local assets: {len(missing)}")
        for r in missing[:60]:
            rel = str(r.file.relative_to(public_dir))
            print(f" - {rel}: {r.kind} -> {r.target}")
        if len(missing) > 60:
            print(f" ... and {len(missing) - 60} more")
    else:
        print("OK: no missing local asset references found.")

    if http_fail:
        print(f"HTTP sample failures: {len(http_fail)}")
        for row in http_fail[:25]:
            print(" -", row)
    else:
        print("OK: HTTP sample fetch succeeded.")

    return 1 if missing else 0


if __name__ == "__main__":
    raise SystemExit(main())

