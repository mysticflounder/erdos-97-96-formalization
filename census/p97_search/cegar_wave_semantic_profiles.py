"""Offline semantic profiles for shared static-CNF wave validation.

The profile is a small, canonical control record.  It describes a finite,
offline check and selects a validator from a closed registry; it never names a
Python import or a callable.  Validators consume captured bytes, so they do
not reopen legacy paths or invoke the Child40 exporter/runner.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from .phase3_cegar_wave import canonical_json_bytes

PROFILE_SCHEMA = "p97-static-cnf-semantic-profile/v1"
EXACT17_CHILD40 = "exact17-child40"
FINITE_SCOPE = "finite"
OFFLINE_MODE = "offline"
RETAIN = "RETAIN"
PASS = "PASS"
_HEX = re.compile(r"^[0-9a-f]{64}$")
_NATIVE_PATH = type(Path())

_PROFILE_KEYS = frozenset(
    {
        "schema",
        "profile_id",
        "validator",
        "classification",
        "control",
        "cleanup",
        "contract",
    }
)
_CLASSIFICATION_KEYS = frozenset({"scope", "mode"})
_CONTROL_KEYS = frozenset(
    {"domain_kind", "query_polarity", "cnf_sha256", "variables", "clauses"}
)
_CLEANUP_KEYS = frozenset({"cleanup_eligible", "lifecycle"})
_METADATA_KEYS = frozenset(
    {"schema", "profile_id", "validator", "classification", "cleanup"}
)
_PROFILE_IDS = frozenset({"exact17-child40"})
_CONTRACT_KEYS = frozenset(
    {"parent", "child", "model", "ordered_suffix_sha256", "schemas", "artifact_roles"}
)
_DIMACS_KEYS = frozenset({"sha256", "variables", "clauses"})
_MODEL_KEYS = frozenset({"sha256", "job_id"})
_SCHEMA_KEYS = frozenset({"model", "receipt", "ingress"})
_REQUIRED_CHILD40_ARTIFACTS = frozenset(
    {
        "parent_cnf",
        "child_cnf",
        "model",
        "export_receipt",
        "parent_manifest",
        "ingress_manifest",
        "daemon_build_receipt",
        "lean_root",
        "lean_export",
    }
)


class SemanticProfileError(ValueError):
    """A profile, control binding, or captured artifact failed closed."""


class CaptureLike(Protocol):
    """The part of ``ExactFileCapture`` needed by this offline validator."""

    data: bytes | None
    sha256: str
    byte_count: int


@dataclass(frozen=True)
class CapturedBytes:
    """Captured bytes plus an optional exact native path reference."""

    data: bytes
    path: Path | None = None
    sha256: str | None = None

    def __post_init__(self) -> None:
        if type(self.data) is not bytes:
            raise SemanticProfileError("captured data must be builtin bytes")
        digest = hashlib.sha256(self.data).hexdigest()
        if self.sha256 is not None and self.sha256 != digest:
            raise SemanticProfileError("captured SHA-256 does not match captured bytes")
        if self.path is not None:
            _absolute_native_path(self.path, "captured path")

    @property
    def digest(self) -> str:
        return hashlib.sha256(self.data).hexdigest()


@dataclass(frozen=True)
class SemanticProfile:
    """Validated immutable profile payload."""

    payload: dict[str, Any]

    @property
    def validator(self) -> str:
        return self.payload["validator"]

    @property
    def control(self) -> dict[str, Any]:
        return self.payload["control"]


def _fail(message: str) -> None:
    raise SemanticProfileError(message)


def _exact_keys(value: object, expected: frozenset[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        _fail(f"{label} keys drifted")
    return value


def _string(value: object, label: str) -> str:
    if type(value) is not str or not value:
        _fail(f"{label} must be a nonempty string")
    return value


def _sha(value: object, label: str) -> str:
    if type(value) is not str or _HEX.fullmatch(value) is None:
        _fail(f"{label} must be a lowercase SHA-256")
    return value


def _count(value: object, label: str) -> int:
    if type(value) is not int or value < 0:
        _fail(f"{label} must be a nonnegative builtin int")
    return value


def _absolute_native_path(value: object, label: str) -> Path:
    if type(value) is not _NATIVE_PATH or not value.is_absolute():
        _fail(f"{label} must be an absolute native Path")
    normalized = Path(os.path.normpath(os.fspath(value)))
    if normalized != value:
        _fail(f"{label} is not normalized")
    return value


def validate_profile_payload(payload: Mapping[str, Any]) -> SemanticProfile:
    """Validate the strict profile object without touching the filesystem."""

    profile = _exact_keys(payload, _PROFILE_KEYS, "profile")
    if profile["schema"] != PROFILE_SCHEMA:
        _fail(f"profile.schema must be {PROFILE_SCHEMA!r}")
    profile_id = _string(profile["profile_id"], "profile.profile_id")
    if profile_id not in _PROFILE_IDS:
        _fail(f"unknown semantic profile id: {profile_id}")
    validator = _string(profile["validator"], "profile.validator")
    if validator != EXACT17_CHILD40:
        _fail(f"unknown semantic-profile validator: {validator}")

    classification = _exact_keys(
        profile["classification"], _CLASSIFICATION_KEYS, "classification"
    )
    if classification != {"scope": FINITE_SCOPE, "mode": OFFLINE_MODE}:
        _fail("profile must remain finite/offline")

    control = _exact_keys(profile["control"], _CONTROL_KEYS, "control")
    if (
        control["domain_kind"] != "STATIC_CNF"
        or control["query_polarity"] != "SAT_MEANS_COUNTEREXAMPLE"
    ):
        _fail("profile control is not the closed static-CNF binding")
    _sha(control["cnf_sha256"], "control.cnf_sha256")
    variables = _count(control["variables"], "control.variables")
    clauses = _count(control["clauses"], "control.clauses")
    if variables == 0 or clauses == 0:
        _fail("control dimensions must be positive")

    cleanup = _exact_keys(profile["cleanup"], _CLEANUP_KEYS, "cleanup")
    if cleanup != {"cleanup_eligible": False, "lifecycle": RETAIN}:
        _fail("semantic profiles must remain RETAIN and cleanup-ineligible")

    contract = _exact_keys(profile["contract"], _CONTRACT_KEYS, "contract")
    parent = _exact_keys(contract["parent"], _DIMACS_KEYS, "contract.parent")
    child = _exact_keys(contract["child"], _DIMACS_KEYS, "contract.child")
    model = _exact_keys(contract["model"], _MODEL_KEYS, "contract.model")
    for label, row in (("parent", parent), ("child", child)):
        _sha(row["sha256"], f"contract.{label}.sha256")
        _count(row["variables"], f"contract.{label}.variables")
        _count(row["clauses"], f"contract.{label}.clauses")
    _sha(model["sha256"], "contract.model.sha256")
    _string(model["job_id"], "contract.model.job_id")
    _sha(contract["ordered_suffix_sha256"], "contract.ordered_suffix_sha256")
    schemas = _exact_keys(contract["schemas"], _SCHEMA_KEYS, "contract.schemas")
    for key, value in schemas.items():
        _string(value, f"contract.schemas.{key}")
    roles = contract["artifact_roles"]
    if (
        type(roles) is not list
        or not roles
        or any(type(role) is not str for role in roles)
    ):
        _fail("contract.artifact_roles must be a nonempty string list")
    if len(set(roles)) != len(roles) or set(roles) != _REQUIRED_CHILD40_ARTIFACTS:
        _fail("Child40 artifact role inventory is not the exact authenticated set")
    if (
        parent["variables"] != child["variables"]
        or child["clauses"] < parent["clauses"]
    ):
        _fail("Child40 dimensions are inconsistent")
    if (
        control["cnf_sha256"] != child["sha256"]
        or control["variables"] != child["variables"]
        or control["clauses"] != child["clauses"]
    ):
        _fail("control is not bound to the Child40 CNF")
    return SemanticProfile(dict(profile))


def validate_profile_metadata(metadata: Mapping[str, Any]) -> dict[str, Any]:
    """Validate the self-contained profile summary sealed in a v2 envelope."""

    value = _exact_keys(metadata, _METADATA_KEYS, "profile metadata")
    if value["schema"] != PROFILE_SCHEMA:
        _fail("profile metadata schema drifted")
    profile_id = _string(value["profile_id"], "profile metadata.profile_id")
    if profile_id not in _PROFILE_IDS:
        _fail(f"unknown semantic profile id: {profile_id}")
    if value["validator"] != EXACT17_CHILD40:
        _fail("profile metadata validator drifted")
    classification = _exact_keys(
        value["classification"], _CLASSIFICATION_KEYS, "profile metadata classification"
    )
    if classification != {"scope": FINITE_SCOPE, "mode": OFFLINE_MODE}:
        _fail("profile metadata must remain finite/offline")
    cleanup = _exact_keys(value["cleanup"], _CLEANUP_KEYS, "profile metadata cleanup")
    if cleanup != {"cleanup_eligible": False, "lifecycle": RETAIN}:
        _fail("profile metadata must remain RETAIN and cleanup-ineligible")
    return json.loads(canonical_json_bytes(value))


def parse_profile_bytes(data: bytes) -> SemanticProfile:
    """Parse one strict canonical profile encoding."""

    if type(data) is not bytes:
        _fail("profile bytes must be builtin bytes")

    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                _fail(f"profile has duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            data,
            object_pairs_hook=pairs,
            parse_constant=lambda value: _fail(f"non-finite JSON value: {value}"),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        _fail(f"profile is not strict JSON: {error}")
    if type(value) is not dict or data != canonical_json_bytes(value):
        _fail("profile is not canonical JSON")
    return validate_profile_payload(value)


def _captured(value: CapturedBytes | bytes | CaptureLike, label: str) -> CapturedBytes:
    if type(value) is bytes:
        return CapturedBytes(value)
    if isinstance(value, CapturedBytes):
        return value
    data = getattr(value, "data", None)
    digest = getattr(value, "sha256", None)
    size = getattr(value, "byte_count", None)
    if type(data) is not bytes or type(digest) is not str or type(size) is not int:
        _fail(f"{label} is not a captured-bytes interface")
    if size != len(data) or digest != hashlib.sha256(data).hexdigest():
        _fail(f"{label} capture identity does not match bytes")
    path = getattr(value, "path", None)
    if path is not None and type(path) is not _NATIVE_PATH:
        _fail(f"{label}.path must be an exact native Path or None")
    return CapturedBytes(data, path, digest)


def _json_capture(capture: CapturedBytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            capture.data,
            object_pairs_hook=lambda pairs: _object_pairs(pairs, label),
            parse_constant=lambda constant: _fail(
                f"{label} has a non-finite JSON value"
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        _fail(f"{label} is not strict JSON: {error}")
    if type(value) is not dict:
        _fail(f"{label} is not a JSON object")
    legacy_pretty = (
        json.dumps(
            value,
            sort_keys=True,
            indent=2,
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
        + b"\n"
    )
    if capture.data not in {canonical_json_bytes(value), legacy_pretty}:
        _fail(f"{label} is not an accepted canonical JSON serialization")
    return value


def _object_pairs(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, child in pairs:
        if key in value:
            _fail(f"{label} has duplicate JSON key: {key}")
        value[key] = child
    return value


def _path_record(
    value: object, capture: CapturedBytes, label: str, *, digest: str | None = None
) -> None:
    if type(value) is not dict or set(value) != {"path", "sha256"}:
        _fail(f"{label} is not an exact path/hash record")
    if capture.path is not None and value["path"] != str(capture.path):
        _fail(f"{label} path crossed the captured artifact")
    if value["sha256"] != (digest or capture.digest):
        _fail(f"{label} SHA-256 crossed the captured artifact")


def _dimacs(data: bytes, label: str) -> tuple[bytes, list[bytes], int, int]:
    lines = data.splitlines(keepends=True)
    if not lines or not lines[0].endswith(b"\n"):
        _fail(f"{label} has no bounded DIMACS header")
    fields = lines[0][:-1].decode("ascii", "strict").split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        _fail(f"{label} has a malformed DIMACS header")
    try:
        variables, clauses = int(fields[2]), int(fields[3])
    except ValueError:
        _fail(f"{label} has non-integer dimensions")
    if variables <= 0 or clauses <= 0 or len(lines[1:]) != clauses:
        _fail(f"{label} clause count drifted")
    for line in lines[1:]:
        tokens = line[:-1].split() if line.endswith(b"\n") else []
        if not tokens or tokens[-1] != b"0":
            _fail(f"{label} has a malformed clause")
        try:
            literals = [int(token) for token in tokens[:-1]]
        except ValueError:
            _fail(f"{label} has a non-integer literal")
        if any(literal == 0 or abs(literal) > variables for literal in literals):
            _fail(f"{label} has an out-of-range literal")
    return lines[0], lines[1:], variables, clauses


def _validate_control(
    profile: SemanticProfile, control: Mapping[str, Any] | None
) -> None:
    if control is None:
        return
    expected = profile.control
    if (
        type(control) is not dict
        or set(control) != _CONTROL_KEYS
        or dict(control) != expected
    ):
        _fail("generic control crossed semantic profile")


def _validate_child40(
    profile: SemanticProfile,
    artifacts: Mapping[str, CapturedBytes | bytes | CaptureLike],
) -> dict[str, Any]:
    if type(artifacts) is not dict:
        _fail("captured artifacts must be an exact builtin dict")
    contract = profile.payload["contract"]
    roles = set(contract["artifact_roles"])
    if set(artifacts) != roles:
        _fail("captured artifact inventory crossed the profile")
    captured = {role: _captured(value, role) for role, value in artifacts.items()}
    _parent_header, parent_lines, parent_vars, parent_clauses = _dimacs(
        captured["parent_cnf"].data, "parent CNF"
    )
    _child_header, child_lines, child_vars, child_clauses = _dimacs(
        captured["child_cnf"].data, "child CNF"
    )
    parent = contract["parent"]
    child = contract["child"]
    if (parent_vars, parent_clauses) != (parent["variables"], parent["clauses"]):
        _fail("parent dimensions crossed profile")
    if (child_vars, child_clauses) != (child["variables"], child["clauses"]):
        _fail("child dimensions crossed profile")
    if (
        captured["parent_cnf"].digest != parent["sha256"]
        or captured["child_cnf"].digest != child["sha256"]
    ):
        _fail("CNF digest crossed profile")
    if parent_lines != child_lines[:parent_clauses]:
        _fail("Child40 does not preserve the exact parent prefix")
    suffix = child_lines[parent_clauses:]
    if (
        hashlib.sha256(b"".join(suffix)).hexdigest()
        != contract["ordered_suffix_sha256"]
    ):
        _fail("Child40 ordered suffix crossed profile")

    model = _json_capture(captured["model"], "Child39 model")
    model_contract = contract["model"]
    if (
        model.get("schema") != contract["schemas"]["model"]
        or captured["model"].digest != model_contract["sha256"]
        or model.get("job_id") != model_contract["job_id"]
    ):
        _fail("Child39 model identity crossed profile")
    if model.get("cnf_sha256") != parent["sha256"] or model.get("replay") != {
        "clauses_checked": parent_clauses,
        "satisfies_all": True,
    }:
        _fail("Child39 model provenance drifted")
    nested = model.get("model")
    if (
        type(nested) is not dict
        or nested.get("backend") != "cadical"
        or nested.get("job_id") != model_contract["job_id"]
        or nested.get("solver_profile") != "sat"
        or nested.get("result") != "SAT"
        or nested.get("num_assigned") != parent_vars
    ):
        _fail("Child39 model result drifted")
    assignment = nested.get("assignment")
    if (
        type(assignment) is not list
        or len(assignment) != parent_vars
        or any(
            type(value) is not int or value == 0 or abs(value) > parent_vars
            for value in assignment
        )
        or {abs(value) for value in assignment} != set(range(1, parent_vars + 1))
    ):
        _fail("Child39 model assignment is not total")
    truth = {abs(value): value > 0 for value in assignment}
    for line in parent_lines:
        literals = [int(value) for value in line[:-1].split()[:-1]]
        if not any(truth[abs(value)] == (value > 0) for value in literals):
            _fail("Child39 model does not satisfy the parent CNF")

    receipt = _json_capture(captured["export_receipt"], "Child40 export receipt")
    if (
        set(receipt)
        != {
            "schema",
            "status",
            "publication_state",
            "parent",
            "model",
            "lean",
            "child",
            "validation",
            "immutability",
        }
        or receipt["schema"] != contract["schemas"]["receipt"]
        or receipt["status"] != PASS
        or receipt["publication_state"] != "PROVISIONED"
    ):
        _fail("Child40 export receipt schema/status drifted")
    _path_record(receipt["parent"], captured["parent_cnf"], "export parent")
    _path_record(receipt["model"], captured["model"], "export model")
    lean = receipt["lean"]
    if type(lean) is not dict or set(lean) != {"root", "export"}:
        _fail("Child40 Lean receipt shape drifted")
    _path_record(lean["root"], captured["lean_root"], "Lean root")
    _path_record(lean["export"], captured["lean_export"], "Lean export")
    if receipt["child"] != {
        "path": str(captured["child_cnf"].path),
        "sha256": child["sha256"],
        "bytes": len(captured["child_cnf"].data),
        "variables": child_vars,
        "clauses": child_clauses,
    }:
        _fail("Child40 receipt child identity drifted")
    receipt_validation = receipt["validation"]
    if (
        type(receipt_validation) is not dict
        or receipt_validation.get("schema")
        != "p97-exact17-child40-export-validation/v1"
        or receipt_validation.get("status") != PASS
        or receipt_validation.get("parent")
        != {"sha256": parent["sha256"], "clauses": parent_clauses}
        or receipt_validation.get("child")
        != {
            "sha256": child["sha256"],
            "bytes": len(captured["child_cnf"].data),
            "variables": child_vars,
            "clauses": child_clauses,
        }
        or receipt_validation.get("model")
        != {
            "sha256": model_contract["sha256"],
            "job_id": model_contract["job_id"],
            "parent_replay_exact": True,
        }
        or receipt_validation.get("ordered_suffix_sha256")
        != contract["ordered_suffix_sha256"]
        or receipt_validation.get("ordered_suffix_exact") is not True
    ):
        _fail("Child40 receipt validation drifted")
    if receipt["immutability"] != "exclusive-hard-link-and-ledger-last-receipt/v2":
        _fail("Child40 receipt immutability policy drifted")

    ingress = _json_capture(captured["ingress_manifest"], "Child40 ingress manifest")
    if (
        ingress.get("schema") != contract["schemas"]["ingress"]
        or ingress.get("status") != PASS
    ):
        _fail("Child40 ingress schema/status drifted")
    dimacs = ingress.get("dimacs")
    if (
        type(dimacs) is not dict
        or dimacs.get("path") != str(captured["child_cnf"].path)
        or dimacs.get("sha256") != child["sha256"]
        or dimacs.get("bytes") != len(captured["child_cnf"].data)
        or dimacs.get("variables") != child_vars
        or dimacs.get("clauses") != child_clauses
        or dimacs.get("parent_prefix_clauses") != parent_clauses
        or dimacs.get("checked_new_clauses") != child_clauses - parent_clauses
    ):
        _fail("Child40 ingress CNF binding drifted")
    parent_manifest = captured["parent_manifest"]
    parent_ingress = ingress.get("parent_ingress")
    if (
        type(parent_ingress) is not dict
        or parent_ingress.get("sha256") != parent_manifest.digest
        or parent_ingress.get("parent_dimacs_sha256") != parent["sha256"]
    ):
        _fail("Child39 parent ingress binding drifted")
    if (
        ingress.get("validation") != receipt_validation
        or ingress.get("lean") != receipt["lean"]
        or ingress.get("model") != receipt["model"]
    ):
        _fail("Child40 ingress evidence drifted from export receipt")
    export_ref = ingress.get("export_receipt")
    if (
        type(export_ref) is not dict
        or set(export_ref) != {"path", "sha256", "schema"}
        or export_ref["schema"] != contract["schemas"]["receipt"]
    ):
        _fail("ingress export receipt reference drifted")
    _path_record(
        {"path": export_ref["path"], "sha256": export_ref["sha256"]},
        captured["export_receipt"],
        "ingress export receipt",
    )
    piqd = ingress.get("piqd")
    if (
        type(piqd) is not dict
        or piqd.get("ingress") != "raw-dimacs/v1"
        or piqd.get("immutable_root_only") is not True
        or piqd.get("stale_job_reuse_allowed") is not False
        or piqd.get("python_authored_successor_clause_allowed") is not False
    ):
        _fail("Child40 PIQD ingress policy drifted")
    daemon_ref = piqd.get("daemon_build_receipt")
    _path_record(daemon_ref, captured["daemon_build_receipt"], "daemon build receipt")
    return {
        "status": PASS,
        "schema": PROFILE_SCHEMA,
        "validator": profile.validator,
        "classification": profile.payload["classification"],
        "cleanup": profile.payload["cleanup"],
        "cnf_sha256": child["sha256"],
        "variables": child_vars,
        "clauses": child_clauses,
    }


_VALIDATORS = {EXACT17_CHILD40: _validate_child40}


def validate_semantic_profile(
    profile: SemanticProfile | bytes | Mapping[str, Any],
    artifacts: Mapping[str, CapturedBytes | bytes | CaptureLike],
    *,
    control: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Validate one profile and captured artifact set entirely offline."""

    if isinstance(profile, SemanticProfile):
        validated = validate_profile_payload(profile.payload)
    elif type(profile) is bytes:
        validated = parse_profile_bytes(profile)
    elif isinstance(profile, Mapping):
        validated = validate_profile_payload(profile)
    else:
        _fail("profile must be canonical bytes, a mapping, or SemanticProfile")
    _validate_control(validated, control)
    validator = _VALIDATORS.get(validated.validator)
    if validator is None:
        _fail("semantic-profile validator is not registered")
    return validator(validated, artifacts)


__all__ = [
    "EXACT17_CHILD40",
    "FINITE_SCOPE",
    "OFFLINE_MODE",
    "PROFILE_SCHEMA",
    "RETAIN",
    "CapturedBytes",
    "SemanticProfile",
    "SemanticProfileError",
    "parse_profile_bytes",
    "validate_profile_metadata",
    "validate_profile_payload",
    "validate_semantic_profile",
]
