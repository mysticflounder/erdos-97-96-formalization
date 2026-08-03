"""Deterministic timing records for Phase-3 CEGAR benchmark copies.

Timing records are diagnostic.  They live outside the measured run directory
and never participate in mathematical acceptance or learned-cut admission.
"""

from __future__ import annotations

import contextlib
import hashlib
import json
import math
import os
import shutil
import time
from collections import defaultdict
from collections.abc import Callable, Iterator, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Literal

TIMING_SCHEMA = "p97-phase3-cegar-timing-v1"
BENCHMARK_SCHEMA = "p97-phase3-cegar-benchmark-v1"
CacheCondition = Literal["fresh-process-new-copy", "warm-process-same-copy"]


class TimingJournalError(RuntimeError):
    """A timing journal or benchmark-copy contract was violated."""


@dataclass(frozen=True)
class Clock:
    monotonic_ns: Callable[[], int] = time.monotonic_ns
    process_time_ns: Callable[[], int] = time.process_time_ns


@dataclass(frozen=True)
class TimingContext:
    benchmark_manifest_sha256: str
    subject_manifest_sha256: str | None
    subject_chain_head_sha256: str | None
    cache_condition: CacheCondition
    repetition: int

    def as_dict(self) -> dict[str, Any]:
        if self.repetition < 0:
            raise TimingJournalError("repetition must be nonnegative")
        return {
            "benchmark_manifest_sha256": self.benchmark_manifest_sha256,
            "subject_manifest_sha256": self.subject_manifest_sha256,
            "subject_chain_head_sha256": self.subject_chain_head_sha256,
            "cache_condition": self.cache_condition,
            "repetition": self.repetition,
            "os_cache_control": "none",
        }


class TimingRecorder:
    """Collect integer wall/CPU deltas using an injectable clock."""

    def __init__(self, clock: Clock | None = None) -> None:
        self.clock = clock or Clock()
        self.samples: list[dict[str, Any]] = []

    @contextlib.contextmanager
    def measure(
        self,
        stage: str,
        operation: str,
        *,
        counters: Mapping[str, int] | None = None,
    ) -> Iterator[None]:
        wall_start = self.clock.monotonic_ns()
        cpu_start = self.clock.process_time_ns()
        succeeded = False
        error_type: str | None = None
        try:
            yield
            succeeded = True
        except BaseException as exc:
            error_type = type(exc).__name__
            raise
        finally:
            cpu_end = self.clock.process_time_ns()
            wall_end = self.clock.monotonic_ns()
            wall_ns = wall_end - wall_start
            cpu_ns = cpu_end - cpu_start
            if wall_ns < 0 or cpu_ns < 0:
                raise TimingJournalError("timing clock moved backwards")
            self.samples.append(
                {
                    "stage": stage,
                    "operation": operation,
                    "wall_ns": wall_ns,
                    "cpu_ns": cpu_ns,
                    "succeeded": succeeded,
                    "error_type": error_type,
                    "counters": dict(sorted((counters or {}).items())),
                }
            )

    def call[T](
        self,
        stage: str,
        operation: str,
        function: Callable[..., T],
        *args: Any,
        counters: Mapping[str, int] | None = None,
        **kwargs: Any,
    ) -> T:
        with self.measure(stage, operation, counters=counters):
            return function(*args, **kwargs)


def timed_runner[T](
    recorder: TimingRecorder,
    stage: str,
    runner: Callable[[Path, int, Path | None], T],
) -> Callable[[Path, int, Path | None], T]:
    """Wrap an injected solver-like runner without changing its artifacts."""

    def run(cnf: Path, timeout_s: int, proof: Path | None) -> T:
        counters = {"cnf_bytes": cnf.stat().st_size}
        with recorder.measure(stage, "invoke", counters=counters):
            return runner(cnf, timeout_s, proof)

    return run


def timed_checker_runner[T](
    recorder: TimingRecorder,
    stage: str,
    runner: Callable[[Path, Path, int], T],
) -> Callable[[Path, Path, int], T]:
    """Wrap an injected proof checker without changing its artifacts."""

    def run(cnf: Path, proof: Path, timeout_s: int) -> T:
        counters = {
            "cnf_bytes": cnf.stat().st_size,
            "proof_bytes": proof.stat().st_size,
        }
        with recorder.measure(stage, "invoke", counters=counters):
            return runner(cnf, proof, timeout_s)

    return run


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise TimingJournalError(f"duplicate JSON key {key!r}")
        value[key] = item
    return value


class TimingJournal:
    """Append and validate canonical, hash-chained timing samples."""

    def __init__(self, path: Path) -> None:
        self.path = path

    def read(self) -> list[dict[str, Any]]:
        if not self.path.exists():
            return []
        records: list[dict[str, Any]] = []
        previous: str | None = None
        with self.path.open("rb") as handle:
            for line_number, raw in enumerate(handle, start=1):
                if not raw.endswith(b"\n"):
                    raise TimingJournalError(
                        f"timing journal line {line_number} is truncated"
                    )
                try:
                    record = json.loads(
                        raw,
                        object_pairs_hook=_reject_duplicate_keys,
                    )
                except (json.JSONDecodeError, UnicodeDecodeError) as exc:
                    raise TimingJournalError(
                        f"invalid timing journal line {line_number}"
                    ) from exc
                if not isinstance(record, dict):
                    raise TimingJournalError(
                        f"timing journal line {line_number} is not an object"
                    )
                payload = dict(record)
                claimed = payload.pop("record_sha256", None)
                if payload.get("schema") != TIMING_SCHEMA:
                    raise TimingJournalError("timing journal schema mismatch")
                if payload.get("previous_record_sha256") != previous:
                    raise TimingJournalError("broken timing journal hash chain")
                if claimed != _sha256_value(payload):
                    raise TimingJournalError("invalid timing journal record hash")
                if raw != _canonical_bytes(record) + b"\n":
                    raise TimingJournalError("timing journal record is not canonical")
                previous = claimed
                records.append(record)
        return records

    def append(
        self,
        context: TimingContext,
        samples: Sequence[Mapping[str, Any]],
    ) -> list[dict[str, Any]]:
        prior = self.read()
        previous = prior[-1]["record_sha256"] if prior else None
        new_records: list[dict[str, Any]] = []
        for sample in samples:
            sample = dict(sample)
            required = {
                "stage",
                "operation",
                "wall_ns",
                "cpu_ns",
                "succeeded",
                "error_type",
                "counters",
            }
            if set(sample) != required:
                raise TimingJournalError("timing sample fields are not canonical")
            payload = {
                "schema": TIMING_SCHEMA,
                **context.as_dict(),
                **sample,
                "previous_record_sha256": previous,
            }
            record = {**payload, "record_sha256": _sha256_value(payload)}
            previous = record["record_sha256"]
            new_records.append(record)

        if not new_records:
            return []
        self.path.parent.mkdir(parents=True, exist_ok=True)
        with self.path.open("ab") as handle:
            for record in new_records:
                handle.write(_canonical_bytes(record) + b"\n")
            handle.flush()
            os.fsync(handle.fileno())
        return new_records


def summarize(records: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    """Return deterministic integer median and nearest-rank p95 summaries."""

    groups: dict[tuple[str, str], list[Mapping[str, Any]]] = defaultdict(list)
    for record in records:
        groups[(str(record["stage"]), str(record["operation"]))].append(record)

    summaries = []
    for (stage, operation), samples in sorted(groups.items()):
        wall = sorted(int(sample["wall_ns"]) for sample in samples)
        cpu = sorted(int(sample["cpu_ns"]) for sample in samples)
        middle = len(samples) // 2
        if len(samples) % 2:
            wall_median = wall[middle]
            cpu_median = cpu[middle]
        else:
            wall_median = (wall[middle - 1] + wall[middle]) // 2
            cpu_median = (cpu[middle - 1] + cpu[middle]) // 2
        p95_index = max(0, math.ceil(0.95 * len(samples)) - 1)
        summaries.append(
            {
                "stage": stage,
                "operation": operation,
                "sample_count": len(samples),
                "wall_ns_median": wall_median,
                "wall_ns_p95": wall[p95_index],
                "cpu_ns_median": cpu_median,
                "cpu_ns_p95": cpu[p95_index],
            }
        )
    return {"schema": BENCHMARK_SCHEMA, "summaries": summaries}


def copy_fixture(
    source: Path,
    destination: Path,
    *,
    active_output_dirs: Sequence[Path] = (),
) -> Path:
    """Copy a benchmark subject while refusing active or in-place targets."""

    source = source.resolve()
    destination = destination.resolve()
    if source == destination or destination.exists():
        raise TimingJournalError("benchmark destination must be new and distinct")
    for active in active_output_dirs:
        active = active.resolve()
        if (
            destination == active
            or active in destination.parents
            or destination in active.parents
        ):
            raise TimingJournalError("benchmark destination is an active output")
    if source.is_dir():
        shutil.copytree(source, destination)
    elif source.is_file():
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, destination)
    else:
        raise TimingJournalError(f"missing benchmark fixture {source}")
    return destination


def run_repetitions[T](
    run_once: Callable[[CacheCondition, int], T],
    *,
    fresh: int = 3,
    warm: int = 5,
) -> list[T]:
    if fresh <= 0 or warm <= 0:
        raise TimingJournalError("fresh and warm repetition counts must be positive")
    results = [
        run_once("fresh-process-new-copy", repetition)
        for repetition in range(fresh)
    ]
    results.extend(
        run_once("warm-process-same-copy", repetition)
        for repetition in range(warm)
    )
    return results
