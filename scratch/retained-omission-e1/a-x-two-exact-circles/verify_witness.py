"""Exact witness showing that the local A=X two-circle pattern is realizable."""

from fractions import Fraction as F


POINTS = {
    "A": (F(0), F(0)),
    "O": (F(6, 5), F(0)),
    "C": (F(3, 5), F(4, 5)),
    "J": (F(3, 5), -F(4, 5)),
    "K": (F(7, 25), -F(24, 25)),
    "L": (F(9, 41), -F(40, 41)),
    "U": (F(53, 65), F(12, 13)),
    "V": (F(23, 25), F(24, 25)),
}

BOUNDARY_ORDER = ("A", "L", "K", "J", "O", "V", "U", "C")


def squared_distance(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def cross(o, a, b):
    return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (
        b[0] - o[0]
    )


def main():
    a_shell = {
        name
        for name, point in POINTS.items()
        if name != "A" and squared_distance(POINTS["A"], point) == 1
    }
    o_shell = {
        name
        for name, point in POINTS.items()
        if name != "O" and squared_distance(POINTS["O"], point) == 1
    }
    assert a_shell == {"C", "J", "K", "L"}
    assert o_shell == {"C", "J", "U", "V"}

    turns = []
    for i, name in enumerate(BOUNDARY_ORDER):
        p = POINTS[name]
        q = POINTS[BOUNDARY_ORDER[(i + 1) % len(BOUNDARY_ORDER)]]
        r = POINTS[BOUNDARY_ORDER[(i + 2) % len(BOUNDARY_ORDER)]]
        turns.append(cross(p, q, r))
    assert all(turn > 0 for turn in turns)

    # A supporting-line check proves every listed point is a strict hull vertex.
    for i, name in enumerate(BOUNDARY_ORDER):
        next_name = BOUNDARY_ORDER[(i + 1) % len(BOUNDARY_ORDER)]
        for other_name in BOUNDARY_ORDER:
            if other_name in {name, next_name}:
                continue
            assert cross(
                POINTS[name], POINTS[next_name], POINTS[other_name]
            ) > 0

    print("verified exact A-shell:", sorted(a_shell))
    print("verified exact O-shell:", sorted(o_shell))
    print("strict convex boundary:", " ".join(BOUNDARY_ORDER))
    print("minimum consecutive turn:", min(turns))


if __name__ == "__main__":
    main()
