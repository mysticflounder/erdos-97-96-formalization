"""Fail-closed PIQD lifecycle adapter for the unprovisioned exact-17 Child44."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import run_piqd_exact17_thirty_second_root as _base
from validate_exact17_forty_fourth_ingress import (
    PRODUCTION_INGRESS_PATHS,
    PRODUCTION_INGRESS_SPEC,
    IngressPaths,
    IngressSpec,
    UnprovisionedError,
    validate_ingress,
)
from validate_exact17_forty_fourth_model_refinements_export import (
    CHILD_BYTES,
    CHILD_CLAUSES,
    CHILD_SHA256,
    MODEL_JOB_ID,
    MODEL_PATH,
)

_base.HARDENED_ARTIFACT_NAMESPACES = _base.HARDENED_ARTIFACT_NAMESPACES | {"child44"}
ROOT = Path(__file__).resolve().parents[1]
REQUESTED_CORE_LIMIT = _base.REQUESTED_CORE_LIMIT
TIMEOUT_S = _base.TIMEOUT_S
MARCH_TIMEOUT_S = _base.MARCH_TIMEOUT_S
PiqdClient = _base.PiqdClient
SubprocessPiqdClient = _base.SubprocessPiqdClient
UnreconciledPrepareError = _base.UnreconciledPrepareError
ConfirmConflictError = _base.ConfirmConflictError


@dataclass(frozen=True)
class RunnerPaths:
    ingress: IngressPaths
    intent: Path
    prepared: Path
    state: Path
    final: Path
    model: Path
    solver_log: Path
    lock: Path


@dataclass(frozen=True)
class RunnerSpec:
    ingress: IngressSpec
    manifest_sha256: str | None
    root_sha256: str | None
    root_bytes: int | None
    variables: int
    clauses: int | None
    project: str = "erdos-97-96-exact17-child44"
    daemon_name: str = "piqd"
    daemon_version: str = "0.1.0"
    artifact_namespace: str = "child44"
    timeout_s: int = TIMEOUT_S
    march_timeout_s: int = MARCH_TIMEOUT_S

    def __post_init__(self) -> None:
        if self.artifact_namespace != "child44":
            raise ValueError("child44 runner requires artifact_namespace='child44'")

    @property
    def provisioned(self) -> bool:
        return self.ingress.provisioned and all(
            value is not None for value in (self.manifest_sha256, self.root_sha256, self.root_bytes, self.clauses)
        ) and all(
            (
                self.ingress == replace(PRODUCTION_INGRESS_SPEC, manifest_sha256=self.ingress.manifest_sha256),
                self.manifest_sha256 == self.ingress.manifest_sha256,
                self.root_sha256 == self.ingress.export.child_sha256,
                self.root_bytes == self.ingress.export.child_bytes,
                self.clauses == self.ingress.export.child_clauses,
                self.variables == 308,
                self.project == "erdos-97-96-exact17-child44",
                self.daemon_name == "piqd",
                self.daemon_version == "0.1.0",
                self.timeout_s == TIMEOUT_S,
                self.march_timeout_s == MARCH_TIMEOUT_S,
            )
        )


PRODUCTION_RUNNER_PATHS = RunnerPaths(
    PRODUCTION_INGRESS_PATHS,
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-intent.json",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-prepared.json",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-live-state.json",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-final.json",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-model.json",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-solver.log",
    ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-runner.lock",
)
PRODUCTION_RUNNER_SPEC = RunnerSpec(
    PRODUCTION_INGRESS_SPEC,
    "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048",
    CHILD_SHA256,
    CHILD_BYTES,
    308,
    CHILD_CLAUSES,
)
AUTHENTICATED_PARENT_MODEL_PATH = Path(MODEL_PATH)
AUTHENTICATED_PARENT_MODEL_JOB_ID = MODEL_JOB_ID


def _require_provisioned(spec: RunnerSpec) -> None:
    if spec.artifact_namespace != "child44" or not spec.provisioned:
        raise UnprovisionedError("child44 PIQD runner is UNPROVISIONED")


def _lifecycle_spec(spec: RunnerSpec) -> _base.RunnerSpec:
    _require_provisioned(spec)
    assert spec.clauses is not None
    return _base.RunnerSpec(ingress=spec.ingress, manifest_sha256=spec.manifest_sha256, root_sha256=spec.root_sha256, root_bytes=spec.root_bytes, variables=spec.variables, clauses=spec.clauses, project=spec.project, daemon_name=spec.daemon_name, daemon_version=spec.daemon_version, artifact_namespace=spec.artifact_namespace, timeout_s=spec.timeout_s, march_timeout_s=spec.march_timeout_s)


def expected_identity_hash(spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> str:
    _require_provisioned(spec)
    material = f"raw-dimacs/v1\n{spec.ingress.backend}\n{spec.ingress.solver_profile}\n{spec.root_sha256}\n{spec.manifest_sha256}\ncores={REQUESTED_CORE_LIMIT}"
    return hashlib.sha256(material.encode()).hexdigest()


def _paths(paths: RunnerPaths) -> _base.RunnerPaths:
    return _base.RunnerPaths(paths.ingress, paths.intent, paths.prepared, paths.state, paths.final, paths.model, paths.solver_log, paths.lock)


def validate_local(paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.validate_local(_paths(paths), _lifecycle_spec(spec), ingress_validator=ingress_validator)


def live_identity(client: PiqdClient, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.live_identity(client, _lifecycle_spec(spec))


def start(client: PiqdClient, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.start(client, _paths(paths), _lifecycle_spec(spec), ingress_validator=ingress_validator)


def reconcile_prepared_job(client: PiqdClient, job_id: str, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.reconcile_prepared_job(client, job_id, _paths(paths), _lifecycle_spec(spec), ingress_validator=ingress_validator)


def finalize(client: PiqdClient, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.finalize(client, _paths(paths), _lifecycle_spec(spec), ingress_validator=ingress_validator)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("static-check", "start", "reconcile", "finalize"))
    parser.add_argument("--job-id")
    args = parser.parse_args(argv)
    client = SubprocessPiqdClient()
    if args.command == "static-check":
        payload = {"root": validate_local(), "identity": live_identity(client)}
    elif args.command == "start":
        payload = start(client)
    elif args.command == "reconcile":
        if not args.job_id:
            parser.error("reconcile requires --job-id")
        payload = reconcile_prepared_job(client, args.job_id)
    else:
        payload = finalize(client)
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
