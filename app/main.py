from __future__ import annotations

from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

from app.db import query_one
from app.routes_circuits import router as circuits_router
from app.routes_drivers import router as drivers_router
from app.routes_meta import router as meta_router
from app.routes_races import router as races_router
from app.routes_standings import router as standings_router
from app.demo_routes import router as demo_router


app = FastAPI(title="F1 Stats API (raw SQL)")

app.include_router(drivers_router)
app.include_router(circuits_router)
app.include_router(races_router)
app.include_router(meta_router)
app.include_router(standings_router)
app.include_router(demo_router)

app.mount("/static", StaticFiles(directory="public"), name="public")


@app.get("/health")
def health() -> dict[str, str]:
    row = query_one("SELECT 1 AS ok;")
    return {"status": "ok" if row and row.get("ok") == 1 else "unknown"}


@app.get("/")
def spa() -> FileResponse:
    return FileResponse("public/index.html")
