# COM2058 – Formula 1 Database Project
## Phase 4 Report

**Group:** Sarp Mataş  
**Course:** COM2058 – Database Systems  
**Date:** 24.05.2026  
**Application:** Formula 1 World Championship statistics system

---

## 1. Introduction

This report documents the design and implementation of a relational database and web application for Formula 1 championship statistics. The project follows the COM2058 phased deliverables: data requirements (Phase 1), Chen ER diagram (Phase 2), MySQL + FastAPI implementation (Phase 3), and this report (Phase 4).

The system stores seasons, teams, drivers, circuits, races, race results, team–driver contracts, and constructors' standings. A FastAPI backend exposes the data through **raw SQL only** (no ORM), and a static F1-themed frontend (based on [Mdevyl/Formula-1](https://github.com/Mdevyl/Formula-1)) is served alongside an SQL dashboard.

---

## 2. Data requirements summary

The mini-world covers eight core business rules (see `Requirements.md`):

1. **Seasons** identified by `season_year ≥ 1950`.
2. **Teams** with unique short names and optional metadata (base, chief, engine).
3. **Drivers** with unique codes and car numbers; career counters (`num_poles`, `num_podiums`, `num_championships`) are derived but stored.
4. **Circuits** with track metadata and fastest lap.
5. **Races** as a **weak entity** of season (`season_year`, `round_number` composite key).
6. **CONTRACTS** ternary relationship (season–team–driver) with `role` and `seat_no` constraints.
7. **STANDINGS** between season and team with position and points.
8. **RESULTS** between race and driver with grid, finish, and points.

Six functional queries from Requirements §2 are implemented in the API and duplicated in `SAMPLE_QUERIES.sql` (queries 1–6). Twelve sample queries in total are provided for demonstration.

---

## 3. ER model (Chen notation)

The ER diagram is in `ERD.drawio` / `ERD.pdf`. Entity summary:

| Entity | Type | Key |
|--------|------|-----|
| SEASON | strong | `season_year` |
| TEAM | strong | `team_id` |
| DRIVER | strong | `driver_id` |
| CIRCUIT | strong | `circuit_id` |
| RACE | **weak** (identified by SEASON) | `season_year` + `round_number` |

Relationships:

| Relationship | Entities | Cardinality | Attributes |
|--------------|----------|-------------|------------|
| HAS_RACE | SEASON – RACE | 1 : N | — |
| HOSTS | CIRCUIT – RACE | 1 : N | — |
| CONTRACTS | SEASON – TEAM – DRIVER | M : N : P | `role`, `seat_no` |
| STANDINGS | SEASON – TEAM | M : N | `season_position`, `season_points` |
| RESULTS | RACE – DRIVER | M : N | `grid_position`, `finish_position`, `points` |

A Mermaid backup of the diagram is in `ERD.md`.

---

## 4. Relational mapping (Elmasri Ch. 9)

### 4.1 Strong entities
Each strong entity maps to one table with its primary key:
- `SEASON` → `seasons(season_year)`
- `TEAM` → `teams(team_id, …)`
- `DRIVER` → `drivers(driver_id, …)`
- `CIRCUIT` → `circuits(circuit_id, …)`

### 4.2 Weak entity RACE
`RACE` is identified by `SEASON` via **HAS_RACE** (identifying relationship):
- Primary key: `(season_year, round_number)`
- Foreign keys: `season_year → seasons`, `circuit_id → circuits`

### 4.3 Binary relationships
- **HOSTS**: foreign key `circuit_id` in `races`.
- **STANDINGS**: relation table `team_standings(season_year, team_id, season_position, season_points)`.
- **RESULTS**: relation table `race_results(season_year, round_number, driver_id, grid_position, finish_position, points)` with composite FK to `races`.

### 4.4 Ternary CONTRACTS
Mapped to `team_drivers(season_year, team_id, driver_id, role, seat_no)` with composite primary key and CHECK constraints enforcing MAIN/RESERVE seat rules.

---

## 5. Normalization

### 5.1 First normal form (1NF)
All attributes are atomic. Repeating groups (e.g. multiple drivers per team) are stored in `team_drivers` and `race_results`, not as multi-valued columns.

### 5.2 Second normal form (2NF)
Composite keys appear only where necessary (`races`, `race_results`, `team_drivers`, `team_standings`). Non-key attributes depend on the full key (e.g. `grand_prix_name` depends on `(season_year, round_number)`).

### 5.3 Third normal form (3NF)
No transitive dependencies on non-key attributes within entity tables. Team metadata (`team_chief`, `engine_supplier`) depends on `team_id`, not on another non-key attribute.

### 5.4 BCNF
All determinants are candidate keys. Unique constraints on `team_name`, `driver_code`, and `circuit_name` prevent redundancy. Derived driver career counters are intentionally denormalized for read performance but are recomputable from `race_results`.

---

## 6. Physical schema

The canonical DDL is `Formula_1.sql`. Docker init scripts:

- `db/init/01_formula_1.sql` — schema
- `db/init/02_seed_data.sql` — sample data (2015–2025)

Current seed statistics (verified 24.05.2026):

| Table | Rows (approx.) |
|-------|----------------|
| seasons | 11 |
| circuits | 32 |
| races | 233 |
| drivers | 50+ |
| teams | 10+ |

Indexes support common filters: `ix_races_circuit`, `ix_rr_driver`, `ix_td_team_season`, etc.

---

## 7. Sample SQL queries

Twelve queries in `SAMPLE_QUERIES.sql` cover Requirements §2 and additional reports:

| # | Purpose |
|---|---------|
| 1 | Races of a season with circuit |
| 2 | Constructors' standings (computed) |
| 3 | Driver race history |
| 4 | Team roster in a season |
| 5 | Races hosted by a circuit |
| 6 | Driver career totals |
| 7 | Driver standings (computed) |
| 8 | Podium finishers for a GP |
| 9 | Circuits by country |
| 10 | Stored team standings |
| 11 | Winners at a circuit |
| 12 | Main drivers per team |

Validate with:

```bash
cd Project
docker compose up -d
source .venv/bin/activate
python scripts/validate_sample_queries.py
```

---

## 8. Application architecture

```
Browser
   │
   ├─ Static F1 UI (HTML/CSS/JS) ──► FastAPI StaticFiles (public/)
   │
   └─ /dashboard.html ──► fetch /api/* ──► FastAPI routes ──► pymysql raw SQL ──► MySQL 8
```

### 8.1 API endpoints (raw SQL)

| Endpoint | Requirement |
|----------|-------------|
| `GET /api/races?year=` | §2.1 |
| `GET /api/races?circuit_id=` | §2.5 |
| `GET /api/standings/constructors?year=` | §2.2 |
| `GET /api/standings/drivers?year=` | Driver standings |
| `GET /api/seasons/{year}/teams/{id}/drivers` | §2.4 |
| `GET /api/drivers/{id}/results` | §2.3 |
| `GET /api/drivers/{id}/career` | §2.6 |
| `GET /api/circuits` | Circuit list |

No ORM is used; all queries are plain SQL strings in `app/routes_*.py`.

### 8.2 Frontend

- **Public site:** Schedule, Results, Drivers, Teams pages with 2026 calendar and `f1data.js` results.
- **SQL dashboard:** `dashboard.html` — tabular API explorer for course demo.

### 8.3 Screenshots

Screenshots captured from the running application (http://localhost:8000):

1. Home page (`index.html`)
2. Schedule with circuit maps (`schedule.html`)
3. Results dashboard (`result.html`)
4. SQL API dashboard (`dashboard.html`)
5. Swagger API docs (`/docs`)

Export `REPORT.docx` to PDF before ekampus upload if the professor requires PDF.

---

## 9. Testing

Automated smoke test:

```bash
python scripts/smoke_test.py
```

Checks deliverables, HTML asset paths, API endpoints, and static files. As of 24.05.2026 all checks pass with Docker MySQL running.

---

## 10. Conclusion

The project delivers a normalized MySQL schema for Formula 1 statistics, a Chen ER diagram, twelve sample SQL queries, and a FastAPI backend using raw SQL only. The web UI presents championship data to end users while the SQL dashboard demonstrates database-backed queries required by the course.

Future work: connect `result.html` to live `/api/*` data instead of static `f1data.js`.

---

## References

- Elmasri & Navathe, *Fundamentals of Database Systems*, 6th ed., Ch. 7–9.
- COM2058 project specification (`COM2058_Project (1).pdf`).
- Project repository: `Formula_1.sql`, `Requirements.md`, `ERD.pdf`, `SAMPLE_QUERIES.sql`.
