"""Independent cvc5 screening of the 48 unique Phase-3 ordered systems.

The source is the fail-closed Z3 metric screen of all 100 structural
survivors.  Its 2,400 survivor/order leaves collapse to 48 distinct semantic
systems.  This driver replays that complete provenance and submits each unique
system exactly once to cvc5's nonlinear-covering backend.

Every query contains only the supplied row equalities, ambient pairwise
distinctness, and the supplied strict convex cyclic order.  ``MetricRow.exact``
is false throughout, so no off-support disequality or blocker geometry is
added.  cvc5 UNSAT is independent trusted-solver evidence, not Lean closure.
SAT is an unverified candidate and therefore no verdict.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import math
import os
import shutil
import time
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from census.global_confinement import metric_realizability_cvc5 as cvc5_backend
from census.global_confinement import metric_realizability_probe as metric
from census.p97_search import phase3_survivor_metric_driver as z3_driver

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_SOURCE = z3_driver.DEFAULT_OUT
DEFAULT_OUT = (
    ROOT / "scratch/p97-distinct-distance-lane" / "phase3_survivor_cvc5_48_20260729"
)
SCHEMA = "p97-phase3-survivor-cvc5-v1"
SYSTEM_SCHEMA = "p97-phase3-survivor-cvc5-system-v1"
RESULT_SCHEMA = "p97-phase3-survivor-cvc5-result-v1"
EXPECTED_SOURCE_RECORDS = 100
EXPECTED_SOURCE_LEAVES = 2400
EXPECTED_UNIQUE_SYSTEMS = 48
EXPECTED_UNIQUE_ROWS = 2
MAX_WORKERS = 24
STAGE = "full-convex"
BACKEND_STATUSES = ("SAT", "UNSAT", "UNKNOWN", "ERROR")
SYSTEM_RECORD_KEYS = frozenset(
    {
        "command",
        "constraint_counts",
        "index",
        "previous_record_sha256",
        "prior_z3_status",
        "query_path",
        "query_sha256",
        "record_sha256",
        "schema",
        "semantic_sha256",
        "source_leaf_count",
        "source_leaves",
        "system",
        "system_id",
    }
)
Z3_RESULT_KEYS = frozenset(
    {
        "canonical_digest",
        "classification",
        "convexity_order",
        "equality_only_metric_core",
        "exact_metric",
        "index",
        "previous_record_sha256",
        "record_sha256",
        "schema",
        "source_record",
        "source_record_sha256",
        "trust",
    }
)
Z3_ORDER_RESULT_KEYS = frozenset(
    {
        "backend_result",
        "diagnostic",
        "order",
        "order_id",
        "raw_result_sha256",
        "status",
    }
)
DEPENDENCIES = (
    "census/global_confinement/metric_realizability_cvc5.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/p97_search/phase3_survivor_metric_driver.py",
)

QueryRunner = Callable[
    [str, Mapping[str, Any], float],
    Mapping[str, Any],
]
SmokeRunner = Callable[[str, float], Mapping[str, Any]]
VersionRunner = Callable[[str], str]


class Phase3Cvc5Error(RuntimeError):
    """A provenance, encoding, solver, or artifact contract failed."""


@dataclass(frozen=True)
class UniqueSystem:
    system_id: str
    system: Mapping[str, Any]
    prior_z3_status: str
    source_leaves: tuple[Mapping[str, Any], ...]


def _sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _canonical_sha256(value: Any) -> str:
    return z3_driver._sha256_value(value)


def _with_record_hash(
    unsigned: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    payload = {**unsigned, "previous_record_sha256": previous}
    return {**payload, "record_sha256": _canonical_sha256(payload)}


def _write_jsonl(path: Path, records: Sequence[Mapping[str, Any]]) -> None:
    data = b"".join(z3_driver._canonical_bytes(record) + b"\n" for record in records)
    z3_driver._atomic_bytes(path, data)


def _status_counts(statuses: Sequence[str]) -> dict[str, int]:
    counts = Counter(statuses)
    return {status: counts[status] for status in BACKEND_STATUSES}


def _direct_system_id(system: Mapping[str, Any]) -> str:
    identity = json.dumps(
        {
            "n": system["n"],
            "order": system["order"],
            "rows": system["rows"],
        },
        sort_keys=True,
        separators=(",", ":"),
    )
    return f"direct-metric-rows-{hashlib.sha256(identity.encode()).hexdigest()[:20]}"


def _validate_source_manifest(source_dir: Path) -> dict[str, Any]:
    manifest = z3_driver._strict_json(source_dir / "manifest.json")
    unsigned = dict(manifest)
    claimed = unsigned.pop("manifest_sha256", None)
    if claimed != _canonical_sha256(unsigned):
        raise Phase3Cvc5Error("source manifest canonical hash does not replay")
    if manifest.get("schema") != z3_driver.SCHEMA:
        raise Phase3Cvc5Error("source manifest has the wrong schema")
    configuration = manifest.get("configuration")
    if not isinstance(configuration, dict) or configuration.get("cell") != {
        "exact": True,
        "k": 4,
        "n": 10,
        "profile": [4, 4, 5],
    }:
        raise Phase3Cvc5Error("source manifest has the wrong Phase-3 cell")
    if (
        configuration.get("mode") != "cap+blocker-annotated"
        or configuration.get("metric_row_exact") is not False
        or configuration.get("order_count_per_survivor") != 24
    ):
        raise Phase3Cvc5Error("source manifest has the wrong metric/order semantics")
    counts = manifest.get("counts")
    if not isinstance(counts, dict) or (
        counts.get("source_survivor_count"),
        counts.get("cap_order_leaf_count"),
    ) != (EXPECTED_SOURCE_RECORDS, EXPECTED_SOURCE_LEAVES):
        raise Phase3Cvc5Error("source manifest has the wrong record/leaf counts")
    for stage in (
        "equality_only_metric_core",
        "exact_metric",
        "convexity_order",
    ):
        stage_counts = counts.get(stage)
        if (
            not isinstance(stage_counts, dict)
            or stage_counts.get("SAT", 0) != 0
            or stage_counts.get("ERROR", 0) != 0
        ):
            raise Phase3Cvc5Error(f"source {stage} is not a fail-closed census")
    if (
        counts["convexity_order"].get("UNSAT", 0)
        + counts["convexity_order"].get("UNKNOWN", 0)
        != EXPECTED_SOURCE_LEAVES
    ):
        raise Phase3Cvc5Error("source ordered-stage counts do not cover all leaves")

    artifacts = manifest.get("artifacts")
    if not isinstance(artifacts, dict):
        raise Phase3Cvc5Error("source manifest lacks artifact hashes")
    for name in ("results.jsonl", "source-manifest.json"):
        entry = artifacts.get(name)
        if not isinstance(entry, dict) or entry.get("sha256") != _sha256_file(
            source_dir / name
        ):
            raise Phase3Cvc5Error(f"source artifact hash mismatch: {name}")
    dependency_hashes = configuration.get("dependency_sha256")
    if not isinstance(dependency_hashes, dict):
        raise Phase3Cvc5Error("source manifest lacks dependency provenance")
    for relative, expected in dependency_hashes.items():
        if (
            not isinstance(relative, str)
            or not isinstance(expected, str)
            or _sha256_file(ROOT / relative) != expected
        ):
            raise Phase3Cvc5Error(
                f"current dependency does not match source: {relative!r}"
            )
    return manifest


def load_unique_systems(
    source_dir: Path = DEFAULT_SOURCE,
) -> tuple[dict[str, Any], tuple[UniqueSystem, ...]]:
    """Replay 100 result records and deduplicate all 2,400 ordered leaves."""

    manifest = _validate_source_manifest(source_dir)
    source_metadata = manifest.get("source")
    if not isinstance(source_metadata, dict):
        raise Phase3Cvc5Error("source manifest lacks structural source metadata")
    structural_dir = Path(str(source_metadata.get("directory", "")))
    if not structural_dir.is_absolute():
        structural_dir = ROOT / structural_dir
    structural_manifest, structural_cases = z3_driver.load_source(
        structural_dir, expected_count=EXPECTED_SOURCE_RECORDS
    )
    if (
        source_metadata.get("manifest_canonical_sha256")
        != structural_manifest["manifest_sha256"]
        or source_metadata.get("manifest_file_sha256")
        != _sha256_file(structural_dir / "manifest.json")
        or source_metadata.get("survivors_sha256")
        != _sha256_file(structural_dir / "survivors.jsonl")
        or (source_dir / "source-manifest.json").read_bytes()
        != (structural_dir / "manifest.json").read_bytes()
    ):
        raise Phase3Cvc5Error("structural source provenance does not replay")

    records = z3_driver._strict_jsonl(source_dir / "results.jsonl")
    if len(records) != EXPECTED_SOURCE_RECORDS:
        raise Phase3Cvc5Error("source result record count mismatch")

    systems: dict[str, dict[str, Any]] = {}
    leaves: dict[str, list[dict[str, Any]]] = {}
    statuses: dict[str, set[str]] = {}
    previous: str | None = None
    covered_leaves = 0
    for index, (record, structural_case) in enumerate(
        zip(records, structural_cases, strict=True)
    ):
        if set(record) != Z3_RESULT_KEYS:
            raise Phase3Cvc5Error(f"source result {index} has the wrong keys")
        unsigned = dict(record)
        claimed = unsigned.pop("record_sha256")
        if (
            claimed != _canonical_sha256(unsigned)
            or record["previous_record_sha256"] != previous
        ):
            raise Phase3Cvc5Error(f"source result hash chain failed at {index}")
        previous = str(claimed)
        if (
            record.get("schema") != z3_driver.RESULT_SCHEMA
            or record.get("index") != index
            or record.get("source_record") != structural_case.source_record
            or record.get("source_record_sha256")
            != structural_case.source_record["record_sha256"]
        ):
            raise Phase3Cvc5Error(f"source/result join failed at {index}")
        order_results = record.get("convexity_order")
        if (
            not isinstance(order_results, dict)
            or order_results.get("order_count") != 24
            or not isinstance(order_results.get("results"), list)
            or len(order_results["results"]) != 24
        ):
            raise Phase3Cvc5Error(f"source result {index} lacks 24 order leaves")
        expected_orders = {
            order.order_id: list(order.order) for order in structural_case.orders
        }
        seen_order_ids: set[str] = set()
        for leaf in order_results["results"]:
            if not isinstance(leaf, dict) or set(leaf) != Z3_ORDER_RESULT_KEYS:
                raise Phase3Cvc5Error(f"source order leaf {index} has wrong keys")
            order_id = leaf.get("order_id")
            if (
                not isinstance(order_id, str)
                or order_id in seen_order_ids
                or expected_orders.get(order_id) != leaf.get("order")
            ):
                raise Phase3Cvc5Error(f"source order leaf {index} order mismatch")
            seen_order_ids.add(order_id)
            backend = leaf.get("backend_result")
            if not isinstance(backend, dict) or leaf.get(
                "raw_result_sha256"
            ) != _canonical_sha256(backend):
                raise Phase3Cvc5Error(
                    f"source order leaf {index}/{order_id} backend hash failed"
                )
            status = leaf.get("status")
            rows = backend.get("rows")
            order = backend.get("order")
            system_id = backend.get("system_id")
            if (
                status not in {"UNSAT", "UNKNOWN"}
                or backend.get("status") != status
                or backend.get("schema") != metric.DIRECT_ROWS_SCHEMA
                or backend.get("n") != 10
                or backend.get("input_kind") != "caller-supplied-metric-rows"
                or backend.get("exact_row_count") != 0
                or rows != structural_case.source_record["metric_rows"]
                or order != leaf["order"]
                or not isinstance(system_id, str)
                or any(row.get("exact") is not False for row in rows)
            ):
                raise Phase3Cvc5Error(
                    f"source order leaf {index}/{order_id} semantics failed"
                )
            system = {
                "system_id": system_id,
                "n": 10,
                "profile": [4, 4, 5],
                "order": order,
                "rows": rows,
            }
            if _direct_system_id(system) != system_id:
                raise Phase3Cvc5Error(
                    f"source order leaf {index}/{order_id} system ID failed"
                )
            existing = systems.setdefault(system_id, system)
            if existing != system:
                raise Phase3Cvc5Error(f"system-ID collision at {system_id}")
            statuses.setdefault(system_id, set()).add(str(status))
            leaves.setdefault(system_id, []).append(
                {
                    "survivor_index": index,
                    "order_id": order_id,
                    "source_assignment_sha256": structural_case.source_record[
                        "assignment_sha256"
                    ],
                    "source_metric_rows_sha256": structural_case.source_record[
                        "metric_rows_sha256"
                    ],
                    "source_record_sha256": structural_case.source_record[
                        "record_sha256"
                    ],
                    "z3_result_record_sha256": record["record_sha256"],
                    "prior_z3_status": status,
                    "prior_backend_result_sha256": leaf["raw_result_sha256"],
                }
            )
            covered_leaves += 1

    if (
        covered_leaves != EXPECTED_SOURCE_LEAVES
        or len(systems) != EXPECTED_UNIQUE_SYSTEMS
        or len({_canonical_sha256(system["rows"]) for system in systems.values()})
        != EXPECTED_UNIQUE_ROWS
    ):
        raise Phase3Cvc5Error("source deduplication cardinality mismatch")
    if any(len(status_set) != 1 for status_set in statuses.values()):
        raise Phase3Cvc5Error("one semantic system has inconsistent prior Z3 statuses")

    unique = tuple(
        UniqueSystem(
            system_id=system_id,
            system=systems[system_id],
            prior_z3_status=next(iter(statuses[system_id])),
            source_leaves=tuple(
                sorted(
                    leaves[system_id],
                    key=lambda leaf: (
                        leaf["survivor_index"],
                        leaf["order_id"],
                    ),
                )
            ),
        )
        for system_id in sorted(systems)
    )
    return manifest, unique


def _resolve_cvc5(command: str) -> str:
    found = shutil.which(command)
    candidate = Path(found or command)
    if not candidate.is_file() or not os.access(candidate, os.X_OK):
        raise Phase3Cvc5Error(f"cvc5 executable not found: {command}")
    return str(candidate.resolve())


def _command(cvc5: str, timeout_s: float) -> list[str]:
    timeout_ms = max(1, int(timeout_s * 1000))
    return [
        cvc5,
        "--lang=smt2",
        "--nl-cov",
        f"--tlimit={timeout_ms}",
        "-",
    ]


def _query_backend(
    cvc5: str, system: Mapping[str, Any], timeout_s: float
) -> Mapping[str, Any]:
    return cvc5_backend._run_query(
        cvc5=cvc5,
        system=system,
        stage=STAGE,
        timeout_s=timeout_s,
    )


def _smoke_backend(cvc5: str, timeout_s: float) -> Mapping[str, Any]:
    return cvc5_backend.run_smoke(cvc5, timeout_s)


def _version_backend(cvc5: str) -> str:
    return cvc5_backend._cvc5_version(cvc5)


def _is_timeout(result: Mapping[str, Any]) -> bool:
    reason = str(result.get("reason", ""))
    return "timeout" in reason.lower() or cvc5_backend._is_timeout_diagnostic(reason)


def _normalize_backend(
    raw: Any, *, expected_counts: Mapping[str, int]
) -> dict[str, Any]:
    if not isinstance(raw, Mapping):
        backend: dict[str, Any] = {}
        status = "ERROR"
        diagnostic = "backend returned a non-object"
    else:
        backend = dict(raw)
        status = backend.get("status")
        diagnostic = str(backend.get("reason", f"CVC5_{status}"))
        if (
            status not in BACKEND_STATUSES
            or backend.get("stage") != STAGE
            or backend.get("constraint_counts") != expected_counts
        ):
            status = "ERROR"
            diagnostic = "backend result violates the cvc5 query contract"
    classification = {
        "UNSAT": "CVC5_UNSAT_NOT_KERNEL_CHECKED",
        "SAT": "SAT_UNVERIFIED_NO_VERDICT",
        "UNKNOWN": "UNKNOWN_NO_VERDICT",
        "ERROR": "ERROR_NO_VERDICT",
    }[str(status)]
    return {
        "status": status,
        "classification": classification,
        "confirmed_exclusion": status == "UNSAT",
        "confirmed_realization": False,
        "sat_candidate_unverified": status == "SAT",
        "timeout": _is_timeout(backend) if backend else False,
        "diagnostic": (
            "TRUSTED_CVC5_UNSAT_NOT_LEAN_CLOSURE" if status == "UNSAT" else diagnostic
        ),
        "raw_result_sha256": _canonical_sha256(backend) if backend else None,
        "backend_result": backend or None,
    }


def _run_one(
    index: int,
    system_record: Mapping[str, Any],
    cvc5: str,
    timeout_s: float,
    runner: QueryRunner,
) -> tuple[int, dict[str, Any]]:
    try:
        raw = runner(cvc5, system_record["system"], timeout_s)
    except Exception as exc:  # noqa: BLE001 - solver boundary fails closed.
        raw = {
            "stage": STAGE,
            "status": "ERROR",
            "reason": f"{type(exc).__name__}: {exc}",
            "constraint_counts": system_record["constraint_counts"],
        }
    return index, _normalize_backend(
        raw, expected_counts=system_record["constraint_counts"]
    )


def _run_tasks(
    system_records: Sequence[Mapping[str, Any]],
    *,
    cvc5: str,
    workers: int,
    timeout_s: float,
    runner: QueryRunner,
) -> dict[int, dict[str, Any]]:
    if workers == 1:
        return {
            index: result
            for index, result in (
                _run_one(index, record, cvc5, timeout_s, runner)
                for index, record in enumerate(system_records)
            )
        }
    if runner is not _query_backend:
        raise Phase3Cvc5Error("custom query runners are supported only with workers=1")
    results: dict[int, dict[str, Any]] = {}
    with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                _run_one,
                index,
                record,
                cvc5,
                timeout_s,
                _query_backend,
            ): index
            for index, record in enumerate(system_records)
        }
        for future in concurrent.futures.as_completed(futures):
            index = futures[future]
            try:
                result_index, result = future.result()
            except Exception as exc:  # noqa: BLE001 - worker boundary fails closed.
                result_index = index
                result = _normalize_backend(
                    {
                        "stage": STAGE,
                        "status": "ERROR",
                        "reason": f"{type(exc).__name__}: {exc}",
                        "constraint_counts": system_records[index]["constraint_counts"],
                    },
                    expected_counts=system_records[index]["constraint_counts"],
                )
            results[result_index] = result
    if len(results) != len(system_records):
        raise Phase3Cvc5Error("cvc5 task result count mismatch")
    return results


def run_driver(
    *,
    source_dir: Path,
    out_dir: Path,
    cvc5: str,
    workers: int,
    timeout_s: float,
    query_runner: QueryRunner = _query_backend,
    smoke_runner: SmokeRunner = _smoke_backend,
    version_runner: VersionRunner = _version_backend,
) -> dict[str, Any]:
    """Run and publish one complete 48-system cvc5 census."""

    if type(workers) is not int or not 1 <= workers <= MAX_WORKERS:
        raise ValueError(f"workers must be in 1..{MAX_WORKERS}")
    if (
        isinstance(timeout_s, bool)
        or not isinstance(timeout_s, (int, float))
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise ValueError("timeout_s must be finite and positive")
    if out_dir.exists() and any(out_dir.iterdir()):
        raise Phase3Cvc5Error("refusing to overwrite a nonempty output directory")

    source_manifest, unique_systems = load_unique_systems(source_dir)
    resolved_cvc5 = _resolve_cvc5(cvc5)
    version = version_runner(resolved_cvc5)
    if not isinstance(version, str) or not version.strip():
        raise Phase3Cvc5Error("cvc5 version probe returned no version")
    smoke_timeout = min(max(float(timeout_s), 10.0), 60.0)
    smoke = dict(smoke_runner(resolved_cvc5, smoke_timeout))
    if smoke.get("passed") is not True:
        raise Phase3Cvc5Error("cvc5 smoke gate failed")

    out_dir.mkdir(parents=True, exist_ok=True)
    system_records: list[dict[str, Any]] = []
    query_entries: list[dict[str, Any]] = []
    previous: str | None = None
    command = _command(resolved_cvc5, float(timeout_s))
    for index, item in enumerate(unique_systems):
        smt2, counts = cvc5_backend.build_smt2(item.system, STAGE)
        required_counts = {
            "convex_order": 80,
            "distinctness": 45,
            "row_equalities": 30,
            "selected_rows": 10,
            "total": 155,
        }
        if counts != required_counts or "(exact_exclusions" in smt2:
            raise Phase3Cvc5Error(
                f"system {item.system_id} has the wrong faithful encoding"
            )
        query_path = Path("queries") / f"{index:02d}-{item.system_id}.full-convex.smt2"
        query_bytes = smt2.encode()
        z3_driver._atomic_bytes(out_dir / query_path, query_bytes)
        query_sha256 = hashlib.sha256(query_bytes).hexdigest()
        unsigned = {
            "schema": SYSTEM_SCHEMA,
            "index": index,
            "system_id": item.system_id,
            "semantic_sha256": _canonical_sha256(item.system),
            "system": dict(item.system),
            "prior_z3_status": item.prior_z3_status,
            "source_leaf_count": len(item.source_leaves),
            "source_leaves": list(item.source_leaves),
            "constraint_counts": counts,
            "query_path": str(query_path),
            "query_sha256": query_sha256,
            "command": command,
        }
        record = _with_record_hash(unsigned, previous)
        system_records.append(record)
        previous = str(record["record_sha256"])
        query_entries.append(
            {
                "path": str(query_path),
                "sha256": query_sha256,
                "bytes": len(query_bytes),
                "system_id": item.system_id,
            }
        )
    _write_jsonl(out_dir / "systems.jsonl", system_records)
    query_manifest = {
        "count": len(query_entries),
        "entries": query_entries,
        "entries_sha256": _canonical_sha256(query_entries),
    }
    z3_driver._atomic_json(out_dir / "queries-manifest.json", query_manifest)

    started = time.monotonic()
    normalized_results = _run_tasks(
        system_records,
        cvc5=resolved_cvc5,
        workers=workers,
        timeout_s=float(timeout_s),
        runner=query_runner,
    )
    wall_elapsed = round(time.monotonic() - started, 6)

    result_records: list[dict[str, Any]] = []
    log_entries: list[dict[str, Any]] = []
    previous = None
    for index, system_record in enumerate(system_records):
        result = normalized_results[index]
        log_path = (
            Path("logs") / f"{index:02d}-{system_record['system_id']}.full-convex.json"
        )
        log = {
            "system_id": system_record["system_id"],
            "command": system_record["command"],
            "query_path": system_record["query_path"],
            "query_sha256": system_record["query_sha256"],
            "result": result,
        }
        z3_driver._atomic_json(out_dir / log_path, log)
        log_sha256 = _sha256_file(out_dir / log_path)
        log_entries.append(
            {
                "path": str(log_path),
                "sha256": log_sha256,
                "system_id": system_record["system_id"],
            }
        )
        unsigned = {
            "schema": RESULT_SCHEMA,
            "index": index,
            "system_id": system_record["system_id"],
            "system_record": system_record,
            "system_record_sha256": system_record["record_sha256"],
            "cvc5": result,
            "log_path": str(log_path),
            "log_sha256": log_sha256,
            "trust": {
                "unsat": (
                    "independent cvc5 nonlinear-covering evidence for this "
                    "encoded ordered row system; not Lean closure"
                ),
                "sat": (
                    "unverified candidate because no independent cvc5 model "
                    "replay is available; no verdict"
                ),
                "unknown_error": "no verdict",
                "lean": "NOT_LANDED",
            },
        }
        record = _with_record_hash(unsigned, previous)
        result_records.append(record)
        previous = str(record["record_sha256"])
    _write_jsonl(out_dir / "results.jsonl", result_records)
    logs_manifest = {
        "count": len(log_entries),
        "entries": log_entries,
        "entries_sha256": _canonical_sha256(log_entries),
    }
    z3_driver._atomic_json(out_dir / "logs-manifest.json", logs_manifest)
    z3_driver._atomic_bytes(
        out_dir / "source-manifest.json",
        (source_dir / "manifest.json").read_bytes(),
    )

    statuses = [str(record["cvc5"]["status"]) for record in result_records]
    classifications = Counter(
        str(record["cvc5"]["classification"]) for record in result_records
    )
    prior_statuses = Counter(
        str(record["system_record"]["prior_z3_status"]) for record in result_records
    )
    timeout_count = sum(bool(record["cvc5"]["timeout"]) for record in result_records)
    solver_elapsed = round(
        sum(
            float((record["cvc5"]["backend_result"] or {}).get("elapsed_sec", 0.0))
            for record in result_records
        ),
        6,
    )
    unsigned_manifest = {
        "schema": SCHEMA,
        "generated_at": datetime.now(UTC).isoformat(),
        "configuration": {
            "cell": {"exact": True, "k": 4, "n": 10, "profile": [4, 4, 5]},
            "metric_row_exact": False,
            "stage": STAGE,
            "cvc5": resolved_cvc5,
            "cvc5_version": version,
            "cvc5_sha256": _sha256_file(Path(resolved_cvc5)),
            "workers": workers,
            "timeout_seconds_per_query": float(timeout_s),
            "smoke_timeout_seconds": smoke_timeout,
            "command": command,
            "forbidden_geometry": [
                "blocker geometry",
                "off-support disequalities",
                "invented row facts",
            ],
            "dependency_sha256": {
                relative: _sha256_file(ROOT / relative)
                for relative in (
                    *DEPENDENCIES,
                    "census/p97_search/phase3_survivor_cvc5_driver.py",
                )
            },
        },
        "source": {
            "directory": str(source_dir.resolve()),
            "manifest_file_sha256": _sha256_file(source_dir / "manifest.json"),
            "manifest_canonical_sha256": source_manifest["manifest_sha256"],
            "results_sha256": _sha256_file(source_dir / "results.jsonl"),
            "source_manifest": source_manifest,
        },
        "selection": {
            "unique_system_count": len(unique_systems),
            "system_id_sha256": cvc5_backend._id_digest(
                item.system_id for item in unique_systems
            ),
            "unique_metric_row_count": len(
                {_canonical_sha256(item.system["rows"]) for item in unique_systems}
            ),
            "attached_source_leaf_count": sum(
                len(item.source_leaves) for item in unique_systems
            ),
            "prior_z3_status_counts": dict(sorted(prior_statuses.items())),
        },
        "smoke": smoke,
        "counts": {
            "system_count": len(result_records),
            "status": _status_counts(statuses),
            "classification": dict(sorted(classifications.items())),
            "timeout_count": timeout_count,
        },
        "timing": {
            "wall_elapsed_seconds": wall_elapsed,
            "summed_solver_elapsed_seconds": solver_elapsed,
        },
        "artifacts": {
            name: {"sha256": _sha256_file(out_dir / name)}
            for name in (
                "systems.jsonl",
                "results.jsonl",
                "queries-manifest.json",
                "logs-manifest.json",
                "source-manifest.json",
            )
        },
        "result_claim": (
            "independent cvc5 --nl-cov screening of exactly 48 deduplicated "
            "ordered equality-row systems"
        ),
        "trust_boundary": {
            "cvc5_unsat": (
                "trusted independent solver evidence for the exact SMT2 query; "
                "not Lean or kernel-checked closure"
            ),
            "cvc5_sat": (
                "unverified candidate without independent model replay; no verdict"
            ),
            "unknown_error": "no verdict",
            "structural_survivor": "not a Euclidean or Problem 97 witness",
            "lean": "NOT_LANDED",
        },
    }
    manifest = {
        **unsigned_manifest,
        "manifest_sha256": _canonical_sha256(unsigned_manifest),
    }
    z3_driver._atomic_json(out_dir / "manifest.json", manifest)
    return manifest


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument(
        "--cvc5", default=shutil.which("cvc5") or "/Users/adam/bin/cvc5"
    )
    parser.add_argument(
        "--workers",
        type=int,
        default=min(MAX_WORKERS, os.cpu_count() or 1),
    )
    parser.add_argument("--timeout", type=float, default=120.0)
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        manifest = run_driver(
            source_dir=args.source,
            out_dir=args.out,
            cvc5=args.cvc5,
            workers=args.workers,
            timeout_s=args.timeout,
        )
    except (OSError, ValueError, Phase3Cvc5Error) as exc:
        print(f"phase3 survivor cvc5 driver failed: {exc}")
        return 2
    print(json.dumps(manifest["counts"], sort_keys=True))
    return 0 if manifest["counts"]["status"]["ERROR"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
