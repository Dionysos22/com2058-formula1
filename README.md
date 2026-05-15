# Formula 1 stats app (MySQL + FastAPI, raw SQL)

Course project **COM2058** — MySQL 8 schema (`Formula_1.sql`) + FastAPI backend using **raw SQL only** (no ORM) + vanilla SPA frontend.

## Prerequisites

- Docker Desktop (or Docker Engine) with `docker compose`
- Python 3.10+

## Quick start

### 1. Environment

```bash
cp .env.example .env
```

Edit `.env` if needed. Defaults match `docker-compose.yml`.

### 2. Start MySQL

From the `Project/` directory:

```bash
docker compose up -d
```

On **first** start, Docker runs:

- `db/init/01_formula_1.sql` — schema
- `db/init/02_seed_data.sql` — sample data (2020–2026)

To reset and re-import:

```bash
docker compose down -v
docker compose up -d
```

Verify:

```bash
docker exec f1-mysql mysql -u f1_app -pf1_app_password_change_me \
  -e "SELECT COUNT(*) AS races FROM formula_1.races;"
```

### 3. Run the API

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Open **http://localhost:8000/** for the dashboard. API docs: **http://localhost:8000/docs**

## API endpoints (course schema)

| Endpoint | Requirements |
|----------|----------------|
| `GET /api/years` | Season list |
| `GET /api/season-status?year=` | Race/result counts |
| `GET /api/races?year=` | §2.1 — races by season |
| `GET /api/races?circuit_id=` | §2.5 — races at a circuit |
| `GET /api/standings/constructors?year=` | §2.2 — constructors |
| `GET /api/standings/drivers?year=` | Driver standings |
| `GET /api/seasons/{year}/drivers` | Season drivers |
| `GET /api/seasons/{year}/teams/{id}/drivers` | §2.4 — team roster |
| `GET /api/drivers/{id}/results` | §2.3 — driver results |
| `GET /api/drivers/{id}/career` | §2.6 — career totals |
| `GET /api/circuits` | Circuit list |

Example SQL for the report: `SAMPLE_QUERIES.sql`

## Project layout

| Path | Purpose |
|------|---------|
| `Formula_1.sql` | Canonical schema |
| `db/init/` | Docker init (schema + seed) |
| `app/` | FastAPI + raw SQL routes |
| `public/` | SPA (HTML/CSS/JS) |
| `Requirements.md` / `Requirements.docx` | Phase 1 |
| `ERD.drawio` / `ERD.pdf` | Phase 2 |
| `SAMPLE_QUERIES.sql` | Phase 4 sample queries |
| `SUBMISSION.md` | Upload checklist |

## Phase 1 + 2 submission

See `SUBMISSION.md` for the ekampus ZIP checklist (`Requirements*.docx` + `ERD.pdf`).

## Optional demo routes

`/api/demo/*` targets legacy Ergast-style databases (`f1_db`, `f1_db_2026`) if you load them separately. The main UI uses `/api/*` on `formula_1`.
