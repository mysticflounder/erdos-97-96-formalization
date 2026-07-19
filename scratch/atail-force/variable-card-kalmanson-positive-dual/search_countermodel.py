#!/usr/bin/env python3
"""Local-search falsifier for the bare all-center Kalmanson conjecture.

The solver owns one abstract symmetric distance variable per unordered pair,
all strict Kalmanson inequalities, and optional triangle inequalities.  A
candidate consists of one four-member non-self row at every cyclic vertex.
Only strongly connected candidate row digraphs are sent to the exact rational
LRA solver.  An UNSAT assumption core guides one row mutation; a SAT model is
substituted back into every original constraint before it is serialized.

This is adversarial theorem discovery, not a coverage enumerator.
"""

from __future__ import annotations

import argparse
import itertools
import json
import random
import time
from pathlib import Path

import z3


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def strongly_connected(rows: dict[int, tuple[int, ...]], n: int) -> bool:
    def reachable(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            if reverse:
                successors = [
                    source for source, targets in rows.items() if vertex in targets
                ]
            else:
                successors = rows[vertex]
            for successor in successors:
                if successor not in seen:
                    seen.add(successor)
                    stack.append(successor)
        return seen

    return len(reachable(False)) == n and len(reachable(True)) == n


class MetricOracle:
    def __init__(self, n: int, triangle: bool, timeout_ms: int) -> None:
        self.n = n
        self.triangle = triangle
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=0)
        self.table = {
            (left, right): z3.Real(f"d_{left}_{right}")
            for left in range(n)
            for right in range(left + 1, n)
        }
        self.assumption_data: dict[str, tuple[int, int, int]] = {}
        self.assumptions: dict[tuple[int, int, int], z3.BoolRef] = {}

        for variable in self.table.values():
            self.solver.add(variable >= 1)
        for a, b, c, d in itertools.combinations(range(n), 4):
            diagonal = self.dist(a, c) + self.dist(b, d)
            self.solver.add(
                diagonal >= self.dist(a, b) + self.dist(c, d) + 1,
                diagonal >= self.dist(a, d) + self.dist(b, c) + 1,
            )
        if triangle:
            for a, b, c in itertools.combinations(range(n), 3):
                self.solver.add(
                    self.dist(a, b) + self.dist(b, c) >= self.dist(a, c),
                    self.dist(a, c) + self.dist(b, c) >= self.dist(a, b),
                    self.dist(a, b) + self.dist(a, c) >= self.dist(b, c),
                )

        for center in range(n):
            targets = [point for point in range(n) if point != center]
            for left, right in itertools.combinations(targets, 2):
                key = (center, left, right)
                name = f"eq_{center}_{left}_{right}"
                assumption = z3.Bool(name)
                self.assumptions[key] = assumption
                self.assumption_data[name] = key
                self.solver.add(
                    z3.Implies(
                        assumption,
                        self.dist(center, left) == self.dist(center, right),
                    )
                )

    def dist(self, left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        return self.table[edge(left, right)]

    def candidate_assumptions(
        self, rows: dict[int, tuple[int, ...]]
    ) -> list[z3.BoolRef]:
        result = []
        for center, support in rows.items():
            anchor = support[0]
            for point in support[1:]:
                left, right = sorted((anchor, point))
                result.append(self.assumptions[center, left, right])
        return result

    def check(
        self, rows: dict[int, tuple[int, ...]]
    ) -> tuple[z3.CheckSatResult, list[tuple[int, int, int]], dict[str, str] | str]:
        status = self.solver.check(*self.candidate_assumptions(rows))
        if status == z3.unsat:
            core = [self.assumption_data[str(item)] for item in self.solver.unsat_core()]
            return status, core, ""
        if status == z3.unknown:
            return status, [], self.solver.reason_unknown()
        model = self.solver.model()
        distances = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in self.table.items()
        }
        self.verify(rows, model)
        return status, [], distances

    def verify(self, rows: dict[int, tuple[int, ...]], model: z3.ModelRef) -> None:
        def value(left: int, right: int) -> z3.RatNumRef:
            return model.eval(self.dist(left, right), model_completion=True)

        for variable in self.table.values():
            assert z3.is_true(z3.simplify(model.eval(variable >= 1)))
        for a, b, c, d in itertools.combinations(range(self.n), 4):
            diagonal = value(a, c) + value(b, d)
            assert z3.is_true(z3.simplify(diagonal >= value(a, b) + value(c, d) + 1))
            assert z3.is_true(z3.simplify(diagonal >= value(a, d) + value(b, c) + 1))
        if self.triangle:
            for a, b, c in itertools.combinations(range(self.n), 3):
                assert z3.is_true(z3.simplify(value(a, b) + value(b, c) >= value(a, c)))
                assert z3.is_true(z3.simplify(value(a, c) + value(b, c) >= value(a, b)))
                assert z3.is_true(z3.simplify(value(a, b) + value(a, c) >= value(b, c)))
        for center, support in rows.items():
            radius = value(center, support[0])
            assert all(
                z3.is_true(z3.simplify(value(center, point) == radius))
                for point in support[1:]
            )


def random_rows(rng: random.Random, n: int) -> dict[int, tuple[int, ...]]:
    while True:
        rows = {
            center: tuple(
                sorted(rng.sample([point for point in range(n) if point != center], 4))
            )
            for center in range(n)
        }
        if strongly_connected(rows, n):
            return rows


def mutate(
    rng: random.Random,
    rows: dict[int, tuple[int, ...]],
    core: list[tuple[int, int, int]],
    n: int,
) -> dict[int, tuple[int, ...]]:
    for _ in range(200):
        center, left, right = rng.choice(core)
        old_support = rows[center]
        removable = [point for point in (left, right) if point in old_support]
        removed = rng.choice(removable if removable else list(old_support))
        available = [
            point
            for point in range(n)
            if point != center and point not in old_support
        ]
        replacement = rng.choice(available)
        candidate = dict(rows)
        candidate[center] = tuple(
            sorted(replacement if point == removed else point for point in old_support)
        )
        if strongly_connected(candidate, n):
            return candidate
    return random_rows(rng, n)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--triangle", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = random.Random(args.seed)
    oracle = MetricOracle(args.n, args.triangle, args.timeout_ms)
    rows = random_rows(rng, args.n)
    started = time.monotonic()
    attempts = 0
    restarts = 0
    core_size_histogram: dict[str, int] = {}
    terminal: dict[str, object]
    while time.monotonic() - started < args.wall_seconds:
        attempts += 1
        status, core, payload = oracle.check(rows)
        if status == z3.sat:
            terminal = {
                "status": "SAT_VERIFIED_EXACT_RATIONAL_KALMANSON_SHADOW",
                "rows": {str(center): list(support) for center, support in rows.items()},
                "distances": payload,
            }
            break
        if status == z3.unknown:
            restarts += 1
            rows = random_rows(rng, args.n)
            continue
        core_size_histogram[str(len(core))] = core_size_histogram.get(str(len(core)), 0) + 1
        rows = mutate(rng, rows, core, args.n)
        if attempts % 250 == 0:
            restarts += 1
            rows = random_rows(rng, args.n)
    else:
        terminal = {"status": "UNKNOWN_WALL_BUDGET", "reason": "no SAT hit"}

    terminal.update(
        {
            "schema": "p97-bare-all-center-kalmanson-local-falsifier-v1",
            "epistemic_status": "EXACT_IF_SAT_OTHERWISE_BOUNDED_THEOREM_DISCOVERY",
            "n": args.n,
            "triangle": args.triangle,
            "seed": args.seed,
            "attempts": attempts,
            "restarts": restarts,
            "elapsed_seconds": time.monotonic() - started,
            "core_size_histogram": core_size_histogram,
        }
    )
    rendered = json.dumps(terminal, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
