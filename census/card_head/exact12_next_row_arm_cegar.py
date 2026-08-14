"""Authenticated structural CEGAR for exact-12 named-deletion arm cells.

This is an additive 72-cell adapter over the historical 12-cell structural
runner.  Every SAT witness is replayed against the source-faithful candidate
surface, the base next-row predicate, the selected named-deletion arm, and the
complete current CNF.  Journals use arm-specific schemas and fresh workdirs.

Terminal UNSAT closes one finite placement-by-arm cell only.  It is not
aggregate arm coverage, a universal lift, or a Lean sorry closure.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Collection, Mapping
from pathlib import Path
from typing import Any

from .exact12_next_row_arm_cell_run import _build_job as _build_arm_job
from .exact12_next_row_cell_run import cnf_assignment_satisfies
from .exact12_next_row_structural_cegar import (
    DETECTOR_PATHS,
    Exact12NextRowStructuralCegarError,
    _canonical_cube,
    _canonical_positive_variables,
    run_structural_cegar,
)
from .exact12_next_row_valuation import (
    CompiledExact12NextRowArmCell,
    Exact12NextRowValuationError,
    added_constraints_hold,
    arm_cells,
    compile_arm_cell,
    decode_blockers,
    decode_distinguished_d,
    named_deletion_arm_holds,
)
from .sat_encoding import EncodingError
from .source_faithful_candidate_surface import (
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

RUN_SCHEMA = (
    "p97_rigid221_exact12_next_row_named_deletion_arm_"
    "structural_cegar_run.v1"
)
RECORD_SCHEMA = (
    "p97_rigid221_exact12_next_row_named_deletion_arm_"
    "structural_cut.v1"
)
SCOPE = (
    "one finite next-row placement-by-named-deletion-arm cell; no aggregate "
    "arm coverage, universal lift, terminal bank, or Lean closure"
)
ARM_DETECTOR_PATHS = DETECTOR_PATHS + (
    "census/card_head/exact12_next_row_arm_cegar.py",
    "census/card_head/exact12_next_row_arm_cell_run.py",
    "census/card_head/exact12_next_row_valuation.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobSemantics.lean"
    ),
)


def _replay_arm_sat_witness(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowArmCell,
    reported_cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
) -> tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]:
    """Bind one SAT assignment to all source, arm, and exact-CNF gates."""

    reported_payload = _canonical_cube(reported_cube)
    positive = frozenset(
        _canonical_positive_variables(
            positive_variables, n_variables=instance.cnf.n_variables
        )
    )
    decoded_cube = instance.decode_model(positive)
    if _canonical_cube(decoded_cube) != reported_payload:
        raise Exact12NextRowStructuralCegarError(
            "reported cube differs from the cube decoded from its assignment"
        )
    blockers = decode_blockers(positive, compiled.base.blocker_variables)
    distinguished_d = decode_distinguished_d(
        positive, compiled.base.distinguished_d_variables
    )
    replay = {
        "candidate": source_faithful_cube_ok(instance.model, decoded_cube),
        "base_added_constraints": added_constraints_hold(
            compiled.cell.base_cell(), decoded_cube, blockers, distinguished_d
        ),
        "named_deletion_arm": named_deletion_arm_holds(
            compiled.cell.arm, decoded_cube, blockers
        ),
        "exact_cnf": cnf_assignment_satisfies(
            instance.clauses_with(),
            positive,
            n_variables=instance.cnf.n_variables,
        ),
    }
    if not all(replay.values()):
        raise Exact12NextRowStructuralCegarError(
            "SAT assignment failed a source, arm, predicate, or CNF replay gate"
        )
    return decoded_cube, positive, replay


def run_arm_structural_cegar(
    repo_root: Path,
    workdir: Path,
    arm_cell_index: int,
    *,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
) -> dict[str, Any]:
    """Run one fresh arm-specific structural CEGAR cell."""

    return run_structural_cegar(
        repo_root,
        workdir,
        arm_cell_index,
        max_iterations=max_iterations,
        timeout_seconds=timeout_seconds,
        nice=nice,
        seed_journal=seed_journal,
        _schedule=arm_cells(),
        _compile_selected_cell=compile_arm_cell,
        _build_selected_job=_build_arm_job,
        _sat_witness_replay=_replay_arm_sat_witness,
        _run_schema=RUN_SCHEMA,
        _record_schema=RECORD_SCHEMA,
        _cell_binding_field="arm_cell_index",
        _scope=SCOPE,
        _detector_paths=ARM_DETECTOR_PATHS,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--arm-cell-index", type=int, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    args = parser.parse_args()
    try:
        summary = run_arm_structural_cegar(
            args.repo_root.resolve(),
            args.workdir,
            args.arm_cell_index,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
        )
    except (
        EncodingError,
        Exact12NextRowStructuralCegarError,
        Exact12NextRowValuationError,
        OSError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] == "UNSAT_DRAT_VERIFIED" else 2


if __name__ == "__main__":
    raise SystemExit(main())
