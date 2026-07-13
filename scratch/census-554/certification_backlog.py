"""Crash-safe exact-pattern backlog for deferred Census-554 certificates."""

from __future__ import annotations

import fcntl
import json
import os
import time
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path

import pending_cert_store as pcs


SCHEMA = "census554-certification-backlog-v1"


@dataclass(frozen=True)
class BacklogTask:
    bank_key_sha256: str
    path: Path
    record: dict


class CertificationBacklog:
    def __init__(self, root: Path):
        self.root = Path(root)
        self.pending_dir = self.root / "pending"
        self.completed_dir = self.root / "completed"
        self.lock_path = self.root / "backlog.lock"

    def ensure_layout(self):
        self.pending_dir.mkdir(parents=True, exist_ok=True)
        self.completed_dir.mkdir(parents=True, exist_ok=True)

    @contextmanager
    def _lock(self):
        self.ensure_layout()
        with open(self.lock_path, "a+b") as handle:
            fcntl.flock(handle.fileno(), fcntl.LOCK_EX)
            try:
                yield
            finally:
                fcntl.flock(handle.fileno(), fcntl.LOCK_UN)

    def task_path(self, digest: str) -> Path:
        return self.pending_dir / f"{digest}.json"

    def enqueue(
        self,
        pattern_json,
        *,
        cube=None,
        source: str,
        requested_cpu_seconds: float,
    ) -> BacklogTask:
        key = pcs.bank_pattern_digest(pattern_json)
        path = self.task_path(key)
        now = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        with self._lock():
            if path.exists():
                record = json.loads(path.read_text(encoding="utf-8"))
                if pcs.bank_pattern_digest(record["pattern"]) != key:
                    raise pcs.PendingStoreError("backlog digest collision")
                record["requested_cpu_seconds"] = max(
                    float(record.get("requested_cpu_seconds", 0.0)),
                    float(requested_cpu_seconds),
                )
                sources = record.setdefault("sources", [])
                if source not in sources:
                    sources.append(source)
                if record.get("cube") is None and cube is not None:
                    record["cube"] = cube
                record["updated_utc"] = now
            else:
                record = {
                    "schema": SCHEMA,
                    "bank_key_sha256": key,
                    "pattern": pattern_json,
                    "cube": cube,
                    "sources": [source],
                    "requested_cpu_seconds": float(requested_cpu_seconds),
                    "attempts": [],
                    "created_utc": now,
                    "updated_utc": now,
                }
            pcs.atomic_write_json(path, record)
        return BacklogTask(key, path, record)

    def pending(self) -> list[BacklogTask]:
        self.ensure_layout()
        tasks = []
        for path in sorted(self.pending_dir.glob("*.json")):
            record = json.loads(path.read_text(encoding="utf-8"))
            if record.get("schema") != SCHEMA:
                raise pcs.PendingStoreError(f"bad backlog schema: {path}")
            key = pcs.bank_pattern_digest(record["pattern"])
            if path.stem != key or record.get("bank_key_sha256") != key:
                raise pcs.PendingStoreError(f"bad backlog identity: {path}")
            tasks.append(BacklogTask(key, path, record))
        return tasks

    def mark_attempt(self, pattern_json, status: dict) -> None:
        key = pcs.bank_pattern_digest(pattern_json)
        path = self.task_path(key)
        with self._lock():
            if not path.exists():
                return
            record = json.loads(path.read_text(encoding="utf-8"))
            attempt = dict(status)
            attempt["recorded_utc"] = time.strftime(
                "%Y-%m-%dT%H:%M:%SZ", time.gmtime()
            )
            record.setdefault("attempts", []).append(attempt)
            # Keep records bounded even when a future supervisor retries for
            # months; the exact outcome database carries the full scheduling
            # history independently.
            record["attempts"] = record["attempts"][-16:]
            record["updated_utc"] = attempt["recorded_utc"]
            pcs.atomic_write_json(path, record)

    def complete(self, pattern_json, *, disposition: str) -> bool:
        key = pcs.bank_pattern_digest(pattern_json)
        path = self.task_path(key)
        with self._lock():
            if not path.exists():
                return False
            record = json.loads(path.read_text(encoding="utf-8"))
            record["disposition"] = disposition
            record["completed_utc"] = time.strftime(
                "%Y-%m-%dT%H:%M:%SZ", time.gmtime()
            )
            target = self.completed_dir / path.name
            pcs.atomic_write_json(target, record)
            os.unlink(path)
            directory_fd = os.open(self.pending_dir, os.O_RDONLY)
            try:
                os.fsync(directory_fd)
            finally:
                os.close(directory_fd)
        return True
