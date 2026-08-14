"""Closed shared-CLI profile for the hardened Exact17 Child38 lifecycle."""

from __future__ import annotations

from collections.abc import Callable
from dataclasses import dataclass
from typing import Any

from scripts import run_piqd_exact17_thirty_eighth_root as child38

LIFECYCLE_SCHEMA = "p97-cegar-exact17-lifecycle/v1"
CLEANUP_SCHEMA = "p97-cegar-cleanup-eligibility/v1"
CHILD38_PROFILE_ID = "exact17-child38"
UnprovisionedError = child38.UnprovisionedError
UnreconciledPrepareError = child38.UnreconciledPrepareError
ConfirmConflictError = child38.ConfirmConflictError


class Exact17LifecycleError(RuntimeError):
    """Raised when the closed Exact17 lifecycle boundary is crossed."""


@dataclass(frozen=True)
class Exact17LifecycleProfile:
    profile_id: str
    project: str
    artifact_namespace: str
    compatibility_route: str


CHILD38_PROFILE = Exact17LifecycleProfile(
    profile_id=CHILD38_PROFILE_ID,
    project="erdos-97-96-exact17-child38",
    artifact_namespace="child38",
    compatibility_route="scripts/run_piqd_exact17_thirty_eighth_root.py",
)


def require_profile(profile_id: str) -> Exact17LifecycleProfile:
    """Resolve the exact closed lifecycle profile without dynamic imports."""

    if type(profile_id) is not str or profile_id != CHILD38_PROFILE_ID:
        raise Exact17LifecycleError(
            f"profile must be the exact builtin string {CHILD38_PROFILE_ID!r}"
        )
    return CHILD38_PROFILE


def _require_child38_spec(
    profile: Exact17LifecycleProfile, spec: child38.RunnerSpec
) -> None:
    if type(spec) is not child38.RunnerSpec:
        raise Exact17LifecycleError("spec must be an exact Child38 RunnerSpec")
    if type(spec.project) is not str or spec.project != profile.project:
        raise Exact17LifecycleError("spec project crossed the Child38 profile")
    if (
        type(spec.artifact_namespace) is not str
        or spec.artifact_namespace != profile.artifact_namespace
    ):
        raise Exact17LifecycleError("spec namespace crossed the Child38 profile")


def lifecycle_plan(profile_id: str = CHILD38_PROFILE_ID) -> dict[str, Any]:
    profile = require_profile(profile_id)
    return {
        "schema": LIFECYCLE_SCHEMA,
        "profile": profile.profile_id,
        "project": profile.project,
        "artifact_namespace": profile.artifact_namespace,
        "execution_mode": "LEGACY_COMPATIBLE_PIQD_LIFECYCLE",
        "compatibility_route": profile.compatibility_route,
        "native_shared_engine": False,
        "workers": 1,
        "sequential": True,
        "local_fallback": False,
        "proof_or_theorem_claim": False,
        "commands": [
            "validate-local",
            "live-identity",
            "start",
            "reconcile",
            "finalize",
        ],
        "custody": [
            "intent",
            "prepared",
            "state",
            "final",
            "model",
            "solver-log",
            "lock",
        ],
    }


def cleanup_eligibility(profile_id: str = CHILD38_PROFILE_ID) -> dict[str, Any]:
    """Report retirement eligibility; this API never deletes or moves files."""

    profile = require_profile(profile_id)
    return {
        "schema": CLEANUP_SCHEMA,
        "profile": profile.profile_id,
        "status": "RETAIN",
        "eligible": False,
        "deletion_performed": False,
        "compatibility_route": profile.compatibility_route,
        "blockers": [
            "native shared lifecycle replacement is not implemented",
            "fresh native campaign and semantic validation are not complete",
            "successor admission is not complete",
            "rollback drill is not complete",
            "legacy caller count is not proven zero",
        ],
        "protected": [
            "Child38 lifecycle and custody artifacts",
            "Child39 frozen shadow and successor inputs",
            "Child32 base lifecycle implementation and historical evidence",
        ],
        "next_safe_action": "retain and continue compatibility migration",
    }


def new_client(profile_id: str = CHILD38_PROFILE_ID) -> child38.PiqdClient:
    require_profile(profile_id)
    return child38.SubprocessPiqdClient()


def validate_local(
    profile_id: str = CHILD38_PROFILE_ID,
    *,
    paths: child38.RunnerPaths = child38.PRODUCTION_RUNNER_PATHS,
    spec: child38.RunnerSpec = child38.PRODUCTION_RUNNER_SPEC,
    ingress_validator: Callable[..., dict[str, Any]] = child38.validate_ingress,
) -> dict[str, Any]:
    profile = require_profile(profile_id)
    _require_child38_spec(profile, spec)
    return child38.validate_local(paths, spec, ingress_validator=ingress_validator)


def live_identity(
    client: child38.PiqdClient,
    profile_id: str = CHILD38_PROFILE_ID,
    *,
    spec: child38.RunnerSpec = child38.PRODUCTION_RUNNER_SPEC,
) -> dict[str, Any]:
    profile = require_profile(profile_id)
    _require_child38_spec(profile, spec)
    return child38.live_identity(client, spec)


def start(
    client: child38.PiqdClient,
    profile_id: str = CHILD38_PROFILE_ID,
    *,
    paths: child38.RunnerPaths = child38.PRODUCTION_RUNNER_PATHS,
    spec: child38.RunnerSpec = child38.PRODUCTION_RUNNER_SPEC,
    ingress_validator: Callable[..., dict[str, Any]] = child38.validate_ingress,
) -> dict[str, Any]:
    profile = require_profile(profile_id)
    _require_child38_spec(profile, spec)
    return child38.start(client, paths, spec, ingress_validator=ingress_validator)


def reconcile(
    client: child38.PiqdClient,
    job_id: str,
    profile_id: str = CHILD38_PROFILE_ID,
    *,
    paths: child38.RunnerPaths = child38.PRODUCTION_RUNNER_PATHS,
    spec: child38.RunnerSpec = child38.PRODUCTION_RUNNER_SPEC,
    ingress_validator: Callable[..., dict[str, Any]] = child38.validate_ingress,
) -> dict[str, Any]:
    profile = require_profile(profile_id)
    _require_child38_spec(profile, spec)
    if type(job_id) is not str or not job_id:
        raise Exact17LifecycleError("job_id must be a nonempty builtin string")
    return child38.reconcile_prepared_job(
        client,
        job_id,
        paths,
        spec,
        ingress_validator=ingress_validator,
    )


def finalize(
    client: child38.PiqdClient,
    profile_id: str = CHILD38_PROFILE_ID,
    *,
    paths: child38.RunnerPaths = child38.PRODUCTION_RUNNER_PATHS,
    spec: child38.RunnerSpec = child38.PRODUCTION_RUNNER_SPEC,
    ingress_validator: Callable[..., dict[str, Any]] = child38.validate_ingress,
) -> dict[str, Any]:
    profile = require_profile(profile_id)
    _require_child38_spec(profile, spec)
    return child38.finalize(client, paths, spec, ingress_validator=ingress_validator)
