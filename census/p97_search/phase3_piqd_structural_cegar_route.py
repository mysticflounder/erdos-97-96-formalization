"""Caller-specific PIQD route for the phase-3 structural CEGAR driver.

PIQD is an observational discovery oracle on this route.  A PIQD UNSAT answer
must be followed by a fresh local proof-producing solve on the frozen caller's
``.solver.cnf`` and supplied ``.solver.drat`` path; the legacy outer DRAT
checker remains authoritative after it publishes the terminal artifacts.
"""

from __future__ import annotations

import hashlib
import time
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import sat_generate as sat
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_static_solver_runner import (
    make_static_piqd_solver_runner,
)

CALLER = "phase3_structural_cegar"
PIQD_PROJECT = "erdos-97-96-formalization/phase3-structural-cegar"
ROUTE_SCHEMA = "p97-piqd-structural-cegar-route/v1"

SolverRunner = Callable[[Path, int, Path | None], Any]
_DEFAULT_LOCAL_PROOF_RUNNER = object()


class PiqdStructuralCegarRouteError(RuntimeError):
    """The caller-specific PIQD/local-proof contract failed closed."""


def _diagnostic_runner_identity(runner: SolverRunner) -> str:
    module = getattr(runner, "__module__", None)
    qualname = getattr(runner, "__qualname__", None)
    if isinstance(module, str) and isinstance(qualname, str):
        return f"{module}.{qualname}"
    runner_type = type(runner)
    return f"{runner_type.__module__}.{runner_type.__qualname__}"


@dataclass(frozen=True)
class StructuralCegarPiqdRoute:
    """A legacy-call composite plus truthful configuration metadata."""

    solver_runner: SolverRunner
    source_manifest_sha256: str
    producer_manifest_sha256: str
    local_proof_runner_identity: str
    local_proof_runner_origin: str

    def configuration(self) -> dict[str, object]:
        return {
            "schema": ROUTE_SCHEMA,
            "caller": CALLER,
            "piqd_project": PIQD_PROJECT,
            "discovery": "piqd-static-raw-dimacs-observational",
            "discovery_proof_path": "always-none",
            "legacy_composite_proof_path": "required-non-null",
            "observational_unsat_action": "one-fresh-local-proof-run",
            "local_proof_non_unsat": "raise-terminal-disagreement",
            "terminal_proof": "fresh-local-proof-producing-runner",
            "terminal_proof_runner_identity": self.local_proof_runner_identity,
            "terminal_proof_runner_identity_claim": (
                "diagnostic-only-not-authenticated"
            ),
            "terminal_proof_runner_origin": self.local_proof_runner_origin,
            "source_manifest_sha256": self.source_manifest_sha256,
            "producer_manifest_sha256": self.producer_manifest_sha256,
        }


def _legacy_composite_solver_runner(
    piqd_discovery_runner: SolverRunner,
    local_proof_runner: SolverRunner,
) -> SolverRunner:
    """Discover with PIQD, rerunning locally only after observational UNSAT."""

    def run(cnf_path: Path, timeout_s: int, proof_path: Path | None) -> Any:
        if proof_path is None:
            raise ValueError(
                "the frozen structural CEGAR caller must supply a proof path"
            )
        discovery = piqd_discovery_runner(cnf_path, timeout_s, None)
        if discovery.verdict != "UNSAT":
            return discovery
        local_result = local_proof_runner(cnf_path, timeout_s, proof_path)
        if local_result.verdict != "UNSAT":
            raise PiqdStructuralCegarRouteError(
                "fresh local proof runner returned "
                f"{local_result.verdict!r} after observational PIQD UNSAT"
            )
        return local_result

    return run


def make_piqd_structural_cegar_route(
    *,
    base_url: str,
    journal_root: Path,
    source_manifest_bytes: bytes,
    producer_manifest_bytes: bytes,
    transport: Any | None = None,
    sleep: Callable[[float], None] = time.sleep,
    local_proof_runner: SolverRunner | object = _DEFAULT_LOCAL_PROOF_RUNNER,
) -> StructuralCegarPiqdRoute:
    """Build the single-core static PIQD/local-proof composite for this caller."""

    if local_proof_runner is _DEFAULT_LOCAL_PROOF_RUNNER:
        proof_runner = sat.run_cadical
        proof_runner_origin = "factory-default-sat.run_cadical"
    else:
        if not callable(local_proof_runner):
            raise TypeError("local_proof_runner must be callable")
        proof_runner = local_proof_runner
        proof_runner_origin = "caller-supplied"

    policy = DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1)
    piqd_discovery_runner = make_static_piqd_solver_runner(
        base_url=base_url,
        journal_root=journal_root,
        source_manifest=source_manifest_bytes,
        producer_manifest=producer_manifest_bytes,
        policy=policy,
        transport=transport,
        sleep=sleep,
    )
    return StructuralCegarPiqdRoute(
        solver_runner=_legacy_composite_solver_runner(
            piqd_discovery_runner,
            proof_runner,
        ),
        source_manifest_sha256=hashlib.sha256(source_manifest_bytes).hexdigest(),
        producer_manifest_sha256=hashlib.sha256(producer_manifest_bytes).hexdigest(),
        local_proof_runner_identity=_diagnostic_runner_identity(proof_runner),
        local_proof_runner_origin=proof_runner_origin,
    )


__all__ = [
    "CALLER",
    "PIQD_PROJECT",
    "ROUTE_SCHEMA",
    "PiqdStructuralCegarRouteError",
    "StructuralCegarPiqdRoute",
    "make_piqd_structural_cegar_route",
]
