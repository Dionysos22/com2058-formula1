from __future__ import annotations

from datetime import date

from fastapi import APIRouter, HTTPException, Path, Query

from app.db import query_all, query_one


router = APIRouter(prefix="/api", tags=["drivers"])


@router.get("/seasons/{year}/drivers")
def get_season_drivers(
    year: int = Path(..., ge=1950, le=date.today().year),
) -> list[dict]:
    """Main drivers for a season with their team (CONTRACTS, role = MAIN)."""
    return query_all(
        """
        SELECT
          d.first_name AS forename,
          d.last_name AS surname,
          d.nation AS nationality,
          t.team_name AS constructor
        FROM team_drivers td
        JOIN drivers d ON d.driver_id = td.driver_id
        JOIN teams t ON t.team_id = td.team_id
        WHERE td.season_year = %s
          AND td.role = 'MAIN'
        ORDER BY d.last_name, d.first_name, d.driver_id;
        """,
        (year,),
    )


@router.get("/drivers")
def get_drivers(
    year: int | None = Query(default=None, ge=1950, le=2100),
    nationality: str | None = Query(default=None, min_length=1, max_length=64),
) -> list[dict]:
    where = []
    params: list = []

    if nationality is not None:
        where.append("d.nation = %s")
        params.append(nationality)

    if year is not None:
        where.append("td.season_year = %s")
        params.append(year)

    query = f"""
    SELECT DISTINCT
      d.driver_id,
      d.first_name,
      d.last_name,
      d.driver_code,
      d.car_no,
      d.nation
    FROM drivers d
    LEFT JOIN team_drivers td ON td.driver_id = d.driver_id
    {"WHERE " + " AND ".join(where) if where else ""}
    ORDER BY d.last_name, d.first_name, d.driver_id;
    """

    return query_all(query, tuple(params))


@router.get("/drivers/{driver_id}/results")
def get_driver_results(
    driver_id: int = Path(..., ge=1),
    year: int | None = Query(default=None, ge=1950, le=2100),
) -> list[dict]:
    """Requirements §2.3 — races for a driver with grid, finish and points."""
    where = ["rr.driver_id = %s"]
    params: list = [driver_id]

    if year is not None:
        where.append("r.season_year = %s")
        params.append(year)

    return query_all(
        f"""
        SELECT
          r.season_year,
          r.round_number,
          r.grand_prix_name,
          c.circuit_name,
          rr.grid_position,
          rr.finish_position,
          rr.points
        FROM race_results rr
        JOIN races r
          ON r.season_year = rr.season_year
         AND r.round_number = rr.round_number
        JOIN circuits c ON c.circuit_id = r.circuit_id
        WHERE {" AND ".join(where)}
        ORDER BY r.season_year, r.round_number;
        """,
        tuple(params),
    )


@router.get("/drivers/{driver_id}/career")
def get_driver_career(
    driver_id: int = Path(..., ge=1),
) -> dict:
    """Requirements §2.6 — stored derived career counters on DRIVER."""
    row = query_one(
        """
        SELECT
          driver_id,
          driver_code,
          first_name,
          last_name,
          num_poles,
          num_podiums,
          num_championships
        FROM drivers
        WHERE driver_id = %s;
        """,
        (driver_id,),
    )
    if row is None:
        raise HTTPException(status_code=404, detail=f"Driver {driver_id} not found")
    return row


@router.get("/seasons/{year}/teams/{team_id}/drivers")
def get_team_roster(
    year: int = Path(..., ge=1950, le=date.today().year),
    team_id: int = Path(..., ge=1),
) -> list[dict]:
    """Requirements §2.4 — CONTRACTS: drivers on a team in a season."""
    rows = query_all(
        """
        SELECT
          d.driver_id,
          d.first_name,
          d.last_name,
          d.driver_code,
          td.role,
          td.seat_no
        FROM team_drivers td
        JOIN drivers d ON d.driver_id = td.driver_id
        WHERE td.season_year = %s
          AND td.team_id = %s
        ORDER BY td.role, td.seat_no, d.last_name;
        """,
        (year, team_id),
    )
    if not rows:
        exists = query_one("SELECT 1 FROM teams WHERE team_id = %s;", (team_id,))
        if exists is None:
            raise HTTPException(status_code=404, detail=f"Team {team_id} not found")
    return rows
