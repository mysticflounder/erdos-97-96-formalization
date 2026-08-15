"""Shrink an exact-16 full-cover residual to a small linear obstruction.

This is a theorem-discovery helper only.  It names every strict Kalmanson
inequality and every row-shell equality, asks Z3 for an UNSAT core, and then
deletion-minimizes that core.  The resulting inequalities are intended to be
restated and proved in Lean; the Z3 result itself is not a proof artifact.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations, product

import z3

from exact16_delta import BASE_ORDERS, CENTERS, FIXED, OUTSIDE, separated
from full_kalmanson_residual import dist, missed_by_schemas
from schema_coverage import concrete_motifs


def first_residual(order: tuple[int, ...], index: int):
    motifs = concrete_motifs(order)
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    residual = []
    for chosen in product(outside_pairs, repeat=4):
        rows = tuple(frozenset(FIXED[row] + chosen[row]) for row in range(4))
        if separated(order, rows) and missed_by_schemas(motifs, rows):
            residual.append((chosen, rows))
            if len(residual) > index:
                return residual[index]
    raise IndexError(index)


def tracked_problem(
    order: tuple[int, ...],
    rows: tuple[frozenset[int], ...],
    active_points: frozenset[int] | None,
):
    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(16), 2)
    }
    solver = z3.Solver()
    constraints: dict[str, z3.BoolRef] = {}

    def track(name: str, formula: z3.BoolRef) -> None:
        literal = z3.Bool(name)
        constraints[name] = literal
        solver.add(z3.Implies(literal, formula))

    for i, j, k, ell in combinations(range(16), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        if active_points is not None and not {a, b, c, d} <= active_points:
            continue
        diagonal = dist(ds, a, c) + dist(ds, b, d)
        track(
            f"K1_{a}_{b}_{c}_{d}",
            dist(ds, a, b) + dist(ds, c, d) < diagonal,
        )
        track(
            f"K2_{a}_{b}_{c}_{d}",
            dist(ds, a, d) + dist(ds, b, c) < diagonal,
        )
    for row_index, (center, row) in enumerate(zip(CENTERS, rows, strict=True)):
        row_points = sorted(row)
        anchor = row_points[0]
        for point in row_points[1:]:
            track(
                f"E{row_index}_{center}_{anchor}_{point}",
                dist(ds, center, point) == dist(ds, center, anchor),
            )
    return solver, constraints


def minimize(solver: z3.Solver, names: list[str], literals: dict[str, z3.BoolRef]):
    changed = True
    while changed:
        changed = False
        for name in list(names):
            trial = [candidate for candidate in names if candidate != name]
            if solver.check(*(literals[candidate] for candidate in trial)) == z3.unsat:
                names = trial
                changed = True
    return names


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("order", type=int, choices=(0, 1))
    parser.add_argument("insertion", type=int, choices=range(9, 16))
    parser.add_argument("--index", type=int, default=0)
    parser.add_argument(
        "--active-points",
        help="comma-separated labels allowed in Kalmanson inequalities",
    )
    args = parser.parse_args()

    base = BASE_ORDERS[args.order]
    order = base[: args.insertion] + (15,) + base[args.insertion :]
    chosen, rows = first_residual(order, args.index)
    active_points = (
        frozenset(map(int, args.active_points.split(",")))
        if args.active_points
        else None
    )
    solver, literals = tracked_problem(order, rows, active_points)
    verdict = solver.check(*literals.values())
    if verdict != z3.unsat:
        print(json.dumps({"verdict": str(verdict), "chosen": chosen}))
        return 1
    initial = [str(literal) for literal in solver.unsat_core()]
    minimal = minimize(solver, initial, literals)
    result = {
        "chosen": chosen,
        "cyclic_order": order,
        "initial_core_size": len(initial),
        "minimal_core_size": len(minimal),
        "minimal_core": minimal,
        "active_points": sorted(active_points) if active_points is not None else None,
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
