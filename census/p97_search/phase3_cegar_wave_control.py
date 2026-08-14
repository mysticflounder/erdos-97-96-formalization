"""Strict control records and dry-run cleanup plans for P97 CEGAR waves.

This module is deliberately smaller than an execution engine.  It binds one
static-CNF control record to an existing ``p97-cegar-wave/v1`` manifest and
provides a deterministic planner for retiring compatibility entrypoints.  The
cleanup API has no mutation primitive: it can authenticate and propose a
target, but it cannot unlink, rename, or overwrite it.
"""

from __future__ import annotations

import json
import math
import os
import stat
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any

from census.p97_search.cegar_wave_semantic_profiles import (
    PROFILE_SCHEMA,
    CapturedBytes,
    SemanticProfile,
    SemanticProfileError,
    parse_profile_bytes,
    validate_semantic_profile,
)
from census.p97_search.phase3_cegar_runtime import (
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy, PiqdDriverError

CONTROL_SCHEMA_V1 = "p97-cegar-wave-control/v1"
CONTROL_SCHEMA_V2 = "p97-cegar-wave-control/v2"
CONTROL_SCHEMA = CONTROL_SCHEMA_V1
INVENTORY_SCHEMA = "p97-cegar-wave-entrypoint-inventory/v1"
CLEANUP_PLAN_SCHEMA = "p97-cegar-wave-cleanup-plan/v1"

EXECUTION_REGISTRY_SCHEMA = "p97-cegar-execution-registry/v1"
STATIC_CNF_EXECUTION_MODE = "one-shot-static-cnf"
STATIC_CNF_EXECUTION_CAPABILITIES = (
    "check",
    "plan",
    "run",
    "status",
    "validate-ingress",
    "validate-output",
)
STATIC_CNF_V2_REGISTRY_REVISION = "2026-08-14.1"

STATIC_CNF = "STATIC_CNF"
STATIC_CNF_PIQD_ADAPTER = "static-cnf-piqd"
STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1 = "v1"
STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2 = "v2"
STATIC_CNF_PIQD_ADAPTER_SCHEMA = STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1
STATIC_CNF_SEMANTIC_VALIDATOR_V1 = "p97-static-cnf-semantic-replay/v1"
STATIC_CNF_SEMANTIC_VALIDATOR_V2 = PROFILE_SCHEMA
STATIC_CNF_SEMANTIC_VALIDATOR = STATIC_CNF_SEMANTIC_VALIDATOR_V1

ACTIVE = "ACTIVE"
FROZEN_REPRODUCTION = "FROZEN_REPRODUCTION"
COMPATIBILITY_SHIM = "COMPATIBILITY_SHIM"
PROTECTED_ARTIFACT = "PROTECTED_ARTIFACT"
OUT_OF_SCOPE = "OUT_OF_SCOPE"
UNCLASSIFIED = "UNCLASSIFIED"

ENTRYPOINT = "ENTRYPOINT"
CAMPAIGN = "CAMPAIGN"
PACKAGE = "PACKAGE"
CNF = "CNF"
CUBE = "CUBE"
LRAT = "LRAT"
PROOF = "PROOF"
RECEIPT = "RECEIPT"
JOURNAL = "JOURNAL"
RESULT = "RESULT"
OUTPUT = "OUTPUT"
ARTIFACT = "ARTIFACT"

PASS = "PASS"
FAIL = "FAIL"
NOT_RUN = "NOT_RUN"

MAX_CONTROL_BYTES = 1 << 20
MAX_INVENTORY_BYTES = 8 << 20
MAX_ENTRYPOINT_BYTES = 8 << 20
MAX_WAVE_MANIFEST_BYTES = 1 << 20
MAX_STATIC_CNF_BYTES = 512 << 20
MAX_PRODUCER_MANIFEST_BYTES = 8 << 20
MAX_VARIABLE_MAP_BYTES = 64 << 20
MAX_SEMANTIC_PROFILE_BYTES = 1 << 20
MAX_SEMANTIC_ARTIFACT_BYTES = 512 << 20

_NATIVE_PATH_TYPE = type(Path())
_HEX = frozenset("0123456789abcdef")
_CONTROL_KEYS_V1 = frozenset(
    {
        "schema",
        "wave_kind",
        "adapter_id",
        "adapter_schema",
        "wave_manifest",
        "package",
        "driver_policy",
        "semantic_validator",
    }
)
_CONTROL_KEYS_V2 = _CONTROL_KEYS_V1 | {
    "semantic_profile",
    "semantic_artifacts",
}
_REF_KEYS = frozenset({"path", "sha256", "max_bytes"})
_PACKAGE_KEYS = frozenset({"cnf", "producer_manifest", "variable_map"})
_POLICY_KEYS = frozenset(
    {
        "max_prepare_attempts",
        "max_confirm_attempts",
        "max_polls",
        "max_result_attempts",
        "poll_interval_s",
        "solver_timeout_s",
        "march_timeout_s",
        "project",
    }
)
_POLICY_OPTIONAL_KEYS = frozenset({"requested_core_limit"})


def _require_canonical_repo_root(repo_root: Path) -> Path:
    if type(repo_root) is not _NATIVE_PATH_TYPE:
        raise WaveControlError("repo_root must be an exact native Path")
    if not repo_root.is_absolute():
        raise WaveControlError("repo_root must be absolute")
    canonical = Path(os.path.realpath(os.fspath(repo_root)))
    if canonical != repo_root:
        raise WaveControlError("repo_root must be a canonical no-symlink path")
    try:
        metadata = os.stat(repo_root, follow_symlinks=False)
    except OSError as exc:
        raise WaveControlError("repo_root cannot be inspected") from exc
    if not stat.S_ISDIR(metadata.st_mode):
        raise WaveControlError("repo_root must be a directory")
    return repo_root


_INVENTORY_KEYS = frozenset({"schema", "entries"})
_ENTRY_KEYS = frozenset(
    {
        "path",
        "sha256",
        "wave_id",
        "kind",
        "lifecycle",
        "replacement",
        "runtime_callers",
        "active_manifest_references",
        "static_callers",
        "receipt_paths",
        "artifact_paths",
        "archive_manifest",
        "rollback_pointer",
        "shadow_replay",
        "historical_replay",
        "active_writer",
        "cleanup_approved",
    }
)
_POINTER_KEYS = frozenset({"path", "sha256"})
_REPLAY_KEYS = frozenset({"status", "receipt"})
_LIFECYCLES = frozenset(
    {
        ACTIVE,
        FROZEN_REPRODUCTION,
        COMPATIBILITY_SHIM,
        PROTECTED_ARTIFACT,
        OUT_OF_SCOPE,
        UNCLASSIFIED,
    }
)
_KINDS = frozenset(
    {
        ENTRYPOINT,
        CAMPAIGN,
        PACKAGE,
        CNF,
        CUBE,
        LRAT,
        PROOF,
        RECEIPT,
        JOURNAL,
        RESULT,
        OUTPUT,
        ARTIFACT,
    }
)
_REPLAY_STATES = frozenset({PASS, FAIL, NOT_RUN})


class WaveControlError(ValueError):
    """A control, package binding, inventory, or cleanup plan failed closed."""


@dataclass(frozen=True)
class AdapterRegistration:
    wave_kind: str
    adapter_id: str
    schema_version: str
    semantic_validator: str
    permits_campaign: bool = False
    permits_terminal_proof: bool = False


@dataclass(frozen=True)
class ArtifactReference:
    path: str
    sha256: str
    max_bytes: int


@dataclass(frozen=True)
class WaveControl:
    value: dict[str, Any]
    manifest: ArtifactReference
    cnf: ArtifactReference
    producer_manifest: ArtifactReference
    variable_map: ArtifactReference
    policy: DriverPolicy
    registration: AdapterRegistration
    canonical_bytes: bytes
    semantic_profile: ArtifactReference | None = None
    semantic_artifacts: tuple[tuple[str, ArtifactReference], ...] = ()


@dataclass(frozen=True)
class StaticCnfBinding:
    control: WaveControl
    wave_manifest: dict[str, Any]
    wave_manifest_bytes: bytes
    cnf: bytes
    producer_manifest: bytes
    variable_map: bytes
    semantic_profile: SemanticProfile | None = None
    semantic_profile_bytes: bytes | None = None
    semantic_artifacts: tuple[tuple[str, CapturedBytes], ...] = ()
    semantic_validation: dict[str, Any] | None = None


STATIC_REGISTRY = MappingProxyType(
    {
        (STATIC_CNF, STATIC_CNF_PIQD_ADAPTER, STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1): (
            AdapterRegistration(
                wave_kind=STATIC_CNF,
                adapter_id=STATIC_CNF_PIQD_ADAPTER,
                schema_version=STATIC_CNF_PIQD_ADAPTER_SCHEMA_V1,
                semantic_validator=STATIC_CNF_SEMANTIC_VALIDATOR_V1,
            )
        ),
        (STATIC_CNF, STATIC_CNF_PIQD_ADAPTER, STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2): (
            AdapterRegistration(
                wave_kind=STATIC_CNF,
                adapter_id=STATIC_CNF_PIQD_ADAPTER,
                schema_version=STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
                semantic_validator=STATIC_CNF_SEMANTIC_VALIDATOR_V2,
            )
        ),
    }
)


def _duplicate_rejecting_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise WaveControlError(f"duplicate JSON key: {key!r}")
        result[key] = value
    return result


def _reject_constant(value: str) -> None:
    raise WaveControlError(f"non-finite JSON number is forbidden: {value}")


def _strict_json(raw: bytes, *, label: str, max_bytes: int) -> dict[str, Any]:
    if type(raw) is not bytes:
        raise WaveControlError(f"{label} must be exact builtin bytes")
    if not raw or len(raw) > max_bytes:
        raise WaveControlError(f"{label} has invalid byte length")
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as error:
        raise WaveControlError(f"{label} is not UTF-8") from error
    try:
        value = json.loads(
            text,
            object_pairs_hook=_duplicate_rejecting_object,
            parse_constant=_reject_constant,
        )
    except (json.JSONDecodeError, TypeError) as error:
        raise WaveControlError(f"{label} is not strict JSON") from error
    if type(value) is not dict:
        raise WaveControlError(f"{label} must be a JSON object")
    if raw != canonical_json_bytes(value):
        raise WaveControlError(f"{label} must use canonical compact JSON bytes")
    return value


def _exact_keys(value: dict[str, Any], expected: frozenset[str], label: str) -> None:
    keys = frozenset(value)
    if keys != expected:
        raise WaveControlError(
            f"{label} has inexact keys; missing={sorted(expected - keys)!r} "
            f"extra={sorted(keys - expected)!r}"
        )


def _string(value: Any, label: str) -> str:
    if type(value) is not str or not value or value != value.strip():
        raise WaveControlError(f"{label} must be a nonempty exact builtin string")
    return value


def _sha256(value: Any, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(char not in _HEX for char in value)
    ):
        raise WaveControlError(f"{label} must be lowercase 64-hex")
    return value


def _relative_path(value: Any, label: str) -> str:
    path = _string(value, label)
    if "\\" in path:
        raise WaveControlError(f"{label} must use POSIX separators")
    pure = PurePosixPath(path)
    if (
        pure.is_absolute()
        or str(pure) != path
        or any(part in {".", ".."} for part in pure.parts)
    ):
        raise WaveControlError(f"{label} must be a normalized safe relative path")
    return path


def _positive_int(value: Any, label: str) -> int:
    if type(value) is not int or value <= 0:
        raise WaveControlError(f"{label} must be a positive builtin int")
    return value


def _reference(value: Any, label: str, *, maximum_bytes: int) -> ArtifactReference:
    if type(value) is not dict:
        raise WaveControlError(f"{label} must be an exact object")
    _exact_keys(value, _REF_KEYS, label)
    max_bytes = _positive_int(value["max_bytes"], f"{label}.max_bytes")
    if max_bytes > maximum_bytes:
        raise WaveControlError(f"{label}.max_bytes exceeds its registered limit")
    return ArtifactReference(
        path=_relative_path(value["path"], f"{label}.path"),
        sha256=_sha256(value["sha256"], f"{label}.sha256"),
        max_bytes=max_bytes,
    )


def _semantic_artifact_references(
    value: Any,
) -> tuple[tuple[str, ArtifactReference], ...]:
    if type(value) is not dict or not value:
        raise WaveControlError(
            "wave control.semantic_artifacts must be a nonempty exact object"
        )
    rows: list[tuple[str, ArtifactReference]] = []
    for role, reference in value.items():
        if type(role) is not str or not role or not role.isascii():
            raise WaveControlError(
                "wave control.semantic_artifacts roles must be nonempty ASCII strings"
            )
        rows.append(
            (
                role,
                _reference(
                    reference,
                    f"wave control.semantic_artifacts.{role}",
                    maximum_bytes=MAX_SEMANTIC_ARTIFACT_BYTES,
                ),
            )
        )
    if [role for role, _ in rows] != sorted(role for role, _ in rows):
        raise WaveControlError(
            "wave control.semantic_artifacts roles must be canonically sorted"
        )
    return tuple(rows)


def _policy(value: Any) -> DriverPolicy:
    if type(value) is not dict:
        raise WaveControlError("driver_policy must be an exact object")
    keys = frozenset(value)
    if not (_POLICY_KEYS <= keys <= _POLICY_KEYS | _POLICY_OPTIONAL_KEYS):
        raise WaveControlError("driver_policy has inexact keys")
    for field in (
        "max_prepare_attempts",
        "max_confirm_attempts",
        "max_polls",
        "max_result_attempts",
        "solver_timeout_s",
        "march_timeout_s",
    ):
        if type(value[field]) is not int:
            raise WaveControlError(f"driver_policy.{field} must be a builtin int")
    interval = value["poll_interval_s"]
    if type(interval) not in {int, float} or not math.isfinite(interval):
        raise WaveControlError("driver_policy.poll_interval_s must be finite numeric")
    if type(value["project"]) is not str:
        raise WaveControlError("driver_policy.project must be a builtin string")
    if (
        "requested_core_limit" in value
        and type(value["requested_core_limit"]) is not int
    ):
        raise WaveControlError(
            "driver_policy.requested_core_limit must be a builtin int"
        )
    try:
        policy = DriverPolicy(**value)
    except (PiqdDriverError, TypeError) as error:
        raise WaveControlError(
            "driver_policy violates the PIQD driver contract"
        ) from error
    if policy.as_dict() != value:
        raise WaveControlError("driver_policy is not represented canonically")
    return policy


def load_wave_control(raw: bytes) -> WaveControl:
    """Parse one canonical control record against the closed adapter registry."""

    value = _strict_json(raw, label="wave control", max_bytes=MAX_CONTROL_BYTES)
    schema = value.get("schema")
    if schema == CONTROL_SCHEMA_V1:
        _exact_keys(value, _CONTROL_KEYS_V1, "wave control")
    elif schema == CONTROL_SCHEMA_V2:
        _exact_keys(value, _CONTROL_KEYS_V2, "wave control")
    else:
        raise WaveControlError("wave control.schema is not registered")
    key = (
        _string(value["wave_kind"], "wave control.wave_kind"),
        _string(value["adapter_id"], "wave control.adapter_id"),
        _string(value["adapter_schema"], "wave control.adapter_schema"),
    )
    registration = STATIC_REGISTRY.get(key)
    if registration is None:
        raise WaveControlError("wave control selects an unregistered adapter")
    if value["semantic_validator"] != registration.semantic_validator:
        raise WaveControlError("wave control semantic validator is crossed")
    package = value["package"]
    if type(package) is not dict:
        raise WaveControlError("wave control.package must be an exact object")
    _exact_keys(package, _PACKAGE_KEYS, "wave control.package")
    return WaveControl(
        value=value,
        manifest=_reference(
            value["wave_manifest"],
            "wave control.wave_manifest",
            maximum_bytes=MAX_WAVE_MANIFEST_BYTES,
        ),
        cnf=_reference(
            package["cnf"],
            "wave control.package.cnf",
            maximum_bytes=MAX_STATIC_CNF_BYTES,
        ),
        producer_manifest=_reference(
            package["producer_manifest"],
            "wave control.package.producer_manifest",
            maximum_bytes=MAX_PRODUCER_MANIFEST_BYTES,
        ),
        variable_map=_reference(
            package["variable_map"],
            "wave control.package.variable_map",
            maximum_bytes=MAX_VARIABLE_MAP_BYTES,
        ),
        policy=_policy(value["driver_policy"]),
        registration=registration,
        canonical_bytes=raw,
        semantic_profile=(
            _reference(
                value["semantic_profile"],
                "wave control.semantic_profile",
                maximum_bytes=MAX_SEMANTIC_PROFILE_BYTES,
            )
            if schema == CONTROL_SCHEMA_V2
            else None
        ),
        semantic_artifacts=(
            _semantic_artifact_references(value["semantic_artifacts"])
            if schema == CONTROL_SCHEMA_V2
            else ()
        ),
    )


def _capture(root: Path, reference: ArtifactReference, label: str) -> bytes:
    try:
        captured = capture_exact_regular_file(
            root / reference.path,
            max_bytes=reference.max_bytes,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=True,
            label=label,
        )
    except ExactFileCaptureError as error:
        raise WaveControlError(f"{label} capture failed") from error
    if captured.sha256 != reference.sha256 or captured.data is None:
        raise WaveControlError(f"{label} digest is crossed")
    return captured.data


def _strict_dimacs_counts(raw: bytes) -> tuple[int, int]:
    try:
        text = raw.decode("ascii")
    except UnicodeDecodeError as error:
        raise WaveControlError("CNF must be ASCII DIMACS") from error
    header: tuple[int, int] | None = None
    clause_count = 0
    pending_clause = False
    for line_number, line in enumerate(text.splitlines(), 1):
        tokens = line.split()
        if not tokens:
            continue
        if tokens[0] == "c":
            if pending_clause:
                raise WaveControlError("CNF comment interrupts a clause")
            continue
        if tokens[0] == "p":
            if (
                header is not None
                or pending_clause
                or tokens[:2] != ["p", "cnf"]
                or len(tokens) != 4
            ):
                raise WaveControlError("CNF has an invalid or repeated header")
            try:
                num_variables = int(tokens[2])
                num_clauses = int(tokens[3])
            except ValueError as error:
                raise WaveControlError(
                    "CNF header counts are not decimal integers"
                ) from error
            if (
                num_variables < 0
                or num_clauses < 0
                or tokens[2] != str(num_variables)
                or tokens[3] != str(num_clauses)
            ):
                raise WaveControlError(
                    "CNF header counts are not canonical nonnegative integers"
                )
            header = (num_variables, num_clauses)
            continue
        if header is None:
            raise WaveControlError(
                f"CNF clause precedes the header at line {line_number}"
            )
        for token in tokens:
            try:
                literal = int(token)
            except ValueError as error:
                raise WaveControlError(
                    "CNF clause contains a noninteger token"
                ) from error
            if token != str(literal):
                raise WaveControlError("CNF clause integer is not canonical")
            if literal == 0:
                clause_count += 1
                pending_clause = False
            else:
                if abs(literal) > header[0]:
                    raise WaveControlError(
                        "CNF literal exceeds the declared variable range"
                    )
                pending_clause = True
    if header is None:
        raise WaveControlError("CNF is missing its header")
    if pending_clause:
        raise WaveControlError("CNF has an unterminated clause")
    if clause_count != header[1]:
        raise WaveControlError("CNF clause count differs from its header")
    return header


def _validate_static_cnf_semantics(
    registration: AdapterRegistration,
    manifest: dict[str, Any],
    cnf: bytes,
    producer: bytes,
    variable_map: bytes,
) -> None:
    if registration.semantic_validator not in {
        STATIC_CNF_SEMANTIC_VALIDATOR_V1,
        STATIC_CNF_SEMANTIC_VALIDATOR_V2,
    }:
        raise WaveControlError("registered semantic validator is not executable")
    num_variables, num_clauses = _strict_dimacs_counts(cnf)
    encoding = manifest["encoding"]
    if (num_variables, num_clauses) != (
        encoding["num_variables"],
        encoding["num_clauses"],
    ):
        raise WaveControlError("CNF counts are crossed with the wave manifest")
    _strict_json(
        producer,
        label="producer manifest",
        max_bytes=MAX_PRODUCER_MANIFEST_BYTES,
    )
    _strict_json(
        variable_map,
        label="variable map",
        max_bytes=MAX_VARIABLE_MAP_BYTES,
    )


def bind_static_cnf(control: WaveControl, package_root: Path) -> StaticCnfBinding:
    """Bind a validated static-CNF control without execution or filesystem mutation."""

    if type(control) is not WaveControl:
        raise WaveControlError("control must be an exact WaveControl")
    if type(package_root) is not _NATIVE_PATH_TYPE:
        raise WaveControlError("package_root must be an exact native Path")
    if not package_root.is_absolute():
        raise WaveControlError("package_root must be absolute")
    if type(control.canonical_bytes) is not bytes:
        raise WaveControlError("control canonical bytes must be exact builtin bytes")
    validated_control = load_wave_control(control.canonical_bytes)
    if control != validated_control:
        raise WaveControlError(
            "control object differs from its canonical validated value"
        )
    control = validated_control
    manifest_bytes = _capture(package_root, control.manifest, "wave manifest")
    manifest = _strict_json(
        manifest_bytes,
        label="wave manifest",
        max_bytes=control.manifest.max_bytes,
    )
    try:
        validate_wave_manifest(manifest)
    except ValueError as error:
        raise WaveControlError("wave manifest violates p97-cegar-wave/v1") from error
    if wave_manifest_sha256(manifest) != control.manifest.sha256:
        raise WaveControlError("wave manifest object hash is crossed")
    cnf = _capture(package_root, control.cnf, "CNF")
    producer = _capture(package_root, control.producer_manifest, "producer manifest")
    variable_map = _capture(package_root, control.variable_map, "variable map")
    semantic_profile_bytes = (
        _capture(package_root, control.semantic_profile, "semantic profile")
        if control.semantic_profile is not None
        else None
    )
    try:
        semantic_profile = (
            parse_profile_bytes(semantic_profile_bytes)
            if semantic_profile_bytes is not None
            else None
        )
    except SemanticProfileError as error:
        raise WaveControlError("semantic profile validation failed") from error
    semantic_artifacts = tuple(
        (
            role,
            CapturedBytes(
                _capture(package_root, reference, f"semantic artifact {role}"),
                path=package_root / reference.path,
                sha256=reference.sha256,
            ),
        )
        for role, reference in control.semantic_artifacts
    )
    encoding = manifest["encoding"]
    if encoding["cnf_sha256"] != control.cnf.sha256:
        raise WaveControlError("wave manifest CNF digest is crossed")
    if encoding["producer_manifest_sha256"] != control.producer_manifest.sha256:
        raise WaveControlError("wave manifest producer digest is crossed")
    if encoding["variable_map_sha256"] != control.variable_map.sha256:
        raise WaveControlError("wave manifest variable-map digest is crossed")
    _validate_static_cnf_semantics(
        control.registration,
        manifest,
        cnf,
        producer,
        variable_map,
    )
    if control.registration.schema_version == STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2:
        if semantic_profile is None:
            raise WaveControlError("v2 static-CNF control lacks a semantic profile")
        if not semantic_artifacts:
            raise WaveControlError("v2 static-CNF control lacks semantic artifacts")
        expected_profile_control = {
            "domain_kind": STATIC_CNF,
            "query_polarity": encoding["query_polarity"],
            "cnf_sha256": control.cnf.sha256,
            "variables": encoding["num_variables"],
            "clauses": encoding["num_clauses"],
        }
        if semantic_profile.control != expected_profile_control:
            raise WaveControlError("semantic profile is crossed with the static CNF")
        try:
            semantic_validation = validate_semantic_profile(
                semantic_profile,
                dict(semantic_artifacts),
                control=expected_profile_control,
            )
        except SemanticProfileError as error:
            raise WaveControlError("semantic artifact validation failed") from error
    elif semantic_profile is not None or semantic_artifacts:
        raise WaveControlError(
            "v1 static-CNF control cannot carry semantic profile artifacts"
        )
    else:
        semantic_validation = None
    return StaticCnfBinding(
        control=control,
        wave_manifest=manifest,
        wave_manifest_bytes=manifest_bytes,
        cnf=cnf,
        producer_manifest=producer,
        variable_map=variable_map,
        semantic_profile=semantic_profile,
        semantic_profile_bytes=semantic_profile_bytes,
        semantic_artifacts=semantic_artifacts,
        semantic_validation=semantic_validation,
    )


def _string_list(value: Any, label: str) -> list[str]:
    if type(value) is not list:
        raise WaveControlError(f"{label} must be an exact list")
    result = [_relative_path(item, f"{label}[]") for item in value]
    if result != sorted(set(result)):
        raise WaveControlError(f"{label} must be sorted and duplicate-free")
    return result


def _optional_pointer(value: Any, label: str) -> dict[str, str] | None:
    if value is None:
        return None
    if type(value) is not dict:
        raise WaveControlError(f"{label} must be null or an exact object")
    _exact_keys(value, _POINTER_KEYS, label)
    return {
        "path": _relative_path(value["path"], f"{label}.path"),
        "sha256": _sha256(value["sha256"], f"{label}.sha256"),
    }


def _replay(value: Any, label: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise WaveControlError(f"{label} must be an exact object")
    _exact_keys(value, _REPLAY_KEYS, label)
    status = _string(value["status"], f"{label}.status")
    if status not in _REPLAY_STATES:
        raise WaveControlError(f"{label}.status is unknown")
    receipt = _optional_pointer(value["receipt"], f"{label}.receipt")
    if status == PASS and receipt is None:
        raise WaveControlError(f"{label}.receipt is required for PASS")
    return {"status": status, "receipt": receipt}


def load_entrypoint_inventory(raw: bytes) -> dict[str, Any]:
    """Parse the exact deterministic inventory consumed by the cleanup planner."""

    value = _strict_json(
        raw, label="entrypoint inventory", max_bytes=MAX_INVENTORY_BYTES
    )
    _exact_keys(value, _INVENTORY_KEYS, "entrypoint inventory")
    if value["schema"] != INVENTORY_SCHEMA:
        raise WaveControlError(f"inventory.schema must be {INVENTORY_SCHEMA!r}")
    entries = value["entries"]
    if type(entries) is not list:
        raise WaveControlError("inventory.entries must be an exact list")
    normalized: list[dict[str, Any]] = []
    for index, entry in enumerate(entries):
        label = f"inventory.entries[{index}]"
        if type(entry) is not dict:
            raise WaveControlError(f"{label} must be an exact object")
        _exact_keys(entry, _ENTRY_KEYS, label)
        kind = _string(entry["kind"], f"{label}.kind")
        lifecycle = _string(entry["lifecycle"], f"{label}.lifecycle")
        if kind not in _KINDS:
            raise WaveControlError(f"{label}.kind is unknown")
        if lifecycle not in _LIFECYCLES:
            raise WaveControlError(f"{label}.lifecycle is unknown")
        replacement = _optional_pointer(entry["replacement"], f"{label}.replacement")
        shadow = _replay(entry["shadow_replay"], f"{label}.shadow_replay")
        historical = _replay(entry["historical_replay"], f"{label}.historical_replay")
        if (
            type(entry["active_writer"]) is not bool
            or type(entry["cleanup_approved"]) is not bool
        ):
            raise WaveControlError(
                f"{label} boolean fields must be exact builtin bools"
            )
        normalized.append(
            {
                "path": _relative_path(entry["path"], f"{label}.path"),
                "sha256": _sha256(entry["sha256"], f"{label}.sha256"),
                "wave_id": _string(entry["wave_id"], f"{label}.wave_id"),
                "kind": kind,
                "lifecycle": lifecycle,
                "replacement": replacement,
                "runtime_callers": _string_list(
                    entry["runtime_callers"], f"{label}.runtime_callers"
                ),
                "active_manifest_references": _string_list(
                    entry["active_manifest_references"],
                    f"{label}.active_manifest_references",
                ),
                "static_callers": _string_list(
                    entry["static_callers"], f"{label}.static_callers"
                ),
                "receipt_paths": _string_list(
                    entry["receipt_paths"], f"{label}.receipt_paths"
                ),
                "artifact_paths": _string_list(
                    entry["artifact_paths"], f"{label}.artifact_paths"
                ),
                "archive_manifest": _optional_pointer(
                    entry["archive_manifest"], f"{label}.archive_manifest"
                ),
                "rollback_pointer": _optional_pointer(
                    entry["rollback_pointer"], f"{label}.rollback_pointer"
                ),
                "shadow_replay": shadow,
                "historical_replay": historical,
                "active_writer": entry["active_writer"],
                "cleanup_approved": entry["cleanup_approved"],
            }
        )
    if [entry["path"] for entry in normalized] != sorted(
        {entry["path"] for entry in normalized}
    ):
        raise WaveControlError("inventory entries must be path-sorted and unique")
    result = {"schema": INVENTORY_SCHEMA, "entries": normalized}
    if canonical_json_bytes(result) != raw:
        raise WaveControlError("inventory normalization changed its canonical bytes")
    return result


def _capture_pointer(repo_root: Path, pointer: dict[str, str], label: str) -> bool:
    try:
        captured = capture_exact_regular_file(
            repo_root / pointer["path"],
            max_bytes=MAX_INVENTORY_BYTES,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=False,
            label=label,
        )
    except ExactFileCaptureError:
        return False
    return captured.sha256 == pointer["sha256"]


def _trusted_entrypoints(value: Any) -> dict[str, str]:
    if type(value) is not dict:
        raise WaveControlError("approved_entrypoints must be an exact builtin dict")
    normalized = {
        _relative_path(path, "approved_entrypoints path"): _sha256(
            digest, "approved_entrypoints digest"
        )
        for path, digest in value.items()
    }
    if list(value) != sorted(value):
        raise WaveControlError("approved_entrypoints must be path-sorted")
    return normalized


def _protected_inventory_paths(entries: list[dict[str, Any]]) -> frozenset[str]:
    protected: set[str] = set()
    for entry in entries:
        if entry["kind"] != ENTRYPOINT or entry["lifecycle"] != COMPATIBILITY_SHIM:
            protected.add(entry["path"])
        for field in (
            "runtime_callers",
            "active_manifest_references",
            "static_callers",
            "receipt_paths",
            "artifact_paths",
        ):
            protected.update(entry[field])
        for pointer in (
            entry["replacement"],
            entry["archive_manifest"],
            entry["rollback_pointer"],
            entry["shadow_replay"]["receipt"],
            entry["historical_replay"]["receipt"],
        ):
            if pointer is not None:
                protected.add(pointer["path"])
    return frozenset(protected)


def build_cleanup_plan(
    inventory_raw: bytes,
    repo_root: Path,
    *,
    expected_inventory_sha256: str,
    approved_entrypoints: dict[str, str],
) -> dict[str, Any]:
    """Authenticate and plan safe shim retirement without changing the filesystem."""

    expected_digest = _sha256(expected_inventory_sha256, "expected inventory SHA256")
    if sha256_bytes(inventory_raw) != expected_digest:
        raise WaveControlError(
            "entrypoint inventory digest is not externally authenticated"
        )
    trusted = _trusted_entrypoints(approved_entrypoints)
    inventory = load_entrypoint_inventory(inventory_raw)
    repo_root = _require_canonical_repo_root(repo_root)
    targets: list[dict[str, Any]] = []
    blocked: list[dict[str, Any]] = []
    protected_paths = _protected_inventory_paths(inventory["entries"])
    for entry in inventory["entries"]:
        reasons: list[str] = []
        if entry["kind"] != ENTRYPOINT:
            reasons.append("not-an-entrypoint")
        if entry["lifecycle"] != COMPATIBILITY_SHIM:
            reasons.append("lifecycle-not-compatibility-shim")
        if entry["replacement"] is None:
            reasons.append("missing-replacement")
        elif entry["replacement"]["path"] == entry["path"]:
            reasons.append("replacement-is-target")
        trusted_digest = trusted.get(entry["path"])
        if trusted_digest is None:
            reasons.append("target-not-in-trusted-allowlist")
        elif trusted_digest != entry["sha256"]:
            reasons.append("target-trusted-digest-crossed")
        if entry["path"] in protected_paths:
            reasons.append("target-aliases-protected-evidence")
        if reasons:
            blocked.append({"path": entry["path"], "reasons": sorted(reasons)})
            continue
        for field in (
            "runtime_callers",
            "active_manifest_references",
            "static_callers",
        ):
            if entry[field]:
                reasons.append(f"nonempty-{field.replace('_', '-')}")
        if entry["shadow_replay"]["status"] != PASS:
            reasons.append("shadow-replay-not-pass")
        if entry["historical_replay"]["status"] != PASS:
            reasons.append("historical-replay-not-pass")
        if entry["active_writer"]:
            reasons.append("active-writer")
        if not entry["cleanup_approved"]:
            reasons.append("cleanup-not-approved")
        archive = entry["archive_manifest"]
        rollback = entry["rollback_pointer"]
        shadow_receipt = entry["shadow_replay"]["receipt"]
        historical_receipt = entry["historical_replay"]["receipt"]
        if archive is None:
            reasons.append("missing-archive-manifest")
        if rollback is None:
            reasons.append("missing-rollback-pointer")
        if reasons:
            blocked.append({"path": entry["path"], "reasons": sorted(reasons)})
            continue
        assert archive is not None
        assert rollback is not None
        assert entry["replacement"] is not None
        assert shadow_receipt is not None
        assert historical_receipt is not None
        if not _capture_pointer(
            repo_root, entry["replacement"], "replacement entrypoint"
        ):
            reasons.append("replacement-authentication-failed")
        if not _capture_pointer(repo_root, shadow_receipt, "shadow replay receipt"):
            reasons.append("shadow-replay-receipt-authentication-failed")
        if not _capture_pointer(
            repo_root, historical_receipt, "historical replay receipt"
        ):
            reasons.append("historical-replay-receipt-authentication-failed")
        if not _capture_pointer(repo_root, archive, "archive manifest"):
            reasons.append("archive-manifest-authentication-failed")
        if not _capture_pointer(repo_root, rollback, "rollback pointer"):
            reasons.append("rollback-pointer-authentication-failed")
        try:
            current = capture_exact_regular_file(
                repo_root / entry["path"],
                max_bytes=MAX_ENTRYPOINT_BYTES,
                require_nonempty=True,
                require_single_link=True,
                keep_bytes=False,
                label="cleanup candidate",
            )
        except ExactFileCaptureError:
            reasons.append("target-authentication-failed")
        else:
            if current.sha256 != entry["sha256"]:
                reasons.append("target-digest-crossed")
        if reasons:
            blocked.append({"path": entry["path"], "reasons": sorted(reasons)})
        else:
            targets.append(
                {
                    "path": entry["path"],
                    "sha256": entry["sha256"],
                    "replacement": entry["replacement"],
                    "shadow_replay_receipt": shadow_receipt,
                    "historical_replay_receipt": historical_receipt,
                    "archive_manifest": archive,
                    "rollback_pointer": rollback,
                    "preserved_receipt_paths": entry["receipt_paths"],
                    "preserved_artifact_paths": entry["artifact_paths"],
                }
            )
    return {
        "schema": CLEANUP_PLAN_SCHEMA,
        "inventory_sha256": expected_digest,
        "approved_entrypoints_sha256": sha256_bytes(canonical_json_bytes(trusted)),
        "targets": targets,
        "blocked": blocked,
        "claims": {
            "dry_run_only": True,
            "filesystem_mutation": False,
            "protected_artifacts_deleted": False,
        },
    }
