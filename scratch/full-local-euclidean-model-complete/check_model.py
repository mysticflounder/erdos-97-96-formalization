#!/usr/bin/env python3
"""Exact rational checker for the complete four-class local Euclidean model."""

from fractions import Fraction as Q
from itertools import combinations

Point = tuple[Q, Q]


def unit(t: Q) -> Point:
    """Rational parametrization of the unit circle."""
    den = 1 + t * t
    return ((1 - t * t) / den, 2 * t / den)


def add(p: Point, q: Point) -> Point:
    return (p[0] + q[0], p[1] + q[1])


def sub(p: Point, q: Point) -> Point:
    return (p[0] - q[0], p[1] - q[1])


def scale(k: Q, p: Point) -> Point:
    return (k * p[0], k * p[1])


def rotate(p: Point, t: Q) -> Point:
    """Rotate by the rational unit complex number unit(t)."""
    c, s = unit(t)
    return (c * p[0] - s * p[1], s * p[0] + c * p[1])


def dot(p: Point, q: Point) -> Q:
    return p[0] * q[0] + p[1] * q[1]


def cross(p: Point, q: Point) -> Q:
    return p[0] * q[1] - p[1] * q[0]


def orient(a: Point, b: Point, c: Point) -> Q:
    return cross(sub(b, a), sub(c, a))


def dist2(a: Point, b: Point) -> Q:
    delta = sub(a, b)
    return dot(delta, delta)


O: Point = (Q(0), Q(0))
R1 = Q(10)
R2 = Q(431, 43)

# The two pairs in the strict cap.
a = scale(R1, unit(Q(-7, 10)))
b = scale(R1, unit(Q(3, 17)))
u = scale(R2, unit(Q(-4, 11)))
v = scale(R2, unit(Q(7, 10)))

# Since |a|=|b| and |u|=|v|, any multiples of a+b and u+v
# lie on the respective perpendicular bisectors.
c = scale(Q(7, 11), add(a, b))
d = scale(Q(5, 6), add(u, v))

# Two further points in each apex-centered distance class.
i = scale(R1, unit(Q(88, 97)))
j = scale(R1, unit(Q(73, 87)))
k = scale(R2, unit(Q(59, 67)))
l = scale(R2, unit(Q(86, 95)))

# Two further points in each blocker-centered distance class.  Rational
# rotations preserve the squared lengths of a-c and u-d.
e = add(c, rotate(sub(a, c), Q(-48, 91)))
f = add(c, rotate(sub(a, c), Q(-9, 95)))
g = add(d, rotate(sub(u, d), Q(-1)))
h = add(d, rotate(sub(u, d), Q(-27, 32)))

P: dict[str, Point] = {
    "O": O,
    "e": e,
    "f": f,
    "a": a,
    "u": u,
    "c": c,
    "d": d,
    "b": b,
    "v": v,
    "j": j,
    "k": k,
    "l": l,
    "i": i,
    "g": g,
    "h": h,
}

HULL = ("O", "e", "f", "a", "u", "c", "d", "b", "v", "j", "k", "l", "i", "g", "h")
CAP = ("a", "u", "c", "d", "b", "v")
OUTSIDE = ("O", "e", "f", "j", "k", "l", "i", "g", "h")


def class_at(center: str, representative: str) -> set[str]:
    radius2 = dist2(P[center], P[representative])
    return {
        name
        for name in P
        if name != center and dist2(P[center], P[name]) == radius2
    }


def distance_classes(center: str, omitted: str | None = None) -> list[set[str]]:
    """All positive-radius classes at a named center, optionally after deletion."""
    classes: dict[Q, set[str]] = {}
    for name in P:
        if name == center or name == omitted:
            continue
        classes.setdefault(dist2(P[center], P[name]), set()).add(name)
    return list(classes.values())


def pinned_multiplicity(center: str, omitted: str | None = None) -> int:
    return max(map(len, distance_classes(center, omitted)), default=0)


def circumcircle(x: str, y: str, z: str) -> tuple[Point, Q]:
    """Exact circumcenter and squared radius of three noncollinear points."""
    (ax, ay), (bx, by), (cx, cy) = P[x], P[y], P[z]
    denominator = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
    assert denominator != 0
    ux = (
        (ax * ax + ay * ay) * (by - cy)
        + (bx * bx + by * by) * (cy - ay)
        + (cx * cx + cy * cy) * (ay - by)
    ) / denominator
    uy = (
        (ax * ax + ay * ay) * (cx - bx)
        + (bx * bx + by * by) * (ax - cx)
        + (cx * cx + cy * cy) * (bx - ax)
    ) / denominator
    center = (ux, uy)
    return center, dist2(center, P[x])


def enclosing_circle_candidates() -> list[tuple[Q, tuple[str, ...], Point]]:
    """All exact two- and three-point circles containing the carrier."""
    candidates: list[tuple[Q, tuple[str, ...], Point]] = []
    for x, y in combinations(P, 2):
        center = scale(Q(1, 2), add(P[x], P[y]))
        radius2 = dist2(center, P[x])
        if all(dist2(center, point) <= radius2 for point in P.values()):
            candidates.append((radius2, (x, y), center))
    for x, y, z in combinations(P, 3):
        center, radius2 = circumcircle(x, y, z)
        if all(dist2(center, point) <= radius2 for point in P.values()):
            candidates.append((radius2, (x, y, z), center))
    return candidates


def main() -> None:
    assert len(P) == 15
    assert len(set(P.values())) == 15

    # One strict cap, with all nine remaining carrier points strictly outside.
    separator = Q(3)
    assert all(P[name][0] > separator for name in CAP)
    assert all(P[name][0] < separator for name in OUTSIDE)
    assert tuple(name for name in HULL if name in CAP) == CAP

    # Exact squared radii.
    assert dist2(O, a) == dist2(O, b) == dist2(O, i) == dist2(O, j) == Q(100)
    assert (
        dist2(O, u)
        == dist2(O, v)
        == dist2(O, k)
        == dist2(O, l)
        == Q(185761, 1849)
    )
    assert (
        dist2(c, a)
        == dist2(c, b)
        == dist2(c, e)
        == dist2(c, f)
        == Q(6500, 121)
    )
    assert (
        dist2(d, u)
        == dist2(d, v)
        == dist2(d, g)
        == dist2(d, h)
        == Q(27882168817, 339692733)
    )

    # Carrier-level exact-cardinality audit: no unwanted fifth point belongs
    # to any of the four designated distance classes.
    assert class_at("O", "a") == {"a", "b", "i", "j"}
    assert class_at("O", "u") == {"u", "v", "k", "l"}
    assert class_at("c", "a") == {"a", "b", "e", "f"}
    assert class_at("d", "u") == {"u", "v", "g", "h"}

    # Full target audit: K4 is required at every carrier center.  It holds at
    # only three centers, and all twelve remaining centers are completely
    # generic (every positive distance occurs just once).
    multiplicities = {name: pinned_multiplicity(name) for name in HULL}
    assert multiplicities == {
        "O": 4,
        "e": 1,
        "f": 1,
        "a": 1,
        "u": 1,
        "c": 4,
        "d": 4,
        "b": 1,
        "v": 1,
        "j": 1,
        "k": 1,
        "l": 1,
        "i": 1,
        "g": 1,
        "h": 1,
    }

    # The only full four-classes centered in the carrier are the designated
    # four.  Requiring both a shell through q and deletion-blocking at its
    # center leaves legal source-to-center pairs for only eight sources.
    legal_critical_centers: dict[str, set[str]] = {}
    for source in HULL:
        legal_critical_centers[source] = {
            center
            for center in HULL
            if source != center
            and any(
                len(distance_class) == 4 and source in distance_class
                for distance_class in distance_classes(center)
            )
            and pinned_multiplicity(center, source) < 4
        }
    assert legal_critical_centers == {
        "O": set(),
        "e": {"c"},
        "f": {"c"},
        "a": {"c"},
        "u": {"d"},
        "c": set(),
        "d": set(),
        "b": {"c"},
        "v": {"d"},
        "j": set(),
        "k": set(),
        "l": set(),
        "i": set(),
        "g": {"d"},
        "h": {"d"},
    }

    # A carrier center is fully deletion-robust precisely when every
    # single-point deletion leaves a four-class at that center.
    robust_centers = {
        center
        for center in HULL
        if all(pinned_multiplicity(center, source) >= 4 for source in HULL)
    }
    assert robust_centers == {"O"}
    rich_centers = {
        center
        for center in HULL
        if pinned_multiplicity(center) >= 6
        or sum(len(distance_class) >= 4 for distance_class in distance_classes(center)) >= 2
    }
    assert rich_centers == {"O"}
    assert len(HULL) <= 4 * (len(HULL) - len(robust_centers))

    # For the ad hoc local triple (O,c,d), no carrier center is equidistant
    # from all three.  This is not a production Moser-triangle field because
    # the MEC packet below does not exist.
    assert not any(
        dist2(P[center], O)
        == dist2(P[center], c)
        == dist2(P[center], d)
        for center in HULL
    )

    # The actual minimum enclosing circle is the diameter circle on {a,l}.
    # Its boundary has only those two points, so the circumscribed-three-point
    # branch required by SurplusCapPacket.hCirc is unavailable.
    mec_radius2, mec_support, mec_center = min(
        enclosing_circle_candidates(), key=lambda candidate: candidate[0]
    )
    assert mec_support == ("a", "l")
    assert mec_center == (Q(464725281, 210418694), Q(706910, 2446729))
    assert mec_radius2 == Q(1724034771729, 18096007684)
    assert {
        name for name in HULL if dist2(mec_center, P[name]) == mec_radius2
    } == {"a", "l"}

    # Strong strict-convexity certificate: every directed hull edge has every
    # nonincident carrier point strictly in its open left half-plane.
    edge_determinants: list[Q] = []
    n = len(HULL)
    for index, left_name in enumerate(HULL):
        right_name = HULL[(index + 1) % n]
        for name in HULL:
            if name not in (left_name, right_name):
                determinant = orient(P[left_name], P[right_name], P[name])
                assert determinant > 0
                edge_determinants.append(determinant)

    # Independent order certificate for all C(15,3)=455 triples.
    triple_determinants = [
        orient(P[x], P[y], P[z]) for x, y, z in combinations(HULL, 3)
    ]
    assert all(determinant > 0 for determinant in triple_determinants)

    print("PASS: complete exact rational four-class Euclidean model")
    print(f"hull order: {' '.join(HULL)}")
    print(f"strict cap x > 3: {' '.join(CAP)}")
    print(f"outside x < 3: {' '.join(OUTSIDE)}")
    print("O-radius 1 class: a b i j; squared radius 100")
    print("O-radius 2 class: u v k l; squared radius 185761/1849")
    print("c-shell class: a b e f; squared radius 6500/121")
    print("d-shell class: u v g h; squared radius 27882168817/339692733")
    print("pinned multiplicities: " + " ".join(
        f"{name}={multiplicities[name]}" for name in HULL
    ))
    print("fully deletion-robust carrier centers: O")
    print("ApexRichClassStructure carrier centers: O")
    print("raw not-robust cover count: 15 <= 4*14")
    print("ad hoc triple O,c,d: no carrier center is equidistant from all three")
    print("legal critical-shell source->center pairs: "
          "e->c f->c a->c u->d b->c v->d g->d h->d")
    print("sources with no legal critical-shell row: O c d i j k l")
    print("MEC support: a l (diameter branch)")
    print(f"MEC center: {mec_center}; squared radius: {mec_radius2}")
    print(f"checked {len(edge_determinants)} exact positive supporting-edge determinants")
    print(f"checked {len(triple_determinants)} exact positive ordered-triple determinants")
    print(f"minimum exact determinant: {min(triple_determinants)}")
    print("coordinates:")
    for name in HULL:
        print(f"  {name}: {P[name]}")


if __name__ == "__main__":
    main()
