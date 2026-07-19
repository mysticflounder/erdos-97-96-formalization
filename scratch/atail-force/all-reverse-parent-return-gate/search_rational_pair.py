#!/usr/bin/env python3
"""Bounded rational scan for a retained first-apex pair.

This is discovery code only.  It extends the exact period-three core and its
complete row-0 outside pair by two points on one circle centered at the
first apex (the right endpoint of the physical cap).  Every candidate is
checked with ``Fraction`` arithmetic for strict convexity and MEC/cap-side
placement.  The scan is deliberately finite and small.
"""

from __future__ import annotations

from fractions import Fraction as F


Point = tuple[F, F]


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def scale(s: F, a: Point) -> Point:
    return (s * a[0], s * a[1])


def unit_point(t: F) -> Point:
    denominator = 1 + t * t
    return ((1 - t * t) / denominator, 2 * t / denominator)


def rotate_rational(a: Point, t: F) -> Point:
    denominator = 1 + t * t
    cosine = (1 - t * t) / denominator
    sine = 2 * t / denominator
    return (cosine * a[0] - sine * a[1], sine * a[0] + cosine * a[1])


def cross(a: Point, b: Point, c: Point) -> F:
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def sqdist(a: Point, b: Point) -> F:
    d = sub(a, b)
    return d[0] * d[0] + d[1] * d[1]


def strict_hull(boundary: list[Point]) -> F | None:
    margins: list[F] = []
    for i, edge_start in enumerate(boundary):
        edge_end = boundary[(i + 1) % len(boundary)]
        for j, point in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(edge_start, edge_end, point)
            if margin <= 0:
                return None
            margins.append(margin)
    return min(margins)


def main() -> None:
    o: Point = (F(0), F(0))
    left = unit_point(F(0))
    right = unit_point(F(163, 192))
    q0 = unit_point(F(4, 231))
    q1 = unit_point(F(123, 184))
    q2 = unit_point(F(3, 4))
    c0 = scale(F(45, 86), add(q0, q1))
    c1 = scale(F(251, 500), add(q1, q2))
    c2 = scale(F(271, 500), add(q2, q0))
    x = add(c0, rotate_rational(sub(q0, c0), F(-47, 149)))
    y = add(c0, rotate_rational(sub(q0, c0), F(-28, 95)))

    names0 = ["o", "x", "y", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right"]
    points0 = [o, x, y, left, q0, c0, c2, q1, c1, q2, right]
    first_vector = sub(x, right)

    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)

    # The small rotation stays near x on the nonphysical adjacent chain.  The
    # larger rotation lands on the physical-cap chain.  Try every insertion
    # slot because the exact hull check, not a floating angular sort, is the
    # authority.
    small = sorted({F(n, d)
                    for d in (2000, 1500, 1000, 750, 500, 400, 300, 250, 200)
                    for n in (-3, -2, -1, 1, 2, 3)})
    large = sorted({F(n, d)
                    for d in (400, 300, 250, 200, 150, 125, 100, 80, 70, 60,
                               50, 40, 35, 30, 25, 20, 15, 12, 10)
                    for n in range(-12, 25)})

    tested = 0

    # First permit the retained pair to share one endpoint with the reverse
    # pair.  The theorem under audit requires equality of unordered pairs, so
    # a one-point overlap is already a legitimate target-negating relaxed
    # model.  This pass is tiny and does not add a duplicate of x.
    for ta in large:
        a = add(right, rotate_rational(first_vector, ta))
        if a in points0 or sqdist(mec_center, a) > mec_radius_sq:
            continue
        if cross(left, right, a) >= 0:
            continue
        for ia in range(3, len(points0) + 1):
            tested += 1
            names = names0.copy()
            points = points0.copy()
            names.insert(ia, "frontier_a")
            points.insert(ia, a)
            margin = strict_hull(points)
            if margin is None:
                continue
            print("SAT_EXACT_ONE_POINT_OVERLAP")
            print("frontier_b=x")
            print(f"ta={ta}")
            print("boundary=" + ",".join(names))
            print(f"min_strict_hull_margin={margin}")
            print(f"frontier_radius_sq={sqdist(a, right)}")
            print(f"a_o_radius_sq={sqdist(a, o)}")
            print(f"x_o_radius_sq={sqdist(x, o)}")
            print(f"tested={tested}")
            return

    for tb in small:
        b = add(right, rotate_rational(first_vector, tb))
        for ta in large:
            if ta == tb:
                continue
            a = add(right, rotate_rational(first_vector, ta))
            if sqdist(a, right) != sqdist(b, right):
                raise AssertionError("rational rotation did not preserve radius")
            if any(sqdist(mec_center, p) > mec_radius_sq for p in (a, b)):
                continue
            if cross(left, right, b) <= 0 or cross(left, right, a) >= 0:
                continue
            for ib in range(1, 4):
                for ia in range(3, len(points0) + 1):
                    tested += 1
                    names = names0.copy()
                    points = points0.copy()
                    names.insert(ib, "frontier_b")
                    points.insert(ib, b)
                    ia_adjusted = ia + (1 if ia >= ib else 0)
                    names.insert(ia_adjusted, "frontier_a")
                    points.insert(ia_adjusted, a)
                    margin = strict_hull(points)
                    if margin is None:
                        continue
                    print("SAT_EXACT")
                    print(f"tb={tb}")
                    print(f"ta={ta}")
                    print("boundary=" + ",".join(names))
                    print(f"min_strict_hull_margin={margin}")
                    print(f"frontier_radius_sq={sqdist(a, right)}")
                    print(f"a_o_radius_sq={sqdist(a, o)}")
                    print(f"b_o_radius_sq={sqdist(b, o)}")
                    print(f"tested={tested}")
                    return

    print("UNKNOWN_NO_HIT")
    print(f"tested={tested}")


if __name__ == "__main__":
    main()
