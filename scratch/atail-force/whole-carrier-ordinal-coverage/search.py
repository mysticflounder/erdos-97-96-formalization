#!/usr/bin/env python3
"""Decide the bare whole-carrier ordinal Kalmanson shadow.

The model has one four-member non-self selected row at every cyclic carrier
vertex and requires the selected-edge digraph to be strongly connected.  For
each increasing cyclic quadruple, every selected-row equality that cancels
one term of a strict Kalmanson inequality emits the corresponding strict
comparison between the remaining two distance terms.

SAT is a finite countermodel to the proposed *ordinal-only* coverage theorem.
It is not a metric or Euclidean realization.  UNSAT is bounded discovery
evidence, not a Lean proof.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance term must have distinct endpoints")
    return tuple(sorted((left, right)))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--faithful-structural", action="store_true")
    parser.add_argument("--second-apex", type=int, default=1)
    args = parser.parse_args()

    n = args.n
    if n < 5:
        raise SystemExit("n must be at least 5")

    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, random_seed=0)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    rank = {
        edge(left, right): z3.Int(f"r_{left}_{right}")
        for left in range(n)
        for right in range(left + 1, n)
    }
    blocker = {
        (source, center): z3.Bool(f"b_{source}_{center}")
        for source in range(n)
        for center in range(n)
    }

    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.Sum(
                *(z3.If(member[center, point], 1, 0) for point in range(n))
            )
            == 4
        )

    # Exact outgoing-cut characterization of strong connectivity.
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

    if args.faithful_structural:
        if not 0 < args.second_apex < n:
            raise SystemExit("second apex must differ from zero and lie in range")
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
                if not alternates:
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
        for source in range(n):
            allowed = tuple(
                center
                for center in range(n)
                if center not in {source, 0, args.second_apex}
            )
            solver.add(
                z3.PbEq([(blocker[source, center], 1) for center in allowed], 1)
            )
            for center in range(n):
                if center not in allowed:
                    solver.add(z3.Not(blocker[source, center]))
                else:
                    solver.add(
                        z3.Implies(blocker[source, center], member[center, source])
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
        # d_ac + d_bd > d_ab + d_cd
        strict_if_row_pair(a, b, c, edge(c, d), edge(b, d))
        strict_if_row_pair(d, b, c, edge(a, b), edge(a, c))
        strict_if_row_pair(b, a, d, edge(c, d), edge(a, c))
        strict_if_row_pair(c, a, d, edge(a, b), edge(b, d))

        # d_ac + d_bd > d_ad + d_bc
        strict_if_row_pair(a, c, d, edge(b, c), edge(b, d))
        strict_if_row_pair(b, c, d, edge(a, d), edge(a, c))
        strict_if_row_pair(c, a, b, edge(a, d), edge(b, d))
        strict_if_row_pair(d, a, b, edge(b, c), edge(a, c))

    status = solver.check()
    result: dict[str, object] = {
        "schema": "p97-whole-carrier-ordinal-coverage-v1",
        "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
        "n": n,
        "faithful_structural": args.faithful_structural,
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
            f"{left},{right}": model.eval(value, model_completion=True).as_long()
            for (left, right), value in rank.items()
        }
        if args.faithful_structural:
            result["omitted_apices"] = [0, args.second_apex]
            result["blockers"] = {
                str(source): next(
                    center
                    for center in range(n)
                    if z3.is_true(
                        model.eval(blocker[source, center], model_completion=True)
                    )
                )
                for source in range(n)
            }
    elif status == z3.unknown:
        result["reason"] = solver.reason_unknown()

    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
