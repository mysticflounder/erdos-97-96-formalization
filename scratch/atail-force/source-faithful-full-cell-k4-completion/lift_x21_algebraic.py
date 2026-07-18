#!/usr/bin/env python3
"""Exact rational-polynomial and interval lift of the x21 row candidate."""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from fractions import Fraction as F
import hashlib
import itertools
import json
from pathlib import Path
import subprocess
from typing import Iterable, Sequence

import mpmath as mp
import sympy as sp


HERE = Path(__file__).resolve().parent
ORDER = (
    "uS0", "uS1", "t0s", "t1s", "o", "uI", "t1i1", "t0i1",
    "t0i0", "t1i0", "x20", "x01", "x00", "x21", "left", "q0",
    "t1o", "t0o", "c0", "c2", "q1", "c1", "q2", "right", "x11",
    "x10",
)
T0 = ("t0i0", "t0i1", "t0o", "t0s")
T1 = ("t1i0", "t1i1", "t1o", "t1s")
UNUSED = ("c1", "uI", "uS0", "uS1")
PHYSICAL = ("left", "q0", "q1", "q2", "right")
REVERSE = (
    ("c0", ("q0", "q1", "x00", "x01")),
    ("c1", ("q1", "q2", "x10", "x11")),
    ("c2", ("q2", "q0", "x20", "x21")),
)
X21_SUPPORT = ("uS1", "t0s", "t1s", "o")
X21_CRITICAL_SOURCE = "uS1"
ANGLE_INDICES = frozenset((*range(0, 4), *range(7, 13), *range(15, 26)))
VARIABLE_INDICES = (0, 5, 22)


def q(value: sp.Rational | F | int) -> sp.Rational:
    if isinstance(value, F):
        return sp.Rational(value.numerator, value.denominator)
    return sp.Rational(value)


def rationalize_parameters(values: Sequence[str], denominator: int):
    result: list[sp.Expr] = []
    for index, text in enumerate(values):
        value = mp.mpf(text)
        if index in ANGLE_INDICES:
            fraction = F(str(mp.tan(value / 2))).limit_denominator(denominator)
        else:
            fraction = F(str(value)).limit_denominator(denominator)
        result.append(q(fraction))
    return result


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


def cross(first, second, point):
    u, v = sub(second, first), sub(point, first)
    return u[0] * v[1] - u[1] * v[0]


def construct(parameters):
    apex, q0, q1, q2, lambda0, lambda1, lambda2, *targets = parameters[:13]
    r0, r1, *extension = parameters[13:]
    t_angles = extension[:8]
    u_angles = extension[8:]
    o = (q(0), q(0))
    left = unit(q(0))
    right = unit(apex)
    sources = [unit(q0), unit(q1), unit(q2)]
    blockers = [
        scale(lambda0, add(sources[0], sources[1])),
        scale(lambda1, add(sources[1], sources[2])),
        scale(lambda2, add(sources[2], sources[0])),
    ]
    points = {
        "o": o, "left": left, "right": right,
        "q0": sources[0], "q1": sources[1], "q2": sources[2],
        "c0": blockers[0], "c1": blockers[1], "c2": blockers[2],
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
    return points


def primitive_numerator(expression, variables):
    numerator = sp.cancel(expression).as_numer_denom()[0]
    polynomial = sp.Poly(numerator, *variables, domain=sp.QQ)
    _denominator, integer_polynomial = polynomial.clear_denoms(convert=True)
    _content, primitive = integer_polynomial.primitive()
    if primitive.LC() < 0:
        primitive = -primitive
    return primitive


@dataclass(frozen=True)
class Interval:
    lo: F
    hi: F

    def __post_init__(self):
        if self.lo > self.hi:
            raise ValueError((self.lo, self.hi))

    @staticmethod
    def point(value: F | int) -> "Interval":
        value = F(value)
        return Interval(value, value)

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
            self.lo * other.lo, self.lo * other.hi,
            self.hi * other.lo, self.hi * other.hi,
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
            return (self.reciprocal()) ** (-exponent)
        if exponent == 0:
            return Interval.point(1)
        if exponent % 2 == 0 and self.lo <= 0 <= self.hi:
            return Interval(F(0), max(abs(self.lo), abs(self.hi)) ** exponent)
        endpoints = (self.lo ** exponent, self.hi ** exponent)
        return Interval(min(endpoints), max(endpoints))


def as_interval(value) -> Interval:
    if isinstance(value, Interval):
        return value
    if isinstance(value, sp.Rational):
        return Interval.point(F(int(value.p), int(value.q)))
    return Interval.point(F(value))


def fraction(value: sp.Rational) -> F:
    return F(int(value.p), int(value.q))


def evaluate_poly(poly: sp.Poly, box: Sequence[Interval]) -> Interval:
    result = Interval.point(0)
    for monomial, coefficient in poly.terms():
        term = as_interval(coefficient)
        for interval, exponent in zip(box, monomial, strict=True):
            term *= interval ** exponent
        result += term
    return result


def matrix_inverse_at(polynomials, variables, center):
    jacobian = sp.Matrix([
        [poly.diff(variable).eval(dict(zip(variables, center, strict=True)))
         for variable in variables]
        for poly in polynomials
    ])
    inverse = jacobian.inv()
    return [[fraction(inverse[i, j]) for j in range(3)] for i in range(3)]


def interval_jacobian(polynomials, variables, box):
    return [
        [evaluate_poly(poly.diff(variable), box) for variable in variables]
        for poly in polynomials
    ]


def krawczyk(polynomials, variables, center, radius: F):
    center_f = [fraction(value) for value in center]
    box = [Interval(value - radius, value + radius) for value in center_f]
    inverse = matrix_inverse_at(polynomials, variables, center)
    substitution = dict(zip(variables, center, strict=True))
    f_center = [fraction(poly.eval(substitution)) for poly in polynomials]
    y = [
        center_f[i] - sum(inverse[i][j] * f_center[j] for j in range(3))
        for i in range(3)
    ]
    jacobian_box = interval_jacobian(polynomials, variables, box)
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
    return contained, box, image


def interval_cell_ledger(points):
    hull = [
        cross(points[ORDER[i]], points[ORDER[(i + 1) % len(ORDER)]], points[name])
        for i in range(len(ORDER))
        for name in ORDER
        if name not in (ORDER[i], ORDER[(i + 1) % len(ORDER)])
    ]
    pairwise = [
        sqdist(points[first], points[second])
        for index, first in enumerate(ORDER) for second in ORDER[:index]
    ]
    right = points["right"]
    mec_center = (as_interval(F(1, 2)), (1 - right[0]) / (2 * right[1]))
    mec_radius = sqdist(mec_center, points["o"])
    mec = [
        mec_radius - sqdist(mec_center, point)
        for name, point in points.items() if name not in ("o", "left", "right")
    ]

    def cap_margin(a, b, opposite, name):
        return -cross(points[a], points[b], points[opposite]) * cross(
            points[a], points[b], points[name]
        )

    cap = [cap_margin("o", "left", "right", name)
           for name in ("t0i0", "t0i1", "t1i0", "t1i1", "uI")]
    cap += [cap_margin("left", "right", "o", name) for name in ("t0o", "t1o")]
    cap += [cap_margin("right", "o", "left", name)
            for name in ("t0s", "t1s", "uS0", "uS1")]

    def exclusion(center, support):
        radius = sqdist(points[center], points[support[0]])
        return [
            sqdist(points[center], point) - radius
            for name, point in points.items() if name != center and name not in support
        ]

    exclusions = exclusion("o", PHYSICAL)
    for center, support in REVERSE:
        exclusions += exclusion(center, support)
    exclusions += exclusion("right", T0) + exclusion("right", T1)
    exclusions += exclusion("left", UNUSED)
    x21_exclusions = exclusion("x21", X21_SUPPORT)
    x21_deleted_names = [
        name for name in points
        if name not in ("x21", X21_CRITICAL_SOURCE)
    ]
    x21_retained_support = set(X21_SUPPORT) - {X21_CRITICAL_SOURCE}
    x21_deleted_alternative_gaps = [
        sqdist(points["x21"], points[first]) -
        sqdist(points["x21"], points[second])
        for index, first in enumerate(x21_deleted_names)
        for second in x21_deleted_names[:index]
        if not ({first, second} <= x21_retained_support)
    ]
    singleton_gaps = []
    for center, support in (("o", PHYSICAL), *REVERSE, ("left", UNUSED)):
        names = [name for name in points if name != center and name not in support]
        distances = {name: sqdist(points[center], points[name]) for name in names}
        singleton_gaps += [
            distances[first] - distances[second]
            for index, first in enumerate(names) for second in names[:index]
        ]
    reverse_return = [
        sqdist(points["right"], points[first]) - sqdist(points["right"], points[second])
        for first, second in (("x00", "x01"), ("x10", "x11"), ("x20", "x21"))
    ]
    nonobtuse = []
    triangle = ("o", "left", "right")
    for index, vertex in enumerate(triangle):
        first = triangle[(index + 1) % 3]
        second = triangle[(index + 2) % 3]
        nonobtuse.append(
            sqdist(points[vertex], points[first]) +
            sqdist(points[vertex], points[second]) -
            sqdist(points[first], points[second])
        )
    hull = [as_interval(value) for value in hull]
    pairwise = [as_interval(value) for value in pairwise]
    mec = [as_interval(value) for value in mec]
    cap = [as_interval(value) for value in cap]
    exclusions = [as_interval(value) for value in exclusions]
    x21_exclusions = [as_interval(value) for value in x21_exclusions]
    x21_deleted_alternative_gaps = [
        as_interval(value) for value in x21_deleted_alternative_gaps
    ]
    singleton_gaps = [as_interval(value) for value in singleton_gaps]
    reverse_return = [as_interval(value) for value in reverse_return]
    nonobtuse = [as_interval(value) for value in nonobtuse]
    return {
        "strict_hull_lower": min(value.lo for value in hull),
        "pairwise_sqdist_lower": min(value.lo for value in pairwise),
        "mec_containment_lower": min(value.lo for value in mec),
        "cap_role_lower": min(value.lo for value in cap),
        "nonobtuse_lower": min(value.lo for value in nonobtuse),
        "exclusions_avoid_zero": all(not (value.lo <= 0 <= value.hi) for value in exclusions),
        "x21_row_exclusions_avoid_zero": all(
            not (value.lo <= 0 <= value.hi) for value in x21_exclusions
        ),
        "x21_deleted_alternative_gaps_avoid_zero": all(
            not (value.lo <= 0 <= value.hi)
            for value in x21_deleted_alternative_gaps
        ),
        "singleton_gaps_avoid_zero": all(
            not (value.lo <= 0 <= value.hi) for value in singleton_gaps
        ),
        "reverse_return_avoid_zero": all(
            not (value.lo <= 0 <= value.hi) for value in reverse_return
        ),
    }


def render_fraction(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def singular_expression(poly: sp.Poly) -> str:
    return str(poly.as_expr()).replace("**", "^")


def symbolic_parameterized_equalities(points) -> bool:
    rows = [("o", PHYSICAL), *REVERSE, ("right", T0), ("right", T1),
            ("left", UNUSED)]
    for center, support in rows:
        radius = sqdist(points[center], points[support[0]])
        for name in support[1:]:
            if sp.cancel(sqdist(points[center], points[name]) - radius) != 0:
                return False
    return True


def parse_singular_cross_check(output: str) -> dict[str, object]:
    lines = [line.strip() for line in output.splitlines()]

    def following(marker: str, count: int) -> list[str]:
        index = lines.index(marker)
        return lines[index + 1:index + 1 + count]

    dimension = int(following("DIM", 1)[0])
    basis_size = int(following("SIZE", 1)[0])
    reductions = following("REDUCE", 3)
    return {
        "dimension": dimension,
        "basis_size": basis_size,
        "generator_reductions": reductions,
        "passed": dimension == 0 and reductions == ["0", "0", "0"],
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=HERE / "x21-validation.json")
    parser.add_argument("--output", type=Path, default=HERE / "x21-algebraic-certificate.json")
    parser.add_argument("--singular", type=Path, default=HERE / "x21-system.sing")
    parser.add_argument(
        "--singular-output", type=Path, default=HERE / "x21-singular-check.txt"
    )
    parser.add_argument("--run-singular", action="store_true")
    parser.add_argument("--denominator", type=int, default=100_000_000)
    args = parser.parse_args()
    payload = json.loads(args.input.read_text())
    mp.mp.dps = 160
    refined = payload["refined_parameters"]
    parameters = rationalize_parameters(refined, args.denominator)
    a, l, s = sp.symbols("a l s")
    parameters[0], parameters[5], parameters[22] = a, l, s
    points = construct(parameters)
    parameterized_equalities_zero = symbolic_parameterized_equalities(points)
    if not parameterized_equalities_zero:
        raise AssertionError("a construction-parameterized equality is not an identity")
    distances = [sqdist(points["x21"], points[name]) for name in X21_SUPPORT]
    polynomials = [
        primitive_numerator(value - distances[0], (a, l, s))
        for value in distances[1:]
    ]
    groebner = sp.groebner(polynomials, a, l, s, order="lex")
    reductions_zero = all(groebner.reduce(poly.as_expr())[1] == 0 for poly in polynomials)

    initial = [
        mp.tan(mp.mpf(refined[0]) / 2),
        mp.mpf(refined[5]),
        mp.tan(mp.mpf(refined[22]) / 2),
    ]
    functions = [sp.lambdify((a, l, s), poly.as_expr(), "mpmath") for poly in polynomials]
    root = mp.findroot(
        tuple(functions), tuple(initial), tol=mp.mpf("1e-90"), maxsteps=160
    )
    center = [sp.Rational(str(mp.nstr(value, 140))) for value in root]
    chosen = None
    for exponent in (30, 40, 50, 60, 70, 80):
        radius = F(1, 10 ** exponent)
        contained, box, image = krawczyk(polynomials, (a, l, s), center, radius)
        if contained:
            chosen = radius, box, image
            break
    if chosen is None:
        raise RuntimeError("Krawczyk inclusion failed at all requested radii")
    radius, box, image = chosen
    variable_box = dict(zip(VARIABLE_INDICES, box, strict=True))
    interval_parameters = [
        variable_box[index] if index in variable_box else as_interval(value)
        for index, value in enumerate(parameters)
    ]
    interval_points = construct(interval_parameters)
    ledger = interval_cell_ledger(interval_points)
    positive_keys = (
        "strict_hull_lower", "pairwise_sqdist_lower", "mec_containment_lower",
        "cap_role_lower", "nonobtuse_lower",
    )
    cell_certified = all(ledger[name] > 0 for name in positive_keys) and all(
        ledger[name] for name in (
            "exclusions_avoid_zero", "singleton_gaps_avoid_zero",
            "reverse_return_avoid_zero", "x21_row_exclusions_avoid_zero",
            "x21_deleted_alternative_gaps_avoid_zero",
        )
    )
    polynomial_text = "\n".join(str(poly.as_expr()) for poly in polynomials)
    groebner_text = "\n".join(str(poly) for poly in groebner.polys)
    singular = [
        "ring r = 0,(a,l,s),dp;",
        *(f"poly f{index + 1} = {singular_expression(poly)};"
          for index, poly in enumerate(polynomials)),
        "ideal I = f1,f2,f3;",
        "option(redSB);",
        "ideal G = std(I);",
        'print("DIM");', "print(dim(G));",
        'print("SIZE");', "print(size(G));",
        'print("REDUCE");', "print(reduce(f1,G)); print(reduce(f2,G)); print(reduce(f3,G));",
    ]
    args.singular.write_text("\n".join(singular) + "\n")
    singular_cross_check = None
    if args.run_singular:
        completed = subprocess.run(
            ["Singular", str(args.singular)], check=True, text=True,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        )
        args.singular_output.write_text(completed.stdout)
        singular_cross_check = parse_singular_cross_check(completed.stdout)
        if not singular_cross_check["passed"]:
            raise AssertionError(singular_cross_check)

    numeric_seed = []
    root_by_index = dict(zip(VARIABLE_INDICES, root, strict=True))
    for index, value in enumerate(parameters):
        numeric_value = (
            root_by_index[index] if index in root_by_index else mp.mpf(str(value))
        )
        if index in ANGLE_INDICES:
            numeric_value = 2 * mp.atan(numeric_value)
        numeric_seed.append(mp.nstr(numeric_value, 80))
    tangent_denominator_lower = min(
        (as_interval(interval_parameters[index]) ** 2 + 1).lo
        for index in ANGLE_INDICES
    )
    certificate = {
        "schema": "source-faithful-full-cell-x21-algebraic-certificate-v1",
        "epistemic_status": "EXACT_RATIONAL_INTERVAL_CERTIFICATE_NOT_LEAN",
        "status": "EXACT_ALGEBRAIC_ONE_ROW_COMPLETION_CERTIFIED" if cell_certified else
            "INTERVAL_CELL_CERTIFICATION_FAILED",
        "fixed_parameter_denominator_bound": args.denominator,
        "variables": ["apex_tangent_half", "lambda1", "t1s_tangent_half"],
        "polynomials": [
            {"total_degree": poly.total_degree(), "term_count": len(poly.terms()),
             "leading_monomial": list(poly.monoms()[0])}
            for poly in polynomials
        ],
        "polynomial_sha256": hashlib.sha256(polynomial_text.encode()).hexdigest(),
        "groebner_sha256": hashlib.sha256(groebner_text.encode()).hexdigest(),
        "groebner_basis_size": len(groebner.polys),
        "groebner_reduces_generators_to_zero": reductions_zero,
        "existing_equalities_symbolically_zero": parameterized_equalities_zero,
        "tangent_denominator_lower": render_fraction(tangent_denominator_lower),
        "parameter_denominators_positive": tangent_denominator_lower > 0,
        "root_box": [
            {"lo": render_fraction(value.lo), "hi": render_fraction(value.hi)}
            for value in box
        ],
        "krawczyk_radius": render_fraction(radius),
        "krawczyk_image": [
            {"lo": render_fraction(value.lo), "hi": render_fraction(value.hi)}
            for value in image
        ],
        "krawczyk_strict_inclusion": True,
        "interval_cell_ledger": {
            name: render_fraction(value) if isinstance(value, F) else value
            for name, value in ledger.items()
        },
        "cell_certified": cell_certified,
        "new_row": {
            "center": "x21", "support": list(X21_SUPPORT),
            "critical_source": X21_CRITICAL_SOURCE,
        },
        "source_oriented_blocker_manifest": {
            "critical_source": X21_CRITICAL_SOURCE,
            "blocker_center": "x21",
            "exact_support": list(X21_SUPPORT),
            "retained_support_after_deletion": sorted(
                set(X21_SUPPORT) - {X21_CRITICAL_SOURCE}
            ),
            "retained_support_cardinality": 3,
            "row_exclusions_certified": ledger["x21_row_exclusions_avoid_zero"],
            "all_alternative_deleted_radius_gaps_certified": ledger[
                "x21_deleted_alternative_gaps_avoid_zero"
            ],
            "deletion_kills_every_radius_class_at_blocker": (
                ledger["x21_row_exclusions_avoid_zero"] and
                ledger["x21_deleted_alternative_gaps_avoid_zero"]
            ),
        },
        "numeric_seed_parameterization": (
            "angles;lambda0;lambda1;lambda2;angles;r0;r1;angles"
        ),
        "numeric_seed_parameters": numeric_seed,
        "singular_script": str(args.singular),
        "singular_output": str(args.singular_output) if args.run_singular else None,
        "singular_cross_check": singular_cross_check,
        "singular_cross_check_pending": not args.run_singular,
        "coverage_claim": False,
        "whole_carrier_k4_claim": False,
    }
    args.output.write_text(json.dumps(certificate, indent=2, sort_keys=True) + "\n")
    print(json.dumps(certificate, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
