#!/usr/bin/env python3
"""Check one exact-trigonometric local control with outward rational intervals.

This is finite computational evidence, not a Lean proof or a global-K4 model.
All decisions use integer endpoints in units of 2**-160. Floating point is
used only to propose a cyclic order and to render the resulting bounds.
Exact equalities come from the displayed circle parametrizations, not from
overlapping intervals. See the accompanying proof note for those identities.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from fractions import Fraction
import hashlib
from itertools import combinations
import json
import math
from pathlib import Path

SCALE = 1 << 160


def ceildiv(a: int, b: int) -> int:
    return -((-a) // b)


@dataclass(frozen=True)
class Interval:
    lo: int
    hi: int

    @staticmethod
    def rational(x: int | Fraction) -> Interval:
        x = Fraction(x)
        return Interval(x.numerator * SCALE // x.denominator,
                        ceildiv(x.numerator * SCALE, x.denominator))

    def __add__(self, other: Interval | int) -> Interval:
        other = as_interval(other)
        return Interval(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self) -> Interval:
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other: Interval | int) -> Interval:
        return self + -as_interval(other)

    def __rsub__(self, other: Interval | int) -> Interval:
        return as_interval(other) + -self

    def __mul__(self, other: Interval | int) -> Interval:
        other = as_interval(other)
        values = [a * b for a in (self.lo, self.hi)
                  for b in (other.lo, other.hi)]
        return Interval(min(values) // SCALE, ceildiv(max(values), SCALE))

    __rmul__ = __mul__

    def __truediv__(self, other: Interval | int) -> Interval:
        other = as_interval(other)
        if other.lo <= 0 <= other.hi:
            raise ArithmeticError("division interval contains zero")
        values = [Fraction(a * SCALE, b) for a in (self.lo, self.hi)
                  for b in (other.lo, other.hi)]
        low, high = min(values), max(values)
        return Interval(low.numerator // low.denominator,
                        ceildiv(high.numerator, high.denominator))

    def overlaps(self, other: Interval) -> bool:
        return self.lo <= other.hi and other.lo <= self.hi

    def display(self) -> list[float]:
        return [self.lo / SCALE, self.hi / SCALE]


def as_interval(x: Interval | int) -> Interval:
    return x if isinstance(x, Interval) else Interval.rational(x)


def atan_reciprocal(n: int) -> Interval:
    # Alternating series: consecutive partial sums bracket arctan(1/n).
    total = sum((Fraction((-1) ** k, (2*k+1) * n**(2*k+1))
                 for k in range(100)), Fraction(0))
    next_term = Fraction(1, 201 * n**201)
    low = Interval.rational(total)
    high = Interval.rational(total + next_term)
    return Interval(low.lo, high.hi)


# Machin's identity pi/4 = 4 arctan(1/5) - arctan(1/239).
PI = 16 * atan_reciprocal(5) - 4 * atan_reciprocal(239)


def trig(degrees: int | Fraction, cosine: bool = False) -> Interval:
    degrees = (Fraction(degrees) + 180) % 360 - 180
    x = PI * Interval.rational(degrees / 180)
    result = Interval.rational(0)
    power = Interval.rational(1) if cosine else x
    start = 0 if cosine else 1
    for k in range(70):
        exponent = start + 2*k
        result += power * ((-1) ** k) / math.factorial(exponent)
        power = power * x * x
    # Taylor polynomial through degree 139 (sin) or 138 (cos).
    # |x| <= pi < 4; the next Taylor remainder is <= 4**n/n!.
    degree = start + 138
    error = Interval.rational(Fraction(4**(degree+1), math.factorial(degree+1)))
    return Interval(result.lo - error.hi, result.hi + error.hi)


Point = tuple[Interval, Interval]


def add(p: Point, q: Point) -> Point:
    return p[0]+q[0], p[1]+q[1]


def sub(p: Point, q: Point) -> Point:
    return p[0]-q[0], p[1]-q[1]


def scale(a: Interval, p: Point) -> Point:
    return a*p[0], a*p[1]


def unit(degrees: int | Fraction) -> Point:
    return trig(degrees, True), trig(degrees)


def dot(p: Point, q: Point) -> Interval:
    return p[0]*q[0] + p[1]*q[1]


def cross(p: Point, q: Point) -> Interval:
    return p[0]*q[1] - p[1]*q[0]


def distance_squared(p: Point, q: Point) -> Interval:
    d = sub(p, q)
    return dot(d, d)


def rotate(p: Point, degrees: int) -> Point:
    c, s = unit(degrees)
    return c*p[0]-s*p[1], s*p[0]+c*p[1]


def max_overlap(intervals: list[Interval]) -> int:
    events = [(x.lo, 1) for x in intervals] + [(x.hi, -1) for x in intervals]
    current = answer = 0
    for _, change in sorted(events, key=lambda e: (e[0], -e[1])):
        current += change
        answer = max(answer, current)
    return answer


def verify() -> dict:
    zero, one = Interval.rational(0), Interval.rational(1)
    points = {"O": (zero, zero), "V": (one, zero), "W": unit(80),
              "a": unit(1), "u": unit(70), "v": unit(79)}
    rho1, rho2 = 2*trig(35), 2*trig(Fraction(79, 2))
    for name, angle in zip(("b1", "b2", "b3"), (165, 166, 167)):
        points[name] = add(points["V"], scale(rho1, unit(angle)))
    for name, angle in zip(("c1", "c2", "c3"),
                           (Fraction(693, 5), Fraction(694, 5), 139)):
        points[name] = add(points["V"], scale(rho2, unit(angle)))
    center = (one/2, (1-trig(80, True))/(2*trig(80)))
    for name, angle in (("P", 30), ("Q", 60), ("R", 45)):
        points[name] = add(center, scale(Interval.rational(Fraction(999, 1000)),
                                        rotate(scale(-one, center), angle)))

    # An arbitrary candidate order is sufficient: every supporting edge is
    # then checked against every other point with a strict rational margin.
    centroid = tuple(sum(p[i].lo+p[i].hi for p in points.values()) /
                     (2*SCALE*len(points)) for i in (0, 1))
    order = sorted(points, key=lambda n: math.atan2(
        (points[n][1].lo+points[n][1].hi)/(2*SCALE)-centroid[1],
        (points[n][0].lo+points[n][0].hi)/(2*SCALE)-centroid[0]))
    determinants = []
    for a, b in zip(order, order[1:]+order[:1]):
        for c in order:
            if c not in (a, b):
                det = cross(sub(points[b], points[a]), sub(points[c], points[a]))
                assert det.lo > 0, ("strict convexity", a, b, c, det.display())
                determinants.append(det.lo)

    # O,V,W are exactly on this circle by the circumcenter formula.
    # All other disk inclusions, including P,Q,R, are strict.
    radius_squared = dot(center, center)
    disk_gaps = {}
    for name, p in points.items():
        if name not in {"O", "V", "W"}:
            gap = radius_squared - distance_squared(p, center)
            assert gap.lo > 0, ("MEC disk", name, gap.display())
            disk_gaps[name] = gap.lo
    apex_inner = []
    for a, b, c in (("O", "V", "W"), ("V", "O", "W"), ("W", "O", "V")):
        inner = dot(sub(points[b], points[a]), sub(points[c], points[a]))
        assert inner.lo > 0
        apex_inner.append(inner.lo)

    caps = {}
    for apex, a, b in (("O", "V", "W"), ("V", "O", "W"), ("W", "O", "V")):
        side = cross(sub(points[b], points[a]), sub(points[apex], points[a]))
        assert side.lo > 0 or side.hi < 0
        interior = []
        for name, p in points.items():
            if name in (a, b):
                continue  # These are the exact boundary endpoints.
            product = side * cross(sub(points[b], points[a]), sub(p, points[a]))
            assert product.lo > 0 or product.hi < 0, ("cap side", apex, name)
            if product.hi < 0:
                interior.append(name)
        caps[apex] = sorted(interior)
    assert set(caps["O"]) == {"a", "u", "v"}
    assert [len(caps[k])+2 for k in ("O", "V", "W")] == [5, 8, 5]

    # Exhaust all triples of the exactly three MEC-boundary points. Acute
    # triples are the only supporting triangles here: every rejected triple
    # has a certified negative vertex inner product, with no zero case.
    supporting_triangles = []
    boundary_names = ("O", "V", "W")
    for triangle in combinations(boundary_names, 3):
        inners = [dot(sub(points[b], points[a]), sub(points[c], points[a]))
                  for a, b, c in (triangle, triangle[1:]+triangle[:1],
                                  triangle[2:]+triangle[:2])]
        assert all(x.lo > 0 or x.hi < 0 for x in inners)
        if any(x.hi < 0 for x in inners):
            continue
        counts = []
        for apex in triangle:
            a, b = [x for x in triangle if x != apex]
            side = cross(sub(points[b], points[a]), sub(points[apex], points[a]))
            count = 2
            for name, p in points.items():
                if name in (a, b):
                    continue
                product = side * cross(sub(points[b], points[a]), sub(p, points[a]))
                assert product.lo > 0 or product.hi < 0
                count += product.hi < 0
            counts.append(count)
        assert "V" in triangle and "W" in triangle
        assert 5 in counts and counts.count(4) < 2
        supporting_triangles.append({"vertices": list(triangle), "closed_cap_counts": counts})
    assert len(supporting_triangles) == 1

    exact_rich = {"O": [(one, {"V", "W", "a", "u", "v"})],
                  "V": [(rho1*rho1, {"u", "b1", "b2", "b3"}),
                        (rho2*rho2, {"v", "c1", "c2", "c3"})]}
    all_distances = {a: {b: distance_squared(p, q) for b, q in points.items() if a != b}
                     for a, p in points.items()}
    for apex, classes in exact_rich.items():
        for radius, members in classes:
            for name, value in all_distances[apex].items():
                if name in members:
                    # Identity is supplied by the construction; interval
                    # overlap is only a consistency check of its encoding.
                    assert value.overlaps(radius)
                else:
                    assert not value.overlaps(radius), ("unexpected radius hit", apex, name)
        intended = set().union(*(members for _, members in classes))
        rest = [v for n, v in all_distances[apex].items() if n not in intended]
        assert max_overlap(rest) < 4
    assert not (rho1*rho1).overlaps(rho2*rho2)
    overlaps = {a: max_overlap(list(ds.values())) for a, ds in all_distances.items()}
    failures = [a for a in points if a not in exact_rich]
    assert all(overlaps[a] <= 2 for a in failures), overlaps

    chords = {}
    for a, b in (("a", "u"), ("a", "v"), ("u", "v")):
        d = all_distances[a][b]
        assert (d.hi < SCALE if a == "u" else d.lo > SCALE)
        chords[f"{a},{b}"] = d.display()

    robust_apices = [apex for apex, classes in exact_rich.items()
                     if all(any(len(members-{deleted}) >= 4 for _, members in classes)
                            for deleted in points)]
    assert robust_apices == ["O", "V"]
    interior = sorted(set(caps["O"]) & exact_rich["O"][0][1])
    pair_deletions = []
    short_pairs, bad_pairs, admissible_pairs = [], [], []
    for a, b in combinations(interior, 2):
        deleted = {a, b}
        surviving_sizes = [len(members-deleted) for _, members in exact_rich["V"]]
        # All other ambient classes have fewer than four members and cannot
        # grow under deletion, as checked above. These are all K4 candidates.
        survives = any(size >= 4 for size in surviving_sizes)
        pair = [a, b]
        (admissible_pairs if survives else bad_pairs).append(pair)
        dsq = all_distances[a][b]
        assert dsq.hi < SCALE or dsq.lo > SCALE
        if dsq.hi < SCALE:
            short_pairs.append(pair)
        pair_deletions.append({"pair": pair, "V_class_sizes_after_deletion": surviving_sizes,
                               "V_K4_survives": survives})
    assert short_pairs == bad_pairs == [["u", "v"]]
    assert len(admissible_pairs) == 2
    minimum_pairs = [p for p in admissible_pairs
                     if all(p == q or all_distances[p[0]][p[1]].hi <
                            all_distances[q[0]][q[1]].lo for q in admissible_pairs)]
    assert minimum_pairs == [["a", "u"]]

    report = {
        "schema": "exactfive-three-anchor-control/v1",
        "status": "PASS: finite interval-verified local control; global K4 fails",
        "point_count": len(points), "cyclic_order": order,
        "strict_cap_interiors_by_opposite_apex": caps,
        "MEC_boundary_points": list(boundary_names),
        "MEC_boundary_triples_checked": 1,
        "nonobtuse_MEC_supporting_triangles": supporting_triangles,
        "M44_supporting_triangles": [],
        "first_apex_class": sorted(exact_rich["O"][0][1]),
        "second_apex_classes": [sorted(m) for _, m in exact_rich["V"]],
        "squared_chords": chords, "sole_short_and_bad_pair": short_pairs[0],
        "singleton_robust_apices": robust_apices,
        "interior_pair_deletions": pair_deletions,
        "minimum_admissible_pairs_unordered": minimum_pairs,
        "global_K4_failing_centers": failures,
        "radius_multiplicity_upper_bounds": overlaps,
        "interval_units_denominator": str(SCALE),
        "strict_convexity_determinant_lower_numerator": str(min(determinants)),
        "MEC_strict_disk_gap_lower_numerator": str(min(disk_gaps.values())),
        "triangle_inner_product_lower_numerator": str(min(apex_inner)),
        "exact_identity_basis": ["sin^2(t)+cos^2(t)=1",
                                 "2-2*cos(t)=4*sin^2(t/2)",
                                 "rotation preserves squared norm",
                                 "explicit circumcenter formula"],
        "scope_exclusions": ["no global K4", "no total CriticalShellSystem",
                             "no CounterexampleData or global minimality",
                             "no Lean proof or physical terminal reduction"],
    }
    # Confirm the unique minimum among the two admissible pairs, without
    # inferring strict order from rounded display values.
    assert all_distances["a"]["u"].hi < all_distances["a"]["v"].lo
    report["verifier_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    return report


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--check", type=Path)
    args = parser.parse_args()
    report = verify()
    encoded = json.dumps(report, indent=2, sort_keys=True)+"\n"
    if args.out:
        args.out.write_text(encoded)
    if args.check:
        assert args.check.read_text() == encoded, "retained report differs from replay"
    print(report["status"])
    print(f"{report['point_count']} points; {len(report['global_K4_failing_centers'])} global-K4 failures")
    if args.out:
        print(args.out)


if __name__ == "__main__":
    main()
