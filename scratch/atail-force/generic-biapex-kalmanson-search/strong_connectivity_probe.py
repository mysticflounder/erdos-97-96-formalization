#!/usr/bin/env python3
"""Probe the bare strong-connectivity/Kalmanson conjecture.

This intentionally omits the bi-apex blocker map and all incidence bounds.  It
asks only for four selected equal distances in every row, a strongly connected
selected-edge digraph, and a positive strict Kalmanson metric (optionally also
triangle inequalities).  A SAT result is therefore a faithful countermodel to
the proposed bare variable-cardinality theorem, not a Euclidean realization.
"""

from __future__ import annotations

import argparse
import itertools
import json

import z3


def dist(table: dict[tuple[int, int], z3.ArithRef], i: int, j: int):
    if i == j:
        return z3.RealVal(0)
    return table[tuple(sorted((i, j)))]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--triangle", action="store_true")
    parser.add_argument("--ordinal-only", action="store_true")
    args = parser.parse_args()

    n = args.n
    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, random_seed=0)

    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.Sum(
                *(z3.If(member[center, point], 1, 0) for point in range(n))
            )
            == 4
        )

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

    if args.ordinal_only:
        def edge(left: int, right: int) -> tuple[int, int]:
            return tuple(sorted((left, right)))

        rank = {
            (left, right): z3.Int(f"rank_{left}_{right}")
            for left in range(n)
            for right in range(left + 1, n)
        }
        for center in range(n):
            others = tuple(point for point in range(n) if point != center)
            for first, second in itertools.combinations(others, 2):
                solver.add(
                    z3.Implies(
                        z3.And(member[center, first], member[center, second]),
                        rank[edge(center, first)] == rank[edge(center, second)],
                    )
                )

        def strict_if_row_pair(
            center: int,
            first: int,
            second: int,
            smaller: tuple[int, int],
            larger: tuple[int, int],
        ) -> None:
            solver.add(
                z3.Implies(
                    z3.And(member[center, first], member[center, second]),
                    rank[smaller] < rank[larger],
                )
            )

        for a, b, c, d in itertools.combinations(range(n), 4):
            strict_if_row_pair(a, b, c, edge(c, d), edge(b, d))
            strict_if_row_pair(d, b, c, edge(a, b), edge(a, c))
            strict_if_row_pair(b, a, d, edge(c, d), edge(a, c))
            strict_if_row_pair(c, a, d, edge(a, b), edge(b, d))
            strict_if_row_pair(a, c, d, edge(b, c), edge(b, d))
            strict_if_row_pair(b, c, d, edge(a, d), edge(a, c))
            strict_if_row_pair(c, a, b, edge(a, d), edge(b, d))
            strict_if_row_pair(d, a, b, edge(b, c), edge(a, c))

        status = solver.check()
        result: dict[str, object] = {
            "schema": "p97-equality-quotiented-ordinal-connectivity-probe-v1",
            "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
            "n": n,
            "status": str(status).upper(),
        }
        if status == z3.sat:
            model = solver.model()
            result["rows"] = {
                str(center): [
                    point
                    for point in range(n)
                    if z3.is_true(
                        model.eval(member[center, point], model_completion=True)
                    )
                ]
                for center in range(n)
            }
            result["ranks"] = {
                f"{left},{right}": str(model.eval(value, model_completion=True))
                for (left, right), value in rank.items()
            }
        elif status == z3.unknown:
            result["reason"] = solver.reason_unknown()
        print(json.dumps(result, indent=2, sort_keys=True))
        return 0

    table = {
        (i, j): z3.Real(f"d_{i}_{j}")
        for i in range(n)
        for j in range(i + 1, n)
    }
    for variable in table.values():
        solver.add(variable >= 1)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(
            diagonals >= dist(table, a, b) + dist(table, c, d) + 1
        )
        solver.add(
            diagonals >= dist(table, a, d) + dist(table, b, c) + 1
        )
    if args.triangle:
        for a, b, c in itertools.combinations(range(n), 3):
            solver.add(dist(table, a, b) + dist(table, b, c) >= dist(table, a, c))
            solver.add(dist(table, a, c) + dist(table, b, c) >= dist(table, a, b))
            solver.add(dist(table, a, b) + dist(table, a, c) >= dist(table, b, c))

    for center in range(n):
        radius = z3.Real(f"r_{center}")
        for point in range(n):
            if point != center:
                solver.add(z3.Implies(member[center, point], dist(table, center, point) == radius))

    status = solver.check()
    result: dict[str, object] = {
        "schema": "p97-bare-strong-connectivity-kalmanson-probe-v1",
        "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
        "n": n,
        "triangle": args.triangle,
        "status": str(status).upper(),
    }
    if status == z3.sat:
        model = solver.model()
        result["rows"] = {
            str(center): [
                point
                for point in range(n)
                if z3.is_true(model.eval(member[center, point], model_completion=True))
            ]
            for center in range(n)
        }
        result["distances"] = {
            f"{i},{j}": str(model.eval(variable, model_completion=True))
            for (i, j), variable in table.items()
        }
    elif status == z3.unknown:
        result["reason"] = solver.reason_unknown()
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
