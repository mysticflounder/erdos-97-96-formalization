"""Externally exact algebraic validation of the bare F2 three-row metric core.

This is not a Lean proof and is not a model of `CounterexampleData`: it does
not encode caps, MEC order, or global K4.  It is a regression certificate
against trying to derive a contradiction from only the three row equations,
their 2-2 incidence pattern, pairwise-distinct centers, and convex
independence.

All factorization checks below are exact in a SymPy algebraic number field.
The displayed decimals are presentation only.  Exact disjoint rational
intervals certify that all eleven parabola parameters are distinct.
"""

from __future__ import annotations

from dataclasses import dataclass

import sympy as sp
from sympy.polys.domains import QQ


u, v = sp.symbols("u v")


def parabola_dist_sq(center: sp.Expr, point: sp.Expr) -> sp.Expr:
    """Squared Euclidean distance from (center, center^2) to (point, point^2)."""

    return (center - point) ** 2 * (1 + (center + point) ** 2)


sigma_polynomial = sp.Poly(u**6 - 34 * u**4 + 205 * u**2 - 36, u)
sigma = sp.CRootOf(sigma_polynomial.as_expr(), 5)

# The selected real root is isolated exactly in (5.12, 5.13).
sigma_lo = sp.Rational(128, 25)
sigma_hi = sp.Rational(513, 100)
assert sigma_polynomial.count_roots(sigma_lo, sigma_hi) == 1
assert sigma_lo < sigma < sigma_hi

# Work exactly in Q(sigma).
field = QQ.algebraic_field(sigma)
sg = field.unit
cv = field.convert
to_expr = field.to_sympy
z = sg**2

# Factor the middle circle polynomial as
#   (v^2 + sigma v + beta) (v^2 - sigma v + gamma).
beta = (z - cv(17) - cv(6) / sg) / cv(2)
gamma = (z - cv(17) + cv(6) / sg) / cv(2)

# The other centers equidistant from the two roots in each middle factor.
live_center = cv(3) + field.one / sg
deleted_blocker = cv(3) - field.one / sg
middle_center = cv(-3)

# The remaining two roots on each outer circle.
delta_live = beta - cv(2) * live_center / sg
delta_deleted = gamma + cv(2) * deleted_blocker / sg

q_xy = sp.Poly(
    v**2 + to_expr(sg) * v + to_expr(beta), v, extension=sigma
)
q_st = sp.Poly(
    v**2 - to_expr(sg) * v + to_expr(gamma), v, extension=sigma
)
q_live_extra = sp.Poly(
    v**2 - to_expr(sg) * v + to_expr(delta_live), v, extension=sigma
)
q_deleted_extra = sp.Poly(
    v**2 + to_expr(sg) * v + to_expr(delta_deleted), v, extension=sigma
)

middle_circle = sp.Poly(v**4 - 17 * v**2 + 6 * v + 21, v, domain=field)
assert middle_circle == q_xy * q_st
assert sp.expand(parabola_dist_sq(sp.Integer(-3), v) - 69) == (
    v**4 - 17 * v**2 + 6 * v + 21
)

live_circle = q_xy * q_live_extra
deleted_circle = q_st * q_deleted_extra


def certify_circle_shape(
    polynomial: sp.Poly, center: sp.polys.polyclasses.ANP
) -> sp.polys.polyclasses.ANP:
    """Check exactly that a monic quartic is F(center,v) - radius_sq."""

    constant = field.from_sympy(polynomial.nth(0))
    radius_sq = center**4 + center**2 - constant
    expected = sp.Poly(
        v**4
        + to_expr(field.one - cv(2) * center**2) * v**2
        + to_expr(-cv(2) * center) * v
        + to_expr(center**4 + center**2 - radius_sq),
        v,
        extension=sigma,
    )
    assert polynomial == expected
    assert to_expr(radius_sq) > 0
    return radius_sq


live_radius_sq = certify_circle_shape(live_circle, live_center)
deleted_radius_sq = certify_circle_shape(deleted_circle, deleted_blocker)

# Write all eight support parameters by the quadratic formula.  These
# expressions are exact real algebraic numbers.
disc_xy = sigma**2 - 4 * to_expr(beta)
disc_st = sigma**2 - 4 * to_expr(gamma)
disc_live = sigma**2 - 4 * to_expr(delta_live)
disc_deleted = sigma**2 - 4 * to_expr(delta_deleted)
assert disc_xy > 0
assert disc_st > 0
assert disc_live > 0
assert disc_deleted > 0

parameters = {
    "x": (-sigma - sp.sqrt(disc_xy)) / 2,
    "y": (-sigma + sp.sqrt(disc_xy)) / 2,
    "s": (sigma - sp.sqrt(disc_st)) / 2,
    "t": (sigma + sp.sqrt(disc_st)) / 2,
    "q": (sigma - sp.sqrt(disc_live)) / 2,
    "live_extra": (sigma + sp.sqrt(disc_live)) / 2,
    "deleted": (-sigma - sp.sqrt(disc_deleted)) / 2,
    "deleted_extra": (-sigma + sp.sqrt(disc_deleted)) / 2,
    "middle_center": sp.Integer(-3),
    "deleted_blocker": to_expr(deleted_blocker),
    "live_center": to_expr(live_center),
}

root_factor = {
    "x": q_xy,
    "y": q_xy,
    "s": q_st,
    "t": q_st,
    "q": q_live_extra,
    "live_extra": q_live_extra,
    "deleted": q_deleted_extra,
    "deleted_extra": q_deleted_extra,
}
for label, factor in root_factor.items():
    assert sp.factor(factor.as_expr().subs(v, parameters[label])) == 0


@dataclass(frozen=True)
class RationalInterval:
    lo: sp.Rational
    hi: sp.Rational


# Ordered disjoint intervals.  Membership comparisons are exact algebraic
# comparisons, not floating-point checks.
ordered_intervals = [
    ("x", RationalInterval(sp.Rational(-416, 100), sp.Rational(-414, 100))),
    (
        "deleted",
        RationalInterval(sp.Rational(-308, 100), sp.Rational(-306, 100)),
    ),
    (
        "middle_center",
        RationalInterval(sp.Rational(-301, 100), sp.Rational(-299, 100)),
    ),
    (
        "deleted_extra",
        RationalInterval(sp.Rational(-206, 100), sp.Rational(-204, 100)),
    ),
    ("y", RationalInterval(sp.Rational(-98, 100), sp.Rational(-96, 100))),
    ("q", RationalInterval(sp.Rational(61, 100), sp.Rational(63, 100))),
    ("s", RationalInterval(sp.Rational(139, 100), sp.Rational(141, 100))),
    (
        "deleted_blocker",
        RationalInterval(sp.Rational(280, 100), sp.Rational(281, 100)),
    ),
    (
        "live_center",
        RationalInterval(sp.Rational(319, 100), sp.Rational(320, 100)),
    ),
    ("t", RationalInterval(sp.Rational(372, 100), sp.Rational(373, 100))),
    (
        "live_extra",
        RationalInterval(sp.Rational(450, 100), sp.Rational(451, 100)),
    ),
]

previous_hi: sp.Rational | None = None
for label, interval in ordered_intervals:
    value = parameters[label]
    assert interval.lo < value < interval.hi
    if previous_hi is not None:
        assert previous_hi < interval.lo
    previous_hi = interval.hi

# Hence the three exact parameter supports have precisely the desired
# intersections:
#
#   live    = {q, x, y, live_extra}
#   middle  = {x, y, s, t}
#   deleted = {deleted, deleted_extra, s, t}.
#
# The parabola map P(r)=(r,r^2) is injective.  Every finite set of distinct
# P(r)'s is convex independent: the tangent at P(r_i) strictly separates
# P(r_i) from every P(r_j), since
#   r_j^2 - (2*r_i*r_j - r_i^2) = (r_j-r_i)^2 > 0.

# The canonical missing producer is false in this local model.
# Exact nonvanishing follows from the exact factorization of `middle_circle`
# into `q_xy * q_st` together with the disjoint rational isolating intervals:
# `deleted` is different from all four roots of those two quadratics.
deleted_middle_residual = sp.factor(
    middle_circle.as_expr().subs(v, parameters["deleted"])
)

print("EXTERNALLY EXACT ALGEBRAIC CHECK: PASS")
print(f"sigma = {sp.N(sigma, 30)}")
print(f"live radius squared = {sp.N(to_expr(live_radius_sq), 30)}")
print(f"middle radius squared = {sp.Integer(69)}")
print(f"deleted-shell radius squared = {sp.N(to_expr(deleted_radius_sq), 30)}")
for label, _interval in ordered_intervals:
    print(f"{label:16s} {sp.N(parameters[label], 30)}")
print(
    "deleted middle-circle polynomial residual = "
    f"{sp.N(deleted_middle_residual, 30)}"
)
