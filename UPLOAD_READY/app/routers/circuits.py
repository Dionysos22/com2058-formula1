from __future__ import annotations

from fastapi import APIRouter

from app.db import query_all
from app.schemas.circuits import CircuitOut


router = APIRouter(tags=["circuits"])


@router.get("/circuits", response_model=list[CircuitOut])
def list_circuits() -> list[CircuitOut]:
    rows = query_all(
        """
        SELECT
          circuitId,
          name,
          location,
          country
        FROM circuits
        ORDER BY name;
        """
    )
    return [CircuitOut(**r) for r in rows]

