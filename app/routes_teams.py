from __future__ import annotations

from fastapi import APIRouter, HTTPException, Path, Query

from app.db import query_all, query_one


router = APIRouter(prefix="/api", tags=["teams"])


@router.get("/teams")
def list_teams(
    year: int = Query(..., ge=1950, le=2100),
) -> list[dict]:
    rows = query_all(
        """
        SELECT
          t.team_id,
          t.team_name,
          t.full_name,
          t.base_country,
          t.engine_supplier,
          ts.season_position AS position,
          ts.season_points AS points
        FROM teams t
        JOIN team_drivers td ON td.team_id = t.team_id AND td.season_year = %s
        LEFT JOIN team_standings ts
          ON ts.team_id = t.team_id AND ts.season_year = %s
        GROUP BY
          t.team_id, t.team_name, t.full_name, t.base_country,
          t.engine_supplier, ts.season_position, ts.season_points
        ORDER BY COALESCE(ts.season_position, 999), t.team_name;
        """,
        (year, year),
    )
    if rows:
        return rows

    return query_all(
        """
        SELECT DISTINCT
          t.team_id,
          t.team_name,
          t.full_name,
          t.base_country,
          t.engine_supplier,
          NULL AS position,
          NULL AS points
        FROM teams t
        JOIN team_drivers td ON td.team_id = t.team_id
        WHERE td.season_year = %s
        ORDER BY t.team_name;
        """,
        (year,),
    )


@router.get("/teams/{team_id}")
def get_team(
    team_id: int = Path(..., ge=1),
    year: int = Query(..., ge=1950, le=2100),
) -> dict:
    row = query_one(
        """
        SELECT
          t.team_id,
          t.team_name,
          t.full_name,
          t.founding_year,
          t.base_country,
          t.base_city,
          t.team_chief,
          t.engine_supplier,
          ts.season_position AS position,
          ts.season_points AS points
        FROM teams t
        LEFT JOIN team_standings ts
          ON ts.team_id = t.team_id AND ts.season_year = %s
        WHERE t.team_id = %s;
        """,
        (year, team_id),
    )
    if row is None:
        raise HTTPException(status_code=404, detail=f"Team {team_id} not found")
    drivers = query_all(
        """
        SELECT
          d.driver_id,
          d.first_name,
          d.last_name,
          d.driver_code,
          d.car_no,
          td.role,
          td.seat_no
        FROM team_drivers td
        JOIN drivers d ON d.driver_id = td.driver_id
        WHERE td.season_year = %s AND td.team_id = %s
        ORDER BY td.role, td.seat_no;
        """,
        (year, team_id),
    )
    return {**row, "drivers": drivers}
