# COM2058 Project – Submission Guide

> **Deadline (Phase 1 + 2): 26.04.2026** on `ekampus.ankara.edu.tr`.

## What the professor asks (from `COM2058_Project (1).pdf`)

| Phase | Weight | What                          | Due        |
|-------|--------|-------------------------------|------------|
| 1     | 10%    | Data Requirements             | 26.04.2026 |
| 2     | 20%    | ER Diagram                    | 26.04.2026 |
| 3     | 60%    | Implementation + Presentation | 24.05.2026 |
| 4     | 10%    | Report (10–15 pages)          | 24.05.2026 |

## What to upload on 26.04.2026

Put these two files in a ZIP named `F1_Phase1_Phase2_<group>.zip`:

1. **`Requirements.docx`** – Phase 1 (English) **or** `Requirements_TR.docx` (Turkish)
   - Already generated in `Project/`.
   - Edit the `Group: TODO …` line at the top with your names/IDs.
   - If the professor wants PDF: open in Word → *File → Save as PDF*.
2. **`ERD.pdf`** – Phase 2
   - Already exported: `Project/ERD.pdf`.
   - If you re-edit the diagram, re-export from draw.io (see below).

## How to re-generate the artefacts

### Requirements.docx (programmatic, repeatable)
English:
```bash
cd Project
source .venv/bin/activate
python scripts/make_requirements_docx.py
```

Turkish:
```bash
cd Project
source .venv/bin/activate
python scripts/make_requirements_tr_docx.py
```

### ERD → PDF
The file `Project/ERD.drawio` is in **valid draw.io format** (Chen notation:
rectangles = entities, double rectangle = weak entity **RACE**, diamonds =
relationships, ellipses = attributes, underlined = primary keys, cardinalities
on every edge).

**Option A – web (no install)**
1. Go to <https://app.diagrams.net>.
2. *Open Existing Diagram* → pick `Project/ERD.drawio`.
3. Tidy the layout if desired (drag boxes).
4. `File → Export as → PDF…` → *Selection: Current Page* → **Export**.
5. Save as `ERD.pdf`.

**Option B – VSCode**
1. Install the **Draw.io Integration** extension (`hediet.vscode-drawio`).
2. Click `ERD.drawio` in the Explorer – it opens in-place.
3. Use the export button → *Export as PDF*.

**Option C – Desktop app**
- Install **drawio-desktop** from <https://www.drawio.com/>.
- Open the file, export to PDF.

## Files in this repo

### Phase 1 + 2 deliverables
- `Project/Requirements.md`       – Phase 1 source of truth (English)
- `Project/Requirements.docx`     – Phase 1 Word version, English (40 KB)
- `Project/Requirements_TR.docx`  – Phase 1 Word version, Turkish (40 KB)
- `Project/ERD.drawio`            – Phase 2 diagram (Chen, valid XML)
- `Project/ERD.pdf`               – Phase 2 PDF export (ready to upload)
- `Project/ERD.drawio.png`        – Phase 2 PNG preview (optional)

### Phase 3 (implementation)
- `Project/Formula_1.sql`       – MySQL 8 schema
- `Project/app/`                – FastAPI backend (raw SQL)
- `Project/db/init/`            – schema (`01_…`) + seed (`02_…`, 2020–2026)
- `Project/docker-compose.yml`  – MySQL 8 container
- `Project/README.md`           – how to run the app
- `Project/SAMPLE_QUERIES.sql`  – 12 report queries (Requirements §2 + extras)

### Aux
- `Project/ERD.md`              – Mermaid backup of the ERD
- `Project/scripts/make_requirements_docx.py`    – regenerates English .docx
- `Project/scripts/make_requirements_tr_docx.py` – regenerates Turkish .docx

## Automated tests (Phase 3 + 4)

```bash
cd Project
docker compose up -d
source .venv/bin/activate
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000   # ayrı terminal
python scripts/smoke_test.py
python scripts/validate_sample_queries.py
```

Her iki script de hatasız bitmeli.

### Phase 4 (report)
- `Project/REPORT.md`              – Phase 4 report source (export to PDF for upload)
- `Project/scripts/smoke_test.py`  – API + static smoke test
- `Project/scripts/validate_sample_queries.py` – runs all SQL in `SAMPLE_QUERIES.sql`

## Pre-submission checklist

- [ ] Decide which language (`Requirements.docx` EN or `Requirements_TR.docx`
      TR) the professor wants — check the course page / ask.
- [ ] Open the chosen .docx and replace `TODO: names & student IDs` / `isim
      ve öğrenci numaraları` at the top with the group members.
- [ ] Verify `ERD.pdf` looks good (open it in Preview / any PDF viewer).
      If you need to re-layout, open `ERD.drawio`, rearrange, export again,
      overwrite `ERD.pdf`.
- [ ] Create `F1_Phase1_Phase2_<group>.zip` containing:
      - the chosen `Requirements*.docx` (or converted to PDF)
      - `ERD.pdf`
- [ ] Upload to ekampus.ankara.edu.tr before 26.04.2026 23:59.

## Post-submission (Phase 3 + 4) – reminder

Due 24.05.2026:
- `docker compose up -d` starts MySQL 8 with the schema in `db/init/`.
- FastAPI backend in `app/` must use **raw SQL only** (course requirement).
- Phase 4 Report (10–15 pages) must cover: requirements, ER model, relational
  mapping (with the mapping algorithm from Elmasri Ch 9), normalization to
  3NF/BCNF, schema, at least 10 sample SQL queries, screenshots of the UI,
  conclusion.
