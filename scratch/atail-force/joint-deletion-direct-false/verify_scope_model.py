#!/usr/bin/env python3
"""Replay the joint-deletion incidence-scope fixture.

This is deliberately not a Euclidean realization and not a counterexample to
the Lean theorem.  It checks that the named finite support/cap projections of
the live joint-deletion leaf do not, by themselves, force the two-dangerous-
point incidence needed by the nearest checked U5 consumer.
"""

from itertools import combinations


carrier = set(range(14))

# Normalized card-fourteen cap profile (5, 6, 6), with pairwise endpoint
# overlaps and three distinguished apices 0, 4, 9.
caps = {
    "surplus": {0, 1, 2, 3, 4},
    "opp1": {4, 5, 6, 7, 8, 9},
    "opp2": {9, 10, 11, 12, 13, 0},
}
endpoints = {
    "surplus": {0, 4},
    "opp1": {4, 9},
    "opp2": {9, 0},
}

roles = {
    "first_apex": 0,
    "second_apex": 4,
    "surplus_apex": 9,
    "frontier_q": 5,
    "frontier_w": 6,
    "walk_first": 7,
    "walk_second": 8,
    "joint_source": 13,
    "frontier_blocker": 9,
    "first_blocker": 10,
    "second_blocker": 11,
    "joint_source_blocker": 12,
    "frontier_escape": 1,
}

first_radius_class = {5, 6, 7, 8, 13}
dangerous = {5, 6, 8}

# Each entry is (center, support).  Rows sharing a center may be different
# four-subsets of one larger exact radius class.  At a critical center the
# q-deleted row is chosen equal to that center's exact critical support.
rows = {
    # First-apex q-deleted rows used by the source-return and frontier packets.
    "joint_at_first_apex": (0, {5, 6, 7, 8}),
    "frontier_q_at_first_apex": (0, {6, 7, 8, 13}),
    "escape_at_first_apex": (0, {5, 6, 7, 8}),
    "frontier_w_at_first_apex": (0, {5, 7, 8, 13}),
    # Physical-second-apex rows.
    "frontier_q_at_second_apex": (4, {1, 9, 12, 13}),
    "joint_at_second_apex": (4, {0, 7, 10, 11}),
    # Exact selected critical shells and the q-deleted rows using them.
    "frontier_q_critical": (9, {2, 3, 5, 13}),
    "escape_at_frontier_blocker": (9, {2, 3, 5, 13}),
    "frontier_w_at_frontier_blocker": (9, {2, 3, 5, 13}),
    "walk_first_critical": (10, {3, 4, 6, 7}),
    "joint_at_first_blocker": (10, {3, 4, 6, 7}),
    "walk_second_critical": (11, {1, 3, 8, 12}),
    "joint_at_second_blocker": (11, {1, 3, 8, 12}),
    "joint_source_critical": (12, {1, 5, 10, 13}),
}

deleted_source = {
    "joint_at_first_apex": 13,
    "joint_at_second_apex": 13,
    "joint_at_first_blocker": 13,
    "joint_at_second_blocker": 13,
    "frontier_q_at_first_apex": 5,
    "frontier_q_at_second_apex": 5,
    "escape_at_first_apex": 1,
    "escape_at_frontier_blocker": 1,
    "frontier_w_at_first_apex": 6,
    "frontier_w_at_frontier_blocker": 6,
}


def check_cap_profile() -> None:
    assert {name: len(cap) for name, cap in caps.items()} == {
        "surplus": 5,
        "opp1": 6,
        "opp2": 6,
    }
    assert set().union(*caps.values()) == carrier
    assert caps["surplus"] & caps["opp1"] == {4}
    assert caps["opp1"] & caps["opp2"] == {9}
    assert caps["opp2"] & caps["surplus"] == {0}
    assert roles["walk_first"] in caps["opp1"] - endpoints["opp1"]
    assert roles["walk_second"] in caps["opp1"] - endpoints["opp1"]


def check_rows() -> None:
    for name, (center, support) in rows.items():
        assert len(support) == 4, name
        assert support <= carrier, name
        assert center not in support, name
        if name in deleted_source:
            assert deleted_source[name] not in support, name

    # Every pair of distinct-center circles has at most two named common
    # support points.  This is the finite shadow of the two-circle bound.
    for (left_name, (left_center, left)), (right_name, (right_center, right)) in combinations(
        rows.items(), 2
    ):
        if left_center != right_center:
            assert len(left & right) <= 2, (left_name, right_name, left & right)

    # A circle centered at a point of a cap contains at most two further cap
    # vertices, sharpened to one when the center is a cap endpoint.
    for name, (center, support) in rows.items():
        for cap_name, cap in caps.items():
            if center in cap:
                bound = 1 if center in endpoints[cap_name] else 2
                assert len(support & cap) <= bound, (name, cap_name, support & cap)


def check_live_projections() -> None:
    q = roles["joint_source"]
    p = roles["first_apex"]
    p2 = roles["second_apex"]
    b1 = roles["first_blocker"]
    b2 = roles["second_blocker"]
    c = roles["joint_source_blocker"]

    assert q in first_radius_class
    assert dangerous <= first_radius_class - {q}
    assert len(dangerous) == 3
    assert q not in rows["walk_first_critical"][1]
    assert q not in rows["walk_second_critical"][1]
    assert b1 != b2

    critical_sources = {
        "frontier_q_critical": roles["frontier_q"],
        "walk_first_critical": roles["walk_first"],
        "walk_second_critical": roles["walk_second"],
        "joint_source_critical": q,
    }
    for name, source in critical_sources.items():
        assert source in rows[name][1], name

    # Same-center coherence in this fixture: all first-apex rows are selected
    # from one five-point radius class; rows at each critical center use that
    # exact critical support; and the two physical-second-apex supports are
    # disjoint radius classes.
    for name in (
        "joint_at_first_apex",
        "frontier_q_at_first_apex",
        "escape_at_first_apex",
        "frontier_w_at_first_apex",
    ):
        assert rows[name][1] <= first_radius_class, name
    assert rows["frontier_q_critical"][1] == rows["escape_at_frontier_blocker"][1]
    assert rows["frontier_q_critical"][1] == rows["frontier_w_at_frontier_blocker"][1]
    assert rows["walk_first_critical"][1] == rows["joint_at_first_blocker"][1]
    assert rows["walk_second_critical"][1] == rows["joint_at_second_blocker"][1]
    assert rows["frontier_q_at_second_apex"][1].isdisjoint(
        rows["joint_at_second_apex"][1]
    )

    # The two disjoint physical-second-apex four-classes witness deletion
    # robustness for every carrier source: any one deletion leaves one entire
    # class untouched.
    physical_classes = (
        rows["frontier_q_at_second_apex"][1],
        rows["joint_at_second_apex"][1],
    )
    for source in carrier:
        assert any(source not in support for support in physical_classes)

    # The joint source has q-deleted rows at four pairwise-distinct centers.
    deletion_centers = {p, p2, b1, b2}
    assert len(deletion_centers) == 4
    for name in (
        "joint_at_first_apex",
        "joint_at_second_apex",
        "joint_at_first_blocker",
        "joint_at_second_blocker",
    ):
        assert rows[name][0] in deletion_centers
        assert q not in rows[name][1]

    # Its actual q-critical center is a fifth center, distinct from the four
    # deletion-survival centers, and its full critical support contains q.
    assert c not in deletion_centers
    critical_support = rows["joint_source_critical"][1]
    assert q in critical_support
    critical_triple = critical_support - {q}
    assert len(critical_triple) == 3

    # Exact source-return packet overlap bounds.
    packet_pairs = (
        ("joint_at_first_apex", "joint_at_first_blocker"),
        ("joint_at_first_apex", "joint_at_second_blocker"),
        ("frontier_q_at_first_apex", "frontier_q_at_second_apex"),
        ("escape_at_first_apex", "escape_at_frontier_blocker"),
        ("frontier_w_at_first_apex", "frontier_w_at_frontier_blocker"),
    )
    for left, right in packet_pairs:
        assert len(rows[left][1] & rows[right][1]) <= 2, (left, right)

    # N.frontierEscape: the stored second-apex row contains the escape, but
    # the frontier-q critical support contains neither the escape nor w.
    escape = roles["frontier_escape"]
    frontier_w = roles["frontier_w"]
    assert escape in rows["frontier_q_at_second_apex"][1]
    assert escape not in rows["frontier_q_critical"][1]
    assert frontier_w not in rows["frontier_q_critical"][1]
    assert len(rows["frontier_q_at_second_apex"][1] & first_radius_class) <= 1

    # Nearest checked U5 sink is deliberately absent: the actual q-critical
    # triple contains only one dangerous point, not a distinct pair.
    assert critical_triple & dangerous == {5}
    assert len(critical_triple & dangerous) < 2


check_cap_profile()
check_rows()
check_live_projections()

print("PASS: joint-deletion named incidence/cap scope is compatible")
print("four q-deletion centers = {0, 4, 10, 11}; q-critical center = 12")
print("actual q-critical triple intersects dangerous T in exactly one point")
print("scope only: not a Euclidean realization and not a theorem counterexample")
