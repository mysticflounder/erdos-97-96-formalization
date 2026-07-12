"""Crash-safe ordered checkpoints for lazy Census-554 closure instances.

The lazy cover loop is monotone: every discovered motif placement contributes
one more exclusion clause, and no clause is ever removed.  Replaying those
placements in their original insertion order reconstructs the same auxiliary
variables and clauses.  This module persists that ordered stream together with
an exact run fingerprint and an atomic progress cursor.

The store is deliberately agnostic about the mathematical provenance schema.
Callers supply JSON-compatible records containing at least ``pattern`` and
``clause`` fields, then revalidate and rederive each record while replaying it.
The checkpoint is a recovery aid, never an independent proof artifact.
"""

from __future__ import annotations

from collections.abc import Iterable, Iterator, Mapping
from dataclasses import dataclass
import json
from pathlib import Path
import sqlite3
from typing import Any


SCHEMA_VERSION = "census554_closure_checkpoint.v1"


class CheckpointError(RuntimeError):
    """The checkpoint is corrupt, incompatible, or internally inconsistent."""


def _canonical_json(value: Any) -> str:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    )


def _validate_record(record: Mapping[str, Any]) -> tuple[str, str]:
    if "pattern" not in record:
        raise CheckpointError("checkpoint record is missing pattern")
    if "clause" not in record:
        raise CheckpointError("checkpoint record is missing clause")
    try:
        pattern_key = _canonical_json(record["pattern"])
        record_json = _canonical_json(dict(record))
    except (TypeError, ValueError) as exc:
        raise CheckpointError("checkpoint record is not JSON-compatible") from exc
    return pattern_key, record_json


@dataclass(frozen=True, slots=True)
class CheckpointProgress:
    iteration: int
    elapsed_seconds: float
    status: str
    instance_count: int


class ClosureCheckpoint:
    """An ordered SQLite checkpoint with transactional progress updates."""

    def __init__(self, path: Path, connection: sqlite3.Connection) -> None:
        self.path = path
        self._connection = connection

    @classmethod
    def create(
        cls, path: str | Path, run_metadata: Mapping[str, Any]
    ) -> "ClosureCheckpoint":
        checkpoint_path = Path(path)
        checkpoint_path.parent.mkdir(parents=True, exist_ok=True)
        if checkpoint_path.exists():
            raise CheckpointError(f"checkpoint already exists: {checkpoint_path}")
        connection = sqlite3.connect(checkpoint_path)
        store = cls(checkpoint_path, connection)
        try:
            store._configure()
            with connection:
                connection.executescript(
                    """
                    CREATE TABLE metadata (
                      key TEXT PRIMARY KEY,
                      value TEXT NOT NULL
                    );
                    CREATE TABLE instances (
                      seq INTEGER PRIMARY KEY AUTOINCREMENT,
                      pattern_key TEXT NOT NULL UNIQUE,
                      record_json TEXT NOT NULL
                    );
                    CREATE TABLE progress (
                      singleton INTEGER PRIMARY KEY CHECK (singleton = 1),
                      iteration INTEGER NOT NULL,
                      elapsed_seconds REAL NOT NULL,
                      status TEXT NOT NULL,
                      instance_count INTEGER NOT NULL
                    );
                    """
                )
                connection.executemany(
                    "INSERT INTO metadata(key, value) VALUES (?, ?)",
                    (
                        ("schema", _canonical_json(SCHEMA_VERSION)),
                        ("run_metadata", _canonical_json(dict(run_metadata))),
                    ),
                )
                connection.execute(
                    """INSERT INTO progress(
                         singleton, iteration, elapsed_seconds, status,
                         instance_count
                       ) VALUES (1, 0, 0.0, 'initialized', 0)"""
                )
        except Exception:
            connection.close()
            checkpoint_path.unlink(missing_ok=True)
            raise
        return store

    @classmethod
    def open(
        cls, path: str | Path, expected_metadata: Mapping[str, Any]
    ) -> "ClosureCheckpoint":
        checkpoint_path = Path(path)
        if not checkpoint_path.is_file():
            raise CheckpointError(f"checkpoint does not exist: {checkpoint_path}")
        connection = sqlite3.connect(checkpoint_path)
        store = cls(checkpoint_path, connection)
        try:
            store._configure()
            rows = dict(connection.execute("SELECT key, value FROM metadata"))
            expected = {
                "schema": _canonical_json(SCHEMA_VERSION),
                "run_metadata": _canonical_json(dict(expected_metadata)),
            }
            if rows != expected:
                raise CheckpointError(
                    "checkpoint fingerprint mismatch: refusing drifted replay"
                )
            store._check_progress_count()
        except Exception:
            connection.close()
            raise
        return store

    @classmethod
    def create_or_open(
        cls, path: str | Path, run_metadata: Mapping[str, Any]
    ) -> tuple["ClosureCheckpoint", bool]:
        checkpoint_path = Path(path)
        if checkpoint_path.exists():
            return cls.open(checkpoint_path, run_metadata), False
        return cls.create(checkpoint_path, run_metadata), True

    def _configure(self) -> None:
        self._connection.execute("PRAGMA journal_mode=WAL")
        self._connection.execute("PRAGMA synchronous=FULL")
        self._connection.execute("PRAGMA foreign_keys=ON")

    def _check_progress_count(self) -> None:
        progress = self.progress()
        actual = self._connection.execute(
            "SELECT COUNT(*) FROM instances"
        ).fetchone()[0]
        if actual != progress.instance_count:
            raise CheckpointError(
                "checkpoint progress count does not match instance table"
            )

    def append_batch(
        self,
        records: Iterable[Mapping[str, Any]],
        *,
        iteration: int,
        elapsed_seconds: float,
        status: str = "running",
    ) -> int:
        """Atomically append new records and advance the progress cursor.

        Repeating a byte-equivalent record is idempotent.  Reusing a pattern
        key with different data is rejected and rolls back the entire batch.
        """

        if iteration < 0:
            raise CheckpointError("iteration must be nonnegative")
        if elapsed_seconds < 0:
            raise CheckpointError("elapsed_seconds must be nonnegative")
        prepared = [_validate_record(record) for record in records]
        inserted = 0
        try:
            self._connection.execute("BEGIN IMMEDIATE")
            old_progress = self._connection.execute(
                """SELECT iteration, elapsed_seconds
                   FROM progress WHERE singleton = 1"""
            ).fetchone()
            if old_progress is None:
                raise CheckpointError("checkpoint progress row is missing")
            if iteration < int(old_progress[0]):
                raise CheckpointError("checkpoint iteration cannot move backwards")
            if elapsed_seconds < float(old_progress[1]):
                raise CheckpointError(
                    "checkpoint elapsed time cannot move backwards"
                )
            for pattern_key, record_json in prepared:
                old = self._connection.execute(
                    "SELECT record_json FROM instances WHERE pattern_key = ?",
                    (pattern_key,),
                ).fetchone()
                if old is not None:
                    if old[0] != record_json:
                        raise CheckpointError(
                            "same pattern has conflicting checkpoint records"
                        )
                    continue
                self._connection.execute(
                    "INSERT INTO instances(pattern_key, record_json) VALUES (?, ?)",
                    (pattern_key, record_json),
                )
                inserted += 1
            count = self._connection.execute(
                "SELECT COUNT(*) FROM instances"
            ).fetchone()[0]
            self._connection.execute(
                """UPDATE progress
                   SET iteration = ?, elapsed_seconds = ?, status = ?,
                       instance_count = ?
                   WHERE singleton = 1""",
                (iteration, elapsed_seconds, status, count),
            )
            self._connection.commit()
        except Exception:
            self._connection.rollback()
            raise
        return inserted

    def records(self) -> Iterator[dict[str, Any]]:
        """Yield stored records in exact insertion order."""

        cursor = self._connection.execute(
            "SELECT record_json FROM instances ORDER BY seq"
        )
        for (record_json,) in cursor:
            value = json.loads(record_json)
            if not isinstance(value, dict):
                raise CheckpointError("checkpoint record is not an object")
            yield value

    def progress(self) -> CheckpointProgress:
        row = self._connection.execute(
            """SELECT iteration, elapsed_seconds, status, instance_count
               FROM progress WHERE singleton = 1"""
        ).fetchone()
        if row is None:
            raise CheckpointError("checkpoint progress row is missing")
        return CheckpointProgress(
            iteration=int(row[0]),
            elapsed_seconds=float(row[1]),
            status=str(row[2]),
            instance_count=int(row[3]),
        )

    def close(self) -> None:
        self._connection.close()

    def __enter__(self) -> "ClosureCheckpoint":
        return self

    def __exit__(self, _exc_type, _exc, _traceback) -> None:
        self.close()
