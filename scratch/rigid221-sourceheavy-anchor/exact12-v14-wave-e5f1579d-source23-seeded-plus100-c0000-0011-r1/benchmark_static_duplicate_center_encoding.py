"""Benchmark static exact-12 equality-closure obstruction encodings.

This is a discovery experiment, not a promoted source compiler.  It augments
one frozen v14 cell with auxiliary variables for equality of the 66 undirected
distance edges.  Selected rows force their incident edges equal, triangle
clauses make that relation transitive, and optional obstruction families forbid
equality closures already rejected by the structural detector.

The extension is equisatisfiable with the base cell relative to the
duplicate-center detector, but it does not yet have a Lean valuation bridge or
terminal-RUP ingress.  Consequently its results are accelerator evidence only.
"""

from __future__ import annotations

import argparse
import json
import sys
from itertools import combinations, permutations
from pathlib import Path
from typing import Any


def _load_project(source_root: Path) -> tuple[Any, Any, Any]:
    sys.path.insert(0, str(source_root.resolve()))
    from census.card_head import exact12_v14_structural_cegar as structural
    from census.card_head.exact12_v14_source_order_bank import (
        install_source_order_bank,
    )
    from census.card_head.sat_encoding import solve_cadical

    return structural, solve_cadical, install_source_order_bank


def add_static_duplicate_center_encoding(
    instance: Any,
    *,
    include_equal_k4: bool = False,
    include_equilateral_bisector: bool = False,
    include_three_triad: bool = False,
    include_perpendicular_bisector: bool = False,
) -> dict[str, int]:
    """Add the finite equality-closure extension and return exact counts."""

    labels = tuple(range(12))
    edges = tuple(combinations(labels, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}
    relation: dict[tuple[int, int], int] = {}

    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)

    for left, right in combinations(range(len(edges)), 2):
        relation[(left, right)] = instance.cnf.new_variable()

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def equal_variable(left: int, right: int) -> int | None:
        if left == right:
            return None
        return relation[tuple(sorted((left, right)))]

    row_implication_clauses = 0
    for center in labels:
        for candidate_index, support in enumerate(instance.candidates[center]):
            choice = instance.choice_variables[(center, candidate_index)]
            incident = tuple(edge(center, point) for point in support)
            for left, right in combinations(incident, 2):
                equality = equal_variable(left, right)
                if equality is None:
                    raise AssertionError("distinct row edges unexpectedly coincide")
                instance.cnf.add_clause((-choice, equality))
                row_implication_clauses += 1

    transitivity_clauses = 0
    for first, second, third in combinations(range(len(edges)), 3):
        first_second = relation[(first, second)]
        first_third = relation[(first, third)]
        second_third = relation[(second, third)]
        instance.cnf.add_clause((-first_second, -second_third, first_third))
        instance.cnf.add_clause((-first_second, -first_third, second_third))
        instance.cnf.add_clause((-first_third, -second_third, first_second))
        transitivity_clauses += 3

    duplicate_center_clauses = 0
    for first_center, second_center in combinations(labels, 2):
        remaining = tuple(
            label
            for label in labels
            if label not in (first_center, second_center)
        )
        for first, second, third in combinations(remaining, 3):
            equalities = (
                equal_variable(
                    edge(first_center, first), edge(first_center, second)
                ),
                equal_variable(
                    edge(first_center, first), edge(first_center, third)
                ),
                equal_variable(
                    edge(second_center, first), edge(second_center, second)
                ),
                equal_variable(
                    edge(second_center, first), edge(second_center, third)
                ),
            )
            if any(variable is None for variable in equalities):
                raise AssertionError("duplicate-center edges unexpectedly coincide")
            instance.cnf.add_clause(tuple(-int(variable) for variable in equalities))
            duplicate_center_clauses += 1

    equilateral_bisector_clauses = 0
    if include_equilateral_bisector:
        unique_clauses: set[tuple[int, ...]] = set()
        for p, a, b, x, c in permutations(labels, 5):
            equalities = (
                equal_variable(edge(p, a), edge(p, b)),
                equal_variable(edge(p, a), edge(a, b)),
                equal_variable(edge(p, a), edge(a, x)),
                equal_variable(edge(p, a), edge(b, x)),
                equal_variable(edge(p, a), edge(p, c)),
                equal_variable(edge(c, x), edge(c, a)),
            )
            if any(variable is None for variable in equalities):
                raise AssertionError(
                    "equilateral-bisector edges unexpectedly coincide"
                )
            clause = tuple(sorted(-int(variable) for variable in equalities))
            if len(set(clause)) != len(clause):
                raise AssertionError(
                    "equilateral-bisector equality literals unexpectedly repeat"
                )
            unique_clauses.add(clause)
        for clause in sorted(unique_clauses):
            instance.cnf.add_clause(clause)
        equilateral_bisector_clauses = len(unique_clauses)

    equal_k4_clauses = 0
    if include_equal_k4:
        for points in combinations(labels, 4):
            point_edges = tuple(edge(left, right) for left, right in combinations(points, 2))
            reference = point_edges[0]
            equalities = tuple(
                equal_variable(reference, other) for other in point_edges[1:]
            )
            if any(variable is None for variable in equalities):
                raise AssertionError("equal-K4 edges unexpectedly coincide")
            instance.cnf.add_clause(tuple(-int(variable) for variable in equalities))
            equal_k4_clauses += 1

    three_triad_clauses = 0
    if include_three_triad:
        unique_clauses = set()
        for a, b, c, d, e in permutations(labels, 5):
            equalities = (
                equal_variable(edge(b, c), edge(b, d)),
                equal_variable(edge(b, c), edge(d, a)),
                equal_variable(edge(c, a), edge(c, d)),
                equal_variable(edge(c, a), edge(c, e)),
                equal_variable(edge(e, a), edge(e, b)),
                equal_variable(edge(e, a), edge(e, d)),
            )
            if any(variable is None for variable in equalities):
                raise AssertionError("three-triad edges unexpectedly coincide")
            clause = tuple(sorted(-int(variable) for variable in equalities))
            if len(set(clause)) != len(clause):
                raise AssertionError("three-triad equality literals unexpectedly repeat")
            unique_clauses.add(clause)
        for clause in sorted(unique_clauses):
            instance.cnf.add_clause(clause)
        three_triad_clauses = len(unique_clauses)

    perpendicular_bisector_clauses = 0
    if include_perpendicular_bisector:
        for left, right in combinations(labels, 2):
            remaining = tuple(
                point for point in labels if point not in (left, right)
            )
            for points in combinations(remaining, 3):
                equalities = tuple(
                    equal_variable(edge(point, left), edge(point, right))
                    for point in points
                )
                if any(variable is None for variable in equalities):
                    raise AssertionError(
                        "perpendicular-bisector edges unexpectedly coincide"
                    )
                instance.cnf.add_clause(
                    tuple(-int(variable) for variable in equalities)
                )
                perpendicular_bisector_clauses += 1

    return {
        "edge_count": len(edges),
        "relation_variables": len(relation),
        "row_implication_clauses": row_implication_clauses,
        "transitivity_clauses": transitivity_clauses,
        "duplicate_center_clauses": duplicate_center_clauses,
        "equal_k4_clauses": equal_k4_clauses,
        "equilateral_bisector_clauses": equilateral_bisector_clauses,
        "three_triad_clauses": three_triad_clauses,
        "perpendicular_bisector_clauses": perpendicular_bisector_clauses,
        "added_variables": instance.cnf.n_variables - initial_variables,
        "added_clauses": len(instance.cnf.clauses) - initial_clauses,
        "final_variables": instance.cnf.n_variables,
        "final_clauses": len(instance.cnf.clauses),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-root", required=True, type=Path)
    parser.add_argument("--cell", required=True, type=int)
    parser.add_argument("--workdir", required=True, type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    parser.add_argument("--include-base-equality-obstructions", action="store_true")
    parser.add_argument("--include-equilateral-bisector", action="store_true")
    args = parser.parse_args()

    structural, solve_cadical, install_source_order_bank = _load_project(
        args.source_root
    )
    source_root = args.source_root.resolve()
    schedule_manifest = structural.build_manifest(source_root)
    job = structural.build_bound_job(schedule_manifest, source_root, args.cell)
    materialized = structural.instantiate_validated_bound_job(
        job, schedule_manifest, source_root
    )
    source_order_bank = structural.snapshot_source_order_bank(
        materialized.instance,
        install_source_order_bank(source_root, materialized.instance),
    )
    replayed_records = 0
    replayed_terminal_sha256 = structural.json_sha256(job)
    if args.seed_journal is not None:
        replayed_records, replayed_terminal_sha256, _ = structural.replay_journal(
            source_root,
            materialized.instance,
            args.seed_journal,
            job_sha256=structural.json_sha256(job),
            detector_contract_sha256=structural._sha256_json(
                structural._detector_manifest(source_root)
            ),
            cell_index=args.cell,
            source_order_bank=source_order_bank,
        )
    include_all = args.include_base_equality_obstructions
    counts = add_static_duplicate_center_encoding(
        materialized.instance,
        include_equal_k4=include_all,
        include_equilateral_bisector=(
            include_all or args.include_equilateral_bisector
        ),
        include_three_triad=include_all,
        include_perpendicular_bisector=include_all,
    )
    args.workdir.mkdir(parents=True, exist_ok=False)
    result = solve_cadical(
        materialized.instance,
        args.workdir / "static-duplicate-center.cnf",
        timeout_seconds=args.timeout_seconds,
        nice=args.nice,
        proof_path=None,
    )
    detector_stage = None
    admitted_cut_stage = None
    if result.cube is not None:
        certificate = structural.detect_structural_certificate(result.cube, n=12)
        detector_stage = certificate.get("stage") if certificate else None
        admitted_cut = structural.detect_admitted_cut(
            source_root,
            materialized.instance,
            result.cube,
            source_order_bank=source_order_bank,
        )
        admitted_cut_stage = (
            admitted_cut.detector_stage if admitted_cut is not None else None
        )
        (args.workdir / "survivor-cube.json").write_text(
            json.dumps(
                {str(center): list(result.cube[center]) for center in range(12)},
                indent=2,
                sort_keys=True,
            )
            + "\n",
            encoding="utf-8",
        )
    summary = {
        "scope": (
            "finite discovery accelerator only; no authenticated production "
            "compiler, terminal proof ingress, universal lift, or Lean closure"
        ),
        "cell": args.cell,
        "seed_journal": {
            "path": str(args.seed_journal) if args.seed_journal else None,
            "record_count": replayed_records,
            "terminal_record_sha256": replayed_terminal_sha256,
        },
        "encoding": counts,
        "proof_backed_source_order_clauses_installed": len(
            source_order_bank["entries"]
        ),
        "solver": {
            "verdict": result.verdict,
            "returncode": result.returncode,
            "proof_verified": result.proof_verified,
            "detector_stage_on_sat_cube": detector_stage,
            "admitted_cut_stage_on_sat_cube": admitted_cut_stage,
        },
    }
    (args.workdir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, sort_keys=True))
    return 0 if result.verdict in {"SAT", "UNSAT"} else 2


if __name__ == "__main__":
    raise SystemExit(main())
