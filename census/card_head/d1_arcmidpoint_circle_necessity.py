"""Necessity and sufficiency of the concyclicity hypothesis in the D1 TriApex
arc-midpoint lemma.

`Problem97.signedArea2_eq_zero_of_arcMidpoint_twoCircle`
(`lean/Erdos9796Proof/P97/ATail/ArcMidpointReflectionCollinear.lean`) consumes,
under the census slot map ``o = A2, a = A0, b = A1, k = P2.1, p = P2.3,
q = P1.1``:

* four circle memberships -- ``A0``, ``A1``, ``K``, ``P`` all at distance ``r``
  from a common centre ``O``;
* ``|K A0| = |K Q| = |K P|``;
* ``|A1 Q| = |A1 P|``;
* ``Q != P``, ``A1 != K``, ``A0 != P``;

and concludes that ``A0``, ``A1``, ``Q`` are collinear.

The circle memberships are the expensive half of the ingress: the source has no
producer for a mixed apex/interior concyclicity.  This module answers whether
they can be weakened away, by testing both directions exactly over the
rationals.

* :func:`necessity_trial` builds configurations satisfying all three
  equidistances with ``K`` free on the perpendicular bisector of ``A0 P``, so
  concyclicity fails generically, and checks that collinearity fails with it.
* :func:`sufficiency_trial` builds exact rational configurations on the unit
  circle -- concyclicity holds by construction, with no square roots -- and
  checks that collinearity follows.

Together they establish that, given the other five hypotheses, collinearity
holds exactly when ``K`` lies on the circumcircle of ``A0 A1 P``.  The circle
hypothesis is therefore not a normalization artifact and admits no cheaper
substitute; an ingress must produce it (or the same content stated as an angle
equality at ``A1``).

Arithmetic is `fractions.Fraction` throughout: every verdict is exact, and no
tolerance is involved.
"""

from __future__ import annotations

import random
from fractions import Fraction
from typing import Iterator, NamedTuple

Point = tuple[Fraction, Fraction]

ORIGIN: Point = (Fraction(0), Fraction(0))


def sub(u: Point, v: Point) -> Point:
    return (u[0] - v[0], u[1] - v[1])


def dot(u: Point, v: Point) -> Fraction:
    return u[0] * v[0] + u[1] * v[1]


def dist_sq(u: Point, v: Point) -> Fraction:
    w = sub(u, v)
    return dot(w, w)


def signed_area2(a: Point, b: Point, c: Point) -> Fraction:
    """Twice the signed area of the triangle; zero exactly when collinear."""
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def reflect(point: Point, base: Point, direction: Point) -> Point:
    """Reflect ``point`` across the line through ``base`` with ``direction``.

    A rational direction sends rational points to rational points, which is what
    keeps the whole test exact.
    """
    w = sub(point, base)
    t = dot(w, direction) / dot(direction, direction)
    proj = (base[0] + t * direction[0], base[1] + t * direction[1])
    return (2 * proj[0] - point[0], 2 * proj[1] - point[1])


def circumcircle_power(a: Point, b: Point, c: Point, x: Point) -> Fraction:
    """Zero exactly when ``x`` is on the circle through ``a``, ``b``, ``c``.

    The usual 4x4 concyclicity determinant.  For collinear ``a, b, c`` it
    degenerates, so callers screen that case out first.
    """
    rows = [(dot(p, p), p[0], p[1], Fraction(1)) for p in (a, b, c, x)]
    total = Fraction(0)
    for i in range(4):
        minor = [[rows[r][col] for col in range(1, 4)] for r in range(4) if r != i]
        det3 = (
            minor[0][0] * (minor[1][1] * minor[2][2] - minor[1][2] * minor[2][1])
            - minor[0][1] * (minor[1][0] * minor[2][2] - minor[1][2] * minor[2][0])
            + minor[0][2] * (minor[1][0] * minor[2][1] - minor[1][1] * minor[2][0])
        )
        total += ((-1) ** i) * rows[i][0] * det3
    return total


def perp_bisector_point(a: Point, p: Point, t: Fraction) -> Point:
    """The point at parameter ``t`` on the perpendicular bisector of ``a p``."""
    mid = ((a[0] + p[0]) / 2, (a[1] + p[1]) / 2)
    dxy = sub(p, a)
    normal = (-dxy[1], dxy[0])
    return (mid[0] + t * normal[0], mid[1] + t * normal[1])


def unit_circle_point(t: Fraction) -> Point:
    """Rational point on the unit circle at parameter ``t``."""
    den = 1 + t * t
    return ((1 - t * t) / den, (2 * t) / den)


class Tally(NamedTuple):
    """Outcome counts for one trial batch."""

    checked: int
    agreed: int
    disagreed: int
    skipped: int
    witnesses: tuple[tuple[Point, ...], ...]


def _rationals(rng: random.Random, count: int) -> Iterator[Fraction]:
    for _ in range(count):
        yield Fraction(rng.randint(-40, 40), rng.randint(1, 7))


def necessity_trial(samples: int = 20000, seed: int = 20260903) -> Tally:
    """Test that dropping concyclicity destroys the conclusion.

    ``K`` is placed anywhere on the perpendicular bisector of ``A0 P``, so
    ``|K A0| = |K P|`` holds while concyclicity generically fails.  ``Q`` is the
    reflection of ``P`` across line ``A1 K``, which supplies the remaining two
    equidistances exactly.  A configuration counts as agreeing when concyclicity
    and collinearity have the same truth value.
    """
    rng = random.Random(seed)
    checked = agreed = disagreed = skipped = 0
    witnesses: list[tuple[Point, ...]] = []
    for _ in range(samples):
        a0, p, a1 = (
            (x, y)
            for x, y in zip(_rationals(rng, 3), _rationals(rng, 3))
        )
        if len({a0, p, a1}) < 3 or signed_area2(a0, a1, p) == 0:
            skipped += 1
            continue
        k = perp_bisector_point(a0, p, next(_rationals(rng, 1)))
        if k == a1:
            skipped += 1
            continue
        q = reflect(p, a1, sub(k, a1))
        # Q = P is excluded by hypothesis; Q = A0 makes the conclusion vacuous.
        if q == p or q == a0:
            skipped += 1
            continue
        assert dist_sq(k, a0) == dist_sq(k, p)
        assert dist_sq(k, q) == dist_sq(k, p)
        assert dist_sq(a1, q) == dist_sq(a1, p)
        checked += 1
        concyclic = circumcircle_power(a0, a1, p, k) == 0
        collinear = signed_area2(a0, a1, q) == 0
        if concyclic == collinear:
            agreed += 1
        else:
            disagreed += 1
            if len(witnesses) < 4:
                witnesses.append((a0, a1, k, p, q))
    return Tally(checked, agreed, disagreed, skipped, tuple(witnesses))


def sufficiency_trial(samples: int = 4000, seed: int = 9603) -> Tally:
    """Test the conclusion on exact rational configurations that do satisfy it.

    ``K``, ``A0`` and ``A1`` are rational points of the unit circle.  The
    perpendicular bisector of ``A0 P`` has to contain both the centre and ``K``,
    so it is the line ``O K``; reflecting ``A0`` across it gives a rational ``P``
    on the circle.  Concyclicity then holds by construction and every hypothesis
    is exact.
    """
    rng = random.Random(seed)
    checked = agreed = disagreed = skipped = 0
    witnesses: list[tuple[Point, ...]] = []
    for _ in range(samples):
        tk, ta0, ta1 = _rationals(rng, 3)
        k, a0, a1 = unit_circle_point(tk), unit_circle_point(ta0), unit_circle_point(ta1)
        if len({k, a0, a1}) < 3:
            skipped += 1
            continue
        p = reflect(a0, ORIGIN, k)
        if p == a0 or k == a1:
            skipped += 1
            continue
        q = reflect(p, a1, sub(k, a1))
        if q == p or q == a0:
            skipped += 1
            continue
        assert dist_sq(p, ORIGIN) == 1
        assert dist_sq(k, a0) == dist_sq(k, p)
        assert dist_sq(k, q) == dist_sq(k, p)
        assert dist_sq(a1, q) == dist_sq(a1, p)
        assert circumcircle_power(a0, a1, p, k) == 0
        checked += 1
        if signed_area2(a0, a1, q) == 0:
            agreed += 1
        else:
            disagreed += 1
            if len(witnesses) < 4:
                witnesses.append((a0, a1, k, p, q))
    return Tally(checked, agreed, disagreed, skipped, tuple(witnesses))


def main() -> int:
    necessity = necessity_trial()
    sufficiency = sufficiency_trial()
    print("necessity  (K off the circumcircle, all equidistances hold)")
    print(f"  configurations checked                 : {necessity.checked}")
    print(f"  concyclicity and collinearity agree    : {necessity.agreed}")
    print(f"  disagree                               : {necessity.disagreed}")
    print("sufficiency (exact rational, concyclicity holds by construction)")
    print(f"  configurations checked                 : {sufficiency.checked}")
    print(f"  collinearity follows                   : {sufficiency.agreed}")
    print(f"  counterexamples                        : {sufficiency.disagreed}")
    for label, tally in (("necessity", necessity), ("sufficiency", sufficiency)):
        for witness in tally.witnesses:
            print(f"  {label} witness: {witness}")
    return 0 if not (necessity.disagreed or sufficiency.disagreed) else 1


if __name__ == "__main__":
    raise SystemExit(main())
