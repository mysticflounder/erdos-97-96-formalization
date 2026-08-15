"""Offline semantic profiles for shared static-CNF wave validation.

The profile is a small, canonical control record.  It describes a finite,
offline check and selects a validator from a closed registry; it never names a
Python import or a callable.  Validators consume captured bytes, so they do
not reopen legacy paths or invoke a wave-specific exporter/runner.
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
EXACT17_CHILD45 = "exact17-child45"
EXACT17_CHILD46 = "exact17-child46"
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
_PROFILE_VALIDATORS = {
    EXACT17_CHILD40: EXACT17_CHILD40,
    EXACT17_CHILD45: EXACT17_CHILD45,
    EXACT17_CHILD46: EXACT17_CHILD46,
}
_PROFILE_IDS = frozenset(_PROFILE_VALIDATORS)
_LEGACY_CONTRACT_KEYS = frozenset(
    {"parent", "child", "model", "ordered_suffix_sha256", "schemas", "artifact_roles"}
)
_CHILD46_CONTRACT_KEYS = frozenset(
    {
        "parent",
        "child",
        "evidence",
        "ordered_suffix_sha256",
        "schemas",
        "artifact_roles",
    }
)
_CHILD46_EVIDENCE_KEYS = frozenset(
    {
        "strict_replay_receipt_sha256",
        "terminal_envelope_sha256",
        "terminal_envelope_embedded_sha256",
        "occurrence_ledger_sha256",
        "export_receipt_sha256",
        "cell_count",
        "full_certificate_count",
        "support_count",
        "new_clause_count",
        "parent_subsumed_suffix_indices",
        "authenticated_model_cut_suffix_indices",
    }
)
_DIMACS_KEYS = frozenset({"sha256", "variables", "clauses"})
_MODEL_KEYS = frozenset({"sha256", "job_id"})
_SCHEMA_KEYS = {
    EXACT17_CHILD40: frozenset({"model", "receipt", "ingress"}),
    EXACT17_CHILD45: frozenset({"model", "receipt", "final", "validation"}),
    EXACT17_CHILD46: frozenset(
        {
            "strict_replay_receipt",
            "terminal_envelope",
            "occurrence_ledger",
            "export_receipt",
            "validation",
        }
    ),
}
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
_REQUIRED_CHILD45_ARTIFACTS = frozenset(
    {
        "parent_cnf",
        "child_cnf",
        "model",
        "final",
        "export_receipt",
        "lean_root",
        "lean_export",
    }
)
_REQUIRED_CHILD46_ARTIFACTS = frozenset(
    {
        "parent_cnf",
        "child_cnf",
        "strict_replay_receipt",
        "terminal_envelope",
        "occurrence_ledger",
        "export_receipt",
        "lean_root",
        "lean_export",
    }
)


@dataclass(frozen=True)
class _Child45Authority:
    profile_bytes: bytes
    artifact_sha256: tuple[tuple[str, str], ...]


# Child45 is a source-authoritative closed profile.  The full profile and every
# retained artifact digest are pinned here, rather than allowing a caller to
# re-hash another seven-file packet under the same validator name.  Tests may
# replace this private record with a small internally consistent fixture.
_EXACT17_CHILD45_AUTHORITY_VALUE: dict[str, Any] = {
    "profile": {
        "schema": PROFILE_SCHEMA,
        "profile_id": EXACT17_CHILD45,
        "validator": EXACT17_CHILD45,
        "classification": {"scope": FINITE_SCOPE, "mode": OFFLINE_MODE},
        "control": {
            "domain_kind": "STATIC_CNF",
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
            "cnf_sha256": "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
            "variables": 308,
            "clauses": 5_848_824,
        },
        "cleanup": {"cleanup_eligible": False, "lifecycle": RETAIN},
        "contract": {
            "parent": {
                "sha256": "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9",
                "variables": 308,
                "clauses": 5_848_820,
            },
            "child": {
                "sha256": "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
                "variables": 308,
                "clauses": 5_848_824,
            },
            "model": {
                "sha256": "2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a",
                "job_id": "f717c352-2456-412a-ae45-d910f47d3e94",
            },
            "ordered_suffix_sha256": "7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590",
            "schemas": {
                "model": "p97-exact17-child44-piqd-model/v3",
                "receipt": "p97-exact17-child45-immutable-export-receipt/v1",
                "final": "p97-exact17-child44-piqd-final/v2",
                "validation": "p97-exact17-child45-export-validation/v1",
            },
            "artifact_roles": sorted(_REQUIRED_CHILD45_ARTIFACTS),
        },
    },
    "artifacts": {
        "parent_cnf": "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9",
        "child_cnf": "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
        "model": "2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a",
        "final": "b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa",
        "export_receipt": "fd12b39d26f9fbe82f9e06edad9d7183b3af5b9b4c8cad1fa7ae2fa3f032e8a3",
        "lean_root": "f9238553222414f52c2282ccdda7764506e69aef4eca710263d7bd6930b6d7f2",
        "lean_export": "d2eb848ccd9ca3138d3bc97c35dee2f51f7546edfefed54104a21bd84b18ba38",
    },
}
_EXACT17_CHILD45_AUTHORITY = _Child45Authority(
    profile_bytes=canonical_json_bytes(_EXACT17_CHILD45_AUTHORITY_VALUE["profile"]),
    artifact_sha256=tuple(
        sorted(_EXACT17_CHILD45_AUTHORITY_VALUE["artifacts"].items())
    ),
)
del _EXACT17_CHILD45_AUTHORITY_VALUE


@dataclass(frozen=True)
class _Child46Authority:
    profile_bytes: bytes
    artifact_sha256: tuple[tuple[str, str], ...]


_EXACT17_CHILD46_AUTHORITY_VALUE: dict[str, Any] = {
    "profile": {
        "schema": PROFILE_SCHEMA,
        "profile_id": EXACT17_CHILD46,
        "validator": EXACT17_CHILD46,
        "classification": {"scope": FINITE_SCOPE, "mode": OFFLINE_MODE},
        "control": {
            "domain_kind": "STATIC_CNF",
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
            "cnf_sha256": "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2",
            "variables": 308,
            "clauses": 5_848_864,
        },
        "cleanup": {"cleanup_eligible": False, "lifecycle": RETAIN},
        "contract": {
            "parent": {
                "sha256": "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5",
                "variables": 308,
                "clauses": 5_848_828,
            },
            "child": {
                "sha256": "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2",
                "variables": 308,
                "clauses": 5_848_864,
            },
            "evidence": {
                "strict_replay_receipt_sha256": "4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160",
                "terminal_envelope_sha256": "28786f4898730b6776b0ce656eb16fbf74d25beed54e269a97fcf333dd3f2ee4",
                "terminal_envelope_embedded_sha256": "bc388ef9ccc39508f4be786131f04a0139a9bdd3c494933a7d886ad97e6cc85f",
                "occurrence_ledger_sha256": "93f8ea5b5e50ff43788bb556521a2d0e320178d045fed2c00868fd5a2d683006",
                "export_receipt_sha256": "64cc2822aa751f066f9177abd417e538be50524dd820ea250048f64a37de9ae3",
                "cell_count": 13,
                "full_certificate_count": 11,
                "support_count": 9,
                "new_clause_count": 36,
                "parent_subsumed_suffix_indices": [8, 10, 12, 18, 24, 30, 32, 35],
                "authenticated_model_cut_suffix_indices": [
                    1,
                    5,
                    9,
                    13,
                    17,
                    21,
                    25,
                    29,
                    33,
                ],
            },
            "ordered_suffix_sha256": "05b1b92d77d56be54fee3ccc0c09cb66b31453dffb2b97dc3f99bbda37eb47ea",
            "schemas": {
                "strict_replay_receipt": "p97-cegar-wave-cli/v1",
                "terminal_envelope": "p97-cegar-assumption-cnf-engine/v1",
                "occurrence_ledger": "p97-exact17-child45-wave-weighted-kalmanson-ledger/v1",
                "export_receipt": "p97-exact17-child46-immutable-export-receipt/v1",
                "validation": "p97-exact17-forty-sixth-export-validation/v1",
            },
            "artifact_roles": sorted(_REQUIRED_CHILD46_ARTIFACTS),
        },
    },
    "artifacts": {
        "parent_cnf": "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5",
        "child_cnf": "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2",
        "strict_replay_receipt": "4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160",
        "terminal_envelope": "28786f4898730b6776b0ce656eb16fbf74d25beed54e269a97fcf333dd3f2ee4",
        "occurrence_ledger": "93f8ea5b5e50ff43788bb556521a2d0e320178d045fed2c00868fd5a2d683006",
        "export_receipt": "64cc2822aa751f066f9177abd417e538be50524dd820ea250048f64a37de9ae3",
        "lean_root": "b8d285ac9b85821ac7634103d9fa8fe9588747c0a57659a28e6e1dee4a9ae127",
        "lean_export": "d0e9b23007b7c8051eb4f46c95d0b5d28563a523d10b3d916d795310d78d8a81",
    },
}
_EXACT17_CHILD46_AUTHORITY = _Child46Authority(
    profile_bytes=canonical_json_bytes(_EXACT17_CHILD46_AUTHORITY_VALUE["profile"]),
    artifact_sha256=tuple(
        sorted(_EXACT17_CHILD46_AUTHORITY_VALUE["artifacts"].items())
    ),
)
del _EXACT17_CHILD46_AUTHORITY_VALUE


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
    if validator != _PROFILE_VALIDATORS[profile_id]:
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

    contract_keys = (
        _CHILD46_CONTRACT_KEYS
        if validator == EXACT17_CHILD46
        else _LEGACY_CONTRACT_KEYS
    )
    contract = _exact_keys(profile["contract"], contract_keys, "contract")
    parent = _exact_keys(contract["parent"], _DIMACS_KEYS, "contract.parent")
    child = _exact_keys(contract["child"], _DIMACS_KEYS, "contract.child")
    for label, row in (("parent", parent), ("child", child)):
        _sha(row["sha256"], f"contract.{label}.sha256")
        _count(row["variables"], f"contract.{label}.variables")
        _count(row["clauses"], f"contract.{label}.clauses")
    if validator == EXACT17_CHILD46:
        evidence = _exact_keys(
            contract["evidence"], _CHILD46_EVIDENCE_KEYS, "contract.evidence"
        )
        for field in (
            "strict_replay_receipt_sha256",
            "terminal_envelope_sha256",
            "terminal_envelope_embedded_sha256",
            "occurrence_ledger_sha256",
            "export_receipt_sha256",
        ):
            _sha(evidence[field], f"contract.evidence.{field}")
        for field in (
            "cell_count",
            "full_certificate_count",
            "support_count",
            "new_clause_count",
        ):
            if _count(evidence[field], f"contract.evidence.{field}") == 0:
                _fail(f"contract.evidence.{field} must be positive")
        index_fields = (
            "parent_subsumed_suffix_indices",
            "authenticated_model_cut_suffix_indices",
        )
        parsed_indices: dict[str, list[int]] = {}
        for field in index_fields:
            indices = evidence[field]
            if (
                type(indices) is not list
                or any(type(index) is not int for index in indices)
                or indices != sorted(set(indices))
                or any(
                    index <= 0 or index > evidence["new_clause_count"]
                    for index in indices
                )
            ):
                _fail(f"contract.evidence.{field} must be sorted unique suffix indices")
            parsed_indices[field] = indices
        if set(parsed_indices[index_fields[0]]) & set(parsed_indices[index_fields[1]]):
            _fail("parent-subsumed and authenticated-model cuts must be disjoint")
    else:
        model = _exact_keys(contract["model"], _MODEL_KEYS, "contract.model")
        _sha(model["sha256"], "contract.model.sha256")
        _string(model["job_id"], "contract.model.job_id")
    _sha(contract["ordered_suffix_sha256"], "contract.ordered_suffix_sha256")
    schemas = _exact_keys(
        contract["schemas"], _SCHEMA_KEYS[validator], "contract.schemas"
    )
    for key, value in schemas.items():
        _string(value, f"contract.schemas.{key}")
    roles = contract["artifact_roles"]
    if (
        type(roles) is not list
        or not roles
        or any(type(role) is not str for role in roles)
    ):
        _fail("contract.artifact_roles must be a nonempty string list")
    required_artifacts = {
        EXACT17_CHILD40: _REQUIRED_CHILD40_ARTIFACTS,
        EXACT17_CHILD45: _REQUIRED_CHILD45_ARTIFACTS,
        EXACT17_CHILD46: _REQUIRED_CHILD46_ARTIFACTS,
    }[validator]
    if len(set(roles)) != len(roles) or set(roles) != required_artifacts:
        _fail("artifact role inventory is not the exact authenticated set")
    if (
        parent["variables"] != child["variables"]
        or child["clauses"] < parent["clauses"]
    ):
        _fail("profile dimensions are inconsistent")
    if (
        control["cnf_sha256"] != child["sha256"]
        or control["variables"] != child["variables"]
        or control["clauses"] != child["clauses"]
    ):
        _fail("control is not bound to the profile CNF")
    return SemanticProfile(dict(profile))


def validate_profile_metadata(metadata: Mapping[str, Any]) -> dict[str, Any]:
    """Validate the self-contained profile summary sealed in a v2 envelope."""

    value = _exact_keys(metadata, _METADATA_KEYS, "profile metadata")
    if value["schema"] != PROFILE_SCHEMA:
        _fail("profile metadata schema drifted")
    profile_id = _string(value["profile_id"], "profile metadata.profile_id")
    if profile_id not in _PROFILE_IDS:
        _fail(f"unknown semantic profile id: {profile_id}")
    if value["validator"] != _PROFILE_VALIDATORS[profile_id]:
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
    canonical = canonical_json_bytes(value)
    if capture.data not in {canonical, canonical + b"\n", legacy_pretty}:
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
    path = value["path"]
    if (
        type(path) is not str
        or not path
        or not os.path.isabs(path)
        or os.path.normpath(path) != path
    ):
        _fail(f"{label} path must be an absolute normalized builtin string")
    if capture.path is not None and value["path"] != str(capture.path):
        _fail(f"{label} path crossed the captured artifact")
    if value["sha256"] != (digest or capture.digest):
        _fail(f"{label} SHA-256 crossed the captured artifact")


def _dimacs(data: bytes, label: str) -> tuple[bytes, list[bytes], int, int]:
    lines = data.splitlines(keepends=True)
    if not lines or not lines[0].endswith(b"\n"):
        _fail(f"{label} has no bounded DIMACS header")
    try:
        fields = lines[0][:-1].decode("ascii", "strict").split()
    except UnicodeDecodeError:
        _fail(f"{label} has a non-ASCII DIMACS header")
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        _fail(f"{label} has a malformed DIMACS header")
    try:
        variables, clauses = int(fields[2]), int(fields[3])
    except ValueError:
        _fail(f"{label} has non-integer dimensions")
    if lines[0] != f"p cnf {variables} {clauses}\n".encode("ascii"):
        _fail(f"{label} has a noncanonical DIMACS header")
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
        canonical = (
            ((" ".join(str(literal) for literal in literals) + " ") if literals else "")
            + "0\n"
        ).encode("ascii")
        if line != canonical:
            _fail(f"{label} has a noncanonical DIMACS clause")
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


def _clause_literals(line: bytes, label: str) -> tuple[int, ...]:
    try:
        values = tuple(int(token) for token in line[:-1].split())
    except ValueError:
        _fail(f"{label} has a non-integer literal")
    if not values or values[-1] != 0:
        _fail(f"{label} has a malformed terminator")
    return values[:-1]


def _total_assignment(
    value: object, variables: int, label: str
) -> tuple[list[int], dict[int, bool]]:
    if (
        type(value) is not list
        or len(value) != variables
        or any(
            type(literal) is not int or literal == 0 or abs(literal) > variables
            for literal in value
        )
        or {abs(literal) for literal in value} != set(range(1, variables + 1))
    ):
        _fail(f"{label} is not a total signed assignment")
    return value, {abs(literal): literal > 0 for literal in value}


def _validate_child45(
    profile: SemanticProfile,
    artifacts: Mapping[str, CapturedBytes | bytes | CaptureLike],
) -> dict[str, Any]:
    if type(artifacts) is not dict:
        _fail("captured artifacts must be an exact builtin dict")
    authority = _EXACT17_CHILD45_AUTHORITY
    if type(authority) is not _Child45Authority:
        _fail("Child45 validator authority is malformed")
    if canonical_json_bytes(profile.payload) != authority.profile_bytes:
        _fail("Child45 profile crossed the source-authoritative identity")
    contract = profile.payload["contract"]
    roles = set(contract["artifact_roles"])
    if set(artifacts) != roles:
        _fail("captured artifact inventory crossed the profile")
    captured = {role: _captured(value, role) for role, value in artifacts.items()}
    if any(capture.path is None for capture in captured.values()):
        _fail("Child45 retained artifacts require exact captured paths")
    expected_digests = dict(authority.artifact_sha256)
    if (
        type(expected_digests) is not dict
        or set(expected_digests) != roles
        or any(
            capture.digest != expected_digests[role]
            for role, capture in captured.items()
        )
    ):
        _fail("Child45 retained artifact crossed the source-authoritative identity")

    _parent_header, parent_lines, parent_vars, parent_clauses = _dimacs(
        captured["parent_cnf"].data, "Child44 parent CNF"
    )
    _child_header, child_lines, child_vars, child_clauses = _dimacs(
        captured["child_cnf"].data, "Child45 child CNF"
    )
    parent = contract["parent"]
    child = contract["child"]
    if (parent_vars, parent_clauses) != (parent["variables"], parent["clauses"]):
        _fail("Child44 parent dimensions crossed profile")
    if (child_vars, child_clauses) != (child["variables"], child["clauses"]):
        _fail("Child45 child dimensions crossed profile")
    if parent_lines != child_lines[:parent_clauses]:
        _fail("Child45 does not preserve the exact Child44 parent prefix")
    suffix = child_lines[parent_clauses:]
    if (
        not suffix
        or len(set(suffix)) != len(suffix)
        or hashlib.sha256(b"".join(suffix)).hexdigest()
        != contract["ordered_suffix_sha256"]
    ):
        _fail("Child45 ordered suffix crossed profile")

    model = _json_capture(captured["model"], "Child44 model")
    if set(model) != {
        "schema",
        "job_id",
        "cnf_sha256",
        "manifest_sha256",
        "completion_identity_hash",
        "model",
        "replay",
    }:
        _fail("Child44 model schema drifted")
    model_contract = contract["model"]
    if (
        model["schema"] != contract["schemas"]["model"]
        or model["job_id"] != model_contract["job_id"]
        or model["cnf_sha256"] != parent["sha256"]
        or captured["model"].digest != model_contract["sha256"]
        or model["replay"] != {"clauses_checked": parent_clauses, "satisfies_all": True}
    ):
        _fail("Child44 model identity/replay drifted")
    nested_model = model["model"]
    if type(nested_model) is not dict or set(nested_model) != {
        "assignment",
        "backend",
        "job_id",
        "num_assigned",
        "result",
        "solver_profile",
    }:
        _fail("Child44 model result schema drifted")
    if (
        nested_model["backend"] != "cadical"
        or nested_model["job_id"] != model_contract["job_id"]
        or nested_model["num_assigned"] != parent_vars
        or nested_model["result"] != "SAT"
        or nested_model["solver_profile"] != "sat"
    ):
        _fail("Child44 model result drifted")
    _assignment, truth = _total_assignment(
        nested_model["assignment"], parent_vars, "Child44 model assignment"
    )
    for line in parent_lines:
        literals = _clause_literals(line, "Child44 parent clause")
        if not any(truth[abs(literal)] == (literal > 0) for literal in literals):
            _fail("Child44 model does not satisfy the parent CNF")

    final = _json_capture(captured["final"], "Child44 final custody")
    if set(final) != {
        "schema",
        "job_id",
        "result",
        "model_sha256",
        "next_gate",
        "binding",
        "model_replay",
        "completion_status",
        "stored_final",
        "daemon",
        "deciding_daemon_sha256",
        "model_check",
        "solver",
        "solver_log",
    }:
        _fail("Child44 final custody schema drifted")
    if (
        final["schema"] != contract["schemas"]["final"]
        or final["job_id"] != model_contract["job_id"]
        or final["result"] != "SAT"
        or final["model_sha256"] != model_contract["sha256"]
        or final["next_gate"] != "mandatory_general_theorem_search"
        or final["model_replay"]
        != {"clauses_checked": parent_clauses, "satisfies_all": True}
    ):
        _fail("Child44 final custody identity drifted")
    binding = final["binding"]
    if type(binding) is not dict or set(binding) != {
        "backend",
        "cnf_sha256",
        "identity_hash",
        "manifest_sha256",
        "march_timeout_s",
        "project",
        "requested_core_limit",
        "solver_profile",
        "timeout_s",
    }:
        _fail("Child44 final binding schema drifted")
    if (
        binding["backend"] != "cadical"
        or binding["cnf_sha256"] != parent["sha256"]
        or type(binding["requested_core_limit"]) is not int
        or binding["requested_core_limit"] != 1
        or binding["solver_profile"] != "sat"
    ):
        _fail("Child44 final parent binding drifted")
    _sha(binding["identity_hash"], "Child44 final binding identity")
    _sha(binding["manifest_sha256"], "Child44 final binding manifest")
    completion = final["completion_status"]
    if (
        type(completion) is not dict
        or completion.get("id") != model_contract["job_id"]
        or completion.get("status") != "completed"
        or completion.get("result") != "SAT"
        or completion.get("backend") != "cadical"
        or completion.get("cnf_blob_hash") != parent["sha256"]
        or completion.get("producer_manifest_hash") != binding["manifest_sha256"]
        or completion.get("producer_manifest_blob_hash") != binding["manifest_sha256"]
        or completion.get("identity_hash") != binding["identity_hash"]
        or completion.get("solver_profile") != "sat"
        or type(completion.get("requested_core_limit")) is not int
        or completion.get("requested_core_limit") != 1
        or type(completion.get("attested_solver_processes")) is not int
        or completion.get("attested_solver_processes") != 1
        or completion.get("attestation_basis") != "SINGLE_PROCESS_NO_PARALLEL_FLAG"
    ):
        _fail("Child44 final completion custody drifted")
    stored = final["stored_final"]
    stored_producer = stored.get("producer_manifest") if type(stored) is dict else None
    if (
        type(stored) is not dict
        or set(stored) != {"cnf", "producer_manifest"}
        or stored["cnf"]
        != {"bytes": len(captured["parent_cnf"].data), "sha256": parent["sha256"]}
        or type(stored_producer) is not dict
        or set(stored_producer) != {"bytes", "sha256"}
        or type(stored_producer["bytes"]) is not int
        or stored_producer["bytes"] <= 0
        or stored_producer["sha256"] != binding["manifest_sha256"]
    ):
        _fail("Child44 final stored custody drifted")
    if (
        model["manifest_sha256"] != binding["manifest_sha256"]
        or model["completion_identity_hash"] != binding["identity_hash"]
    ):
        _fail("Child44 model/final custody crossed")

    suffix_literals = [
        _clause_literals(line, "Child45 suffix clause") for line in suffix
    ]
    suffix_sets = [frozenset(clause) for clause in suffix_literals]
    parent_subsumed: set[int] = set()
    for line in parent_lines:
        parent_set = frozenset(_clause_literals(line, "Child44 parent clause"))
        for index, suffix_set in enumerate(suffix_sets, 1):
            if parent_set <= suffix_set:
                parent_subsumed.add(index)
    rejected = [
        index
        for index, clause in enumerate(suffix_literals, 1)
        if not any(truth[abs(literal)] == (literal > 0) for literal in clause)
    ]
    if set(rejected) & parent_subsumed:
        _fail("Child45 authenticated model cut is parent-subsumed")

    receipt = _json_capture(captured["export_receipt"], "Child45 export receipt")
    if set(receipt) != {
        "schema",
        "status",
        "publication_state",
        "parent",
        "model",
        "final",
        "lean",
        "child",
        "validation",
        "immutability",
    }:
        _fail("Child45 export receipt schema drifted")
    if (
        receipt["schema"] != contract["schemas"]["receipt"]
        or receipt["status"] != PASS
        or receipt["publication_state"] != "PROVISIONED"
        or receipt["immutability"] != "exclusive-hard-link-and-ledger-last-receipt/v2"
    ):
        _fail("Child45 export receipt status/policy drifted")
    expected_parent = {
        "path": str(captured["parent_cnf"].path),
        "sha256": parent["sha256"],
        "bytes": len(captured["parent_cnf"].data),
        "clauses": parent_clauses,
    }
    expected_child = {
        "path": str(captured["child_cnf"].path),
        "sha256": child["sha256"],
        "bytes": len(captured["child_cnf"].data),
        "variables": child_vars,
        "clauses": child_clauses,
    }
    expected_final = {
        "path": str(captured["final"].path),
        "sha256": captured["final"].digest,
        "job_id": model_contract["job_id"],
        "result": "SAT",
    }
    if receipt["parent"] != expected_parent or receipt["child"] != expected_child:
        _fail("Child45 receipt DIMACS identity drifted")
    _path_record(receipt["model"], captured["model"], "Child45 receipt model")
    if receipt["final"] != expected_final:
        _fail("Child45 receipt final identity drifted")
    lean = receipt["lean"]
    if type(lean) is not dict or set(lean) != {"root", "export"}:
        _fail("Child45 Lean receipt shape drifted")
    _path_record(lean["root"], captured["lean_root"], "Child45 Lean root")
    _path_record(lean["export"], captured["lean_export"], "Child45 Lean export")
    expected_validation = {
        "schema": contract["schemas"]["validation"],
        "status": PASS,
        "parent_sha256": parent["sha256"],
        "child_sha256": child["sha256"],
        "parent_bytes": len(captured["parent_cnf"].data),
        "child_bytes": len(captured["child_cnf"].data),
        "variables": child_vars,
        "parent_clauses": parent_clauses,
        "new_clauses": len(suffix),
        "child_clauses": child_clauses,
        "ordered_suffix_sha256": contract["ordered_suffix_sha256"],
        "parent_subsumed_suffix_indices": sorted(parent_subsumed),
        "authenticated_model_rejected_suffix_indices": rejected,
        "final": expected_final,
    }
    receipt_validation = receipt["validation"]
    if type(receipt_validation) is not dict or set(receipt_validation) != set(
        expected_validation
    ):
        _fail("Child45 receipt validation schema drifted")
    for field in (
        "parent_bytes",
        "child_bytes",
        "variables",
        "parent_clauses",
        "new_clauses",
        "child_clauses",
    ):
        if type(receipt_validation[field]) is not int:
            _fail(f"Child45 receipt validation {field} must be a builtin int")
    for field in (
        "parent_subsumed_suffix_indices",
        "authenticated_model_rejected_suffix_indices",
    ):
        indices = receipt_validation[field]
        if type(indices) is not list or any(
            type(index) is not int for index in indices
        ):
            _fail(f"Child45 receipt validation {field} must be builtin ints")
    if receipt_validation != expected_validation:
        _fail("Child45 receipt validation drifted")
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


def _validate_child46(
    profile: SemanticProfile,
    artifacts: Mapping[str, CapturedBytes | bytes | CaptureLike],
) -> dict[str, Any]:
    """Validate the authenticated Child45 mine and Lean-owned Child46 root."""

    if type(artifacts) is not dict:
        _fail("captured artifacts must be an exact builtin dict")
    authority = _EXACT17_CHILD46_AUTHORITY
    if type(authority) is not _Child46Authority:
        _fail("Child46 validator authority is malformed")
    if canonical_json_bytes(profile.payload) != authority.profile_bytes:
        _fail("Child46 profile crossed the source-authoritative identity")
    contract = profile.payload["contract"]
    evidence = contract["evidence"]
    roles = set(contract["artifact_roles"])
    if set(artifacts) != roles:
        _fail("captured artifact inventory crossed the profile")
    captured = {role: _captured(value, role) for role, value in artifacts.items()}
    if any(capture.path is None for capture in captured.values()):
        _fail("Child46 retained artifacts require exact captured paths")
    expected_digests = dict(authority.artifact_sha256)
    if (
        type(expected_digests) is not dict
        or set(expected_digests) != roles
        or any(
            capture.digest != expected_digests[role]
            for role, capture in captured.items()
        )
    ):
        _fail("Child46 retained artifact crossed the source-authoritative identity")

    _parent_header, parent_lines, parent_vars, parent_clauses = _dimacs(
        captured["parent_cnf"].data, "Child45 parent CNF"
    )
    _child_header, child_lines, child_vars, child_clauses = _dimacs(
        captured["child_cnf"].data, "Child46 child CNF"
    )
    parent = contract["parent"]
    child = contract["child"]
    if (parent_vars, parent_clauses) != (parent["variables"], parent["clauses"]):
        _fail("Child45 parent dimensions crossed profile")
    if (child_vars, child_clauses) != (child["variables"], child["clauses"]):
        _fail("Child46 child dimensions crossed profile")
    if parent_lines != child_lines[:parent_clauses]:
        _fail("Child46 does not preserve the exact Child45 parent prefix")
    suffix = child_lines[parent_clauses:]
    if (
        len(suffix) != evidence["new_clause_count"]
        or len(set(suffix)) != len(suffix)
        or hashlib.sha256(b"".join(suffix)).hexdigest()
        != contract["ordered_suffix_sha256"]
    ):
        _fail("Child46 ordered suffix crossed profile")

    strict = _json_capture(
        captured["strict_replay_receipt"], "Child45 strict replay receipt"
    )
    if set(strict) != {
        "schema",
        "status",
        "command",
        "classification",
        "custody_status",
        "envelope_sha256",
        "output",
    }:
        _fail("Child45 strict replay receipt schema drifted")
    if (
        strict["schema"] != contract["schemas"]["strict_replay_receipt"]
        or strict["status"] != PASS
        or strict["command"] != "validate-replay"
        or strict["classification"] != "SAT_SEMANTIC_REPLAYED"
        or strict["custody_status"] != "OFFLINE_CROSS_BOUND"
        or strict["envelope_sha256"] != evidence["terminal_envelope_embedded_sha256"]
        or strict["output"] != str(captured["terminal_envelope"].path)
    ):
        _fail("Child45 strict replay receipt identity drifted")

    envelope = _json_capture(captured["terminal_envelope"], "Child45 terminal envelope")
    expected_envelope_keys = {
        "schema",
        "session_id",
        "wave_kind",
        "adapter",
        "execution_registration",
        "control",
        "package",
        "wave_manifest",
        "campaign",
        "parent",
        "runtime_solver",
        "cells",
        "summary",
        "claims",
        "close_observed",
        "envelope_sha256",
    }
    if set(envelope) != expected_envelope_keys:
        _fail("Child45 terminal envelope schema drifted")
    expected_summary = {
        "attempted": evidence["cell_count"],
        "classification": "SAT_SEMANTIC_REPLAYED",
        "not_run": 0,
        "sat": evidence["cell_count"],
        "total_cells": evidence["cell_count"],
        "unknown": 0,
        "unsat": 0,
    }
    cells = envelope["cells"]
    expected_cell_ids = [
        *(f"next-center-{index:02d}" for index in range(8)),
        *(f"next-center-{index:02d}" for index in range(12, 17)),
    ]
    if (
        envelope["schema"] != contract["schemas"]["terminal_envelope"]
        or envelope["wave_kind"] != "ASSUMPTION_CNF"
        or envelope["envelope_sha256"] != evidence["terminal_envelope_embedded_sha256"]
        or envelope["summary"] != expected_summary
        or type(cells) is not list
        or len(cells) != evidence["cell_count"]
        or [cell.get("cell_id") for cell in cells] != expected_cell_ids
        or any(
            type(cell) is not dict
            or cell.get("status") != "SAT"
            or cell.get("state") != "ATTEMPTED"
            or cell.get("source_replayed") is not True
            or cell.get("closure_claim") is not False
            or cell.get("proof_verified") is not False
            or cell.get("discovery_scope") != "sat-witness-replayed"
            or type(cell.get("semantic_replay")) is not dict
            or cell["semantic_replay"]
            .get("result", {})
            .get("kalmanson", {})
            .get("status")
            != "LINEARLY_INFEASIBLE"
            for cell in cells
        )
    ):
        _fail("Child45 terminal replay census drifted")

    ledger = _json_capture(captured["occurrence_ledger"], "Child45 occurrence ledger")
    required_ledger_keys = {
        "schema",
        "status",
        "input",
        "receipt",
        "terminal_envelope",
        "producer_manifest_sha256",
        "profile_sha256",
        "child44_source_parent",
        "child45_root",
        "predecessor",
        "predecessor_export",
        "cell_provenance",
        "full_certificate_records",
        "support_dedup",
        "inherited_support_census",
        "audit",
        "new_root",
    }
    if set(ledger) != required_ledger_keys:
        _fail("Child45 occurrence ledger schema drifted")
    audit = ledger["audit"]
    new_root = ledger["new_root"]
    if (
        ledger["schema"] != contract["schemas"]["occurrence_ledger"]
        or ledger["status"] != "AUTHENTICATED_PROMOTABLE"
        or type(audit) is not dict
        or audit.get("full_unique_count") != evidence["full_certificate_count"]
        or audit.get("support_unique_count") != evidence["support_count"]
        or audit.get("non_subsumed") is not True
        or type(new_root) is not dict
        or new_root.get("parent_clauses") != parent_clauses
        or new_root.get("new_clauses") != len(suffix)
        or new_root.get("clauses") != child_clauses
        or type(ledger["cell_provenance"]) is not list
        or len(ledger["cell_provenance"]) != evidence["cell_count"]
        or type(ledger["full_certificate_records"]) is not list
        or len(ledger["full_certificate_records"]) != evidence["full_certificate_count"]
        or ledger.get("receipt", {}).get("sha256")
        != evidence["strict_replay_receipt_sha256"]
        or ledger.get("terminal_envelope", {}).get("sha256")
        != evidence["terminal_envelope_sha256"]
        or ledger.get("terminal_envelope", {}).get("embedded_sha256")
        != evidence["terminal_envelope_embedded_sha256"]
        or ledger.get("predecessor_export", {}).get("sha256") != parent["sha256"]
    ):
        _fail("Child45 occurrence ledger identity/census drifted")

    receipt = _json_capture(captured["export_receipt"], "Child46 export receipt")
    if set(receipt) != {
        "schema",
        "status",
        "publication_state",
        "parent",
        "strict_replay_receipt",
        "terminal_envelope",
        "occurrence_ledger",
        "lean",
        "child",
        "validation",
        "immutability",
    }:
        _fail("Child46 export receipt schema drifted")
    if (
        receipt["schema"] != contract["schemas"]["export_receipt"]
        or receipt["status"] != PASS
        or receipt["publication_state"] != "PROVISIONED"
        or receipt["immutability"] != "exclusive-hard-link-and-ledger-last-receipt/v2"
    ):
        _fail("Child46 export receipt status/policy drifted")
    expected_parent = {
        "path": str(captured["parent_cnf"].path),
        "sha256": parent["sha256"],
        "bytes": len(captured["parent_cnf"].data),
        "variables": parent_vars,
        "clauses": parent_clauses,
    }
    expected_child = {
        "path": str(captured["child_cnf"].path),
        "sha256": child["sha256"],
        "bytes": len(captured["child_cnf"].data),
        "variables": child_vars,
        "clauses": child_clauses,
    }
    if receipt["parent"] != expected_parent or receipt["child"] != expected_child:
        _fail("Child46 receipt DIMACS identity drifted")
    _path_record(
        receipt["strict_replay_receipt"],
        captured["strict_replay_receipt"],
        "Child46 receipt strict replay",
    )
    _path_record(
        receipt["occurrence_ledger"],
        captured["occurrence_ledger"],
        "Child46 receipt occurrence ledger",
    )
    terminal_record = receipt["terminal_envelope"]
    if (
        type(terminal_record) is not dict
        or set(terminal_record) != {"path", "sha256", "embedded_sha256"}
        or terminal_record["path"] != str(captured["terminal_envelope"].path)
        or terminal_record["sha256"] != captured["terminal_envelope"].digest
        or terminal_record["embedded_sha256"]
        != evidence["terminal_envelope_embedded_sha256"]
    ):
        _fail("Child46 receipt terminal envelope crossed captured evidence")
    lean = receipt["lean"]
    if type(lean) is not dict or set(lean) != {"root", "export"}:
        _fail("Child46 Lean receipt shape drifted")
    _path_record(lean["root"], captured["lean_root"], "Child46 Lean root")
    _path_record(lean["export"], captured["lean_export"], "Child46 Lean export")

    validation = receipt["validation"]
    validation_keys = {
        "schema",
        "status",
        "parent_sha256",
        "child_sha256",
        "parent_bytes",
        "child_bytes",
        "variables",
        "parent_clauses",
        "new_clauses",
        "child_clauses",
        "ordered_suffix_sha256",
        "parent_subsumed_suffix_indices",
        "authenticated_model_cut_suffix_indices",
        "cell_model_rejections",
    }
    if type(validation) is not dict or set(validation) != validation_keys:
        _fail("Child46 receipt validation schema drifted")
    if (
        validation["schema"] != contract["schemas"]["validation"]
        or validation["status"] != PASS
        or validation["parent_sha256"] != parent["sha256"]
        or validation["child_sha256"] != child["sha256"]
        or validation["parent_bytes"] != len(captured["parent_cnf"].data)
        or validation["child_bytes"] != len(captured["child_cnf"].data)
        or validation["variables"] != child_vars
        or validation["parent_clauses"] != parent_clauses
        or validation["new_clauses"] != len(suffix)
        or validation["child_clauses"] != child_clauses
        or validation["ordered_suffix_sha256"] != contract["ordered_suffix_sha256"]
        or validation["parent_subsumed_suffix_indices"]
        != evidence["parent_subsumed_suffix_indices"]
        or validation["authenticated_model_cut_suffix_indices"]
        != evidence["authenticated_model_cut_suffix_indices"]
    ):
        _fail("Child46 receipt validation identity drifted")
    cell_rejections = validation["cell_model_rejections"]
    if (
        type(cell_rejections) is not list
        or len(cell_rejections) != evidence["cell_count"]
        or [row.get("cell_id") for row in cell_rejections] != expected_cell_ids
        or any(
            type(row) is not dict
            or set(row)
            != {
                "cell_id",
                "rejected_suffix_indices",
                "representative_cell",
                "required_rejected_suffix_index",
            }
            or type(row["rejected_suffix_indices"]) is not list
            or row["required_rejected_suffix_index"]
            not in row["rejected_suffix_indices"]
            or row["required_rejected_suffix_index"]
            not in evidence["authenticated_model_cut_suffix_indices"]
            for row in cell_rejections
        )
    ):
        _fail("Child46 authenticated model-cut census drifted")

    lean_root = captured["lean_root"].data
    lean_export = captured["lean_export"].data
    if (
        b"sourceAssign_extendedFortySixthModelRefinementsCnf" not in lean_root
        or b"false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat"
        not in lean_root
        or b"sorry" in lean_root
        or b"extendedFortySixthModelRefinementsDimacsString" not in lean_export
        or b"sorry" in lean_export
    ):
        _fail("Child46 Lean source bridge/export drifted")
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


_VALIDATORS = {
    EXACT17_CHILD40: _validate_child40,
    EXACT17_CHILD45: _validate_child45,
    EXACT17_CHILD46: _validate_child46,
}


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
    "EXACT17_CHILD45",
    "EXACT17_CHILD46",
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
