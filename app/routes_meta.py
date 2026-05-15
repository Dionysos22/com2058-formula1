from __future__ import annotations

from datetime import date

from fastapi import APIRouter, Query

from app.db import query_all, query_one


router = APIRouter(prefix="/api", tags=["meta"])


@router.get("/years")
def list_years(
    max_year: int = Query(default=date.today().year, ge=1950, le=2100),
) -> list[int]:
    rows = query_all(
        """
        SELECT season_year AS y
        FROM seasons
        WHERE season_year <= %s
        ORDER BY season_year;
        """,
        (max_year,),
    )
    return [int(r["y"]) for r in rows if r.get("y") is not None]


@router.get("/season-status")
def season_status(
    year: int = Query(..., ge=1950, le=2100),
) -> dict[str, int]:
    row = query_one(
        """
        SELECT
          (SELECT COUNT(*) FROM races WHERE season_year = %s) AS races,
          (SELECT COUNT(*) FROM race_results WHERE season_year = %s) AS results
        """,
        (year, year),
    )
    r = row or {"races": 0, "results": 0}
    return {"year": int(year), "races": int(r["races"]), "results": int(r["results"])}

