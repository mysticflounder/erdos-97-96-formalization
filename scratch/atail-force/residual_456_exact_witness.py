#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact arithmetic audit of the final `(4,5,6)` common-system residual.

The witness lives in ``Q(sqrt(3), sqrt(K))`` for one positive rational
``K``.  All equalities are checked as identities in that biquadratic field.
Strict inequalities are certified with outward rational interval bounds for
the two square roots.  The checker uses only Python's standard-library integer
and ``Fraction`` arithmetic; it is a standalone exact checker, not a Lean
kernel proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass
from decimal import Decimal, localcontext
from fractions import Fraction
from math import isqrt
from pathlib import Path
from typing import Any, Iterable, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SOURCE = HERE / "common_system_metric_probe.json"
OUTPUT = HERE / "residual_456_exact_witness.json"
PROFILE = (4, 5, 6)
RESIDUAL_ASSIGNMENT_SHA256 = (
    "cfeff7b85bf3bb68c5d5195600cf64d1578e16322bc79ce94ddcfc140727b03e"
)
ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
ROWS = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (1, 7, 8, 9),
    3: (0, 7, 10, 11),
}
BLOCKER_OF_SOURCE = {
    0: 1,
    1: 0,
    2: 1,
    3: 0,
    4: 0,
    5: 0,
    6: 1,
    7: 2,
    8: 2,
    9: 2,
    10: 3,
    11: 3,
}

# Rational-circle parameters.  For t in Q, circle(t) is the exact unit
# vector ((1-t^2)/(1+t^2), 2t/(1+t^2)).
PARAMETERS = {
    "p3_from_p0": Fraction(3697, 10000),
    "p4_from_p0": Fraction(4079, 10000),
    "p2_from_p1": Fraction(3341, 2000),
    "p6_from_p1": Fraction(933, 250),
    "p8_from_p2": Fraction(-14447, 10000),
    "p9_from_p2": Fraction(-3001, 2500),
    "p10_from_p3": Fraction(-7213, 10000),
    "p11_from_p3": Fraction(-279, 400),
}


def qtext(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def circle(parameter: Fraction) -> tuple[Fraction, Fraction]:
    denominator = 1 + parameter * parameter
    return (
        (1 - parameter * parameter) / denominator,
        2 * parameter / denominator,
    )


def qadd(
    left: tuple[Fraction, Fraction], right: tuple[Fraction, Fraction]
) -> tuple[Fraction, Fraction]:
    return left[0] + right[0], left[1] + right[1]


_p2_q = qadd((Fraction(1), Fraction(0)), circle(PARAMETERS["p2_from_p1"]))
_p3_q = circle(PARAMETERS["p3_from_p0"])
_delta_q = _p3_q[0] - _p2_q[0], _p3_q[1] - _p2_q[1]
_delta_squared = _delta_q[0] * _delta_q[0] + _delta_q[1] * _delta_q[1]
K = (4 - _delta_squared) / (4 * _delta_squared)
if K <= 0:
    raise AssertionError("the two unit circles do not have a real second intersection")


@dataclass(frozen=True)
class Biquadratic:
    """An element of Q(sqrt(3), sqrt(K))."""

    coefficients: tuple[Fraction, Fraction, Fraction, Fraction]

    @staticmethod
    def rational(value: int | Fraction) -> "Biquadratic":
        return Biquadratic((Fraction(value), Fraction(0), Fraction(0), Fraction(0)))

    def __add__(self, other: "Biquadratic") -> "Biquadratic":
        return Biquadratic(
            tuple(a + b for a, b in zip(self.coefficients, other.coefficients))
        )

    def __neg__(self) -> "Biquadratic":
        return Biquadratic(tuple(-value for value in self.coefficients))

    def __sub__(self, other: "Biquadratic") -> "Biquadratic":
        return self + (-other)

    def __mul__(self, other: "Biquadratic") -> "Biquadratic":
        out = [Fraction(0) for _ in range(4)]
        for left_index, left in enumerate(self.coefficients):
            if not left:
                continue
            for right_index, right in enumerate(other.coefficients):
                if not right:
                    continue
                sqrt3_power = (left_index & 1) + (right_index & 1)
                sqrtk_power = ((left_index >> 1) & 1) + ((right_index >> 1) & 1)
                factor = left * right
                if sqrt3_power == 2:
                    factor *= 3
                    sqrt3_power = 0
                if sqrtk_power == 2:
                    factor *= K
                    sqrtk_power = 0
                out[sqrt3_power + 2 * sqrtk_power] += factor
        return Biquadratic(tuple(out))

    def __rmul__(self, other: int | Fraction) -> "Biquadratic":
        return Biquadratic.rational(other) * self

    def is_zero(self) -> bool:
        return not any(self.coefficients)

    def encoded(self) -> list[str]:
        return [qtext(value) for value in self.coefficients]


ZERO = Biquadratic.rational(0)
ONE = Biquadratic.rational(1)
SQRT3 = Biquadratic((Fraction(0), Fraction(1), Fraction(0), Fraction(0)))
SQRTK = Biquadratic((Fraction(0), Fraction(0), Fraction(1), Fraction(0)))
Point = tuple[Biquadratic, Biquadratic]


def bq_point(point: tuple[Fraction, Fraction]) -> Point:
    return Biquadratic.rational(point[0]), Biquadratic.rational(point[1])


def point_add(left: Point, right: Point) -> Point:
    return left[0] + right[0], left[1] + right[1]


def point_sub(left: Point, right: Point) -> Point:
    return left[0] - right[0], left[1] - right[1]


def point_scale(scalar: Biquadratic, point: Point) -> Point:
    return scalar * point[0], scalar * point[1]


def construct_points() -> dict[int, Point]:
    points: dict[int, Point] = {
        0: bq_point((Fraction(0), Fraction(0))),
        1: bq_point((Fraction(1), Fraction(0))),
        2: bq_point(_p2_q),
        3: bq_point(_p3_q),
        4: bq_point(circle(PARAMETERS["p4_from_p0"])),
        5: (Biquadratic.rational(Fraction(1, 2)), Fraction(1, 2) * SQRT3),
        6: bq_point(
            qadd((Fraction(1), Fraction(0)), circle(PARAMETERS["p6_from_p1"]))
        ),
    }
    midpoint = bq_point(
        (
            (_p2_q[0] + _p3_q[0]) / 2,
            (_p2_q[1] + _p3_q[1]) / 2,
        )
    )
    perpendicular = bq_point((-_delta_q[1], _delta_q[0]))
    # The minus branch is the intersection in the O1 block, near the
    # 7 -> 0 boundary edge.
    points[7] = point_sub(midpoint, point_scale(SQRTK, perpendicular))
    points[8] = point_add(points[2], bq_point(circle(PARAMETERS["p8_from_p2"])))
    points[9] = point_add(points[2], bq_point(circle(PARAMETERS["p9_from_p2"])))
    points[10] = point_add(points[3], bq_point(circle(PARAMETERS["p10_from_p3"])))
    points[11] = point_add(points[3], bq_point(circle(PARAMETERS["p11_from_p3"])))
    return points


POINTS = construct_points()


def squared_distance(left: Point, right: Point) -> Biquadratic:
    delta = point_sub(left, right)
    return delta[0] * delta[0] + delta[1] * delta[1]


def cross(a: Point, b: Point, c: Point) -> Biquadratic:
    ab = point_sub(b, a)
    ac = point_sub(c, a)
    return ab[0] * ac[1] - ab[1] * ac[0]


def dot(a: Point, b: Point) -> Biquadratic:
    return a[0] * b[0] + a[1] * b[1]


INTERVAL_DIGITS = 80


def sqrt_bounds(value: Fraction) -> tuple[Fraction, Fraction]:
    if value <= 0:
        raise ValueError("square-root radicand must be positive")
    scale = 10**INTERVAL_DIGITS
    lower_numerator = isqrt(
        (value.numerator * scale * scale) // value.denominator
    )
    lower = Fraction(lower_numerator, scale)
    upper = Fraction(lower_numerator + 1, scale)
    if not lower * lower <= value < upper * upper:
        raise AssertionError("invalid outward square-root interval")
    return lower, upper


SQRT3_BOUNDS = sqrt_bounds(Fraction(3))
SQRTK_BOUNDS = sqrt_bounds(K)


def interval(value: Biquadratic) -> tuple[Fraction, Fraction]:
    sqrt3_lower, sqrt3_upper = SQRT3_BOUNDS
    sqrtk_lower, sqrtk_upper = SQRTK_BOUNDS
    basis = (
        (Fraction(1), Fraction(1)),
        (sqrt3_lower, sqrt3_upper),
        (sqrtk_lower, sqrtk_upper),
        (sqrt3_lower * sqrtk_lower, sqrt3_upper * sqrtk_upper),
    )
    lower = Fraction(0)
    upper = Fraction(0)
    for coefficient, (base_lower, base_upper) in zip(value.coefficients, basis):
        if coefficient >= 0:
            lower += coefficient * base_lower
            upper += coefficient * base_upper
        else:
            lower += coefficient * base_upper
            upper += coefficient * base_lower
    if lower > upper:
        raise AssertionError("reversed interval")
    return lower, upper


def positive_lower(value: Biquadratic, name: str) -> Fraction:
    lower, _upper = interval(value)
    if lower <= 0:
        raise AssertionError(f"failed to certify positivity: {name}")
    return lower


def nonzero_abs_lower(value: Biquadratic, name: str) -> Fraction:
    lower, upper = interval(value)
    if lower > 0:
        return lower
    if upper < 0:
        return -upper
    raise AssertionError(f"failed to certify nonzero value: {name}")


def sign(value: Biquadratic, name: str) -> int:
    if value.is_zero():
        return 0
    lower, upper = interval(value)
    if lower > 0:
        return 1
    if upper < 0:
        return -1
    raise AssertionError(f"failed to certify sign: {name}")


def decimal_text(value: Fraction, digits: int = 24) -> str:
    with localcontext() as context:
        context.prec = digits + 8
        rendered = Decimal(value.numerator) / Decimal(value.denominator)
        return format(rendered, f".{digits}g")


def approximate(value: Biquadratic) -> str:
    lower, upper = interval(value)
    return decimal_text((lower + upper) / 2)


def group_distances(center: int, excluded: Iterable[int] = ()) -> list[list[int]]:
    excluded_set = set(excluded) | {center}
    groups: dict[Biquadratic, list[int]] = {}
    for label in range(12):
        if label not in excluded_set:
            groups.setdefault(squared_distance(POINTS[center], POINTS[label]), []).append(label)
    return sorted(groups.values(), key=lambda group: (-len(group), group))


def source_residual() -> Mapping[str, Any]:
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    matches = [case for case in source["cases"] if tuple(case["profile"]) == PROFILE]
    if len(matches) != 1:
        raise AssertionError("missing unique (4,5,6) source case")
    residuals = [
        round_record
        for round_record in matches[0]["rounds"]
        if round_record.get("assignment_sha256") == RESIDUAL_ASSIGNMENT_SHA256
    ]
    if len(residuals) != 1:
        raise AssertionError("missing unique pinned (4,5,6) source residual")
    residual = residuals[0]
    expected_rows = [f"{center}:{','.join(map(str, support))}" for center, support in ROWS.items()]
    if residual["metric_rows"] != expected_rows:
        raise AssertionError("source residual rows changed")
    return residual


def cap_arc_audit() -> dict[str, Any]:
    cap_data = {
        "S": {"opposite": 0, "left": 1, "right": 2, "labels": {1, 2, 3, 4}},
        "O1": {"opposite": 1, "left": 2, "right": 0, "labels": {0, 2, 5, 6, 7}},
        "O2": {
            "opposite": 2,
            "left": 0,
            "right": 1,
            "labels": {0, 1, 8, 9, 10, 11},
        },
    }
    checks = 0
    for name, data in cap_data.items():
        vi = int(data["opposite"])
        vj = int(data["left"])
        vk = int(data["right"])
        opposite_area = cross(POINTS[vi], POINTS[vj], POINTS[vk])
        for label in range(12):
            product = cross(POINTS[label], POINTS[vj], POINTS[vk]) * opposite_area
            on_arc = sign(product, f"{name} arc label {label}") <= 0
            if on_arc != (label in data["labels"]):
                raise AssertionError(f"cap-arc mismatch: {name}, label {label}")
            checks += 1
    return {
        "checked_predicates": checks,
        "matches_profile_caps": True,
        "cap_labels": {
            name: sorted(int(label) for label in data["labels"])
            for name, data in cap_data.items()
        },
    }


def mec_audit() -> dict[str, Any]:
    p2x = _p2_q[0]
    p2y = _p2_q[1]
    center_y = (p2x * p2x + p2y * p2y - p2x) / (2 * p2y)
    center = (
        Biquadratic.rational(Fraction(1, 2)),
        Biquadratic.rational(center_y),
    )
    radius_squared = squared_distance(center, POINTS[0])
    classifications: dict[str, str] = {}
    gaps: dict[str, list[str]] = {}
    for label in range(12):
        gap = squared_distance(center, POINTS[label]) - radius_squared
        gap_sign = sign(gap, f"MEC disk gap label {label}")
        classifications[str(label)] = {0: "boundary", -1: "inside", 1: "outside"}[gap_sign]
        gaps[str(label)] = gap.encoded()
    outside = [label for label in range(12) if classifications[str(label)] == "outside"]
    if outside != [7, 10, 11]:
        raise AssertionError(f"unexpected circumdisk exterior labels: {outside}")

    p0, p1, p2 = POINTS[0], POINTS[1], POINTS[2]
    inner_products = (
        dot(point_sub(p1, p0), point_sub(p2, p0)),
        dot(point_sub(p2, p1), point_sub(p0, p1)),
        dot(point_sub(p0, p2), point_sub(p1, p2)),
    )
    for index, value in enumerate(inner_products):
        positive_lower(value, f"nonobtuse inner product {index}")
    return {
        "moser_circle_center": [qtext(Fraction(1, 2)), qtext(center_y)],
        "moser_circle_radius_squared": radius_squared.encoded(),
        "point_classification": classifications,
        "squared_radius_gaps": gaps,
        "outside_labels": outside,
        "all_three_triangle_inner_products_positive": True,
        "conclusion": (
            "The fixed Moser labels form a nonobtuse triangle, but their "
            "circumcircle does not contain the carrier, so they cannot all be "
            "boundary points of its minimum enclosing circle."
        ),
    }


def build_report() -> dict[str, Any]:
    residual = source_residual()

    row_identity_checks = 0
    exact_exclusion_checks = 0
    minimum_exact_gap: Fraction | None = None
    for center, support in ROWS.items():
        for label in support:
            distance = squared_distance(POINTS[center], POINTS[label])
            if distance != ONE:
                raise AssertionError(f"row {center} support distance is not one")
            row_identity_checks += 1
        for label in range(12):
            if label not in support:
                gap = squared_distance(POINTS[center], POINTS[label]) - ONE
                certified = nonzero_abs_lower(gap, f"exact row {center}, label {label}")
                minimum_exact_gap = (
                    certified if minimum_exact_gap is None else min(minimum_exact_gap, certified)
                )
                exact_exclusion_checks += 1

    pair_checks = 0
    minimum_pair_distance: Fraction | None = None
    for left in range(12):
        for right in range(left + 1, 12):
            certified = positive_lower(
                squared_distance(POINTS[left], POINTS[right]),
                f"pairwise distance {left},{right}",
            )
            minimum_pair_distance = (
                certified
                if minimum_pair_distance is None
                else min(minimum_pair_distance, certified)
            )
            pair_checks += 1

    convex_checks = 0
    minimum_convex_margin: Fraction | None = None
    for index, left in enumerate(ORDER):
        right = ORDER[(index + 1) % len(ORDER)]
        for label in ORDER:
            if label in (left, right):
                continue
            certified = positive_lower(
                cross(POINTS[left], POINTS[right], POINTS[label]),
                f"convex edge {left}->{right}, label {label}",
            )
            minimum_convex_margin = (
                certified
                if minimum_convex_margin is None
                else min(minimum_convex_margin, certified)
            )
            convex_checks += 1

    maximum_multiplicity: dict[str, int] = {}
    repeated_classes: dict[str, list[list[int]]] = {}
    for center in range(12):
        groups = group_distances(center)
        maximum_multiplicity[str(center)] = max(map(len, groups))
        repeated_classes[str(center)] = [group for group in groups if len(group) > 1]
    k4_centers = [center for center in range(12) if maximum_multiplicity[str(center)] >= 4]
    failed_k4_centers = [center for center in range(12) if center not in k4_centers]
    if k4_centers != [0, 1, 2, 3]:
        raise AssertionError(f"unexpected K4 centers: {k4_centers}")

    deletion_maximum: dict[str, int] = {}
    for source, blocker in BLOCKER_OF_SOURCE.items():
        if source not in ROWS[blocker] or source == blocker:
            raise AssertionError("invalid source/blocker incidence")
        maximum = max(map(len, group_distances(blocker, (source,))))
        if maximum > 3:
            raise AssertionError("source deletion leaves a four-point class")
        deletion_maximum[str(source)] = maximum

    assert minimum_exact_gap is not None
    assert minimum_pair_distance is not None
    assert minimum_convex_margin is not None
    source_sha = hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    return {
        "schema": "p97-atail-residual-456-exact-witness-v1",
        "epistemic_status": (
            "EXACT_BIQUADRATIC_IDENTITIES_AND_RATIONAL_INTERVAL_CERTIFICATE; "
            "STANDALONE_CHECKER; NOT_LEAN_KERNEL_CHECKED"
        ),
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "sha256": source_sha,
            "profile": list(PROFILE),
            "residual_round": int(residual["round"]),
            "assignment_sha256": residual["assignment_sha256"],
            "metric_rows": residual["metric_rows"],
            "reported_status": residual.get("reported_status"),
            "formalized_core_stage": (
                None
                if residual.get("formalized_structural_core") is None
                else residual["formalized_structural_core"].get("stage")
            ),
        },
        "field": {
            "basis": ["1", "sqrt(3)", "sqrt(K)", "sqrt(3*K)"],
            "K": qtext(K),
            "sqrt_interval_decimal_digits": INTERVAL_DIGITS,
            "sqrt3_bounds": [qtext(value) for value in SQRT3_BOUNDS],
            "sqrtK_bounds": [qtext(value) for value in SQRTK_BOUNDS],
        },
        "construction": {
            "rational_circle_parameters": {
                name: qtext(value) for name, value in PARAMETERS.items()
            },
            "cyclic_order": list(ORDER),
            "coordinates_by_basis_coefficients": {
                str(label): {"x": point[0].encoded(), "y": point[1].encoded()}
                for label, point in sorted(POINTS.items())
            },
            "coordinate_decimal_midpoints": {
                str(label): [approximate(point[0]), approximate(point[1])]
                for label, point in sorted(POINTS.items())
            },
        },
        "exact_row_and_convex_verification": {
            "support_distances_squared_equal_one": row_identity_checks,
            "exact_off_support_disequalities": exact_exclusion_checks,
            "pairwise_positive_squared_distances": pair_checks,
            "strict_convex_edge_halfplanes": convex_checks,
            "certified_minimum_abs_exact_squared_gap_lower": qtext(minimum_exact_gap),
            "certified_minimum_pair_squared_distance_lower": qtext(minimum_pair_distance),
            "certified_minimum_convex_cross_lower": qtext(minimum_convex_margin),
            "decimal_lower_bounds": {
                "exact_squared_gap": decimal_text(minimum_exact_gap),
                "pair_squared_distance": decimal_text(minimum_pair_distance),
                "convex_cross": decimal_text(minimum_convex_margin),
            },
        },
        "cap_arc_audit": cap_arc_audit(),
        "critical_shell_audit": {
            "blocker_of_source": {
                str(source): blocker for source, blocker in BLOCKER_OF_SOURCE.items()
            },
            "every_source_lies_in_its_exact_blocker_row": True,
            "maximum_distance_multiplicity_after_source_deletion": deletion_maximum,
            "every_source_deletion_kills_K4_at_its_blocker": True,
            "conclusion": (
                "The exact geometry supports the saved source-indexed blocker map "
                "and its no-q-free condition; common critical-shell provenance "
                "itself does not exclude this residual."
            ),
        },
        "global_k4_audit": {
            "maximum_distance_multiplicity_by_center": maximum_multiplicity,
            "repeated_distance_classes_by_center": repeated_classes,
            "centers_with_K4": k4_centers,
            "centers_without_K4": failed_k4_centers,
            "faithful_carrier_pattern_exists": False,
            "counterexample_data_K4_property_holds": False,
            "conclusion": (
                "The witness concretely violates the all-centers K4 field: "
                "centers 4 through 11 have maximum distance multiplicity at "
                "most two."
            ),
        },
        "mec_audit": mec_audit(),
        "scope": {
            "strict_convex_exact_four_row_realization_proved_by_checker": True,
            "saved_critical_shell_blocker_map_realized_by_checker": True,
            "cap_arc_membership_realized_by_checker": True,
            "nonobtuse_fixed_moser_triangle_realized_by_checker": True,
            "minimum_enclosing_circle_frame_realized": False,
            "faithful_selected_four_class_at_every_center_realized": False,
            "counterexample_data_realized": False,
            "live_dangerous_selected_full_filter_fields_realized": False,
            "lean_kernel_checked": False,
            "producer_proved": False,
        },
        "producer_implication": (
            "No contradiction can follow from only the four exact rows, the "
            "saved source-to-blocker map, cap arc membership, nonobtuseness, "
            "and strict convex order. A closing producer must use at least one "
            "omitted live ingredient that rejects this witness, concretely the "
            "all-centers FaithfulCarrierPattern/K4 rows, the MEC disk field, or "
            "stronger live full-filter/no-M44 data."
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.write and args.check:
        parser.error("--write and --check are mutually exclusive")
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.write:
        OUTPUT.write_text(rendered, encoding="utf-8")
    elif args.check:
        if OUTPUT.read_text(encoding="utf-8") != rendered:
            raise AssertionError("saved exact witness report is stale")
    else:
        print(rendered, end="")
    if args.write or args.check:
        print(
            json.dumps(
                {
                    "output": str(OUTPUT.relative_to(ROOT)),
                    "source_sha256": report["source"]["sha256"],
                    "centers_with_K4": report["global_k4_audit"]["centers_with_K4"],
                    "MEC_outside_labels": report["mec_audit"]["outside_labels"],
                    "status": "PASS",
                },
                indent=2,
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
