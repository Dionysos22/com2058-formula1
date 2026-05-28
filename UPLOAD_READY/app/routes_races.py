from __future__ import annotations

from fastapi import APIRouter, HTTPException, Path, Query

from app.db import query_all, query_one


router = APIRouter(prefix="/api", tags=["races"])

_RACE_SELECT = """
    SELECT
      r.season_year,
      r.round_number,
      r.grand_prix_name,
      r.race_start_date,
      r.race_end_date,
      r.circuit_id,
      c.circuit_name,
      c.country,
      c.city,
      c.laps,
      c.length_m,
      c.first_gp_year,
      CONCAT(d.first_name, ' ', d.last_name) AS winner
    FROM races r
    JOIN circuits c ON c.circuit_id = r.circuit_id
    LEFT JOIN race_results rr
      ON rr.season_year = r.season_year
     AND rr.round_number = r.round_number
     AND rr.finish_position = 1
    LEFT JOIN drivers d ON d.driver_id = rr.driver_id
"""


@router.get("/races")
def get_races(
    year: int | None = Query(default=None, ge=1950, le=2100),
    circuit_id: int | None = Query(default=None, ge=1),
) -> list[dict]:
    """
    Races with circuit and winner.
    Requirements §2.1 (by year) and §2.5 (by circuit_id).
    """
    where = []
    params: list = []

    if year is not None:
        where.append("r.season_year = %s")
        params.append(year)

    if circuit_id is not None:
        where.append("r.circuit_id = %s")
        params.append(circuit_id)

    order = (
        "r.race_start_date ASC, r.round_number ASC"
        if year is not None and circuit_id is None
        else "r.season_year DESC, r.round_number ASC"
    )

    query = f"""
    {_RACE_SELECT}
    {"WHERE " + " AND ".join(where) if where else ""}
    ORDER BY {order};
    """

    return query_all(query, tuple(params))


@router.get("/races/{year}/{round_number}")
def get_race(
    year: int = Path(..., ge=1950, le=2100),
    round_number: int = Path(..., ge=1),
) -> dict:
    row = query_one(
        f"""
        {_RACE_SELECT}
        WHERE r.season_year = %s AND r.round_number = %s;
        """,
        (year, round_number),
    )
    if row is None:
        raise HTTPException(status_code=404, detail="Race not found")
    return row


@router.get("/races/{year}/{round_number}/results")
def get_race_results(
    year: int = Path(..., ge=1950, le=2100),
    round_number: int = Path(..., ge=1),
) -> list[dict]:
    exists = query_one(
        "SELECT 1 FROM races WHERE season_year = %s AND round_number = %s;",
        (year, round_number),
    )
    if exists is None:
        raise HTTPException(status_code=404, detail="Race not found")

    return query_all(
        """
        SELECT
          rr.finish_position,
          rr.grid_position,
          rr.points,
          d.driver_id,
          d.car_no,
          d.driver_code,
          d.first_name,
          d.last_name,
          CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
          t.team_name
        FROM race_results rr
        JOIN drivers d ON d.driver_id = rr.driver_id
        LEFT JOIN team_drivers td
          ON td.season_year = rr.season_year
         AND td.driver_id = rr.driver_id
         AND td.role = 'MAIN'
        LEFT JOIN teams t ON t.team_id = td.team_id
        WHERE rr.season_year = %s AND rr.round_number = %s
        ORDER BY
          CASE WHEN rr.finish_position IS NULL THEN 1 ELSE 0 END,
          rr.finish_position,
          d.last_name;
        """,
        (year, round_number),
    )
