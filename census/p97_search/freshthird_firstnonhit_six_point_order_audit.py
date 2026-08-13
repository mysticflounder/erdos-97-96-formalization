"""Finite exact-rational audit for the FreshThird first-non-hit six-point lane.

This module is deliberately a diagnostic.  It does not invoke Lean and does not
turn a rational coordinate search into a proof.  The finite universe is all
oriented cyclic orders ``(A, ..., ...)`` with ``A`` fixed first.  The metric
rows are

    BA = BC = BD,    FA = FD = FE.

All arithmetic is over :class:`fractions.Fraction`; serialized rationals are
strings so that JSON never introduces a floating-point value.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import itertools
import json
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

ROLES = ("A", "B", "C", "D", "E", "F")
THEOREM_CONSUMER = (
    "Problem97.TwoTripleRowSixPointEuclideanObstruction."
    "false_of_six_ccw_two_triple_row_equalities"
)
THEOREM_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "TwoTripleRowSixPointEuclideanObstruction.lean"
)
SPARSE_THEOREM_CONSUMER = (
    "Problem97.SixPointSparseEuclideanObstruction."
    "false_of_six_ccw_row_equalities"
)
SPARSE_THEOREM_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean"
)
DEFAULT_ARTIFACT = Path("certificates/p97_freshthird_firstnonhit/audit.json")

Point = tuple[Fraction, Fraction]


class AuditError(ValueError):
    """Raised when an audit artifact or replay premise is malformed."""


@dataclass(frozen=True, slots=True)
class Automorphism:
    name: str
    mapping: tuple[tuple[str, str], ...]

    def apply(self, role: str) -> str:
        return dict(self.mapping)[role]


AUTOMORPHISMS = (
    Automorphism("identity", tuple(zip(ROLES, ROLES, strict=True))),
    Automorphism(
        "shared_pair_swap_A_D",
        tuple(zip(ROLES, ("D", "B", "C", "A", "E", "F"), strict=True)),
    ),
    Automorphism(
        "row_swap_B_F_C_E",
        tuple(zip(ROLES, ("A", "F", "E", "D", "C", "B"), strict=True)),
    ),
    Automorphism(
        "shared_pair_and_row_swap",
        tuple(zip(ROLES, ("D", "F", "E", "A", "C", "B"), strict=True)),
    ),
)

# A small, fixed search box.  It is part of the artifact's authenticated input.
CENTER_MAGNITUDES = (Fraction(1, 2), Fraction(1), Fraction(3, 2), Fraction(2), Fraction(3), Fraction(4))
CIRCLE_PARAMETERS = (
    Fraction(-4, 5),
    Fraction(4, 5),
    Fraction(-4, 7),
    Fraction(-1),
    Fraction(1, 8),
    Fraction(-1, 8),
    Fraction(15, 7),
    Fraction(-1, 4),
    Fraction(6, 7),
    Fraction(1, 5),
    Fraction(4, 7),
    Fraction(-15, 7),
    Fraction(-6),
    Fraction(-23, 4),
    Fraction(-51, 119),
    Fraction(-2, 5),
)

EXPECTED_TWO_TRIPLE_ORBIT = ("ABCDEF", "ACBDFE", "AEFDBC", "AFEDCB")
EXPECTED_SPARSE_ORBIT = (
    "ABCEDF",
    "ABDCEF",
    "ABDFEC",
    "ACEFDB",
    "AECBDF",
    "AFDBCE",
    "AFDECB",
    "AFECDB",
)
# These expected sets are regression assertions.  Membership in the audit is
# generated below from theorem-position/schema choices, not read from them.
TWO_TRIPLE_ORBIT = EXPECTED_TWO_TRIPLE_ORBIT
SPARSE_ORBIT = EXPECTED_SPARSE_ORBIT
BASE_WITNESS_ORDERS = (
    "ACFDBE",
    "ACFDEB",
    "ACFEDB",
    "AECFDB",
    "AEFCDB",
    "AEFDCB",
    "AFCDBE",
    "AFCDEB",
    "AFCEDB",
    "AFDBEC",
    "AFDCBE",
    "AFDCEB",
    "AFDEBC",
    "AFEDBC",
)


def _json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")


def _sha256(value: Any) -> str:
    return hashlib.sha256(_json_bytes(value)).hexdigest()


def _q(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def _parse_q(value: Any) -> Fraction:
    if type(value) is not str:
        raise AuditError(f"rational must be a string, got {value!r}")
    try:
        result = Fraction(value)
    except (TypeError, ValueError, ZeroDivisionError) as exc:
        raise AuditError(f"invalid rational {value!r}") from exc
    if _q(result) != value:
        raise AuditError(f"non-canonical rational {value!r}")
    return result


def _rotate_to_a(order: Sequence[str]) -> tuple[str, ...]:
    index = order.index("A")
    return tuple(order[index:]) + tuple(order[:index])


def all_orders() -> tuple[tuple[str, ...], ...]:
    """Return the 120 oriented cyclic orders with A fixed first."""

    return tuple(("A", *tail) for tail in itertools.permutations(ROLES[1:]))


def is_shared_pair_alternating(order: Sequence[str]) -> bool:
    """Whether B and F lie on opposite A-D arcs of the oriented order."""

    return shared_pair_subsequence(order) in (("A", "B", "D", "F"), ("A", "F", "D", "B"))


def shared_pair_subsequence(order: Sequence[str]) -> tuple[str, ...]:
    """The restricted A,B,D,F subsequence used by the source premise."""

    return tuple(role for role in order if role in {"A", "B", "D", "F"})


def _rotate_to_role(order: Sequence[str], role: str) -> tuple[str, ...]:
    index = order.index(role)
    return tuple(order[index:]) + tuple(order[:index])


def _position_substitution(roles: Sequence[str]) -> list[list[str]]:
    return [[f"P{index}", role] for index, role in enumerate(roles)]


def _match_record(
    *,
    family: str,
    order: tuple[str, ...],
    linearized_roles: tuple[str, ...],
    generation: dict[str, Any],
    consumer: str,
    source: str,
    orbit: Sequence[str],
    orientation_polarity: str,
    required_adapter_status: str,
    base_order: str | None = None,
    base_mapping: str | None = None,
) -> dict[str, Any]:
    cut_role = linearized_roles[0]
    cut_order = _rotate_to_role(order, cut_role)
    if orientation_polarity == "forward_ccw":
        if cut_order != linearized_roles:
            raise AuditError("generated forward kernel word does not match its cut")
    elif orientation_polarity == "reversed_ccw":
        if cut_order != _rotate_to_role(tuple(reversed(linearized_roles)), cut_role):
            raise AuditError("generated reversed kernel word does not match its cut")
    else:
        raise AuditError(f"unknown generated orientation {orientation_polarity}")
    result: dict[str, Any] = {
        "family": family,
        "orbit_member": "".join(order),
        "orbit": list(orbit),
        "consumer": consumer,
        "source": source,
        "theorem_position_substitution_tuple": _position_substitution(linearized_roles),
        "theorem_position_substitution": [
            f"P{index}={role}" for index, role in enumerate(linearized_roles)
        ],
        "theorem_linearized_roles": list(linearized_roles),
        "boundary_order_roles": list(order),
        "cyclic_cut_role": cut_role,
        "orientation_polarity": orientation_polarity,
        "kernel_signed_area_polarity": "negative",
        "required_adapter_status": required_adapter_status,
        "generation": generation,
        "schema_automorphisms": [dict(automorphism.mapping) for automorphism in AUTOMORPHISMS],
    }
    if base_order is not None:
        result["base_order"] = base_order
    if base_mapping is not None:
        result["base_mapping"] = list(base_mapping)
    return result


def _generated_two_triple_matches() -> dict[str, dict[str, Any]]:
    matches: dict[str, dict[str, Any]] = {}
    row_assignments = (
        ("B_row_then_F_row", "B", "F", "C", "E"),
        ("F_row_then_B_row", "F", "B", "E", "C"),
    )
    shared_endpoint_assignments = (
        ("P0_A_P3_D", "A", "D"),
        ("P0_D_P3_A", "D", "A"),
    )
    for row_name, center_one, center_two, exclusive_one, exclusive_two in row_assignments:
        for shared_name, p0, p3 in shared_endpoint_assignments:
            linearized = (p0, center_one, exclusive_one, p3, exclusive_two, center_two)
            order = _rotate_to_a(linearized)
            word = "".join(order)
            matches[word] = _match_record(
                family="TwoTripleRowSixPointEuclideanObstruction",
                order=order,
                linearized_roles=linearized,
                generation={
                    "row_assignment": row_name,
                    "shared_endpoint_assignment": shared_name,
                    "construction": "P0,center1,exclusive1,P3,exclusive2,center2",
                },
                consumer=THEOREM_CONSUMER,
                source=THEOREM_SOURCE,
                orbit=EXPECTED_TWO_TRIPLE_ORBIT,
                orientation_polarity="forward_ccw",
                required_adapter_status=(
                    "DIRECT_LINEAR_ORDER_ADAPTER" if p0 == "A" else "CYCLIC_CUT_REQUIRED"
                ),
                base_order="ABCDEF",
            )
    if tuple(sorted(matches)) != tuple(sorted(EXPECTED_TWO_TRIPLE_ORBIT)):
        raise AuditError("two-triple schema choices do not generate the expected four words")
    return matches


def _generated_sparse_matches() -> dict[str, dict[str, Any]]:
    matches: dict[str, dict[str, Any]] = {}
    row_assignments = (
        ("B_row_then_F_row", "B", "F", "C", "E"),
        ("F_row_then_B_row", "F", "B", "E", "C"),
    )
    shared_endpoint_assignments = (
        ("P1_A_P3_D", "A", "D"),
        ("P1_D_P3_A", "D", "A"),
    )
    for row_name, center_one, center_two, exclusive_one, exclusive_two in row_assignments:
        for shared_name, p1, p3 in shared_endpoint_assignments:
            linearized = (center_one, p1, center_two, p3, exclusive_two, exclusive_one)
            forward_order = _rotate_to_a(linearized)
            for reversed_orientation in (False, True):
                order = (
                    _rotate_to_a(tuple(reversed(linearized)))
                    if reversed_orientation
                    else forward_order
                )
                word = "".join(order)
                matches[word] = _match_record(
                    family="SixPointSparseEuclideanObstruction",
                    order=order,
                    linearized_roles=linearized,
                    generation={
                        "row_assignment": row_name,
                        "shared_endpoint_assignment": shared_name,
                        "construction": "P0,shared1,P2,shared2,exclusive2,exclusive1",
                        "reverse_orientation": reversed_orientation,
                    },
                    consumer=SPARSE_THEOREM_CONSUMER,
                    source=SPARSE_THEOREM_SOURCE,
                    orbit=EXPECTED_SPARSE_ORBIT,
                    orientation_polarity=(
                        "reversed_ccw" if reversed_orientation else "forward_ccw"
                    ),
                    required_adapter_status=(
                        "CYCLIC_CUT_AND_REVERSE_ORIENTATION_REQUIRED"
                        if reversed_orientation
                        else "CYCLIC_CUT_REQUIRED"
                    ),
                    base_mapping="BAFDEC",
                )
    if tuple(sorted(matches)) != tuple(sorted(EXPECTED_SPARSE_ORBIT)):
        raise AuditError("sparse schema choices do not generate the expected eight words")
    return matches


def _generated_kernel_matches() -> dict[str, dict[str, Any]]:
    result = _generated_two_triple_matches()
    sparse = _generated_sparse_matches()
    overlap = set(result).intersection(sparse)
    if overlap:
        raise AuditError(f"kernel schema families overlap unexpectedly: {sorted(overlap)}")
    result.update(sparse)
    return result


def theorem_coverage(order: Sequence[str]) -> tuple[dict[str, Any], ...]:
    """Return generated lower-level kernel-schema matches, never closure claims."""

    match = _generated_kernel_matches().get("".join(order))
    return (match,) if match is not None else ()


def circle_point(center_y: Fraction, parameter: Fraction) -> Point:
    """The rational second intersection of a line through A with the circle."""

    denominator = 1 + parameter * parameter
    x = (1 - parameter * parameter + 2 * center_y * parameter) / denominator
    y = 2 * parameter * (1 + center_y * parameter) / denominator
    return (x, y)


def distance_squared(left: Point, right: Point) -> Fraction:
    return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2


def orientation(left: Point, middle: Point, right: Point) -> Fraction:
    return (middle[0] - left[0]) * (right[1] - left[1]) - (
        middle[1] - left[1]
    ) * (right[0] - left[0])


def convex_hull(points: Mapping[str, Point]) -> tuple[str, ...]:
    """Exact monotone-chain hull, oriented counterclockwise."""

    if len(set(points.values())) != len(points):
        return ()
    sorted_points = sorted((point, role) for role, point in points.items())

    def cross(item_a: tuple[Point, str], item_b: tuple[Point, str], item_c: tuple[Point, str]) -> Fraction:
        return orientation(item_a[0], item_b[0], item_c[0])

    lower: list[tuple[Point, str]] = []
    for item in sorted_points:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], item) <= 0:
            lower.pop()
        lower.append(item)
    upper: list[tuple[Point, str]] = []
    for item in reversed(sorted_points):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], item) <= 0:
            upper.pop()
        upper.append(item)
    return tuple(role for _, role in lower[:-1] + upper[:-1])


def _is_strict_convex_labels(order: Sequence[str], points: Mapping[str, Point]) -> bool:
    if tuple(order) != tuple(dict.fromkeys(order)) or set(order) != set(points):
        return False
    if len(set(points.values())) != len(points):
        return False
    turns = tuple(
        orientation(points[order[index - 1]], points[order[index]], points[order[(index + 1) % len(order)]])
        for index in range(len(order))
    )
    if not turns or not all(turn > 0 for turn in turns):
        return False
    hull = convex_hull(points)
    if not hull:
        return False
    # Strict convexity here means every role is an extreme hull vertex, with
    # the requested order matching the exact counterclockwise hull order.
    if len(hull) != len(order):
        return False
    doubled = tuple(order) + tuple(order)
    start = doubled.index(hull[0])
    return tuple(doubled[start : start + len(hull)]) == hull


def is_strict_convex_order(order: Sequence[str], points: Mapping[str, Point]) -> bool:
    return _is_strict_convex_labels(order, points)


def _coordinates(b: Fraction, f: Fraction, t: Fraction, s: Fraction) -> dict[str, Point]:
    return {
        "A": (Fraction(-1), Fraction(0)),
        "B": (Fraction(0), b),
        "C": circle_point(b, t),
        "D": (Fraction(1), Fraction(0)),
        "E": circle_point(f, s),
        "F": (Fraction(0), f),
    }


def _local_eight_point_witness() -> dict[str, Any]:
    points: dict[str, Point] = {
        "A": (Fraction(-1), Fraction(0)),
        "D": (Fraction(1), Fraction(0)),
        "B": (Fraction(0), Fraction(1, 2)),
        "F": (Fraction(0), Fraction(-1, 2)),
        "C1": (Fraction(-41, 37), Fraction(24, 37)),
        "C2": (Fraction(-121, 109), Fraction(69, 109)),
        "E1": (Fraction(61, 58), Fraction(-51, 58)),
        "E2": (Fraction(31, 29), Fraction(-24, 29)),
    }
    order = ("A", "F", "E1", "E2", "D", "B", "C1", "C2")
    if not _is_strict_convex_labels(order, points):
        raise AuditError("supplied eight-point local witness is not strictly convex")
    b_radius = distance_squared(points["B"], points["A"])
    f_radius = distance_squared(points["F"], points["A"])
    if b_radius != f_radius or b_radius != Fraction(5, 4):
        raise AuditError("supplied eight-point witness has the wrong radius")
    if any(distance_squared(points["B"], points[role]) != b_radius for role in ("C1", "C2")):
        raise AuditError("supplied B-row witness is not exact")
    if any(distance_squared(points["F"], points[role]) != f_radius for role in ("E1", "E2")):
        raise AuditError("supplied F-row witness is not exact")
    row_swap = {"A": "A", "B": "F", "C1": "E1", "C2": "E2", "D": "D", "E1": "C1", "E2": "C2", "F": "B"}
    reflected_points = {
        row_swap[role]: (point[0], -point[1]) for role, point in points.items()
    }
    reflected_order = _rotate_to_a(tuple(row_swap[role] for role in reversed(order)))
    if not _is_strict_convex_labels(reflected_order, reflected_points):
        raise AuditError("reflected/relabelled local witness is not strictly convex")
    return {
        "coordinates": {
            role: [_q(points[role][0]), _q(points[role][1])] for role in points
        },
        "order": list(order),
        "metric_squared": {
            "BA_BD_BC1_BC2": _q(b_radius),
            "FA_FD_FE1_FE2": _q(f_radius),
        },
        "row_supports": {
            "B": ["A", "D", "C1", "C2"],
            "F": ["A", "D", "E1", "E2"],
        },
        "support_intersection": ["A", "D"],
        "distinct_roles": True,
        "convex_orientation": "strict_counterclockwise",
        "reflection_partner": {
            "coordinate_map": "(x,y) -> (x,-y)",
            "role_relabeling": row_swap,
            "coordinates": {
                role: [_q(reflected_points[role][0]), _q(reflected_points[role][1])]
                for role in ("A", "B", "C1", "C2", "D", "E1", "E2", "F")
            },
            "order": list(reflected_order),
            "convex_orientation": "strict_counterclockwise",
        },
    }


def _metric_equalities(points: Mapping[str, Point]) -> dict[str, str]:
    ba = distance_squared(points["B"], points["A"])
    bc = distance_squared(points["B"], points["C"])
    bd = distance_squared(points["B"], points["D"])
    fa = distance_squared(points["F"], points["A"])
    fd = distance_squared(points["F"], points["D"])
    fe = distance_squared(points["F"], points["E"])
    return {
        "BA_squared": _q(ba),
        "BC_squared": _q(bc),
        "BD_squared": _q(bd),
        "FA_squared": _q(fa),
        "FD_squared": _q(fd),
        "FE_squared": _q(fe),
    }


def _metric_schema_holds(points: Mapping[str, Point]) -> bool:
    values = _metric_equalities(points)
    return (
        values["BA_squared"] == values["BC_squared"] == values["BD_squared"]
        and values["FA_squared"] == values["FD_squared"] == values["FE_squared"]
    )


def _serialize_points(points: Mapping[str, Point]) -> dict[str, list[str]]:
    return {role: [_q(points[role][0]), _q(points[role][1])] for role in ROLES}


def _find_witness(order: tuple[str, ...]) -> tuple[dict[str, Any] | None, int]:
    # The supplied local witness uses the standard CCW orientation: points
    # after D are above AD and points before D are below AD.
    b_sign = 1 if order.index("B") > order.index("D") else -1
    f_sign = 1 if order.index("F") > order.index("D") else -1
    tested = 0
    for b_abs, f_abs, t, s in itertools.product(
        CENTER_MAGNITUDES, CENTER_MAGNITUDES, CIRCLE_PARAMETERS, CIRCLE_PARAMETERS
    ):
        b, f = b_sign * b_abs, f_sign * f_abs
        points = _coordinates(b, f, t, s)
        tested += 1
        if not _metric_schema_holds(points):
            continue
        if not is_strict_convex_order(order, points):
            continue
        params = {"b": _q(b), "f": _q(f), "C_parameter": _q(t), "E_parameter": _q(s)}
        return (
            {
                "coordinates": _serialize_points(points),
                "parameters": params,
                "metric_squared": _metric_equalities(points),
                "convex_orientation": "strict_counterclockwise",
                "hull_vertices": list(convex_hull(points)),
                "hull_saturated": len(convex_hull(points)) == 6,
                "distinct_roles": True,
            },
            tested,
        )
    return None, tested


def _premise_ledger() -> dict[str, list[dict[str, Any]]]:
    return {
        "encoded": [
            {"id": "six_roles", "claim": "A,B,C,D,E,F are six distinct role names"},
            {"id": "fixed_A_orders", "claim": "all 5! oriented orders with A fixed first"},
            {"id": "shared_pair_alternation", "claim": "the restricted A,B,D,F subsequence is ABDF or AFDB"},
            {"id": "metric_schema", "claim": "BA=BC=BD and FA=FD=FE, checked as squared distances over QQ"},
            {"id": "convex_order", "claim": "strict counterclockwise convex-hull order, checked exactly"},
            {"id": "rational_parameterization", "claim": "C and E use the exact circle parameterization through A=(-1,0)"},
            {"id": "kernel_schema_generation", "claim": "the 4 two-triple and 8 sparse words are generated from row/shared-endpoint choices, with sparse reverse orientation generated explicitly"},
            {"id": "kernel_schema_matches", "claim": "matches are to proved lower-level Lean kernel schemas; boundary consumability is separately recorded per match"},
        ],
        "omitted": [
            {"id": "lean_kernel_replay", "reason": "this module does not invoke Lean or certify a theorem"},
            {"id": "universal_coordinate_exhaustion", "reason": "the rational search box is finite and not a universal search"},
            {"id": "cap_fields", "reason": "cap fields are not present in this local coordinate model"},
            {"id": "first_source_nonhit_packet", "reason": "the first-source NonHit packet is not modeled"},
            {"id": "source_theorem_rederivation", "reason": "the theorem match records the named Lean consumer only"},
            {"id": "cyclic_cut_boundary_adapter", "reason": "the audit records required cyclic cuts but does not construct the existing linear-order boundary adapter"},
            {"id": "reverse_orientation_boundary_adapter", "reason": "four sparse reverse words require an orientation-reversing boundary adapter, which is recorded but not constructed here"},
            {"id": "proof_closure", "reason": "finite-local satisfiability is not a live-branch model or P97 closure"},
        ],
    }


def _search_config() -> dict[str, Any]:
    return {
        "method": "exact_rational_common_chord_circle_parameterization",
        "common_chord": {"A": ["-1", "0"], "D": ["1", "0"]},
        "center_form": {"B": ["0", "b"], "F": ["0", "f"]},
        "circle_point": "((1-t^2+2*b*t)/(1+t^2), 2*t*(1+b*t)/(1+t^2))",
        "center_magnitudes": [_q(value) for value in CENTER_MAGNITUDES],
        "circle_parameters": [_q(value) for value in CIRCLE_PARAMETERS],
        "arithmetic": "fractions.Fraction only; no floating point",
        "convex_check": "strict local turns plus exact convex-hull cyclic-order consistency",
    }


def _symmetry_ledger() -> dict[str, Any]:
    row_swap = {"A": "A", "B": "F", "C": "E", "D": "D", "E": "C", "F": "B"}
    complement = {
        base: "".join(row_swap[role] for role in base) for base in BASE_WITNESS_ORDERS
    }
    return {
        "base_orders": list(BASE_WITNESS_ORDERS),
        "row_swap_completion": complement,
        "coordinate_reflection": {
            "map": "(x,y) -> (x,-y)",
            "relabeling": row_swap,
            "used_as": "explicitly replayed on the local eight-point witness; never an orbit quotient",
            "replay_requirement": "the transformed coordinates and reversed orientation are checked exactly",
        },
    }


def _order_record(index: int, order: tuple[str, ...]) -> dict[str, Any]:
    alternating = is_shared_pair_alternating(order)
    matches = theorem_coverage(order)
    if not alternating:
        status = "SOURCE_NONALTERNATING"
        witness, tested = None, 0
        reason = "excluded by the source-proved shared-pair alternation premise"
        search = {"performed": False, "tested_candidates": tested}
    elif matches:
        status = "LEAN_KERNEL_SCHEMA_MATCH"
        witness, tested = None, 0
        reason = "matches a proved lower-level kernel schema; boundary adapter status is recorded per match"
        search = {"performed": False, "tested_candidates": tested}
    else:
        witness, tested = _find_witness(order)
        status = "RATIONAL_WITNESS" if witness is not None else "UNKNOWN"
        reason = "exact rational witness found in the authenticated finite box" if witness else "no witness found in the authenticated finite box"
        search = {"performed": True, "tested_candidates": tested}
    record = {
        "index": index,
        "order": list(order),
        "order_hash": _sha256({"index": index, "order": list(order)}),
        "shared_pair_alternating": alternating,
        "shared_pair_subsequence": list(shared_pair_subsequence(order)),
        "theorem_matches": list(matches),
        "status": status,
        "reason": reason,
        "search": search,
        "witness": witness,
    }
    if witness is not None:
        record["witness_origin"] = {
            "coverage_method": "direct_exact_finite_search_for_this_order",
            "base_family": "base_14_b_positive_f_negative_witness_order_ledger",
            "coordinate_reflection": "not used to infer this record; the separately serialized local reflection partner is replayed exactly",
            "base_orders": list(BASE_WITNESS_ORDERS),
        }
    else:
        record["witness_origin"] = None
    return record


def build_audit() -> dict[str, Any]:
    records = [_order_record(index, order) for index, order in enumerate(all_orders())]
    if any(record["status"] == "UNKNOWN" for record in records):
        raise AuditError("authenticated finite search unexpectedly left UNKNOWN")
    counts = {
        "total_orders": len(records),
        "shared_pair_alternating": sum(record["shared_pair_alternating"] for record in records),
        "lean_kernel_schema_match": sum(record["status"] == "LEAN_KERNEL_SCHEMA_MATCH" for record in records),
        "two_triple_kernel_schema_match": sum(
            any(match["family"] == "TwoTripleRowSixPointEuclideanObstruction" for match in record["theorem_matches"])
            for record in records
        ),
        "sparse_kernel_schema_match": sum(
            any(match["family"] == "SixPointSparseEuclideanObstruction" for match in record["theorem_matches"])
            for record in records
        ),
        "kernel_schema_match_cyclic_cut_required": sum(
            any(match["required_adapter_status"] in {
                "CYCLIC_CUT_REQUIRED",
                "CYCLIC_CUT_AND_REVERSE_ORIENTATION_REQUIRED",
            } for match in record["theorem_matches"])
            for record in records
        ),
        "kernel_schema_match_reverse_orientation_required": sum(
            any(match["required_adapter_status"] == "CYCLIC_CUT_AND_REVERSE_ORIENTATION_REQUIRED" for match in record["theorem_matches"])
            for record in records
        ),
        "exact_feasible": sum(record["status"] == "RATIONAL_WITNESS" for record in records),
        "rational_witnesses": sum(record["status"] == "RATIONAL_WITNESS" for record in records),
        "unknown": sum(record["status"] == "UNKNOWN" for record in records),
        "source_nonalternating": sum(record["status"] == "SOURCE_NONALTERNATING" for record in records),
    }
    local_witness = _local_eight_point_witness()
    local_witness["canonical_sha256"] = _sha256(local_witness)
    payload = {
        "format": "p97_freshthird_firstnonhit_six_point_order_audit_v1",
        "diagnostic_status": "FINITE_LOCAL_SATISFIABILITY_NOT_LIVE_BRANCH_OR_LEAN_CLOSURE",
        "roles": list(ROLES),
        "metric_schema": ["BA=BC=BD", "FA=FD=FE"],
        "lean_consumer": {"identity": THEOREM_CONSUMER, "source": THEOREM_SOURCE},
        "lean_consumers": [
            {"identity": THEOREM_CONSUMER, "source": THEOREM_SOURCE},
            {"identity": SPARSE_THEOREM_CONSUMER, "source": SPARSE_THEOREM_SOURCE},
        ],
        "schema_automorphisms": [
            {"name": automorphism.name, "mapping": dict(automorphism.mapping)}
            for automorphism in AUTOMORPHISMS
        ],
        "search": _search_config(),
        "local_eight_point_witness": local_witness,
        "symmetry_ledger": _symmetry_ledger(),
        "premise_ledger": _premise_ledger(),
        "counts": counts,
        "orders": records,
    }
    return {
        **payload,
        "hashes": {
            "orders_sha256": _sha256(records),
            "coverage_sha256": _sha256([(record["order"], record["status"]) for record in records]),
            "payload_sha256": _sha256(payload),
        },
    }


def write_audit(path: Path = DEFAULT_ARTIFACT) -> dict[str, Any]:
    artifact = build_audit()
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(_json_bytes(artifact) + b"\n")
    return artifact


def _points_from_witness(witness: Mapping[str, Any]) -> dict[str, Point]:
    raw = witness.get("coordinates")
    if not isinstance(raw, dict) or set(raw) != set(ROLES):
        raise AuditError("witness coordinates do not contain exactly the six roles")
    points: dict[str, Point] = {}
    for role in ROLES:
        value = raw[role]
        if not isinstance(value, list) or len(value) != 2:
            raise AuditError(f"invalid coordinates for {role}")
        points[role] = (_parse_q(value[0]), _parse_q(value[1]))
    return points


def _validate_witness(record: Mapping[str, Any]) -> None:
    witness = record.get("witness")
    if not isinstance(witness, dict):
        raise AuditError("witness status has no witness payload")
    points = _points_from_witness(witness)
    if points["A"] != (Fraction(-1), Fraction(0)) or points["D"] != (Fraction(1), Fraction(0)):
        raise AuditError("witness does not use the authenticated common chord")
    if len(set(points.values())) != 6:
        raise AuditError("witness roles are not distinct")
    if not _metric_schema_holds(points):
        raise AuditError("witness fails exact metric schema")
    if not is_strict_convex_order(record["order"], points):
        raise AuditError("witness fails exact convex order")
    expected_metrics = _metric_equalities(points)
    if witness.get("metric_squared") != expected_metrics:
        raise AuditError("witness metric ledger is tampered")
    if witness.get("coordinates") != _serialize_points(points):
        raise AuditError("witness coordinates are not canonical")
    if witness.get("hull_vertices") != list(convex_hull(points)):
        raise AuditError("witness hull ledger is tampered")
    if witness.get("hull_saturated") != (len(convex_hull(points)) == 6):
        raise AuditError("witness hull saturation ledger is tampered")


def _validate_local_eight_point_witness(witness: Mapping[str, Any]) -> None:
    raw = witness.get("coordinates")
    expected_roles = {"A", "B", "D", "F", "C1", "C2", "E1", "E2"}
    if not isinstance(raw, dict) or set(raw) != expected_roles:
        raise AuditError("local eight-point witness roles are malformed")
    points: dict[str, Point] = {}
    for role in sorted(expected_roles):
        value = raw[role]
        if not isinstance(value, list) or len(value) != 2:
            raise AuditError("local eight-point coordinate is malformed")
        points[role] = (_parse_q(value[0]), _parse_q(value[1]))
    order = tuple(witness.get("order", ()))
    if order != ("A", "F", "E1", "E2", "D", "B", "C1", "C2"):
        raise AuditError("local eight-point order mismatch")
    if len(set(points.values())) != 8 or not _is_strict_convex_labels(order, points):
        raise AuditError("local eight-point distinctness/convexity mismatch")
    if points["A"] != (Fraction(-1), Fraction(0)) or points["D"] != (Fraction(1), Fraction(0)):
        raise AuditError("local eight-point chord mismatch")
    radius_b = distance_squared(points["B"], points["A"])
    radius_f = distance_squared(points["F"], points["A"])
    if radius_b != radius_f or radius_b != Fraction(5, 4):
        raise AuditError("local eight-point radius mismatch")
    if any(distance_squared(points["B"], points[role]) != radius_b for role in ("C1", "C2")):
        raise AuditError("local eight-point B row mismatch")
    if any(distance_squared(points["F"], points[role]) != radius_f for role in ("E1", "E2")):
        raise AuditError("local eight-point F row mismatch")
    if witness.get("row_supports") != {
        "B": ["A", "D", "C1", "C2"],
        "F": ["A", "D", "E1", "E2"],
    } or witness.get("support_intersection") != ["A", "D"]:
        raise AuditError("local eight-point support ledger mismatch")
    if witness.get("metric_squared") != {
        "BA_BD_BC1_BC2": "5/4",
        "FA_FD_FE1_FE2": "5/4",
    }:
        raise AuditError("local eight-point metric ledger mismatch")
    reflection = witness.get("reflection_partner")
    if not isinstance(reflection, dict):
        raise AuditError("missing local reflection partner")
    row_swap = {"A": "A", "B": "F", "C1": "E1", "C2": "E2", "D": "D", "E1": "C1", "E2": "C2", "F": "B"}
    if reflection.get("coordinate_map") != "(x,y) -> (x,-y)" or reflection.get("role_relabeling") != row_swap:
        raise AuditError("local reflection ledger mismatch")
    reflected_points = {
        row_swap[role]: (point[0], -point[1]) for role, point in points.items()
    }
    reflected_order = _rotate_to_a(tuple(row_swap[role] for role in reversed(order)))
    if reflection.get("coordinates") != {
        role: [_q(reflected_points[role][0]), _q(reflected_points[role][1])]
        for role in ("A", "B", "C1", "C2", "D", "E1", "E2", "F")
    }:
        raise AuditError("local reflected coordinates mismatch")
    if tuple(reflection.get("order", ())) != reflected_order:
        raise AuditError("local reflected order mismatch")
    if reflection.get("convex_orientation") != "strict_counterclockwise" or not _is_strict_convex_labels(reflected_order, reflected_points):
        raise AuditError("local reflected convexity mismatch")
    without_hash = {key: value for key, value in witness.items() if key != "canonical_sha256"}
    if witness.get("canonical_sha256") != _sha256(without_hash):
        raise AuditError("local eight-point witness hash mismatch")


def replay_artifact(path: Path = DEFAULT_ARTIFACT) -> dict[str, Any]:
    try:
        artifact = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise AuditError(f"cannot read audit artifact: {path}") from exc
    if not isinstance(artifact, dict) or "hashes" not in artifact:
        raise AuditError("malformed audit artifact")
    hashes = artifact["hashes"]
    if not isinstance(hashes, dict):
        raise AuditError("malformed hash ledger")
    payload = copy.deepcopy(artifact)
    del payload["hashes"]
    records = payload.get("orders")
    if not isinstance(records, list) or len(records) != 120:
        raise AuditError("artifact does not contain exactly 120 orders")
    for index, record in enumerate(records):
        if not isinstance(record, dict):
            raise AuditError("order record is not an object")
        order = tuple(record.get("order", ()))
        if order != all_orders()[index]:
            raise AuditError("order enumeration is not canonical")
        if record.get("order_hash") != _sha256({"index": index, "order": list(order)}):
            raise AuditError("order hash mismatch")
        if record.get("shared_pair_alternating") != is_shared_pair_alternating(order):
            raise AuditError("alternation classification mismatch")
        matches = tuple(record.get("theorem_matches", ()))
        if matches != theorem_coverage(order):
            raise AuditError("theorem coverage mismatch")
        if matches and record.get("status") != "LEAN_KERNEL_SCHEMA_MATCH":
            raise AuditError("kernel schema match has an invalid order status")
        if not matches and record.get("status") == "LEAN_KERNEL_SCHEMA_MATCH":
            raise AuditError("kernel schema status has no match record")
        if record.get("status") == "RATIONAL_WITNESS":
            _validate_witness(record)
        elif record.get("witness") is not None:
            raise AuditError("non-witness order contains a witness payload")
    local_witness = payload.get("local_eight_point_witness")
    if not isinstance(local_witness, dict):
        raise AuditError("missing local eight-point witness")
    _validate_local_eight_point_witness(local_witness)
    expected = build_audit()
    if payload != {key: expected[key] for key in expected if key != "hashes"}:
        raise AuditError("artifact differs from deterministic exact replay")
    expected_hashes = expected["hashes"]
    if hashes != expected_hashes:
        raise AuditError("artifact hash ledger mismatch")
    if hashes["payload_sha256"] != _sha256(payload):
        raise AuditError("payload hash mismatch")
    return artifact


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_ARTIFACT)
    parser.add_argument("--replay", action="store_true")
    args = parser.parse_args(list(argv) if argv is not None else None)
    if args.replay:
        replay_artifact(args.output)
        print(f"replayed {args.output}")
    else:
        artifact = write_audit(args.output)
        print(json.dumps(artifact["counts"], sort_keys=True))
        print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
