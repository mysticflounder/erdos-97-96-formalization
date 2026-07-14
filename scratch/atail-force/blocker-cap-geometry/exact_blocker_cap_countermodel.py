#!/usr/bin/env python3
"""Exact algebraic falsifier for localizing a robust ATAIL blocker.

All arithmetic is symbolic over the real algebraic numbers through SymPy.
No floating-point comparison is used by the checks.

The model retains the full local geometry relevant to the robust arm:

* 13 points in strict convex position;
* a non-obtuse circumscribed MEC triangle ``(C,O,A)``;
* its three closed hull caps, of sizes ``(6,5,5)``;
* a card-five class at the first apex ``O`` containing ``q=E,w=C``;
* single-deletion K4 survival for both q and w at the second apex ``A``;
* an exact four-shell ``{A,E,F,I}`` at the blocker ``D`` through q;
* deletion of q kills K4 at D, while deletion of w preserves that shell;
* ``dist(D,w) != dist(D,q)``; and
* D is a non-Moser point in the first opposite cap, outside the surplus cap.

It deliberately does not construct global K4 or a CriticalShellSystem at all
13 sources.  Thus it falsifies blocker localization from the complete
MEC/cap/no-M44 geometry plus the q-side robust packet, and pinpoints the first
possible additional input: global K4/criticality at another source.
"""

from __future__ import annotations

import argparse
from collections import defaultdict

import sympy as sp


Point = tuple[sp.Expr, sp.Expr]


def point(x: sp.Expr | int, y: sp.Expr | int) -> Point:
    return sp.sympify(x), sp.sympify(y)


def sub(a: Point, b: Point) -> Point:
    return sp.expand(a[0] - b[0]), sp.expand(a[1] - b[1])


def dot(a: Point, b: Point) -> sp.Expr:
    return sp.expand(a[0] * b[0] + a[1] * b[1])


def cross(o: Point, a: Point, b: Point) -> sp.Expr:
    oa = sub(a, o)
    ob = sub(b, o)
    return sp.expand(oa[0] * ob[1] - oa[1] * ob[0])


def squared_distance(a: Point, b: Point) -> sp.Expr:
    delta = sub(a, b)
    return sp.expand(delta[0] ** 2 + delta[1] ** 2)


def exact_zero(value: sp.Expr) -> bool:
    return sp.simplify(value) == 0


def exact_positive(value: sp.Expr) -> bool:
    result = sp.simplify(value).is_positive
    if result is not True:
        raise AssertionError(f"not proved positive: {sp.simplify(value)} ({result})")
    return True


def exact_nonnegative(value: sp.Expr) -> bool:
    simplified = sp.simplify(value)
    result = simplified.is_nonnegative
    if result is not True:
        raise AssertionError(f"not proved nonnegative: {simplified} ({result})")
    return True


def exact_nonpositive(value: sp.Expr) -> bool:
    simplified = sp.simplify(value)
    result = simplified.is_nonpositive
    if result is not True:
        raise AssertionError(f"not proved nonpositive: {simplified} ({result})")
    return True


def radius_profile(points: dict[str, Point], center: str, erased: set[str] | None = None) -> dict[sp.Expr, set[str]]:
    erased = erased or set()
    groups: list[tuple[sp.Expr, set[str]]] = []
    for name, value in points.items():
        if name == center or name in erased:
            continue
        radius = sp.simplify(squared_distance(points[center], value))
        if exact_zero(radius):
            continue
        for old_radius, names in groups:
            if exact_zero(radius - old_radius):
                names.add(name)
                break
        else:
            groups.append((radius, {name}))
    return {sp.simplify(radius): names for radius, names in groups}


def named_class(profile: dict[sp.Expr, set[str]], radius: sp.Expr) -> set[str]:
    for old_radius, names in profile.items():
        if exact_zero(old_radius - radius):
            return names
    return set()


def has_k4(profile: dict[sp.Expr, set[str]]) -> bool:
    return max((len(names) for names in profile.values()), default=0) >= 4


def build_points() -> dict[str, Point]:
    sqrt2 = sp.sqrt(2)
    sqrt3 = sp.sqrt(3)
    sqrt26 = sp.sqrt(26)
    return {
        "O": point(0, 0),
        "t1": point(sp.Rational(1, 200), sp.Rational(-1, 200)),
        "F": point(sp.Rational(12, 13), (5 - sqrt26) / 13),
        "t2": point(sp.Rational(19, 20), sp.Rational(-1, 200)),
        "A": point(1, 0),
        # A rational fourth point on the D-circle.  The older aligned-row
        # model used a radical point just outside the OAC circumdisk; this
        # replacement lies strictly inside that disk and remains a hull
        # vertex between t1 and F.
        "I": point(sp.Rational(1211, 1313), sp.Rational(-10, 1313)),
        "D": point(sp.Rational(12, 13), sp.Rational(5, 13)),
        "J": point(sp.Rational(4, 5), sp.Rational(3, 5)),
        "E": point(sp.Rational(119, 169), sp.Rational(120, 169)),
        "C": point(sp.Rational(1, 2), sqrt3 / 2),
        "G": point(1 - sqrt2 / 2, sqrt2 / 2),
        "K": point(sp.Rational(1, 5), sp.Rational(3, 5)),
        "H": point(1 - sqrt3 / 2, sp.Rational(1, 2)),
    }


def check() -> dict[str, object]:
    points = build_points()
    hull_order = ["O", "t1", "I", "F", "t2", "A", "D", "J", "E", "C", "G", "K", "H"]
    assert set(hull_order) == set(points)
    for index, name in enumerate(hull_order):
        first = points[name]
        second = points[hull_order[(index + 1) % len(hull_order)]]
        # Supporting-line certificate for the claimed strict hull order:
        # every other carrier point is strictly to the left of every oriented
        # boundary edge.  This is stronger than checking local turns only.
        for other_name, third in points.items():
            if other_name in {name, hull_order[(index + 1) % len(hull_order)]}:
                continue
            exact_positive(cross(first, second, third))

    # MEC triangle: v1=C (surplus apex), v2=O (first apex), v3=A.
    mec_center = point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_sq = sp.Rational(1, 3)
    boundary = {"C", "O", "A"}
    for name, value in points.items():
        defect = sp.simplify(mec_radius_sq - squared_distance(mec_center, value))
        if name in boundary:
            assert exact_zero(defect)
        else:
            exact_positive(defect)

    # The Moser triangle is equilateral, hence all vertex inner products are positive.
    for vertex, left, right in (("C", "O", "A"), ("O", "C", "A"), ("A", "C", "O")):
        exact_nonnegative(dot(sub(points[left], points[vertex]), sub(points[right], points[vertex])))

    surplus_cap = {"O", "t1", "I", "F", "t2", "A"}
    opposite_cap_1 = {"A", "D", "J", "E", "C"}
    opposite_cap_2 = {"C", "G", "K", "H", "O"}
    caps = (surplus_cap, opposite_cap_1, opposite_cap_2)
    assert [len(cap) for cap in caps] == [6, 5, 5]
    assert sum(map(len, caps)) == len(points) + 3
    assert set.union(*caps) == set(points)
    moser = {"C", "O", "A"}
    for name in points:
        multiplicity = sum(name in cap for cap in caps)
        assert multiplicity == (2 if name in moser else 1)

    # Exact oriented-arc membership, matching the project's OnArcOpposite
    # convention for the Moser triangle (v1,v2,v3)=(C,O,A).
    arc_specs = (
        ("C", "O", "A", surplus_cap),
        ("O", "A", "C", opposite_cap_1),
        ("A", "C", "O", opposite_cap_2),
    )
    for apex, endpoint_1, endpoint_2, cap in arc_specs:
        apex_area = cross(points[apex], points[endpoint_1], points[endpoint_2])
        for name, value in points.items():
            product = sp.expand(cross(value, points[endpoint_1], points[endpoint_2]) * apex_area)
            if name in cap:
                exact_nonpositive(product)
            else:
                exact_positive(product)

    q = "E"
    w = "C"
    blocker = "D"
    assert q not in surplus_cap and w not in surplus_cap
    assert blocker not in surplus_cap
    assert blocker not in moser
    assert blocker in opposite_cap_1

    first_profile = radius_profile(points, "O")
    first_radius_class = named_class(first_profile, sp.Integer(1))
    assert first_radius_class == {"A", "D", "J", "E", "C"}
    assert q in first_radius_class and w in first_radius_class

    second_profile = radius_profile(points, "A")
    second_radius_class = named_class(second_profile, sp.Integer(1))
    assert second_radius_class == {"O", "C", "G", "K", "H"}
    assert has_k4(radius_profile(points, "A", {q}))
    assert has_k4(radius_profile(points, "A", {w}))

    blocker_radius = sp.Rational(2, 13)
    blocker_profile = radius_profile(points, blocker)
    blocker_class = named_class(blocker_profile, blocker_radius)
    assert blocker_class == {"A", "E", "F", "I"}
    assert q in blocker_class and w not in blocker_class
    assert not has_k4(radius_profile(points, blocker, {q}))
    assert has_k4(radius_profile(points, blocker, {w}))
    assert not exact_zero(
        squared_distance(points[blocker], points[w])
        - squared_distance(points[blocker], points[q])
    )

    return {
        "arithmetic": "exact symbolic real algebraic arithmetic",
        "carrier_card": len(points),
        "strict_hull_order": hull_order,
        "mec_triangle": ["C", "O", "A"],
        "cap_cards": [len(cap) for cap in caps],
        "first_apex_card_five_class": sorted(first_radius_class),
        "second_apex_radius_one_class": sorted(second_radius_class),
        "blocker_exact_four_class": sorted(blocker_class),
        "q": q,
        "w": w,
        "blocker": blocker,
        "blocker_cap": "opposite_cap_1",
        "blocker_in_surplus_cap": False,
        "cross_deletion_at_blocker_survives": True,
        "source_deletion_at_blocker_survives": False,
        "scope": "all local MEC/cap/no-M44 and q-side robust facts; not global K4/CriticalShellSystem",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.parse_args()
    for key, value in check().items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
