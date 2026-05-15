from __future__ import annotations

from datetime import date

from fastapi import APIRouter, Query

from app.db import query_all


router = APIRouter(prefix="/api", tags=["standings"])


@router.get("/standings/drivers")
def driver_standings(
    year: int = Query(..., ge=1950, le=date.today().year),
) -> list[dict]:
    return query_all(
        """
        WITH points_by_driver AS (
          SELECT
            rr.driver_id,
            SUM(COALESCE(rr.points, 0)) AS points
          FROM race_results rr
          WHERE rr.season_year = %s
          GROUP BY rr.driver_id
        ),
        wins_by_driver AS (
          SELECT
            rr.driver_id,
            COUNT(*) AS wins
          FROM race_results rr
          WHERE rr.season_year = %s
            AND rr.finish_position = 1
          GROUP BY rr.driver_id
        ),
        constructor_by_driver AS (
          SELECT
            rr.driver_id,
            td.team_id,
            COUNT(*) AS starts
          FROM race_results rr
          LEFT JOIN team_drivers td
            ON td.season_year = rr.season_year
           AND td.driver_id = rr.driver_id
           AND td.role = 'MAIN'
          WHERE rr.season_year = %s
          GROUP BY rr.driver_id, td.team_id
        ),
        best_team AS (
          SELECT cbd.*
          FROM constructor_by_driver cbd
          JOIN (
            SELECT driver_id, MAX(starts) AS max_starts
            FROM constructor_by_driver
            GROUP BY driver_id
          ) m ON m.driver_id = cbd.driver_id AND m.max_starts = cbd.starts
        )
        SELECT
          DENSE_RANK() OVER (
            ORDER BY p.points DESC, COALESCE(w.wins, 0) DESC, d.last_name, d.first_name
          ) AS position,
          CONCAT(d.first_name, ' ', d.last_name) AS driver,
          t.team_name AS constructor,
          p.points,
          COALESCE(w.wins, 0) AS wins
        FROM points_by_driver p
        JOIN drivers d ON d.driver_id = p.driver_id
        LEFT JOIN wins_by_driver w ON w.driver_id = p.driver_id
        LEFT JOIN best_team bt ON bt.driver_id = p.driver_id
        LEFT JOIN teams t ON t.team_id = bt.team_id
        ORDER BY position;
        """,
        (year, year, year),
    )


@router.get("/standings/constructors")
def constructor_standings(
    year: int = Query(..., ge=1950, le=date.today().year),
) -> list[dict]:
    """Requirements §2.2 — constructors' standings for a season (position, points)."""
    cached = query_all(
        """
        SELECT
          ts.season_position AS position,
          t.team_name,
          ts.season_points AS points
        FROM team_standings ts
        JOIN teams t ON t.team_id = ts.team_id
        WHERE ts.season_year = %s
          AND ts.season_position IS NOT NULL
        ORDER BY ts.season_position;
        """,
        (year,),
    )
    if cached:
        return cached

    return query_all(
        """
        WITH team_points AS (
          SELECT
            td.team_id,
            SUM(COALESCE(rr.points, 0)) AS points
          FROM race_results rr
          JOIN team_drivers td
            ON td.season_year = rr.season_year
           AND td.driver_id = rr.driver_id
           AND td.role = 'MAIN'
          WHERE rr.season_year = %s
          GROUP BY td.team_id
        )
        SELECT
          DENSE_RANK() OVER (ORDER BY tp.points DESC, t.team_name) AS position,
          t.team_name,
          tp.points
        FROM team_points tp
        JOIN teams t ON t.team_id = tp.team_id
        ORDER BY position;
        """,
        (year,),
    )
