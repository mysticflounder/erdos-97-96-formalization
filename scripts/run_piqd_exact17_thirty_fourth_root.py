"""Fail-closed child34 PIQD adapter.

Lifecycle operations reuse the audited child32 implementation.  This module
only binds the authenticated child34 ingress and custody paths.  The immutable
export is provisioned, while PIQD production remains UNPROVISIONED until a
fresh post-fix daemon receipt and solver identity are admitted.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import run_piqd_exact17_thirty_second_root as _base
from validate_exact17_thirty_third_model_refinements_ingress import (
    PRODUCTION_INGRESS_PATHS,
    PRODUCTION_INGRESS_SPEC,
    IngressPaths,
    IngressSpec,
    UnprovisionedError,
    validate_ingress,
)

ROOT = Path(__file__).resolve().parents[1]
REQUESTED_CORE_LIMIT = _base.REQUESTED_CORE_LIMIT
ATTESTED_SOLVER_PROCESSES = _base.ATTESTED_SOLVER_PROCESSES
ATTESTATION_BASIS = _base.ATTESTATION_BASIS
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
    clauses: int
    project: str = "erdos-97-96-exact17-child34"
    daemon_name: str = "piqd"
    daemon_version: str = "0.1.0"
    artifact_namespace: str = "child34"
    timeout_s: int = TIMEOUT_S
    march_timeout_s: int = MARCH_TIMEOUT_S

    def __post_init__(self) -> None:
        if self.artifact_namespace != "child34":
            raise ValueError("child34 runner requires artifact_namespace='child34'")
        if type(self.timeout_s) is not int or self.timeout_s <= 0 or type(self.march_timeout_s) is not int or self.march_timeout_s <= 0:
            raise ValueError("runner timeouts must be positive integers")

    @property
    def provisioned(self) -> bool:
        return self.ingress.provisioned and self.manifest_sha256 is not None and self.root_sha256 is not None and self.root_bytes is not None and self.root_sha256 == self.ingress.export.child_sha256 and self.root_bytes == self.ingress.export.child_bytes


PRODUCTION_RUNNER_PATHS = RunnerPaths(
    ingress=PRODUCTION_INGRESS_PATHS,
    intent=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-intent.json",
    prepared=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-prepared.json",
    state=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-live-state.json",
    final=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-final.json",
    model=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-model.json",
    solver_log=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-solver.log",
    lock=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-core1-custody-runner.lock",
)
PRODUCTION_RUNNER_SPEC = RunnerSpec(ingress=PRODUCTION_INGRESS_SPEC, manifest_sha256=None, root_sha256=None, root_bytes=None, variables=308, clauses=5_847_256)


def _require_provisioned(spec: RunnerSpec) -> None:
    if spec.artifact_namespace != "child34" or not spec.provisioned:
        raise UnprovisionedError("child34 PIQD runner is UNPROVISIONED")


def _lifecycle_spec(spec: RunnerSpec) -> _base.RunnerSpec:
    """Materialize the audited lifecycle shape without changing child34 identity."""
    return _base.RunnerSpec(
        ingress=spec.ingress,
        manifest_sha256=spec.manifest_sha256,
        root_sha256=spec.root_sha256,
        root_bytes=spec.root_bytes,
        variables=spec.variables,
        clauses=spec.clauses,
        project=spec.project,
        daemon_name=spec.daemon_name,
        daemon_version=spec.daemon_version,
        artifact_namespace=spec.artifact_namespace,
        timeout_s=spec.timeout_s,
        march_timeout_s=spec.march_timeout_s,
    )


def expected_identity_hash(spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> str:
    _require_provisioned(spec)
    return hashlib.sha256(f"raw-dimacs/v1\n{spec.ingress.backend}\n{spec.ingress.solver_profile}\n{spec.root_sha256}\n{spec.manifest_sha256}\ncores={REQUESTED_CORE_LIMIT}".encode()).hexdigest()


def validate_local(paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.validate_local(_base.RunnerPaths(paths.ingress, paths.intent, paths.prepared, paths.state, paths.final, paths.model, paths.solver_log, paths.lock), _lifecycle_spec(spec), ingress_validator=ingress_validator)


def start(client: PiqdClient, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    p = _base.RunnerPaths(paths.ingress, paths.intent, paths.prepared, paths.state, paths.final, paths.model, paths.solver_log, paths.lock)
    return _base.start(client, p, _lifecycle_spec(spec), ingress_validator=ingress_validator)


def reconcile_prepared_job(client: PiqdClient, job_id: str, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    p = _base.RunnerPaths(paths.ingress, paths.intent, paths.prepared, paths.state, paths.final, paths.model, paths.solver_log, paths.lock)
    return _base.reconcile_prepared_job(client, job_id, p, _lifecycle_spec(spec), ingress_validator=ingress_validator)


def replay_model(path: Path, assignment: object, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> dict[str, Any]:
    _require_provisioned(spec)
    return _base.replay_model(path, assignment, _lifecycle_spec(spec))


def finalize(client: PiqdClient, paths: RunnerPaths = PRODUCTION_RUNNER_PATHS, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC, *, ingress_validator=validate_ingress) -> dict[str, Any]:
    _require_provisioned(spec)
    p = _base.RunnerPaths(paths.ingress, paths.intent, paths.prepared, paths.state, paths.final, paths.model, paths.solver_log, paths.lock)
    return _base.finalize(client, p, _lifecycle_spec(spec), ingress_validator=ingress_validator)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("validate", "start", "finalize"))
    args = parser.parse_args()
    if args.command == "validate":
        print(json.dumps(validate_local(), indent=2, sort_keys=True))
        return 0
    _require_provisioned(PRODUCTION_RUNNER_SPEC)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
