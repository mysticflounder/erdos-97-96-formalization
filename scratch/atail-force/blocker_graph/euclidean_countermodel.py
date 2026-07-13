"""Exact Euclidean separation of blocker cycles from the K-A-PAIR producer.

The fixed integer-coordinate set below has 33 points.  Every carrier point is
the center of a distance class of cardinality at least four.  Deleting any one
point destroys that global property, and the checker explicitly chooses a
surviving center and exact four-point shell witnessing the corresponding
``CriticalShellSystem`` field.  Hence its chosen blocker map has genuine
functional-graph cycles.

For the two fixed carrier centers ``APEX1`` and ``APEX2``, however, the map

    x |-> (sqdist(APEX1, x), sqdist(APEX2, x))

is injective.  Thus there is no shared-radius pair at those centers, even
before removing a surplus subset.

This is not a counterexample to K-A-PAIR: the set is deliberately non-convex
and carries no Moser/cap packet.  It is a counterexample only to any proposed
derivation that uses cardinality, global K4, and the blocker-cycle API without
additional convex/cap/full-filter localization.
"""

from __future__ import annotations

from collections import Counter, defaultdict
import hashlib
import json


Point = tuple[int, int]

A: tuple[Point, ...] = (
    (0, 0),
    (0, 1),
    (0, 5),
    (0, 6),
    (1, 0),
    (1, 1),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (5, 0),
    (5, 1),
    (5, 2),
    (5, 3),
    (5, 5),
    (5, 6),
    (6, 0),
    (6, 1),
    (6, 5),
    (6, 6),
)

APEX1: Point = (3, 4)
APEX2: Point = (5, 1)

EXPECTED_CONSTRUCTION_SHA256 = (
    "a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5"
)


def sqdist(p: Point, q: Point) -> int:
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def distance_classes(center: Point, carrier: frozenset[Point]) -> dict[int, set[Point]]:
    classes: dict[int, set[Point]] = defaultdict(set)
    for point in carrier:
        if point != center:
            classes[sqdist(center, point)].add(point)
    return dict(classes)


def has_global_k4(carrier: frozenset[Point]) -> bool:
    return all(
        max(map(len, distance_classes(center, carrier).values()), default=0) >= 4
        for center in carrier
    )


def blocker_candidates(source: Point, carrier: frozenset[Point]) -> list[Point]:
    deleted = carrier - {source}
    return sorted(
        center
        for center in deleted
        if max(map(len, distance_classes(center, deleted).values()), default=0) < 4
    )


def chosen_shell(
    source: Point, center: Point, carrier: frozenset[Point]
) -> tuple[int, frozenset[Point]]:
    classes = distance_classes(center, carrier)
    radii = sorted(radius for radius, points in classes.items() if len(points) >= 4)
    assert len(radii) == 1
    radius = radii[0]
    support = frozenset(classes[radius])
    assert len(support) == 4
    assert source in support
    return radius, support


def functional_cycles(blocker: dict[Point, Point]) -> list[list[Point]]:
    globally_seen: set[Point] = set()
    cycles: list[list[Point]] = []
    for start in A:
        if start in globally_seen:
            continue
        path: list[Point] = []
        index: dict[Point, int] = {}
        point = start
        while point not in index and point not in globally_seen:
            index[point] = len(path)
            path.append(point)
            point = blocker[point]
        if point in index:
            cycles.append(path[index[point] :])
        globally_seen.update(path)
    return cycles


def check() -> dict[str, object]:
    carrier = frozenset(A)
    construction_payload = {"points": A, "apex1": APEX1, "apex2": APEX2}
    construction_sha256 = hashlib.sha256(
        json.dumps(
            construction_payload, sort_keys=True, separators=(",", ":")
        ).encode()
    ).hexdigest()
    assert construction_sha256 == EXPECTED_CONSTRUCTION_SHA256
    assert len(carrier) == len(A) == 33
    assert APEX1 in carrier and APEX2 in carrier and APEX1 != APEX2

    # Exact global-K4 and deletion-minimality checks.
    assert has_global_k4(carrier)
    assert all(not has_global_k4(carrier - {source}) for source in carrier)

    blocker: dict[Point, Point] = {}
    shells: dict[Point, tuple[int, frozenset[Point]]] = {}
    for source in A:
        candidates = blocker_candidates(source, carrier)
        assert candidates
        center = candidates[0]
        assert center != source
        blocker[source] = center
        shells[source] = chosen_shell(source, center, carrier)

        # This is the exact deletion-blocker field of CriticalShellSystem.
        deleted_classes = distance_classes(center, carrier - {source})
        assert max(map(len, deleted_classes.values()), default=0) < 4

    cycles = functional_cycles(blocker)
    assert cycles
    assert all(len(cycle) >= 2 for cycle in cycles)

    # Critical shells at distinct chosen centers obey the Euclidean two-circle
    # overlap ceiling.  Repeated sources at one center intentionally select the
    # same exact shell.
    support_at_center: dict[Point, frozenset[Point]] = {}
    for source, center in blocker.items():
        support = shells[source][1]
        if center in support_at_center:
            assert support_at_center[center] == support
        else:
            support_at_center[center] = support
    overlaps = []
    centers = sorted(support_at_center)
    for i, center1 in enumerate(centers):
        for center2 in centers[i + 1 :]:
            overlap = len(support_at_center[center1] & support_at_center[center2])
            overlaps.append(overlap)
            assert overlap <= 2

    # Exact squared distances suffice for equality.  Injectivity of this map
    # says every two-apex joint exact-radius fiber has cardinality one.
    joint_fibers: dict[tuple[int, int], list[Point]] = defaultdict(list)
    for point in A:
        joint_fibers[(sqdist(APEX1, point), sqdist(APEX2, point))].append(point)
    assert max(map(len, joint_fibers.values())) == 1

    # Explicit witness that the set is not convex independent: (3,3) is the
    # midpoint of two other carrier points.
    assert (3, 1) in carrier and (3, 3) in carrier and (3, 5) in carrier
    assert (2 * 3, 2 * 3) == (3 + 3, 1 + 5)

    return {
        "status": "PASS",
        "trust_boundary": "exhaustive exact integer arithmetic in Python; not Lean-kernel checked",
        "construction_sha256": construction_sha256,
        "cardinality": len(carrier),
        "global_k4": True,
        "every_single_deletion_breaks_global_k4": True,
        "chosen_blocker_cycle_lengths": sorted(map(len, cycles)),
        "chosen_blocker_cycles": cycles,
        "max_distinct_chosen_center_shell_overlap": max(overlaps),
        "apices": [APEX1, APEX2],
        "max_two_apex_joint_fiber": max(map(len, joint_fibers.values())),
        "convex_independent": False,
        "nonconvex_midpoint_witness": [(3, 1), (3, 3), (3, 5)],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
