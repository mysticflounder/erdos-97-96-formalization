#!/usr/bin/env python3
"""Two-level, fail-closed CEGAR for the induced ATail witness model.

The outer QF_LIA map chooses only:

* the quotient/equality relation on named role occurrences;
* a linear representative of their cyclic order; and
* equal/different incidences between distances in the explicitly used rows.

It contains no metric variables and never identifies the named witness set W
with the full carrier.  A fast exact checker freezes one outer choice, works
directly on its alias-class quotient, and lazily separates strict triangle and
Kalmanson inequalities.  A rational generic perturbation replays all frozen
disequalities before SAT.  The outer loop first cuts proved four-point
Kalmanson cancellations and proved five- and six-point Euclidean incidence
patterns, including the mirror-interleaving six-point obstruction;
a quotient UNSAT is replayed by the assumption-tracked inner QF_LRA checker
before any generalized core is negated.  SAT is a survivor of this necessary
relaxation; UNKNOWN and every budget/cap stop fail closed.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import time
from collections import Counter
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable

import z3


BASE_ROLES = (
    "a0", "a1", "a2",
    "p1", "p2", "r1", "r2",
    "q", "other", "z", "t", "source",
    "b1", "b2", "bs", "bz",
    "s2", "s3", "s4",
    "p3", "p4", "r3", "r4",
    "z2", "z3", "z4",
    "x", "y",
)
COMMON_ESCAPE_ROLES = ("be", "escape")
CRITICAL_ESCAPE_ROLES = ("e2", "e3", "e4")
ROBUST_ESCAPE_SUPPORT = ("er1", "er2", "er3", "er4")
SCHEMA = (
    "p97-aligned-singleton-induced-metric-cegar-v17-mirror-interleaving-six-point-schema"
)


@dataclass(frozen=True)
class Literal:
    """A selected outer literal, serialized into a resumable CEGAR cut."""

    kind: str
    args: tuple[Any, ...]

    def to_json(self) -> list[Any]:
        return [self.kind, *self.args]

    @staticmethod
    def from_json(value: object) -> "Literal":
        if not isinstance(value, list) or not value or not isinstance(value[0], str):
            raise ValueError(f"invalid checkpoint literal: {value!r}")
        return Literal(value[0], tuple(value[1:]))

    def validate(self, names: tuple[str, ...]) -> None:
        known = set(names)
        if self.kind == "alias":
            if (
                len(self.args) != 3
                or not isinstance(self.args[0], str)
                or not isinstance(self.args[1], str)
                or self.args[0] not in known
                or self.args[1] not in known
                or self.args[0] == self.args[1]
                or type(self.args[2]) is not bool
            ):
                raise ValueError(f"invalid alias literal: {self.to_json()!r}")
            return
        if self.kind == "order":
            if (
                len(self.args) != 2
                or not isinstance(self.args[0], str)
                or not isinstance(self.args[1], str)
                or self.args[0] not in known
                or self.args[1] not in known
                or self.args[0] == self.args[1]
            ):
                raise ValueError(f"invalid order literal: {self.to_json()!r}")
            return
        if self.kind == "row":
            if (
                len(self.args) != 4
                or not all(isinstance(arg, str) for arg in self.args[:3])
                or any(arg not in known for arg in self.args[:3])
                or len(set(self.args[:3])) != 3
                or type(self.args[3]) is not bool
            ):
                raise ValueError(f"invalid row literal: {self.to_json()!r}")
            return
        raise ValueError(f"unknown checkpoint literal kind: {self.kind!r}")


@dataclass(frozen=True)
class QuotientRelation:
    """One assumption-tracked quotient constraint and its outer justification."""

    identifier: int
    kind: str
    key: tuple[Any, ...]
    constraint: z3.BoolRef
    outer_literals: tuple[Literal, ...]


class OuterMap:
    """Finite incidence/order abstraction of the live induced prefix."""

    def __init__(
        self,
        *,
        timeout_ms: int,
        random_seed: int,
        z_branch: str,
        escape_arm: str,
        global_tier: str,
        cover_points: tuple[str, ...] | None = None,
        global_k4_centers: tuple[str, ...] | None = None,
        rich_apices: tuple[str, ...] | None = None,
        robust_deletions: tuple[str, ...] | None = None,
    ) -> None:
        self.global_tier = global_tier
        # The producer now returns a SelectedFourClass containing `escape` in
        # both continuation arms.  These are original theorem witnesses, not
        # generated deletion-survival witnesses.
        original_roles = (
            BASE_ROLES + COMMON_ESCAPE_ROLES + CRITICAL_ESCAPE_ROLES
        )
        self.original_names = tuple(dict.fromkeys(original_roles))
        original_name_set = set(self.original_names)

        def checked_original_subset(
            label: str,
            values: tuple[str, ...],
        ) -> tuple[str, ...]:
            normalized = tuple(dict.fromkeys(values))
            unknown = set(normalized) - original_name_set
            if unknown:
                raise ValueError(
                    f"{label} contains non-original roles: {sorted(unknown)}"
                )
            return normalized

        generated_roles: list[str] = []
        self.robust_survival_supports: dict[str, tuple[str, ...]] = {}
        if escape_arm == "robust":
            if robust_deletions is None:
                deleted_points = self.original_names
            else:
                deleted_points = checked_original_subset(
                    "robust_deletions", robust_deletions,
                )
            for deleted in deleted_points:
                if deleted == "escape":
                    support = ROBUST_ESCAPE_SUPPORT
                else:
                    support = tuple(
                        f"survive_{deleted}_{ordinal}" for ordinal in range(1, 5)
                    )
                self.robust_survival_supports[deleted] = support
                generated_roles.extend(support)

        if cover_points is not None:
            covered_points = checked_original_subset(
                "cover_points", cover_points,
            )
        elif global_tier == "full":
            covered_points = self.original_names
        elif global_tier == "apex-cover":
            covered_points = ("a0", "a1", "a2")
        else:
            covered_points = ()
        self.minimal_cover_witnesses: dict[
            str, tuple[str, tuple[str, ...]]
        ] = {}
        for covered in covered_points:
            center = f"cover_{covered}"
            support = (
                covered,
                f"cover_{covered}_2",
                f"cover_{covered}_3",
                f"cover_{covered}_4",
            )
            self.minimal_cover_witnesses[covered] = (center, support)
            generated_roles.extend((center, *support[1:]))

        self.rich_witnesses: dict[
            str, tuple[tuple[str, ...], tuple[str, ...], tuple[str, ...]]
        ] = {}
        if rich_apices is not None:
            selected_rich_apices = tuple(dict.fromkeys(rich_apices))
            invalid_apices = set(selected_rich_apices) - {"a1", "a2"}
            if invalid_apices:
                raise ValueError(
                    f"rich_apices contains invalid roles: {sorted(invalid_apices)}"
                )
        elif global_tier == "full":
            selected_rich_apices = ("a1", "a2")
        else:
            selected_rich_apices = ()
        for apex in selected_rich_apices:
            selected_six = tuple(
                f"rich6_{apex}_{ordinal}" for ordinal in range(1, 7)
            )
            first_four = tuple(
                f"rich4a_{apex}_{ordinal}" for ordinal in range(1, 5)
            )
            second_four = tuple(
                f"rich4b_{apex}_{ordinal}" for ordinal in range(1, 5)
            )
            self.rich_witnesses[apex] = (
                selected_six,
                first_four,
                second_four,
            )
            generated_roles.extend((*selected_six, *first_four, *second_four))

        supplied_row_centers = {
            "a0", "a1", "a2", "b1", "b2", "bs", "bz", "be",
        }
        self.global_k4_supports: dict[str, tuple[str, ...]] = {}
        if global_k4_centers is not None:
            selected_global_k4_centers = checked_original_subset(
                "global_k4_centers", global_k4_centers,
            )
        elif global_tier == "full":
            selected_global_k4_centers = self.original_names
        else:
            selected_global_k4_centers = ()
        for center in selected_global_k4_centers:
            if center in supplied_row_centers:
                continue
            support = tuple(
                f"global_k4_{center}_{ordinal}" for ordinal in range(1, 5)
            )
            self.global_k4_supports[center] = support
            generated_roles.extend(support)

        # The theorem's quantified facts are projected only over this frozen
        # original snapshot.  Generated Skolem witnesses are carrier points,
        # but do not recursively trigger more witness generation.
        self.names = tuple(dict.fromkeys((*self.original_names, *generated_roles)))
        self.index = {name: i for i, name in enumerate(self.names)}
        self.n = len(self.names)
        self.z_branch = z_branch
        self.escape_arm = escape_arm
        # Distance-class equality is a function of the unordered pair of
        # quotient ranks.  Built-in UF congruence replaces the previous
        # O(n^3) family of explicit occurrence-alias substitution clauses.
        # Both finite domains use bit-vectors, keeping the full abstraction in
        # QF_UFBV rather than mixing the UF with unbounded integer arithmetic.
        self.solver = z3.SolverFor("QF_UFBV")
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.rank_width = (self.n - 1).bit_length()
        self.distance_width = (self.n * (self.n - 1) // 2).bit_length()
        self.rank = [
            z3.BitVec(f"outer_rank_{name}", self.rank_width)
            for name in self.names
        ]
        self.distance_class = z3.Function(
            "outer_distclass",
            z3.BitVecSort(2 * self.rank_width),
            z3.BitVecSort(self.distance_width),
        )
        self.edge_class = {
            (i, j): self._rank_pair_distance_class(i, j)
            for i in range(self.n) for j in range(i + 1, self.n)
        }
        self.rows: dict[tuple[str, str, str], z3.BoolRef] = {}
        self.counts: Counter[str] = Counter()
        self._add_incidence_congruence()
        self._add_live_abstraction()
        self._add_apex_triple_exclusion()
        self.required_rows = frozenset(self.rows)

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def ix(self, name: str) -> int:
        return self.index[name]

    def same(self, left: str, right: str) -> z3.BoolRef:
        return self.rank[self.ix(left)] == self.rank[self.ix(right)]

    def before(self, left: str, right: str) -> z3.BoolRef:
        return z3.ULT(self.rank[self.ix(left)], self.rank[self.ix(right)])

    def distinct(self, names: Iterable[str]) -> z3.BoolRef:
        return z3.Distinct(*(self.rank[self.ix(name)] for name in names))

    def _rank_pair_key(self, left: int, right: int) -> z3.BitVecRef:
        left_rank, right_rank = self.rank[left], self.rank[right]
        low = z3.If(z3.ULE(left_rank, right_rank), left_rank, right_rank)
        high = z3.If(z3.ULE(left_rank, right_rank), right_rank, left_rank)
        return z3.Concat(low, high)

    def _rank_pair_distance_class(
        self,
        left: int,
        right: int,
    ) -> z3.BitVecRef:
        return self.distance_class(self._rank_pair_key(left, right))

    def dclass(self, left: int | str, right: int | str) -> z3.BitVecRef:
        i = self.ix(left) if isinstance(left, str) else left
        j = self.ix(right) if isinstance(right, str) else right
        if i == j:
            return z3.BitVecVal(0, self.distance_width)
        return self.edge_class[min(i, j), max(i, j)]

    def roweq(self, center: str, left: str, right: str) -> z3.BoolRef:
        """Abstract d(center,left) = d(center,right), with syntactic symmetry."""
        if left == right:
            return z3.BoolVal(True)
        left, right = sorted((left, right))
        key = (center, left, right)
        if key not in self.rows:
            self.rows[key] = self.dclass(center, left) == self.dclass(center, right)
        return self.rows[key]

    def _add_incidence_congruence(self) -> None:
        """Exact equality incidence of quotient distances, without magnitudes."""
        for rank in self.rank:
            self.add(
                "rank_bounds",
                z3.ULT(rank, z3.BitVecVal(self.n, self.rank_width)),
            )
            diagonal_key = z3.Concat(rank, rank)
            self.add(
                "quotient_diagonal_zero",
                self.distance_class(diagonal_key)
                == z3.BitVecVal(0, self.distance_width),
            )
        for (i, j), distance_class in self.edge_class.items():
            self.add(
                "distance_class_bounds",
                z3.ULE(
                    distance_class,
                    z3.BitVecVal(len(self.edge_class), self.distance_width),
                ),
            )
            self.add(
                "quotient_distance_incidence",
                z3.Implies(
                    self.rank[i] == self.rank[j],
                    distance_class == z3.BitVecVal(0, self.distance_width),
                ),
                z3.Implies(
                    self.rank[i] != self.rank[j],
                    z3.UGT(
                        distance_class,
                        z3.BitVecVal(0, self.distance_width),
                    ),
                ),
            )

    def exact4_formula(
        self,
        center: str,
        support: tuple[str, ...],
        *,
        universe: tuple[str, ...] | None = None,
    ) -> z3.BoolRef:
        assert len(support) == 4
        projected_universe = self.names if universe is None else universe
        clauses: list[z3.BoolRef] = [self.distinct((center, *support))]
        clauses.extend(
            self.roweq(center, point, support[0]) for point in support[1:]
        )
        for point in projected_universe:
            clauses.append(
                z3.Implies(
                    self.roweq(center, point, support[0]),
                    z3.Or(*(self.same(point, member) for member in support)),
                )
            )
        return z3.And(*clauses)

    def selected_formula(
        self, center: str, support: tuple[str, ...],
    ) -> z3.BoolRef:
        """Distinct named carrier points on one circle about `center`."""
        assert support
        return z3.And(
            self.distinct((center, *support)),
            *(self.roweq(center, point, support[0]) for point in support[1:]),
        )

    def selected4_formula(self, center: str, support: tuple[str, ...]) -> z3.BoolRef:
        assert len(support) == 4
        return self.selected_formula(center, support)

    def projected_universe(
        self, *extra: str,
    ) -> tuple[str, ...]:
        return tuple(dict.fromkeys((*self.original_names, *extra)))

    def row_at_most_three_formula(
        self,
        center: str,
        representative: str,
        universe: tuple[str, ...],
        *,
        tag: str,
        excluded: tuple[str, ...] = (),
    ) -> z3.BoolRef:
        """At most three quotient points of a named universe lie on one row."""
        cover_ranks = tuple(
            z3.BitVec(f"row_cover_{tag}_{ordinal}", self.rank_width)
            for ordinal in range(1, 4)
        )
        clauses: list[z3.BoolRef] = []
        for point in universe:
            survives = z3.And(
                *(z3.Not(self.same(point, erased)) for erased in excluded)
            )
            clauses.append(
                z3.Implies(
                    z3.And(
                        survives,
                        self.roweq(center, point, representative),
                    ),
                    z3.Or(
                        *(self.rank[self.ix(point)] == rank for rank in cover_ranks)
                    ),
                )
            )
        return z3.And(*clauses)

    def unique4_projection_formula(
        self,
        center: str,
        support: tuple[str, ...],
        *,
        universe: tuple[str, ...],
        tag: str,
        exact_universe: tuple[str, ...] | None = None,
    ) -> z3.BoolRef:
        """Project uniqueness of the center's K4 radius onto named points W."""
        clauses: list[z3.BoolRef] = [
            self.exact4_formula(
                center,
                support,
                universe=universe if exact_universe is None else exact_universe,
            )
        ]
        candidates = tuple(name for name in universe if name != center)
        for representative in candidates:
            clauses.append(
                z3.Implies(
                    z3.Not(self.roweq(center, representative, support[0])),
                    self.row_at_most_three_formula(
                        center,
                        representative,
                        candidates,
                        tag=f"{tag}_{representative}",
                    ),
                )
            )
        return z3.And(*clauses)

    def add_exact4(
        self,
        block: str,
        center: str,
        support: tuple[str, ...],
        *,
        universe: tuple[str, ...] | None = None,
    ) -> None:
        self.add(block, self.exact4_formula(center, support, universe=universe))

    def add_unique4_projection(
        self,
        block: str,
        center: str,
        support: tuple[str, ...],
        *,
        universe: tuple[str, ...],
        exact_universe: tuple[str, ...] | None = None,
    ) -> None:
        self.add(
            block,
            self.unique4_projection_formula(
                center,
                support,
                universe=universe,
                tag=f"{block}_{center}",
                exact_universe=exact_universe,
            ),
        )

    def support_set_equal_formula(
        self, left: tuple[str, ...], right: tuple[str, ...],
    ) -> z3.BoolRef:
        return z3.And(
            *(
                z3.Or(*(self.same(point, other) for other in right))
                for point in left
            ),
            *(
                z3.Or(*(self.same(point, other) for other in left))
                for point in right
            ),
        )

    def support_overlap_at_most_two_formula(
        self, left: tuple[str, ...], right: tuple[str, ...],
    ) -> z3.BoolRef:
        """No three distinct members of `left` occur in `right`."""
        return z3.And(
            *(
                z3.Not(
                    z3.And(
                        *(
                            z3.Or(*(self.same(point, other) for other in right))
                            for point in triple
                        )
                    )
                )
                for triple in itertools.combinations(left, 3)
            )
        )

    def shell_coherence_formula(
        self,
        left_center: str,
        left_support: tuple[str, ...],
        right_center: str,
        right_support: tuple[str, ...],
    ) -> z3.BoolRef:
        """Unique-four equality plus the two-circle intersection bound."""
        return z3.And(
            z3.Implies(
                self.same(left_center, right_center),
                self.support_set_equal_formula(left_support, right_support),
            ),
            z3.Implies(
                z3.Not(self.same(left_center, right_center)),
                self.support_overlap_at_most_two_formula(
                    left_support, right_support,
                ),
            ),
        )

    def conditional_shell_intersection_formula(
        self,
        left_center: str,
        left_support: tuple[str, ...],
        right_center: str,
        right_support: tuple[str, ...],
    ) -> z3.BoolRef:
        """The circle-intersection bound, only when the centers differ."""
        return z3.Implies(
            z3.Not(self.same(left_center, right_center)),
            self.support_overlap_at_most_two_formula(
                left_support, right_support,
            ),
        )

    def no_three_coradial_formula(
        self, center: str, support: tuple[str, ...],
    ) -> z3.BoolRef:
        return z3.And(
            *(
                z3.Not(
                    z3.And(
                        self.roweq(center, triple[0], triple[1]),
                        self.roweq(center, triple[0], triple[2]),
                    )
                )
                for triple in itertools.combinations(support, 3)
            )
        )

    def set_equal(self, block: str, left: tuple[str, ...], right: tuple[str, ...]) -> None:
        for point in left:
            self.add(block, z3.Or(*(self.same(point, other) for other in right)))
        for point in right:
            self.add(block, z3.Or(*(self.same(point, other) for other in left)))

    def _add_live_abstraction(self) -> None:
        retained = ("p1", "p2", "r1", "r2")
        inside = (*retained, "source")
        strict_cap_named = (*inside, "b1", "b2")
        outside = ("q", "other", "z", "t")
        projected = self.original_names
        named_rows: list[
            tuple[str, tuple[str, ...], z3.BoolRef, bool]
        ] = []

        self.add("apices_distinct", self.distinct(("a0", "a1", "a2")))
        self.add("retained_disjoint_pairs", self.distinct(retained))
        self.add("outside_cap_separation", self.distinct(inside))
        for u in inside:
            for v in outside:
                self.add("inside_outside_distinct", z3.Not(self.same(u, v)))
        self.add("first_outside_pair", z3.Not(self.same("q", "other")))
        self.add("second_outside_pair", z3.Not(self.same("z", "t")))
        self.add(
            "z_new_from_first_pair",
            z3.Not(self.same("z", "q")),
            z3.Not(self.same("z", "other")),
        )

        shell1 = ("p1", "p2", "q", "other")
        shell2 = ("r1", "r2", "z", "t")
        self.add_unique4_projection(
            "critical_shell_1",
            "b1",
            shell1,
            universe=projected,
            exact_universe=self.names,
        )
        self.add_unique4_projection(
            "critical_shell_2",
            "b2",
            shell2,
            universe=projected,
            exact_universe=self.names,
        )
        source_support = ("source", "s2", "s3", "s4")
        self.add_unique4_projection(
            "critical_shell_source",
            "bs",
            source_support,
            universe=projected,
            exact_universe=self.names,
        )

        def source_omits(point: str) -> z3.BoolRef:
            return z3.And(
                *(z3.Not(self.same(point, member)) for member in source_support)
            )

        self.add(
            "cross_retained_endpoints",
            z3.Or(self.same("x", "p1"), self.same("x", "p2")),
            z3.Or(self.same("y", "r1"), self.same("y", "r2")),
        )
        self.add(
            "source_cross_pair_omissions",
            source_omits("x"),
            source_omits("y"),
        )
        self.add("canonical_blockers_distinct", self.distinct(("b1", "b2", "bs")))
        for blocker in ("b1", "b2", "bs"):
            self.add(
                "critical_blocker_not_robust_apices",
                *(z3.Not(self.same(blocker, apex)) for apex in ("a0", "a1", "a2")),
            )

        first_radius = ("p1", "p2", "p3", "p4")
        first_rho = ("r1", "r2", "r3", "r4")
        self.add_exact4(
            "first_apex_radius",
            "a0",
            first_radius,
            universe=self.names,
        )
        self.add_exact4(
            "first_apex_rho",
            "a0",
            first_rho,
            universe=self.names,
        )
        named_rows.extend(
            (
                ("a0", first_radius, z3.BoolVal(True), False),
                ("a0", first_rho, z3.BoolVal(True), False),
            )
        )
        self.add(
            "retained_radii_distinct",
            z3.Not(self.roweq("a0", "p1", "r1")),
        )
        for point in (*retained, "b1", "b2"):
            self.add(
                "singleton_named_trace",
                z3.Implies(
                    z3.Not(self.same(point, "source")),
                    z3.Not(self.roweq("a0", point, "source")),
                ),
            )
        for left, right in itertools.combinations(strict_cap_named, 2):
            self.add(
                "aligned_named_trace",
                z3.Implies(
                    z3.And(
                        z3.Not(self.same(left, right)),
                        self.roweq("a0", left, right),
                    ),
                    z3.Or(
                        self.roweq("a0", left, "p1"),
                        self.roweq("a0", left, "r1"),
                    ),
                ),
            )
        for representative in projected:
            self.add(
                "aligned_first_apex_k4_classification",
                z3.Implies(
                    z3.And(
                        z3.Not(self.roweq("a0", representative, "p1")),
                        z3.Not(self.roweq("a0", representative, "r1")),
                    ),
                    self.row_at_most_three_formula(
                        "a0",
                        representative,
                        projected,
                        tag=f"aligned_a0_{representative}",
                    ),
                ),
            )

        for representative in projected:
            self.add(
                "cross_retained_deletion_bound",
                self.row_at_most_three_formula(
                    "a0",
                    representative,
                    projected,
                    tag=f"cross_delete_{representative}",
                    excluded=("x", "y"),
                ),
            )

        self.add(
            "second_blocker_nonbisector",
            z3.Not(self.roweq("b2", "q", "other")),
        )

        z_support = ("z", "z2", "z3", "z4")
        self.add_unique4_projection(
            "z_critical_shell",
            "bz",
            z_support,
            universe=projected,
            exact_universe=self.names,
        )
        self.add(
            "z_blocker_not_robust_apices",
            *(z3.Not(self.same("bz", apex)) for apex in ("a0", "a1", "a2")),
        )
        self.add("z_blocker_not_first", z3.Not(self.same("bz", "b1")))
        if self.z_branch == "reuse-second":
            self.add("z_blocker_branch", self.same("bz", "b2"))
            self.set_equal(
                "z_reused_support",
                ("z", "z2", "z3", "z4"),
                ("r1", "r2", "z", "t"),
            )
        else:
            self.add("z_blocker_branch", z3.Not(self.same("bz", "b2")))

        critical_shells = (
            ("b1", shell1),
            ("b2", shell2),
            ("bs", source_support),
            ("bz", z_support),
        )
        named_rows.extend(
            (center, support, z3.BoolVal(True), True)
            for center, support in critical_shells
        )
        for (left_center, left_support), (right_center, right_support) in (
            itertools.combinations(critical_shells, 2)
        ):
            self.add(
                "critical_shell_coherence",
                self.shell_coherence_formula(
                    left_center, left_support, right_center, right_support,
                ),
            )

        seed = shell1 + shell2 + source_support
        self.add(
            "escape_center_in_seed",
            z3.Or(*(self.same("be", point) for point in seed)),
        )
        self.add(
            "escape_outside_seed",
            *(z3.Not(self.same("escape", point)) for point in seed),
        )

        if self.escape_arm == "critical":
            escape_support = ("escape", "e2", "e3", "e4")
            self.add_exact4(
                "critical_escape_exact4",
                "be",
                escape_support,
                universe=self.names,
            )
            named_rows.append(
                ("be", escape_support, z3.BoolVal(True), False)
            )
        else:
            escape_support = ("escape", "e2", "e3", "e4")
            self.add(
                "robust_retained_escape_selected4",
                self.selected4_formula("be", escape_support),
            )
            named_rows.append(
                ("be", escape_support, z3.BoolVal(True), False)
            )
            for deleted, support in self.robust_survival_supports.items():
                self.add(
                    "robust_survives_original_named_deletion",
                    z3.And(
                        self.selected4_formula("be", support),
                        *(z3.Not(self.same(point, deleted)) for point in support),
                    ),
                )
                named_rows.append(
                    ("be", support, z3.BoolVal(True), False)
                )
            self.add(
                "robust_center_not_critical_blockers",
                *(z3.Not(self.same("be", blocker)) for blocker, _ in critical_shells),
            )

        for covered, (cover_center, cover_support) in (
            self.minimal_cover_witnesses.items()
        ):
            cover_universe = self.projected_universe(
                cover_center, *cover_support,
            )
            self.add_unique4_projection(
                "minimality_original_named_unique4_cover",
                cover_center,
                cover_support,
                universe=cover_universe,
                exact_universe=self.names,
            )
            self.add(
                "minimality_cover_center_not_rich_apices",
                *(z3.Not(self.same(cover_center, apex)) for apex in ("a0", "a1", "a2")),
            )
            if self.escape_arm == "robust":
                self.add(
                    "minimality_cover_center_not_robust_center",
                    z3.Not(self.same(cover_center, "be")),
                )
            named_rows.append(
                (cover_center, cover_support, z3.BoolVal(True), True)
            )

        for center, support in self.global_k4_supports.items():
            self.add(
                "global_k4_at_original_named_center",
                self.selected4_formula(center, support),
            )
            named_rows.append(
                (center, support, z3.BoolVal(True), False)
            )

        for apex, (selected_six, first_four, second_four) in (
            self.rich_witnesses.items()
        ):
            six_branch = self.selected_formula(apex, selected_six)
            two_four_branch = z3.And(
                self.selected4_formula(apex, first_four),
                self.selected4_formula(apex, second_four),
                z3.Not(self.roweq(apex, first_four[0], second_four[0])),
            )
            self.add(
                "rich_class_selected_six_or_two_selected_four",
                z3.Or(six_branch, two_four_branch),
            )
            named_rows.extend(
                (
                    (apex, selected_six, six_branch, False),
                    (apex, first_four, two_four_branch, False),
                    (apex, second_four, two_four_branch, False),
                )
            )

        # Every listed support is known to be co-radial only under its guard.
        # The two-circle bound is therefore guarded both by row activation and
        # by center inequality.  No robust-survival row is treated as the
        # retained escape row, and the critical escape row is not treated as
        # unique.
        for left, right in itertools.combinations(named_rows, 2):
            left_center, left_support, left_guard, left_unique = left
            right_center, right_support, right_guard, right_unique = right
            self.add(
                "conditional_named_shell_intersection",
                z3.Implies(
                    z3.And(left_guard, right_guard),
                    self.conditional_shell_intersection_formula(
                        left_center,
                        left_support,
                        right_center,
                        right_support,
                    ),
                ),
            )
            if left_unique and right_unique:
                self.add(
                    "unique_shell_same_center_coherence",
                    z3.Implies(
                        z3.And(
                            left_guard,
                            right_guard,
                            self.same(left_center, right_center),
                        ),
                        self.support_set_equal_formula(
                            left_support, right_support,
                        ),
                    ),
                )

        for row_center, support, guard, _ in named_rows:
            for apex in ("a0", "a1", "a2"):
                self.add(
                    "conditional_rich_apex_shell_intersection",
                    z3.Implies(
                        z3.And(
                            guard,
                            z3.Not(self.same(row_center, apex)),
                        ),
                        self.no_three_coradial_formula(apex, support),
                    ),
                )
        self.projected_rows = tuple(named_rows)

        self.add(
            "mec_order_symmetry",
            self.before("a0", "a1"),
            self.before("a1", "a2"),
        )
        for point in ("p1", "p2", "r1", "r2", "source", "b1", "b2"):
            self.add(
                "first_cap_strict_interior_order",
                self.before("a1", point),
                self.before(point, "a2"),
            )
        for point in ("p3", "p4", "r3", "r4"):
            self.add(
                "outside_first_strict_cap_order",
                z3.Or(
                    z3.ULE(
                        self.rank[self.ix(point)],
                        self.rank[self.ix("a1")],
                    ),
                    z3.ULE(
                        self.rank[self.ix("a2")],
                        self.rank[self.ix(point)],
                    ),
                ),
            )
        for point in outside:
            self.add(
                "outside_first_closed_cap_order",
                z3.Or(self.before(point, "a1"), self.before("a2", point)),
            )

    def _add_apex_triple_exclusion(self) -> None:
        """Project the live carrier-wide no-common-apex-circle theorem onto W."""
        for center in self.original_names:
            if center in ("a0", "a1", "a2"):
                continue
            self.add(
                "apex_triple_exclusion",
                z3.Not(
                    z3.And(
                        self.roweq(center, "a0", "a1"),
                        self.roweq(center, "a0", "a2"),
                    )
                ),
            )

    def literal_expr(self, literal: Literal) -> z3.BoolRef:
        if literal.kind == "alias":
            left, right, equal = literal.args
            expr = self.same(str(left), str(right))
            return expr if bool(equal) else z3.Not(expr)
        if literal.kind == "order":
            left, right = literal.args
            return self.before(str(left), str(right))
        if literal.kind == "row":
            center, left, right, equal = literal.args
            expr = self.roweq(str(center), str(left), str(right))
            return expr if bool(equal) else z3.Not(expr)
        raise ValueError(f"unknown literal kind: {literal.kind}")

    def add_cut(self, core: list[Literal]) -> None:
        if not core:
            self.solver.add(z3.BoolVal(False))
            return
        self.solver.add(z3.Or(*(z3.Not(self.literal_expr(lit)) for lit in core)))

    def selected_literals(
        self,
        model: z3.ModelRef,
        extra_literals: Iterable[Literal] = (),
    ) -> tuple[list[Literal], dict[tuple[int, int], Literal], dict[tuple[int, int], Literal]]:
        selected: list[Literal] = []
        alias_lits: dict[tuple[int, int], Literal] = {}
        order_lits: dict[tuple[int, int], Literal] = {}
        rank_values = [
            model.eval(rank, model_completion=True).as_long() for rank in self.rank
        ]
        for i, j in itertools.combinations(range(self.n), 2):
            equal = rank_values[i] == rank_values[j]
            alias = Literal("alias", (self.names[i], self.names[j], equal))
            selected.append(alias)
            alias_lits[i, j] = alias
            if not equal:
                left, right = (i, j) if rank_values[i] < rank_values[j] else (j, i)
                order = Literal("order", (self.names[left], self.names[right]))
                selected.append(order)
                order_lits[left, right] = order
        for center, left, right in sorted(self.required_rows):
            atom = self.rows[center, left, right]
            equal = z3.is_true(model.eval(atom, model_completion=True))
            selected.append(Literal("row", (center, left, right, equal)))
        selected_set = set(selected)
        for literal in extra_literals:
            if literal not in selected_set:
                selected.append(literal)
                selected_set.add(literal)
        return selected, alias_lits, order_lits

    def alias_classes(self, model: z3.ModelRef) -> list[list[str]]:
        values: dict[int, list[str]] = {}
        for name, rank in zip(self.names, self.rank, strict=True):
            value = model.eval(rank, model_completion=True).as_long()
            values.setdefault(value, []).append(name)
        return [values[key] for key in sorted(values)]

    def required_row_assignment(self, model: z3.ModelRef) -> list[list[Any]]:
        """Serialize every original row atom selected by one outer model."""
        return [
            Literal(
                "row",
                (
                    center,
                    left,
                    right,
                    z3.is_true(
                        model.eval(
                            self.rows[center, left, right],
                            model_completion=True,
                        )
                    ),
                ),
            ).to_json()
            for center, left, right in sorted(self.required_rows)
        ]

    def direct_four_point_kalmanson_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find two-row equality patterns that directly cancel Kalmanson.

        For each ordered quotient quadruple a<b<c<d, either strict Kalmanson
        inequality is immediately contradictory when the two terms on its
        left are identified with the corresponding two terms on its right.
        Each result consists of the three order literals and two row equalities,
        hence is a replayable, theorem-shaped five-literal cut without invoking
        QF_LRA.  A batch is extracted from one outer model because every member
        independently excludes a soundly impossible pattern.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_holds(center: str, left: str, right: str) -> bool:
            return class_of(center, left) == class_of(center, right)

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        seen: set[frozenset[Literal]] = set()
        for quad in itertools.combinations(self.names, 4):
            if len({ranks[name] for name in quad}) != 4:
                continue
            a, b, c, d = sorted(quad, key=ranks.__getitem__)
            patterns = (
                ((a, c, d), (b, c, d)),
                ((c, a, b), (d, a, b)),
                ((a, b, c), (d, b, c)),
                ((b, a, d), (c, a, d)),
            )
            for first, second in patterns:
                if row_holds(*first) and row_holds(*second):
                    core = [
                        Literal("order", (a, b)),
                        Literal("order", (b, c)),
                        Literal("order", (c, d)),
                        row_literal(*first),
                        row_literal(*second),
                    ]
                    if len(core) != 5 or len(set(core)) != 5:
                        raise RuntimeError(
                            "direct Kalmanson schema did not produce five "
                            "distinct literals"
                        )
                    key = frozenset(core)
                    if key not in seen:
                        seen.add(key)
                        cores.append(core)
                        if limit is not None and len(cores) >= limit:
                            return cores
        return cores

    def direct_four_point_kalmanson_core(
        self, model: z3.ModelRef
    ) -> list[Literal] | None:
        """Return the first direct Kalmanson core, for tests and callers."""
        cores = self.direct_four_point_kalmanson_cores(model, limit=1)
        return cores[0] if cores else None

    def direct_five_point_euclidean_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find either proved seven-literal five-point Euclidean obstruction.

        Let ``a < b < c < d < e`` be five distinct points in the cyclic order
        of a strictly convex planar set.  The first schema has the three rows

          d(b,a) = d(b,e),  d(c,a) = d(c,b),  d(c,a) = d(c,d)

        and the second schema has

          d(d,a) = d(d,c) = d(d,e),  d(e,a) = d(e,b).

        Both are impossible.  For the first, normalize ``a=(0,0)``,
        ``b=(1,0)`` and write
        ``c=(1/2,h)``, ``d=(x,y)``, ``e=(u,v)``.  The four cyclic orientations
        give ``y,v>0``, ``orient(b,c,d)>0``, and ``x*v-u*y>0``.  The c-row and
        ``orient(b,c,d)>0`` simplify to

          -x * ((x-1)^2 + y^2) > 0,

        hence ``x<0``.  The b-row and ``v>0`` give ``u>0``.  Therefore
        ``x*v-u*y<0``, a contradiction.  The normalization is a direct
        similarity, so it preserves all equalities and orientation signs.

        Iterate over quotient-class representatives rather than all named
        occurrences: this avoids duplicate cuts and keeps the full tier
        tractable even when it contains hundreds of Skolem roles.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        representative_by_rank: dict[int, str] = {}
        for name in self.names:
            representative_by_rank.setdefault(ranks[name], name)
        ordered = [
            representative_by_rank[rank]
            for rank in sorted(representative_by_rank)
        ]
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        seen: set[frozenset[Literal]] = set()
        for c_pos in range(2, len(ordered) - 2):
            c = ordered[c_pos]
            c_buckets: dict[int, list[int]] = {}
            for pos, point in enumerate(ordered):
                if pos != c_pos:
                    c_buckets.setdefault(class_of(c, point), []).append(pos)
            for positions in c_buckets.values():
                left_positions = [pos for pos in positions if pos < c_pos]
                right_positions = [
                    pos for pos in positions if c_pos < pos < len(ordered) - 1
                ]
                for a_pos, b_pos in itertools.combinations(left_positions, 2):
                    a, b = ordered[a_pos], ordered[b_pos]
                    ba_class = class_of(b, a)
                    for d_pos in right_positions:
                        d = ordered[d_pos]
                        for e_pos in range(d_pos + 1, len(ordered)):
                            e = ordered[e_pos]
                            if class_of(b, e) != ba_class:
                                continue
                            core = [
                                Literal("order", (a, b)),
                                Literal("order", (b, c)),
                                Literal("order", (c, d)),
                                Literal("order", (d, e)),
                                row_literal(b, a, e),
                                row_literal(c, a, b),
                                row_literal(c, a, d),
                            ]
                            if len(core) != 7 or len(set(core)) != 7:
                                raise RuntimeError(
                                    "direct five-point Euclidean schema did not "
                                    "produce seven distinct literals"
                                )
                            key = frozenset(core)
                            if key not in seen:
                                seen.add(key)
                                cores.append(core)
                                if limit is not None and len(cores) >= limit:
                                    return cores
        for a_pos, b_pos, c_pos, d_pos, e_pos in itertools.combinations(
            range(len(ordered)), 5
        ):
            a, b, c, d, e = (
                ordered[a_pos],
                ordered[b_pos],
                ordered[c_pos],
                ordered[d_pos],
                ordered[e_pos],
            )
            d_class = class_of(d, a)
            if (
                class_of(d, c) != d_class
                or class_of(d, e) != d_class
                or class_of(e, a) != class_of(e, b)
            ):
                continue
            core = [
                Literal("order", (a, b)),
                Literal("order", (b, c)),
                Literal("order", (c, d)),
                Literal("order", (d, e)),
                row_literal(d, a, c),
                row_literal(d, c, e),
                row_literal(e, a, b),
            ]
            if len(core) != 7 or len(set(core)) != 7:
                raise RuntimeError(
                    "second direct five-point Euclidean schema did not "
                    "produce seven distinct literals"
                )
            key = frozenset(core)
            if key not in seen:
                seen.add(key)
                cores.append(core)
                if limit is not None and len(cores) >= limit:
                    return cores
        return cores

    def direct_reversed_second_five_point_euclidean_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find the reversed-order form of the second five-point obstruction.

        For five quotient representatives ``p0 < p1 < p2 < p3 < p4``, require

          d01 = d12 = d14,  d03 = d04.

        This is
        ``FivePointEuclideanObstruction.
        false_of_second_three_rows_of_four_orientations`` under the relabeling
        ``(a,b,c,d,e) = (p4,p3,p2,p1,p0)`` after reflecting a hypothetical
        realization: reversal makes the four theorem orientations positive,
        while reflection flips their signs and preserves every distance
        equality.  The cut records the four successor-order literals and a
        spanning tree of three positive row equalities.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        representative_by_rank: dict[int, str] = {}
        for name in self.names:
            representative_by_rank.setdefault(ranks[name], name)
        ordered = [
            representative_by_rank[rank]
            for rank in sorted(representative_by_rank)
        ]
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        for p0_pos, p1_pos, p2_pos, p3_pos, p4_pos in itertools.combinations(
            range(len(ordered)), 5
        ):
            p0, p1, p2, p3, p4 = (
                ordered[p0_pos],
                ordered[p1_pos],
                ordered[p2_pos],
                ordered[p3_pos],
                ordered[p4_pos],
            )
            p1_class = class_of(p1, p0)
            if (
                class_of(p1, p2) != p1_class
                or class_of(p1, p4) != p1_class
                or class_of(p0, p3) != class_of(p0, p4)
            ):
                continue
            core = [
                Literal("order", (p0, p1)),
                Literal("order", (p1, p2)),
                Literal("order", (p2, p3)),
                Literal("order", (p3, p4)),
                row_literal(p1, p0, p2),
                row_literal(p1, p2, p4),
                row_literal(p0, p3, p4),
            ]
            if len(core) != 7 or len(set(core)) != 7:
                raise RuntimeError(
                    "reversed second five-point Euclidean schema did not "
                    "produce seven distinct literals"
                )
            cores.append(core)
            if limit is not None and len(cores) >= limit:
                return cores
        return cores

    def direct_circle_isosceles_five_point_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find the proved five-point circle-isosceles order obstruction.

        For five quotient representatives ``w < f < p < x < z``, require

          WF = WX = WZ,  PZ = XZ.

        This is exactly
        ``FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`` (and its
        direct selected-row adapter ``false_of_two_selected_rows_of_ccw``).
        Strict cyclic order supplies the theorem's five positive orientation
        hypotheses.  The cut records only the four successor-order literals
        and a spanning tree of three independent positive row equalities.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        representative_by_rank: dict[int, str] = {}
        for name in self.names:
            representative_by_rank.setdefault(ranks[name], name)
        ordered = [
            representative_by_rank[rank]
            for rank in sorted(representative_by_rank)
        ]
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        for w_pos, f_pos, p_pos, x_pos, z_pos in itertools.combinations(
            range(len(ordered)), 5
        ):
            w, f, p, x, z = (
                ordered[w_pos],
                ordered[f_pos],
                ordered[p_pos],
                ordered[x_pos],
                ordered[z_pos],
            )
            wf_class = class_of(w, f)
            if (
                class_of(w, x) != wf_class
                or class_of(w, z) != wf_class
                or class_of(z, p) != class_of(z, x)
            ):
                continue
            core = [
                Literal("order", (w, f)),
                Literal("order", (f, p)),
                Literal("order", (p, x)),
                Literal("order", (x, z)),
                row_literal(w, f, x),
                row_literal(w, f, z),
                row_literal(z, p, x),
            ]
            if len(core) != 7 or len(set(core)) != 7:
                raise RuntimeError(
                    "direct circle-isosceles five-point schema did not "
                    "produce seven distinct literals"
                )
            cores.append(core)
            if limit is not None and len(cores) >= limit:
                return cores
        return cores

    def direct_mirror_interleaving_six_point_euclidean_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find the proved ten-literal mirror-interleaving obstruction.

        Let ``a < b < c < d < e < f`` be six distinct points in the cyclic
        order of a strictly convex planar set.  The required equalities are

          AB = AF,  AC = AE,  DA = DC = DE,  EB = EF.

        This is exactly
        ``SixPointEuclideanObstruction.
        false_of_six_ccw_mirror_interleaving_row_equalities``.  Strict cyclic
        order supplies all six orientation hypotheses, so the cut consists of
        the five successor-order literals and five positive row equalities.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        representative_by_rank: dict[int, str] = {}
        for name in self.names:
            representative_by_rank.setdefault(ranks[name], name)
        ordered = [
            representative_by_rank[rank]
            for rank in sorted(representative_by_rank)
        ]
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        for a_pos, b_pos, c_pos, d_pos, e_pos, f_pos in itertools.combinations(
            range(len(ordered)), 6
        ):
            a, b, c, d, e, f = (
                ordered[a_pos],
                ordered[b_pos],
                ordered[c_pos],
                ordered[d_pos],
                ordered[e_pos],
                ordered[f_pos],
            )
            d_class = class_of(d, a)
            if (
                class_of(a, b) != class_of(a, f)
                or class_of(a, c) != class_of(a, e)
                or class_of(d, c) != d_class
                or class_of(d, e) != d_class
                or class_of(e, b) != class_of(e, f)
            ):
                continue
            core = [
                Literal("order", (a, b)),
                Literal("order", (b, c)),
                Literal("order", (c, d)),
                Literal("order", (d, e)),
                Literal("order", (e, f)),
                row_literal(a, b, f),
                row_literal(a, c, e),
                row_literal(d, a, c),
                row_literal(d, a, e),
                row_literal(e, b, f),
            ]
            if len(core) != 10 or len(set(core)) != 10:
                raise RuntimeError(
                    "direct mirror-interleaving six-point Euclidean schema did "
                    "not produce ten distinct literals"
                )
            cores.append(core)
            if limit is not None and len(cores) >= limit:
                return cores
        return cores

    def direct_sparse_six_point_euclidean_cores(
        self,
        model: z3.ModelRef,
        *,
        limit: int | None = None,
    ) -> list[list[Literal]]:
        """Find the proved nine-literal sparse six-point Euclidean obstruction.

        Let ``a < b < c < d < e < f`` be six distinct points in the cyclic
        order of a strictly convex planar set.  The required distance-class
        equalities are

          AB = AD = AF,  CB = CD = CE.

        The six orientation hypotheses of the kernel theorem follow from
        this strict cyclic order, so the cut needs only the five successor
        order literals and four positive row-equality literals.
        """
        if limit is not None and limit <= 0:
            return []
        ranks = {
            name: model.eval(self.rank[self.ix(name)], model_completion=True).as_long()
            for name in self.names
        }
        representative_by_rank: dict[int, str] = {}
        for name in self.names:
            representative_by_rank.setdefault(ranks[name], name)
        ordered = [
            representative_by_rank[rank]
            for rank in sorted(representative_by_rank)
        ]
        classes = {
            (i, j): model.eval(edge, model_completion=True).as_long()
            for (i, j), edge in self.edge_class.items()
        }

        def class_of(left: str, right: str) -> int:
            i, j = self.ix(left), self.ix(right)
            return 0 if i == j else classes[min(i, j), max(i, j)]

        def row_literal(center: str, left: str, right: str) -> Literal:
            left, right = sorted((left, right))
            return Literal("row", (center, left, right, True))

        cores: list[list[Literal]] = []
        for a_pos, b_pos, c_pos, d_pos, e_pos, f_pos in itertools.combinations(
            range(len(ordered)), 6
        ):
            a, b, c, d, e, f = (
                ordered[a_pos],
                ordered[b_pos],
                ordered[c_pos],
                ordered[d_pos],
                ordered[e_pos],
                ordered[f_pos],
            )
            af_class = class_of(a, f)
            ce_class = class_of(c, e)
            if (
                class_of(a, b) != af_class
                or class_of(a, d) != af_class
                or class_of(c, b) != ce_class
                or class_of(c, d) != ce_class
            ):
                continue
            core = [
                Literal("order", (a, b)),
                Literal("order", (b, c)),
                Literal("order", (c, d)),
                Literal("order", (d, e)),
                Literal("order", (e, f)),
                row_literal(a, b, f),
                row_literal(a, d, f),
                row_literal(c, b, e),
                row_literal(c, d, e),
            ]
            if len(core) != 9 or len(set(core)) != 9:
                raise RuntimeError(
                    "direct sparse six-point Euclidean schema did not produce nine "
                    "distinct literals"
                )
            cores.append(core)
            if limit is not None and len(cores) >= limit:
                return cores
        return cores


class QuotientMetricCheck:
    """Exact metric check for one fully frozen alias/order quotient.

    This fast path has one distance variable per alias-class pair, rather than
    per named-occurrence pair.  Strict triangle and Kalmanson constraints are
    added by exact rational separation.  Non-forced row disequalities are
    discharged by a constructed rational perturbation.  SAT is returned only
    after every quotient triple, quadruple, and frozen row has been replayed.

    Every nontrivial true-row equality and every separated strict metric
    inequality is guarded by its own assumption.  Each relation records the
    selected outer literals that imply it, so an UNSAT relation core can be
    translated into a compact, independently replayable outer cut.
    """

    SEPARATION_BATCH = 4096

    def __init__(
        self,
        outer: OuterMap,
        outer_model: z3.ModelRef,
        *,
        timeout_ms: int,
        iteration: int,
    ) -> None:
        self.outer = outer
        self.outer_model = outer_model
        self.deadline = time.monotonic() + timeout_ms / 1000
        self.solver = z3.SolverFor("QF_LRA")
        self.counts: Counter[str] = Counter()
        self._construction_timed_out = False
        self._reason_unknown = ""
        self._model: z3.ModelRef | None = None
        self._candidate: dict[tuple[int, int], Fraction] | None = None

        rank_values = [
            outer_model.eval(rank, model_completion=True).as_long()
            for rank in outer.rank
        ]
        ordered_ranks = sorted(set(rank_values))
        rank_to_class = {rank: q for q, rank in enumerate(ordered_ranks)}
        self.class_of = [rank_to_class[rank] for rank in rank_values]
        self.q = len(ordered_ranks)
        self.representative = [
            next(i for i, q in enumerate(self.class_of) if q == class_index)
            for class_index in range(self.q)
        ]
        (
            self.selected,
            self.alias_lits,
            self.order_lits,
        ) = outer.selected_literals(outer_model)
        self.selected_set = set(self.selected)
        self.distance = {
            (i, j): z3.Real(f"quotient_{iteration}_d_{i}_{j}")
            for i in range(self.q) for j in range(i + 1, self.q)
        }
        self.relations: list[QuotientRelation] = []
        self.relation_token: dict[int, z3.BoolRef] = {}
        self.relation_for_token: dict[str, QuotientRelation] = {}
        self._relation_by_key: dict[tuple[str, tuple[Any, ...]], QuotientRelation] = {}
        self._iteration = iteration
        self._last_status: z3.CheckSatResult | None = None
        self.counts["quotient_classes"] = self.q
        self.counts["distance_variables"] = len(self.distance)
        self._add_frozen_metric()

    def d(self, left: int | str, right: int | str) -> z3.ArithRef:
        if isinstance(left, str):
            left = self.class_of[self.outer.ix(left)]
        if isinstance(right, str):
            right = self.class_of[self.outer.ix(right)]
        if left == right:
            return z3.RealVal(0)
        return self.distance[min(left, right), max(left, right)]

    def _expired(self) -> bool:
        return time.monotonic() >= self.deadline

    def _add_many(
        self,
        block: str,
        constraints: Iterable[z3.BoolRef],
        *,
        chunk_size: int = 2048,
    ) -> bool:
        chunk: list[z3.BoolRef] = []
        for constraint in constraints:
            chunk.append(constraint)
            if len(chunk) >= chunk_size:
                self.solver.add(*chunk)
                self.counts[block] += len(chunk)
                chunk.clear()
                if self._expired():
                    self._construction_timed_out = True
                    self._reason_unknown = "quotient metric construction timeout"
                    return False
        if chunk:
            self.solver.add(*chunk)
            self.counts[block] += len(chunk)
        return True

    @staticmethod
    def _dedup_literals(literals: Iterable[Literal]) -> tuple[Literal, ...]:
        result: list[Literal] = []
        seen: set[Literal] = set()
        for literal in literals:
            if literal not in seen:
                result.append(literal)
                seen.add(literal)
        return tuple(result)

    def _alias_literal(self, left: int, right: int) -> Literal:
        if left == right:
            raise AssertionError("alias transport requested for one occurrence")
        literal = self.alias_lits[min(left, right), max(left, right)]
        if not bool(literal.args[2]):
            raise AssertionError("alias transport is not selected equal")
        return literal

    def _representative_transport(self, occurrence: int) -> tuple[Literal, ...]:
        representative = self.representative[self.class_of[occurrence]]
        if occurrence == representative:
            return ()
        return (self._alias_literal(occurrence, representative),)

    def _row_justification(
        self,
        center: str,
        left: str,
        right: str,
    ) -> tuple[Literal, ...]:
        row = Literal("row", (center, left, right, True))
        occurrences = tuple(self.outer.ix(name) for name in (center, left, right))
        return self._dedup_literals(
            (
                row,
                *self._representative_transport(occurrences[0]),
                *self._representative_transport(occurrences[1]),
                *self._representative_transport(occurrences[2]),
            )
        )

    def _triangle_justification(
        self,
        i: int,
        j: int,
        k: int,
    ) -> tuple[Literal, ...]:
        representatives = tuple(self.representative[q] for q in (i, j, k))
        literals = tuple(
            self.alias_lits[min(left, right), max(left, right)]
            for left, right in itertools.combinations(representatives, 2)
        )
        if any(bool(literal.args[2]) for literal in literals):
            raise AssertionError("quotient triangle representatives are aliased")
        return literals

    def _kalmanson_justification(
        self,
        a: int,
        b: int,
        c: int,
        d: int,
    ) -> tuple[Literal, ...]:
        representatives = tuple(
            self.representative[q] for q in (a, b, c, d)
        )
        return tuple(
            self.order_lits[left, right]
            for left, right in zip(representatives, representatives[1:])
        )

    def _track_relation(
        self,
        kind: str,
        key: tuple[Any, ...],
        constraint: z3.BoolRef,
        outer_literals: tuple[Literal, ...],
    ) -> QuotientRelation:
        registry_key = kind, key
        if registry_key in self._relation_by_key:
            return self._relation_by_key[registry_key]
        if not outer_literals:
            raise AssertionError("tracked quotient relation has no outer justification")
        if any(literal not in self.selected_set for literal in outer_literals):
            raise AssertionError("quotient relation justification is not selected")
        identifier = len(self.relations)
        relation = QuotientRelation(
            identifier,
            kind,
            key,
            constraint,
            outer_literals,
        )
        token = z3.Bool(f"quotient_relation_{self._iteration}_{identifier}")
        self.relations.append(relation)
        self.relation_token[identifier] = token
        self.relation_for_token[token.decl().name()] = relation
        self._relation_by_key[registry_key] = relation
        self.solver.add(z3.Implies(token, constraint))
        self.counts[f"tracked_{kind}"] += 1
        return relation

    def _active_tokens(self) -> list[z3.BoolRef]:
        return [
            self.relation_token[relation.identifier]
            for relation in self.relations
        ]

    def _add_frozen_metric(self) -> None:
        for (left, right), distance in self.distance.items():
            left_rep, right_rep = (
                self.representative[left],
                self.representative[right],
            )
            distinct = self.alias_lits[
                min(left_rep, right_rep), max(left_rep, right_rep)
            ]
            if bool(distinct.args[2]):
                raise AssertionError("quotient representatives are aliased")
            self._track_relation(
                "positive_distance",
                (left, right),
                distance > 0,
                (distinct,),
            )
        self.counts["positive_distance"] = len(self.distance)

        # True rows generate only equalities between individual distance
        # variables (or zero).  Close those equalities first.  A false row
        # inside one component is an immediate contradiction.  Every other
        # false row removes a proper hyperplane from the relatively open
        # strict-inequality cell, so it cannot destroy nonemptiness.  On SAT,
        # _generic_candidate constructs and rechecks a rational point outside
        # every omitted hyperplane.
        zero: tuple[int, int] | None = None
        parent: dict[
            tuple[int, int] | None, tuple[int, int] | None
        ] = {zero: zero}
        parent.update({pair: pair for pair in self.distance})

        def find(node: tuple[int, int] | None) -> tuple[int, int] | None:
            while parent[node] != node:
                parent[node] = parent[parent[node]]
                node = parent[node]
            return node

        def union(
            left: tuple[int, int] | None,
            right: tuple[int, int] | None,
        ) -> None:
            left_root, right_root = find(left), find(right)
            if left_root != right_root:
                parent[right_root] = left_root

        def node(left: str, right: str) -> tuple[int, int] | None:
            i = self.class_of[self.outer.ix(left)]
            j = self.class_of[self.outer.ix(right)]
            return zero if i == j else (min(i, j), max(i, j))

        rows: list[
            tuple[tuple[int, int] | None, tuple[int, int] | None, bool]
        ] = []
        for center, left, right in sorted(self.outer.required_rows):
            atom = self.outer.rows[center, left, right]
            equal = z3.is_true(
                self.outer_model.eval(atom, model_completion=True)
            )
            left_node, right_node = node(center, left), node(center, right)
            rows.append((left_node, right_node, equal))
            if equal:
                union(left_node, right_node)

        equality_constraints: dict[
            str, tuple[z3.BoolRef, tuple[Literal, ...]]
        ] = {}
        for (
            center,
            left,
            right,
        ), (left_node, right_node, equal) in zip(
            sorted(self.outer.required_rows),
            rows,
            strict=True,
        ):
            if not equal:
                continue
            left_expr = z3.RealVal(0) if left_node is zero else self.distance[left_node]
            right_expr = (
                z3.RealVal(0) if right_node is zero else self.distance[right_node]
            )
            equation = z3.simplify(left_expr == right_expr)
            if z3.is_true(equation):
                continue
            justification = self._row_justification(center, left, right)
            equation_key = equation.sexpr()
            prior = equality_constraints.get(equation_key)
            score = (
                len(justification),
                tuple(
                    json.dumps(literal.to_json(), separators=(",", ":"))
                    for literal in justification
                ),
            )
            if prior is None:
                equality_constraints[equation_key] = equation, justification
            else:
                prior_score = (
                    len(prior[1]),
                    tuple(
                        json.dumps(literal.to_json(), separators=(",", ":"))
                        for literal in prior[1]
                    ),
                )
                if score < prior_score:
                    equality_constraints[equation_key] = equation, justification
        for equation_key in sorted(equality_constraints):
            equation, justification = equality_constraints[equation_key]
            self._track_relation(
                "true_row_equality",
                (equation_key,),
                equation,
                justification,
            )
        self.counts["frozen_row_equalities"] = len(equality_constraints)

        self._component = {item: find(item) for item in parent}
        self._false_rows: list[
            tuple[tuple[int, int] | None, tuple[int, int] | None]
        ] = []
        for left_node, right_node, equal in rows:
            if equal:
                continue
            if find(left_node) == find(right_node):
                self.solver.add(z3.BoolVal(False))
                self.counts["forced_row_disequality_conflicts"] += 1
            else:
                self._false_rows.append((left_node, right_node))
        self.counts["omitted_open_disequalities"] = len(self._false_rows)

        self.solver.add(self.d("a0", "a1") == 1)
        self.counts["scale"] += 1

    @staticmethod
    def _rational(value: z3.ArithRef) -> Fraction:
        if not isinstance(value, z3.RatNumRef):
            raise TypeError(f"non-rational QF_LRA metric value: {value}")
        return Fraction(value.numerator_as_long(), value.denominator_as_long())

    def _generic_candidate(
        self,
        values: dict[tuple[int, int], Fraction],
    ) -> dict[tuple[int, int], Fraction] | None:
        """Perturb an LP model off every omitted false-row hyperplane."""
        zero: tuple[int, int] | None = None
        scale_node = (
            min(self.class_of[self.outer.ix("a0")],
                self.class_of[self.outer.ix("a1")]),
            max(self.class_of[self.outer.ix("a0")],
                self.class_of[self.outer.ix("a1")]),
        )
        fixed_roots = {self._component[zero], self._component[scale_node]}
        other_roots = sorted(
            {self._component[pair] for pair in self.distance} - fixed_roots
        )
        root_direction = {root: Fraction(i + 1) for i, root in enumerate(other_roots)}
        root_direction.update({root: Fraction(0) for root in fixed_roots})
        directions = {
            pair: root_direction[self._component[pair]]
            for pair in self.distance
        }

        def value(
            mapping: dict[tuple[int, int], Fraction],
            left: int,
            right: int,
        ) -> Fraction:
            if left == right:
                return Fraction(0)
            return mapping[min(left, right), max(left, right)]

        upper_bound: Fraction | None = None

        def restrict(slack: Fraction, slope: Fraction) -> bool:
            nonlocal upper_bound
            if slack <= 0:
                return False
            if slope < 0:
                bound = slack / -slope
                upper_bound = bound if upper_bound is None else min(
                    upper_bound, bound
                )
            return True

        for i, j, k in itertools.combinations(range(self.q), 3):
            checks = (
                (
                    value(values, i, j) + value(values, j, k)
                    - value(values, i, k),
                    value(directions, i, j) + value(directions, j, k)
                    - value(directions, i, k),
                ),
                (
                    value(values, i, j) + value(values, i, k)
                    - value(values, j, k),
                    value(directions, i, j) + value(directions, i, k)
                    - value(directions, j, k),
                ),
                (
                    value(values, i, k) + value(values, j, k)
                    - value(values, i, j),
                    value(directions, i, k) + value(directions, j, k)
                    - value(directions, i, j),
                ),
            )
            if not all(restrict(slack, slope) for slack, slope in checks):
                return None

        for a, b, c, d in itertools.combinations(range(self.q), 4):
            checks = (
                (
                    value(values, a, c) + value(values, b, d)
                    - value(values, a, b) - value(values, c, d),
                    value(directions, a, c) + value(directions, b, d)
                    - value(directions, a, b) - value(directions, c, d),
                ),
                (
                    value(values, a, c) + value(values, b, d)
                    - value(values, a, d) - value(values, b, c),
                    value(directions, a, c) + value(directions, b, d)
                    - value(directions, a, d) - value(directions, b, c),
                ),
            )
            if not all(restrict(slack, slope) for slack, slope in checks):
                return None
            if self._expired():
                self._reason_unknown = "generic metric perturbation timeout"
                return None

        forbidden: set[Fraction] = set()

        def node_value(
            mapping: dict[tuple[int, int], Fraction],
            item: tuple[int, int] | None,
        ) -> Fraction:
            return Fraction(0) if item is zero else mapping[item]

        for left_node, right_node in self._false_rows:
            base_difference = (
                node_value(values, left_node) - node_value(values, right_node)
            )
            slope = (
                node_value(directions, left_node)
                - node_value(directions, right_node)
            )
            if slope == 0:
                if base_difference == 0:
                    return None
            else:
                forbidden.add(-base_difference / slope)

        epsilon = min(Fraction(1), upper_bound / 2) if upper_bound else Fraction(1)
        while epsilon in forbidden:
            epsilon /= 2
        candidate = {
            pair: values[pair] + epsilon * directions[pair]
            for pair in self.distance
        }

        # Exact replay of the omitted incidences; strict inequalities were
        # protected by the rational slack bound above.
        if any(
            node_value(candidate, left) == node_value(candidate, right)
            for left, right in self._false_rows
        ):
            return None
        if candidate[scale_node] != 1:
            return None
        return candidate

    def check(self) -> z3.CheckSatResult:
        if self._construction_timed_out:
            self._last_status = z3.unknown
            return z3.unknown

        added_triangles: set[tuple[int, int, int, int]] = set()
        added_kalmanson: set[tuple[int, int, int, int, int]] = set()
        while True:
            remaining_ms = int((self.deadline - time.monotonic()) * 1000)
            if remaining_ms <= 0:
                self._reason_unknown = "quotient metric wall timeout"
                self._last_status = z3.unknown
                return z3.unknown
            self.solver.set(timeout=max(1, remaining_ms))
            status = self.solver.check(*self._active_tokens())
            if status != z3.sat:
                self._last_status = status
                if status == z3.unknown:
                    self._reason_unknown = self.solver.reason_unknown()
                return status

            model = self.solver.model()
            values = {
                pair: self._rational(
                    model.eval(distance, model_completion=True)
                )
                for pair, distance in self.distance.items()
            }

            def value(left: int, right: int) -> Fraction:
                if left == right:
                    return Fraction(0)
                return values[min(left, right), max(left, right)]

            violated: list[tuple[str, tuple[int, ...], z3.BoolRef]] = []
            for i, j, k in itertools.combinations(range(self.q), 3):
                triangle_candidates = (
                    (0, value(i, j) + value(j, k), value(i, k)),
                    (1, value(i, j) + value(i, k), value(j, k)),
                    (2, value(i, k) + value(j, k), value(i, j)),
                )
                for side, lhs, rhs in triangle_candidates:
                    key = (i, j, k, side)
                    if lhs <= rhs and key not in added_triangles:
                        if side == 0:
                            constraint = (
                                self.d(i, j) + self.d(j, k) > self.d(i, k)
                            )
                        elif side == 1:
                            constraint = (
                                self.d(i, j) + self.d(i, k) > self.d(j, k)
                            )
                        else:
                            constraint = (
                                self.d(i, k) + self.d(j, k) > self.d(i, j)
                            )
                        violated.append(("strict_triangle", key, constraint))
                        if len(violated) >= self.SEPARATION_BATCH:
                            break
                if len(violated) >= self.SEPARATION_BATCH:
                    break
                if self._expired():
                    self._reason_unknown = "quotient triangle separation timeout"
                    self._last_status = z3.unknown
                    return z3.unknown

            for a, b, c, d in itertools.combinations(range(self.q), 4):
                if len(violated) >= self.SEPARATION_BATCH:
                    break
                diagonal = value(a, c) + value(b, d)
                candidates = (
                    (0, value(a, b) + value(c, d)),
                    (1, value(a, d) + value(b, c)),
                )
                for side, lhs in candidates:
                    key = (a, b, c, d, side)
                    if lhs >= diagonal and key not in added_kalmanson:
                        if side == 0:
                            constraint = (
                                self.d(a, b) + self.d(c, d)
                                < self.d(a, c) + self.d(b, d)
                            )
                        else:
                            constraint = (
                                self.d(a, d) + self.d(b, c)
                                < self.d(a, c) + self.d(b, d)
                            )
                        violated.append(("strict_kalmanson", key, constraint))
                        if len(violated) >= self.SEPARATION_BATCH:
                            break
                if len(violated) >= self.SEPARATION_BATCH:
                    break
                if self._expired():
                    self._reason_unknown = "quotient Kalmanson separation timeout"
                    self._last_status = z3.unknown
                    return z3.unknown

            self.counts["separation_rounds"] += 1
            if not violated:
                candidate = self._generic_candidate(values)
                if candidate is None:
                    if not self._reason_unknown:
                        self._reason_unknown = (
                            "failed exact generic-disequality perturbation replay"
                        )
                    self._last_status = z3.unknown
                    return z3.unknown
                self._model = model
                self._candidate = candidate
                self._last_status = z3.sat
                return z3.sat
            for block, key, constraint in violated:
                if block == "strict_triangle":
                    outer_literals = self._triangle_justification(
                        key[0], key[1], key[2]
                    )
                else:
                    outer_literals = self._kalmanson_justification(
                        key[0], key[1], key[2], key[3]
                    )
                self._track_relation(
                    block,
                    tuple(key),
                    constraint,
                    outer_literals,
                )
                self.counts[block] += 1
                if block == "strict_triangle":
                    added_triangles.add(key)  # type: ignore[arg-type]
                else:
                    added_kalmanson.add(key)  # type: ignore[arg-type]

    def initial_relation_core(self) -> list[QuotientRelation]:
        if self._last_status != z3.unsat:
            raise RuntimeError("quotient relation core requested before UNSAT")
        return [
            self.relation_for_token[token.decl().name()]
            for token in self.solver.unsat_core()
        ]

    def check_relations(
        self,
        relations: list[QuotientRelation],
    ) -> z3.CheckSatResult:
        return self.solver.check(
            *(self.relation_token[relation.identifier] for relation in relations)
        )

    def core_alone_check(
        self,
        relations: list[QuotientRelation],
        *,
        timeout_ms: int,
    ) -> z3.CheckSatResult:
        """Replay exactly the selected quotient relations plus normalization."""
        solver = z3.SolverFor("QF_LRA")
        solver.set(timeout=timeout_ms)
        solver.add(self.d("a0", "a1") == 1)
        solver.add(*(relation.constraint for relation in relations))
        return solver.check()

    def outer_literals_for_relations(
        self,
        relations: list[QuotientRelation],
    ) -> list[Literal]:
        literals = list(
            self._dedup_literals(
                literal
                for relation in relations
                for literal in relation.outer_literals
            )
        )
        if not literals or any(
            literal not in self.selected_set for literal in literals
        ):
            raise AssertionError(
                "quotient relation core has no selected outer translation"
            )
        return literals

    def reason_unknown(self) -> str:
        return self._reason_unknown or self.solver.reason_unknown()

    def metric_sample(self) -> dict[str, str]:
        if self._candidate is None:
            raise RuntimeError("metric sample requested before quotient SAT")

        def candidate_value(left: str, right: str) -> Fraction:
            i = self.class_of[self.outer.ix(left)]
            j = self.class_of[self.outer.ix(right)]
            if i == j:
                return Fraction(0)
            return self._candidate[min(i, j), max(i, j)]

        sample_pairs = (
            ("a0", "a1"), ("a0", "p1"), ("a0", "r1"),
            ("b1", "p1"), ("b2", "r1"), ("b2", "q"), ("b2", "other"),
        )
        return {
            f"d({left},{right})": str(candidate_value(left, right))
            for left, right in sample_pairs
        }


class InnerMetricCheck:
    """One frozen quotient/order checked in QF_LRA under named assumptions."""

    def __init__(
        self,
        outer: OuterMap,
        outer_model: z3.ModelRef,
        *,
        timeout_ms: int,
        iteration: int,
        extra_literals: Iterable[Literal] = (),
    ) -> None:
        self.outer = outer
        self.outer_model = outer_model
        self.solver = z3.SolverFor("QF_LRA")
        self.solver.set(timeout=timeout_ms, unsat_core=True)
        self.distance = {
            (i, j): z3.Real(f"inner_{iteration}_d_{outer.names[i]}_{outer.names[j]}")
            for i in range(outer.n) for j in range(i + 1, outer.n)
        }
        self.selected, self.alias_lits, self.order_lits = outer.selected_literals(
            outer_model,
            extra_literals,
        )
        self.token_for: dict[Literal, z3.BoolRef] = {}
        self.literal_for_token: dict[str, Literal] = {}
        self.counts: Counter[str] = Counter()
        self._make_tokens(iteration)
        self._add_frozen_assignments()
        self._add_metric_geometry()

    def d(self, left: int | str, right: int | str) -> z3.ArithRef:
        i = self.outer.ix(left) if isinstance(left, str) else left
        j = self.outer.ix(right) if isinstance(right, str) else right
        if i == j:
            return z3.RealVal(0)
        return self.distance[min(i, j), max(i, j)]

    def _make_tokens(self, iteration: int) -> None:
        for number, literal in enumerate(self.selected):
            token = z3.Bool(f"assume_{iteration}_{number}")
            self.token_for[literal] = token
            self.literal_for_token[token.decl().name()] = literal

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def _add_frozen_assignments(self) -> None:
        for literal in self.selected:
            token = self.token_for[literal]
            if literal.kind == "alias":
                left_name, right_name, equal = literal.args
                left = self.outer.ix(str(left_name))
                right = self.outer.ix(str(right_name))
                if bool(equal):
                    constraints = [self.d(left, right) == 0]
                    constraints.extend(
                        self.d(left, k) == self.d(right, k)
                        for k in range(self.outer.n)
                        if k != left and k != right
                    )
                    self.add(
                        "tracked_alias_equal",
                        z3.Implies(token, z3.And(*constraints)),
                    )
                else:
                    self.add(
                        "tracked_alias_distinct",
                        z3.Implies(token, self.d(left, right) > 0),
                    )
            elif literal.kind == "row":
                center, left, right, equal = literal.args
                equation = self.d(str(center), str(left)) == self.d(
                    str(center), str(right)
                )
                self.add(
                    "tracked_row_incidence",
                    z3.Implies(token, equation if bool(equal) else z3.Not(equation)),
                )
            elif literal.kind != "order":
                raise AssertionError(literal.kind)

        # Homogeneous normalization, matching model.py.
        self.add("scale", self.d("a0", "a1") == 1)

    def _neq_token(self, i: int, j: int) -> z3.BoolRef:
        key = (min(i, j), max(i, j))
        literal = self.alias_lits[key]
        if bool(literal.args[2]):
            raise AssertionError("distinctness token requested for an alias pair")
        return self.token_for[literal]

    def _order_token(self, left: int, right: int) -> z3.BoolRef:
        literal = self.order_lits[left, right]
        return self.token_for[literal]

    def _add_metric_geometry(self) -> None:
        rank_values = [
            self.outer_model.eval(rank, model_completion=True).as_long()
            for rank in self.outer.rank
        ]
        for i, j, k in itertools.combinations(range(self.outer.n), 3):
            if len({rank_values[i], rank_values[j], rank_values[k]}) != 3:
                continue
            guard = z3.And(
                self._neq_token(i, j),
                self._neq_token(i, k),
                self._neq_token(j, k),
            )
            self.add(
                "strict_triangle",
                z3.Implies(guard, self.d(i, j) + self.d(j, k) > self.d(i, k)),
                z3.Implies(guard, self.d(i, j) + self.d(i, k) > self.d(j, k)),
                z3.Implies(guard, self.d(i, k) + self.d(j, k) > self.d(i, j)),
            )

        for quad in itertools.combinations(range(self.outer.n), 4):
            if len({rank_values[i] for i in quad}) != 4:
                continue
            a, b, c, d = sorted(quad, key=rank_values.__getitem__)
            guard = z3.And(
                self._order_token(a, b),
                self._order_token(b, c),
                self._order_token(c, d),
            )
            diagonal_sum = self.d(a, c) + self.d(b, d)
            self.add(
                "strict_kalmanson",
                z3.Implies(guard, self.d(a, b) + self.d(c, d) < diagonal_sum),
                z3.Implies(guard, self.d(a, d) + self.d(b, c) < diagonal_sum),
            )

    def check(self) -> z3.CheckSatResult:
        return self.solver.check(*self.token_for.values())

    def core_literals(self) -> list[Literal]:
        core = self.solver.unsat_core()
        return [self.literal_for_token[token.decl().name()] for token in core]

    def check_literals(self, literals: list[Literal]) -> z3.CheckSatResult:
        return self.solver.check(*(self.token_for[literal] for literal in literals))

    def metric_sample(self) -> dict[str, str]:
        model = self.solver.model()
        sample_pairs = (
            ("a0", "a1"), ("a0", "p1"), ("a0", "r1"),
            ("b1", "p1"), ("b2", "r1"), ("b2", "q"), ("b2", "other"),
        )
        return {
            f"d({left},{right})": str(
                model.eval(self.d(left, right), model_completion=True)
            )
            for left, right in sample_pairs
        }


def shrink_core(
    checker: InnerMetricCheck,
    core: list[Literal],
    *,
    max_checks: int,
    deadline: float | None,
) -> tuple[list[Literal], int, int]:
    """Greedy sound shrink; UNKNOWN merely keeps the tested literal."""
    kept = list(core)
    checks = 0
    unknowns = 0
    cursor = 0
    while cursor < len(kept) and checks < max_checks:
        if deadline is not None and time.monotonic() >= deadline:
            break
        trial = kept[:cursor] + kept[cursor + 1 :]
        result = checker.check_literals(trial)
        checks += 1
        if result == z3.unsat:
            kept = trial
        else:
            if result == z3.unknown:
                unknowns += 1
            cursor += 1
    return kept, checks, unknowns


def shrink_quotient_relation_core(
    checker: QuotientMetricCheck,
    core: list[QuotientRelation],
    *,
    max_checks: int,
    deadline: float | None,
) -> tuple[list[QuotientRelation], int, int]:
    """Greedy relation-core shrink; UNKNOWN keeps the tested relation."""
    kept = list(core)
    checks = 0
    unknowns = 0
    cursor = 0
    while cursor < len(kept) and checks < max_checks:
        if deadline is not None and time.monotonic() >= deadline:
            break
        trial = kept[:cursor] + kept[cursor + 1 :]
        result = checker.check_relations(trial)
        checks += 1
        if result == z3.unsat:
            kept = trial
        else:
            if result == z3.unknown:
                unknowns += 1
            cursor += 1
    return kept, checks, unknowns


def checkpoint_metadata(args: argparse.Namespace, outer: OuterMap) -> dict[str, object]:
    return {
        "schema": SCHEMA,
        "implementation_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "z_branch": args.z_branch,
        "escape_arm": args.escape_arm,
        "global_tier": args.global_tier,
        "cover_points": list(outer.minimal_cover_witnesses),
        "global_k4_centers": list(outer.global_k4_supports),
        "rich_apices": list(outer.rich_witnesses),
        "robust_deletions": list(outer.robust_survival_supports),
        "outer_only": args.outer_only,
        "named_occurrences": outer.n,
        "original_named_occurrences": len(outer.original_names),
        "original_names": list(outer.original_names),
        "names": list(outer.names),
    }


def write_json_atomic(path: Path, payload: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def load_checkpoint(
    path: Path,
    expected_metadata: dict[str, object],
    names: tuple[str, ...],
) -> list[list[Literal]]:
    raw = json.loads(path.read_text())
    if not isinstance(raw, dict) or raw.get("metadata") != expected_metadata:
        raise ValueError("checkpoint metadata does not match this run")
    raw_cuts = raw.get("cuts")
    if not isinstance(raw_cuts, list):
        raise ValueError("checkpoint cuts must be a list")
    cuts: list[list[Literal]] = []
    seen: set[frozenset[Literal]] = set()
    for raw_core in raw_cuts:
        if not isinstance(raw_core, list) or not raw_core:
            raise ValueError("checkpoint core must be a nonempty list")
        core = [Literal.from_json(value) for value in raw_core]
        for literal in core:
            literal.validate(names)
        key = frozenset(core)
        if key in seen:
            raise ValueError("checkpoint contains a duplicate cut")
        seen.add(key)
        cuts.append(core)
    return cuts


def four_point_kalmanson_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str] | None:
    """Recognize a direct four-point Kalmanson core in any literal order."""
    if len(core) != 5 or len(set(core)) != 5:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 3 or len(rows) != 2:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 4 or len(set(chain)) != 4:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    a, b, c, d = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_patterns = (
        {
            (a, frozenset((c, d))),
            (b, frozenset((c, d))),
        },
        {
            (c, frozenset((a, b))),
            (d, frozenset((a, b))),
        },
        {
            (a, frozenset((b, c))),
            (d, frozenset((b, c))),
        },
        {
            (b, frozenset((a, d))),
            (c, frozenset((a, d))),
        },
    )
    return (a, b, c, d) if actual_rows in expected_patterns else None


def five_point_euclidean_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str] | None:
    """Recognize a direct five-point core, independently of literal order."""
    if len(core) != 7 or len(set(core)) != 7:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 4 or len(rows) != 3:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 5 or len(set(chain)) != 5:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    a, b, c, d, e = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (b, frozenset((a, e))),
        (c, frozenset((a, b))),
        (c, frozenset((a, d))),
    }
    second_expected_rows = {
        (d, frozenset((a, c))),
        (d, frozenset((c, e))),
        (e, frozenset((a, b))),
    }
    return (
        (a, b, c, d, e)
        if actual_rows in (expected_rows, second_expected_rows)
        else None
    )


def reversed_second_five_point_euclidean_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str] | None:
    """Recognize the reversed second five-point core in any literal order."""
    if len(core) != 7 or len(set(core)) != 7:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 4 or len(rows) != 3:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 5 or len(set(chain)) != 5:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    p0, p1, p2, p3, p4 = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (p1, frozenset((p0, p2))),
        (p1, frozenset((p2, p4))),
        (p0, frozenset((p3, p4))),
    }
    return (p0, p1, p2, p3, p4) if actual_rows == expected_rows else None


def circle_isosceles_five_point_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str] | None:
    """Recognize the circle-isosceles five-point core in any literal order."""
    if len(core) != 7 or len(set(core)) != 7:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 4 or len(rows) != 3:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 5 or len(set(chain)) != 5:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    w, f, p, x, z = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (w, frozenset((f, x))),
        (w, frozenset((f, z))),
        (z, frozenset((p, x))),
    }
    return (w, f, p, x, z) if actual_rows == expected_rows else None


def six_point_euclidean_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str, str] | None:
    """Recognize the direct six-point core, independently of literal order."""
    if len(core) != 10 or len(set(core)) != 10:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 5 or len(rows) != 5:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 6 or len(set(chain)) != 6:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    a, b, c, d, e, f = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (a, frozenset((b, f))),
        (a, frozenset((d, f))),
        (d, frozenset((a, b))),
        (c, frozenset((b, e))),
        (c, frozenset((d, e))),
    }
    return (a, b, c, d, e, f) if actual_rows == expected_rows else None


def sparse_six_point_euclidean_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str, str] | None:
    """Recognize the sparse six-point core, independently of literal order."""
    if len(core) != 9 or len(set(core)) != 9:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 5 or len(rows) != 4:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 6 or len(set(chain)) != 6:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    a, b, c, d, e, f = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (a, frozenset((b, f))),
        (a, frozenset((d, f))),
        (c, frozenset((b, e))),
        (c, frozenset((d, e))),
    }
    return (a, b, c, d, e, f) if actual_rows == expected_rows else None


def mirror_interleaving_six_point_euclidean_core_points(
    core: list[Literal],
) -> tuple[str, str, str, str, str, str] | None:
    """Recognize the mirror-interleaving six-point core in any literal order."""
    if len(core) != 10 or len(set(core)) != 10:
        return None
    orders = [literal for literal in core if literal.kind == "order"]
    rows = [literal for literal in core if literal.kind == "row"]
    if len(orders) != 5 or len(rows) != 5:
        return None

    successor: dict[str, str] = {}
    predecessor: dict[str, str] = {}
    for literal in orders:
        left, right = map(str, literal.args)
        if left in successor or right in predecessor:
            return None
        successor[left] = right
        predecessor[right] = left
    starts = set(successor) - set(predecessor)
    if len(starts) != 1:
        return None
    chain = [starts.pop()]
    while chain[-1] in successor:
        chain.append(successor[chain[-1]])
    if len(chain) != 6 or len(set(chain)) != 6:
        return None
    if set(successor) | set(predecessor) != set(chain):
        return None
    a, b, c, d, e, f = chain

    actual_rows: set[tuple[str, frozenset[str]]] = set()
    for literal in rows:
        center, left, right, equal = literal.args
        if type(equal) is not bool or not equal:
            return None
        actual_rows.add(
            (str(center), frozenset((str(left), str(right))))
        )
    expected_rows = {
        (a, frozenset((b, f))),
        (a, frozenset((c, e))),
        (d, frozenset((a, c))),
        (d, frozenset((a, e))),
        (e, frozenset((b, f))),
    }
    return (a, b, c, d, e, f) if actual_rows == expected_rows else None


def revalidate_checkpoint_cuts(
    outer: OuterMap,
    cuts: list[list[Literal]],
    *,
    timeout_ms: int,
    deadline: float,
) -> tuple[int, int, int, int, int, int, int, int, int]:
    """Replay or syntactically re-prove every loaded cut.

    The direct four-point Kalmanson and five- and six-point Euclidean schemas
    are recognized against their proved universal forms.  The latter two are
    stronger than strict Kalmanson metric geometry, so they deliberately have
    no INNER-UNSAT replay.
    """
    metric_unsat = 0
    four_point_kalmanson = 0
    five_point_euclidean = 0
    reversed_second_five_point_euclidean = 0
    circle_isosceles_five_point = 0
    six_point_euclidean = 0
    sparse_six_point_euclidean = 0
    mirror_interleaving_six_point_euclidean = 0
    outer_redundant = 0
    for number, core in enumerate(cuts):
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            raise ValueError("wall budget expired while validating checkpoint")
        if four_point_kalmanson_core_points(core) is not None:
            four_point_kalmanson += 1
            continue
        if five_point_euclidean_core_points(core) is not None:
            five_point_euclidean += 1
            continue
        if reversed_second_five_point_euclidean_core_points(core) is not None:
            reversed_second_five_point_euclidean += 1
            continue
        if circle_isosceles_five_point_core_points(core) is not None:
            circle_isosceles_five_point += 1
            continue
        if six_point_euclidean_core_points(core) is not None:
            six_point_euclidean += 1
            continue
        if sparse_six_point_euclidean_core_points(core) is not None:
            sparse_six_point_euclidean += 1
            continue
        if mirror_interleaving_six_point_euclidean_core_points(core) is not None:
            mirror_interleaving_six_point_euclidean += 1
            continue
        outer.solver.set(timeout=min(timeout_ms, remaining_ms))
        assumptions = [outer.literal_expr(literal) for literal in core]
        outer_status = outer.solver.check(*assumptions)
        if outer_status == z3.unsat:
            outer_redundant += 1
            continue
        if outer_status == z3.unknown:
            raise ValueError(
                f"checkpoint core {number} outer validation returned UNKNOWN: "
                f"{outer.solver.reason_unknown()}"
            )
        outer_model = outer.solver.model()
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            raise ValueError("wall budget expired while validating checkpoint")
        checker = InnerMetricCheck(
            outer,
            outer_model,
            timeout_ms=min(timeout_ms, remaining_ms),
            iteration=10_000_000 + number,
            extra_literals=core,
        )
        if not all(literal in checker.token_for for literal in core):
            raise ValueError(
                f"checkpoint core {number} is not selected by its outer witness"
            )
        inner_status = checker.check_literals(core)
        if inner_status != z3.unsat:
            detail = (
                checker.solver.reason_unknown()
                if inner_status == z3.unknown
                else "core has a metric survivor"
            )
            raise ValueError(
                f"checkpoint core {number} failed INNER-UNSAT replay: {detail}"
            )
        metric_unsat += 1
    return (
        metric_unsat,
        four_point_kalmanson,
        five_point_euclidean,
        reversed_second_five_point_euclidean,
        circle_isosceles_five_point,
        six_point_euclidean,
        sparse_six_point_euclidean,
        mirror_interleaving_six_point_euclidean,
        outer_redundant,
    )


def checkpoint_payload(
    metadata: dict[str, object],
    cuts: list[list[Literal]],
    stats: Counter[str],
) -> dict[str, object]:
    return {
        "metadata": metadata,
        "cuts": [[literal.to_json() for literal in core] for core in cuts],
        "stats": dict(sorted(stats.items())),
    }


def smoke_test() -> None:
    solver = z3.SolverFor("QF_LRA")
    x, y, diagonal = z3.Reals("cegar_smoke_x cegar_smoke_y cegar_smoke_d")
    solver.add(x == 1, y == 1, diagonal == 2, x + y > diagonal)
    if solver.check() != z3.unsat:
        raise RuntimeError("strict-triangle LRA smoke test failed")

    # Exact normalized-coordinate replay of the direct five-point lemma.
    h5, x5, y5, u5, v5 = z3.Reals(
        "cegar_five_h cegar_five_x cegar_five_y "
        "cegar_five_u cegar_five_v"
    )
    five_solver = z3.SolverFor("QF_NRA")
    five_solver.add(
        y5 > 0,
        v5 > 0,
        x5 * x5 - x5 + y5 * y5 - 2 * h5 * y5 == 0,
        -y5 / 2 - h5 * (x5 - 1) > 0,
        (u5 - 1) * (u5 - 1) + v5 * v5 == 1,
        x5 * v5 - u5 * y5 > 0,
    )
    if five_solver.check() != z3.unsat:
        raise RuntimeError("five-point Euclidean NRA smoke test failed")

    # An UNSAT assumption core must remain UNSAT and negate the chosen map point.
    p, q = z3.Bools("cegar_smoke_p cegar_smoke_q")
    core_solver = z3.SolverFor("QF_LRA")
    core_solver.add(z3.Implies(p, x == 0), z3.Implies(q, x > 0))
    if core_solver.check(p, q) != z3.unsat or set(core_solver.unsat_core()) != {p, q}:
        raise RuntimeError("assumption-core smoke test failed")

    class SmokeQuotientOuter:
        names = ("a0", "a1", "a2")
        n = len(names)
        index = {name: i for i, name in enumerate(names)}
        rank = z3.Ints("cegar_smoke_rank0 cegar_smoke_rank1 cegar_smoke_rank2")
        row = z3.Bool("cegar_smoke_false_row")
        required_rows = frozenset({("a0", "a1", "a2")})
        rows = {("a0", "a1", "a2"): row}

        def ix(self, name: str) -> int:
            return self.index[name]

        def selected_literals(
            self,
            model: z3.ModelRef,
            extra_literals: Iterable[Literal] = (),
        ) -> tuple[
            list[Literal],
            dict[tuple[int, int], Literal],
            dict[tuple[int, int], Literal],
        ]:
            return OuterMap.selected_literals(self, model, extra_literals)

    smoke_outer = SmokeQuotientOuter()
    smoke_outer_solver = z3.Solver()
    smoke_outer_solver.add(
        *(rank == i for i, rank in enumerate(smoke_outer.rank)),
        z3.Not(smoke_outer.row),
    )
    if smoke_outer_solver.check() != z3.sat:
        raise RuntimeError("quotient SAT smoke outer model was not SAT")
    quotient_sat_checker = QuotientMetricCheck(
        smoke_outer,  # type: ignore[arg-type]
        smoke_outer_solver.model(),
        timeout_ms=30_000,
        iteration=99_999_997,
    )
    if quotient_sat_checker.check() != z3.sat:
        raise RuntimeError("generic-disequality quotient smoke model was not SAT")

    robust_projection = OuterMap(
        timeout_ms=1,
        random_seed=0,
        z_branch="new",
        escape_arm="robust",
        global_tier="local",
    )
    if set(robust_projection.robust_survival_supports) != set(
        robust_projection.original_names
    ):
        raise RuntimeError("robust survival did not cover the original snapshot")
    if (
        robust_projection.robust_survival_supports["escape"]
        != ROBUST_ESCAPE_SUPPORT
    ):
        raise RuntimeError("robust escape deletion did not use the er support")
    if any(
        point in robust_projection.original_names
        for support in robust_projection.robust_survival_supports.values()
        for point in support
    ):
        raise RuntimeError("robust survival witnesses entered the original snapshot")
    if robust_projection.counts["robust_retained_escape_selected4"] != 1:
        raise RuntimeError("robust arm lost its producer-supplied selected row")
    if (
        robust_projection.counts["robust_survives_original_named_deletion"]
        != len(robust_projection.original_names)
    ):
        raise RuntimeError("robust survival projection is not pointwise")
    if robust_projection.counts["critical_escape_exact4"]:
        raise RuntimeError("robust escape row was incorrectly made exact")
    robust_projection.solver.push()
    robust_projection.solver.add(
        robust_projection.same(ROBUST_ESCAPE_SUPPORT[0], "escape")
    )
    if robust_projection.solver.check() != z3.unsat:
        raise RuntimeError("robust deletion-of-escape row can reuse escape")
    robust_projection.solver.pop()

    full_projection = OuterMap(
        timeout_ms=1,
        random_seed=0,
        z_branch="new",
        escape_arm="critical",
        global_tier="full",
    )
    if set(full_projection.minimal_cover_witnesses) != set(
        full_projection.original_names
    ):
        raise RuntimeError("full minimality cover missed an original named point")
    supplied_centers = {
        "a0", "a1", "a2", "b1", "b2", "bs", "bz", "be",
    }
    if set(full_projection.global_k4_supports) != (
        set(full_projection.original_names) - supplied_centers
    ):
        raise RuntimeError("full global K4 center census is incorrect")
    if set(full_projection.rich_witnesses) != {"a1", "a2"}:
        raise RuntimeError("full rich-class witness census is incorrect")
    if (
        full_projection.counts["minimality_original_named_unique4_cover"]
        != len(full_projection.original_names)
        or full_projection.counts["global_k4_at_original_named_center"]
        != len(full_projection.global_k4_supports)
        or full_projection.counts["rich_class_selected_six_or_two_selected_four"]
        != 2
    ):
        raise RuntimeError("full quantified projection counts are incomplete")
    if SCHEMA != (
        "p97-aligned-singleton-induced-metric-cegar-v17-mirror-interleaving-six-point-schema"
    ):
        raise RuntimeError("stale checkpoint schema was not invalidated")

    outer = OuterMap(
        timeout_ms=30_000,
        random_seed=0,
        z_branch="new",
        escape_arm="critical",
        global_tier="local",
    )
    if outer.counts["critical_escape_exact4"] != 1:
        raise RuntimeError("critical arm did not retain exactly one exact4 row")
    if outer.counts["critical_escape_unique4"]:
        raise RuntimeError("critical escape row was incorrectly made unique")
    if outer.counts["critical_escape_center_not_robust_apices"]:
        raise RuntimeError("critical escape center was wrongly excluded from apices")
    if (
        outer.counts["aligned_first_apex_k4_classification"]
        != len(outer.original_names)
        or outer.counts["cross_retained_deletion_bound"]
        != len(outer.original_names)
    ):
        raise RuntimeError("local original-snapshot projection is incomplete")
    outer.solver.push()
    critical_support = ("escape", "e2", "e3", "e4")
    outer.solver.add(
        outer.distinct(("be", *critical_support, "a1")),
        outer.roweq("be", "a1", "escape"),
    )
    if outer.solver.check() != z3.unsat:
        raise RuntimeError("critical exact4 row admitted a named fifth point")
    outer.solver.pop()
    if outer.solver.check() != z3.sat:
        raise RuntimeError("direct-core outer smoke model was not SAT")
    outer_model = outer.solver.model()
    direct_cores = outer.direct_four_point_kalmanson_cores(outer_model, limit=64)
    if not direct_cores:
        raise RuntimeError("direct four-point Kalmanson core was not found")
    if len({frozenset(core) for core in direct_cores}) != len(direct_cores):
        raise RuntimeError("direct four-point Kalmanson batch contains duplicates")
    if any(len(core) != 5 or len(set(core)) != 5 for core in direct_cores):
        raise RuntimeError("direct four-point Kalmanson core is not five-literal")
    if not all(
        z3.is_true(
            outer_model.eval(outer.literal_expr(literal), model_completion=True)
        )
        for core in direct_cores
        for literal in core
    ):
        raise RuntimeError("direct four-point Kalmanson batch is not selected")
    direct_core = direct_cores[0]
    for literal in direct_core:
        outer.literal_expr(literal)
    quotient_checker = QuotientMetricCheck(
        outer,
        outer_model,
        timeout_ms=30_000,
        iteration=99_999_998,
    )
    if quotient_checker.check() != z3.unsat:
        raise RuntimeError("exact quotient metric smoke model was not UNSAT")
    relation_core = quotient_checker.initial_relation_core()
    if not relation_core:
        raise RuntimeError("quotient relation smoke core was empty")
    relation_core, _, _ = shrink_quotient_relation_core(
        quotient_checker,
        relation_core,
        max_checks=128,
        deadline=None,
    )
    if quotient_checker.core_alone_check(
        relation_core, timeout_ms=30_000
    ) != z3.unsat:
        raise RuntimeError("quotient relation smoke core did not replay alone")
    translated_core = quotient_checker.outer_literals_for_relations(
        relation_core
    )
    if not all(literal in quotient_checker.selected_set for literal in translated_core):
        raise RuntimeError("quotient relation smoke core was not selected")
    translated_checker = InnerMetricCheck(
        outer,
        outer_model,
        timeout_ms=30_000,
        iteration=99_999_996,
        extra_literals=translated_core,
    )
    if translated_checker.check_literals(translated_core) != z3.unsat:
        raise RuntimeError("translated quotient relation core did not replay UNSAT")
    checker = InnerMetricCheck(
        outer,
        outer_model,
        timeout_ms=30_000,
        iteration=99_999_999,
        extra_literals=direct_core,
    )
    if checker.check_literals(direct_core) != z3.unsat:
        raise RuntimeError("direct four-point Kalmanson core did not replay UNSAT")

    class SmokeFivePointOuter:
        names = ("a", "b", "c", "d", "e")
        n = len(names)
        index = {name: i for i, name in enumerate(names)}
        rank = z3.Ints(
            "cegar_five_rank_a cegar_five_rank_b cegar_five_rank_c "
            "cegar_five_rank_d cegar_five_rank_e"
        )
        edge_class = {
            (i, j): z3.Int(f"cegar_five_edge_{i}_{j}")
            for i in range(5) for j in range(i + 1, 5)
        }

        def ix(self, name: str) -> int:
            return self.index[name]

    five_outer = SmokeFivePointOuter()
    five_outer_solver = z3.Solver()
    five_edge_values = {
        edge_key: 10 + number
        for number, edge_key in enumerate(five_outer.edge_class)
    }
    five_edge_values.update(
        {
            (0, 1): 1,
            (1, 4): 1,
            (0, 2): 2,
            (1, 2): 2,
            (2, 3): 2,
        }
    )
    five_outer_solver.add(
        *(rank == i for i, rank in enumerate(five_outer.rank)),
        *(
            five_outer.edge_class[edge_key] == value
            for edge_key, value in five_edge_values.items()
        ),
    )
    if five_outer_solver.check() != z3.sat:
        raise RuntimeError("five-point direct-core outer smoke model was not SAT")
    five_cores = OuterMap.direct_five_point_euclidean_cores(
        five_outer,  # type: ignore[arg-type]
        five_outer_solver.model(),
        limit=2,
    )
    expected_five_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("row", ("b", "a", "e", True)),
        Literal("row", ("c", "a", "b", True)),
        Literal("row", ("c", "a", "d", True)),
    }
    if len(five_cores) != 1 or set(five_cores[0]) != expected_five_core:
        raise RuntimeError("five-point Euclidean direct-core selection failed")
    if five_point_euclidean_core_points(five_cores[0]) != (
        "a", "b", "c", "d", "e",
    ):
        raise RuntimeError("five-point Euclidean direct-core recognition failed")
    malformed_five_core = list(five_cores[0])
    malformed_five_core[-1] = Literal("row", ("c", "b", "d", True))
    if five_point_euclidean_core_points(malformed_five_core) is not None:
        raise RuntimeError("malformed five-point Euclidean core was accepted")

    second_five_outer = SmokeFivePointOuter()
    second_five_solver = z3.Solver()
    second_five_edge_values = {
        edge_key: 20 + number
        for number, edge_key in enumerate(second_five_outer.edge_class)
    }
    second_five_edge_values.update(
        {
            (0, 3): 1,
            (2, 3): 1,
            (3, 4): 1,
            (0, 4): 2,
            (1, 4): 2,
        }
    )
    second_five_solver.add(
        *(rank == i for i, rank in enumerate(second_five_outer.rank)),
        *(
            second_five_outer.edge_class[edge_key] == value
            for edge_key, value in second_five_edge_values.items()
        ),
    )
    if second_five_solver.check() != z3.sat:
        raise RuntimeError("second five-point direct-core smoke model was not SAT")
    second_five_cores = OuterMap.direct_five_point_euclidean_cores(
        second_five_outer,  # type: ignore[arg-type]
        second_five_solver.model(),
        limit=2,
    )
    expected_second_five_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("row", ("d", "a", "c", True)),
        Literal("row", ("d", "c", "e", True)),
        Literal("row", ("e", "a", "b", True)),
    }
    if (
        len(second_five_cores) != 1
        or set(second_five_cores[0]) != expected_second_five_core
    ):
        raise RuntimeError(
            "second five-point Euclidean direct-core selection failed"
        )
    if five_point_euclidean_core_points(second_five_cores[0]) != (
        "a", "b", "c", "d", "e",
    ):
        raise RuntimeError(
            "second five-point Euclidean direct-core recognition failed"
        )

    reversed_second_five_outer = SmokeFivePointOuter()
    reversed_second_five_solver = z3.Solver()
    reversed_second_five_edge_values = {
        edge_key: 40 + number
        for number, edge_key in enumerate(
            reversed_second_five_outer.edge_class
        )
    }
    reversed_second_five_edge_values.update(
        {
            (0, 1): 1,
            (1, 2): 1,
            (1, 4): 1,
            (0, 3): 2,
            (0, 4): 2,
        }
    )
    reversed_second_five_solver.add(
        *(
            rank == i
            for i, rank in enumerate(reversed_second_five_outer.rank)
        ),
        *(
            reversed_second_five_outer.edge_class[edge_key] == value
            for edge_key, value in reversed_second_five_edge_values.items()
        ),
    )
    if reversed_second_five_solver.check() != z3.sat:
        raise RuntimeError(
            "reversed second five-point direct-core smoke model was not SAT"
        )
    reversed_second_five_cores = (
        OuterMap.direct_reversed_second_five_point_euclidean_cores(
            reversed_second_five_outer,  # type: ignore[arg-type]
            reversed_second_five_solver.model(),
            limit=2,
        )
    )
    expected_reversed_second_five_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("row", ("b", "a", "c", True)),
        Literal("row", ("b", "c", "e", True)),
        Literal("row", ("a", "d", "e", True)),
    }
    if (
        len(reversed_second_five_cores) != 1
        or set(reversed_second_five_cores[0])
        != expected_reversed_second_five_core
    ):
        raise RuntimeError(
            "reversed second five-point Euclidean direct-core selection failed"
        )
    if reversed_second_five_point_euclidean_core_points(
        reversed_second_five_cores[0]
    ) != ("a", "b", "c", "d", "e"):
        raise RuntimeError(
            "reversed second five-point Euclidean direct-core recognition failed"
        )
    if (
        five_point_euclidean_core_points(reversed_second_five_cores[0])
        is not None
        or reversed_second_five_point_euclidean_core_points(five_cores[0])
        is not None
        or reversed_second_five_point_euclidean_core_points(
            second_five_cores[0]
        )
        is not None
    ):
        raise RuntimeError("legacy and reversed five-point recognizers overlap")
    malformed_reversed_second_five_core = list(
        reversed_second_five_cores[0]
    )
    malformed_reversed_second_five_core[-1] = Literal(
        "row", ("a", "c", "e", True)
    )
    if (
        reversed_second_five_point_euclidean_core_points(
            malformed_reversed_second_five_core
        )
        is not None
    ):
        raise RuntimeError("malformed reversed five-point core was accepted")

    separated_reversed_second_five_solver = z3.Solver()
    separated_reversed_second_five_edge_values = dict(
        reversed_second_five_edge_values
    )
    separated_reversed_second_five_edge_values[(0, 4)] = 99
    separated_reversed_second_five_solver.add(
        *(
            rank == i
            for i, rank in enumerate(reversed_second_five_outer.rank)
        ),
        *(
            reversed_second_five_outer.edge_class[edge_key] == value
            for edge_key, value in separated_reversed_second_five_edge_values.items()
        ),
    )
    if (
        separated_reversed_second_five_solver.check() != z3.sat
        or OuterMap.direct_reversed_second_five_point_euclidean_cores(
            reversed_second_five_outer,  # type: ignore[arg-type]
            separated_reversed_second_five_solver.model(),
        )
    ):
        raise RuntimeError(
            "separated reversed five-point smoke model produced a cut"
        )

    circle_isosceles_five_outer = SmokeFivePointOuter()
    circle_isosceles_five_solver = z3.Solver()
    circle_isosceles_five_edge_values = {
        edge_key: 60 + number
        for number, edge_key in enumerate(
            circle_isosceles_five_outer.edge_class
        )
    }
    circle_isosceles_five_edge_values.update(
        {
            (0, 1): 1,
            (0, 3): 1,
            (0, 4): 1,
            (2, 4): 2,
            (3, 4): 2,
        }
    )
    circle_isosceles_five_solver.add(
        *(
            rank == i
            for i, rank in enumerate(circle_isosceles_five_outer.rank)
        ),
        *(
            circle_isosceles_five_outer.edge_class[edge_key] == value
            for edge_key, value in circle_isosceles_five_edge_values.items()
        ),
    )
    if circle_isosceles_five_solver.check() != z3.sat:
        raise RuntimeError(
            "circle-isosceles five-point direct-core smoke model was not SAT"
        )
    circle_isosceles_five_cores = (
        OuterMap.direct_circle_isosceles_five_point_cores(
            circle_isosceles_five_outer,  # type: ignore[arg-type]
            circle_isosceles_five_solver.model(),
            limit=2,
        )
    )
    expected_circle_isosceles_five_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("row", ("a", "b", "d", True)),
        Literal("row", ("a", "b", "e", True)),
        Literal("row", ("e", "c", "d", True)),
    }
    if (
        len(circle_isosceles_five_cores) != 1
        or set(circle_isosceles_five_cores[0])
        != expected_circle_isosceles_five_core
    ):
        raise RuntimeError(
            "circle-isosceles five-point direct-core selection failed"
        )
    if circle_isosceles_five_point_core_points(
        circle_isosceles_five_cores[0]
    ) != ("a", "b", "c", "d", "e"):
        raise RuntimeError(
            "circle-isosceles five-point direct-core recognition failed"
        )
    malformed_circle_isosceles_five_core = list(
        circle_isosceles_five_cores[0]
    )
    malformed_circle_isosceles_five_core[-1] = Literal(
        "row", ("e", "b", "d", True)
    )
    if (
        circle_isosceles_five_point_core_points(
            malformed_circle_isosceles_five_core
        )
        is not None
    ):
        raise RuntimeError(
            "malformed circle-isosceles five-point core was accepted"
        )
    if (
        five_point_euclidean_core_points(circle_isosceles_five_cores[0])
        is not None
        or reversed_second_five_point_euclidean_core_points(
            circle_isosceles_five_cores[0]
        )
        is not None
        or any(
            circle_isosceles_five_point_core_points(core) is not None
            for core in (
                five_cores[0],
                second_five_cores[0],
                reversed_second_five_cores[0],
            )
        )
    ):
        raise RuntimeError(
            "legacy and circle-isosceles five-point recognizers overlap"
        )
    separated_circle_isosceles_five_solver = z3.Solver()
    separated_circle_isosceles_five_edge_values = dict(
        circle_isosceles_five_edge_values
    )
    separated_circle_isosceles_five_edge_values[(0, 4)] = 99
    separated_circle_isosceles_five_solver.add(
        *(
            rank == i
            for i, rank in enumerate(circle_isosceles_five_outer.rank)
        ),
        *(
            circle_isosceles_five_outer.edge_class[edge_key] == value
            for edge_key, value in (
                separated_circle_isosceles_five_edge_values.items()
            )
        ),
    )
    if (
        separated_circle_isosceles_five_solver.check() != z3.sat
        or OuterMap.direct_circle_isosceles_five_point_cores(
            circle_isosceles_five_outer,  # type: ignore[arg-type]
            separated_circle_isosceles_five_solver.model(),
        )
    ):
        raise RuntimeError(
            "separated circle-isosceles five-point smoke model produced a cut"
        )

    class SmokeSixPointOuter:
        names = ("a", "b", "c", "d", "e", "f")
        n = len(names)
        index = {name: i for i, name in enumerate(names)}
        rank = z3.Ints(
            "cegar_six_rank_a cegar_six_rank_b cegar_six_rank_c "
            "cegar_six_rank_d cegar_six_rank_e cegar_six_rank_f"
        )
        edge_class = {
            (i, j): z3.Int(f"cegar_six_edge_{i}_{j}")
            for i in range(6) for j in range(i + 1, 6)
        }

        def ix(self, name: str) -> int:
            return self.index[name]

    six_outer = SmokeSixPointOuter()
    six_outer_solver = z3.Solver()
    six_edge_values = {
        edge_key: 30 + number
        for number, edge_key in enumerate(six_outer.edge_class)
    }
    six_edge_values.update(
        {
            (0, 1): 1,
            (0, 3): 1,
            (0, 5): 1,
            (1, 3): 1,
            (1, 2): 2,
            (2, 3): 2,
            (2, 4): 2,
        }
    )
    six_outer_solver.add(
        *(rank == i for i, rank in enumerate(six_outer.rank)),
        *(
            six_outer.edge_class[edge_key] == value
            for edge_key, value in six_edge_values.items()
        ),
    )
    if six_outer_solver.check() != z3.sat:
        raise RuntimeError("six-point direct-core outer smoke model was not SAT")
    six_cores = OuterMap.direct_sparse_six_point_euclidean_cores(
        six_outer,  # type: ignore[arg-type]
        six_outer_solver.model(),
        limit=2,
    )
    expected_six_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("order", ("e", "f")),
        Literal("row", ("a", "b", "f", True)),
        Literal("row", ("a", "d", "f", True)),
        Literal("row", ("c", "b", "e", True)),
        Literal("row", ("c", "d", "e", True)),
    }
    if len(six_cores) != 1 or set(six_cores[0]) != expected_six_core:
        raise RuntimeError("sparse six-point Euclidean direct-core selection failed")
    if sparse_six_point_euclidean_core_points(six_cores[0]) != (
        "a", "b", "c", "d", "e", "f",
    ):
        raise RuntimeError("sparse six-point Euclidean direct-core recognition failed")
    malformed_six_core = list(six_cores[0])
    malformed_six_core[-1] = Literal("row", ("c", "b", "d", True))
    if sparse_six_point_euclidean_core_points(malformed_six_core) is not None:
        raise RuntimeError("malformed sparse six-point Euclidean core was accepted")
    legacy_six_core = [
        *six_cores[0],
        Literal("row", ("d", "a", "b", True)),
    ]
    if (
        six_point_euclidean_core_points(legacy_six_core)
        != ("a", "b", "c", "d", "e", "f")
        or sparse_six_point_euclidean_core_points(legacy_six_core) is not None
        or six_point_euclidean_core_points(six_cores[0]) is not None
    ):
        raise RuntimeError("legacy and sparse six-point recognizers overlap")

    mirror_six_outer = SmokeSixPointOuter()
    mirror_six_outer_solver = z3.Solver()
    mirror_six_edge_values = {
        edge_key: 50 + number
        for number, edge_key in enumerate(mirror_six_outer.edge_class)
    }
    mirror_six_edge_values.update(
        {
            (0, 1): 1,
            (0, 5): 1,
            (0, 2): 2,
            (0, 4): 2,
            (0, 3): 3,
            (2, 3): 3,
            (3, 4): 3,
            (1, 4): 4,
            (4, 5): 4,
        }
    )
    mirror_six_outer_solver.add(
        *(rank == i for i, rank in enumerate(mirror_six_outer.rank)),
        *(
            mirror_six_outer.edge_class[edge_key] == value
            for edge_key, value in mirror_six_edge_values.items()
        ),
    )
    if mirror_six_outer_solver.check() != z3.sat:
        raise RuntimeError(
            "mirror-interleaving six-point outer smoke model was not SAT"
        )
    mirror_six_cores = (
        OuterMap.direct_mirror_interleaving_six_point_euclidean_cores(
            mirror_six_outer,  # type: ignore[arg-type]
            mirror_six_outer_solver.model(),
            limit=2,
        )
    )
    expected_mirror_six_core = {
        Literal("order", ("a", "b")),
        Literal("order", ("b", "c")),
        Literal("order", ("c", "d")),
        Literal("order", ("d", "e")),
        Literal("order", ("e", "f")),
        Literal("row", ("a", "b", "f", True)),
        Literal("row", ("a", "c", "e", True)),
        Literal("row", ("d", "a", "c", True)),
        Literal("row", ("d", "a", "e", True)),
        Literal("row", ("e", "b", "f", True)),
    }
    if (
        len(mirror_six_cores) != 1
        or set(mirror_six_cores[0]) != expected_mirror_six_core
    ):
        raise RuntimeError(
            "mirror-interleaving six-point Euclidean direct-core selection failed"
        )
    if mirror_interleaving_six_point_euclidean_core_points(
        mirror_six_cores[0]
    ) != ("a", "b", "c", "d", "e", "f"):
        raise RuntimeError(
            "mirror-interleaving six-point Euclidean recognition failed"
        )
    malformed_mirror_six_core = list(mirror_six_cores[0])
    malformed_mirror_six_core[-1] = Literal(
        "row", ("e", "b", "d", True)
    )
    if (
        mirror_interleaving_six_point_euclidean_core_points(
            malformed_mirror_six_core
        )
        is not None
    ):
        raise RuntimeError(
            "malformed mirror-interleaving six-point core was accepted"
        )
    if (
        six_point_euclidean_core_points(mirror_six_cores[0]) is not None
        or sparse_six_point_euclidean_core_points(mirror_six_cores[0])
        is not None
        or mirror_interleaving_six_point_euclidean_core_points(
            legacy_six_core
        )
        is not None
        or mirror_interleaving_six_point_euclidean_core_points(six_cores[0])
        is not None
    ):
        raise RuntimeError(
            "mirror-interleaving and earlier six-point recognizers overlap"
        )

    class SmokeCheckpointOuter:
        def __init__(self) -> None:
            self.solver = z3.Solver()
            self.atoms: dict[Literal, z3.BoolRef] = {}

        def literal_expr(self, literal: Literal) -> z3.BoolRef:
            return self.atoms.setdefault(
                literal,
                z3.Bool(f"cegar_checkpoint_atom_{len(self.atoms)}"),
            )

    checkpoint_counts = revalidate_checkpoint_cuts(
        SmokeCheckpointOuter(),  # type: ignore[arg-type]
        [
            direct_cores[0],
            five_cores[0],
            second_five_cores[0],
            reversed_second_five_cores[0],
            circle_isosceles_five_cores[0],
            legacy_six_core,
            six_cores[0],
            mirror_six_cores[0],
        ],
        timeout_ms=30_000,
        deadline=time.monotonic() + 30,
    )
    if checkpoint_counts != (0, 1, 2, 1, 1, 1, 1, 1, 0):
        raise RuntimeError(
            "direct Euclidean checkpoint counters were not independent"
        )

    # Pin the saved v13 survivor and confirm the new sparse schema cuts both
    # normalized rank-14/15 instances reported by the exact resolution lane.
    v13_survivor_path = Path(__file__).with_name(
        "cegar-v13-local-critical-reuse-second.json"
    )
    v13_payload = json.loads(v13_survivor_path.read_text())
    if (
        v13_payload.get("status") != "ALIVE"
        or v13_payload.get("schema")
        != "p97-aligned-singleton-induced-metric-cegar-v13-two-five-point-one-six-point-schema"
    ):
        raise RuntimeError("saved v13 survivor artifact has unexpected provenance")
    v13_survivor = v13_payload.get("survivor")
    if not isinstance(v13_survivor, dict):
        raise RuntimeError("saved v13 survivor artifact has no survivor")
    alias_classes = v13_survivor.get("alias_classes_in_order")
    row_assignment = v13_survivor.get("required_row_assignment")
    if not isinstance(alias_classes, list) or not isinstance(row_assignment, list):
        raise RuntimeError("saved v13 survivor artifact is malformed")

    saved_outer = OuterMap(
        timeout_ms=30_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="local",
    )
    saved_rank = {
        str(name): rank
        for rank, names_at_rank in enumerate(alias_classes)
        if isinstance(names_at_rank, list)
        for name in names_at_rank
    }
    if set(saved_rank) != set(saved_outer.names):
        raise RuntimeError("saved v13 survivor rank assignment has stale names")
    saved_outer.solver.add(
        *(
            saved_outer.rank[saved_outer.ix(name)]
            == z3.BitVecVal(rank, saved_outer.rank_width)
            for name, rank in saved_rank.items()
        )
    )
    for raw_literal in row_assignment:
        literal = Literal.from_json(raw_literal)
        if (
            literal.kind != "row"
            or len(literal.args) != 4
            or not all(
                isinstance(name, str) and name in saved_outer.index
                for name in literal.args[:3]
            )
            or type(literal.args[3]) is not bool
        ):
            raise RuntimeError("saved v13 survivor row assignment is malformed")
        saved_outer.solver.add(saved_outer.literal_expr(literal))
    if saved_outer.solver.check() != z3.sat:
        raise RuntimeError("saved v13 survivor did not replay in the outer map")
    saved_sparse_cores = saved_outer.direct_sparse_six_point_euclidean_cores(
        saved_outer.solver.model()
    )
    saved_sparse_points = {
        sparse_six_point_euclidean_core_points(core)
        for core in saved_sparse_cores
    }
    expected_saved_sparse_points = {
        ("a0", "r2", "b2", "r1", "t", "other"),
        ("a0", "r2", "b2", "r1", "z", "other"),
    }
    if not expected_saved_sparse_points <= saved_sparse_points:
        raise RuntimeError(
            "sparse six-point schema did not cut the saved v13 rank-14/15 survivor"
        )

    # Pin the saved v14 survivor and replay the newly proved reversed
    # five-point cut against its exact frozen outer assignment.
    v14_survivor_path = Path(__file__).with_name(
        "cegar-v14-local-critical-reuse-second.json"
    )
    v14_payload = json.loads(v14_survivor_path.read_text())
    if (
        v14_payload.get("status") != "ALIVE"
        or v14_payload.get("schema")
        != "p97-aligned-singleton-induced-metric-cegar-v14-two-five-point-one-sparse-six-point-schema"
    ):
        raise RuntimeError("saved v14 survivor artifact has unexpected provenance")
    v14_survivor = v14_payload.get("survivor")
    if not isinstance(v14_survivor, dict):
        raise RuntimeError("saved v14 survivor artifact has no survivor")
    v14_alias_classes = v14_survivor.get("alias_classes_in_order")
    v14_row_assignment = v14_survivor.get("required_row_assignment")
    if (
        not isinstance(v14_alias_classes, list)
        or not isinstance(v14_row_assignment, list)
    ):
        raise RuntimeError("saved v14 survivor artifact is malformed")

    saved_v14_outer = OuterMap(
        timeout_ms=30_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="local",
    )
    saved_v14_rank = {
        str(name): rank
        for rank, names_at_rank in enumerate(v14_alias_classes)
        if isinstance(names_at_rank, list)
        for name in names_at_rank
    }
    if set(saved_v14_rank) != set(saved_v14_outer.names):
        raise RuntimeError("saved v14 survivor rank assignment has stale names")
    saved_v14_outer.solver.add(
        *(
            saved_v14_outer.rank[saved_v14_outer.ix(name)]
            == z3.BitVecVal(rank, saved_v14_outer.rank_width)
            for name, rank in saved_v14_rank.items()
        )
    )
    for raw_literal in v14_row_assignment:
        literal = Literal.from_json(raw_literal)
        if (
            literal.kind != "row"
            or len(literal.args) != 4
            or not all(
                isinstance(name, str) and name in saved_v14_outer.index
                for name in literal.args[:3]
            )
            or type(literal.args[3]) is not bool
        ):
            raise RuntimeError("saved v14 survivor row assignment is malformed")
        saved_v14_outer.solver.add(saved_v14_outer.literal_expr(literal))
    if saved_v14_outer.solver.check() != z3.sat:
        raise RuntimeError("saved v14 survivor did not replay in the outer map")
    saved_v14_cores = (
        saved_v14_outer.direct_reversed_second_five_point_euclidean_cores(
            saved_v14_outer.solver.model()
        )
    )
    expected_saved_v14_points = ("bs", "z", "escape", "source", "a2")
    saved_v14_core = next(
        (
            core
            for core in saved_v14_cores
            if reversed_second_five_point_euclidean_core_points(core)
            == expected_saved_v14_points
        ),
        None,
    )
    if saved_v14_core is None:
        raise RuntimeError(
            "reversed five-point schema did not find the intended saved v14 core"
        )
    for literal in saved_v14_core:
        if saved_v14_outer.solver.check(
            z3.Not(saved_v14_outer.literal_expr(literal))
        ) != z3.unsat:
            raise RuntimeError(
                "saved v14 assignment did not entail every new cut literal"
            )
    saved_v14_outer.add_cut(saved_v14_core)
    if saved_v14_outer.solver.check() != z3.unsat:
        raise RuntimeError(
            "new five-point cut did not refute the frozen saved v14 assignment"
        )

    # Pin the saved v15 survivor and replay the circle-isosceles cut on the
    # exact globally indexed classes isolated by the exact subset miner.
    v15_survivor_path = Path(__file__).with_name(
        "cegar-v15-local-critical-reuse-second.json"
    )
    v15_payload = json.loads(v15_survivor_path.read_text())
    if (
        v15_payload.get("status") != "ALIVE"
        or v15_payload.get("schema")
        != "p97-aligned-singleton-induced-metric-cegar-v15-three-five-point-one-sparse-six-point-schema"
    ):
        raise RuntimeError("saved v15 survivor artifact has unexpected provenance")
    v15_survivor = v15_payload.get("survivor")
    if not isinstance(v15_survivor, dict):
        raise RuntimeError("saved v15 survivor artifact has no survivor")
    v15_alias_classes = v15_survivor.get("alias_classes_in_order")
    v15_row_assignment = v15_survivor.get("required_row_assignment")
    if (
        not isinstance(v15_alias_classes, list)
        or not isinstance(v15_row_assignment, list)
    ):
        raise RuntimeError("saved v15 survivor artifact is malformed")
    intended_v15_classes = {
        4: frozenset({"a0"}),
        6: frozenset({"r1", "z4", "y", "e3"}),
        9: frozenset({"source"}),
        10: frozenset({"r2", "b1", "s3", "z2"}),
        15: frozenset({"bs", "r4"}),
    }
    if (
        len(v15_alias_classes) <= max(intended_v15_classes)
        or any(
            not isinstance(v15_alias_classes[rank], list)
            or frozenset(map(str, v15_alias_classes[rank])) != expected
            for rank, expected in intended_v15_classes.items()
        )
    ):
        raise RuntimeError("saved v15 intended global classes are stale")

    saved_v15_outer = OuterMap(
        timeout_ms=30_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="local",
    )
    saved_v15_rank = {
        str(name): rank
        for rank, names_at_rank in enumerate(v15_alias_classes)
        if isinstance(names_at_rank, list)
        for name in names_at_rank
    }
    if set(saved_v15_rank) != set(saved_v15_outer.names):
        raise RuntimeError("saved v15 survivor rank assignment has stale names")
    saved_v15_outer.solver.add(
        *(
            saved_v15_outer.rank[saved_v15_outer.ix(name)]
            == z3.BitVecVal(rank, saved_v15_outer.rank_width)
            for name, rank in saved_v15_rank.items()
        )
    )
    for raw_literal in v15_row_assignment:
        literal = Literal.from_json(raw_literal)
        if (
            literal.kind != "row"
            or len(literal.args) != 4
            or not all(
                isinstance(name, str) and name in saved_v15_outer.index
                for name in literal.args[:3]
            )
            or type(literal.args[3]) is not bool
        ):
            raise RuntimeError("saved v15 survivor row assignment is malformed")
        saved_v15_outer.solver.add(saved_v15_outer.literal_expr(literal))
    if saved_v15_outer.solver.check() != z3.sat:
        raise RuntimeError("saved v15 survivor did not replay in the outer map")
    saved_v15_cores = saved_v15_outer.direct_circle_isosceles_five_point_cores(
        saved_v15_outer.solver.model()
    )
    expected_saved_v15_points = ("a0", "r1", "source", "r2", "bs")
    saved_v15_core = next(
        (
            core
            for core in saved_v15_cores
            if circle_isosceles_five_point_core_points(core)
            == expected_saved_v15_points
        ),
        None,
    )
    if saved_v15_core is None:
        raise RuntimeError(
            "circle-isosceles schema did not find the intended saved v15 core"
        )
    expected_saved_v15_core = {
        Literal("order", ("a0", "r1")),
        Literal("order", ("r1", "source")),
        Literal("order", ("source", "r2")),
        Literal("order", ("r2", "bs")),
        Literal("row", ("a0", "r1", "r2", True)),
        Literal("row", ("a0", "bs", "r1", True)),
        Literal("row", ("bs", "r2", "source", True)),
    }
    if set(saved_v15_core) != expected_saved_v15_core:
        raise RuntimeError("saved v15 circle-isosceles cut literals are stale")
    for literal in saved_v15_core:
        if saved_v15_outer.solver.check(
            z3.Not(saved_v15_outer.literal_expr(literal))
        ) != z3.unsat:
            raise RuntimeError(
                "saved v15 assignment did not entail every new cut literal"
            )
    saved_v15_outer.add_cut(saved_v15_core)
    if saved_v15_outer.solver.check() != z3.unsat:
        raise RuntimeError(
            "circle-isosceles cut did not refute the frozen saved v15 assignment"
        )

    # Pin the saved v16 survivor and replay the newly proved
    # mirror-interleaving six-point cut against its exact frozen assignment.
    v16_survivor_path = Path(__file__).with_name(
        "cegar-v16-local-critical-reuse-second.json"
    )
    v16_payload = json.loads(v16_survivor_path.read_text())
    if (
        v16_payload.get("status") != "ALIVE"
        or v16_payload.get("schema")
        != "p97-aligned-singleton-induced-metric-cegar-v16-four-five-point-one-sparse-six-point-schema"
    ):
        raise RuntimeError("saved v16 survivor artifact has unexpected provenance")
    v16_survivor = v16_payload.get("survivor")
    if not isinstance(v16_survivor, dict):
        raise RuntimeError("saved v16 survivor artifact has no survivor")
    v16_alias_classes = v16_survivor.get("alias_classes_in_order")
    v16_row_assignment = v16_survivor.get("required_row_assignment")
    if (
        not isinstance(v16_alias_classes, list)
        or not isinstance(v16_row_assignment, list)
    ):
        raise RuntimeError("saved v16 survivor artifact is malformed")

    saved_v16_outer = OuterMap(
        timeout_ms=30_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="local",
    )
    saved_v16_rank = {
        str(name): rank
        for rank, names_at_rank in enumerate(v16_alias_classes)
        if isinstance(names_at_rank, list)
        for name in names_at_rank
    }
    if set(saved_v16_rank) != set(saved_v16_outer.names):
        raise RuntimeError("saved v16 survivor rank assignment has stale names")
    saved_v16_outer.solver.add(
        *(
            saved_v16_outer.rank[saved_v16_outer.ix(name)]
            == z3.BitVecVal(rank, saved_v16_outer.rank_width)
            for name, rank in saved_v16_rank.items()
        )
    )
    for raw_literal in v16_row_assignment:
        literal = Literal.from_json(raw_literal)
        if (
            literal.kind != "row"
            or len(literal.args) != 4
            or not all(
                isinstance(name, str) and name in saved_v16_outer.index
                for name in literal.args[:3]
            )
            or type(literal.args[3]) is not bool
        ):
            raise RuntimeError("saved v16 survivor row assignment is malformed")
        saved_v16_outer.solver.add(saved_v16_outer.literal_expr(literal))
    if saved_v16_outer.solver.check() != z3.sat:
        raise RuntimeError("saved v16 survivor did not replay in the outer map")
    saved_v16_cores = (
        saved_v16_outer.direct_mirror_interleaving_six_point_euclidean_cores(
            saved_v16_outer.solver.model()
        )
    )
    expected_saved_v16_points = ("a0", "p2", "r1", "b2", "r2", "p1")
    saved_v16_core = next(
        (
            core
            for core in saved_v16_cores
            if mirror_interleaving_six_point_euclidean_core_points(core)
            == expected_saved_v16_points
        ),
        None,
    )
    if saved_v16_core is None:
        raise RuntimeError(
            "mirror-interleaving schema did not find the intended saved v16 core"
        )
    expected_saved_v16_core = {
        Literal("order", ("a0", "p2")),
        Literal("order", ("p2", "r1")),
        Literal("order", ("r1", "b2")),
        Literal("order", ("b2", "r2")),
        Literal("order", ("r2", "p1")),
        Literal("row", ("a0", "p1", "p2", True)),
        Literal("row", ("a0", "r1", "r2", True)),
        Literal("row", ("b2", "a0", "r1", True)),
        Literal("row", ("b2", "a0", "r2", True)),
        Literal("row", ("r2", "p1", "p2", True)),
    }
    if set(saved_v16_core) != expected_saved_v16_core:
        raise RuntimeError(
            "saved v16 mirror-interleaving cut literals are stale"
        )
    for literal in saved_v16_core:
        if saved_v16_outer.solver.check(
            z3.Not(saved_v16_outer.literal_expr(literal))
        ) != z3.unsat:
            raise RuntimeError(
                "saved v16 assignment did not entail every new cut literal"
            )
    saved_v16_outer.add_cut(saved_v16_core)
    if saved_v16_outer.solver.check() != z3.unsat:
        raise RuntimeError(
            "mirror-interleaving cut did not refute the frozen saved v16 assignment"
        )

    class SmokeMultiRelationOuter:
        names = ("a0", "a1", "a2", "a3", "u", "v")
        n = len(names)
        index = {name: i for i, name in enumerate(names)}
        rank = z3.Ints(
            "cegar_multi_rank0 cegar_multi_rank1 cegar_multi_rank2 "
            "cegar_multi_rank3 cegar_multi_rank4 cegar_multi_rank5"
        )
        required_rows = frozenset(
            {
                ("a0", "a1", "u"),
                ("a0", "a2", "u"),
                ("a2", "a3", "v"),
                ("v", "a1", "a2"),
                ("a1", "a3", "v"),
            }
        )
        rows = {
            key: z3.Bool(f"cegar_multi_row_{number}")
            for number, key in enumerate(sorted(required_rows))
        }

        def ix(self, name: str) -> int:
            return self.index[name]

        def selected_literals(
            self,
            model: z3.ModelRef,
            extra_literals: Iterable[Literal] = (),
        ) -> tuple[
            list[Literal],
            dict[tuple[int, int], Literal],
            dict[tuple[int, int], Literal],
        ]:
            return OuterMap.selected_literals(self, model, extra_literals)

    multi_outer = SmokeMultiRelationOuter()
    multi_solver = z3.Solver()
    multi_solver.add(
        *(rank == i for i, rank in enumerate(multi_outer.rank)),
        *multi_outer.rows.values(),
    )
    if multi_solver.check() != z3.sat:
        raise RuntimeError("multi-relation quotient smoke outer model was not SAT")
    multi_model = multi_solver.model()
    multi_quotient = QuotientMetricCheck(
        multi_outer,  # type: ignore[arg-type]
        multi_model,
        timeout_ms=30_000,
        iteration=99_999_995,
    )
    if multi_quotient.check() != z3.unsat:
        raise RuntimeError("multi-relation quotient smoke model was not UNSAT")
    multi_relations, _, _ = shrink_quotient_relation_core(
        multi_quotient,
        multi_quotient.initial_relation_core(),
        max_checks=256,
        deadline=None,
    )
    if multi_quotient.core_alone_check(
        multi_relations, timeout_ms=30_000
    ) != z3.unsat:
        raise RuntimeError("multi-relation quotient core did not replay alone")
    if sum(
        relation.kind == "true_row_equality"
        for relation in multi_relations
    ) < 3:
        raise RuntimeError("multi-relation quotient core collapsed to a direct core")
    multi_literals = multi_quotient.outer_literals_for_relations(
        multi_relations
    )
    multi_inner = InnerMetricCheck(
        multi_outer,  # type: ignore[arg-type]
        multi_model,
        timeout_ms=30_000,
        iteration=99_999_994,
        extra_literals=multi_literals,
    )
    if multi_inner.check_literals(multi_literals) != z3.unsat:
        raise RuntimeError("multi-relation outer translation did not replay UNSAT")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--checkpoint", type=Path)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--outer-timeout-ms", type=int, default=60_000)
    parser.add_argument("--inner-timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-timeout-seconds", type=float, default=600.0)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--z-branch", choices=("reuse-second", "new"), default="new")
    parser.add_argument("--escape-arm", choices=("critical", "robust"), default="critical")
    parser.add_argument(
        "--global-tier",
        choices=("local", "apex-cover", "full", "custom"),
        default="full",
    )
    parser.add_argument(
        "--cover-point",
        action="append",
        help="with --global-tier custom, instantiate minimality at this original role",
    )
    parser.add_argument(
        "--global-k4-center",
        action="append",
        help="with --global-tier custom, instantiate the selected-four row at this center",
    )
    parser.add_argument(
        "--rich-apex",
        action="append",
        help="with --global-tier custom, instantiate apex richness at a1 or a2",
    )
    parser.add_argument(
        "--robust-deletion",
        action="append",
        help="with --global-tier custom, instantiate robust survival after deleting this role",
    )
    parser.add_argument("--max-iterations", type=int, default=256)
    parser.add_argument("--max-cuts", type=int, default=4096)
    parser.add_argument(
        "--direct-cut-batch",
        type=int,
        default=256,
        help="maximum theorem-shaped direct cuts banked per outer model",
    )
    parser.add_argument("--core-shrink-checks", type=int, default=16)
    parser.add_argument("--core-shrink-timeout-ms", type=int, default=5_000)
    parser.add_argument("--checkpoint-validation-timeout-ms", type=int, default=60_000)
    parser.add_argument(
        "--outer-only",
        action="store_true",
        help="stop after finding one incidence/order model; do not run metric CEGAR",
    )
    parser.add_argument("--self-test", action="store_true")
    return parser.parse_args()


def validate_args(args: argparse.Namespace) -> None:
    for name in (
        "outer_timeout_ms",
        "inner_timeout_ms",
        "max_iterations",
        "max_cuts",
        "direct_cut_batch",
        "core_shrink_timeout_ms",
        "checkpoint_validation_timeout_ms",
    ):
        if getattr(args, name) <= 0:
            raise ValueError(f"--{name.replace('_', '-')} must be positive")
    if args.wall_timeout_seconds <= 0:
        raise ValueError("--wall-timeout-seconds must be positive")
    if args.core_shrink_checks < 0:
        raise ValueError("--core-shrink-checks must be nonnegative")
    if args.resume and args.checkpoint is None:
        raise ValueError("--resume requires --checkpoint")
    custom_values = (
        args.cover_point,
        args.global_k4_center,
        args.rich_apex,
        args.robust_deletion,
    )
    if args.global_tier != "custom" and any(
        value is not None for value in custom_values
    ):
        raise ValueError("projection selectors require --global-tier custom")
    if args.global_tier == "custom" and args.escape_arm != "robust":
        if args.robust_deletion:
            raise ValueError("--robust-deletion requires --escape-arm robust")


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_timeout_seconds
    outer = OuterMap(
        timeout_ms=args.outer_timeout_ms,
        random_seed=args.random_seed,
        z_branch=args.z_branch,
        escape_arm=args.escape_arm,
        global_tier=args.global_tier,
        cover_points=(
            tuple(args.cover_point)
            if args.global_tier == "custom" and args.cover_point
            else (() if args.global_tier == "custom" else None)
        ),
        global_k4_centers=(
            tuple(args.global_k4_center)
            if args.global_tier == "custom" and args.global_k4_center
            else (() if args.global_tier == "custom" else None)
        ),
        rich_apices=(
            tuple(args.rich_apex)
            if args.global_tier == "custom" and args.rich_apex
            else (() if args.global_tier == "custom" else None)
        ),
        robust_deletions=(
            tuple(args.robust_deletion)
            if args.global_tier == "custom" and args.robust_deletion
            else (() if args.global_tier == "custom" else None)
        ),
    )
    metadata = checkpoint_metadata(args, outer)
    stats: Counter[str] = Counter()
    stats["direct_circle_isosceles_five_point_cuts"] = 0
    stats["direct_circle_isosceles_five_point_batches"] = 0
    stats["direct_mirror_interleaving_six_point_euclidean_cuts"] = 0
    stats["direct_mirror_interleaving_six_point_euclidean_batches"] = 0
    cuts: list[list[Literal]] = []
    core_sizes: list[dict[str, object]] = []

    if args.resume:
        assert args.checkpoint is not None
        if not args.checkpoint.exists():
            raise ValueError(f"checkpoint does not exist: {args.checkpoint}")
        cuts = load_checkpoint(args.checkpoint, metadata, outer.names)
        if len(cuts) > args.max_cuts:
            raise ValueError("checkpoint already exceeds --max-cuts")
        (
            rechecked,
            four_point_rechecked,
            five_point_rechecked,
            reversed_second_five_point_rechecked,
            circle_isosceles_five_point_rechecked,
            six_point_rechecked,
            sparse_six_point_rechecked,
            mirror_interleaving_six_point_rechecked,
            redundant,
        ) = revalidate_checkpoint_cuts(
            outer,
            cuts,
            timeout_ms=args.checkpoint_validation_timeout_ms,
            deadline=deadline,
        )
        for core in cuts:
            outer.add_cut(core)
        stats["resumed_cuts"] = len(cuts)
        stats["revalidated_metric_unsat_cuts"] = rechecked
        stats["revalidated_four_point_kalmanson_cuts"] = four_point_rechecked
        stats["revalidated_five_point_euclidean_cuts"] = five_point_rechecked
        stats["revalidated_reversed_second_five_point_euclidean_cuts"] = (
            reversed_second_five_point_rechecked
        )
        stats["revalidated_circle_isosceles_five_point_cuts"] = (
            circle_isosceles_five_point_rechecked
        )
        stats["revalidated_six_point_euclidean_cuts"] = six_point_rechecked
        stats["revalidated_sparse_six_point_euclidean_cuts"] = (
            sparse_six_point_rechecked
        )
        stats["revalidated_mirror_interleaving_six_point_euclidean_cuts"] = (
            mirror_interleaving_six_point_rechecked
        )
        stats["outer_redundant_checkpoint_cuts"] = redundant

    status = "INVARIANT_FAILURE"
    reason = "loop did not establish a terminal status"
    survivor: dict[str, object] | None = None
    pending_quotient_core: dict[str, object] | None = None
    final_outer_reason: str | None = None
    final_inner_reason: str | None = None

    for iteration in range(args.max_iterations):
        if time.monotonic() >= deadline:
            status = "WALL_BUDGET"
            reason = "global wall-clock budget exhausted"
            break
        if len(cuts) >= args.max_cuts:
            status = "CUT_BUDGET"
            reason = "maximum number of certified inner-UNSAT cuts reached"
            break

        remaining_ms = max(1, int((deadline - time.monotonic()) * 1000))
        outer.solver.set(timeout=min(args.outer_timeout_ms, remaining_ms))
        stats["outer_calls"] += 1
        outer_status = outer.solver.check()
        if outer_status == z3.unsat:
            status = "CEGAR_EXHAUSTED_UNSAT"
            reason = (
                "outer incidence/order map exhausted by proved direct "
                "Euclidean/Kalmanson cuts and replayable inner-UNSAT cores"
            )
            break
        if outer_status == z3.unknown:
            status = "UNKNOWN_FAIL_CLOSED"
            final_outer_reason = outer.solver.reason_unknown()
            reason = f"outer solver returned UNKNOWN: {final_outer_reason}"
            break

        outer_model = outer.solver.model()
        if args.outer_only:
            status = "OUTER_SAT_INDUCED"
            reason = (
                "the full named-occurrence incidence/order abstraction has a model; "
                "metric realizability was not checked"
            )
            survivor = {
                "iteration": iteration,
                "alias_classes_in_order": outer.alias_classes(outer_model),
                "required_row_assignment": outer.required_row_assignment(
                    outer_model
                ),
            }
            break
        direct_limit = min(args.direct_cut_batch, args.max_cuts - len(cuts))
        direct_four_cores = outer.direct_four_point_kalmanson_cores(
            outer_model,
            limit=direct_limit,
        )
        direct_five_cores = outer.direct_five_point_euclidean_cores(
            outer_model,
            limit=direct_limit - len(direct_four_cores),
        )
        direct_reversed_second_five_cores = (
            outer.direct_reversed_second_five_point_euclidean_cores(
                outer_model,
                limit=(
                    direct_limit
                    - len(direct_four_cores)
                    - len(direct_five_cores)
                ),
            )
        )
        direct_circle_isosceles_five_cores = (
            outer.direct_circle_isosceles_five_point_cores(
                outer_model,
                limit=(
                    direct_limit
                    - len(direct_four_cores)
                    - len(direct_five_cores)
                    - len(direct_reversed_second_five_cores)
                ),
            )
        )
        direct_mirror_interleaving_six_cores = (
            outer.direct_mirror_interleaving_six_point_euclidean_cores(
                outer_model,
                limit=(
                    direct_limit
                    - len(direct_four_cores)
                    - len(direct_five_cores)
                    - len(direct_reversed_second_five_cores)
                    - len(direct_circle_isosceles_five_cores)
                ),
            )
        )
        direct_sparse_six_cores = outer.direct_sparse_six_point_euclidean_cores(
            outer_model,
            limit=(
                direct_limit
                - len(direct_four_cores)
                - len(direct_five_cores)
                - len(direct_reversed_second_five_cores)
                - len(direct_circle_isosceles_five_cores)
                - len(direct_mirror_interleaving_six_cores)
            ),
        )
        direct_cores = [
            ("proved-four-point-kalmanson-schema", core)
            for core in direct_four_cores
        ] + [
            ("proved-five-point-euclidean-schema", core)
            for core in direct_five_cores
        ] + [
            ("proved-reversed-second-five-point-euclidean-schema", core)
            for core in direct_reversed_second_five_cores
        ] + [
            ("proved-circle-isosceles-five-point-schema", core)
            for core in direct_circle_isosceles_five_cores
        ] + [
            (
                "proved-mirror-interleaving-six-point-euclidean-schema",
                core,
            )
            for core in direct_mirror_interleaving_six_cores
        ] + [
            ("proved-sparse-six-point-euclidean-schema", core)
            for core in direct_sparse_six_cores
        ]
        if direct_cores:
            if not all(
                z3.is_true(
                    outer_model.eval(
                        outer.literal_expr(literal),
                        model_completion=True,
                    )
                )
                for _, core in direct_cores
                for literal in core
            ):
                status = "INVARIANT_FAILURE"
                reason = "direct theorem-shaped core is not selected by the outer model"
                break
            for source, direct_core in direct_cores:
                outer.add_cut(direct_core)
                cuts.append(direct_core)
                core_sizes.append(
                    {
                        "iteration": iteration,
                        "initial": len(direct_core),
                        "shrunk": len(direct_core),
                        "source": source,
                    }
                )
            stats["banked_cuts"] += len(direct_cores)
            if direct_four_cores:
                stats["direct_four_point_kalmanson_cuts"] += len(direct_four_cores)
                stats["direct_four_point_kalmanson_batches"] += 1
            if direct_five_cores:
                stats["direct_five_point_euclidean_cuts"] += len(direct_five_cores)
                stats["direct_five_point_euclidean_batches"] += 1
            if direct_reversed_second_five_cores:
                stats["direct_reversed_second_five_point_euclidean_cuts"] += len(
                    direct_reversed_second_five_cores
                )
                stats["direct_reversed_second_five_point_euclidean_batches"] += 1
            if direct_circle_isosceles_five_cores:
                stats["direct_circle_isosceles_five_point_cuts"] += len(
                    direct_circle_isosceles_five_cores
                )
                stats["direct_circle_isosceles_five_point_batches"] += 1
            if direct_mirror_interleaving_six_cores:
                stats[
                    "direct_mirror_interleaving_six_point_euclidean_cuts"
                ] += len(direct_mirror_interleaving_six_cores)
                stats[
                    "direct_mirror_interleaving_six_point_euclidean_batches"
                ] += 1
            if direct_sparse_six_cores:
                stats["direct_sparse_six_point_euclidean_cuts"] += len(
                    direct_sparse_six_cores
                )
                stats["direct_sparse_six_point_euclidean_batches"] += 1
            if args.checkpoint is not None:
                write_json_atomic(
                    args.checkpoint,
                    checkpoint_payload(metadata, cuts, stats),
                )
            continue

        remaining_ms = max(1, int((deadline - time.monotonic()) * 1000))
        quotient_checker = QuotientMetricCheck(
            outer,
            outer_model,
            timeout_ms=min(args.inner_timeout_ms, remaining_ms),
            iteration=iteration,
        )
        stats["quotient_inner_calls"] += 1
        quotient_status = quotient_checker.check()
        if quotient_status == z3.sat:
            stats["quotient_inner_sat"] += 1
            status = "ALIVE"
            reason = (
                "an induced quotient/order has an exact strict Kalmanson metric"
            )
            survivor = {
                "iteration": iteration,
                "alias_classes_in_order": outer.alias_classes(outer_model),
                "required_row_assignment": outer.required_row_assignment(
                    outer_model
                ),
                "metric_sample": quotient_checker.metric_sample(),
                "inner_constraint_counts": dict(
                    sorted(quotient_checker.counts.items())
                ),
                "metric_checker": "exact-alias-class-quotient",
            }
            break
        if quotient_status == z3.unknown:
            stats["quotient_inner_unknown"] += 1
            status = "UNKNOWN_FAIL_CLOSED"
            final_inner_reason = quotient_checker.reason_unknown()
            reason = (
                "exact quotient metric solver returned UNKNOWN: "
                f"{final_inner_reason}"
            )
            break

        stats["quotient_inner_unsat"] += 1
        initial_relation_core = quotient_checker.initial_relation_core()
        if initial_relation_core:
            if len(initial_relation_core) <= 2:
                relation_core = initial_relation_core
                relation_shrink_checks = 0
                relation_shrink_unknowns = 0
            else:
                remaining_ms = max(
                    1, int((deadline - time.monotonic()) * 1000)
                )
                quotient_checker.solver.set(
                    timeout=min(args.core_shrink_timeout_ms, remaining_ms)
                )
                (
                    relation_core,
                    relation_shrink_checks,
                    relation_shrink_unknowns,
                ) = shrink_quotient_relation_core(
                    quotient_checker,
                    initial_relation_core,
                    max_checks=args.core_shrink_checks,
                    deadline=deadline,
                )
            stats["quotient_core_shrink_checks"] += relation_shrink_checks
            stats["quotient_core_shrink_unknowns"] += relation_shrink_unknowns

            remaining_ms = max(
                1, int((deadline - time.monotonic()) * 1000)
            )
            relation_replay = quotient_checker.core_alone_check(
                relation_core,
                timeout_ms=min(args.inner_timeout_ms, remaining_ms),
            )
            stats["quotient_core_alone_replays"] += 1
            if relation_replay == z3.unknown:
                stats["quotient_core_alone_unknown"] += 1
                status = "UNKNOWN_FAIL_CLOSED"
                reason = "quotient relation-core replay returned UNKNOWN"
                break
            if relation_replay != z3.unsat:
                status = "INVARIANT_FAILURE"
                reason = "quotient relation core did not replay UNSAT alone"
                break
            stats["quotient_core_alone_unsat"] += 1

            translated_core = quotient_checker.outer_literals_for_relations(
                relation_core
            )
            if not all(
                z3.is_true(
                    outer_model.eval(
                        outer.literal_expr(literal),
                        model_completion=True,
                    )
                )
                for literal in translated_core
            ):
                status = "INVARIANT_FAILURE"
                reason = (
                    "translated quotient core contains an unselected outer literal"
                )
                break

            pending_quotient_core = {
                "status": "PENDING_TRANSLATED_INNER_REPLAY",
                "iteration": iteration,
                "initial_relations": len(initial_relation_core),
                "shrunk_relations": len(relation_core),
                "relation_kinds": dict(
                    sorted(
                        Counter(
                            relation.kind for relation in relation_core
                        ).items()
                    )
                ),
                "alias_classes_in_order": outer.alias_classes(outer_model),
                "translated_outer_literals": [
                    literal.to_json() for literal in translated_core
                ],
                "schema": SCHEMA,
                "implementation_sha256": metadata["implementation_sha256"],
                "trust_warning": (
                    "External solver obstruction only; the translated core "
                    "still requires its independent INNER-UNSAT replay."
                ),
            }
            if args.output is not None:
                write_json_atomic(
                    args.output.with_name(
                        f"{args.output.stem}.quotient-core.json"
                    ),
                    pending_quotient_core,
                )

            remaining_ms = max(
                1, int((deadline - time.monotonic()) * 1000)
            )
            relation_checker = InnerMetricCheck(
                outer,
                outer_model,
                timeout_ms=min(args.inner_timeout_ms, remaining_ms),
                iteration=iteration,
                extra_literals=translated_core,
            )
            stats["quotient_core_inner_replays"] += 1
            translated_status = relation_checker.check_literals(translated_core)
            if translated_status == z3.unknown:
                stats["quotient_core_inner_unknown"] += 1
                status = "UNKNOWN_FAIL_CLOSED"
                final_inner_reason = relation_checker.solver.reason_unknown()
                reason = (
                    "translated quotient core replay returned UNKNOWN: "
                    f"{final_inner_reason}"
                )
                break
            if translated_status != z3.unsat:
                status = "INVARIANT_FAILURE"
                reason = "translated quotient core did not replay inner UNSAT"
                break
            stats["quotient_core_inner_unsat"] += 1

            pending_quotient_core["status"] = "VALIDATED_AND_BANKED"
            pending_quotient_core["trust_warning"] = (
                "External solver cut with an independently replayed "
                "INNER-UNSAT result; not a Lean theorem or certificate."
            )
            if args.output is not None:
                write_json_atomic(
                    args.output.with_name(
                        f"{args.output.stem}.quotient-core.json"
                    ),
                    pending_quotient_core,
                )
            outer.add_cut(translated_core)
            cuts.append(translated_core)
            pending_quotient_core = None
            stats["banked_cuts"] += 1
            stats["quotient_relation_core_cuts"] += 1
            core_sizes.append(
                {
                    "iteration": iteration,
                    "initial_relations": len(initial_relation_core),
                    "shrunk_relations": len(relation_core),
                    "outer_literals": len(translated_core),
                    "relation_kinds": dict(
                        sorted(
                            Counter(
                                relation.kind for relation in relation_core
                            ).items()
                        )
                    ),
                    "source": "quotient-unsat-relation-core",
                }
            )
            if args.checkpoint is not None:
                write_json_atomic(
                    args.checkpoint,
                    checkpoint_payload(metadata, cuts, stats),
                )
            continue

        stats["quotient_empty_relation_cores"] += 1
        remaining_ms = max(1, int((deadline - time.monotonic()) * 1000))
        checker = InnerMetricCheck(
            outer,
            outer_model,
            timeout_ms=min(args.inner_timeout_ms, remaining_ms),
            iteration=iteration,
        )
        stats["inner_calls"] += 1
        inner_status = checker.check()
        if inner_status == z3.sat:
            status = "ALIVE"
            reason = "an induced quotient/order has a strict Kalmanson metric"
            survivor = {
                "iteration": iteration,
                "alias_classes_in_order": outer.alias_classes(outer_model),
                "required_row_assignment": outer.required_row_assignment(
                    outer_model
                ),
                "metric_sample": checker.metric_sample(),
                "inner_constraint_counts": dict(sorted(checker.counts.items())),
            }
            break
        if inner_status == z3.unknown:
            status = "UNKNOWN_FAIL_CLOSED"
            final_inner_reason = checker.solver.reason_unknown()
            reason = f"inner metric solver returned UNKNOWN: {final_inner_reason}"
            break

        initial_core = checker.core_literals()
        if not initial_core:
            status = "INVARIANT_FAILURE"
            reason = "inner UNSAT core was empty"
            break
        if len(initial_core) <= 2:
            shrunk_core, shrink_checks, shrink_unknowns = initial_core, 0, 0
        else:
            remaining_ms = max(1, int((deadline - time.monotonic()) * 1000))
            checker.solver.set(
                timeout=min(args.core_shrink_timeout_ms, remaining_ms)
            )
            shrunk_core, shrink_checks, shrink_unknowns = shrink_core(
                checker,
                initial_core,
                max_checks=args.core_shrink_checks,
                deadline=deadline,
            )
        stats["core_shrink_checks"] += shrink_checks
        stats["core_shrink_unknowns"] += shrink_unknowns

        # Every literal in the core is selected in outer_model, so this clause
        # excludes the current witness and only patterns with the same core.
        if not all(
            z3.is_true(outer_model.eval(outer.literal_expr(lit), model_completion=True))
            for lit in shrunk_core
        ):
            status = "INVARIANT_FAILURE"
            reason = "inner core contains a literal not selected by the outer model"
            break
        outer.add_cut(shrunk_core)
        cuts.append(shrunk_core)
        stats["banked_cuts"] += 1
        core_sizes.append(
            {
                "iteration": iteration,
                "initial": len(initial_core),
                "shrunk": len(shrunk_core),
                "source": "inner-unsat-assumption-core",
            }
        )
        if args.checkpoint is not None:
            write_json_atomic(
                args.checkpoint,
                checkpoint_payload(metadata, cuts, stats),
            )
    else:
        status = "ITERATION_BUDGET"
        reason = "maximum CEGAR iterations reached"

    elapsed = time.monotonic() - started
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "metadata": metadata,
        "implementation_sha256": metadata["implementation_sha256"],
        "epistemic_status": "INDUCED_NECESSARY_CONDITION_ONLY",
        "status": status,
        "reason": reason,
        "z_branch": args.z_branch,
        "escape_arm": args.escape_arm,
        "global_tier": args.global_tier,
        "outer_only": args.outer_only,
        "named_occurrences": outer.n,
        "cuts": len(cuts),
        "core_sizes": core_sizes,
        "stats": dict(sorted(stats.items())),
        "outer_constraint_counts": dict(sorted(outer.counts.items())),
        "row_incidence_atoms": len(outer.rows),
        "required_row_incidence_atoms": len(outer.required_rows),
        "elapsed_seconds": elapsed,
        "scope_warning": (
            "The original snapshot is frozen before fresh witnesses are generated; "
            "witness-producing quantified projections do not recurse over generated "
            "witnesses, while exact-four exclusions range over all named occurrences."
        ),
        "trust_warning": (
            "SAT/UNSAT is solver evidence for this induced encoding, not a Lean theorem "
            "or a Euclidean-coordinate realization."
        ),
        "opaque_or_oracular": [
            "carrier points outside the frozen original named snapshot",
            "recursive FullyDeletionRobustAt obligations for generated witnesses",
            "exact rich-class cardinality beyond selected-six/two-selected-four witnesses",
            "MinimalUniqueFourCover beyond pointwise original-named covers",
            "global K4 witnesses outside full tier and outside original named centers",
            "cap cardinality witnesses not needed by these named projections",
            "noM44",
        ],
        "projected_facts": [
            "producer-selected escape row in both arms; exact4 only in critical arm",
            "robust deletion survival at every original named point using fresh rows",
            "aligned first-apex K4 radius classification over original names",
            "cross-retained source survival and post-deletion K4 bound",
            "minimality unique4 cover for every original named point in full tier",
            "global selected4 at original named centers lacking a supplied row in full tier",
            "a1/a2 rich disjunction: selected-six or two distinct-radius selected4 rows",
            "conditional two-circle intersections for every active named row",
        ],
    }
    if final_outer_reason is not None:
        payload["outer_reason_unknown"] = final_outer_reason
    if final_inner_reason is not None:
        payload["inner_reason_unknown"] = final_inner_reason
    if survivor is not None:
        payload["survivor"] = survivor
    if pending_quotient_core is not None:
        payload["pending_quotient_core"] = pending_quotient_core
    if args.checkpoint is not None:
        write_json_atomic(
            args.checkpoint,
            checkpoint_payload(metadata, cuts, stats),
        )
        payload["checkpoint"] = str(args.checkpoint)
    return payload


def main() -> None:
    args = parse_args()
    validate_args(args)
    if args.self_test:
        smoke_test()
        print(json.dumps({"self_test": "PASS"}))
        return
    payload = run(args)
    if args.output is not None:
        write_json_atomic(args.output, payload)
    print(
        json.dumps(
            {
                "status": payload["status"],
                "cuts": payload["cuts"],
                "elapsed_seconds": payload["elapsed_seconds"],
                "output": str(args.output) if args.output else None,
                "checkpoint": str(args.checkpoint) if args.checkpoint else None,
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
