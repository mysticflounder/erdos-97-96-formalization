#!/usr/bin/env python3
"""Find minimum orientation subsets for the v11 five-point Euclidean core."""

from __future__ import annotations

import itertools

import z3


def cross(p: tuple[z3.ArithRef, z3.ArithRef],
          q: tuple[z3.ArithRef, z3.ArithRef],
          r: tuple[z3.ArithRef, z3.ArithRef]) -> z3.ArithRef:
    return (q[0] - p[0]) * (r[1] - p[1]) - (q[1] - p[1]) * (r[0] - p[0])


def sqdist(p: tuple[z3.ArithRef, z3.ArithRef],
           q: tuple[z3.ArithRef, z3.ArithRef]) -> z3.ArithRef:
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def main() -> None:
    coordinates = [z3.Reals(f"x_{i} y_{i}") for i in range(5)]
    a, b, c, d, e = coordinates
    base = [
        a[0] == 0,
        a[1] == 0,
        b[0] == 1,
        b[1] == 0,
        sqdist(d, a) == sqdist(d, c),
        sqdist(e, a) == sqdist(e, b),
        sqdist(d, c) == sqdist(d, e),
    ]
    triples = [
        (0, 1, 2), (0, 1, 3), (0, 1, 4),
        (1, 2, 0), (1, 2, 3), (1, 2, 4),
        (2, 3, 0), (2, 3, 1), (2, 3, 4),
        (3, 4, 0), (3, 4, 1), (3, 4, 2),
        (4, 0, 1), (4, 0, 2), (4, 0, 3),
    ]
    orientations = {
        f"orient_{i}_{j}_{k}": cross(coordinates[i], coordinates[j], coordinates[k]) > 0
        for i, j, k in triples
    }

    for size in range(len(orientations) + 1):
        unsat: list[tuple[str, ...]] = []
        for names in itertools.combinations(orientations, size):
            solver = z3.Solver()
            solver.set(timeout=10_000)
            solver.add(*base, *(orientations[name] for name in names))
            if solver.check() == z3.unsat:
                unsat.append(names)
        if unsat:
            print(f"minimum orientation count: {size}")
            print(f"minimum unsat subsets: {len(unsat)}")
            for names in unsat:
                print(" ".join(names))
            return
        print(f"all {len(list(itertools.combinations(orientations, size)))} subsets of size {size} SAT")


if __name__ == "__main__":
    main()
