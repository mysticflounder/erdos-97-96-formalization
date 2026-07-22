#!/usr/bin/env python3
"""Finite ordinal-rank decision surface for the exact-five card-13 same arm.

This module deliberately excludes the retained parent rows: the focused-gate
ablation showed that the source-role bundle already contradicts the ordinal
Kalmanson rank theory.  It retains the fixed critical row family, both
global-cover row families, the exact-five second-apex shell, the first-apex
double-deletion row, and the eleven source-role assertions (one of which is
syntactically redundant with the base surface).

The rank theory is a finite necessary condition for Euclidean distances in a
common convex-boundary order.  A selected-row equality identifies rank atoms.
If one term cancels in a strict Kalmanson inequality, the remaining positive
term must have strictly larger rank than the remaining negative term.
"""

from __future__ import annotations

import itertools

import z3

import run_asymmetric_same as runner


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance atom endpoints must be distinct")
    return tuple(sorted((left, right)))


def source_role_contract(outer) -> list[z3.BoolRef]:
    """The eleven non-parent assertions from the same-radius role packet."""
    vertices = runner.gate.VERTICES
    first = runner.gate.FIRST_APEX
    strict = tuple(sorted(runner.gate.STRICT_FIRST_OPPOSITE))
    complete = [z3.Or(outer.m[first, point], outer.b1[point])
                for point in vertices]
    assertions = [
        z3.PbGe([(outer.m[first, point], 1) for point in strict], 2),
        z3.PbGe([(outer.b1[point], 1) for point in strict], 2),
        z3.Or(
            outer.member_at_role(outer.m, first, outer.q),
            outer.member_at_role(outer.m, first, outer.w),
        ),
        z3.Or(*(
            z3.And(outer.q == point, outer.m[first, point])
            for point in strict
        ), *(
            z3.And(outer.w == point, outer.m[first, point])
            for point in strict
        )),
        z3.PbEq([(item, 1) for item in complete], 6),
        *(z3.Or(outer.m[first, point], outer.b1[point]) for point in strict),
    ]
    for family in outer.cover:
        other = [family[first, point] for point in vertices]
        meets = z3.Or(*(
            z3.And(other[point], complete[point]) for point in vertices
        ))
        assertions.append(z3.Implies(meets, z3.And(*(
            z3.Implies(other[point], complete[point]) for point in vertices
        ))))
    if len(assertions) != 11:
        raise AssertionError(f"expected eleven role assertions, got {len(assertions)}")
    return assertions


def build(orbit: str, seed: int = 0):
    if orbit not in {"asymmetricSourceLeft", "asymmetricSourceRight"}:
        raise ValueError(orbit)

    outer = runner.AsymmetricFocusOuter.__new__(runner.AsymmetricFocusOuter)
    outer.radius_arm = "same"
    runner.gate.BaseOuter.__init__(outer, orbit, 0, seed)
    base = list(outer.solver.assertions())

    role = source_role_contract(outer)

    solver = z3.Solver()
    solver.set(random_seed=seed)
    solver.add(*(base + role))
    outer.solver = solver

    vertices = runner.gate.VERTICES
    atoms = tuple(itertools.combinations(vertices, 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"ord_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    for variable in rank.values():
        solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))

    guarded_row_equalities = 0

    def add_row(center: int, row: list[z3.BoolRef]) -> None:
        nonlocal guarded_row_equalities
        targets = [point for point in vertices if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(z3.Implies(
                z3.And(row[left], row[right]),
                rank[edge(center, left)] == rank[edge(center, right)],
            ))
            guarded_row_equalities += 1

    for family in (outer.m, *outer.cover):
        for center in vertices:
            add_row(center, [family[center, point] for point in vertices])
    add_row(runner.gate.FIRST_APEX, outer.b1)

    # The complete exact-five second-apex class contains one point that may be
    # absent from its selected four-row, so its full equality closure is added
    # explicitly.
    shell_equalities = 0
    shell_targets = [
        point for point in vertices if point != runner.gate.SECOND_APEX
    ]
    for left, right in itertools.combinations(shell_targets, 2):
        solver.add(z3.Implies(
            z3.And(outer.shell[left], outer.shell[right]),
            rank[edge(runner.gate.SECOND_APEX, left)]
            == rank[edge(runner.gate.SECOND_APEX, right)],
        ))
        shell_equalities += 1

    cancellation_implications = 0
    for a, b, c, d in itertools.combinations(vertices, 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for positive_index in range(2):
                for negative_index in range(2):
                    solver.add(z3.Implies(
                        rank[positive[positive_index]]
                        == rank[negative[negative_index]],
                        z3.UGT(
                            rank[positive[1 - positive_index]],
                            rank[negative[1 - negative_index]],
                        ),
                    ))
                    cancellation_implications += 1

    counts = {
        "base_assertions": len(base),
        "source_role_assertions": len(role),
        "retained_parent_row_assertions": 0,
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "guarded_selected_row_rank_equalities": guarded_row_equalities,
        "guarded_exact_five_shell_rank_equalities": shell_equalities,
        "kalmanson_cancellation_implications": cancellation_implications,
        "total_source_assertions": len(solver.assertions()),
    }
    return outer, rank, counts
