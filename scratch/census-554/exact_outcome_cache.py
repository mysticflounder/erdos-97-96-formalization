"""Persistent scheduling cache for exact Census-554 certification outcomes.

This cache is an efficiency device only.  It never certifies a pattern and is
never consulted by the bank admission or terminal proof gates.  A completed
``no_certificate`` run may be reused for the same certifier implementation;
a ``budget_exhausted`` run may be reused only when the requested cumulative
CPU budget is no larger than the budget already spent.
"""

from __future__ import annotations

import json
import sqlite3
import time
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path

import pending_cert_store as pcs


SCHEMA_VERSION = 1


@dataclass(frozen=True)
class ReusableOutcome:
    bank_key_sha256: str
    certifier_id: str
    cpu_budget_seconds: float
    outcome: str
    cpu_seconds: float
    wall_seconds: float
    recorded_utc: str


class ExactOutcomeCache:
    def __init__(self, path: Path):
        self.path = Path(path)

    def _connect(self):
        self.path.parent.mkdir(parents=True, exist_ok=True)
        connection = sqlite3.connect(self.path, timeout=30)
        connection.execute("PRAGMA busy_timeout = 30000")
        connection.execute("PRAGMA journal_mode = WAL")
        connection.execute("PRAGMA synchronous = FULL")
        connection.execute(
            """
            CREATE TABLE IF NOT EXISTS outcomes (
              bank_key_sha256 TEXT NOT NULL,
              certifier_id TEXT NOT NULL,
              cpu_budget_seconds REAL NOT NULL,
              outcome TEXT NOT NULL,
              cpu_seconds REAL NOT NULL,
              wall_seconds REAL NOT NULL,
              kill TEXT,
              worker TEXT,
              recorded_utc TEXT NOT NULL,
              metadata_json TEXT NOT NULL,
              PRIMARY KEY (
                bank_key_sha256, certifier_id, cpu_budget_seconds, outcome
              )
            )
            """
        )
        connection.execute(f"PRAGMA user_version = {SCHEMA_VERSION}")
        return connection

    @contextmanager
    def _connection(self):
        connection = self._connect()
        try:
            with connection:
                yield connection
        finally:
            connection.close()

    def record(
        self,
        pattern_json,
        *,
        certifier_id: str,
        cpu_budget_seconds: float,
        outcome: str,
        cpu_seconds: float,
        wall_seconds: float,
        kill: str | None = None,
        worker: str | None = None,
        metadata: dict | None = None,
    ) -> None:
        if not certifier_id:
            raise ValueError("certifier_id is required")
        if outcome not in {
            "certified", "budget_exhausted", "no_certificate",
            "wall_guard", "error",
        }:
            raise ValueError(f"unsupported certification outcome: {outcome}")
        key = pcs.bank_pattern_digest(pattern_json)
        recorded = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        payload = json.dumps(
            metadata or {}, sort_keys=True, separators=(",", ":")
        )
        with self._connection() as connection:
            connection.execute(
                """
                INSERT INTO outcomes (
                  bank_key_sha256, certifier_id, cpu_budget_seconds, outcome,
                  cpu_seconds, wall_seconds, kill, worker, recorded_utc,
                  metadata_json
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT (
                  bank_key_sha256, certifier_id, cpu_budget_seconds, outcome
                ) DO UPDATE SET
                  cpu_seconds = excluded.cpu_seconds,
                  wall_seconds = excluded.wall_seconds,
                  kill = excluded.kill,
                  worker = excluded.worker,
                  recorded_utc = excluded.recorded_utc,
                  metadata_json = excluded.metadata_json
                """,
                (
                    key, certifier_id, float(cpu_budget_seconds), outcome,
                    float(cpu_seconds), float(wall_seconds), kill, worker,
                    recorded, payload,
                ),
            )

    def record_result(
        self,
        pattern_json,
        result: dict,
        *,
        requested_cpu_budget: float,
    ) -> bool:
        """Record a new-worker result; return False for legacy metadata."""

        stats = result.get("certification")
        if not isinstance(stats, dict) or not stats.get("certifier_id"):
            return False
        outcome = stats.get("outcome")
        if outcome not in {
            "certified", "budget_exhausted", "no_certificate", "wall_guard"
        }:
            outcome = "error"
        self.record(
            pattern_json,
            certifier_id=stats["certifier_id"],
            cpu_budget_seconds=float(
                stats.get("cpu_budget_seconds", requested_cpu_budget)
            ),
            outcome=outcome,
            cpu_seconds=float(stats.get("cpu_seconds", 0.0)),
            wall_seconds=float(result.get("elapsed", 0.0)),
            kill=(result.get("certificate") or {}).get("kill"),
            worker=result.get("worker"),
            metadata=stats,
        )
        return True

    def reusable(
        self,
        pattern_json,
        *,
        certifier_id: str,
        requested_cpu_budget: float,
    ) -> ReusableOutcome | None:
        key = pcs.bank_pattern_digest(pattern_json)
        with self._connection() as connection:
            row = connection.execute(
                """
                SELECT bank_key_sha256, certifier_id, cpu_budget_seconds,
                       outcome, cpu_seconds, wall_seconds, recorded_utc
                FROM outcomes
                WHERE bank_key_sha256 = ? AND certifier_id = ?
                  AND (
                    outcome = 'no_certificate'
                    OR (outcome = 'budget_exhausted'
                        AND cpu_budget_seconds >= ?)
                  )
                ORDER BY
                  CASE outcome WHEN 'no_certificate' THEN 0 ELSE 1 END,
                  cpu_budget_seconds DESC
                LIMIT 1
                """,
                (key, certifier_id, float(requested_cpu_budget)),
            ).fetchone()
        return ReusableOutcome(*row) if row is not None else None

    def count(self) -> int:
        with self._connection() as connection:
            return int(connection.execute(
                "SELECT COUNT(*) FROM outcomes"
            ).fetchone()[0])
