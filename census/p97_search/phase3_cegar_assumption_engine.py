"""One-session shared engine for closed ASSUMPTION_CNF campaigns."""

from __future__ import annotations

import fcntl
import hashlib
import json
import os
import stat
import uuid
from collections.abc import Callable, Iterator, Mapping
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Final

from .cegar_wave_assumption_profiles import (
    CHILD45_SCHEMA,
    AssumptionCampaignProfile,
    assumption_campaign_metadata,
    replay_sat,
)
from .exact17_source_model_replay import (
    canonical_assignment_from_source_model,
    canonical_assignment_sha256,
)
from .phase3_cegar_runtime import capture_exact_regular_file
from .phase3_cegar_wave import canonical_json_bytes, wave_manifest_sha256
from .phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_EXECUTION_CAPABILITIES,
    ASSUMPTION_CNF_EXECUTION_MODE,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    ASSUMPTION_CNF_V1_REGISTRY_REVISION,
    EXECUTION_REGISTRY_SCHEMA,
    AssumptionCnfBinding,
    WaveControl,
    bind_assumption_cnf,
)
from .phase3_piqd_assumption_campaign import (
    AssumptionCampaignResult,
    AssumptionCampaignSession,
    AssumptionCampaignSpec,
    AssumptionCell,
    CampaignReceipt,
    CnfStreamIdentity,
    stream_parent_identity,
)
from .phase3_piqd_incremental_discovery import (
    _result_digest,
    _solve_request_digest,
)

ENGINE_SCHEMA: Final = "p97-cegar-assumption-cnf-engine/v1"
NOT_RUN: Final = "NOT_RUN"
ATTEMPTED: Final = "ATTEMPTED"
PARENT_TERMINAL_DISCOVERY_ONLY: Final = "PARENT_TERMINAL_DISCOVERY_ONLY"
SAT_SEMANTIC_REPLAYED: Final = "SAT_SEMANTIC_REPLAYED"
INCONCLUSIVE: Final = "INCONCLUSIVE"
CELLS_UNSAT_DISCOVERY_ONLY: Final = "CELLS_UNSAT_DISCOVERY_ONLY"

_NATIVE_PATH = type(Path())
_MAX_OUTPUT_BYTES = 16 << 20
_DIRECTORY_FLAGS = (
    os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0) | os.O_NOFOLLOW
)
_STRICT_REPLAY_LOCK_DIRECTORY = ".exact17-strict-replay-locks"
_REQUEST_NAMESPACE = uuid.UUID("2f112583-c8af-4a7f-8e12-3128b0a0a97d")
_HEX = frozenset("0123456789abcdef")
_CLAIMS = (
    "proof",
    "theorem",
    "lean",
    "closure",
    "cleanup",
    "source_entitlement",
    "universal_lift",
)
_ENVELOPE_KEYS = frozenset(
    {
        "schema",
        "wave_kind",
        "adapter",
        "control",
        "wave_manifest",
        "campaign",
        "parent",
        "package",
        "execution_registration",
        "runtime_solver",
        "session_id",
        "cells",
        "summary",
        "close_observed",
        "claims",
        "envelope_sha256",
    }
)
_ATTEMPTED_KEYS = frozenset(
    {
        "state",
        "cell_id",
        "assumptions",
        "request_id",
        "request_sha256",
        "status",
        "discovery_scope",
        "result_sha256",
        "replayed",
        "source_replayed",
        "proof_verified",
        "closure_claim",
        "core",
        "receipt",
        "semantic_replay",
        "semantic_result_sha256",
    }
)
_NOT_RUN_KEYS = frozenset({"state", "cell_id", "assumptions", "reason"})
_RECEIPT_KEYS = frozenset(
    {
        "session_id",
        "solve_index",
        "base_clauses",
        "base_bytes",
        "base_sha256",
        "assumptions",
        "status",
        "model_recorded",
        "result_sha256",
        "request_id",
        "request_sha256",
        "conflict_limit",
        "timeout_ms",
        "interrupted_by",
        "core",
        "at",
    }
)
_REGISTRATION_KEYS = frozenset({"schema", "registry_revision", "registration"})
_REGISTRATION_VALUE_KEYS = frozenset(
    {
        "wave_kind",
        "adapter_id",
        "adapter_schema",
        "registry_revision",
        "engine_schema",
        "semantic_validator",
        "execution_mode",
        "capabilities",
        "permits_campaign",
        "permits_export",
        "permits_diagnostic_mining",
        "permits_terminal_proof",
    }
)
_RUNTIME_SOLVER_KEYS = frozenset({"signature", "campaign_descriptor_root"})
_CHILD44_RESULT_SCHEMA = "p97-exact17-child44-assumption-sat-replay/v1"
_CHILD45_RESULT_SCHEMA = "p97-exact17-child45-assumption-sat-replay/v1"
_CHILD45_SUFFIX_SHA256 = (
    "7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590"
)
_CHILD44_SEMANTIC_RESULT_KEYS = frozenset(
    {
        "schema",
        "cell_id",
        "assumptions",
        "parent_sha256",
        "parent_bytes",
        "parent_variables",
        "parent_clauses",
        "assignment_sha256",
        "source_model",
        "source_predicates",
        "replay_sha256",
        "kalmanson",
        "result_sha256",
    }
)
_CHILD45_SEMANTIC_RESULT_KEYS = _CHILD44_SEMANTIC_RESULT_KEYS | frozenset(
    {
        "root_sha256",
        "root_bytes",
        "root_variables",
        "root_clauses",
        "suffix_sha256",
    }
)


class AssumptionCnfEngineError(RuntimeError):
    """The shared assumption engine failed before safe publication."""


@dataclass(frozen=True)
class AssumptionCnfEngineResult:
    classification: str
    output_path: Path
    envelope: dict[str, Any]


SessionFactory = Callable[..., Any]


def _fail(message: str) -> None:
    raise AssumptionCnfEngineError(message)


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _sha_value(value: object) -> str:
    return _sha(canonical_json_bytes(value))


def _hex64(value: object, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        _fail(f"{label} must be a lowercase SHA-256")
    return value


def _canonical_uuid(value: object, label: str) -> str:
    if type(value) is not str:
        _fail(f"{label} must be a canonical UUID")
    try:
        parsed = uuid.UUID(value)
    except (ValueError, AttributeError) as exc:
        raise AssumptionCnfEngineError(f"{label} must be a canonical UUID") from exc
    if str(parsed) != value or parsed.variant != uuid.RFC_4122:
        _fail(f"{label} must be a canonical UUID")
    return value


def _request_id(
    binding: AssumptionCnfBinding, cell_id: str, assumptions: tuple[int, ...]
) -> str:
    control_sha = _sha(binding.control.canonical_bytes)
    name = _sha_value(
        {
            "schema": ENGINE_SCHEMA,
            "control_sha256": control_sha,
            "campaign_sha256": binding.campaign.raw_sha256,
            "cell_id": cell_id,
            "assumptions": list(assumptions),
        }
    )
    return str(uuid.uuid5(_REQUEST_NAMESPACE, name))


def _identity(value: CnfStreamIdentity, path: Path) -> dict[str, Any]:
    return {
        "path": str(path),
        "sha256": value.sha256,
        "bytes": value.num_bytes,
        "variables": value.num_vars,
        "clauses": value.num_clauses,
        "max_var": value.max_var,
        "journal_sha256": value.journal_sha256,
        "journal_bytes": value.journal_bytes,
        "all_variables_used": value.all_variables_used,
        "source_dev": value.source_dev,
        "source_ino": value.source_ino,
        "path_chain": [list(component) for component in value.path_chain],
    }


def _receipt(value: CampaignReceipt) -> dict[str, Any]:
    if type(value) is not CampaignReceipt:
        _fail("campaign result receipt has the wrong type")
    return {
        "session_id": value.session_id,
        "solve_index": value.solve_index,
        "base_clauses": value.base_clauses,
        "base_bytes": value.base_bytes,
        "base_sha256": value.base_sha256,
        "assumptions": list(value.assumptions),
        "status": value.status,
        "model_recorded": value.model_recorded,
        "result_sha256": value.result_sha256,
        "request_id": value.request_id,
        "request_sha256": value.request_sha256,
        "conflict_limit": value.conflict_limit,
        "timeout_ms": value.timeout_ms,
        "interrupted_by": value.interrupted_by,
        "core": None if value.core is None else list(value.core),
        "at": value.at,
    }


def _expected_registration() -> dict[str, Any]:
    value = {
        "wave_kind": ASSUMPTION_CNF,
        "adapter_id": ASSUMPTION_CNF_PIQD_ADAPTER,
        "adapter_schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
        "registry_revision": ASSUMPTION_CNF_V1_REGISTRY_REVISION,
        "engine_schema": ENGINE_SCHEMA,
        "semantic_validator": ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
        "execution_mode": ASSUMPTION_CNF_EXECUTION_MODE,
        "capabilities": list(ASSUMPTION_CNF_EXECUTION_CAPABILITIES),
        "permits_campaign": True,
        "permits_export": False,
        "permits_diagnostic_mining": True,
        "permits_terminal_proof": False,
    }
    return {
        "schema": EXECUTION_REGISTRY_SCHEMA,
        "registry_revision": ASSUMPTION_CNF_V1_REGISTRY_REVISION,
        "registration": value,
    }


def _registration(value: Mapping[str, Any]) -> dict[str, Any]:
    if type(value) is not dict or set(value) != _REGISTRATION_KEYS:
        _fail("execution registration has an inexact envelope")
    nested = value.get("registration")
    if type(nested) is not dict or set(nested) != _REGISTRATION_VALUE_KEYS:
        _fail("execution registration has inexact fields")
    if value != _expected_registration():
        _fail("execution registration crossed the closed assumption adapter")
    return json.loads(canonical_json_bytes(value))


def _default_session_factory(**kwargs: Any) -> AssumptionCampaignSession:
    return AssumptionCampaignSession(**kwargs)


def _make_spec(
    binding: AssumptionCnfBinding, solver_signature: str
) -> AssumptionCampaignSpec:
    campaign = binding.campaign
    return AssumptionCampaignSpec(
        parent_cnf_path=binding.parent_path,
        parent_sha256=campaign.parent_sha256,
        parent_num_bytes=campaign.parent_byte_count,
        parent_num_vars=campaign.variables,
        parent_num_clauses=campaign.clauses,
        producer_job_id=campaign.parent_job_id,
        producer_job_status="completed",
        producer_manifest_sha256=campaign.producer_manifest_sha256,
        solver_name=campaign.solver_name,
        solver_sha256=campaign.solver_sha256,
        solver_signature=solver_signature,
        protocol_version=campaign.solver_protocol_version,
        conflict_limit=campaign.conflict_limit,
        timeout_ms=campaign.timeout_ms,
    )


def _check_result(
    value: AssumptionCampaignResult,
    *,
    binding: AssumptionCnfBinding,
    session_id: str,
    cell_id: str,
    assumptions: tuple[int, ...],
    request_id: str,
    solve_index: int,
) -> None:
    if type(value) is not AssumptionCampaignResult:
        _fail("campaign session returned the wrong result type")
    expected_scope = {
        "SAT": "sat-witness-replayed",
        "UNKNOWN": "inconclusive",
        "UNSAT": "terminal-discovery-only"
        if value.core == ()
        else "cell-discovery-only",
    }.get(value.status)
    if (
        expected_scope is None
        or value.session_id != session_id
        or value.cell_id != cell_id
        or value.assumptions != assumptions
        or value.request_id != request_id
        or value.solve_index != solve_index
        or value.discovery_scope != expected_scope
        or value.parent_sha256 != binding.campaign.parent_sha256
        or value.export_sha256 != binding.campaign.parent_sha256
        or value.source_replayed is not True
        or value.proof_verified is not False
        or value.closure_claim is not False
        or type(value.replayed) is not bool
    ):
        _fail("campaign result crossed its cell/session/source contract")
    _hex64(value.request_sha256, "campaign request_sha256")
    _hex64(value.result_sha256, "campaign result_sha256")
    receipt = value.receipt
    if (
        type(receipt) is not CampaignReceipt
        or type(receipt.solve_index) is not int
        or type(receipt.base_clauses) is not int
        or type(receipt.base_bytes) is not int
        or type(receipt.model_recorded) is not bool
        or type(receipt.conflict_limit) is not int
        or (receipt.timeout_ms is not None and type(receipt.timeout_ms) is not int)
        or (receipt.core is not None and type(receipt.core) is not tuple)
        or receipt.session_id != session_id
        or receipt.solve_index != solve_index
        or receipt.base_clauses != binding.parent_identity.num_clauses
        or receipt.base_bytes != binding.parent_identity.journal_bytes
        or receipt.base_sha256 != binding.parent_identity.journal_sha256
        or receipt.assumptions != assumptions
        or receipt.status != value.status
        or receipt.model_recorded is not (value.status == "SAT")
        or receipt.result_sha256 != value.result_sha256
        or receipt.request_id != request_id
        or receipt.request_sha256 != value.request_sha256
        or receipt.conflict_limit != binding.campaign.conflict_limit
        or receipt.timeout_ms != binding.campaign.timeout_ms
        or (
            receipt.interrupted_by is not None
            and (type(receipt.interrupted_by) is not str or not receipt.interrupted_by)
        )
        or receipt.core != value.core
        or type(receipt.at) is not int
    ):
        _fail("campaign receipt crossed its result/session/parent contract")
    if value.status == "SAT":
        if (
            value.core is not None
            or type(value.assignment) is not tuple
            or len(value.assignment) != binding.campaign.variables
            or any(
                type(literal) is not int
                or literal == 0
                or abs(literal) > binding.campaign.variables
                for literal in value.assignment
            )
            or any(
                abs(literal) != index + 1
                for index, literal in enumerate(value.assignment)
            )
            or {abs(literal) for literal in value.assignment}
            != set(range(1, binding.campaign.variables + 1))
        ):
            _fail("SAT campaign result lacks a total assignment")
    elif value.status == "UNSAT":
        checked_core = _canonical_core(value.core, assumptions, container_type=tuple)
        if (
            type(value.assignment) is not tuple
            or value.assignment
            or checked_core != value.core
        ):
            _fail("UNSAT campaign result has invalid assignment/core")
    elif (
        type(value.assignment) is not tuple
        or value.assignment
        or value.core is not None
    ):
        _fail("UNKNOWN campaign result has terminal evidence")


def _canonical_core(
    value: object,
    assumptions: tuple[int, ...] | list[int],
    *,
    container_type: type[tuple[Any, ...] | list[Any]],
) -> tuple[int, ...]:
    if type(value) is not container_type:
        _fail(f"UNSAT core must be a builtin {container_type.__name__}")
    if type(assumptions) not in {tuple, list}:
        _fail("UNSAT assumptions have an invalid container")
    core = tuple(value)
    if (
        any(type(literal) is not int or literal == 0 for literal in core)
        or tuple(sorted(set(core), key=lambda literal: (abs(literal), literal))) != core
        or any(-literal in core for literal in core)
        or not set(core) <= set(assumptions)
    ):
        _fail("UNSAT core is not a canonical assumption subset")
    return core


def _recapture_parent(binding: AssumptionCnfBinding) -> None:
    try:
        observed = stream_parent_identity(binding.parent_path)
    except Exception as exc:
        raise AssumptionCnfEngineError("parent CNF recapture failed") from exc
    if observed != binding.parent_identity:
        _fail("parent CNF identity changed during the campaign")
    if binding.source_parent_path is not None:
        if binding.source_parent_identity is None:
            _fail("source-parent custody identity is missing")
        try:
            observed_source = stream_parent_identity(binding.source_parent_path)
        except Exception as exc:
            raise AssumptionCnfEngineError(
                "source-parent CNF recapture failed"
            ) from exc
        if observed_source != binding.source_parent_identity:
            _fail("source-parent CNF identity changed during the campaign")


def _close_with_reconciliation(session: Any) -> None:
    try:
        session.close()
    except (OSError, TimeoutError):
        session.close()


def _attempted_record(
    result: AssumptionCampaignResult,
    semantic: dict[str, Any] | None,
) -> dict[str, Any]:
    semantic_result_sha256 = (
        None
        if semantic is None
        else _semantic_envelope(semantic, result.cell_id, result.assumptions)
    )
    return {
        "state": ATTEMPTED,
        "cell_id": result.cell_id,
        "assumptions": list(result.assumptions),
        "request_id": result.request_id,
        "request_sha256": result.request_sha256,
        "status": result.status,
        "discovery_scope": result.discovery_scope,
        "result_sha256": result.result_sha256,
        "replayed": result.replayed,
        "source_replayed": result.source_replayed,
        "proof_verified": result.proof_verified,
        "closure_claim": result.closure_claim,
        "core": None if result.core is None else list(result.core),
        "receipt": _receipt(result.receipt),
        "semantic_replay": semantic,
        "semantic_result_sha256": semantic_result_sha256,
    }


def _semantic_envelope(
    semantic: object, cell_id: str, assumptions: tuple[int, ...] | list[int]
) -> str:
    if type(semantic) is not dict or set(semantic) != {
        "schema",
        "profile_sha256",
        "result",
        "serialization_sha256",
    }:
        _fail("SAT cell lacks exact semantic replay")
    if semantic.get("schema") != "p97-assumption-cnf-sat-result/v1":
        _fail("SAT semantic replay schema is crossed")
    _hex64(semantic.get("profile_sha256"), "semantic profile SHA-256")
    semantic_unsigned = {
        key: value for key, value in semantic.items() if key != "serialization_sha256"
    }
    _hex64(semantic.get("serialization_sha256"), "semantic replay digest")
    if semantic["serialization_sha256"] != _sha_value(semantic_unsigned):
        _fail("semantic replay serialization hash is invalid")
    result = semantic.get("result")
    result_schema = result.get("schema") if type(result) is dict else None
    if result_schema == _CHILD44_RESULT_SCHEMA:
        expected_keys = _CHILD44_SEMANTIC_RESULT_KEYS
    elif result_schema == _CHILD45_RESULT_SCHEMA:
        expected_keys = _CHILD45_SEMANTIC_RESULT_KEYS
    else:
        expected_keys = frozenset()
    if (
        type(result) is not dict
        or set(result) != expected_keys
        or result.get("cell_id") != cell_id
        or result.get("assumptions") != list(assumptions)
    ):
        _fail("semantic replay result is not cell-bound")
    if result_schema == _CHILD45_RESULT_SCHEMA:
        _hex64(result.get("root_sha256"), "semantic root_sha256")
        _hex64(result.get("suffix_sha256"), "semantic suffix_sha256")
        if result.get("suffix_sha256") != _CHILD45_SUFFIX_SHA256:
            _fail("Child45 semantic suffix is not the reviewed contract")
        for field in ("root_bytes", "root_variables", "root_clauses"):
            if type(result.get(field)) is not int or result[field] < 1:
                _fail(f"semantic {field} is invalid")
    for digest_field in ("assignment_sha256", "replay_sha256", "result_sha256"):
        _hex64(result.get(digest_field), f"semantic {digest_field}")
    return result["result_sha256"]


def _classification(counts: Mapping[str, int], terminal: bool) -> str:
    if terminal:
        return PARENT_TERMINAL_DISCOVERY_ONLY
    if counts["SAT"]:
        return SAT_SEMANTIC_REPLAYED
    if counts["UNKNOWN"]:
        return INCONCLUSIVE
    return CELLS_UNSAT_DISCOVERY_ONLY


def _open_directory_chain(path: Path, label: str) -> int:
    if (
        type(path) is not _NATIVE_PATH
        or not path.is_absolute()
        or Path(os.path.normpath(os.fspath(path))) != path
        or any(component in {".", ".."} for component in path.parts)
    ):
        _fail(f"{label} must be an absolute native Path")
    descriptors: list[int] = []
    try:
        parent = os.open(os.path.sep, _DIRECTORY_FLAGS)
        descriptors.append(parent)
        for component in path.parts[1:]:
            child = os.open(component, _DIRECTORY_FLAGS, dir_fd=parent)
            descriptors.append(child)
            if not stat.S_ISDIR(os.fstat(child).st_mode):
                raise OSError("not a directory")
            os.close(parent)
            descriptors.pop(-2)
            parent = child
        return parent
    except OSError as exc:
        for descriptor in descriptors:
            try:
                os.close(descriptor)
            except OSError:
                pass
        raise AssumptionCnfEngineError(f"cannot hold {label}: {exc}") from exc


def _visible_directory(path: Path, fd: int) -> None:
    held = os.fstat(fd)
    try:
        visible = os.stat(path, follow_symlinks=False)
    except OSError as exc:
        raise AssumptionCnfEngineError("output parent cannot be rebound") from exc
    if (
        not stat.S_ISDIR(held.st_mode)
        or not stat.S_ISDIR(visible.st_mode)
        or (held.st_dev, held.st_ino) != (visible.st_dev, visible.st_ino)
    ):
        _fail("output parent changed during publication")


def _strict_replay_lock_key(control: WaveControl, path: Path) -> str:
    return _sha_value(
        {
            "control_sha256": _sha(control.canonical_bytes),
            "output": str(path),
        }
    )


def _open_private_replay_lock_directory(
    parent_fd: int, parent_path: Path
) -> tuple[int, tuple[int, int]]:
    try:
        try:
            os.mkdir(
                _STRICT_REPLAY_LOCK_DIRECTORY,
                0o700,
                dir_fd=parent_fd,
            )
        except FileExistsError:
            pass
        lock_dir_fd = os.open(
            _STRICT_REPLAY_LOCK_DIRECTORY,
            _DIRECTORY_FLAGS,
            dir_fd=parent_fd,
        )
        held = os.fstat(lock_dir_fd)
        visible = os.stat(
            _STRICT_REPLAY_LOCK_DIRECTORY,
            dir_fd=parent_fd,
            follow_symlinks=False,
        )
        if (
            not stat.S_ISDIR(held.st_mode)
            or held.st_uid != os.getuid()
            or stat.S_IMODE(held.st_mode) != 0o700
            or (visible.st_dev, visible.st_ino) != (held.st_dev, held.st_ino)
            or not stat.S_ISDIR(visible.st_mode)
            or visible.st_uid != os.getuid()
            or stat.S_IMODE(visible.st_mode) != 0o700
        ):
            os.close(lock_dir_fd)
            _fail("strict replay lock directory is not private and trusted")
        return lock_dir_fd, (held.st_dev, held.st_ino)
    except OSError as exc:
        raise AssumptionCnfEngineError(
            "strict replay lock directory failed"
        ) from exc


def _check_private_replay_lock_directory(
    parent_fd: int,
    parent_path: Path,
    lock_dir_fd: int,
    identity: tuple[int, int],
) -> None:
    _visible_directory(parent_path, parent_fd)
    held = os.fstat(lock_dir_fd)
    visible = os.stat(
        _STRICT_REPLAY_LOCK_DIRECTORY,
        dir_fd=parent_fd,
        follow_symlinks=False,
    )
    if (
        not stat.S_ISDIR(held.st_mode)
        or held.st_uid != os.getuid()
        or stat.S_IMODE(held.st_mode) != 0o700
        or (held.st_dev, held.st_ino) != identity
        or not stat.S_ISDIR(visible.st_mode)
        or visible.st_uid != os.getuid()
        or stat.S_IMODE(visible.st_mode) != 0o700
        or (visible.st_dev, visible.st_ino) != identity
    ):
        _fail("strict replay lock directory changed during validation")


@contextmanager
def _strict_replay_lock(control: WaveControl, path: Path) -> Iterator[None]:
    """Fail fast when the same expensive strict replay is already active."""

    if (
        type(path) is not _NATIVE_PATH
        or not path.is_absolute()
        or Path(os.path.normpath(os.fspath(path))) != path
    ):
        _fail("strict replay output must be an absolute normalized native Path")
    _capture_output(path)
    parent_fd = _open_directory_chain(path.parent, "strict replay output parent")
    parent_metadata = os.fstat(parent_fd)
    if (
        parent_metadata.st_uid != os.getuid()
        or stat.S_IMODE(parent_metadata.st_mode) & 0o022
    ):
        os.close(parent_fd)
        _fail("strict replay output parent is not private to the current user")
    lock_dir_fd: int | None = None
    lock_fd: int | None = None
    acquired = False
    try:
        lock_dir_fd, lock_dir_identity = _open_private_replay_lock_directory(
            parent_fd, path.parent
        )
        lock_name = f"{_strict_replay_lock_key(control, path)}.lock"
        lock_fd = os.open(
            lock_name,
            os.O_RDWR
            | os.O_CREAT
            | os.O_NOFOLLOW
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=lock_dir_fd,
        )
        metadata = os.fstat(lock_fd)
        if (
            not stat.S_ISREG(metadata.st_mode)
            or metadata.st_nlink != 1
            or stat.S_IMODE(metadata.st_mode) != 0o600
        ):
            _fail("strict replay lockfile identity/mode is invalid")
        try:
            fcntl.flock(lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
            acquired = True
        except BlockingIOError as exc:
            os.lseek(lock_fd, 0, os.SEEK_SET)
            owner = os.read(lock_fd, 512).decode("utf-8", errors="replace").strip()
            raise AssumptionCnfEngineError(
                f"strict replay already active for {path} ({owner or 'owner unknown'})"
            ) from exc
        owner = canonical_json_bytes(
            {
                "control_sha256": _sha(control.canonical_bytes),
                "output": str(path),
                "pid": os.getpid(),
            }
        )
        os.ftruncate(lock_fd, 0)
        os.write(lock_fd, owner)
        os.fsync(lock_fd)
        _check_private_replay_lock_directory(
            parent_fd, path.parent, lock_dir_fd, lock_dir_identity
        )
        visible = os.stat(lock_name, dir_fd=lock_dir_fd, follow_symlinks=False)
        if (
            (visible.st_dev, visible.st_ino) != (metadata.st_dev, metadata.st_ino)
            or not stat.S_ISREG(visible.st_mode)
            or visible.st_nlink != 1
            or stat.S_IMODE(visible.st_mode) != 0o600
        ):
            _fail("strict replay lockfile was rebound")
        yield
        _check_private_replay_lock_directory(
            parent_fd, path.parent, lock_dir_fd, lock_dir_identity
        )
        visible = os.stat(lock_name, dir_fd=lock_dir_fd, follow_symlinks=False)
        if (
            (visible.st_dev, visible.st_ino) != (metadata.st_dev, metadata.st_ino)
            or not stat.S_ISREG(visible.st_mode)
            or visible.st_nlink != 1
            or stat.S_IMODE(visible.st_mode) != 0o600
        ):
            _fail("strict replay lockfile changed during validation")
    except OSError as exc:
        raise AssumptionCnfEngineError("strict replay lockfile failed") from exc
    finally:
        if lock_fd is not None:
            try:
                if acquired:
                    fcntl.flock(lock_fd, fcntl.LOCK_UN)
            finally:
                os.close(lock_fd)
        if lock_dir_fd is not None:
            os.close(lock_dir_fd)
        os.close(parent_fd)


def _capture_at(
    parent_fd: int,
    name: str,
    *,
    expected: tuple[int, int, int] | None = None,
) -> tuple[bytes, tuple[int, int, int]]:
    if type(name) is not str or not name or "/" in name or name in {".", ".."}:
        _fail("output name must be one literal component")
    fd: int | None = None
    try:
        fd = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=parent_fd)
        before = os.fstat(fd)
        identity = (before.st_dev, before.st_ino, before.st_mode)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or stat.S_IMODE(before.st_mode) != 0o600
            or (expected is not None and expected != identity)
        ):
            _fail("engine output identity/mode is invalid")
        chunks: list[bytes] = []
        size = 0
        while True:
            chunk = os.read(fd, min(1 << 20, _MAX_OUTPUT_BYTES - size + 1))
            if not chunk:
                break
            chunks.append(chunk)
            size += len(chunk)
            if size > _MAX_OUTPUT_BYTES:
                _fail("engine output exceeds its byte bound")
        after = os.fstat(fd)
        if (
            len(b"".join(chunks)) != before.st_size
            or not chunks
            or (
                before.st_dev,
                before.st_ino,
                before.st_mode,
                before.st_size,
                before.st_mtime_ns,
            )
            != (
                after.st_dev,
                after.st_ino,
                after.st_mode,
                after.st_size,
                after.st_mtime_ns,
            )
        ):
            _fail("engine output changed during capture")
        return b"".join(chunks), identity
    except AssumptionCnfEngineError:
        raise
    except OSError as exc:
        raise AssumptionCnfEngineError(f"cannot capture engine output: {exc}") from exc
    finally:
        if fd is not None:
            os.close(fd)


def _write_once(parent_fd: int, name: str, raw: bytes) -> tuple[int, int, int]:
    try:
        fd = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=parent_fd,
        )
    except FileExistsError as exc:
        raise AssumptionCnfEngineError("engine output already exists") from exc
    identity: tuple[int, int, int] | None = None
    try:
        os.fchmod(fd, 0o600)
        info = os.fstat(fd)
        identity = (info.st_dev, info.st_ino, info.st_mode)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            _fail("new engine output is not a unique regular file")
        view = memoryview(raw)
        while view:
            view = view[os.write(fd, view) :]
        os.fsync(fd)
    except BaseException:
        if identity is not None:
            try:
                current = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
                if (current.st_dev, current.st_ino, current.st_mode) == identity:
                    os.unlink(name, dir_fd=parent_fd)
            except OSError:
                pass
        raise
    finally:
        os.close(fd)
    os.fsync(parent_fd)
    assert identity is not None
    return identity


def _strict_json(raw: bytes) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(raw, object_pairs_hook=unique)
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise AssumptionCnfEngineError("engine output is not strict JSON") from exc
    if type(value) is not dict:
        _fail("engine output root must be an object")
    return value


class AssumptionCnfWaveEngine:
    """Execute one reviewed campaign in one fresh or authenticated live session."""

    def __init__(
        self,
        *,
        control: WaveControl,
        package_root: Path,
        output_path: Path,
        base_url: str,
        solver_signature: str,
        transport: Any = None,
        export_digest: Any = None,
        job_blob_digest: Any = None,
        session_factory: SessionFactory | None = None,
        existing_session_id: str | None = None,
        # Compatibility bridge for the shared registry.  New callers use
        # ``existing_session_id``; the registry still names this recovery seam.
        resume_session: str | None = None,
        execution_registration: Mapping[str, Any],
    ) -> None:
        if type(control) is not WaveControl:
            _fail("control must be an exact WaveControl")
        for value, label in (
            (package_root, "package_root"),
            (output_path, "output_path"),
        ):
            if (
                type(value) is not _NATIVE_PATH
                or not value.is_absolute()
                or Path(os.path.normpath(os.fspath(value))) != value
                or any(component in {".", ".."} for component in value.parts)
            ):
                _fail(f"{label} must be an absolute native Path")
        if (
            not output_path.name
            or output_path.name in {".", ".."}
            or output_path.parent == output_path
        ):
            _fail("output_path must name a file")
        if type(base_url) is not str or not base_url.strip():
            _fail("base_url must be a nonempty builtin string")
        if type(solver_signature) is not str or not solver_signature:
            _fail("solver_signature must be a nonempty builtin string")
        if existing_session_id is not None and resume_session is not None:
            _fail("existing_session_id crossed the registry recovery seam")
        adopted_session_id = (
            existing_session_id if existing_session_id is not None else resume_session
        )
        if adopted_session_id is not None:
            _canonical_uuid(adopted_session_id, "existing_session_id")
        self.control = control
        self.package_root = package_root
        self.output_path = output_path
        self.base_url = base_url
        self.solver_signature = solver_signature
        self.transport = transport
        self.export_digest = export_digest
        self.job_blob_digest = job_blob_digest
        self.session_factory = session_factory or _default_session_factory
        self.existing_session_id = adopted_session_id
        self.execution_registration = _registration(execution_registration)

    def run(self) -> AssumptionCnfEngineResult:
        adopted_session = self.existing_session_id is not None
        if self.existing_session_id is not None:
            try:
                os.lstat(self.output_path)
            except FileNotFoundError:
                pass
            except OSError as exc:
                raise AssumptionCnfEngineError(
                    "cannot inspect resume output path"
                ) from exc
            else:
                _fail("existing-session adoption requires an absent output")
        try:
            binding = bind_assumption_cnf(self.control, self.package_root)
        except Exception as exc:
            raise AssumptionCnfEngineError("assumption-CNF binding failed") from exc
        if type(binding) is not AssumptionCnfBinding:
            _fail("binder returned the wrong binding type")
        try:
            campaign_metadata = assumption_campaign_metadata(binding.campaign)
        except Exception as exc:
            raise AssumptionCnfEngineError(
                "assumption campaign metadata failed closed"
            ) from exc
        if len(binding.campaign.cells) != 13:
            _fail("assumption campaign is not the closed 13-cell partition")
        spec = _make_spec(binding, self.solver_signature)
        try:
            session = self.session_factory(
                base_url=self.base_url,
                spec=spec,
                transport=self.transport,
                export_digest=self.export_digest,
                job_blob_digest=self.job_blob_digest,
                existing_session_id=self.existing_session_id,
                http_timeout_seconds=self.control.policy.solver_timeout_s + 30,
            )
        except Exception as exc:
            raise AssumptionCnfEngineError("campaign session creation failed") from exc
        try:
            session_id = _canonical_uuid(
                getattr(session, "session_id", None), "session_id"
            )
            if (
                self.existing_session_id is not None
                and session_id != self.existing_session_id
            ):
                _fail("campaign session identity crossed existing_session_id")
        except Exception as exc:
            if (
                not adopted_session
                and getattr(session, "pending_request_id", None) is None
            ):
                try:
                    _close_with_reconciliation(session)
                except Exception as close_exc:
                    raise AssumptionCnfEngineError(
                        "campaign close failed"
                    ) from close_exc
            raise AssumptionCnfEngineError(
                "campaign session identity is invalid"
            ) from exc
        records: list[dict[str, Any]] = []
        counts = {"SAT": 0, "UNSAT": 0, "UNKNOWN": 0, NOT_RUN: 0}
        terminal = False
        recovery_committed = not adopted_session
        primary: Exception | None = None
        try:
            cells = binding.campaign.cells
            start_index = 0
            if self.existing_session_id is not None:
                if not hasattr(session, "recover_first_result"):
                    _fail("existing session lacks first-result recovery")
                first = cells[0]
                request_id = _request_id(binding, first.id, first.assumptions)
                result = session.recover_first_result(
                    AssumptionCell(first.id, first.assumptions),
                    request_id=request_id,
                )
                _check_result(
                    result,
                    binding=binding,
                    session_id=session_id,
                    cell_id=first.id,
                    assumptions=first.assumptions,
                    request_id=request_id,
                    solve_index=1,
                )
                if result.status != "SAT" or result.replayed is not True:
                    _fail(
                        "existing session first result is not the exact replayed SAT prefix"
                    )
                semantic = None
                semantic = replay_sat(
                    binding.campaign,
                    parent_cnf_path=binding.parent_path,
                    source_parent_cnf_path=binding.source_parent_path,
                    assignment=result.assignment,
                    cell=first,
                )
                records.append(_attempted_record(result, semantic))
                counts[result.status] += 1
                terminal = result.status == "UNSAT" and result.core == ()
                recovery_committed = True
                start_index = 1
            for index, cell in enumerate(cells[start_index:], start=start_index + 1):
                if terminal:
                    records.append(
                        {
                            "state": NOT_RUN,
                            "cell_id": cell.id,
                            "assumptions": list(cell.assumptions),
                            "reason": "parent-terminal-discovery-only",
                        }
                    )
                    counts[NOT_RUN] += 1
                    continue
                request_id = _request_id(binding, cell.id, cell.assumptions)
                try:
                    result = session.solve(
                        AssumptionCell(cell.id, cell.assumptions),
                        request_id=request_id,
                    )
                except (OSError, TimeoutError):
                    if getattr(session, "pending_request_id", None) != request_id:
                        raise
                    result = session.retry_pending()
                _check_result(
                    result,
                    binding=binding,
                    session_id=session_id,
                    cell_id=cell.id,
                    assumptions=cell.assumptions,
                    request_id=request_id,
                    solve_index=index,
                )
                semantic = None
                if result.status == "SAT":
                    semantic = replay_sat(
                        binding.campaign,
                        parent_cnf_path=binding.parent_path,
                        source_parent_cnf_path=binding.source_parent_path,
                        assignment=result.assignment,
                        cell=cell,
                    )
                records.append(_attempted_record(result, semantic))
                counts[result.status] += 1
                terminal = result.status == "UNSAT" and result.core == ()
        except Exception as exc:  # noqa: BLE001 - injected replay/session must fail closed
            primary = exc
        pending = getattr(session, "pending_request_id", None)
        if primary is None and pending is None:
            try:
                _recapture_parent(binding)
                # Recheck immediately before releasing the solver session.  A
                # crossed parent must fail while an adopted session is still
                # live; after close there is deliberately no fallible custody
                # step before create-once publication.
                _recapture_parent(binding)
            except Exception as exc:  # noqa: BLE001 - custody must fail closed
                primary = exc
        if (
            pending is None
            and recovery_committed
            and (not adopted_session or primary is None)
        ):
            try:
                _close_with_reconciliation(session)
            except Exception as exc:
                raise AssumptionCnfEngineError("campaign close failed") from exc
        if primary is not None:
            raise AssumptionCnfEngineError(
                f"assumption campaign aborted: {primary}"
            ) from primary
        if pending is not None:
            _fail("campaign ended with an unresolved request")

        classification = _classification(counts, terminal)
        unsigned = {
            "schema": ENGINE_SCHEMA,
            "wave_kind": ASSUMPTION_CNF,
            "adapter": {
                "id": ASSUMPTION_CNF_PIQD_ADAPTER,
                "schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
            },
            "control": {"sha256": _sha(binding.control.canonical_bytes)},
            "wave_manifest": {
                "sha256": wave_manifest_sha256(binding.wave_manifest),
                "manifest": binding.wave_manifest,
            },
            "campaign": campaign_metadata,
            "parent": _identity(binding.parent_identity, binding.parent_path),
            "package": {
                "producer_manifest_sha256": _sha(binding.producer_manifest),
                "variable_map_sha256": _sha(binding.variable_map),
                "campaign_sha256": _sha(binding.campaign_bytes),
            },
            "execution_registration": self.execution_registration,
            "runtime_solver": {
                "signature": self.solver_signature,
                "campaign_descriptor_root": spec.descriptor_root,
            },
            "session_id": session_id,
            "cells": records,
            "summary": {
                "total_cells": len(binding.campaign.cells),
                "attempted": len(binding.campaign.cells) - counts[NOT_RUN],
                "sat": counts["SAT"],
                "unsat": counts["UNSAT"],
                "unknown": counts["UNKNOWN"],
                "not_run": counts[NOT_RUN],
                "classification": classification,
            },
            "close_observed": True,
            "claims": {claim: False for claim in _CLAIMS},
        }
        envelope = {**unsigned, "envelope_sha256": _sha_value(unsigned)}
        raw = canonical_json_bytes(envelope) + b"\n"
        parent_fd = _open_directory_chain(self.output_path.parent, "output parent")
        try:
            _visible_directory(self.output_path.parent, parent_fd)
            identity = _write_once(parent_fd, self.output_path.name, raw)
            _visible_directory(self.output_path.parent, parent_fd)
            accepted = _inspect(
                self.output_path,
                held_parent_fd=parent_fd,
                held_name=self.output_path.name,
                expected_identity=identity,
            )
        finally:
            os.close(parent_fd)
        return AssumptionCnfEngineResult(classification, self.output_path, accepted)


def _capture_output(path: Path) -> bytes:
    if (
        type(path) is not _NATIVE_PATH
        or not path.is_absolute()
        or Path(os.path.normpath(os.fspath(path))) != path
        or any(component in {".", ".."} for component in path.parts)
    ):
        _fail("engine output path must be an absolute native Path")
    try:
        captured = capture_exact_regular_file(
            path,
            max_bytes=_MAX_OUTPUT_BYTES,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=True,
            label="assumption engine output",
        )
    except Exception as exc:
        raise AssumptionCnfEngineError(
            "cannot capture assumption engine output"
        ) from exc
    try:
        visible = os.stat(path, follow_symlinks=False)
    except OSError as exc:
        raise AssumptionCnfEngineError("cannot recapture engine output mode") from exc
    if (
        (visible.st_dev, visible.st_ino) != (captured.device, captured.inode)
        or not stat.S_ISREG(visible.st_mode)
        or stat.S_IMODE(visible.st_mode) != 0o600
    ):
        _fail("engine output mode is not 0600")
    return captured.data


def _inspect(
    path: Path,
    *,
    held_parent_fd: int | None = None,
    held_name: str | None = None,
    expected_identity: tuple[int, int, int] | None = None,
) -> dict[str, Any]:
    raw = (
        _capture_output(path)
        if held_parent_fd is None
        else _capture_at(
            held_parent_fd,
            held_name or "",
            expected=expected_identity,
        )[0]
    )
    envelope = _strict_json(raw)
    if raw != canonical_json_bytes(envelope) + b"\n":
        _fail("engine output is not canonical JSON bytes")
    if set(envelope) != _ENVELOPE_KEYS or envelope.get("schema") != ENGINE_SCHEMA:
        _fail("engine envelope has an inexact schema")
    unsigned = {
        key: value for key, value in envelope.items() if key != "envelope_sha256"
    }
    if envelope.get("envelope_sha256") != _sha_value(unsigned):
        _fail("engine envelope self-hash mismatch")
    if envelope.get("wave_kind") != ASSUMPTION_CNF or envelope.get("adapter") != {
        "id": ASSUMPTION_CNF_PIQD_ADAPTER,
        "schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    }:
        _fail("engine wave/adapter identity is crossed")
    if envelope.get("execution_registration") != _expected_registration():
        _fail("engine execution registration is crossed")
    runtime_solver = envelope.get("runtime_solver")
    if (
        type(runtime_solver) is not dict
        or set(runtime_solver) != _RUNTIME_SOLVER_KEYS
        or type(runtime_solver.get("signature")) is not str
        or not runtime_solver["signature"]
    ):
        _fail("runtime solver binding is invalid")
    _hex64(
        runtime_solver.get("campaign_descriptor_root"),
        "runtime campaign descriptor root",
    )
    if envelope.get("claims") != {claim: False for claim in _CLAIMS}:
        _fail("engine output carries an unsafe claim")
    if envelope.get("close_observed") is not True:
        _fail("engine output was not published after observed close")
    _canonical_uuid(envelope.get("session_id"), "session_id")
    cells = envelope.get("cells")
    if type(cells) is not list or len(cells) != 13:
        _fail("engine cell inventory is not the closed 13-cell campaign")
    seen_not_run = False
    terminal_seen = False
    counts = {"SAT": 0, "UNSAT": 0, "UNKNOWN": 0, NOT_RUN: 0}
    for index, record in enumerate(cells):
        if type(record) is not dict:
            _fail("engine cell record must be an object")
        if record.get("state") == NOT_RUN:
            if (
                set(record) != _NOT_RUN_KEYS
                or record.get("reason") != "parent-terminal-discovery-only"
            ):
                _fail("NOT_RUN cell record is malformed")
            if (
                not terminal_seen
                or type(record.get("cell_id")) is not str
                or not record["cell_id"]
                or type(record.get("assumptions")) is not list
                or not record["assumptions"]
                or any(
                    type(literal) is not int or literal == 0
                    for literal in record["assumptions"]
                )
            ):
                _fail("NOT_RUN cell identity/assumptions are invalid")
            seen_not_run = True
            counts[NOT_RUN] += 1
            continue
        if (
            seen_not_run
            or set(record) != _ATTEMPTED_KEYS
            or record.get("state") != ATTEMPTED
        ):
            _fail("attempted cell order/schema is invalid")
        status = record.get("status")
        if status not in {"SAT", "UNSAT", "UNKNOWN"}:
            _fail("cell status is invalid")
        cell_id = record.get("cell_id")
        assumptions = record.get("assumptions")
        if (
            type(cell_id) is not str
            or not cell_id
            or type(assumptions) is not list
            or not assumptions
            or any(type(literal) is not int or literal == 0 for literal in assumptions)
            or assumptions
            != sorted(set(assumptions), key=lambda literal: (abs(literal), literal))
            or any(-literal in assumptions for literal in assumptions)
        ):
            _fail("cell identity/assumptions are not canonical")
        counts[status] += 1
        _canonical_uuid(record.get("request_id"), "cell request_id")
        _hex64(record.get("request_sha256"), "cell request_sha256")
        _hex64(record.get("result_sha256"), "cell result_sha256")
        receipt = record.get("receipt")
        if type(receipt) is not dict or set(receipt) != _RECEIPT_KEYS:
            _fail("cell receipt schema is invalid")
        for field in (
            "solve_index",
            "base_clauses",
            "base_bytes",
            "conflict_limit",
            "at",
        ):
            if type(receipt.get(field)) is not int or receipt[field] < 0:
                _fail(f"cell receipt {field} is invalid")
        if (
            receipt["solve_index"] < 1
            or receipt["base_clauses"] < 1
            or receipt["base_bytes"] < 1
            or receipt["conflict_limit"] < 1
        ):
            _fail("cell receipt positive counters are invalid")
        _hex64(receipt.get("base_sha256"), "receipt base_sha256")
        timeout = receipt.get("timeout_ms")
        if timeout is not None and (type(timeout) is not int or timeout < 0):
            _fail("cell receipt timeout is invalid")
        interrupted = receipt.get("interrupted_by")
        if interrupted is not None and (
            type(interrupted) is not str or not interrupted
        ):
            _fail("cell receipt interrupted_by is invalid")
        if (
            receipt.get("session_id") != envelope["session_id"]
            or receipt.get("solve_index") != index + 1
            or receipt.get("request_id") != record["request_id"]
            or receipt.get("request_sha256") != record["request_sha256"]
            or receipt.get("result_sha256") != record["result_sha256"]
            or receipt.get("status") != status
            or receipt.get("assumptions") != record.get("assumptions")
            or receipt.get("model_recorded") is not (status == "SAT")
            or receipt.get("core") != record.get("core")
            or (status != "UNKNOWN" and receipt.get("interrupted_by") is not None)
            or record.get("proof_verified") is not False
            or record.get("closure_claim") is not False
            or record.get("source_replayed") is not True
            or type(record.get("replayed")) is not bool
        ):
            _fail("cell result/receipt binding is crossed")
        semantic = record.get("semantic_replay")
        if status == "SAT":
            semantic_result_sha256 = _semantic_envelope(
                semantic, record["cell_id"], record["assumptions"]
            )
            if record.get("semantic_result_sha256") != semantic_result_sha256:
                _fail("semantic replay result is not cell/result-bound")
        elif semantic is not None:
            _fail("non-SAT cell carries semantic replay")
        elif record.get("semantic_result_sha256") is not None:
            _fail("non-SAT cell carries a semantic result digest")
        core = record.get("core")
        if status == "UNSAT":
            _canonical_core(core, record["assumptions"], container_type=list)
            if (
                not core
                and index + 1 < len(cells)
                and not all(item.get("state") == NOT_RUN for item in cells[index + 1 :])
            ):
                _fail("parent-terminal UNSAT did not stop remaining cells")
            expected_scope = (
                "terminal-discovery-only" if not core else "cell-discovery-only"
            )
            if record.get("discovery_scope") != expected_scope:
                _fail("UNSAT discovery scope is crossed")
            terminal_seen = terminal_seen or not core
        elif core is not None:
            _fail("non-UNSAT cell carries a core")
        elif record.get("discovery_scope") != (
            "sat-witness-replayed" if status == "SAT" else "inconclusive"
        ):
            _fail("SAT/UNKNOWN discovery scope is crossed")
    summary = envelope.get("summary")
    expected_summary = {
        "total_cells": 13,
        "attempted": 13 - counts[NOT_RUN],
        "sat": counts["SAT"],
        "unsat": counts["UNSAT"],
        "unknown": counts["UNKNOWN"],
        "not_run": counts[NOT_RUN],
        "classification": _classification(
            counts,
            any(
                item.get("status") == "UNSAT" and item.get("core") == []
                for item in cells
            ),
        ),
    }
    if summary != expected_summary:
        _fail("engine summary is crossed")
    return envelope


def inspect_assumption_cnf_engine_output(path: Path) -> dict[str, Any]:
    """Perform structural-only, zero-network inspection of one output."""

    return _inspect(path)


def validate_assumption_cnf_engine_output(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Rebind an output to the current package without rerunning semantic replay."""

    envelope = _inspect(path)
    try:
        binding = bind_assumption_cnf(control, package_root)
    except Exception as exc:
        raise AssumptionCnfEngineError("assumption-CNF rebind failed") from exc
    if type(binding) is not AssumptionCnfBinding:
        _fail("binder returned the wrong binding type")
    expected = {
        "control": {"sha256": _sha(binding.control.canonical_bytes)},
        "wave_manifest": {
            "sha256": wave_manifest_sha256(binding.wave_manifest),
            "manifest": binding.wave_manifest,
        },
        "campaign": assumption_campaign_metadata(binding.campaign),
        "parent": _identity(binding.parent_identity, binding.parent_path),
        "package": {
            "producer_manifest_sha256": _sha(binding.producer_manifest),
            "variable_map_sha256": _sha(binding.variable_map),
            "campaign_sha256": _sha(binding.campaign_bytes),
        },
    }
    for key, value in expected.items():
        if envelope.get(key) != value:
            _fail(f"engine output crossed current {key}")
    runtime_solver = envelope["runtime_solver"]
    if (
        _make_spec(binding, runtime_solver["signature"]).descriptor_root
        != runtime_solver["campaign_descriptor_root"]
    ):
        _fail("runtime solver descriptor crossed current campaign")
    profile: AssumptionCampaignProfile = binding.campaign
    for record, cell in zip(envelope["cells"], profile.cells, strict=True):
        if record.get("cell_id") != cell.id or record.get("assumptions") != list(
            cell.assumptions
        ):
            _fail("engine cell crossed current campaign order")
        if record.get("state") == ATTEMPTED:
            if record["request_id"] != _request_id(binding, cell.id, cell.assumptions):
                _fail("engine request ID crossed current control/campaign/cell")
            receipt = record["receipt"]
            if (
                receipt["base_clauses"] != binding.parent_identity.num_clauses
                or receipt["base_bytes"] != binding.parent_identity.journal_bytes
                or receipt["base_sha256"] != binding.parent_identity.journal_sha256
                or receipt["conflict_limit"] != profile.conflict_limit
                or receipt["timeout_ms"] != profile.timeout_ms
            ):
                _fail("engine receipt crossed current parent/profile")
            semantic = record["semantic_replay"]
            if semantic is not None:
                if semantic.get("profile_sha256") != profile.raw_sha256:
                    _fail("semantic replay crossed current campaign")
                unsigned_semantic = {
                    key: value
                    for key, value in semantic.items()
                    if key != "serialization_sha256"
                }
                if semantic["serialization_sha256"] != _sha_value(unsigned_semantic):
                    _fail("semantic replay serialization hash is invalid")
                result = semantic.get("result")
                result_schema = result.get("schema") if type(result) is dict else None
                expected_result_keys = (
                    _CHILD45_SEMANTIC_RESULT_KEYS
                    if result_schema == _CHILD45_RESULT_SCHEMA
                    else _CHILD44_SEMANTIC_RESULT_KEYS
                )
                if (
                    type(result) is not dict
                    or set(result) != expected_result_keys
                    or result_schema
                    not in {
                        _CHILD44_RESULT_SCHEMA,
                        _CHILD45_RESULT_SCHEMA,
                    }
                    or result.get("cell_id") != cell.id
                    or result.get("assumptions") != list(cell.assumptions)
                ):
                    _fail("semantic replay result crossed current cell/schema")
                if profile.schema == CHILD45_SCHEMA:
                    if (
                        result_schema != _CHILD45_RESULT_SCHEMA
                        or result.get("parent_sha256") != profile.source_parent_sha256
                        or result.get("parent_bytes")
                        != profile.source_parent_byte_count
                        or result.get("parent_variables")
                        != profile.source_parent_variables
                        or result.get("parent_clauses") != profile.source_parent_clauses
                        or result.get("root_sha256") != profile.parent_sha256
                        or result.get("root_bytes") != profile.parent_byte_count
                        or result.get("root_variables") != profile.variables
                        or result.get("root_clauses") != profile.clauses
                        or result.get("suffix_sha256") != _CHILD45_SUFFIX_SHA256
                    ):
                        _fail(
                            "Child45 semantic replay crossed root/source-parent identity"
                        )
                elif (
                    result_schema != _CHILD44_RESULT_SCHEMA
                    or result.get("parent_sha256") != profile.parent_sha256
                    or result.get("parent_bytes") != profile.parent_byte_count
                    or result.get("parent_variables") != profile.variables
                    or result.get("parent_clauses") != profile.clauses
                ):
                    _fail("semantic replay result crossed current cell/parent")
                for digest_field in (
                    "assignment_sha256",
                    "replay_sha256",
                    "result_sha256",
                ):
                    _hex64(result.get(digest_field), f"semantic {digest_field}")
                if (
                    type(result.get("source_model")) is not dict
                    or type(result.get("source_predicates")) is not list
                    or not result["source_predicates"]
                    or any(
                        type(predicate) is not str or not predicate
                        for predicate in result["source_predicates"]
                    )
                    or type(result.get("kalmanson")) is not dict
                    or result["kalmanson"].get("status")
                    not in {"LINEARLY_INFEASIBLE", "KALMANSON_FEASIBLE"}
                    or result["kalmanson"].get("refinement_disposition")
                    not in {
                        "EXACT_WEIGHTED_CERTIFICATE_READY",
                        "NO_KALMANSON_CLAUSE_ROUTE_EDM_PTOLEMY",
                    }
                ):
                    _fail("semantic replay classification is invalid")
    return envelope


def _validate_assumption_cnf_engine_output_strict_unlocked(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Validate SAT witnesses by reconstructing and replaying their exact model.

    The ordinary validator above is intentionally cheap and structural.  This
    entry point is the post-terminal, solver-free semantic gate: it derives the
    canonical 308-literal assignment from each serialized source model, binds
    both PIQD and replay digests, then reruns the registered Child44/45 replay.
    """

    envelope = validate_assumption_cnf_engine_output(control, package_root, path)
    try:
        binding = bind_assumption_cnf(control, package_root)
    except Exception as exc:
        raise AssumptionCnfEngineError("strict assumption-CNF rebind failed") from exc
    profile: AssumptionCampaignProfile = binding.campaign
    _recapture_parent(binding)
    for record, cell in zip(envelope["cells"], profile.cells, strict=True):
        if record.get("state") != ATTEMPTED or record.get("status") != "SAT":
            continue
        try:
            semantic = record["semantic_replay"]
            result = semantic["result"]
            assignment = canonical_assignment_from_source_model(result["source_model"])
            if result["assignment_sha256"] != canonical_assignment_sha256(assignment):
                _fail("strict semantic assignment hash is not source-model-bound")
            receipt = record["receipt"]
            expected_result_sha256 = _result_digest("SAT", None, None, assignment)
            if (
                record["result_sha256"] != expected_result_sha256
                or receipt["result_sha256"] != expected_result_sha256
            ):
                _fail("strict PIQD result digest is not source-model-bound")
            expected_request_sha256 = _solve_request_digest(
                base_clauses=receipt["base_clauses"],
                base_bytes=receipt["base_bytes"],
                base_sha256=receipt["base_sha256"],
                assumptions=cell.assumptions,
                conflict_limit=receipt["conflict_limit"],
                timeout_ms=receipt["timeout_ms"],
            )
            if (
                record["request_sha256"] != expected_request_sha256
                or receipt["request_sha256"] != expected_request_sha256
            ):
                _fail("strict request digest is not source-bound")
            regenerated = replay_sat(
                profile,
                parent_cnf_path=binding.parent_path,
                source_parent_cnf_path=binding.source_parent_path,
                assignment=assignment,
                cell=cell,
            )
            if regenerated != semantic:
                _fail("strict semantic replay differs from the authenticated result")
        except AssumptionCnfEngineError:
            raise
        except Exception as exc:
            raise AssumptionCnfEngineError(
                f"strict semantic replay failed for {cell.id}"
            ) from exc
    _recapture_parent(binding)
    return envelope


def validate_assumption_cnf_engine_output_strict(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Run the strict semantic replay under an output-scoped operation lock."""

    with _strict_replay_lock(control, path):
        return _validate_assumption_cnf_engine_output_strict_unlocked(
            control, package_root, path
        )


__all__ = [
    "ENGINE_SCHEMA",
    "AssumptionCnfEngineError",
    "AssumptionCnfEngineResult",
    "AssumptionCnfWaveEngine",
    "inspect_assumption_cnf_engine_output",
    "validate_assumption_cnf_engine_output",
    "validate_assumption_cnf_engine_output_strict",
]
