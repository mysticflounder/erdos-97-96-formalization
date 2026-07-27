#!/usr/bin/env python3
"""Search rational two-circle configurations for the local geometry audit."""

from fractions import Fraction as Q
from itertools import combinations


Point = tuple[Q, Q]


def circle_point(k: Q, m: Q) -> Point:
    """Second intersection with the circle centered at (0,k), from q=(1,0)."""
    den = m * m + 1
    return ((2 * k * m + m * m - 1) / den, 2 * m * (k * m - 1) / den)


def cross(a: Point, b: Point, c: Point) -> Q:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def convex_hull(points: dict[str, Point]) -> list[str]:
    ordered = sorted(points, key=lambda name: points[name])

    def half(names: list[str]) -> list[str]:
        result: list[str] = []
        for name in names:
            while len(result) >= 2 and cross(
                points[result[-2]], points[result[-1]], points[name]
            ) <= 0:
                result.pop()
            result.append(name)
        return result

    lower = half(ordered)
    upper = half(list(reversed(ordered)))
    return lower[:-1] + upper[:-1]


def cyclic_contains_three(order: list[str], triple: tuple[str, str, str]) -> bool:
    doubled = order + order
    for start in range(len(order)):
        if tuple(doubled[start : start + 3]) == triple:
            return True
    return False


def main() -> None:
    slopes = sorted(
        {
            Q(n, d)
            for d in range(1, 7)
            for n in range(-30, 31)
            if n != 0
        }
    )
    heights = [Q(1, 4), Q(1, 2), Q(1), Q(2), Q(3), Q(4)]
    p, q = (Q(-1), Q(0)), (Q(1), Q(0))
    for a in heights:
        c = (Q(0), a)
        g_candidates = [
            circle_point(a, m)
            for m in slopes
            if circle_point(a, m)[1] < 0 and circle_point(a, m) not in (p, q)
        ]
        for b in heights:
            O = (Q(0), -b)
            e_candidates = [
                circle_point(-b, m)
                for m in slopes
                if circle_point(-b, m)[1] < 0
                and circle_point(-b, m) not in (p, q)
            ]
            for e, f in combinations(dict.fromkeys(e_candidates), 2):
                partial = {"p": p, "c": c, "q": q, "O": O, "e": e, "f": f}
                if len(convex_hull(partial)) != len(partial):
                    continue
                for g, h in combinations(dict.fromkeys(g_candidates), 2):
                    points = partial | {"g": g, "h": h}
                    if len(set(points.values())) != len(points):
                        continue
                    hull = convex_hull(points)
                    if len(hull) != len(points):
                        continue
                    if not (
                        cyclic_contains_three(hull, ("p", "c", "q"))
                        or cyclic_contains_three(hull, ("q", "c", "p"))
                    ):
                        continue
                    print(f"a={a} b={b}")
                    print("hull:", " ".join(hull))
                    for name in hull:
                        print(f"{name}: {points[name]}")
                    return
    raise SystemExit("no witness found")


if __name__ == "__main__":
    main()
