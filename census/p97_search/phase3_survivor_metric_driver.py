"""Fail-closed metric screening of Phase-3 structural CEGAR survivors.

The input records are exact ``k=4, n=10, profile=(4,4,5)`` cap+blocker SAT
assignments for which the order-independent structural detector returned no
core.  That status is only ``STRUCTURALLY_UNRESOLVED``.  This driver preserves
each complete source record and reports three logically separate stages:

* the current order-independent formalized metric-core detector;
* unordered exact QF_NRA metric feasibility (row equalities, exact-row
  exclusions, and ambient distinctness); and
* all 24 cap-compatible strict-convex cyclic orders.

SAT ``Cell.exact`` still means exactly four selected support labels, not an
exact metric radius class.  Every translated ``MetricRow`` therefore remains
``exact=False``.  Solver answers are trusted computations, never Lean closure.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import math
import os
import tempfile
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from census.global_confinement import metric_realizability_probe as metric
from census.p97_search import phase3_structural_cegar as structural
from census.p97_search import realize

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_SOURCE = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_10000_20260729"
)
DEFAULT_OUT = (
    ROOT / "scratch/p97-distinct-distance-lane" / "phase3_survivor_metric_100_20260729"
)
SCHEMA = "p97-phase3-survivor-metric-v1"
RESULT_SCHEMA = "p97-phase3-survivor-metric-result-v1"
EXPECTED_SOURCE_COUNT = 100
ORDER_COUNT = 24
MAX_WORKERS = 24
DEFAULT_PIQD_SERVER = "http://127.0.0.1:7272"
SOLVER_ROUTES = ("piqd", "legacy-local-z3")
RUNNING_SNAPSHOT_SCOPE = "immutable-running-partial-survivor-snapshot"
SURVIVOR_LIMIT_SCOPE = "survivor-limit-checkpoint"
STATUSES = ("SAT", "UNSAT", "UNKNOWN", "ERROR")
SOURCE_RECORD_KEYS = frozenset(
    {
        "assignment_sha256",
        "blocking_clause",
        "classification",
        "index",
        "metric_rows",
        "metric_rows_sha256",
        "previous_record_sha256",
        "raw_sat_index",
        "record_sha256",
        "schema",
        "semantic_assignment",
        "trust",
    }
)
SOURCE_DEPENDENCIES = (
    "census/global_confinement/metric_realizability_probe.py",
    "census/p97_search/phase3_structural_cegar.py",
    "census/p97_search/realize.py",
    "census/p97_search/sat_generate.py",
)

ExactRunner = Callable[[Mapping[str, Any], float], Mapping[str, Any]]
ConvexRunner = Callable[
    [int, Sequence[metric.MetricRow], Sequence[int], float],
    Mapping[str, Any],
]


class SurvivorMetricError(RuntimeError):
    """A source-ingress, replay, staging, or artifact-contract failure."""


@dataclass(frozen=True)
class SurvivorCase:
    index: int
    source_record: Mapping[str, Any]
    rows: tuple[metric.MetricRow, ...]
    canonical_digest: str
    orders: tuple[realize.OrderSpec, ...]


def _survivor_case_replay_identity(case: SurvivorCase) -> bytes:
    """Canonical identity independent of the module name owning the dataclass."""

    return _canonical_bytes(
        {
            "canonical_digest": case.canonical_digest,
            "index": case.index,
            "orders": [
                {"order": list(order.order), "order_id": order.order_id}
                for order in case.orders
            ],
            "rows": [row.as_dict() for row in case.rows],
            "source_record": case.source_record,
        }
    )


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _portable_source_reference(path: Path) -> str:
    resolved = path.resolve()
    try:
        return str(resolved.relative_to(ROOT))
    except ValueError:
        return str(resolved)


def _object_without_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _strict_json(path: Path) -> dict[str, Any]:
    if not path.is_file():
        raise SurvivorMetricError(f"missing required source artifact {path}")
    try:
        value = json.loads(
            path.read_text(encoding="utf-8"),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_object_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise SurvivorMetricError(f"invalid JSON in {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise SurvivorMetricError(f"{path} is not a JSON object")
    return value


def _strict_jsonl(path: Path) -> list[dict[str, Any]]:
    if not path.is_file():
        raise SurvivorMetricError(f"missing required source artifact {path}")
    records: list[dict[str, Any]] = []
    for line_number, raw in enumerate(path.read_bytes().splitlines(), start=1):
        if not raw.strip():
            raise SurvivorMetricError(f"{path}:{line_number}: blank JSONL line")
        try:
            value = json.loads(
                raw,
                parse_constant=lambda token: (_ for _ in ()).throw(
                    ValueError(f"invalid JSON constant {token}")
                ),
                object_pairs_hook=_object_without_duplicate_keys,
            )
        except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
            raise SurvivorMetricError(
                f"{path}:{line_number}: invalid JSON: {exc}"
            ) from exc
        if not isinstance(value, dict):
            raise SurvivorMetricError(f"{path}:{line_number}: expected object")
        records.append(value)
    return records


def _atomic_bytes(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    except BaseException:
        try:
            os.remove(temporary)
        except OSError:
            pass
        raise


def _atomic_json(path: Path, value: Any) -> None:
    _atomic_bytes(path, json.dumps(value, indent=2, sort_keys=True).encode() + b"\n")


def _immutable_bytes(path: Path, data: bytes) -> None:
    """Create one output artifact without following or replacing a target."""

    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(path, flags, 0o600)
    try:
        view = memoryview(data)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise SurvivorMetricError(f"short immutable write for {path.name}")
            view = view[written:]
        os.fsync(descriptor)
    except BaseException:
        try:
            os.unlink(path)
        except OSError:
            pass
        raise
    finally:
        os.close(descriptor)


def _immutable_json(path: Path, value: Any) -> None:
    _immutable_bytes(path, json.dumps(value, indent=2, sort_keys=True).encode() + b"\n")


def _status_counts(values: Sequence[str]) -> dict[str, int]:
    counts = Counter(values)
    return {status: counts[status] for status in STATUSES}


def _source_manifest_path(source_dir: Path, *, running_snapshot: bool) -> Path:
    manifest_path = source_dir / "manifest.json"
    if running_snapshot and not manifest_path.is_file():
        live_manifest_path = source_dir / "live-manifest.json"
        if live_manifest_path.is_file():
            return live_manifest_path
    return manifest_path


def _validate_source_manifest(
    source_dir: Path, *, expected_count: int, running_snapshot: bool
) -> dict[str, Any]:
    manifest_path = _source_manifest_path(source_dir, running_snapshot=running_snapshot)
    manifest = _strict_json(manifest_path)
    claimed_manifest_hash = manifest.get("manifest_sha256")
    unsigned_manifest = dict(manifest)
    unsigned_manifest.pop("manifest_sha256", None)
    if claimed_manifest_hash != _sha256_value(unsigned_manifest):
        raise SurvivorMetricError("source manifest canonical hash does not replay")
    if manifest.get("schema") != structural.SCHEMA:
        raise SurvivorMetricError("source manifest has wrong schema")
    expected_status = "RUNNING" if running_snapshot else "SURVIVOR_LIMIT"
    if manifest.get("status") != expected_status:
        raise SurvivorMetricError(f"source manifest status is not {expected_status!r}")
    configuration = manifest.get("configuration")
    if not isinstance(configuration, dict) or configuration.get("cell") != {
        "exact": True,
        "k": 4,
        "n": 10,
        "profile": [4, 4, 5],
    }:
        raise SurvivorMetricError("source manifest has the wrong exact Phase-3 cell")
    if configuration.get("mode") != "cap+blocker-annotated":
        raise SurvivorMetricError("source manifest has the wrong annotation mode")
    counts = manifest.get("counts")
    if (
        not isinstance(counts, dict)
        or counts.get("structural_survivor_count") != expected_count
    ):
        raise SurvivorMetricError("source manifest survivor counts do not match")
    if not running_snapshot and counts.get("unclassified_raw_sat_count") != 0:
        raise SurvivorMetricError("source manifest survivor counts do not match")

    artifact_hashes = manifest.get("artifact_hashes")
    if not isinstance(artifact_hashes, dict):
        raise SurvivorMetricError("source manifest lacks artifact hashes")
    hashes_to_replay = (
        {"survivors.jsonl": artifact_hashes.get("survivors.jsonl")}
        if running_snapshot
        else artifact_hashes
    )
    for name, expected_hash in hashes_to_replay.items():
        if (
            not isinstance(name, str)
            or not isinstance(expected_hash, str)
            or _sha256_file(source_dir / name) != expected_hash
        ):
            raise SurvivorMetricError(f"source artifact hash mismatch for {name!r}")

    dependency_hashes = configuration.get("dependency_sha256")
    if not isinstance(dependency_hashes, dict):
        raise SurvivorMetricError("source manifest lacks dependency hashes")
    for relative in SOURCE_DEPENDENCIES:
        expected_hash = dependency_hashes.get(relative)
        if expected_hash != _sha256_file(ROOT / relative):
            raise SurvivorMetricError(
                f"current dependency does not match source provenance: {relative}"
            )
    return manifest


def _validate_source_record(
    record: Mapping[str, Any],
    *,
    expected_index: int,
    previous_record_sha256: str | None,
    encoding: Any,
) -> SurvivorCase:
    if set(record) != SOURCE_RECORD_KEYS:
        raise SurvivorMetricError(f"source survivor {expected_index} has wrong keys")
    try:
        structural._validate_record_hash(
            record,
            previous_record_sha256,
            where=f"source survivor {expected_index}",
        )
    except Exception as exc:
        raise SurvivorMetricError(f"source hash-chain replay failed: {exc}") from exc
    if (
        record.get("schema") != structural.SURVIVOR_SCHEMA
        or record.get("classification") != "STRUCTURALLY_UNRESOLVED"
        or record.get("index") != expected_index
        or record.get("trust")
        != "order-independent detector returned none; not Euclidean or P97-realizable"
    ):
        raise SurvivorMetricError(f"source survivor {expected_index} is malformed")
    if type(record.get("raw_sat_index")) is not int or record["raw_sat_index"] < 0:
        raise SurvivorMetricError(f"source survivor {expected_index} has bad SAT index")
    try:
        assignment = encoding.assignment_from_record(record)
        decoded = encoding.decode(assignment)
        rows = structural._metric_rows(decoded)
    except Exception as exc:
        raise SurvivorMetricError(
            f"source survivor {expected_index} decode/revalidation failed: {exc}"
        ) from exc
    semantic = encoding.semantic_record(assignment)
    blocking_clause = list(encoding.blocking_clause(assignment))
    rows_json = [row.as_dict() for row in rows]
    if (
        record["semantic_assignment"] != semantic
        or record["assignment_sha256"]
        != structural._assignment_hash(encoding, assignment)
        or record["blocking_clause"] != blocking_clause
        or record["metric_rows"] != rows_json
        or record["metric_rows_sha256"] != _sha256_value(rows_json)
    ):
        raise SurvivorMetricError(
            f"source survivor {expected_index} provenance does not replay"
        )
    try:
        orders = realize.cap_orders(decoded)
        canonical_digest = realize._canonical_digest(decoded)
    except Exception as exc:
        raise SurvivorMetricError(
            f"source survivor {expected_index} order construction failed: {exc}"
        ) from exc
    if len(orders) != ORDER_COUNT:
        raise SurvivorMetricError(
            f"source survivor {expected_index} does not have 24 cap orders"
        )
    return SurvivorCase(
        index=expected_index,
        source_record=dict(record),
        rows=rows,
        canonical_digest=canonical_digest,
        orders=orders,
    )


def load_source(
    source_dir: Path,
    *,
    expected_count: int = EXPECTED_SOURCE_COUNT,
    running_snapshot: bool = False,
) -> tuple[dict[str, Any], tuple[SurvivorCase, ...]]:
    """Replay the source manifest, artifacts, assignments, rows, and hash chain."""

    if type(expected_count) is not int or expected_count <= 0:
        raise ValueError("expected_count must be a positive integer")
    manifest = _validate_source_manifest(
        source_dir,
        expected_count=expected_count,
        running_snapshot=running_snapshot,
    )
    records = _strict_jsonl(source_dir / "survivors.jsonl")
    if len(records) != expected_count:
        raise SurvivorMetricError(
            f"expected {expected_count} source survivors, found {len(records)}"
        )
    encoding = structural.sat.SatEncoding(structural.CELL, cap=True, blocker=True)
    cases: list[SurvivorCase] = []
    previous: str | None = None
    raw_sat_indices: set[int] = set()
    for index, record in enumerate(records):
        case = _validate_source_record(
            record,
            expected_index=index,
            previous_record_sha256=previous,
            encoding=encoding,
        )
        try:
            detection = structural._detection(case.rows)
        except Exception as exc:
            raise SurvivorMetricError(
                f"source survivor {index} detector replay failed: {exc}"
            ) from exc
        if detection is not None:
            raise SurvivorMetricError(
                f"source survivor {index} is no longer structurally unresolved"
            )
        raw_sat_index = int(record["raw_sat_index"])
        if raw_sat_index in raw_sat_indices:
            raise SurvivorMetricError("source survivors repeat a raw SAT index")
        raw_sat_indices.add(raw_sat_index)
        cases.append(case)
        previous = str(record["record_sha256"])
    return manifest, tuple(cases)


def classify_equality_only(rows: Sequence[metric.MetricRow]) -> dict[str, Any]:
    """Run the incomplete formalized core detector without overstating no-hit."""

    try:
        detection = structural._detection(rows)
    except Exception as exc:  # noqa: BLE001 - detector boundary fails closed.
        return {
            "stage": "equality-only-formalized-core",
            "status": "ERROR",
            "diagnostic": f"{type(exc).__name__}: {exc}",
            "detection": None,
        }
    if detection is None:
        return {
            "stage": "equality-only-formalized-core",
            "status": "UNKNOWN",
            "diagnostic": "NO_FORMALIZED_CORE_FOUND_INCOMPLETE_DETECTOR",
            "detection": None,
        }
    return {
        "stage": "equality-only-formalized-core",
        "status": "UNSAT",
        "diagnostic": "FORMALIZED_CORE_DETECTED_NOT_KERNEL_LANDED_HERE",
        "detection": detection,
    }


def _exact_metric_backend(
    system: Mapping[str, Any], timeout_s: float
) -> Mapping[str, Any]:
    return metric._exact_metric_unsat_core(system, timeout_s)


def _convex_order_backend(
    n: int,
    rows: Sequence[metric.MetricRow],
    order: Sequence[int],
    timeout_s: float,
) -> Mapping[str, Any]:
    return metric.probe_metric_rows(
        n,
        rows,
        order=order,
        timeout_s=timeout_s,
        backend="legacy-local-z3",
    )


def _normalize_exact_result(raw: Any) -> dict[str, Any]:
    if not isinstance(raw, Mapping):
        return {
            "stage": "exact-metric-relaxation",
            "status": "ERROR",
            "diagnostic": "backend returned a non-object",
            "backend_result": None,
        }
    backend = dict(raw)
    status = backend.get("status")
    if status not in STATUSES:
        return {
            "stage": "exact-metric-relaxation",
            "status": "ERROR",
            "diagnostic": f"unsupported backend status {status!r}",
            "backend_result": backend,
        }
    return {
        "stage": "exact-metric-relaxation",
        "status": status,
        "diagnostic": (
            "TRUSTED_Z3_QF_NRA_NOT_KERNEL_CHECKED"
            if status in {"SAT", "UNSAT"}
            else str(
                backend.get(
                    "reason",
                    backend.get("diagnostic", f"Z3_{status}"),
                )
            )
        ),
        "backend_result": backend,
    }


def _run_exact(
    index: int,
    assignment_sha256: str,
    rows: Sequence[metric.MetricRow],
    timeout_s: float,
    runner: ExactRunner,
) -> tuple[str, int, dict[str, Any]]:
    system = {
        "system_id": f"phase3-survivor-{assignment_sha256[:20]}-exact-metric",
        "n": structural.CELL.n,
        "rows": [row.as_dict() for row in rows],
    }
    try:
        raw = runner(system, timeout_s)
    except Exception as exc:  # noqa: BLE001 - solver boundary fails closed.
        raw = {
            "status": "ERROR",
            "diagnostic": f"{type(exc).__name__}: {exc}",
        }
    return "exact", index, _normalize_exact_result(raw)


def _normalize_convex_result(raw: Any) -> dict[str, Any]:
    if not isinstance(raw, Mapping):
        return {
            "status": "ERROR",
            "diagnostic": "backend returned a non-object",
            "raw_result_sha256": None,
            "backend_result": None,
        }
    backend = dict(raw)
    status = backend.get("status")
    valid = status in STATUSES
    verification = backend.get("verification")
    if status == "SAT":
        valid = (
            backend.get("confirmed_realization") is True
            and backend.get("confirmed_exclusion") is False
            and isinstance(verification, Mapping)
            and verification.get("all_z3_assertions_true") is True
        )
    elif status == "UNSAT":
        valid = (
            backend.get("confirmed_exclusion") is True
            and backend.get("confirmed_realization") is False
        )
    elif status in {"UNKNOWN", "ERROR"}:
        valid = (
            backend.get("confirmed_exclusion") is False
            and backend.get("confirmed_realization") is False
        )
    if not valid:
        return {
            "status": "ERROR",
            "diagnostic": "backend result violates fail-closed public contract",
            "raw_result_sha256": _sha256_value(backend),
            "backend_result": backend,
        }
    return {
        "status": status,
        "diagnostic": (
            "ROW_LEVEL_EUCLIDEAN_WITNESS_NOT_P97"
            if status == "SAT"
            else (
                "TRUSTED_Z3_UNSAT_NOT_LEAN_CLOSURE"
                if status == "UNSAT"
                else str(backend.get("diagnostic", f"Z3_{status}"))
            )
        ),
        "raw_result_sha256": _sha256_value(backend),
        "backend_result": backend,
    }


def _run_convex(
    index: int,
    order_spec: realize.OrderSpec,
    rows: Sequence[metric.MetricRow],
    timeout_s: float,
    runner: ConvexRunner,
) -> tuple[str, int, str, dict[str, Any]]:
    try:
        raw = runner(structural.CELL.n, rows, order_spec.order, timeout_s)
    except Exception as exc:  # noqa: BLE001 - solver boundary fails closed.
        raw = {
            "status": "ERROR",
            "diagnostic": f"{type(exc).__name__}: {exc}",
            "confirmed_realization": False,
            "confirmed_exclusion": False,
        }
    normalized = _normalize_convex_result(raw)
    normalized.update(
        {
            "order_id": order_spec.order_id,
            "order": list(order_spec.order),
        }
    )
    return "convex", index, order_spec.order_id, normalized


def _overall_classification(
    equality_status: str, exact_status: str, order_statuses: Sequence[str]
) -> str:
    if (
        equality_status == "ERROR"
        or exact_status == "ERROR"
        or "ERROR" in order_statuses
    ):
        return "ERROR_NO_VERDICT"
    if equality_status == "UNSAT":
        return "EQUALITY_CORE_EXCLUSION_NOT_LANDED"
    if exact_status == "UNSAT":
        return "EXACT_METRIC_SOLVER_UNSAT_NOT_LEAN_CLOSURE"
    if "SAT" in order_statuses:
        return "ROW_LEVEL_EUCLIDEAN_WITNESS_NOT_P97"
    if order_statuses and set(order_statuses) == {"UNSAT"}:
        return "ALL_CAP_ORDERS_SOLVER_UNSAT_NOT_LEAN_CLOSURE"
    return "UNRESOLVED_NO_VERDICT"


def _with_record_hash(
    unsigned: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    payload = {**unsigned, "previous_record_sha256": previous}
    return {**payload, "record_sha256": _sha256_value(payload)}


def _write_results(path: Path, records: Sequence[Mapping[str, Any]]) -> None:
    data = b"".join(_canonical_bytes(record) + b"\n" for record in records)
    _immutable_bytes(path, data)


def _piqd_exact_result(stage: Mapping[str, Any]) -> dict[str, Any]:
    raw_status = stage.get("status")
    effective = stage.get("effective_status")
    status = raw_status
    if raw_status == "SAT" and effective != "SAT_SEMANTICALLY_REPLAYED":
        status = "UNKNOWN"
    if status not in {"SAT", "UNSAT", "UNKNOWN"}:
        status = "ERROR"
    return {
        "stage": "exact-metric-relaxation",
        "status": status,
        "diagnostic": str(stage.get("classification", "INCONCLUSIVE_NO_VERDICT")),
        "backend_result": dict(stage),
    }


def _piqd_order_result(
    result: Mapping[str, Any], order_spec: realize.OrderSpec
) -> dict[str, Any]:
    status = result.get("status")
    if status not in {"SAT", "UNSAT", "UNKNOWN"}:
        status = "ERROR"
    decisive = result.get("decisive_stage")
    diagnostic = (
        "SAT_EXACT_RATIONAL_REPLAYED_ROW_LEVEL_DIAGNOSTIC"
        if status == "SAT"
        else (
            "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
            if status == "UNSAT"
            else "UNKNOWN_OR_INCONCLUSIVE_NO_VERDICT"
        )
    )
    return {
        "status": status,
        "diagnostic": diagnostic,
        "raw_result_sha256": _sha256_value(result),
        "backend_result": dict(result),
        "decisive_stage": decisive,
        "order_id": order_spec.order_id,
        "order": list(order_spec.order),
    }


def _run_piqd_tasks(
    cases: Sequence[SurvivorCase],
    *,
    source_dir: Path,
    expected_count: int,
    running_snapshot: bool,
    timeout_s: float,
    transport: Any,
    output_directory: Path,
    case_index: int | None = None,
    order_id: str | None = None,
) -> tuple[dict[int, dict[str, Any]], dict[tuple[int, str], dict[str, Any]]]:
    """Run every PIQD leaf sequentially; no ProcessPool or local fallback."""

    from census.p97_search import phase3_survivor_metric_piqd as piqd

    bindings = piqd.capture_sources(
        source_dir,
        expected_count=expected_count,
        running_snapshot=running_snapshot,
    )
    if tuple(
        _survivor_case_replay_identity(binding.case) for binding in bindings
    ) != tuple(_survivor_case_replay_identity(case) for case in cases):
        raise SurvivorMetricError("PIQD survivor bindings crossed ingress replay")
    piqd.create_output_root(output_directory)
    exact_results: dict[int, dict[str, Any]] = {}
    convex_results: dict[tuple[int, str], dict[str, Any]] = {}
    selected_bindings = (
        bindings
        if case_index is None
        else tuple(binding for binding in bindings if binding.case.index == case_index)
    )
    for binding in selected_bindings:
        case_root = output_directory / f"survivor-{binding.case.index:04d}"
        case_root.mkdir(mode=0o700)
        selected_orders = (
            binding.case.orders
            if order_id is None
            else tuple(
                order for order in binding.case.orders if order.order_id == order_id
            )
        )
        for order_spec in selected_orders:
            order_index = next(
                index
                for index, candidate in enumerate(binding.case.orders)
                if candidate.order_id == order_spec.order_id
            )
            result = piqd.run_staged_order(
                binding,
                order_spec,
                timeout_s=timeout_s,
                transport=transport,
                output_directory=case_root / f"{order_index:02d}-{order_spec.order_id}",
            )
            if binding.case.index not in exact_results:
                exact_results[binding.case.index] = _piqd_exact_result(
                    result["stages"][0]
                )
            convex_results[(binding.case.index, order_spec.order_id)] = (
                _piqd_order_result(result, order_spec)
            )
    return exact_results, convex_results


def _run_tasks(
    cases: Sequence[SurvivorCase],
    *,
    workers: int,
    timeout_s: float,
    exact_runner: ExactRunner,
    convex_runner: ConvexRunner,
) -> tuple[dict[int, dict[str, Any]], dict[tuple[int, str], dict[str, Any]]]:
    exact_results: dict[int, dict[str, Any]] = {}
    convex_results: dict[tuple[int, str], dict[str, Any]] = {}

    if workers == 1:
        for case in cases:
            _, index, result = _run_exact(
                case.index,
                str(case.source_record["assignment_sha256"]),
                case.rows,
                timeout_s,
                exact_runner,
            )
            exact_results[index] = result
            for order_spec in case.orders:
                _, result_index, order_id, order_result = _run_convex(
                    case.index,
                    order_spec,
                    case.rows,
                    timeout_s,
                    convex_runner,
                )
                convex_results[(result_index, order_id)] = order_result
        return exact_results, convex_results

    if (
        exact_runner is not _exact_metric_backend
        or convex_runner is not _convex_order_backend
    ):
        raise SurvivorMetricError(
            "custom solver runners are supported only with workers=1"
        )
    futures: list[concurrent.futures.Future[Any]] = []
    with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as executor:
        for case in cases:
            futures.append(
                executor.submit(
                    _run_exact,
                    case.index,
                    str(case.source_record["assignment_sha256"]),
                    case.rows,
                    timeout_s,
                    _exact_metric_backend,
                )
            )
            futures.extend(
                executor.submit(
                    _run_convex,
                    case.index,
                    order_spec,
                    case.rows,
                    timeout_s,
                    _convex_order_backend,
                )
                for order_spec in case.orders
            )
        for future in concurrent.futures.as_completed(futures):
            answer = future.result()
            if answer[0] == "exact":
                _, index, result = answer
                exact_results[index] = result
            else:
                _, index, order_id, result = answer
                convex_results[(index, order_id)] = result

    if len(exact_results) != len(cases):
        raise SurvivorMetricError("exact-metric task result count mismatch")
    expected_order_count = sum(len(case.orders) for case in cases)
    if len(convex_results) != expected_order_count:
        raise SurvivorMetricError("convex-order task result count mismatch")
    return exact_results, convex_results


def _select_cases(
    cases: Sequence[SurvivorCase],
    *,
    case_index: int | None,
    order_id: str | None,
) -> tuple[SurvivorCase, ...]:
    """Select a bounded replay without weakening complete source ingress."""

    if (case_index is None) != (order_id is None):
        raise ValueError("case_index and order_id must be supplied together")
    if case_index is None:
        return tuple(cases)
    if type(case_index) is not int or case_index < 0:
        raise ValueError("case_index must be a nonnegative exact int")
    if type(order_id) is not str or not order_id:
        raise ValueError("order_id must be a nonempty exact str")
    matches = tuple(case for case in cases if case.index == case_index)
    if len(matches) != 1:
        raise SurvivorMetricError(
            "selected case_index is not an authenticated survivor"
        )
    case = matches[0]
    selected_orders = tuple(
        order for order in case.orders if order.order_id == order_id
    )
    if len(selected_orders) != 1:
        raise SurvivorMetricError("selected order_id is not an authenticated cap order")
    return (replace(case, orders=selected_orders),)


def run_driver(
    *,
    source_dir: Path,
    out_dir: Path,
    workers: int,
    timeout_s: float,
    expected_count: int = EXPECTED_SOURCE_COUNT,
    running_snapshot: bool = False,
    exact_runner: ExactRunner = _exact_metric_backend,
    convex_runner: ConvexRunner = _convex_order_backend,
    solver_route: str = "piqd",
    piqd_transport: Any | None = None,
    piqd_server: str = DEFAULT_PIQD_SERVER,
    piqd_output_directory: Path | None = None,
    case_index: int | None = None,
    order_id: str | None = None,
) -> dict[str, Any]:
    """Replay, classify, and publish one complete survivor census."""

    if type(solver_route) is not str or solver_route not in SOLVER_ROUTES:
        raise ValueError("unknown metric solver route")
    if type(workers) is not int or not 1 <= workers <= MAX_WORKERS:
        raise ValueError(f"workers must be in 1..{MAX_WORKERS}")
    if (
        isinstance(timeout_s, bool)
        or not isinstance(timeout_s, (int, float))
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise ValueError("timeout_s must be positive")
    injected_test_route = (
        exact_runner is not _exact_metric_backend
        or convex_runner is not _convex_order_backend
    )
    if solver_route == "piqd" and not injected_test_route and workers != 1:
        raise SurvivorMetricError("PIQD metric route requires workers=1")
    if solver_route == "piqd" and injected_test_route and workers != 1:
        raise SurvivorMetricError(
            "custom solver runners are supported only with workers=1"
        )
    if out_dir.exists():
        raise SurvivorMetricError(
            f"refusing to overwrite existing output directory: {out_dir}"
        )
    selected_piqd_output = piqd_output_directory
    if solver_route == "piqd" and not injected_test_route:
        if selected_piqd_output is None:
            selected_piqd_output = Path(f"{out_dir}.piqd")
        if type(selected_piqd_output) is not type(Path()):
            raise ValueError("piqd_output_directory must be an exact platform Path")
        if selected_piqd_output.exists():
            raise SurvivorMetricError(
                f"refusing to overwrite PIQD custody root: {selected_piqd_output}"
            )

    source_manifest_path = _source_manifest_path(
        source_dir, running_snapshot=running_snapshot
    )
    source_manifest_bytes = source_manifest_path.read_bytes()
    source_survivors_sha256 = _sha256_file(source_dir / "survivors.jsonl")
    source_manifest, cases = load_source(
        source_dir,
        expected_count=expected_count,
        running_snapshot=running_snapshot,
    )
    if (
        source_manifest_path.read_bytes() != source_manifest_bytes
        or _sha256_file(source_dir / "survivors.jsonl") != source_survivors_sha256
    ):
        raise SurvivorMetricError("source snapshot changed during ingress replay")
    selected_cases = _select_cases(cases, case_index=case_index, order_id=order_id)
    equality_results = {
        case.index: classify_equality_only(case.rows) for case in selected_cases
    }
    if solver_route == "piqd" and not injected_test_route:
        from census.p97_search import phase3_piqd_smt_source_adapter as neutral

        transport = piqd_transport
        if transport is None:
            if case_index is None:
                # Preserve the adapter's historical 3900-second transport
                # timeout for the complete census route. The CLI timeout is
                # a solver budget, not a transport budget on this path.
                transport = neutral.UrllibPiqdTransport(piqd_server)
            else:
                # An explicitly selected single-order canary is the bounded
                # seam: keep its HTTP wait bounded by the requested timeout.
                transport = neutral.UrllibPiqdTransport(
                    piqd_server,
                    http_timeout_s=neutral.bounded_solve_http_timeout_s(
                        max(1, int(float(timeout_s) * 1000))
                    ),
                )
        if selected_piqd_output is None:
            raise SurvivorMetricError("PIQD custody root was not selected")
        exact_results, convex_results = _run_piqd_tasks(
            cases,
            source_dir=source_dir,
            expected_count=expected_count,
            running_snapshot=running_snapshot,
            timeout_s=float(timeout_s),
            transport=transport,
            output_directory=selected_piqd_output,
            case_index=case_index,
            order_id=order_id,
        )
        effective_route = "piqd-z3-qfnra"
    else:
        exact_results, convex_results = _run_tasks(
            selected_cases,
            workers=workers,
            timeout_s=float(timeout_s),
            exact_runner=exact_runner,
            convex_runner=convex_runner,
        )
        effective_route = (
            "injected-test-runner" if injected_test_route else "legacy-local-z3"
        )

    records: list[dict[str, Any]] = []
    previous: str | None = None
    for case in selected_cases:
        order_results = [
            convex_results[(case.index, order.order_id)] for order in case.orders
        ]
        order_statuses = [str(result["status"]) for result in order_results]
        equality = equality_results[case.index]
        exact = exact_results[case.index]
        unsigned = {
            "schema": RESULT_SCHEMA,
            "index": case.index,
            "source_record": dict(case.source_record),
            "source_record_sha256": str(case.source_record["record_sha256"]),
            "canonical_digest": case.canonical_digest,
            "equality_only_metric_core": equality,
            "exact_metric": exact,
            "convexity_order": {
                "order_count": len(order_results),
                "status_counts": _status_counts(order_statuses),
                "results": order_results,
            },
            "classification": _overall_classification(
                str(equality["status"]), str(exact["status"]), order_statuses
            ),
            "trust": {
                "source": (
                    "structural survivor means only that the pinned "
                    "order-independent detector returned no core"
                ),
                "sat": (
                    "convex-order SAT is a row-level Euclidean realization, "
                    "not a Problem 97 witness"
                ),
                "unsat": (
                    "Z3 UNSAT excludes only the encoded row/order system and "
                    "is not a Lean or kernel-checked closure"
                ),
                "unknown_error": "UNKNOWN and ERROR are no verdict",
                "lean": "NOT_LANDED",
            },
        }
        record = _with_record_hash(unsigned, previous)
        records.append(record)
        previous = str(record["record_sha256"])

    if (
        source_manifest_path.read_bytes() != source_manifest_bytes
        or _sha256_file(source_dir / "survivors.jsonl") != source_survivors_sha256
    ):
        raise SurvivorMetricError("source snapshot changed during metric screening")

    out_dir.mkdir(parents=True, exist_ok=False)
    results_path = out_dir / "results.jsonl"
    _write_results(results_path, records)
    _immutable_bytes(out_dir / "source-manifest.json", source_manifest_bytes)

    equality_statuses = [
        str(record["equality_only_metric_core"]["status"]) for record in records
    ]
    exact_statuses = [str(record["exact_metric"]["status"]) for record in records]
    order_statuses = [
        str(result["status"])
        for record in records
        for result in record["convexity_order"]["results"]
    ]
    classifications = Counter(str(record["classification"]) for record in records)
    configuration = {
        "cell": {"k": 4, "n": 10, "profile": [4, 4, 5], "exact": True},
        "mode": "cap+blocker-annotated",
        "metric_row_exact": False,
        "workers": workers,
        "solver_route": effective_route,
        "requested_solver_route": solver_route,
        "legacy_local_z3_explicit": solver_route == "legacy-local-z3",
        "local_fallback": False,
        "timeout_seconds_per_solver_call": float(timeout_s),
        "order_count_per_survivor": ORDER_COUNT,
        "dependency_sha256": {
            relative: _sha256_file(ROOT / relative)
            for relative in (
                *SOURCE_DEPENDENCIES,
                "census/p97_search/phase3_survivor_metric_driver.py",
                *(
                    (
                        "census/p97_search/phase3_survivor_metric_piqd.py",
                        "census/p97_search/phase3_piqd_smt_source_adapter.py",
                        "census/endpoint_confinement/metric_realizability_piqd.py",
                    )
                    if effective_route == "piqd-z3-qfnra"
                    else ()
                ),
            )
        },
    }
    if case_index is not None:
        configuration["selection"] = {
            "case_index": case_index,
            "order_id": order_id,
            "authenticated_source_survivor_count": len(cases),
            "published_survivor_count": len(selected_cases),
        }
    if selected_piqd_output is not None and effective_route == "piqd-z3-qfnra":
        configuration["piqd_output_directory"] = _portable_source_reference(
            selected_piqd_output
        )
    source = {
        "directory": _portable_source_reference(source_dir),
        "manifest_file_sha256": _sha256_bytes(source_manifest_bytes),
        "manifest_canonical_sha256": source_manifest["manifest_sha256"],
        "survivors_sha256": source_survivors_sha256,
        "survivor_count": len(cases),
        "source_manifest": source_manifest,
    }
    if running_snapshot:
        configuration["source_scope"] = RUNNING_SNAPSHOT_SCOPE
        source["manifest_name"] = source_manifest_path.name
        source["scope"] = RUNNING_SNAPSHOT_SCOPE

    counts = {
        "source_survivor_count": len(cases),
        "cap_order_leaf_count": len(order_statuses),
        "equality_only_metric_core": _status_counts(equality_statuses),
        "exact_metric": _status_counts(exact_statuses),
        "convexity_order": _status_counts(order_statuses),
        "source_classification": dict(sorted(classifications.items())),
    }
    if case_index is not None:
        counts["published_survivor_count"] = len(selected_cases)
    unsigned_manifest = {
        "schema": SCHEMA,
        "configuration": configuration,
        "source": source,
        "counts": counts,
        "artifacts": {
            "results.jsonl": {
                "count": len(records),
                "sha256": _sha256_file(results_path),
            },
            "source-manifest.json": {
                "sha256": _sha256_file(out_dir / "source-manifest.json"),
            },
        },
        "result_claim": (
            (
                "bounded canary screening of exactly one selected survivor and "
                f"order {order_id} from an authenticated source of "
                f"{len(cases)} survivors; selected order only, not exhaustive "
                "and not SURVIVOR_LIMIT"
            )
            if case_index is not None
            else (
                "immutable partial survivor snapshot screening of exactly "
                f"{len(cases)} survivors captured from a RUNNING structural "
                "CEGAR journal under the encoded row systems and 24 "
                "cap-compatible orders; partial journal scope only, not "
                "exhaustive and not SURVIVOR_LIMIT"
            )
            if running_snapshot
            else (
                f"complete screening of the {len(cases)} saved structural "
                "survivors under the encoded row systems and 24 "
                "cap-compatible orders only"
            )
        ),
        "trust_boundary": {
            "structural_survivor": (
                "no pinned order-independent formalized core was found; this "
                "is not a Euclidean witness"
            ),
            "equality_no_hit": (
                "UNKNOWN because the formalized core detector is incomplete"
            ),
            "exact_metric_sat": (
                "unordered row-level metric feasibility only, not convex or P97"
            ),
            "convexity_order_sat": (
                "row-level Euclidean realization of one supplied cap order, "
                "not a P97 configuration"
            ),
            "solver_unsat": (
                "proofless Z3 diagnostic for the encoded system, not a checked "
                "proof or Lean closure"
            ),
            "unknown_error": "no verdict",
            "lean": "NOT_LANDED",
        },
    }
    manifest = {
        **unsigned_manifest,
        "manifest_sha256": _sha256_value(unsigned_manifest),
    }
    _immutable_json(out_dir / "manifest.json", manifest)
    return manifest


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument(
        "--workers",
        type=int,
        default=1,
    )
    parser.add_argument("--timeout", type=float, default=2.0)
    parser.add_argument(
        "--solver-route",
        choices=SOLVER_ROUTES,
        default="piqd",
        help="production PIQD route (default) or explicit legacy local Z3",
    )
    parser.add_argument("--piqd-server", default=DEFAULT_PIQD_SERVER)
    parser.add_argument(
        "--piqd-output-directory",
        type=Path,
        help="create-once PIQD custody root (default: <out>.piqd)",
    )
    parser.add_argument(
        "--expected-count",
        type=int,
        default=EXPECTED_SOURCE_COUNT,
        help="exact positive number of survivor records required at ingress",
    )
    parser.add_argument(
        "--running-snapshot",
        action="store_true",
        help=(
            "screen an immutable partial snapshot whose authenticated source "
            "manifest status is RUNNING"
        ),
    )
    parser.add_argument(
        "--case-index",
        type=int,
        help="bounded canary case index; requires --order-id",
    )
    parser.add_argument(
        "--order-id",
        help="bounded canary order identifier; requires --case-index",
    )
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        manifest = run_driver(
            source_dir=args.source,
            out_dir=args.out,
            workers=args.workers,
            timeout_s=args.timeout,
            expected_count=args.expected_count,
            running_snapshot=args.running_snapshot,
            solver_route=args.solver_route,
            piqd_server=args.piqd_server,
            piqd_output_directory=args.piqd_output_directory,
            case_index=args.case_index,
            order_id=args.order_id,
        )
    except (OSError, ValueError, SurvivorMetricError) as exc:
        print(f"phase3 survivor metric driver failed: {exc}")
        return 2
    print(json.dumps(manifest["counts"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
