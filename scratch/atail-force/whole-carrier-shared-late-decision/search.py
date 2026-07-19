#!/usr/bin/env python3
"""Pure combinatorial whole-carrier shared-late-pair decision problem.

This is theorem discovery, not a proof artifact.  Unlike the monolithic
Kalmanson/LRA probe, this encoding asks the exact combinatorial implication:
do the row-incidence bounds, strong connectivity, and a total blocker map
omitting two values force an increasing quadruple ``a<b<c<d`` whose rows at
``a`` and ``b`` both contain ``c`` and ``d``?

The solver searches for a countermodel, so every shared-late-pair terminal is
forbidden explicitly.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


def build_solver(
    n: int, second_omitted: int, timeout_ms: int, terminal_mode: str
):
    if n < 6:
        raise ValueError("a four-support row needs at least five other vertices")
    if not 0 < second_omitted < n:
        raise ValueError("the second omitted value must differ from zero")

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    blocker = {source: z3.Int(f"b_{source}") for source in range(n)}

    # Exactly one four-support row at each center, excluding the center.
    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.PbEq(
                [(member[center, point], 1) for point in range(n)],
                4,
            )
        )

    # Two distinct rows share at most two support vertices.
    for left, right in itertools.combinations(range(n), 2):
        solver.add(
            z3.PbLe(
                [
                    (z3.And(member[left, p], member[right, p]), 1)
                    for p in range(n)
                ],
                2,
            )
        )

    # One carrier pair belongs to at most two selected rows.
    for first, second in itertools.combinations(range(n), 2):
        solver.add(
            z3.PbLe(
                [
                    (
                        z3.And(
                            member[center, first], member[center, second]
                        ),
                        1,
                    )
                    for center in range(n)
                ],
                2,
            )
        )

    # Strong connectivity: every nonempty proper subset has an outgoing row
    # edge.  This cut characterization is exact for finite directed graphs.
    vertices = tuple(range(n))
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            outside = tuple(point for point in vertices if point not in subset)
            solver.add(
                z3.Or(
                    *(
                        member[center, point]
                        for center in subset
                        for point in outside
                    )
                )
            )

    # A total fixed-point-free blocker map.  Its image omits the two
    # prescribed values, and the row at blocker(source) contains source.
    omitted = {0, second_omitted}
    for source, variable in blocker.items():
        solver.add(0 <= variable, variable < n)
        solver.add(variable != source)
        for value in omitted:
            solver.add(variable != value)
        solver.add(
            z3.Or(
                *(
                    z3.And(variable == center, member[center, source])
                    for center in range(n)
                    if center != source and center not in omitted
                )
            )
        )

    # Negate the production shared-late-pair terminal.  `linear` uses the
    # theorem's literal `a<b<c<d` statement.  `cyclic` also forbids the three
    # rotations of the same two-center/two-support block pattern.
    terminal_count = 0
    for a, b, c, d in itertools.combinations(range(n), 4):
        blocks = [((a, b), (c, d))]
        if terminal_mode == "cyclic":
            blocks.extend(
                [
                    ((b, c), (d, a)),
                    ((c, d), (a, b)),
                    ((d, a), (b, c)),
                ]
            )
        for centers, supports in blocks:
            left, right = centers
            first, second = supports
            solver.add(
                z3.Not(
                    z3.And(
                        member[left, first],
                        member[left, second],
                        member[right, first],
                        member[right, second],
                    )
                )
            )
            terminal_count += 1

    return solver, member, blocker, terminal_count


def solve(
    n: int, second_omitted: int, timeout_ms: int, terminal_mode: str
) -> dict[str, object]:
    solver, member, blocker, terminal_count = build_solver(
        n, second_omitted, timeout_ms, terminal_mode
    )
    status = solver.check()
    result: dict[str, object] = {
        "schema": "p97-whole-carrier-shared-late-decision-v1",
        "epistemic_status": "FINITE_COMBINATORIAL_THEOREM_DISCOVERY",
        "n": n,
        "omitted_values": [0, second_omitted],
        "terminal_mode": terminal_mode,
        "forbidden_terminal_count": terminal_count,
        "status": str(status).upper(),
        "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
    }
    if status != z3.sat:
        return result

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
    result["blockers"] = {
        str(source): model.eval(variable, model_completion=True).as_long()
        for source, variable in blocker.items()
    }
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--second-omitted", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument(
        "--terminal-mode", choices=("linear", "cyclic"), default="cyclic"
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = solve(
        args.n, args.second_omitted, args.timeout_ms, args.terminal_mode
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
