"""Code-defined execution registry for shared P97 CEGAR wave machinery.

The registry is intentionally closed: authenticated control records select a
known tuple, never an import path or arbitrary callable.  The frozen v1
registration remains byte-stable.  The v2 registration adds a closed offline
semantic profile and distinguishes the input manifest from the runner's
execution manifest.
"""

from __future__ import annotations

from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from types import MappingProxyType
from typing import Any

from census.p97_search.cegar_wave_assumption_profiles import (
    assumption_campaign_metadata,
)
from census.p97_search.phase3_cegar_assumption_engine import (
    ENGINE_SCHEMA as ASSUMPTION_CNF_ENGINE_SCHEMA,
)
from census.p97_search.phase3_cegar_assumption_engine import (
    AssumptionCnfEngineError,
    AssumptionCnfEngineResult,
    AssumptionCnfWaveEngine,
    inspect_assumption_cnf_engine_output,
    validate_assumption_cnf_engine_output,
    validate_assumption_cnf_engine_output_strict,
)
from census.p97_search.phase3_cegar_wave import sha256_bytes, wave_manifest_sha256
from census.p97_search.phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_EXECUTION_CAPABILITIES,
    ASSUMPTION_CNF_EXECUTION_MODE,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    ASSUMPTION_CNF_V1_REGISTRY_REVISION,
    EXECUTION_REGISTRY_SCHEMA,
    STATIC_CNF,
    STATIC_CNF_DATA_ONLY_EXECUTION_CAPABILITIES,
    STATIC_CNF_DATA_ONLY_EXECUTION_MODE,
    STATIC_CNF_DATA_ONLY_REGISTRY_REVISION,
    STATIC_CNF_EXECUTION_CAPABILITIES,
    STATIC_CNF_EXECUTION_MODE,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V3_DATA_ONLY,
    STATIC_CNF_SEMANTIC_VALIDATOR,
    STATIC_CNF_SEMANTIC_VALIDATOR_V2,
    STATIC_CNF_V2_REGISTRY_REVISION,
    WaveControl,
    WaveControlError,
    bind_assumption_cnf,
    bind_static_cnf,
    load_wave_control,
)
from census.p97_search.phase3_cegar_wave_engine import (
    ENGINE_SCHEMA,
    ENGINE_SCHEMA_V2,
    StaticCnfEngineError,
    StaticCnfEngineResult,
    StaticCnfWaveEngine,
    inspect_static_cnf_engine_output_structure,
)

REGISTRY_SCHEMA = EXECUTION_REGISTRY_SCHEMA
REGISTRY_REVISION = "2026-08-13.1"
REGISTRY_REVISION_V1 = REGISTRY_REVISION
REGISTRY_REVISION_V2 = STATIC_CNF_V2_REGISTRY_REVISION
REGISTRY_REVISION_DATA_ONLY = STATIC_CNF_DATA_ONLY_REGISTRY_REVISION
REGISTRY_REVISION_ASSUMPTION_V1 = ASSUMPTION_CNF_V1_REGISTRY_REVISION
STATIC_CNF_PIQD_ADAPTER_V2 = STATIC_CNF_PIQD_ADAPTER
STATIC_CNF_ENGINE_SCHEMA_V2 = ENGINE_SCHEMA_V2
STATIC_CNF_SEMANTIC_PROFILE = STATIC_CNF_SEMANTIC_VALIDATOR_V2
STATIC_CNF_DATA_ONLY_ENGINE_SCHEMA = "p97-cegar-wave-data-only/v1"

PLAN = "plan"
RUN = "run"
VALIDATE_INGRESS = "validate-ingress"
VALIDATE_OUTPUT = "validate-output"
STATUS = "status"
CHECK = "check"

_NATIVE_PATH_TYPE = type(Path())
_CAPABILITIES = STATIC_CNF_EXECUTION_CAPABILITIES


class WaveRegistryError(ValueError):
    """A wave selected no exact code-defined execution registration."""


@dataclass(frozen=True)
class ExecutionRegistration:
    wave_kind: str
    adapter_id: str
    adapter_schema: str
    registry_revision: str
    engine_schema: str
    semantic_validator: str
    execution_mode: str
    capabilities: tuple[str, ...]
    permits_campaign: bool
    permits_export: bool
    permits_diagnostic_mining: bool
    permits_terminal_proof: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "wave_kind": self.wave_kind,
            "adapter_id": self.adapter_id,
            "adapter_schema": self.adapter_schema,
            "registry_revision": self.registry_revision,
            "engine_schema": self.engine_schema,
            "semantic_validator": self.semantic_validator,
            "execution_mode": self.execution_mode,
            "capabilities": list(self.capabilities),
            "permits_campaign": self.permits_campaign,
            "permits_export": self.permits_export,
            "permits_diagnostic_mining": self.permits_diagnostic_mining,
            "permits_terminal_proof": self.permits_terminal_proof,
        }


STATIC_CNF_EXECUTION = ExecutionRegistration(
    wave_kind=STATIC_CNF,
    adapter_id=STATIC_CNF_PIQD_ADAPTER,
    adapter_schema=STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    registry_revision=REGISTRY_REVISION,
    engine_schema=ENGINE_SCHEMA,
    semantic_validator=STATIC_CNF_SEMANTIC_VALIDATOR,
    execution_mode=STATIC_CNF_EXECUTION_MODE,
    capabilities=_CAPABILITIES,
    permits_campaign=False,
    permits_export=False,
    permits_diagnostic_mining=False,
    permits_terminal_proof=False,
)
STATIC_CNF_EXECUTION_V1 = STATIC_CNF_EXECUTION

STATIC_CNF_EXECUTION_V2 = ExecutionRegistration(
    wave_kind=STATIC_CNF,
    adapter_id=STATIC_CNF_PIQD_ADAPTER_V2,
    adapter_schema=STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
    registry_revision=REGISTRY_REVISION_V2,
    engine_schema=STATIC_CNF_ENGINE_SCHEMA_V2,
    semantic_validator=STATIC_CNF_SEMANTIC_PROFILE,
    execution_mode=STATIC_CNF_EXECUTION_MODE,
    capabilities=_CAPABILITIES,
    permits_campaign=False,
    permits_export=False,
    permits_diagnostic_mining=False,
    permits_terminal_proof=False,
)

STATIC_CNF_DATA_ONLY_V1 = ExecutionRegistration(
    wave_kind=STATIC_CNF,
    adapter_id=STATIC_CNF_PIQD_ADAPTER_V2,
    adapter_schema=STATIC_CNF_PIQD_ADAPTER_SCHEMA_V3_DATA_ONLY,
    registry_revision=REGISTRY_REVISION_DATA_ONLY,
    engine_schema=STATIC_CNF_DATA_ONLY_ENGINE_SCHEMA,
    semantic_validator=STATIC_CNF_SEMANTIC_PROFILE,
    execution_mode=STATIC_CNF_DATA_ONLY_EXECUTION_MODE,
    capabilities=STATIC_CNF_DATA_ONLY_EXECUTION_CAPABILITIES,
    permits_campaign=False,
    permits_export=False,
    permits_diagnostic_mining=False,
    permits_terminal_proof=False,
)

ASSUMPTION_CNF_EXECUTION_V1 = ExecutionRegistration(
    wave_kind=ASSUMPTION_CNF,
    adapter_id=ASSUMPTION_CNF_PIQD_ADAPTER,
    adapter_schema=ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    registry_revision=REGISTRY_REVISION_ASSUMPTION_V1,
    engine_schema=ASSUMPTION_CNF_ENGINE_SCHEMA,
    semantic_validator=ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    execution_mode=ASSUMPTION_CNF_EXECUTION_MODE,
    capabilities=ASSUMPTION_CNF_EXECUTION_CAPABILITIES,
    permits_campaign=True,
    permits_export=False,
    permits_diagnostic_mining=True,
    permits_terminal_proof=False,
)

EXECUTION_REGISTRY = MappingProxyType(
    {
        (
            STATIC_CNF_EXECUTION.wave_kind,
            STATIC_CNF_EXECUTION.adapter_id,
            STATIC_CNF_EXECUTION.adapter_schema,
        ): STATIC_CNF_EXECUTION
    }
)
EXECUTION_REGISTRY_V1 = EXECUTION_REGISTRY
EXECUTION_REGISTRY_ALL = MappingProxyType(
    {
        **EXECUTION_REGISTRY,
        (
            STATIC_CNF_EXECUTION_V2.wave_kind,
            STATIC_CNF_EXECUTION_V2.adapter_id,
            STATIC_CNF_EXECUTION_V2.adapter_schema,
        ): STATIC_CNF_EXECUTION_V2,
        (
            ASSUMPTION_CNF_EXECUTION_V1.wave_kind,
            ASSUMPTION_CNF_EXECUTION_V1.adapter_id,
            ASSUMPTION_CNF_EXECUTION_V1.adapter_schema,
        ): ASSUMPTION_CNF_EXECUTION_V1,
        (
            STATIC_CNF_DATA_ONLY_V1.wave_kind,
            STATIC_CNF_DATA_ONLY_V1.adapter_id,
            STATIC_CNF_DATA_ONLY_V1.adapter_schema,
        ): STATIC_CNF_DATA_ONLY_V1,
    }
)


def _validated_control(control: WaveControl) -> WaveControl:
    if type(control) is not WaveControl:
        raise WaveRegistryError("control must be an exact WaveControl")
    try:
        validated = load_wave_control(control.canonical_bytes)
    except (AttributeError, WaveControlError) as error:
        raise WaveRegistryError("control failed canonical revalidation") from error
    if validated != control:
        raise WaveRegistryError("control differs from its canonical bytes")
    return validated


def resolve_execution_registration(control: WaveControl) -> ExecutionRegistration:
    """Resolve one validated control through the closed code registry."""

    validated = _validated_control(control)
    key = (
        validated.registration.wave_kind,
        validated.registration.adapter_id,
        validated.registration.schema_version,
    )
    registration = EXECUTION_REGISTRY_ALL.get(key)
    if registration is None:
        raise WaveRegistryError("control selects no registered execution")
    if registration.semantic_validator != validated.registration.semantic_validator:
        raise WaveRegistryError("execution semantic validator is crossed")
    if registration.permits_campaign != validated.registration.permits_campaign:
        raise WaveRegistryError("execution campaign capability is crossed")
    if registration.permits_terminal_proof != (
        validated.registration.permits_terminal_proof
    ):
        raise WaveRegistryError("execution proof capability is crossed")
    return registration


def resolve_execution_registration_envelope(
    envelope: dict[str, Any],
) -> ExecutionRegistration:
    """Resolve and authenticate a registration carried by an output envelope."""

    if type(envelope) is not dict:
        raise WaveRegistryError("output execution registration must be an exact object")
    if set(envelope) != {"schema", "registry_revision", "registration"}:
        raise WaveRegistryError("output execution registration has an inexact schema")
    if envelope["schema"] != REGISTRY_SCHEMA:
        raise WaveRegistryError("output execution registration schema is crossed")
    revision = envelope["registry_revision"]
    value = envelope["registration"]
    if type(revision) is not str or type(value) is not dict:
        raise WaveRegistryError("output execution registration has invalid fields")
    key_fields = ("wave_kind", "adapter_id", "adapter_schema")
    if any(type(value.get(field)) is not str for field in key_fields):
        raise WaveRegistryError("output execution registration has invalid fields")
    key = tuple(value[field] for field in key_fields)
    registration = EXECUTION_REGISTRY_ALL.get(key)
    if registration is None:
        raise WaveRegistryError("output selects no registered execution")
    if revision != registration.registry_revision or value != registration.as_dict():
        raise WaveRegistryError("output execution registration is absent or crossed")
    return registration


def _registration_envelope(
    registration: ExecutionRegistration = STATIC_CNF_EXECUTION,
) -> dict[str, Any]:
    return {
        "schema": REGISTRY_SCHEMA,
        "registry_revision": registration.registry_revision,
        "registration": registration.as_dict(),
    }


def describe_execution(control: WaveControl) -> dict[str, Any]:
    validated = _validated_control(control)
    registration = resolve_execution_registration(validated)
    return {
        **_registration_envelope(registration),
        "control_sha256": sha256_bytes(validated.canonical_bytes),
    }


def plan_execution(control: WaveControl, package_root: Path) -> dict[str, Any]:
    """Validate ingress and return the exact deterministic execution plan."""

    ingress = validate_registered_ingress(control, package_root)
    registration = resolve_execution_registration(control)
    steps = (
        [
            "authenticate-control",
            "authenticate-static-package",
            "authenticate-retained-legacy-references",
            "stop-without-execution",
        ]
        if registration is STATIC_CNF_DATA_ONLY_V1
        else [
            "authenticate-control",
            "authenticate-streaming-parent-and-campaign",
            "open-one-fresh-piqd-session",
            "solve-closed-assumption-cells-sequentially",
            "replay-sat-source-semantics",
            "validate-receipts-and-session-custody",
            "close-once",
            "publish-create-once-envelope",
        ]
        if registration is ASSUMPTION_CNF_EXECUTION_V1
        else [
            "authenticate-control",
            "authenticate-static-package",
            "run-one-piqd-discovery",
            "validate-receipt-and-custody",
            "publish-create-once-envelope",
        ]
    )
    return {
        **describe_execution(control),
        "plan": {
            "steps": steps,
            "proof_path": None,
            "workers": 1,
            "sequential": True,
        },
        "ingress": ingress,
    }


def validate_registered_ingress(
    control: WaveControl, package_root: Path
) -> dict[str, Any]:
    """Validate one registered package without transport or publication."""

    if type(package_root) is not _NATIVE_PATH_TYPE or not package_root.is_absolute():
        raise WaveRegistryError("package_root must be an absolute native Path")
    registration = resolve_execution_registration(control)
    if registration is ASSUMPTION_CNF_EXECUTION_V1:
        binding = bind_assumption_cnf(control, package_root)
        parent = binding.parent_identity
        return {
            "wave_manifest_sha256": wave_manifest_sha256(binding.wave_manifest),
            "parent": {
                "path": str(binding.parent_path),
                "sha256": parent.sha256,
                "bytes": parent.num_bytes,
                "variables": parent.num_vars,
                "clauses": parent.num_clauses,
                "max_var": parent.max_var,
                "journal_sha256": parent.journal_sha256,
                "journal_bytes": parent.journal_bytes,
                "all_variables_used": parent.all_variables_used,
                "source_dev": parent.source_dev,
                "source_ino": parent.source_ino,
                "path_chain": [list(item) for item in parent.path_chain],
            },
            "producer_manifest_sha256": sha256_bytes(binding.producer_manifest),
            "variable_map_sha256": sha256_bytes(binding.variable_map),
            "campaign_sha256": sha256_bytes(binding.campaign_bytes),
            "campaign": assumption_campaign_metadata(binding.campaign),
        }
    binding = bind_static_cnf(control, package_root)
    encoding = binding.wave_manifest["encoding"]
    ingress = {
        "wave_manifest_sha256": wave_manifest_sha256(binding.wave_manifest),
        "cnf_sha256": sha256_bytes(binding.cnf),
        "producer_manifest_sha256": sha256_bytes(binding.producer_manifest),
        "variable_map_sha256": sha256_bytes(binding.variable_map),
        "num_variables": encoding["num_variables"],
        "num_clauses": encoding["num_clauses"],
    }
    if binding.semantic_profile is not None:
        if binding.semantic_profile_bytes is None:
            raise WaveRegistryError("semantic profile bytes are absent")
        profile = binding.semantic_profile.payload
        ingress.update(
            {
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
        if registration is STATIC_CNF_DATA_ONLY_V1:
            retained = dict(control.retained_hardlink_counts)
            ingress["semantic_artifacts"] = [
                {
                    **row,
                    "link_count": retained.get(row["role"], 1),
                    "custody": (
                        "RETAINED_LEGACY_HARDLINK_REFERENCE"
                        if row["role"] in retained
                        else "EXCLUSIVE_SINGLE_LINK"
                    ),
                }
                for row in ingress["semantic_artifacts"]
            ]
    return ingress


def execute_registered_wave(
    control: WaveControl,
    package_root: Path,
    *,
    output_path: Path,
    base_url: str,
    journal_root: Path | None = None,
    timeout_s: int | None = None,
    transport: Any = None,
    sleep: Callable[[float], None] | None = None,
    solver_signature: str | None = None,
    export_digest: Any = None,
    job_blob_digest: Any = None,
    session_factory: Callable[..., Any] | None = None,
    resume_session: str | None = None,
) -> StaticCnfEngineResult | AssumptionCnfEngineResult:
    """Execute exactly the adapter selected by the closed registration."""

    registration = resolve_execution_registration(control)
    if RUN not in registration.capabilities:
        raise WaveRegistryError("registered data-only wave cannot execute")
    if registration is ASSUMPTION_CNF_EXECUTION_V1:
        if journal_root is not None or timeout_s is not None or sleep is not None:
            raise WaveRegistryError(
                "ASSUMPTION_CNF rejects static-runner journal/timeout arguments"
            )
        if type(solver_signature) is not str or not solver_signature:
            raise WaveRegistryError(
                "ASSUMPTION_CNF requires a nonempty builtin solver_signature"
            )
        engine = AssumptionCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=output_path,
            base_url=base_url,
            solver_signature=solver_signature,
            transport=transport,
            export_digest=export_digest,
            job_blob_digest=job_blob_digest,
            session_factory=session_factory,
            resume_session=resume_session,
            execution_registration=_registration_envelope(registration),
        )
        return engine.run()
    if (
        solver_signature is not None
        or resume_session is not None
        or any(
            value is not None
            for value in (export_digest, job_blob_digest, session_factory)
        )
    ):
        raise WaveRegistryError("STATIC_CNF rejects assumption-runner arguments")
    if journal_root is None:
        raise WaveRegistryError("STATIC_CNF requires journal_root")
    engine = StaticCnfWaveEngine(
        control=control,
        package_root=package_root,
        output_path=output_path,
        base_url=base_url,
        journal_root=journal_root,
        transport=transport,
        sleep=sleep,
        execution_registration=_registration_envelope(registration),
    )
    result = engine.run(timeout_s=timeout_s, proof_path=None)
    accepted = validate_registered_output(control, package_root, result.envelope_path)
    return StaticCnfEngineResult(
        result.classification,
        result.envelope_path,
        accepted,
    )


def inspect_registered_output_structure(path: Path) -> dict[str, Any]:
    """Inspect self-consistency only; this does not authenticate package identity."""

    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise WaveRegistryError("output path must be an absolute native Path")
    try:
        envelope = inspect_static_cnf_engine_output_structure(path)
        registration_key = "execution_registry"
    except StaticCnfEngineError:
        try:
            envelope = inspect_assumption_cnf_engine_output(path)
            registration_key = "execution_registration"
        except AssumptionCnfEngineError as assumption_error:
            raise WaveRegistryError(
                "output matches no registered engine schema"
            ) from assumption_error
    try:
        registration = resolve_execution_registration_envelope(
            envelope[registration_key]
        )
    except (KeyError, TypeError) as error:
        raise WaveRegistryError(
            "output execution registration is absent or crossed"
        ) from error
    if envelope[registration_key] != _registration_envelope(registration):
        raise WaveRegistryError("output execution registration is absent or crossed")
    return envelope


def validate_registered_output(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Cross-bind a registered output to its control and static package offline."""

    validated = _validated_control(control)
    registration = resolve_execution_registration(validated)
    if VALIDATE_OUTPUT not in registration.capabilities:
        raise WaveRegistryError("registered data-only wave has no execution output")
    if registration is ASSUMPTION_CNF_EXECUTION_V1:
        try:
            envelope = validate_assumption_cnf_engine_output(
                validated, package_root, path
            )
        except AssumptionCnfEngineError as error:
            raise WaveRegistryError(
                "assumption output failed registered validation"
            ) from error
        if envelope["execution_registration"] != _registration_envelope(registration):
            raise WaveRegistryError("output registration is crossed with its control")
        return envelope
    ingress = validate_registered_ingress(validated, package_root)
    envelope = inspect_registered_output_structure(path)
    registration = resolve_execution_registration_envelope(
        envelope["execution_registry"]
    )
    if registration is not resolve_execution_registration(validated):
        raise WaveRegistryError("output registration is crossed with its control")
    try:
        manifest = envelope["wave_manifest"]
        encoding = manifest["manifest"]["encoding"]
        observed = {
            "control_sha256": envelope["control"]["sha256"],
            "cnf_sha256": envelope["package"]["cnf_sha256"],
            "producer_manifest_sha256": envelope["package"]["producer_manifest_sha256"],
            "variable_map_sha256": envelope["package"]["variable_map_sha256"],
            "num_variables": encoding["num_variables"],
            "num_clauses": encoding["num_clauses"],
            "manifest_encoding": {
                "cnf_sha256": encoding["cnf_sha256"],
                "producer_manifest_sha256": encoding["producer_manifest_sha256"],
                "variable_map_sha256": encoding["variable_map_sha256"],
            },
        }
        if registration is STATIC_CNF_EXECUTION_V2:
            observed.update(
                {
                    "wave_manifest_sha256": manifest["sha256"],
                    "semantic_profile": envelope["semantic_profile"],
                    "semantic_artifacts": envelope["semantic_artifacts"],
                }
            )
    except (KeyError, TypeError) as error:
        raise WaveRegistryError("output lacks registered ingress bindings") from error
    expected: dict[str, Any] = {
        "control_sha256": sha256_bytes(validated.canonical_bytes),
        "cnf_sha256": ingress["cnf_sha256"],
        "producer_manifest_sha256": ingress["producer_manifest_sha256"],
        "variable_map_sha256": ingress["variable_map_sha256"],
        "num_variables": ingress["num_variables"],
        "num_clauses": ingress["num_clauses"],
        "manifest_encoding": {
            "cnf_sha256": ingress["cnf_sha256"],
            "producer_manifest_sha256": ingress["producer_manifest_sha256"],
            "variable_map_sha256": ingress["variable_map_sha256"],
        },
    }
    if registration is STATIC_CNF_EXECUTION_V2:
        expected.update(
            {
                "wave_manifest_sha256": ingress["wave_manifest_sha256"],
                "semantic_profile": ingress["semantic_profile"],
                "semantic_artifacts": ingress["semantic_artifacts"],
            }
        )
    if observed != expected:
        raise WaveRegistryError("output is crossed with its control or package")
    return envelope


def validate_registered_replay(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Run the strict solver-free semantic replay validator for ASSUMPTION_CNF."""

    validated = _validated_control(control)
    registration = resolve_execution_registration(validated)
    if registration is not ASSUMPTION_CNF_EXECUTION_V1:
        raise WaveRegistryError(
            "strict replay validation is available only for ASSUMPTION_CNF"
        )
    try:
        envelope = validate_assumption_cnf_engine_output_strict(
            validated, package_root, path
        )
    except AssumptionCnfEngineError as error:
        raise WaveRegistryError(
            "assumption output failed strict replay validation"
        ) from error
    if envelope["execution_registration"] != _registration_envelope(registration):
        raise WaveRegistryError("output registration is crossed with its control")
    return envelope


def check_registered_output(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Backward-compatible name for full offline authenticated validation."""

    return validate_registered_output(control, package_root, path)


def registry_snapshot() -> dict[str, Any]:
    registrations = [
        EXECUTION_REGISTRY[key].as_dict() for key in sorted(EXECUTION_REGISTRY)
    ]
    return {
        "schema": REGISTRY_SCHEMA,
        "registry_revision": REGISTRY_REVISION,
        "registrations": registrations,
    }


__all__ = [
    "ASSUMPTION_CNF_EXECUTION_V1",
    "CHECK",
    "EXECUTION_REGISTRY",
    "EXECUTION_REGISTRY_ALL",
    "EXECUTION_REGISTRY_V1",
    "PLAN",
    "REGISTRY_REVISION",
    "REGISTRY_REVISION_ASSUMPTION_V1",
    "REGISTRY_REVISION_DATA_ONLY",
    "REGISTRY_REVISION_V1",
    "REGISTRY_REVISION_V2",
    "REGISTRY_SCHEMA",
    "RUN",
    "STATIC_CNF_DATA_ONLY_ENGINE_SCHEMA",
    "STATIC_CNF_DATA_ONLY_V1",
    "STATIC_CNF_ENGINE_SCHEMA_V2",
    "STATIC_CNF_EXECUTION",
    "STATIC_CNF_EXECUTION_V1",
    "STATIC_CNF_EXECUTION_V2",
    "STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2",
    "STATIC_CNF_PIQD_ADAPTER_V2",
    "STATIC_CNF_SEMANTIC_PROFILE",
    "STATUS",
    "VALIDATE_INGRESS",
    "VALIDATE_OUTPUT",
    "ExecutionRegistration",
    "WaveRegistryError",
    "check_registered_output",
    "describe_execution",
    "execute_registered_wave",
    "inspect_registered_output_structure",
    "plan_execution",
    "registry_snapshot",
    "resolve_execution_registration",
    "resolve_execution_registration_envelope",
    "validate_registered_ingress",
    "validate_registered_output",
    "validate_registered_replay",
]
