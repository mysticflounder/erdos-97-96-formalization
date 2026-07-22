#!/usr/bin/env python3
"""Expose the exact inequalities behind the first concrete LRA core."""

from __future__ import annotations

import itertools
import json

import z3


POINTS = (0, 1, 2, 3, 4, 7, 9, 10)
ROW_EQUALITIES = (
    (0, 2, 7),
    (0, 2, 10),
    (1, 3, 7),
    (1, 3, 9),
    (4, 2, 10),
    (4, 2, 9),
)


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def main() -> None:
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(POINTS, 2)
    }
    distance = lambda left, right: (
        z3.RealVal(0) if left == right else distances[edge(left, right)]
    )
    constraints: list[tuple[str, z3.BoolRef]] = []
    for pair, value in distances.items():
        constraints.append((f"positive|{pair[0]},{pair[1]}", value >= 1))
    for a, b, c in itertools.combinations(POINTS, 3):
        constraints.extend((
            (f"triangle|{a},{b},{c}|ac", distance(a,b)+distance(b,c)
             >= distance(a,c)+1),
            (f"triangle|{a},{b},{c}|ab", distance(a,c)+distance(b,c)
             >= distance(a,b)+1),
            (f"triangle|{a},{b},{c}|bc", distance(a,b)+distance(a,c)
             >= distance(b,c)+1),
        ))
    for a, b, c, d in itertools.combinations(POINTS, 4):
        diagonal = distance(a,c)+distance(b,d)
        constraints.extend((
            (f"kalmanson|{a},{b},{c},{d}|adjacent",
             diagonal >= distance(a,b)+distance(c,d)+1),
            (f"kalmanson|{a},{b},{c},{d}|complementary",
             diagonal >= distance(a,d)+distance(b,c)+1),
        ))
    for center, left, right in ROW_EQUALITIES:
        constraints.append((
            f"row|{center}|{left}={right}",
            distance(center,left)==distance(center,right),
        ))

    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=300_000)
    markers = [z3.Bool(f"constraint_{index}") for index in range(len(constraints))]
    for marker, (_, proposition) in zip(markers, constraints, strict=True):
        solver.add(z3.Implies(marker, proposition))
    result = solver.check(*markers)
    if result != z3.unsat:
        print(json.dumps({"status": str(result).upper()}, indent=2))
        return
    marker_index = {str(marker): index for index, marker in enumerate(markers)}
    core = [marker_index[str(marker)] for marker in solver.unsat_core()]
    position = 0
    while position < len(core):
        trial = core[:position] + core[position + 1 :]
        if solver.check(*(markers[index] for index in trial)) == z3.unsat:
            core = trial
        else:
            position += 1
    print(json.dumps({
        "status": "UNSAT",
        "core_size": len(core),
        "core": [constraints[index][0] for index in core],
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
