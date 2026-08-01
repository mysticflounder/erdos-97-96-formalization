#!/usr/bin/env python3
"""Named-quotient frontend for the fresh-third/no-alignment leaf.

This is a necessary-condition projection, not a finite model of ``D.A`` and
not a proof search.  It retains only named carrier occurrences.  Point aliases
are represented by quotient identifiers; ``blocker_of`` is a function on that
quotient, so aliasing source occurrences also aliases their blockers.

Distances are uninterpreted distance classes with a distinguished zero.  Only symmetry,
zero/separation, the Moser-triangle equalities, equal-radius row incidence, and
specified theorem-backed named consequences are retained.  No order, triangle
inequality, arc geometry, or Euclidean realizability is asserted.
"""

from __future__ import annotations

import argparse
import json
import time
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

import z3


SCHEMA_VERSION = "p97-fresh-third-no-alignment-generic-v4"
TARGET = (
    "Problem97.ATailFrontierLiveClosure."
    "TwoSourceExactCollisionRowsTerminal."
    "false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow"
)

CARRIER_POINT = z3.DeclareSort("CarrierPoint")
DISTANCE_CLASS = z3.DeclareSort("DistanceClass")
ZERO_DISTANCE = z3.Const("zero_distance", DISTANCE_CLASS)

APICES = ("v1", "v2", "v3")
RICH_FIELD_KEYS = ("oppApex1", "oppApex2", "surplusApex")
RICH_PATTERNS = (
    "free",
    "SSS",
    "SSK",
    "SKS",
    "SKK",
    "KSS",
    "KSK",
    "KKS",
    "KKK",
)
KNOWN_SOURCES = ("p1", "p2", "r1", "r2")
P_FRONTIER_SUPPORT = ("p1", "p2", "pf3", "pf4")
R_FRONTIER_SUPPORT = ("r1", "r2", "rf3", "rf4")
P_CRITICAL_SUPPORT = ("p1", "p2", "pc3", "pc4")
R_CRITICAL_SUPPORT = ("r1", "r2", "rc3", "rc4")
SOURCE_SUPPORT = ("source", "s2", "s3", "s4")
Q1_SUPPORT = ("q1", "q2", "q1e3", "q1e4")
Q2_SUPPORT = ("q2", "q1", "q2e3", "q2e4")

PACKET_ROW_SUPPORTS: dict[
    str, tuple[tuple[str, ...], tuple[str, ...]]
] = {
    packet: (
        tuple(f"{packet}_apex_{i}" for i in range(1, 5)),
        tuple(f"{packet}_blocker_{i}" for i in range(1, 5)),
    )
    for packet in (
        "mpr_fresh",
        "mpr_collision",
        "mp_fresh",
        "mp_collision",
    )
}
PACKET_SUPPORT_ROLES = tuple(
    role
    for supports in PACKET_ROW_SUPPORTS.values()
    for support in supports
    for role in support
)

CORE_ROLES = (
    *APICES,
    *KNOWN_SOURCES,
    "pf3",
    "pf4",
    "rf3",
    "rf4",
    "pc3",
    "pc4",
    "rc3",
    "rc4",
    "bp",
    "br",
    "source",
    "bs",
    "s2",
    "s3",
    "s4",
    "q1",
    "q2",
    "bq",
    "q1e3",
    "q1e4",
    "q2e3",
    "q2e4",
    "mpr_source",
    "mp_source",
    *PACKET_SUPPORT_ROLES,
)


@dataclass(frozen=True)
class AlignmentAtom:
    name: str
    formula: z3.BoolRef


class FreshThirdEncoding:
    """Quantifier-free named occurrence quotient for one surplus-cap index."""

    def __init__(
        self,
        *,
        surplus_index: int = 0,
        timeout_ms: int = 60_000,
        random_seed: int = 0,
    ) -> None:
        if surplus_index not in (0, 1, 2):
            raise ValueError("surplus_index must be 0, 1, or 2")
        self.surplus_index = surplus_index
        self.opp_index1 = (surplus_index + 1) % 3
        self.opp_index2 = (surplus_index + 2) % 3
        self.opp_apex1 = APICES[self.opp_index1]
        self.opp_apex2 = APICES[self.opp_index2]
        self.surplus_apex = APICES[self.surplus_index]
        self.rich_centers = {
            "oppApex1": self.opp_apex1,
            "oppApex2": self.opp_apex2,
            "surplusApex": self.surplus_apex,
        }
        # Eight witnesses suffice for either arm: the six-point arm uses the
        # first six, while the two-K4 arm uses two disjoint groups of four.
        self.rich_witnesses = {
            field: tuple(f"rich_{field}_w{i}" for i in range(1, 9))
            for field in RICH_FIELD_KEYS
        }

        # Every inherited all-large cap gets six explicit cardinal witnesses.
        # hsource strengthens oppIndex1 to eight.
        self.cap_witnesses: dict[int, tuple[str, ...]] = {
            cap: tuple(
                f"cap{cap}w{i}"
                for i in range(8 if cap == self.opp_index1 else 6)
            )
            for cap in range(3)
        }
        witness_roles = tuple(
            role
            for cap in range(3)
            for role in self.cap_witnesses[cap]
        )
        rich_witness_roles = tuple(
            role
            for field in RICH_FIELD_KEYS
            for role in self.rich_witnesses[field]
        )
        self.names = tuple(
            dict.fromkeys(
                (*CORE_ROLES, *witness_roles, *rich_witness_roles)
            )
        )
        self.index = {name: i for i, name in enumerate(self.names)}
        self.n = len(self.names)

        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.counts: Counter[str] = Counter()

        self.point_id = {
            name: z3.Const(f"point_{name}", CARRIER_POINT)
            for name in self.names
        }
        self.distance_class = z3.Function(
            "distance_class",
            CARRIER_POINT,
            CARRIER_POINT,
            DISTANCE_CLASS,
        )
        self.blocker_of = z3.Function(
            "blocker_of", CARRIER_POINT, CARRIER_POINT
        )
        self.cap_mem = z3.Function(
            "cap_mem", CARRIER_POINT, z3.IntSort(), z3.BoolSort()
        )
        self.named_survivor_slots = tuple(
            z3.Function(
                f"named_survivor_slot_{slot}",
                CARRIER_POINT,
                DISTANCE_CLASS,
                CARRIER_POINT,
            )
            for slot in range(3)
        )
        self.rich_six_radius = {
            field: z3.Const(
                f"rich_{field}_six_radius", DISTANCE_CLASS
            )
            for field in RICH_FIELD_KEYS
        }
        self.rich_k4_radii = {
            field: (
                z3.Const(f"rich_{field}_k4_radius1", DISTANCE_CLASS),
                z3.Const(f"rich_{field}_k4_radius2", DISTANCE_CLASS),
            )
            for field in RICH_FIELD_KEYS
        }
        self.rich_arm_formulas: dict[
            str, dict[str, z3.BoolRef]
        ] = {}

        self._add_named_quotient()
        self._add_cap_packet_projection()
        self._add_apex_rich_disjunctions()
        self._add_tri_apex_local_consequences()
        self._add_retained_collision_rows()
        self._add_localized_cycle_packets()
        self._add_cap_source()
        self._add_fresh_third_fiber()
        self._add_all_named_no_qfree_projection()
        self._add_literal_no_alignment()

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def pid(self, name: str) -> z3.ExprRef:
        return self.point_id[name]

    def same(self, left: str, right: str) -> z3.BoolRef:
        return self.pid(left) == self.pid(right)

    def different(self, left: str, right: str) -> z3.BoolRef:
        return self.pid(left) != self.pid(right)

    def distinct(self, names: Iterable[str]) -> z3.BoolRef:
        return z3.Distinct(*(self.pid(name) for name in names))

    def distance_terms(
        self, left: z3.ExprRef, right: z3.ExprRef
    ) -> z3.ExprRef:
        return self.distance_class(left, right)

    def distance(self, left: str, right: str) -> z3.ExprRef:
        return self.distance_terms(self.pid(left), self.pid(right))

    @staticmethod
    def positive_distance(radius: z3.ExprRef) -> z3.BoolRef:
        return radius != ZERO_DISTANCE

    def in_cap(self, point: str, cap: int) -> z3.BoolRef:
        return self.cap_mem(self.pid(point), z3.IntVal(cap))

    def in_support(
        self, point: str, support: tuple[str, ...]
    ) -> z3.BoolRef:
        return z3.Or(*(self.same(point, member) for member in support))

    @staticmethod
    def cap_endpoints(cap: int) -> tuple[str, str]:
        return {
            0: ("v2", "v3"),
            1: ("v3", "v1"),
            2: ("v1", "v2"),
        }[cap]

    def in_strict_cap_interior(
        self, point: str, cap: int
    ) -> z3.BoolRef:
        endpoint1, endpoint2 = self.cap_endpoints(cap)
        return z3.And(
            self.in_cap(point, cap),
            self.different(point, endpoint1),
            self.different(point, endpoint2),
        )

    def exact4_formula(
        self, center: str, support: tuple[str, ...]
    ) -> z3.BoolRef:
        """Exact selected row projected to the named occurrence quotient."""
        if len(support) != 4:
            raise ValueError("an exact-four support must have four roles")
        radius = self.distance(center, support[0])
        clauses: list[z3.BoolRef] = [
            self.distinct((center, *support)),
            *(self.distance(center, point) == radius for point in support[1:]),
        ]
        # W is only the named quotient.  This is not a carrier-wide universal.
        for point in self.names:
            clauses.append(
                z3.Implies(
                    self.distance(center, point) == radius,
                    self.in_support(point, support),
                )
            )
        return z3.And(*clauses)

    def q_deleted_k4_formula(
        self, q: str, center: str, support: tuple[str, ...]
    ) -> z3.BoolRef:
        """Chosen cardinality-four ``U5QDeletedK4Class`` witness.

        Unlike a selected critical row, this structure is not an exact
        distance class.  It only supplies four distinct equal-radius carrier
        points surviving deletion of ``q`` and deletion of ``center``.
        In particular, ``q`` and ``center`` themselves need not be distinct.
        """
        if len(support) != 4:
            raise ValueError("a q-deleted K4 support must have four roles")
        radius = self.distance(center, support[0])
        return z3.And(
            self.distinct(support),
            *(self.different(point, q) for point in support),
            *(self.different(point, center) for point in support),
            self.positive_distance(radius),
            *(
                self.distance(center, point) == radius
                for point in support[1:]
            ),
        )

    def selected_class_cardinality_witness_formula(
        self,
        center: str,
        support: tuple[str, ...],
        radius: z3.ExprRef,
    ) -> z3.BoolRef:
        """Chosen witnesses for a positive selected-class lower bound.

        This encodes no exhaustive-row or carrier-completeness claim.
        """
        return z3.And(
            self.positive_distance(radius),
            self.distinct((center, *support)),
            *(
                self.distance(center, point) == radius
                for point in support
            ),
        )

    def overlap_le_two_formula(
        self, left: tuple[str, ...], right: tuple[str, ...]
    ) -> z3.BoolRef:
        """Quotient-cardinality projection of ``|(left ∩ right)| ≤ 2``."""
        if len(left) != 4 or len(right) != 4:
            raise ValueError("packet overlap supports must each have size four")
        return z3.AtMost(
            *(self.in_support(point, right) for point in left),
            2,
        )

    def support_set_equal_formula(
        self, left: tuple[str, ...], right: tuple[str, ...]
    ) -> z3.BoolRef:
        return z3.And(
            *(
                self.in_support(point, right)
                for point in left
            ),
            *(
                self.in_support(point, left)
                for point in right
            ),
        )

    def _add_named_quotient(self) -> None:
        for point in self.names:
            self.add(
                "distance_diagonal",
                self.distance(point, point) == ZERO_DISTANCE,
            )
        for i, left in enumerate(self.names):
            for right in self.names[i + 1 :]:
                self.add(
                    "distance_class_projection",
                    self.distance(left, right) == self.distance(right, left),
                    (self.distance(left, right) == ZERO_DISTANCE)
                    == self.same(left, right),
                )

        self.add("moser_apices_distinct", self.distinct(APICES))
        self.add(
            "moser_triangle_unit_distance_class",
            self.distance("v1", "v2") == self.distance("v2", "v3"),
            self.distance("v1", "v2") == self.distance("v3", "v1"),
        )

    def _add_cap_packet_projection(self) -> None:
        # Closed-cap endpoint pattern: C1 is opposite v1, and cyclically.
        apex_pattern = {
            "v1": (False, True, True),
            "v2": (True, False, True),
            "v3": (True, True, False),
        }
        for apex, pattern in apex_pattern.items():
            for cap, truth in enumerate(pattern):
                self.add(
                    "closed_cap_apex_pattern",
                    self.in_cap(apex, cap)
                    if truth
                    else z3.Not(self.in_cap(apex, cap)),
                )

        # Every named non-Moser carrier occurrence lies in exactly one cap.
        for point in self.names:
            is_apex = z3.Or(*(self.same(point, apex) for apex in APICES))
            self.add(
                "named_nonmoser_exactly_one_cap",
                z3.Implies(
                    z3.Not(is_apex),
                    z3.PbEq(
                        [
                            (self.in_cap(point, cap), 1)
                            for cap in range(3)
                        ],
                        1,
                    ),
                ),
            )

        for cap, witnesses in self.cap_witnesses.items():
            self.add(
                f"cap_{cap}_cardinality_witnesses",
                self.distinct(witnesses),
                *(self.in_cap(point, cap) for point in witnesses),
            )

    def _add_apex_rich_disjunctions(self) -> None:
        """Materialize all three ``ApexRichClassStructure`` disjunctions."""
        for field in RICH_FIELD_KEYS:
            center = self.rich_centers[field]
            witnesses = self.rich_witnesses[field]
            six_arm = self.selected_class_cardinality_witness_formula(
                center,
                witnesses[:6],
                self.rich_six_radius[field],
            )
            k4_radius1, k4_radius2 = self.rich_k4_radii[field]
            two_k4_arm = z3.And(
                self.selected_class_cardinality_witness_formula(
                    center,
                    witnesses[:4],
                    k4_radius1,
                ),
                self.selected_class_cardinality_witness_formula(
                    center,
                    witnesses[4:],
                    k4_radius2,
                ),
                k4_radius1 != k4_radius2,
            )
            self.rich_arm_formulas[field] = {
                "six": six_arm,
                "two_k4": two_k4_arm,
            }
            self.add(
                "apex_rich_class_structure_disjunctions",
                z3.Or(six_arm, two_k4_arm),
            )

    def _add_tri_apex_local_consequences(self) -> None:
        # Each rich apex also yields FullyDeletionRobustAt there.  Its
        # blockerVertex_ne theorem excludes that apex from the blocker image
        # of every carrier source, hence of every represented occurrence.
        for source in self.names:
            self.add(
                "tri_apex_blocker_vertex_exclusions",
                *(
                    self.blocker_of(self.pid(source)) != self.pid(apex)
                    for apex in APICES
                ),
            )

        # Project T.no_center_covers_all_apices onto every represented center.
        # SelectedClass membership is exactly positive equal distance here
        # because all three apices and every named center are carrier points.
        for center in self.names:
            radius = self.distance(center, "v1")
            self.add(
                "represented_center_not_all_three_apices",
                z3.Not(
                    z3.And(
                        self.positive_distance(radius),
                        self.distance(center, "v2") == radius,
                        self.distance(center, "v3") == radius,
                    )
                ),
            )

    def _add_source_blocker(
        self, source: str, blocker: str, block: str
    ) -> None:
        self.add(
            block,
            self.blocker_of(self.pid(source)) == self.pid(blocker),
            self.different(source, blocker),
        )

    def _add_retained_collision_rows(self) -> None:
        self.add(
            "retained_pair_distinct_and_disjoint",
            self.distinct(KNOWN_SOURCES),
        )
        for point in KNOWN_SOURCES:
            self.add(
                "retained_sources_first_opposite_interior",
                self.in_strict_cap_interior(point, self.opp_index1),
            )

        self._add_source_blocker("p1", "bp", "p_common_blocker")
        self._add_source_blocker("p2", "bp", "p_common_blocker")
        self._add_source_blocker("r1", "br", "rho_common_blocker")
        self._add_source_blocker("r2", "br", "rho_common_blocker")
        self.add("known_blockers_distinct", self.different("bp", "br"))

        self.add(
            "frontier_exact_four_row",
            self.exact4_formula(self.opp_apex1, P_FRONTIER_SUPPORT),
        )
        self.add(
            "rho_exact_four_row",
            self.exact4_formula(self.opp_apex1, R_FRONTIER_SUPPORT),
        )
        self.add(
            "frontier_radii_distinct",
            self.distance(self.opp_apex1, "p1")
            != self.distance(self.opp_apex1, "r1"),
        )
        for point in ("pf3", "pf4"):
            self.add(
                "frontier_interior_intersection_exact",
                z3.Not(
                    self.in_strict_cap_interior(point, self.opp_index1)
                ),
            )
        for point in ("rf3", "rf4"):
            self.add(
                "rho_interior_intersection_exact",
                z3.Not(
                    self.in_strict_cap_interior(point, self.opp_index1)
                ),
            )

        # Derived selected-shell rows for the two equal-blocker pairs.
        self.add(
            "p_critical_exact_four_row",
            self.exact4_formula("bp", P_CRITICAL_SUPPORT),
        )
        self.add(
            "rho_critical_exact_four_row",
            self.exact4_formula("br", R_CRITICAL_SUPPORT),
        )

    def _add_common_deletion_packet(
        self,
        packet: str,
        *,
        q: str,
        center1: str,
        center2: str,
    ) -> None:
        """Materialize one nested CommonDeletionTwoCenterPacket."""
        apex_support, blocker_support = PACKET_ROW_SUPPORTS[packet]
        apex_row = self.q_deleted_k4_formula(q, center1, apex_support)
        blocker_row = self.q_deleted_k4_formula(
            q, center2, blocker_support
        )

        self.add(f"{packet}_centers_ne", self.different(center1, center2))
        self.add(
            f"{packet}_actual_blocker_exclusions",
            self.blocker_of(self.pid(q)) != self.pid(center1),
            self.blocker_of(self.pid(q)) != self.pid(center2),
        )
        self.add(f"{packet}_apex_q_deleted_exact_four", apex_row)
        self.add(f"{packet}_blocker_q_deleted_exact_four", blocker_row)
        # The exact same four named points witness the two HasN survival
        # fields.  These duplicate formulas make the field map explicit
        # without strengthening either existential statement.
        self.add(f"{packet}_deletion_survival", apex_row, blocker_row)
        self.add(
            f"{packet}_support_overlap_le_two",
            self.overlap_le_two_formula(apex_support, blocker_support),
        )

    def _add_localized_cycle_packets(self) -> None:
        # LPρ has fresh = r1; LP has fresh = p1.
        self.add(
            "lprho_fresh_fields",
            self.in_strict_cap_interior("r1", self.opp_index1),
            self.different("r1", "p1"),
            self.different("r1", "p2"),
            z3.Not(self.in_support("r1", P_CRITICAL_SUPPORT)),
        )
        self.add(
            "lp_fresh_fields",
            self.in_strict_cap_interior("p1", self.opp_index1),
            self.different("p1", "r1"),
            self.different("p1", "r2"),
            z3.Not(self.in_support("p1", R_CRITICAL_SUPPORT)),
        )

        # MPρ chooses a source from P, and MP chooses one from Pρ.
        self.add(
            "mprho_collision_source_choice_and_freshness",
            z3.Or(
                self.same("mpr_source", "p1"),
                self.same("mpr_source", "p2"),
            ),
            self.in_strict_cap_interior(
                "mpr_source", self.opp_index1
            ),
            self.different("mpr_source", "r1"),
        )
        self._add_source_blocker(
            "mpr_source", "bp", "mprho_collision_source_blocker"
        )
        self.add(
            "mprho_directed_omissions",
            z3.Not(self.in_support("r1", P_CRITICAL_SUPPORT)),
            z3.Not(
                self.in_support("mpr_source", R_CRITICAL_SUPPORT)
            ),
        )
        self.add(
            "mprho_blockers_ne",
            self.different("bp", "br"),
        )

        self.add(
            "mp_collision_source_choice_and_freshness",
            z3.Or(
                self.same("mp_source", "r1"),
                self.same("mp_source", "r2"),
            ),
            self.in_strict_cap_interior("mp_source", self.opp_index1),
            self.different("mp_source", "p1"),
        )
        self._add_source_blocker(
            "mp_source", "br", "mp_collision_source_blocker"
        )
        self.add(
            "mp_directed_omissions",
            z3.Not(self.in_support("p1", R_CRITICAL_SUPPORT)),
            z3.Not(self.in_support("mp_source", P_CRITICAL_SUPPORT)),
        )
        self.add("mp_blockers_ne", self.different("br", "bp"))

        # The two MP freshPacket values also witness the proposition-level
        # existence of the identically typed LP packet fields after the
        # collision-source blocker equalities above.  The two collisionSource
        # packets are the other two nested packet shapes.
        self._add_common_deletion_packet(
            "mpr_fresh",
            q="r1",
            center1=self.opp_apex1,
            center2="bp",
        )
        self._add_common_deletion_packet(
            "mpr_collision",
            q="mpr_source",
            center1=self.opp_apex1,
            center2="br",
        )
        self._add_common_deletion_packet(
            "mp_fresh",
            q="p1",
            center1=self.opp_apex1,
            center2="br",
        )
        self._add_common_deletion_packet(
            "mp_collision",
            q="mp_source",
            center1=self.opp_apex1,
            center2="bp",
        )

    def _add_cap_source(self) -> None:
        self._add_source_blocker(
            "source", "bs", "cap_source_blocker_function"
        )
        self.add(
            "cap_source_strict_interior",
            self.in_strict_cap_interior("source", self.opp_index1),
        )
        self.add(
            "cap_source_fresh_from_named_pairs",
            *(
                self.different("source", point)
                for point in KNOWN_SOURCES
            ),
        )
        self.add(
            "cap_source_blocker_exclusions",
            self.different("bs", "bp"),
            self.different("bs", "br"),
            self.different("bs", self.opp_apex1),
            self.different("bs", self.opp_apex2),
        )
        self.add(
            "cap_source_exact_four_row",
            self.exact4_formula("bs", SOURCE_SUPPORT),
        )
        self.add(
            "cross_pair_deletion_view_p",
            z3.Or(
                z3.Not(self.in_support("p1", SOURCE_SUPPORT)),
                z3.Not(self.in_support("p2", SOURCE_SUPPORT)),
            ),
        )
        self.add(
            "cross_pair_deletion_view_rho",
            z3.Or(
                z3.Not(self.in_support("r1", SOURCE_SUPPORT)),
                z3.Not(self.in_support("r2", SOURCE_SUPPORT)),
            ),
        )

    def _add_fresh_third_fiber(self) -> None:
        self._add_source_blocker("q1", "bq", "q_common_blocker")
        self._add_source_blocker("q2", "bq", "q_common_blocker")
        self.add("q_sources_distinct", self.different("q1", "q2"))
        self.add(
            "q_blocker_fresh_from_known_blockers",
            self.different("bq", "bp"),
            self.different("bq", "br"),
        )
        for source in ("q1", "q2"):
            self.add(
                "q_sources_fresh_from_named_pairs",
                *(self.different(source, point) for point in KNOWN_SOURCES),
            )

        self.add(
            "q1_critical_exact_four_row",
            self.exact4_formula("bq", Q1_SUPPORT),
        )
        self.add(
            "q2_critical_exact_four_row",
            self.exact4_formula("bq", Q2_SUPPORT),
        )
        self.add(
            "equal_blocker_support_coherence",
            self.support_set_equal_formula(Q1_SUPPORT, Q2_SUPPORT),
        )
        self.add(
            "q_mutual_shell_incidence",
            self.in_support("q1", Q2_SUPPORT),
            self.in_support("q2", Q1_SUPPORT),
        )

        # Intentionally absent:
        #   different("bq", "bs")
        #   different("source", "q1/q2")
        # Neither inequality exists in the Lean hypotheses.

    def _add_all_named_no_qfree_projection(self) -> None:
        """Project ``no_qfree_at`` at every represented deletion source.

        The center is the alias-aware term ``blocker_of(source)``; it need not
        itself have a named occurrence.  For each source and represented
        positive radius, every quotient point surviving deletion of the source
        alias class must equal one of three existential point-valued slots.
        This is an exact quantifier-free encoding of the at-most-three bound.
        """
        for source in self.names:
            source_term = self.pid(source)
            center = self.blocker_of(source_term)
            metric_constraints: list[z3.BoolRef] = [
                center != source_term,
                self.distance_terms(center, center) == ZERO_DISTANCE,
            ]
            for point in self.names:
                point_term = self.pid(point)
                radius = self.distance_terms(center, point_term)
                metric_constraints.append(
                    z3.Implies(
                        center != point_term,
                        radius != ZERO_DISTANCE,
                    )
                )
            self.add(
                "all_named_actual_blocker_metric_projection",
                *metric_constraints,
            )

            slot_constraints: list[z3.BoolRef] = []
            for point in self.names:
                point_term = self.pid(point)
                radius = self.distance_terms(center, point_term)
                survives_at_positive_radius = z3.And(
                    point_term != source_term,
                    self.positive_distance(radius),
                )
                slot_constraints.append(
                    z3.Implies(
                        survives_at_positive_radius,
                        z3.Or(
                            *(
                                point_term == slot(source_term, radius)
                                for slot in self.named_survivor_slots
                            )
                        ),
                    )
                )
            self.add(
                "all_named_no_qfree_three_slots",
                *slot_constraints,
            )

    def alignment_atoms(self, cap: int) -> tuple[AlignmentAtom, ...]:
        if cap not in (0, 1, 2):
            raise ValueError("cap must be 0, 1, or 2")
        return (
            AlignmentAtom("q_blocker_in_cap", self.in_cap("bq", cap)),
            AlignmentAtom("source_blocker_in_cap", self.in_cap("bs", cap)),
            AlignmentAtom(
                "blockers_distinct", self.different("bs", "bq")
            ),
            AlignmentAtom("q1_off_cap", z3.Not(self.in_cap("q1", cap))),
            AlignmentAtom("q2_off_cap", z3.Not(self.in_cap("q2", cap))),
            AlignmentAtom(
                "q1_in_source_row",
                self.in_support("q1", SOURCE_SUPPORT),
            ),
            AlignmentAtom(
                "q2_in_source_row",
                self.in_support("q2", SOURCE_SUPPORT),
            ),
        )

    def alignment_arm(self, cap: int) -> z3.BoolRef:
        return z3.And(*(atom.formula for atom in self.alignment_atoms(cap)))

    def no_alignment_formula(self) -> z3.BoolRef:
        return z3.And(
            *(z3.Not(self.alignment_arm(cap)) for cap in range(3))
        )

    def _add_literal_no_alignment(self) -> None:
        # Keep each Fin 3 case literally visible.  Do not distribute, simplify,
        # or replace it by any guessed individual failure atom.
        for cap in range(3):
            self.add(
                f"hno_alignment_cap_{cap}",
                z3.Not(self.alignment_arm(cap)),
            )

    def force_blocker_relation(self, relation: str) -> None:
        if relation == "free":
            return
        if relation == "equal":
            self.add("requested_blocker_relation", self.same("bq", "bs"))
            return
        if relation == "distinct":
            self.add(
                "requested_blocker_relation", self.different("bq", "bs")
            )
            return
        raise ValueError(f"unknown blocker relation: {relation}")

    def force_rich_pattern(self, pattern: str) -> None:
        """Choose one Lean disjunct at each rich apex for a branch probe.

        ``S`` selects the six-point arm and ``K`` the two-K4 arm, in
        ``oppApex1, oppApex2, surplusApex`` order.  The unchosen arm is not
        negated: Lean case analysis supplies the chosen arm, not its exclusivity.
        """
        if pattern == "free":
            return
        if pattern not in RICH_PATTERNS:
            raise ValueError(f"unknown rich pattern: {pattern}")
        for field, arm in zip(RICH_FIELD_KEYS, pattern, strict=True):
            key = "six" if arm == "S" else "two_k4"
            self.add(
                "requested_rich_pattern",
                self.rich_arm_formulas[field][key],
            )

    def _bool_value(self, model: z3.ModelRef, formula: z3.BoolRef) -> bool:
        return z3.is_true(model.eval(formula, model_completion=True))

    def payload(
        self,
        status: z3.CheckSatResult,
        elapsed_seconds: float,
        blocker_relation: str,
        rich_pattern: str,
    ) -> dict[str, object]:
        result: dict[str, object] = {
            "schema": SCHEMA_VERSION,
            "target": TARGET,
            "epistemic_status": "NAMED_NECESSARY_CONDITION_PROJECTION_ONLY",
            "solver_status": str(status).upper(),
            "theorem_closure_claim": False,
            "surplus_index": self.surplus_index,
            "opp_index1": self.opp_index1,
            "opp_index2": self.opp_index2,
            "opp_apex1": self.opp_apex1,
            "opp_apex2": self.opp_apex2,
            "requested_blocker_relation": blocker_relation,
            "requested_rich_pattern": rich_pattern,
            "named_occurrences": self.n,
            "constraint_counts": dict(sorted(self.counts.items())),
            "elapsed_seconds": round(elapsed_seconds, 6),
            "trust_boundary": [
                "Z3 checks only this quantifier-free named quotient.",
                "SAT is a surviving relaxation, not a Euclidean realization.",
                "UNSAT would refute only this encoding after an independent "
                "source-fidelity audit; it would not by itself close Lean.",
            ],
        }
        if status != z3.sat:
            return result

        model = self.solver.model()
        groups: dict[str, list[str]] = defaultdict(list)
        for name in self.names:
            value = str(model.eval(self.pid(name), model_completion=True))
            groups[value].append(name)
        result["nontrivial_alias_classes"] = [
            members for members in groups.values() if len(members) > 1
        ]
        result["q_blocker_equals_cap_source_blocker"] = self._bool_value(
            model, self.same("bq", "bs")
        )
        result["rich_apex_arms"] = {
            field: {
                "center": self.rich_centers[field],
                "six_point": self._bool_value(
                    model, self.rich_arm_formulas[field]["six"]
                ),
                "two_k4": self._bool_value(
                    model, self.rich_arm_formulas[field]["two_k4"]
                ),
            }
            for field in RICH_FIELD_KEYS
        }
        result["alignment_cap_cases"] = [
            {
                "cap": cap,
                "arm": self._bool_value(model, self.alignment_arm(cap)),
                "atoms": {
                    atom.name: self._bool_value(model, atom.formula)
                    for atom in self.alignment_atoms(cap)
                },
            }
            for cap in range(3)
        ]
        return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--surplus-index", type=int, choices=(0, 1, 2), default=0)
    parser.add_argument(
        "--blocker-relation",
        choices=("free", "equal", "distinct"),
        default="free",
        help="optional probe for bq versus the cap-source blocker bs",
    )
    parser.add_argument(
        "--rich-pattern",
        choices=RICH_PATTERNS,
        default="free",
        help=(
            "optional S=six-point, K=two-K4 branch probe in "
            "oppApex1/oppApex2/surplusApex order"
        ),
    )
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument(
        "--output",
        type=Path,
        help="write the concise JSON result here instead of stdout",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    encoding = FreshThirdEncoding(
        surplus_index=args.surplus_index,
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
    )
    encoding.force_blocker_relation(args.blocker_relation)
    encoding.force_rich_pattern(args.rich_pattern)
    started = time.monotonic()
    status = encoding.solver.check()
    elapsed = time.monotonic() - started
    payload = encoding.payload(
        status,
        elapsed,
        args.blocker_relation,
        args.rich_pattern,
    )
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered)
        print(args.output)
    # SAT and UNSAT are completed solver answers for the projection.  UNKNOWN
    # fails closed for scripting.
    return 0 if status in (z3.sat, z3.unsat) else 2


if __name__ == "__main__":
    raise SystemExit(main())
