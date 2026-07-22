#!/usr/bin/env python3
"""Smoke tests for the ordinal Kalmanson cancellation layer."""

from __future__ import annotations

import itertools
import json
from pathlib import Path

import z3

from decision import edge, ordinal_cycle_from_equalities


def add_cancellations(
    solver: z3.Solver,
    left: tuple[z3.ArithRef, z3.ArithRef],
    right: tuple[z3.ArithRef, z3.ArithRef],
) -> None:
    for left_index in range(2):
        for right_index in range(2):
            solver.add(z3.Implies(
                left[left_index] == right[right_index],
                left[1 - left_index] > right[1 - right_index],
            ))


def main() -> None:
    # One abstract cyclic quadruple: diagonal terms ac,bd dominate ad,bc.
    ab, ac, ad, bc, bd, cd = z3.Ints("ab ac ad bc bd cd")
    terms = (ab, ac, ad, bc, bd, cd)
    solver = z3.SolverFor("QF_LIA")
    for value in terms:
        solver.add(0 <= value, value < len(terms))
    add_cancellations(solver, (ac, bd), (ab, cd))
    add_cancellations(solver, (ac, bd), (ad, bc))

    # Kalmanson cancellation: ac=ad forces bd>bc.  Adding bd=bc is impossible.
    solver.push()
    solver.add(ac == ad, bd == bc)
    assert solver.check() == z3.unsat
    solver.pop()

    # The single equality has an ordinal realization.
    solver.push()
    solver.add(ac == ad)
    assert solver.check() == z3.sat
    solver.pop()

    # Every one-equality cancellation encoded above agrees with the original
    # strict linear inequality on a small exhaustive integer grid.
    for left, right in (
        ((ac, bd), (ab, cd)),
        ((ac, bd), (ad, bc)),
    ):
        for left_index, right_index in itertools.product(range(2), repeat=2):
            brute = z3.SolverFor("QF_LIA")
            for value in terms:
                brute.add(0 <= value, value < len(terms))
            brute.add(left[0] + left[1] >= right[0] + right[1] + 1)
            brute.add(left[left_index] == right[right_index])
            brute.add(left[1 - left_index] <= right[1 - right_index])
            assert brute.check() == z3.unsat

    # The six repository-owned first-core regressions from the monolithic
    # gate all belong to the quotient-cycle class and must be caught without
    # invoking exact LRA.
    regressions = Path(__file__).resolve().parents[1] / (
        "exact5-full-role-retained-gate/regressions"
    )
    checked = 0
    for path in sorted(regressions.glob("*.json")):
        data = json.loads(path.read_text())
        equalities = []
        for reason in data["core"]:
            kind, family, center_text, pair_text = reason.split("|")
            assert kind == "row"
            left_text, right_text = pair_text.split("=")
            center = int(center_text)
            equalities.append((
                edge(center, int(left_text)),
                edge(center, int(right_text)),
                reason,
            ))
        assert ordinal_cycle_from_equalities(equalities) is not None, path
        checked += 1
    assert checked == 6

    print("PASS ordinal cancellation smoke and six quotient-cycle regressions")


if __name__ == "__main__":
    main()
