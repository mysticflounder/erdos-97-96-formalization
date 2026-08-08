"""Fail-closed replay of one piqd SAT model for an exact12 v14 source job.

This is a source-semantic replay boundary, not a certificate or coverage
claim.  The source job, current source files, discovery DIMACS, and piqd model
are all authenticated before the independent exact12 predicates are run.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import os
import stat
import sys
from collections.abc import Collection, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head.exact12_v14_bound_jobs import (
    BOUND_JOB_SCHEMA,
    Exact12V14BoundJobError,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_cell_run import cnf_assignment_satisfies
from census.card_head.exact12_v14_schedule import build_manifest, json_sha256
from census.card_head.exact12_v14_structural_cegar import (
    Exact12V14StructuralCegarError,
    _canonical_cube_payload,
    detect_structural_certificate,
    learned_clause_for_certificate,
    validate_structural_certificate,
)
from census.card_head.exact12_v14_valuation import (
    Exact12V14ValuationError,
    added_constraints_hold,
    decode_blockers,
)
from census.card_head.source_faithful_candidate_surface import (
    source_faithful_cube_ok,
)
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, parse_dimacs

REPLAY_SCHEMA = "p97_rigid221_exact12_full_v14_piqd_model_replay.v1"
REPLAY_STATUS = "FINITE_SOURCE_SEMANTIC_REPLAY"
REPLAY_SCOPE = (
    "one authenticated finite normalized-v14 cell; source-semantic SAT-model "
    "replay only; no aggregate coverage, universal lift, or Lean closure"
)
SOURCE_CLASSIFIER_SCHEMA = "p97-cegar-source-derived-duplicate-center/v2"
SOURCE_CLASSIFIER_STATUS = (
    "FINITE_LOCAL_SOURCE_DERIVED_DUPLICATE_CENTER_WITH_RESIDENT_SOURCE_SNAPSHOT"
)
SOURCE_CLASSIFIER_STAGE = "equality-duplicate-center"
SOURCE_CLASSIFIER_DETECTOR_CONTRACT = (
    "formalized order-independent metric core plus exact certificate replay"
)
SOURCE_CLASSIFIER_DETECTOR_FILES: tuple[str, ...] = (
    "census/card_head/exact12_v14_structural_cegar.py",
    "census/card_head/sat_encoding.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
)
# Compatibility names used by the campaign's artifact builders.  These are
# local aliases of the stage-specific pins, not imports from the mutable global
# structural-detector contract.
DETECTOR_CONTRACT = SOURCE_CLASSIFIER_DETECTOR_CONTRACT
DETECTOR_FILES = SOURCE_CLASSIFIER_DETECTOR_FILES
SOURCE_CLASSIFIER_SCOPE = (
    "one authenticated finite exact12 source-job/CNF/model snapshot; selected "
    "positive support and replayed duplicate-center certificate only; detector "
    "custody is an authenticated resident source-byte snapshot distinct from the "
    "already-imported executed Python code; no executed-byte provenance, ambient "
    "fiber completeness, aggregate coverage, universal lift, or Lean theorem closure"
)
SOURCE_CLASSIFIER_SEMANTICS = {
    "certificate_rows_exact_false": True,
    "certificate_support_is_selected_positive_subset": True,
    "ambient_fiber_completeness": False,
}
SOURCE_CLASSIFIER_CLAIMS = {
    "aggregate_coverage": False,
    "universal_lift": False,
    "lean_theorem_closure": False,
}
SOURCE_CLASSIFIER_DETECTOR_CUSTODY = {
    "complete_declared_source_snapshot": True,
    "no_follow_regular_files": True,
    "executed_byte_provenance": False,
}
_MODEL_KEYS = frozenset({"job_id", "result", "num_assigned", "assignment"})
_SOURCE_CLASSIFIER_KEYS = frozenset(
    {
        "schema",
        "status",
        "scope",
        "model_sha256",
        "source_job_sha256",
        "discovery_cnf_sha256",
        "source_bundle_sha256",
        "cube",
        "cube_sha256",
        "detector_contract",
        "detector_source_manifest",
        "detector_custody",
        "detector_contract_sha256",
        "certificate",
        "certificate_sha256",
        "learned_clause",
        "selected_positive_variables",
        "selected_positive_variables_sha256",
        "stage",
        "row_semantics",
        "claims",
    }
)


@dataclass(frozen=True)
class _Exact12ReplayEvidence:
    receipt: dict[str, Any]
    cube: Mapping[int, Collection[int]]
    instance: Any
    positive_variables: frozenset[int]


class Exact12PiqdReplayError(ValueError):
    """An input failed the finite exact12 source-semantic replay contract."""

    def __init__(self, message: str, *, receipt: Mapping[str, Any] | None = None):
        super().__init__(message)
        self.receipt = dict(receipt) if receipt is not None else None


def canonical_json_bytes(value: Any) -> bytes:
    """Return the receipt's canonical JSON encoding."""

    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _json_sha256(value: Any) -> str:
    return _sha256(canonical_json_bytes(value))


def _digest(value: Any, label: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise Exact12PiqdReplayError(f"{label} must be a lowercase SHA-256 digest")
    return value


def _read_bytes(path: Path, label: str) -> bytes:
    try:
        return path.read_bytes()
    except OSError as exc:
        raise Exact12PiqdReplayError(f"cannot read {label}: {path}") from exc


def _read_detector_source_no_follow(repo_root: Path, relative: str) -> bytes:
    """Snapshot one declared detector source without following any relative symlink."""

    parts = Path(relative).parts
    if (
        not parts
        or Path(relative).is_absolute()
        or any(part in {"", ".", ".."} for part in parts)
    ):
        raise Exact12PiqdReplayError(f"detector source path is unsafe: {relative}")
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    file_flags = os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW
    directory_flags |= getattr(os, "O_CLOEXEC", 0)
    file_flags |= getattr(os, "O_CLOEXEC", 0)
    descriptors: list[int] = []
    try:
        descriptor = os.open(os.fspath(repo_root), directory_flags)
        descriptors.append(descriptor)
        for component in parts[:-1]:
            descriptor = os.open(component, directory_flags, dir_fd=descriptor)
            descriptors.append(descriptor)
        source_fd = os.open(parts[-1], file_flags, dir_fd=descriptor)
        descriptors.append(source_fd)
        if not stat.S_ISREG(os.fstat(source_fd).st_mode):
            raise Exact12PiqdReplayError(
                f"detector source is not a regular file: {relative}"
            )
        chunks: list[bytes] = []
        while chunk := os.read(source_fd, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    except Exact12PiqdReplayError:
        raise
    except OSError as exc:
        raise Exact12PiqdReplayError(
            f"cannot snapshot detector source without following symlinks: {relative}"
        ) from exc
    finally:
        for descriptor in reversed(descriptors):
            try:
                os.close(descriptor)
            except OSError:
                pass


def _detector_source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    """Capture the complete declared detector source closure exactly once."""

    manifest: list[dict[str, Any]] = []
    for relative in SOURCE_CLASSIFIER_DETECTOR_FILES:
        payload = _read_detector_source_no_follow(Path(repo_root), relative)
        manifest.append(
            {
                "path": relative,
                "bytes": len(payload),
                "sha256": _sha256(payload),
                "content_base64": base64.b64encode(payload).decode("ascii"),
            }
        )
    return manifest


def _validate_detector_source_manifest(value: Any) -> list[Mapping[str, Any]]:
    if not isinstance(value, list) or len(value) != len(
        SOURCE_CLASSIFIER_DETECTOR_FILES
    ):
        raise Exact12PiqdReplayError(
            "source classifier detector source bundle is incomplete"
        )
    for expected_path, item in zip(
        SOURCE_CLASSIFIER_DETECTOR_FILES, value, strict=True
    ):
        if not isinstance(item, Mapping) or set(item) != {
            "path",
            "bytes",
            "sha256",
            "content_base64",
        }:
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle entry is malformed"
            )
        if item["path"] != expected_path:
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle path mismatch"
            )
        content = item["content_base64"]
        if not isinstance(content, str):
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle content is malformed"
            )
        try:
            payload = base64.b64decode(content, validate=True)
        except (ValueError, base64.binascii.Error) as exc:
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle content is malformed"
            ) from exc
        if base64.b64encode(payload).decode("ascii") != content:
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle is not canonical base64"
            )
        if (
            isinstance(item["bytes"], bool)
            or not isinstance(item["bytes"], int)
            or item["bytes"] != len(payload)
            or item["sha256"] != _sha256(payload)
        ):
            raise Exact12PiqdReplayError(
                "source classifier detector source bundle identity mismatch"
            )
        _digest(item["sha256"], "detector source sha256")
    return value


def _detector_contract_sha256(manifest: Sequence[Mapping[str, Any]]) -> str:
    return _json_sha256(
        {
            "detector_contract": SOURCE_CLASSIFIER_DETECTOR_CONTRACT,
            "source_manifest": list(manifest),
        }
    )


def _validate_certificate_row_semantics(
    certificate: Mapping[str, Any], cube: Mapping[str, list[int]]
) -> None:
    rows = certificate.get("rows")
    if not isinstance(rows, list) or not rows:
        raise Exact12PiqdReplayError("source classifier certificate rows are missing")
    for row in rows:
        if not isinstance(row, Mapping) or set(row) != {"center", "support", "exact"}:
            raise Exact12PiqdReplayError(
                "source classifier certificate row is malformed"
            )
        center = row["center"]
        support = row["support"]
        if row["exact"] is not False:
            raise Exact12PiqdReplayError(
                "source classifier certificate rows must all have exact=false"
            )
        if (
            isinstance(center, bool)
            or not isinstance(center, int)
            or str(center) not in cube
            or not isinstance(support, list)
            or any(
                isinstance(point, bool) or not isinstance(point, int)
                for point in support
            )
            or len(support) != len(set(support))
        ):
            raise Exact12PiqdReplayError(
                "source classifier certificate row is malformed"
            )
        if not set(support).issubset(cube[str(center)]):
            raise Exact12PiqdReplayError(
                "certificate support is not a subset of selected positive support"
            )


def validate_source_duplicate_center_classifier(value: Mapping[str, Any]) -> None:
    """Validate a source-derived classifier and its embedded source snapshot."""

    if value.get("schema") == "p97-cegar-source-derived-duplicate-center/v1":
        raise Exact12PiqdReplayError(
            "legacy v1 source classifier lacks v2 custody and witness semantics"
        )
    if set(value) != _SOURCE_CLASSIFIER_KEYS:
        raise Exact12PiqdReplayError("source classifier fields differ from schema")
    if (
        value["schema"] != SOURCE_CLASSIFIER_SCHEMA
        or value["status"] != SOURCE_CLASSIFIER_STATUS
        or value["scope"] != SOURCE_CLASSIFIER_SCOPE
        or value["stage"] != SOURCE_CLASSIFIER_STAGE
        or value["detector_contract"] != SOURCE_CLASSIFIER_DETECTOR_CONTRACT
        or value["detector_custody"] != SOURCE_CLASSIFIER_DETECTOR_CUSTODY
        or value["row_semantics"] != SOURCE_CLASSIFIER_SEMANTICS
        or value["claims"] != SOURCE_CLASSIFIER_CLAIMS
    ):
        raise Exact12PiqdReplayError("source classifier contract metadata mismatch")
    for field in (
        "model_sha256",
        "source_job_sha256",
        "discovery_cnf_sha256",
        "source_bundle_sha256",
        "cube_sha256",
        "detector_contract_sha256",
        "certificate_sha256",
        "selected_positive_variables_sha256",
    ):
        _digest(value[field], f"source classifier {field}")
    try:
        cube = _canonical_cube_payload(value["cube"], cardinality=12)
    except (Exact12V14StructuralCegarError, TypeError, ValueError) as exc:
        raise Exact12PiqdReplayError("source classifier cube is malformed") from exc
    if value["cube"] != cube or value["cube_sha256"] != _json_sha256(cube):
        raise Exact12PiqdReplayError(
            "source classifier canonical cube identity mismatch"
        )
    manifest = _validate_detector_source_manifest(value["detector_source_manifest"])
    if value["detector_contract_sha256"] != _detector_contract_sha256(manifest):
        raise Exact12PiqdReplayError(
            "source classifier detector contract hash mismatch"
        )
    certificate = value["certificate"]
    if not isinstance(certificate, Mapping):
        raise Exact12PiqdReplayError("source classifier certificate is malformed")
    if certificate.get("stage") != SOURCE_CLASSIFIER_STAGE:
        raise Exact12PiqdReplayError("source classifier certificate stage mismatch")
    if value["certificate_sha256"] != _json_sha256(certificate):
        raise Exact12PiqdReplayError("source classifier certificate hash mismatch")
    if not validate_structural_certificate(certificate, n=12):
        raise Exact12PiqdReplayError("source classifier certificate replay failed")
    _validate_certificate_row_semantics(certificate, cube)
    clause = value["learned_clause"]
    if (
        not isinstance(clause, list)
        or not clause
        or any(
            isinstance(literal, bool) or not isinstance(literal, int) or literal >= 0
            for literal in clause
        )
        or len(clause) != len(set(clause))
    ):
        raise Exact12PiqdReplayError("source classifier learned clause is malformed")
    selected_positive = value["selected_positive_variables"]
    if (
        not isinstance(selected_positive, list)
        or any(
            isinstance(variable, bool) or not isinstance(variable, int) or variable <= 0
            for variable in selected_positive
        )
        or selected_positive != sorted(set(selected_positive))
    ):
        raise Exact12PiqdReplayError(
            "source classifier selected positive variables are malformed"
        )
    if value["selected_positive_variables_sha256"] != _json_sha256(selected_positive):
        raise Exact12PiqdReplayError(
            "source classifier selected positive variable identity mismatch"
        )
    selected_set = set(selected_positive)
    if any(abs(literal) not in selected_set for literal in clause):
        raise Exact12PiqdReplayError(
            "source classifier learned clause is not falsified by the selected "
            "positive assignment"
        )


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            parse_constant=reject_constant,
            object_pairs_hook=reject_duplicates,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12PiqdReplayError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise Exact12PiqdReplayError(f"{source} must contain a JSON object")
    return value


def _gate(
    gates: dict[str, Any], name: str, ok: bool, detail: str | None = None
) -> None:
    item: dict[str, Any] = {"ok": bool(ok)}
    if detail is not None:
        item["detail"] = detail
    gates[name] = item


def _assignment(
    assignment: Any, num_assigned: Any, n_variables: int
) -> tuple[int, ...]:
    if isinstance(num_assigned, bool) or not isinstance(num_assigned, int):
        raise Exact12PiqdReplayError("model.num_assigned must be an integer")
    if not isinstance(assignment, list):
        raise Exact12PiqdReplayError("model.assignment must be an array")
    if num_assigned != len(assignment) or num_assigned != n_variables:
        raise Exact12PiqdReplayError(
            "model assignment is not a full assignment of the DIMACS variables"
        )
    values: dict[int, int] = {}
    for literal in assignment:
        if isinstance(literal, bool) or not isinstance(literal, int) or literal == 0:
            raise Exact12PiqdReplayError(
                "model assignment must contain nonzero signed integers"
            )
        variable = abs(literal)
        if variable < 1 or variable > n_variables:
            raise Exact12PiqdReplayError(
                f"model literal {literal} is outside 1..={n_variables}"
            )
        if variable in values:
            raise Exact12PiqdReplayError(
                f"model assigns variable {variable} more than once"
            )
        values[variable] = literal
    if set(values) != set(range(1, n_variables + 1)):
        raise Exact12PiqdReplayError("model does not assign every DIMACS variable")
    return tuple(assignment)


def _replay_exact12_model_evidence_snapshot(
    repo_root: Path,
    *,
    source_job_path: Path,
    source_job_bytes: bytes,
    discovery_cnf_path: Path,
    discovery_cnf_bytes: bytes,
    model_path: Path,
    model_bytes: bytes,
    expected_piqd_job_id: str,
) -> _Exact12ReplayEvidence:
    """Replay snapshots once and retain the decoded cube for trusted consumers.

    Any failed gate raises :class:`Exact12PiqdReplayError`.  The exception's
    ``receipt`` contains the failed gate whenever validation got far enough to
    construct one.  The paths are identity labels retained verbatim in the
    receipt; this function never opens them.
    """

    repo_root = Path(repo_root)
    source_job_path = Path(source_job_path)
    discovery_cnf_path = Path(discovery_cnf_path)
    model_path = Path(model_path)
    if not isinstance(expected_piqd_job_id, str) or not expected_piqd_job_id.strip():
        raise Exact12PiqdReplayError("expected_piqd_job_id must be a non-empty string")
    snapshots = {
        "source job": source_job_bytes,
        "discovery CNF": discovery_cnf_bytes,
        "piqd model": model_bytes,
    }
    for label, payload in snapshots.items():
        if not isinstance(payload, bytes):
            raise Exact12PiqdReplayError(f"{label} snapshot must be immutable bytes")
    job_raw = source_job_bytes
    cnf_raw = discovery_cnf_bytes
    model_raw = model_bytes
    gates: dict[str, Any] = {}
    input_hashes = {
        "source_job_sha256": _sha256(job_raw),
        "discovery_cnf_sha256": _sha256(cnf_raw),
        "model_sha256": _sha256(model_raw),
    }
    receipt: dict[str, Any] = {
        "schema": REPLAY_SCHEMA,
        "semantic_status": REPLAY_STATUS,
        "scope": REPLAY_SCOPE,
        "inputs": {
            "source_job": str(source_job_path),
            "discovery_cnf": str(discovery_cnf_path),
            "model": str(model_path),
            "expected_piqd_job_id": expected_piqd_job_id,
        },
        "hashes": input_hashes,
        "gates": gates,
    }

    try:
        job = _strict_json(job_raw, source="source job")
        model = _strict_json(model_raw, source="piqd model")
        _gate(gates, "strict_json", True)
    except Exact12PiqdReplayError as exc:
        _gate(gates, "strict_json", False, str(exc))
        receipt["status"] = "REJECTED"
        receipt["failure"] = str(exc)
        exc.receipt = receipt
        raise

    if set(model) != _MODEL_KEYS:
        error = "piqd model keys differ from the exact model schema"
        _gate(gates, "model_schema", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        exc = Exact12PiqdReplayError(error, receipt=receipt)
        raise exc
    _gate(gates, "model_schema", True)

    job_id = job.get("job_id")
    if job.get("schema") != BOUND_JOB_SCHEMA or not isinstance(job_id, str):
        error = "source job is not a typed exact12 v14 bound job"
        _gate(gates, "job_schema", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "job_schema", True)
    receipt["job"] = {
        "source_job_id": job_id,
        "piqd_job_id": expected_piqd_job_id,
        "cell_index": job.get("cell_index"),
        "job_sha256": json_sha256(job),
    }

    if model["result"] != "SAT":
        error = "piqd model result is not SAT"
        _gate(gates, "sat_result", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "sat_result", True)
    if model["job_id"] != expected_piqd_job_id:
        error = "piqd model job_id does not match expected piqd job ID"
        _gate(gates, "piqd_job_id", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    _gate(gates, "piqd_job_id", True)

    try:
        expected_cnf = job["cnf"]
        if (
            not isinstance(expected_cnf, Mapping)
            or expected_cnf.get("encoding") != "DIMACS"
            or _sha256(cnf_raw) != expected_cnf.get("sha256")
            or len(cnf_raw) != expected_cnf.get("bytes")
        ):
            raise Exact12PiqdReplayError(
                "discovery CNF hash or byte count differs from job"
            )
        n_variables, clauses = parse_dimacs(cnf_raw)
        expected_variables = expected_cnf.get("n_variables")
        expected_clauses = expected_cnf.get("n_clauses")
        if n_variables != expected_variables or len(clauses) != expected_clauses:
            raise Exact12PiqdReplayError("discovery CNF dimensions differ from job")
        receipt["cnf"] = {
            "n_variables": n_variables,
            "n_clauses": len(clauses),
            "bytes": len(cnf_raw),
        }
        _gate(gates, "cnf_identity", True)
    except (Exact12PiqdReplayError, PiqdOracleError, KeyError, TypeError) as exc:
        error = str(exc)
        _gate(gates, "cnf_identity", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt) from exc

    try:
        assignment = _assignment(
            model["assignment"], model["num_assigned"], n_variables
        )
    except Exact12PiqdReplayError as exc:
        _gate(gates, "total_assignment", False, str(exc))
        receipt["status"] = "REJECTED"
        receipt["failure"] = str(exc)
        exc.receipt = receipt
        raise
    _gate(gates, "total_assignment", True)
    positive = frozenset(literal for literal in assignment if literal > 0)

    try:
        schedule_manifest = build_manifest(repo_root)
        materialized = instantiate_validated_bound_job(
            job, schedule_manifest, repo_root
        )
        rebuilt_cnf = materialized.instance.dimacs().encode("ascii")
        if rebuilt_cnf != cnf_raw:
            raise Exact12PiqdReplayError(
                "current source rebuild differs from discovery CNF"
            )
        receipt["source"] = {
            "schedule_manifest_sha256": json_sha256(schedule_manifest),
            "rebuilt_cnf_sha256": _sha256(rebuilt_cnf),
        }
        _gate(gates, "current_source_rebuild", True)
    except (
        Exact12PiqdReplayError,
        Exact12V14BoundJobError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        error = str(exc)
        _gate(gates, "current_source_rebuild", False, error)
        receipt["status"] = "REJECTED"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt) from exc

    exact_cnf = cnf_assignment_satisfies(
        materialized.instance.cnf.clauses,
        positive,
        n_variables=materialized.instance.cnf.n_variables,
    )
    _gate(gates, "exact_cnf", exact_cnf)
    canonical_cube: dict[str, list[int]] | None = None
    try:
        cube = materialized.instance.decode_model(positive)
        candidate = source_faithful_cube_ok(materialized.instance.model, cube)
        canonical_cube = _canonical_cube_payload(
            cube, cardinality=materialized.instance.model.cardinality
        )
    except (Exact12V14StructuralCegarError, ValueError, TypeError, KeyError) as exc:
        cube = None
        candidate = False
        _gate(gates, "source_faithful_candidate", False, str(exc))
    else:
        _gate(gates, "source_faithful_candidate", candidate)

    try:
        blockers = decode_blockers(positive, materialized.compiled.blocker_variables)
        _gate(gates, "blocker_decoding", True)
    except (Exact12V14ValuationError, ValueError, TypeError) as exc:
        blockers = None
        _gate(gates, "blocker_decoding", False, str(exc))

    added = False
    if blockers is not None and cube is not None:
        added = added_constraints_hold(materialized.compiled.cell, cube, blockers)
    _gate(gates, "added_constraints", added)

    overall = all(item["ok"] for item in gates.values())
    receipt["status"] = "ACCEPTED" if overall else "REJECTED"
    if canonical_cube is not None:
        receipt["decoded"] = {"cube_sha256": _json_sha256(canonical_cube)}
    if blockers is not None:
        receipt.setdefault("decoded", {})["blockers"] = {
            str(source): center for source, center in sorted(blockers.items())
        }
    receipt["assignment"] = {
        "num_variables": n_variables,
        "num_assigned": len(assignment),
        "positive_count": len(positive),
    }
    if not overall:
        error = "one or more source-semantic replay gates failed"
        receipt["failure"] = error
        raise Exact12PiqdReplayError(error, receipt=receipt)
    if cube is None:
        raise Exact12PiqdReplayError("accepted replay is missing its decoded cube")
    return _Exact12ReplayEvidence(
        receipt=receipt,
        cube=cube,
        instance=materialized.instance,
        positive_variables=positive,
    )


def replay_exact12_model_snapshot(
    repo_root: Path,
    *,
    source_job_path: Path,
    source_job_bytes: bytes,
    discovery_cnf_path: Path,
    discovery_cnf_bytes: bytes,
    model_path: Path,
    model_bytes: bytes,
    expected_piqd_job_id: str,
) -> dict[str, Any]:
    """Replay immutable input snapshots and return a canonical finite-cell receipt.

    The paths are identity labels only and are never reopened.  Source-derived
    consumers use the same internal replay result rather than decoding via a
    second path read.
    """

    return _replay_exact12_model_evidence_snapshot(
        repo_root,
        source_job_path=source_job_path,
        source_job_bytes=source_job_bytes,
        discovery_cnf_path=discovery_cnf_path,
        discovery_cnf_bytes=discovery_cnf_bytes,
        model_path=model_path,
        model_bytes=model_bytes,
        expected_piqd_job_id=expected_piqd_job_id,
    ).receipt


def derive_source_duplicate_center_classifier_snapshot(
    repo_root: Path,
    *,
    source_job_path: Path,
    source_job_bytes: bytes,
    discovery_cnf_path: Path,
    discovery_cnf_bytes: bytes,
    model_path: Path,
    model_bytes: bytes,
    source_bundle_bytes: bytes,
    expected_piqd_job_id: str,
) -> tuple[dict[str, Any], dict[str, Any]]:
    """Replay once and derive the only classifier admitted by the campaign."""

    if not isinstance(source_bundle_bytes, bytes):
        raise Exact12PiqdReplayError("source bundle snapshot must be immutable bytes")
    detector_manifest = _detector_source_manifest(repo_root)
    evidence = _replay_exact12_model_evidence_snapshot(
        repo_root,
        source_job_path=source_job_path,
        source_job_bytes=source_job_bytes,
        discovery_cnf_path=discovery_cnf_path,
        discovery_cnf_bytes=discovery_cnf_bytes,
        model_path=model_path,
        model_bytes=model_bytes,
        expected_piqd_job_id=expected_piqd_job_id,
    )
    if evidence.instance.model.cardinality != 12:
        raise Exact12PiqdReplayError("source classifier requires exact cardinality 12")
    cube = _canonical_cube_payload(evidence.cube, cardinality=12)
    try:
        certificate = detect_structural_certificate(evidence.cube, n=12)
        if certificate is None:
            raise Exact12PiqdReplayError(
                "decoded cube has no replay-valid structural certificate"
            )
        if certificate.get("stage") != SOURCE_CLASSIFIER_STAGE:
            raise Exact12PiqdReplayError(
                "decoded cube is not classified at equality-duplicate-center"
            )
        if not validate_structural_certificate(certificate, n=12):
            raise Exact12PiqdReplayError(
                "detected duplicate-center certificate failed independent replay"
            )
        _validate_certificate_row_semantics(certificate, cube)
        learned_clause = learned_clause_for_certificate(evidence.instance, certificate)
    except Exact12PiqdReplayError:
        raise
    except (Exact12V14StructuralCegarError, KeyError, TypeError, ValueError) as exc:
        raise Exact12PiqdReplayError(
            f"source-derived structural classification failed: {exc}"
        ) from exc
    selected_positive_variables = sorted(evidence.positive_variables)
    if any(
        abs(literal) not in evidence.positive_variables for literal in learned_clause
    ):
        raise Exact12PiqdReplayError(
            "source-derived learned clause is not falsified by the selected positive "
            "assignment"
        )
    artifact = {
        "schema": SOURCE_CLASSIFIER_SCHEMA,
        "status": SOURCE_CLASSIFIER_STATUS,
        "scope": SOURCE_CLASSIFIER_SCOPE,
        "model_sha256": _sha256(model_bytes),
        "source_job_sha256": _sha256(source_job_bytes),
        "discovery_cnf_sha256": _sha256(discovery_cnf_bytes),
        "source_bundle_sha256": _sha256(source_bundle_bytes),
        "cube": cube,
        "cube_sha256": _json_sha256(cube),
        "detector_contract": SOURCE_CLASSIFIER_DETECTOR_CONTRACT,
        "detector_source_manifest": detector_manifest,
        "detector_custody": dict(SOURCE_CLASSIFIER_DETECTOR_CUSTODY),
        "detector_contract_sha256": _detector_contract_sha256(detector_manifest),
        "certificate": dict(certificate),
        "certificate_sha256": _json_sha256(certificate),
        "learned_clause": list(learned_clause),
        "selected_positive_variables": selected_positive_variables,
        "selected_positive_variables_sha256": _json_sha256(selected_positive_variables),
        "stage": SOURCE_CLASSIFIER_STAGE,
        "row_semantics": dict(SOURCE_CLASSIFIER_SEMANTICS),
        "claims": dict(SOURCE_CLASSIFIER_CLAIMS),
    }
    if artifact["cube_sha256"] != evidence.receipt["decoded"]["cube_sha256"]:
        raise Exact12PiqdReplayError("replay and classifier cube identities diverged")
    validate_source_duplicate_center_classifier(artifact)
    return evidence.receipt, artifact


def replay_exact12_model(
    repo_root: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
    model_path: Path,
    expected_piqd_job_id: str,
) -> dict[str, Any]:
    """Read the three public path inputs once and delegate to snapshot replay."""

    source_job_path = Path(source_job_path)
    discovery_cnf_path = Path(discovery_cnf_path)
    model_path = Path(model_path)
    return replay_exact12_model_snapshot(
        repo_root,
        source_job_path=source_job_path,
        source_job_bytes=_read_bytes(source_job_path, "source job"),
        discovery_cnf_path=discovery_cnf_path,
        discovery_cnf_bytes=_read_bytes(discovery_cnf_path, "discovery CNF"),
        model_path=model_path,
        model_bytes=_read_bytes(model_path, "piqd model"),
        expected_piqd_job_id=expected_piqd_job_id,
    )


def _open_receipt_parent(absolute: Path) -> int:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        parent_fd = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise Exact12PiqdReplayError(
            f"receipt parent contains a symlink or cannot be opened: {absolute.parent}"
        ) from exc
    try:
        for component in absolute.parts[1:-1]:
            try:
                next_fd = os.open(component, flags, dir_fd=parent_fd)
            except OSError as exc:
                raise Exact12PiqdReplayError(
                    f"receipt parent contains a symlink or cannot be opened: {absolute.parent}"
                ) from exc
            os.close(parent_fd)
            parent_fd = next_fd
    except BaseException:
        os.close(parent_fd)
        raise
    return parent_fd


def _open_receipt_temp(parent_fd: int, prefix: str) -> tuple[int, str]:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    for _ in range(128):
        name = f".{prefix}.{os.urandom(16).hex()}.tmp"
        try:
            return os.open(name, flags, 0o600, dir_fd=parent_fd), name
        except FileExistsError:
            continue
        except OSError as exc:
            raise Exact12PiqdReplayError(
                "cannot create temporary receipt in its parent directory"
            ) from exc
    raise Exact12PiqdReplayError("cannot create a unique temporary receipt")


def write_receipt(path: Path, receipt: Mapping[str, Any]) -> None:
    """Write a canonical receipt using descriptor-relative atomic replacement."""

    payload = canonical_json_bytes(dict(receipt)) + b"\n"
    absolute = Path(os.path.abspath(os.fspath(path)))
    parent_fd: int | None = None
    temporary: str | None = None
    try:
        parent_fd = _open_receipt_parent(absolute)
        try:
            target_stat = os.stat(
                absolute.name, dir_fd=parent_fd, follow_symlinks=False
            )
        except FileNotFoundError:
            target_stat = None
        except OSError as exc:
            raise Exact12PiqdReplayError(
                f"cannot inspect receipt target: {absolute}"
            ) from exc
        if target_stat is not None and stat.S_ISLNK(target_stat.st_mode):
            raise Exact12PiqdReplayError(f"receipt target is a symlink: {absolute}")

        fd, temporary = _open_receipt_temp(parent_fd, absolute.name or "receipt")
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(
            temporary,
            absolute.name,
            src_dir_fd=parent_fd,
            dst_dir_fd=parent_fd,
        )
        temporary = None
        os.fsync(parent_fd)
    except Exact12PiqdReplayError:
        raise
    except (OSError, ValueError) as exc:
        raise Exact12PiqdReplayError(f"cannot write receipt: {absolute}") from exc
    finally:
        if parent_fd is not None:
            if temporary is not None:
                try:
                    os.unlink(temporary, dir_fd=parent_fd)
                except FileNotFoundError:
                    pass
            os.close(parent_fd)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--source-job", type=Path, required=True)
    parser.add_argument("--discovery-cnf", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--expected-piqd-job-id", required=True)
    parser.add_argument("--receipt", type=Path)
    parser.add_argument("--source-bundle", type=Path)
    parser.add_argument("--classifier", type=Path)
    args = parser.parse_args(argv)
    if (args.source_bundle is None) != (args.classifier is None):
        parser.error("--source-bundle and --classifier must be supplied together")
    classifier: dict[str, Any] | None = None
    try:
        if args.classifier is None:
            receipt = replay_exact12_model(
                args.repo_root,
                args.source_job,
                args.discovery_cnf,
                args.model,
                args.expected_piqd_job_id,
            )
        else:
            receipt, classifier = derive_source_duplicate_center_classifier_snapshot(
                args.repo_root,
                source_job_path=args.source_job,
                source_job_bytes=_read_bytes(args.source_job, "source job"),
                discovery_cnf_path=args.discovery_cnf,
                discovery_cnf_bytes=_read_bytes(args.discovery_cnf, "discovery CNF"),
                model_path=args.model,
                model_bytes=_read_bytes(args.model, "piqd model"),
                source_bundle_bytes=_read_bytes(args.source_bundle, "source bundle"),
                expected_piqd_job_id=args.expected_piqd_job_id,
            )
        code = 0
    except Exact12PiqdReplayError as exc:
        receipt = exc.receipt or {
            "schema": REPLAY_SCHEMA,
            "semantic_status": REPLAY_STATUS,
            "scope": REPLAY_SCOPE,
            "status": "REJECTED",
            "failure": str(exc),
        }
        code = 2
    if args.receipt is not None:
        write_receipt(args.receipt, receipt)
    else:
        sys.stdout.buffer.write(canonical_json_bytes(receipt) + b"\n")
    if classifier is not None:
        write_receipt(args.classifier, classifier)
    return code


if __name__ == "__main__":
    raise SystemExit(main())
