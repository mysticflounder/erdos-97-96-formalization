#!/usr/bin/env python3
"""Exact Q(sqrt(3)) regression for the card-ge-14 canonical escape.

The model tests the nonlinear MEC/cap/full-radius-class layer.  It is not a
Problem 97 counterexample: global K4, the total critical-shell map, and
minimality are deliberately not asserted.
"""

from __future__ import annotations

from dataclasses import dataclass
from fractions import Fraction as F


@dataclass(frozen=True)
class Q3:
    """The exact real number a + b*sqrt(3)."""

    a: F = F(0)
    b: F = F(0)

    def __add__(self, other: Q3 | int | F) -> Q3:
        other = lift(other)
        return Q3(self.a + other.a, self.b + other.b)

    __radd__ = __add__

    def __neg__(self) -> Q3:
        return Q3(-self.a, -self.b)

    def __sub__(self, other: Q3 | int | F) -> Q3:
        return self + (-lift(other))

    def __rsub__(self, other: Q3 | int | F) -> Q3:
        return lift(other) - self

    def __mul__(self, other: Q3 | int | F) -> Q3:
        other = lift(other)
        return Q3(
            self.a * other.a + 3 * self.b * other.b,
            self.a * other.b + self.b * other.a,
        )

    __rmul__ = __mul__

    def __truediv__(self, other: int | F) -> Q3:
        other = F(other)
        return Q3(self.a / other, self.b / other)

    def __str__(self) -> str:
        return f"({self.a})+({self.b})sqrt(3)"


def lift(x: Q3 | int | F) -> Q3:
    return x if isinstance(x, Q3) else Q3(F(x), F(0))


def sign(x: Q3) -> int:
    """Exact sign by rational comparison after one squaring."""

    a, b = x.a, x.b
    if b == 0:
        return (a > 0) - (a < 0)
    if a == 0:
        return (b > 0) - (b < 0)
    if a > 0 and b > 0:
        return 1
    if a < 0 and b < 0:
        return -1
    if a > 0:
        return (a * a > 3 * b * b) - (a * a < 3 * b * b)
    return (3 * b * b > a * a) - (3 * b * b < a * a)


Point = tuple[Q3, Q3]
S3 = Q3(F(0), F(1))
ZERO: Point = (Q3(), Q3())


def add(p: Point, q: Point) -> Point:
    return p[0] + q[0], p[1] + q[1]


def sub(p: Point, q: Point) -> Point:
    return p[0] - q[0], p[1] - q[1]


def scale(t: F, p: Point) -> Point:
    return p[0] * t, p[1] * t


def dot(p: Point, q: Point) -> Q3:
    return p[0] * q[0] + p[1] * q[1]


def norm2(p: Point) -> Q3:
    return dot(p, p)


def dist2(p: Point, q: Point) -> Q3:
    return norm2(sub(p, q))


def cross(a: Point, b: Point, c: Point) -> Q3:
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def rotate120(p: Point) -> Point:
    x, y = p
    return -x / 2 - S3 * y / 2, S3 * x / 2 - y / 2


def rotate240(p: Point) -> Point:
    return rotate120(rotate120(p))


def rotate_rational(p: Point, t: F) -> Point:
    """Rotate by the rational half-angle parameter t."""

    denominator = 1 + t * t
    cosine = F(1) - t * t
    sine = 2 * t
    x, y = p
    return (cosine * x - sine * y) / denominator, (sine * x + cosine * y) / denominator


def outward_edge_insert(a: Point, b: Point, epsilon: F) -> Point:
    """Insert just right of the oriented CCW edge a--b."""

    d = sub(b, a)
    midpoint = scale(F(1, 2), add(a, b))
    right_normal = d[1], -d[0]
    return add(midpoint, scale(epsilon, right_normal))


A: Point = (Q3(F(1)), Q3())
B: Point = (Q3(F(-1, 2)), Q3(F(0), F(1, 2)))
C: Point = (Q3(F(-1, 2)), Q3(F(0), F(-1, 2)))

xAB: Point = (Q3(F(-1, 2), F(4, 5)), Q3(F(0), F(1, 10)))
yAB: Point = (Q3(F(-1, 2), F(7, 25)), Q3(F(0), F(23, 50)))
wAB: Point = (Q3(F(2, 5)), Q3(F(0), F(2, 5)))

xBC = rotate120(xAB)
yBC = rotate120(yAB)
xCA = rotate240(xAB)
yCA = rotate240(yAB)

# The middle strict BC point is put on A's radius-squared-three circle.
wBC: Point = (Q3(F(1), F(-1)), Q3())
# Its one-step rotation similarly enlarges B's radius-squared-three class.
wCA = rotate120(wBC)

# One further point in AB raises that closed cap to six.
gAB = outward_edge_insert(A, xAB, F(1, 200))
# A small exact rotation from B toward xBC, then a 120-degree transport,
# gives the fourth strict CA point on B's same radius-squared-three circle.
gBC_shell = add(A, rotate_rational(sub(B, A), F(1, 20)))
gCA = rotate120(gBC_shell)

POINTS: dict[str, Point] = {
    "A": A,
    "gAB": gAB,
    "xAB": xAB,
    "wAB": wAB,
    "yAB": yAB,
    "B": B,
    "xBC": xBC,
    "wBC": wBC,
    "yBC": yBC,
    "C": C,
    "gCA": gCA,
    "xCA": xCA,
    "wCA": wCA,
    "yCA": yCA,
}

ORDER = tuple(POINTS)


def distance_classes(center: str) -> dict[Q3, set[str]]:
    classes: dict[Q3, set[str]] = {}
    for name in ORDER:
        if name != center:
            classes.setdefault(dist2(POINTS[center], POINTS[name]), set()).add(name)
    return classes


def pair_owners(left: str, right: str) -> set[str]:
    return {
        center
        for center in ORDER
        if center not in {left, right}
        and dist2(POINTS[center], POINTS[left])
        == dist2(POINTS[center], POINTS[right])
    }


def on_arc_opposite(apex: str, left: str, right: str, point: str) -> bool:
    product = cross(POINTS[point], POINTS[left], POINTS[right]) * cross(
        POINTS[apex], POINTS[left], POINTS[right]
    )
    return sign(product) <= 0


def audit() -> dict[str, object]:
    assert len(set(POINTS.values())) == 14

    # Exact strict convexity: every nonincident point is strictly inside each
    # oriented boundary edge.
    supports: list[Q3] = []
    for i, left in enumerate(ORDER):
        right = ORDER[(i + 1) % len(ORDER)]
        for point in ORDER:
            if point in {left, right}:
                continue
            value = cross(POINTS[left], POINTS[right], POINTS[point])
            assert sign(value) > 0, (left, right, point, value)
            supports.append(value)

    # Unit MEC.  A,B,C are its only carrier boundary points.  Their positive
    # barycentric weights around zero certify radius minimality.
    disk_slacks = {name: Q3(F(1)) - norm2(point) for name, point in POINTS.items()}
    assert all(sign(value) >= 0 for value in disk_slacks.values())
    assert {name for name, value in disk_slacks.items() if value == Q3()} == {"A", "B", "C"}
    assert add(scale(F(1, 3), A), add(scale(F(1, 3), B), scale(F(1, 3), C))) == ZERO
    assert all(norm2(POINTS[name]) == Q3(F(1)) for name in ("A", "B", "C"))
    nonobtuse = {
        name: dot(sub(POINTS[left], POINTS[name]), sub(POINTS[right], POINTS[name]))
        for name, left, right in (("A", "B", "C"), ("B", "C", "A"), ("C", "A", "B"))
    }
    assert all(sign(value) > 0 for value in nonobtuse.values())

    cap_ab = set(ORDER[ORDER.index("A") : ORDER.index("B") + 1])
    cap_bc = set(ORDER[ORDER.index("B") : ORDER.index("C") + 1])
    cap_ca = set(ORDER[ORDER.index("C") :]) | {"A"}
    assert (len(cap_ab), len(cap_ca), len(cap_bc)) == (6, 6, 5)
    assert len(cap_ab) + len(cap_bc) + len(cap_ca) == len(ORDER) + 3
    # Literal production signed-area filters, not assigned role sets.
    assert {
        name for name in ORDER if on_arc_opposite("C", "A", "B", name)
    } == cap_ab
    assert {
        name for name in ORDER if on_arc_opposite("B", "C", "A", name)
    } == cap_ca
    assert {
        name for name in ORDER if on_arc_opposite("A", "B", "C", name)
    } == cap_bc

    # With exactly three MEC-boundary carrier points, every support triangle
    # is a permutation of A,B,C; its cap-cardinality multiset is {5,6,6}, so
    # no same-carrier (m,4,4) packet exists.
    mec_boundary = {name for name, value in disk_slacks.items() if value == Q3()}
    assert len(mec_boundary) == 3
    assert sorted((len(cap_ab), len(cap_bc), len(cap_ca))) == [5, 6, 6]

    # Both physical opposite apices are deletion robust.  A's exact five-class
    # saturates BC; B has a complete six-class saturating CA.
    class_a = distance_classes("A")
    class_b = distance_classes("B")
    expected_a = {"B", "xBC", "wBC", "yBC", "C"}
    expected_b = {"C", "gCA", "xCA", "wCA", "yCA", "A"}
    assert class_a[Q3(F(3))] == expected_a
    expected_b_six = {"C", "gCA", "xCA", "wCA", "yCA", "A"}
    assert class_b[Q3(F(3))] == expected_b_six
    assert all(len(points) < 4 for radius, points in class_a.items() if radius != Q3(F(3)))
    assert all(len(points) < 4 for radius, points in class_b.items() if radius != Q3(F(3)))
    assert all(len(expected_a - {deleted}) >= 4 for deleted in ORDER)
    assert all(len(expected_b_six - {deleted}) >= 4 for deleted in ORDER)

    # A concrete first-apex frontier pair.  Both members are outside the
    # surplus AB cap and co-radial at B.  Deleting them together leaves four
    # points at B and leaves A's exact five-class untouched.
    frontier_pair = {"xCA", "yCA"}
    assert frontier_pair <= expected_b_six - cap_ab
    assert len(expected_b_six - frontier_pair) == 4
    assert expected_a.isdisjoint(frontier_pair)
    assert len(expected_a - frontier_pair) == 5

    # Concrete q-deleted parent rows at the two physical centers.  Their
    # overlap and physical-strict-cap hit counts match the retained packet.
    q = "xCA"
    first_q_deleted_row = {"A", "C", "gCA", "wCA"}
    second_q_deleted_row = {"B", "C", "xBC", "wBC"}
    assert q in frontier_pair
    assert q not in first_q_deleted_row | second_q_deleted_row
    assert len(first_q_deleted_row) == len(second_q_deleted_row) == 4
    assert first_q_deleted_row <= expected_b_six
    assert second_q_deleted_row <= expected_a
    assert len(first_q_deleted_row & second_q_deleted_row) == 1
    strict_physical_cap = cap_bc - {"B", "C"}
    assert len(first_q_deleted_row & strict_physical_cap) == 0
    assert len(second_q_deleted_row & strict_physical_cap) == 2

    # Canonical (5,6,5) subcarrier: omit xAB from the four strict AB points.
    canonical = set(ORDER) - {"xAB"}
    canonical_ab = cap_ab & canonical
    canonical_ca = cap_ca & canonical
    canonical_bc = cap_bc & canonical
    assert len(canonical) == 13
    assert (len(canonical_ab), len(canonical_ca), len(canonical_bc)) == (5, 6, 5)

    # C has an exact source-critical four-shell.  It can be the faithful row
    # selected at C, and it escapes the canonical carrier at xAB.
    class_c = distance_classes("C")
    # wAB is off-shell, so the complete class remains exact four.
    c_critical_shell = {"A", "xAB", "yAB", "B"}
    assert class_c[Q3(F(3))] == c_critical_shell
    assert all(len(points) < 4 for radius, points in class_c.items() if radius != Q3(F(3)))
    assert "C" in canonical
    assert c_critical_shell - canonical == {"xAB"}
    assert "wAB" not in c_critical_shell

    # Treat A,yAB as two sources of the same local deletion-critical blocker C.
    # The escaping row contains them, but only at the old common blocker: no
    # distinct carrier center is equidistant from the pair.
    fiber_sources = {"A", "yAB"}
    assert fiber_sources <= c_critical_shell
    assert pair_owners("A", "yAB") == {"C"}
    for source in fiber_sources:
        after_delete = {
            radius: points - {source}
            for radius, points in class_c.items()
        }
        assert max(map(len, after_delete.values())) <= 3

    # Exact complete-class audit at every carrier center.  Only A,B,C have a
    # radius class of cardinality at least four in this scoped model.
    k4_centers = {
        center for center in ORDER
        if max(map(len, distance_classes(center).values())) >= 4
    }
    assert k4_centers == {"A", "B", "C"}
    # `OrderedCrossRowCore` uses six strict boundary positions, so its second
    # row center must differ from the first apex B, common blocker C, and both
    # fiber sources A,yAB.  No displayed K4 center has that role.
    ordered_center_candidates = k4_centers - {"A", "B", "C", "yAB"}
    assert not ordered_center_candidates

    return {
        "carrier_card": len(ORDER),
        "cap_profile_surplus_first_second": (len(cap_ab), len(cap_ca), len(cap_bc)),
        "mec_boundary": tuple(sorted(mec_boundary)),
        "no_m44": True,
        "physical_second_apex_exact_five": tuple(sorted(expected_a)),
        "first_apex_exact_six": tuple(sorted(expected_b_six)),
        "frontier_pair": tuple(sorted(frontier_pair)),
        "first_apex_after_double_deletion_card": len(expected_b_six - frontier_pair),
        "second_apex_after_double_deletion_card": len(expected_a - frontier_pair),
        "q_deleted_row_overlap": len(first_q_deleted_row & second_q_deleted_row),
        "q_deleted_first_row_physical_hits": len(first_q_deleted_row & strict_physical_cap),
        "q_deleted_second_row_physical_hits": len(second_q_deleted_row & strict_physical_cap),
        "canonical_card": len(canonical),
        "canonical_profile": (len(canonical_ab), len(canonical_ca), len(canonical_bc)),
        "escape_center": "C",
        "escape_points": tuple(sorted(c_critical_shell - canonical)),
        "critical_fiber_sources": tuple(sorted(fiber_sources)),
        "owners_of_fiber_pair": tuple(sorted(pair_owners("A", "yAB"))),
        "k4_centers": tuple(sorted(k4_centers)),
        "ordered_cross_row_center_candidates": tuple(sorted(ordered_center_candidates)),
        "strict_edge_tests": len(supports),
    }


if __name__ == "__main__":
    print("CARD_GE_14_NONLINEAR_ESCAPE_REGRESSION", audit())
    print("ALL_EXACT_QSQRT3_CHECKS_PASS")
