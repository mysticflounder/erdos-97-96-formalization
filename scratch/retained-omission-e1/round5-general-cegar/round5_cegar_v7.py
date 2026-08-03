#!/usr/bin/env python3
"""Exact-cardinality-15 finite relaxation for the retained-omission E1 target.

This is an external Z3 experiment.  See README.md for scope and trust status.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import itertools
import json
import os
import sys
import time
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable, Sequence

import z3


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
TARGET = "Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core"
SCHEMA_VERSION = 7
SCRIPT_PATH = Path(__file__).resolve()
SCRIPT_SHA256 = hashlib.sha256(SCRIPT_PATH.read_bytes()).hexdigest()
SCHEMA_PATH = HERE / "schema_v7.json"
UV_LOCK_PATH = HERE / "uv.lock"
SOURCE_FILES = {
    "live_target": PROJECT_ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean",
    "critical_shell_system": PROJECT_ROOT / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
    "second_apex_packet": PROJECT_ROOT / "lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean",
}
POINTS = tuple(range(15))
APICES = (12, 13, 14)
NONAPICES = tuple(range(12))
# A critical-shell blocker is merely a carrier point distinct from its source.
# Richness later proves that an apex cannot actually be used.  Keep every
# carrier label in the blocker domain so that the one-hot map remains a literal
# encoding of `centerAt`; schema v7 imposes the proved apex exclusion separately.
CENTER_CANDIDATES = POINTS
INTERIORS = ((0, 1, 2, 3), (4, 5, 6, 7), (8, 9, 10, 11))
CLOSED_CAPS = (
    (13, 0, 1, 2, 3, 14),
    (14, 4, 5, 6, 7, 12),
    (12, 8, 9, 10, 11, 13),
)
CYCLIC_ORDER = (13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11)
CYCLIC_POSITION = {point: position for position, point in enumerate(CYCLIC_ORDER)}


def cyclic_between(left: int, right: int, point: int) -> bool:
    """Whether `point` is on the open forward hull arc from left to right."""
    lpos = CYCLIC_POSITION[left]
    rpos = CYCLIC_POSITION[right]
    ppos = CYCLIC_POSITION[point]
    if lpos < rpos:
        return lpos < ppos < rpos
    return ppos > lpos or ppos < rpos


def cyclic_separated(a: int, b: int, x: int, y: int) -> bool:
    """Whether endpoint pairs `{a,b}` and `{x,y}` alternate cyclically."""
    return cyclic_between(a, b, x) != cyclic_between(a, b, y)


def exactly(bits: Sequence[z3.BoolRef], n: int) -> z3.BoolRef:
    return z3.PbEq([(bit, 1) for bit in bits], n)


def at_most(bits: Sequence[z3.BoolRef], n: int) -> z3.BoolRef:
    return z3.PbLe([(bit, 1) for bit in bits], n)


def z3_and(bits: Iterable[z3.BoolRef]) -> z3.BoolRef:
    values = list(bits)
    return z3.And(*values) if values else z3.BoolVal(True)


def z3_or(bits: Iterable[z3.BoolRef]) -> z3.BoolRef:
    values = list(bits)
    return z3.Or(*values) if values else z3.BoolVal(False)


@dataclass(frozen=True)
class Case:
    arm: str
    profiles: str
    kept: int
    deleted: int
    fresh: int | None = None

    def validate(self) -> None:
        if self.arm not in {
            "paired",
            "fresh",
            "secondcap_collision",
            "secondcap_distinct",
        }:
            raise ValueError(f"bad arm: {self.arm}")
        if len(self.profiles) != 3 or any(p not in "SD" for p in self.profiles):
            raise ValueError(f"bad profiles: {self.profiles}")
        first = set(INTERIORS[0])
        if self.kept not in first or self.deleted not in first:
            raise ValueError("kept/deleted must lie in first strict cap interior")
        if self.kept == self.deleted:
            raise ValueError("kept and deleted must be distinct")
        if self.arm == "paired" and self.fresh is not None:
            raise ValueError("paired case must not name fresh")
        if self.arm == "fresh":
            if self.fresh not in first:
                raise ValueError("fresh must lie in first strict cap interior")
            if self.fresh in {self.kept, self.deleted}:
                raise ValueError("fresh must be distinct from kept/deleted")
        if self.arm in {"secondcap_collision", "secondcap_distinct"}:
            if self.fresh not in set(INTERIORS[1]):
                raise ValueError("second-cap fresh must lie in second strict cap interior")

    @property
    def case_id(self) -> str:
        base = f"{self.arm}_{self.profiles}_k{self.kept}_d{self.deleted}"
        return base if self.fresh is None else f"{base}_f{self.fresh}"


@dataclass
class Circle:
    name: str
    support: list[z3.BoolRef]
    center_cases: dict[int, z3.BoolRef]


class Encoding:
    def __init__(self, case: Case, timeout_ms: int, seed: int = 97) -> None:
        case.validate()
        self.case = case
        self.timeout_ms = timeout_ms
        self.seed = seed
        self.groups: dict[str, list[z3.BoolRef]] = defaultdict(list)
        self.circles: list[Circle] = []
        self.distance: dict[tuple[int, int], z3.ArithRef] = {}
        self.squared_distance: dict[tuple[int, int], z3.ArithRef] = {}
        self.block: dict[tuple[int, int], z3.BoolRef] = {}
        self.row: dict[tuple[int, int], z3.BoolRef] = {}
        self.row_radius: dict[int, z3.ArithRef] = {}
        self.k4: dict[tuple[int, int], z3.BoolRef] = {}
        self.k4_radius: dict[int, z3.ArithRef] = {}
        self.rich: dict[tuple[int, int], dict[str, object]] = {}
        self.packets: list[dict[str, object]] = []
        self._used_cache: dict[int, z3.BoolRef] = {}
        self._build()

    def add(self, family: str, *constraints: z3.BoolRef) -> None:
        self.groups[family].extend(constraints)

    def d(self, i: int, j: int) -> z3.ArithRef:
        if i == j:
            return z3.RealVal(0)
        return self.distance[tuple(sorted((i, j)))]

    def s(self, i: int, j: int) -> z3.ArithRef:
        if i == j:
            return z3.RealVal(0)
        return self.squared_distance[tuple(sorted((i, j)))]

    def used(self, center: int) -> z3.BoolRef:
        if center not in self._used_cache:
            self._used_cache[center] = z3_or(
                self.block[q, center] for q in POINTS
            )
        return self._used_cache[center]

    def blockers_distinct(self, q1: int, q2: int) -> z3.BoolRef:
        return z3_and(
            z3.Not(z3.And(self.block[q1, c], self.block[q2, c]))
            for c in CENTER_CANDIDATES
        )

    def dynamic_row_member(self, source: int, point: int) -> z3.BoolRef:
        return z3_or(
            z3.And(self.block[source, c], self.row[c, point])
            for c in CENTER_CANDIDATES
        )

    def _build(self) -> None:
        self._build_distances_and_order_geometry()
        self._build_squared_distance_equality_transport()
        self._build_blocker_map()
        self._build_critical_rows()
        self._build_global_k4()
        self._build_rich_apices()
        self._build_critical_row_cross_cap_rich_slice_one_hit()
        self._build_same_shell_squared_superadditivity()
        self._build_pair_center_multiplicity()
        self._build_no_all_apex_shell()
        self._build_normal_form()
        self._build_circle_overlap_constraints()
        self._build_cyclic_alternation_cuts()

    def _build_distances_and_order_geometry(self) -> None:
        for i, j in itertools.combinations(POINTS, 2):
            var = z3.Real(f"d_{i}_{j}")
            self.distance[i, j] = var
            self.add("positive_distances", var >= 1)

            squared_var = z3.Real(f"s_{i}_{j}")
            self.squared_distance[i, j] = squared_var
            self.add("positive_squared_distances", squared_var >= 1)

        for i, j, k in itertools.combinations(POINTS, 3):
            self.add(
                "strict_triangle",
                self.d(i, j) + self.d(j, k) >= self.d(i, k) + 1,
                self.d(i, j) + self.d(i, k) >= self.d(j, k) + 1,
                self.d(i, k) + self.d(j, k) >= self.d(i, j) + 1,
            )

        for ia, ib, ic, id_ in itertools.combinations(range(15), 4):
            a, b, c, d = (
                CYCLIC_ORDER[ia],
                CYCLIC_ORDER[ib],
                CYCLIC_ORDER[ic],
                CYCLIC_ORDER[id_],
            )
            diagonal_sum = self.d(a, c) + self.d(b, d)
            self.add(
                "strict_kalmanson",
                diagonal_sum >= self.d(a, b) + self.d(c, d) + 1,
                diagonal_sum >= self.d(a, d) + self.d(b, c) + 1,
            )

    def _build_squared_distance_equality_transport(self) -> None:
        """Transport every same-center distance equality to squared distances.

        Actual positive distances satisfy this implication because squaring is
        injective.  Keeping only the implication (and no nonlinear equation
        `s = d^2`) makes this a sound relaxation tailored to equality systems.
        """
        for center in POINTS:
            others = [x for x in POINTS if x != center]
            for x, y in itertools.combinations(others, 2):
                self.add(
                    "squared_distance_equality_transport",
                    z3.Implies(
                        self.d(center, x) == self.d(center, y),
                        self.s(center, x) == self.s(center, y),
                    ),
                )

    def _angular_order_from(self, apex: int) -> list[int]:
        """Hull order of rays from an extreme vertex, up to reversal."""
        position = CYCLIC_POSITION[apex]
        return [
            CYCLIC_ORDER[(position + offset) % len(CYCLIC_ORDER)]
            for offset in range(1, len(CYCLIC_ORDER))
        ]

    def _build_blocker_map(self) -> None:
        for q in POINTS:
            choices = []
            for c in CENTER_CANDIDATES:
                bit = z3.Bool(f"block_{q}_{c}")
                self.block[q, c] = bit
                if q == c:
                    self.add("critical_blocker_map", z3.Not(bit))
                else:
                    choices.append(bit)
            self.add("critical_blocker_map", exactly(choices, 1))

    def _build_critical_rows(self) -> None:
        for c in CENTER_CANDIDATES:
            used = self.used(c)
            radius = z3.Real(f"critical_radius_{c}")
            self.row_radius[c] = radius
            support = []
            for x in POINTS:
                bit = z3.Bool(f"critical_row_{c}_{x}")
                self.row[c, x] = bit
                support.append(bit)
                if x == c:
                    self.add("critical_full_row", z3.Not(bit))
                else:
                    self.add(
                        "critical_full_row",
                        z3.Implies(used, bit == (self.d(c, x) == radius)),
                    )
                self.add("critical_full_row", z3.Implies(z3.Not(used), z3.Not(bit)))
            self.add(
                "critical_full_row",
                z3.Implies(used, radius >= 1),
                z3.Implies(used, exactly(support, 4)),
            )
            for q in POINTS:
                self.add(
                    "source_in_critical_row",
                    z3.Implies(self.block[q, c], self.row[c, q]),
                )

            # `no_qfree`: at a used critical center, every other distance
            # class has multiplicity at most three.  The selected radius is
            # already tied iff to the exact four-row above.
            for y in POINTS:
                if y == c:
                    continue
                same_class = [
                    self.d(c, x) == self.d(c, y) for x in POINTS if x != c
                ]
                self.add(
                    "critical_no_competing_K4",
                    z3.Implies(
                        z3.And(used, z3.Not(self.row[c, y])),
                        at_most(same_class, 3),
                    ),
                )
            self.circles.append(
                Circle(f"critical_{c}", support, {c: used})
            )

    def _build_global_k4(self) -> None:
        for c in CENTER_CANDIDATES:
            radius = z3.Real(f"k4_radius_{c}")
            self.k4_radius[c] = radius
            support = []
            for x in POINTS:
                bit = z3.Bool(f"k4_{c}_{x}")
                self.k4[c, x] = bit
                support.append(bit)
                if x == c:
                    self.add("global_K4", z3.Not(bit))
                else:
                    self.add(
                        "global_K4",
                        z3.Implies(bit, self.d(c, x) == radius),
                        z3.Implies(self.used(c), bit == self.row[c, x]),
                    )
            self.add("global_K4", radius >= 1, exactly(support, 4))
            self.circles.append(Circle(f"globalK4_{c}", support, {c: z3.BoolVal(True)}))

    def _build_rich_apices(self) -> None:
        for i, (apex, profile, interior) in enumerate(
            zip(APICES, self.case.profiles, INTERIORS, strict=True)
        ):
            class_count = 1 if profile == "S" else 2
            active_supports: list[list[z3.BoolRef]] = []
            radii: list[z3.ArithRef] = []
            for cls in range(class_count):
                radius = z3.Real(f"rich_radius_{i}_{cls}")
                radii.append(radius)
                support = []
                for x in POINTS:
                    bit = z3.Bool(f"rich_{i}_{cls}_{x}")
                    support.append(bit)
                    if x == apex:
                        self.add("exact_rich_profiles", z3.Not(bit))
                    else:
                        self.add(
                            "exact_rich_profiles",
                            bit == (self.d(apex, x) == radius),
                        )
                wanted = 6 if profile == "S" else 4
                self.add(
                    "exact_rich_profiles",
                    radius >= 1,
                    exactly(support, wanted),
                )
                if profile == "S":
                    self.add(
                        "exact_rich_profiles",
                        *(support[x] for x in interior),
                    )
                else:
                    self.add(
                        "exact_rich_profiles",
                        exactly([support[x] for x in interior], 2),
                    )
                self.rich[i, cls] = {"radius": radius, "support": support}
                active_supports.append(support)
                self.circles.append(
                    Circle(f"rich_{i}_{cls}", support, {apex: z3.BoolVal(True)})
                )

            if profile == "D":
                self.add("exact_rich_profiles", radii[0] != radii[1])
                for x in POINTS:
                    self.add(
                        "exact_rich_profiles",
                        z3.Not(z3.And(active_supports[0][x], active_supports[1][x])),
                    )
                for x in interior:
                    self.add(
                        "exact_rich_profiles",
                        z3.Or(active_supports[0][x], active_supports[1][x]),
                    )

            # Exact n=15 cap exhaustion rules out an unnamed third K4 radius.
            for y in POINTS:
                if y == apex:
                    continue
                in_known = z3_or(support[y] for support in active_supports)
                same_class = [
                    self.d(apex, x) == self.d(apex, y)
                    for x in POINTS
                    if x != apex
                ]
                self.add(
                    "exact_rich_profiles",
                    z3.Implies(z3.Not(in_known), at_most(same_class, 3)),
                )

    def _build_critical_row_cross_cap_rich_slice_one_hit(self) -> None:
        """Compile the Lean-banked cap partition and cross-cap one-hit bound.

        Under tri-apex richness every selected critical-shell center belongs to
        one strict cap interior, hence no apex is used.  If that center lies in
        cap `i`, its full exact-four row has at most one point in every fixed
        rich radius slice of a distinct cap `j`.
        """
        for apex in APICES:
            self.add(
                "rich_apex_not_critical_center",
                z3.Not(self.used(apex)),
            )

        for center_cap_index, center_cap in enumerate(INTERIORS):
            for center in center_cap:
                for (rich_cap_index, _class_index), rich_class in sorted(
                    self.rich.items()
                ):
                    if center_cap_index == rich_cap_index:
                        continue
                    support = rich_class["support"]
                    cross_cap_hits = [
                        z3.And(self.row[center, point], support[point])
                        for point in INTERIORS[rich_cap_index]
                    ]
                    self.add(
                        "critical_row_cross_cap_rich_slice_one_hit",
                        z3.Implies(self.used(center), at_most(cross_cap_hits, 1)),
                    )

    def _build_same_shell_squared_superadditivity(self) -> None:
        """Add the open-semicircle obtuse-chord inequality on rich shells.

        If `x < y < z` are in angular order on one circle centered at an
        extreme carrier point, then angle `xyz` is obtuse and hence
        `|xz|^2 > |xy|^2 + |yz|^2`.  Margin one is sound by homogeneous
        rescaling of the independent squared-distance relaxation.
        """
        for (apex_index, _class_index), rich_class in sorted(self.rich.items()):
            apex = APICES[apex_index]
            support = rich_class["support"]
            angular_order = self._angular_order_from(apex)
            for x_index, y_index, z_index in itertools.combinations(
                range(len(angular_order)), 3
            ):
                x = angular_order[x_index]
                y = angular_order[y_index]
                z = angular_order[z_index]
                self.add(
                    "same_shell_squared_superadditivity",
                    z3.Implies(
                        z3.And(support[x], support[y], support[z]),
                        self.s(x, z) >= self.s(x, y) + self.s(y, z) + 1,
                    ),
                )

    def _build_pair_center_multiplicity(self) -> None:
        for x, y in itertools.combinations(POINTS, 2):
            equidistant_centers = [
                self.d(c, x) == self.d(c, y) for c in POINTS
            ]
            self.add(
                "pair_center_multiplicity",
                at_most(equidistant_centers, 2),
            )

    def _build_no_all_apex_shell(self) -> None:
        a0, a1, a2 = APICES
        for c in POINTS:
            self.add(
                "no_all_apex_shell",
                z3.Not(
                    z3.And(
                        self.d(c, a0) == self.d(c, a1),
                        self.d(c, a1) == self.d(c, a2),
                    )
                ),
            )

    def _add_packet(self, name: str, q: int, retained_source: int) -> None:
        b1 = [z3.Bool(f"{name}_B1_{x}") for x in POINTS]
        b2 = [z3.Bool(f"{name}_B2_{x}") for x in POINTS]
        r1 = z3.Real(f"{name}_radius1")
        r2 = z3.Real(f"{name}_radius2")
        self.add(
            "common_deletion_packets",
            r1 >= 1,
            r2 >= 1,
            exactly(b1, 4),
            exactly(b2, 4),
            z3.Not(b1[q]),
            z3.Not(b2[q]),
            z3.Not(b1[APICES[0]]),
            at_most([z3.And(b1[x], b2[x]) for x in POINTS], 2),
            self.blockers_distinct(q, retained_source),
        )
        for x in POINTS:
            if x != APICES[0]:
                self.add(
                    "common_deletion_packets",
                    z3.Implies(b1[x], self.d(APICES[0], x) == r1),
                )
        # The retained actual blocker is one-hot over every carrier point.
        # Its B2 packet is its full critical row regardless of whether `c` is
        # an apex; the rich/no-qfree constraints then reject apex centers.
        for c in CENTER_CANDIDATES:
            self.add(
                "common_deletion_packets",
                z3.Implies(self.block[retained_source, c], z3.Not(b2[c])),
            )
            for x in POINTS:
                self.add(
                    "packet_B2_equals_critical_row",
                    z3.Implies(
                        self.block[retained_source, c],
                        b2[x] == self.row[c, x],
                    ),
                )
                if x == c:
                    continue
                self.add(
                    "common_deletion_packets",
                    z3.Implies(
                        z3.And(self.block[retained_source, c], b2[x]),
                        self.d(c, x) == r2,
                    ),
                )
        self.packets.append(
            {
                "name": name,
                "deleted": q,
                "retained_source": retained_source,
                "B1": b1,
                "B2": b2,
                "radius1": r1,
                "radius2": r2,
            }
        )
        self.circles.append(
            Circle(f"{name}_B1", b1, {APICES[0]: z3.BoolVal(True)})
        )
        self.circles.append(
            Circle(
                f"{name}_B2",
                b2,
                {c: self.block[retained_source, c] for c in CENTER_CANDIDATES},
            )
        )

    def _build_normal_form(self) -> None:
        k = self.case.kept
        d = self.case.deleted
        first_frontier = self.rich[0, 0]["support"]
        assert isinstance(first_frontier, list)
        self.add(
            "normal_form",
            first_frontier[k],
            first_frontier[d],
            self.blockers_distinct(k, d),
            z3.Not(self.dynamic_row_member(k, d)),
        )

        # The oriented packet deletes `deleted` at the first apex and the
        # blocker selected by `kept`.
        self._add_packet("oriented", q=d, retained_source=k)

        if self.case.arm == "paired":
            self.add(
                "normal_form",
                z3.Not(self.dynamic_row_member(d, k)),
            )
            self._add_packet("reverse", q=k, retained_source=d)
            return

        fresh = self.case.fresh
        assert fresh is not None
        self.add(
            "normal_form",
            self.dynamic_row_member(d, k),
            z3_or(self.block[d, c] for c in INTERIORS[0]),
            z3.Not(self.dynamic_row_member(d, fresh)),
        )
        for x in CLOSED_CAPS[0]:
            expected = x in {k, d}
            member = self.dynamic_row_member(d, x)
            self.add("normal_form", member if expected else z3.Not(member))
        packet_name = (
            "fresh_secondcap"
            if self.case.arm in {"secondcap_collision", "secondcap_distinct"}
            else "fresh"
        )
        self._add_packet(packet_name, q=fresh, retained_source=d)

        # The endpoint classification of the Lean two-step walk is a split on
        # the already one-hot actual blocker map.  In the collision case the
        # source-level `RowHit` is witnessed by `k` on the retained first-apex
        # rich class; this named duplicate makes that coverage auditable.
        if self.case.arm == "secondcap_collision":
            self.add("endpoint_critical_fiber", first_frontier[k])
            for c in CENTER_CANDIDATES:
                self.add(
                    "endpoint_critical_fiber",
                    self.block[fresh, c] == self.block[k, c],
                )
        elif self.case.arm == "secondcap_distinct":
            self.add(
                "three_distinct_blockers",
                self.blockers_distinct(fresh, k),
            )

    def _build_circle_overlap_constraints(self) -> None:
        for left, right in itertools.combinations(self.circles, 2):
            overlap_le_two = at_most(
                [z3.And(left.support[x], right.support[x]) for x in POINTS],
                2,
            )
            for lc, lcond in left.center_cases.items():
                for rc, rcond in right.center_cases.items():
                    if lc == rc:
                        continue
                    self.add(
                        "distinct_circle_overlap",
                        z3.Implies(z3.And(lcond, rcond), overlap_le_two),
                    )

    def _build_cyclic_alternation_cuts(self) -> None:
        """Precompile the banked two-center bisector-parity consequence.

        The inequalities in `strict_kalmanson` already imply these clauses.
        Recording the forbidden equality patterns explicitly avoids asking the
        SMT solver to rediscover the four order cases through linear arithmetic.
        """
        for left, right in itertools.combinations(self.circles, 2):
            for lc, lcond in left.center_cases.items():
                for rc, rcond in right.center_cases.items():
                    if lc == rc:
                        continue
                    open_arcs = (
                        [
                            x for x in POINTS
                            if x not in {lc, rc} and cyclic_between(lc, rc, x)
                        ],
                        [
                            x for x in POINTS
                            if x not in {lc, rc} and cyclic_between(rc, lc, x)
                        ],
                    )
                    for arc in open_arcs:
                        if len(arc) <= 1:
                            continue
                        self.add(
                            "cyclic_alternation_cut",
                            z3.Implies(
                                z3.And(lcond, rcond),
                                at_most(
                                    [
                                        z3.And(left.support[x], right.support[x])
                                        for x in arc
                                    ],
                                    1,
                                ),
                            ),
                        )

    def make_solver(self) -> tuple[z3.Solver, str]:
        solver = z3.Solver()
        solver.set(timeout=self.timeout_ms)
        solver.set(random_seed=self.seed)
        solver.set(threads=1)
        for family in sorted(self.groups):
            constraints = self.groups[family]
            tag = z3.Bool(f"track_{family}")
            solver.assert_and_track(z3.And(*constraints), tag)
        smt2 = solver.sexpr() + "\n(check-sat)\n"
        return solver, smt2

    def constraint_counts(self) -> dict[str, int]:
        return {family: len(items) for family, items in sorted(self.groups.items())}

    @staticmethod
    def _bool(model: z3.ModelRef, value: z3.BoolRef) -> bool:
        return z3.is_true(model.eval(value, model_completion=True))

    @staticmethod
    def _value(model: z3.ModelRef, value: z3.ArithRef) -> str:
        return str(model.eval(value, model_completion=True))

    def validate_model(self, model: z3.ModelRef) -> dict[str, object]:
        checked = 0
        failures = []
        for family, constraints in sorted(self.groups.items()):
            for index, constraint in enumerate(constraints):
                checked += 1
                if not z3.is_true(model.eval(constraint, model_completion=True)):
                    failures.append({"family": family, "index": index})
                    if len(failures) >= 20:
                        return {"checked": checked, "failures": failures}
        return {"checked": checked, "failures": failures}

    def serialize_model(self, model: z3.ModelRef) -> dict[str, object]:
        blockers = {}
        for q in POINTS:
            matches = [
                c for c in CENTER_CANDIDATES if self._bool(model, self.block[q, c])
            ]
            blockers[str(q)] = matches[0] if len(matches) == 1 else matches

        critical_rows = []
        for c in CENTER_CANDIDATES:
            if self._bool(model, self.used(c)):
                sources = [q for q in POINTS if self._bool(model, self.block[q, c])]
                support = [x for x in POINTS if self._bool(model, self.row[c, x])]
                critical_rows.append(
                    {
                        "center": c,
                        "sources": sources,
                        "support": support,
                        "radius": self._value(model, self.row_radius[c]),
                    }
                )

        global_k4 = []
        for c in NONAPICES:
            global_k4.append(
                {
                    "center": c,
                    "support": [
                        x for x in POINTS if self._bool(model, self.k4[c, x])
                    ],
                    "radius": self._value(model, self.k4_radius[c]),
                }
            )

        rich = []
        for (i, cls), data in sorted(self.rich.items()):
            support = data["support"]
            radius = data["radius"]
            assert isinstance(support, list)
            assert isinstance(radius, z3.ArithRef)
            rich.append(
                {
                    "apex_index": i,
                    "apex": APICES[i],
                    "class": cls,
                    "support": [x for x in POINTS if self._bool(model, support[x])],
                    "radius": self._value(model, radius),
                }
            )

        packets = []
        for packet in self.packets:
            b1 = packet["B1"]
            b2 = packet["B2"]
            assert isinstance(b1, list) and isinstance(b2, list)
            packets.append(
                {
                    "name": packet["name"],
                    "deleted": packet["deleted"],
                    "retained_source": packet["retained_source"],
                    "B1": [x for x in POINTS if self._bool(model, b1[x])],
                    "B2": [x for x in POINTS if self._bool(model, b2[x])],
                    "radius1": self._value(model, packet["radius1"]),
                    "radius2": self._value(model, packet["radius2"]),
                }
            )

        distances = {
            f"{i}-{j}": self._value(model, var)
            for (i, j), var in sorted(self.distance.items())
        }
        return {
            "blockers": blockers,
            "critical_rows": critical_rows,
            "global_k4": global_k4,
            "rich_classes": rich,
            "packets": packets,
            "distances": distances,
        }


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    """Live-source map for the normalized finite relaxation.

    This records the mathematical sources of the encoded roles.  It does not
    claim that the exact-cardinality normalization is a consumer of the
    universal target: that remains an explicit finite n=15 slice.
    """
    return {
        "scope": "normalized exact-n15 (6,6,6) cap-profile slice only",
        "files": {
            name: {
                "path": str(path.relative_to(PROJECT_ROOT)),
                "sha256": file_sha256(path),
            }
            for name, path in SOURCE_FILES.items()
        },
        "role_map": {
            "target": "false_of_retainedOmission_triApexAllLarge_core",
            "critical_shell": "CriticalShellSystem.centerAt; blocker center is a carrier point distinct from its source",
            "critical_row": "CriticalSelectedFourClass and deletion no-qfree witness",
            "rich_apex_exclusion": (
                "fullyDeletionRobustAt_of_apexRichClassStructure followed by "
                "FullyDeletionRobustAt.centerAt_ne; schema v7 keeps apices in "
                "the syntactic blocker domain but explicitly forbids their use"
            ),
            "critical_center_cap_partition": (
                "exists_criticalShell_center_mem_capInteriorByIndex_of_"
                "triApexAllLarge"
            ),
            "critical_row_cross_cap_rich_slice_one_hit": (
                "criticalShell_inter_otherRichCapSlice_card_le_one"
            ),
            "second_packet": "secondRow_support_eq_criticalShell_of_center_eq",
            "normalization": "cap-sum plus all-large bounds, with cyclic relabelling external to the universal target",
        },
    }


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": SCRIPT_SHA256,
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def timestamp_slug() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def solve_case(
    case: Case,
    timeout_ms: int,
    out_dir: Path,
    seed: int = 97,
    expected_script_sha256: str = SCRIPT_SHA256,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    started = time.monotonic()
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    launch_provenance = frozen_provenance if frozen_provenance is not None else provenance()
    base_result: dict[str, object] = {
        **launch_provenance,
        "case": asdict(case),
        "case_id": case.case_id,
        "solver": {"name": "z3", "version": z3.get_version_string(), "seed": seed},
    }
    try:
        if launch_provenance.get("schema_version") != SCHEMA_VERSION:
            raise RuntimeError(
                "frozen schema version differs from worker schema: "
                f"{launch_provenance.get('schema_version')} != {SCHEMA_VERSION}"
            )
        if launch_provenance.get("script_sha256") != expected_script_sha256:
            raise RuntimeError(
                "frozen script hash differs from the parent expectation: "
                f"{launch_provenance.get('script_sha256')} != "
                f"{expected_script_sha256}"
            )
        if SCRIPT_SHA256 != expected_script_sha256:
            raise RuntimeError(
                "worker source hash differs from the parent invocation: "
                f"{SCRIPT_SHA256} != {expected_script_sha256}"
            )
        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        solver, smt2 = encoding.make_solver()
        encoding_hash = hashlib.sha256(smt2.encode()).hexdigest()
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(smt2)
        check_started = time.monotonic()
        outcome = solver.check()
        check_elapsed = time.monotonic() - check_started
        if outcome == z3.sat:
            status = "sat"
        elif outcome == z3.unsat:
            status = "unsat"
        else:
            status = "unknown"
        result = {
            **base_result,
            "status": status,
            "elapsed_seconds": time.monotonic() - started,
            "solver_check_seconds": check_elapsed,
            "timeout_ms": timeout_ms,
            "constraint_counts": encoding.constraint_counts(),
            "constraint_total": sum(encoding.constraint_counts().values()),
            "encoding_sha256": encoding_hash,
        }
        if status == "sat":
            model = solver.model()
            validation = encoding.validate_model(model)
            result["model_validation"] = validation
            witness = encoding.serialize_model(model)
            write_json(case_dir / "witness.json", witness)
            result["witness_file"] = "witness.json"
            if validation["failures"]:
                result["status"] = "error"
                result["error"] = "solver model failed independent assertion replay"
        elif status == "unsat":
            result["unsat_core_families"] = sorted(
                str(item).removeprefix("track_") for item in solver.unsat_core()
            )
        else:
            result["reason_unknown"] = solver.reason_unknown()
    except Exception as exc:  # fail closed and preserve the exact failure
        result = {
            **base_result,
            "status": "error",
            "elapsed_seconds": time.monotonic() - started,
            "timeout_ms": timeout_ms,
            "constraint_counts": {},
            "encoding_sha256": None,
            "error": f"{type(exc).__name__}: {exc}",
        }
    write_json(case_dir / "result.json", result)
    return result


def all_cases() -> list[Case]:
    cases = []
    for profile_bits in itertools.product("SD", repeat=3):
        profiles = "".join(profile_bits)
        for kept, deleted in itertools.permutations(INTERIORS[0], 2):
            cases.append(Case("paired", profiles, kept, deleted))
            for fresh in INTERIORS[0]:
                if fresh not in {kept, deleted}:
                    cases.append(Case("fresh", profiles, kept, deleted, fresh))
    return cases


def all_secondcap_endpoint_cases() -> list[Case]:
    """The Lean-mandated fresh-I2 continuation, split by its endpoint tag."""
    cases = []
    for profile_bits in itertools.product("SD", repeat=3):
        profiles = "".join(profile_bits)
        for kept, deleted in itertools.permutations(INTERIORS[0], 2):
            for fresh in INTERIORS[1]:
                cases.append(
                    Case("secondcap_collision", profiles, kept, deleted, fresh)
                )
                cases.append(
                    Case("secondcap_distinct", profiles, kept, deleted, fresh)
                )
    return cases


def _worker(
    payload: tuple[dict[str, object], int, str, int, str, dict[str, object]]
) -> dict[str, object]:
    (
        case_data,
        timeout_ms,
        out_dir,
        seed,
        expected_script_sha256,
        frozen_provenance,
    ) = payload
    return solve_case(
        Case(**case_data),
        timeout_ms,
        Path(out_dir),
        seed,
        expected_script_sha256,
        frozen_provenance,
    )


def make_run_dir(base: Path, command: str) -> Path:
    run_dir = base / f"{timestamp_slug()}-{command}-pid{os.getpid()}"
    run_dir.mkdir(parents=True, exist_ok=False)
    return run_dir


def command_case(args: argparse.Namespace) -> int:
    case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
    case.validate()
    run_dir = make_run_dir(args.artifacts, "case")
    frozen_provenance = provenance()
    write_json(
        run_dir / "invocation.json",
        {**frozen_provenance, "argv": sys.argv, "case_count": 1},
    )
    result = solve_case(
        case,
        args.timeout_ms,
        run_dir,
        args.seed,
        frozen_provenance=frozen_provenance,
    )
    print(
        json.dumps(
            {
                "case_id": result["case_id"],
                "status": result["status"],
                "elapsed_seconds": result["elapsed_seconds"],
                "run_dir": str(run_dir),
            },
            sort_keys=True,
        )
    )
    return 0 if result["status"] in {"sat", "unsat"} else 2


def command_smoke(args: argparse.Namespace) -> int:
    run_dir = make_run_dir(args.artifacts, "smoke")
    case = Case("paired", "SSS", 0, 1)
    frozen_provenance = provenance()
    write_json(
        run_dir / "invocation.json",
        {**frozen_provenance, "argv": sys.argv, "case_count": 1},
    )
    result = solve_case(
        case,
        args.timeout_ms,
        run_dir,
        args.seed,
        frozen_provenance=frozen_provenance,
    )
    print(
        json.dumps(
            {
                "case_id": result["case_id"],
                "status": result["status"],
                "constraint_total": result.get("constraint_total"),
                "elapsed_seconds": result["elapsed_seconds"],
                "run_dir": str(run_dir),
            },
            sort_keys=True,
        )
    )
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 2


def run_case_matrix(
    args: argparse.Namespace,
    cases: list[Case],
    command_name: str,
    source_summary: Path | None = None,
) -> int:
    if not 1 <= args.workers <= 24:
        raise SystemExit("--workers must be between 1 and 24")
    run_dir = make_run_dir(args.artifacts, command_name)
    frozen_provenance = provenance()
    write_json(
        run_dir / "invocation.json",
        {
            **frozen_provenance,
            "argv": sys.argv,
            "case_count": len(cases),
            "workers": args.workers,
            "timeout_ms": args.timeout_ms,
            "source_summary": str(source_summary) if source_summary else None,
            "source_summary_sha256": (
                file_sha256(source_summary) if source_summary else None
            ),
        },
    )
    payloads = [
        (
            asdict(case),
            args.timeout_ms,
            str(run_dir),
            args.seed + index,
            str(frozen_provenance["script_sha256"]),
            frozen_provenance,
        )
        for index, case in enumerate(cases)
    ]
    statuses: Counter[str] = Counter()
    compact_results = []
    started = time.monotonic()
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(_worker, payload) for payload in payloads]
        for completed, future in enumerate(concurrent.futures.as_completed(futures), 1):
            result = future.result()
            status = str(result["status"])
            statuses[status] += 1
            compact_results.append(
                {
                    "case_id": result["case_id"],
                    "status": status,
                    "elapsed_seconds": result["elapsed_seconds"],
                    "unsat_core_families": result.get("unsat_core_families"),
                    "reason_unknown": result.get("reason_unknown"),
                    "schema_version": result["schema_version"],
                    "script_sha256": result["script_sha256"],
                    "encoding_sha256": result.get("encoding_sha256"),
                }
            )
            if completed == 1 or completed % 10 == 0 or status in {"sat", "error"}:
                print(
                    json.dumps(
                        {
                            "completed": completed,
                            "total": len(cases),
                            "statuses": dict(statuses),
                        },
                        sort_keys=True,
                    ),
                    flush=True,
                )
    summary = {
        **frozen_provenance,
        "case_count": len(cases),
        "elapsed_seconds": time.monotonic() - started,
        "statuses": dict(statuses),
        "complete": statuses["unknown"] == 0 and statuses["error"] == 0,
        "results": sorted(compact_results, key=lambda item: item["case_id"]),
    }
    write_json(run_dir / "matrix_summary.json", summary)
    print(json.dumps({**summary, "results": "matrix_summary.json", "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if summary["complete"] else 2


def command_matrix(args: argparse.Namespace) -> int:
    return run_case_matrix(args, all_cases(), "matrix")


def command_secondcap_matrix(args: argparse.Namespace) -> int:
    return run_case_matrix(
        args,
        all_secondcap_endpoint_cases(),
        "secondcap-endpoints",
    )


def command_retry(args: argparse.Namespace) -> int:
    prior = json.loads(args.summary.read_text())
    if prior.get("target") != TARGET:
        raise SystemExit(
            "cannot select retry cases from a different target: "
            f"{prior.get('target')!r} != {TARGET!r}"
        )
    prior_schema = prior.get("schema_version")
    if not isinstance(prior_schema, int) or prior_schema > SCHEMA_VERSION:
        raise SystemExit(
            "cannot select retry cases from an invalid or newer schema: "
            f"{prior_schema!r}"
        )
    retry_statuses = {"unknown"}
    if args.include_error:
        retry_statuses.add("error")
    requested_ids = {
        str(result["case_id"])
        for result in prior.get("results", [])
        if result.get("status") in retry_statuses
    }
    cases_by_id = {case.case_id: case for case in all_cases()}
    missing = sorted(requested_ids - cases_by_id.keys())
    if missing:
        raise SystemExit(f"summary contains unknown case ids: {missing}")
    cases = [cases_by_id[case_id] for case_id in sorted(requested_ids)]
    if not cases:
        raise SystemExit(f"no cases with statuses {sorted(retry_statuses)} in {args.summary}")
    return run_case_matrix(args, cases, "retry", args.summary)


def parser() -> argparse.ArgumentParser:
    common = argparse.ArgumentParser(add_help=False)
    common.add_argument("--timeout-ms", type=int, default=300_000)
    common.add_argument("--seed", type=int, default=97)
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts")

    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)

    smoke = sub.add_parser("smoke", parents=[common])
    smoke.set_defaults(func=command_smoke)

    one = sub.add_parser("case", parents=[common])
    one.add_argument(
        "--arm",
        choices=(
            "paired",
            "fresh",
            "secondcap_collision",
            "secondcap_distinct",
        ),
        required=True,
    )
    one.add_argument("--profiles", required=True)
    one.add_argument("--kept", type=int, required=True)
    one.add_argument("--deleted", type=int, required=True)
    one.add_argument("--fresh", type=int)
    one.set_defaults(func=command_case)

    matrix = sub.add_parser("matrix", parents=[common])
    matrix.add_argument("--workers", type=int, default=12)
    matrix.set_defaults(func=command_matrix)

    secondcap = sub.add_parser("secondcap-matrix", parents=[common])
    secondcap.add_argument("--workers", type=int, default=12)
    secondcap.set_defaults(func=command_secondcap_matrix)

    retry = sub.add_parser("retry", parents=[common])
    retry.add_argument("--summary", type=Path, required=True)
    retry.add_argument("--workers", type=int, default=12)
    retry.add_argument("--include-error", action="store_true")
    retry.set_defaults(func=command_retry)
    return top


def main() -> int:
    args = parser().parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
