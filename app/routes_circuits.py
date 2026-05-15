from __future__ import annotations

from fastapi import APIRouter, Query

from app.db import query_all


router = APIRouter(prefix="/api", tags=["circuits"])


@router.get("/circuits")
def get_circuits(
    country: str | None = Query(default=None, min_length=1, max_length=64),
    name: str | None = Query(default=None, min_length=1, max_length=128),
) -> list[dict]:
    where = []
    params: list = []

    if country is not None:
        where.append("country = %s")
        params.append(country)

    if name is not None:
        where.append("circuit_name LIKE %s")
        params.append(f"%{name}%")

    query = f"""
    SELECT
      circuit_id,
      circuit_name,
      country,
      city,
      laps,
      length_m,
      first_gp_year,
      fastest_lap_time
    FROM circuits
    {"WHERE " + " AND ".join(where) if where else ""}
    ORDER BY circuit_name;
    """

    return query_all(query, tuple(params))
