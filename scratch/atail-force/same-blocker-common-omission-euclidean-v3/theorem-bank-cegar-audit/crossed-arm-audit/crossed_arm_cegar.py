#!/usr/bin/env python3
"""Bounded n=17 audit of the two live crossed outside-pair arms.

This is finite discovery evidence.  It is not a Lean proof and it does not
assert Euclidean realizability of a surviving Boolean/incidence model.
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import sys
import tempfile
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
LANE = HERE.parent.parent
sys.path.insert(0, str(LANE))

import incidence_cegar  # noqa: E402

DUAL_ROW_LANE = HERE.parent / "dual-row-cegar"
sys.path.insert(0, str(DUAL_ROW_LANE))

import dual_row_cegar  # noqa: E402


PROFILE = (6, 8, 6)
N = 17
ARMS = ("source-at-common", "other-at-common")
FAMILIES = ("direct", "forward-second", "reversed-second")


def critical_k4_artifact_suffix(critical_k4_representation: str) -> str:
    """Keep artifacts from distinct base encodings in distinct paths."""
    if critical_k4_representation not in incidence_cegar.CRITICAL_K4_REPRESENTATIONS:
        raise ValueError((
            "invalid-critical-k4-representation",
            critical_k4_representation,
        ))
    if (
        critical_k4_representation
        == incidence_cegar.LEGACY_CRITICAL_K4_REPRESENTATION
    ):
        return ""
    return f"-critical-k4-{critical_k4_representation}"


def critical_k4_representation_self_check(
    critical_k4_representation: str,
) -> dict[str, object]:
    suffix = critical_k4_artifact_suffix(critical_k4_representation)
    legacy_representation = incidence_cegar.LEGACY_CRITICAL_K4_REPRESENTATION
    legacy_suffix = critical_k4_artifact_suffix(legacy_representation)
    default_suffix = critical_k4_artifact_suffix(
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    )
    if legacy_suffix:
        raise AssertionError("legacy critical-K4 representation changed artifact paths")
    if (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
        != legacy_representation
        and not default_suffix
    ):
        raise AssertionError("new critical-K4 default collides with legacy artifacts")
    return {
        "selected": critical_k4_representation,
        "default": incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION,
        "legacy": legacy_representation,
        "choices": list(incidence_cegar.CRITICAL_K4_REPRESENTATIONS),
        "artifact_suffix": suffix,
        "default_artifact_suffix": default_suffix,
        "legacy_artifact_suffix": legacy_suffix,
        "legacy_default_preserves_artifact_paths": True,
    }


THEOREMS = {
    "direct": (
        "Problem97.FivePointEuclideanObstruction."
        "false_of_five_ccw_two_selected_rows_cyclicShift"
    ),
    "forward-second": (
        "Problem97.FivePointEuclideanObstruction."
        "false_of_five_ccw_second_two_selected_rows_cyclicShift"
    ),
    "reversed-second": (
        "Problem97.FivePointEuclideanObstruction."
        "false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift"
    ),
}

NEW_THEOREM_FAMILY = "six_k2_three_row_triangle"
PRE_CONVEX_THEOREM_FAMILIES = dual_row_cegar.ALL_THEOREM_FAMILIES
if NEW_THEOREM_FAMILY not in PRE_CONVEX_THEOREM_FAMILIES:
    raise AssertionError(("missing-new-theorem-family", NEW_THEOREM_FAMILY))
CONVEX_FIVE_POINT_FAMILY = "convex_five_point_core"
CONVEX_FIVE_POINT_SCHEMA = {
    "theorem": (
        "Problem97.Census554.ConvexFivePointCore."
        "false_of_core_of_common_orientation"
    ),
    "arity": 5,
    # Roles are (a, x, b, c, y) in cyclic order up to orientation.
    "equalities": ((1, 0, 2), (4, 0, 2), (3, 2, 1), (3, 2, 4)),
}
GLOBAL_KALMANSON_FAMILY = "global_kalmanson_14role_16eq"
GLOBAL_KALMANSON_SCHEMA = {
    "theorem": (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_fourteen_ccw_sixteen_shell_equalities_global_core"
    ),
    "arity": 14,
    # The deletion-minimal global Kalmanson core's cyclic role subsequence.
    "role_order": (
        "a1", "t4", "t2", "t1", "t3", "a2", "p2", "q2", "r2",
        "p1", "q1", "r1", "s4", "s2",
    ),
    # Exact E(center, left, right) antecedents from global-kalmanson-lp-v8.
    "equalities": (
        (0, 3, 9), (0, 3, 6), (0, 4, 7), (0, 1, 13),
        (0, 11, 8), (0, 11, 12), (1, 0, 2), (1, 0, 11),
        (1, 0, 13), (2, 4, 5), (2, 4, 9), (3, 1, 12),
        (4, 2, 5), (6, 1, 7), (7, 0, 6), (12, 3, 8),
    ),
}
CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY = (
    "crossed_arm_seven_point_collision_11eq"
)
CROSSED_ARM_SEVEN_POINT_COLLISION_THEOREM = (
    "Problem97.CrossedArmSevenPointEuclideanObstruction."
    "false_of_crossed_arm_seven_point_collision_of_injective"
)
CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA = {
    # This is deliberately the final injective contradiction adapter, rather
    # than the intermediate metric lemma whose conclusion is merely A = P.
    "theorem": CROSSED_ARM_SEVEN_POINT_COLLISION_THEOREM,
    "arity": 7,
    "role_order": ("A", "P", "R", "S", "U", "V", "W"),
    # Direct E(center, left, right) atoms.  The first five-edge-length class is
    # represented by a shared-center spanning tree, so every antecedent is a
    # primitive global-equality-closure atom and no derived class comparison
    # is needed by the matcher or cut builder.
    "equalities": (
        (0, 1, 3),
        (0, 1, 6),
        (3, 0, 4),
        (3, 0, 5),
        (6, 2, 3),
        (6, 2, 4),
        (1, 5, 6),
        (5, 1, 2),
        (0, 2, 5),
        (2, 1, 4),
        (4, 1, 5),
    ),
}
PRE_GLOBAL_THEOREM_FAMILIES = (
    *PRE_CONVEX_THEOREM_FAMILIES,
    CONVEX_FIVE_POINT_FAMILY,
)
PRE_SEVEN_POINT_THEOREM_FAMILIES = (
    *PRE_GLOBAL_THEOREM_FAMILIES,
    GLOBAL_KALMANSON_FAMILY,
)
FULL_BANK_FAMILIES = (
    *PRE_SEVEN_POINT_THEOREM_FAMILIES,
    CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY,
)
SUBSUMED_THEOREM_CUT_FAMILIES = {
    # These pairs have the same arity, ordered point key, and linear-order
    # guard.  Each selected-row antecedent entails every raw equality in its
    # paired family via the selected row's common-radius constraints.
    "five_kalmanson_three_selected_rows": (
        "five_kalmanson_three_shell_equalities"
    ),
    "six_sparse_two_selected_rows": "six_sparse_row_equalities",
}
SUBSUMING_THEOREM_CUT_FAMILIES = {
    raw_family: selected_family
    for selected_family, raw_family in SUBSUMED_THEOREM_CUT_FAMILIES.items()
}
if len(SUBSUMING_THEOREM_CUT_FAMILIES) != len(
    SUBSUMED_THEOREM_CUT_FAMILIES
):
    raise AssertionError("theorem-cut subsumption providers must be unique")
EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES = {
    # With q = (q0,q1,q2,q3,q4), the reversed-second antecedent is exactly
    # the first-family antecedent at the cyclic rotation
    # (q4,q0,q1,q2,q3).  Keep the legacy family registered for checkpoint
    # compatibility, but never install a second formula for this orbit.
    "reversed_second": "first",
}
THEOREM_FAMILY_ORDER = {
    family: index for index, family in enumerate(FULL_BANK_FAMILIES)
}
LEGACY_THEOREM_FAMILIES = (
    "first",
    "second",
    "reversed_second",
    "kalmanson_013_412_523",
    "kalmanson_012_325_415",
    "kalmanson_012_124_314",
    "kalmanson_013_235_415",
    "five_kalmanson_three_selected_rows",
    "five_circle_isosceles_two_selected_rows",
    "six_sparse_two_selected_rows",
    "five_kalmanson_three_shell_equalities",
    "four_endpoint_centers_bisect_middle_pair",
    "four_middle_centers_bisect_endpoint_pair",
    "five_second_three_row_equalities",
    "five_direct_three_row_equalities",
    "six_sparse_row_equalities",
    "six_main_row_equalities",
    "six_mirror_interleaving_equalities",
    "six_two_triple_row_equalities",
)
if tuple(
    family
    for family in PRE_CONVEX_THEOREM_FAMILIES
    if family != NEW_THEOREM_FAMILY
) != (
    LEGACY_THEOREM_FAMILIES
):
    raise AssertionError("the theorem-bank manifest changed without a schema migration")


def validated_theorem_cut_subsumption_providers() -> dict[str, tuple[int, ...]]:
    equality_families = {
        **dual_row_cegar.RAW_EQUALITY_FAMILIES,
        **dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
    }
    providers = {}
    for selected_family, raw_family in SUBSUMED_THEOREM_CUT_FAMILIES.items():
        if selected_family not in dual_row_cegar.LINEAR_ROW_FAMILIES:
            raise AssertionError(("missing-selected-row-family", selected_family))
        if raw_family not in equality_families:
            raise AssertionError(("missing-raw-equality-family", raw_family))
        selected_schema = dual_row_cegar.LINEAR_ROW_FAMILIES[selected_family]
        raw_schema = equality_families[raw_family]
        if selected_schema["arity"] != raw_schema["arity"]:
            raise AssertionError((
                "subsumption-arity-mismatch",
                selected_family,
                raw_family,
            ))
        family_providers = []
        for center, left, right in raw_schema["equalities"]:
            candidates = tuple(
                index
                for index, (row_center, support) in enumerate(
                    selected_schema["rows"]
                )
                if row_center == center and {left, right}.issubset(support)
            )
            if not candidates:
                raise AssertionError((
                    "raw-equality-not-implied-by-selected-row",
                    selected_family,
                    raw_family,
                    (center, left, right),
                ))
            family_providers.append(candidates[0])
        providers[selected_family] = tuple(family_providers)
    return providers


THEOREM_CUT_SUBSUMPTION_PROVIDERS = (
    validated_theorem_cut_subsumption_providers()
)
RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v10"
CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v8"
PREVIOUS_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v9"
PREVIOUS_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v7"
LEGACY_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v8"
LEGACY_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v6"
ANCIENT_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v7"
ANCIENT_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v5"
OLDEST_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v6"
OLDEST_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v4"
PREHISTORIC_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v5"
PREHISTORIC_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v3"
ARCHAIC_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v4"
ARCHAIC_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v2"
PRIMORDIAL_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v3"
PRIMORDIAL_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v1"
ORDINARY_RESUME_SCHEMA_PAIRS = (
    (RESULT_SCHEMA, CUT_SCHEMA),
    (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),
)
BASE_STRUCTURAL_FAMILIES = ("shared_pair", "circle", "bisector")
RAW_BTW_SEP_FAMILY = "raw_btw_sep"
PRE_TRANSPORT_STRUCTURAL_FAMILIES = (*BASE_STRUCTURAL_FAMILIES, RAW_BTW_SEP_FAMILY)
MUTUAL_BISECTOR_TRANSPORT_FAMILY = "mutual_bisector_transport"
STRUCTURAL_FAMILIES = (
    *PRE_TRANSPORT_STRUCTURAL_FAMILIES,
    MUTUAL_BISECTOR_TRANSPORT_FAMILY,
)
DEFAULT_BTW_SEP_REPLAY_WITNESS = (
    HERE / "source-at-common-full-metric-bank-v4-cross-omissions-import-v3" / "witness.json"
)
DEFAULT_MUTUAL_BISECTOR_REPLAY_WITNESS = (
    HERE
    / "source-at-common-full-metric-bank-v5-raw-btw-sep-import-v4"
    / "witness.json"
)
DEFAULT_V7_REPLAY_WITNESS = (
    HERE
    / "source-at-common-full-metric-bank-v6-mutual-bisector-resume-01"
    / "witness.json"
)
DEFAULT_GLOBAL_KALMANSON_REPLAY_WITNESS = (
    HERE
    / "source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s"
    / "witness.json"
)
GLOBAL_KALMANSON_MINIMAL_CORE = (
    HERE.parent
    / "crossed-arm-qf-nra-v4"
    / "global-kalmanson-lp-v8"
    / "minimal-core.json"
)


def convex_five_point_matches(audit, model, context=None):
    """Find raw-equality cores in cyclic order, allowing either orientation."""
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    matches = []
    for subset in itertools.combinations(context.ordered, 5):
        oriented = (*rotations(subset), *rotations(tuple(reversed(subset))))
        for points in oriented:
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in CONVEX_FIVE_POINT_SCHEMA["equalities"]
            )
            if all(
                context.equality_holds(center, *endpoints)
                for center, endpoints in requirements
            ):
                matches.append((CONVEX_FIVE_POINT_FAMILY, points, requirements))
    return matches


def add_convex_five_point_match(audit, match):
    family, points, requirements = match
    if family != CONVEX_FIVE_POINT_FAMILY:
        raise ValueError(("unexpected-convex-five-point-family", family))
    atoms = [
        cyclic_order_up_to_orientation_guard(audit.z3, audit.position, points)
    ]
    atoms.extend(
        audit.E(center, endpoints[0], endpoints[1])
        for center, endpoints in requirements
    )
    return audit.add_guarded_cut(("theorem", family, *points), atoms)


def global_kalmanson_matches(audit, model, context=None):
    """Find the exact 14-role/16-equality core up to cyclic dihedral order."""
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    matches = []
    for subset in itertools.combinations(
        context.ordered, GLOBAL_KALMANSON_SCHEMA["arity"]
    ):
        oriented = (*rotations(subset), *rotations(tuple(reversed(subset))))
        for points in oriented:
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in GLOBAL_KALMANSON_SCHEMA["equalities"]
            )
            if all(
                context.equality_holds(center, *endpoints)
                for center, endpoints in requirements
            ):
                matches.append((GLOBAL_KALMANSON_FAMILY, points, requirements))
    return matches


def add_global_kalmanson_match(audit, match):
    family, points, requirements = match
    if family != GLOBAL_KALMANSON_FAMILY:
        raise ValueError(("unexpected-global-kalmanson-family", family))
    atoms = [cyclic_order_up_to_orientation_guard(audit.z3, audit.position, points)]
    atoms.extend(
        audit.E(center, endpoints[0], endpoints[1])
        for center, endpoints in requirements
    )
    return audit.add_guarded_cut(("theorem", family, *points), atoms)


def crossed_arm_seven_point_collision_requirements(points):
    """Instantiate the exact eleven direct-E atoms at one role assignment."""
    points = tuple(points)
    if len(points) != CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["arity"]:
        raise ValueError(("crossed-arm-seven-point-wrong-arity", points))
    return tuple(
        (points[center], (points[left], points[right]))
        for center, left, right in CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA[
            "equalities"
        ]
    )


def crossed_arm_seven_point_collision_points_match(context, points) -> bool:
    """Check one injective `(A,P,R,S,U,V,W)` assignment exactly."""
    points = tuple(points)
    if (
        len(points) != CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["arity"]
        or len(set(points)) != len(points)
    ):
        return False
    return all(
        context.equality_holds(center, *endpoints)
        for center, endpoints in crossed_arm_seven_point_collision_requirements(
            points
        )
    )


def direct_equality_neighbor_index(context, vertices):
    """Index direct E-neighbors without assuming transitive closure semantics."""
    vertices = tuple(vertices)
    return {
        (center, anchor): frozenset(
            point
            for point in vertices
            if point != center
            and context.equality_holds(center, anchor, point)
        )
        for center in vertices
        for anchor in vertices
        if anchor != center
    }


def crossed_arm_seven_point_collision_matches(audit, model, context=None):
    """Find every injective seven-role collision by direct-E neighbor joins.

    The join follows the eleven-atom dependency graph.  It intentionally
    emits every ordered role tuple: the theorem has no cyclic, linear, or
    dihedral guard, so quotienting by ambient order would be unsound.
    """
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    vertices = tuple(context.ordered)
    equal_neighbors = direct_equality_neighbor_index(context, vertices)
    matches = []
    for A in vertices:
        for P in vertices:
            if P == A:
                continue
            AP_neighbors = equal_neighbors[A, P]
            for S in vertices:
                if S in {A, P} or S not in AP_neighbors:
                    continue
                for W in vertices:
                    if W in {A, P, S} or W not in AP_neighbors:
                        continue
                    for U in vertices:
                        if U in {A, P, S, W} or U not in equal_neighbors[S, A]:
                            continue
                        V_candidates = (
                            equal_neighbors[S, A]
                            & equal_neighbors[P, W]
                            & equal_neighbors[U, P]
                        )
                        for V in vertices:
                            if V in {A, P, S, U, W} or V not in V_candidates:
                                continue
                            R_candidates = (
                                equal_neighbors[W, S]
                                & equal_neighbors[W, U]
                                & equal_neighbors[V, P]
                                & equal_neighbors[A, V]
                            )
                            for R in vertices:
                                if (
                                    R in {A, P, S, U, V, W}
                                    or R not in R_candidates
                                    or not context.equality_holds(R, P, U)
                                ):
                                    continue
                                points = (A, P, R, S, U, V, W)
                                if not crossed_arm_seven_point_collision_points_match(
                                    context, points
                                ):
                                    raise AssertionError((
                                        "crossed-arm-seven-point-join-bug",
                                        points,
                                    ))
                                matches.append((
                                    CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY,
                                    points,
                                    crossed_arm_seven_point_collision_requirements(
                                        points
                                    ),
                                ))
    return matches


def add_crossed_arm_seven_point_collision_match(audit, match):
    family, points, requirements = match
    if family != CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY:
        raise ValueError(("unexpected-crossed-arm-seven-point-family", family))
    points = tuple(points)
    expected_requirements = crossed_arm_seven_point_collision_requirements(points)
    if tuple(requirements) != expected_requirements:
        raise ValueError((
            "unexpected-crossed-arm-seven-point-requirements",
            requirements,
        ))
    if len(set(points)) != len(points):
        raise ValueError(("noninjective-crossed-arm-seven-point-match", points))
    atoms = [
        audit.E(center, endpoints[0], endpoints[1])
        for center, endpoints in expected_requirements
    ]
    return audit.add_guarded_cut(("theorem", family, *points), atoms)


def full_bank_match_groups(audit, model, context=None):
    return (
        (
            dual_row_cegar.theorem_matches(audit, model, context),
            dual_row_cegar.add_theorem_match,
        ),
        (
            dual_row_cegar.kalmanson_matches(audit, model, context),
            dual_row_cegar.add_kalmanson_match,
        ),
        (
            dual_row_cegar.linear_row_matches(audit, model, context),
            dual_row_cegar.add_linear_row_match,
        ),
        (
            dual_row_cegar.raw_equality_matches(audit, model, context),
            dual_row_cegar.add_kalmanson_match,
        ),
        (
            dual_row_cegar.six_point_equality_matches(audit, model, context),
            dual_row_cegar.add_kalmanson_match,
        ),
        (
            convex_five_point_matches(audit, model, context),
            add_convex_five_point_match,
        ),
        (
            global_kalmanson_matches(audit, model, context),
            add_global_kalmanson_match,
        ),
        (
            crossed_arm_seven_point_collision_matches(audit, model, context),
            add_crossed_arm_seven_point_collision_match,
        ),
    )


def guarded_cut_formula(z3, atoms):
    return z3.Or(*(z3.Not(atom) for atom in atoms))


class CrossedAudit(incidence_cegar.Audit):
    """The crossed branch with every canonical selected row exposed to CEGAR."""

    def __init__(
        self,
        critical_k4_representation: str = (
            incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
        ),
    ):
        # These switches encode every source-proved finite geometric
        # projection provided by the shared incidence encoder, plus the global
        # undirected-edge equality quotient used to close distance equalities.
        super().__init__(
            N,
            PROFILE,
            True,
            True,
            True,
            global_edge_equality=True,
            critical_k4_representation=critical_k4_representation,
        )
        self.row_objects = tuple(
            dual_row_cegar.RowObject(
                f"base.{self.names[center]}", "base", self.names[center], center
            )
            for center in self.vs
        )
        self.packet_cuts: dict[tuple, object] = {}

    def center_is(self, row: dual_row_cegar.RowObject, center: int):
        return self.z3.BoolVal(center == row.fixed_center)

    def member(self, row: dual_row_cegar.RowObject, point: int):
        if row.fixed_center is None:
            raise AssertionError(("crossed-row-without-fixed-center", row))
        return self.m[row.fixed_center, point]

    def row_center(self, model, row: dual_row_cegar.RowObject):
        centers = [
            center
            for center in self.vs
            if self.truth(model, self.center_is(row, center))
        ]
        if len(centers) != 1:
            raise AssertionError(("row-center", row.name, centers))
        return centers[0]

    def row_support(self, model, row: dual_row_cegar.RowObject):
        return {
            point
            for point in self.vs
            if self.truth(model, self.member(row, point))
        }

    def add_guarded_cut(self, key, atoms):
        canonical_key = canonical_exact_orbit_theorem_cut_key(key)
        if canonical_key is not None:
            key = canonical_key
            # Callers from the legacy dual-row module hand us atoms built from
            # the serialized family name.  Rebuild after key normalization so
            # every insertion path asserts the same canonical s-expression.
            atoms = theorem_cut_atoms(self, canonical_key)
        if key in self.packet_cuts:
            return False
        formula = guarded_cut_formula(self.z3, atoms)
        self.add(f"crossed_full_bank_cut_{key[0]}", formula)
        self.packet_cuts[key] = formula
        return True


def rotations(points: tuple[int, ...]):
    for shift in range(len(points)):
        yield points[shift:] + points[:shift]


def cyclic_order_guard(z3, positions, points: tuple[int, ...]):
    cases = []
    for order in rotations(points):
        cases.append(
            z3.And(
                *(positions[x] < positions[y] for x, y in zip(order, order[1:]))
            )
        )
    return z3.Or(*cases)


def cyclic_order_up_to_orientation_guard(z3, positions, points: tuple[int, ...]):
    return z3.Or(
        cyclic_order_guard(z3, positions, points),
        cyclic_order_guard(z3, positions, tuple(reversed(points))),
    )


def cyclic_order_holds_up_to_orientation(carrier_order, points) -> bool:
    """Finite replay counterpart of `cyclic_order_up_to_orientation_guard`."""
    carrier_positions = {point: index for index, point in enumerate(carrier_order)}
    if len(carrier_positions) != len(carrier_order) or not set(points).issubset(
        carrier_positions
    ):
        return False
    induced_order = tuple(sorted(points, key=carrier_positions.__getitem__))
    allowed = {
        *rotations(tuple(points)),
        *rotations(tuple(reversed(points))),
    }
    return induced_order in allowed


def strictly_between(positions, left, right, point) -> bool:
    return (
        positions[left] < positions[point] < positions[right]
        or positions[right] < positions[point] < positions[left]
    )


def same_cyclic_side(positions, endpoint_left, endpoint_right, center_a, center_b) -> bool:
    """Whether the centers lie on one cyclic arc of the endpoint pair.

    Equality of the two strict-between values is invariant under rotating the
    linear cut and under reversing the cyclic orientation.
    """
    return strictly_between(positions, endpoint_left, endpoint_right, center_a) == (
        strictly_between(positions, endpoint_left, endpoint_right, center_b)
    )


def raw_btw_sep_cut(z3, positions, equalities, center_a, center_b,
                    endpoint_left, endpoint_right):
    """Forbid the raw-equality antecedent of `SurplusCOMPGBank.btw_sep`."""
    endpoints_alternate = z3.Xor(
        dual_row_cegar.between_expr(
            z3, positions, center_a, center_b, endpoint_left
        ),
        dual_row_cegar.between_expr(
            z3, positions, center_a, center_b, endpoint_right
        ),
    )
    return z3.Or(
        z3.Not(equalities(center_a, endpoint_left, endpoint_right)),
        z3.Not(equalities(center_b, endpoint_left, endpoint_right)),
        endpoints_alternate,
    )


def raw_btw_sep_instances(vertices, positions, equality_holds):
    """Canonical raw-equality violations, independent of the linear cut."""
    instances = []
    for endpoint_left, endpoint_right in itertools.combinations(sorted(vertices), 2):
        non_endpoints = tuple(
            point for point in sorted(vertices)
            if point not in {endpoint_left, endpoint_right}
        )
        for center_a, center_b in itertools.combinations(non_endpoints, 2):
            if not equality_holds(center_a, endpoint_left, endpoint_right):
                continue
            if not equality_holds(center_b, endpoint_left, endpoint_right):
                continue
            if same_cyclic_side(
                positions, endpoint_left, endpoint_right, center_a, center_b
            ):
                instances.append(
                    (RAW_BTW_SEP_FAMILY, center_a, center_b, endpoint_left, endpoint_right)
                )
    return instances


def raw_btw_sep_violations(audit, model, context=None):
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    return raw_btw_sep_instances(
        audit.vs, context.positions, context.equality_holds
    )


def mutual_bisector_transport_cut(z3, equalities, q, c1, c2):
    """Encode `dist_eq_dist_of_mutual_bisector` as one Horn clause."""
    return z3.Or(
        z3.Not(equalities(c1, q, c2)),
        z3.Not(equalities(c2, q, c1)),
        equalities(q, c1, c2),
    )


def mutual_bisector_transport_instances(vertices, equality_holds):
    """Canonical model violations of mutual-bisector equality transport."""
    instances = []
    for q in sorted(vertices):
        other = tuple(point for point in sorted(vertices) if point != q)
        for c1, c2 in itertools.combinations(other, 2):
            if (
                equality_holds(c1, q, c2)
                and equality_holds(c2, q, c1)
                and not equality_holds(q, c1, c2)
            ):
                instances.append((MUTUAL_BISECTOR_TRANSPORT_FAMILY, q, c1, c2))
    return instances


def mutual_bisector_transport_violations(audit, model, context=None):
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    return mutual_bisector_transport_instances(audit.vs, context.equality_holds)


def family_literals(family: str, points: tuple[int, ...]):
    a, b, c, d, e = points
    if family == "direct":
        # row(b) contains a,e; row(c) contains a,b,d
        return ((b, a), (b, e), (c, a), (c, b), (c, d))
    if family == "forward-second":
        # row(d) contains a,c,e; row(e) contains a,b
        return ((d, a), (d, c), (d, e), (e, a), (e, b))
    if family == "reversed-second":
        # row(b) contains a,c,e; row(a) contains d,e
        return ((b, a), (b, c), (b, e), (a, d), (a, e))
    raise ValueError(family)


def antecedent_holds(
    family: str, rows: dict[int, set[int]], points: tuple[int, ...]
) -> bool:
    return all(point in rows[center] for center, point in family_literals(family, points))


def cyclic_matches(
    family: str,
    vertices: tuple[int, ...],
    positions: dict[int, int],
    rows: dict[int, set[int]],
) -> list[tuple[int, int, int, int, int]]:
    ordered = tuple(sorted(vertices, key=positions.__getitem__))
    if [positions[v] for v in ordered] != list(range(len(vertices))):
        raise AssertionError(("positions-not-a-permutation", positions))
    matches = []
    for subset in itertools.combinations(ordered, 5):
        for points in rotations(subset):
            if antecedent_holds(family, rows, points):
                matches.append(points)
    return matches


def theorem_cut(z3, positions, memberships, family: str, points: tuple[int, ...]):
    return z3.Or(
        z3.Not(cyclic_order_guard(z3, positions, points)),
        *(z3.Not(memberships[center, point])
          for center, point in family_literals(family, points)),
    )


def theorem_family_arity(family: str) -> int:
    if family == CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY:
        return CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["arity"]
    if family == CONVEX_FIVE_POINT_FAMILY:
        return CONVEX_FIVE_POINT_SCHEMA["arity"]
    if family == GLOBAL_KALMANSON_FAMILY:
        return GLOBAL_KALMANSON_SCHEMA["arity"]
    if family in dual_row_cegar.FAMILIES:
        return 5
    for registry in (
        dual_row_cegar.KALMANSON_FAMILIES,
        dual_row_cegar.LINEAR_ROW_FAMILIES,
        dual_row_cegar.RAW_EQUALITY_FAMILIES,
        dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
    ):
        if family in registry:
            return registry[family]["arity"]
    raise ValueError(("unknown-theorem-family", family))


def checked_vertex_tuple(values, *, label: str, size: int | None = None):
    if not isinstance(values, list) or any(type(value) is not int for value in values):
        raise ValueError((label, "expected-list-of-integers", values))
    points = tuple(values)
    if size is not None and len(points) != size:
        raise ValueError((label, "wrong-arity", size, points))
    if len(set(points)) != len(points) or any(point < 0 or point >= N for point in points):
        raise ValueError((label, "vertices-not-distinct-in-range", points))
    return points


class RestoreExpressionCache:
    """Intern immutable Z3 subexpressions during one checkpoint restore.

    Keys retain the exact ordered point tuples used by the formula builders.
    Guard kinds are tagged explicitly so cyclic, dihedral-cyclic, and linear
    formulas can never alias even when their ordered points agree.
    """

    def __init__(self, audit):
        self.audit = audit
        self.row_exists: dict[tuple[int, tuple[int, ...]], object] = {}
        self.guards: dict[tuple[str, tuple[int, ...]], object] = {}

    @staticmethod
    def _intern(cache, key, builder):
        try:
            return cache[key]
        except KeyError:
            formula = builder()
            cache[key] = formula
            return formula

    def row_exists_expr(self, center: int, points):
        ordered_points = tuple(points)
        key = (center, ordered_points)
        return self._intern(
            self.row_exists,
            key,
            lambda: dual_row_cegar.row_exists_expr(
                self.audit, center, ordered_points
            ),
        )

    def cyclic_guard(self, kind: str, points):
        ordered_points = tuple(points)
        key = (kind, ordered_points)
        try:
            return self.guards[key]
        except KeyError:
            pass
        if kind == "cyclic":
            formula = dual_row_cegar.cyclic_guard(
                self.audit.z3, self.audit.position, ordered_points
            )
        elif kind == "cyclic-up-to-orientation":
            formula = cyclic_order_up_to_orientation_guard(
                self.audit.z3, self.audit.position, ordered_points
            )
        else:
            raise ValueError(("unknown-cyclic-guard-kind", kind))
        self.guards[key] = formula
        return formula

    def linear_guard(self, points):
        ordered_points = tuple(points)
        key = ("linear", ordered_points)
        return self._intern(
            self.guards,
            key,
            lambda: dual_row_cegar.linear_guard(
                self.audit.z3, self.audit.position, ordered_points
            ),
        )


def restore_row_exists_expr(audit, cache, center, points):
    if cache is None:
        return dual_row_cegar.row_exists_expr(audit, center, points)
    return cache.row_exists_expr(center, points)


def add_structural_cut_key(
    audit, key: tuple, *, expression_cache: RestoreExpressionCache | None = None
) -> bool:
    kind = key[0]
    if kind == "circle":
        _, c, d, x, y, z = key
        atoms = [
            restore_row_exists_expr(audit, expression_cache, c, (x, y, z)),
            restore_row_exists_expr(audit, expression_cache, d, (x, y, z)),
        ]
    elif kind == "shared_pair":
        _, c, d, x, y = key
        atoms = [
            restore_row_exists_expr(audit, expression_cache, c, (x, y)),
            restore_row_exists_expr(audit, expression_cache, d, (x, y)),
            audit.z3.Not(
                audit.z3.Xor(
                    dual_row_cegar.between_expr(
                        audit.z3, audit.position, c, d, x
                    ),
                    dual_row_cegar.between_expr(
                        audit.z3, audit.position, c, d, y
                    ),
                )
            ),
        ]
    elif kind == "bisector":
        _, c, d, e, x, y = key
        atoms = [
            restore_row_exists_expr(audit, expression_cache, center, (x, y))
            for center in (c, d, e)
        ]
    elif kind == RAW_BTW_SEP_FAMILY:
        _, c, d, x, y = key
        formula = raw_btw_sep_cut(audit.z3, audit.position, audit.E, c, d, x, y)
        if key in audit.packet_cuts:
            return False
        audit.add(f"crossed_full_bank_cut_{kind}", formula)
        audit.packet_cuts[key] = formula
        return True
    elif kind == MUTUAL_BISECTOR_TRANSPORT_FAMILY:
        _, q, c1, c2 = key
        formula = mutual_bisector_transport_cut(audit.z3, audit.E, q, c1, c2)
        if key in audit.packet_cuts:
            return False
        audit.add(f"crossed_full_bank_cut_{kind}", formula)
        audit.packet_cuts[key] = formula
        return True
    else:
        raise ValueError(("unknown-structural-cut-kind", kind))
    return audit.add_guarded_cut(key, atoms)


def crossed_structural_violations(audit, model, context=None):
    return [
        *dual_row_cegar.structural_violations(audit, model, context),
        *mutual_bisector_transport_violations(audit, model, context),
        *raw_btw_sep_violations(audit, model, context),
    ]


def add_crossed_structural_violation(audit, violation) -> bool:
    if violation[0] in {
        RAW_BTW_SEP_FAMILY,
        MUTUAL_BISECTOR_TRANSPORT_FAMILY,
    }:
        return add_structural_cut_key(audit, violation)
    return dual_row_cegar.add_structural_violation(audit, violation)


def theorem_cut_key_from_match(match) -> tuple:
    family, points = match[:2]
    return ("theorem", family, *points)


def theorem_cut_guard_kind(family: str) -> str | None:
    """Return the guard semantics used by the theorem formula builder."""
    if family == CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY:
        return "unguarded"
    if family in dual_row_cegar.FAMILIES:
        return "cyclic"
    if family in dual_row_cegar.LINEAR_ROW_FAMILIES:
        return "linear"
    if family in {
        *dual_row_cegar.KALMANSON_FAMILIES,
        *dual_row_cegar.RAW_EQUALITY_FAMILIES,
        *dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
    }:
        return "linear"
    if family in {CONVEX_FIVE_POINT_FAMILY, GLOBAL_KALMANSON_FAMILY}:
        return "cyclic-up-to-orientation"
    return None


def valid_theorem_point_tuple(points: tuple, *, arity: int) -> bool:
    return (
        len(points) == arity
        and all(type(point) is int for point in points)
        and len(set(points)) == len(points)
        and all(0 <= point < N for point in points)
    )


def dual_row_pattern_signature(family: str, points: tuple) -> frozenset | None:
    """Order-free signature of the two selected-row antecedents."""
    try:
        center1, support1, center2, support2 = dual_row_cegar.pattern_atoms(
            family, points
        )
    except (AssertionError, TypeError, ValueError):
        return None
    rows = ((center1, tuple(support1)), (center2, tuple(support2)))
    if any(
        center not in points
        or not support
        or any(point not in points for point in support)
        or len(set(support)) != len(support)
        for center, support in rows
    ):
        return None
    return frozenset((center, frozenset(support)) for center, support in rows)


def canonical_exact_orbit_theorem_cut_key(key: tuple) -> tuple | None:
    """Witness the one exact legacy-family alias, or fail closed with None."""
    if (
        not isinstance(key, tuple)
        or len(key) < 2
        or key[0] != "theorem"
        or key[1] not in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
    ):
        return None
    source_family = key[1]
    target_family = EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES[source_family]
    try:
        source_arity = theorem_family_arity(source_family)
        target_arity = theorem_family_arity(target_family)
    except ValueError:
        return None
    points = tuple(key[2:])
    if source_arity != target_arity or not valid_theorem_point_tuple(
        points, arity=source_arity
    ):
        return None

    target_points = (points[-1], *points[:-1])
    source_signature = dual_row_pattern_signature(source_family, points)
    target_signature = dual_row_pattern_signature(target_family, target_points)
    if (
        theorem_cut_guard_kind(source_family) != "cyclic"
        or theorem_cut_guard_kind(target_family) != "cyclic"
        or target_points not in rotations(points)
        or source_signature is None
        or source_signature != target_signature
    ):
        return None
    return ("theorem", target_family, *target_points)


def subsuming_theorem_cut_key(key: tuple) -> tuple | None:
    if len(key) < 3 or key[0] != "theorem":
        return None
    raw_family = SUBSUMED_THEOREM_CUT_FAMILIES.get(key[1])
    if raw_family is None:
        return None
    return ("theorem", raw_family, *key[2:])


def subsumed_theorem_cut_key(key: tuple) -> tuple | None:
    if len(key) < 3 or key[0] != "theorem":
        return None
    selected_family = SUBSUMING_THEOREM_CUT_FAMILIES.get(key[1])
    if selected_family is None:
        return None
    return ("theorem", selected_family, *key[2:])


def theorem_cut_order(key: tuple) -> tuple:
    return THEOREM_FAMILY_ORDER[key[1]], key[2:]


def canonical_theorem_cut_keys(
    keys, *, already_installed=()
) -> tuple[tuple[tuple, ...], tuple[tuple, ...]]:
    """Normalize exact orbit aliases, then drop logically subsumed cuts.

    All candidate keys are inspected before any formula is installed, so the
    result is independent of manifest/matcher insertion order.  Family order
    remains the registered theorem-bank order for stable solver construction.
    """
    unique_input_keys = tuple(dict.fromkeys(keys))
    normalized_keys = []
    suppressed = []
    for key in unique_input_keys:
        canonical_key = canonical_exact_orbit_theorem_cut_key(key)
        if canonical_key is not None:
            normalized_keys.append(canonical_key)
            suppressed.append(key)
        else:
            normalized_keys.append(key)
    unique_keys = tuple(dict.fromkeys(normalized_keys))
    normalized_installed = tuple(
        canonical_exact_orbit_theorem_cut_key(key) or key
        for key in already_installed
    )
    available = set(unique_keys) | set(normalized_installed)
    kept = []
    for key in unique_keys:
        subsuming_key = subsuming_theorem_cut_key(key)
        destination = suppressed if subsuming_key in available else kept
        destination.append(key)
    return (
        tuple(sorted(kept, key=theorem_cut_order)),
        tuple(sorted(suppressed, key=theorem_cut_order)),
    )


def retire_exact_orbit_theorem_cut_keys(packet_cuts) -> tuple[tuple, ...]:
    """Re-key any in-memory legacy formula without asserting a duplicate."""
    retired = []
    for key in tuple(packet_cuts):
        canonical_key = canonical_exact_orbit_theorem_cut_key(key)
        if canonical_key is None:
            continue
        formula = packet_cuts.pop(key)
        packet_cuts.setdefault(canonical_key, formula)
        retired.append(key)
    return tuple(sorted(retired, key=theorem_cut_order))


def retire_subsumed_theorem_cut_keys(packet_cuts) -> tuple[tuple, ...]:
    """Canonicalize bookkeeping after a raw cut supersedes an older cut.

    Solver assertions are monotone, so an already-installed selected-row
    formula remains asserted for the current process.  Its exact raw
    subsumer makes it logically redundant; removing only its packet key
    ensures checkpoints and subsequent resumes do not reconstruct it.
    """
    retired = []
    raw_keys = tuple(
        key
        for key in packet_cuts
        if key[0] == "theorem" and key[1] in SUBSUMING_THEOREM_CUT_FAMILIES
    )
    for raw_key in raw_keys:
        selected_key = subsumed_theorem_cut_key(raw_key)
        if selected_key in packet_cuts:
            packet_cuts.pop(selected_key)
            retired.append(selected_key)
    return tuple(sorted(retired, key=theorem_cut_order))


def theorem_cut_atoms(
    audit, key: tuple, *, expression_cache: RestoreExpressionCache | None = None
) -> list:
    _, family, *points = key
    points = tuple(points)
    if family == CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY:
        atoms = [
            audit.E(points[center], points[left], points[right])
            for center, left, right in CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA[
                "equalities"
            ]
        ]
    elif family == CONVEX_FIVE_POINT_FAMILY:
        atoms = [
            expression_cache.cyclic_guard("cyclic-up-to-orientation", points)
            if expression_cache is not None
            else cyclic_order_up_to_orientation_guard(
                audit.z3, audit.position, points
            )
        ]
        atoms.extend(
            audit.E(points[center], points[left], points[right])
            for center, left, right in CONVEX_FIVE_POINT_SCHEMA["equalities"]
        )
    elif family == GLOBAL_KALMANSON_FAMILY:
        atoms = [
            expression_cache.cyclic_guard("cyclic-up-to-orientation", points)
            if expression_cache is not None
            else cyclic_order_up_to_orientation_guard(
                audit.z3, audit.position, points
            )
        ]
        atoms.extend(
            audit.E(points[center], points[left], points[right])
            for center, left, right in GLOBAL_KALMANSON_SCHEMA["equalities"]
        )
    elif family in dual_row_cegar.FAMILIES:
        c1, pts1, c2, pts2 = dual_row_cegar.pattern_atoms(family, points)
        atoms = [
            expression_cache.cyclic_guard("cyclic", points)
            if expression_cache is not None
            else dual_row_cegar.cyclic_guard(audit.z3, audit.position, points),
            restore_row_exists_expr(audit, expression_cache, c1, pts1),
            restore_row_exists_expr(audit, expression_cache, c2, pts2),
        ]
    elif family in dual_row_cegar.LINEAR_ROW_FAMILIES:
        schema = dual_row_cegar.LINEAR_ROW_FAMILIES[family]
        atoms = [
            expression_cache.linear_guard(points)
            if expression_cache is not None
            else dual_row_cegar.linear_guard(audit.z3, audit.position, points)
        ]
        atoms.extend(
            restore_row_exists_expr(
                audit,
                expression_cache,
                points[center],
                tuple(points[index] for index in support),
            )
            for center, support in schema["rows"]
        )
    else:
        equality_registries = (
            dual_row_cegar.KALMANSON_FAMILIES,
            dual_row_cegar.RAW_EQUALITY_FAMILIES,
            dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
        )
        schema = next(registry[family] for registry in equality_registries if family in registry)
        atoms = [
            expression_cache.linear_guard(points)
            if expression_cache is not None
            else dual_row_cegar.linear_guard(audit.z3, audit.position, points)
        ]
        atoms.extend(
            audit.E(points[center], points[left], points[right])
            for center, left, right in schema["equalities"]
        )
    return atoms


def theorem_cut_formula(
    audit, key: tuple, *, expression_cache: RestoreExpressionCache | None = None
):
    """Build the exact formula asserted for a theorem key after normalization."""
    canonical_key = canonical_exact_orbit_theorem_cut_key(key) or key
    return guarded_cut_formula(
        audit.z3,
        theorem_cut_atoms(
            audit, canonical_key, expression_cache=expression_cache
        ),
    )


def add_theorem_cut_key(
    audit, key: tuple, *, expression_cache: RestoreExpressionCache | None = None
) -> bool:
    canonical_key = canonical_exact_orbit_theorem_cut_key(key) or key
    return audit.add_guarded_cut(
        canonical_key,
        theorem_cut_atoms(
            audit, canonical_key, expression_cache=expression_cache
        ),
    )


def install_theorem_cut_keys(
    audit,
    keys,
    *,
    expression_cache: RestoreExpressionCache | None = None,
    require_fresh: bool = False,
) -> dict[str, tuple[tuple, ...]]:
    retired_orbit = retire_exact_orbit_theorem_cut_keys(audit.packet_cuts)
    existing = tuple(key for key in audit.packet_cuts if key[0] == "theorem")
    kept, suppressed = canonical_theorem_cut_keys(
        keys, already_installed=existing
    )
    added = []
    already_present = []
    for key in kept:
        if add_theorem_cut_key(
            audit, key, expression_cache=expression_cache
        ):
            added.append(key)
        else:
            already_present.append(key)
    if require_fresh and already_present:
        raise AssertionError((
            "duplicate-theorem-cut-during-install",
            tuple(already_present),
        ))
    retired_subsumed = retire_subsumed_theorem_cut_keys(audit.packet_cuts)
    retired = tuple(sorted(
        (*retired_orbit, *retired_subsumed), key=theorem_cut_order
    ))
    return {
        "added": tuple(added),
        "already_present": tuple(already_present),
        "retired": retired,
        "suppressed": suppressed,
        "retired_exact_orbit": retired_orbit,
        "retired_subsumed": retired_subsumed,
        "suppressed_exact_orbit": tuple(
            key
            for key in suppressed
            if key[1] in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
        ),
        "suppressed_subsumed": tuple(
            key
            for key in suppressed
            if key[1] in SUBSUMED_THEOREM_CUT_FAMILIES
        ),
    }


def learned_cut_manifest(audit) -> dict[str, object]:
    structural = []
    theorem = []
    for key in audit.packet_cuts:
        destination = theorem if key[0] == "theorem" else structural
        destination.append(key)
    theorem, suppressed = canonical_theorem_cut_keys(theorem)
    if suppressed:
        raise AssertionError(("subsumed-theorem-cuts-reached-manifest", suppressed))
    return {
        "schema": CUT_SCHEMA,
        "critical_no_K4_representation": audit.critical_k4_representation,
        "structural_families": list(STRUCTURAL_FAMILIES),
        "theorem_families": list(FULL_BANK_FAMILIES),
        "connectivity": [sorted(cut) for cut in audit.cuts],
        "structural": sorted(list(key) for key in structural),
        "theorem": sorted(list(key) for key in theorem),
    }


def validate_structural_key(raw_key, *, allowed_families=STRUCTURAL_FAMILIES) -> tuple:
    if not isinstance(raw_key, list) or not raw_key or raw_key[0] not in allowed_families:
        raise ValueError(("invalid-structural-cut-key", raw_key))
    kind = raw_key[0]
    expected = {
        "circle": 6,
        "shared_pair": 5,
        "bisector": 6,
        RAW_BTW_SEP_FAMILY: 5,
        MUTUAL_BISECTOR_TRANSPORT_FAMILY: 4,
    }[kind]
    points = checked_vertex_tuple(raw_key[1:], label=f"structural:{kind}", size=expected - 1)
    key = (kind, *points)
    if kind == MUTUAL_BISECTOR_TRANSPORT_FAMILY:
        if points[1] >= points[2]:
            raise ValueError(("noncanonical-mutual-bisector-centers", key))
    else:
        center_count = 3 if kind == "bisector" else 2
        if tuple(sorted(points[:center_count])) != points[:center_count]:
            raise ValueError(("noncanonical-structural-centers", key))
        if tuple(sorted(points[center_count:])) != points[center_count:]:
            raise ValueError(("noncanonical-structural-points", key))
    return key


def validate_theorem_key(raw_key, *, allowed_families=FULL_BANK_FAMILIES) -> tuple:
    if not isinstance(raw_key, list) or len(raw_key) < 3 or raw_key[0] != "theorem":
        raise ValueError(("invalid-theorem-cut-key", raw_key))
    family = raw_key[1]
    if not isinstance(family, str) or family not in allowed_families:
        raise ValueError(("incompatible-theorem-family", family))
    points = checked_vertex_tuple(
        raw_key[2:], label=f"theorem:{family}", size=theorem_family_arity(family)
    )
    return ("theorem", family, *points)


def restore_learned_cuts(audit, arm: str, result_path: Path) -> dict[str, object]:
    try:
        payload = json.loads(result_path.read_text())
    except (OSError, json.JSONDecodeError) as exc:
        raise ValueError(("unreadable-resume-result", str(result_path), str(exc))) from exc
    return restore_learned_cuts_payload(
        audit,
        arm,
        payload,
        str(result_path.resolve()),
        allowed_schema_pairs=ORDINARY_RESUME_SCHEMA_PAIRS,
    )


def structural_families_for_schema_pair(schema_pair):
    if schema_pair == (RESULT_SCHEMA, CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (OLDEST_RESULT_SCHEMA, OLDEST_CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (PREHISTORIC_RESULT_SCHEMA, PREHISTORIC_CUT_SCHEMA):
        return PRE_TRANSPORT_STRUCTURAL_FAMILIES
    if schema_pair in {
        (ARCHAIC_RESULT_SCHEMA, ARCHAIC_CUT_SCHEMA),
        (PRIMORDIAL_RESULT_SCHEMA, PRIMORDIAL_CUT_SCHEMA),
    }:
        return BASE_STRUCTURAL_FAMILIES
    raise ValueError(("unknown-schema-pair", schema_pair))


def theorem_families_for_schema_pair(schema_pair):
    if schema_pair == (RESULT_SCHEMA, CUT_SCHEMA):
        return FULL_BANK_FAMILIES
    if schema_pair == (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA):
        return PRE_SEVEN_POINT_THEOREM_FAMILIES
    if schema_pair == (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA):
        return PRE_GLOBAL_THEOREM_FAMILIES
    if schema_pair == (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA):
        return PRE_CONVEX_THEOREM_FAMILIES
    if schema_pair in {
        (OLDEST_RESULT_SCHEMA, OLDEST_CUT_SCHEMA),
        (PREHISTORIC_RESULT_SCHEMA, PREHISTORIC_CUT_SCHEMA),
        (ARCHAIC_RESULT_SCHEMA, ARCHAIC_CUT_SCHEMA),
        (PRIMORDIAL_RESULT_SCHEMA, PRIMORDIAL_CUT_SCHEMA),
    }:
        return LEGACY_THEOREM_FAMILIES
    raise ValueError(("unknown-schema-pair", schema_pair))


def accepted_theorem_family_manifests(schema_pair):
    if schema_pair == (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA):
        # v7/v5 existed briefly before the exact-11 six-role family was
        # registered.  Accept that frozen manifest as well as its final one.
        return (LEGACY_THEOREM_FAMILIES, PRE_CONVEX_THEOREM_FAMILIES)
    return (theorem_families_for_schema_pair(schema_pair),)


def restore_learned_cuts_payload(
    audit,
    arm: str,
    payload,
    source_result: str,
    *,
    allowed_schema_pairs=((RESULT_SCHEMA, CUT_SCHEMA),),
    require_same_arm: bool = True,
    mode: str = "resume",
) -> dict[str, object]:
    if not isinstance(payload, dict):
        raise ValueError(("invalid-result-payload", type(payload).__name__))
    manifest = payload.get("learned_cuts")
    if not isinstance(manifest, dict):
        raise ValueError(("missing-cut-manifest", type(manifest).__name__))
    representation_field = "critical_no_K4_representation"
    result_has_representation = representation_field in payload
    manifest_has_representation = representation_field in manifest
    result_representation = payload.get(representation_field)
    manifest_representation = manifest.get(representation_field)
    if not result_has_representation and not manifest_has_representation:
        source_critical_k4_representation = (
            incidence_cegar.LEGACY_CRITICAL_K4_REPRESENTATION
        )
    elif not result_has_representation:
        source_critical_k4_representation = manifest_representation
    elif not manifest_has_representation:
        source_critical_k4_representation = result_representation
    elif result_representation != manifest_representation:
        raise ValueError((
            "incompatible-critical-k4-representation-records",
            result_representation,
            manifest_representation,
        ))
    else:
        source_critical_k4_representation = result_representation
    critical_k4_artifact_suffix(source_critical_k4_representation)
    schema_pair = (payload.get("schema"), manifest.get("schema"))
    if schema_pair not in allowed_schema_pairs:
        raise ValueError(("incompatible-result-schema", payload.get("schema") if isinstance(payload, dict) else None))
    expected = {"n": N, "closed_cap_profile": list(PROFILE)}
    if require_same_arm:
        expected["arm"] = arm
    elif payload.get("arm") not in ARMS:
        raise ValueError(("invalid-source-arm", payload.get("arm")))
    for field, value in expected.items():
        if payload.get(field) != value:
            raise ValueError(("incompatible-resume-result", field, value, payload.get(field)))
    expected_structural_families = structural_families_for_schema_pair(schema_pair)
    if manifest.get("structural_families") != list(expected_structural_families):
        raise ValueError(("incompatible-structural-families", manifest.get("structural_families")))
    raw_theorem_families = manifest.get("theorem_families")
    accepted_theorem_families = accepted_theorem_family_manifests(schema_pair)
    if raw_theorem_families not in [list(families) for families in accepted_theorem_families]:
        raise ValueError(("incompatible-theorem-families", manifest.get("theorem_families")))
    declared_theorem_families = tuple(raw_theorem_families)

    raw_connectivity = manifest.get("connectivity")
    raw_structural = manifest.get("structural")
    raw_theorem = manifest.get("theorem")
    if not all(isinstance(keys, list) for keys in (raw_connectivity, raw_structural, raw_theorem)):
        raise ValueError("resume cut collections must be lists")
    connectivity = [
        checked_vertex_tuple(key, label="connectivity") for key in raw_connectivity
    ]
    if any(not cut or len(cut) == N or tuple(sorted(cut)) != cut for cut in connectivity):
        raise ValueError(("noncanonical-connectivity-cut", connectivity))
    structural = [
        validate_structural_key(key, allowed_families=expected_structural_families)
        for key in raw_structural
    ]
    theorem = [
        validate_theorem_key(key, allowed_families=declared_theorem_families)
        for key in raw_theorem
    ]
    for label, keys in (
        ("connectivity", connectivity), ("structural", structural), ("theorem", theorem)
    ):
        if len(set(keys)) != len(keys):
            raise ValueError(("duplicate-resume-cut-key", label))

    # Keep validation authoritative: build/cache formulas only after every key passes.
    expression_cache = RestoreExpressionCache(audit)
    for cut in connectivity:
        audit.add_cut(frozenset(cut))
    for key in structural:
        if not add_structural_cut_key(
            audit, key, expression_cache=expression_cache
        ):
            raise AssertionError(("duplicate-structural-cut-during-restore", key))
    theorem_install = install_theorem_cut_keys(
        audit,
        theorem,
        expression_cache=expression_cache,
        require_fresh=True,
    )
    suppressed_counts = collections.Counter(
        key[1] for key in theorem_install["suppressed"]
    )
    retired_counts = collections.Counter(
        key[1] for key in theorem_install["retired"]
    )
    suppressed_subsumed_counts = collections.Counter(
        key[1] for key in theorem_install["suppressed_subsumed"]
    )
    retired_subsumed_counts = collections.Counter(
        key[1] for key in theorem_install["retired_subsumed"]
    )
    suppressed_orbit_counts = collections.Counter(
        key[1] for key in theorem_install["suppressed_exact_orbit"]
    )
    retired_orbit_counts = collections.Counter(
        key[1] for key in theorem_install["retired_exact_orbit"]
    )
    return {
        "used": True,
        "mode": mode,
        "source_result": source_result,
        "source_arm": payload.get("arm"),
        "source_forced_shared_fourth": payload.get("forced_shared_fourth"),
        "source_result_schema": schema_pair[0],
        "source_cut_schema": schema_pair[1],
        "source_critical_no_K4_representation": (
            source_critical_k4_representation
        ),
        "target_critical_no_K4_representation": (
            audit.critical_k4_representation
        ),
        "connectivity_cut_count": len(connectivity),
        "structural_cut_count": len(structural),
        "theorem_cut_count": len(theorem_install["added"]),
        "source_theorem_cut_count": len(theorem),
        "suppressed_theorem_cut_count": len(theorem_install["suppressed"]),
        "suppressed_theorem_cut_counts": dict(sorted(suppressed_counts.items())),
        "retired_theorem_cut_count": len(theorem_install["retired"]),
        "retired_theorem_cut_counts": dict(sorted(retired_counts.items())),
        "suppressed_exact_orbit_theorem_cut_count": len(
            theorem_install["suppressed_exact_orbit"]
        ),
        "suppressed_exact_orbit_theorem_cut_counts": dict(
            sorted(suppressed_orbit_counts.items())
        ),
        "retired_exact_orbit_theorem_cut_count": len(
            theorem_install["retired_exact_orbit"]
        ),
        "retired_exact_orbit_theorem_cut_counts": dict(
            sorted(retired_orbit_counts.items())
        ),
        "suppressed_subsumed_theorem_cut_count": len(
            theorem_install["suppressed_subsumed"]
        ),
        "suppressed_subsumed_theorem_cut_counts": dict(
            sorted(suppressed_subsumed_counts.items())
        ),
        "retired_subsumed_theorem_cut_count": len(
            theorem_install["retired_subsumed"]
        ),
        "retired_subsumed_theorem_cut_counts": dict(
            sorted(retired_subsumed_counts.items())
        ),
    }


def import_universal_cuts(audit, arm: str, result_path: Path) -> dict[str, object]:
    """Reconstruct sound global cuts from a compatible older base model.

    Unlike ordinary resume, this deliberately ignores the source arm.  Every
    imported connectivity, structural, and theorem cut is arm-independent;
    all keys are still validated and all formulas are rebuilt locally.
    """
    try:
        payload = json.loads(result_path.read_text())
    except (OSError, json.JSONDecodeError) as exc:
        raise ValueError(("unreadable-cut-import", str(result_path), str(exc))) from exc
    return restore_learned_cuts_payload(
        audit,
        arm,
        payload,
        str(result_path.resolve()),
        allowed_schema_pairs=(
            (RESULT_SCHEMA, CUT_SCHEMA),
            (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),
            (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA),
            (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA),
            (OLDEST_RESULT_SCHEMA, OLDEST_CUT_SCHEMA),
            (PREHISTORIC_RESULT_SCHEMA, PREHISTORIC_CUT_SCHEMA),
            (ARCHAIC_RESULT_SCHEMA, ARCHAIC_CUT_SCHEMA),
            (PRIMORDIAL_RESULT_SCHEMA, PRIMORDIAL_CUT_SCHEMA),
        ),
        require_same_arm=False,
        mode="universal-cut-import",
    )


def crossed_arm_point_roles(arm: str, q_source, q_other):
    if arm == "source-at-common":
        return q_source, q_other
    if arm == "other-at-common":
        return q_other, q_source
    raise ValueError(arm)


def crossed_arm_polarity_clauses(
    z3,
    guard,
    common_blocker,
    opposite_blocker,
    common_contains_common,
    common_contains_opposite,
    opposite_contains_common,
    opposite_contains_opposite,
):
    return (
        z3.Or(z3.Not(guard), z3.Not(common_blocker), common_contains_common),
        z3.Or(z3.Not(guard), z3.Not(common_blocker), z3.Not(common_contains_opposite)),
        z3.Or(z3.Not(guard), z3.Not(opposite_blocker), opposite_contains_opposite),
        z3.Or(z3.Not(guard), z3.Not(opposite_blocker), z3.Not(opposite_contains_common)),
    )


def crossed_arm_polarity_self_check() -> dict[str, object]:
    """Truth-table check for both arm mappings and all four guarded literals."""
    import z3

    expected_roles = {
        "source-at-common": ("Q.source", "Q.otherOutsidePoint"),
        "other-at-common": ("Q.otherOutsidePoint", "Q.source"),
    }
    arm_checks = {}
    for arm in ARMS:
        roles = crossed_arm_point_roles(arm, "Q.source", "Q.otherOutsidePoint")
        if roles != expected_roles[arm]:
            raise AssertionError(("crossed-arm-role-mapping", arm, roles))

        guard = z3.Bool(f"polarity_{arm}_guard")
        common_blocker = z3.Bool(f"polarity_{arm}_common_blocker")
        opposite_blocker = z3.Bool(f"polarity_{arm}_opposite_blocker")
        common_contains_common = z3.Bool(f"polarity_{arm}_common_contains_common")
        common_contains_opposite = z3.Bool(f"polarity_{arm}_common_contains_opposite")
        opposite_contains_common = z3.Bool(f"polarity_{arm}_opposite_contains_common")
        opposite_contains_opposite = z3.Bool(f"polarity_{arm}_opposite_contains_opposite")
        clauses = crossed_arm_polarity_clauses(
            z3,
            guard,
            common_blocker,
            opposite_blocker,
            common_contains_common,
            common_contains_opposite,
            opposite_contains_common,
            opposite_contains_opposite,
        )

        def require(expected, label, *assumptions):
            solver = z3.Solver()
            solver.add(*clauses, *assumptions)
            outcome = solver.check()
            if outcome != expected:
                raise AssertionError(("crossed-arm-polarity", arm, label, outcome))

        wrong_active_literals = (
            z3.Not(common_contains_common),
            common_contains_opposite,
            opposite_contains_common,
            z3.Not(opposite_contains_opposite),
        )
        for index, wrong_literal in enumerate(wrong_active_literals):
            require(
                z3.unsat,
                f"active-implication-{index}",
                guard,
                common_blocker,
                opposite_blocker,
                wrong_literal,
            )

        membership_terms = (
            common_contains_common,
            common_contains_opposite,
            opposite_contains_common,
            opposite_contains_opposite,
        )
        for values in itertools.product((False, True), repeat=4):
            assignments = tuple(term == value for term, value in zip(membership_terms, values))
            require(
                z3.sat,
                f"guard-false-unconstrained-{values}",
                z3.Not(guard),
                common_blocker,
                opposite_blocker,
                *assignments,
            )

        for values in itertools.product((False, True), repeat=2):
            common_assignments = (
                common_contains_common == values[0],
                common_contains_opposite == values[1],
            )
            require(
                z3.sat,
                f"common-blocker-false-unconstrained-{values}",
                guard,
                z3.Not(common_blocker),
                opposite_blocker,
                opposite_contains_opposite,
                z3.Not(opposite_contains_common),
                *common_assignments,
            )
            opposite_assignments = (
                opposite_contains_common == values[0],
                opposite_contains_opposite == values[1],
            )
            require(
                z3.sat,
                f"opposite-blocker-false-unconstrained-{values}",
                guard,
                common_blocker,
                z3.Not(opposite_blocker),
                common_contains_common,
                z3.Not(common_contains_opposite),
                *opposite_assignments,
            )

        arm_checks[arm] = {
            "common_point": roles[0],
            "opposite_point": roles[1],
            "active_implications_checked": 4,
            "guard_false_assignments_checked": 16,
            "common_blocker_false_assignments_checked": 4,
            "opposite_blocker_false_assignments_checked": 4,
        }
    return {"status": "POLARITY_OK", "arms": arm_checks}


def add_explicit_q_pair_and_crossed_arm(
    audit: incidence_cegar.Audit, arm: str, force_shared_fourth: bool = False
):
    """Force one live crossed arm, including both complementary omissions."""
    if arm not in ARMS:
        raise ValueError(arm)
    z3 = audit.z3
    p1, _ = audit.pair_p
    r1, _ = audit.pair_r
    q1, _ = audit.pair_q
    ordered_pairs = tuple(itertools.permutations(sorted(audit.outside_first), 2))
    selected = {
        pair: z3.Bool(f"live_Q_pair_{pair[0]}_{pair[1]}") for pair in ordered_pairs
    }
    audit.exactly("live_Q_ordered_outside_pair_selector", selected.values(), 1)

    for (q_source, q_other), guard in selected.items():
        # Q.blockers_eq: Q.source has the same actual blocker as P.source1.
        for center in audit.vs:
            audit.add(
                "live_Q_source_same_actual_blocker",
                z3.Or(z3.Not(guard), audit.b[q_source, center] == audit.b[p1, center]),
            )
            # Both named points belong to the first-blocker shell.  Together
            # with exact row cardinality and its exact cap intersection, this
            # replays outside_eq_pair rather than merely choosing labels.
            audit.add(
                "live_Q_named_pair_in_first_blocker_row",
                z3.Or(z3.Not(guard), z3.Not(audit.b[p1, center]), audit.m[center, q_source]),
                z3.Or(z3.Not(guard), z3.Not(audit.b[p1, center]), audit.m[center, q_other]),
            )

            common_point, opposite_point = crossed_arm_point_roles(arm, q_source, q_other)
            # selectedAt source is the q-common blocker row; selectedAt
            # P-rho.source1 is the opposite collision blocker row.
            audit.add(
                f"crossed_arm_{arm}",
                *crossed_arm_polarity_clauses(
                    z3,
                    guard,
                    audit.b[q1, center],
                    audit.b[r1, center],
                    audit.m[center, common_point],
                    audit.m[center, opposite_point],
                    audit.m[center, common_point],
                    audit.m[center, opposite_point],
                ),
            )
        if force_shared_fourth:
            common_point, opposite_point = crossed_arm_point_roles(
                arm, q_source, q_other
            )
            named = {q1, audit.pair_q[1], r1, audit.pair_r[1],
                     common_point, opposite_point}
            shared_cases = []
            for point in audit.vs:
                if point in named:
                    continue
                common_membership = z3.Or(*(
                    z3.And(audit.b[q1, center], audit.m[center, point])
                    for center in audit.vs
                ))
                opposite_membership = z3.Or(*(
                    z3.And(audit.b[r1, center], audit.m[center, point])
                    for center in audit.vs
                ))
                shared_cases.append(z3.And(common_membership, opposite_membership))
            audit.add(
                "crossed_arm_shared_fourth",
                z3.Or(z3.Not(guard), z3.Or(*shared_cases)),
            )
    return selected


def model_data(audit: incidence_cegar.Audit, model, context=None):
    if context is not None:
        rows = {
            row.fixed_center: context.supports[row]
            for row in audit.row_objects
            if row.fixed_center is not None
        }
        return context.positions, rows
    positions = {
        v: model.eval(audit.position[v], model_completion=True).as_long()
        for v in audit.vs
    }
    rows = {v: audit.row(model, v) for v in audit.vs}
    return positions, rows


def selected_q_pair(audit: incidence_cegar.Audit, model, selectors):
    chosen = [pair for pair, term in selectors.items() if audit.truth(model, term)]
    if len(chosen) != 1:
        raise AssertionError(("live-Q-pair-selector", chosen))
    return chosen[0]


def replay_crossed_arm(
    audit, model, selectors, arm: str, context=None,
    force_shared_fourth: bool = False,
) -> dict[str, object]:
    if context is None:
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    base = audit.replay(model)
    positions, rows = model_data(audit, model, context)
    blockers = {s: audit.blocker(model, s) for s in audit.vs}
    q_source, q_other = selected_q_pair(audit, model, selectors)
    p1, p2 = audit.pair_p
    r1, r2 = audit.pair_r
    q1, q2 = audit.pair_q
    bp, br, bq = blockers[p1], blockers[r1], blockers[q1]

    if q_source == q_other or {q_source, q_other} - set(audit.outside_first):
        raise AssertionError(("outside-pair-domain", q_source, q_other))
    if blockers[q_source] != bp:
        raise AssertionError(("Q-source-blocker", q_source, blockers[q_source], bp))
    if rows[bp] & set(audit.outside_first) != {q_source, q_other}:
        raise AssertionError(
            ("Q-outside-eq-pair", rows[bp] & set(audit.outside_first), q_source, q_other)
        )

    common_point, opposite_point = crossed_arm_point_roles(arm, q_source, q_other)
    if (
        common_point not in rows[bq]
        or opposite_point in rows[bq]
        or opposite_point not in rows[br]
        or common_point in rows[br]
    ):
        raise AssertionError(
            (
                "crossed-arm-memberships-and-omissions",
                arm,
                common_point,
                rows[bq],
                opposite_point,
                rows[br],
            )
        )

    common_fourth = rows[bq] - {q1, q2, common_point}
    opposite_fourth = rows[br] - {r1, r2, opposite_point}
    if len(common_fourth) != 1 or len(opposite_fourth) != 1:
        raise AssertionError((
            "crossed-arm-anonymous-fourths", common_fourth, opposite_fourth
        ))
    common_fourth_vertex = next(iter(common_fourth))
    opposite_fourth_vertex = next(iter(opposite_fourth))
    if force_shared_fourth and common_fourth_vertex != opposite_fourth_vertex:
        raise AssertionError((
            "forced-shared-fourth", common_fourth_vertex, opposite_fourth_vertex
        ))

    structural = crossed_structural_violations(audit, model, context)
    if structural:
        raise AssertionError(("structural-bank-survivor", structural[:10]))
    family_counts = {family: 0 for family in FULL_BANK_FAMILIES}
    for matches, _add_match in full_bank_match_groups(audit, model, context):
        for match in matches:
            family_counts[match[0]] += 1
    active = {family: count for family, count in family_counts.items() if count}
    if active:
        raise AssertionError(("full-theorem-bank-survivor", active))

    base["live_Lean_mapping"] = {
        "P.source1": audit.names[p1],
        "P.source2": audit.names[p2],
        "P_rho.source1": audit.names[r1],
        "P_rho.source2": audit.names[r2],
        "source_representative": audit.names[q1],
        "source_prime_representative": audit.names[q2],
        "Q.source": audit.names[q_source],
        "Q.otherOutsidePoint": audit.names[q_other],
        "first_collision_blocker_row_center_bp": audit.names[bp],
        "common_source_row_center_bq": audit.names[bq],
        "opposite_collision_blocker_row_center_br": audit.names[br],
        "forced_crossed_arm": arm,
        "forced_common_row_point": audit.names[common_point],
        "forced_common_row_omitted_point": audit.names[opposite_point],
        "forced_opposite_row_point": audit.names[opposite_point],
        "forced_opposite_row_omitted_point": audit.names[common_point],
        "common_fourth": audit.names[common_fourth_vertex],
        "opposite_fourth": audit.names[opposite_fourth_vertex],
    }
    base["crossed_arm_replay"] = {
        "status": "PASS",
        "ordered_pair_unique": True,
        "source_same_actual_blocker_as_P_source1": True,
        "outside_eq_pair_replayed": True,
        "forced_memberships_and_complementary_omissions_replayed": True,
        "forced_shared_fourth": force_shared_fourth,
        "shared_fourth_replayed": common_fourth_vertex == opposite_fourth_vertex,
        "structural_bank_active_match_count": len(structural),
        "full_theorem_bank_active_match_counts": family_counts,
        "all_registered_selected_row_and_raw_equality_theorem_families_replayed": True,
    }
    base["radius_classes"] = dual_row_cegar.named_radius_classes(audit, model, context)
    return base


def restore_expression_cache_self_check(
    audit=None,
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    """Check exact AST/sexpr fidelity and exact ordered cache keys."""
    if audit is None:
        audit = CrossedAudit(critical_k4_representation)
    cache = RestoreExpressionCache(audit)

    row_points = (1, 2, 3)
    cached_row = cache.row_exists_expr(0, row_points)
    if cache.row_exists_expr(0, row_points) is not cached_row:
        raise AssertionError("row-exists expression was not interned")
    if cached_row.sexpr() != dual_row_cegar.row_exists_expr(
        audit, 0, row_points
    ).sexpr():
        raise AssertionError("cached row-exists expression changed")
    reversed_row_points = tuple(reversed(row_points))
    reversed_row = cache.row_exists_expr(0, reversed_row_points)
    if reversed_row is cached_row:
        raise AssertionError("ordered row-exists supports aliased")
    if reversed_row.sexpr() != dual_row_cegar.row_exists_expr(
        audit, 0, reversed_row_points
    ).sexpr():
        raise AssertionError("ordered cached row-exists expression changed")

    cyclic_points = (0, 1, 2, 3, 4)
    cached_cyclic = cache.cyclic_guard("cyclic", cyclic_points)
    if cache.cyclic_guard("cyclic", cyclic_points) is not cached_cyclic:
        raise AssertionError("cyclic guard was not interned")
    if cached_cyclic.sexpr() != dual_row_cegar.cyclic_guard(
        audit.z3, audit.position, cyclic_points
    ).sexpr():
        raise AssertionError("cached cyclic guard changed")
    reordered_cyclic_points = (0, 2, 1, 3, 4)
    reordered_cyclic = cache.cyclic_guard("cyclic", reordered_cyclic_points)
    if reordered_cyclic is cached_cyclic:
        raise AssertionError("ordered cyclic guard tuples aliased")
    if reordered_cyclic.sexpr() != dual_row_cegar.cyclic_guard(
        audit.z3, audit.position, reordered_cyclic_points
    ).sexpr():
        raise AssertionError("ordered cached cyclic guard changed")
    cached_dihedral = cache.cyclic_guard(
        "cyclic-up-to-orientation", cyclic_points
    )
    if cached_dihedral is cached_cyclic:
        raise AssertionError("distinct cyclic guard kinds aliased")
    if cached_dihedral.sexpr() != cyclic_order_up_to_orientation_guard(
        audit.z3, audit.position, cyclic_points
    ).sexpr():
        raise AssertionError("cached dihedral cyclic guard changed")

    linear_points = (0, 1, 2, 3, 4, 5)
    cached_linear = cache.linear_guard(linear_points)
    if cache.linear_guard(linear_points) is not cached_linear:
        raise AssertionError("linear guard was not interned")
    if cached_linear.sexpr() != dual_row_cegar.linear_guard(
        audit.z3, audit.position, linear_points
    ).sexpr():
        raise AssertionError("cached linear guard changed")
    reordered_linear_points = (0, 2, 1, 3, 4, 5)
    if cache.linear_guard(reordered_linear_points) is cached_linear:
        raise AssertionError("ordered linear guard tuples aliased")

    return {
        "status": "EXACT_CACHE_OK",
        "row_exists_entries": len(cache.row_exists),
        "typed_guard_entries": len(cache.guards),
        "same_key_identity_checks": 3,
        "cached_vs_uncached_sexpr_checks": 6,
    }


def theorem_cut_subsumption_self_check(
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    """Prove the two exact guard/antecedent implications and cut filtering."""
    import z3

    formula_checks = {}
    equality_registries = (
        dual_row_cegar.RAW_EQUALITY_FAMILIES,
        dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
    )
    for selected_family, raw_family in SUBSUMED_THEOREM_CUT_FAMILIES.items():
        selected_schema = dual_row_cegar.LINEAR_ROW_FAMILIES[selected_family]
        raw_schema = next(
            registry[raw_family]
            for registry in equality_registries
            if raw_family in registry
        )
        if selected_schema["arity"] != raw_schema["arity"]:
            raise AssertionError((
                "subsumption-arity-mismatch",
                selected_family,
                raw_family,
            ))

        providers = []
        for center, left, right in raw_schema["equalities"]:
            provider_indices = tuple(
                index
                for index, (row_center, support) in enumerate(
                    selected_schema["rows"]
                )
                if row_center == center and {left, right}.issubset(support)
            )
            if not provider_indices:
                raise AssertionError((
                    "raw-equality-not-implied-by-selected-row",
                    selected_family,
                    raw_family,
                    (center, left, right),
                ))
            providers.append(provider_indices[0])

        arity = selected_schema["arity"]
        points = tuple(range(arity))
        selected_key = ("theorem", selected_family, *points)
        raw_key = ("theorem", raw_family, *points)
        if subsuming_theorem_cut_key(selected_key) != raw_key:
            raise AssertionError(("subsumption-key-shape", selected_key, raw_key))

        guard = z3.Bool(f"subsumption_guard_{selected_family}")
        row_atoms = tuple(
            z3.Bool(f"subsumption_row_{selected_family}_{index}")
            for index in range(len(selected_schema["rows"]))
        )
        equality_atoms = tuple(
            z3.Bool(f"subsumption_eq_{raw_family}_{index}")
            for index in range(len(raw_schema["equalities"]))
        )
        row_implies_equalities = tuple(
            z3.Implies(row_atoms[provider], equality_atom)
            for provider, equality_atom in zip(providers, equality_atoms)
        )
        selected_cut = z3.Or(
            z3.Not(guard), *(z3.Not(atom) for atom in row_atoms)
        )
        raw_cut = z3.Or(
            z3.Not(guard), *(z3.Not(atom) for atom in equality_atoms)
        )
        implication = z3.Solver()
        implication.add(
            *row_implies_equalities,
            raw_cut,
            z3.Not(selected_cut),
        )
        if implication.check() != z3.unsat:
            raise AssertionError((
                "raw-cut-does-not-subsume-selected-cut",
                raw_family,
                selected_family,
            ))
        strictness = z3.Solver()
        strictness.add(
            *row_implies_equalities,
            selected_cut,
            z3.Not(raw_cut),
        )
        if strictness.check() != z3.sat:
            raise AssertionError((
                "selected-cut-unexpectedly-equivalent-to-raw-cut",
                selected_family,
                raw_family,
            ))
        formula_checks[selected_family] = {
            "subsuming_family": raw_family,
            "same_ordered_key_and_linear_guard": True,
            "selected_row_count": len(row_atoms),
            "raw_equality_count": len(equality_atoms),
            "raw_cut_implies_selected_cut": True,
            "implication_is_strict": True,
        }

    six_selected = (
        "theorem", "six_sparse_two_selected_rows", 0, 1, 2, 3, 4, 5
    )
    six_raw = subsuming_theorem_cut_key(six_selected)
    five_selected = (
        "theorem", "five_kalmanson_three_selected_rows", 0, 1, 2, 3, 4
    )
    five_raw = subsuming_theorem_cut_key(five_selected)
    non_subsumed = (
        "theorem", "six_sparse_two_selected_rows", 1, 2, 3, 4, 5, 6
    )
    candidates = (
        six_selected,
        five_raw,
        non_subsumed,
        five_selected,
        six_raw,
    )
    forward = canonical_theorem_cut_keys(candidates)
    reverse = canonical_theorem_cut_keys(tuple(reversed(candidates)))
    if forward != reverse:
        raise AssertionError("subsumption depends on theorem-key insertion order")

    audit = CrossedAudit(critical_k4_representation)
    installation = install_theorem_cut_keys(audit, candidates, require_fresh=True)
    expected_suppressed = {six_selected, five_selected}
    expected_added = {six_raw, five_raw, non_subsumed}
    if set(installation["suppressed"]) != expected_suppressed:
        raise AssertionError((
            "wrong-subsumed-theorem-cuts",
            installation["suppressed"],
        ))
    if set(installation["added"]) != expected_added:
        raise AssertionError(("wrong-canonical-theorem-cuts", installation["added"]))
    if set(audit.packet_cuts) & expected_suppressed:
        raise AssertionError("subsumed theorem cut reached the solver")
    if non_subsumed not in audit.packet_cuts:
        raise AssertionError("non-subsumed selected-row cut was omitted")
    already_installed = install_theorem_cut_keys(audit, (six_selected,))
    if already_installed["added"] or already_installed["suppressed"] != (
        six_selected,
    ):
        raise AssertionError("existing raw cut did not suppress selected-row cut")

    late_raw = subsuming_theorem_cut_key(non_subsumed)
    late_installation = install_theorem_cut_keys(audit, (late_raw,))
    if late_installation["added"] != (late_raw,):
        raise AssertionError("late raw subsumer was not installed")
    if late_installation["retired"] != (non_subsumed,):
        raise AssertionError("older selected-row key was not retired")
    if non_subsumed in audit.packet_cuts or late_raw not in audit.packet_cuts:
        raise AssertionError("late subsumption left noncanonical packet keys")

    return {
        "status": "EXACT_SUBSUMPTION_OK",
        "formula_checks": formula_checks,
        "redundant_additions_omitted": len(expected_suppressed),
        "non_subsumed_additions_preserved": 1,
        "insertion_order_independent": True,
        "already_installed_raw_suppression_checked": True,
        "late_raw_subsumer_retirement_checked": True,
    }


def checkpoint_roundtrip_self_check(
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    source = CrossedAudit(critical_k4_representation)
    expression_cache_check = restore_expression_cache_self_check(source)
    expected_global_equalities = N * ((N - 1) * (N - 2) // 2)
    if source.blocks["global_edge_equality_closure"] != expected_global_equalities:
        raise AssertionError((
            "global-edge-equality-block-count",
            source.blocks["global_edge_equality_closure"],
            expected_global_equalities,
        ))
    if source.blocks["radius_partition"] or source.blocks["mutual_triangle_transport"]:
        raise AssertionError((
            "redundant-local-equality-blocks-still-active",
            source.blocks["radius_partition"],
            source.blocks["mutual_triangle_transport"],
        ))
    source.add_cut(frozenset({0, 1}))
    rows = source.row_objects
    structural_examples = (
        ("circle", rows[0], rows[1], (0, 1), (2, 3, 4)),
        ("shared_pair", rows[0], rows[1], (0, 1), (2, 3)),
        ("bisector", rows[0], rows[1], rows[2], (0, 1, 2), (3, 4)),
    )
    for violation in structural_examples:
        if not dual_row_cegar.add_structural_violation(source, violation):
            raise AssertionError(("self-check-structural-cut-not-fresh", violation[0]))
    raw_btw_sep_key = (RAW_BTW_SEP_FAMILY, 0, 1, 2, 3)
    if not add_structural_cut_key(source, raw_btw_sep_key):
        raise AssertionError(("self-check-structural-cut-not-fresh", RAW_BTW_SEP_FAMILY))
    mutual_transport_key = (MUTUAL_BISECTOR_TRANSPORT_FAMILY, 0, 1, 2)
    if not add_structural_cut_key(source, mutual_transport_key):
        raise AssertionError(
            ("self-check-structural-cut-not-fresh", MUTUAL_BISECTOR_TRANSPORT_FAMILY)
        )

    checked_families = []
    equality_registries = (
        dual_row_cegar.KALMANSON_FAMILIES,
        dual_row_cegar.RAW_EQUALITY_FAMILIES,
        dual_row_cegar.SIX_POINT_EQUALITY_FAMILIES,
    )
    paired_raw_keys = {
        (
            "theorem",
            raw_family,
            *range(theorem_family_arity(selected_family)),
        )
        for selected_family, raw_family in SUBSUMED_THEOREM_CUT_FAMILIES.items()
    }
    for family in FULL_BANK_FAMILIES:
        points = tuple(range(theorem_family_arity(family)))
        key = ("theorem", family, *points)
        if subsuming_theorem_cut_key(key) in paired_raw_keys:
            checked_families.append(family)
            continue
        if family == CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY:
            requirements = crossed_arm_seven_point_collision_requirements(points)
            added = add_crossed_arm_seven_point_collision_match(
                source, (family, points, requirements)
            )
        elif family == GLOBAL_KALMANSON_FAMILY:
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in GLOBAL_KALMANSON_SCHEMA["equalities"]
            )
            added = add_global_kalmanson_match(
                source, (family, points, requirements)
            )
        elif family == CONVEX_FIVE_POINT_FAMILY:
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in CONVEX_FIVE_POINT_SCHEMA["equalities"]
            )
            added = add_convex_five_point_match(
                source, (family, points, requirements)
            )
        elif family in dual_row_cegar.FAMILIES:
            c1, pts1, c2, pts2 = dual_row_cegar.pattern_atoms(family, points)
            added = dual_row_cegar.add_theorem_match(
                source, (family, points, c1, pts1, c2, pts2)
            )
        elif family in dual_row_cegar.LINEAR_ROW_FAMILIES:
            schema = dual_row_cegar.LINEAR_ROW_FAMILIES[family]
            requirements = tuple(
                (points[center], tuple(points[index] for index in support))
                for center, support in schema["rows"]
            )
            added = dual_row_cegar.add_linear_row_match(
                source, (family, points, requirements)
            )
        else:
            schema = next(
                registry[family] for registry in equality_registries if family in registry
            )
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in schema["equalities"]
            )
            added = dual_row_cegar.add_kalmanson_match(
                source, (family, points, requirements)
            )
        if not added:
            raise AssertionError(("self-check-theorem-cut-not-fresh", family))
        checked_families.append(family)

    serialized = json.loads(json.dumps({
        "schema": RESULT_SCHEMA,
        "arm": ARMS[0],
        "n": N,
        "closed_cap_profile": list(PROFILE),
        "critical_no_K4_representation": source.critical_k4_representation,
        "learned_cuts": learned_cut_manifest(source),
    }))
    restored = CrossedAudit(critical_k4_representation)
    resume = restore_learned_cuts_payload(
        restored, ARMS[0], serialized, "<self-check-memory-roundtrip>"
    )
    if learned_cut_manifest(restored) != serialized["learned_cuts"]:
        raise AssertionError("checkpoint manifest did not round-trip")
    source_formulas = {key: formula.sexpr() for key, formula in source.packet_cuts.items()}
    restored_formulas = {
        key: formula.sexpr() for key, formula in restored.packet_cuts.items()
    }
    if restored_formulas != source_formulas:
        raise AssertionError("cached checkpoint formulas did not reconstruct exactly")

    pre_optimization = json.loads(json.dumps(serialized))
    pre_optimization_selected_keys = [
        [
            "theorem",
            family,
            *range(theorem_family_arity(family)),
        ]
        for family in SUBSUMED_THEOREM_CUT_FAMILIES
    ]
    pre_optimization["learned_cuts"]["theorem"].extend(
        pre_optimization_selected_keys
    )
    pre_optimization["learned_cuts"]["theorem"].reverse()
    normalized = CrossedAudit(critical_k4_representation)
    normalized_resume = restore_learned_cuts_payload(
        normalized,
        ARMS[0],
        pre_optimization,
        "<self-check-pre-optimization-checkpoint>",
    )
    if learned_cut_manifest(normalized) != serialized["learned_cuts"]:
        raise AssertionError("pre-optimization checkpoint did not normalize")
    normalized_formulas = {
        key: formula.sexpr() for key, formula in normalized.packet_cuts.items()
    }
    if normalized_formulas != source_formulas:
        raise AssertionError("pre-optimization checkpoint formulas changed")
    if normalized_resume["suppressed_subsumed_theorem_cut_count"] != len(
        SUBSUMED_THEOREM_CUT_FAMILIES
    ):
        raise AssertionError("pre-optimization checkpoint suppression count changed")

    previous_v9 = json.loads(json.dumps(serialized))
    previous_v9["schema"] = PREVIOUS_RESULT_SCHEMA
    previous_v9["learned_cuts"]["schema"] = PREVIOUS_CUT_SCHEMA
    previous_v9["learned_cuts"]["theorem_families"] = list(
        PRE_SEVEN_POINT_THEOREM_FAMILIES
    )
    previous_v9["learned_cuts"]["theorem"] = [
        key for key in previous_v9["learned_cuts"]["theorem"]
        if key[1] in PRE_SEVEN_POINT_THEOREM_FAMILIES
    ]
    previous_v9_expected_manifest = json.loads(
        json.dumps(previous_v9["learned_cuts"])
    )
    previous_v9_expected_manifest["schema"] = CUT_SCHEMA
    previous_v9_expected_manifest["theorem_families"] = list(FULL_BANK_FAMILIES)
    previous_v9_expected_formulas = {
        key: formula for key, formula in source_formulas.items()
        if key[0] != "theorem" or key[1] in PRE_SEVEN_POINT_THEOREM_FAMILIES
    }

    previous_v9_resumed = CrossedAudit(critical_k4_representation)
    with tempfile.TemporaryDirectory(
        prefix="crossed-arm-v9-resume-self-check-", dir=HERE
    ) as fixture_dir:
        previous_v9_path = Path(fixture_dir) / "result.json"
        previous_v9_path.write_text(
            json.dumps(previous_v9, indent=2, sort_keys=True) + "\n"
        )
        previous_v9_resume = restore_learned_cuts(
            previous_v9_resumed, ARMS[0], previous_v9_path
        )
    if (
        previous_v9_resume["source_result_schema"],
        previous_v9_resume["source_cut_schema"],
    ) != (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA):
        raise AssertionError("ordinary resume did not preserve the v9/v7 source pair")
    if learned_cut_manifest(previous_v9_resumed) != previous_v9_expected_manifest:
        raise AssertionError("pre-family v9 resume did not normalize")
    if {
        key: formula.sexpr() for key, formula in previous_v9_resumed.packet_cuts.items()
    } != previous_v9_expected_formulas:
        raise AssertionError("pre-family v9 resume formulas changed")

    previous_v9_import_payload = json.loads(json.dumps(previous_v9))
    previous_v9_import_payload["arm"] = ARMS[1]
    previous_v9_imported = CrossedAudit(critical_k4_representation)
    previous_v9_import = restore_learned_cuts_payload(
        previous_v9_imported,
        ARMS[0],
        previous_v9_import_payload,
        "<self-check-pre-family-v9-universal-import>",
        allowed_schema_pairs=((PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),),
        require_same_arm=False,
        mode="universal-cut-import",
    )
    if learned_cut_manifest(previous_v9_imported) != previous_v9_expected_manifest:
        raise AssertionError("pre-family v9 universal import did not normalize")
    if {
        key: formula.sexpr() for key, formula in previous_v9_imported.packet_cuts.items()
    } != previous_v9_expected_formulas:
        raise AssertionError("pre-family v9 universal-import formulas changed")

    previous_v9_with_new_cut = json.loads(json.dumps(previous_v9))
    new_family_cut = next(
        key for key in serialized["learned_cuts"]["theorem"]
        if key[1] == CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY
    )
    previous_v9_with_new_cut["learned_cuts"]["theorem"].append(new_family_cut)
    try:
        restore_learned_cuts_payload(
            CrossedAudit(critical_k4_representation),
            ARMS[0],
            previous_v9_with_new_cut,
            "<self-check-pre-family-v9-illegal-new-cut>",
            allowed_schema_pairs=((PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),),
        )
    except ValueError as exc:
        if not exc.args or exc.args[0][0] != "incompatible-theorem-family":
            raise
    else:
        raise AssertionError("pre-family v9 accepted a new-family theorem cut")

    legacy_structural_with_new_cut = json.loads(json.dumps(serialized))
    legacy_structural_with_new_cut["schema"] = PREHISTORIC_RESULT_SCHEMA
    legacy_structural_with_new_cut["learned_cuts"]["schema"] = PREHISTORIC_CUT_SCHEMA
    legacy_structural_with_new_cut["learned_cuts"]["structural_families"] = list(
        PRE_TRANSPORT_STRUCTURAL_FAMILIES
    )
    legacy_structural_with_new_cut["learned_cuts"]["theorem_families"] = list(
        LEGACY_THEOREM_FAMILIES
    )
    legacy_structural_with_new_cut["learned_cuts"]["theorem"] = [
        key for key in legacy_structural_with_new_cut["learned_cuts"]["theorem"]
        if key[1] in LEGACY_THEOREM_FAMILIES
    ]
    try:
        restore_learned_cuts_payload(
            CrossedAudit(critical_k4_representation),
            ARMS[0],
            legacy_structural_with_new_cut,
            "<self-check-legacy-illegal-structural-cut>",
            allowed_schema_pairs=((
                PREHISTORIC_RESULT_SCHEMA,
                PREHISTORIC_CUT_SCHEMA,
            ),),
        )
    except ValueError as exc:
        if not exc.args or exc.args[0][0] != "invalid-structural-cut-key":
            raise
    else:
        raise AssertionError("legacy manifest accepted a newer structural cut")

    prior_imports = []
    for prior_result_schema, prior_cut_schema in (
        (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),
        (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA),
        (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA),
        (OLDEST_RESULT_SCHEMA, OLDEST_CUT_SCHEMA),
        (PREHISTORIC_RESULT_SCHEMA, PREHISTORIC_CUT_SCHEMA),
        (ARCHAIC_RESULT_SCHEMA, ARCHAIC_CUT_SCHEMA),
        (PRIMORDIAL_RESULT_SCHEMA, PRIMORDIAL_CUT_SCHEMA),
    ):
        prior_schema_pair = (prior_result_schema, prior_cut_schema)
        prior_structural_families = structural_families_for_schema_pair(
            prior_schema_pair
        )
        prior_theorem_families = theorem_families_for_schema_pair(
            prior_schema_pair
        )
        prior_serialized = json.loads(json.dumps(serialized))
        prior_serialized["schema"] = prior_result_schema
        prior_serialized["arm"] = ARMS[1]
        prior_serialized["learned_cuts"]["schema"] = prior_cut_schema
        prior_serialized["learned_cuts"]["structural_families"] = list(
            prior_structural_families
        )
        prior_serialized["learned_cuts"]["theorem_families"] = list(
            prior_theorem_families
        )
        prior_serialized["learned_cuts"]["structural"] = [
            key for key in prior_serialized["learned_cuts"]["structural"]
            if key[0] in prior_structural_families
        ]
        prior_serialized["learned_cuts"]["theorem"] = [
            key for key in prior_serialized["learned_cuts"]["theorem"]
            if key[1] in prior_theorem_families
        ]
        imported = CrossedAudit(critical_k4_representation)
        prior_import = restore_learned_cuts_payload(
            imported,
            ARMS[0],
            prior_serialized,
            f"<self-check-{prior_result_schema}-universal-import>",
            allowed_schema_pairs=(
                (RESULT_SCHEMA, CUT_SCHEMA),
                (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),
                (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA),
                (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA),
                (OLDEST_RESULT_SCHEMA, OLDEST_CUT_SCHEMA),
                (PREHISTORIC_RESULT_SCHEMA, PREHISTORIC_CUT_SCHEMA),
                (ARCHAIC_RESULT_SCHEMA, ARCHAIC_CUT_SCHEMA),
                (PRIMORDIAL_RESULT_SCHEMA, PRIMORDIAL_CUT_SCHEMA),
            ),
            require_same_arm=False,
            mode="universal-cut-import",
        )
        expected_manifest = json.loads(json.dumps(prior_serialized["learned_cuts"]))
        expected_manifest["schema"] = CUT_SCHEMA
        expected_manifest["structural_families"] = list(STRUCTURAL_FAMILIES)
        expected_manifest["theorem_families"] = list(FULL_BANK_FAMILIES)
        if learned_cut_manifest(imported) != expected_manifest:
            raise AssertionError((prior_result_schema, "universal-cut import did not normalize"))
        imported_formulas = {
            key: formula.sexpr() for key, formula in imported.packet_cuts.items()
        }
        expected_formulas = {
            key: formula for key, formula in source_formulas.items()
            if (
                (key[0] == "theorem" and key[1] in prior_theorem_families)
                or key[0] in prior_structural_families
            )
        }
        if imported_formulas != expected_formulas:
            raise AssertionError((prior_result_schema, "universal-cut formulas changed"))
        prior_imports.append({
            key: value
            for key, value in prior_import.items()
            if key in {
                "mode",
                "source_arm",
                "source_result_schema",
                "source_cut_schema",
                "connectivity_cut_count",
                "structural_cut_count",
                "theorem_cut_count",
            }
        })
    return {
        "status": "ROUNDTRIP_OK",
        "critical_no_K4_representation": source.critical_k4_representation,
        "critical_no_K4_assertion_count": source.blocks[
            "critical_no_K4_after_source_deletion"
        ],
        "connectivity_cut_kinds_checked": 1,
        "structural_cut_kinds_checked": list(STRUCTURAL_FAMILIES),
        "theorem_families_checked": checked_families,
        "restore_expression_cache": expression_cache_check,
        "cached_vs_uncached_cut_sexprs_checked": len(restored_formulas),
        "restored_cut_counts": {
            key: value for key, value in resume.items() if key.endswith("_cut_count")
        },
        "pre_optimization_checkpoint": {
            key: value
            for key, value in normalized_resume.items()
            if key.endswith("_cut_count") or key.endswith("_cut_counts")
        },
        "pre_family_v9_resume": {
            key: value for key, value in previous_v9_resume.items()
            if key.endswith("_cut_count") or key.endswith("_schema")
        },
        "pre_family_v9_universal_import": {
            key: value for key, value in previous_v9_import.items()
            if key.endswith("_cut_count")
        },
        "prior_universal_imports": prior_imports,
    }


def global_edge_equality_self_check() -> dict[str, object]:
    """Check both directions and a genuinely cross-center closure chain."""
    import z3

    vertices = tuple(range(6))
    equalities = {
        (center, left, right): z3.Bool(f"global_edge_probe_{center}_{left}_{right}")
        for center in vertices
        for left, right in itertools.combinations(
            (point for point in vertices if point != center), 2
        )
    }

    def equality(center, left, right):
        if left == right:
            return z3.BoolVal(True)
        if center in {left, right}:
            return z3.BoolVal(False)
        return equalities[center, min(left, right), max(left, right)]

    probe = incidence_cegar.Audit.__new__(incidence_cegar.Audit)
    probe.z3 = z3
    probe.eq = equalities
    if not z3.is_true(z3.simplify(probe.E(0, 1, 1))):
        raise AssertionError("E(c,x,x) was not reflexive")
    if not z3.is_false(z3.simplify(probe.E(0, 0, 1))):
        raise AssertionError("E(c,c,y) was not rejected")
    if probe.E(0, 1, 2) is not probe.E(0, 2, 1):
        raise AssertionError("E endpoint symmetry did not share one atom")

    _sort, edge_classes, formulas = incidence_cegar.global_edge_equality_encoding(
        z3, vertices, equality, "global_edge_probe"
    )

    def outcome(*extra):
        solver = z3.Solver()
        solver.add(*formulas, *extra)
        return solver.check()

    # |01|=|02|=|13|=|23| is assembled at three different centers.
    chain = (
        equality(0, 1, 2),
        equality(1, 0, 3),
        equality(3, 1, 2),
    )
    conclusion = equality(2, 0, 3)
    if outcome(*chain, z3.Not(conclusion)) != z3.unsat:
        raise AssertionError("global edge equality did not close a cross-center chain")
    if outcome(*chain, z3.Not(equality(4, 0, 5))) != z3.sat:
        raise AssertionError("global edge equality forced an unrelated comparison")

    edge01 = edge_classes[0, 1]
    edge02 = edge_classes[0, 2]
    if outcome(equality(0, 1, 2), edge01 != edge02) != z3.unsat:
        raise AssertionError("E did not imply equality of undirected edge classes")
    if outcome(z3.Not(equality(0, 1, 2)), edge01 == edge02) != z3.unsat:
        raise AssertionError("edge-class equality did not imply E")

    if outcome(
        equality(0, 1, 2),
        equality(0, 2, 3),
        z3.Not(equality(0, 1, 3)),
    ) != z3.unsat:
        raise AssertionError("global edge equality did not entail radius transitivity")
    if outcome(
        equality(0, 1, 2),
        equality(1, 0, 2),
        z3.Not(equality(2, 0, 1)),
    ) != z3.unsat:
        raise AssertionError("global edge equality did not entail mutual-triangle transport")

    expected_edge_count = len(vertices) * (len(vertices) - 1) // 2
    expected_equality_count = len(vertices) * (
        (len(vertices) - 1) * (len(vertices) - 2) // 2
    )
    if len(edge_classes) != expected_edge_count or len(formulas) != expected_equality_count:
        raise AssertionError(
            ("global-edge-census", len(edge_classes), len(formulas))
        )
    return {
        "status": "GLOBAL_EDGE_EQUALITY_OK",
        "probe_vertex_count": len(vertices),
        "probe_undirected_edge_count": len(edge_classes),
        "probe_E_biconditional_count": len(formulas),
        "n17_undirected_edge_count": N * (N - 1) // 2,
        "n17_E_biconditional_count": N * ((N - 1) * (N - 2) // 2),
        "cross_center_transitive_chain_checked": True,
        "degenerate_E_branches_checked": True,
        "radius_partition_entailed": True,
        "mutual_triangle_transport_entailed": True,
        "unrelated_comparison_remains_free": True,
        "lean_soundness_reference": (
            "Problem97.Census554.EqualityCore.EdgeClosure.sound"
        ),
    }


def mutual_bisector_transport_self_check() -> dict[str, object]:
    """Exhaust the Horn truth table and canonical violation matcher."""
    import z3

    q, c1, c2 = 0, 1, 2
    h1 = z3.Bool("mutual_bisector_h1")
    h2 = z3.Bool("mutual_bisector_h2")
    conclusion = z3.Bool("mutual_bisector_conclusion")
    atoms = {
        (c1, min(q, c2), max(q, c2)): h1,
        (c2, min(q, c1), max(q, c1)): h2,
        (q, min(c1, c2), max(c1, c2)): conclusion,
    }

    def equality(center, left, right):
        return atoms[center, min(left, right), max(left, right)]

    cut = mutual_bisector_transport_cut(z3, equality, q, c1, c2)
    swapped_cut = mutual_bisector_transport_cut(z3, equality, q, c2, c1)
    swap_solver = z3.Solver()
    swap_solver.add(z3.Xor(cut, swapped_cut))
    if swap_solver.check() != z3.unsat:
        raise AssertionError("mutual-bisector center swap changed formula")
    rejected = 0
    for h1_value, h2_value, conclusion_value in itertools.product(
        (False, True), repeat=3
    ):
        solver = z3.Solver()
        solver.add(
            cut,
            h1 == h1_value,
            h2 == h2_value,
            conclusion == conclusion_value,
        )
        outcome = solver.check()
        should_reject = h1_value and h2_value and not conclusion_value
        if (outcome == z3.unsat) != should_reject:
            raise AssertionError(
                (
                    "mutual-bisector-truth-table",
                    h1_value,
                    h2_value,
                    conclusion_value,
                    outcome,
                )
            )
        rejected += int(outcome == z3.unsat)

    violation_truth = {
        (c1, min(q, c2), max(q, c2)): True,
        (c2, min(q, c1), max(q, c1)): True,
        (q, min(c1, c2), max(c1, c2)): False,
    }

    def violation_holds(center, left, right):
        return violation_truth.get(
            (center, min(left, right), max(left, right)), False
        )

    instances = mutual_bisector_transport_instances((q, c1, c2), violation_holds)
    expected = [(MUTUAL_BISECTOR_TRANSPORT_FAMILY, q, c1, c2)]
    if instances != expected:
        raise AssertionError(("mutual-bisector-instance", expected, instances))
    potential_keys = [
        (MUTUAL_BISECTOR_TRANSPORT_FAMILY, target, left, right)
        for target in range(N)
        for left, right in itertools.combinations(
            (point for point in range(N) if point != target), 2
        )
    ]
    if len(potential_keys) != 2040 or len(set(potential_keys)) != 2040:
        raise AssertionError(("mutual-bisector-key-census", len(potential_keys)))
    return {
        "status": "MUTUAL_BISECTOR_TRANSPORT_OK",
        "truth_table_valuations_checked": 8,
        "forbidden_valuations": rejected,
        "canonical_violation_instances_checked": len(instances),
        "center_swap_equivalence_checked": True,
        "n17_unique_canonical_key_count": len(potential_keys),
        "lean_declaration": "Problem97.dist_eq_dist_of_mutual_bisector",
    }


def raw_btw_sep_self_check() -> dict[str, object]:
    """Exhaust small cyclic orders and verify the exact guarded theorem cut."""
    import z3

    points = (0, 1, 2, 3)
    endpoint_left, endpoint_right, center_a, center_b = points
    positions = {point: z3.Int(f"raw_btw_sep_pos_{point}") for point in points}
    equality_atoms = {
        center_a: z3.Bool("raw_btw_sep_eq_center_a"),
        center_b: z3.Bool("raw_btw_sep_eq_center_b"),
    }

    def equality(center, left, right):
        if {left, right} != {endpoint_left, endpoint_right}:
            raise AssertionError(("raw-btw-sep-self-check-endpoints", left, right))
        return equality_atoms[center]

    cut = raw_btw_sep_cut(
        z3, positions, equality, center_a, center_b, endpoint_left, endpoint_right
    )
    rejected = 0
    accepted = 0
    four_point_valuation_checks = 0
    for order in itertools.permutations(points):
        concrete_positions = {point: index for index, point in enumerate(order)}
        same_side = same_cyclic_side(
            concrete_positions,
            endpoint_left,
            endpoint_right,
            center_a,
            center_b,
        )
        theorem_alternates = (
            strictly_between(concrete_positions, center_a, center_b, endpoint_left)
            != strictly_between(concrete_positions, center_a, center_b, endpoint_right)
        )
        if theorem_alternates != (not same_side):
            raise AssertionError(("raw-btw-sep-transposed-btw", order))
        swapped_same_side = same_cyclic_side(
            concrete_positions,
            center_a,
            center_b,
            endpoint_left,
            endpoint_right,
        )
        if swapped_same_side != same_side:
            raise AssertionError(("raw-btw-sep-center-endpoint-swap", order))
        for recut in rotations(order):
            recut_positions = {point: index for index, point in enumerate(recut)}
            if same_cyclic_side(
                recut_positions,
                endpoint_left,
                endpoint_right,
                center_a,
                center_b,
            ) != same_side:
                raise AssertionError(("raw-btw-sep-recut", order, recut))
        reverse = tuple(reversed(order))
        reverse_positions = {point: index for index, point in enumerate(reverse)}
        if same_cyclic_side(
            reverse_positions,
            endpoint_left,
            endpoint_right,
            center_a,
            center_b,
        ) != same_side:
            raise AssertionError(("raw-btw-sep-reversal", order, reverse))

        fixed_positions = [positions[point] == index for index, point in enumerate(order)]
        for equality_values in itertools.product((False, True), repeat=2):
            solver = z3.Solver()
            solver.add(
                *fixed_positions,
                equality_atoms[center_a] == equality_values[0],
                equality_atoms[center_b] == equality_values[1],
                cut,
            )
            outcome = solver.check()
            expected_unsat = all(equality_values) and same_side
            if (outcome == z3.unsat) != expected_unsat:
                raise AssertionError(
                    ("raw-btw-sep-cut", order, equality_values, outcome, same_side)
                )
            four_point_valuation_checks += 1
            if equality_values == (True, True):
                rejected += int(outcome == z3.unsat)
                accepted += int(outcome == z3.sat)
    if (rejected, accepted) != (16, 8):
        raise AssertionError(("raw-btw-sep-order-census", rejected, accepted))
    dummy = 4
    five_points = (*points, dummy)
    five_rejected = 0
    five_accepted = 0
    five_valuation_checks = 0
    for order in itertools.permutations(five_points):
        concrete_positions = {point: index for index, point in enumerate(order)}
        same_side = same_cyclic_side(
            concrete_positions,
            endpoint_left,
            endpoint_right,
            center_a,
            center_b,
        )
        theorem_alternates = (
            strictly_between(concrete_positions, center_a, center_b, endpoint_left)
            != strictly_between(concrete_positions, center_a, center_b, endpoint_right)
        )
        if theorem_alternates != (not same_side):
            raise AssertionError(("raw-btw-sep-five-point-transpose", order))
        for recut in rotations(order):
            recut_positions = {point: index for index, point in enumerate(recut)}
            if same_cyclic_side(
                recut_positions,
                endpoint_left,
                endpoint_right,
                center_a,
                center_b,
            ) != same_side:
                raise AssertionError(("raw-btw-sep-five-point-recut", order, recut))
        reverse_positions = {
            point: index for index, point in enumerate(reversed(order))
        }
        if same_cyclic_side(
            reverse_positions,
            endpoint_left,
            endpoint_right,
            center_a,
            center_b,
        ) != same_side:
            raise AssertionError(("raw-btw-sep-five-point-reversal", order))
        for equality_values in itertools.product((False, True), repeat=2):
            clause_holds = not all(equality_values) or not same_side
            expected_holds = not (all(equality_values) and same_side)
            if clause_holds != expected_holds:
                raise AssertionError(
                    ("raw-btw-sep-five-point-guard", order, equality_values)
                )
            five_valuation_checks += 1
        five_rejected += int(same_side)
        five_accepted += int(not same_side)
    if (five_rejected, five_accepted) != (80, 40):
        raise AssertionError(
            ("raw-btw-sep-five-point-order-census", five_rejected, five_accepted)
        )
    return {
        "status": "RAW_BTW_SEP_OK",
        "four_point_linear_orders_checked": 24,
        "four_point_same-side_orders_rejected": rejected,
        "four_point_alternating_orders_accepted": accepted,
        "four_point_rotation_recuts_checked": 24 * 4,
        "four_point_reversals_checked": 24,
        "four_point_center_endpoint_swaps_checked": 24,
        "four_point_equality_valuations_checked": four_point_valuation_checks,
        "five_point_linear_orders_checked": 120,
        "five_point_same-side_orders_rejected": five_rejected,
        "five_point_alternating_orders_accepted": five_accepted,
        "five_point_rotation_recuts_checked": 120 * 5,
        "five_point_reversals_checked": 120,
        "five_point_equality_valuations_checked": five_valuation_checks,
        "transposed_btw_equivalences_checked": 24 + 120,
    }


def read_witness_radius_partition(path: Path):
    """Validate one serialized radius partition and expose raw equality."""
    path = path.resolve()
    payload = json.loads(path.read_text())
    order = payload.get("existential_cyclic_order")
    radius_classes = payload.get("radius_classes")
    if not isinstance(order, list) or len(order) < 4 or len(set(order)) != len(order):
        raise ValueError(("invalid-replay-cyclic-order", order))
    if not isinstance(radius_classes, dict) or set(radius_classes) != set(order):
        raise ValueError("replay radius_classes do not cover the cyclic carrier")
    class_index = {}
    for center in order:
        seen = set()
        for class_number, members in enumerate(radius_classes[center]):
            if not isinstance(members, list) or not members:
                raise ValueError(("invalid-replay-radius-class", center, class_number))
            if center in members or seen.intersection(members):
                raise ValueError(("invalid-replay-radius-partition", center, class_number))
            for point in members:
                class_index[center, point] = class_number
            seen.update(members)
        if seen != set(order) - {center}:
            raise ValueError(("incomplete-replay-radius-partition", center))

    def equality_holds(center, left, right):
        return class_index[center, left] == class_index[center, right]

    return path, payload, tuple(order), equality_holds


def replay_global_kalmanson_witness(path: Path) -> dict[str, object]:
    """Solver-free replay of the exact 14-role family on a witness partition."""
    path, _payload, carrier_order, equality_holds = read_witness_radius_partition(path)
    roles = GLOBAL_KALMANSON_SCHEMA["role_order"]
    requirements = tuple(
        (roles[center], roles[left], roles[right])
        for center, left, right in GLOBAL_KALMANSON_SCHEMA["equalities"]
    )
    order_guard_holds = cyclic_order_holds_up_to_orientation(carrier_order, roles)
    equality_checks = tuple(
        equality_holds(center, left, right)
        for center, left, right in requirements
    )
    match_holds = order_guard_holds and all(equality_checks)
    return {
        "schema": "crossed-arm-global-kalmanson-14role-replay-v1",
        "status": (
            "GLOBAL_KALMANSON_14ROLE_MATCH_KILLS"
            if match_holds
            else "GLOBAL_KALMANSON_14ROLE_NO_MATCH"
        ),
        "input_witness": str(path),
        "solver_invoked": False,
        "family": GLOBAL_KALMANSON_FAMILY,
        "lean_declaration": GLOBAL_KALMANSON_SCHEMA["theorem"],
        "role_order": list(roles),
        "arity": len(roles),
        "cyclic_order_up_to_rotation_reflection": order_guard_holds,
        "equality_requirement_count": len(requirements),
        "equality_requirements": [
            {
                "center": center,
                "left": left,
                "right": right,
                "holds": holds,
            }
            for (center, left, right), holds in zip(requirements, equality_checks)
        ],
        "all_equalities_hold": all(equality_checks),
        "match_count_for_named_core_instantiation": int(match_holds),
        "cut_guard_true": match_holds,
        "killed_by_guarded_cut": match_holds,
        "trust_boundary": (
            "finite solver-free replay of one serialized radius partition; the "
            "Lean declaration is the proof consumer and was not built by this replay"
        ),
    }


def replay_v7_witness(path: Path) -> dict[str, object]:
    """Replay the two v7 additions against one complete v3-v6 witness."""
    path, payload, order, equality_holds = read_witness_radius_partition(path)
    rows = payload.get("rows")
    if not isinstance(rows, dict) or set(rows) != set(order):
        raise ValueError("replay rows do not cover the cyclic carrier")
    row_supports = {}
    for center in order:
        support = rows[center]
        if (
            not isinstance(support, list)
            or len(support) != 4
            or len(set(support)) != 4
            or center in support
            or not set(support).issubset(order)
        ):
            raise ValueError(("invalid-replay-row", center, support))
        support_set = set(support)
        if not all(
            equality_holds(center, left, right)
            for left, right in itertools.combinations(support, 2)
        ):
            raise ValueError(("replay-row-not-one-radius-class", center, support))
        row_supports[center] = support_set

    def edge(left, right):
        if left == right:
            raise ValueError(("loop-edge", left))
        return tuple(sorted((left, right)))

    parent = {edge(left, right): edge(left, right) for left, right in itertools.combinations(order, 2)}

    def find(node):
        while parent[node] != node:
            parent[node] = parent[parent[node]]
            node = parent[node]
        return node

    def union(left, right):
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    adjacency = {node: [] for node in parent}
    positive_generators = 0
    radius_classes = payload["radius_classes"]
    for center in order:
        for members in radius_classes[center]:
            for left, right in itertools.combinations(members, 2):
                left_edge = edge(center, left)
                right_edge = edge(center, right)
                generator = (center, left, right)
                union(left_edge, right_edge)
                adjacency[left_edge].append((right_edge, generator))
                adjacency[right_edge].append((left_edge, generator))
                positive_generators += 1

    def equality_path(start, finish):
        queue = collections.deque([start])
        previous = {start: None}
        while queue:
            current = queue.popleft()
            if current == finish:
                break
            for neighbor, generator in adjacency[current]:
                if neighbor not in previous:
                    previous[neighbor] = (current, generator)
                    queue.append(neighbor)
        if finish not in previous:
            raise AssertionError(("missing-global-equality-path", start, finish))
        reversed_steps = []
        current = finish
        while previous[current] is not None:
            prior, generator = previous[current]
            reversed_steps.append((prior, current, generator))
            current = prior
        return [
            {
                "from_edge": list(left_edge),
                "to_edge": list(right_edge),
                "positive_local_equality": {
                    "center": generator[0],
                    "endpoints": list(generator[1:]),
                },
            }
            for left_edge, right_edge, generator in reversed(reversed_steps)
        ]

    violations = []
    negative_comparisons = 0
    for center in order:
        others = tuple(point for point in order if point != center)
        for left, right in itertools.combinations(others, 2):
            if equality_holds(center, left, right):
                continue
            negative_comparisons += 1
            left_edge = edge(center, left)
            right_edge = edge(center, right)
            if find(left_edge) == find(right_edge):
                violations.append((center, left, right, left_edge, right_edge))

    global_preview = [
        {
            "forced_but_serialized_false": {
                "center": center,
                "endpoints": [left, right],
            },
            "left_edge": list(left_edge),
            "right_edge": list(right_edge),
        }
        for center, left, right, left_edge, right_edge in violations[:20]
    ]
    first_global_violation = None
    if violations:
        center, left, right, left_edge, right_edge = violations[0]
        first_global_violation = {
            "forced_but_serialized_false": {
                "center": center,
                "endpoints": [left, right],
            },
            "left_edge": list(left_edge),
            "right_edge": list(right_edge),
            "positive_equality_path": equality_path(left_edge, right_edge),
        }

    six_role_matches = []
    for points in itertools.combinations(order, 6):
        requirements = (
            (points[0], (points[3], points[5])),
            (points[1], (points[4], points[5])),
            (points[2], (points[3], points[4])),
        )
        if all(set(support).issubset(row_supports[center]) for center, support in requirements):
            six_role_matches.append((points, requirements))

    def six_role_record(match):
        points, requirements = match
        return {
            "ordered_roles": list(points),
            "required_rows": [
                {"center": center, "support_subset": list(support)}
                for center, support in requirements
            ],
        }

    killing_constraints = []
    if violations:
        killing_constraints.append("global_edge_equality")
    if six_role_matches:
        killing_constraints.append(NEW_THEOREM_FAMILY)
    return {
        "schema": "crossed-arm-v7-witness-replay-v1",
        "status": "V7_REPLAY_KILLED" if killing_constraints else "V7_REPLAY_SURVIVES",
        "input_witness": str(path),
        "carrier_cardinality": len(order),
        "solver_invoked": False,
        "global_edge_equality": {
            "undirected_edge_count": len(parent),
            "positive_local_equality_generator_count": positive_generators,
            "global_edge_class_count": len({find(node) for node in parent}),
            "serialized_negative_comparison_count": negative_comparisons,
            "violation_count": len(violations),
            "first_violation": first_global_violation,
            "violations_preview": global_preview,
            "lean_soundness_reference": (
                "Problem97.Census554.EqualityCore.EdgeClosure.sound"
            ),
        },
        NEW_THEOREM_FAMILY: {
            "ordered_sextuples_checked": sum(1 for _ in itertools.combinations(order, 6)),
            "match_count": len(six_role_matches),
            "matches_preview": [six_role_record(match) for match in six_role_matches[:20]],
            "lean_declaration": (
                "Problem97.UniqueFourKalmansonOccurrenceScratch."
                "false_of_two_k2_three_row_triangle"
            ),
        },
        "killing_constraints": killing_constraints,
        "trust_boundary": (
            "finite solver-free replay of one serialized complete row/radius witness; "
            "this does not prove the arbitrary-cardinality Lean anchor"
        ),
    }


def replay_mutual_bisector_transport_witness(path: Path) -> dict[str, object]:
    """Replay the v5 witness's missed transport-then-parity contradiction."""
    path, _payload, order, equality_holds = read_witness_radius_partition(path)
    violations = mutual_bisector_transport_instances(order, equality_holds)
    expected_transport = (
        MUTUAL_BISECTOR_TRANSPORT_FAMILY,
        "p2",
        "a1",
        "p1",
    )
    if violations != [expected_transport]:
        raise AssertionError(("unexpected-mutual-bisector-violations", violations))

    def transported_equality(center, left, right):
        if center == "p2" and {left, right} == {"a1", "p1"}:
            return True
        return equality_holds(center, left, right)

    positions = {point: index for index, point in enumerate(order)}
    enclosed_order = ("a1", "t3", "p2", "p1")
    if [positions[point] for point in enclosed_order] != sorted(
        positions[point] for point in enclosed_order
    ):
        raise AssertionError(("missing-enclosed-linear-order", enclosed_order, positions))
    raw_violations = raw_btw_sep_instances(order, positions, transported_equality)
    expected_parity = (RAW_BTW_SEP_FAMILY, "p2", "t3", "a1", "p1")
    if expected_parity not in raw_violations:
        raise AssertionError(("missing-transported-raw-btw-sep", raw_violations))
    return {
        "schema": "crossed-arm-mutual-bisector-replay-v1",
        "status": "REPLAY_PASS",
        "input_witness": str(path),
        "transport_violation_count": len(violations),
        "transport_violation": list(expected_transport),
        "transport_declaration": "Problem97.dist_eq_dist_of_mutual_bisector",
        "transported_equality": "E(p2,a1,p1)",
        "parity_violation": list(expected_parity),
        "parity_declaration": "Problem97.false_of_two_centers_equidistant_pair_enclosed",
        "linear_order": list(enclosed_order),
        "solver_invoked": False,
        "trust_boundary": (
            "finite solver-free replay of serialized order/radius partitions; "
            "both universal implications are existing Lean declarations"
        ),
    }


def replay_raw_btw_sep_witness(path: Path) -> dict[str, object]:
    """Solver-free replay of all raw `btw_sep` instances in a witness JSON."""
    path, _payload, order, equality_holds = read_witness_radius_partition(path)

    def instances_for(linear_order):
        positions = {point: index for index, point in enumerate(linear_order)}
        return set(raw_btw_sep_instances(order, positions, equality_holds))

    instances = instances_for(order)
    for recut in rotations(tuple(order)):
        if instances_for(recut) != instances:
            raise AssertionError(("witness-recut-changed-raw-btw-sep", recut))
        if instances_for(tuple(reversed(recut))) != instances:
            raise AssertionError(("witness-reversal-changed-raw-btw-sep", recut))

    expected = (RAW_BTW_SEP_FAMILY, "a1", "p2", "q1", "q2")
    if expected not in instances:
        raise AssertionError(("missing-q1-q2-a1-p2-raw-btw-sep", sorted(instances)))

    def record(key):
        _, center_a, center_b, endpoint_left, endpoint_right = key
        positions = {point: index for index, point in enumerate(order)}
        return {
            "family": RAW_BTW_SEP_FAMILY,
            "centers": [center_a, center_b],
            "endpoints": [endpoint_left, endpoint_right],
            "equalities": [
                f"E({center_a},{endpoint_left},{endpoint_right})",
                f"E({center_b},{endpoint_left},{endpoint_right})",
            ],
            "same_cyclic_side": True,
            "linear_cut_order": sorted(key[1:], key=positions.__getitem__),
            "linear_cut_indices": sorted(positions[point] for point in key[1:]),
            "theorem_instance": {
                "declaration": "Problem97.SurplusCOMPGBank.btw_sep",
                "i": center_a,
                "j": center_b,
                "a": endpoint_left,
                "b": endpoint_right,
            },
        }

    return {
        "schema": "crossed-arm-raw-btw-sep-replay-v1",
        "status": "REPLAY_PASS",
        "input_witness": str(path),
        "carrier_cardinality": len(order),
        "violation_count": len(instances),
        "q1_q2_centers_a1_p2_found": True,
        "requested_violation": record(expected),
        "violations": [record(key) for key in sorted(instances)],
        "recuts_checked": 2 * len(order),
        "solver_invoked": False,
        "trust_boundary": (
            "finite solver-free replay of serialized order/radius partitions; "
            "the universal theorem is the existing Lean declaration btw_sep"
        ),
    }


def global_kalmanson_guard_self_check() -> dict[str, object]:
    """Audit the exact core schema and its dihedral guarded-cut semantics."""
    import z3

    roles = GLOBAL_KALMANSON_SCHEMA["role_order"]
    equalities = GLOBAL_KALMANSON_SCHEMA["equalities"]
    if len(roles) != 14 or len(set(roles)) != 14 or len(equalities) != 16:
        raise AssertionError(("global-kalmanson-schema-shape", roles, equalities))

    core = json.loads(GLOBAL_KALMANSON_MINIMAL_CORE.read_text())
    core_equalities = []
    kalmanson_constraint_count = 0
    role_index = {role: index for index, role in enumerate(roles)}
    for constraint in core.get("constraints", []):
        if constraint.get("kind") != "within_radius_class_equality":
            kalmanson_constraint_count += 1
            continue
        provenance = constraint["provenance"]
        center = provenance["center"]
        endpoints = []
        for edge in provenance["equality"]:
            if len(edge) != 2 or center not in edge:
                raise AssertionError(("malformed-core-equality", provenance))
            endpoints.append(edge[1] if edge[0] == center else edge[0])
        core_equalities.append(
            (role_index[center], role_index[endpoints[0]], role_index[endpoints[1]])
        )
    if tuple(core_equalities) != equalities or kalmanson_constraint_count != 10:
        raise AssertionError((
            "global-kalmanson-minimal-core-drift",
            tuple(core_equalities),
            kalmanson_constraint_count,
        ))

    points = tuple(range(14))
    positions = {point: z3.Int(f"global_kalmanson_pos_{point}") for point in points}
    equality_atoms = tuple(
        z3.Bool(f"global_kalmanson_eq_{index}") for index in range(len(equalities))
    )
    guard = cyclic_order_up_to_orientation_guard(z3, positions, points)
    cut = z3.Or(z3.Not(guard), *(z3.Not(atom) for atom in equality_atoms))
    expected_orders = {
        *rotations(points),
        *rotations(tuple(reversed(points))),
    }
    for order in expected_orders:
        solver = z3.Solver()
        solver.add(
            *(positions[point] == index for index, point in enumerate(order)),
            *equality_atoms,
            cut,
        )
        if solver.check() != z3.unsat:
            raise AssertionError(("global-kalmanson-allowed-order-not-cut", order))

    noncyclic_orders_checked = 0
    for left, right in itertools.combinations(range(len(points)), 2):
        order = list(points)
        order[left], order[right] = order[right], order[left]
        order = tuple(order)
        if order in expected_orders:
            continue
        solver = z3.Solver()
        solver.add(
            *(positions[point] == index for index, point in enumerate(order)),
            *equality_atoms,
            cut,
        )
        if solver.check() != z3.sat:
            raise AssertionError(("global-kalmanson-noncyclic-order-cut", order))
        noncyclic_orders_checked += 1

    for omitted_index, omitted_atom in enumerate(equality_atoms):
        solver = z3.Solver()
        solver.add(
            *(positions[point] == point for point in points),
            *(atom for atom in equality_atoms if atom is not omitted_atom),
            z3.Not(omitted_atom),
            cut,
        )
        if solver.check() != z3.sat:
            raise AssertionError(("global-kalmanson-equality-not-guarded", omitted_index))

    witness_replay = replay_global_kalmanson_witness(
        DEFAULT_GLOBAL_KALMANSON_REPLAY_WITNESS
    )
    if witness_replay["status"] != "GLOBAL_KALMANSON_14ROLE_MATCH_KILLS":
        raise AssertionError(("global-kalmanson-v8-witness-not-killed", witness_replay))
    return {
        "theorem": GLOBAL_KALMANSON_SCHEMA["theorem"],
        "minimal_core": str(GLOBAL_KALMANSON_MINIMAL_CORE.resolve()),
        "role_count": len(roles),
        "raw_equality_count": len(equalities),
        "strict_kalmanson_constraint_count": kalmanson_constraint_count,
        "positive_rotations_rejected": len(points),
        "reversed_rotations_rejected": len(points),
        "noncyclic_transpositions_accepted": noncyclic_orders_checked,
        "single_missing_equality_valuations_accepted": len(equalities),
        "v8_witness_replay": witness_replay,
    }


def crossed_arm_seven_point_collision_self_check() -> dict[str, object]:
    """Audit the unguarded, injective eleven-direct-E theorem cut."""
    import z3

    roles = CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["role_order"]
    equalities = CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["equalities"]
    if len(roles) != 7 or len(set(roles)) != 7 or len(equalities) != 11:
        raise AssertionError(("crossed-arm-seven-point-schema-shape", roles, equalities))
    if len(set(equalities)) != len(equalities):
        raise AssertionError(("crossed-arm-seven-point-duplicate-atom", equalities))
    if theorem_cut_guard_kind(CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY) != "unguarded":
        raise AssertionError("crossed-arm seven-point cut unexpectedly has an order guard")

    class EqualityProbe:
        def __init__(self):
            self.z3 = z3
            self._atoms = {}

        @property
        def position(self):
            raise AssertionError("unguarded theorem cut accessed cyclic positions")

        def E(self, center, left, right):
            key = (center, min(left, right), max(left, right))
            return self._atoms.setdefault(
                key, z3.Bool(f"crossed_arm_seven_point_eq_{len(self._atoms)}")
            )

    points = tuple(range(7))
    key = ("theorem", CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY, *points)
    probe = EqualityProbe()
    atoms = theorem_cut_atoms(probe, key)
    if len(atoms) != 11 or len({atom.sexpr() for atom in atoms}) != 11:
        raise AssertionError(("crossed-arm-seven-point-cut-atoms", atoms))
    cut = guarded_cut_formula(z3, atoms)
    solver = z3.Solver()
    solver.add(*atoms, cut)
    if solver.check() != z3.unsat:
        raise AssertionError("crossed-arm seven-point antecedent was not cut")
    for omitted_index, omitted_atom in enumerate(atoms):
        solver = z3.Solver()
        solver.add(
            *(atom for atom in atoms if atom is not omitted_atom),
            z3.Not(omitted_atom),
            cut,
        )
        if solver.check() != z3.sat:
            raise AssertionError((
                "crossed-arm-seven-point-equality-not-exact",
                omitted_index,
            ))
    try:
        validate_theorem_key([
            "theorem",
            CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY,
            0, 1, 2, 3, 4, 5, 0,
        ])
    except ValueError as exc:
        if not exc.args or exc.args[0][1] != "vertices-not-distinct-in-range":
            raise
    else:
        raise AssertionError("crossed-arm seven-point checkpoint accepted role collision")
    return {
        "status": "CROSSED_ARM_SEVEN_POINT_COLLISION_OK",
        "theorem": CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA["theorem"],
        "roles": list(roles),
        "raw_equality_count": len(atoms),
        "single_missing_equality_valuations_accepted": len(atoms),
        "order_guard": None,
        "injective_checkpoint_key_checked": True,
    }


def convex_five_point_guard_self_check() -> dict[str, object]:
    import z3

    points = (0, 1, 2, 3, 4)
    positions = {v: z3.Int(f"convex_five_pos_{v}") for v in points}
    equalities = [
        z3.Bool(f"convex_five_eq_{index}")
        for index, _requirement in enumerate(
            CONVEX_FIVE_POINT_SCHEMA["equalities"]
        )
    ]
    guard = cyclic_order_up_to_orientation_guard(z3, positions, points)
    cut = z3.Or(z3.Not(guard), *(z3.Not(atom) for atom in equalities))
    rejected = 0
    expected = {
        *rotations(points),
        *rotations(tuple(reversed(points))),
    }
    for order in itertools.permutations(points):
        solver = z3.Solver()
        solver.add(
            *(positions[v] == index for index, v in enumerate(order)),
            *equalities,
            cut,
        )
        outcome = solver.check()
        if (outcome == z3.unsat) != (order in expected):
            raise AssertionError(("convex-five-up-to-orientation", order, outcome))
        rejected += int(outcome == z3.unsat)
    if rejected != 10:
        raise AssertionError(("convex-five-rejected-count", rejected))
    return {
        "theorem": CONVEX_FIVE_POINT_SCHEMA["theorem"],
        "linear_orders_checked": 120,
        "positive_rotations_rejected": 5,
        "reversed_rotations_rejected": 5,
        "raw_equality_count": len(CONVEX_FIVE_POINT_SCHEMA["equalities"]),
    }


def self_check(
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    import z3

    family_checks = {}
    primary = (0, 1, 2, 3, 4)
    for family in FAMILIES:
        positions = {v: z3.Int(f"{family}_pos_{v}") for v in primary}
        memberships = {
            (c, p): z3.Bool(f"{family}_m_{c}_{p}") for c in primary for p in primary
        }
        cut = theorem_cut(z3, positions, memberships, family, primary)
        fixed = [memberships[key] for key in family_literals(family, primary)]
        rejected = 0
        for order in itertools.permutations(primary):
            solver = z3.Solver()
            solver.add(*(positions[v] == i for i, v in enumerate(order)), cut, *fixed)
            outcome = solver.check()
            should_reject = order in set(rotations(primary))
            if (outcome == z3.unsat) != should_reject:
                raise AssertionError(("cyclic-family-smoke", family, order, outcome))
            rejected += int(outcome == z3.unsat)
        if rejected != 5:
            raise AssertionError(("cyclic-family-rejected-count", family, rejected))
        family_checks[family] = {
            "linear_orders_checked": 120,
            "positive_rotations_rejected": rejected,
            "reversed_rotations_rejected": 0,
        }
    return {
        "status": "SMOKE_OK",
        "critical_no_K4_representation": critical_k4_representation,
        "critical_no_K4_representation_check": (
            critical_k4_representation_self_check(
                critical_k4_representation
            )
        ),
        "crossed_arm_polarity": crossed_arm_polarity_self_check(),
        "global_edge_equality": global_edge_equality_self_check(),
        "mutual_bisector_transport": mutual_bisector_transport_self_check(),
        "v5_mutual_bisector_witness_replay": (
            replay_mutual_bisector_transport_witness(
                DEFAULT_MUTUAL_BISECTOR_REPLAY_WITNESS
            )
        ),
        "raw_btw_sep": raw_btw_sep_self_check(),
        "legacy_three_family_checks": family_checks,
        "convex_five_point_core": convex_five_point_guard_self_check(),
        GLOBAL_KALMANSON_FAMILY: global_kalmanson_guard_self_check(),
        CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY: (
            crossed_arm_seven_point_collision_self_check()
        ),
        "full_bank_guard_checks": dual_row_cegar.guard_self_checks(),
        "theorem_cut_subsumption": theorem_cut_subsumption_self_check(
            critical_k4_representation
        ),
        "checkpoint_roundtrip": checkpoint_roundtrip_self_check(
            critical_k4_representation
        ),
        "canonical_row_adapter_count": N,
    }


def matcher_benchmark(
    timeout_ms: int,
    arm: str = ARMS[0],
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    """Compare repeated model decoding with one shared context on one model."""
    audit = CrossedAudit(critical_k4_representation)
    add_explicit_q_pair_and_crossed_arm(audit, arm)
    audit.solver.set(timeout=timeout_ms)
    solve_started = time.perf_counter()
    outcome = audit.solver.check()
    solve_ms = (time.perf_counter() - solve_started) * 1000
    if outcome != audit.z3.sat:
        raise RuntimeError(
            f"matcher benchmark requires SAT, got {outcome}: {audit.solver.reason_unknown()}"
        )
    model = audit.solver.model()

    reference_started = time.perf_counter()
    reference_structural = dual_row_cegar.structural_violations(audit, model)
    reference_groups = full_bank_match_groups(audit, model)
    reference_ms = (time.perf_counter() - reference_started) * 1000

    context_started = time.perf_counter()
    context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
    context_ms = (time.perf_counter() - context_started) * 1000
    optimized_started = time.perf_counter()
    optimized_structural = dual_row_cegar.structural_violations(audit, model, context)
    optimized_groups = full_bank_match_groups(audit, model, context)
    optimized_scan_ms = (time.perf_counter() - optimized_started) * 1000

    reference_matches = tuple(matches for matches, _add_match in reference_groups)
    optimized_matches = tuple(matches for matches, _add_match in optimized_groups)
    if optimized_structural != reference_structural or optimized_matches != reference_matches:
        raise AssertionError({
            "structural": (len(reference_structural), len(optimized_structural)),
            "match_groups": tuple(
                (len(reference), len(optimized))
                for reference, optimized in zip(reference_matches, optimized_matches)
            ),
        })
    optimized_total_ms = context_ms + optimized_scan_ms
    return {
        "arm": arm,
        "critical_no_K4_representation": audit.critical_k4_representation,
        "candidate_count": 1,
        "equivalent_structural_and_match_sets": True,
        "structural_match_count": len(reference_structural),
        "match_group_counts": [len(matches) for matches in reference_matches],
        "raw_e_atoms_cached": len(context.equality_truth),
        "solve_ms": round(solve_ms, 3),
        "reference_ms": round(reference_ms, 3),
        "context_build_ms": round(context_ms, 3),
        "optimized_scan_ms": round(optimized_scan_ms, 3),
        "optimized_total_ms": round(optimized_total_ms, 3),
        "speedup_including_context_build": round(
            reference_ms / max(optimized_total_ms, 1e-9), 2
        ),
    }


def prepare_run_directory(
    arm: str,
    run_tag: str,
    critical_k4_representation: str,
    resume_result: Path | None,
) -> Path:
    """Create a fresh run directory, or reuse one only for explicit resume."""

    representation_suffix = critical_k4_artifact_suffix(
        critical_k4_representation
    )
    run_dir = HERE / f"{arm}-{run_tag}{representation_suffix}"
    run_dir.mkdir(parents=True, exist_ok=resume_result is not None)
    return run_dir


def run_arm(
    arm: str,
    timeout_ms: int,
    max_iterations: int,
    run_tag: str,
    resume_result: Path | None = None,
    universal_cut_import: Path | None = None,
    force_shared_fourth: bool = False,
    critical_k4_representation: str = (
        incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    ),
) -> dict[str, object]:
    run_dir = prepare_run_directory(
        arm,
        run_tag,
        critical_k4_representation,
        resume_result,
    )
    # Enable every source-proved finite geometric projection available in the
    # base encoder: two-circle/common-bisector incidence, cap-crossing
    # Kalmanson, and global selected-row shared-pair separation.
    audit = CrossedAudit(critical_k4_representation)
    selectors = add_explicit_q_pair_and_crossed_arm(
        audit, arm, force_shared_fourth=force_shared_fourth
    )
    if resume_result is not None:
        resume = restore_learned_cuts(audit, arm, resume_result)
    elif universal_cut_import is not None:
        resume = import_universal_cuts(audit, arm, universal_cut_import)
    else:
        resume = {"used": False}
    started = time.monotonic()
    iterations: list[dict[str, object]] = []
    candidate_count = 0
    connected_candidate_count = 0
    structural_cut_count = sum(
        key[0] in STRUCTURAL_FAMILIES for key in audit.packet_cuts
    )
    theorem_cut_counts = {
        family: sum(
            key[0] == "theorem" and key[1] == family for key in audit.packet_cuts
        )
        for family in FULL_BANK_FAMILIES
    }
    theorem_matches_seen = {family: 0 for family in FULL_BANK_FAMILIES}
    suppressed_theorem_cut_counts = {
        family: 0
        for family in (
            *EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES,
            *SUBSUMED_THEOREM_CUT_FAMILIES,
        )
    }
    retired_theorem_cut_counts = {
        family: 0
        for family in (
            *EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES,
            *SUBSUMED_THEOREM_CUT_FAMILIES,
        )
    }
    witness = None

    for iteration in range(max_iterations):
        remaining = timeout_ms - int((time.monotonic() - started) * 1000)
        if remaining <= 0:
            status = "UNKNOWN_TIMEOUT"
            break
        audit.solver.set(timeout=remaining)
        check_started = time.monotonic()
        outcome = audit.solver.check()
        record: dict[str, object] = {
            "iteration": iteration,
            "check_ms": int((time.monotonic() - check_started) * 1000),
            "result": str(outcome),
        }
        if outcome == audit.z3.unknown:
            record["reason"] = audit.solver.reason_unknown()
            iterations.append(record)
            status = "UNKNOWN_FAIL_CLOSED"
            break
        if outcome == audit.z3.unsat:
            iterations.append(record)
            status = "UNSAT_UNCERTIFIED"
            break

        candidate_count += 1
        model = audit.solver.model()
        closed = audit.closed_reachable_set(model)
        if closed is not None:
            record["kind"] = "connectivity-cut"
            record["closed_set"] = [audit.names[v] for v in sorted(closed)]
            audit.add_cut(closed)
            iterations.append(record)
            continue

        connected_candidate_count += 1
        context = dual_row_cegar.CandidateMatchContext.from_model(audit, model)
        violations = crossed_structural_violations(audit, model, context)
        groups = full_bank_match_groups(audit, model, context)
        fresh_structural = sum(
            1
            for violation in violations
            if add_crossed_structural_violation(audit, violation)
        )
        fresh_theorems = {family: 0 for family in FULL_BANK_FAMILIES}
        total_matches = 0
        candidate_theorem_keys = []
        for matches, _add_match in groups:
            total_matches += len(matches)
            for match in matches:
                theorem_matches_seen[match[0]] += 1
                candidate_theorem_keys.append(theorem_cut_key_from_match(match))
        theorem_install = install_theorem_cut_keys(audit, candidate_theorem_keys)
        for key in theorem_install["added"]:
            fresh_theorems[key[1]] += 1
        fresh_suppressed = collections.Counter(
            key[1] for key in theorem_install["suppressed"]
        )
        for family, count in fresh_suppressed.items():
            suppressed_theorem_cut_counts[family] += count
        fresh_retired = collections.Counter(
            key[1] for key in theorem_install["retired"]
        )
        for family, count in fresh_retired.items():
            theorem_cut_counts[family] -= count
            if theorem_cut_counts[family] < 0:
                raise AssertionError((
                    "retired-theorem-cut-count-underflow",
                    family,
                    theorem_cut_counts[family],
                ))
            retired_theorem_cut_counts[family] += count
        fresh_theorem_count = sum(fresh_theorems.values())
        if fresh_structural or fresh_theorem_count:
            structural_cut_count += fresh_structural
            for family, count in fresh_theorems.items():
                theorem_cut_counts[family] += count
            record.update(
                {
                    "kind": "full-selected-row-and-raw-equality-theorem-bank-cuts",
                    "structural_violations": len(violations),
                    "fresh_structural_cuts": fresh_structural,
                    "theorem_matches": total_matches,
                    "fresh_theorem_cuts": fresh_theorems,
                    "suppressed_theorem_cuts": dict(
                        sorted(fresh_suppressed.items())
                    ),
                    "retired_theorem_cuts": dict(
                        sorted(fresh_retired.items())
                    ),
                    "suppressed_subsumed_theorem_cuts": dict(
                        sorted(
                            (family, count)
                            for family, count in fresh_suppressed.items()
                            if family in SUBSUMED_THEOREM_CUT_FAMILIES
                        )
                    ),
                    "retired_subsumed_theorem_cuts": dict(
                        sorted(
                            (family, count)
                            for family, count in fresh_retired.items()
                            if family in SUBSUMED_THEOREM_CUT_FAMILIES
                        )
                    ),
                }
            )
            iterations.append(record)
            continue

        witness = replay_crossed_arm(
            audit, model, selectors, arm, context,
            force_shared_fourth=force_shared_fourth,
        )
        record.update({"kind": "surviving-candidate", "semantic_replay": "PASS"})
        iterations.append(record)
        status = "SAT"
        break
    else:
        status = "UNKNOWN_ITERATION_LIMIT"

    result = {
        "schema": RESULT_SCHEMA,
        "status": status,
        "arm": arm,
        "run_tag": run_tag,
        "critical_no_K4_representation": audit.critical_k4_representation,
        "forced_shared_fourth": force_shared_fourth,
        "n": N,
        "closed_cap_profile": list(PROFILE),
        "timeout_ms": timeout_ms,
        "elapsed_ms": int((time.monotonic() - started) * 1000),
        "candidate_count": candidate_count,
        "connected_candidate_count": connected_candidate_count,
        "connectivity_cut_count": len(audit.cuts),
        "structural_cut_count": structural_cut_count,
        "structural_cut_counts": {
            family: sum(1 for key in audit.packet_cuts if key[0] == family)
            for family in STRUCTURAL_FAMILIES
        },
        "theorem_cut_count": sum(theorem_cut_counts.values()),
        "theorem_cut_counts": theorem_cut_counts,
        "theorem_matches_seen": theorem_matches_seen,
        "suppressed_theorem_cut_count": sum(
            suppressed_theorem_cut_counts.values()
        ),
        "suppressed_theorem_cut_counts": (
            suppressed_theorem_cut_counts
        ),
        "retired_theorem_cut_count": sum(
            retired_theorem_cut_counts.values()
        ),
        "retired_theorem_cut_counts": retired_theorem_cut_counts,
        "suppressed_exact_orbit_theorem_cut_count": sum(
            suppressed_theorem_cut_counts[family]
            for family in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
        ),
        "suppressed_exact_orbit_theorem_cut_counts": {
            family: suppressed_theorem_cut_counts[family]
            for family in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
        },
        "retired_exact_orbit_theorem_cut_count": sum(
            retired_theorem_cut_counts[family]
            for family in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
        ),
        "retired_exact_orbit_theorem_cut_counts": {
            family: retired_theorem_cut_counts[family]
            for family in EXACT_ORBIT_CANONICAL_THEOREM_FAMILIES
        },
        "suppressed_subsumed_theorem_cut_count": sum(
            suppressed_theorem_cut_counts[family]
            for family in SUBSUMED_THEOREM_CUT_FAMILIES
        ),
        "suppressed_subsumed_theorem_cut_counts": {
            family: suppressed_theorem_cut_counts[family]
            for family in SUBSUMED_THEOREM_CUT_FAMILIES
        },
        "retired_subsumed_theorem_cut_count": sum(
            retired_theorem_cut_counts[family]
            for family in SUBSUMED_THEOREM_CUT_FAMILIES
        ),
        "retired_subsumed_theorem_cut_counts": {
            family: retired_theorem_cut_counts[family]
            for family in SUBSUMED_THEOREM_CUT_FAMILIES
        },
        "resume": resume,
        "learned_cuts": learned_cut_manifest(audit),
        "all_registered_selected_row_and_raw_equality_theorem_families_encoded": True,
        "all_raw_btw_sep_cyclic_cuts_encoded": True,
        "global_undirected_edge_equality_closure_encoded": True,
        "global_undirected_edge_count": len(audit.edge_length_class),
        "global_edge_equality_biconditional_count": audit.blocks[
            "global_edge_equality_closure"
        ],
        "global_edge_equality_lean_soundness_reference": (
            "Problem97.Census554.EqualityCore.EdgeClosure.sound"
        ),
        "mutual_bisector_transport_cegar_enabled": True,
        "mutual_bisector_transport_declaration": (
            "Problem97.dist_eq_dist_of_mutual_bisector"
        ),
        "canonical_row_count": len(audit.row_objects),
        "collision_deletion_packet_encoded": True,
        "crossed_complementary_omissions_encoded": True,
        "assertion_block_counts": dict(sorted(audit.blocks.items())),
        "iterations": iterations,
        "omitted": [
            "Euclidean coordinates and QF_NRA realizability",
            "MEC and nonobtuse-triangle inequalities",
            "full CounterexampleData noM44 geometry",
            "other production metric theorems not registered in this lane",
            "Lean build, kernel closure, and transitive axiom audit",
            "all n other than 17 and all closed-cap profiles other than (6,8,6)",
        ],
        "trust_boundary": {
            "finite_Boolean_incidence_and_order_only": True,
            "source_proved_geometric_projections_encoded": True,
            "sat_witness_semantically_replayed": status == "SAT",
            "unsat_certificate_checked": False,
            "lean_kernel_proof": False,
            "universal_n_claim": False,
        },
    }
    (run_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    (run_dir / "iterations.jsonl").write_text(
        "".join(json.dumps(item, sort_keys=True) + "\n" for item in iterations)
    )
    if witness is not None:
        (run_dir / "witness.json").write_text(json.dumps(witness, indent=2, sort_keys=True) + "\n")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument(
        "--self-check-output",
        type=Path,
        metavar="RESULT_JSON",
        help="write --self-check to this artifact instead of the default self-check.json",
    )
    parser.add_argument("--matcher-benchmark", action="store_true")
    parser.add_argument(
        "--replay-btw-sep-witness",
        type=Path,
        metavar="WITNESS_JSON",
        help=(
            "solver-free replay of every raw btw_sep instance in one witness; "
            f"the checked v4 witness is {DEFAULT_BTW_SEP_REPLAY_WITNESS}"
        ),
    )
    parser.add_argument(
        "--replay-mutual-bisector-witness",
        type=Path,
        metavar="WITNESS_JSON",
        help=(
            "solver-free replay of mutual-bisector transport and the resulting "
            f"parity kill; the checked v5 witness is {DEFAULT_MUTUAL_BISECTOR_REPLAY_WITNESS}"
        ),
    )
    parser.add_argument(
        "--replay-v7-witness",
        type=Path,
        metavar="WITNESS_JSON",
        help=(
            "solver-free replay of global edge equality and the ordered six-role "
            f"theorem against one witness; the checked v6 survivor is {DEFAULT_V7_REPLAY_WITNESS}"
        ),
    )
    parser.add_argument(
        "--replay-v7-output",
        type=Path,
        metavar="RESULT_JSON",
        help="write the --replay-v7-witness result to this JSON artifact",
    )
    parser.add_argument(
        "--replay-global-kalmanson-witness",
        type=Path,
        metavar="WITNESS_JSON",
        help=(
            "solver-free replay of the exact 14-role/16-equality family; "
            f"the checked v8 witness is {DEFAULT_GLOBAL_KALMANSON_REPLAY_WITNESS}"
        ),
    )
    parser.add_argument(
        "--replay-global-kalmanson-output",
        type=Path,
        metavar="RESULT_JSON",
        help="write the global-Kalmanson witness replay to this JSON artifact",
    )
    parser.add_argument("--arm", choices=(*ARMS, "both"))
    parser.add_argument(
        "--force-shared-fourth",
        action="store_true",
        help=(
            "require the anonymous fourth support vertex of the common and "
            "opposite crossed rows to be the same"
        ),
    )
    parser.add_argument(
        "--critical-k4-representation",
        choices=incidence_cegar.CRITICAL_K4_REPRESENTATIONS,
        default=incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION,
        help=(
            "encoding for critical-source K4 exclusion in the base audit "
            f"(default: {incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION})"
        ),
    )
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--max-iterations", type=int, default=500)
    parser.add_argument(
        "--run-tag", default="full-metric-bank-v10-seven-point-collision"
    )
    parser.add_argument(
        "--resume",
        type=Path,
        metavar="RESULT_JSON",
        help="restore validated learned cuts from a prior result artifact",
    )
    parser.add_argument(
        "--import-universal-cuts",
        type=Path,
        metavar="RESULT_JSON",
        help=(
            "reconstruct arm-independent cuts from a validated v3-v10 result; "
            "ordinary --resume remains schema- and arm-strict"
        ),
    )
    args = parser.parse_args()
    if (
        not args.self_check
        and not args.matcher_benchmark
        and args.replay_btw_sep_witness is None
        and args.replay_mutual_bisector_witness is None
        and args.replay_v7_witness is None
        and args.replay_global_kalmanson_witness is None
        and args.arm is None
    ):
        parser.error(
            "request --self-check, --matcher-benchmark, a witness replay, and/or --arm"
        )
    if args.resume is not None and args.arm in (None, "both"):
        parser.error("--resume requires one explicit --arm")
    if args.import_universal_cuts is not None and args.arm in (None, "both"):
        parser.error("--import-universal-cuts requires one explicit --arm")
    if args.resume is not None and args.import_universal_cuts is not None:
        parser.error("choose at most one of --resume and --import-universal-cuts")
    if args.replay_v7_output is not None and args.replay_v7_witness is None:
        parser.error("--replay-v7-output requires --replay-v7-witness")
    if (
        args.replay_global_kalmanson_output is not None
        and args.replay_global_kalmanson_witness is None
    ):
        parser.error(
            "--replay-global-kalmanson-output requires "
            "--replay-global-kalmanson-witness"
        )
    if args.self_check_output is not None and not args.self_check:
        parser.error("--self-check-output requires --self-check")
    representation_suffix = critical_k4_artifact_suffix(
        args.critical_k4_representation
    )
    if args.self_check:
        checked = self_check(args.critical_k4_representation)
        self_check_output = args.self_check_output or (
            HERE / f"self-check{representation_suffix}.json"
        )
        self_check_output.parent.mkdir(parents=True, exist_ok=True)
        self_check_output.write_text(
            json.dumps(checked, indent=2, sort_keys=True) + "\n"
        )
        if args.self_check_output is None:
            print(json.dumps(checked, sort_keys=True))
        else:
            print(json.dumps({
                "status": checked["status"],
                "result_schema": RESULT_SCHEMA,
                "cut_schema": CUT_SCHEMA,
                "critical_no_K4_representation": (
                    args.critical_k4_representation
                ),
                "theorem_family_count": len(FULL_BANK_FAMILIES),
                "global_kalmanson_status": checked[GLOBAL_KALMANSON_FAMILY][
                    "v8_witness_replay"
                ]["status"],
                "output": str(self_check_output.resolve()),
            }, sort_keys=True))
    if args.matcher_benchmark:
        benchmark = matcher_benchmark(
            args.timeout_ms,
            critical_k4_representation=args.critical_k4_representation,
        )
        (
            HERE
            / f"matcher-benchmark-one-candidate{representation_suffix}.json"
        ).write_text(
            json.dumps(benchmark, indent=2, sort_keys=True) + "\n"
        )
        print(json.dumps(benchmark, sort_keys=True))
    if args.replay_btw_sep_witness is not None:
        print(json.dumps(
            replay_raw_btw_sep_witness(args.replay_btw_sep_witness), sort_keys=True
        ))
    if args.replay_mutual_bisector_witness is not None:
        print(json.dumps(
            replay_mutual_bisector_transport_witness(
                args.replay_mutual_bisector_witness
            ),
            sort_keys=True,
        ))
    if args.replay_v7_witness is not None:
        replay = replay_v7_witness(args.replay_v7_witness)
        if args.replay_v7_output is not None:
            args.replay_v7_output.parent.mkdir(parents=True, exist_ok=True)
            args.replay_v7_output.write_text(
                json.dumps(replay, indent=2, sort_keys=True) + "\n"
            )
        print(json.dumps({
            "schema": replay["schema"],
            "status": replay["status"],
            "global_edge_equality_violation_count": (
                replay["global_edge_equality"]["violation_count"]
            ),
            "six_role_match_count": replay[NEW_THEOREM_FAMILY]["match_count"],
            "killing_constraints": replay["killing_constraints"],
        }, sort_keys=True))
    if args.replay_global_kalmanson_witness is not None:
        replay = replay_global_kalmanson_witness(
            args.replay_global_kalmanson_witness
        )
        if args.replay_global_kalmanson_output is not None:
            args.replay_global_kalmanson_output.parent.mkdir(parents=True, exist_ok=True)
            args.replay_global_kalmanson_output.write_text(
                json.dumps(replay, indent=2, sort_keys=True) + "\n"
            )
        print(json.dumps({
            "schema": replay["schema"],
            "status": replay["status"],
            "family": replay["family"],
            "equality_requirement_count": replay["equality_requirement_count"],
            "cut_guard_true": replay["cut_guard_true"],
            "killed_by_guarded_cut": replay["killed_by_guarded_cut"],
        }, sort_keys=True))
    if args.arm is not None:
        arms = ARMS if args.arm == "both" else (args.arm,)
        for arm in arms:
            result = run_arm(
                arm,
                args.timeout_ms,
                args.max_iterations,
                args.run_tag,
                args.resume,
                args.import_universal_cuts,
                args.force_shared_fourth,
                critical_k4_representation=args.critical_k4_representation,
            )
            print(json.dumps({k: result[k] for k in (
                "arm", "status", "critical_no_K4_representation",
                "forced_shared_fourth", "elapsed_ms", "candidate_count",
                "structural_cut_count", "theorem_cut_count", "theorem_cut_counts"
            )}, sort_keys=True))


if __name__ == "__main__":
    main()
