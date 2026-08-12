"""Execute one authenticated exact-12 next-row named-deletion arm cell.

This runner is additive.  It leaves the historical 12-cell runner and its
schemas untouched while executing one of the 72 source-proved
placement-by-named-deletion-arm refinements.  SAT is accepted only after
independent candidate, arm, and exact-CNF replay.  Discovery UNSAT is accepted
only after a fresh identical-CNF proof-producing run verifies the DRAT proof.

Even ``UNSAT_DRAT_VERIFIED`` concerns one finite arm cell only.  It is not
aggregate arm/placement coverage, a universal lift, or a Lean sorry closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Callable
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_next_row_cell_run import (
    _artifact,
    _claim_empty_workdir,
    _json_sha256,
    _sha256_file,
    _status_from_nonterminal,
    _write_bytes,
    _write_json,
    cnf_assignment_satisfies,
)
from .exact12_next_row_valuation import (
    ARM_COMPILER_SCHEMA,
    ARM_LEAN_INGRESS_THEOREM,
    CompiledExact12NextRowArmCell,
    Exact12NextRowValuationError,
    added_constraints_hold,
    arm_cells,
    compile_arm_cell,
    decode_blockers,
    decode_distinguished_d,
    named_deletion_arm_holds,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

RUN_SCHEMA = "p97_rigid221_exact12_next_row_named_deletion_arm_cell_run.v1"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_named_deletion_arm_bound_job.v1"
CLAUSE_DELTA_SCHEMA = (
    "p97_rigid221_exact12_next_row_named_deletion_arm_clause_delta.v1"
)
SUCCESS_STATUSES = frozenset({"SAT_WITNESS_REPLAYED", "UNSAT_DRAT_VERIFIED"})

SOURCE_PATHS = (
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/exact12_v14_schedule.py",
    "census/card_head/exact12_next_row_valuation.py",
    "census/card_head/exact12_next_row_cell_run.py",
    "census/card_head/exact12_next_row_arm_cell_run.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobSemantics.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NormalizedNextRowOnlyHitIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PhysicalCycleIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221V14SourceJobBridge.lean"
    ),
)


def _source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    artifacts: list[dict[str, Any]] = []
    for relative in SOURCE_PATHS:
        path = repo_root / relative
        if not path.is_file():
            raise EncodingError(f"required source is missing: {relative}")
        artifacts.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return artifacts


def _build_job(
    repo_root: Path,
    arm_cell_index: int,
    compiled: CompiledExact12NextRowArmCell,
    cnf_bytes: bytes,
) -> dict[str, Any]:
    payload = {
        "schema": JOB_SCHEMA,
        "scope": (
            "one finite next-row placement by named-deletion-arm cell; no "
            "aggregate coverage, universal lift, terminal bank, or Lean-closure "
            "claim"
        ),
        "compiler_schema": ARM_COMPILER_SCHEMA,
        "arm_cell_index": arm_cell_index,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "lean_ingress_theorem": ARM_LEAN_INGRESS_THEOREM,
        "compiler_manifest": compiled.manifest(),
        "cnf": {
            "bytes": len(cnf_bytes),
            "sha256": hashlib.sha256(cnf_bytes).hexdigest(),
            "variables": compiled.final_n_variables,
            "clauses": compiled.final_n_clauses,
        },
        "sources": _source_manifest(repo_root),
    }
    return {**payload, "job_id": _json_sha256(payload)}


def run_arm_cell(
    repo_root: Path,
    workdir: Path,
    arm_cell_index: int,
    *,
    timeout_seconds: int = 60,
    nice: int = 10,
    solver: Callable[..., CadicalResult] = solve_cadical,
) -> dict[str, Any]:
    """Materialize, solve, replay, and authenticate one fixed-arm cell."""

    if isinstance(arm_cell_index, bool) or not isinstance(arm_cell_index, int):
        raise EncodingError("arm_cell_index must be a plain integer")
    schedule = arm_cells()
    if not 0 <= arm_cell_index < len(schedule):
        raise EncodingError(
            f"arm_cell_index must lie in [0, {len(schedule) - 1}]"
        )
    if timeout_seconds <= 0:
        raise EncodingError("timeout_seconds must be positive")
    if not 1 <= nice <= 19:
        raise EncodingError("nice must lie in [1, 19]")

    lock_path = _claim_empty_workdir(workdir)
    try:
        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compiled = compile_arm_cell(instance, schedule[arm_cell_index])
        cnf_bytes = instance.dimacs().encode("ascii")
        job = _build_job(repo_root, arm_cell_index, compiled, cnf_bytes)
        clause_delta = {
            "schema": CLAUSE_DELTA_SCHEMA,
            "job_id": job["job_id"],
            "arm_cell_index": arm_cell_index,
            "cell": {
                "placement_index": compiled.cell.placement_index,
                "joint_deletion": compiled.cell.joint_deletion,
                "v": compiled.cell.v,
                "arm": compiled.cell.arm,
            },
            "clauses": [list(clause) for clause in compiled.clause_delta],
            "base_clause_delta_sha256": compiled.clause_delta_sha256,
            "named_deletion_clauses": [
                list(clause)
                for clause in compiled.named_deletion_clause_delta
            ],
            "named_deletion_clause_delta_sha256": (
                compiled.named_deletion_clause_delta_sha256
            ),
        }

        job_path = workdir / "job.json"
        clause_delta_path = workdir / "clause_delta.json"
        discovery_cnf_path = workdir / "discovery.cnf"
        terminal_cnf_path = workdir / "terminal.cnf"
        proof_path = workdir / "terminal.drat"
        model_path = workdir / "model.json"
        _write_json(job_path, job)
        _write_json(clause_delta_path, clause_delta)
        _write_bytes(discovery_cnf_path, cnf_bytes)

        discovery = solver(
            instance,
            discovery_cnf_path,
            timeout_seconds=timeout_seconds,
            nice=nice,
            proof_path=None,
        )
        terminal: CadicalResult | None = None
        candidate_replayed = False
        base_added_constraints_replayed = False
        named_deletion_arm_replayed = False
        exact_cnf_replayed = False
        model_replayed = False
        error: str | None = None

        if discovery.verdict == "SAT":
            positive = discovery.positive_variables
            cube = discovery.cube
            if positive is None or cube is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted positive variables or decoded cube"
            else:
                try:
                    blockers = decode_blockers(
                        positive, compiled.base.blocker_variables
                    )
                    d = decode_distinguished_d(
                        positive, compiled.base.distinguished_d_variables
                    )
                    candidate_replayed = source_faithful_cube_ok(
                        instance.model, cube
                    )
                    base_added_constraints_replayed = added_constraints_hold(
                        compiled.cell.base_cell(), cube, blockers, d
                    )
                    named_deletion_arm_replayed = named_deletion_arm_holds(
                        compiled.cell.arm, cube, blockers
                    )
                    exact_cnf_replayed = cnf_assignment_satisfies(
                        instance.cnf.clauses,
                        positive,
                        n_variables=instance.cnf.n_variables,
                    )
                    model_replayed = (
                        candidate_replayed
                        and base_added_constraints_replayed
                        and named_deletion_arm_replayed
                        and exact_cnf_replayed
                    )
                    _write_json(
                        model_path,
                        {
                            "arm_cell_index": arm_cell_index,
                            "cell": {
                                "placement_index": compiled.cell.placement_index,
                                "joint_deletion": compiled.cell.joint_deletion,
                                "v": compiled.cell.v,
                                "arm": compiled.cell.arm,
                            },
                            "cube": {
                                str(center): row
                                for center, row in sorted(cube.items())
                            },
                            "blockers": {
                                str(source): center
                                for source, center in sorted(blockers.items())
                            },
                            "distinguished_d": d,
                            "positive_variables": sorted(positive),
                            "replay": {
                                "candidate": candidate_replayed,
                                "base_added_constraints": (
                                    base_added_constraints_replayed
                                ),
                                "named_deletion_arm": (
                                    named_deletion_arm_replayed
                                ),
                                "exact_cnf": exact_cnf_replayed,
                            },
                        },
                    )
                except (
                    Exact12NextRowValuationError,
                    EncodingError,
                    ValueError,
                ) as exc:
                    error = f"SAT replay failed: {exc}"
                if model_replayed:
                    status = "SAT_WITNESS_REPLAYED"
                else:
                    status = "SAT_REPLAY_FAILED"
                    error = error or "SAT model failed an independent replay gate"
        elif discovery.verdict == "UNSAT":
            _write_bytes(terminal_cnf_path, cnf_bytes)
            terminal = solver(
                instance,
                terminal_cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )
            terminal_matches = (
                terminal_cnf_path.is_file()
                and _sha256_file(terminal_cnf_path) == job["cnf"]["sha256"]
            )
            if (
                terminal.verdict == "UNSAT"
                and terminal.proof_verified
                and proof_path.is_file()
                and terminal_matches
            ):
                status = "UNSAT_DRAT_VERIFIED"
            else:
                status = "DISCOVERY_UNSAT_UNVERIFIED"
                error = (
                    "fresh terminal run did not reproduce a verified identical-CNF "
                    "UNSAT result"
                )
        else:
            status, error = _status_from_nonterminal(discovery)

        artifacts = {
            "job": _artifact(job_path),
            "clause_delta": _artifact(clause_delta_path),
            "discovery_cnf": _artifact(discovery_cnf_path),
            "model": _artifact(model_path),
            "terminal_cnf": _artifact(terminal_cnf_path),
            "proof": _artifact(proof_path),
        }
        required_ok = (
            artifacts["job"] is not None
            and artifacts["job"]["sha256"] == _json_sha256(job)
            and artifacts["clause_delta"] is not None
            and artifacts["clause_delta"]["sha256"]
            == _json_sha256(clause_delta)
            and artifacts["discovery_cnf"] is not None
            and artifacts["discovery_cnf"]["sha256"] == job["cnf"]["sha256"]
        )
        if not required_ok:
            status = "ARTIFACT_ERROR"
            error = (
                "required job, clause delta, or discovery CNF failed authentication"
            )

        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite next-row placement by named-deletion-arm cell; no "
                "aggregate coverage, universal lift, terminal bank, or "
                "Lean-closure claim"
            ),
            "job_schema": JOB_SCHEMA,
            "job_id": job["job_id"],
            "job_sha256": _json_sha256(job),
            "arm_cell_index": arm_cell_index,
            "cell": {
                "placement_index": compiled.cell.placement_index,
                "joint_deletion": compiled.cell.joint_deletion,
                "v": compiled.cell.v,
                "arm": compiled.cell.arm,
            },
            "status": status,
            "discovery_verdict": discovery.verdict,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": (
                terminal.proof_verified if terminal else False
            ),
            "replay": {
                "model": model_replayed,
                "candidate": candidate_replayed,
                "base_added_constraints": base_added_constraints_replayed,
                "named_deletion_arm": named_deletion_arm_replayed,
                "exact_cnf": exact_cnf_replayed,
            },
            "timeout_seconds": timeout_seconds,
            "nice": nice,
            "artifacts": artifacts,
            "error": error,
            "discovery_stdout_tail": discovery.stdout_tail,
            "terminal_stdout_tail": terminal.stdout_tail if terminal else None,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock_path.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--arm-cell-index", type=int, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    args = parser.parse_args()
    try:
        summary = run_arm_cell(
            args.repo_root.resolve(),
            args.workdir,
            args.arm_cell_index,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
        )
    except (EncodingError, OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] in SUCCESS_STATUSES else 2


if __name__ == "__main__":
    raise SystemExit(main())
