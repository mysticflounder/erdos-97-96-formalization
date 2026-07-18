#!/usr/bin/env python3
"""Check the exact Lemma-30 turn budgets on the audited 25-role cell.

This is a strict rational linear feasibility check in exterior-turn variables.
It is not a coordinate realization and does not encode the full parent.
"""

from __future__ import annotations

from fractions import Fraction

import z3


BOUNDARY = (
    "first", "t0s", "nS", "second", "x0", "y0", "q", "w",
    "t0i", "t1i0", "t1i1", "t1i2", "nI", "x1", "y1", "x2",
    "y2", "surplus", "c0", "b0", "b2", "c1", "b1", "c2", "t1o",
)

SHELLS = {
    "T0": ("first", ("q", "w", "t0i", "t0s")),
    "T1": ("first", ("t1i0", "t1i1", "t1i2", "t1o")),
    "reverse0": ("b0", ("c0", "c1", "x0", "y0")),
    "reverse1": ("b1", ("c1", "c2", "x1", "y1")),
    "reverse2": ("b2", ("c2", "c0", "x2", "y2")),
}


def cyclic_distance(start: int, end: int) -> int:
    return (end - start) % len(BOUNDARY)


def ordered_targets(center: str, support: tuple[str, ...]) -> tuple[str, ...]:
    center_index = BOUNDARY.index(center)
    return tuple(
        sorted(
            support,
            key=lambda point: cyclic_distance(center_index, BOUNDARY.index(point)),
        )
    )


def open_arc_indices(start: str, end: str) -> tuple[int, ...]:
    """Turn indices strictly after ``start`` and strictly before ``end``."""
    n = len(BOUNDARY)
    current = (BOUNDARY.index(start) + 1) % n
    stop = BOUNDARY.index(end)
    result: list[int] = []
    while current != stop:
        result.append(current)
        current = (current + 1) % n
    return tuple(result)


def as_fraction(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def solve() -> dict[str, object]:
    assert len(BOUNDARY) == len(set(BOUNDARY)) == 25
    turns = [z3.Real(f"turn_{index}") for index in range(len(BOUNDARY))]
    solver = z3.SolverFor("QF_LRA")
    solver.add(*(turn > 0 for turn in turns))
    # Normalize one full turn 2*pi to 4, so pi/2 becomes 1.
    solver.add(z3.Sum(turns) == 4)

    assumptions: dict[str, z3.BoolRef] = {}
    ledger: dict[str, object] = {}
    for name, (center, support) in SHELLS.items():
        targets = ordered_targets(center, support)
        q1, q2, q3, q4 = targets
        left_indices = open_arc_indices(center, q2)
        right_indices = open_arc_indices(q3, center)
        assumption = z3.Bool(f"use_{name}")
        assumptions[name] = assumption
        solver.add(z3.Implies(assumption, z3.Sum(*(turns[i] for i in left_indices)) > 1))
        solver.add(z3.Implies(assumption, z3.Sum(*(turns[i] for i in right_indices)) > 1))
        ledger[name] = {
            "center": center,
            "ordered_targets": list(targets),
            "middle_pair": [q2, q3],
            "left_open_arc": [BOUNDARY[i] for i in left_indices],
            "right_open_arc": [BOUNDARY[i] for i in right_indices],
        }

    result = solver.check(*assumptions.values())
    if result != z3.sat:
        return {
            "status": str(result),
            "unsat_core": [str(item) for item in solver.unsat_core()],
            "shells": ledger,
        }

    model = solver.model()
    values = [as_fraction(model.eval(turn)) for turn in turns]
    assert all(value > 0 for value in values)
    assert sum(values) == 4
    for item in ledger.values():
        left = sum(values[BOUNDARY.index(point)] for point in item["left_open_arc"])
        right = sum(values[BOUNDARY.index(point)] for point in item["right_open_arc"])
        assert left > 1 and right > 1
        item["left_open_arc_turn"] = str(left)
        item["right_open_arc_turn"] = str(right)

    return {
        "status": "sat",
        "epistemic_status": "EXACT_QF_LRA_TURN_BUDGET_SAT_NOT_EUCLIDEAN_NOT_FULL_PARENT",
        "normalization": "sum(turns)=4 corresponds to 2*pi; pi/2=1",
        "boundary": list(BOUNDARY),
        "turns": {name: str(values[index]) for index, name in enumerate(BOUNDARY)},
        "shells": ledger,
    }


if __name__ == "__main__":
    print(solve())
