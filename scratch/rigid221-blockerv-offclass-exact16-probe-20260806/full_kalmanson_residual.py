"""Exact QF_LRA audit of the exact-16 residual left by all banked schemas.

For one source-forced cyclic order, enumerate the four outside pairs, retain
the pairwise-separated assignments missed by every currently banked
three-equality Kalmanson schema, and test their complete row equalities against
all strict triangle and strict cyclic Kalmanson inequalities on sixteen points.

SAT is only an abstract metric/Kalmanson witness.  UNSAT is exact rational
evidence from Z3 and is used only to propose a small theorem/certificate.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations, product
from pathlib import Path

import z3

from exact16_delta import BASE_ORDERS, CENTERS, FIXED, OUTSIDE, separated
from schema_coverage import concrete_motifs


def dist(ds: dict[tuple[int, int], z3.ArithRef], a: int, b: int):
    return ds[tuple(sorted((a, b)))]


def build_solver(order: tuple[int, ...]):
    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(16), 2)
    }
    solver = z3.Solver()
    solver.add(*(value > 0 for value in ds.values()))
    solver.add(dist(ds, 0, 1) == 1)
    for a, b, c in combinations(range(16), 3):
        solver.add(dist(ds, a, c) < dist(ds, a, b) + dist(ds, b, c))
        solver.add(dist(ds, a, b) < dist(ds, a, c) + dist(ds, b, c))
        solver.add(dist(ds, b, c) < dist(ds, a, b) + dist(ds, a, c))
    for i, j, k, ell in combinations(range(16), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal = dist(ds, a, c) + dist(ds, b, d)
        solver.add(dist(ds, a, b) + dist(ds, c, d) < diagonal)
        solver.add(dist(ds, a, d) + dist(ds, b, c) < diagonal)
    return solver, ds


def smoke() -> bool:
    """Check one satisfiable base and one banked impossible equality schema."""
    base = BASE_ORDERS[0]
    order = base[:9] + (15,) + base[9:]
    solver, ds = build_solver(order)
    base_verdict = solver.check()
    chosen = order[:6]
    solver.push()
    solver.add(dist(ds, chosen[1], chosen[4]) == dist(ds, chosen[1], chosen[0]))
    solver.add(dist(ds, chosen[2], chosen[5]) == dist(ds, chosen[2], chosen[0]))
    solver.add(dist(ds, chosen[3], chosen[5]) == dist(ds, chosen[3], chosen[4]))
    schema_verdict = solver.check()
    solver.pop()
    result = {
        "base_expected": "sat",
        "base_actual": str(base_verdict),
        "schema_expected": "unsat",
        "schema_actual": str(schema_verdict),
    }
    print(json.dumps(result, sort_keys=True))
    return base_verdict == z3.sat and schema_verdict == z3.unsat


def missed_by_schemas(
    motifs: dict[tuple[tuple[int, int], ...], set[str]],
    rows: tuple[frozenset[int], ...],
) -> bool:
    masks = tuple(sum((1 << point for point in row), 0) for row in rows)
    return not any(
        all(masks[row] & required == required for row, required in requirements)
        for requirements in motifs
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("order", type=int, choices=(0, 1), nargs="?")
    parser.add_argument("insertion", type=int, choices=range(9, 16), nargs="?")
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--smoke", action="store_true")
    args = parser.parse_args()

    if args.smoke:
        return 0 if smoke() else 1
    if args.order is None or args.insertion is None:
        parser.error("order and insertion are required unless --smoke is used")

    base = BASE_ORDERS[args.order]
    order = base[: args.insertion] + (15,) + base[args.insertion :]
    motifs = concrete_motifs(order)
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    residual = []
    for chosen in product(outside_pairs, repeat=4):
        rows = tuple(frozenset(FIXED[row] + chosen[row]) for row in range(4))
        if separated(order, rows) and missed_by_schemas(motifs, rows):
            residual.append((chosen, rows))

    solver, ds = build_solver(order)
    solver.set(timeout=args.timeout_ms)
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    examples: dict[str, list[object]] = {key: [] for key in counts}
    for chosen, rows in residual:
        solver.push()
        for center, row in zip(CENTERS, rows, strict=True):
            row_points = sorted(row)
            radius = dist(ds, center, row_points[0])
            solver.add(*(dist(ds, center, point) == radius for point in row_points[1:]))
        verdict = str(solver.check())
        counts[verdict] += 1
        if len(examples[verdict]) < 5:
            examples[verdict].append(chosen)
        solver.pop()

    result = {
        "order_index": args.order,
        "insertion": args.insertion,
        "cyclic_order": order,
        "residual_count": len(residual),
        "counts": counts,
        "examples": examples,
    }
    target = Path(__file__).with_name(
        f"full-kalmanson-o{args.order}-i{args.insertion}.json"
    )
    target.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
