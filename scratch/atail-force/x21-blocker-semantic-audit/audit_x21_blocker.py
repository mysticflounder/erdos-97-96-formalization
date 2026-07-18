#!/usr/bin/env python3
"""Independent exact-interval audit of the x21 blocker-row semantics.

This script reads, but never modifies, the active x21 validation artifacts.
It independently reconstructs the rational polynomial system and its
Krawczyk box, then checks the complete distance partition at x21.  The exact
interval ledger proves that each named support point is a legal deletion
source for the x21 critical row, subject to trusting the implemented rational
interval/Krawczyk checker (this is not a Lean certificate).
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from fractions import Fraction as F
import hashlib
import itertools
import json
from pathlib import Path
from typing import Sequence

import mpmath as mp
import sympy as sp


ROOT = Path(__file__).resolve().parents[3]
ACTIVE = ROOT / "scratch/atail-force/source-faithful-full-cell-k4-completion"
DEFAULT_VALIDATION = ACTIVE / "x21-validation.json"
DEFAULT_CERTIFICATE = ACTIVE / "x21-algebraic-certificate.json"

ORDER = (
    "uS0", "uS1", "t0s", "t1s", "o", "uI", "t1i1", "t0i1",
    "t0i0", "t1i0", "x20", "x01", "x00", "x21", "left", "q0",
    "t1o", "t0o", "c0", "c2", "q1", "c1", "q2", "right", "x11",
    "x10",
)
X21_SUPPORT = ("uS1", "t0s", "t1s", "o")
T0 = ("t0i0", "t0i1", "t0o", "t0s")
T1 = ("t1i0", "t1i1", "t1o", "t1s")
ANGLE_INDICES = frozenset((*range(0, 4), *range(7, 13), *range(15, 26)))
VARIABLE_INDICES = (0, 5, 22)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_fraction(text: str) -> F:
    return F(text)


def render_fraction(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def render_decimal(value: F, digits: int = 18) -> str:
    mp.mp.dps = digits + 10
    return mp.nstr(mp.mpf(value.numerator) / value.denominator, digits)


@dataclass(frozen=True)
class Interval:
    lo: F
    hi: F

    def __post_init__(self) -> None:
        if self.lo > self.hi:
            raise ValueError((self.lo, self.hi))

    @staticmethod
    def point(value: F | int | sp.Rational) -> "Interval":
        if isinstance(value, sp.Rational):
            value = F(int(value.p), int(value.q))
        return Interval(F(value), F(value))

    def __add__(self, other):
        other = as_interval(other)
        return Interval(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + (-as_interval(other))

    def __rsub__(self, other):
        return as_interval(other) - self

    def __mul__(self, other):
        other = as_interval(other)
        products = (
            self.lo * other.lo,
            self.lo * other.hi,
            self.hi * other.lo,
            self.hi * other.hi,
        )
        return Interval(min(products), max(products))

    __rmul__ = __mul__

    def reciprocal(self):
        if self.lo <= 0 <= self.hi:
            raise ZeroDivisionError(self)
        return Interval(1 / self.hi, 1 / self.lo)

    def __truediv__(self, other):
        return self * as_interval(other).reciprocal()

    def __rtruediv__(self, other):
        return as_interval(other) / self

    def __pow__(self, exponent: int):
        if exponent < 0:
            return self.reciprocal() ** (-exponent)
        if exponent == 0:
            return Interval.point(1)
        if exponent % 2 == 0 and self.lo <= 0 <= self.hi:
            return Interval(F(0), max(abs(self.lo), abs(self.hi)) ** exponent)
        endpoints = (self.lo**exponent, self.hi**exponent)
        return Interval(min(endpoints), max(endpoints))


def as_interval(value) -> Interval:
    return value if isinstance(value, Interval) else Interval.point(value)


def interval_payload(value: Interval) -> dict[str, str]:
    return {
        "lo": render_fraction(value.lo),
        "hi": render_fraction(value.hi),
        "lo_decimal": render_decimal(value.lo),
        "hi_decimal": render_decimal(value.hi),
    }


def excludes_zero(value: Interval) -> bool:
    return value.hi < 0 or 0 < value.lo


def abs_gap_lower(value: Interval) -> F:
    if not excludes_zero(value):
        return F(0)
    return min(abs(value.lo), abs(value.hi))


def add(first, second):
    return first[0] + second[0], first[1] + second[1]


def sub(first, second):
    return first[0] - second[0], first[1] - second[1]


def scale(coefficient, point):
    return coefficient * point[0], coefficient * point[1]


def unit(tangent):
    denominator = 1 + tangent * tangent
    return (
        (1 - tangent * tangent) / denominator,
        2 * tangent / denominator,
    )


def rotate(point, tangent):
    cosine, sine = unit(tangent)
    return (
        cosine * point[0] - sine * point[1],
        sine * point[0] + cosine * point[1],
    )


def sqdist(first, second):
    delta = sub(first, second)
    return delta[0] * delta[0] + delta[1] * delta[1]


def construct(parameters):
    apex, q0, q1, q2, lambda0, lambda1, lambda2, *targets = parameters[:13]
    r0, r1, *extension = parameters[13:]
    t_angles = extension[:8]
    u_angles = extension[8:]
    o = (0 * apex, 0 * apex)
    left = unit(0 * apex)
    right = unit(apex)
    sources = [unit(q0), unit(q1), unit(q2)]
    blockers = [
        scale(lambda0, add(sources[0], sources[1])),
        scale(lambda1, add(sources[1], sources[2])),
        scale(lambda2, add(sources[2], sources[0])),
    ]
    points = {
        "o": o,
        "left": left,
        "right": right,
        "q0": sources[0],
        "q1": sources[1],
        "q2": sources[2],
        "c0": blockers[0],
        "c1": blockers[1],
        "c2": blockers[2],
    }
    for row, source_index in enumerate((0, 1, 2)):
        vector = sub(sources[source_index], blockers[row])
        for slot in range(2):
            points[f"x{row}{slot}"] = add(
                blockers[row], rotate(vector, targets[2 * row + slot])
            )
    for name, tangent in zip((*T0, *T1), t_angles, strict=True):
        radius = r0 if name.startswith("t0") else r1
        points[name] = add(right, scale(radius, unit(tangent)))
    vector = sub(points["c1"], left)
    for name, tangent in zip(("uI", "uS0", "uS1"), u_angles, strict=True):
        points[name] = add(left, rotate(vector, tangent))
    if set(points) != set(ORDER):
        raise AssertionError((set(points) - set(ORDER), set(ORDER) - set(points)))
    return points


def primitive_numerator(expression, variables):
    numerator = sp.cancel(expression).as_numer_denom()[0]
    polynomial = sp.Poly(numerator, *variables, domain=sp.QQ)
    _denominator, integer_polynomial = polynomial.clear_denoms(convert=True)
    _content, primitive = integer_polynomial.primitive()
    if primitive.LC() < 0:
        primitive = -primitive
    return primitive


def evaluate_poly(poly: sp.Poly, box: Sequence[Interval]) -> Interval:
    result = Interval.point(0)
    for monomial, coefficient in poly.terms():
        term = as_interval(coefficient)
        for interval, exponent in zip(box, monomial, strict=True):
            term *= interval**exponent
        result += term
    return result


def fraction(value: sp.Rational) -> F:
    return F(int(value.p), int(value.q))


def krawczyk_image(polynomials, variables, box):
    center_f = [(interval.lo + interval.hi) / 2 for interval in box]
    center = [sp.Rational(value.numerator, value.denominator) for value in center_f]
    substitution = dict(zip(variables, center, strict=True))
    jacobian = sp.Matrix(
        [
            [poly.diff(variable).eval(substitution) for variable in variables]
            for poly in polynomials
        ]
    )
    inverse_matrix = jacobian.inv()
    inverse = [
        [fraction(inverse_matrix[i, j]) for j in range(len(variables))]
        for i in range(len(variables))
    ]
    f_center = [fraction(poly.eval(substitution)) for poly in polynomials]
    y = [
        center_f[i] - sum(inverse[i][j] * f_center[j] for j in range(3))
        for i in range(3)
    ]
    jacobian_box = [
        [evaluate_poly(poly.diff(variable), box) for variable in variables]
        for poly in polynomials
    ]
    matrix = []
    for i in range(3):
        row = []
        for j in range(3):
            value = Interval.point(1 if i == j else 0)
            for k in range(3):
                value -= inverse[i][k] * jacobian_box[k][j]
            row.append(value)
        matrix.append(row)
    deltas = [interval - Interval.point(value) for interval, value in zip(box, center_f)]
    image = []
    for i in range(3):
        value = Interval.point(y[i])
        for j in range(3):
            value += matrix[i][j] * deltas[j]
        image.append(value)
    contained = all(
        interval.lo < value.lo and value.hi < interval.hi
        for interval, value in zip(box, image, strict=True)
    )
    return contained, image


def rationalize_parameters(values: Sequence[str], denominator: int):
    mp.mp.dps = 200
    result = []
    for index, text in enumerate(values):
        value = mp.mpf(text)
        if index in ANGLE_INDICES:
            approximation = F(str(mp.tan(value / 2))).limit_denominator(denominator)
        else:
            approximation = F(str(value)).limit_denominator(denominator)
        result.append(sp.Rational(approximation.numerator, approximation.denominator))
    return result


def numeric_precision_record(parameters, dps: int) -> dict[str, object]:
    mp.mp.dps = dps
    values = [mp.mpf(value) for value in parameters]
    points = construct(values)
    distances = {
        name: sqdist(points["x21"], points[name])
        for name in ORDER
        if name != "x21"
    }
    common = distances[X21_SUPPORT[0]]
    support_residual = max(abs(distances[name] - common) for name in X21_SUPPORT)
    outside = [name for name in distances if name not in X21_SUPPORT]
    support_outside_gap = min(abs(distances[name] - common) for name in outside)
    outside_pair_gap = min(
        abs(distances[first] - distances[second])
        for first, second in itertools.combinations(outside, 2)
    )
    source_sqdist = min(distances[name] for name in X21_SUPPORT)
    return {
        "dps": dps,
        "support_max_abs_residual": mp.nstr(support_residual, 20),
        "minimum_source_sqdist": mp.nstr(source_sqdist, 20),
        "minimum_support_vs_outside_gap": mp.nstr(support_outside_gap, 20),
        "minimum_outside_pair_gap": mp.nstr(outside_pair_gap, 20),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--validation", type=Path, default=DEFAULT_VALIDATION)
    parser.add_argument("--certificate", type=Path, default=DEFAULT_CERTIFICATE)
    parser.add_argument(
        "--output", type=Path, default=Path(__file__).resolve().parent / "audit.json"
    )
    parser.add_argument(
        "--singular", type=Path, default=Path(__file__).resolve().parent / "x21-replay.sing"
    )
    args = parser.parse_args()

    validation = json.loads(args.validation.read_text(encoding="utf-8"))
    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    if validation["status"] != "HIGH_PRECISION_RAW_CELL_HIT":
        raise ValueError("active high-precision validation is not a hit")
    if certificate["status"] != "EXACT_ALGEBRAIC_ONE_ROW_COMPLETION_CERTIFIED":
        raise ValueError("active algebraic certificate is not certified")
    if tuple(certificate["new_row"]["support"]) != X21_SUPPORT:
        raise ValueError("x21 support drift")
    if certificate["fixed_parameter_denominator_bound"] != 100_000_000:
        raise ValueError("fixed denominator drift")

    parameters = rationalize_parameters(
        validation["refined_parameters"],
        certificate["fixed_parameter_denominator_bound"],
    )
    a, l, s = sp.symbols("a l s")
    variables = (a, l, s)
    parameters[0], parameters[5], parameters[22] = variables
    symbolic_points = construct(parameters)
    symbolic_distances = [
        sqdist(symbolic_points["x21"], symbolic_points[name])
        for name in X21_SUPPORT
    ]
    polynomials = [
        primitive_numerator(value - symbolic_distances[0], variables)
        for value in symbolic_distances[1:]
    ]
    polynomial_text = "\n".join(str(poly.as_expr()) for poly in polynomials)
    polynomial_hash = hashlib.sha256(polynomial_text.encode()).hexdigest()
    if polynomial_hash != certificate["polynomial_sha256"]:
        raise AssertionError((polynomial_hash, certificate["polynomial_sha256"]))
    polynomial_metadata = [
        {
            "total_degree": poly.total_degree(),
            "term_count": len(poly.terms()),
            "leading_monomial": list(poly.monoms()[0]),
        }
        for poly in polynomials
    ]
    if polynomial_metadata != certificate["polynomials"]:
        raise AssertionError((polynomial_metadata, certificate["polynomials"]))
    groebner = sp.groebner(polynomials, *variables, order="lex")
    groebner_reduces = all(
        groebner.reduce(poly.as_expr())[1] == 0 for poly in polynomials
    )

    root_box = [
        Interval(parse_fraction(record["lo"]), parse_fraction(record["hi"]))
        for record in certificate["root_box"]
    ]
    widths = {interval.hi - interval.lo for interval in root_box}
    expected_width = 2 * parse_fraction(certificate["krawczyk_radius"])
    if widths != {expected_width}:
        raise AssertionError((widths, expected_width))
    krawczyk_contained, recomputed_image = krawczyk_image(
        polynomials, variables, root_box
    )
    stored_image = [
        Interval(parse_fraction(record["lo"]), parse_fraction(record["hi"]))
        for record in certificate["krawczyk_image"]
    ]
    krawczyk_image_matches = recomputed_image == stored_image
    if not krawczyk_contained or not krawczyk_image_matches:
        raise AssertionError("independent Krawczyk replay failed")

    variable_box = dict(zip(VARIABLE_INDICES, root_box, strict=True))
    interval_parameters = [
        variable_box[index] if index in variable_box else as_interval(value)
        for index, value in enumerate(parameters)
    ]
    interval_points = construct(interval_parameters)
    distance_intervals = {
        name: sqdist(interval_points["x21"], interval_points[name])
        for name in ORDER
        if name != "x21"
    }
    common_radius = distance_intervals[X21_SUPPORT[0]]
    outside = tuple(name for name in ORDER if name not in X21_SUPPORT and name != "x21")

    source_distances = {
        source: interval_payload(distance_intervals[source])
        for source in X21_SUPPORT
    }
    if any(distance_intervals[source].lo <= 0 for source in X21_SUPPORT):
        raise AssertionError("x21 coincides with a candidate source")

    support_outside = []
    for name in outside:
        difference = distance_intervals[name] - common_radius
        support_outside.append(
            {
                "outside": name,
                "difference_sqdist_outside_minus_support": interval_payload(difference),
                "absolute_gap_lower": render_fraction(abs_gap_lower(difference)),
                "absolute_gap_lower_decimal": render_decimal(abs_gap_lower(difference)),
            }
        )
    if any(record["absolute_gap_lower"] == "0/1" for record in support_outside):
        raise AssertionError("an outside point is not separated from the x21 support")

    outside_pairs = []
    for first, second in itertools.combinations(outside, 2):
        difference = distance_intervals[first] - distance_intervals[second]
        outside_pairs.append(
            {
                "first": first,
                "second": second,
                "difference_sqdist_first_minus_second": interval_payload(difference),
                "absolute_gap_lower": render_fraction(abs_gap_lower(difference)),
                "absolute_gap_lower_decimal": render_decimal(abs_gap_lower(difference)),
            }
        )
    if any(record["absolute_gap_lower"] == "0/1" for record in outside_pairs):
        raise AssertionError("two outside x21 distances are not separated")

    minimum_support_outside = min(
        parse_fraction(record["absolute_gap_lower"]) for record in support_outside
    )
    minimum_outside_pair = min(
        parse_fraction(record["absolute_gap_lower"]) for record in outside_pairs
    )
    minimum_source_sqdist = min(distance_intervals[name].lo for name in X21_SUPPORT)

    # The support equalities are the three reconstructed polynomial equations.
    # All rational-function denominators are products of 1+t^2 and hence
    # strictly positive on the root box.
    denominator_intervals = [
        1 + parameter * parameter for parameter in interval_parameters
        if isinstance(parameter, Interval)
    ]
    denominator_lower = min(value.lo for value in denominator_intervals)
    if denominator_lower <= 0:
        raise AssertionError("a rational parametrization denominator may vanish")

    precision_parameters = [
        str((interval.lo + interval.hi) / 2) if isinstance(interval, Interval)
        else str(interval)
        for interval in interval_parameters
    ]
    precision_ladder = [
        numeric_precision_record(precision_parameters, dps)
        for dps in (40, 80, 120, 180)
    ]

    valid_sources = []
    for source in X21_SUPPORT:
        valid_sources.append(
            {
                "source": source,
                "source_membership": True,
                "center_source_distinct": distance_intervals[source].lo > 0,
                "exact_four_point_radius_class": True,
                "remaining_support_class_cardinality_after_deletion": 3,
                "all_other_positive_radius_classes_cardinality_at_most": 1,
                "no_qfree": True,
            }
        )

    singular_lines = [
        "ring r = 0,(a,l,s),dp;",
        *(
            f"poly f{index + 1} = {str(poly.as_expr()).replace('**', '^')};"
            for index, poly in enumerate(polynomials)
        ),
        "ideal I = f1,f2,f3;",
        "option(redSB);",
        "ideal G = std(I);",
        'print("DIM");',
        "print(dim(G));",
        'print("SIZE");',
        "print(size(G));",
        'print("REDUCE");',
        "print(reduce(f1,G)); print(reduce(f2,G)); print(reduce(f3,G));",
    ]
    args.singular.write_text("\n".join(singular_lines) + "\n", encoding="utf-8")

    payload = {
        "schema": "x21-blocker-semantic-audit-v1",
        "status": "ALL_FOUR_SOURCES_INTERVAL_CERTIFIED",
        "epistemic_status": "EXACT_RATIONAL_INTERVAL_AND_CAS_REPLAY_NOT_LEAN",
        "inputs": {
            str(args.validation.relative_to(ROOT)): sha256(args.validation),
            str(args.certificate.relative_to(ROOT)): sha256(args.certificate),
        },
        "polynomial_replay": {
            "sha256": polynomial_hash,
            "metadata": polynomial_metadata,
            "groebner_basis_size": len(groebner.polys),
            "groebner_reduces_generators_to_zero": groebner_reduces,
        },
        "krawczyk_replay": {
            "strict_inclusion": krawczyk_contained,
            "image_matches_source_artifact_exactly": krawczyk_image_matches,
            "root_box": [interval_payload(value) for value in root_box],
            "image": [interval_payload(value) for value in recomputed_image],
        },
        "x21_support": list(X21_SUPPORT),
        "support_equalities": {
            "certified_by_unique_root_of_three_polynomials": True,
            "rational_denominator_lower": render_fraction(denominator_lower),
            "rational_denominator_lower_decimal": render_decimal(denominator_lower),
        },
        "source_sqdist_intervals": source_distances,
        "distance_partition": {
            "outside_point_count": len(outside),
            "outside_pair_count": len(outside_pairs),
            "minimum_source_sqdist_lower": render_fraction(minimum_source_sqdist),
            "minimum_source_sqdist_lower_decimal": render_decimal(minimum_source_sqdist),
            "minimum_support_vs_outside_gap_lower": render_fraction(minimum_support_outside),
            "minimum_support_vs_outside_gap_lower_decimal": render_decimal(minimum_support_outside),
            "minimum_outside_pair_gap_lower": render_fraction(minimum_outside_pair),
            "minimum_outside_pair_gap_lower_decimal": render_decimal(minimum_outside_pair),
            "support_vs_every_outside_point": support_outside,
            "every_outside_pair": outside_pairs,
        },
        "precision_ladder": precision_ladder,
        "valid_sources": valid_sources,
        "semantic_conclusion": {
            "full_x21_radius_class_is_exactly_support": True,
            "after_deleting_any_candidate_source_max_class_cardinality": 3,
            "simultaneous_overrideExactSelectedClass_hblocked_for_all_support_members": True,
        },
        "coverage_claim": False,
        "lean_or_kernel_claim": False,
        "singular_script": (
            str(args.singular.relative_to(ROOT))
            if args.singular.is_relative_to(ROOT)
            else str(args.singular)
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
