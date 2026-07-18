#!/usr/bin/env python3
"""Independent exact replay of a three-complete-row Euclidean/MEC model.

All coordinates are reconstructed over ``Fraction`` from rational tangent
half-angle, blocker, and rotation parameters.  No optimizer, SMT solver, or
floating-point predicate is imported.
"""

from __future__ import annotations

from fractions import Fraction as F
import hashlib
import json


Point = tuple[F, F]


T_APEX = F(15091, 15143)
T_SOURCE = (F(943, 92200), F(9643, 22662), F(194, 199))
BLOCKER_SCALE = (F(12637, 25058), F(45957, 91523), F(66359, 95986))
TARGET_ROTATION = (
    F(-12151, 50741),
    F(-11188, 69765),
    F(-364045, 54493),
    F(-58655, 15086),
    F(42572, 38447),
    F(88847, 40943),
)
CAP_BULGE = F(1, 1000)
CAP_INSERTION = (F(1, 10), F(1, 5))
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))


def add(a: Point, b: Point) -> Point:
    return a[0] + b[0], a[1] + b[1]


def sub(a: Point, b: Point) -> Point:
    return a[0] - b[0], a[1] - b[1]


def scale(c: F, a: Point) -> Point:
    return c * a[0], c * a[1]


def unit(t: F) -> Point:
    denominator = 1 + t * t
    return (1 - t * t) / denominator, 2 * t / denominator


def rotate(a: Point, t: F) -> Point:
    denominator = 1 + t * t
    cosine = (1 - t * t) / denominator
    sine = 2 * t / denominator
    return cosine * a[0] - sine * a[1], sine * a[0] + cosine * a[1]


def sqdist(a: Point, b: Point) -> F:
    delta = sub(a, b)
    return delta[0] * delta[0] + delta[1] * delta[1]


def outward_bulge(a: Point, b: Point, t: F, epsilon: F) -> Point:
    """Rational point just outside the oriented edge ``a -> b``."""
    point_on_edge = add(scale(1 - t, a), scale(t, b))
    right_normal = (b[1] - a[1], a[0] - b[0])
    return add(point_on_edge, scale(epsilon, right_normal))


def cross(a: Point, b: Point, c: Point) -> F:
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def construct() -> dict[str, Point]:
    o = (F(0), F(0))
    left = (F(1), F(0))
    right = unit(T_APEX)
    sources = [unit(t) for t in T_SOURCE]
    blockers = [
        scale(BLOCKER_SCALE[row], add(sources[first], sources[second]))
        for row, (first, second) in enumerate(ROW_PAIRS)
    ]
    points: dict[str, Point] = {
        "o": o,
        "left": left,
        "q0": sources[0],
        "b0": blockers[0],
        "b2": blockers[2],
        "q1": sources[1],
        "b1": blockers[1],
        "q2": sources[2],
        "right": right,
    }
    for row, (first, _) in enumerate(ROW_PAIRS):
        radius_vector = sub(sources[first], blockers[row])
        for slot in range(2):
            rotation = TARGET_ROTATION[2 * row + slot]
            points[f"x{row}{slot}"] = add(blockers[row], rotate(radius_vector, rotation))
    points["zR"] = outward_bulge(
        points["right"], points["x10"], CAP_INSERTION[0], CAP_BULGE
    )
    points["zO"] = outward_bulge(
        points["x11"], points["o"], CAP_INSERTION[1], CAP_BULGE
    )
    return points


def minimum(values: list[F]) -> F:
    assert values
    return min(values)


def main() -> None:
    points = construct()
    order = (
        "o", "x20", "x00", "x01", "x21", "left", "q0", "b0",
        "b2", "q1", "b1", "q2", "right", "zR", "x10", "x11", "zO",
    )
    assert set(order) == set(points)

    hull = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for name in order:
            if name not in (first, second):
                hull.append(cross(points[first], points[second], points[name]))
    assert all(value > 0 for value in hull)

    pair_gaps = [
        sqdist(points[first], points[second])
        for i, first in enumerate(order)
        for second in order[:i]
    ]
    assert all(value > 0 for value in pair_gaps)

    right = points["right"]
    mec_center = (F(1, 2), T_APEX / 2)
    mec_radius_sq = (1 + T_APEX * T_APEX) / 4
    mec_slacks = [
        mec_radius_sq - sqdist(mec_center, point)
        for name, point in points.items()
        if name not in ("o", "left", "right")
    ]
    assert all(value > 0 for value in mec_slacks)
    assert sqdist(mec_center, points["o"]) == mec_radius_sq
    assert sqdist(mec_center, points["left"]) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq

    # The support triangle is nonobtuse.  Its circumdisk is consequently its
    # minimum enclosing disk, and the strict slacks above put every other
    # named point in its interior.
    dot_at_o = right[0]
    dot_at_left = 1 - right[0]
    dot_at_right = 1 - right[0]
    assert dot_at_o > 0 and dot_at_left > 0 and dot_at_right > 0
    assert 0 < T_APEX < 1

    chord_sides = {
        name: cross(points["left"], right, point)
        for name, point in points.items()
        if name not in ("left", "right")
    }
    outside_names = {
        "o", "zR", "x00", "x01", "x10", "x11", "x20", "x21", "zO",
    }
    physical_names = {"q0", "b0", "b2", "q1", "b1", "q2"}
    assert all(chord_sides[name] > 0 for name in outside_names)
    assert all(chord_sides[name] < 0 for name in physical_names)

    physical_support = {"left", "q0", "q1", "q2", "right"}
    assert all(sqdist(points["o"], points[name]) == 1 for name in physical_support)
    physical_exclusion_gaps = [
        abs(sqdist(points["o"], point) - 1)
        for name, point in points.items()
        if name not in physical_support and name != "o"
    ]
    assert all(value > 0 for value in physical_exclusion_gaps)

    physical_other_sqdist = [
        sqdist(points["o"], point)
        for name, point in points.items()
        if name != "o" and name not in physical_support
    ]
    physical_other_radius_gaps = [
        abs(value - physical_other_sqdist[index])
        for index, value in enumerate(physical_other_sqdist)
        for value in physical_other_sqdist[:index]
    ]
    assert all(value > 0 for value in physical_other_radius_gaps)

    first_apex_sqdist = [
        sqdist(points["right"], point)
        for name, point in points.items()
        if name != "right"
    ]
    first_apex_sqdist_gaps = [
        abs(value - first_apex_sqdist[index])
        for index, value in enumerate(first_apex_sqdist)
        for value in first_apex_sqdist[:index]
    ]
    assert all(value > 0 for value in first_apex_sqdist_gaps)

    row_exclusion_gaps: list[F] = []
    row_radius_sq: list[F] = []
    return_gaps: list[F] = []
    for row, (first, second) in enumerate(ROW_PAIRS):
        center_name = f"b{row}"
        center = points[center_name]
        support = {f"q{first}", f"q{second}", f"x{row}0", f"x{row}1"}
        radius_sq = sqdist(center, points[f"q{first}"])
        row_radius_sq.append(radius_sq)
        assert radius_sq > 0
        assert all(sqdist(center, points[name]) == radius_sq for name in support)
        for name, point in points.items():
            if name not in support and name != center_name:
                gap = abs(sqdist(center, point) - radius_sq)
                assert gap > 0
                row_exclusion_gaps.append(gap)
        for other_apex in (points["left"], right):
            return_gap = abs(
                sqdist(other_apex, points[f"x{row}0"])
                - sqdist(other_apex, points[f"x{row}1"])
            )
            assert return_gap > 0
            return_gaps.append(return_gap)

    # The two rational strict insertions repair the former four-point cap.
    # The three support-triangle caps now have named sizes 8, 6, and 6, so the
    # local model meets the full large-cap cardinality surface.
    physical_cap = {"left", "q0", "b0", "b2", "q1", "b1", "q2", "right"}
    lower_cap = {"o", "x20", "x00", "x01", "x21", "left"}
    upper_cap = {"right", "zR", "x10", "x11", "zO", "o"}
    assert len(physical_cap) == 8 and len(lower_cap) == 6 and len(upper_cap) == 6

    serial = json.dumps(
        {
            name: [str(point[0]), str(point[1])]
            for name, point in sorted(points.items())
        },
        sort_keys=True,
        separators=(",", ":"),
    ).encode()
    payload = {
        "status": "EXACT_RATIONAL_LOCAL_EUCLIDEAN_MEC_COUNTERMODEL",
        "point_count": len(points),
        "cyclic_order": list(order),
        "physical_cap_named_card": len(physical_cap),
        "other_large_cap_named_card": len(lower_cap),
        "third_large_cap_named_card": len(upper_cap),
        "full_L_large_cap_cardinality_surface": True,
        "minimum_strict_hull_margin": str(minimum(hull)),
        "minimum_pair_sqdist": str(minimum(pair_gaps)),
        "minimum_mec_interior_slack": str(minimum(mec_slacks)),
        "minimum_physical_exact_class_gap": str(minimum(physical_exclusion_gaps)),
        "minimum_physical_other_pairwise_radius_gap": str(
            minimum(physical_other_radius_gaps)
        ),
        "minimum_first_apex_pairwise_radius_gap": str(minimum(first_apex_sqdist_gaps)),
        "minimum_row_exact_class_gap": str(minimum(row_exclusion_gaps)),
        "minimum_either_adjacent_apex_nonreturn_sqdist_gap": str(minimum(return_gaps)),
        "row_radius_sq": [str(value) for value in row_radius_sq],
        "coordinate_sha256": hashlib.sha256(serial).hexdigest(),
        "omitted": [
            "global CounterexampleData.K4",
            "total CriticalShellSystem outside the three displayed sources",
            "deletion minimality",
            "noM44",
            "retained first-apex selected rows",
        ],
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
