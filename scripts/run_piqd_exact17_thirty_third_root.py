"""Fail-closed, crash-recoverable PIQD runner for exact-17 child33.

The lifecycle implementation is the hardened child32 runner: intent,
prepare/reconcile, epoch checks, stale-log guards, immutable retrieval, remote
CNF/manifest equality, terminal attestations, and model replay are delegated
without weakening them.  This adapter changes only the authenticated ingress
to child33.  Importing this module never contacts PIQD.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))

import run_piqd_exact17_thirty_second_root as _child32
import validate_exact17_thirty_second_model_refinements_ingress as _ingress

PRODUCTION_INGRESS_PATHS = _ingress.PRODUCTION_INGRESS_PATHS
PRODUCTION_INGRESS_SPEC = _ingress.PRODUCTION_INGRESS_SPEC
IngressPaths = _ingress.IngressPaths
IngressSpec = _ingress.IngressSpec
UnprovisionedError = _ingress.UnprovisionedError
validate_ingress = _ingress.validate_ingress


def _delegate(call):
    """Translate the child32 fail-closed sentinel at this public boundary."""
    try:
        return call()
    except _child32.UnprovisionedError as error:
        raise UnprovisionedError(str(error)) from error

ROOT = Path(__file__).resolve().parents[1]
REQUESTED_CORE_LIMIT = _child32.REQUESTED_CORE_LIMIT
ATTESTED_SOLVER_PROCESSES = _child32.ATTESTED_SOLVER_PROCESSES
ATTESTATION_BASIS = _child32.ATTESTATION_BASIS
TIMEOUT_S = _child32.TIMEOUT_S
MARCH_TIMEOUT_S = _child32.MARCH_TIMEOUT_S

RunnerPaths = _child32.RunnerPaths
RunnerSpec = _child32.RunnerSpec
PiqdClient = _child32.PiqdClient
SubprocessPiqdClient = _child32.SubprocessPiqdClient
UnreconciledPrepareError = _child32.UnreconciledPrepareError
ConfirmConflictError = _child32.ConfirmConflictError


PRODUCTION_RUNNER_PATHS = RunnerPaths(
    ingress=PRODUCTION_INGRESS_PATHS,
    intent=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-intent.json",
    prepared=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-prepared.json",
    state=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-live-state.json",
    final=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-final.json",
    model=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-model.json",
    solver_log=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-solver.log",
    lock=ROOT / "scratch/exact17-lean-to-sat/piqd-child33-core1-custody-runner.lock",
)

PRODUCTION_RUNNER_SPEC = RunnerSpec(
    ingress=PRODUCTION_INGRESS_SPEC,
    manifest_sha256="1f802e69fc382ba262cb54a9b21bee3b62b4c53cf6cbfaff837181cd9444fcfd",
    root_sha256="775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9",
    root_bytes=291_620_468,
    variables=308,
    clauses=5_847_248,
    project="erdos-97-96-exact17-child33",
    daemon_name="piqd",
    daemon_version="0.1.0",
    artifact_namespace="child33",
    timeout_s=TIMEOUT_S,
    march_timeout_s=MARCH_TIMEOUT_S,
)


def _require_child33_namespace(spec: RunnerSpec) -> None:
    if spec.artifact_namespace != "child33":
        raise ValueError("child33 runner requires artifact_namespace='child33'")


def _require_provisioned(spec: RunnerSpec) -> None:
    _require_child33_namespace(spec)
    if not spec.provisioned or not spec.ingress.provisioned:
        raise UnprovisionedError("child33 PIQD runner is UNPROVISIONED")


def expected_identity_hash(spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> str:
    _require_child33_namespace(spec)
    return _delegate(lambda: _child32.expected_identity_hash(spec))


def validate_local(
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator=validate_ingress,
) -> dict[str, Any]:
    _require_child33_namespace(spec)
    return _delegate(
        lambda: _child32.validate_local(paths, spec, ingress_validator=ingress_validator)
    )


def live_identity(client: PiqdClient, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> dict[str, Any]:
    _require_provisioned(spec)
    return _delegate(lambda: _child32.live_identity(client, spec))


def start(
    client: PiqdClient,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator=validate_ingress,
) -> dict[str, Any]:
    """Run the hardened child32 lifecycle against the child33 ingress."""
    _require_provisioned(spec)
    return _delegate(
        lambda: _child32.start(client, paths, spec, ingress_validator=ingress_validator)
    )


def reconcile_prepared_job(
    client: PiqdClient,
    job_id: str,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator=validate_ingress,
) -> dict[str, Any]:
    _require_provisioned(spec)
    return _delegate(
        lambda: _child32.reconcile_prepared_job(
            client, job_id, paths, spec, ingress_validator=ingress_validator
        )
    )


def replay_model(path: Path, assignment: object, spec: RunnerSpec = PRODUCTION_RUNNER_SPEC) -> dict[str, Any]:
    _require_child33_namespace(spec)
    return _child32.replay_model(path, assignment, spec)


def finalize(
    client: PiqdClient,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator=validate_ingress,
) -> dict[str, Any]:
    _require_provisioned(spec)
    return _delegate(
        lambda: _child32.finalize(client, paths, spec, ingress_validator=ingress_validator)
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("static-check", "start", "reconcile", "finalize"))
    parser.add_argument("--job-id")
    args = parser.parse_args()
    client = SubprocessPiqdClient()
    if args.command == "static-check":
        payload = {
            "root": validate_local(),
            "identity": live_identity(client),
        }
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
