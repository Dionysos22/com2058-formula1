#!/usr/bin/env python3
"""Patch public HTML pages for API-driven content."""
from __future__ import annotations

import re
from pathlib import Path

PUBLIC = Path(__file__).resolve().parents[1] / "public"

SCRIPTS = """
    <script src="f1-api.js"></script>
    <script src="f1-meta.js"></script>
    <script src="f1-pages.js"></script>
"""

YEAR_FILTER = """
      <p class="result-filters" style="padding:0 6% 16px;margin:0">
        <label class="filter-label" for="{id}">Season</label>
        <select id="{id}" class="filter-select"></select>
      </p>
"""


def patch_result():
    path = PUBLIC / "result.html"
    text = path.read_text(encoding="utf-8")
    text = re.sub(r'\s*<option value="20\d\d">.*?</option>\s*', "", text, flags=re.S)
    text = text.replace("<body>", '<body data-page="result">')
    text = re.sub(
        r"<!-- ===== DATA ===== -->.*?<!-- ===== APP LOGIC ===== -->.*?</script>\s*",
        SCRIPTS + "\n",
        text,
        flags=re.S,
    )
    path.write_text(text, encoding="utf-8")
    print("patched result.html")


def patch_schedule():
    path = PUBLIC / "schedule.html"
    text = path.read_text(encoding="utf-8")
    text = text.replace("<body>", '<body data-page="schedule">')
    text = re.sub(
        r'(<section class="schedule-section"[^>]*>\s*)<motion class="schedule-list">.*?</div>\s*</section>',
        r"\1" + YEAR_FILTER.format(id="schedule-year") + '\n        <div class="schedule-list" id="schedule-list"></div>\n      </section>',
        text,
        flags=re.S,
    )
    text = text.replace('<motion class="schedule-list">', '<motion class="schedule-list" id="schedule-list">')
    # fallback if regex failed
    if "id=\"schedule-list\"" not in text:
        text = re.sub(
            r'(<div class="schedule-list">).*?(</motion>\s*</section>)',
            r'\1 id="schedule-list"></div>\n      </section>',
            text,
            count=1,
            flags=re.S,
        )
    if "schedule-year" not in text:
        text = text.replace(
            '<section class="schedule-section"',
            YEAR_FILTER.format(id="schedule-year") + '\n      <section class="schedule-section"',
            1,
        )
    if "f1-api.js" not in text:
        text = text.replace("</body>", SCRIPTS + "\n  </body>")
    path.write_text(text, encoding="utf-8")
    print("patched schedule.html")


def patch_grid_page(name: str, page: str, grid_class: str, grid_id: str, year_id: str):
    path = PUBLIC / name
    text = path.read_text(encoding="utf-8")
    text = text.replace("<body", f'<body data-page="{page}"', 1)
    text = re.sub(
        rf'(<div class="{grid_class}">).*?(</div>\s*</section>)',
        rf'\1 id="{grid_id}"></motion>\n      </section>',
        text,
        count=1,
        flags=re.S,
    )
    text = text.replace(f'id="{grid_id}"></motion>', f'id="{grid_id}"></div>')
    if year_id not in text:
        text = text.replace(
            f'<section class="{grid_class.replace("-grid", "")}-section"',
            YEAR_FILTER.format(id=year_id) + f'\n      <section class="{grid_class.replace("-grid", "")}-section"',
            1,
        )
    if "f1-api.js" not in text:
        text = text.replace("</body>", SCRIPTS + "\n  </body>")
    path.write_text(text, encoding="utf-8")
    print(f"patched {name}")


def main():
    patch_result()
    # schedule manual - use simpler approach
    sched = PUBLIC / "schedule.html"
    t = sched.read_text(encoding="utf-8")
    t = t.replace("<body>", '<body data-page="schedule">')
    start = t.find('<motion class="schedule-list">')
    if start == -1:
        start = t.find('<div class="schedule-list">')
    end = t.find("</section>", t.find("schedule-section"))
    if start != -1 and end != -1:
        inner_start = t.find(">", start) + 1
        replacement = (
            YEAR_FILTER.format(id="schedule-year")
            + '\n        <div class="schedule-list" id="schedule-list"></motion>\n      '
        )
        t = t[:start] + replacement + t[end:]
        t = t.replace('id="schedule-list"></motion>', 'id="schedule-list"></motion>').replace(
            'id="schedule-list"></motion>', 'id="schedule-list"></div>'
        )
    if "f1-api.js" not in t:
        t = t.replace("</body>", SCRIPTS + "\n  </body>")
    sched.write_text(t, encoding="utf-8")
    print("patched schedule.html")

    for fname, page, cls, gid, yid in [
        ("drivers.html", "drivers", "pilots-grid", "pilots-grid", "drivers-year"),
        ("teams.html", "teams", "teams-grid", "teams-grid", "teams-year"),
    ]:
        p = PUBLIC / fname
        txt = p.read_text(encoding="utf-8")
        txt = txt.replace("<body", f'<body data-page="{page}"', 1)
        m = re.search(rf'(<div class="{cls}">)(.*?)(</motion>\s*</section>)', txt, re.S)
        if not m:
            m = re.search(rf'(<motion class="{cls}">)(.*?)(</motion>\s*</section>)', txt, re.S)
        if m:
            txt = txt[: m.start()] + f'<div class="{cls}" id="{gid}"></div>\n      ' + txt[m.end(3) :]
        if yid not in txt:
            txt = txt.replace(
                '<section class="pilots-section"' if "drivers" in fname else '<section class="teams-section"',
                YEAR_FILTER.format(id=yid) + ("\n      <section class=\"pilots-section\"" if "drivers" in fname else "\n      <section class=\"teams-section\""),
                1,
            )
        if "f1-api.js" not in txt:
            txt = txt.replace("</body>", SCRIPTS + "\n  </body>")
        p.write_text(txt, encoding="utf-8")
        print(f"patched {fname}")


if __name__ == "__main__":
    main()
