from __future__ import annotations

from contextlib import contextmanager
from typing import Any, Iterator, Mapping, Sequence

import pymysql
from pymysql.cursors import DictCursor

from app.config import get_settings


Params = Sequence[Any] | Mapping[str, Any] | None


def get_conn(db_name: str) -> pymysql.connections.Connection:
    s = get_settings()
    return pymysql.connect(
        host=s.db_host,
        port=s.db_port,
        user=s.db_user,
        password=s.db_password,
        database=db_name,
        charset="utf8mb4",
        cursorclass=DictCursor,
        autocommit=True,
    )


@contextmanager
def conn_cursor(db_name: str) -> Iterator[tuple[pymysql.connections.Connection, DictCursor]]:
    conn = get_conn(db_name)
    try:
        with conn.cursor() as cur:
            yield conn, cur
    finally:
        conn.close()

def _default_db() -> str:
    s = get_settings()
    # Default to the course project schema (Formula_1.sql).
    # Demo routes pass explicit db_name so they are unaffected.
    return s.project_db_name


def query_all(sql: str, params: Params = None, *, db_name: str | None = None) -> list[dict[str, Any]]:
    with conn_cursor(db_name or _default_db()) as (_, cur):
        cur.execute(sql, params)
        rows = cur.fetchall()
        return list(rows)


def query_one(sql: str, params: Params = None, *, db_name: str | None = None) -> dict[str, Any] | None:
    with conn_cursor(db_name or _default_db()) as (_, cur):
        cur.execute(sql, params)
        row = cur.fetchone()
        return row if row is not None else None


def execute(sql: str, params: Params = None, *, db_name: str | None = None) -> int:
    with conn_cursor(db_name or _default_db()) as (_, cur):
        cur.execute(sql, params)
        return int(cur.rowcount)
