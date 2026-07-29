#!/usr/bin/env python3
"""Boolean equality-partition model for the live aligned-singleton leaf.

This is a bounded theorem-discovery model, not a proof and not a Euclidean
realization.  It fixes the smallest carrier allowed by the live hypotheses:

    n = 17, cap sizes = (6, 8, 6)

The production theorem only proves ``n >= 17``.  There is currently no
reduction to this minimum-cardinality slice, so even a certified UNSAT result
here would not close the arbitrary-cardinality Lean obligation.

The model represents complete distance-equality partitions, one selected
four-row at every center, the source-indexed critical blocker map, exact
critical shells, ``no_qfree``, the two localized mutual-omission cycles, the
three rich physical apices, and the named non-bisection target.

Deliberately absent are coordinates/MEC realizability, the full geometric
content of ``noM44``, and strict Kalmanson/triangle inequalities.  A SAT result
is therefore a survivor of necessary combinatorial conditions only.  An UNSAT
result would require a proof-producing rerun before promotion.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from collections import Counter
from pathlib import Path

import z3


N = 17
FIRST_APEX = 0
SECOND_APEX = 5
THIRD_APEX = 12
APICES = (FIRST_APEX, SECOND_APEX, THIRD_APEX)

CAPS = {
    "surplus": frozenset(range(0, 6)),
    "first_opposite": frozenset(range(5, 13)),
    "second_opposite": frozenset({12, 13, 14, 15, 16, 0}),
}
CAP_ENDPOINTS = {
    "surplus": frozenset({0, 5}),
    "first_opposite": frozenset({5, 12}),
    "second_opposite": frozenset({12, 0}),
}
FIRST_STRICT = tuple(range(6, 12))
OUTSIDE_FIRST = tuple(point for point in range(N) if point not in CAPS["first_opposite"])


class Encoding:
    def __init__(
        self,
        timeout_ms: int,
        random_seed: int,
        nonbisector: bool,
        full_circle_intersections: bool,
    ) -> None:
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.counts: Counter[str] = Counter()
        self.nonbisector = nonbisector
        self.full_circle_intersections = full_circle_intersections

        integer = z3.IntSort()
        boolean = z3.BoolSort()
        self.member = z3.Function("member", integer, integer, boolean)
        self.same = z3.Function("same", integer, integer, integer, boolean)
        self.blocker = z3.Function("blocker", integer, integer, boolean)

        role_names = (
            "p1",
            "p2",
            "r1",
            "r2",
            "source",
            "q",
            "other",
            "b1",
            "b2",
            "bsource",
            "cycle_p",
            "cycle_r",
        )
        self.roles = {name: z3.Int(name) for name in role_names}

        self._add_global_partitions_and_rows()
        self._add_blocker_map_and_critical_shells()
        self._add_global_incidence()
        self._add_kalmanson_three_equality_cuts()
        self._add_cap_bounds()
        self._add_tri_apex_residual()
        self._add_named_leaf()

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def class_size(
        self, center: int | z3.ArithRef, representative: int | z3.ArithRef,
        points: tuple[int, ...] | list[int],
    ) -> z3.ArithRef:
        return z3.Sum(
            *(z3.If(self.same(center, representative, point), 1, 0) for point in points)
        )

    @staticmethod
    def in_set(variable: z3.ArithRef, points: tuple[int, ...] | frozenset[int]) -> z3.BoolRef:
        return z3.Or(*(variable == point for point in points))

    def _add_global_partitions_and_rows(self) -> None:
        vertices = tuple(range(N))
        for center in vertices:
            self.add("row_nonself", z3.Not(self.member(center, center)))
            self.add(
                "row_card_eq_four",
                z3.PbEq(
                    [(self.member(center, point), 1) for point in vertices],
                    4,
                ),
            )

            for point in vertices:
                self.add("partition_reflexive", self.same(center, point, point))
                if point != center:
                    self.add(
                        "center_zero_class_separate",
                        z3.Not(self.same(center, center, point)),
                        z3.Not(self.same(center, point, center)),
                    )

            for left, right in itertools.combinations(vertices, 2):
                self.add(
                    "partition_symmetric",
                    self.same(center, left, right)
                    == self.same(center, right, left),
                )

            targets = tuple(point for point in vertices if point != center)
            for left, middle, right in itertools.combinations(targets, 3):
                lm = self.same(center, left, middle)
                lr = self.same(center, left, right)
                mr = self.same(center, middle, right)
                self.add(
                    "partition_transitive",
                    z3.Implies(z3.And(lm, mr), lr),
                    z3.Implies(z3.And(lm, lr), mr),
                    z3.Implies(z3.And(lr, mr), lm),
                )

            for left, right in itertools.combinations(targets, 2):
                self.add(
                    "row_one_radius",
                    z3.Implies(
                        z3.And(self.member(center, left), self.member(center, right)),
                        self.same(center, left, right),
                    ),
                )

    def _add_blocker_map_and_critical_shells(self) -> None:
        vertices = tuple(range(N))
        allowed_centers = tuple(point for point in vertices if point not in APICES)

        for source in vertices:
            self.add(
                "blocker_total",
                z3.PbEq(
                    [(self.blocker(source, center), 1) for center in allowed_centers],
                    1,
                ),
            )
            for center in vertices:
                if center in APICES or center == source:
                    self.add(
                        "blocker_forbidden",
                        z3.Not(self.blocker(source, center)),
                    )
                else:
                    self.add(
                        "blocker_contains_source",
                        z3.Implies(
                            self.blocker(source, center),
                            self.member(center, source),
                        ),
                    )
                    for point in vertices:
                        self.add(
                            "critical_shell_eq_full_class",
                            z3.Implies(
                                self.blocker(source, center),
                                self.member(center, point)
                                == self.same(center, source, point),
                            ),
                        )

                    # After deleting the blocked source, every full radius class
                    # at the blocker has at most three remaining points.
                    remaining = tuple(
                        point for point in vertices if point not in {center, source}
                    )
                    for representative in remaining:
                        self.add(
                            "critical_no_qfree",
                            z3.Implies(
                                self.blocker(source, center),
                                self.class_size(center, representative, remaining) <= 3,
                            ),
                        )

    def _add_global_incidence(self) -> None:
        vertices = tuple(range(N))

        # Two distinct *selected* circles share at most two carrier points.
        for left, right in itertools.combinations(vertices, 2):
            self.add(
                "two_circle_intersection",
                z3.PbLe(
                    [
                        (
                            z3.And(
                                self.member(left, point),
                                self.member(right, point),
                            ),
                            1,
                        )
                        for point in vertices
                    ],
                    2,
                ),
            )

        # A carrier pair has at most two carrier bisector centers.  This must
        # be stated on the complete equality partitions, not merely on the
        # selected rows: the first metric core exposes exactly that gap.
        for first, second in itertools.combinations(vertices, 2):
            self.add(
                "pair_bisector_centers_full_partition",
                z3.PbLe(
                    [
                        (
                            self.same(center, first, second),
                            1,
                        )
                        for center in vertices
                    ],
                    2,
                ),
            )

        # If two boundary centers are equidistant from a carrier pair, their
        # four endpoints alternate.  Again use full equality, whether or not
        # the pair belongs to either selected row.
        for center_left, center_right in itertools.combinations(vertices, 2):
            remaining = tuple(
                point
                for point in vertices
                if point not in {center_left, center_right}
            )
            for point_left, point_right in itertools.combinations(remaining, 2):
                alternates = (center_left < point_left < center_right) != (
                    center_left < point_right < center_right
                )
                if not alternates:
                    self.add(
                        "shared_pair_alternation_full_partition",
                        z3.Not(
                            z3.And(
                                self.same(center_left, point_left, point_right),
                                self.same(center_right, point_left, point_right),
                            )
                        ),
                    )

        if self.full_circle_intersections:
            # Optional monolithic overlay.  The default CEGAR route leaves
            # these constraints to the strict metric checker because all
            # representative pairs make the Boolean outer substantially
            # harder.
            for center_left, center_right in itertools.combinations(vertices, 2):
                left_targets = tuple(
                    point for point in vertices if point != center_left
                )
                right_targets = tuple(
                    point for point in vertices if point != center_right
                )
                for left_rep in left_targets:
                    for right_rep in right_targets:
                        self.add(
                            "two_circle_intersection_full_partition",
                            z3.PbLe(
                                [
                                    (
                                        z3.And(
                                            self.same(center_left, left_rep, point),
                                            self.same(center_right, right_rep, point),
                                        ),
                                        1,
                                    )
                                    for point in vertices
                                ],
                                2,
                            ),
                        )

    def _add_kalmanson_three_equality_cuts(self) -> None:
        """Forbid the seven irreducible three-equality cyclic metric cores.

        These are generic consequences of the two strict Kalmanson
        inequalities for points in convex cyclic order.  They were obtained
        by normalizing every size-three core in the first 672 exact metric
        refinements; deletion of any one literal makes the corresponding
        metric system satisfiable.
        """

        base_schemas: dict[int, tuple[tuple[tuple[int, int, int], ...], ...]] = {
            4: (
                ((0, 1, 2), (1, 0, 2), (3, 0, 1)),
            ),
            5: (
                ((0, 1, 2), (1, 2, 3), (4, 1, 3)),
                ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
            ),
            6: (
                ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
                ((0, 1, 2), (4, 1, 3), (5, 2, 3)),
                ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
                ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
            ),
        }

        def dihedral_orbit(
            size: int,
            schema: tuple[tuple[int, int, int], ...],
        ) -> set[tuple[tuple[int, int, int], ...]]:
            answer: set[tuple[tuple[int, int, int], ...]] = set()
            for direction in (1, -1):
                for shift in range(size):
                    transformed: list[tuple[int, int, int]] = []
                    for center, left, right in schema:
                        center_new = (direction * center + shift) % size
                        left_new = (direction * left + shift) % size
                        right_new = (direction * right + shift) % size
                        transformed.append(
                            (
                                center_new,
                                min(left_new, right_new),
                                max(left_new, right_new),
                            )
                        )
                    answer.add(tuple(sorted(transformed)))
            return answer

        for size, schemas in base_schemas.items():
            orbit = set().union(*(dihedral_orbit(size, schema) for schema in schemas))
            for vertices in itertools.combinations(range(N), size):
                for schema in orbit:
                    literals = (
                        self.same(
                            vertices[center],
                            vertices[left],
                            vertices[right],
                        )
                        for center, left, right in schema
                    )
                    self.add(
                        f"kalmanson_three_eq_{size}",
                        z3.Not(z3.And(*literals)),
                    )

    def _add_cap_bounds(self) -> None:
        for cap_name, cap in CAPS.items():
            cap_points = tuple(sorted(cap))
            endpoints = CAP_ENDPOINTS[cap_name]
            for center in cap_points:
                terms = [(self.member(center, point), 1) for point in cap_points]
                self.add("cap_center_row_le_two", z3.PbLe(terms, 2))
                if center in endpoints:
                    self.add("cap_endpoint_row_le_one", z3.PbLe(terms, 1))

    def _rich(self, center: int) -> z3.BoolRef:
        targets = tuple(point for point in range(N) if point != center)
        large = z3.Or(
            *(
                self.class_size(center, representative, targets) >= 6
                for representative in targets
            )
        )
        two_four = z3.Or(
            *(
                z3.And(
                    z3.Not(self.same(center, left, right)),
                    self.class_size(center, left, targets) >= 4,
                    self.class_size(center, right, targets) >= 4,
                )
                for left, right in itertools.combinations(targets, 2)
            )
        )
        return z3.Or(large, two_four)

    def _not_robust(self, center: int) -> z3.BoolRef:
        witnesses: list[z3.BoolRef] = []
        for deleted in range(N):
            if deleted == center:
                continue
            remaining = tuple(
                point for point in range(N) if point not in {center, deleted}
            )
            witnesses.append(
                z3.And(
                    *(
                        self.class_size(center, representative, remaining) <= 3
                        for representative in remaining
                    )
                )
            )
        return z3.Or(*witnesses)

    def _add_tri_apex_residual(self) -> None:
        for apex in APICES:
            self.add("apex_rich", self._rich(apex))

        for center in range(N):
            self.add(
                "no_center_covers_all_apices",
                z3.Not(
                    z3.And(
                        self.same(center, FIRST_APEX, SECOND_APEX),
                        self.same(center, FIRST_APEX, THIRD_APEX),
                    )
                ),
            )

        not_robust = [self._not_robust(center) for center in range(N)]
        self.add(
            "not_robust_cover_card",
            z3.Sum(*(z3.If(formula, 1, 0) for formula in not_robust)) >= 5,
        )

    def _add_named_leaf(self) -> None:
        p1 = self.roles["p1"]
        p2 = self.roles["p2"]
        r1 = self.roles["r1"]
        r2 = self.roles["r2"]
        source = self.roles["source"]
        q = self.roles["q"]
        other = self.roles["other"]
        b1 = self.roles["b1"]
        b2 = self.roles["b2"]
        bsource = self.roles["bsource"]
        cycle_p = self.roles["cycle_p"]
        cycle_r = self.roles["cycle_r"]

        for variable in self.roles.values():
            self.add("role_bounds", 0 <= variable, variable < N)

        for variable in (p1, p2, r1, r2, source, b1, b2):
            self.add("strict_cap_roles", self.in_set(variable, FIRST_STRICT))
        for variable in (q, other):
            self.add("outside_first_cap_roles", self.in_set(variable, OUTSIDE_FIRST))

        self.add(
            "retained_sources_distinct",
            z3.Distinct(p1, p2, r1, r2, source),
        )
        self.add(
            "outside_points_distinct",
            z3.Distinct(q, other, p1, p2, r1, r2, source),
        )
        self.add("blockers_distinct", b1 != b2)
        self.add("source_blocker_distinct", bsource != b1, bsource != b2)

        # The two exact first-apex four-classes and their strict-cap traces.
        first_targets = tuple(point for point in range(N) if point != FIRST_APEX)
        self.add("p_radius_pair", self.same(FIRST_APEX, p1, p2))
        self.add("r_radius_pair", self.same(FIRST_APEX, r1, r2))
        self.add("radii_distinct", z3.Not(self.same(FIRST_APEX, p1, r1)))
        self.add(
            "p_class_card_eq_four",
            self.class_size(FIRST_APEX, p1, first_targets) == 4,
        )
        self.add(
            "r_class_card_eq_four",
            self.class_size(FIRST_APEX, r1, first_targets) == 4,
        )
        for point in FIRST_STRICT:
            self.add(
                "p_class_strict_trace",
                self.same(FIRST_APEX, p1, point)
                == z3.Or(point == p1, point == p2),
            )
            self.add(
                "r_class_strict_trace",
                self.same(FIRST_APEX, r1, point)
                == z3.Or(point == r1, point == r2),
            )
            self.add(
                "singleton_strict_trace",
                self.same(FIRST_APEX, source, point) == (point == source),
            )

        for left, right in itertools.combinations(FIRST_STRICT, 2):
            self.add(
                "all_multi_point_radii_aligned",
                z3.Implies(
                    self.same(FIRST_APEX, left, right),
                    z3.Or(
                        self.same(FIRST_APEX, left, p1),
                        self.same(FIRST_APEX, left, r1),
                    ),
                ),
            )

        # Source-indexed blocker fibers.
        self.add("p1_blocker", self.blocker(p1, b1))
        self.add("p2_blocker", self.blocker(p2, b1))
        self.add("r1_blocker", self.blocker(r1, b2))
        self.add("r2_blocker", self.blocker(r2, b2))
        self.add("q_blocker", self.blocker(q, b1))
        self.add("singleton_source_blocker", self.blocker(source, bsource))

        # The first blocker row is exactly the two retained sources and the two
        # outside points.  The second row has exactly the other retained pair
        # in the strict cap.
        for point in range(N):
            self.add(
                "first_blocker_row_exact",
                self.member(b1, point)
                == z3.Or(
                    point == p1,
                    point == p2,
                    point == q,
                    point == other,
                ),
            )
        for point in FIRST_STRICT:
            self.add(
                "second_blocker_strict_trace",
                self.member(b2, point)
                == z3.Or(point == r1, point == r2),
            )

        # FirstFiberCapSourceWitness's two cross-pair deletion views.
        self.add(
            "source_omits_p_pair",
            z3.Or(z3.Not(self.member(bsource, p1)), z3.Not(self.member(bsource, p2))),
        )
        self.add(
            "source_omits_r_pair",
            z3.Or(z3.Not(self.member(bsource, r1)), z3.Not(self.member(bsource, r2))),
        )

        # The two mutual-omission cycles.  The stronger checked rectangle is
        # explicit because it is already available before the live sorry.
        self.add("cycle_p_choice", z3.Or(cycle_p == p1, cycle_p == p2))
        self.add("cycle_r_choice", z3.Or(cycle_r == r1, cycle_r == r2))
        self.add("cycle_p_blocker", self.blocker(cycle_p, b1))
        self.add("cycle_r_blocker", self.blocker(cycle_r, b2))
        self.add("cycle_p_omitted_by_second", z3.Not(self.member(b2, cycle_p)))
        self.add("cycle_r_omitted_by_first", z3.Not(self.member(b1, cycle_r)))
        for left in (p1, p2):
            self.add("cross_omission_rectangle", z3.Not(self.member(b2, left)))
        for right in (r1, r2):
            self.add("cross_omission_rectangle", z3.Not(self.member(b1, right)))

        target = self.same(b2, q, other)
        self.add(
            "second_blocker_target",
            z3.Not(target) if self.nonbisector else target,
        )

    def add_connectivity_cut(self, subset: frozenset[int]) -> None:
        complement = tuple(point for point in range(N) if point not in subset)
        self.add(
            "strong_connectivity_cegar_cut",
            z3.Or(
                *(
                    self.member(center, point)
                    for center in sorted(subset)
                    for point in complement
                )
            ),
        )


def strongly_connected_components(rows: dict[int, tuple[int, ...]]) -> list[frozenset[int]]:
    graph = {vertex: set(rows[vertex]) for vertex in range(N)}
    reverse = {vertex: set() for vertex in range(N)}
    for source, targets in graph.items():
        for target in targets:
            reverse[target].add(source)

    seen: set[int] = set()
    order: list[int] = []

    def visit(vertex: int) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        for target in graph[vertex]:
            visit(target)
        order.append(vertex)

    for vertex in range(N):
        visit(vertex)

    seen.clear()
    components: list[frozenset[int]] = []

    def collect(vertex: int, component: set[int]) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        component.add(vertex)
        for target in reverse[vertex]:
            collect(target, component)

    for vertex in reversed(order):
        if vertex not in seen:
            component: set[int] = set()
            collect(vertex, component)
            components.append(frozenset(component))
    return components


def sink_components(
    rows: dict[int, tuple[int, ...]], components: list[frozenset[int]]
) -> list[frozenset[int]]:
    answer: list[frozenset[int]] = []
    for component in components:
        if len(component) == N:
            continue
        if all(target in component for source in component for target in rows[source]):
            answer.append(component)
    return answer


def eval_bool(model: z3.ModelRef, expression: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(expression, model_completion=True))


def equivalence_classes(
    encoding: Encoding, model: z3.ModelRef, center: int
) -> list[list[int]]:
    remaining = set(range(N))
    classes: list[list[int]] = []
    while remaining:
        representative = min(remaining)
        block = sorted(
            point
            for point in remaining
            if eval_bool(model, encoding.same(center, representative, point))
        )
        classes.append(block)
        remaining.difference_update(block)
    return classes


def extract_payload(
    encoding: Encoding,
    model: z3.ModelRef,
    status: str,
    elapsed_seconds: float,
    refinements: int,
) -> dict[str, object]:
    rows = {
        center: tuple(
            point
            for point in range(N)
            if eval_bool(model, encoding.member(center, point))
        )
        for center in range(N)
    }
    blockers: dict[int, int] = {}
    for source in range(N):
        matches = [
            center
            for center in range(N)
            if eval_bool(model, encoding.blocker(source, center))
        ]
        if len(matches) != 1:
            raise RuntimeError(f"source {source} has blocker choices {matches}")
        blockers[source] = matches[0]

    classes = {
        center: equivalence_classes(encoding, model, center)
        for center in range(N)
    }
    not_robust = [
        center
        for center in range(N)
        if eval_bool(model, encoding._not_robust(center))
    ]
    roles = {
        name: model.eval(variable, model_completion=True).as_long()
        for name, variable in encoding.roles.items()
    }

    return {
        "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
        "epistemic_status": "BOUNDED_COMBINATORIAL_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN",
        "status": status,
        "n": N,
        "apices": list(APICES),
        "caps": {name: sorted(cap) for name, cap in CAPS.items()},
        "first_strict_cap": list(FIRST_STRICT),
        "target": "second_blocker_nonbisector" if encoding.nonbisector else "second_blocker_bisector_control",
        "roles": roles,
        "rows": {str(center): list(row) for center, row in rows.items()},
        "blockers": {str(source): center for source, center in blockers.items()},
        "equality_classes": {
            str(center): blocks for center, blocks in classes.items()
        },
        "not_robust_centers": not_robust,
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "connectivity_refinements": refinements,
        "elapsed_seconds": elapsed_seconds,
        "omitted": [
            "Euclidean coordinates and MEC/cap realizability",
            "strict metric triangle and Kalmanson inequalities",
            "full geometric content of noM44",
            "theorem-bank cuts not derived directly in this script",
        ] + (
            []
            if encoding.full_circle_intersections
            else ["monolithic all-class two-circle intersection overlay"]
        ),
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
        nonbisector=not args.bisector_control,
        full_circle_intersections=args.full_circle_intersections,
    )
    refinements = 0

    while refinements <= args.max_connectivity_refinements:
        status = encoding.solver.check()
        if status != z3.sat:
            return {
                "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
                "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
                "status": str(status).upper(),
                "reason_unknown": (
                    encoding.solver.reason_unknown() if status == z3.unknown else None
                ),
                "n": N,
                "target": (
                    "second_blocker_bisector_control"
                    if args.bisector_control
                    else "second_blocker_nonbisector"
                ),
                "constraint_counts": dict(sorted(encoding.counts.items())),
                "connectivity_refinements": refinements,
                "elapsed_seconds": time.monotonic() - started,
            }

        model = encoding.solver.model()
        rows = {
            center: tuple(
                point
                for point in range(N)
                if eval_bool(model, encoding.member(center, point))
            )
            for center in range(N)
        }
        components = strongly_connected_components(rows)
        if len(components) == 1:
            return extract_payload(
                encoding,
                model,
                status="SAT",
                elapsed_seconds=time.monotonic() - started,
                refinements=refinements,
            )
        sinks = sink_components(rows, components)
        if not sinks:
            raise RuntimeError("non-strong graph has no proper sink component")
        for component in sinks:
            encoding.add_connectivity_cut(component)
        refinements += 1

    return {
        "schema": "p97-aligned-singleton-second-nonbisector-outer-v1",
        "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
        "status": "UNKNOWN",
        "reason_unknown": "connectivity refinement budget exhausted",
        "n": N,
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "connectivity_refinements": refinements,
        "elapsed_seconds": time.monotonic() - started,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--max-connectivity-refinements", type=int, default=100)
    parser.add_argument(
        "--bisector-control",
        action="store_true",
        help="replace the live non-bisection by equality as a consistency control",
    )
    parser.add_argument(
        "--full-circle-intersections",
        action="store_true",
        help="enable the expensive all-class two-circle intersection overlay",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    payload = run(args)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "status": payload["status"],
                "target": payload.get("target"),
                "elapsed_seconds": payload.get("elapsed_seconds"),
                "connectivity_refinements": payload.get("connectivity_refinements"),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
