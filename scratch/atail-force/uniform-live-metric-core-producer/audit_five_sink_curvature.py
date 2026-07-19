#!/usr/bin/env python3
"""Audit Lemmas 30/37 on the fourteen canonical five-sink systems.

The normalization is one full exterior turn = 2, so a quarter turn is 1/2
and a half turn is 1.  ``turn[i]`` is the exterior turn at retained sink
vertex ``i``.  ``gap[i]`` is the total exterior turn at all ambient polygon
vertices strictly between retained vertices ``i`` and ``i+1``.

This is deliberately an exact rational LRA audit.  It tests only consequences
already stated in Lemmas 30 and 37; it does not claim that an LRA model is a
Euclidean shell realization.
"""

from __future__ import annotations

import json
from fractions import Fraction

from z3 import Q, Real, Solver, sat


PATTERNS = [
    ("23", "24", "01", "04", "13"),
    ("23", "24", "04", "01", "03"),
    ("23", "24", "04", "01", "13"),
    ("23", "24", "04", "14", "01"),
    ("23", "24", "04", "14", "03"),
    ("23", "34", "01", "04", "12"),
    ("23", "34", "04", "01", "03"),
    ("23", "34", "04", "01", "12"),
    ("24", "23", "01", "04", "12"),
    ("24", "23", "01", "14", "03"),
    ("24", "23", "01", "14", "12"),
    ("24", "34", "01", "04", "12"),
    ("24", "34", "01", "04", "23"),
    ("24", "34", "14", "04", "23"),
]


def cyclic_open_sum(turn, gap, left: int, right: int):
    """Curvature K(left,right) on the forward cyclic arc, endpoints omitted."""
    terms = []
    cursor = left
    while True:
        terms.append(gap[cursor])
        cursor = (cursor + 1) % 5
        if cursor == right:
            break
        terms.append(turn[cursor])
    return sum(terms)


def cyclic_closed_sum(turn, gap, left: int, right: int):
    """Exterior turns on the forward cyclic interval [left,right]."""
    return turn[left] + cyclic_open_sum(turn, gap, left, right) + turn[right]


def forward_ordered_pair(center: int, encoded_pair: str) -> tuple[int, int]:
    targets = {int(encoded_pair[0]), int(encoded_pair[1])}
    ordered = []
    cursor = (center + 1) % 5
    while cursor != center:
        if cursor in targets:
            ordered.append(cursor)
        cursor = (cursor + 1) % 5
    if len(ordered) != 2:
        raise AssertionError((center, encoded_pair, ordered))
    return ordered[0], ordered[1]


def verify_fraction_model(
    pattern: tuple[str, ...], turn: list[Fraction], gap: list[Fraction]
) -> None:
    """Substitute a candidate into the mathematical constraints without Z3."""
    assert all(value > 0 for value in turn)
    assert all(value >= 0 for value in gap)
    assert sum(turn) + sum(gap) == 2
    for center, encoded_pair in enumerate(pattern):
        first, second = forward_ordered_pair(center, encoded_pair)
        for target in (first, second):
            assert cyclic_open_sum(turn, gap, center, target) > Fraction(1, 2)
            assert cyclic_open_sum(turn, gap, target, center) > Fraction(1, 2)
        assert (
            turn[center] + cyclic_closed_sum(turn, gap, first, second)
            < 1
        )


def audit_pattern(index: int, pattern: tuple[str, ...]) -> dict:
    turn = [Real(f"t_{index}_{i}") for i in range(5)]
    gap = [Real(f"g_{index}_{i}") for i in range(5)]
    solver = Solver()
    for value in turn:
        solver.add(value > 0)
    for value in gap:
        solver.add(value >= 0)
    solver.add(sum(turn) + sum(gap) == 2)

    for center, encoded_pair in enumerate(pattern):
        first, second = forward_ordered_pair(center, encoded_pair)
        for target in (first, second):
            solver.add(cyclic_open_sum(turn, gap, center, target) > Q(1, 2))
            solver.add(cyclic_open_sum(turn, gap, target, center) > Q(1, 2))
        solver.add(
            turn[center] + cyclic_closed_sum(turn, gap, first, second) < 1
        )

    verdict = solver.check()
    result = {
        "index": index,
        "pattern": list(pattern),
        "status": str(verdict).upper(),
    }
    if verdict == sat:
        model = solver.model()
        turn_values = [
            Fraction(
                model.eval(value, model_completion=True).numerator_as_long(),
                model.eval(value, model_completion=True).denominator_as_long(),
            )
            for value in turn
        ]
        gap_values = [
            Fraction(
                model.eval(value, model_completion=True).numerator_as_long(),
                model.eval(value, model_completion=True).denominator_as_long(),
            )
            for value in gap
        ]
        verify_fraction_model(pattern, turn_values, gap_values)
        result["substitution_verified"] = True
        result["turn"] = [str(value) for value in turn_values]
        result["gap"] = [str(value) for value in gap_values]
    return result


def main() -> None:
    results = [audit_pattern(index, pattern) for index, pattern in enumerate(PATTERNS)]
    payload = {
        "schema": "p97-five-sink-shell-curvature-audit-v1",
        "normalization": "full exterior turn = 2",
        "statuses": {
            status: sum(result["status"] == status for result in results)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "results": results,
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
