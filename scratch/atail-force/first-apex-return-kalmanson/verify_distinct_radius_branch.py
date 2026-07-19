#!/usr/bin/env python3
"""Exact regressions for the source-faithful distinct-radius first-apex branch.

The first fixture is a finite incidence/radius-color model retaining the
current cap, deletion, critical-map, and all-reverse marginals.  It makes the
retained row ``T0`` and the double-deletion row ``T1`` disjoint, saturates the
already-live first-opposite-cap lower bound at six, and makes every reverse
outside pair cross between the two radius colors.

The second fixture is an exact rational strict-convex cap-chain shadow with
two concentric four-shells at one hull vertex.  It is not an MEC support
triangle or a full CounterexampleData model.
"""

from __future__ import annotations

from collections import defaultdict
from fractions import Fraction as F


def check_finite_parent_fixture() -> dict[str, object]:
    carrier = set(range(16))
    first_apex = 0
    second_apex = 1

    surplus_cap = {0, 1, 5, 6, 7}
    first_opp_cap = {1, 2, 3, 8, 9, 10}
    second_opp_cap = {2, 0, 4, 11, 12, 13, 14, 15}
    strict_first = first_opp_cap - (surplus_cap | second_opp_cap)

    q, w = 3, 8
    retained_row = frozenset({3, 8, 6, 12})
    double_row = frozenset({9, 10, 5, 11})
    retained_radius = "r"
    double_radius = "rho"

    assert surplus_cap | first_opp_cap | second_opp_cap == carrier
    assert surplus_cap & first_opp_cap == {second_apex}
    assert surplus_cap & second_opp_cap == {first_apex}
    assert first_opp_cap & second_opp_cap == {2}
    assert strict_first == {3, 8, 9, 10}
    assert len(first_opp_cap) == 6

    # The exact rho != r shell-role packet.
    assert retained_radius != double_radius
    assert len(retained_row) == len(double_row) == 4
    assert retained_row.isdisjoint(double_row)
    assert {q, w} <= retained_row
    assert double_row.isdisjoint({q, w})
    assert {q, w}.isdisjoint(surplus_cap)
    assert all(point in second_opp_cap or point in strict_first for point in (q, w))
    assert q in strict_first or w in strict_first
    assert retained_row <= surplus_cap | second_opp_cap | strict_first
    assert double_row <= surplus_cap | second_opp_cap | strict_first
    assert retained_row & strict_first == {q, w}
    assert double_row & strict_first == {9, 10}

    # The four strict hits exhaust the strict part of a six-point cap.  Thus
    # shell disjointness reconstructs, but does not improve, the live bound.
    strict_hits = (retained_row & strict_first) | (double_row & strict_first)
    assert strict_hits == strict_first
    assert len(strict_hits) == 4
    assert len(first_opp_cap - strict_first) == 2
    assert len(first_opp_cap) == len(strict_hits) + 2 == 6

    # Two disjoint rows give full single-deletion robustness at the first
    # apex, but no prescribed critical-row source.
    for deleted in carrier:
        assert retained_row.isdisjoint({deleted}) or double_row.isdisjoint({deleted})

    blocker = {
        0: 2, 1: 3, 2: 5, 3: 6, 4: 7, 5: 8, 6: 9, 7: 10,
        8: 3, 9: 10, 10: 2, 11: 4, 12: 14, 13: 15, 14: 5, 15: 6,
    }
    critical_support = {
        2: frozenset({0, 10, 5, 11}),
        3: frozenset({1, 8, 4, 11}),
        4: frozenset({13, 11, 6, 10}),
        5: frozenset({2, 14, 3, 7}),
        6: frozenset({3, 15, 4, 7}),
        7: frozenset({4, 3, 8, 11}),
        8: frozenset({5, 4, 7, 11}),
        9: frozenset({6, 4, 7, 12}),
        10: frozenset({7, 9, 4, 11}),
        14: frozenset({11, 12, 3, 9}),
        15: frozenset({12, 13, 8, 5}),
    }
    assert set(blocker) == carrier
    assert first_apex not in blocker.values()
    assert second_apex not in blocker.values()
    assert all(source != center for source, center in blocker.items())
    assert set(critical_support) == set(blocker.values())
    assert all(len(support) == 4 and center not in support
               for center, support in critical_support.items())
    assert all(source in critical_support[center]
               for source, center in blocker.items())
    fibers: dict[int, set[int]] = defaultdict(set)
    for source, center in blocker.items():
        fibers[center].add(source)
    assert max(map(len, fibers.values())) <= 2
    assert sum(len(fiber) >= 2 for fiber in fibers.values()) >= 2

    # The exact all-reverse outside pairs lie in T0 union T1, but each uses
    # one point of each radius.  Hence even union coverage does not force a
    # co-radial return.
    reverse_pairs = (
        frozenset({3, 9}),
        frozenset({8, 5}),
        frozenset({6, 10}),
    )
    assert len(set(reverse_pairs)) == 3
    for pair in reverse_pairs:
        assert pair <= retained_row | double_row
        assert len(pair & retained_row) == 1
        assert len(pair & double_row) == 1
        assert not pair <= retained_row
        assert not pair <= double_row
        assert pair.isdisjoint(second_opp_cap)

    return {
        "carrier_card": len(carrier),
        "first_opp_cap_card": len(first_opp_cap),
        "strict_first_card": len(strict_first),
        "retained_row": sorted(retained_row),
        "double_row": sorted(double_row),
        "reverse_pairs": [sorted(pair) for pair in reverse_pairs],
    }


Point = tuple[F, F]


def circle_point(t: F, radius: F) -> Point:
    denominator = 1 + t * t
    return (
        radius * (1 - t * t) / denominator,
        radius * (2 * t) / denominator,
    )


def signed_area2(a: Point, b: Point, c: Point) -> F:
    return ((b[0] - a[0]) * (c[1] - a[1])
            - (b[1] - a[1]) * (c[0] - a[0]))


def sqnorm(point: Point) -> F:
    return point[0] * point[0] + point[1] * point[1]


def check_convex_cap_shadow() -> dict[str, object]:
    outer_parameters = [F(-4, 5), F(-3, 4), F(-2, 3), F(-3, 5)]
    inner_parameters = [F(1, 6), F(1, 3), F(2, 5), F(3, 5)]
    center: Point = (F(0), F(0))
    outer = [circle_point(t, F(9, 5)) for t in outer_parameters]
    inner = [circle_point(t, F(1)) for t in inner_parameters]
    boundary = [center, *outer, *inner]
    labels = ["O", *(f"A{i}" for i in range(4)), *(f"B{i}" for i in range(4))]

    assert len(set(boundary)) == 9
    assert all(sqnorm(point) == F(81, 25) for point in outer)
    assert all(sqnorm(point) == F(1) for point in inner)
    assert set(outer).isdisjoint(inner)

    slacks = []
    for index, edge_start in enumerate(boundary):
        edge_end_index = (index + 1) % len(boundary)
        edge_end = boundary[edge_end_index]
        for point_index, point in enumerate(boundary):
            if point_index in (index, edge_end_index):
                continue
            slack = signed_area2(edge_start, edge_end, point)
            assert slack > 0
            slacks.append(slack)

    # Abstract support-triangle cap chains in the displayed strict boundary
    # order.  This checks the cap-role/order surface, not the MEC property.
    surplus_cap = {"O", "A0"}
    first_opp_cap = {"A0", "A1", "A2", "A3", "B0", "B1", "B2", "B3"}
    second_opp_cap = {"B3", "O"}
    strict_first = first_opp_cap - (surplus_cap | second_opp_cap)
    retained_row = {"A0", "A1", "A2", "A3"}
    double_row = {"B0", "B1", "B2", "B3"}
    q, w = "A1", "A2"

    assert surplus_cap | first_opp_cap | second_opp_cap == set(labels)
    assert surplus_cap & first_opp_cap == {"A0"}
    assert first_opp_cap & second_opp_cap == {"B3"}
    assert surplus_cap & second_opp_cap == {"O"}
    assert retained_row.isdisjoint(double_row)
    assert {q, w} <= retained_row & strict_first
    assert len(double_row & strict_first) >= 2

    return {
        "vertices": len(boundary),
        "minimum_strict_hull_slack": str(min(slacks)),
        "outer_squared_radius": "81/25",
        "inner_squared_radius": "1",
        "strict_first_roles": sorted(strict_first),
    }


def main() -> None:
    finite = check_finite_parent_fixture()
    convex = check_convex_cap_shadow()
    print("PASS: exact finite rho!=r parent-marginal saturation fixture")
    print(
        f"first_opp_cap_card={finite['first_opp_cap_card']} "
        f"strict_hits={finite['strict_first_card']}"
    )
    print(f"T0={finite['retained_row']} T1={finite['double_row']}")
    print(f"reverse_pairs={finite['reverse_pairs']} all_cross_radius=True")
    print("PASS: exact rational strict-convex two-shell cap-order shadow")
    print(
        f"vertices={convex['vertices']} "
        f"minimum_strict_hull_slack={convex['minimum_strict_hull_slack']}"
    )
    print("PASS: no MEC or full CounterexampleData realization claimed")


if __name__ == "__main__":
    main()
