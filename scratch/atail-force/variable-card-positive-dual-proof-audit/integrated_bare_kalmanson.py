#!/usr/bin/env python3
"""Exact-LRA falsifier for the bare all-center positive-dual conjecture.

The surface has one symmetric abstract distance for every unordered pair,
both strict Kalmanson inequalities for every increasing quadruple, one
four-member non-self equal-distance row at every center, and exact strong
connectivity of the resulting selected-row digraph.  A SAT result is replayed
against the original constraints before serialization.  UNSAT/UNKNOWN remains
external theorem-discovery evidence only.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance has distinct endpoints")
    return (left, right) if left < right else (right, left)


class BareKalmansonDecision:
    def __init__(self, n: int, timeout_ms: int, triangle: bool) -> None:
        self.n = n
        self.triangle = triangle
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=0)
        self.distances = {
            (left, right): z3.Real(f"d_{left}_{right}")
            for left, right in itertools.combinations(range(n), 2)
        }
        self.radii = [z3.Real(f"r_{center}") for center in range(n)]
        self.member = {
            (center, point): z3.Bool(f"m_{center}_{point}")
            for center in range(n)
            for point in range(n)
            if point != center
        }

    def dist(self, left: int, right: int) -> z3.ArithRef:
        return self.distances[edge(left, right)]

    def add_metric(self) -> None:
        for variable in self.distances.values():
            self.solver.add(variable >= 1)
        for a, b, c, d in itertools.combinations(range(self.n), 4):
            diagonal = self.dist(a, c) + self.dist(b, d)
            self.solver.add(
                diagonal >= self.dist(a, b) + self.dist(c, d) + 1,
                diagonal >= self.dist(a, d) + self.dist(b, c) + 1,
            )
        if self.triangle:
            for a, b, c in itertools.combinations(range(self.n), 3):
                self.solver.add(
                    self.dist(a, b) + self.dist(b, c) >= self.dist(a, c),
                    self.dist(a, b) + self.dist(a, c) >= self.dist(b, c),
                    self.dist(a, c) + self.dist(b, c) >= self.dist(a, b),
                )

    def add_all_rows(self) -> None:
        for center in range(self.n):
            row = [self.member[center, point] for point in range(self.n) if point != center]
            self.solver.add(z3.PbEq([(literal, 1) for literal in row], 4))
            for point in range(self.n):
                if point != center:
                    self.solver.add(
                        z3.Implies(
                            self.member[center, point],
                            self.dist(center, point) == self.radii[center],
                        )
                    )

    def add_strong_connectivity(self) -> None:
        # A finite digraph is strongly connected iff every nonempty proper
        # subset has an edge leaving it and an edge entering it.  Restrict to
        # subsets containing 0, since the complement supplies the duplicate
        # cut.
        vertices = tuple(range(self.n))
        for size in range(1, self.n):
            for subset_tuple in itertools.combinations(vertices[1:], size - 1):
                subset = frozenset((0, *subset_tuple))
                if len(subset) == self.n:
                    continue
                complement = frozenset(vertices) - subset
                leaving = [
                    self.member[source, target]
                    for source in subset
                    for target in complement
                ]
                entering = [
                    self.member[source, target]
                    for source in complement
                    for target in subset
                ]
                self.solver.add(z3.Or(leaving), z3.Or(entering))

    def add_shared_pair_smoke(self) -> None:
        if self.n != 4:
            raise ValueError("shared-pair smoke requires n=4")
        self.solver.add(
            self.dist(0, 1) == self.dist(0, 2),
            self.dist(3, 1) == self.dist(3, 2),
        )

    def replay(self, model: z3.ModelRef) -> dict[str, object]:
        def value(left: int, right: int) -> z3.RatNumRef:
            return model.eval(self.dist(left, right), model_completion=True)

        rows = {
            center: tuple(
                point
                for point in range(self.n)
                if point != center
                and z3.is_true(model.eval(self.member[center, point], model_completion=True))
            )
            for center in range(self.n)
        }
        assert all(len(row) == 4 for row in rows.values())
        for center, row in rows.items():
            radius = value(center, row[0])
            assert all(value(center, point) == radius for point in row)
        for a, b, c, d in itertools.combinations(range(self.n), 4):
            diagonal = value(a, c) + value(b, d)
            assert diagonal >= value(a, b) + value(c, d) + 1
            assert diagonal >= value(a, d) + value(b, c) + 1
        if self.triangle:
            for a, b, c in itertools.combinations(range(self.n), 3):
                assert value(a, b) + value(b, c) >= value(a, c)
                assert value(a, b) + value(a, c) >= value(b, c)
                assert value(a, c) + value(b, c) >= value(a, b)

        def reachable(reverse: bool) -> set[int]:
            seen = {0}
            stack = [0]
            while stack:
                vertex = stack.pop()
                successors = (
                    [source for source, targets in rows.items() if vertex in targets]
                    if reverse
                    else rows[vertex]
                )
                for successor in successors:
                    if successor not in seen:
                        seen.add(successor)
                        stack.append(successor)
            return seen

        assert len(reachable(False)) == self.n
        assert len(reachable(True)) == self.n
        return {
            "rows": {str(center): list(row) for center, row in rows.items()},
            "distances": {
                f"{left},{right}": str(value(left, right))
                for left, right in self.distances
            },
        }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--triangle", action="store_true")
    parser.add_argument(
        "--no-connectivity",
        action="store_true",
        help="omit selected-row strong connectivity to test the stronger bare claim",
    )
    parser.add_argument(
        "--mode", choices=("all-rows", "shared-pair-smoke"), default="all-rows"
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    started = time.monotonic()
    decision = BareKalmansonDecision(args.n, args.timeout_ms, args.triangle)
    decision.add_metric()
    if args.mode == "all-rows":
        if args.n < 5:
            raise ValueError("four-member non-self rows require n >= 5")
        decision.add_all_rows()
        if not args.no_connectivity:
            decision.add_strong_connectivity()
    else:
        decision.add_shared_pair_smoke()
    status = decision.solver.check()
    payload: dict[str, object] = {
        "schema": "p97-bare-all-center-integrated-kalmanson-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_IF_UNSAT_OR_UNKNOWN",
        "n": args.n,
        "mode": args.mode,
        "triangle": args.triangle,
        "strong_connectivity": not args.no_connectivity,
        "status": str(status).upper(),
        "elapsed_seconds": time.monotonic() - started,
        "solver_statistics": str(decision.solver.statistics()),
    }
    if status == z3.sat and args.mode == "all-rows":
        payload["verified_model"] = decision.replay(decision.solver.model())
    elif status == z3.unknown:
        payload["reason"] = decision.solver.reason_unknown()
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
