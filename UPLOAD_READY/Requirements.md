# COM2058 – Project Phase 1
## Formula 1 Database – Data Requirements

**Group:** Sarp Mataş
**Date:** 26.04.2026
**Application domain:** Formula 1 World Championship statistics system.

> This document is written in the same narrative style as the **COMPANY** database
> example in *Elmasri & Navathe – Fundamentals of Database Systems (6e), Chapter 7*,
> which was presented in class. It describes the mini-world of the Formula 1
> information system that will be implemented in the following phases.

---

## 1. Mini-world description

The database keeps track of the Formula 1 World Championship across multiple
seasons, teams (constructors), drivers, circuits and races, as well as the
results of every race weekend. The main data requirements are the following:

1. The championship is organised into **seasons**. Each season is uniquely
   identified by its **year**. A season must take place in 1950 or later
   (the first Formula 1 championship). A season consists of many races and
   produces one constructors' standings table.

2. A **team** (constructor) participates in the championship. For every team
   we store a **team id** (unique, surrogate), a **short name** (unique,
   e.g. *Ferrari*), a long **full name** (e.g. *Scuderia Ferrari HP*), the
   **founding year**, the **base country** and **base city** of its
   headquarters, the name of the current **team chief**, and the current
   **engine supplier**.

3. A **driver** competes in the championship. For every driver we store a
   **driver id** (unique), the **car number** the driver races with (unique
   when assigned), a three–letter **driver code** (unique, e.g. *HAM*, *VER*),
   **first name**, **last name**, **nationality**, **date of birth**, and the
   driver's **career statistics**: number of pole positions, number of podium
   finishes, and number of championships won. These three career counters are
   treated as **derived attributes** — they can be recomputed from race
   results and constructors' standings, but are stored to speed up the web
   pages that show driver cards.

4. A **circuit** (track) hosts Grand Prix events. For every circuit we store a
   **circuit id** (unique), a **circuit name** (unique, e.g.
   *Circuit de Monaco*), the **country** and **city** it is located in, the
   **number of laps** of a normal race distance, the **track length** in
   metres, the **year of its first Grand Prix**, and the current **all–time
   fastest lap time** recorded on the track.

5. A **race** is a Grand Prix event that takes place inside a season at a
   given circuit. A race is identified by the combination of its **season
   year** and its **round number** inside that season — therefore a race
   cannot exist without its season and is modelled as a **weak entity**
   identified by SEASON through the *HAS_RACE* relationship. For every race
   we also store the **Grand Prix name** (unique within a season,
   e.g. *Monaco Grand Prix*), the **start date** and **end date** of the
   race weekend. A race is hosted by **exactly one** circuit, and a circuit
   may host **many** races over the years (*HOSTS* relationship).

6. In every season, drivers are **contracted** by teams. Each assignment is
   described by three entities together: a season, a team and a driver
   (a ternary relationship *CONTRACTS*). For every such contract we store the
   **role** of the driver — either *MAIN* (racing driver) or *RESERVE* — and,
   for main drivers only, a **seat number** (1 or 2). The business rule is
   therefore:
   - if `role = MAIN`  → `seat_no ∈ {1, 2}` (NOT NULL)
   - if `role = RESERVE` → `seat_no IS NULL`

7. At the end of every season a **constructors' standing** is produced for
   every team that participated in that season. The standing is a binary
   relationship between SEASON and TEAM (*STANDINGS*) with attributes
   **final position** and **total points** earned in that season.

8. For every race, the **race result** of every driver that took part is
   recorded. This is a binary relationship between RACE and DRIVER (*RESULTS*)
   whose attributes are the driver's **grid position** at the start of the
   race, the **finishing position**, and the number of championship **points**
   awarded for that race.

---

## 2. Functional requirements (queries that must be supported)

The relational schema must make the following example queries efficient:

1. List every race of a given season, in chronological order, together with
   the circuit name and the Grand Prix name.
2. For a given season, return the constructors' standings (team → position,
   points), ordered by position.
3. For a given driver, list every race they participated in, their starting
   grid position, finishing position and points earned.
4. For a given team in a given season, list all the drivers contracted to
   that team with their role and seat number.
5. For a given circuit, list all Grand Prix events it has hosted across all
   seasons.
6. For a given driver, return the career totals (championships, podiums,
   poles) — which are maintained as derived attributes.

---

## 3. Summary of entity types, relationships and constraints

### 3.1 Entity types
| Entity    | Kind   | Key attribute(s)                  |
|-----------|--------|-----------------------------------|
| SEASON    | strong | `season_year`                     |
| TEAM      | strong | `team_id` (PK), `team_name` (UK)  |
| DRIVER    | strong | `driver_id` (PK), `car_no` (UK), `driver_code` (UK) |
| CIRCUIT   | strong | `circuit_id` (PK), `circuit_name` (UK) |
| RACE      | **weak** (identified by SEASON) | partial key: `round_number` (combined with `season_year`) |

### 3.2 Relationship types

| Relationship | Degree | Participating entities | Cardinality | Relationship attributes |
|--------------|--------|------------------------|-------------|-------------------------|
| HAS_RACE     | binary, **identifying** | SEASON — RACE        | 1 : N (RACE total participation) | — |
| HOSTS        | binary | CIRCUIT — RACE                  | 1 : N (RACE total)  | — |
| CONTRACTS    | **ternary** | SEASON — TEAM — DRIVER      | M : N : P           | `role`, `seat_no` |
| STANDINGS    | binary | SEASON — TEAM                   | M : N               | `season_position`, `season_points` |
| RESULTS      | binary | RACE — DRIVER                   | M : N               | `grid_position`, `finish_position`, `points` |

### 3.3 Key integrity rules
- `season_year ≥ 1950`
- `team_name` unique; `driver_code` unique; `car_no` unique (when set);
  `circuit_name` unique.
- Race: `(season_year, round_number)` is the composite primary key;
  `round_number > 0`; `race_start_date ≤ race_end_date`;
  Grand Prix name unique within a season.
- Results: `grid_position > 0`, `finish_position > 0`, `points ≥ 0`.
- Standings: `season_points ≥ 0`.
- Driver career counters: `num_poles ≥ 0`, `num_podiums ≥ 0`,
  `num_championships ≥ 0`.

### 3.4 Derived / computed attributes
- `DRIVER.num_poles`, `num_podiums`, `num_championships` are derived from
  `RESULTS` and `STANDINGS`. They are still stored in the table and kept in
  sync by the application layer.

---

## 4. Deliverables for the following phases

- **Phase 2 – ER Diagram (Chen notation):** `ERD.drawio` / `ERD.pdf`
  (see file committed alongside this document).
- **Phase 3 – Implementation:** MySQL 8 schema (`Formula_1.sql`) + FastAPI
  backend (raw SQL only, no ORM) + SPA frontend served by FastAPI.
- **Phase 4 – Report (10–15 pages):** covers requirements, ER model,
  relational mapping, normalization (up to 3NF / BCNF), schema, selected
  queries and screenshots.
