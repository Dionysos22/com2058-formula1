from __future__ import annotations

from pydantic import BaseModel


class CircuitOut(BaseModel):
    circuitId: int
    name: str
    location: str | None = None
    country: str | None = None

