"""Fail-closed authority-v3 onboarding for the current global production base.

Historical canary/authority-v2 artifacts remain frozen shard-bound evidence.
This additive path round-trips the public unsharded builder and mints only the
exact current-global authority-v3 schema after profile validation.
"""

from __future__ import annotations

import hashlib
import json
import os
import stat
import urllib.parse
import uuid
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Literal

from census.p97_search import phase3_cegar_wave as wave
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search import phase3_structural_cegar_projected_static_v3 as projected
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    Transport,
    raw_dimacs_identity,
    scan_dimacs,
    stdlib_http_transport,
)

PROFILE_DRIFT = "PROFILE_DRIFT"
CURRENT_BUNDLE_SCHEMA = "p97-piqd-projected-static-v3-global-bundle/v1"
TEST_ONLY_AUTHORITY_SCHEMA = (
    "p97-piqd-projected-static-v3-provisioning-test-only-authority/v1"
)
PRODUCTION_SEAL_SCHEMA = "p97-piqd-projected-static-v3-provisioning-seal/v1"
TEST_ONLY_SEAL_SCHEMA = "p97-piqd-projected-static-v3-provisioning-test-only-seal/v1"
GLOBAL_BASE_SCOPE = "global-unsharded"
HISTORICAL_SHARD_BASE_SCOPE = "shard-local"

BASE_CNF_NAME = "base.cnf"
VARIABLE_MAP_NAME = "variable-map.json"
SOURCE_BUNDLE_NAME = "source-bundle.json"
ENCODING_CONFIGURATION_NAME = "encoding-configuration.json"
SOURCE_MANIFEST_NAME = "source-manifest.json"
PRODUCER_MANIFEST_NAME = "producer-manifest.json"
WAVE_MANIFEST_NAME = "prepare-wave.json"
PREPARED_JOB_NAME = "prepared-job.json"
PRODUCER_JOB_NAME = "producer-job.json"
DAEMON_VERSION_NAME = "daemon-version-pre.json"
SOLVER_REGISTRY_NAME = "solver-registry.json"
AUTHORITY_NAME = qualification.PRODUCTION_V3_AUTHORITY_NAME
SEAL_NAME = "provisioning-seal.json"

_MAX_CONTROL_BYTES = 1 << 20
_MAX_CNF_BYTES = 1 << 30
_HEX = frozenset("0123456789abcdef")
_SOURCE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_PRODUCER_CLAIMS = {**_SOURCE_CLAIMS, "one_process": False, "one_core": False}
_SEAL_CLAIMS = {
    **_PRODUCER_CLAIMS,
    "proof_verified": False,
    "closure": False,
}
_PREPARE_KEYS = {
    "job_id",
    "existing",
    "cnf_blob_hash",
    "identity_hash",
    "num_vars",
    "num_clauses",
    "requested_core_limit",
}
_VERSION_KEYS = {"daemon", "limits"}
_VERSION_DAEMON_KEYS = {"name", "version", "protocol_version", "sha256"}
_VERSION_LIMIT_KEYS = {"max_var"}
_REGISTRY_KEYS = {"daemon", "solver_dir", "solvers"}
_REGISTRY_DAEMON_KEYS = {"name", "version", "protocol_version"}
_SOLVER_KEYS = {
    "lane",
    "name",
    "path",
    "protocol_version",
    "sha256",
    "solver",
    "solver_signature",
    "solver_source",
    "solver_version",
    "usable",
    "worker",
    "worker_version",
}
_JOB_V2_ALLOWED_KEYS = (
    qualification.JOB_STATUS_KEYS
    | qualification.JOB_STATUS_OPTIONAL_KEYS
    | qualification.JOB_STATUS_FUTURE_CUSTODY_KEYS
)
_JOB_V3_CUSTODY_KEYS = qualification.JOB_STATUS_V3_CUSTODY_KEYS
_JOB_V3_ALLOWED_KEYS = (
    qualification.JOB_STATUS_KEYS
    | qualification.JOB_STATUS_OPTIONAL_KEYS
    | _JOB_V3_CUSTODY_KEYS
)


class ProvisioningError(RuntimeError):
    """The onboarding packet is unsafe, malformed, or inconsistent."""


class ProfileDriftError(ProvisioningError):
    """The public current bundle does not match the selected authority profile."""

    code = PROFILE_DRIFT


@dataclass(frozen=True)
class CurrentUnshardedBundle:
    """Canonical immutable bytes and identities for the current global base."""

    schema: str
    base_scope: Literal["global-unsharded"]
    profile: str
    base_cnf: bytes
    base_cnf_sha256: str
    num_variables: int
    num_clauses: int
    variable_map: bytes
    variable_map_sha256: str
    source_bundle: bytes
    source_bundle_sha256: str
    encoding_configuration: bytes
    source_manifest: bytes
    source_manifest_sha256: str
    producer_manifest: bytes
    producer_manifest_sha256: str
    raw_dimacs_identity: str


@dataclass(frozen=True)
class ProvisioningProfile:
    """An immutable exact input profile, never an evidence or theorem claim."""

    name: str
    production: bool
    authority_schema: str
    base_scope: str
    profile: str
    num_variables: int
    num_clauses: int
    base_cnf_sha256: str
    variable_map_sha256: str
    source_manifest_sha256: str | None
    producer_manifest_sha256: str | None
    solver_name: str
    solver_sha256: str
    solver_signature: str
    solver_backend: str
    solver_lane: str
    policy: bytes
    variable_map_bytes: int | None = None
    source_bundle_sha256: str | None = None
    source_bundle_bytes: int | None = None
    encoding_configuration_sha256: str | None = None
    encoding_configuration_bytes: int | None = None
    source_manifest_bytes: int | None = None
    producer_manifest_bytes: int | None = None

    def __post_init__(self) -> None:
        for label in (
            "name",
            "authority_schema",
            "base_scope",
            "profile",
            "solver_name",
            "solver_signature",
            "solver_backend",
            "solver_lane",
        ):
            _string(getattr(self, label), label=label)
        if type(self.production) is not bool:
            raise ProvisioningError("profile.production must be builtin bool")
        _integer(self.num_variables, label="num_variables", minimum=1)
        _integer(self.num_clauses, label="num_clauses", minimum=0)
        for label in (
            "base_cnf_sha256",
            "variable_map_sha256",
            "solver_sha256",
        ):
            _digest(getattr(self, label), label=label)
        for label in ("source_manifest_sha256", "producer_manifest_sha256"):
            value = getattr(self, label)
            if value is not None:
                _digest(value, label=label)
        policy_value = _strict_json(self.policy, label="profile.policy", canonical=True)
        expected_policy_value = dict(qualification.PRODUCTION_V2_POLICY)
        if set(policy_value) != set(expected_policy_value) or any(
            type(policy_value[key]) is not type(expected)
            or policy_value[key] != expected
            for key, expected in expected_policy_value.items()
        ):
            raise ProvisioningError("profile.policy is not the exact sealed policy")
        if self.production:
            if self.authority_schema not in {
                qualification.PRODUCTION_V2_AUTHORITY_SCHEMA,
                qualification.PRODUCTION_V3_AUTHORITY_SCHEMA,
            }:
                raise ProvisioningError(
                    "production profile authority schema is unknown"
                )
            expected_policy = (
                qualification.PRODUCTION_V3_POLICY
                if self.authority_schema == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA
                else qualification.PRODUCTION_V2_POLICY
            )
            if self.policy != wave.canonical_json_bytes(dict(expected_policy)):
                raise ProvisioningError("production profile policy is crossed")
        elif self.authority_schema != TEST_ONLY_AUTHORITY_SCHEMA:
            raise ProvisioningError("test profile authority schema is not test-only")
        for label in (
            "variable_map_bytes",
            "source_bundle_bytes",
            "encoding_configuration_bytes",
            "source_manifest_bytes",
            "producer_manifest_bytes",
        ):
            value = getattr(self, label)
            if value is not None:
                _integer(value, label=label, minimum=1)
        for label in ("source_bundle_sha256", "encoding_configuration_sha256"):
            value = getattr(self, label)
            if value is not None:
                _digest(value, label=label)


@dataclass(frozen=True)
class ProvisioningResult:
    """One sealed onboarding packet; it carries no proof or theorem status."""

    directory: Path
    authority_path: Path
    seal_path: Path
    authority_sha256: str
    producer_job_id: str
    prepared_existing: bool
    production: bool


def _sha(payload: bytes) -> str:
    if type(payload) is not bytes:
        raise ProvisioningError("hash input must be exact bytes")
    return hashlib.sha256(payload).hexdigest()


def _keys(value: dict[str, Any], expected: set[str], *, label: str) -> None:
    if set(value) != expected:
        raise ProvisioningError(f"{label} has an inexact schema")


def _string(value: Any, *, label: str) -> str:
    if type(value) is not str or not value:
        raise ProvisioningError(f"{label} must be a nonempty builtin string")
    return value


def _integer(value: Any, *, label: str, minimum: int) -> int:
    if type(value) is not int or value < minimum:
        raise ProvisioningError(
            f"{label} must be a builtin integer greater than or equal to {minimum}"
        )
    return value


def _digest(value: Any, *, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise ProvisioningError(f"{label} must be lowercase 64-hex")
    return value


def _uuid(value: Any, *, label: str) -> str:
    _string(value, label=label)
    try:
        parsed = uuid.UUID(value)
    except (AttributeError, ValueError) as exc:
        raise ProvisioningError(f"{label} must be a canonical UUID") from exc
    if str(parsed) != value:
        raise ProvisioningError(f"{label} must be a canonical UUID")
    return value


def _strict_value(value: Any, *, label: str, depth: int = 0) -> None:
    if depth > 32:
        raise ProvisioningError(f"{label} exceeds the JSON depth bound")
    if type(value) is dict:
        if any(type(key) is not str for key in value):
            raise ProvisioningError(f"{label} has a non-builtin key")
        for item in value.values():
            _strict_value(item, label=label, depth=depth + 1)
    elif type(value) is list:
        for item in value:
            _strict_value(item, label=label, depth=depth + 1)
    elif value is not None and type(value) not in {str, int, bool}:
        raise ProvisioningError(f"{label} has a non-builtin JSON scalar")


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _strict_json(
    raw: bytes, *, label: str, canonical: bool = False, limit: int = _MAX_CONTROL_BYTES
) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > limit:
        raise ProvisioningError(f"{label} is not bounded exact bytes")
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_reject_duplicates,
            parse_float=lambda value: (_ for _ in ()).throw(ValueError(value)),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise ProvisioningError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        raise ProvisioningError(f"{label} must be an exact object")
    _strict_value(value, label=label)
    if canonical and raw != wave.canonical_json_bytes(value):
        raise ProvisioningError(f"{label} is not canonical JSON")
    return value


def _strict_json_array(
    raw: bytes, *, label: str, canonical: bool = False, limit: int = _MAX_CONTROL_BYTES
) -> list[Any]:
    if type(raw) is not bytes or len(raw) > limit:
        raise ProvisioningError(f"{label} is not bounded exact bytes")
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_reject_duplicates,
            parse_float=lambda value: (_ for _ in ()).throw(ValueError(value)),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise ProvisioningError(f"{label} is not strict JSON") from exc
    if type(value) is not list:
        raise ProvisioningError(f"{label} must be an exact array")
    _strict_value(value, label=label)
    if canonical and raw != wave.canonical_json_bytes(value):
        raise ProvisioningError(f"{label} is not canonical JSON")
    return value


PRODUCTION_V2_PROFILE = ProvisioningProfile(
    name="projected-static-v3-production-v2-historical-shard-4-of-32",
    production=True,
    authority_schema=qualification.PRODUCTION_V2_AUTHORITY_SCHEMA,
    base_scope=HISTORICAL_SHARD_BASE_SCOPE,
    profile="phase3-v0.2-projected-static;shard=4/32;units=-91,-92,93,-94,-95",
    num_variables=qualification.PRODUCTION_VARIABLES,
    num_clauses=qualification.PRODUCTION_BASE_CLAUSES,
    base_cnf_sha256=qualification.PRODUCTION_BASE_SHA256,
    variable_map_sha256=qualification.PRODUCTION_VARIABLE_MAP_SHA256,
    source_manifest_sha256=qualification.PRODUCTION_SOURCE_MANIFEST_SHA256,
    producer_manifest_sha256=qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256,
    solver_name=qualification.PRODUCTION_SOLVER_NAME,
    solver_sha256=qualification.PRODUCTION_SOLVER_SHA256,
    solver_signature=qualification.PRODUCTION_SOLVER_SIGNATURE,
    solver_backend=qualification.PRODUCTION_SOLVER_BACKEND,
    solver_lane=qualification.PRODUCTION_SOLVER_LANE,
    policy=wave.canonical_json_bytes(dict(qualification.PRODUCTION_V2_POLICY)),
)

PRODUCTION_V3_PROFILE = ProvisioningProfile(
    name="projected-static-v3-production-v3-current-global-unsharded",
    production=True,
    authority_schema=qualification.PRODUCTION_V3_AUTHORITY_SCHEMA,
    base_scope=qualification.PRODUCTION_V3_BASE_SCOPE,
    profile=qualification.PRODUCTION_V3_PROFILE,
    num_variables=qualification.PRODUCTION_V3_VARIABLES,
    num_clauses=qualification.PRODUCTION_V3_BASE_CLAUSES,
    base_cnf_sha256=qualification.PRODUCTION_V3_BASE_SHA256,
    variable_map_sha256=qualification.PRODUCTION_V3_VARIABLE_MAP_SHA256,
    source_manifest_sha256=None,
    producer_manifest_sha256=None,
    solver_name=qualification.PRODUCTION_SOLVER_NAME,
    solver_sha256=qualification.PRODUCTION_SOLVER_SHA256,
    solver_signature=qualification.PRODUCTION_SOLVER_SIGNATURE,
    solver_backend=qualification.PRODUCTION_SOLVER_BACKEND,
    solver_lane=qualification.PRODUCTION_SOLVER_LANE,
    policy=wave.canonical_json_bytes(dict(qualification.PRODUCTION_V3_POLICY)),
    variable_map_bytes=qualification.PRODUCTION_V3_VARIABLE_MAP_BYTES,
    source_bundle_sha256=None,
    source_bundle_bytes=None,
    encoding_configuration_sha256=(
        qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_SHA256
    ),
    encoding_configuration_bytes=(
        qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_BYTES
    ),
    source_manifest_bytes=None,
    producer_manifest_bytes=None,
)


def _validate_public_inputs(
    inputs: projected.ProjectedStaticV3UnshardedInputs,
) -> tuple[int, int]:
    if type(inputs) is not projected.ProjectedStaticV3UnshardedInputs:
        raise ProvisioningError("public builder returned the wrong exact type")
    if inputs.base_scope != GLOBAL_BASE_SCOPE:
        raise ProvisioningError("public builder did not identify the global base")
    if (
        type(inputs.profile) is not str
        or inputs.profile != projected.PROJECTED_STATIC_V3_UNSHARDED_PROFILE
    ):
        raise ProvisioningError("public builder profile identity is crossed")
    for label in (
        "base_cnf",
        "variable_map",
        "dependency_manifest",
        "encoding_configuration",
    ):
        if type(getattr(inputs, label)) is not bytes:
            raise ProvisioningError(f"public builder {label} is not exact bytes")
    variables, clauses = scan_dimacs(inputs.base_cnf)
    mapping = _strict_json_array(
        inputs.variable_map,
        label="public builder variable map",
        canonical=True,
    )
    expected_mapping = [
        [center, point, index]
        for index, (center, point) in enumerate(
            (
                (center, point)
                for center in range(10)
                for point in range(10)
                if center != point
            ),
            start=1,
        )
    ]
    if mapping != expected_mapping or inputs.variable_map != wave.canonical_json_bytes(
        expected_mapping
    ):
        raise ProvisioningError("public builder variable map is not complete/canonical")
    dependency = _strict_json(
        inputs.dependency_manifest,
        label="public dependency manifest",
        canonical=True,
    )
    _keys(dependency, {"schema", "files"}, label="public dependency manifest")
    if dependency["schema"] != "p97-projected-static-v3-source-bundle/v1":
        raise ProvisioningError("public dependency manifest has the wrong schema")
    files = dependency["files"]
    if type(files) is not list or not files:
        raise ProvisioningError("public dependency manifest has no exact file list")
    previous = ""
    for item in files:
        if type(item) is not dict:
            raise ProvisioningError("public dependency entry is not an exact object")
        _keys(item, {"path", "sha256"}, label="public dependency entry")
        path = _string(item["path"], label="public dependency path")
        _digest(item["sha256"], label="public dependency digest")
        if path <= previous or path.startswith("/") or ".." in Path(path).parts:
            raise ProvisioningError("public dependency paths are not canonical")
        previous = path
    configuration = _strict_json(
        inputs.encoding_configuration,
        label="public encoding configuration",
        canonical=True,
    )
    _keys(
        configuration,
        {
            "spec_version",
            "semantic_assignment_schema",
            "project_blockers",
            "static_dual2",
            "mincut_scope",
        },
        label="public encoding configuration",
    )
    expected_configuration = {
        "spec_version": inputs.profile,
        "semantic_assignment_schema": "p97-phase3-semantic-assignment-v2-sf",
        "project_blockers": True,
        "static_dual2": True,
        "mincut_scope": "counterexample_card_ge_ten",
    }
    if (
        configuration != expected_configuration
        or inputs.encoding_configuration
        != wave.canonical_json_bytes(expected_configuration)
    ):
        raise ProvisioningError("public encoding configuration disagrees with profile")
    return variables, clauses


def build_current_unsharded_projected_v3_bundle() -> CurrentUnshardedBundle:
    """Build canonical current inputs without CEGAR, filesystem output, or PIQD."""

    try:
        inputs = projected.build_projected_static_v3_unsharded_inputs()
        variables, clauses = _validate_public_inputs(inputs)
    except (projected.StructuralCegarError, PiqdOracleError) as exc:
        raise ProvisioningError(str(exc)) from exc
    source_bundle_sha256 = _sha(inputs.dependency_manifest)
    source_value = {
        "schema": static.SOURCE_SCHEMA,
        "source_id": "p97-projected-static-v3-current-global-unsharded",
        "source_path": SOURCE_BUNDLE_NAME,
        "source_sha256": source_bundle_sha256,
        "finite_schema": projected.PROJECTED_STATIC_SCHEMA,
        "cardinality_scope": (
            "finite k=4,n=10,multiplicities=(4,4,5);base=global-unsharded"
        ),
        "source_theorem": "NONE: finite discovery input only",
        "claims": dict(_SOURCE_CLAIMS),
    }
    source_manifest = wave.canonical_json_bytes(source_value)
    producer_value = {
        "schema": static.PRODUCER_SCHEMA,
        "producer_id": "p97-projected-static-v3-current-global-unsharded",
        "producer_kind": "static-dimacs",
        "source_manifest": source_value,
        "source_manifest_sha256": _sha(source_manifest),
        "variable_map_sha256": _sha(inputs.variable_map),
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": wave.SAT_MEANS_COUNTEREXAMPLE,
        "claims": dict(_PRODUCER_CLAIMS),
    }
    producer_manifest = wave.canonical_json_bytes(producer_value)
    try:
        authenticated = static.authenticate_static_manifests(
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
        )
    except static.StaticPiqdRunnerError as exc:
        raise ProvisioningError(str(exc)) from exc
    base_sha256 = _sha(inputs.base_cnf)
    raw_identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=base_sha256,
        producer_manifest_sha256=authenticated.producer_sha256,
        requested_core_limit=1,
    )
    return CurrentUnshardedBundle(
        schema=CURRENT_BUNDLE_SCHEMA,
        base_scope="global-unsharded",
        profile=inputs.profile,
        base_cnf=inputs.base_cnf,
        base_cnf_sha256=base_sha256,
        num_variables=variables,
        num_clauses=clauses,
        variable_map=inputs.variable_map,
        variable_map_sha256=_sha(inputs.variable_map),
        source_bundle=inputs.dependency_manifest,
        source_bundle_sha256=source_bundle_sha256,
        encoding_configuration=inputs.encoding_configuration,
        source_manifest=source_manifest,
        source_manifest_sha256=authenticated.source_sha256,
        producer_manifest=producer_manifest,
        producer_manifest_sha256=authenticated.producer_sha256,
        raw_dimacs_identity=raw_identity,
    )


def make_test_only_profile(bundle: CurrentUnshardedBundle) -> ProvisioningProfile:
    """Return an explicit fake-transport profile that production-v2 rejects."""

    if type(bundle) is not CurrentUnshardedBundle:
        raise ProvisioningError("test profile requires an exact current bundle")
    return ProvisioningProfile(
        name="projected-static-v3-current-global-fake-transport-test-only",
        production=False,
        authority_schema=TEST_ONLY_AUTHORITY_SCHEMA,
        base_scope=bundle.base_scope,
        profile=bundle.profile,
        num_variables=bundle.num_variables,
        num_clauses=bundle.num_clauses,
        base_cnf_sha256=bundle.base_cnf_sha256,
        variable_map_sha256=bundle.variable_map_sha256,
        source_manifest_sha256=bundle.source_manifest_sha256,
        producer_manifest_sha256=bundle.producer_manifest_sha256,
        solver_name=qualification.PRODUCTION_SOLVER_NAME,
        solver_sha256=qualification.PRODUCTION_SOLVER_SHA256,
        solver_signature=qualification.PRODUCTION_SOLVER_SIGNATURE,
        solver_backend=qualification.PRODUCTION_SOLVER_BACKEND,
        solver_lane=qualification.PRODUCTION_SOLVER_LANE,
        policy=wave.canonical_json_bytes(dict(qualification.PRODUCTION_V2_POLICY)),
        variable_map_bytes=len(bundle.variable_map),
        source_bundle_sha256=bundle.source_bundle_sha256,
        source_bundle_bytes=len(bundle.source_bundle),
        encoding_configuration_sha256=_sha(bundle.encoding_configuration),
        encoding_configuration_bytes=len(bundle.encoding_configuration),
        source_manifest_bytes=len(bundle.source_manifest),
        producer_manifest_bytes=len(bundle.producer_manifest),
    )


def _profile_drift(
    bundle: CurrentUnshardedBundle, profile: ProvisioningProfile
) -> None:
    observed = {
        "base_scope": (
            qualification.PRODUCTION_V3_BASE_SCOPE
            if profile.authority_schema == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA
            else bundle.base_scope
        ),
        "profile": bundle.profile,
        "num_variables": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "base_cnf_sha256": bundle.base_cnf_sha256,
        "variable_map_sha256": bundle.variable_map_sha256,
        "source_manifest_sha256": bundle.source_manifest_sha256,
        "producer_manifest_sha256": bundle.producer_manifest_sha256,
        "variable_map_bytes": len(bundle.variable_map),
        "source_bundle_sha256": bundle.source_bundle_sha256,
        "source_bundle_bytes": len(bundle.source_bundle),
        "encoding_configuration_sha256": _sha(bundle.encoding_configuration),
        "encoding_configuration_bytes": len(bundle.encoding_configuration),
        "source_manifest_bytes": len(bundle.source_manifest),
        "producer_manifest_bytes": len(bundle.producer_manifest),
    }
    expected = {key: getattr(profile, key) for key in observed}
    disagreements = sorted(
        key
        for key in observed
        if expected[key] is not None and observed[key] != expected[key]
    )
    if disagreements:
        raise ProfileDriftError(
            f"{PROFILE_DRIFT}: current global bundle disagrees with profile "
            f"{profile.name!r} in {','.join(disagreements)}; no authority was minted"
        )


def _validate_profile_lineage(profile: ProvisioningProfile) -> None:
    """Reject constructed lookalike production profiles before any external action."""

    if type(profile) is not ProvisioningProfile:
        raise ProvisioningError("profile must be an exact ProvisioningProfile")
    if profile.production:
        expected = (
            PRODUCTION_V3_PROFILE
            if profile.authority_schema == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA
            else PRODUCTION_V2_PROFILE
            if profile.authority_schema == qualification.PRODUCTION_V2_AUTHORITY_SCHEMA
            else None
        )
        if expected is None or profile != expected:
            raise ProvisioningError("production profile is outside the sealed lineage")


def _daemon_url(value: Any) -> str:
    value = _string(value, label="daemon_url").rstrip("/")
    parsed = urllib.parse.urlsplit(value)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.path
        or parsed.query
        or parsed.fragment
    ):
        raise ProvisioningError("daemon_url must be an origin-only HTTP(S) URL")
    return value


def _content_type(headers: dict[str, str], expected: str, *, label: str) -> None:
    matches = [
        value.split(";", 1)[0].strip().lower()
        for key, value in headers.items()
        if key.lower() == "content-type"
    ]
    if matches != [expected]:
        raise ProvisioningError(f"{label} has the wrong Content-Type")


def _response(
    value: Any, *, label: str, maximum: int, content_type: str
) -> HttpResponse:
    if type(value) is not HttpResponse:
        raise ProvisioningError(f"{label} did not return exact HttpResponse")
    if type(value.status) is not int or value.status != 200:
        raise ProvisioningError(f"{label} did not return exact HTTP 200")
    if type(value.body) is not bytes or len(value.body) > maximum:
        raise ProvisioningError(f"{label} body is not bounded exact bytes")
    if type(value.headers) is not dict or any(
        type(key) is not str or type(item) is not str
        for key, item in value.headers.items()
    ):
        raise ProvisioningError(f"{label} headers are not an exact string map")
    _content_type(value.headers, content_type, label=label)
    return value


class _StrictPrepareTransport:
    def __init__(self, inner: Transport) -> None:
        self.inner = inner

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        headers: dict[str, str],
    ) -> HttpResponse:
        response = _response(
            self.inner(method, url, body, headers),
            label="producer prepare",
            maximum=_MAX_CONTROL_BYTES,
            content_type="application/json",
        )
        value = _strict_json(response.body, label="producer prepare")
        _keys(value, _PREPARE_KEYS, label="producer prepare")
        _uuid(value["job_id"], label="producer prepare job_id")
        if type(value["existing"]) is not bool:
            raise ProvisioningError("producer prepare existing is not builtin bool")
        for key in ("cnf_blob_hash", "identity_hash"):
            _digest(value[key], label=f"producer prepare {key}")
        for key in ("num_vars", "num_clauses"):
            _integer(value[key], label=f"producer prepare {key}", minimum=0)
        if (
            type(value["requested_core_limit"]) is not int
            or value["requested_core_limit"] != 1
        ):
            raise ProvisioningError("producer prepare core limit is not builtin 1")
        return response


def _request(
    transport: Transport,
    *,
    method: str,
    url: str,
    label: str,
    maximum: int,
    content_type: str,
) -> HttpResponse:
    return _response(
        transport(method, url, None, {"Accept": content_type}),
        label=label,
        maximum=maximum,
        content_type=content_type,
    )


def _prepare_value(prepared: PreparedJob) -> dict[str, Any]:
    if type(prepared) is not PreparedJob:
        raise ProvisioningError("PIQD did not return an exact PreparedJob")
    value = {
        "schema": qualification.PREPARED_JOB_SCHEMA,
        "job_id": prepared.job_id,
        "backend": prepared.backend,
        "solver_profile": prepared.solver_profile,
        "cnf_blob_hash": prepared.cnf_blob_hash,
        "identity_hash": prepared.identity_hash,
        "num_vars": prepared.num_vars,
        "num_clauses": prepared.num_clauses,
        "existing": prepared.existing,
        "requested_core_limit": prepared.requested_core_limit,
    }
    _uuid(value["job_id"], label="prepared job_id")
    if type(value["existing"]) is not bool:
        raise ProvisioningError("prepared existing is not builtin bool")
    return value


def _wave_manifest(bundle: CurrentUnshardedBundle) -> dict[str, Any]:
    value = {
        "schema": wave.WAVE_SCHEMA,
        "wave_id": f"provision-{bundle.raw_dimacs_identity[:24]}",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": projected.PROJECTED_STATIC_SCHEMA,
            "ingress_hypotheses_sha256": bundle.source_bundle_sha256,
            "finite_schema": projected.PROJECTED_STATIC_SCHEMA,
            "cardinality_scope": "finite global-unsharded k=4,n=10",
            "source_theorem": "NONE: finite discovery input only",
        },
        "encoding": {
            "cnf_sha256": bundle.base_cnf_sha256,
            "variable_map_sha256": bundle.variable_map_sha256,
            "producer_manifest_sha256": bundle.producer_manifest_sha256,
            "num_variables": bundle.num_variables,
            "num_clauses": bundle.num_clauses,
            "query_polarity": wave.SAT_MEANS_COUNTEREXAMPLE,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": bundle.variable_map_sha256,
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": wave.LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    wave.validate_wave_manifest(value)
    return value


def _validate_job(
    value: dict[str, Any],
    *,
    job_id: str,
    prepared: dict[str, Any],
    producer_manifest_hash: str | None,
) -> None:
    required_keys = qualification.JOB_STATUS_KEYS
    allowed_keys = _JOB_V2_ALLOWED_KEYS
    if producer_manifest_hash is not None:
        required_keys = required_keys | _JOB_V3_CUSTODY_KEYS
        allowed_keys = _JOB_V3_ALLOWED_KEYS
    if not required_keys <= set(value) or set(value) - allowed_keys:
        raise ProvisioningError("producer job has missing or unknown keys")
    if value["id"] != job_id:
        raise ProvisioningError("producer job UUID is crossed")
    _uuid(value["id"], label="producer job id")
    if value["status"] != "completed" or value["result"] != "SAT":
        raise ProvisioningError("producer job must be completed SAT evidence")
    if value["backend"] != prepared["backend"]:
        raise ProvisioningError("producer job backend is crossed")
    _string(value["project"], label="producer job project")
    for key in ("timeout_s", "march_timeout_s"):
        _integer(value[key], label=f"producer job {key}", minimum=1)
    _integer(value["wall_ms"], label="producer job wall_ms", minimum=0)
    _string(value["wall_human"], label="producer job wall_human")
    if value["running_for_s"] is not None or value["model_blob_hash"] is not None:
        raise ProvisioningError("producer job has inconsistent completed SAT fields")
    timestamps = [
        _integer(value[key], label=f"producer job {key}", minimum=0)
        for key in ("created_at", "confirmed_at", "started_at", "completed_at")
    ]
    if timestamps != sorted(timestamps):
        raise ProvisioningError("producer job timestamps are out of order")
    if (
        type(value["requested_core_limit"]) is not int
        or value["requested_core_limit"] != 1
    ):
        raise ProvisioningError("producer job core limit is not builtin 1")
    if (
        type(value["attested_solver_processes"]) is not int
        or value["attested_solver_processes"] != 1
    ):
        raise ProvisioningError("producer job process attestation is not builtin 1")
    if value["attestation_basis"] != "SINGLE_PROCESS_NO_PARALLEL_FLAG":
        raise ProvisioningError("producer job has the wrong attestation basis")
    for key in qualification.JOB_STATUS_FUTURE_CUSTODY_KEYS & set(value):
        _digest(value[key], label=f"producer job {key}")
        if value[key] != prepared[key]:
            raise ProvisioningError(f"producer job {key} is crossed")
    if producer_manifest_hash is not None:
        _digest(
            value["producer_manifest_hash"], label="producer job producer_manifest_hash"
        )
        if value["producer_manifest_hash"] != producer_manifest_hash:
            raise ProvisioningError("producer job producer_manifest_hash is crossed")
    if "log_tail" in value and type(value["log_tail"]) is not str:
        raise ProvisioningError("producer job log_tail is not builtin string")
    if "log_size_bytes" in value:
        _integer(value["log_size_bytes"], label="producer job log_size", minimum=0)
    if "progress" in value:
        progress = value["progress"]
        if type(progress) is not dict:
            raise ProvisioningError("producer job progress is not an exact object")
        _keys(progress, qualification.JOB_PROGRESS_KEYS, label="producer job progress")
        if (
            progress["backend"] != value["backend"]
            or progress["solver_started"] is not True
        ):
            raise ProvisioningError("producer job progress is inconsistent")
        if progress["spawn_failure"] is not None:
            raise ProvisioningError("producer job progress reports spawn failure")
        for key in ("last_line", "solver_version"):
            if progress[key] is not None and type(progress[key]) is not str:
                raise ProvisioningError(f"producer job progress {key} is malformed")
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
                _integer(progress[key], label=f"producer job progress {key}", minimum=0)


def _validate_version(value: dict[str, Any]) -> dict[str, Any]:
    _keys(value, _VERSION_KEYS, label="daemon version")
    daemon = value["daemon"]
    limits = value["limits"]
    if type(daemon) is not dict or type(limits) is not dict:
        raise ProvisioningError("daemon version nested values are not exact objects")
    _keys(daemon, _VERSION_DAEMON_KEYS, label="daemon version identity")
    _keys(limits, _VERSION_LIMIT_KEYS, label="daemon version limits")
    if (
        daemon["name"] != "piqd"
        or type(daemon["protocol_version"]) is not int
        or daemon["protocol_version"] != 1
    ):
        raise ProvisioningError("daemon version has the wrong identity/protocol")
    _string(daemon["version"], label="daemon version string")
    _digest(daemon["sha256"], label="daemon binary sha256")
    if type(limits["max_var"]) is not int or limits["max_var"] != 1_000_000:
        raise ProvisioningError("daemon max_var is not builtin 1000000")
    return daemon


def _validate_registry(
    value: dict[str, Any],
    *,
    version_daemon: dict[str, Any],
    profile: ProvisioningProfile,
) -> dict[str, Any]:
    _keys(value, _REGISTRY_KEYS, label="solver registry")
    daemon = value["daemon"]
    if type(daemon) is not dict:
        raise ProvisioningError("solver registry daemon is not an exact object")
    _keys(daemon, _REGISTRY_DAEMON_KEYS, label="solver registry daemon")
    _string(daemon["name"], label="solver registry daemon name")
    _string(daemon["version"], label="solver registry daemon version")
    if type(daemon["protocol_version"]) is not int:
        raise ProvisioningError("solver registry protocol version is not builtin int")
    if daemon != {key: version_daemon[key] for key in _REGISTRY_DAEMON_KEYS}:
        raise ProvisioningError("solver registry daemon identity is crossed")
    _string(value["solver_dir"], label="solver registry directory")
    solvers = value["solvers"]
    if type(solvers) is not list:
        raise ProvisioningError("solver registry solvers is not an exact list")
    selected: list[dict[str, Any]] = []
    for item in solvers:
        if type(item) is not dict:
            raise ProvisioningError("solver registry entry is not an exact object")
        _keys(item, _SOLVER_KEYS, label="solver registry entry")
        for key in (
            "lane",
            "name",
            "path",
            "sha256",
            "solver",
            "solver_signature",
            "solver_source",
            "solver_version",
            "worker",
            "worker_version",
        ):
            _string(item[key], label=f"solver registry {key}")
        _digest(item["sha256"], label="solver registry sha256")
        if type(item["protocol_version"]) is not int or item["protocol_version"] != 1:
            raise ProvisioningError("solver protocol version is not builtin 1")
        if type(item["usable"]) is not bool:
            raise ProvisioningError("solver usable is not builtin bool")
        if item["name"] == profile.solver_name:
            selected.append(item)
    if len(selected) != 1:
        raise ProvisioningError("solver registry did not select exactly one solver")
    solver = selected[0]
    identity = (
        solver["sha256"],
        solver["solver_signature"],
        solver["solver"],
        solver["lane"],
        solver["usable"],
    )
    expected = (
        profile.solver_sha256,
        profile.solver_signature,
        profile.solver_backend,
        profile.solver_lane,
        True,
    )
    if identity != expected:
        raise ProvisioningError("selected solver identity is crossed")
    return solver


def _authority_bytes(
    *,
    profile: ProvisioningProfile,
    daemon_url: str,
    version_raw: bytes,
    bundle: CurrentUnshardedBundle,
    job_id: str,
    prepared_existing: bool,
) -> bytes:
    unsigned = {
        "schema": profile.authority_schema,
        "daemon_url": daemon_url,
        "daemon_version_pre_sha256": _sha(version_raw),
        "source_manifest_sha256": bundle.source_manifest_sha256,
        "producer_manifest_sha256": bundle.producer_manifest_sha256,
        "base_cnf_sha256": bundle.base_cnf_sha256,
        "raw_dimacs_identity": bundle.raw_dimacs_identity,
        "producer_job_id": job_id,
        "solver": {
            "name": profile.solver_name,
            "sha256": profile.solver_sha256,
            "signature": profile.solver_signature,
            "backend": profile.solver_backend,
            "lane": profile.solver_lane,
        },
        "policy": _strict_json(
            profile.policy, label="authority policy", canonical=True
        ),
    }
    if profile.authority_schema == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA:
        unsigned.update(
            {
                "base_scope": qualification.PRODUCTION_V3_BASE_SCOPE,
                "builder_base_scope": bundle.base_scope,
                "profile": bundle.profile,
                "num_variables": bundle.num_variables,
                "num_clauses": bundle.num_clauses,
                "variable_map_sha256": bundle.variable_map_sha256,
                "variable_map_bytes": len(bundle.variable_map),
                "source_bundle_sha256": bundle.source_bundle_sha256,
                "source_bundle_bytes": len(bundle.source_bundle),
                "encoding_configuration_sha256": _sha(bundle.encoding_configuration),
                "encoding_configuration_bytes": len(bundle.encoding_configuration),
                "source_manifest_bytes": len(bundle.source_manifest),
                "producer_manifest_bytes": len(bundle.producer_manifest),
                "shard_index": None,
                "shard_count": None,
                "shard_literals": None,
                "producer_job_requested_core_limit": 1,
                "prepared_existing": prepared_existing,
                "claims": dict(qualification.PRODUCTION_V3_CLAIMS),
            }
        )
    return wave.canonical_json_bytes(
        {**unsigned, "authority_sha256": _sha(wave.canonical_json_bytes(unsigned))}
    )


def _open_parent(path: Path) -> tuple[int, str]:
    absolute = Path(os.path.abspath(os.fspath(path)))
    if absolute == Path(os.path.sep) or absolute.name in {"", ".", ".."}:
        raise ProvisioningError("output directory must be below the filesystem root")
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor = os.open(os.path.sep, flags)
    try:
        for part in absolute.parent.parts[1:]:
            next_descriptor = os.open(part, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        return descriptor, absolute.name
    except BaseException:
        os.close(descriptor)
        raise


def _write_all(descriptor: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(descriptor, view)
        if written <= 0:
            raise ProvisioningError("custody write made no progress")
        view = view[written:]


class _SecureOutput:
    def __init__(self, path: Path) -> None:
        self.path = Path(os.path.abspath(os.fspath(path)))
        try:
            parent, name = _open_parent(self.path)
        except OSError as exc:
            raise ProvisioningError(
                f"could not open safe output parent: {exc}"
            ) from exc
        try:
            os.mkdir(name, 0o700, dir_fd=parent)
            flags = (
                os.O_RDONLY
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_DIRECTORY", 0)
                | getattr(os, "O_NOFOLLOW", 0)
            )
            self.descriptor = os.open(name, flags, dir_fd=parent)
        except FileExistsError as exc:
            raise ProvisioningError("output directory already exists") from exc
        except OSError as exc:
            raise ProvisioningError(f"could not create private output: {exc}") from exc
        finally:
            os.close(parent)
        root = os.fstat(self.descriptor)
        self.identity = (root.st_dev, root.st_ino, root.st_uid)
        try:
            self._revalidate()
        except BaseException:
            os.close(self.descriptor)
            raise

    def _revalidate(self) -> None:
        held = os.fstat(self.descriptor)
        try:
            visible = os.lstat(self.path)
        except OSError as exc:
            raise ProvisioningError(
                "output directory lost its visible identity"
            ) from exc
        if (
            (held.st_dev, held.st_ino, held.st_uid) != self.identity
            or (visible.st_dev, visible.st_ino, visible.st_uid) != self.identity
            or not stat.S_ISDIR(held.st_mode)
            or held.st_uid != os.getuid()
            or stat.S_IMODE(held.st_mode) != 0o700
        ):
            raise ProvisioningError("output directory identity or mode changed")

    def write(self, name: str, payload: bytes) -> None:
        if (
            type(name) is not str
            or not name
            or Path(name).name != name
            or type(payload) is not bytes
        ):
            raise ProvisioningError("custody output name or payload is invalid")
        self._revalidate()
        flags = (
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0)
        )
        try:
            descriptor = os.open(name, flags, 0o600, dir_fd=self.descriptor)
        except OSError as exc:
            raise ProvisioningError(f"could not create custody file {name!r}") from exc
        try:
            before = os.fstat(descriptor)
            if (
                not stat.S_ISREG(before.st_mode)
                or before.st_uid != os.getuid()
                or stat.S_IMODE(before.st_mode) != 0o600
                or before.st_nlink != 1
            ):
                raise ProvisioningError("created custody file is unsafe")
            _write_all(descriptor, payload)
            os.fsync(descriptor)
            after = os.fstat(descriptor)
            visible = os.stat(name, dir_fd=self.descriptor, follow_symlinks=False)
            if (
                (after.st_dev, after.st_ino) != (before.st_dev, before.st_ino)
                or (visible.st_dev, visible.st_ino) != (before.st_dev, before.st_ino)
                or after.st_nlink != 1
                or visible.st_nlink != 1
                or stat.S_IMODE(after.st_mode) != 0o600
            ):
                raise ProvisioningError("created custody file lost its identity")
        finally:
            os.close(descriptor)
        self._revalidate()

    def close(self) -> None:
        try:
            self._revalidate()
            os.fsync(self.descriptor)
        finally:
            os.close(self.descriptor)


def provision_projected_v3_production(
    *,
    output_dir: Path,
    daemon_url: str,
    producer_job_id: str | None = None,
    solver_name: str = qualification.PRODUCTION_SOLVER_NAME,
    transport: Transport | None = None,
    timeout_s: int = 900,
    march_timeout_s: int = 900,
    profile: ProvisioningProfile = PRODUCTION_V3_PROFILE,
    allow_test_profile: bool = False,
) -> ProvisioningResult:
    """Provision exact evidence, failing profile drift before output or transport."""

    _validate_profile_lineage(profile)
    bundle = build_current_unsharded_projected_v3_bundle()
    _profile_drift(bundle, profile)

    if type(allow_test_profile) is not bool:
        raise ProvisioningError("allow_test_profile must be builtin bool")
    if not profile.production and allow_test_profile is not True:
        raise ProvisioningError("test-only profile requires explicit opt-in")
    if profile.production and allow_test_profile:
        raise ProvisioningError("production profile rejects test-only opt-in")
    if not profile.production and transport is None:
        raise ProvisioningError("test-only profile requires an injected transport")
    url = _daemon_url(daemon_url)
    if solver_name != profile.solver_name or type(solver_name) is not str:
        raise ProvisioningError("solver_name disagrees with the selected profile")
    if producer_job_id is not None:
        _uuid(producer_job_id, label="producer_job_id")
    for label, value in (
        ("timeout_s", timeout_s),
        ("march_timeout_s", march_timeout_s),
    ):
        _integer(value, label=label, minimum=1)

    strict_transport = _StrictPrepareTransport(
        transport if transport is not None else stdlib_http_transport
    )
    client = PiqdRawDimacsClient(
        url,
        transport=strict_transport,
        segmented_multipart=False,
    )
    manifest = _wave_manifest(bundle)
    try:
        prepared = client.prepare_cnf(
            wave_manifest=manifest,
            cnf=bundle.base_cnf,
            producer_manifest=bundle.producer_manifest,
            timeout_s=timeout_s,
            march_timeout_s=march_timeout_s,
            requested_core_limit=1,
        )
    except PiqdOracleError as exc:
        raise ProvisioningError(str(exc)) from exc
    prepared_value = _prepare_value(prepared)
    if (
        prepared.cnf_blob_hash != bundle.base_cnf_sha256
        or prepared.identity_hash != bundle.raw_dimacs_identity
        or prepared.num_vars != bundle.num_variables
        or prepared.num_clauses != bundle.num_clauses
        or prepared.backend != profile.solver_backend
        or prepared.solver_profile != profile.solver_lane
        or type(prepared.requested_core_limit) is not int
        or prepared.requested_core_limit != 1
    ):
        raise ProvisioningError("prepared job identity is crossed")
    if producer_job_id is not None and (
        prepared.job_id != producer_job_id or prepared.existing is not True
    ):
        raise ProvisioningError("requested producer job did not rebind as existing")
    job_id = prepared.job_id

    job_response = _request(
        strict_transport.inner,
        method="GET",
        url=f"{url}/jobs/{job_id}",
        label="producer job",
        maximum=qualification.MAX_JOB_STATUS_BYTES,
        content_type="application/json",
    )
    job = _strict_json(
        job_response.body,
        label="producer job",
        limit=qualification.MAX_JOB_STATUS_BYTES,
    )
    _validate_job(
        job,
        job_id=job_id,
        prepared=prepared_value,
        producer_manifest_hash=(
            bundle.producer_manifest_sha256
            if profile.authority_schema == qualification.PRODUCTION_V3_AUTHORITY_SCHEMA
            else None
        ),
    )
    blob_response = _request(
        strict_transport.inner,
        method="GET",
        url=f"{url}/jobs/{job_id}/blobs/{bundle.base_cnf_sha256}",
        label="producer base blob",
        maximum=_MAX_CNF_BYTES,
        content_type="application/octet-stream",
    )
    if blob_response.body != bundle.base_cnf:
        raise ProvisioningError("producer base blob is crossed")
    version_response = _request(
        strict_transport.inner,
        method="GET",
        url=f"{url}/version",
        label="daemon version",
        maximum=_MAX_CONTROL_BYTES,
        content_type="application/json",
    )
    version = _strict_json(version_response.body, label="daemon version")
    version_daemon = _validate_version(version)
    registry_response = _request(
        strict_transport.inner,
        method="GET",
        url=f"{url}/solvers",
        label="solver registry",
        maximum=_MAX_CONTROL_BYTES,
        content_type="application/json",
    )
    registry = _strict_json(registry_response.body, label="solver registry")
    _validate_registry(registry, version_daemon=version_daemon, profile=profile)
    authority = _authority_bytes(
        profile=profile,
        daemon_url=url,
        version_raw=version_response.body,
        bundle=bundle,
        job_id=job_id,
        prepared_existing=prepared.existing,
    )

    artifacts = {
        BASE_CNF_NAME: bundle.base_cnf,
        VARIABLE_MAP_NAME: bundle.variable_map,
        SOURCE_BUNDLE_NAME: bundle.source_bundle,
        ENCODING_CONFIGURATION_NAME: bundle.encoding_configuration,
        SOURCE_MANIFEST_NAME: bundle.source_manifest,
        PRODUCER_MANIFEST_NAME: bundle.producer_manifest,
        WAVE_MANIFEST_NAME: wave.canonical_json_bytes(manifest),
        PREPARED_JOB_NAME: wave.canonical_json_bytes(prepared_value),
        PRODUCER_JOB_NAME: job_response.body,
        DAEMON_VERSION_NAME: version_response.body,
        SOLVER_REGISTRY_NAME: registry_response.body,
        AUTHORITY_NAME: authority,
    }
    seal_unsigned = {
        "schema": PRODUCTION_SEAL_SCHEMA
        if profile.production
        else TEST_ONLY_SEAL_SCHEMA,
        "profile": profile.name,
        "production": profile.production,
        "base_scope": bundle.base_scope,
        "authority_sha256": _sha(authority),
        "producer_job_id": job_id,
        "prepared_existing": prepared.existing,
        "artifacts": [
            {"name": name, "sha256": _sha(payload)}
            for name, payload in sorted(artifacts.items())
        ],
        "claims": dict(_SEAL_CLAIMS),
    }
    seal = wave.canonical_json_bytes(
        {**seal_unsigned, "seal_sha256": _sha(wave.canonical_json_bytes(seal_unsigned))}
    )

    custody = _SecureOutput(Path(output_dir))
    try:
        for name, payload in artifacts.items():
            custody.write(name, payload)
        if profile.production:
            loaded = qualification.load_production_authority_v3(
                custody.path / AUTHORITY_NAME
            )
            qualification.validate_production_launch_authority_v3(
                loaded,
                daemon_url=url,
                source_manifest=bundle.source_manifest,
                producer_manifest=bundle.producer_manifest,
                producer_job_id=job_id,
                solver_name=solver_name,
            )
        custody.write(SEAL_NAME, seal)
    except qualification.QualificationError as exc:
        raise ProvisioningError(str(exc)) from exc
    finally:
        custody.close()
    return ProvisioningResult(
        directory=custody.path,
        authority_path=custody.path / AUTHORITY_NAME,
        seal_path=custody.path / SEAL_NAME,
        authority_sha256=_sha(authority),
        producer_job_id=job_id,
        prepared_existing=prepared.existing,
        production=profile.production,
    )


__all__ = [
    "AUTHORITY_NAME",
    "PRODUCTION_V2_PROFILE",
    "PRODUCTION_V3_PROFILE",
    "PROFILE_DRIFT",
    "SEAL_NAME",
    "TEST_ONLY_AUTHORITY_SCHEMA",
    "CurrentUnshardedBundle",
    "ProfileDriftError",
    "ProvisioningError",
    "ProvisioningProfile",
    "ProvisioningResult",
    "build_current_unsharded_projected_v3_bundle",
    "make_test_only_profile",
    "provision_projected_v3_production",
]
