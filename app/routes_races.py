from __future__ import annotations

from fastapi import APIRouter, Query

from app.db import query_all


router = APIRouter(prefix="/api", tags=["races"])


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
    SELECT
      r.season_year,
      r.round_number,
      r.grand_prix_name,
      r.race_start_date,
      r.race_end_date,
      c.circuit_name,
      CONCAT(d.first_name, ' ', d.last_name) AS winner
    FROM races r
    JOIN circuits c ON c.circuit_id = r.circuit_id
    LEFT JOIN race_results rr
      ON rr.season_year = r.season_year
     AND rr.round_number = r.round_number
     AND rr.finish_position = 1
    LEFT JOIN drivers d ON d.driver_id = rr.driver_id
    {"WHERE " + " AND ".join(where) if where else ""}
    ORDER BY {order};
    """

    return query_all(query, tuple(params))
