#!/usr/bin/env python3
"""Exact finite regression for the reoriented unique-five reverse-pair target.

The model is exact for the declared finite radius partitions, cap-incidence
projection, total critical map, and exhaustive abstract minimality check.  It
is not a Euclidean realization and does not model the production quantifier
over every alternative ``SurplusCapPacket`` in ``noM44``.
"""

from __future__ import annotations

from collections import defaultdict, deque


CARRIER = set(range(15))

# These are the roles after reorientation into the production physical-cycle
# API.  Hence NEW_FIRST_APEX is the original packet's second apex, while
# NEW_SECOND_APEX is its original first apex.
NEW_FIRST_APEX = 0
NEW_SECOND_APEX = 1
SURPLUS_VERTEX = 2

SURPLUS_CAP = {0, 1, 5, 6, 7}
NEW_FIRST_OPPOSITE_CAP = {1, 2, 3, 8, 9, 10}
PHYSICAL_CAP = {2, 0, 4, 11, 12, 13, 14}
PHYSICAL_ORDER = [2, 11, 14, 12, 4, 13, 0]
PHYSICAL_INTERIOR = set(PHYSICAL_ORDER[1:-1])

# Original orientation of OriginalUniqueFiveInteriorResidual.
ORIGINAL_FIRST_APEX = NEW_SECOND_APEX
ORIGINAL_SECOND_APEX = NEW_FIRST_APEX
ORIGINAL_FIRST_OPPOSITE_CAP = PHYSICAL_CAP
ORIGINAL_FIRST_OPPOSITE_INTERIOR = PHYSICAL_INTERIOR

# The unique exact-five class at the original first apex.  Its three physical
# strict-cap members are precisely the omission-transition vertices.
ORIGINAL_FIRST_EXACT_FIVE = frozenset({11, 12, 13, 5, 8})
ORIGINAL_PAIR = frozenset({11, 12})
ORIGINAL_INTERIOR_PAIR = ORIGINAL_PAIR
PHYSICAL_VERTICES = ORIGINAL_FIRST_EXACT_FIVE & PHYSICAL_INTERIOR

# Two distinct K4 radius classes at the original second apex.  They witness
# every singleton deletion and survive simultaneous deletion of the original
# exact-five pair.
ORIGINAL_SECOND_RADIUS_CLASSES = (
    frozenset({3, 8, 6, 4}),
    frozenset({9, 10, 7, 14}),
)

# Total fixed-point-free critical choice.  Neither physical apex is a chosen
# blocker.  Equal blocker values are support-locked to one exact four-class.
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

# One K4 row at every carrier center.  At blocker centers it is definitionally
# the complete critical support.  At the two original physical apices it is a
# subrow of one of the displayed complete classes.
CARRIER_ROW = {
    **CRITICAL_SUPPORT,
    NEW_FIRST_APEX: ORIGINAL_SECOND_RADIUS_CLASSES[0],
    NEW_SECOND_APEX: frozenset({11, 12, 13, 5}),
    11: frozenset({0, 2, 6, 9}),
    13: frozenset({1, 4, 7, 10}),
}

# The global all-reverse transition on the three physical exact-five points.
SUCCESSOR = {11: 12, 12: 13, 13: 11}


def complete_radius_partition(center: int) -> tuple[frozenset[int], ...]:
    """Declared complete positive-radius partition at one abstract center."""
    if center == ORIGINAL_FIRST_APEX:
        large_classes = [ORIGINAL_FIRST_EXACT_FIVE]
    elif center == ORIGINAL_SECOND_APEX:
        large_classes = list(ORIGINAL_SECOND_RADIUS_CLASSES)
    else:
        large_classes = [CARRIER_ROW[center]]
    used = set().union(*large_classes)
    singletons = [frozenset({point}) for point in CARRIER - {center} - used]
    return tuple([*large_classes, *singletons])


def has_k4_after_deletion(center: int, deleted: set[int]) -> bool:
    return any(
        len(radius_class - deleted) >= 4
        for radius_class in complete_radius_partition(center)
    )


def blocker_fibers() -> dict[int, set[int]]:
    result: dict[int, set[int]] = defaultdict(set)
    for source, center in BLOCKER.items():
        result[center].add(source)
    return result


def selected_row_graph_is_strongly_connected() -> bool:
    adjacency = {center: set(CARRIER_ROW[center]) for center in CARRIER}
    for start in CARRIER:
        reached = {start}
        queue = deque([start])
        while queue:
            current = queue.popleft()
            for target in adjacency[current]:
                if target not in reached:
                    reached.add(target)
                    queue.append(target)
        if reached != CARRIER:
            return False
    return True


def has_proper_abstract_k4_subset() -> bool:
    """Exhaust the production minimality analogue in this radius system."""
    points = sorted(CARRIER)
    for mask in range(1, (1 << len(points)) - 1):
        subset = {points[i] for i in range(len(points)) if mask & (1 << i)}
        if all(
            any(len(radius_class & subset) >= 4
                for radius_class in complete_radius_partition(center))
            for center in subset
        ):
            return True
    return False


def reverse_row(source: int) -> frozenset[int]:
    return CRITICAL_SUPPORT[BLOCKER[SUCCESSOR[source]]]


def reverse_outside_pair(source: int) -> frozenset[int]:
    return reverse_row(source) - PHYSICAL_CAP


def original_second_radius_color(point: int) -> tuple[str, int]:
    for index, radius_class in enumerate(ORIGINAL_SECOND_RADIUS_CLASSES):
        if point in radius_class:
            return ("large", index)
    return ("singleton", point)


def check() -> None:
    # Standard cap-incidence projection, with the original roles made explicit.
    assert SURPLUS_CAP | NEW_FIRST_OPPOSITE_CAP | PHYSICAL_CAP == CARRIER
    assert SURPLUS_CAP & NEW_FIRST_OPPOSITE_CAP == {NEW_SECOND_APEX}
    assert SURPLUS_CAP & PHYSICAL_CAP == {NEW_FIRST_APEX}
    assert NEW_FIRST_OPPOSITE_CAP & PHYSICAL_CAP == {SURPLUS_VERTEX}
    assert sum(map(len, (SURPLUS_CAP, NEW_FIRST_OPPOSITE_CAP, PHYSICAL_CAP))) == 18
    assert set(PHYSICAL_ORDER) == PHYSICAL_CAP
    assert ORIGINAL_FIRST_OPPOSITE_CAP == PHYSICAL_CAP

    # Exact-five unique-arm projection and both retained double-deletion facts.
    assert len(ORIGINAL_FIRST_EXACT_FIVE) == 5
    assert PHYSICAL_VERTICES == {11, 12, 13}
    assert ORIGINAL_PAIR <= PHYSICAL_VERTICES
    assert ORIGINAL_INTERIOR_PAIR <= ORIGINAL_FIRST_OPPOSITE_INTERIOR
    assert ORIGINAL_PAIR.isdisjoint(SURPLUS_CAP)
    assert not has_k4_after_deletion(ORIGINAL_FIRST_APEX, set(ORIGINAL_PAIR))
    assert not has_k4_after_deletion(
        ORIGINAL_FIRST_APEX, set(ORIGINAL_INTERIOR_PAIR))
    for deleted in CARRIER:
        assert has_k4_after_deletion(ORIGINAL_FIRST_APEX, {deleted})
    assert has_k4_after_deletion(ORIGINAL_SECOND_APEX, set(ORIGINAL_PAIR))
    assert has_k4_after_deletion(
        ORIGINAL_SECOND_APEX, set(ORIGINAL_INTERIOR_PAIR))

    # Total, source-exact critical system and the blocker exclusions retained
    # by the original frontier.
    assert set(BLOCKER) == CARRIER
    assert ORIGINAL_FIRST_APEX not in BLOCKER.values()
    assert ORIGINAL_SECOND_APEX not in BLOCKER.values()
    assert all(source != center for source, center in BLOCKER.items())
    assert set(CRITICAL_SUPPORT) == set(BLOCKER.values())
    assert all(BLOCKER[source] != ORIGINAL_SECOND_APEX for source in ORIGINAL_PAIR)
    for center, support in CRITICAL_SUPPORT.items():
        assert len(support) == 4
        assert center not in support
        for cap in (SURPLUS_CAP, NEW_FIRST_OPPOSITE_CAP, PHYSICAL_CAP):
            if center in cap:
                assert len(support & cap) <= 2
    for source, center in BLOCKER.items():
        assert source in CRITICAL_SUPPORT[center]
        assert CARRIER_ROW[center] == CRITICAL_SUPPORT[center]
        assert len(CRITICAL_SUPPORT[center] - {source}) == 3
    assert max(map(len, blocker_fibers().values())) <= 4

    # A complete K4 radius partition at every center and exhaustive abstract
    # cardinal-minimality, not merely strong connectivity of one selected row.
    assert set(CARRIER_ROW) == CARRIER
    assert all(len(row) == 4 and center not in row
               for center, row in CARRIER_ROW.items())
    for center in CARRIER:
        partition = complete_radius_partition(center)
        assert set().union(*partition) == CARRIER - {center}
        assert sum(map(len, partition)) == len(CARRIER) - 1
    assert selected_row_graph_is_strongly_connected()
    assert not has_proper_abstract_k4_subset()

    # The all-reverse relation holds globally on all three physical vertices,
    # not only on the chosen successor edges.
    for source in PHYSICAL_VERTICES:
        own_support = CRITICAL_SUPPORT[BLOCKER[source]]
        for target in PHYSICAL_VERTICES:
            if target not in own_support:
                assert source in CRITICAL_SUPPORT[BLOCKER[target]]

    # The chosen transition is fixed-point-free, omits its successor in the
    # forward row, and has the reverse positive membership required by the
    # production terminal surface.
    positions = {point: index for index, point in enumerate(PHYSICAL_ORDER)}
    pairs = []
    for source in PHYSICAL_VERTICES:
        successor = SUCCESSOR[source]
        row = reverse_row(source)
        center = BLOCKER[successor]
        pair = reverse_outside_pair(source)
        assert successor != source
        assert successor not in CRITICAL_SUPPORT[BLOCKER[source]]
        assert source in row
        assert successor in row
        assert center in PHYSICAL_INTERIOR
        assert row & PHYSICAL_CAP == {source, successor}
        assert len(pair) == 2
        lo, hi = sorted((positions[source], positions[successor]))
        assert lo < positions[center] < hi
        pairs.append(pair)

    # Exact negation of the requested producer: every reverse outside pair is
    # split across two distinct radius colors at the original second apex.
    assert len(set(pairs)) == 3
    for pair in pairs:
        a, b = tuple(pair)
        assert original_second_radius_color(a) != original_second_radius_color(b)


if __name__ == "__main__":
    check()
    print("PASS: reoriented unique-five abstract countermodel")
    print("status=EXACT_FINITE_ABSTRACT_RADIUS_MINIMAL_NOT_EUCLIDEAN_NOT_GLOBAL_NOM44")
    print(f"carrier={len(CARRIER)} cap_profile="
          f"{(len(SURPLUS_CAP), len(PHYSICAL_CAP), len(NEW_FIRST_OPPOSITE_CAP))}")
    print(f"original_first_exact_five={sorted(ORIGINAL_FIRST_EXACT_FIVE)}")
    print(f"original_pair={sorted(ORIGINAL_PAIR)}")
    print(f"physical_vertices={sorted(PHYSICAL_VERTICES)}")
    print(f"reverse_pairs={[sorted(reverse_outside_pair(q)) for q in sorted(PHYSICAL_VERTICES)]}")
    print("global_all_reverse_membership=true")
    print("proper_abstract_k4_subset=none_exhaustive_32766")
    print("all reverse pairs split original-second-apex radius colors")
