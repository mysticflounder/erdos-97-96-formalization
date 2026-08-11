"""Fail-closed custody for the projected-static-v3 PIQD canary.

PIQD results in this module are discovery evidence only.  In particular, a
terminal PIQD UNSAT never supplies proof closure: a local DRAT artifact remains
required before any mathematical or Lean claim can be made.
"""

from __future__ import annotations

import hashlib
import json
import os
import stat
import uuid
from collections.abc import Mapping
from dataclasses import dataclass, field
from pathlib import Path
from types import MappingProxyType
from typing import Any
from urllib.parse import urlsplit

from census.p97_search import phase3_piqd_incremental_discovery as incremental
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PreparedJob,
    Transport,
    raw_dimacs_identity,
)

SCHEMA = "p97-piqd-projected-static-v3-qualification/v3"
TEST_SCHEMA = "p97-piqd-projected-static-v3-qualification-test-only/v3"
PREFLIGHT_SCHEMA = "p97-piqd-projected-static-v3-preflight/v3"
TEST_PREFLIGHT_SCHEMA = "p97-piqd-projected-static-v3-preflight-test-only/v3"
VALIDATION_SCHEMA = "p97-piqd-projected-static-v3-validation/v3"
SESSION_IDENTITY_SCHEMA = "p97-piqd-session-solver-identity/v2"
SESSION_RESULT_SCHEMA = "p97-piqd-projected-static-v3-session-result/v2"
PREPARED_JOB_SCHEMA = "p97-piqd-authenticated-prepared-job/v1"

PRODUCTION_REPOSITORY_COMMIT = "942ba5770a847b9b253916191c9f1bfb3c8946c2"
PRODUCTION_BASE_SHA256 = (
    "c9c302d28ef5571f82f802c03f3a487576c648768d948e6d48a0c6da36ae8e18"
)
PRODUCTION_CURRENT_SHA256 = (
    "b36b25731a5475d32afc74d13950e388fad68183d388704fd3ad311ba925e5d5"
)
PRODUCTION_SUFFIX_SHA256 = (
    "0b5b08dcfe5ec09ed1ce3b948ebf41c59c26a92c6183ca1acbca58cf76c353a8"
)
PRODUCTION_SOURCE_MANIFEST_SHA256 = (
    "986e1204d820061c5173604ec5ced25beed6a3e94ea69935283ee8a1e9ba8628"
)
PRODUCTION_PRODUCER_MANIFEST_SHA256 = (
    "74ddf30ef786b9102b34fda4ecf6ed48ea1334ce877a063f54dfaa238197cded"
)
PRODUCTION_VARIABLE_MAP_SHA256 = (
    "e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802"
)
PRODUCTION_RAW_DIMACS_IDENTITY = (
    "62faf51e4d6b4c926bb0e21675245d51788809f663a6e50395fcb2f94fcce8cf"
)
PRODUCTION_SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
PRODUCTION_SOLVER_SHA256 = (
    "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
)
PRODUCTION_SOLVER_SIGNATURE = "cadical-3.0.0"
PRODUCTION_SOLVER_BACKEND = "cadical"
PRODUCTION_SOLVER_LANE = "sat"
PINNED_WORKER_SOLVER_STATS_KEYS = frozenset(
    {
        "vars",
        "active",
        "irredundant",
        "clauses_added",
        "solves",
        "solve_ms_total",
    }
)
PRODUCTION_SOURCE_BUNDLE = MappingProxyType(
    {
        "census/p97_search/phase3_structural_cegar_projected_static_v3.py": (
            "historical-source-projector.py",
            "a57d2c9b2f45617a068d231cf300c49c36b623908836c05e1f9dffcc7f616e08",
        ),
        "census/p97_search/phase3_three_rhombus_prefix_bank.py": (
            "historical-source-prefix-bank.py",
            "6626aaad7b03bc7ac2336fbe313b0578bd248a3d8a25475330b44496359320f9",
        ),
        "census/p97_search/sat_generate.py": (
            "historical-source-sat-generate.py",
            "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817",
        ),
    }
)
PRODUCTION_VARIABLES = 1_194
PRODUCTION_BASE_CLAUSES = 58_319
PRODUCTION_CURRENT_CLAUSES = 71_856
PRODUCTION_SUFFIX_CLAUSES = 13_537
PRODUCTION_SUFFIX_BYTES = 878_534
PRODUCTION_CANARY_CLAUSE = (91,)

MAX_CAPTURE_BYTES = 1 << 30
MAX_CONTROL_BYTES = 1 << 20
MAX_CNF_ARTIFACT_RESPONSE_BYTES = 256 << 20
JOURNAL_NAME = ".piqd-incremental-v3.jsonl"
IDENTITY_NAME = ".piqd-incremental-v3-session-identity.json"
PREFLIGHT_NAME = "preflight.json"
QUALIFICATION_NAME = "qualification.json"
SESSION_RESULT_NAME = "session-result.json"
SOLVE_RESPONSE_NAMES = ("solve-response-1.json", "solve-response-2.json")
CLOSE_RESPONSE_NAME = "session-close-response.json"

# The historical v3 canary above remains deliberately exact: SAT, append (91),
# then terminal assumption-free UNSAT.  These v2 names describe the separate
# generalized production lifecycle and do not relax that canary.
PRODUCTION_V2_AUTHORITY_SCHEMA = "p97-piqd-projected-static-v3-production-authority/v2"
PRODUCTION_V2_PREFLIGHT_SCHEMA = "p97-piqd-projected-static-v3-production-preflight/v2"
PRODUCTION_V2_QUALIFICATION_SCHEMA = (
    "p97-piqd-projected-static-v3-production-qualification/v2"
)
PRODUCTION_V2_SESSION_RESULT_SCHEMA = (
    "p97-piqd-projected-static-v3-production-session-result/v2"
)
PRODUCTION_V2_AUTHORITY_NAME = "production-authority-v2.json"
PRODUCTION_V2_PREFLIGHT_NAME = "production-preflight-v2.json"
PRODUCTION_V2_SESSION_RESULT_NAME = "production-session-result-v2.json"
PRODUCTION_V2_QUALIFICATION_NAME = "production-qualification-v2.json"

PRODUCTION_V2_POLICY = MappingProxyType(
    {
        "workers": 1,
        "parallel_mode": "sequential",
        "projected_static_v3": True,
        "persistent_discovery": True,
        "resume": False,
        "shards": False,
        "cube_batching": False,
        "discovery_proof_path": None,
        "terminal_proof": "fresh-local-drat",
        "session": "fresh-one-session",
        "journal": "dense-append-solve-v1",
        "proof_verified": False,
        "closure_claim": False,
    }
)
PRODUCTION_V2_SUCCESS_STATUSES = frozenset(
    {
        "STRUCTURAL_UNSAT_VERIFIED",
        "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
        "ENUMERATION_COMPLETE_WITH_SURVIVORS",
    }
)

JOB_STATUS_KEYS = {
    "id",
    "status",
    "result",
    "backend",
    "project",
    "timeout_s",
    "march_timeout_s",
    "wall_ms",
    "wall_human",
    "running_for_s",
    "created_at",
    "confirmed_at",
    "started_at",
    "completed_at",
    "model_blob_hash",
    "requested_core_limit",
    "attested_solver_processes",
    "attestation_basis",
}
JOB_STATUS_OPTIONAL_KEYS = {"progress", "log_tail", "log_size_bytes"}
JOB_STATUS_FUTURE_CUSTODY_KEYS = {"cnf_blob_hash", "identity_hash"}
JOB_PROGRESS_KEYS = {
    "backend",
    "last_line",
    "cubes_total",
    "cubes_done",
    "cubes_sat",
    "cubes_unsat",
    "cubes_unknown",
    "decisions",
    "conflicts",
    "restarts",
    "elapsed_s",
    "solver_version",
    "solver_started",
    "spawn_failure",
}
MAX_JOB_STATUS_UNKNOWN_KEYS = 16
MAX_JOB_STATUS_KEY_BYTES = 64
MAX_JOB_STATUS_BYTES = 64 << 10


class QualificationError(RuntimeError):
    """Qualification evidence is missing, malformed, or inconsistent."""


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode()
    except (TypeError, ValueError, UnicodeError) as exc:
        raise QualificationError("value is not canonical builtin JSON") from exc


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _strict_value(value: Any, *, label: str, depth: int = 0) -> None:
    if depth > 32:
        raise QualificationError(f"{label} exceeds the JSON depth bound")
    if type(value) is dict:
        if any(type(key) is not str for key in value):
            raise QualificationError(f"{label} has a non-string key")
        for item in value.values():
            _strict_value(item, label=label, depth=depth + 1)
    elif type(value) is list:
        for item in value:
            _strict_value(item, label=label, depth=depth + 1)
    elif value is not None and type(value) not in {str, int, bool}:
        raise QualificationError(f"{label} has a non-builtin JSON value")


def _strict_json(raw: bytes, *, label: str, canonical: bool = True) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > MAX_CONTROL_BYTES:
        raise QualificationError(f"{label} is not bounded exact bytes")
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_reject_duplicates,
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise QualificationError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        raise QualificationError(f"{label} must be an exact object")
    _strict_value(value, label=label)
    if canonical and raw != _json_bytes(value):
        raise QualificationError(f"{label} is not canonical JSON")
    return value


def _keys(value: dict[str, Any], expected: set[str], *, label: str) -> None:
    if set(value) != expected:
        raise QualificationError(f"{label} has an inexact schema")


def _string(value: Any, *, label: str) -> str:
    if type(value) is not str or not value:
        raise QualificationError(f"{label} must be a non-empty builtin string")
    return value


def _hex(value: Any, *, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise QualificationError(f"{label} must be lowercase 64-hex")
    return value


def _integer(value: Any, *, label: str, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise QualificationError(f"{label} must be a builtin integer >= {minimum}")
    return value


def _uuid(value: Any, *, label: str) -> str:
    _string(value, label=label)
    try:
        parsed = uuid.UUID(value)
    except (ValueError, AttributeError) as exc:
        raise QualificationError(f"{label} must be a canonical UUID") from exc
    if str(parsed) != value:
        raise QualificationError(f"{label} must be a canonical UUID")
    return value


def _capture(path: Path, *, limit: int = MAX_CAPTURE_BYTES) -> bytes:
    try:
        data = static._read_exact_cnf(Path(path), limit=limit)
    except static.StaticPiqdRunnerError as exc:
        raise QualificationError(str(exc)) from exc
    if type(data) is not bytes or len(data) > limit:
        raise QualificationError("capture is not bounded exact bytes")
    return data


def _private_dir(path: Path) -> None:
    st = os.lstat(path)
    if not stat.S_ISDIR(st.st_mode) or st.st_uid != os.getuid() or st.st_mode & 0o077:
        raise QualificationError("qualification directory must be private and owned")


def _root_identity(path: Path) -> tuple[int, int, int, int]:
    st = os.lstat(path)
    _private_dir(path)
    return (st.st_dev, st.st_ino, st.st_uid, stat.S_IMODE(st.st_mode))


def _create_dir(path: Path) -> Path:
    absolute = Path(os.path.abspath(os.fspath(path)))
    if len(absolute.parts) < 2:
        raise QualificationError(
            "qualification directory must be below filesystem root"
        )
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    parent = os.open(os.sep, flags)
    try:
        for component in absolute.parts[1:-1]:
            next_parent = os.open(component, flags, dir_fd=parent)
            os.close(parent)
            parent = next_parent
        try:
            os.mkdir(absolute.name, 0o700, dir_fd=parent)
        except FileExistsError as exc:
            raise QualificationError("qualification directory is create-once") from exc
    except OSError as exc:
        raise QualificationError(
            "qualification path cannot be anchored without following links"
        ) from exc
    finally:
        os.close(parent)
    _private_dir(absolute)
    return absolute


def _write_once(path: Path, data: bytes) -> None:
    if type(data) is not bytes:
        raise QualificationError("custody payload must be exact bytes")
    path = Path(path)
    if not path.is_absolute() or path.name in {"", ".", ".."}:
        raise QualificationError("custody output path must be absolute and normalized")
    _private_dir(path.parent)
    parent_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    parent = os.open(path.parent, parent_flags)
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_CLOEXEC | os.O_NOFOLLOW
    try:
        fd = os.open(path.name, flags, 0o600, dir_fd=parent)
        try:
            offset = 0
            while offset < len(data):
                offset += os.write(fd, data[offset:])
            os.fsync(fd)
            st = os.fstat(fd)
            if (
                not stat.S_ISREG(st.st_mode)
                or st.st_nlink != 1
                or st.st_uid != os.getuid()
            ):
                raise QualificationError("created custody file lost its identity")
        finally:
            os.close(fd)
    finally:
        os.close(parent)


def _read_custody(root: Path, name: str, *, limit: int = MAX_CAPTURE_BYTES) -> bytes:
    root = Path(os.path.abspath(os.fspath(root)))
    _private_dir(root)
    try:
        data = incremental._safe_read(root / name, root, label=name)
    except incremental.PiqdIncrementalDiscoveryError as exc:
        raise QualificationError(str(exc)) from exc
    if type(data) is not bytes or len(data) > limit:
        raise QualificationError(f"{name} is not bounded exact bytes")
    return data


def _header(variables: int, clauses: tuple[tuple[int, ...], ...]) -> str:
    return f"p cnf {variables} {len(clauses)}"


def _render_dimacs(variables: int, clauses: tuple[tuple[int, ...], ...]) -> bytes:
    return f"p cnf {variables} {len(clauses)}\n".encode() + incremental._journal_bytes(
        clauses
    )


def _source_path(repository_root: Path, declared: Any) -> Path:
    declared = _string(declared, label="source_manifest.source_path")
    candidate = Path(declared)
    if candidate.is_absolute() or ".." in candidate.parts:
        raise QualificationError("source path must be repository-relative")
    root = Path(os.path.abspath(os.fspath(repository_root)))
    result = Path(os.path.abspath(os.fspath(root / candidate)))
    try:
        result.relative_to(root)
    except ValueError as exc:
        raise QualificationError("source path escapes repository root") from exc
    return result


def _response(response: Any, *, label: str, limit: int) -> HttpResponse:
    # This type gate intentionally precedes every attribute access.
    if type(response) is not HttpResponse:
        raise QualificationError(f"{label} did not return exact HttpResponse")
    if type(response.status) is not int:
        raise QualificationError(f"{label} status is not a builtin integer")
    if type(response.body) is not bytes or len(response.body) > limit:
        raise QualificationError(f"{label} body is not bounded exact bytes")
    if type(response.headers) is not dict or any(
        type(key) is not str or type(value) is not str
        for key, value in response.headers.items()
    ):
        raise QualificationError(f"{label} headers are not an exact string map")
    return response


def _get_json(transport: Transport, path: str, *, label: str) -> bytes:
    response = _response(
        transport("GET", path, None, {"Accept": "application/json"}),
        label=label,
        limit=MAX_CONTROL_BYTES,
    )
    if response.status != 200:
        raise QualificationError(f"{label} evidence request failed")
    return _json_bytes(_strict_json(response.body, label=label, canonical=False))


def _get_json_exact_bytes(transport: Transport, path: str, *, label: str) -> bytes:
    response = _response(
        transport("GET", path, None, {"Accept": "application/json"}),
        label=label,
        limit=MAX_CONTROL_BYTES,
    )
    if response.status != 200:
        raise QualificationError(f"{label} evidence request failed")
    _strict_json(response.body, label=label, canonical=False)
    return response.body


def _version_object(value: dict[str, Any], *, label: str) -> str:
    _keys(value, {"daemon", "limits"}, label=label)
    daemon = value["daemon"]
    limits = value["limits"]
    if type(daemon) is not dict or type(limits) is not dict:
        raise QualificationError(f"{label} has malformed nested objects")
    _keys(
        daemon,
        {"name", "version", "protocol_version", "sha256"},
        label=f"{label}.daemon",
    )
    _keys(limits, {"max_var"}, label=f"{label}.limits")
    if daemon["name"] != "piqd" or daemon["protocol_version"] != 1:
        raise QualificationError(f"{label} has the wrong daemon/protocol identity")
    _string(daemon["version"], label=f"{label}.daemon.version")
    daemon_sha = _hex(daemon["sha256"], label=f"{label}.daemon.sha256")
    if type(limits["max_var"]) is not int or limits["max_var"] != 1_000_000:
        raise QualificationError(f"{label} max_var is not exact builtin 1000000")
    return daemon_sha


def _solver_entry(registry: dict[str, Any], solver_name: str) -> dict[str, Any]:
    _string(solver_name, label="solver_name")
    solvers = registry.get("solvers")
    if type(solvers) is not list:
        raise QualificationError("solver registry has no exact solver list")
    matches = [
        item
        for item in solvers
        if type(item) is dict
        and type(item.get("name")) is str
        and item["name"] == solver_name
    ]
    if len(matches) != 1:
        raise QualificationError("solver registry does not select one exact solver")
    entry = matches[0]
    _string(entry.get("name"), label="solver.name")
    _string(entry.get("lane"), label="solver.lane")
    _string(entry.get("solver"), label="solver.solver")
    if type(entry.get("usable")) is not bool or entry["usable"] is not True:
        raise QualificationError("selected solver is not usable")
    _hex(entry.get("sha256"), label="solver.sha256")
    _string(entry.get("solver_signature"), label="solver.solver_signature")
    return entry


def _production_solver_contract(
    *,
    producer: Mapping[str, Any],
    job: Mapping[str, Any],
    selected: Mapping[str, Any],
    solver_name: Any,
) -> None:
    identity = {
        "solver name": _string(solver_name, label="solver_name"),
        "solver sha256": _hex(selected.get("sha256"), label="solver.sha256"),
        "solver signature": _string(
            selected.get("solver_signature"), label="solver.solver_signature"
        ),
        "registry backend": _string(selected.get("solver"), label="solver.solver"),
        "registry lane": _string(selected.get("lane"), label="solver.lane"),
        "producer backend": _string(producer.get("backend"), label="producer.backend"),
        "producer lane": _string(
            producer.get("solver_profile"), label="producer.solver_profile"
        ),
        "job backend": _string(job.get("backend"), label="producer job.backend"),
    }
    expected = {
        "solver name": PRODUCTION_SOLVER_NAME,
        "solver sha256": PRODUCTION_SOLVER_SHA256,
        "solver signature": PRODUCTION_SOLVER_SIGNATURE,
        "registry backend": PRODUCTION_SOLVER_BACKEND,
        "registry lane": PRODUCTION_SOLVER_LANE,
        "producer backend": PRODUCTION_SOLVER_BACKEND,
        "producer lane": PRODUCTION_SOLVER_LANE,
        "job backend": PRODUCTION_SOLVER_BACKEND,
    }
    if identity != expected:
        raise QualificationError(
            "production solver identity/backend/lane pin disagrees"
        )


def _solver_stats_contract(solver: dict[str, Any]) -> dict[str, Any]:
    matches = (
        solver.get("name") == PRODUCTION_SOLVER_NAME
        and solver.get("sha256") == PRODUCTION_SOLVER_SHA256
        and solver.get("signature") == PRODUCTION_SOLVER_SIGNATURE
    )
    return {
        "attribution": "pinned-piqd-satworker-binary",
        "worker_name": PRODUCTION_SOLVER_NAME,
        "worker_sha256": PRODUCTION_SOLVER_SHA256,
        "worker_signature": PRODUCTION_SOLVER_SIGNATURE,
        "fields": sorted(PINNED_WORKER_SOLVER_STATS_KEYS),
        "worker_pin_matches_session": matches,
        "presence_required": False,
    }


def _prepared_job_evidence(prepared_job: PreparedJob) -> bytes:
    if type(prepared_job) is not PreparedJob:
        raise QualificationError(
            "producer prepare evidence is not an exact PreparedJob"
        )
    evidence = {
        "schema": PREPARED_JOB_SCHEMA,
        "job_id": prepared_job.job_id,
        "backend": prepared_job.backend,
        "solver_profile": prepared_job.solver_profile,
        "cnf_blob_hash": prepared_job.cnf_blob_hash,
        "identity_hash": prepared_job.identity_hash,
        "num_vars": prepared_job.num_vars,
        "num_clauses": prepared_job.num_clauses,
        "existing": prepared_job.existing,
        "requested_core_limit": prepared_job.requested_core_limit,
    }
    _prepared_job_contract(evidence)
    return _json_bytes(evidence)


def _prepared_job_contract(prepared: dict[str, Any]) -> None:
    _keys(
        prepared,
        {
            "schema",
            "job_id",
            "backend",
            "solver_profile",
            "cnf_blob_hash",
            "identity_hash",
            "num_vars",
            "num_clauses",
            "existing",
            "requested_core_limit",
        },
        label="authenticated producer prepare evidence",
    )
    if prepared["schema"] != PREPARED_JOB_SCHEMA:
        raise QualificationError("producer prepare evidence schema disagrees")
    _uuid(prepared["job_id"], label="prepared producer job_id")
    _string(prepared["backend"], label="prepared producer backend")
    _string(prepared["solver_profile"], label="prepared producer solver_profile")
    _hex(prepared["cnf_blob_hash"], label="prepared producer cnf_blob_hash")
    _hex(prepared["identity_hash"], label="prepared producer identity_hash")
    _integer(prepared["num_vars"], label="prepared producer num_vars")
    _integer(prepared["num_clauses"], label="prepared producer num_clauses")
    if type(prepared["existing"]) is not bool:
        raise QualificationError("prepared producer existing is not builtin bool")
    if (
        type(prepared["requested_core_limit"]) is not int
        or prepared["requested_core_limit"] != 1
    ):
        raise QualificationError("producer job requested_core_limit must be builtin 1")


def _job_contract(
    job: dict[str, Any], job_id: str, *, prepared: dict[str, Any]
) -> None:
    if type(job) is not dict or not JOB_STATUS_KEYS <= set(job):
        raise QualificationError("producer job status lacks required known fields")
    known = JOB_STATUS_KEYS | JOB_STATUS_OPTIONAL_KEYS | JOB_STATUS_FUTURE_CUSTODY_KEYS
    unknown = set(job) - known
    if len(unknown) > MAX_JOB_STATUS_UNKNOWN_KEYS:
        raise QualificationError("producer job status has too many future fields")
    for key in unknown:
        if (
            not key.isascii()
            or not key
            or len(key.encode("ascii")) > MAX_JOB_STATUS_KEY_BYTES
        ):
            raise QualificationError("producer job status has an invalid future field")
    if len(_json_bytes(job)) > MAX_JOB_STATUS_BYTES:
        raise QualificationError("producer job status exceeds the aggregate bound")
    if job.get("id") != job_id:
        raise QualificationError("producer job UUID disagrees")
    _uuid(job["id"], label="producer job.id")
    if job.get("status") != "completed":
        raise QualificationError("producer job must be completed before qualification")
    if job.get("result") != "SAT":
        raise QualificationError("producer job must have the exact SAT result")
    _string(job.get("backend"), label="producer job.backend")
    _string(job.get("project"), label="producer job.project")
    for key in ("timeout_s", "march_timeout_s"):
        _integer(job.get(key), label=f"producer job.{key}", minimum=1)
    _integer(job.get("wall_ms"), label="producer job.wall_ms")
    _string(job.get("wall_human"), label="producer job.wall_human")
    if job.get("running_for_s") is not None:
        raise QualificationError("completed producer job running_for_s must be null")
    timestamps = []
    for key in ("created_at", "confirmed_at", "started_at", "completed_at"):
        timestamps.append(_integer(job.get(key), label=f"producer job.{key}"))
    if timestamps != sorted(timestamps):
        raise QualificationError("producer job lifecycle timestamps are out of order")
    if job.get("model_blob_hash") is not None:
        raise QualificationError("SAT DIMACS producer model_blob_hash must be null")
    if (
        type(job.get("requested_core_limit")) is not int
        or job["requested_core_limit"] != 1
    ):
        raise QualificationError("producer job requested_core_limit must be builtin 1")
    if (
        type(job.get("attested_solver_processes")) is not int
        or job["attested_solver_processes"] != 1
    ):
        raise QualificationError("producer job must attest one solver process")
    if job.get("attestation_basis") != "SINGLE_PROCESS_NO_PARALLEL_FLAG":
        raise QualificationError("producer job has the wrong attestation basis")
    if job["backend"] != prepared["backend"]:
        raise QualificationError(
            "producer job backend disagrees with prepare authority"
        )
    if "progress" in job:
        progress = job["progress"]
        if type(progress) is not dict:
            raise QualificationError("producer job.progress must be an exact object")
        _keys(progress, JOB_PROGRESS_KEYS, label="producer job.progress")
        if progress["backend"] != job["backend"]:
            raise QualificationError("producer job progress backend disagrees")
        for key in ("last_line", "solver_version", "spawn_failure"):
            if progress[key] is not None and type(progress[key]) is not str:
                raise QualificationError(
                    f"producer job.progress.{key} is not builtin string or null"
                )
        for key in (
            "cubes_total",
            "cubes_done",
            "cubes_sat",
            "cubes_unsat",
            "cubes_unknown",
            "decisions",
            "conflicts",
            "restarts",
            "elapsed_s",
        ):
            if progress[key] is not None:
                _integer(progress[key], label=f"producer job.progress.{key}")
        if progress["solver_started"] is not True:
            raise QualificationError(
                "completed SAT producer progress did not start solver"
            )
        if progress["spawn_failure"] is not None:
            raise QualificationError(
                "completed SAT producer progress reports spawn failure"
            )
        if job["backend"] == "cadical" and any(
            progress[key] is not None
            for key in (
                "cubes_total",
                "cubes_done",
                "cubes_sat",
                "cubes_unsat",
                "cubes_unknown",
            )
        ):
            raise QualificationError("cadical producer progress has cube telemetry")
    if "log_tail" in job and type(job["log_tail"]) is not str:
        raise QualificationError("producer job.log_tail must be a builtin string")
    if "log_size_bytes" in job:
        _integer(job["log_size_bytes"], label="producer job.log_size_bytes")
    for key in JOB_STATUS_FUTURE_CUSTODY_KEYS & set(job):
        _hex(job[key], label=f"producer job.{key}")
        if job[key] != prepared[key]:
            raise QualificationError(
                f"producer job.{key} disagrees with prepare authority"
            )


@dataclass(frozen=True)
class _Profile:
    production: bool
    repository_commit: str | None
    variables: int
    base_clauses: int
    current_clauses: int
    base_sha256: str
    current_sha256: str
    suffix_sha256: str
    suffix_bytes: int
    canary_clause: tuple[int, ...]

    @property
    def schema(self) -> str:
        return SCHEMA if self.production else TEST_SCHEMA

    @property
    def preflight_schema(self) -> str:
        return PREFLIGHT_SCHEMA if self.production else TEST_PREFLIGHT_SCHEMA

    def packet(self) -> dict[str, Any]:
        return {
            "production": self.production,
            "repository_commit": self.repository_commit,
            "variables": self.variables,
            "base_clauses": self.base_clauses,
            "historical_current_clauses": self.current_clauses,
            "base_sha256": self.base_sha256,
            "historical_current_sha256": self.current_sha256,
            "historical_suffix_sha256": self.suffix_sha256,
            "historical_suffix_bytes": self.suffix_bytes,
            "canary_clause": list(self.canary_clause),
        }


def _production_profile(repository_commit: str) -> _Profile:
    if repository_commit != PRODUCTION_REPOSITORY_COMMIT:
        raise QualificationError("production repository commit pin disagrees")
    return _Profile(
        True,
        repository_commit,
        PRODUCTION_VARIABLES,
        PRODUCTION_BASE_CLAUSES,
        PRODUCTION_CURRENT_CLAUSES,
        PRODUCTION_BASE_SHA256,
        PRODUCTION_CURRENT_SHA256,
        PRODUCTION_SUFFIX_SHA256,
        PRODUCTION_SUFFIX_BYTES,
        PRODUCTION_CANARY_CLAUSE,
    )


@dataclass(frozen=True)
class QualificationContract:
    """Pre-session evidence and the only transport eligible for finalization."""

    directory: Path
    solver_name: str
    solver_sha256: str
    solver_signature: str
    identity_evidence_path: Path
    transport: QualificationTransport
    production: bool
    _source_inputs: tuple[tuple[Path, str], ...] = field(repr=False)
    _base_input_path: Path = field(repr=False)
    _current_input_path: Path = field(repr=False)
    _base_sha256: str = field(repr=False)
    _current_sha256: str = field(repr=False)


class QualificationTransport:
    """Capture one exact session identity and one close observation.

    The default is the frozen two-solve canary.  ``generalized=True`` is used
    only behind a validated production-v2 authority and accepts a dense,
    otherwise unbounded sequence of assumption-free solves.
    """

    def __init__(
        self,
        inner: Transport,
        *,
        root: Path,
        solver_name: str,
        solver_sha256: str,
        solver_signature: str,
        descriptor_root: str,
        producer_job_id: str | None = None,
        base_sha256: str | None = None,
        generalized: bool = False,
    ) -> None:
        self.inner = inner
        self.root = Path(root)
        self.expected = (
            _string(solver_name, label="solver_name"),
            _hex(solver_sha256, label="solver_sha256"),
            _string(solver_signature, label="solver_signature"),
        )
        self.solver_stats_worker_pinned = self.expected == (
            PRODUCTION_SOLVER_NAME,
            PRODUCTION_SOLVER_SHA256,
            PRODUCTION_SOLVER_SIGNATURE,
        )
        self.expected_label = (
            f"{incremental.SCHEMA}:{_hex(descriptor_root, label='descriptor_root')}"
        )
        if (producer_job_id is None) != (base_sha256 is None):
            raise QualificationError(
                "producer job UUID and base_sha256 bindings must be supplied together"
            )
        self.producer_job_id = (
            None
            if producer_job_id is None
            else _uuid(producer_job_id, label="producer job UUID")
        )
        self.base_sha256 = (
            None if base_sha256 is None else _hex(base_sha256, label="base_sha256")
        )
        if type(generalized) is not bool:
            raise QualificationError("generalized must be a builtin boolean")
        self.generalized = generalized
        self.session_id: str | None = None
        self.solve_count = 0
        self.statuses: list[str] = []
        self.event_sequence: list[str] = []
        self.close_observed = False
        self.close_method: str | None = None
        self.close_path: str | None = None

    @staticmethod
    def _segments(path: str) -> list[str]:
        path = _string(path, label="PIQD request path")
        try:
            clean = urlsplit(path).path.rstrip("/")
        except ValueError as exc:
            raise QualificationError("PIQD request path is malformed") from exc
        return [segment for segment in clean.split("/") if segment]

    def _response_limit(self, method: str, segments: list[str]) -> int:
        if method != "GET":
            return MAX_CONTROL_BYTES
        if self.producer_job_id is not None and segments == [
            "jobs",
            self.producer_job_id,
            "blobs",
            self.base_sha256,
        ]:
            return MAX_CNF_ARTIFACT_RESPONSE_BYTES
        if self.session_id is not None and segments == [
            "sessions",
            self.session_id,
            "cnf",
        ]:
            return MAX_CNF_ARTIFACT_RESPONSE_BYTES
        return MAX_CONTROL_BYTES

    def _session_payload(
        self,
        raw: bytes,
        *,
        label: str,
        creation: bool = False,
        allow_solver_stats: bool = False,
    ) -> dict[str, Any]:
        value = _strict_json(raw, label=label, canonical=False)
        allowed = incremental.SESSION_KEYS | (
            {"solver_stats"} if allow_solver_stats else set()
        )
        if set(value) - allowed or set(value) & incremental.SESSION_KEYS != (
            incremental.SESSION_KEYS
        ):
            raise QualificationError(f"{label} has an inexact schema")
        if "solver_stats" in value:
            if not self.solver_stats_worker_pinned:
                raise QualificationError(
                    f"{label}.solver_stats is not attributable to the pinned worker"
                )
            if value.get("state") != "live" or value.get("lane") != "sat":
                raise QualificationError(
                    f"{label}.solver_stats requires a live SAT status response"
                )
            solver_stats = value["solver_stats"]
            if type(solver_stats) is not dict:
                raise QualificationError(f"{label}.solver_stats is not an exact object")
            _keys(
                solver_stats,
                PINNED_WORKER_SOLVER_STATS_KEYS,
                label=f"{label}.solver_stats",
            )
            for key in PINNED_WORKER_SOLVER_STATS_KEYS:
                _integer(
                    solver_stats[key],
                    label=f"{label}.solver_stats.{key}",
                )
        identity = (
            value.get("solver_name"),
            value.get("solver_sha256"),
            value.get("solver_signature"),
        )
        if identity != self.expected:
            raise QualificationError("incremental session solver identity drifted")
        if value.get("label") != self.expected_label:
            raise QualificationError(
                "incremental session label is not descriptor-rooted"
            )
        if value.get("lane") != "sat":
            raise QualificationError("incremental session lane drifted")
        if value.get("state") not in {"live", "detached", "closed"}:
            raise QualificationError("incremental session state is invalid")
        if creation and value["state"] != "live":
            raise QualificationError("incremental session creation is not live")
        _integer(
            value.get("protocol_version"), label=f"{label}.protocol_version", minimum=1
        )
        _string(value.get("journal_path"), label=f"{label}.journal_path")
        _integer(value.get("created_at"), label=f"{label}.created_at")
        _integer(value.get("updated_at"), label=f"{label}.updated_at")
        for key in ("clauses", "max_var", "solves"):
            _integer(value.get(key), label=f"{label}.{key}")
        declared = value.get("declared_num_vars")
        if declared is not None:
            _integer(declared, label=f"{label}.declared_num_vars")
        if value.get("last_status") not in {None, "SAT", "UNSAT", "UNKNOWN"}:
            raise QualificationError(f"{label}.last_status is invalid")
        last_index = value.get("last_solve_index")
        if last_index is not None:
            _integer(last_index, label=f"{label}.last_solve_index", minimum=1)
        for key in ("last_assumption_free", "last_terminal_unsat"):
            if value.get(key) is not None and type(value[key]) is not bool:
                raise QualificationError(f"{label}.{key} is not builtin bool or null")
        session_id = _uuid(value.get("id"), label=f"{label}.id")
        if self.session_id is None:
            record = {
                "schema": SESSION_IDENTITY_SCHEMA,
                "session_id": session_id,
                "solver_name": identity[0],
                "solver_sha256": identity[1],
                "solver_signature": identity[2],
            }
            _write_once(self.root / IDENTITY_NAME, _json_bytes(record))
            self.session_id = session_id
        elif self.session_id != session_id:
            raise QualificationError("incremental session UUID drifted")
        return value

    def _solve_payload(self, raw: bytes, *, expected_index: int) -> dict[str, Any]:
        value = _strict_json(
            raw, label=f"solve response {expected_index}", canonical=False
        )
        if self.generalized:
            common = {"status", "solve_ms", "solve_index", "result_sha256"}
            status = value.get("status")
            expected = (
                common | {"model"}
                if status == "SAT"
                else common | {"core", "terminal_unsat"}
                if status == "UNSAT"
                else common
                | ({"interrupted_by"} if "interrupted_by" in value else set())
                if status == "UNKNOWN"
                else set()
            )
            _keys(value, expected, label=f"solve response {expected_index}")
            if value.get("solve_index") != expected_index:
                raise QualificationError("production solve index is not dense")
            _integer(value["solve_ms"], label="solve.solve_ms")
            _hex(value["result_sha256"], label="solve.result_sha256")
            if status == "SAT":
                model = value["model"]
                if type(model) is not list or any(
                    type(item) is not int or item == 0 for item in model
                ):
                    raise QualificationError("production SAT model is malformed")
                expected_digest = incremental._result_digest("SAT", None, None, model)
            elif status == "UNSAT":
                if value["core"] != [] or type(value["core"]) is not list:
                    raise QualificationError(
                        "production UNSAT must be assumption-free with an empty core"
                    )
                if value["terminal_unsat"] is not True:
                    raise QualificationError(
                        "production UNSAT must be terminal_unsat=true"
                    )
                expected_digest = incremental._result_digest("UNSAT", None, [], None)
            elif status == "UNKNOWN":
                interrupted = value.get("interrupted_by")
                if interrupted is not None:
                    _string(interrupted, label="solve.interrupted_by")
                expected_digest = incremental._result_digest(
                    "UNKNOWN", interrupted, None, None
                )
            else:
                raise QualificationError("production solve status is invalid")
            if value["result_sha256"] != expected_digest:
                raise QualificationError("raw solve response result digest disagrees")
            return value
        common = {"status", "solve_ms", "solve_index", "result_sha256"}
        expected = (
            common | {"model"}
            if expected_index == 1
            else common | {"core", "terminal_unsat"}
        )
        _keys(value, expected, label=f"solve response {expected_index}")
        expected_status = "SAT" if expected_index == 1 else "UNSAT"
        if value["status"] != expected_status or value["solve_index"] != expected_index:
            raise QualificationError("qualification solve order/status is not exact")
        _integer(value["solve_ms"], label="solve.solve_ms")
        _hex(value["result_sha256"], label="solve.result_sha256")
        if expected_index == 1:
            model = value["model"]
            if type(model) is not list or any(type(item) is not int for item in model):
                raise QualificationError("qualification SAT model is malformed")
            expected_digest = incremental._result_digest("SAT", None, None, model)
        else:
            if value["core"] != [] or type(value["core"]) is not list:
                raise QualificationError("terminal UNSAT must have an empty core")
            if value["terminal_unsat"] is not True:
                raise QualificationError("second solve is not terminal_unsat=true")
            expected_digest = incremental._result_digest("UNSAT", None, [], None)
        if value["result_sha256"] != expected_digest:
            raise QualificationError("raw solve response result digest disagrees")
        return value

    def __call__(
        self,
        method: str,
        path: str,
        body: bytes | Any | None,
        headers: Mapping[str, str] | Any,
    ) -> HttpResponse:
        segments = self._segments(path)
        is_create = method == "POST" and segments[-1:] == ["sessions"]
        is_solve = (
            method == "POST"
            and len(segments) >= 3
            and segments[-3] == "sessions"
            and segments[-1] == "solve"
        )
        is_append = (
            method == "POST"
            and len(segments) >= 3
            and segments[-3] == "sessions"
            and segments[-1] == "clauses"
        )
        is_delete = (
            method == "DELETE" and len(segments) >= 2 and segments[-2] == "sessions"
        )
        expected_status = self._expected_status(method, segments)
        if is_create and self.session_id is not None:
            raise QualificationError("qualification permits exactly one session")
        if is_solve and not self.generalized and self.solve_count >= 2:
            raise QualificationError("qualification permits exactly two solves")
        if is_delete and self.close_observed:
            raise QualificationError("qualification session was already closed")
        response = _response(
            self.inner(method, path, body, headers),
            label=f"PIQD {method} {path}",
            limit=self._response_limit(method, segments),
        )
        if response.status != expected_status:
            raise QualificationError(
                f"PIQD {method} {path} returned HTTP {response.status}; "
                f"expected {expected_status}"
            )
        if is_create:
            self._session_payload(
                response.body, label="session creation", creation=True
            )
        session_path_id: str | None = None
        if "sessions" in segments:
            index = len(segments) - 1 - segments[::-1].index("sessions")
            if index + 1 < len(segments):
                session_path_id = _uuid(segments[index + 1], label="session path UUID")
                if self.session_id is not None and session_path_id != self.session_id:
                    raise QualificationError("request path names another session")
        if is_solve:
            if self.session_id is None or session_path_id != self.session_id:
                raise QualificationError(
                    "solve preceded authenticated session creation"
                )
            next_index = self.solve_count + 1
            solve = self._solve_payload(response.body, expected_index=next_index)
            self.solve_count = next_index
            self.statuses.append(solve["status"])
            self.event_sequence.append("solve")
        elif is_append:
            if self.session_id is None or session_path_id != self.session_id:
                raise QualificationError(
                    "append preceded authenticated session creation"
                )
            request = _strict_json(body, label="clause append request")
            _keys(request, {"clauses"}, label="clause append request")
            clauses = request["clauses"]
            if type(clauses) is not list or not clauses:
                raise QualificationError("production append must add clauses")
            for clause in clauses:
                if type(clause) is not list or any(
                    type(literal) is not int or literal == 0 for literal in clause
                ):
                    raise QualificationError("production append clause is malformed")
            self.event_sequence.append("append")
        elif is_delete or (
            method == "GET" and len(segments) >= 2 and segments[-2] == "sessions"
        ):
            session = self._session_payload(
                response.body,
                label="session response",
                allow_solver_stats=method == "GET",
            )
            if is_delete and session.get("state") != "closed":
                raise QualificationError("PIQD close did not return a closed session")
            if session.get("state") == "closed":
                if self.close_observed:
                    raise QualificationError(
                        "qualification close evidence is not unique"
                    )
                _write_once(self.root / CLOSE_RESPONSE_NAME, _json_bytes(session))
                self.close_observed = True
                self.close_method = method
                self.close_path = path
        return response

    @staticmethod
    def _expected_status(method: str, segments: list[str]) -> int:
        if method == "POST" and segments[-1:] == ["sessions"]:
            return 201
        if (
            method == "POST"
            and len(segments) >= 3
            and segments[-3] == "sessions"
            and segments[-1] in {"clauses", "solve"}
        ):
            return 200
        if (
            method in {"GET", "DELETE"}
            and len(segments) >= 2
            and segments[-2] == "sessions"
        ):
            return 200
        if (
            method == "GET"
            and len(segments) >= 3
            and segments[-3] == "sessions"
            and segments[-1] in {"cnf", "model", "receipts"}
        ):
            return 200
        if method == "GET" and segments[-1:] in (["version"], ["solvers"]):
            return 200
        if method == "GET" and len(segments) >= 2 and segments[-2] == "jobs":
            return 200
        if (
            method == "GET"
            and len(segments) >= 4
            and segments[-4] == "jobs"
            and segments[-2] == "blobs"
        ):
            return 200
        raise QualificationError(
            f"qualification transport does not permit {method} {'/'.join(segments)}"
        )

    def capture_post_version(self) -> bytes:
        if not self.close_observed:
            raise QualificationError("post-version capture must follow confirmed close")
        if self.generalized:
            return _get_json_exact_bytes(
                self.inner, "/version", label="daemon version post"
            )
        return _get_json(self.inner, "/version", label="daemon version post")


# Compatibility name retained, but it now enforces the full qualification capture.
SolverIdentityTransport = QualificationTransport


def qualified_transport(contract: QualificationContract) -> Transport:
    return contract.transport


def _claims() -> dict[str, bool]:
    return {
        "piqd_proof_verified": False,
        "piqd_closure": False,
        "global_obstruction": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
    }


def _prepare_from_evidence(
    *,
    repository_root: Path,
    output_dir: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    base_cnf_path: Path,
    current_cnf_path: Path,
    producer_prepare: bytes,
    producer_job: bytes,
    producer_job_blob: bytes,
    solver_name: str,
    solver_registry: bytes,
    daemon_version_pre: bytes,
    daemon_url: str,
    transport: Transport,
    profile: _Profile | None,
    expected_source_manifest_sha256: str | None,
    expected_producer_manifest_sha256: str | None,
    historical_source_paths: dict[str, Path] | None,
    test_canary_clause: tuple[int, ...] | None,
) -> QualificationContract:
    prepared = _strict_json(producer_prepare, label="producer prepare evidence")
    _prepared_job_contract(prepared)
    producer_job_id = prepared["job_id"]
    _strict_json(source_manifest, label="source manifest")
    _strict_json(producer_manifest, label="producer manifest")
    authenticated = static.authenticate_static_manifests(
        source_manifest=source_manifest, producer_manifest=producer_manifest
    )
    source_path: Path
    source: bytes
    source_inputs: list[tuple[Path, str]] = []
    source_bundle: list[dict[str, Any]] = []
    bundle_artifacts: dict[str, bytes] = {}
    if profile is not None and profile.production:
        if (
            type(historical_source_paths) is not dict
            or set(historical_source_paths) != set(PRODUCTION_SOURCE_BUNDLE)
            or authenticated.source["source_path"] not in PRODUCTION_SOURCE_BUNDLE
        ):
            raise QualificationError(
                "production requires the exact three-file source bundle"
            )
        source_inputs = []
        for declared_path, (
            custody_name,
            expected_hash,
        ) in PRODUCTION_SOURCE_BUNDLE.items():
            supplied = historical_source_paths[declared_path]
            if not isinstance(supplied, Path):
                raise QualificationError(
                    "historical source bundle paths must be Path values"
                )
            absolute = Path(os.path.abspath(os.fspath(supplied)))
            raw = _capture(absolute)
            if _sha(raw) != expected_hash:
                raise QualificationError("historical source bundle hash disagrees")
            source_inputs.append((absolute, expected_hash))
            bundle_artifacts[custody_name] = raw
            source_bundle.append(
                {
                    "path": declared_path,
                    "capture_path": str(absolute),
                    "custody_path": custody_name,
                    "sha256": expected_hash,
                    "bytes": len(raw),
                }
            )
        manifest_bundle_entry = next(
            item
            for item in source_bundle
            if item["path"] == authenticated.source["source_path"]
        )
        if manifest_bundle_entry["sha256"] != authenticated.source["source_sha256"]:
            raise QualificationError(
                "source manifest does not select the exact historical bundle"
            )
        source_path = Path(manifest_bundle_entry["capture_path"])
        source = bundle_artifacts[manifest_bundle_entry["custody_path"]]
    else:
        source_path = _source_path(repository_root, authenticated.source["source_path"])
        source = _capture(source_path)
        if _sha(source) != authenticated.source["source_sha256"]:
            raise QualificationError("exact source bytes disagree with source manifest")
        source_inputs.append((source_path, _sha(source)))
        source_bundle.append(
            {
                "path": authenticated.source["source_path"],
                "capture_path": str(source_path),
                "custody_path": "source.bin",
                "sha256": _sha(source),
                "bytes": len(source),
            }
        )
    base_path = Path(os.path.abspath(os.fspath(base_cnf_path)))
    current_path = Path(os.path.abspath(os.fspath(current_cnf_path)))
    base = _capture(base_path)
    current = _capture(current_path)
    variables, base_clauses = incremental.parse_dimacs(base)
    current_variables, current_clauses = incremental.parse_dimacs(current)
    if (
        variables != current_variables
        or current_clauses[: len(base_clauses)] != base_clauses
    ):
        raise QualificationError(
            "stable base is not an exact prefix of historical current CNF"
        )
    suffix_clauses = current_clauses[len(base_clauses) :]
    suffix = incremental._journal_bytes(suffix_clauses)
    if profile is None:
        if (
            type(test_canary_clause) is not tuple
            or len(test_canary_clause) != 1
            or type(test_canary_clause[0]) is not int
            or test_canary_clause[0] == 0
            or abs(test_canary_clause[0]) > variables
        ):
            raise QualificationError(
                "test-only canary must be one exact in-range literal"
            )
        profile = _Profile(
            False,
            None,
            variables,
            len(base_clauses),
            len(current_clauses),
            _sha(base),
            _sha(current),
            _sha(suffix),
            len(suffix),
            test_canary_clause,
        )
    if (
        variables != profile.variables
        or len(base_clauses) != profile.base_clauses
        or len(current_clauses) != profile.current_clauses
        or _sha(base) != profile.base_sha256
        or _sha(current) != profile.current_sha256
        or _sha(suffix) != profile.suffix_sha256
        or len(suffix) != profile.suffix_bytes
    ):
        raise QualificationError("CNF does not match the exact qualification profile")
    if profile.production and len(suffix_clauses) != PRODUCTION_SUFFIX_CLAUSES:
        raise QualificationError(
            "historical suffix clause count is not production-pinned"
        )
    if (
        expected_source_manifest_sha256 is None
        or expected_producer_manifest_sha256 is None
    ) and profile.production:
        raise QualificationError(
            "production requires exact source/producer manifest hashes"
        )
    expected_source_hash = (
        authenticated.source_sha256
        if expected_source_manifest_sha256 is None
        else _hex(
            expected_source_manifest_sha256, label="expected source manifest sha256"
        )
    )
    expected_producer_hash = (
        authenticated.producer_sha256
        if expected_producer_manifest_sha256 is None
        else _hex(
            expected_producer_manifest_sha256,
            label="expected producer manifest sha256",
        )
    )
    if (
        authenticated.source_sha256 != expected_source_hash
        or authenticated.producer_sha256 != expected_producer_hash
    ):
        raise QualificationError("current exact source manifest hashes disagree")
    if profile.production and (
        expected_source_hash != PRODUCTION_SOURCE_MANIFEST_SHA256
        or expected_producer_hash != PRODUCTION_PRODUCER_MANIFEST_SHA256
        or authenticated.producer.get("variable_map_sha256")
        != PRODUCTION_VARIABLE_MAP_SHA256
    ):
        raise QualificationError("production manifest or variable-map pin disagrees")
    base_hash = _sha(base)
    if (
        prepared["cnf_blob_hash"] != base_hash
        or prepared["num_vars"] != variables
        or prepared["num_clauses"] != len(base_clauses)
        or prepared["backend"] != authenticated.producer.get("backend")
        or prepared["solver_profile"] != authenticated.producer.get("solver_profile")
    ):
        raise QualificationError("authenticated producer prepare binding disagrees")
    if type(producer_job_blob) is not bytes or producer_job_blob != base:
        raise QualificationError(
            "job-scoped producer blob is not the exact stable base"
        )
    job = _strict_json(producer_job, label="producer job")
    _job_contract(job, producer_job_id, prepared=prepared)
    if (
        profile.production
        and prepared["identity_hash"] != PRODUCTION_RAW_DIMACS_IDENTITY
    ):
        raise QualificationError("producer job raw DIMACS identity disagrees")
    registry = _strict_json(solver_registry, label="solver registry")
    selected = _solver_entry(registry, solver_name)
    if profile.production:
        _production_solver_contract(
            producer=authenticated.producer,
            job=job,
            selected=selected,
            solver_name=solver_name,
        )
    version_pre = _strict_json(daemon_version_pre, label="daemon version pre")
    daemon_sha256 = _version_object(version_pre, label="daemon version pre")
    _string(daemon_url, label="daemon_url")
    descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=base,
        producer_manifest=authenticated.producer_bytes,
        source_manifest=authenticated.source_bytes,
        solver_name=solver_name,
        producer_job_id=producer_job_id,
    )
    root = _create_dir(output_dir)
    preflight = {
        "schema": profile.preflight_schema,
        "profile": profile.packet(),
        "daemon": {
            "url": daemon_url,
            "version_pre_sha256": _sha(daemon_version_pre),
            "executable_sha256": daemon_sha256,
            "protocol_version": 1,
            "session_max_var_ceiling": 1_000_000,
        },
        "source": {
            "path": authenticated.source["source_path"],
            "capture_path": str(source_path),
            "sha256": _sha(source),
            "bytes": len(source),
            "manifest_sha256": authenticated.source_sha256,
        },
        "source_bundle": source_bundle,
        "producer": {
            "manifest_sha256": authenticated.producer_sha256,
            "variable_map_sha256": authenticated.producer["variable_map_sha256"],
            "job_id": producer_job_id,
            "job_existing": prepared["existing"],
            "job_custody": "reused" if prepared["existing"] else "fresh",
            "prepare_sha256": _sha(producer_prepare),
            "job_sha256": _sha(producer_job),
            "blob_sha256": base_hash,
            "raw_dimacs_identity": prepared["identity_hash"],
            "requested_core_limit": 1,
            "attested_solver_processes": 1,
        },
        "base": {
            "capture_path": str(base_path),
            "sha256": base_hash,
            "bytes": len(base),
            "header": _header(variables, base_clauses),
        },
        "historical_current": {
            "capture_path": str(current_path),
            "sha256": _sha(current),
            "bytes": len(current),
            "header": _header(variables, current_clauses),
        },
        "historical_suffix": {
            "sha256": _sha(suffix),
            "bytes": len(suffix),
            "clause_count": len(suffix_clauses),
            "order": "exact-historical-current-prefix-tail",
        },
        "solver": {
            "name": solver_name,
            "sha256": selected["sha256"],
            "signature": selected["solver_signature"],
            "backend": selected["solver"],
            "lane": selected["lane"],
            "registry_sha256": _sha(solver_registry),
        },
        "descriptor_root": descriptor.descriptor_root,
        "claims": _claims(),
    }
    artifacts = {
        "source-manifest.json": source_manifest,
        "producer-manifest.json": producer_manifest,
        "source.bin": source,
        "base.cnf": base,
        "historical-current.cnf": current,
        ".solver.cnf": current,
        "suffix.cnfpart": suffix,
        "producer-prepare.json": producer_prepare,
        "producer-job.json": producer_job,
        "producer-job-blob.cnf": producer_job_blob,
        "solver-registry.json": solver_registry,
        "daemon-version-pre.json": daemon_version_pre,
        **bundle_artifacts,
    }
    for name, data in artifacts.items():
        _write_once(root / name, data)
    _write_once(root / PREFLIGHT_NAME, _json_bytes(preflight))
    wrapper = QualificationTransport(
        transport,
        root=root,
        solver_name=solver_name,
        solver_sha256=selected["sha256"],
        solver_signature=selected["solver_signature"],
        descriptor_root=descriptor.descriptor_root,
        producer_job_id=producer_job_id,
        base_sha256=base_hash,
    )
    return QualificationContract(
        root,
        solver_name,
        selected["sha256"],
        selected["solver_signature"],
        root / IDENTITY_NAME,
        wrapper,
        profile.production,
        tuple(source_inputs),
        base_path,
        current_path,
        base_hash,
        _sha(current),
    )


def prepare_qualification(
    *,
    repository_root: Path,
    repository_commit: str,
    output_dir: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    expected_source_manifest_sha256: str,
    expected_producer_manifest_sha256: str,
    historical_source_paths: dict[str, Path] | None = None,
    base_cnf_path: Path,
    current_cnf_path: Path,
    producer_job: PreparedJob,
    solver_name: str,
    daemon_url: str,
    transport: Transport,
) -> QualificationContract:
    """Capture production preflight evidence; this does not create a final seal."""

    if _string(solver_name, label="solver_name") != PRODUCTION_SOLVER_NAME:
        raise QualificationError("production solver name pin disagrees")
    profile = _production_profile(repository_commit)
    producer_prepare = _prepared_job_evidence(producer_job)
    producer_job_id = producer_job.job_id
    version_pre = _get_json(transport, "/version", label="daemon version pre")
    job = _get_json(transport, f"/jobs/{producer_job_id}", label="producer job")
    blob_response = _response(
        transport(
            "GET",
            f"/jobs/{producer_job_id}/cnf",
            None,
            {"Accept": "application/octet-stream"},
        ),
        label="job-scoped producer blob",
        limit=MAX_CAPTURE_BYTES,
    )
    if blob_response.status != 200:
        raise QualificationError("job-scoped producer blob evidence request failed")
    registry = _get_json(transport, "/solvers", label="solver registry")
    return _prepare_from_evidence(
        repository_root=repository_root,
        output_dir=output_dir,
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
        base_cnf_path=base_cnf_path,
        current_cnf_path=current_cnf_path,
        producer_prepare=producer_prepare,
        producer_job=job,
        producer_job_blob=blob_response.body,
        solver_name=solver_name,
        solver_registry=registry,
        daemon_version_pre=version_pre,
        daemon_url=daemon_url,
        transport=transport,
        profile=profile,
        expected_source_manifest_sha256=expected_source_manifest_sha256,
        expected_producer_manifest_sha256=expected_producer_manifest_sha256,
        historical_source_paths=historical_source_paths,
        test_canary_clause=None,
    )


def prepare_test_qualification(
    *,
    repository_root: Path,
    output_dir: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    base_cnf_path: Path,
    current_cnf_path: Path,
    producer_job: PreparedJob,
    solver_name: str,
    daemon_url: str,
    canary_clause: tuple[int, ...],
    transport: Transport,
) -> QualificationContract:
    """Explicit synthetic seam; it can emit only the test-only schema."""

    producer_prepare = _prepared_job_evidence(producer_job)
    producer_job_id = producer_job.job_id
    version_pre = _get_json(transport, "/version", label="daemon version pre")
    job = _get_json(transport, f"/jobs/{producer_job_id}", label="producer job")
    blob_response = _response(
        transport(
            "GET",
            f"/jobs/{producer_job_id}/cnf",
            None,
            {"Accept": "application/octet-stream"},
        ),
        label="job-scoped producer blob",
        limit=MAX_CAPTURE_BYTES,
    )
    if blob_response.status != 200:
        raise QualificationError("job-scoped producer blob evidence request failed")
    registry = _get_json(transport, "/solvers", label="solver registry")
    return _prepare_from_evidence(
        repository_root=repository_root,
        output_dir=output_dir,
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
        base_cnf_path=base_cnf_path,
        current_cnf_path=current_cnf_path,
        producer_prepare=producer_prepare,
        producer_job=job,
        producer_job_blob=blob_response.body,
        solver_name=solver_name,
        solver_registry=registry,
        daemon_version_pre=version_pre,
        daemon_url=daemon_url,
        transport=transport,
        profile=None,
        expected_source_manifest_sha256=None,
        expected_producer_manifest_sha256=None,
        historical_source_paths=None,
        test_canary_clause=canary_clause,
    )


def _profile_from_packet(value: Any, *, production: bool) -> _Profile:
    if type(value) is not dict:
        raise QualificationError("qualification profile must be an exact object")
    _keys(
        value,
        {
            "production",
            "repository_commit",
            "variables",
            "base_clauses",
            "historical_current_clauses",
            "base_sha256",
            "historical_current_sha256",
            "historical_suffix_sha256",
            "historical_suffix_bytes",
            "canary_clause",
        },
        label="qualification profile",
    )
    if production:
        expected = _production_profile(value.get("repository_commit"))
        if value != expected.packet():
            raise QualificationError("production qualification pins disagree")
        return expected
    if (
        value.get("production") is not False
        or value.get("repository_commit") is not None
    ):
        raise QualificationError("test profile attempts to claim production")
    for key in (
        "variables",
        "base_clauses",
        "historical_current_clauses",
        "historical_suffix_bytes",
    ):
        _integer(value.get(key), label=f"profile.{key}", minimum=1)
    for key in ("base_sha256", "historical_current_sha256", "historical_suffix_sha256"):
        _hex(value.get(key), label=f"profile.{key}")
    canary = value.get("canary_clause")
    if type(canary) is not list or len(canary) != 1 or type(canary[0]) is not int:
        raise QualificationError("test profile canary is malformed")
    return _Profile(
        False,
        None,
        value["variables"],
        value["base_clauses"],
        value["historical_current_clauses"],
        value["base_sha256"],
        value["historical_current_sha256"],
        value["historical_suffix_sha256"],
        value["historical_suffix_bytes"],
        tuple(canary),
    )


def _validate_model(model: Any, variables: int, clauses: list[tuple[int, ...]]) -> None:
    if type(model) is not list or len(model) != variables:
        raise QualificationError("SAT model is not total")
    assignment: dict[int, bool] = {}
    for literal in model:
        if type(literal) is not int or literal == 0 or abs(literal) > variables:
            raise QualificationError("SAT model contains an invalid literal")
        if abs(literal) in assignment:
            raise QualificationError("SAT model duplicates a variable")
        assignment[abs(literal)] = literal > 0
    if set(assignment) != set(range(1, variables + 1)):
        raise QualificationError("SAT model is incomplete")
    if any(
        not any(assignment[abs(literal)] == (literal > 0) for literal in clause)
        for clause in clauses
    ):
        raise QualificationError("SAT model fails historical current CNF replay")


def _validate_receipt(
    receipt: Any,
    *,
    status: str,
    solve_index: int,
    result_sha256: str,
    frontier: list[tuple[int, ...]],
) -> None:
    if (
        type(receipt) is not dict
        or not incremental.RECEIPT_REQUIRED <= set(receipt)
        or set(receipt) - (incremental.RECEIPT_REQUIRED | incremental.RECEIPT_OPTIONAL)
    ):
        raise QualificationError("solve receipt has an inexact schema")
    if (
        receipt.get("status") != status
        or receipt.get("solve_index") != solve_index
        or receipt.get("result_sha256") != result_sha256
        or receipt.get("assumptions") != []
        or type(receipt.get("assumptions")) is not list
    ):
        raise QualificationError(
            "solve response/journal/receipt crossbinding disagrees"
        )
    for key in ("solve_index", "base_clauses", "base_bytes", "at"):
        _integer(receipt.get(key), label=f"receipt.{key}", minimum=1)
    _hex(receipt.get("base_sha256"), label="receipt.base_sha256")
    _hex(receipt.get("result_sha256"), label="receipt.result_sha256")
    if type(receipt.get("model_recorded")) is not bool:
        raise QualificationError("receipt.model_recorded must be boolean")
    prefix = incremental._journal_bytes(frontier)
    if (
        receipt["base_clauses"] != len(frontier)
        or receipt["base_bytes"] != len(prefix)
        or receipt["base_sha256"] != _sha(prefix)
    ):
        raise QualificationError("receipt does not bind the headerless journal prefix")
    if status == "SAT":
        if receipt["model_recorded"] is not True or receipt.get("core") is not None:
            raise QualificationError("SAT receipt is malformed")
    elif (
        receipt["model_recorded"] is not False
        or receipt.get("core") != []
        or type(receipt.get("core")) is not list
    ):
        raise QualificationError("terminal UNSAT receipt must have an empty core")


def _validate_journal(
    raw: bytes,
    *,
    descriptor: incremental.DiscoveryDescriptor,
    variables: int,
    base_clauses: tuple[tuple[int, ...], ...],
    current_clauses: tuple[tuple[int, ...], ...],
    canary_clause: tuple[int, ...],
) -> dict[str, Any]:
    if not raw or not raw.endswith(b"\n") or len(raw.splitlines()) != 5:
        raise QualificationError("journal must contain exactly five complete events")
    expected_kinds = ("open", "append", "solve", "append", "solve")
    frontier = list(base_clauses)
    historical_suffix = list(current_clauses[len(base_clauses) :])
    prior: str | None = None
    session_id: str | None = None
    common = {
        "schema",
        "sequence",
        "prior_event_sha256",
        "event_sha256",
        "event",
        "session_id",
        "producer_job_id",
        "descriptor_root",
        "frontier_count",
        "frontier_sha256",
        "learned_state",
    }
    event_keys = {
        "open": common | {"seed_blob_hash", "seed_sha256"},
        "append": common | {"clauses", "prior_frontier_sha256"},
        "solve": common
        | {
            "status",
            "solve_index",
            "result_sha256",
            "receipt",
            "model",
            "proof_verified",
            "closure_claim",
        },
    }
    for sequence, line in enumerate(raw.splitlines()):
        event = _strict_json(line, label=f"journal event {sequence}")
        kind = event.get("event")
        if kind != expected_kinds[sequence]:
            raise QualificationError("journal frontier/solve order is not exact")
        _keys(event, event_keys[kind], label=f"journal {kind} event")
        unsigned = dict(event)
        event_hash = unsigned.pop("event_sha256")
        if (
            event.get("schema") != incremental.SCHEMA
            or event.get("sequence") != sequence
            or event.get("prior_event_sha256") != prior
            or event_hash != _sha(_json_bytes(unsigned))
        ):
            raise QualificationError("journal sequence/hash chain is invalid")
        _hex(event_hash, label="event.event_sha256")
        if (
            event.get("producer_job_id") != descriptor.producer_job_id
            or event.get("descriptor_root") != descriptor.descriptor_root
            or event.get("learned_state") != "not_claimed"
        ):
            raise QualificationError("journal is not packet-rooted")
        current_session = _uuid(event.get("session_id"), label="event.session_id")
        if session_id is None:
            session_id = current_session
        elif session_id != current_session:
            raise QualificationError("journal session identity drifted")
        before_hash = incremental._frontier_hash(variables, frontier)
        if kind == "open":
            if (
                event["seed_blob_hash"] != descriptor.seed_blob_hash
                or event["seed_sha256"] != descriptor.seed_sha256
            ):
                raise QualificationError("opening event has the wrong stable base")
        elif kind == "append":
            if (
                event["prior_frontier_sha256"] != before_hash
                or type(event["clauses"]) is not list
            ):
                raise QualificationError("append event is stale or malformed")
            additions = [
                incremental._check_clause(clause, variables)
                for clause in event["clauses"]
            ]
            expected_additions = historical_suffix if sequence == 1 else [canary_clause]
            if additions != expected_additions:
                raise QualificationError("journal appended the wrong ordered frontier")
            frontier.extend(additions)
        else:
            solve_index = 1 if sequence == 2 else 2
            expected_status = "SAT" if solve_index == 1 else "UNSAT"
            expected_result = incremental._result_digest(
                expected_status,
                None,
                None if solve_index == 1 else [],
                event["model"] if solve_index == 1 else None,
            )
            if (
                event["status"] != expected_status
                or event["solve_index"] != solve_index
                or event["result_sha256"] != expected_result
                or event["proof_verified"] is not False
                or event["closure_claim"] is not False
            ):
                raise QualificationError("journal solve/result digest is not exact")
            _validate_receipt(
                event["receipt"],
                status=expected_status,
                solve_index=solve_index,
                result_sha256=expected_result,
                frontier=frontier,
            )
            if solve_index == 1:
                if tuple(frontier) != current_clauses:
                    raise QualificationError(
                        "first solve is not historical-current SAT"
                    )
                _validate_model(event["model"], variables, frontier)
            elif event["model"] is not None:
                raise QualificationError("terminal UNSAT journal records a model")
        frontier_hash = incremental._frontier_hash(variables, frontier)
        if (
            event.get("frontier_count") != len(frontier)
            or event.get("frontier_sha256") != frontier_hash
        ):
            raise QualificationError("journal frontier identity is invalid")
        prior = event_hash
    terminal = (*current_clauses, canary_clause)
    if tuple(frontier) != terminal:
        raise QualificationError(
            "journal does not reconstruct terminal canary frontier"
        )
    return {
        "session_id": session_id,
        "statuses": ["SAT", "UNSAT"],
        "terminal_frontier_sha256": incremental._frontier_hash(variables, terminal),
    }


def _session_evidence(
    root: Path,
    *,
    descriptor: incremental.DiscoveryDescriptor,
    solver: dict[str, Any],
    variables: int,
    base_clauses: tuple[tuple[int, ...], ...],
    current_clauses: tuple[tuple[int, ...], ...],
    canary_clause: tuple[int, ...],
) -> tuple[dict[str, Any], dict[str, Any]]:
    identity_raw = _read_custody(root, IDENTITY_NAME, limit=MAX_CONTROL_BYTES)
    identity = _strict_json(identity_raw, label="session identity")
    _keys(
        identity,
        {"schema", "session_id", "solver_name", "solver_sha256", "solver_signature"},
        label="session identity",
    )
    if (
        identity["schema"] != SESSION_IDENTITY_SCHEMA
        or identity["solver_name"] != solver["name"]
        or identity["solver_sha256"] != solver["sha256"]
        or identity["solver_signature"] != solver["signature"]
    ):
        raise QualificationError("sealed session solver identity drifted")
    session_id = _uuid(identity["session_id"], label="session identity UUID")
    journal_raw = _read_custody(root, JOURNAL_NAME)
    journal = _validate_journal(
        journal_raw,
        descriptor=descriptor,
        variables=variables,
        base_clauses=base_clauses,
        current_clauses=current_clauses,
        canary_clause=canary_clause,
    )
    if journal["session_id"] != session_id:
        raise QualificationError("session identity names another journal")
    close_raw = _read_custody(root, CLOSE_RESPONSE_NAME, limit=MAX_CONTROL_BYTES)
    close_value = _strict_json(close_raw, label="session close response")
    _keys(close_value, incremental.SESSION_KEYS, label="session close response")
    for key in ("created_at", "updated_at"):
        _integer(close_value.get(key), label=f"session close response.{key}")
    for key in (
        "protocol_version",
        "clauses",
        "max_var",
        "solves",
        "last_solve_index",
        "declared_num_vars",
    ):
        _integer(close_value.get(key), label=f"session close response.{key}")
    _string(
        close_value.get("journal_path"), label="session close response.journal_path"
    )
    expected_label = f"{incremental.SCHEMA}:{descriptor.descriptor_root}"
    if (
        close_value.get("id") != session_id
        or close_value.get("lane") != "sat"
        or close_value.get("state") != "closed"
        or close_value.get("solver_name") != solver["name"]
        or close_value.get("solver_sha256") != solver["sha256"]
        or close_value.get("solver_signature") != solver["signature"]
        or close_value.get("protocol_version") != 1
        or close_value.get("clauses") != len(current_clauses) + 1
        or close_value.get("max_var") != variables
        or close_value.get("solves") != 2
        or close_value.get("last_solve_index") != 2
        or close_value.get("last_status") != "UNSAT"
        or close_value.get("declared_num_vars") != variables
        or close_value.get("last_assumption_free") is not True
        or close_value.get("last_terminal_unsat") is not True
        or close_value.get("label") != expected_label
    ):
        raise QualificationError("close response does not bind the exact session")
    result = {
        "schema": SESSION_RESULT_SCHEMA,
        "session_id": session_id,
        "journal_sha256": _sha(journal_raw),
        "identity_sha256": _sha(identity_raw),
        "close_response_sha256": _sha(close_raw),
        "terminal_frontier_sha256": journal["terminal_frontier_sha256"],
        "terminal_unsat": True,
        "empty_core": True,
        "assumption_free": True,
        "terminal_definition": "UNSAT_AND_EMPTY_CORE",
        "proof_verified": False,
        "closure_claim": False,
    }
    return result, journal


def _close_observation(method: Any, path: Any, session_id: str) -> tuple[str, str]:
    if type(method) is not str or method not in {"DELETE", "GET"}:
        raise QualificationError("session close method is not exact")
    path = _string(path, label="session close path")
    if QualificationTransport._segments(path)[-2:] != ["sessions", session_id]:
        raise QualificationError("session close path names another session")
    return method, path


def _preflight_common(
    root: Path, *, production: bool
) -> tuple[dict[str, Any], _Profile, dict[str, Any]]:
    preflight_raw = _read_custody(root, PREFLIGHT_NAME, limit=MAX_CONTROL_BYTES)
    preflight = _strict_json(preflight_raw, label="preflight packet")
    _keys(
        preflight,
        {
            "schema",
            "profile",
            "daemon",
            "source",
            "source_bundle",
            "producer",
            "base",
            "historical_current",
            "historical_suffix",
            "solver",
            "descriptor_root",
            "claims",
        },
        label="preflight packet",
    )
    expected_schema = PREFLIGHT_SCHEMA if production else TEST_PREFLIGHT_SCHEMA
    if preflight["schema"] != expected_schema:
        raise QualificationError("preflight schema/profile lane disagrees")
    profile = _profile_from_packet(preflight["profile"], production=production)
    for name in (
        "daemon",
        "source",
        "producer",
        "base",
        "historical_current",
        "historical_suffix",
        "solver",
    ):
        if type(preflight[name]) is not dict:
            raise QualificationError(f"preflight {name} is not an exact object")
    if type(preflight["source_bundle"]) is not list:
        raise QualificationError("preflight source_bundle is not an exact list")
    _keys(
        preflight["producer"],
        {
            "manifest_sha256",
            "variable_map_sha256",
            "job_id",
            "job_existing",
            "job_custody",
            "prepare_sha256",
            "job_sha256",
            "blob_sha256",
            "raw_dimacs_identity",
            "requested_core_limit",
            "attested_solver_processes",
        },
        label="preflight producer",
    )
    if type(preflight["producer"]["job_existing"]) is not bool or preflight["producer"][
        "job_custody"
    ] != ("reused" if preflight["producer"]["job_existing"] else "fresh"):
        raise QualificationError("preflight producer reuse classification is invalid")
    if preflight["claims"] != _claims():
        raise QualificationError("preflight makes a forbidden claim")
    return preflight, profile, {"sha256": _sha(preflight_raw)}


def finalize_qualification(contract: QualificationContract) -> dict[str, Any]:
    """After confirmed close, capture post-version and create the final seal last."""

    if type(contract) is not QualificationContract:
        raise QualificationError(
            "finalization requires an exact qualification contract"
        )
    root = contract.directory
    _private_dir(root)
    if (root / QUALIFICATION_NAME).exists():
        raise QualificationError("qualification is already finalized")
    if contract.transport.solve_count != 2 or not contract.transport.close_observed:
        raise QualificationError(
            "finalization requires exactly two solves and confirmed close"
        )
    for source_path, expected_hash in contract._source_inputs:
        if _sha(_capture(source_path)) != expected_hash:
            raise QualificationError(
                "source bundle changed during the qualification window"
            )
    if _sha(_capture(contract._base_input_path)) != contract._base_sha256:
        raise QualificationError("stable base changed during the qualification window")
    if _sha(_capture(contract._current_input_path)) != contract._current_sha256:
        raise QualificationError("historical current CNF changed during the window")
    preflight, profile, preflight_identity = _preflight_common(
        root, production=contract.production
    )
    version_pre_raw = _read_custody(
        root, "daemon-version-pre.json", limit=MAX_CONTROL_BYTES
    )
    version_pre = _strict_json(version_pre_raw, label="daemon version pre")
    _version_object(version_pre, label="daemon version pre")
    version_post_raw = contract.transport.capture_post_version()
    version_post = _strict_json(version_post_raw, label="daemon version post")
    _version_object(version_post, label="daemon version post")
    if version_pre != version_post or version_pre_raw != version_post_raw:
        raise QualificationError(
            "full canonical daemon version object changed across session"
        )
    source_manifest = _read_custody(
        root, "source-manifest.json", limit=MAX_CONTROL_BYTES
    )
    producer_manifest = _read_custody(
        root, "producer-manifest.json", limit=MAX_CONTROL_BYTES
    )
    descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=_read_custody(root, "base.cnf"),
        producer_manifest=producer_manifest,
        source_manifest=source_manifest,
        solver_name=preflight["solver"]["name"],
        producer_job_id=preflight["producer"]["job_id"],
    )
    variables, base_clauses = incremental.parse_dimacs(_read_custody(root, "base.cnf"))
    current_variables, current_clauses = incremental.parse_dimacs(
        _read_custody(root, "historical-current.cnf")
    )
    if variables != current_variables:
        raise QualificationError("base/current variable counts disagree")
    expected_terminal = _render_dimacs(
        variables, (*current_clauses, profile.canary_clause)
    )
    if _read_custody(root, ".solver.cnf") != expected_terminal:
        raise QualificationError("live solver CNF is not exact current plus canary")
    session_result, _ = _session_evidence(
        root,
        descriptor=descriptor,
        solver=preflight["solver"],
        variables=variables,
        base_clauses=base_clauses,
        current_clauses=current_clauses,
        canary_clause=profile.canary_clause,
    )
    close_method, close_path = _close_observation(
        contract.transport.close_method,
        contract.transport.close_path,
        session_result["session_id"],
    )
    session_result["close_method"] = close_method
    session_result["close_path"] = close_path
    _write_once(root / "daemon-version-post.json", version_post_raw)
    session_result_raw = _json_bytes(session_result)
    _write_once(root / SESSION_RESULT_NAME, session_result_raw)
    packet = {
        "schema": profile.schema,
        "profile": profile.packet(),
        "preflight_sha256": preflight_identity["sha256"],
        "daemon": {
            **preflight["daemon"],
            "version_post_sha256": _sha(version_post_raw),
            "full_object_equal": True,
        },
        "source": preflight["source"],
        "source_bundle": preflight["source_bundle"],
        "producer": preflight["producer"],
        "base": preflight["base"],
        "historical_current": preflight["historical_current"],
        "historical_suffix": preflight["historical_suffix"],
        "terminal_frontier": {
            "custody_path": ".solver.cnf",
            "sha256": _sha(expected_terminal),
            "bytes": len(expected_terminal),
            "header": f"p cnf {variables} {len(current_clauses) + 1}",
            "appended_clause": list(profile.canary_clause),
        },
        "solver": preflight["solver"],
        "descriptor_root": descriptor.descriptor_root,
        "session_result_sha256": _sha(session_result_raw),
        "session_attestation": {
            "core_limit_attested": False,
            "solver_processes_attested": False,
            "cpu_affinity_attested": False,
        },
        "solver_stats_contract": _solver_stats_contract(preflight["solver"]),
        "claims": _claims(),
        "terminal_policy": "PIQD UNSAT is discovery-only; local DRAT required",
    }
    _write_once(root / QUALIFICATION_NAME, _json_bytes(packet))
    return packet


def _validate_qualification(directory: Path, *, production: bool) -> dict[str, Any]:
    root = Path(os.path.abspath(os.fspath(directory)))
    root_before = _root_identity(root)
    expected_names = {
        PREFLIGHT_NAME,
        QUALIFICATION_NAME,
        SESSION_RESULT_NAME,
        IDENTITY_NAME,
        JOURNAL_NAME,
        CLOSE_RESPONSE_NAME,
        "source-manifest.json",
        "producer-manifest.json",
        "source.bin",
        "base.cnf",
        "historical-current.cnf",
        ".solver.cnf",
        "suffix.cnfpart",
        "producer-prepare.json",
        "producer-job.json",
        "producer-job-blob.cnf",
        "solver-registry.json",
        "daemon-version-pre.json",
        "daemon-version-post.json",
    }
    if production:
        expected_names.update(
            custody_name for custody_name, _sha256 in PRODUCTION_SOURCE_BUNDLE.values()
        )
    names_before = {entry.name for entry in os.scandir(root)}
    if names_before != expected_names:
        raise QualificationError(
            "sealed qualification directory has an inexact artifact set"
        )
    snapshots = {name: _read_custody(root, name) for name in expected_names}
    packet = _strict_json(snapshots[QUALIFICATION_NAME], label="qualification packet")
    _keys(
        packet,
        {
            "schema",
            "profile",
            "preflight_sha256",
            "daemon",
            "source",
            "source_bundle",
            "producer",
            "base",
            "historical_current",
            "historical_suffix",
            "terminal_frontier",
            "solver",
            "descriptor_root",
            "session_result_sha256",
            "session_attestation",
            "solver_stats_contract",
            "claims",
            "terminal_policy",
        },
        label="qualification packet",
    )
    expected_schema = SCHEMA if production else TEST_SCHEMA
    if packet["schema"] != expected_schema:
        raise QualificationError("qualification schema/profile lane disagrees")
    profile = _profile_from_packet(packet["profile"], production=production)
    preflight, preflight_profile, preflight_identity = _preflight_common(
        root, production=production
    )
    if (
        profile != preflight_profile
        or packet["preflight_sha256"] != preflight_identity["sha256"]
    ):
        raise QualificationError("final packet does not bind exact preflight")
    source_manifest = snapshots["source-manifest.json"]
    producer_manifest = snapshots["producer-manifest.json"]
    _strict_json(source_manifest, label="source manifest")
    _strict_json(producer_manifest, label="producer manifest")
    authenticated = static.authenticate_static_manifests(
        source_manifest=source_manifest, producer_manifest=producer_manifest
    )
    source = snapshots["source.bin"]
    if (
        packet["source"] != preflight["source"]
        or packet["source_bundle"] != preflight["source_bundle"]
        or _sha(source) != authenticated.source["source_sha256"]
        or authenticated.source_sha256 != packet["source"]["manifest_sha256"]
        or packet["source"]["sha256"] != _sha(source)
        or packet["source"]["bytes"] != len(source)
    ):
        raise QualificationError("sealed source/manifests are not authenticated")
    bundle = packet["source_bundle"]
    if type(bundle) is not list:
        raise QualificationError("sealed source bundle is not an exact list")
    expected_bundle: list[dict[str, Any]] = []
    if production:
        if (
            authenticated.source_sha256 != PRODUCTION_SOURCE_MANIFEST_SHA256
            or authenticated.producer_sha256 != PRODUCTION_PRODUCER_MANIFEST_SHA256
            or authenticated.producer.get("variable_map_sha256")
            != PRODUCTION_VARIABLE_MAP_SHA256
        ):
            raise QualificationError(
                "production manifest or variable-map pin disagrees"
            )
        for declared_path, (
            custody_name,
            expected_hash,
        ) in PRODUCTION_SOURCE_BUNDLE.items():
            raw = snapshots[custody_name]
            matching = [
                item
                for item in bundle
                if type(item) is dict and item.get("path") == declared_path
            ]
            if len(matching) != 1:
                raise QualificationError("production source bundle path set disagrees")
            item = matching[0]
            _keys(
                item,
                {"path", "capture_path", "custody_path", "sha256", "bytes"},
                label="source bundle entry",
            )
            if (
                item["custody_path"] != custody_name
                or item["sha256"] != expected_hash
                or _sha(raw) != expected_hash
                or item["bytes"] != len(raw)
            ):
                raise QualificationError("production source bundle identity disagrees")
            expected_bundle.append(item)
        if bundle != expected_bundle:
            raise QualificationError("production source bundle order disagrees")
    elif bundle != [
        {
            "path": authenticated.source["source_path"],
            "capture_path": packet["source"]["capture_path"],
            "custody_path": "source.bin",
            "sha256": _sha(source),
            "bytes": len(source),
        }
    ]:
        raise QualificationError("test source bundle identity disagrees")
    base = snapshots["base.cnf"]
    current = snapshots["historical-current.cnf"]
    variables, base_clauses = incremental.parse_dimacs(base)
    current_variables, current_clauses = incremental.parse_dimacs(current)
    suffix = incremental._journal_bytes(current_clauses[len(base_clauses) :])
    if (
        variables != profile.variables
        or current_variables != variables
        or len(base_clauses) != profile.base_clauses
        or len(current_clauses) != profile.current_clauses
        or current_clauses[: len(base_clauses)] != base_clauses
        or _sha(base) != profile.base_sha256
        or _sha(current) != profile.current_sha256
        or _sha(suffix) != profile.suffix_sha256
        or len(suffix) != profile.suffix_bytes
        or snapshots["suffix.cnfpart"] != suffix
        or packet["base"] != preflight["base"]
        or packet["historical_current"] != preflight["historical_current"]
        or packet["historical_suffix"] != preflight["historical_suffix"]
    ):
        raise QualificationError("sealed base/current/suffix identity disagrees")
    prepared = _strict_json(
        snapshots["producer-prepare.json"], label="producer prepare evidence"
    )
    _prepared_job_contract(prepared)
    job = _strict_json(snapshots["producer-job.json"], label="producer job")
    _job_contract(job, packet["producer"]["job_id"], prepared=prepared)
    if production and prepared["identity_hash"] != PRODUCTION_RAW_DIMACS_IDENTITY:
        raise QualificationError("producer job raw DIMACS identity disagrees")
    if (
        snapshots["producer-job-blob.cnf"] != base
        or packet["producer"] != preflight["producer"]
        or packet["producer"]["prepare_sha256"]
        != _sha(snapshots["producer-prepare.json"])
        or packet["producer"]["job_sha256"] != _sha(snapshots["producer-job.json"])
        or packet["producer"]["manifest_sha256"] != authenticated.producer_sha256
        or packet["producer"]["variable_map_sha256"]
        != authenticated.producer["variable_map_sha256"]
        or prepared["job_id"] != packet["producer"]["job_id"]
        or packet["producer"]["job_existing"] is not prepared["existing"]
        or packet["producer"]["job_custody"]
        != ("reused" if prepared["existing"] else "fresh")
        or prepared["cnf_blob_hash"] != _sha(base)
        or prepared["num_vars"] != variables
        or prepared["num_clauses"] != len(base_clauses)
        or prepared["backend"] != authenticated.producer.get("backend")
        or prepared["solver_profile"] != authenticated.producer.get("solver_profile")
        or packet["producer"]["raw_dimacs_identity"] != prepared["identity_hash"]
    ):
        raise QualificationError("producer job/blob binding evidence is invalid")
    registry = _strict_json(snapshots["solver-registry.json"], label="solver registry")
    selected = _solver_entry(registry, packet["solver"]["name"])
    if production:
        _production_solver_contract(
            producer=authenticated.producer,
            job=job,
            selected=selected,
            solver_name=packet["solver"]["name"],
        )
    if (
        packet["solver"] != preflight["solver"]
        or selected["sha256"] != packet["solver"]["sha256"]
        or selected["solver_signature"] != packet["solver"]["signature"]
        or selected["solver"] != packet["solver"]["backend"]
        or selected["lane"] != packet["solver"]["lane"]
        or _sha(snapshots["solver-registry.json"])
        != packet["solver"]["registry_sha256"]
    ):
        raise QualificationError("full solver identity evidence disagrees")
    version_pre = _strict_json(
        snapshots["daemon-version-pre.json"], label="version pre"
    )
    version_post = _strict_json(
        snapshots["daemon-version-post.json"], label="version post"
    )
    daemon_sha = _version_object(version_pre, label="version pre")
    _version_object(version_post, label="version post")
    if (
        version_pre != version_post
        or snapshots["daemon-version-pre.json"] != snapshots["daemon-version-post.json"]
        or packet["daemon"]
        != {
            **preflight["daemon"],
            "version_post_sha256": _sha(snapshots["daemon-version-post.json"]),
            "full_object_equal": True,
        }
        or packet["daemon"]["executable_sha256"] != daemon_sha
    ):
        raise QualificationError("full canonical daemon version window disagrees")
    descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=base,
        producer_manifest=producer_manifest,
        source_manifest=source_manifest,
        solver_name=selected["name"],
        producer_job_id=packet["producer"]["job_id"],
    )
    if descriptor.descriptor_root != packet["descriptor_root"]:
        raise QualificationError("descriptor root disagrees")
    expected_terminal = _render_dimacs(
        variables, (*current_clauses, profile.canary_clause)
    )
    terminal = packet["terminal_frontier"]
    if type(terminal) is not dict:
        raise QualificationError("terminal frontier is not an exact object")
    _keys(
        terminal,
        {"custody_path", "sha256", "bytes", "header", "appended_clause"},
        label="terminal frontier",
    )
    if snapshots[".solver.cnf"] != expected_terminal or terminal != {
        "custody_path": ".solver.cnf",
        "sha256": _sha(expected_terminal),
        "bytes": len(expected_terminal),
        "header": f"p cnf {variables} {len(current_clauses) + 1}",
        "appended_clause": list(profile.canary_clause),
    }:
        raise QualificationError("terminal frontier is not exact current plus canary")
    session_result, journal = _session_evidence(
        root,
        descriptor=descriptor,
        solver=packet["solver"],
        variables=variables,
        base_clauses=base_clauses,
        current_clauses=current_clauses,
        canary_clause=profile.canary_clause,
    )
    sealed_session_result = _strict_json(
        snapshots[SESSION_RESULT_NAME], label="session result"
    )
    close_method, close_path = _close_observation(
        sealed_session_result.get("close_method"),
        sealed_session_result.get("close_path"),
        session_result["session_id"],
    )
    session_result["close_method"] = close_method
    session_result["close_path"] = close_path
    if sealed_session_result != session_result or packet[
        "session_result_sha256"
    ] != _sha(snapshots[SESSION_RESULT_NAME]):
        raise QualificationError("session result/capture crossbinding disagrees")
    expected_false = {
        "core_limit_attested": False,
        "solver_processes_attested": False,
        "cpu_affinity_attested": False,
    }
    expected_stats_contract = _solver_stats_contract(packet["solver"])
    if (
        packet["session_attestation"] != expected_false
        or packet["solver_stats_contract"] != expected_stats_contract
        or (
            production
            and not packet["solver_stats_contract"]["worker_pin_matches_session"]
        )
        or packet["claims"] != _claims()
        or packet["terminal_policy"]
        != "PIQD UNSAT is discovery-only; local DRAT required"
    ):
        raise QualificationError("qualification makes a forbidden proof/resource claim")
    if {entry.name for entry in os.scandir(root)} != names_before:
        raise QualificationError("qualification artifacts changed during validation")
    for name, before in snapshots.items():
        if _read_custody(root, name) != before:
            raise QualificationError("qualification artifact changed during validation")
    if _root_identity(root) != root_before:
        raise QualificationError(
            "qualification directory identity changed during validation"
        )
    return {
        "schema": VALIDATION_SCHEMA,
        "authenticated": True,
        "production": production,
        "solve_count": 2,
        "statuses": journal["statuses"],
        "historical_current_sat": True,
        "terminal_unsat": True,
        "empty_core": True,
        "piqd_discovery_only": True,
        "local_drat_required": True,
        "proof_verified": False,
        "global_obstruction": False,
        "theorem_coverage": False,
        "lean_closure": False,
    }


def validate_qualification(directory: Path) -> dict[str, Any]:
    """Validate only the hard-coded production schema."""

    return _validate_qualification(directory, production=True)


def validate_test_qualification(directory: Path) -> dict[str, Any]:
    """Validate an explicitly non-production fixture without promoting its schema."""

    return _validate_qualification(directory, production=False)


@dataclass(frozen=True)
class ProductionAuthorityV2:
    """Offline, self-authenticating entitlement for one fresh production run."""

    path: Path
    raw: bytes = field(repr=False)
    value: Mapping[str, Any] = field(repr=False)

    @property
    def solver(self) -> Mapping[str, Any]:
        return self.value["solver"]


@dataclass(frozen=True)
class ProductionQualificationV2:
    """Live preflight custody; it is not a consumable qualification seal."""

    directory: Path
    authority: ProductionAuthorityV2
    descriptor: incremental.DiscoveryDescriptor
    transport: QualificationTransport
    base_cnf_path: Path = field(repr=False)
    runtime_cnf_path: Path = field(repr=False)
    source_manifest_path: Path = field(repr=False)
    producer_manifest_path: Path = field(repr=False)
    base_cnf_sha256: str = field(repr=False)
    initial_runtime_sha256: str = field(repr=False)
    version_pre_raw: bytes = field(repr=False)
    preflight_raw: bytes = field(repr=False)


def _production_v2_authority_value(raw: bytes, *, path: Path) -> ProductionAuthorityV2:
    value = _strict_json(raw, label="production qualification authority")
    _keys(
        value,
        {
            "schema",
            "daemon_url",
            "daemon_version_pre_sha256",
            "source_manifest_sha256",
            "producer_manifest_sha256",
            "base_cnf_sha256",
            "raw_dimacs_identity",
            "producer_job_id",
            "solver",
            "policy",
            "authority_sha256",
        },
        label="production qualification authority",
    )
    if value["schema"] != PRODUCTION_V2_AUTHORITY_SCHEMA:
        raise QualificationError("production authority schema is not v2")
    _string(value["daemon_url"], label="authority.daemon_url")
    if value["daemon_url"] != value["daemon_url"].rstrip("/"):
        raise QualificationError("authority daemon URL must not end in a slash")
    for key in (
        "daemon_version_pre_sha256",
        "source_manifest_sha256",
        "producer_manifest_sha256",
        "base_cnf_sha256",
        "raw_dimacs_identity",
        "authority_sha256",
    ):
        _hex(value[key], label=f"authority.{key}")
    _uuid(value["producer_job_id"], label="authority.producer_job_id")
    solver = value["solver"]
    if type(solver) is not dict:
        raise QualificationError("authority.solver must be an exact object")
    _keys(
        solver,
        {"name", "sha256", "signature", "backend", "lane"},
        label="authority.solver",
    )
    _string(solver["name"], label="authority.solver.name")
    _hex(solver["sha256"], label="authority.solver.sha256")
    _string(solver["signature"], label="authority.solver.signature")
    if solver["backend"] != "cadical" or solver["lane"] != "sat":
        raise QualificationError("authority solver is outside the cadical SAT lane")
    if value["policy"] != dict(PRODUCTION_V2_POLICY):
        raise QualificationError("authority policy is not the sealed production policy")
    unsigned = dict(value)
    seal = unsigned.pop("authority_sha256")
    if _sha(_json_bytes(unsigned)) != seal:
        raise QualificationError("production authority seal is invalid")
    return ProductionAuthorityV2(Path(path), raw, value)


def load_production_authority_v2(path: Path) -> ProductionAuthorityV2:
    """Load a canonical authority without creating output or using transport."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    return _production_v2_authority_value(
        _capture(absolute, limit=MAX_CONTROL_BYTES), path=absolute
    )


def capture_production_control_input_v2(path: Path) -> bytes:
    """Capture one bounded launcher input without following a final symlink."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    return _capture(absolute, limit=MAX_CONTROL_BYTES)


def _revalidate_production_authority_v2(
    authority: ProductionAuthorityV2,
) -> ProductionAuthorityV2:
    if type(authority) is not ProductionAuthorityV2:
        raise QualificationError("production launch requires exact v2 authority")
    checked = _production_v2_authority_value(authority.raw, path=authority.path)
    if authority.value != checked.value:
        raise QualificationError("production authority changed after loading")
    return checked


def validate_production_launch_authority_v2(
    authority: ProductionAuthorityV2,
    *,
    daemon_url: str,
    source_manifest: bytes,
    producer_manifest: bytes,
    producer_job_id: str,
    solver_name: str,
) -> static.StaticManifestContract:
    """Bind an offline authority to the exact launcher inputs."""

    authority = _revalidate_production_authority_v2(authority)
    try:
        authenticated = static.authenticate_static_manifests(
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
        )
    except static.StaticPiqdRunnerError as exc:
        raise QualificationError(str(exc)) from exc
    value = authority.value
    if (
        value["daemon_url"] != daemon_url.rstrip("/")
        or value["source_manifest_sha256"] != authenticated.source_sha256
        or value["producer_manifest_sha256"] != authenticated.producer_sha256
        or value["producer_job_id"] != producer_job_id
        or value["solver"]["name"] != solver_name
    ):
        raise QualificationError("production authority disagrees with launcher inputs")
    expected_raw_identity = raw_dimacs_identity(
        backend=authenticated.producer["backend"],
        solver_profile=authenticated.producer["solver_profile"],
        cnf_sha256=value["base_cnf_sha256"],
        producer_manifest_sha256=authenticated.producer_sha256,
        requested_core_limit=1,
    )
    if value["raw_dimacs_identity"] != expected_raw_identity:
        raise QualificationError("authority raw DIMACS identity is inconsistent")
    return authenticated


def prepare_production_qualification_v2(
    *,
    authority: ProductionAuthorityV2,
    output_dir: Path,
    base_cnf_path: Path,
    runtime_cnf_path: Path,
    source_manifest_path: Path,
    producer_manifest_path: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    daemon_url: str,
    producer_job_id: str,
    solver_name: str,
    descriptor: incremental.DiscoveryDescriptor,
    transport: Transport,
) -> ProductionQualificationV2:
    """Authenticate runtime inputs and capture v2 preflight in an existing output."""

    authority = _revalidate_production_authority_v2(authority)
    authenticated = validate_production_launch_authority_v2(
        authority,
        daemon_url=daemon_url,
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
        producer_job_id=producer_job_id,
        solver_name=solver_name,
    )
    root = Path(os.path.abspath(os.fspath(output_dir)))
    _private_dir(root)
    for name in (
        PRODUCTION_V2_AUTHORITY_NAME,
        PRODUCTION_V2_PREFLIGHT_NAME,
        PRODUCTION_V2_SESSION_RESULT_NAME,
        PRODUCTION_V2_QUALIFICATION_NAME,
        IDENTITY_NAME,
        JOURNAL_NAME,
        CLOSE_RESPONSE_NAME,
    ):
        if (root / name).exists():
            raise QualificationError("production v2 requires fresh custody")
    base_path = Path(os.path.abspath(os.fspath(base_cnf_path)))
    runtime_path = Path(os.path.abspath(os.fspath(runtime_cnf_path)))
    source_path = Path(os.path.abspath(os.fspath(source_manifest_path)))
    producer_path = Path(os.path.abspath(os.fspath(producer_manifest_path)))
    if _capture(source_path, limit=MAX_CONTROL_BYTES) != source_manifest:
        raise QualificationError("source manifest path changed before preflight")
    if _capture(producer_path, limit=MAX_CONTROL_BYTES) != producer_manifest:
        raise QualificationError("producer manifest path changed before preflight")
    base = _capture(base_path)
    current = _capture(runtime_path)
    if _sha(base) != authority.value["base_cnf_sha256"]:
        raise QualificationError("runtime base CNF disagrees with authority")
    base_variables, base_clauses = incremental.parse_dimacs(base)
    current_variables, current_clauses = incremental.parse_dimacs(current)
    if (
        current_variables != base_variables
        or current_clauses[: len(base_clauses)] != base_clauses
    ):
        raise QualificationError(
            "runtime .solver.cnf is not an append-only base extension"
        )
    if descriptor.seed_cnf != base or (
        descriptor.source_manifest != authenticated.source_bytes
        or descriptor.producer_manifest != authenticated.producer_bytes
        or descriptor.producer_job_id != producer_job_id
        or descriptor.solver_name != solver_name
    ):
        raise QualificationError("production descriptor is not preflight-rooted")

    version_pre_raw = _get_json_exact_bytes(
        transport, "/version", label="daemon version pre"
    )
    version_pre = _strict_json(
        version_pre_raw, label="daemon version pre", canonical=False
    )
    _version_object(version_pre, label="daemon version pre")
    if _sha(version_pre_raw) != authority.value["daemon_version_pre_sha256"]:
        raise QualificationError("daemon pre-version snapshot disagrees with authority")
    job_raw = _get_json(transport, f"/jobs/{producer_job_id}", label="producer job")
    job = _strict_json(job_raw, label="producer job")
    _job_contract(
        job,
        producer_job_id,
        prepared={
            "backend": authenticated.producer["backend"],
            "cnf_blob_hash": authority.value["base_cnf_sha256"],
            "identity_hash": authority.value["raw_dimacs_identity"],
        },
    )
    blob_response = _response(
        transport(
            "GET",
            f"/jobs/{producer_job_id}/blobs/{authority.value['base_cnf_sha256']}",
            None,
            {"Accept": "application/octet-stream"},
        ),
        label="producer job base blob",
        limit=MAX_CNF_ARTIFACT_RESPONSE_BYTES,
    )
    if blob_response.status != 200 or blob_response.body != base:
        raise QualificationError("producer job base blob disagrees with local base")
    registry_raw = _get_json(transport, "/solvers", label="solver registry")
    selected = _solver_entry(
        _strict_json(registry_raw, label="solver registry"), solver_name
    )
    solver = authority.solver
    if (
        selected["sha256"] != solver["sha256"]
        or selected["solver_signature"] != solver["signature"]
        or selected["solver"] != solver["backend"]
        or selected["lane"] != solver["lane"]
    ):
        raise QualificationError("live solver registry disagrees with authority")

    preflight = {
        "schema": PRODUCTION_V2_PREFLIGHT_SCHEMA,
        "authority_sha256": authority.value["authority_sha256"],
        "daemon_version_pre_sha256": _sha(version_pre_raw),
        "source_manifest_sha256": authenticated.source_sha256,
        "producer_manifest_sha256": authenticated.producer_sha256,
        "base_cnf_sha256": _sha(base),
        "base_variables": base_variables,
        "base_clauses": len(base_clauses),
        "initial_runtime_sha256": _sha(current),
        "initial_runtime_clauses": len(current_clauses),
        "raw_dimacs_identity": authority.value["raw_dimacs_identity"],
        "producer_job_id": producer_job_id,
        "producer_job_sha256": _sha(job_raw),
        "solver_registry_sha256": _sha(registry_raw),
        "descriptor_root": descriptor.descriptor_root,
        "policy": dict(PRODUCTION_V2_POLICY),
        "claims": _claims(),
    }
    _write_once(root / PRODUCTION_V2_AUTHORITY_NAME, authority.raw)
    _write_once(root / "daemon-version-pre-v2.json", version_pre_raw)
    _write_once(root / "source-manifest-v2.json", source_manifest)
    _write_once(root / "producer-manifest-v2.json", producer_manifest)
    _write_once(root / "producer-job-v2.json", job_raw)
    _write_once(root / "solver-registry-v2.json", registry_raw)
    _write_once(root / "initial-runtime-v2.cnf", current)
    preflight_raw = _json_bytes(preflight)
    _write_once(root / PRODUCTION_V2_PREFLIGHT_NAME, preflight_raw)
    wrapper = QualificationTransport(
        transport,
        root=root,
        solver_name=solver_name,
        solver_sha256=solver["sha256"],
        solver_signature=solver["signature"],
        descriptor_root=descriptor.descriptor_root,
        producer_job_id=producer_job_id,
        base_sha256=_sha(base),
        generalized=True,
    )
    return ProductionQualificationV2(
        root,
        authority,
        descriptor,
        wrapper,
        base_path,
        runtime_path,
        source_path,
        producer_path,
        _sha(base),
        _sha(current),
        version_pre_raw,
        preflight_raw,
    )


def _validate_production_v2_journal(
    contract: ProductionQualificationV2,
) -> dict[str, Any]:
    raw = _read_custody(contract.directory, JOURNAL_NAME)
    if not raw or not raw.endswith(b"\n"):
        raise QualificationError("production journal is empty or incomplete")
    variables, base_clauses = incremental.parse_dimacs(_capture(contract.base_cnf_path))
    clauses = list(base_clauses)
    tail: str | None = None
    session_id: str | None = None
    solve_count = 0
    statuses: list[str] = []
    event_sequence: list[str] = []
    common = {
        "schema",
        "sequence",
        "prior_event_sha256",
        "event_sha256",
        "event",
        "session_id",
        "producer_job_id",
        "descriptor_root",
        "frontier_count",
        "frontier_sha256",
        "learned_state",
    }
    event_keys = {
        "open": common | {"seed_blob_hash", "seed_sha256"},
        "append": common | {"clauses", "prior_frontier_sha256"},
        "solve": common
        | {
            "status",
            "solve_index",
            "result_sha256",
            "receipt",
            "model",
            "proof_verified",
            "closure_claim",
        },
    }
    for sequence, line in enumerate(raw.splitlines(keepends=True)):
        if not line.endswith(b"\n"):
            raise QualificationError("production journal has a partial record")
        event = _strict_json(line[:-1], label="production journal event")
        kind = event.get("event")
        if kind not in event_keys:
            raise QualificationError("production journal has an unknown event")
        _keys(event, event_keys[kind], label=f"production journal {kind} event")
        unsigned = dict(event)
        event_hash = unsigned.pop("event_sha256", None)
        if (
            event.get("schema") != incremental.SCHEMA
            or event.get("sequence") != sequence
            or event.get("prior_event_sha256") != tail
            or _sha(_json_bytes(unsigned)) != event_hash
        ):
            raise QualificationError("production journal hash chain is invalid")
        if (
            event.get("producer_job_id") != contract.descriptor.producer_job_id
            or event.get("descriptor_root") != contract.descriptor.descriptor_root
        ):
            raise QualificationError("production journal is not descriptor-rooted")
        if session_id is None:
            session_id = _uuid(event.get("session_id"), label="journal session UUID")
        elif event.get("session_id") != session_id:
            raise QualificationError("production journal session identity drifted")
        if sequence == 0:
            if (
                kind != "open"
                or event.get("seed_blob_hash") != contract.descriptor.seed_blob_hash
                or event.get("seed_sha256") != contract.descriptor.seed_sha256
                or event.get("seed_sha256") != contract.base_cnf_sha256
            ):
                raise QualificationError("production journal has no exact fresh open")
        elif kind == "open" or kind == "revive":
            raise QualificationError(
                "production journal is not a fresh one-session run"
            )
        if event.get("learned_state") != "not_claimed":
            raise QualificationError("production journal makes a learned-state claim")
        if kind == "append":
            additions = event.get("clauses")
            if type(additions) is not list or not additions:
                raise QualificationError("production append event is empty")
            prior = incremental._frontier_hash(variables, clauses)
            checked = [incremental._check_clause(item, variables) for item in additions]
            clauses.extend(checked)
            event_sequence.append("append")
            if event.get("prior_frontier_sha256") != prior:
                raise QualificationError("production append prior frontier drifted")
        elif kind == "solve":
            solve_count += 1
            status = event.get("status")
            if (
                event.get("solve_index") != solve_count
                or status not in {"SAT", "UNSAT", "UNKNOWN"}
                or event.get("proof_verified") is not False
                or event.get("closure_claim") is not False
            ):
                raise QualificationError(
                    "production solve event is unsafe or not dense"
                )
            receipt = event.get("receipt")
            result_sha256 = _hex(
                event.get("result_sha256"), label="production solve result_sha256"
            )
            _validate_receipt(
                receipt,
                status=status,
                solve_index=solve_count,
                result_sha256=result_sha256,
                frontier=clauses,
            )
            if status == "SAT":
                _validate_model(event.get("model"), variables, clauses)
            elif event.get("model") is not None:
                raise QualificationError("non-SAT production solve records a model")
            statuses.append(status)
            event_sequence.append("solve")
        frontier = incremental._frontier_hash(variables, clauses)
        if (
            event.get("frontier_count") != len(clauses)
            or event.get("frontier_sha256") != frontier
        ):
            raise QualificationError("production journal frontier is invalid")
        tail = event_hash
    if solve_count < 1 or statuses != contract.transport.statuses:
        raise QualificationError("production journal solve history is incomplete")
    if event_sequence != contract.transport.event_sequence:
        raise QualificationError("transport and journal append/solve order disagree")
    runtime = _capture(contract.runtime_cnf_path)
    runtime_variables, runtime_clauses = incremental.parse_dimacs(runtime)
    if runtime_variables != variables or runtime_clauses != tuple(clauses):
        raise QualificationError("runtime .solver.cnf is not the journal frontier")
    return {
        "session_id": session_id,
        "journal_sha256": _sha(raw),
        "solve_count": solve_count,
        "statuses": statuses,
        "final_frontier_count": len(clauses),
        "final_frontier_sha256": incremental._frontier_hash(variables, clauses),
        "final_runtime_sha256": _sha(runtime),
    }


def _write_seal_last(path: Path, data: bytes) -> None:
    """Install a complete seal atomically without overwriting an existing one."""

    temporary = path.with_name(f".{path.name}.{uuid.uuid4().hex}.tmp")
    _write_once(temporary, data)
    parent = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC)
    try:
        try:
            os.link(
                temporary.name,
                path.name,
                src_dir_fd=parent,
                dst_dir_fd=parent,
                follow_symlinks=False,
            )
        except FileExistsError as exc:
            raise QualificationError(
                "production qualification is already sealed"
            ) from exc
        os.fsync(parent)
        os.unlink(temporary.name, dir_fd=parent)
        os.fsync(parent)
    finally:
        os.close(parent)


def finalize_production_qualification_v2(
    contract: ProductionQualificationV2,
    *,
    driver_status: str,
) -> dict[str, Any] | None:
    """Seal only a closed, successful, fully cross-bound production run."""

    if type(contract) is not ProductionQualificationV2:
        raise QualificationError("production finalization requires exact v2 custody")
    if driver_status not in PRODUCTION_V2_SUCCESS_STATUSES:
        return None
    root = contract.directory
    if (root / PRODUCTION_V2_QUALIFICATION_NAME).exists():
        raise QualificationError("production qualification is already sealed")
    if not contract.transport.close_observed:
        raise QualificationError("production finalization requires confirmed close")
    if contract.transport.solve_count < 1 or "UNKNOWN" in contract.transport.statuses:
        raise QualificationError("incomplete or UNKNOWN production runs cannot seal")
    if contract.transport.statuses[-1] != "UNSAT":
        raise QualificationError("production qualification must end at PIQD UNSAT")
    authority = _revalidate_production_authority_v2(contract.authority)
    if (
        _read_custody(root, PRODUCTION_V2_AUTHORITY_NAME, limit=MAX_CONTROL_BYTES)
        != authority.raw
    ):
        raise QualificationError("production authority custody changed during the run")
    if (
        _read_custody(root, "daemon-version-pre-v2.json", limit=MAX_CONTROL_BYTES)
        != contract.version_pre_raw
    ):
        raise QualificationError("daemon pre-version custody changed during the run")
    version_pre = _strict_json(
        contract.version_pre_raw, label="daemon version pre", canonical=False
    )
    _version_object(version_pre, label="daemon version pre")
    if _sha(contract.version_pre_raw) != authority.value["daemon_version_pre_sha256"]:
        raise QualificationError("daemon pre-version no longer matches authority")
    if (
        _read_custody(root, PRODUCTION_V2_PREFLIGHT_NAME, limit=MAX_CONTROL_BYTES)
        != contract.preflight_raw
    ):
        raise QualificationError("production preflight custody changed during the run")
    base = _capture(contract.base_cnf_path)
    if (
        _sha(base) != contract.base_cnf_sha256
        or _sha(base) != authority.value["base_cnf_sha256"]
    ):
        raise QualificationError("production base CNF changed during the run")
    source_raw = _read_custody(root, "source-manifest-v2.json", limit=MAX_CONTROL_BYTES)
    producer_raw = _read_custody(
        root, "producer-manifest-v2.json", limit=MAX_CONTROL_BYTES
    )
    if _capture(contract.source_manifest_path, limit=MAX_CONTROL_BYTES) != source_raw:
        raise QualificationError("source manifest changed during the run")
    if (
        _capture(contract.producer_manifest_path, limit=MAX_CONTROL_BYTES)
        != producer_raw
    ):
        raise QualificationError("producer manifest changed during the run")
    authenticated = validate_production_launch_authority_v2(
        authority,
        daemon_url=authority.value["daemon_url"],
        source_manifest=source_raw,
        producer_manifest=producer_raw,
        producer_job_id=contract.descriptor.producer_job_id,
        solver_name=contract.descriptor.solver_name,
    )
    initial_runtime = _read_custody(root, "initial-runtime-v2.cnf")
    if _sha(initial_runtime) != contract.initial_runtime_sha256:
        raise QualificationError("initial runtime custody changed during the run")
    base_variables, base_clauses = incremental.parse_dimacs(base)
    initial_variables, initial_clauses = incremental.parse_dimacs(initial_runtime)
    if (
        initial_variables != base_variables
        or initial_clauses[: len(base_clauses)] != base_clauses
        or contract.descriptor.seed_cnf != base
        or contract.descriptor.source_manifest != authenticated.source_bytes
        or contract.descriptor.producer_manifest != authenticated.producer_bytes
    ):
        raise QualificationError("production preflight roots are inconsistent")
    job_raw = _read_custody(root, "producer-job-v2.json", limit=MAX_CONTROL_BYTES)
    registry_raw = _read_custody(
        root, "solver-registry-v2.json", limit=MAX_CONTROL_BYTES
    )
    preflight = _strict_json(contract.preflight_raw, label="production preflight")
    expected_preflight = {
        "schema": PRODUCTION_V2_PREFLIGHT_SCHEMA,
        "authority_sha256": authority.value["authority_sha256"],
        "daemon_version_pre_sha256": _sha(contract.version_pre_raw),
        "source_manifest_sha256": authenticated.source_sha256,
        "producer_manifest_sha256": authenticated.producer_sha256,
        "base_cnf_sha256": _sha(base),
        "base_variables": base_variables,
        "base_clauses": len(base_clauses),
        "initial_runtime_sha256": _sha(initial_runtime),
        "initial_runtime_clauses": len(initial_clauses),
        "raw_dimacs_identity": authority.value["raw_dimacs_identity"],
        "producer_job_id": contract.descriptor.producer_job_id,
        "producer_job_sha256": _sha(job_raw),
        "solver_registry_sha256": _sha(registry_raw),
        "descriptor_root": contract.descriptor.descriptor_root,
        "policy": dict(PRODUCTION_V2_POLICY),
        "claims": _claims(),
    }
    if preflight != expected_preflight:
        raise QualificationError("production preflight no longer matches its roots")
    journal = _validate_production_v2_journal(contract)
    close_raw = _read_custody(root, CLOSE_RESPONSE_NAME, limit=MAX_CONTROL_BYTES)
    close = _strict_json(close_raw, label="production close response")
    if (
        close.get("id") != journal["session_id"]
        or contract.transport.session_id != journal["session_id"]
        or close.get("state") != "closed"
        or close.get("solves") != journal["solve_count"]
        or close.get("last_solve_index") != journal["solve_count"]
        or close.get("last_status") != journal["statuses"][-1]
        or close.get("clauses") != journal["final_frontier_count"]
        or close.get("last_assumption_free") is not True
        or close.get("last_terminal_unsat") is not True
    ):
        raise QualificationError("close response does not bind final production state")
    version_post_raw = contract.transport.capture_post_version()
    version_post = _strict_json(
        version_post_raw, label="daemon version post", canonical=False
    )
    _version_object(version_post, label="daemon version post")
    if version_post_raw != contract.version_pre_raw:
        raise QualificationError("daemon version object changed during production run")
    _write_once(root / "daemon-version-post-v2.json", version_post_raw)
    session_result = {
        "schema": PRODUCTION_V2_SESSION_RESULT_SCHEMA,
        **journal,
        "close_response_sha256": _sha(close_raw),
        "close_method": contract.transport.close_method,
        "close_path": contract.transport.close_path,
        "driver_status": driver_status,
        "proof_verified": False,
        "closure_claim": False,
    }
    session_result_raw = _json_bytes(session_result)
    _write_once(root / PRODUCTION_V2_SESSION_RESULT_NAME, session_result_raw)
    seal = {
        "schema": PRODUCTION_V2_QUALIFICATION_SCHEMA,
        "authority_sha256": authority.value["authority_sha256"],
        "preflight_sha256": _sha(contract.preflight_raw),
        "daemon_version_pre_sha256": _sha(contract.version_pre_raw),
        "daemon_version_post_sha256": _sha(version_post_raw),
        "daemon_version_equal": True,
        "session_result_sha256": _sha(session_result_raw),
        "solve_count": journal["solve_count"],
        "statuses": journal["statuses"],
        "final_frontier_count": journal["final_frontier_count"],
        "final_frontier_sha256": journal["final_frontier_sha256"],
        "final_runtime_sha256": journal["final_runtime_sha256"],
        "driver_status": driver_status,
        "policy": dict(PRODUCTION_V2_POLICY),
        "claims": _claims(),
        "terminal_policy": "PIQD discovery only; fresh local DRAT is the terminal proof boundary",
    }
    _write_seal_last(root / PRODUCTION_V2_QUALIFICATION_NAME, _json_bytes(seal))
    return seal


__all__ = [
    "CLOSE_RESPONSE_NAME",
    "IDENTITY_NAME",
    "JOURNAL_NAME",
    "PRODUCTION_BASE_CLAUSES",
    "PRODUCTION_BASE_SHA256",
    "PRODUCTION_CANARY_CLAUSE",
    "PRODUCTION_CURRENT_CLAUSES",
    "PRODUCTION_CURRENT_SHA256",
    "PRODUCTION_PRODUCER_MANIFEST_SHA256",
    "PRODUCTION_RAW_DIMACS_IDENTITY",
    "PRODUCTION_REPOSITORY_COMMIT",
    "PRODUCTION_SOLVER_BACKEND",
    "PRODUCTION_SOLVER_LANE",
    "PRODUCTION_SOLVER_NAME",
    "PRODUCTION_SOLVER_SHA256",
    "PRODUCTION_SOLVER_SIGNATURE",
    "PRODUCTION_SOURCE_BUNDLE",
    "PRODUCTION_SOURCE_MANIFEST_SHA256",
    "PRODUCTION_SUFFIX_BYTES",
    "PRODUCTION_SUFFIX_CLAUSES",
    "PRODUCTION_SUFFIX_SHA256",
    "PRODUCTION_V2_AUTHORITY_NAME",
    "PRODUCTION_V2_AUTHORITY_SCHEMA",
    "PRODUCTION_V2_POLICY",
    "PRODUCTION_V2_PREFLIGHT_NAME",
    "PRODUCTION_V2_QUALIFICATION_NAME",
    "PRODUCTION_V2_QUALIFICATION_SCHEMA",
    "PRODUCTION_V2_SESSION_RESULT_NAME",
    "PRODUCTION_V2_SUCCESS_STATUSES",
    "PRODUCTION_VARIABLES",
    "PRODUCTION_VARIABLE_MAP_SHA256",
    "SCHEMA",
    "SESSION_IDENTITY_SCHEMA",
    "SESSION_RESULT_NAME",
    "SOLVE_RESPONSE_NAMES",
    "TEST_SCHEMA",
    "ProductionAuthorityV2",
    "ProductionQualificationV2",
    "QualificationContract",
    "QualificationError",
    "QualificationTransport",
    "capture_production_control_input_v2",
    "finalize_production_qualification_v2",
    "finalize_qualification",
    "load_production_authority_v2",
    "prepare_production_qualification_v2",
    "prepare_qualification",
    "prepare_test_qualification",
    "qualified_transport",
    "validate_production_launch_authority_v2",
    "validate_qualification",
    "validate_test_qualification",
]
