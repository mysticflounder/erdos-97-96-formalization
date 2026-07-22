#!/usr/bin/env python3
"""Enumerate the local exact-class/asymmetric-row strict-Kalmanson shadows."""

from __future__ import annotations

import itertools
import json

import z3


VERTICES = tuple(range(13))
FIRST_APEX = 4
SECOND_APEX = 8
STRICT_FIRST = frozenset((9, 10, 11, 12))
PHYSICAL_CAP = frozenset((0, 1, 2, 3, 4))
PHYSICAL = frozenset((1, 2, 3))
SURPLUS_CAP = frozenset((4, 5, 6, 7, 8))
FIRST_OPPOSITE_CAP = frozenset((8, 9, 10, 11, 12, 0))


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def check(first_class: set[int], second_class: set[int],
          outside_pair: set[int]) -> bool:
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(VERTICES, 2)
    }
    distance = lambda left, right: (
        z3.RealVal(0) if left == right else distances[edge(left, right)]
    )
    solver = z3.SolverFor("QF_LRA")
    for value in distances.values():
        solver.add(value >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(distance(a, b) + distance(b, c) >= distance(a, c) + 1)
        solver.add(distance(a, c) + distance(b, c) >= distance(a, b) + 1)
        solver.add(distance(a, b) + distance(a, c) >= distance(b, c) + 1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonal = distance(a, c) + distance(b, d)
        solver.add(diagonal >= distance(a, b) + distance(c, d) + 1)
        solver.add(diagonal >= distance(a, d) + distance(b, c) + 1)

    def row(center: int, support: set[int]) -> None:
        reference = min(support)
        for point in support - {reference}:
            solver.add(distance(center, reference) == distance(center, point))

    row(FIRST_APEX, first_class)
    row(SECOND_APEX, second_class)
    row(2, set(PHYSICAL - {2}) | outside_pair)
    return solver.check() == z3.sat


def main() -> None:
    complement = set(VERTICES) - set(PHYSICAL_CAP)
    survivors = []
    first_extra_pairs = itertools.product(
        SURPLUS_CAP - {FIRST_APEX}, PHYSICAL_CAP - {FIRST_APEX}
    )
    for first_extra in first_extra_pairs:
        if first_extra[0] == first_extra[1]:
            continue
        first_class = set(STRICT_FIRST) | set(first_extra)
        second_extra_pairs = itertools.product(
            SURPLUS_CAP - {SECOND_APEX}, FIRST_OPPOSITE_CAP - {SECOND_APEX}
        )
        for second_extra in second_extra_pairs:
            if second_extra[0] == second_extra[1]:
                continue
            second_class = set(PHYSICAL) | set(second_extra)
            for outside in itertools.combinations(complement, 2):
                outside_pair = set(outside)
                if outside_pair <= first_class:
                    continue
                if check(first_class, second_class, outside_pair):
                    survivors.append({
                        "first_class": sorted(first_class),
                        "second_class": sorted(second_class),
                        "outside_pair": sorted(outside_pair),
                    })
                    print(json.dumps({"status": "SAT", **survivors[0]}, indent=2))
                    return
    print(json.dumps({"status": "UNSAT", "survivors": survivors}, indent=2))


if __name__ == "__main__":
    main()
