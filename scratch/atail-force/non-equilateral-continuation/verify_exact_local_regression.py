"""Exact local regression for the non-equilateral continuation residual.

The model is intentionally smaller than `CounterexampleData`: it checks
strict convexity, the parent four-class at O2, the two unchanged mutual
continuation rows, the unequal radii, the O2 omissions, and a contiguous
four-vertex cap block.  It does not claim global K4, a full MEC/cap packet,
or a total critical-shell system.
"""

from fractions import Fraction as Q


POINTS = {
    "z1": (Q(0), Q(0)),
    "z2": (Q(1), Q(0)),
    "O2": (Q(1, 2), Q(-13, 20)),
    "kL": (Q(6, 65), Q(4, 65)),
    "kR": (Q(59, 65), Q(4, 65)),
    "a1": (Q(4, 5), Q(-3, 5)),
    "a2": (Q(99, 101), Q(-20, 101)),
    "a3": (Q(195, 197), Q(-28, 197)),
    "b1": (Q(1, 5), Q(-3, 5)),
    "b2": (Q(2, 101), Q(-20, 101)),
    "b3": (Q(2, 197), Q(-28, 197)),
}

K_SUPPORT = {"z1", "z2", "kL", "kR"}
ROW1 = {"z2", "a1", "a2", "a3"}
ROW2 = {"z1", "b1", "b2", "b3"}
OPP_CAP2_BLOCK = {"z2", "kR", "kL", "z1"}


def cross(o, a, b):
    return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (
        b[0] - o[0]
    )


def squared_distance(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def strict_convex_hull(points):
    ordered = sorted((xy[0], xy[1], name) for name, xy in points.items())

    lower = []
    for point in ordered:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], point) <= 0:
            lower.pop()
        lower.append(point)

    upper = []
    for point in reversed(ordered):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], point) <= 0:
            upper.pop()
        upper.append(point)

    return lower[:-1] + upper[:-1]


def is_cyclic_block(order, block):
    names = [point[2] for point in order]
    n = len(names)
    for start in range(n):
        candidate = {names[(start + offset) % n] for offset in range(len(block))}
        if candidate == block:
            return True
    return False


def main():
    assert len(set(POINTS.values())) == len(POINTS)

    hull = strict_convex_hull(POINTS)
    assert len(hull) == len(POINTS)
    turns = [
        cross(hull[i], hull[(i + 1) % len(hull)], hull[(i + 2) % len(hull)])
        for i in range(len(hull))
    ]
    assert all(turn > 0 for turn in turns)

    parent_radius_sq = squared_distance(POINTS["O2"], POINTS["z1"])
    assert parent_radius_sq == Q(269, 400)
    assert all(
        squared_distance(POINTS["O2"], POINTS[x]) == parent_radius_sq
        for x in K_SUPPORT
    )

    row_radius_sq = squared_distance(POINTS["z1"], POINTS["z2"])
    assert row_radius_sq == Q(1)
    assert row_radius_sq != parent_radius_sq
    assert all(
        squared_distance(POINTS["z1"], POINTS[x]) == row_radius_sq
        for x in ROW1
    )
    assert all(
        squared_distance(POINTS["z2"], POINTS[x]) == row_radius_sq
        for x in ROW2
    )

    assert "z2" in ROW1 and "z1" in ROW2
    assert "z1" not in ROW1 and "z2" not in ROW2
    assert "O2" not in ROW1 and "O2" not in ROW2
    assert ROW1.isdisjoint(ROW2)

    assert is_cyclic_block(hull, OPP_CAP2_BLOCK)
    assert "z1" in OPP_CAP2_BLOCK and "z2" in OPP_CAP2_BLOCK
    assert len(ROW1 - OPP_CAP2_BLOCK) == 3
    assert len(ROW2 - OPP_CAP2_BLOCK) == 3

    print("PASS: exact 11-point non-equilateral local regression")
    print("hull order:", " ".join(point[2] for point in hull))
    print("parent radius squared:", parent_radius_sq)
    print("row radius squared:", row_radius_sq)
    print("native row overlap:", len(ROW1 & ROW2))


if __name__ == "__main__":
    main()
