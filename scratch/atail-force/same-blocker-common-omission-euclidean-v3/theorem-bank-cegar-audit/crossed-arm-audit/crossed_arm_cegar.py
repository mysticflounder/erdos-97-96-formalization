#!/usr/bin/env python3
"""Bounded n=17 audit of the two live crossed outside-pair arms.

This is finite discovery evidence.  It is not a Lean proof and it does not
assert Euclidean realizability of a surviving Boolean/incidence model.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
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

FULL_BANK_FAMILIES = dual_row_cegar.ALL_THEOREM_FAMILIES
PREVIOUS_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v5"
PREVIOUS_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v3"
RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v6"
CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v4"
LEGACY_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v4"
LEGACY_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v2"
ANCIENT_RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v3"
ANCIENT_CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v1"
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
    )


class CrossedAudit(incidence_cegar.Audit):
    """The crossed branch with every canonical selected row exposed to CEGAR."""

    def __init__(self):
        # These three switches encode every source-proved finite geometric
        # projection provided by the shared incidence encoder.
        super().__init__(N, PROFILE, True, True, True)
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
        if key in self.packet_cuts:
            return False
        formula = self.z3.Or(*(self.z3.Not(atom) for atom in atoms))
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


def add_structural_cut_key(audit, key: tuple) -> bool:
    kind = key[0]
    if kind == "circle":
        _, c, d, x, y, z = key
        atoms = [
            dual_row_cegar.row_exists_expr(audit, c, (x, y, z)),
            dual_row_cegar.row_exists_expr(audit, d, (x, y, z)),
        ]
    elif kind == "shared_pair":
        _, c, d, x, y = key
        atoms = [
            dual_row_cegar.row_exists_expr(audit, c, (x, y)),
            dual_row_cegar.row_exists_expr(audit, d, (x, y)),
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
            dual_row_cegar.row_exists_expr(audit, center, (x, y))
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


def add_theorem_cut_key(audit, key: tuple) -> bool:
    _, family, *points = key
    points = tuple(points)
    if family in dual_row_cegar.FAMILIES:
        c1, pts1, c2, pts2 = dual_row_cegar.pattern_atoms(family, points)
        atoms = [
            dual_row_cegar.cyclic_guard(audit.z3, audit.position, points),
            dual_row_cegar.row_exists_expr(audit, c1, pts1),
            dual_row_cegar.row_exists_expr(audit, c2, pts2),
        ]
    elif family in dual_row_cegar.LINEAR_ROW_FAMILIES:
        schema = dual_row_cegar.LINEAR_ROW_FAMILIES[family]
        atoms = [dual_row_cegar.linear_guard(audit.z3, audit.position, points)]
        atoms.extend(
            dual_row_cegar.row_exists_expr(
                audit, points[center], tuple(points[index] for index in support)
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
        atoms = [dual_row_cegar.linear_guard(audit.z3, audit.position, points)]
        atoms.extend(
            audit.E(points[center], points[left], points[right])
            for center, left, right in schema["equalities"]
        )
    return audit.add_guarded_cut(key, atoms)


def learned_cut_manifest(audit) -> dict[str, object]:
    structural = []
    theorem = []
    for key in audit.packet_cuts:
        destination = theorem if key[0] == "theorem" else structural
        destination.append(list(key))
    return {
        "schema": CUT_SCHEMA,
        "structural_families": list(STRUCTURAL_FAMILIES),
        "theorem_families": list(FULL_BANK_FAMILIES),
        "connectivity": [sorted(cut) for cut in audit.cuts],
        "structural": sorted(structural),
        "theorem": sorted(theorem),
    }


def validate_structural_key(raw_key) -> tuple:
    if not isinstance(raw_key, list) or not raw_key or raw_key[0] not in STRUCTURAL_FAMILIES:
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


def validate_theorem_key(raw_key) -> tuple:
    if not isinstance(raw_key, list) or len(raw_key) < 3 or raw_key[0] != "theorem":
        raise ValueError(("invalid-theorem-cut-key", raw_key))
    family = raw_key[1]
    if not isinstance(family, str) or family not in FULL_BANK_FAMILIES:
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
    return restore_learned_cuts_payload(audit, arm, payload, str(result_path.resolve()))


def structural_families_for_schema_pair(schema_pair):
    if schema_pair == (RESULT_SCHEMA, CUT_SCHEMA):
        return STRUCTURAL_FAMILIES
    if schema_pair == (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA):
        return PRE_TRANSPORT_STRUCTURAL_FAMILIES
    if schema_pair in {
        (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA),
        (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA),
    }:
        return BASE_STRUCTURAL_FAMILIES
    raise ValueError(("unknown-schema-pair", schema_pair))


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
    if manifest.get("theorem_families") != list(FULL_BANK_FAMILIES):
        raise ValueError(("incompatible-theorem-families", manifest.get("theorem_families")))

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
    structural = [validate_structural_key(key) for key in raw_structural]
    theorem = [validate_theorem_key(key) for key in raw_theorem]
    for label, keys in (
        ("connectivity", connectivity), ("structural", structural), ("theorem", theorem)
    ):
        if len(set(keys)) != len(keys):
            raise ValueError(("duplicate-resume-cut-key", label))

    for cut in connectivity:
        audit.add_cut(frozenset(cut))
    for key in structural:
        if not add_structural_cut_key(audit, key):
            raise AssertionError(("duplicate-structural-cut-during-restore", key))
    for key in theorem:
        if not add_theorem_cut_key(audit, key):
            raise AssertionError(("duplicate-theorem-cut-during-restore", key))
    return {
        "used": True,
        "mode": mode,
        "source_result": source_result,
        "source_arm": payload.get("arm"),
        "source_result_schema": schema_pair[0],
        "source_cut_schema": schema_pair[1],
        "connectivity_cut_count": len(connectivity),
        "structural_cut_count": len(structural),
        "theorem_cut_count": len(theorem),
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


def add_explicit_q_pair_and_crossed_arm(audit: incidence_cegar.Audit, arm: str):
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


def replay_crossed_arm(audit, model, selectors, arm: str, context=None) -> dict[str, object]:
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
    }
    base["crossed_arm_replay"] = {
        "status": "PASS",
        "ordered_pair_unique": True,
        "source_same_actual_blocker_as_P_source1": True,
        "outside_eq_pair_replayed": True,
        "forced_memberships_and_complementary_omissions_replayed": True,
        "structural_bank_active_match_count": len(structural),
        "full_theorem_bank_active_match_counts": family_counts,
        "all_registered_selected_row_and_raw_equality_theorem_families_replayed": True,
    }
    base["radius_classes"] = dual_row_cegar.named_radius_classes(audit, model, context)
    return base


def checkpoint_roundtrip_self_check() -> dict[str, object]:
    source = CrossedAudit()
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
    for family in FULL_BANK_FAMILIES:
        points = tuple(range(theorem_family_arity(family)))
        if family in dual_row_cegar.FAMILIES:
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
        "learned_cuts": learned_cut_manifest(source),
    }))
    restored = CrossedAudit()
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
        raise AssertionError("checkpoint formulas did not reconstruct exactly")

    prior_imports = []
    for prior_result_schema, prior_cut_schema in (
        (PREVIOUS_RESULT_SCHEMA, PREVIOUS_CUT_SCHEMA),
        (LEGACY_RESULT_SCHEMA, LEGACY_CUT_SCHEMA),
        (ANCIENT_RESULT_SCHEMA, ANCIENT_CUT_SCHEMA),
    ):
        prior_schema_pair = (prior_result_schema, prior_cut_schema)
        prior_structural_families = structural_families_for_schema_pair(
            prior_schema_pair
        )
        prior_serialized = json.loads(json.dumps(serialized))
        prior_serialized["schema"] = prior_result_schema
        prior_serialized["arm"] = ARMS[1]
        prior_serialized["learned_cuts"]["schema"] = prior_cut_schema
        prior_serialized["learned_cuts"]["structural_families"] = list(
            prior_structural_families
        )
        prior_serialized["learned_cuts"]["structural"] = [
            key for key in prior_serialized["learned_cuts"]["structural"]
            if key[0] in prior_structural_families
        ]
        imported = CrossedAudit()
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
            ),
            require_same_arm=False,
            mode="universal-cut-import",
        )
        expected_manifest = json.loads(json.dumps(prior_serialized["learned_cuts"]))
        expected_manifest["schema"] = CUT_SCHEMA
        expected_manifest["structural_families"] = list(STRUCTURAL_FAMILIES)
        if learned_cut_manifest(imported) != expected_manifest:
            raise AssertionError((prior_result_schema, "universal-cut import did not normalize"))
        imported_formulas = {
            key: formula.sexpr() for key, formula in imported.packet_cuts.items()
        }
        expected_formulas = {
            key: formula for key, formula in source_formulas.items()
            if key[0] == "theorem" or key[0] in prior_structural_families
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
        "connectivity_cut_kinds_checked": 1,
        "structural_cut_kinds_checked": list(STRUCTURAL_FAMILIES),
        "theorem_families_checked": checked_families,
        "restored_cut_counts": {
            key: value for key, value in resume.items() if key.endswith("_cut_count")
        },
        "prior_universal_imports": prior_imports,
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


def self_check() -> dict[str, object]:
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
        "crossed_arm_polarity": crossed_arm_polarity_self_check(),
        "mutual_bisector_transport": mutual_bisector_transport_self_check(),
        "v5_mutual_bisector_witness_replay": (
            replay_mutual_bisector_transport_witness(
                DEFAULT_MUTUAL_BISECTOR_REPLAY_WITNESS
            )
        ),
        "raw_btw_sep": raw_btw_sep_self_check(),
        "legacy_three_family_checks": family_checks,
        "full_bank_guard_checks": dual_row_cegar.guard_self_checks(),
        "checkpoint_roundtrip": checkpoint_roundtrip_self_check(),
        "canonical_row_adapter_count": N,
    }


def matcher_benchmark(timeout_ms: int, arm: str = ARMS[0]) -> dict[str, object]:
    """Compare repeated model decoding with one shared context on one model."""
    audit = CrossedAudit()
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


def run_arm(
    arm: str,
    timeout_ms: int,
    max_iterations: int,
    run_tag: str,
    resume_result: Path | None = None,
    universal_cut_import: Path | None = None,
) -> dict[str, object]:
    run_dir = HERE / f"{arm}-{run_tag}"
    run_dir.mkdir(parents=True, exist_ok=True)
    # Enable every source-proved finite geometric projection available in the
    # base encoder: two-circle/common-bisector incidence, cap-crossing
    # Kalmanson, and global selected-row shared-pair separation.
    audit = CrossedAudit()
    selectors = add_explicit_q_pair_and_crossed_arm(audit, arm)
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
        for matches, add_match in groups:
            total_matches += len(matches)
            for match in matches:
                theorem_matches_seen[match[0]] += 1
                if add_match(audit, match):
                    fresh_theorems[match[0]] += 1
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
                }
            )
            iterations.append(record)
            continue

        witness = replay_crossed_arm(audit, model, selectors, arm, context)
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
        "resume": resume,
        "learned_cuts": learned_cut_manifest(audit),
        "all_registered_selected_row_and_raw_equality_theorem_families_encoded": True,
        "all_raw_btw_sep_cyclic_cuts_encoded": True,
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
    parser.add_argument("--arm", choices=(*ARMS, "both"))
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--max-iterations", type=int, default=500)
    parser.add_argument(
        "--run-tag", default="full-metric-bank-v6-mutual-bisector-transport"
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
            "reconstruct arm-independent cuts from a validated v3/v4/v5/v6 result; "
            "ordinary --resume remains schema- and arm-strict"
        ),
    )
    args = parser.parse_args()
    if (
        not args.self_check
        and not args.matcher_benchmark
        and args.replay_btw_sep_witness is None
        and args.replay_mutual_bisector_witness is None
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
    if args.self_check:
        checked = self_check()
        (HERE / "self-check.json").write_text(json.dumps(checked, indent=2, sort_keys=True) + "\n")
        print(json.dumps(checked, sort_keys=True))
    if args.matcher_benchmark:
        benchmark = matcher_benchmark(args.timeout_ms)
        (HERE / "matcher-benchmark-one-candidate.json").write_text(
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
            )
            print(json.dumps({k: result[k] for k in (
                "arm", "status", "elapsed_ms", "candidate_count",
                "structural_cut_count", "theorem_cut_count", "theorem_cut_counts"
            )}, sort_keys=True))


if __name__ == "__main__":
    main()
