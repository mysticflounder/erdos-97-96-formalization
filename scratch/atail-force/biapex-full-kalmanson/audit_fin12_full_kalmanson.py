#!/usr/bin/env python3
"""Find a small linear Kalmanson core in the bi-apex Fin-12 regression.

This is theorem discovery, not a proof artifact.  The input row system is the
kernel-checked finite boundary in `biapex-strategy-audit/BiApexFiniteBoundary.lean`.
All inequalities are homogeneous strict Kalmanson inequalities normalized to
slack at least one.  The output names the selected-row equalities and boundary
quadruples in one deletion-minimal Z3 UNSAT core.
"""

from __future__ import annotations

import json
from dataclasses import dataclass
from itertools import combinations

import z3


N = 12
ROWS = (
    (1, 2, 3, 4),
    (2, 3, 4, 11),
    (0, 3, 4, 5),
    (2, 4, 5, 6),
    (1, 6, 7, 8),
    (3, 6, 7, 8),
    (5, 7, 8, 9),
    (6, 8, 9, 10),
    (7, 9, 10, 11),
    (0, 8, 10, 11),
    (0, 1, 9, 11),
    (0, 1, 2, 10),
)


@dataclass(frozen=True)
class Constraint:
    name: str
    kind: str
    payload: tuple[int, ...]
    formula: z3.BoolRef


DIST = {
    (i, j): z3.Real(f"d_{i}_{j}")
    for i in range(N)
    for j in range(i + 1, N)
}


def dist(i: int, j: int) -> z3.ArithRef:
    if i == j:
        return z3.RealVal(0)
    return DIST[tuple(sorted((i, j)))]


def constraints() -> list[Constraint]:
    result: list[Constraint] = []
    for center, row in enumerate(ROWS):
        anchor = row[0]
        for point in row[1:]:
            result.append(
                Constraint(
                    f"row_{center}_{anchor}_{point}",
                    "row_eq",
                    (center, anchor, point),
                    dist(center, point) == dist(center, anchor),
                )
            )
    for a, b, c, d in combinations(range(N), 4):
        result.append(
            Constraint(
                f"kal1_{a}_{b}_{c}_{d}",
                "kalmanson_diagonals_vs_ab_cd",
                (a, b, c, d),
                dist(a, c) + dist(b, d)
                >= dist(a, b) + dist(c, d) + 1,
            )
        )
        result.append(
            Constraint(
                f"kal2_{a}_{b}_{c}_{d}",
                "kalmanson_diagonals_vs_ad_bc",
                (a, b, c, d),
                dist(a, c) + dist(b, d)
                >= dist(a, d) + dist(b, c) + 1,
            )
        )
    return result


def check(items: list[Constraint], tracked: bool = False):
    solver = z3.Solver()
    if tracked:
        for item in items:
            solver.assert_and_track(item.formula, z3.Bool(item.name))
    else:
        solver.add(*(item.formula for item in items))
    status = solver.check()
    return solver, status


def main() -> None:
    all_constraints = constraints()
    solver, status = check(all_constraints, tracked=True)
    if status != z3.unsat:
        raise SystemExit(f"expected UNSAT, got {status}")
    core_names = {str(name) for name in solver.unsat_core()}
    core = [item for item in all_constraints if item.name in core_names]

    changed = True
    while changed:
        changed = False
        for item in tuple(core):
            candidate = [other for other in core if other != item]
            _, candidate_status = check(candidate)
            if candidate_status == z3.unsat:
                core = candidate
                changed = True

    output = {
        "schema": "p97-atail-biapex-fin12-kalmanson-mus-v1",
        "epistemic_status": "Z3_LINEAR_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
        "constraint_count": len(all_constraints),
        "initial_core_count": len(core_names),
        "deletion_minimal_core_count": len(core),
        "core": [
            {"name": item.name, "kind": item.kind, "payload": item.payload}
            for item in core
        ],
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
