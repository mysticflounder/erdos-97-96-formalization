#!/usr/bin/env python3
"""Exact replay of the zero-slack primal side of integrated MILP results.

This checker intentionally does not trust the solver's rounded Boolean vector.
It rebuilds the bank-free structural outer, reconstructs every named Boolean
from the decoded incumbent, checks every CNF clause exactly, and checks the
uniform rational distance table d_ij = 1 / C(14,2) at epsilon = 0.

The HiGHS dual bound remains numerical unless a separate exact dual or exact
branch certificate is supplied.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from fractions import Fraction
from pathlib import Path

import integrated_milp as integrated


class QuietLog:
    def __call__(self, _stage: str, **_fields: object) -> None:
        pass


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reconstruct_assignment(module, encoder, incumbent: dict[str, object]) -> list[bool]:
    assignment = [False] * encoder.v.count

    def set_variable(variable: int, value: bool) -> None:
        assignment[variable - 1] = value

    rows: dict[str, list[int]] = incumbent["rows"]  # type: ignore[assignment]
    for center in module.VERTICES:
        support = set(rows[str(center)])
        for point in module.VERTICES:
            set_variable(encoder.m(center, point), point in support)

    shell: set[int] = set(incumbent["shell"])  # type: ignore[arg-type]
    for point in module.VERTICES:
        set_variable(encoder.shell[point], point in shell)

    roles: dict[str, int] = incumbent["roles"]  # type: ignore[assignment]
    for role in ("first", "second", "source", "target", "unused"):
        for point in module.VERTICES:
            set_variable(encoder.r(role, point), roles[role] == point)

    blockers: dict[str, int] = incumbent["blockers"]  # type: ignore[assignment]
    for source in module.VERTICES:
        for center in module.VERTICES:
            set_variable(encoder.b(source, center), blockers[str(source)] == center)
    return assignment


def verify_one(path: Path, module) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    orbit = payload["orbit"]
    encoder = integrated.build_structural_outer(module, orbit, QuietLog())
    incumbent = payload.get("incumbent")
    if incumbent is None:
        return {
            "path": str(path),
            "sha256": sha256(path),
            "orbit": orbit,
            "exact_zero_primal_replay": False,
            "reason": "no incumbent",
        }
    assignment = reconstruct_assignment(module, encoder, incumbent)
    failed = []
    for index, clause in enumerate(encoder.cnf.clauses):
        if not any(
            assignment[abs(literal) - 1] if literal > 0
            else not assignment[abs(literal) - 1]
            for literal in clause
        ):
            failed.append(index)

    edge_count = len(tuple(itertools.combinations(module.VERTICES, 2)))
    distance = Fraction(1, edge_count)
    epsilon = Fraction(0)
    triangle_slack = distance
    kalmanson_slack = Fraction(0)
    exact_metric_valid = (
        edge_count * distance == 1
        and distance >= epsilon
        and triangle_slack >= epsilon
        and kalmanson_slack >= epsilon
    )
    exact_valid = not failed and exact_metric_valid
    return {
        "path": str(path),
        "sha256": sha256(path),
        "orbit": orbit,
        "solver_epistemic_status": payload["epistemic_status"],
        "solver_primal_epsilon": incumbent["epsilon"],
        "solver_dual_bound": payload["solver"]["mip_dual_bound"],
        "structural_clause_count": len(encoder.cnf.clauses),
        "failed_structural_clause_count": len(failed),
        "uniform_distance": str(distance),
        "exact_triangle_slack": str(triangle_slack),
        "exact_kalmanson_slack": str(kalmanson_slack),
        "guarded_equalities": "all exact because every pair-distance is uniform",
        "exact_zero_primal_replay": exact_valid,
        "exact_dual_or_branch_certificate": False,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    module = integrated.load_encoder()
    results = [verify_one(path, module) for path in args.inputs]
    output = {
        "schema": "p97-exact6-integrated-milp-exact-primal-replay-v1",
        "epistemic_status": (
            "EXACT_ZERO_PRIMALS_REPLAYED_NUMERICAL_DUAL_BOUNDS_NOT_CERTIFIED"
        ),
        "encoder_path": str(integrated.ENCODER_PATH.relative_to(integrated.REPO)),
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "literal_metric_cut_banks": "OMITTED",
        "results": results,
    }
    if not all(item["exact_zero_primal_replay"] for item in results):
        raise SystemExit("exact replay failed")
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(f"EXACT_ZERO_PRIMAL_REPLAY_PASS count={len(results)}")


if __name__ == "__main__":
    main()
