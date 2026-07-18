#!/usr/bin/env python3
"""Exact finite regression for the exact-seven global co-radial producer.

This is an incidence and radius-color model.  It is exact for every assertion
below, but it is not a planar Euclidean realization and does not model the
full minimality or global no-M44 fields of ``CounterexampleData``.
"""

from __future__ import annotations

from collections import defaultdict, deque


A = set(range(15))

FIRST_APEX = 0
SECOND_APEX = 1
SURPLUS_VERTEX = 2

# Closed caps with the standard one-vertex pairwise intersections.  The
# physical second cap is exactly seven points, hence has five interior roles.
SURPLUS_CAP = {0, 1, 5, 6, 7}
OPP_CAP_1 = {1, 2, 3, 8, 9, 10}
PHYSICAL_CAP = {2, 0, 4, 11, 12, 13, 14}
PHYSICAL_ORDER = [2, 11, 14, 12, 4, 13, 0]
PHYSICAL_INTERIOR = set(PHYSICAL_ORDER[1:-1])
STRICT_FIRST_OPPOSITE_CAP = OPP_CAP_1 - (SURPLUS_CAP | PHYSICAL_CAP)

# Retained first-apex frontier and the two source-faithful four-rows from
# FirstApexShellRolePacket.  They are distinct radius colors and disjoint.
FRONTIER_PAIR = frozenset({3, 8})
FIRST_APEX_RADIUS_FIBERS = (
    frozenset({3, 8, 6, 4}),
    frozenset({9, 10, 7, 14}),
)
RETAINED_ROW = FIRST_APEX_RADIUS_FIBERS[0]
DOUBLE_DELETION_ROW = FIRST_APEX_RADIUS_FIBERS[1]

# Exact-five physical-apex class and the original q-deleted common rows.
SECOND_APEX_EXACT_FIVE = frozenset({11, 12, 13, 5, 8})
COMMON_FIRST_ROW = DOUBLE_DELETION_ROW
COMMON_SECOND_ROW = frozenset({11, 12, 13, 5})

# Period-three sources.  The actual blocker of source 11 is its successor 12,
# exactly the source-as-successor-blocker occurrence forced at cap card seven.
CYCLE_SOURCES = (11, 12, 13)

# Total fixed-point-free chosen critical blocker map.  Both robust apices are
# omitted values.  The three reverse-row centers are 14, 4, and 12.
BLOCKER = {
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
    11: 12,
    12: 14,
    13: 4,
    14: 5,
}

# One complete exact-card-four support for every blocker in the image.  Equal
# blockers use the same support and every source belongs to its blocker row.
# The rows centered at 14, 4, 12 are the three transition reverse rows.
CRITICAL_SUPPORT = {
    2: frozenset({0, 10, 5, 11}),
    3: frozenset({1, 8, 4, 11}),
    4: frozenset({12, 13, 8, 10}),
    5: frozenset({2, 14, 3, 7}),
    6: frozenset({3, 2, 4, 7}),
    7: frozenset({4, 3, 8, 11}),
    8: frozenset({5, 4, 7, 11}),
    9: frozenset({6, 4, 7, 12}),
    10: frozenset({7, 9, 4, 11}),
    12: frozenset({13, 11, 6, 7}),
    14: frozenset({11, 12, 3, 9}),
}

# One K4 witness row centered at every carrier point.  At every blocker value
# it is forced to be the complete critical support above.  At the two robust
# apices it uses the retained first-apex row and a four-subrow of the exact
# physical-apex five-class.  The only otherwise-unlocked centers are 11,13.
CARRIER_ROW = {
    **CRITICAL_SUPPORT,
    FIRST_APEX: RETAINED_ROW,
    SECOND_APEX: COMMON_SECOND_ROW,
    11: frozenset({0, 2, 6, 9}),
    13: frozenset({1, 4, 7, 10}),
}


def blocker_fibers() -> dict[int, set[int]]:
    result: dict[int, set[int]] = defaultdict(set)
    for source, center in BLOCKER.items():
        result[center].add(source)
    return result


def reverse_row(edge: int) -> frozenset[int]:
    successor = CYCLE_SOURCES[(edge + 1) % len(CYCLE_SOURCES)]
    return CRITICAL_SUPPORT[BLOCKER[successor]]


def reverse_outside_pair(edge: int) -> frozenset[int]:
    return reverse_row(edge) - PHYSICAL_CAP


def first_apex_radius_color(point: int) -> tuple[str, int]:
    for index, radius_class in enumerate(FIRST_APEX_RADIUS_FIBERS):
        if point in radius_class:
            return ("large", index)
    return ("singleton", point)


def complete_radius_partition(center: int) -> tuple[frozenset[int], ...]:
    if center == FIRST_APEX:
        large_classes = list(FIRST_APEX_RADIUS_FIBERS)
    elif center == SECOND_APEX:
        large_classes = [SECOND_APEX_EXACT_FIVE]
    else:
        large_classes = [CARRIER_ROW[center]]
    used = set().union(*large_classes)
    singletons = [frozenset({point}) for point in A - {center} - used]
    return tuple([*large_classes, *singletons])


def selected_row_graph_is_strongly_connected() -> bool:
    adjacency = {center: set(CARRIER_ROW[center]) for center in A}
    for start in A:
        reached = {start}
        queue = deque([start])
        while queue:
            current = queue.popleft()
            for target in adjacency[current]:
                if target not in reached:
                    reached.add(target)
                    queue.append(target)
        if reached != A:
            return False
    return True


def has_proper_abstract_k4_subset() -> bool:
    """Check the full minimality condition in the declared radius model."""
    points = sorted(A)
    for mask in range(1, (1 << len(points)) - 1):
        subset = {points[i] for i in range(len(points)) if mask & (1 << i)}
        if all(
            any(len(radius_class & subset) >= 4
                for radius_class in complete_radius_partition(center))
            for center in subset
        ):
            return True
    return False


def check() -> None:
    # Cap partition and exact-seven surface.
    assert SURPLUS_CAP | OPP_CAP_1 | PHYSICAL_CAP == A
    assert SURPLUS_CAP & OPP_CAP_1 == {SECOND_APEX}
    assert SURPLUS_CAP & PHYSICAL_CAP == {FIRST_APEX}
    assert OPP_CAP_1 & PHYSICAL_CAP == {SURPLUS_VERTEX}
    assert sum(map(len, (SURPLUS_CAP, OPP_CAP_1, PHYSICAL_CAP))) == len(A) + 3
    assert len(SURPLUS_CAP) == 5
    assert len(OPP_CAP_1) == 6
    assert len(PHYSICAL_CAP) == 7
    assert set(PHYSICAL_ORDER) == PHYSICAL_CAP
    assert len(PHYSICAL_INTERIOR) == 5

    # Source-faithful retained first-apex role packet.
    assert len(FRONTIER_PAIR) == 2
    assert FRONTIER_PAIR <= RETAINED_ROW
    assert FRONTIER_PAIR.isdisjoint(SURPLUS_CAP)
    assert len(RETAINED_ROW) == len(DOUBLE_DELETION_ROW) == 4
    assert RETAINED_ROW.isdisjoint(DOUBLE_DELETION_ROW)
    assert len(RETAINED_ROW & STRICT_FIRST_OPPOSITE_CAP) == 2
    assert len(DOUBLE_DELETION_ROW & STRICT_FIRST_OPPOSITE_CAP) == 2
    role_cover = SURPLUS_CAP | PHYSICAL_CAP | STRICT_FIRST_OPPOSITE_CAP
    assert RETAINED_ROW <= role_cover
    assert DOUBLE_DELETION_ROW <= role_cover
    assert DOUBLE_DELETION_ROW.isdisjoint(FRONTIER_PAIR)

    # The two-apex distance-class marginals and stored common deletion.
    assert len(SECOND_APEX_EXACT_FIVE) == 5
    assert set(CYCLE_SOURCES) <= SECOND_APEX_EXACT_FIVE
    assert set(CYCLE_SOURCES) <= PHYSICAL_INTERIOR
    first_marginal = RETAINED_ROW - SURPLUS_CAP
    assert len(first_marginal & SECOND_APEX_EXACT_FIVE) <= 1
    assert len(COMMON_FIRST_ROW) == len(COMMON_SECOND_ROW) == 4
    assert COMMON_FIRST_ROW.isdisjoint(FRONTIER_PAIR)
    assert COMMON_SECOND_ROW.isdisjoint(FRONTIER_PAIR)
    assert len(COMMON_FIRST_ROW & COMMON_SECOND_ROW) <= 2
    assert len(COMMON_SECOND_ROW & first_marginal) <= 1
    for deleted in A:
        assert any(
            len(radius_class - {deleted}) >= 4
            for radius_class in FIRST_APEX_RADIUS_FIBERS
        )
        assert len(SECOND_APEX_EXACT_FIVE - {deleted}) >= 4

    # Complete support-locked critical-system projection.
    assert set(BLOCKER) == A
    assert FIRST_APEX not in BLOCKER.values()
    assert SECOND_APEX not in BLOCKER.values()
    assert all(source != center for source, center in BLOCKER.items())
    assert set(CRITICAL_SUPPORT) == set(BLOCKER.values())
    for center, support in CRITICAL_SUPPORT.items():
        assert len(support) == 4
        assert center not in support
        for cap in (SURPLUS_CAP, OPP_CAP_1, PHYSICAL_CAP):
            if center in cap:
                assert len(support & cap) <= 2
    for source, center in BLOCKER.items():
        assert source in CRITICAL_SUPPORT[center]
        assert CARRIER_ROW[center] == CRITICAL_SUPPORT[center]
        # In this finite radius-class abstraction, the displayed critical
        # support is the sole positive K4 class at its center.  Deleting its
        # source therefore leaves only three members of that class.
        assert len(CRITICAL_SUPPORT[center] - {source}) == 3
    assert max(map(len, blocker_fibers().values())) <= 4
    assert sum(len(fiber) >= 2 for fiber in blocker_fibers().values()) >= 2

    # Exact selected-row consequence of global minimality: one K4 row centered
    # at every carrier point, support-locked at every blocker center, has no
    # proper sink.  This is a projection of minimality, not full minimality.
    assert set(CARRIER_ROW) == A
    assert all(len(row) == 4 and center not in row
               for center, row in CARRIER_ROW.items())
    for center, row in CARRIER_ROW.items():
        for cap in (SURPLUS_CAP, OPP_CAP_1, PHYSICAL_CAP):
            if center in cap:
                assert len(row & cap) <= 2
    assert selected_row_graph_is_strongly_connected()

    # Stronger finite minimality regression: declare every unspecified
    # positive-radius color to be a singleton, verify that these are complete
    # partitions, and exhaust all nonempty proper carrier subsets.  None has
    # a four-point radius class at every one of its own centers.
    for center in A:
        partition = complete_radius_partition(center)
        assert set().union(*partition) == A - {center}
        assert sum(map(len, partition)) == len(A) - 1
    assert not has_proper_abstract_k4_subset()

    # All-reverse transition, exact 2+2 rows, and the exact-seven collision.
    positions = {point: index for index, point in enumerate(PHYSICAL_ORDER)}
    reverse_centers: list[int] = []
    reverse_pairs: list[frozenset[int]] = []
    for edge, source in enumerate(CYCLE_SOURCES):
        successor = CYCLE_SOURCES[(edge + 1) % len(CYCLE_SOURCES)]
        row = reverse_row(edge)
        center = BLOCKER[successor]
        pair = reverse_outside_pair(edge)

        assert successor not in CRITICAL_SUPPORT[BLOCKER[source]]
        assert source in row
        assert successor in row
        assert center in PHYSICAL_INTERIOR
        assert row & PHYSICAL_CAP == {source, successor}
        assert len(pair) == 2

        lo, hi = sorted((positions[source], positions[successor]))
        assert lo < positions[center] < hi
        reverse_centers.append(center)
        reverse_pairs.append(pair)

    assert BLOCKER[11] == 12
    assert BLOCKER[11] == CYCLE_SOURCES[1]
    assert len(set(reverse_centers)) == 3
    assert len(set(reverse_pairs)) == 3

    # The target-negating condition: every exact outside pair uses two
    # different first-apex radius colors.
    for pair in reverse_pairs:
        a, b = tuple(pair)
        assert first_apex_radius_color(a) != first_apex_radius_color(b)


if __name__ == "__main__":
    check()
    print("PASS: exact finite exact-seven global-marginal countermodel")
    print("status=EXACT_FINITE_ABSTRACT_RADIUS_MINIMAL_NOT_EUCLIDEAN_NOT_GLOBAL_NOM44")
    print(f"carrier={len(A)} cap_profile="
          f"{(len(SURPLUS_CAP), len(OPP_CAP_1), len(PHYSICAL_CAP))}")
    print(f"physical_order={PHYSICAL_ORDER}")
    print(f"cycle_sources={CYCLE_SOURCES}")
    print(f"reverse_centers={[BLOCKER[CYCLE_SOURCES[(i + 1) % 3]] for i in range(3)]}")
    print(f"reverse_pairs={[reverse_outside_pair(i) for i in range(3)]}")
    print("collision=blocker(11)=12=successor(11)")
    print("selected_row_graph=strongly_connected")
    print("proper_abstract_k4_subset=none_exhaustive_32766")
    print("all reverse outside pairs have distinct first-apex radius colors")
