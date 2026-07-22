#!/usr/bin/env python3
"""Finite source surface for the card-13 exact-five distinct-radius arms.

This module is intentionally isolated from production Lean.  It reuses the
audited card-13 canonical labeling and source-faithful parent/global-cover
encoder, then replaces the obsolete same-radius six-class assumptions with
the kernel-checked distinct-radius normal form:

* the retained and double-deletion first-apex rows are disjoint complete
  exact-four radius classes;
* their strict-cap intersections are disjoint pairs partitioning the four
  strict points; and
* the retained q-deleted parent row is the double-deletion class.

The ordinal theory is a necessary condition for Euclidean distances in the
common convex-boundary order.  It is not a planar or MEC realization test.
"""

from __future__ import annotations

import importlib.util
import itertools
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FOCUS_PATH = (
    ROOT / "scratch/atail-force/exact5-full-role-retained-gate/decision.py"
)

spec = importlib.util.spec_from_file_location("exact5_retained_gate", FOCUS_PATH)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {FOCUS_PATH}")
focus = importlib.util.module_from_spec(spec)
spec.loader.exec_module(focus)


ORBITS = ("asymmetricSourceLeft", "asymmetricSourceRight")
FULL_BLOCKS = frozenset({
    "connectivity",
    "complete_classes",
    "unique_k4_second",
    "unique_k4_first",
    "unique_k4_critical",
    "kalmanson",
})


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("a distance atom needs two distinct endpoints")
    return (left, right) if left < right else (right, left)


def row_vector(
    family: dict[tuple[int, int], z3.BoolRef], center: int
) -> list[z3.BoolRef]:
    return [family[center, point] for point in focus.VERTICES]


class DistinctAggregateOuter(focus.FocusOuter):
    """The full retained-row gate on one asymmetric distinct-radius orbit."""

    def __init__(self, orbit: str, seed: int) -> None:
        if orbit not in ORBITS:
            raise ValueError(orbit)
        self.radius_arm = "distinct"

        # Build the audited finite parent/global-cover surface without the
        # all-one-only CLI guard in FocusOuter.__init__.
        focus.BaseOuter.__init__(self, orbit, 0, seed)
        finite_assertions = list(self.solver.assertions())
        self.solver = z3.Solver()
        self.solver.set(random_seed=seed)
        self.solver.add(*finite_assertions)
        self.base_assertion_count = len(finite_assertions)

        self.parent_first = [
            z3.Bool(f"parent_first_{point}") for point in focus.VERTICES
        ]
        self.parent_second = [
            z3.Bool(f"parent_second_{point}") for point in focus.VERTICES
        ]
        before_focus = len(self.solver.assertions())
        focus.FocusOuter._add_focused_contract(self)
        self.focus_assertion_count = len(self.solver.assertions()) - before_focus

        # Kernel-checked card-13 coupling:
        # R.common.packet.B1 = P.doubleRow.support.
        before_parent = len(self.solver.assertions())
        for point in focus.VERTICES:
            self.solver.add(self.parent_first[point] == self.b1[point])

        # The complete five-class at the second apex contains at most one of
        # q,w because deletion of both leaves a four-point witness there.
        shell_q = self._row_member(self.shell, self.q)
        shell_w = self._row_member(self.shell, self.w)
        self.solver.add(z3.Not(z3.And(shell_q, shell_w)))
        self.aggregate_parent_assertion_count = (
            len(self.solver.assertions()) - before_parent
        )


def add_static_strong_connectivity(
    solver: z3.Solver,
    family: dict[tuple[int, int], z3.BoolRef],
    prefix: str,
) -> tuple[int, int]:
    """Encode reachability from and to vertex zero in at most n-1 arcs."""
    vertices = focus.VERTICES
    last = len(vertices) - 1
    forward = {
        (step, point): z3.Bool(f"{prefix}_forward_{step}_{point}")
        for step in range(last + 1)
        for point in vertices
    }
    backward = {
        (step, point): z3.Bool(f"{prefix}_backward_{step}_{point}")
        for step in range(last + 1)
        for point in vertices
    }
    before = len(solver.assertions())
    for point in vertices:
        solver.add(forward[0, point] == z3.BoolVal(point == 0))
        solver.add(backward[0, point] == z3.BoolVal(point == 0))
    for step in range(last):
        for point in vertices:
            solver.add(forward[step + 1, point] == z3.Or(
                forward[step, point],
                *(
                    z3.And(forward[step, source], family[source, point])
                    for source in vertices
                ),
            ))
            solver.add(backward[step + 1, point] == z3.Or(
                backward[step, point],
                *(
                    z3.And(family[point, target], backward[step, target])
                    for target in vertices
                ),
            ))
    for point in vertices:
        solver.add(forward[last, point], backward[last, point])
    return len(forward) + len(backward), len(solver.assertions()) - before


def build(
    orbit: str,
    seed: int = 0,
    enabled_blocks: frozenset[str] = FULL_BLOCKS,
):
    """Build one exact finite formula and return its semantic block counts."""
    unknown_blocks = enabled_blocks - FULL_BLOCKS
    if unknown_blocks:
        raise ValueError(f"unknown formula blocks: {sorted(unknown_blocks)}")
    outer = DistinctAggregateOuter(orbit, seed)
    solver = outer.solver
    vertices = focus.VERTICES
    first = focus.FIRST_APEX
    second = focus.SECOND_APEX

    connectivity_variables = 0
    connectivity_assertions = 0
    if "connectivity" in enabled_blocks:
        for name, family in (("m", outer.m), ("g0", outer.cover[0]),
                             ("g1", outer.cover[1])):
            variables, assertions = add_static_strong_connectivity(
                solver, family, name
            )
            connectivity_variables += variables
            connectivity_assertions += assertions

    atoms = tuple(itertools.combinations(vertices, 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"ord_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    before_bounds = len(solver.assertions())
    for variable in rank.values():
        solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))
    rank_bound_assertions = len(solver.assertions()) - before_bounds

    guarded_row_equalities = 0

    def add_selected_row(center: int, row: list[z3.BoolRef]) -> None:
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
            add_selected_row(center, row_vector(family, center))
    add_selected_row(first, outer.b1)
    add_selected_row(second, outer.shell)
    add_selected_row(first, outer.parent_first)
    add_selected_row(second, outer.parent_second)

    complete_class_inequalities = 0

    def add_complete_class(center: int, members: list[z3.BoolRef]) -> None:
        """Different membership forces a different radius rank."""
        nonlocal complete_class_inequalities
        targets = [point for point in vertices if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(z3.Implies(
                z3.Xor(members[left], members[right]),
                rank[edge(center, left)] != rank[edge(center, right)],
            ))
            complete_class_inequalities += 1

    if "complete_classes" in enabled_blocks:
        # Two complete exact-four first-apex classes and the complete
        # exact-five second-apex class.
        add_complete_class(first, row_vector(outer.m, first))
        add_complete_class(first, outer.b1)
        add_complete_class(second, outer.shell)

        # At each actual blocker-image center the selected critical row is its
        # complete exact-four class.
        for center in vertices:
            in_image = z3.Or(*(
                outer.blocker[source] == center for source in vertices
            ))
            targets = [point for point in vertices if point != center]
            members = row_vector(outer.m, center)
            for left, right in itertools.combinations(targets, 2):
                solver.add(z3.Implies(
                    z3.And(in_image, z3.Xor(members[left], members[right])),
                    rank[edge(center, left)] != rank[edge(center, right)],
                ))
                complete_class_inequalities += 1

    unique_k4_assertions = 0

    def all_equal(center: int, points: tuple[int, ...]) -> z3.BoolRef:
        reference = rank[edge(center, points[0])]
        return z3.And(*(
            reference == rank[edge(center, point)] for point in points[1:]
        ))

    # The exact-five profile has no other K4-capable radius at O2.
    if "unique_k4_second" in enabled_blocks:
        second_targets = tuple(point for point in vertices if point != second)
        for quad in itertools.combinations(second_targets, 4):
            solver.add(z3.Implies(
                z3.Not(z3.And(*(outer.shell[point] for point in quad))),
                z3.Not(all_equal(second, quad)),
            ))
            unique_k4_assertions += 1

    # At O1 every K4 radius is one of the two displayed exact-four classes.
    if "unique_k4_first" in enabled_blocks:
        first_targets = tuple(point for point in vertices if point != first)
        retained = row_vector(outer.m, first)
        for quad in itertools.combinations(first_targets, 4):
            displayed = z3.Or(
                z3.And(*(retained[point] for point in quad)),
                z3.And(*(outer.b1[point] for point in quad)),
            )
            solver.add(z3.Implies(
                z3.Not(displayed), z3.Not(all_equal(first, quad))
            ))
            unique_k4_assertions += 1

    # Every fixed-H blocker-image center has a unique K4-capable radius.
    if "unique_k4_critical" in enabled_blocks:
        for center in vertices:
            in_image = z3.Or(*(
                outer.blocker[source] == center for source in vertices
            ))
            targets = tuple(point for point in vertices if point != center)
            members = row_vector(outer.m, center)
            for quad in itertools.combinations(targets, 4):
                solver.add(z3.Implies(
                    z3.And(
                        in_image,
                        z3.Not(z3.And(*(members[point] for point in quad))),
                    ),
                    z3.Not(all_equal(center, quad)),
                ))
                unique_k4_assertions += 1

    cancellation_implications = 0
    if "kalmanson" in enabled_blocks:
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
        "base_parent_global_cover_assertions": outer.base_assertion_count,
        "retained_role_assertions": outer.focus_assertion_count,
        "distinct_parent_coupling_assertions": (
            outer.aggregate_parent_assertion_count
        ),
        "connectivity_auxiliary_variables": connectivity_variables,
        "connectivity_assertions": connectivity_assertions,
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "rank_bound_assertions": rank_bound_assertions,
        "guarded_selected_row_rank_equalities": guarded_row_equalities,
        "complete_class_rank_inequalities": complete_class_inequalities,
        "unique_k4_rank_assertions": unique_k4_assertions,
        "kalmanson_cancellation_implications": cancellation_implications,
        "total_source_assertions": len(solver.assertions()),
        "enabled_blocks": sorted(enabled_blocks),
    }
    return outer, rank, counts


def verify_decoded(outer: DistinctAggregateOuter, model: z3.ModelRef) -> list[str]:
    """Check the finite source projection of a satisfying model."""
    decoded = outer.decode(model)
    errors = focus.verify_focus(decoded)
    if set(decoded["parent_first"]) != set(decoded["b1"]):
        errors.append("retained parent first row is not the double class")
    shell = set(decoded["shell"])
    if sum(point in shell for point in (decoded["q"], decoded["w"])) > 1:
        errors.append("exact-five shell contains both frontier sources")
    return errors
