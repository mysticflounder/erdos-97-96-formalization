"""Exact rational verification of both post-v37 alternating placements.

This checks the distilled Euclidean/cap consequences currently produced in
ATail/FrontierLiveClosure.lean.  It is deliberately not a construction of a
CounterexampleData value: global K4 rows and the MEC promotion are omitted.
"""

from fractions import Fraction as F


BASE = {
    # A is the first apex / Q.row centre; B is the shared blocker.
    "A": (F(6, 5), F(0)),
    "B": (F(0), F(0)),
    # Common points of the two exact unit shells.
    "J": (F(3, 5), -F(4, 5)),
    "X": (F(3, 5), F(4, 5)),
    # Private points of the exact blocker shell.
    "K": (F(7, 25), -F(24, 25)),
    "L": (F(9, 41), -F(40, 41)),
    # Private points of the exact selected row centred at A.
    "U": (F(53, 65), F(12, 13)),
    "V": (F(23, 25), F(24, 25)),
}


def sqdist(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def cross(o, p, q):
    return (p[0] - o[0]) * (q[1] - o[1]) - (p[1] - o[1]) * (
        q[0] - o[0]
    )


def dot(u, v):
    return u[0] * v[0] + u[1] * v[1]


def sub(p, q):
    return (p[0] - q[0], p[1] - q[1])


def shell(points, centre):
    return {
        name
        for name, point in points.items()
        if name != centre and sqdist(points[centre], point) == 1
    }


def verify_case(
    name, reflect, boundary, triangle, first_cap, adjacent_cap, other_cap
):
    points = {
        label: (point[0], -point[1] if reflect else point[1])
        for label, point in BASE.items()
    }

    # Exact shell packet: stronger than the selected-row subset statement.
    a_shell = shell(points, "A")
    b_shell = shell(points, "B")
    assert a_shell == {"J", "X", "U", "V"}
    assert b_shell == {"J", "X", "K", "L"}
    assert a_shell & b_shell == {"J", "X"}
    assert {"K", "L"}.isdisjoint(a_shell)
    assert {"U", "V"}.isdisjoint(b_shell)

    # Strictly convex injective CCW boundary, checked by every supporting line.
    assert len(set(points.values())) == len(points)
    turns = []
    for i, label in enumerate(boundary):
        p = points[label]
        q = points[boundary[(i + 1) % len(boundary)]]
        r = points[boundary[(i + 2) % len(boundary)]]
        turns.append(cross(p, q, r))
        for other in boundary:
            if other not in {label, boundary[(i + 1) % len(boundary)]}:
                assert cross(p, q, points[other]) > 0
    assert all(turn > 0 for turn in turns)

    # The structural Moser triangle is the acute 1,1,6/5 triangle A-X-B.
    t0, t1, t2 = triangle
    assert {t0, t1, t2} == {"A", "B", "X"}
    assert dot(sub(points[t1], points[t0]), sub(points[t2], points[t0])) >= 0
    assert dot(sub(points[t2], points[t1]), sub(points[t0], points[t1])) >= 0
    assert dot(sub(points[t0], points[t2]), sub(points[t1], points[t2])) >= 0

    # Closed cap arcs.  Their endpoint overlaps give the cap-sum n+3.
    assert set(first_cap) & set(adjacent_cap) == {"B"}
    assert set(adjacent_cap) & set(other_cap) == {"A"}
    assert set(other_cap) & set(first_cap) == {"X"}
    assert len(first_cap) == 2
    assert len(adjacent_cap) == 5
    assert len(other_cap) == 4
    assert set(first_cap) | set(adjacent_cap) | set(other_cap) == set(boundary)
    assert len(first_cap) + len(adjacent_cap) + len(other_cap) == 11

    # Live endpoint consequences: J is outside the first strict cap, lies in
    # one adjacent closed cap, and is its unique full A-radius-class point.
    first_interior = set(first_cap[1:-1])
    assert "J" not in first_interior
    assert "J" in adjacent_cap
    assert "X" not in adjacent_cap
    assert a_shell & set(adjacent_cap) == {"J"}
    assert (a_shell & b_shell) - set(adjacent_cap) == {"X"}

    # Projecting the boundary to the four post-v37 roles authenticates the
    # requested oriented cyclic placement (boundary is already rotated at A).
    projected = tuple(label for label in boundary if label in {"A", "J", "B", "X"})
    expected = tuple(name.split("_"))
    assert projected == expected

    return {
        "placement": "-".join(projected),
        "boundary": " ".join(boundary),
        "triangle": " ".join(triangle),
        "first_cap": " ".join(first_cap),
        "adjacent_cap": " ".join(adjacent_cap),
        "minimum_turn": min(turns),
        "a_shell": " ".join(sorted(a_shell)),
        "b_shell": " ".join(sorted(b_shell)),
    }


def main():
    cases = [
        verify_case(
            "A_X_B_J",
            False,
            ("A", "V", "U", "X", "B", "L", "K", "J"),
            ("A", "X", "B"),
            ("X", "B"),
            ("B", "L", "K", "J", "A"),
            ("A", "V", "U", "X"),
        ),
        verify_case(
            "A_J_B_X",
            True,
            ("A", "J", "K", "L", "B", "X", "U", "V"),
            ("A", "B", "X"),
            ("B", "X"),
            ("A", "J", "K", "L", "B"),
            ("X", "U", "V", "A"),
        ),
    ]
    for case in cases:
        print(f"verified {case['placement']}")
        for key in (
            "boundary",
            "triangle",
            "first_cap",
            "adjacent_cap",
            "a_shell",
            "b_shell",
            "minimum_turn",
        ):
            print(f"  {key}: {case[key]}")


if __name__ == "__main__":
    main()
