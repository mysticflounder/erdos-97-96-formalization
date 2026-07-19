#!/usr/bin/env python3
"""Whole-carrier bi-apex/Kalmanson feasibility probe.

This is theorem-discovery only, not a proof or Euclidean realization.  Unlike
the fixed fourteen-role robust-all-center surface, the variables here range
over every vertex of one cyclically ordered carrier of a specified size.

The model includes one selected four-point equal-radius row at every center,
both strict Kalmanson inequalities for every increasing quadruple, triangle
and positivity constraints, the two-circle and convex-bisector incidence
bounds, strong connectivity of the selected witness digraph, and a total
source-to-critical-blocker map omitting two prescribed physical apices.

SAT proves only that these necessary consequences do not close the live
parent.  UNSAT is bounded evidence and still requires a checked certificate
and a faithful Lean extraction theorem.
"""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path

import z3

from payload_verifier import verify_payload


def distance_table(n: int) -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (i, j): z3.Real(f"d_{i}_{j}")
        for i in range(n)
        for j in range(i + 1, n)
    }


def dist(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[tuple(sorted((left, right)))]


def build_solver(n: int, omitted_second: int, timeout_ms: int):
    if n < 5:
        raise ValueError("a four-point row requires at least five carrier vertices")
    if not 0 < omitted_second < n:
        raise ValueError("second omitted apex must differ from vertex zero")

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    table = distance_table(n)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    radius = {center: z3.Real(f"r_{center}") for center in range(n)}
    blocker = {source: z3.Int(f"b_{source}") for source in range(n)}

    for variable in table.values():
        solver.add(variable >= 0)

    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.Sum(
                *(z3.If(member[center, point], 1, 0) for point in range(n))
            )
            == 4
        )
        solver.add(radius[center] > 0)
        for point in range(n):
            if point == center:
                continue
            solver.add(
                z3.Implies(
                    member[center, point],
                    dist(table, center, point) == radius[center],
                )
            )

    # Strict convex-quadrilateral Kalmanson inequalities.  Homogeneity lets
    # us normalize every strict slack to at least one simultaneously.
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(
            diagonals >= dist(table, a, b) + dist(table, c, d) + 1
        )
        solver.add(
            diagonals >= dist(table, a, d) + dist(table, b, c) + 1
        )

    # Every metric triangle inequality.
    for a, b, c in itertools.combinations(range(n), 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >= dist(table, a, c))
        solver.add(dist(table, a, c) + dist(table, b, c) >= dist(table, a, b))
        solver.add(dist(table, a, b) + dist(table, a, c) >= dist(table, b, c))

    # Distinct-center circles share at most two carrier points.
    for left, right in itertools.combinations(range(n), 2):
        solver.add(
            z3.Sum(
                *(
                    z3.If(z3.And(member[left, p], member[right, p]), 1, 0)
                    for p in range(n)
                )
            )
            <= 2
        )

    # A fixed carrier pair has at most two carrier bisector centers.
    for first, second in itertools.combinations(range(n), 2):
        solver.add(
            z3.Sum(
                *(
                    z3.If(
                        z3.And(member[center, first], member[center, second]),
                        1,
                        0,
                    )
                    for center in range(n)
                )
            )
            <= 2
        )

    # Shared pairs at two boundary centers must cyclically alternate with
    # those centers.  Otherwise the common perpendicular-bisector chord would
    # have four nonalternating endpoints on a strictly convex boundary.
    for center_left, center_right in itertools.combinations(range(n), 2):
        remaining = tuple(
            point
            for point in range(n)
            if point not in {center_left, center_right}
        )
        for point_left, point_right in itertools.combinations(remaining, 2):
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if alternates:
                continue
            solver.add(
                z3.Not(
                    z3.And(
                        member[center_left, point_left],
                        member[center_left, point_right],
                        member[center_right, point_left],
                        member[center_right, point_right],
                    )
                )
            )

    # Minimality: every selected witness digraph is strongly connected.  It
    # suffices to require an outgoing selected edge from every nonempty proper
    # vertex subset.
    vertices = tuple(range(n))
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            complement = tuple(point for point in vertices if point not in subset)
            solver.add(
                z3.Or(
                    *(
                        member[center, point]
                        for center in subset
                        for point in complement
                    )
                )
            )

    # Total actual-blocker map.  The selected row at the chosen blocker
    # contains its source, while both physical apices are omitted from the
    # blocker image.
    for source, variable in blocker.items():
        solver.add(0 <= variable, variable < n)
        solver.add(variable != source, variable != 0, variable != omitted_second)
        solver.add(
            z3.Or(
                *(
                    z3.And(variable == center, member[center, source])
                    for center in range(n)
                    if center not in {source, 0, omitted_second}
                )
            )
        )

    return solver, table, member, blocker


def solve(n: int, omitted_second: int, timeout_ms: int) -> dict[str, object]:
    solver, table, member, blocker = build_solver(n, omitted_second, timeout_ms)
    status = solver.check()
    result: dict[str, object] = {
        "n": n,
        "omitted_apices": [0, omitted_second],
        "status": str(status).upper(),
        "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
    }
    if status != z3.sat:
        return result

    model = solver.model()
    rows = {
        center: tuple(
            point
            for point in range(n)
            if z3.is_true(model.eval(member[center, point], model_completion=True))
        )
        for center in range(n)
    }
    blockers = {
        source: model.eval(variable, model_completion=True).as_long()
        for source, variable in blocker.items()
    }
    distances = {
        f"{left},{right}": str(model.eval(variable, model_completion=True))
        for (left, right), variable in table.items()
    }
    payload_verification = verify_payload(
        n=n,
        second_apex=omitted_second,
        rows=rows,
        blockers=blockers,
        distances=distances,
        distance_lower_bound=Fraction(0),
    )
    result.update(
        {
            "rows": {str(center): list(row) for center, row in rows.items()},
            "blockers": {
                str(source): center for source, center in blockers.items()
            },
            "distances": distances,
            "payload_verification": payload_verification,
        }
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--second-apex", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = solve(args.n, args.second_apex, args.timeout_ms)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
