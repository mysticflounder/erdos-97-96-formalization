#!/usr/bin/env python3
"""Exact rational replay of the period-three marginal curvature ledger."""

from fractions import Fraction


VERTICES = (
    "left",
    "q0",
    "c0",
    "c2",
    "q1",
    "c1",
    "q2",
    "right",
    "gapBefore",
    "x0",
    "x1",
    "x2",
    "x3",
    "x4",
    "x5",
    "gapAfter",
    "filler0",
    "filler1",
)

WEIGHTS = (
    *(Fraction(1, 40) for _ in range(8)),
    Fraction(3, 5),
    *(Fraction(1, 50) for _ in range(6)),
    Fraction(3, 5),
    Fraction(6, 25),
    Fraction(6, 25),
)

# (name, center, first outside target, second outside target, lifted center)
ROWS = (
    ("c0", 2, 9, 14, 20),
    ("c1", 5, 10, 13, 23),
    ("c2", 3, 11, 12, 21),
)


def turn(index: int) -> Fraction:
    return WEIGHTS[index % len(WEIGHTS)]


def open_arc(start: int, end: int) -> Fraction:
    """Sum turns strictly after start and strictly before end."""
    return sum((turn(k) for k in range(start + 1, end)), Fraction(0))


def middle_budget(center: int, first: int, second: int) -> Fraction:
    """Center turn plus the closed outside middle-arc turns."""
    middle = sum((turn(k) for k in range(first, second + 1)), Fraction(0))
    return turn(center) + middle


def main() -> None:
    assert len(VERTICES) == len(WEIGHTS) == 18
    assert all(weight > 0 for weight in WEIGHTS)
    assert sum(WEIGHTS, Fraction(0)) == 2

    # Strict nesting with three distinct unordered endpoint pairs.
    assert 9 < 10 < 11 < 12 < 13 < 14
    assert len({(first, second) for _, _, first, second, _ in ROWS}) == 3

    lower = Fraction(11, 20)  # 1/2 + (1/10)/2
    upper = Fraction(9, 10)   # 1 - ((1/10) + (1/10))/2
    expected = {
        "c0": ((Fraction(145, 200), Fraction(165, 200),
                 Fraction(246, 200), Fraction(226, 200)),
                Fraction(29, 200)),
        "c1": ((Fraction(134, 200), Fraction(146, 200),
                 Fraction(257, 200), Fraction(245, 200)),
                Fraction(21, 200)),
        "c2": ((Fraction(148, 200), Fraction(152, 200),
                 Fraction(243, 200), Fraction(239, 200)),
                Fraction(13, 200)),
    }

    print("PASS: exact period-three marginal curvature ledger")
    print(f"total_turn={sum(WEIGHTS, Fraction(0))}*pi")
    print("nested_intervals=[x0,x5] > [x1,x4] > [x2,x3]")
    for name, center, first, second, cycle_end in ROWS:
        outer = (
            open_arc(center, first),
            open_arc(center, second),
            open_arc(first, cycle_end),
            open_arc(second, cycle_end),
        )
        budget = middle_budget(center, first, second)
        assert (outer, budget) == expected[name]
        assert all(value > lower for value in outer)
        assert budget < upper
        assert budget < 1
        outer_text = ", ".join(str(value) for value in outer)
        print(f"{name}: outer=({outer_text}); middle_plus_center={budget}")
    print(f"outer_lower={lower}*pi; middle_upper={upper}*pi")


if __name__ == "__main__":
    main()
