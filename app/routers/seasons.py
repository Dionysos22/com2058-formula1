from __future__ import annotations

from datetime import date

from fastapi import APIRouter, HTTPException, Path

from app.db import query_all
from app.schemas.drivers import DriverOut


router = APIRouter(tags=["seasons"])


@router.get("/seasons/{year}/drivers", response_model=list[DriverOut])
def list_drivers_for_season(
    year: int = Path(..., ge=1950, le=date.today().year),
) -> list[DriverOut]:
    rows = query_all(
        """
        SELECT DISTINCT
          d.driverId,
          d.driverRef,
          d.number,
          d.code,
          d.forename AS givenName,
          d.surname AS familyName,
          d.nationality
        FROM drivers d
        JOIN results re ON re.driverId = d.driverId
        JOIN races ra ON ra.raceId = re.raceId
        WHERE ra.year = %s
        ORDER BY d.surname, d.forename, d.driverId;
        """,
        (year,),
    )

    if not rows:
        raise HTTPException(status_code=404, detail=f"No drivers found for season {year}")

    return [DriverOut(**r) for r in rows]

