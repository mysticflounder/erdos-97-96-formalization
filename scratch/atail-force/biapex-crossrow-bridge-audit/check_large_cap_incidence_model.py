#!/usr/bin/env python3
"""Finite regression for the large-cap bi-apex cross-row bridge.

This is deliberately an incidence/cardinality model, not a Euclidean model.
It checks that the named finite consequences of the post-small-cap robust
surface can coexist while every repeated blocker fiber avoids alignment with
the two retained physical-apex rows and with the original frontier pair.
"""

from collections import defaultdict


carrier = set(range(14))

# Surplus index zero convention: C1 joins v2 to v3, C2 joins v3 to v1,
# and C3 joins v1 to v2.  The opposite caps both have size six.
v2_first_apex = 0
v3_second_apex = 1
v1_surplus_opposite = 2
first_apex = v2_first_apex
second_apex = v3_second_apex
q = 3
w = 4

surplus_cap = {0, 1, 5, 6, 7}
opposite_cap_1 = {1, 2, 3, 8, 9, 10}
opposite_cap_2 = {2, 0, 4, 11, 12, 13}

# Five-point exact classes witness deletion robustness.  The selected stored
# rows are their q-deleted four-point remnants.
first_apex_class = {3, 4, 5, 6, 8}
second_apex_class = {3, 5, 6, 11, 12}
first_stored_row = first_apex_class - {q}
second_stored_row = second_apex_class - {q}
frontier_marginal = first_apex_class - surplus_cap

# The blocker endomap omits both physical apices and has two nontrivial
# fibers.  Neither fiber is the frontier pair or lies in a physical class.
blocker = {
    0: 2,
    1: 3,
    2: 4,
    3: 5,
    4: 6,
    5: 7,
    6: 8,
    7: 9,
    8: 10,
    9: 11,
    10: 12,
    11: 13,
    12: 2,
    13: 3,
}

# Exact four-point critical supports, indexed by actual blocker value.
# Every source belongs to the support selected at its blocker.  Equal blocker
# values therefore have one locked support.  No distinct blocker support
# contains both sources of either repeated fiber.
critical_support = {
    2: {0, 12, 3, 5},
    3: {1, 13, 4, 6},
    4: {2, 3, 5, 7},
    5: {3, 4, 8, 11},
    6: {4, 3, 9, 12},
    7: {5, 3, 8, 11},
    8: {6, 4, 9, 12},
    9: {7, 4, 10, 12},
    10: {8, 4, 11, 13},
    11: {9, 3, 8, 12},
    12: {10, 3, 8, 13},
    13: {11, 3, 8, 10},
}


def collision_fibers() -> list[frozenset[int]]:
    fibers: dict[int, set[int]] = defaultdict(set)
    for source, center in blocker.items():
        fibers[center].add(source)
    return [frozenset(fiber) for fiber in fibers.values() if len(fiber) >= 2]


def check() -> None:
    # A faithful three-cap partition at cardinality profile (5,6,6).
    assert surplus_cap | opposite_cap_1 | opposite_cap_2 == carrier
    assert surplus_cap & opposite_cap_1 == {v3_second_apex}
    assert surplus_cap & opposite_cap_2 == {v2_first_apex}
    assert opposite_cap_1 & opposite_cap_2 == {v1_surplus_opposite}
    assert len(surplus_cap) == 5
    assert len(opposite_cap_1) == 6
    assert len(opposite_cap_2) == 6
    assert sum(map(len, (surplus_cap, opposite_cap_1, opposite_cap_2))) == len(carrier) + 3

    # Frontier and physical-apex facts.
    assert q != w
    assert {q, w} <= frontier_marginal
    assert len(frontier_marginal) >= 3
    assert len(first_apex_class) == 5
    assert len(second_apex_class) == 5
    assert q in second_apex_class and w not in second_apex_class
    assert first_stored_row == {4, 5, 6, 8}
    assert second_stored_row == {5, 6, 11, 12}
    assert q not in first_stored_row and q not in second_stored_row
    assert len(first_stored_row) == 4 and len(second_stored_row) == 4
    assert len(first_stored_row & second_stored_row) <= 2
    assert len(second_stored_row & frontier_marginal) <= 1
    for deleted in carrier:
        assert len(first_apex_class - {deleted}) >= 4
        assert len(second_apex_class - {deleted}) >= 4

    # The standard cap-interior lower bounds are visible in the fixture.
    opposite_cap_1_interior = opposite_cap_1 - {v3_second_apex, v1_surplus_opposite}
    opposite_cap_2_interior = opposite_cap_2 - {v1_surplus_opposite, v2_first_apex}
    assert len(first_apex_class & opposite_cap_1_interior) >= 2
    assert len(second_apex_class & opposite_cap_2_interior) >= 2

    # Critical-map and support-locking facts.
    assert set(blocker) == carrier
    assert first_apex not in blocker.values()
    assert second_apex not in blocker.values()
    assert all(source != center for source, center in blocker.items())
    assert set(critical_support) == set(blocker.values())
    for center, support in critical_support.items():
        assert len(support) == 4
        assert center not in support
    for source, center in blocker.items():
        assert source in critical_support[center]

    repeated = collision_fibers()
    assert set(repeated) == {frozenset({0, 12}), frozenset({1, 13})}
    assert frozenset({q, w}) not in repeated
    for fiber in repeated:
        assert not fiber <= first_apex_class
        assert not fiber <= second_apex_class
        assert not fiber <= first_stored_row
        assert not fiber <= second_stored_row
        common_center = blocker[next(iter(fiber))]
        for distinct_center, support in critical_support.items():
            if distinct_center != common_center:
                assert not fiber <= support

    # The cap-local two-point bound for every displayed row whose center is
    # in a cap.  These checks are not a replacement for Euclidean geometry;
    # they make the finite regression respect the existing local cap sink.
    caps = (surplus_cap, opposite_cap_1, opposite_cap_2)
    for center, support in critical_support.items():
        for cap in caps:
            if center in cap:
                assert len(support & cap) <= 2
    for center, support in (
        (first_apex, first_stored_row),
        (second_apex, second_stored_row),
    ):
        for cap in caps:
            if center in cap:
                assert len(support & cap) <= 2


if __name__ == "__main__":
    check()
    print("PASS: large-cap bi-apex finite incidence regression")
    print(f"carrier={len(carrier)} cap_profile={(5, 6, 6)}")
    print(f"frontier_pair={(q, w)} repeated_fibers={collision_fibers()}")
    print("no repeated fiber is aligned with either retained physical row")
    print("no distinct actual critical row contains a repeated-fiber pair")
