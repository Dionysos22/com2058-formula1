from __future__ import annotations

from pydantic import BaseModel


class DriverOut(BaseModel):
    driverId: int
    driverRef: str | None = None
    number: int | None = None
    code: str | None = None
    givenName: str
    familyName: str
    nationality: str | None = None

