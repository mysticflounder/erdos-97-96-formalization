#!/usr/bin/env python3
"""Exact rational regression for the source-as-successor-blocker cap core.

This verifies a cap-local Euclidean/MEC realization.  It is not a global K4,
critical-shell-system, minimality, or full-parent model.
"""

from __future__ import annotations

from fractions import Fraction as F


Point = tuple[F, F]


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def scale(k: F, a: Point) -> Point:
    return (k * a[0], k * a[1])


def dot(a: Point, b: Point) -> F:
    return a[0] * b[0] + a[1] * b[1]


def sqdist(a: Point, b: Point) -> F:
    return dot(sub(a, b), sub(a, b))


def cross(a: Point, b: Point, c: Point) -> F:
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def unit(t: F) -> Point:
    den = 1 + t * t
    return ((1 - t * t) / den, 2 * t / den)


def radius_class(points: dict[str, Point], center: str, through: str) -> set[str]:
    radius = sqdist(points[center], points[through])
    return {
        name for name, point in points.items()
        if sqdist(points[center], point) == radius
    }


def main() -> None:
    # Equal angular increments q0 -> q1 -> q2 use the rational rotation
    # with tangent-half-angle 1/5.  Hence q1 is equidistant from q0 and q2.
    points: dict[str, Point] = {
        "o": (F(0), F(0)),
        "left": unit(F(0)),
        "q0": unit(F(1, 10)),
        "q1": unit(F(15, 49)),
        "q2": unit(F(62, 115)),
        "right": unit(F(2, 3)),
    }
    lam = F(101, 200)
    points["c0"] = scale(lam, add(points["q0"], points["q1"]))
    points["c1"] = scale(lam, add(points["q1"], points["q2"]))

    boundary = ("o", "left", "q0", "c0", "q1", "c1", "q2", "right")
    cap = ("left", "q0", "c0", "q1", "c1", "q2", "right")

    assert len(set(points.values())) == len(points)

    hull_margins: list[F] = []
    for i, name_a in enumerate(boundary):
        name_b = boundary[(i + 1) % len(boundary)]
        for name, point in points.items():
            if name in (name_a, name_b):
                continue
            margin = cross(points[name_a], points[name_b], point)
            assert margin > 0
            hull_margins.append(margin)

    apex_side = cross(points["left"], points["right"], points["o"])
    cap_side_margins = [
        -cross(points["left"], points["right"], points[name])
        for name in cap[1:-1]
    ]
    assert apex_side > 0
    assert min(cap_side_margins) > 0

    physical_class = radius_class(points, "o", "left")
    assert physical_class == {"left", "q0", "q1", "q2", "right"}

    # These are exactly the three cap-local selected-row intersections after
    # the source-as-successor-blocker collision c2 = q1.
    assert radius_class({name: points[name] for name in cap}, "c0", "q0") == {"q0", "q1"}
    assert radius_class({name: points[name] for name in cap}, "c1", "q1") == {"q1", "q2"}
    assert radius_class({name: points[name] for name in cap}, "q1", "q0") == {"q0", "q2"}

    # Exact circumdisk of the support triangle (o,left,right).
    mec_center = (F(1, 2), F(1, 3))
    mec_radius_sq = sqdist(mec_center, points["o"])
    assert mec_radius_sq == sqdist(mec_center, points["left"])
    assert mec_radius_sq == sqdist(mec_center, points["right"])
    disk_margins = [
        mec_radius_sq - sqdist(mec_center, points[name])
        for name in points if name not in {"o", "left", "right"}
    ]
    assert min(disk_margins) > 0

    # All three support-triangle angles are nonobtuse.
    side_sq = [
        sqdist(points["o"], points["left"]),
        sqdist(points["left"], points["right"]),
        sqdist(points["right"], points["o"]),
    ]
    for i, side in enumerate(side_sq):
        assert side <= side_sq[(i + 1) % 3] + side_sq[(i + 2) % 3]

    pairwise_sq = [
        sqdist(points[a], points[b])
        for i, a in enumerate(points) for b in tuple(points)[:i]
    ]
    row_exclusion_margins: list[F] = []
    for center, through, expected in (
        ("c0", "q0", {"q0", "q1"}),
        ("c1", "q1", {"q1", "q2"}),
        ("q1", "q0", {"q0", "q2"}),
    ):
        radius = sqdist(points[center], points[through])
        row_exclusion_margins.extend(
            abs(sqdist(points[center], points[name]) - radius)
            for name in cap if name not in expected and name != center
        )

    print("PASS: exact rational source-as-successor-blocker cap-local model")
    print("status=EXACT_EUCLIDEAN_MEC_CAP_LOCAL_NOT_GLOBAL_CRITICAL_SYSTEM")
    print(f"boundary={','.join(boundary)}")
    print(f"closed_cap_card={len(cap)}")
    print(f"physical_class={','.join(sorted(physical_class))}")
    print("collision=centerAt(q0)=q1=successor(q0)")
    print(f"min_strict_hull_margin={min(hull_margins)}")
    print(f"min_cap_side_margin={min(cap_side_margins)}")
    print(f"min_mec_disk_margin={min(disk_margins)}")
    print(f"min_pairwise_dist_sq={min(pairwise_sq)}")
    print(f"min_named_row_exclusion={min(row_exclusion_margins)}")


if __name__ == "__main__":
    main()
