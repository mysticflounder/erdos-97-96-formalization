#!/usr/bin/env python3
"""Exact rational regression for two concentric four-shells in convex position."""

from fractions import Fraction as Q


Point = tuple[Q, Q]


def circle_point(t: Q, radius: Q) -> Point:
    """Rational parametrization of the circle of the given radius."""
    denominator = 1 + t * t
    return (
        radius * (1 - t * t) / denominator,
        radius * (2 * t) / denominator,
    )


def signed_area2(a: Point, b: Point, c: Point) -> Q:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def sq_norm(point: Point) -> Q:
    return point[0] * point[0] + point[1] * point[1]


def main() -> None:
    outer_parameters = [Q(-4, 5), Q(-3, 4), Q(-2, 3), Q(-3, 5)]
    inner_parameters = [Q(1, 6), Q(1, 3), Q(2, 5), Q(3, 5)]
    center: Point = (Q(0), Q(0))
    outer = [circle_point(t, Q(9, 5)) for t in outer_parameters]
    inner = [circle_point(t, Q(1)) for t in inner_parameters]
    boundary = [center, *outer, *inner]

    assert len(set(boundary)) == 9
    assert all(sq_norm(point) == Q(81, 25) for point in outer)
    assert all(sq_norm(point) == Q(1) for point in inner)
    assert set(outer).isdisjoint(inner)

    # Every other vertex is strictly left of every directed boundary edge.
    # This is an exact strict-convexity certificate for the displayed order.
    edge_slacks: list[Q] = []
    for index, left in enumerate(boundary):
        right_index = (index + 1) % len(boundary)
        right = boundary[right_index]
        for point_index, point in enumerate(boundary):
            if point_index not in (index, right_index):
                slack = signed_area2(left, right, point)
                assert slack > 0
                edge_slacks.append(slack)

    print("PASS exact rational two-shell convex regression")
    print(f"vertices={len(boundary)} checked_edge_slacks={len(edge_slacks)}")
    print(f"minimum_strict_slack={min(edge_slacks)}")
    print("outer_squared_radius=81/25 inner_squared_radius=1")


if __name__ == "__main__":
    main()
