from __future__ import annotations

import os
from dataclasses import dataclass

from dotenv import load_dotenv


load_dotenv()


@dataclass(frozen=True)
class Settings:
    db_host: str
    db_port: int
    db_user: str
    db_password: str
    project_db_name: str
    legacy_db_name: str
    modern_db_name: str
    modern_from_year: int


def _require_env(name: str) -> str:
    value = os.getenv(name)
    if value is None or value.strip() == "":
        raise RuntimeError(f"Missing required environment variable: {name}")
    return value


def get_settings() -> Settings:
    return Settings(
        db_host=os.getenv("DB_HOST", "127.0.0.1"),
        db_port=int(os.getenv("DB_PORT", "3306")),
        db_user=_require_env("DB_USER"),
        db_password=_require_env("DB_PASSWORD"),
        project_db_name=os.getenv("DB_PROJECT_NAME", "formula_1"),
        legacy_db_name=os.getenv("DB_LEGACY_NAME", "f1_db"),
        modern_db_name=os.getenv("DB_MODERN_NAME", "f1_db_2026"),
        modern_from_year=int(os.getenv("DB_MODERN_FROM_YEAR", "2023")),
    )
