#!/usr/bin/env python3
"""Exact finite regression for the all-reverse parent-return question.

This is an incidence/radius-fiber model, not a Euclidean realization and not
a model of CounterexampleData.Minimal.  It retains the named finite
consequences under audit and makes every reverse outside pair non-co-radial
at the first physical apex.
"""

from collections import defaultdict


A = set(range(16))

first_apex = 0
second_apex = 1
surplus_vertex = 2

# Three closed caps, with the standard one-vertex pairwise intersections.
surplus_cap = {0, 1, 5, 6, 7}
opp_cap_1 = {1, 2, 3, 8, 9, 10}
opp_cap_2 = {2, 0, 4, 11, 12, 13, 14, 15}

# One possible strict order on the physical cap used by the all-reverse rows.
opp_cap_2_order = [2, 11, 14, 12, 4, 15, 13, 0]
opp_cap_2_interior = set(opp_cap_2_order[1:-1])

# The retained original first-apex frontier pair.
frontier_q = 3
frontier_w = 8

# Two distinct positive first-apex radius fibers.  They give two disjoint
# selected four-rows, hence the finite witness for full deletion robustness.
# The frontier pair lies in the first fiber.  The second fiber survives the
# simultaneous deletion of frontier_q and frontier_w.
first_radius_fibers = (
    frozenset({3, 8, 6, 12}),
    frozenset({9, 10, 5, 11}),
)
frontier_radius_class = first_radius_fibers[0]
first_apex_double_deletion_row = first_radius_fibers[1]

# The unique large physical-second-apex radius used by the exact-five cycle.
# It has three strict-cap sources, one point in each adjacent cap, and card 5.
second_apex_exact_five = frozenset({11, 12, 13, 5, 8})

# The q-deleted rows stored by the original common-deletion packet.
common_first_row = frozenset({9, 10, 5, 11})
common_second_row = frozenset({11, 12, 13, 5})

# A period-three physical actual-critical omission cycle.
cycle_sources = (11, 12, 13)

# Total fixed-point-free critical blocker map.  Both robust physical apices
# are omitted values.  Every fiber has cardinality at most two (and hence at
# most the exact-support bound four).
blocker = {
    0: 2,
    1: 3,
    2: 5,
    3: 6,
    4: 7,
    5: 8,
    6: 9,
    7: 10,
    8: 3,
    9: 10,
    10: 2,
    11: 4,
    12: 14,
    13: 15,
    14: 5,
    15: 6,
}

# One exact four-support for each blocker value.  Equal blocker values use
# the same support, and every source belongs to the support at its blocker.
# The three rows at centers 14, 15, 4 are precisely the all-reverse rows.
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


def fibers() -> dict[int, set[int]]:
    result: dict[int, set[int]] = defaultdict(set)
    for source, center in blocker.items():
        result[center].add(source)
    return result


def reverse_row(edge: int) -> frozenset[int]:
    successor = cycle_sources[(edge + 1) % len(cycle_sources)]
    return critical_support[blocker[successor]]


def reverse_outside_pair(edge: int) -> frozenset[int]:
    return reverse_row(edge) - opp_cap_2


def first_apex_radius_color(point: int) -> tuple[str, int]:
    for index, radius_class in enumerate(first_radius_fibers):
        if point in radius_class:
            return ("large", index)
    # All other points may occupy singleton fibers; no audited axiom merges
    # them with a displayed positive first-apex radius.
    return ("singleton", point)


def check() -> None:
    # Faithful cap cardinality/cover surface.
    assert surplus_cap | opp_cap_1 | opp_cap_2 == A
    assert surplus_cap & opp_cap_1 == {second_apex}
    assert surplus_cap & opp_cap_2 == {first_apex}
    assert opp_cap_1 & opp_cap_2 == {surplus_vertex}
    assert sum(map(len, (surplus_cap, opp_cap_1, opp_cap_2))) == len(A) + 3
    assert len(opp_cap_1) >= 6 and len(opp_cap_2) >= 6
    assert set(opp_cap_2_order) == opp_cap_2

    # Original frontier and its source-faithful common-deletion data.
    assert frontier_q != frontier_w
    assert {frontier_q, frontier_w} <= frontier_radius_class
    assert {frontier_q, frontier_w}.isdisjoint(surplus_cap)
    assert len(frontier_radius_class) == 4
    assert len(first_apex_double_deletion_row) == 4
    assert first_apex_double_deletion_row.isdisjoint({frontier_q, frontier_w})
    assert frontier_q not in common_first_row
    assert frontier_q not in common_second_row
    assert len(common_first_row) == len(common_second_row) == 4
    assert len(common_first_row & common_second_row) <= 2
    first_marginal = frontier_radius_class - surplus_cap
    assert len(common_second_row & first_marginal) <= 1

    # Exact witnesses of full single-deletion robustness at both apices.
    assert first_radius_fibers[0].isdisjoint(first_radius_fibers[1])
    for deleted in A:
        assert any(len(radius_class - {deleted}) >= 4
                   for radius_class in first_radius_fibers)
        assert len(second_apex_exact_five - {deleted}) >= 4
    assert len(second_apex_exact_five) == 5
    assert set(cycle_sources) <= second_apex_exact_five
    assert set(cycle_sources) <= opp_cap_2_interior
    assert frontier_q not in second_apex_exact_five
    assert len(common_second_row) == 4
    assert common_second_row <= second_apex_exact_five

    # Total CriticalShellSystem marginal: fixed-point-free, support-locked,
    # exact-card-four, source-containing, and omitting both robust apices.
    assert set(blocker) == A
    assert first_apex not in blocker.values()
    assert second_apex not in blocker.values()
    assert all(source != center for source, center in blocker.items())
    assert set(critical_support) == set(blocker.values())
    for center, support in critical_support.items():
        assert len(support) == 4
        assert center not in support
    for source, center in blocker.items():
        assert source in critical_support[center]
    assert max(map(len, fibers().values())) <= 4
    assert sum(len(fiber) >= 2 for fiber in fibers().values()) >= 2

    # Retained common deletion separates q's actual blocker from both apices.
    assert blocker[frontier_q] not in {first_apex, second_apex}

    # Generic cap-local support bound for every displayed critical center.
    for center, support in critical_support.items():
        for cap in (surplus_cap, opp_cap_1, opp_cap_2):
            if center in cap:
                assert len(support & cap) <= 2

    # All-reverse exact 2+2 source rows and ordered-cap straddling.
    positions = {point: index for index, point in enumerate(opp_cap_2_order)}
    reverse_centers = []
    reverse_pairs = []
    for edge, source in enumerate(cycle_sources):
        successor = cycle_sources[(edge + 1) % len(cycle_sources)]
        row = reverse_row(edge)
        center = blocker[successor]
        pair = reverse_outside_pair(edge)

        # Forward omission at source; reverse membership at successor.
        assert successor not in critical_support[blocker[source]]
        assert source in row
        assert successor in row

        assert center in opp_cap_2_interior
        assert row & opp_cap_2 == {source, successor}
        assert len(pair) == 2
        lo, hi = sorted((positions[source], positions[successor]))
        assert lo < positions[center] < hi
        reverse_centers.append(center)
        reverse_pairs.append(pair)

    assert len(set(reverse_centers)) == len(reverse_centers)
    assert len(set(reverse_pairs)) == len(reverse_pairs)

    # The desired parent return fails for every reverse row: its two outside
    # points lie in different first-apex radius fibers.
    for pair in reverse_pairs:
        a, b = tuple(pair)
        assert first_apex_radius_color(a) != first_apex_radius_color(b)
        assert pair != frozenset({frontier_q, frontier_w})


if __name__ == "__main__":
    check()
    print("PASS: exact finite all-reverse parent no-return regression")
    print(f"carrier={len(A)} cap_profile="
          f"{(len(surplus_cap), len(opp_cap_1), len(opp_cap_2))}")
    print(f"frontier_pair={frozenset({frontier_q, frontier_w})}")
    print(f"reverse_pairs={[reverse_outside_pair(i) for i in range(3)]}")
    print("all reverse pairs have distinct first-apex radius colors")
