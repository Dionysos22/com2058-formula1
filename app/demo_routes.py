from __future__ import annotations

from datetime import date

from fastapi import APIRouter, HTTPException, Path, Query

from app.config import get_settings
from app.db import query_all


router = APIRouter(prefix="/api/demo", tags=["demo"])


@router.get("/season-status")
def demo_season_status(
    year: int = Query(..., ge=1950, le=2100),
) -> dict[str, int]:
    s = get_settings()
    if year >= s.modern_from_year:
        row = query_all(
            """
            SELECT
              (SELECT COUNT(*) FROM race WHERE year = %s) AS races,
              (SELECT COUNT(*)
                 FROM race_result rr
                 JOIN race r ON r.id = rr.race_id
                WHERE r.year = %s) AS results
            """,
            (year, year),
            db_name=s.modern_db_name,
        )
    else:
        row = query_all(
            """
            SELECT
              (SELECT COUNT(*) FROM races WHERE year = %s) AS races,
              (SELECT COUNT(*)
                 FROM results re
                 JOIN races ra ON ra.raceId = re.raceId
                WHERE ra.year = %s) AS results
            """,
            (year, year),
            db_name=s.legacy_db_name,
        )
    r = row[0] if row else {"races": 0, "results": 0}
    return {"year": year, "races": int(r["races"]), "results": int(r["results"])}

@router.get("/years")
def demo_years(
    max_year: int = Query(default=date.today().year, ge=1950, le=2100),
) -> list[int]:
    s = get_settings()
    legacy = query_all(
        "SELECT DISTINCT year AS y FROM races ORDER BY y;",
        db_name=s.legacy_db_name,
    )
    modern = query_all(
        "SELECT DISTINCT year AS y FROM race ORDER BY y;",
        db_name=s.modern_db_name,
    )
    years = sorted({int(r["y"]) for r in (legacy + modern) if r.get("y") is not None})
    return [y for y in years if y <= max_year]


@router.get("/circuits")
def demo_circuits() -> list[dict]:
    s = get_settings()
    return query_all(
        """
        SELECT
          circuitId,
          name,
          location,
          country
        FROM circuits
        ORDER BY name;
        """,
        db_name=s.legacy_db_name,
    )


@router.get("/seasons/{year}/drivers")
def demo_drivers_for_season(
    year: int = Path(..., ge=1950, le=date.today().year),
) -> list[dict]:
    s = get_settings()
    if year >= s.modern_from_year:
        rows = query_all(
            """
            WITH constructor_by_driver AS (
              SELECT
                rr.driver_id,
                rr.constructor_id,
                COUNT(*) AS starts
              FROM race_result rr
              JOIN race r ON r.id = rr.race_id
              WHERE r.year = %s
              GROUP BY rr.driver_id, rr.constructor_id
            ),
            best_constructor AS (
              SELECT cbd.*
              FROM constructor_by_driver cbd
              JOIN (
                SELECT driver_id, MAX(starts) AS max_starts
                FROM constructor_by_driver
                GROUP BY driver_id
              ) m ON m.driver_id = cbd.driver_id AND m.max_starts = cbd.starts
            )
            SELECT DISTINCT
              d.id AS driverId,
              d.abbreviation AS code,
              d.permanent_number AS number,
              d.first_name AS forename,
              d.last_name AS surname,
              d.nationality_country_id AS nationality,
              c.name AS constructor
            FROM race_result rr
            JOIN race r ON r.id = rr.race_id
            JOIN driver d ON d.id = rr.driver_id
            LEFT JOIN best_constructor bc ON bc.driver_id = rr.driver_id
            LEFT JOIN constructor c ON c.id = bc.constructor_id
            WHERE r.year = %s
            ORDER BY d.last_name, d.first_name, d.id;
            """,
            (year, year),
            db_name=s.modern_db_name,
        )
    else:
        rows = query_all(
            """
            SELECT DISTINCT
              d.driverId,
              d.code,
              d.number,
              d.forename AS forename,
              d.surname  AS surname,
              d.nationality AS nationality,
              c.name AS constructor
            FROM drivers d
            JOIN results re ON re.driverId = d.driverId
            JOIN races ra ON ra.raceId = re.raceId
            JOIN constructors c ON c.constructorId = re.constructorId
            WHERE ra.year = %s
            ORDER BY d.surname, d.forename, d.driverId;
            """,
            (year,),
            db_name=s.legacy_db_name,
        )

    if not rows:
        raise HTTPException(status_code=404, detail=f"No drivers found for season {year}")

    return rows


@router.get("/races")
def demo_races(
    year: int = Query(..., ge=1950, le=date.today().year),
) -> list[dict]:
    s = get_settings()
    if year >= s.modern_from_year:
        return query_all(
            """
            SELECT
              r.round,
              gp.name AS name,
              ci.name AS circuit,
              r.date,
              CONCAT(d.first_name, ' ', d.last_name) AS winner
            FROM race r
            JOIN grand_prix gp ON gp.id = r.grand_prix_id
            JOIN circuit ci ON ci.id = r.circuit_id
            LEFT JOIN race_result rr ON rr.race_id = r.id AND rr.position_number = 1
            LEFT JOIN driver d ON d.id = rr.driver_id
            WHERE r.year = %s
            ORDER BY r.round;
            """,
            (year,),
            db_name=s.modern_db_name,
        )
    return query_all(
        """
        SELECT
          ra.round,
          ra.name,
          c.name AS circuit,
          ra.date,
          CONCAT(d.forename, ' ', d.surname) AS winner
        FROM races ra
        JOIN circuits c ON c.circuitId = ra.circuitId
        LEFT JOIN results re ON re.raceId = ra.raceId AND re.positionOrder = 1
        LEFT JOIN drivers d ON d.driverId = re.driverId
        WHERE ra.year = %s
        ORDER BY ra.round;
        """,
        (year,),
        db_name=s.legacy_db_name,
    )


@router.get("/standings/drivers")
def demo_driver_standings(
    year: int = Query(..., ge=1950, le=date.today().year),
) -> list[dict]:
    s = get_settings()
    if year < s.modern_from_year:
        return query_all(
            """
            SELECT
              ds.position,
              CONCAT(d.forename, ' ', d.surname) AS driver,
              c.name AS constructor,
              ds.points,
              ds.wins
            FROM driverStandings ds
            JOIN races ra ON ra.raceId = ds.raceId
            JOIN drivers d ON d.driverId = ds.driverId
            LEFT JOIN results re
              ON re.raceId = ds.raceId AND re.driverId = ds.driverId
            LEFT JOIN constructors c ON c.constructorId = re.constructorId
            WHERE ra.year = %s
              AND ra.round = (
                SELECT MAX(r2.round) FROM races r2 WHERE r2.year = ra.year
              )
            ORDER BY ds.position, ds.points DESC, ds.wins DESC, ds.driverId;
            """,
            (year,),
            db_name=s.legacy_db_name,
        )

    rows = query_all(
        """
        WITH wins_by_driver AS (
          SELECT rr.driver_id, COUNT(*) AS wins
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s AND rr.position_number = 1
          GROUP BY rr.driver_id
        ),
        constructor_by_driver AS (
          SELECT
            rr.driver_id,
            rr.constructor_id,
            COUNT(*) AS starts
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s
          GROUP BY rr.driver_id, rr.constructor_id
        ),
        best_constructor AS (
          SELECT cbd.*
          FROM constructor_by_driver cbd
          JOIN (
            SELECT driver_id, MAX(starts) AS max_starts
            FROM constructor_by_driver
            GROUP BY driver_id
          ) m ON m.driver_id = cbd.driver_id AND m.max_starts = cbd.starts
        )
        SELECT
          s.position_number AS position,
          CONCAT(d.first_name, ' ', d.last_name) AS driver,
          c.name AS constructor,
          s.points,
          COALESCE(w.wins, 0) AS wins
        FROM season_driver_standing s
        JOIN driver d ON d.id = s.driver_id
        LEFT JOIN best_constructor bc ON bc.driver_id = s.driver_id
        LEFT JOIN constructor c ON c.id = bc.constructor_id
        LEFT JOIN wins_by_driver w ON w.driver_id = s.driver_id
        WHERE s.year = %s
        ORDER BY s.position_display_order;
        """,
        (year, year, year),
        db_name=s.modern_db_name,
    )
    if rows:
        return rows

    # Ongoing season fallback: take standings after the latest race in that year.
    rows2 = query_all(
        """
        WITH latest_race AS (
          SELECT id
          FROM race
          WHERE year = %s
          ORDER BY round DESC
          LIMIT 1
        ),
        wins_by_driver AS (
          SELECT rr.driver_id, COUNT(*) AS wins
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s AND rr.position_number = 1
          GROUP BY rr.driver_id
        ),
        constructor_by_driver AS (
          SELECT
            rr.driver_id,
            rr.constructor_id,
            COUNT(*) AS starts
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s
          GROUP BY rr.driver_id, rr.constructor_id
        ),
        best_constructor AS (
          SELECT cbd.*
          FROM constructor_by_driver cbd
          JOIN (
            SELECT driver_id, MAX(starts) AS max_starts
            FROM constructor_by_driver
            GROUP BY driver_id
          ) m ON m.driver_id = cbd.driver_id AND m.max_starts = cbd.starts
        )
        SELECT
          rds.position_number AS position,
          CONCAT(d.first_name, ' ', d.last_name) AS driver,
          c.name AS constructor,
          rds.points,
          COALESCE(w.wins, 0) AS wins
        FROM race_driver_standing rds
        JOIN latest_race lr ON lr.id = rds.race_id
        JOIN driver d ON d.id = rds.driver_id
        LEFT JOIN best_constructor bc ON bc.driver_id = rds.driver_id
        LEFT JOIN constructor c ON c.id = bc.constructor_id
        LEFT JOIN wins_by_driver w ON w.driver_id = rds.driver_id
        ORDER BY rds.position_display_order;
        """,
        (year, year, year),
        db_name=s.modern_db_name,
    )
    if rows2:
        return rows2

    # Final fallback: compute standings from race results points (works even if standings tables aren't populated).
    return query_all(
        """
        WITH wins_by_driver AS (
          SELECT rr.driver_id, COUNT(*) AS wins
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s AND rr.position_number = 1
          GROUP BY rr.driver_id
        ),
        points_by_driver AS (
          SELECT
            rr.driver_id,
            SUM(COALESCE(rr.points, 0)) AS points
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s
          GROUP BY rr.driver_id
        ),
        constructor_by_driver AS (
          SELECT
            rr.driver_id,
            rr.constructor_id,
            COUNT(*) AS starts
          FROM race_result rr
          JOIN race r ON r.id = rr.race_id
          WHERE r.year = %s
          GROUP BY rr.driver_id, rr.constructor_id
        ),
        best_constructor AS (
          SELECT cbd.*
          FROM constructor_by_driver cbd
          JOIN (
            SELECT driver_id, MAX(starts) AS max_starts
            FROM constructor_by_driver
            GROUP BY driver_id
          ) m ON m.driver_id = cbd.driver_id AND m.max_starts = cbd.starts
        )
        SELECT
          DENSE_RANK() OVER (ORDER BY p.points DESC, COALESCE(w.wins, 0) DESC, d.last_name, d.first_name) AS position,
          CONCAT(d.first_name, ' ', d.last_name) AS driver,
          c.name AS constructor,
          p.points,
          COALESCE(w.wins, 0) AS wins
        FROM points_by_driver p
        JOIN driver d ON d.id = p.driver_id
        LEFT JOIN wins_by_driver w ON w.driver_id = p.driver_id
        LEFT JOIN best_constructor bc ON bc.driver_id = p.driver_id
        LEFT JOIN constructor c ON c.id = bc.constructor_id
        ORDER BY position;
        """,
        (year, year, year),
        db_name=s.modern_db_name,
    )

