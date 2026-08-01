#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Fail-closed structural/equality screening for the refreshed Phase-3 census.

The input is the current bounded census of 100 canonical ``k=4, n=10,
profile=(4,4,5)`` models.  SAT ``exact=True`` fixes the selected support
cardinality; it does not justify geometric off-support exclusions.  Every
metric row in this screen therefore has ``exact=False``.

The primary screen is order-independent.  A detected core is exported with a
direct row-equality certificate and replayed by the independent Python
certificate validator.  This is classified ``STRUCTURAL_CORE_REPLAYED`` and
matched to the generic Lean theorem family, but it is not a kernel-landed
Phase-3 proof.

Singular is run only for structurally unresolved models plus a configurable
audit prefix.  ``UNIT`` is deliberately classified
``SINGULAR_UNIT_UNCERTIFIED`` until an exact polynomial identity is exported
and independently replayed.  ``NONUNIT`` proves only that the equality ideal
is proper; it does not establish real, injective, or convex realizability.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import importlib
import json
import os
import sys
import tempfile
import time
from collections import Counter
from collections.abc import Mapping, Sequence
from contextlib import contextmanager
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

realize = importlib.import_module("census.p97_search.realize")
certificates = importlib.import_module(
    "census.global_confinement.cap_selected_nogood_certificate_probe"
)
equality_ideal = importlib.import_module(
    "census.global_confinement.equality_ideal_probe"
)
metric = importlib.import_module("census.global_confinement.metric_realizability_probe")


MANIFEST_SCHEMA = "p97-phase3-structural-screen-manifest-v1"
SMOKE_SCHEMA = "p97-phase3-structural-screen-singular-smoke-v1"
RESULT_SCHEMA = "p97-phase3-structural-screen-record-v1"
SUMMARY_SCHEMA = "p97-phase3-structural-screen-summary-v1"

MODEL_COUNT = 100
MAX_WORKERS = 24
MAX_TIMEOUT_SECONDS = 3600

DEFAULT_SOURCE = (
    HERE
    / "out/phase3-production"
    / "k4-n10-profile-445-combined-bounded100-current-20260728"
)
DEFAULT_OUT = (
    HERE / "out/phase3-realization" / "k4-n10-profile-445-bounded100-structural-current"
)

PRIMARY_CLASSIFICATIONS = frozenset(
    {
        "STRUCTURAL_CORE_REPLAYED",
        "SINGULAR_UNIT_UNCERTIFIED",
        "NONUNIT",
        "TIMEOUT",
        "ERROR",
    }
)
SINGULAR_CLASSIFICATIONS = frozenset(
    {"SINGULAR_UNIT_UNCERTIFIED", "NONUNIT", "TIMEOUT", "ERROR"}
)
ORDER_INDEPENDENT_STAGES = frozenset(
    {
        "equality-duplicate-center",
        "equality-exact-off-circle",
        "equality-perpendicular-bisector-convex",
        "equality-equal-k4",
        "equality-equilateral-bisector-collision",
        "equality-three-triad-collision",
        "equality-surplus-source-collision",
        "equality-six-row-anchor-collision",
        "equality-six-point-two-pair-collision",
        "equality-six-point-five-circle-collision-a",
        "equality-six-point-five-circle-collision-b",
        "equality-six-point-five-circle-collision-c",
        "equality-seven-point-five-circle-collision",
        "equality-eight-point-five-circle-collision",
        "equality-six-point-circle-chain-collision",
        "equality-seven-point-six-circle-collision",
        "equality-seven-point-six-circle-collision-b",
        "equality-seven-point-twin-four-circle-collision",
        "equality-seven-point-orbit-collision",
        "equality-seven-point-circle-network-collision",
    }
)

_MANIFEST_FILES = frozenset(
    {"manifest.json", "singular-smoke.json", "results.jsonl", "summary.json"}
)
_RESULT_KEYS = frozenset(
    {
        "schema",
        "screen_index",
        "source_model_index",
        "canonical_digest",
        "source_manifest_sha256",
        "metric_rows",
        "metric_rows_sha256",
        "detector",
        "certificate",
        "certificate_validation",
        "lean_match",
        "singular",
        "classification",
        "trust",
        "previous_record_sha256",
        "record_sha256",
    }
)
_SINGULAR_KEYS = frozenset(
    {
        "engine",
        "oracle_verdict",
        "classification",
        "returncode",
        "detail",
        "elapsed_ms",
    }
)


class StructuralScreenError(RuntimeError):
    """A source, replay, solver-gate, resume, or artifact-integrity failure."""


def _reject_json_constant(value: str) -> None:
    raise StructuralScreenError(f"non-finite JSON constant {value!r}")


def _no_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise StructuralScreenError(f"duplicate JSON key {key!r}")
        value[key] = item
    return value


def _strict_json(text: str, *, where: str) -> Any:
    try:
        return json.loads(
            text,
            object_pairs_hook=_no_duplicate_keys,
            parse_constant=_reject_json_constant,
        )
    except StructuralScreenError:
        raise
    except (json.JSONDecodeError, TypeError) as exc:
        raise StructuralScreenError(f"malformed JSON in {where}: {exc}") from exc


def _read_json(path: Path) -> Any:
    if not path.is_file():
        raise StructuralScreenError(f"missing required artifact {path.name}")
    return _strict_json(path.read_text(), where=str(path))


def _read_jsonl(path: Path) -> list[dict[str, Any]]:
    if not path.exists():
        return []
    if not path.is_file():
        raise StructuralScreenError(f"{path.name} is not a regular file")
    records: list[dict[str, Any]] = []
    with path.open() as handle:
        for line_number, line in enumerate(handle, 1):
            if not line.endswith("\n"):
                raise StructuralScreenError(
                    f"{path.name}:{line_number} is an incomplete JSONL record"
                )
            if not line.strip():
                raise StructuralScreenError(
                    f"{path.name}:{line_number} is a blank JSONL record"
                )
            value = _strict_json(line, where=f"{path}:{line_number}")
            if not isinstance(value, dict):
                raise StructuralScreenError(
                    f"{path.name}:{line_number} must be a JSON object"
                )
            records.append(value)
    return records


def _canonical_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise StructuralScreenError(f"value is not canonical JSON: {exc}") from exc


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _require_keys(
    value: Mapping[str, Any], expected: frozenset[str], *, where: str
) -> None:
    actual = frozenset(value)
    if actual != expected:
        raise StructuralScreenError(
            f"{where} schema mismatch: "
            f"missing={sorted(expected - actual)}, extra={sorted(actual - expected)}"
        )


def _atomic_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    data = json.dumps(value, indent=2, sort_keys=True, allow_nan=False).encode("utf-8")
    data += b"\n"
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
            os.unlink(temporary)
        except OSError:
            pass
        raise


def _append_record(path: Path, record: Mapping[str, Any]) -> None:
    data = _canonical_bytes(record) + b"\n"
    descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_APPEND, 0o600)
    try:
        offset = 0
        while offset < len(data):
            written = os.write(descriptor, data[offset:])
            if written <= 0:
                raise StructuralScreenError(f"short append to {path.name}")
            offset += written
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _dependency_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        Path(realize.__file__).resolve(),
        Path(metric.__file__).resolve(),
        Path(certificates.__file__).resolve(),
        Path(equality_ideal.__file__).resolve(),
        ROOT / "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        ROOT / "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean",
    )
    return {str(path.relative_to(ROOT)): _sha256_file(path) for path in paths}


def _expected_manifest(
    source: realize.VerifiedSource,
    *,
    workers: int,
    solver_threads: int,
    singular_timeout: int,
    singular_executable: str,
    singular_audit_sample: int,
) -> dict[str, Any]:
    return {
        "schema": MANIFEST_SCHEMA,
        "source": {
            "run_dir": str(source.run_dir),
            "manifest_sha256": source.manifest_sha256,
            "artifact_hashes": {
                name: source.manifest["artifact_hashes"][name]
                for name in ("base.cnf", "models.jsonl", "bank.jsonl")
            },
            "rule_bank_hash": source.manifest["rule_bank_hash"],
            "status": source.manifest["status"],
            "result_claim": source.manifest["result_claim"],
            "model_count": len(source.models),
        },
        "configuration": {
            "workers": workers,
            "solver_threads": solver_threads,
            "singular_timeout_seconds": singular_timeout,
            "singular_executable": singular_executable,
            "singular_policy": (
                "all structurally unresolved models plus the first "
                f"{singular_audit_sample} structurally resolved models"
            ),
            "singular_audit_sample": singular_audit_sample,
            "order_independent": True,
            "metric_row_exact": False,
        },
        "expected_result_count": MODEL_COUNT,
        "detector": {
            "call": (
                "_formalized_metric_core(rows, n, (), "
                "include_extended=True, include_ordered=False)"
            ),
            "allowed_stages": sorted(ORDER_INDEPENDENT_STAGES),
            "certificate_exporter": (
                "cap_selected_nogood_certificate_probe._certificate_for_detection"
            ),
            "certificate_replay": (
                "cap_selected_nogood_certificate_probe."
                "_validate_certificate(certificate, n=10)"
            ),
        },
        "lean_match": {
            "alternative": "Problem97.Census554.MetricCoreAlternative",
            "generic_consumer": ("Problem97.Census554.false_of_metricCoreAlternative"),
            "phase3_kernel_status": "NOT_LANDED",
        },
        "classification_policy": {
            "structural": "STRUCTURAL_CORE_REPLAYED",
            "singular_unit": "SINGULAR_UNIT_UNCERTIFIED",
            "singular_nonunit": "NONUNIT",
            "singular_timeout": "TIMEOUT",
            "singular_error": "ERROR",
            "forbidden_claims": ["PROVED_INFEASIBLE", "LEAN_CLOSED"],
        },
        "trust_boundaries": {
            "STRUCTURAL_CORE_REPLAYED": (
                "deterministic Python detector plus direct row-equality "
                "certificate replay; matches a named generic Lean theorem "
                "family but is not kernel-landed for these Phase-3 models"
            ),
            "SINGULAR_UNIT_UNCERTIFIED": (
                "exact characteristic-zero CAS UNIT verdict without an "
                "exported and independently replayed polynomial identity"
            ),
            "NONUNIT": (
                "equality ideal is proper; no real, injective, convex, or "
                "exact-row realizability claim"
            ),
            "TIMEOUT": "no algebra verdict",
            "ERROR": "no algebra verdict",
        },
        "dependency_sha256": _dependency_hashes(),
    }


def _smoke_record(
    *,
    timeout_s: int,
    executable: str,
    results: Mapping[str, Any],
) -> dict[str, Any]:
    unsigned = {
        "schema": SMOKE_SCHEMA,
        "engine": "Singular",
        "executable": executable,
        "timeout_seconds": timeout_s,
        "results": dict(results),
    }
    return {**unsigned, "record_sha256": _sha256_value(unsigned)}


def _validate_smoke(value: Any, *, timeout_s: int, executable: str) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise StructuralScreenError("singular-smoke.json must contain an object")
    _require_keys(
        value,
        frozenset(
            {
                "schema",
                "engine",
                "executable",
                "timeout_seconds",
                "results",
                "record_sha256",
            }
        ),
        where="singular smoke",
    )
    unsigned = dict(value)
    claimed = unsigned.pop("record_sha256")
    if not _is_sha256(claimed) or claimed != _sha256_value(unsigned):
        raise StructuralScreenError("singular smoke has invalid record hash")
    if (
        value["schema"] != SMOKE_SCHEMA
        or value["engine"] != "Singular"
        or value["executable"] != executable
        or value["timeout_seconds"] != timeout_s
    ):
        raise StructuralScreenError("singular smoke configuration mismatch")
    results = value["results"]
    if not isinstance(results, dict) or set(results) != {
        "known_unit",
        "known_nonunit",
    }:
        raise StructuralScreenError("singular smoke has wrong gate set")
    expected = {"known_unit": "UNIT", "known_nonunit": "NONUNIT"}
    for name, verdict in expected.items():
        result = results[name]
        if (
            not isinstance(result, dict)
            or result.get("expected") != verdict
            or result.get("verdict") != verdict
        ):
            raise StructuralScreenError(f"singular smoke gate {name} did not pass")
    return value


def _load_or_run_smoke(out: Path, *, timeout_s: int, executable: str) -> dict[str, Any]:
    path = out / "singular-smoke.json"
    if path.exists():
        return _validate_smoke(
            _read_json(path), timeout_s=timeout_s, executable=executable
        )
    if (out / "results.jsonl").exists():
        raise StructuralScreenError("results exist without a Singular smoke record")
    try:
        results = equality_ideal.run_smoke_gates(
            timeout_s=timeout_s, executable=executable
        )
    except Exception as exc:
        raise StructuralScreenError(f"Singular smoke gates failed: {exc}") from exc
    record = _smoke_record(timeout_s=timeout_s, executable=executable, results=results)
    _atomic_json(path, record)
    return _validate_smoke(_read_json(path), timeout_s=timeout_s, executable=executable)


def _models_in_source_order(
    source: realize.VerifiedSource,
) -> tuple[realize.SourceModel, ...]:
    models = tuple(sorted(source.models, key=lambda model: model.index))
    if len(models) != MODEL_COUNT or [model.index for model in models] != list(
        range(MODEL_COUNT)
    ):
        raise StructuralScreenError("verified source model indices are not 0..99")
    return models


def _metric_rows(model: realize.SourceModel) -> tuple[metric.MetricRow, ...]:
    rows = realize.metric_rows(model.annotated)
    if (
        len(rows) != 10
        or any(row.center != index for index, row in enumerate(rows))
        or any(len(row.support) != 4 for row in rows)
        or any(row.exact is not False for row in rows)
    ):
        raise StructuralScreenError(
            f"model {model.index} metric translation violated the exact=False boundary"
        )
    return rows


def _analyze_model(model: realize.SourceModel) -> dict[str, Any]:
    rows = _metric_rows(model)
    try:
        detection = metric._formalized_metric_core(
            rows,
            model.annotated.node.n,
            (),
            include_extended=True,
            include_ordered=False,
        )
    except Exception as exc:
        raise StructuralScreenError(
            f"model {model.index} structural detector failed: {exc}"
        ) from exc
    if detection is None:
        certificate = None
        certificate_validation = None
        lean_match = None
    else:
        if (
            not isinstance(detection, dict)
            or set(detection) != {"stage", "core"}
            or detection["stage"] not in ORDER_INDEPENDENT_STAGES
            or not isinstance(detection["core"], dict)
        ):
            raise StructuralScreenError(
                f"model {model.index} returned an unsupported detector witness"
            )
        try:
            certificate = certificates._certificate_for_detection(
                rows, model.annotated.node.n, detection
            )
            replayed = certificates._validate_certificate(
                certificate, n=model.annotated.node.n
            )
        except Exception as exc:
            raise StructuralScreenError(
                f"model {model.index} certificate export/replay failed: {exc}"
            ) from exc
        if replayed is not True:
            raise StructuralScreenError(
                f"model {model.index} certificate did not replay"
            )
        certificate_validation = {
            "validator": (
                "cap_selected_nogood_certificate_probe._validate_certificate"
            ),
            "n": model.annotated.node.n,
            "passed": True,
        }
        lean_match = {
            "alternative": "Problem97.Census554.MetricCoreAlternative",
            "generic_consumer": ("Problem97.Census554.false_of_metricCoreAlternative"),
            "detector_stage": detection["stage"],
            "phase3_kernel_status": "NOT_LANDED",
        }
    rows_json = [row.as_dict() for row in rows]
    return {
        "rows": rows,
        "rows_json": rows_json,
        "rows_sha256": _sha256_value(rows_json),
        "detection": detection,
        "certificate": certificate,
        "certificate_validation": certificate_validation,
        "lean_match": lean_match,
    }


def _singular_classification(verdict: str) -> str:
    mapping = {
        "UNIT": "SINGULAR_UNIT_UNCERTIFIED",
        "NONUNIT": "NONUNIT",
        "TIMEOUT": "TIMEOUT",
        "ERROR": "ERROR",
    }
    try:
        return mapping[verdict]
    except KeyError as exc:
        raise StructuralScreenError(
            f"unsupported Singular verdict {verdict!r}"
        ) from exc


def _probe_one(
    analysis: Mapping[str, Any],
    *,
    timeout_s: int,
    executable: str,
) -> dict[str, Any]:
    started = time.monotonic()
    try:
        result = equality_ideal.probe_rows(
            10,
            analysis["rows"],
            timeout_s=timeout_s,
            executable=executable,
        )
    except Exception as exc:  # noqa: BLE001 - fail closed as an ERROR verdict.
        result = equality_ideal.OracleResult(
            "ERROR", detail=f"{type(exc).__name__}: {exc}"
        )
    elapsed_ms = round((time.monotonic() - started) * 1000)
    return {
        "engine": "Singular",
        "oracle_verdict": result.verdict,
        "classification": _singular_classification(result.verdict),
        "returncode": result.returncode,
        "detail": result.detail,
        "elapsed_ms": elapsed_ms,
    }


@contextmanager
def _single_thread_solver_environment() -> Any:
    names = ("OMP_NUM_THREADS", "OPENBLAS_NUM_THREADS", "MKL_NUM_THREADS")
    previous = {name: os.environ.get(name) for name in names}
    try:
        for name in names:
            os.environ[name] = "1"
        yield
    finally:
        for name, value in previous.items():
            if value is None:
                os.environ.pop(name, None)
            else:
                os.environ[name] = value


def _probe_batch(
    analyses: Mapping[int, Mapping[str, Any]],
    target_indices: Sequence[int],
    *,
    workers: int,
    timeout_s: int,
    executable: str,
) -> dict[int, dict[str, Any]]:
    if not target_indices:
        return {}
    worker_count = min(workers, len(target_indices))
    results: dict[int, dict[str, Any]] = {}
    with (
        _single_thread_solver_environment(),
        concurrent.futures.ThreadPoolExecutor(max_workers=worker_count) as executor,
    ):
        future_to_index = {
            executor.submit(
                _probe_one,
                analyses[index],
                timeout_s=timeout_s,
                executable=executable,
            ): index
            for index in target_indices
        }
        for future in concurrent.futures.as_completed(future_to_index):
            index = future_to_index[future]
            try:
                results[index] = future.result()
            except Exception as exc:  # noqa: BLE001 - map worker faults to ERROR.
                results[index] = {
                    "engine": "Singular",
                    "oracle_verdict": "ERROR",
                    "classification": "ERROR",
                    "returncode": None,
                    "detail": f"{type(exc).__name__}: {exc}",
                    "elapsed_ms": 0,
                }
    if set(results) != set(target_indices):
        raise StructuralScreenError("Singular worker batch lost a target")
    return results


def _trust_for(
    detection: Mapping[str, Any] | None,
    singular: Mapping[str, Any] | None,
) -> tuple[str, str]:
    if detection is not None:
        return (
            "STRUCTURAL_CORE_REPLAYED",
            "PYTHON_CERTIFICATE_REPLAYED_NOT_KERNEL_LANDED",
        )
    if singular is None:
        raise StructuralScreenError("structurally unresolved model was not probed")
    classification = str(singular["classification"])
    trust = {
        "SINGULAR_UNIT_UNCERTIFIED": (
            "EXACT_CAS_UNIT_WITHOUT_REPLAYED_POLYNOMIAL_IDENTITY"
        ),
        "NONUNIT": "PROPER_EQUALITY_IDEAL_ONLY",
        "TIMEOUT": "NO_VERDICT",
        "ERROR": "NO_VERDICT",
    }[classification]
    return classification, trust


def _make_record(
    *,
    screen_index: int,
    model: realize.SourceModel,
    source_manifest_sha256: str,
    analysis: Mapping[str, Any],
    singular: Mapping[str, Any] | None,
    previous_record_sha256: str | None,
) -> dict[str, Any]:
    classification, trust = _trust_for(analysis["detection"], singular)
    unsigned = {
        "schema": RESULT_SCHEMA,
        "screen_index": screen_index,
        "source_model_index": model.index,
        "canonical_digest": model.canonical_digest,
        "source_manifest_sha256": source_manifest_sha256,
        "metric_rows": analysis["rows_json"],
        "metric_rows_sha256": analysis["rows_sha256"],
        "detector": analysis["detection"],
        "certificate": analysis["certificate"],
        "certificate_validation": analysis["certificate_validation"],
        "lean_match": analysis["lean_match"],
        "singular": singular,
        "classification": classification,
        "trust": trust,
        "previous_record_sha256": previous_record_sha256,
    }
    return {**unsigned, "record_sha256": _sha256_value(unsigned)}


def _validate_singular(value: Any, *, where: str) -> None:
    if not isinstance(value, dict):
        raise StructuralScreenError(f"{where} Singular result is not an object")
    _require_keys(value, _SINGULAR_KEYS, where=f"{where} Singular result")
    if value["engine"] != "Singular":
        raise StructuralScreenError(f"{where} has wrong Singular engine")
    verdict = value["oracle_verdict"]
    if verdict not in equality_ideal.VERDICTS:
        raise StructuralScreenError(f"{where} has invalid Singular verdict")
    if value["classification"] != _singular_classification(verdict):
        raise StructuralScreenError(f"{where} has mismatched Singular classification")
    if value["classification"] not in SINGULAR_CLASSIFICATIONS:
        raise StructuralScreenError(f"{where} has unsupported Singular classification")
    if value["returncode"] is not None and type(value["returncode"]) is not int:
        raise StructuralScreenError(f"{where} has invalid Singular return code")
    if value["detail"] is not None and not isinstance(value["detail"], str):
        raise StructuralScreenError(f"{where} has invalid Singular detail")
    if type(value["elapsed_ms"]) is not int or value["elapsed_ms"] < 0:
        raise StructuralScreenError(f"{where} has invalid Singular elapsed time")


def _validate_record(
    record: Mapping[str, Any],
    *,
    screen_index: int,
    model: realize.SourceModel,
    source_manifest_sha256: str,
    singular_audit_sample: int,
    previous_record_sha256: str | None,
) -> None:
    where = f"results.jsonl:{screen_index + 1}"
    _require_keys(record, _RESULT_KEYS, where=where)
    unsigned = dict(record)
    claimed_hash = unsigned.pop("record_sha256")
    if not _is_sha256(claimed_hash) or claimed_hash != _sha256_value(unsigned):
        raise StructuralScreenError(f"{where} has invalid record hash")
    if (
        record["schema"] != RESULT_SCHEMA
        or record["screen_index"] != screen_index
        or record["source_model_index"] != model.index
        or record["canonical_digest"] != model.canonical_digest
        or record["source_manifest_sha256"] != source_manifest_sha256
        or record["previous_record_sha256"] != previous_record_sha256
    ):
        raise StructuralScreenError(f"{where} source identity/hash chain mismatch")

    analysis = _analyze_model(model)
    deterministic = {
        "metric_rows": analysis["rows_json"],
        "metric_rows_sha256": analysis["rows_sha256"],
        "detector": analysis["detection"],
        "certificate": analysis["certificate"],
        "certificate_validation": analysis["certificate_validation"],
        "lean_match": analysis["lean_match"],
    }
    for key, expected in deterministic.items():
        if record[key] != expected:
            raise StructuralScreenError(f"{where} has mismatched replayed {key}")

    singular = record["singular"]
    expected_probe = (
        analysis["detection"] is None or screen_index < singular_audit_sample
    )
    if expected_probe:
        _validate_singular(singular, where=where)
    elif singular is not None:
        raise StructuralScreenError(f"{where} has an out-of-policy Singular probe")
    classification, trust = _trust_for(analysis["detection"], singular)
    if (
        classification not in PRIMARY_CLASSIFICATIONS
        or record["classification"] != classification
        or record["trust"] != trust
    ):
        raise StructuralScreenError(f"{where} has invalid primary classification")


def _load_existing_records(
    out: Path,
    *,
    models: Sequence[realize.SourceModel],
    source_manifest_sha256: str,
    singular_audit_sample: int,
) -> list[dict[str, Any]]:
    records = _read_jsonl(out / "results.jsonl")
    if len(records) > len(models):
        raise StructuralScreenError("results.jsonl contains too many records")
    previous: str | None = None
    for screen_index, (record, model) in enumerate(
        zip(records, models[: len(records)], strict=True)
    ):
        _validate_record(
            record,
            screen_index=screen_index,
            model=model,
            source_manifest_sha256=source_manifest_sha256,
            singular_audit_sample=singular_audit_sample,
            previous_record_sha256=previous,
        )
        previous = record["record_sha256"]
    return records


def _summary(
    out: Path,
    *,
    manifest: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    if len(records) != MODEL_COUNT:
        raise StructuralScreenError("cannot summarize an incomplete structural screen")
    classifications = Counter(str(record["classification"]) for record in records)
    detectors = Counter(
        str(record["detector"]["stage"])
        for record in records
        if record["detector"] is not None
    )
    core_sizes = Counter(
        int(record["certificate"]["minimum"]["minimum_row_count"])
        for record in records
        if record["certificate"] is not None
    )
    singular = Counter(
        str(record["singular"]["classification"])
        for record in records
        if record["singular"] is not None
    )
    unsigned = {
        "schema": SUMMARY_SCHEMA,
        "status": "COMPLETE",
        "scope": ("the refreshed bounded set of 100 canonical Phase-3 SAT models only"),
        "result_claim": (
            "diagnostic structural/equality screening; no unrestricted "
            "Phase-3 closure and no kernel-landed infeasibility claim"
        ),
        "model_count": len(records),
        "classification_counts": dict(sorted(classifications.items())),
        "detector_family_counts": dict(sorted(detectors.items())),
        "minimum_core_row_count_histogram": {
            str(size): count for size, count in sorted(core_sizes.items())
        },
        "structural_core_count": sum(detectors.values()),
        "structurally_unresolved_count": MODEL_COUNT - sum(detectors.values()),
        "singular_probe_count": sum(singular.values()),
        "singular_classification_counts": dict(sorted(singular.items())),
        "result_chain_tail": records[-1]["record_sha256"],
        "forbidden_claims_emitted": [],
        "artifacts": {
            "manifest.json": {
                "sha256": _sha256_file(out / "manifest.json"),
            },
            "singular-smoke.json": {
                "sha256": _sha256_file(out / "singular-smoke.json"),
            },
            "results.jsonl": {
                "count": len(records),
                "sha256": _sha256_file(out / "results.jsonl"),
            },
        },
        "source_manifest_sha256": manifest["source"]["manifest_sha256"],
        "trust": {
            "structural": "PYTHON_CERTIFICATE_REPLAYED_NOT_KERNEL_LANDED",
            "singular_unit": ("EXACT_CAS_UNIT_WITHOUT_REPLAYED_POLYNOMIAL_IDENTITY"),
        },
    }
    return {**unsigned, "summary_sha256": _sha256_value(unsigned)}


def _validate_summary(
    value: Any,
    *,
    out: Path,
    manifest: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise StructuralScreenError("summary.json must contain an object")
    unsigned = dict(value)
    claimed = unsigned.pop("summary_sha256", None)
    if not _is_sha256(claimed) or claimed != _sha256_value(unsigned):
        raise StructuralScreenError("summary.json has invalid summary hash")
    expected = _summary(out, manifest=manifest, records=records)
    if value != expected:
        raise StructuralScreenError("summary.json disagrees with replayed artifacts")
    return value


def _validate_configuration(
    *,
    workers: int,
    solver_threads: int,
    singular_timeout: int,
    singular_audit_sample: int,
    max_new_records: int | None,
) -> None:
    if type(workers) is not int or not 1 <= workers <= MAX_WORKERS:
        raise StructuralScreenError(f"workers must be in 1..{MAX_WORKERS}")
    if solver_threads != 1:
        raise StructuralScreenError("solver_threads must be exactly 1")
    if (
        type(singular_timeout) is not int
        or not 1 <= singular_timeout <= MAX_TIMEOUT_SECONDS
    ):
        raise StructuralScreenError(
            f"singular_timeout must be in 1..{MAX_TIMEOUT_SECONDS}"
        )
    if (
        type(singular_audit_sample) is not int
        or not 0 <= singular_audit_sample <= MODEL_COUNT
    ):
        raise StructuralScreenError(
            f"singular_audit_sample must be in 0..{MODEL_COUNT}"
        )
    if max_new_records is not None and (
        type(max_new_records) is not int or not 1 <= max_new_records <= MODEL_COUNT
    ):
        raise StructuralScreenError(
            f"max_new_records must be in 1..{MODEL_COUNT} or None"
        )


def run_driver(
    source_run: str | Path,
    out_dir: str | Path,
    *,
    workers: int = 24,
    solver_threads: int = 1,
    singular_timeout: int = 30,
    singular_executable: str = "Singular",
    singular_audit_sample: int = 5,
    resume: bool = False,
    max_new_records: int | None = None,
) -> dict[str, Any]:
    """Run or resume the bounded100 structural screen."""

    _validate_configuration(
        workers=workers,
        solver_threads=solver_threads,
        singular_timeout=singular_timeout,
        singular_audit_sample=singular_audit_sample,
        max_new_records=max_new_records,
    )
    if not singular_executable:
        raise StructuralScreenError("singular_executable must be nonempty")
    try:
        source = realize.load_verified_source(source_run)
    except realize.RealizationError as exc:
        raise StructuralScreenError(str(exc)) from exc
    models = _models_in_source_order(source)
    out = Path(out_dir)
    if out.resolve() == source.run_dir:
        raise StructuralScreenError("output directory must differ from source run")
    if out.exists():
        unexpected = sorted(
            path.name for path in out.iterdir() if path.name not in _MANIFEST_FILES
        )
        if unexpected:
            raise StructuralScreenError(f"unexpected output artifacts: {unexpected}")
        if not resume and any(out.iterdir()):
            raise StructuralScreenError(
                "output is nonempty; pass resume=True to validate and continue"
            )
    out.mkdir(parents=True, exist_ok=True)

    expected_manifest = _expected_manifest(
        source,
        workers=workers,
        solver_threads=solver_threads,
        singular_timeout=singular_timeout,
        singular_executable=singular_executable,
        singular_audit_sample=singular_audit_sample,
    )
    manifest_path = out / "manifest.json"
    if manifest_path.exists():
        if not resume:
            raise StructuralScreenError("output manifest already exists")
        if _read_json(manifest_path) != expected_manifest:
            raise StructuralScreenError("resume manifest/configuration mismatch")
    else:
        if resume and any(out.iterdir()):
            raise StructuralScreenError("resume artifacts exist without manifest.json")
        _atomic_json(manifest_path, expected_manifest)

    _load_or_run_smoke(out, timeout_s=singular_timeout, executable=singular_executable)
    records = _load_existing_records(
        out,
        models=models,
        source_manifest_sha256=source.manifest_sha256,
        singular_audit_sample=singular_audit_sample,
    )
    summary_path = out / "summary.json"
    if summary_path.exists() and len(records) != MODEL_COUNT:
        raise StructuralScreenError(
            "summary.json exists for an incomplete result stream"
        )
    if len(records) == MODEL_COUNT:
        if not summary_path.exists():
            _atomic_json(
                summary_path,
                _summary(out, manifest=expected_manifest, records=records),
            )
        return _validate_summary(
            _read_json(summary_path),
            out=out,
            manifest=expected_manifest,
            records=records,
        )

    first = len(records)
    last = MODEL_COUNT
    if max_new_records is not None:
        last = min(last, first + max_new_records)
    analyses = {index: _analyze_model(models[index]) for index in range(first, last)}
    singular_targets = [
        index
        for index in range(first, last)
        if analyses[index]["detection"] is None or index < singular_audit_sample
    ]
    singular_results = _probe_batch(
        analyses,
        singular_targets,
        workers=workers,
        timeout_s=singular_timeout,
        executable=singular_executable,
    )

    previous = records[-1]["record_sha256"] if records else None
    results_path = out / "results.jsonl"
    for index in range(first, last):
        record = _make_record(
            screen_index=index,
            model=models[index],
            source_manifest_sha256=source.manifest_sha256,
            analysis=analyses[index],
            singular=singular_results.get(index),
            previous_record_sha256=previous,
        )
        _validate_record(
            record,
            screen_index=index,
            model=models[index],
            source_manifest_sha256=source.manifest_sha256,
            singular_audit_sample=singular_audit_sample,
            previous_record_sha256=previous,
        )
        _append_record(results_path, record)
        previous = record["record_sha256"]

    records = _load_existing_records(
        out,
        models=models,
        source_manifest_sha256=source.manifest_sha256,
        singular_audit_sample=singular_audit_sample,
    )
    if len(records) != MODEL_COUNT:
        return {
            "status": "INCOMPLETE",
            "record_count": len(records),
            "expected_result_count": MODEL_COUNT,
            "next_screen_index": len(records),
        }
    summary = _summary(out, manifest=expected_manifest, records=records)
    _atomic_json(summary_path, summary)
    return _validate_summary(
        _read_json(summary_path),
        out=out,
        manifest=expected_manifest,
        records=records,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-run", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--solver-threads", type=int, default=1)
    parser.add_argument("--singular-timeout", type=int, default=30)
    parser.add_argument("--singular-executable", default="Singular")
    parser.add_argument("--singular-audit-sample", type=int, default=5)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    try:
        result = run_driver(
            args.source_run,
            args.out,
            workers=args.workers,
            solver_threads=args.solver_threads,
            singular_timeout=args.singular_timeout,
            singular_executable=args.singular_executable,
            singular_audit_sample=args.singular_audit_sample,
            resume=args.resume,
        )
    except StructuralScreenError as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
