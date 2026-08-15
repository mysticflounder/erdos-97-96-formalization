#!/usr/bin/env python3
"""Produce a deletion-minimal exact QF_LRA core for one shell pattern.

The historical filename reflects its first use for three-equality patterns;
the explainer accepts any positive number of shell atoms.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations

import z3


def edge(a: int, b: int) -> tuple[int, int]:
    return tuple(sorted((a, b)))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("n", type=int)
    parser.add_argument(
        "atoms", nargs="+", help="shell atoms encoded as cxy"
    )
    args = parser.parse_args()
    pattern = tuple(tuple(map(int, atom)) for atom in args.atoms)

    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(args.n), 2)
    }
    solver = z3.Solver()
    tracked: list[tuple[z3.BoolRef, str]] = []

    def track(label: str, proposition) -> None:
        tag = z3.Bool(label)
        solver.add(z3.Implies(tag, proposition))
        tracked.append((tag, label))

    for a, b in combinations(range(args.n), 2):
        track(f"P{a}{b}", distances[edge(a, b)] > 0)
    track("N01", distances[edge(0, 1)] == 1)
    for a, b, c in combinations(range(args.n), 3):
        ab, ac, bc = distances[edge(a, b)], distances[edge(a, c)], distances[edge(b, c)]
        track(f"T{a}{b}{c}a", ac < ab + bc)
        track(f"T{a}{b}{c}b", ab < ac + bc)
        track(f"T{a}{b}{c}c", bc < ab + ac)
    for a, b, c, d in combinations(range(args.n), 4):
        diagonal = distances[edge(a, c)] + distances[edge(b, d)]
        track(
            f"C{a}{b}{c}{d}",
            distances[edge(a, b)] + distances[edge(c, d)] < diagonal,
        )
        track(
            f"M{a}{b}{c}{d}",
            distances[edge(a, d)] + distances[edge(b, c)] < diagonal,
        )
    for center, x, y in pattern:
        track(
            f"E{center}{x}{y}",
            distances[edge(center, x)] == distances[edge(center, y)],
        )

    assumptions = [tag for tag, _ in tracked]
    if solver.check(*assumptions) != z3.unsat:
        print(json.dumps({"verdict": str(solver.check(*assumptions))}))
        return 1
    core_names = {tag.decl().name() for tag in solver.unsat_core()}
    core = [tag for tag, label in tracked if label in core_names]
    index = 0
    while index < len(core):
        candidate = core[:index] + core[index + 1 :]
        if solver.check(*candidate) == z3.unsat:
            core = candidate
        else:
            index += 1
    print(json.dumps({
        "n": args.n,
        "pattern": pattern,
        "core": [tag.decl().name() for tag in core],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
