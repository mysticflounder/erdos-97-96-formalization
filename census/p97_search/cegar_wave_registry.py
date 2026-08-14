"""Code-defined execution registry for shared P97 CEGAR wave machinery.

The registry is intentionally closed: authenticated control records select a
known tuple, never an import path or arbitrary callable.  This first revision
exposes the existing one-shot static-CNF engine without changing its control
or publication schemas.
"""

from __future__ import annotations

from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from types import MappingProxyType
from typing import Any

from census.p97_search.phase3_cegar_wave import sha256_bytes, wave_manifest_sha256
from census.p97_search.phase3_cegar_wave_control import (
    STATIC_CNF,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_SEMANTIC_VALIDATOR,
    WaveControl,
    WaveControlError,
    bind_static_cnf,
    load_wave_control,
)
from census.p97_search.phase3_cegar_wave_engine import (
    ENGINE_SCHEMA,
    StaticCnfEngineResult,
    StaticCnfWaveEngine,
    validate_static_cnf_engine_output,
)

REGISTRY_SCHEMA = "p97-cegar-execution-registry/v1"
REGISTRY_REVISION = "2026-08-13.1"
STATIC_CNF_EXECUTION_MODE = "one-shot-static-cnf"

PLAN = "plan"
RUN = "run"
VALIDATE_INGRESS = "validate-ingress"
VALIDATE_OUTPUT = "validate-output"
STATUS = "status"
CHECK = "check"

_NATIVE_PATH_TYPE = type(Path())
_CAPABILITIES = (CHECK, PLAN, RUN, STATUS, VALIDATE_INGRESS, VALIDATE_OUTPUT)


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

EXECUTION_REGISTRY = MappingProxyType(
    {
        (
            STATIC_CNF_EXECUTION.wave_kind,
            STATIC_CNF_EXECUTION.adapter_id,
            STATIC_CNF_EXECUTION.adapter_schema,
        ): STATIC_CNF_EXECUTION
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
    registration = EXECUTION_REGISTRY.get(key)
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


def _registration_envelope(
    registration: ExecutionRegistration = STATIC_CNF_EXECUTION,
) -> dict[str, Any]:
    return {
        "schema": REGISTRY_SCHEMA,
        "registry_revision": REGISTRY_REVISION,
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
    return {
        **describe_execution(control),
        "plan": {
            "steps": [
                "authenticate-control",
                "authenticate-static-package",
                "run-one-piqd-discovery",
                "validate-receipt-and-custody",
                "publish-create-once-envelope",
            ],
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
    resolve_execution_registration(control)
    binding = bind_static_cnf(control, package_root)
    encoding = binding.wave_manifest["encoding"]
    return {
        "wave_manifest_sha256": wave_manifest_sha256(binding.wave_manifest),
        "cnf_sha256": sha256_bytes(binding.cnf),
        "producer_manifest_sha256": sha256_bytes(binding.producer_manifest),
        "variable_map_sha256": sha256_bytes(binding.variable_map),
        "num_variables": encoding["num_variables"],
        "num_clauses": encoding["num_clauses"],
    }


def execute_registered_wave(
    control: WaveControl,
    package_root: Path,
    *,
    output_path: Path,
    base_url: str,
    journal_root: Path,
    timeout_s: int | None = None,
    transport: Any = None,
    sleep: Callable[[float], None] | None = None,
) -> StaticCnfEngineResult:
    """Execute the exact registered static-CNF adapter once."""

    registration = resolve_execution_registration(control)
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
    return engine.run(timeout_s=timeout_s, proof_path=None)


def validate_registered_output(path: Path) -> dict[str, Any]:
    """Validate a published static-CNF envelope entirely offline."""

    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise WaveRegistryError("output path must be an absolute native Path")
    envelope = validate_static_cnf_engine_output(path)
    if envelope.get("execution_registry") != _registration_envelope():
        raise WaveRegistryError("output execution registration is absent or crossed")
    return envelope


def check_registered_output(
    control: WaveControl, package_root: Path, path: Path
) -> dict[str, Any]:
    """Cross-bind a registered output to its control and static package offline."""

    validated = _validated_control(control)
    ingress = validate_registered_ingress(validated, package_root)
    envelope = validate_registered_output(path)
    try:
        manifest = envelope["wave_manifest"]
        encoding = manifest["manifest"]["encoding"]
        observed = {
            "control_sha256": envelope["control"]["sha256"],
            "wave_manifest_sha256": manifest["sha256"],
            "cnf_sha256": envelope["package"]["cnf_sha256"],
            "producer_manifest_sha256": envelope["package"]["producer_manifest_sha256"],
            "variable_map_sha256": envelope["package"]["variable_map_sha256"],
            "num_variables": encoding["num_variables"],
            "num_clauses": encoding["num_clauses"],
        }
    except (KeyError, TypeError) as error:
        raise WaveRegistryError("output lacks registered ingress bindings") from error
    expected = {
        "control_sha256": sha256_bytes(validated.canonical_bytes),
        **ingress,
    }
    if observed != expected:
        raise WaveRegistryError("output is crossed with its control or package")
    return envelope


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
    "CHECK",
    "EXECUTION_REGISTRY",
    "PLAN",
    "REGISTRY_REVISION",
    "REGISTRY_SCHEMA",
    "RUN",
    "STATIC_CNF_EXECUTION",
    "STATUS",
    "VALIDATE_INGRESS",
    "VALIDATE_OUTPUT",
    "ExecutionRegistration",
    "WaveRegistryError",
    "check_registered_output",
    "describe_execution",
    "execute_registered_wave",
    "plan_execution",
    "registry_snapshot",
    "resolve_execution_registration",
    "validate_registered_ingress",
    "validate_registered_output",
]
