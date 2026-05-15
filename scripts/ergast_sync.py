from __future__ import annotations

import argparse
import json
from datetime import date
from typing import Any

import requests

import os
import sys

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

from app.db import execute, query_one


ERGAST_BASE = "https://ergast.com/api/f1"


def get_json(url: str) -> dict[str, Any]:
    r = requests.get(url, timeout=30)
    r.raise_for_status()
    return r.json()


def ensure_cache_tables() -> None:
    execute(
        """
        CREATE TABLE IF NOT EXISTS ergast_api_races (
          season INT NOT NULL,
          round INT NOT NULL,
          raceName VARCHAR(255) NOT NULL,
          circuitName VARCHAR(255) NOT NULL,
          raceDate DATE NULL,
          raw_json JSON NOT NULL,
          PRIMARY KEY (season, round)
        );
        """
    )

    execute(
        """
        CREATE TABLE IF NOT EXISTS ergast_api_driver_standings_final (
          season INT NOT NULL,
          position INT NOT NULL,
          driverId VARCHAR(64) NOT NULL,
          forename VARCHAR(128) NOT NULL,
          surname VARCHAR(128) NOT NULL,
          nationality VARCHAR(128) NULL,
          constructor VARCHAR(255) NULL,
          points FLOAT NULL,
          wins INT NULL,
          raw_json JSON NOT NULL,
          PRIMARY KEY (season, position),
          KEY idx_season_driver (season, driverId)
        );
        """
    )


def upsert_race(season: int, rnd: int, race_name: str, circuit_name: str, race_date: str | None, raw: dict) -> None:
    execute(
        """
        INSERT INTO ergast_api_races (season, round, raceName, circuitName, raceDate, raw_json)
        VALUES (%s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE
          raceName = VALUES(raceName),
          circuitName = VALUES(circuitName),
          raceDate = VALUES(raceDate),
          raw_json = VALUES(raw_json);
        """,
        (season, rnd, race_name, circuit_name, race_date, json.dumps(raw)),
    )


def sync_races(season: int) -> int:
    url = f"{ERGAST_BASE}/{season}.json"
    payload = get_json(url)
    races = payload["MRData"]["RaceTable"]["Races"]

    count = 0
    for r in races:
        rnd = int(r["round"])
        race_name = r.get("raceName", "")
        circuit_name = (r.get("Circuit") or {}).get("circuitName", "")
        race_date = r.get("date")
        upsert_race(season, rnd, race_name, circuit_name, race_date, r)
        count += 1
    return count


def upsert_final_standing(
    season: int,
    position: int,
    driver_id: str,
    forename: str,
    surname: str,
    nationality: str | None,
    constructor: str | None,
    points: float | None,
    wins: int | None,
    raw: dict,
) -> None:
    execute(
        """
        INSERT INTO ergast_api_driver_standings_final
          (season, position, driverId, forename, surname, nationality, constructor, points, wins, raw_json)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE
          driverId = VALUES(driverId),
          forename = VALUES(forename),
          surname = VALUES(surname),
          nationality = VALUES(nationality),
          constructor = VALUES(constructor),
          points = VALUES(points),
          wins = VALUES(wins),
          raw_json = VALUES(raw_json);
        """,
        (season, position, driver_id, forename, surname, nationality, constructor, points, wins, json.dumps(raw)),
    )


def sync_final_driver_standings(season: int) -> int:
    # Ergast API: driverStandings list per round; we take the LAST standings list.
    url = f"{ERGAST_BASE}/{season}/driverStandings.json?limit=500"
    payload = get_json(url)
    lists = payload["MRData"]["StandingsTable"]["StandingsLists"]
    if not lists:
        return 0

    final_list = lists[-1]
    standings = final_list.get("DriverStandings") or []

    count = 0
    for s in standings:
        position = int(s["position"])
        points = float(s["points"]) if s.get("points") is not None else None
        wins = int(s["wins"]) if s.get("wins") is not None else None

        d = s.get("Driver") or {}
        driver_id = str(d.get("driverId") or "")
        forename = str(d.get("givenName") or d.get("forename") or "")
        surname = str(d.get("familyName") or d.get("surname") or "")
        nationality = d.get("nationality")

        constructors = s.get("Constructors") or []
        constructor_name = constructors[0].get("name") if constructors else None

        upsert_final_standing(
            season=season,
            position=position,
            driver_id=driver_id,
            forename=forename,
            surname=surname,
            nationality=nationality,
            constructor=constructor_name,
            points=points,
            wins=wins,
            raw=s,
        )
        count += 1
    return count


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync latest Ergast API data into MySQL cache tables.")
    parser.add_argument("--season", type=int, default=date.today().year, help="Season year (default: current year)")
    args = parser.parse_args()

    ensure_cache_tables()
    n_races = sync_races(args.season)
    n_standings = sync_final_driver_standings(args.season)

    row = query_one("SELECT COUNT(*) AS c FROM ergast_api_races WHERE season = %s", (args.season,))
    total = int(row["c"]) if row else 0
    row2 = query_one(
        "SELECT COUNT(*) AS c FROM ergast_api_driver_standings_final WHERE season = %s", (args.season,)
    )
    total2 = int(row2["c"]) if row2 else 0
    print(
        f"Synced season {args.season}: races={n_races} (cached={total}), final_driver_standings={n_standings} (cached={total2})."
    )


if __name__ == "__main__":
    main()

