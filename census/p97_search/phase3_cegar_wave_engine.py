"""The fixed STATIC_CNF execution and publication boundary.

This module is intentionally a small wrapper around the already-authenticated
static PIQD runner.  It has no adapter/plugin dispatch and never treats an
UNSAT observation as a proof.  The validator is transport-free and reopens
every published file through no-follow descriptors before accepting it.
"""

from __future__ import annotations

import json
import os
import stat
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.cegar_wave_semantic_profiles import (
    SemanticProfileError,
    validate_profile_metadata,
)
from census.p97_search.phase3_cegar_runtime import capture_exact_regular_file
from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    LOCAL_CERTIFICATE,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import (
    EXECUTION_REGISTRY_SCHEMA,
    MAX_STATIC_CNF_BYTES,
    STATIC_CNF,
    STATIC_CNF_EXECUTION_CAPABILITIES,
    STATIC_CNF_EXECUTION_MODE,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
    STATIC_CNF_SEMANTIC_VALIDATOR_V1,
    STATIC_CNF_SEMANTIC_VALIDATOR_V2,
    STATIC_CNF_V2_REGISTRY_REVISION,
    StaticCnfBinding,
    WaveControl,
    bind_static_cnf,
)
from census.p97_search.phase3_piqd_driver import SEAL_SCHEMA
from census.p97_search.phase3_piqd_static_solver_runner import (
    CUSTODY_SEAL_SCHEMA,
    RECEIPT_SCHEMA,
    StaticSolverResult,
    make_static_piqd_solver_runner,
)

_NATIVE_PATH_TYPE = type(Path())
_DIRECTORY_FLAGS = (
    os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0) | os.O_NOFOLLOW
)

ENGINE_SCHEMA_V1 = "p97-cegar-static-cnf-engine/v1"
ENGINE_SCHEMA_V2 = "p97-cegar-static-cnf-engine/v2"
ENGINE_SCHEMA = ENGINE_SCHEMA_V1
STATIC_CNF_PIQD_ADAPTER_SCHEMA = STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1
STATIC_CNF_SEMANTIC_VALIDATOR = STATIC_CNF_SEMANTIC_VALIDATOR_V1
SAT_OBSERVED = "SAT_OBSERVED"
UNSAT_OBSERVED_DISCOVERY_ONLY = "UNSAT_OBSERVED_DISCOVERY_ONLY"
INDETERMINATE = "INDETERMINATE"

_ATTEMPT_ENTRIES = frozenset(
    {
        "attempt.jsonl",
        "attempt.jsonl.lock",
        "attempt.jsonl.artifacts",
        "attempt.jsonl.seal.json",
        "solver-receipt.json",
        "custody-seal.json",
    }
)
_RECEIPT_KEYS = frozenset(
    {
        "schema",
        "attempt",
        "attempt_directory",
        "journal",
        "receipt_path",
        "custody_seal_path",
        "job_id",
        "job_identity",
        "prepare_freshness_claimed",
        "outcome",
        "adapter_verdict",
        "adapter_returncode",
        "cnf_sha256",
        "num_variables",
        "num_clauses",
        "source_manifest_sha256",
        "producer_manifest_sha256",
        "terminal_record_sha256",
        "journal_record_count",
        "seal_sha256",
        "status_classification",
        "status_detail",
        "terminal_status",
        "terminal_status_canonical_sha256",
        "terminal_status_raw_sha256",
        "terminal_status_raw_size",
        "terminal_status_raw_artifact_sha256",
        "terminal_status_identity_scope",
        "terminal_status_exposed_identity_fields",
        "model_response_sha256",
        "endpoint_trace",
        "failure_detail",
        "custody_retry_policy",
        "legacy_drat_proof_path_written",
        "proof_endpoint_called",
        "certificate_blocker",
        "claims",
        "receipt_sha256",
    }
)
_CLAIMS = frozenset(
    {
        "source_entitlement",
        "theorem_coverage",
        "universal_lift",
        "lean_closure",
        "one_process",
        "one_core",
    }
)
_EXECUTION_REGISTRY_KEYS = frozenset({"schema", "registry_revision", "registration"})
_ENGINE_ENVELOPE_KEYS_V1 = frozenset(
    {
        "schema",
        "wave_kind",
        "adapter",
        "control",
        "wave_manifest",
        "package",
        "resource_policy",
        "result",
        "receipt",
        "custody_seal",
        "driver_seal",
        "journal",
        "attempt_entries",
        "attempt_inventory",
        "claims",
        "envelope_sha256",
    }
)
_ENGINE_ENVELOPE_KEYS_V2 = _ENGINE_ENVELOPE_KEYS_V1 | {
    "execution_manifest",
    "semantic_profile",
    "semantic_artifacts",
    "execution_registry",
}
_EXECUTION_REGISTRATION_KEYS = frozenset(
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
_SEAL_KEYS = frozenset(
    {
        "schema",
        "wave_manifest_sha256",
        "record_count",
        "terminal_attempt_sha256",
        "journal_sha256",
        "seal_sha256",
    }
)
_CUSTODY_KEYS = frozenset(
    {
        "schema",
        "attempt_directory_device",
        "attempt_directory_inode",
        "receipt_sha256",
        "receipt_file_sha256",
        "receipt_file_size",
        "receipt_device",
        "receipt_inode",
        "inventory",
        "retry_policy",
        "custody_seal_sha256",
    }
)


class StaticCnfEngineError(RuntimeError):
    """The fixed boundary could not publish a self-consistent result."""


def _validate_execution_registration(
    value: Any,
    *,
    adapter_schema: str,
    engine_schema: str,
    semantic_validator: str,
    required: bool,
) -> dict[str, Any] | None:
    if value is None:
        if required:
            raise StaticCnfEngineError("execution registry is required")
        return None
    if type(value) is not dict or set(value) != _EXECUTION_REGISTRY_KEYS:
        raise StaticCnfEngineError("execution registry has an inexact schema")
    schema = value.get("schema")
    revision = value.get("registry_revision")
    registration = value.get("registration")
    if (
        type(schema) is not str
        or not schema
        or type(revision) is not str
        or not revision
        or type(registration) is not dict
        or set(registration) != _EXECUTION_REGISTRATION_KEYS
    ):
        raise StaticCnfEngineError("execution registry has invalid fields")
    string_fields = (
        "wave_kind",
        "adapter_id",
        "adapter_schema",
        "registry_revision",
        "engine_schema",
        "semantic_validator",
        "execution_mode",
    )
    if any(
        type(registration.get(field)) is not str or not registration[field]
        for field in string_fields
    ):
        raise StaticCnfEngineError("execution registration strings are invalid")
    capabilities = registration.get("capabilities")
    if (
        type(capabilities) is not list
        or not capabilities
        or any(type(item) is not str or not item for item in capabilities)
        or capabilities != sorted(set(capabilities))
    ):
        raise StaticCnfEngineError("execution capabilities are invalid")
    boolean_fields = (
        "permits_campaign",
        "permits_export",
        "permits_diagnostic_mining",
        "permits_terminal_proof",
    )
    if any(type(registration.get(field)) is not bool for field in boolean_fields):
        raise StaticCnfEngineError("execution capability flags are invalid")
    if any(registration[field] for field in boolean_fields):
        raise StaticCnfEngineError("execution registration permits unsafe behavior")
    if (
        registration["registry_revision"] != revision
        or registration["wave_kind"] != STATIC_CNF
        or registration["adapter_id"] != STATIC_CNF_PIQD_ADAPTER
        or registration["adapter_schema"] != adapter_schema
        or registration["engine_schema"] != engine_schema
        or registration["semantic_validator"] != semantic_validator
    ):
        raise StaticCnfEngineError("execution registration is crossed")
    if engine_schema == ENGINE_SCHEMA_V2 and (
        schema != EXECUTION_REGISTRY_SCHEMA
        or revision != STATIC_CNF_V2_REGISTRY_REVISION
        or registration["execution_mode"] != STATIC_CNF_EXECUTION_MODE
        or registration["capabilities"] != list(STATIC_CNF_EXECUTION_CAPABILITIES)
    ):
        raise StaticCnfEngineError("v2 execution registration is not code-defined")
    return json.loads(canonical_json_bytes(value))


def _strict_json(raw: bytes, *, label: str) -> Any:
    if not raw.endswith(b"\n"):
        raise StaticCnfEngineError(f"{label} must have one trailing newline")
    try:
        value = json.loads(
            raw[:-1].decode("utf-8"),
            parse_constant=lambda value: (_ for _ in ()).throw(
                ValueError(f"non-finite JSON constant {value}")
            ),
            object_pairs_hook=lambda pairs: _unique_object(pairs, label),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StaticCnfEngineError(f"invalid {label}: {exc}") from exc
    if canonical_json_bytes(value) + b"\n" != raw:
        raise StaticCnfEngineError(f"{label} is not canonical JSON")
    return value


def _sha256_text(value: Any, *, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise StaticCnfEngineError(f"{label} must be lowercase 64-hex")
    return value


def _validate_manifest_binding(value: Any, *, label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != {"sha256", "manifest"}:
        raise StaticCnfEngineError(f"{label} has an inexact schema")
    manifest = value.get("manifest")
    if type(manifest) is not dict:
        raise StaticCnfEngineError(f"{label}.manifest must be an exact object")
    try:
        validate_wave_manifest(manifest)
    except ValueError as error:
        raise StaticCnfEngineError(f"{label}.manifest is invalid") from error
    if _sha256_text(
        value.get("sha256"), label=f"{label}.sha256"
    ) != wave_manifest_sha256(manifest):
        raise StaticCnfEngineError(f"{label} hash is crossed")
    return manifest


def _unique_object(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate key in {label}: {key}")
        value[key] = item
    return value


def _capture(path: Path, *, maximum: int, label: str) -> tuple[bytes, Any]:
    if type(path) is not _NATIVE_PATH_TYPE:
        raise StaticCnfEngineError(f"{label} path must be an exact native Path")
    try:
        captured = capture_exact_regular_file(
            path,
            max_bytes=maximum,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=True,
            label=label,
        )
    except Exception as exc:
        raise StaticCnfEngineError(f"cannot capture {label}: {exc}") from exc
    return captured.data, captured


def _capture_at(
    parent_fd: int,
    name: str,
    *,
    maximum: int,
    label: str,
    expected_identity: tuple[int, int, int] | None = None,
    require_nonempty: bool = True,
) -> tuple[bytes, tuple[int, int, int]]:
    """Capture one regular file by name beneath an already-held directory."""
    if type(name) is not str or not name or "/" in name or name in {".", ".."}:
        raise StaticCnfEngineError(f"{label} name must be one literal component")
    fd: int | None = None
    try:
        fd = os.open(
            name,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent_fd,
        )
        before = os.fstat(fd)
        identity = (before.st_dev, before.st_ino, before.st_mode)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise StaticCnfEngineError(f"{label} is not a single regular file")
        if expected_identity is not None and identity != expected_identity:
            raise StaticCnfEngineError(f"{label} inode changed during publication")
        chunks: list[bytes] = []
        size = 0
        while True:
            chunk = os.read(fd, min(1 << 20, maximum - size + 1))
            if not chunk:
                break
            chunks.append(chunk)
            size += len(chunk)
            if size > maximum:
                raise StaticCnfEngineError(f"{label} exceeds its byte bound")
        payload = b"".join(chunks)
        after = os.fstat(fd)
        stable_fields = (
            "st_dev",
            "st_ino",
            "st_mode",
            "st_nlink",
            "st_size",
            "st_mtime_ns",
            "st_ctime_ns",
        )
        if any(
            getattr(before, field) != getattr(after, field) for field in stable_fields
        ):
            raise StaticCnfEngineError(f"{label} changed during capture")
        if len(payload) != before.st_size or (require_nonempty and not payload):
            raise StaticCnfEngineError(f"{label} has an invalid captured size")
        return payload, identity
    except StaticCnfEngineError:
        raise
    except (OSError, ValueError) as exc:
        raise StaticCnfEngineError(f"cannot capture {label}: {exc}") from exc
    finally:
        if fd is not None:
            os.close(fd)


def _check_hash(
    value: Mapping[str, Any], field: str, payload: bytes, label: str
) -> None:
    if value.get(field) != sha256_bytes(payload):
        raise StaticCnfEngineError(f"{label} hash mismatch")


def _reconstruct_runner_manifest(
    binding: StaticCnfBinding, *, attempt: int
) -> dict[str, Any]:
    producer = json.loads(binding.producer_manifest.decode("utf-8"))
    source = producer["source_manifest"]
    cnf_sha = sha256_bytes(binding.cnf)
    encoding = binding.wave_manifest["encoding"]
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": f"static-{cnf_sha[:32]}-{attempt:08d}",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": source["source_id"],
            "ingress_hypotheses_sha256": source["source_sha256"],
            "finite_schema": source["finite_schema"],
            "cardinality_scope": source["cardinality_scope"],
            "source_theorem": source["source_theorem"],
        },
        "encoding": {
            "cnf_sha256": cnf_sha,
            "variable_map_sha256": producer["variable_map_sha256"],
            "producer_manifest_sha256": sha256_bytes(binding.producer_manifest),
            "num_variables": encoding["num_variables"],
            "num_clauses": encoding["num_clauses"],
            "query_polarity": producer["query_polarity"],
        },
        "execution": {
            "backend": producer["backend"],
            "solver_profile": producer["solver_profile"],
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(
                canonical_json_bytes(
                    {
                        "cnf_sha256": cnf_sha,
                        "producer_manifest_sha256": sha256_bytes(
                            binding.producer_manifest
                        ),
                    }
                )
            ),
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    validate_wave_manifest(manifest)
    return manifest


def _result_type_check(result: StaticSolverResult) -> None:
    if type(result) is not StaticSolverResult:
        raise StaticCnfEngineError("runner returned the wrong result type")
    if type(result.verdict) is not str or type(result.returncode) is not int:
        raise StaticCnfEngineError("runner result has invalid verdict/returncode")
    if type(result.stdout) is not str or type(result.stderr) is not str:
        raise StaticCnfEngineError("runner result has invalid output fields")
    if type(result.assignment) is not dict:
        raise StaticCnfEngineError("runner assignment must be a dict")
    for key, value in result.assignment.items():
        if type(key) is not int or type(value) is not bool:
            raise StaticCnfEngineError("runner assignment has invalid field types")


def _classification(result: StaticSolverResult, receipt: Mapping[str, Any]) -> str:
    if (
        result.verdict == "SAT"
        and receipt["adapter_verdict"] == "SAT"
        and receipt["outcome"] == STRUCTURAL_SAT
    ):
        return SAT_OBSERVED
    if (
        result.verdict == "UNSAT"
        and receipt["adapter_verdict"] == "UNSAT"
        and receipt["outcome"] == DISCOVERY_UNSAT
    ):
        return UNSAT_OBSERVED_DISCOVERY_ONLY
    return INDETERMINATE


def _open_directory_chain(path: Path, *, label: str) -> int:
    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise StaticCnfEngineError(f"{label} must be an absolute native Path")
    descriptors: list[int] = []
    try:
        parent_fd = os.open(os.path.sep, _DIRECTORY_FLAGS)
        descriptors.append(parent_fd)
        for component in path.parts[1:]:
            child_fd = os.open(component, _DIRECTORY_FLAGS, dir_fd=parent_fd)
            descriptors.append(child_fd)
            if not stat.S_ISDIR(os.fstat(child_fd).st_mode):
                raise OSError(f"{component} is not a directory")
            os.close(parent_fd)
            descriptors.pop(-2)
            parent_fd = child_fd
        return parent_fd
    except OSError as exc:
        for descriptor in descriptors:
            try:
                os.close(descriptor)
            except OSError:
                pass
        raise StaticCnfEngineError(f"cannot hold {label} parent: {exc}") from exc


def _write_once_at(parent_fd: int, name: str, raw: bytes) -> tuple[int, int, int]:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW
    try:
        fd = os.open(name, flags, 0o600, dir_fd=parent_fd)
    except FileExistsError as exc:
        raise StaticCnfEngineError("engine output already exists") from exc
    identity: tuple[int, int, int] | None = None
    try:
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise StaticCnfEngineError("new engine output is not a single regular file")
        identity = (info.st_dev, info.st_ino, info.st_mode)
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
        try:
            os.close(fd)
        except OSError:
            pass
        raise
    else:
        os.close(fd)
        os.fsync(parent_fd)
        assert identity is not None
        return identity


def _open_directory(path: Path, *, label: str) -> int:
    try:
        fd = os.open(path, os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0))
        mode = os.fstat(fd).st_mode
        if not stat.S_ISDIR(mode):
            raise OSError("not a directory")
        return fd
    except OSError as exc:
        raise StaticCnfEngineError(f"cannot hold {label} directory: {exc}") from exc


def _safe_path(value: Any, *, label: str) -> Path:
    if type(value) is not str or not value:
        raise StaticCnfEngineError(f"{label} must be a nonempty string")
    path = Path(value)
    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise StaticCnfEngineError(f"{label} must be an absolute path")
    return path


def _verify_visible_directory(path: Path, descriptor: int, *, label: str) -> None:
    """Require a held directory to remain the directory visible at its path."""
    held = os.fstat(descriptor)
    try:
        visible = os.stat(path, follow_symlinks=False)
    except OSError as exc:
        raise StaticCnfEngineError(f"cannot rebind {label}: {exc}") from exc
    if (
        not stat.S_ISDIR(held.st_mode)
        or not stat.S_ISDIR(visible.st_mode)
        or (held.st_dev, held.st_ino) != (visible.st_dev, visible.st_ino)
    ):
        raise StaticCnfEngineError(f"{label} was replaced during validation")


def _receipt_bundle(
    *,
    binding: StaticCnfBinding,
    receipt: dict[str, Any],
    manifest: dict[str, Any],
    expected_source_sha256: str,
) -> tuple[dict[str, Any], dict[str, Any], dict[str, Any], list[dict[str, Any]]]:
    """Authenticate receipt, custody, seal, journal, and exact attempt files."""
    if set(receipt) != _RECEIPT_KEYS or receipt.get("schema") != RECEIPT_SCHEMA:
        raise StaticCnfEngineError("runner receipt schema/key mismatch")
    if type(receipt.get("attempt")) is not int or receipt["attempt"] < 0:
        raise StaticCnfEngineError("receipt attempt must be a nonnegative builtin int")
    if receipt.get("receipt_sha256") != sha256_json(
        {k: v for k, v in receipt.items() if k != "receipt_sha256"}
    ):
        raise StaticCnfEngineError("runner receipt self-hash mismatch")
    attempt_dir = _safe_path(
        receipt.get("attempt_directory"), label="attempt_directory"
    )
    receipt_path = _safe_path(receipt.get("receipt_path"), label="receipt_path")
    custody_path = _safe_path(
        receipt.get("custody_seal_path"), label="custody_seal_path"
    )
    journal_path = _safe_path(receipt.get("journal"), label="journal")
    if (
        receipt_path != attempt_dir / "solver-receipt.json"
        or custody_path != attempt_dir / "custody-seal.json"
        or journal_path != attempt_dir / "attempt.jsonl"
    ):
        raise StaticCnfEngineError("receipt paths cross the attempt directory")
    attempt_fd = _open_directory_chain(attempt_dir, label="attempt")
    try:
        if set(os.listdir(attempt_fd)) != set(_ATTEMPT_ENTRIES):
            raise StaticCnfEngineError(
                "sealed attempt inventory is not exactly six entries"
            )
        receipt_raw, receipt_identity = _capture_at(
            attempt_fd, "solver-receipt.json", maximum=1 << 20, label="solver receipt"
        )
        if _strict_json(receipt_raw, label="solver receipt") != receipt:
            raise StaticCnfEngineError("receipt changed or crossed during binding")
        custody_raw, _ = _capture_at(
            attempt_fd, "custody-seal.json", maximum=1 << 20, label="custody seal"
        )
        custody = _strict_json(custody_raw, label="custody seal")
        if (
            set(custody) != _CUSTODY_KEYS
            or custody.get("schema") != CUSTODY_SEAL_SCHEMA
            or custody["custody_seal_sha256"]
            != sha256_json(
                {k: v for k, v in custody.items() if k != "custody_seal_sha256"}
            )
        ):
            raise StaticCnfEngineError("custody seal binding/hash mismatch")
        attempt_info = os.fstat(attempt_fd)
        if (
            custody["receipt_sha256"] != receipt["receipt_sha256"]
            or custody["receipt_file_sha256"] != sha256_bytes(receipt_raw)
            or custody["receipt_file_size"] != len(receipt_raw)
            or (custody["receipt_device"], custody["receipt_inode"])
            != receipt_identity[:2]
            or (custody["attempt_directory_device"], custody["attempt_directory_inode"])
            != (attempt_info.st_dev, attempt_info.st_ino)
        ):
            raise StaticCnfEngineError("custody receipt/attempt identity mismatch")
        seal_raw, _ = _capture_at(
            attempt_fd,
            "attempt.jsonl.seal.json",
            maximum=1 << 20,
            label="driver seal",
        )
        seal = _strict_json(seal_raw, label="driver seal")
        if (
            set(seal) != _SEAL_KEYS
            or seal.get("schema") != SEAL_SCHEMA
            or seal["seal_sha256"]
            != sha256_json({k: v for k, v in seal.items() if k != "seal_sha256"})
        ):
            raise StaticCnfEngineError("driver seal binding/hash mismatch")
        if (
            receipt["seal_sha256"] != seal["seal_sha256"]
            or receipt["journal_record_count"] != seal["record_count"]
            or receipt["terminal_record_sha256"] != seal["terminal_attempt_sha256"]
            or receipt["cnf_sha256"] != sha256_bytes(binding.cnf)
            or receipt["producer_manifest_sha256"]
            != sha256_bytes(binding.producer_manifest)
            or receipt["source_manifest_sha256"] != expected_source_sha256
            or seal["wave_manifest_sha256"] != wave_manifest_sha256(manifest)
        ):
            raise StaticCnfEngineError("receipt crosses package or driver seal")
        journal_raw, _ = _capture_at(
            attempt_fd, "attempt.jsonl", maximum=64 << 20, label="attempt journal"
        )
        records = [
            _strict_json(line + b"\n", label="attempt record")
            for line in journal_raw.splitlines()
            if line
        ]
        validate_attempt_journal(
            records,
            manifest=manifest,
            expected_record_count=seal["record_count"],
            expected_terminal_sha256=seal["terminal_attempt_sha256"],
        )
        if sha256_bytes(journal_raw) != seal["journal_sha256"]:
            raise StaticCnfEngineError("journal hash mismatch")
        _verify_custody_inventory(
            attempt_dir,
            attempt_fd,
            custody["inventory"],
            seal_raw=seal_raw,
            expected_cnf_sha256=sha256_bytes(binding.cnf),
            max_cnf_bytes=binding.control.cnf.max_bytes,
        )
        return custody, seal, custody["inventory"], records
    finally:
        os.close(attempt_fd)


def _unsigned_envelope(
    binding: StaticCnfBinding,
    manifest: Mapping[str, Any],
    result: StaticSolverResult,
    receipt: Mapping[str, Any],
    custody: Mapping[str, Any],
    seal: Mapping[str, Any],
    inventory: Mapping[str, Any],
    records: list[dict[str, Any]],
    classification: str,
    execution_registration: Mapping[str, Any] | None,
    *,
    engine_schema: str,
    adapter_schema: str,
) -> dict[str, Any]:
    envelope = {
        "schema": engine_schema,
        "wave_kind": STATIC_CNF,
        "adapter": {
            "id": STATIC_CNF_PIQD_ADAPTER,
            "schema": adapter_schema,
        },
        "control": {"sha256": sha256_bytes(binding.control.canonical_bytes)},
        "package": {
            "cnf_sha256": sha256_bytes(binding.cnf),
            "producer_manifest_sha256": sha256_bytes(binding.producer_manifest),
            "variable_map_sha256": sha256_bytes(binding.variable_map),
        },
        "resource_policy": binding.control.policy.as_dict(),
        "result": {
            "classification": classification,
            "verdict": result.verdict,
            "assignment": result.assignment,
            "returncode": result.returncode,
        },
        "receipt": dict(receipt),
        "custody_seal": dict(custody),
        "driver_seal": dict(seal),
        "journal": {
            "sha256": inventory["journal_sha256"],
            "record_count": receipt["journal_record_count"],
            "records": records,
        },
        "attempt_entries": sorted(_ATTEMPT_ENTRIES),
        "attempt_inventory": dict(inventory),
        "claims": {name: False for name in _CLAIMS},
    }
    execution_manifest = {
        "sha256": wave_manifest_sha256(manifest),
        "manifest": dict(manifest),
    }
    if engine_schema == ENGINE_SCHEMA_V1:
        envelope["wave_manifest"] = execution_manifest
    else:
        if (
            binding.semantic_profile is None
            or binding.semantic_profile_bytes is None
            or binding.semantic_validation is None
        ):
            raise StaticCnfEngineError("v2 binding lacks semantic validation")
        profile = binding.semantic_profile.payload
        envelope.update(
            {
                "wave_manifest": {
                    "sha256": wave_manifest_sha256(binding.wave_manifest),
                    "manifest": dict(binding.wave_manifest),
                },
                "execution_manifest": execution_manifest,
                "semantic_profile": {
                    "sha256": sha256_bytes(binding.semantic_profile_bytes),
                    "metadata": {
                        key: profile[key]
                        for key in (
                            "schema",
                            "profile_id",
                            "validator",
                            "classification",
                            "cleanup",
                        )
                    },
                },
                "semantic_artifacts": [
                    {
                        "role": role,
                        "sha256": capture.digest,
                        "bytes": len(capture.data),
                    }
                    for role, capture in binding.semantic_artifacts
                ],
            }
        )
    if execution_registration is not None:
        envelope["execution_registry"] = dict(execution_registration)
    return envelope


@dataclass(frozen=True)
class StaticCnfEngineResult:
    classification: str
    envelope_path: Path
    envelope: dict[str, Any]


class StaticCnfWaveEngine:
    """Dispatch only the closed, registered STATIC_CNF adapter."""

    def __init__(
        self,
        *,
        control: WaveControl,
        package_root: Path,
        output_path: Path,
        base_url: str,
        journal_root: Path,
        transport: Any = None,
        sleep: Callable[[float], None] | None = None,
        execution_registration: Mapping[str, Any] | None = None,
    ) -> None:
        if (
            type(control) is not WaveControl
            or type(package_root) is not _NATIVE_PATH_TYPE
        ):
            raise StaticCnfEngineError(
                "engine requires a native bound control and package root"
            )
        if not package_root.is_absolute():
            raise StaticCnfEngineError("package_root must be absolute")
        registration_key = (
            control.registration.wave_kind,
            control.registration.adapter_id,
            control.registration.schema_version,
            control.registration.semantic_validator,
        )
        if registration_key == (
            STATIC_CNF,
            STATIC_CNF_PIQD_ADAPTER,
            STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1,
            STATIC_CNF_SEMANTIC_VALIDATOR_V1,
        ):
            engine_schema = ENGINE_SCHEMA_V1
            registry_required = False
        elif registration_key == (
            STATIC_CNF,
            STATIC_CNF_PIQD_ADAPTER,
            STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
            STATIC_CNF_SEMANTIC_VALIDATOR_V2,
        ):
            engine_schema = ENGINE_SCHEMA_V2
            registry_required = True
        else:
            raise StaticCnfEngineError(
                "adapter is not in the closed STATIC_CNF registry"
            )
        if (
            type(output_path) is not _NATIVE_PATH_TYPE
            or type(journal_root) is not _NATIVE_PATH_TYPE
        ):
            raise StaticCnfEngineError(
                "output_path and journal_root must be native Paths"
            )
        if not output_path.is_absolute() or not output_path.name:
            raise StaticCnfEngineError("output_path must be an absolute file Path")
        if not journal_root.is_absolute():
            raise StaticCnfEngineError("journal_root must be an absolute Path")
        if type(base_url) is not str or not base_url or not base_url.strip():
            raise StaticCnfEngineError("base_url must be a nonempty builtin string")
        if control.policy.requested_core_limit != 1:
            raise StaticCnfEngineError("STATIC_CNF requires requested_core_limit=1")
        self.control, self.package_root = control, package_root
        self.output_path, self.base_url, self.journal_root = (
            output_path,
            base_url,
            journal_root,
        )
        self.transport, self.sleep = transport, sleep
        self.engine_schema = engine_schema
        self.adapter_schema = control.registration.schema_version
        self.semantic_validator = control.registration.semantic_validator
        self.execution_registration = _validate_execution_registration(
            execution_registration,
            adapter_schema=self.adapter_schema,
            engine_schema=self.engine_schema,
            semantic_validator=self.semantic_validator,
            required=registry_required,
        )

    def run(
        self, *, timeout_s: int | None = None, proof_path: None = None
    ) -> StaticCnfEngineResult:
        if proof_path is not None:
            raise StaticCnfEngineError("STATIC_CNF proof_path must be literal None")
        parent_fd = _open_directory_chain(self.output_path.parent, label="output")
        try:
            binding = bind_static_cnf(self.control, self.package_root)
            timeout = (
                binding.control.policy.solver_timeout_s
                if timeout_s is None
                else timeout_s
            )
            if type(timeout) is not int or timeout < 0:
                raise StaticCnfEngineError(
                    "timeout_s must be a non-negative builtin int"
                )
            source_manifest = canonical_json_bytes(
                json.loads(binding.producer_manifest.decode("utf-8"))["source_manifest"]
            )
            kwargs: dict[str, Any] = {
                "base_url": self.base_url,
                "journal_root": self.journal_root,
                "source_manifest": source_manifest,
                "producer_manifest": binding.producer_manifest,
                "transport": self.transport,
                "policy": binding.control.policy,
                "max_cnf_bytes": binding.control.cnf.max_bytes,
            }
            if self.sleep is not None:
                kwargs["sleep"] = self.sleep
            runner = make_static_piqd_solver_runner(**kwargs)
            # Sole adapter call: BaseException is deliberately not caught.
            result = runner(self.package_root / self.control.cnf.path, timeout, None)
            _result_type_check(result)
            if not result.stdout:
                raise StaticCnfEngineError("runner did not publish a receipt")
            receipt = _strict_json(
                result.stdout.encode("utf-8"), label="runner receipt"
            )
            if (
                type(receipt) is not dict
                or set(receipt) != _RECEIPT_KEYS
                or receipt.get("schema") != RECEIPT_SCHEMA
                or type(receipt.get("attempt")) is not int
                or receipt["attempt"] < 0
            ):
                raise StaticCnfEngineError("runner receipt is not an object")
            manifest = _reconstruct_runner_manifest(
                binding, attempt=receipt.get("attempt")
            )
            custody, seal, inventory, records = _receipt_bundle(
                binding=binding,
                receipt=receipt,
                manifest=manifest,
                expected_source_sha256=sha256_bytes(source_manifest),
            )
            classification = _classification(result, receipt)
            unsigned = _unsigned_envelope(
                binding,
                manifest,
                result,
                receipt,
                custody,
                seal,
                inventory,
                records,
                classification,
                self.execution_registration,
                engine_schema=self.engine_schema,
                adapter_schema=self.adapter_schema,
            )
            envelope = {**unsigned, "envelope_sha256": sha256_json(unsigned)}
            output_identity = _write_once_at(
                parent_fd, self.output_path.name, canonical_json_bytes(envelope) + b"\n"
            )
            parent_info = os.fstat(parent_fd)
            try:
                visible_parent = os.stat(self.output_path.parent, follow_symlinks=False)
            except OSError as exc:
                raise StaticCnfEngineError(
                    "output parent changed during publication"
                ) from exc
            if (visible_parent.st_dev, visible_parent.st_ino) != (
                parent_info.st_dev,
                parent_info.st_ino,
            ):
                raise StaticCnfEngineError("output parent changed during publication")
            accepted = _validate_static_cnf_engine_output(
                self.output_path,
                held_parent_fd=parent_fd,
                held_name=self.output_path.name,
                expected_output_identity=output_identity,
            )
            return StaticCnfEngineResult(classification, self.output_path, accepted)
        finally:
            os.close(parent_fd)


def _validate_static_cnf_engine_output(
    path: Path,
    *,
    held_parent_fd: int | None = None,
    held_name: str | None = None,
    expected_output_identity: tuple[int, int, int] | None = None,
) -> dict[str, Any]:
    """Validate an engine envelope and all bound custody files offline."""
    if type(path) is not _NATIVE_PATH_TYPE:
        raise StaticCnfEngineError("engine envelope path must be an exact native Path")
    if held_parent_fd is None:
        raw, _ = _capture(path, maximum=16 << 20, label="engine envelope")
    else:
        if held_name != path.name:
            raise StaticCnfEngineError("held output name does not match envelope path")
        raw, _ = _capture_at(
            held_parent_fd,
            held_name,
            maximum=16 << 20,
            label="engine envelope",
            expected_identity=expected_output_identity,
        )
    envelope = _strict_json(raw, label="engine envelope")
    if type(envelope) is not dict or envelope.get("schema") not in {
        ENGINE_SCHEMA_V1,
        ENGINE_SCHEMA_V2,
    }:
        raise StaticCnfEngineError("invalid engine envelope schema")
    engine_schema = envelope["schema"]
    adapter_schema = (
        STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1
        if engine_schema == ENGINE_SCHEMA_V1
        else STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2
    )
    semantic_validator = (
        STATIC_CNF_SEMANTIC_VALIDATOR_V1
        if engine_schema == ENGINE_SCHEMA_V1
        else STATIC_CNF_SEMANTIC_VALIDATOR_V2
    )
    claimed = envelope.get("envelope_sha256")
    unsigned = {
        key: value for key, value in envelope.items() if key != "envelope_sha256"
    }
    if type(claimed) is not str or claimed != sha256_json(unsigned):
        raise StaticCnfEngineError("engine envelope hash mismatch")
    if unsigned.get("wave_kind") != STATIC_CNF or unsigned.get("claims") != {
        name: False for name in _CLAIMS
    }:
        raise StaticCnfEngineError("engine envelope has unsafe claims or wave kind")
    receipt = envelope.get("receipt")
    if (
        type(receipt) is not dict
        or set(receipt) != _RECEIPT_KEYS
        or receipt.get("schema") != RECEIPT_SCHEMA
    ):
        raise StaticCnfEngineError("receipt schema/key mismatch")
    package = envelope.get("package")
    if type(package) is not dict or "cnf_sha256" not in package:
        raise StaticCnfEngineError("engine package CNF binding is missing")
    expected_cnf_sha256 = package["cnf_sha256"]
    _sha256_text(expected_cnf_sha256, label="package.cnf_sha256")
    if expected_cnf_sha256 != receipt.get("cnf_sha256"):
        raise StaticCnfEngineError("engine package CNF binding is crossed")
    if engine_schema == ENGINE_SCHEMA_V1:
        expected_keys = _ENGINE_ENVELOPE_KEYS_V1
        if "execution_registry" in envelope:
            expected_keys = expected_keys | {"execution_registry"}
    else:
        expected_keys = _ENGINE_ENVELOPE_KEYS_V2
    if set(envelope) != expected_keys:
        raise StaticCnfEngineError("engine envelope has an inexact schema")
    adapter = envelope.get("adapter")
    if adapter != {"id": STATIC_CNF_PIQD_ADAPTER, "schema": adapter_schema}:
        raise StaticCnfEngineError("engine adapter binding is crossed")
    _validate_execution_registration(
        envelope.get("execution_registry"),
        adapter_schema=adapter_schema,
        engine_schema=engine_schema,
        semantic_validator=semantic_validator,
        required=engine_schema == ENGINE_SCHEMA_V2,
    )
    _validate_manifest_binding(envelope.get("wave_manifest"), label="wave_manifest")
    execution_manifest = (
        _validate_manifest_binding(
            envelope.get("execution_manifest"), label="execution_manifest"
        )
        if engine_schema == ENGINE_SCHEMA_V2
        else envelope["wave_manifest"]["manifest"]
    )
    execution_manifest_sha256 = (
        envelope["execution_manifest"]["sha256"]
        if engine_schema == ENGINE_SCHEMA_V2
        else envelope["wave_manifest"]["sha256"]
    )
    if engine_schema == ENGINE_SCHEMA_V2:
        profile = envelope.get("semantic_profile")
        if type(profile) is not dict or set(profile) != {"sha256", "metadata"}:
            raise StaticCnfEngineError("semantic profile has an inexact schema")
        _sha256_text(profile.get("sha256"), label="semantic_profile.sha256")
        try:
            validate_profile_metadata(profile.get("metadata"))
        except SemanticProfileError as error:
            raise StaticCnfEngineError(
                "semantic profile metadata is invalid"
            ) from error
        artifacts = envelope.get("semantic_artifacts")
        if type(artifacts) is not list or not artifacts:
            raise StaticCnfEngineError("semantic artifact inventory is invalid")
        roles: list[str] = []
        for item in artifacts:
            if type(item) is not dict or set(item) != {"role", "sha256", "bytes"}:
                raise StaticCnfEngineError("semantic artifact has an inexact schema")
            role = item.get("role")
            byte_count = item.get("bytes")
            if (
                type(role) is not str
                or not role
                or not role.isascii()
                or type(byte_count) is not int
                or byte_count < 0
            ):
                raise StaticCnfEngineError("semantic artifact fields are invalid")
            _sha256_text(item.get("sha256"), label=f"semantic_artifacts.{role}")
            roles.append(role)
        if roles != sorted(set(roles)):
            raise StaticCnfEngineError(
                "semantic artifact roles must be sorted and duplicate-free"
            )
    if type(receipt.get("attempt")) is not int or receipt["attempt"] < 0:
        raise StaticCnfEngineError("receipt attempt must be a nonnegative builtin int")
    attempt_dir = _safe_path(receipt["attempt_directory"], label="attempt_directory")
    receipt_path = _safe_path(receipt["receipt_path"], label="receipt_path")
    custody_path = _safe_path(receipt["custody_seal_path"], label="custody_seal_path")
    journal_path = _safe_path(receipt["journal"], label="journal")
    if (
        receipt_path != attempt_dir / "solver-receipt.json"
        or custody_path != attempt_dir / "custody-seal.json"
        or journal_path != attempt_dir / "attempt.jsonl"
    ):
        raise StaticCnfEngineError("receipt paths cross attempt directory")
    if (
        not attempt_dir.is_absolute()
        or receipt_path.name != "solver-receipt.json"
        or custody_path.name != "custody-seal.json"
    ):
        raise StaticCnfEngineError("custody paths must be absolute and literal")
    attempt_fd = _open_directory_chain(attempt_dir, label="attempt")
    try:
        names = set(os.listdir(attempt_fd))
        if names != set(_ATTEMPT_ENTRIES):
            raise StaticCnfEngineError(
                "sealed attempt inventory is not exactly six entries"
            )
        receipt_raw, receipt_identity = _capture_at(
            attempt_fd,
            "solver-receipt.json",
            maximum=1 << 20,
            label="solver receipt",
        )
        receipt_disk = _strict_json(receipt_raw, label="solver receipt")
        if receipt_disk != receipt or receipt.get("receipt_sha256") != sha256_json(
            {k: v for k, v in receipt.items() if k != "receipt_sha256"}
        ):
            raise StaticCnfEngineError("receipt binding/hash mismatch")
        custody_raw, _custody_identity = _capture_at(
            attempt_fd,
            "custody-seal.json",
            maximum=1 << 20,
            label="custody seal",
        )
        custody = _strict_json(custody_raw, label="custody seal")
        if (
            set(custody) != _CUSTODY_KEYS
            or custody.get("schema") != CUSTODY_SEAL_SCHEMA
            or custody.get("custody_seal_sha256")
            != sha256_json(
                {k: v for k, v in custody.items() if k != "custody_seal_sha256"}
            )
        ):
            raise StaticCnfEngineError("custody seal binding/hash mismatch")
        attempt_info = os.fstat(attempt_fd)
        if (
            custody["receipt_sha256"] != receipt["receipt_sha256"]
            or custody["receipt_file_sha256"] != sha256_bytes(receipt_raw)
            or custody["receipt_file_size"] != len(receipt_raw)
            or (custody["receipt_device"], custody["receipt_inode"])
            != receipt_identity[:2]
            or (custody["attempt_directory_device"], custody["attempt_directory_inode"])
            != (attempt_info.st_dev, attempt_info.st_ino)
        ):
            raise StaticCnfEngineError("custody receipt/attempt identity mismatch")
        if envelope.get("custody_seal") != custody:
            raise StaticCnfEngineError("engine custody binding mismatch")
        seal_raw, _seal_identity = _capture_at(
            attempt_fd,
            "attempt.jsonl.seal.json",
            maximum=1 << 20,
            label="driver seal",
        )
        seal = _strict_json(seal_raw, label="driver seal")
        if (
            set(seal) != _SEAL_KEYS
            or seal.get("schema") != SEAL_SCHEMA
            or seal["seal_sha256"]
            != sha256_json({k: v for k, v in seal.items() if k != "seal_sha256"})
        ):
            raise StaticCnfEngineError("driver seal binding/hash mismatch")
        if envelope.get("driver_seal") != seal:
            raise StaticCnfEngineError("engine driver-seal binding mismatch")
        journal_raw, _journal_identity = _capture_at(
            attempt_fd,
            "attempt.jsonl",
            maximum=64 << 20,
            label="attempt journal",
        )
        records = [
            _strict_json(line + b"\n", label="attempt record")
            for line in journal_raw.splitlines()
            if line
        ]
        validate_attempt_journal(
            records,
            manifest=execution_manifest,
            expected_record_count=seal["record_count"],
            expected_terminal_sha256=seal["terminal_attempt_sha256"],
        )
        if sha256_bytes(journal_raw) != seal["journal_sha256"]:
            raise StaticCnfEngineError("journal hash mismatch")
        if (
            envelope["journal"]["sha256"] != seal["journal_sha256"]
            or envelope["journal"]["records"] != records
        ):
            raise StaticCnfEngineError("engine journal binding mismatch")
        if envelope.get("attempt_entries") != sorted(_ATTEMPT_ENTRIES):
            raise StaticCnfEngineError(
                "engine attempt inventory is not the six-entry set"
            )
        if envelope.get("attempt_inventory") != custody["inventory"]:
            raise StaticCnfEngineError("engine custody inventory binding mismatch")
        _verify_custody_inventory(
            attempt_dir,
            attempt_fd,
            custody["inventory"],
            seal_raw=seal_raw,
            expected_cnf_sha256=expected_cnf_sha256,
            max_cnf_bytes=MAX_STATIC_CNF_BYTES,
        )
        if seal["wave_manifest_sha256"] != execution_manifest_sha256:
            raise StaticCnfEngineError("wave manifest crossing")
        if held_parent_fd is not None:
            _verify_visible_directory(
                path.parent, held_parent_fd, label="output parent"
            )
        return {
            **envelope,
            "receipt": receipt,
            "custody_seal": custody,
            "driver_seal": seal,
        }
    finally:
        os.close(attempt_fd)


def _verify_custody_inventory(
    attempt_dir: Path,
    attempt_fd: int,
    inventory: Mapping[str, Any],
    *,
    seal_raw: bytes | None,
    expected_cnf_sha256: str,
    max_cnf_bytes: int,
) -> None:
    if (
        type(expected_cnf_sha256) is not str
        or len(expected_cnf_sha256) != 64
        or any(character not in "0123456789abcdef" for character in expected_cnf_sha256)
        or type(max_cnf_bytes) is not int
        or max_cnf_bytes <= 0
    ):
        raise StaticCnfEngineError("authenticated CNF bound is invalid")
    if type(inventory) is not dict or set(inventory) != {
        "journal_sha256",
        "journal_size",
        "journal_device",
        "journal_inode",
        "lock_device",
        "lock_inode",
        "driver_seal_sha256",
        "artifacts",
    }:
        raise StaticCnfEngineError("custody inventory schema mismatch")
    journal_raw, journal_id = _capture_at(
        attempt_fd, "attempt.jsonl", maximum=64 << 20, label="attempt journal"
    )
    _lock_raw, lock_id = _capture_at(
        attempt_fd,
        "attempt.jsonl.lock",
        maximum=1,
        label="attempt lock",
        require_nonempty=False,
    )
    if (
        inventory["journal_sha256"],
        inventory["journal_size"],
        inventory["journal_device"],
        inventory["journal_inode"],
    ) != (
        sha256_bytes(journal_raw),
        len(journal_raw),
        journal_id[0],
        journal_id[1],
    ):
        raise StaticCnfEngineError("custody journal identity/hash mismatch")
    if (inventory["lock_device"], inventory["lock_inode"]) != (
        lock_id[0],
        lock_id[1],
    ):
        raise StaticCnfEngineError("custody lock identity mismatch")
    current_seal, _seal_id = _capture_at(
        attempt_fd,
        "attempt.jsonl.seal.json",
        maximum=1 << 20,
        label="driver seal",
    )
    expected_seal_hash = sha256_bytes(current_seal)
    if inventory["driver_seal_sha256"] != expected_seal_hash or (
        seal_raw is not None and seal_raw != current_seal
    ):
        raise StaticCnfEngineError("custody driver-seal binding mismatch")
    try:
        artifact_fd = os.open(
            "attempt.jsonl.artifacts", _DIRECTORY_FLAGS, dir_fd=attempt_fd
        )
    except OSError as exc:
        raise StaticCnfEngineError(f"cannot open artifact directory: {exc}") from exc
    try:
        artifact_names = set(os.listdir(artifact_fd))
        artifacts = inventory["artifacts"]
        if type(artifacts) is not list:
            raise StaticCnfEngineError("artifact inventory is not exact")
        expected_names: set[str] = set()
        for item in artifacts:
            if type(item) is not dict or set(item) != {
                "sha256",
                "size",
                "device",
                "inode",
            }:
                raise StaticCnfEngineError("artifact inventory item schema mismatch")
            artifact_name = item["sha256"]
            if (
                type(artifact_name) is not str
                or len(artifact_name) != 64
                or any(
                    character not in "0123456789abcdef" for character in artifact_name
                )
                or any(
                    type(item[field]) is not int or item[field] < 0
                    for field in ("size", "device", "inode")
                )
            ):
                raise StaticCnfEngineError("artifact inventory item schema mismatch")
            expected_names.add(artifact_name)
        if expected_names != artifact_names or len(expected_names) != len(artifacts):
            raise StaticCnfEngineError("artifact inventory is not exact")
        cnf_artifacts = [
            item for item in artifacts if item["sha256"] == expected_cnf_sha256
        ]
        if len(cnf_artifacts) != 1:
            raise StaticCnfEngineError(
                "authenticated CNF artifact must be present exactly once"
            )
        for item in artifacts:
            maximum = (
                max_cnf_bytes if item["sha256"] == expected_cnf_sha256 else 64 << 20
            )
            if item["size"] > maximum:
                raise StaticCnfEngineError("archived artifact exceeds its byte bound")
            payload, identity = _capture_at(
                artifact_fd,
                item["sha256"],
                maximum=maximum,
                label="archived artifact",
            )
            if (item["sha256"], item["size"], item["device"], item["inode"]) != (
                sha256_bytes(payload),
                len(payload),
                identity[0],
                identity[1],
            ):
                raise StaticCnfEngineError("archived artifact tampering")
        artifact_info = os.fstat(artifact_fd)
        try:
            visible_artifact = os.stat(
                "attempt.jsonl.artifacts", dir_fd=attempt_fd, follow_symlinks=False
            )
        except OSError as exc:
            raise StaticCnfEngineError(
                "artifact directory changed during validation"
            ) from exc
        if not stat.S_ISDIR(visible_artifact.st_mode) or (
            visible_artifact.st_dev,
            visible_artifact.st_ino,
        ) != (artifact_info.st_dev, artifact_info.st_ino):
            raise StaticCnfEngineError("artifact directory changed during validation")
    finally:
        os.close(artifact_fd)
    _verify_visible_directory(attempt_dir, attempt_fd, label="attempt directory")


def validate_static_cnf_engine_output(path: Path) -> dict[str, Any]:
    """Validate an engine envelope and all bound custody files offline."""
    return _validate_static_cnf_engine_output(path)


validate_static_cnf_engine_envelope = validate_static_cnf_engine_output

__all__ = [
    "ENGINE_SCHEMA",
    "ENGINE_SCHEMA_V1",
    "ENGINE_SCHEMA_V2",
    "INDETERMINATE",
    "SAT_OBSERVED",
    "UNSAT_OBSERVED_DISCOVERY_ONLY",
    "StaticCnfEngineError",
    "StaticCnfEngineResult",
    "StaticCnfWaveEngine",
    "validate_static_cnf_engine_envelope",
    "validate_static_cnf_engine_output",
]
