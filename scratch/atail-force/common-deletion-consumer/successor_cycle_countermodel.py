"""Exact regression model for common-deletion successor cycling.

This model deliberately stops at the finite symmetric distance-equality
abstraction.  It is not a Euclidean realization and does not model convexity,
minimum enclosing circles, or ordered caps.  Within that stated abstraction
it retains substantially more than the bare successor graph:

* a symmetric distance-equality label on 24 carrier vertices;
* one or three exact four-point radius classes at every center;
* the distinct-center two-circle intersection ceiling for every declared
  exact four-class;
* global K4 and a total deletion-critical shell/blocker assignment;
* deletion survival at two fixed centers for every source;
* exact common-deletion packets at every source; and
* a three-cycle whose edges lie in a current row, avoid the current critical
  shell, and change the retained blocker.

No source is deletion-critical at either fixed center, so the prescribed
aligned-pair arm is absent.  Thus generic finite recursion really can end in a
nontrivial periodic orbit; eliminating it must use provenance not present in
``CommonDeletionTwoCenterPacket``.
"""

from __future__ import annotations

from collections import defaultdict
import hashlib
import json


N = 24
VERTICES = tuple(range(N))
BASE_OFFSETS = frozenset({1, 2, 3, 5})
FIXED_CENTERS = (0, 12)
CENTER_1, CENTER_2 = FIXED_CENTERS

# These classes are pairwise disjoint at each center.  Every class also meets
# every exact four-class at a distinct center in at most two points.
FIXED_CLASSES: dict[int, tuple[frozenset[int], ...]] = {
    CENTER_1: (
        frozenset({1, 2, 3, 5}),
        frozenset({4, 6, 7, 11}),
        frozenset({8, 9, 13, 14}),
    ),
    CENTER_2: (
        frozenset({13, 14, 15, 17}),
        frozenset({1, 2, 6, 8}),
        frozenset({3, 4, 16, 18}),
    ),
}

# At these sources the canonical packet rows and chosen successor are fixed so
# that the successor map contains the displayed nontrivial cycle.
CYCLE = (1, 4, 8)
CYCLE_PACKET_INDICES = {
    1: (1, 0),
    4: (2, 0),
    8: (0, 0),
}
CYCLE_SUCCESSOR = {1: 4, 4: 8, 8: 1}
CYCLE_BLOCKER = {1: 22, 4: 2, 8: 7}

# Filled after the first exact run.  It hashes only the finite model data, not
# presentation details or Python source formatting.
EXPECTED_MODEL_SHA256 = "f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b"


def base_support(center: int) -> frozenset[int]:
    return frozenset((center + offset) % N for offset in BASE_OFFSETS)


def radius_classes(center: int) -> tuple[frozenset[int], ...]:
    if center in FIXED_CLASSES:
        return FIXED_CLASSES[center]
    return (base_support(center),)


def blocker(source: int) -> int:
    """A total blocker assignment which never uses either fixed center."""

    if source in CYCLE_BLOCKER:
        return CYCLE_BLOCKER[source]
    for offset in sorted(BASE_OFFSETS):
        candidate = (source - offset) % N
        if candidate not in FIXED_CENTERS:
            return candidate
    raise AssertionError("every source has an ordinary predecessor center")


def declared_radius_owners(x: int, y: int) -> list[tuple[int, int]]:
    """Declared radius classes containing the unordered edge ``{x,y}``."""

    owners: list[tuple[int, int]] = []
    for center, point in ((x, y), (y, x)):
        for index, row in enumerate(radius_classes(center)):
            if point in row:
                owners.append((center, index))
    return owners


def distance_label(x: int, y: int) -> tuple[object, ...]:
    """Symmetric equality label for the abstract distance of ``x`` and ``y``."""

    if x == y:
        return ("zero",)
    owners = declared_radius_owners(x, y)
    assert len(owners) <= 1
    if owners:
        center, index = owners[0]
        return ("radius", center, index)
    return ("edge", min(x, y), max(x, y))


def classes_at(
    center: int, deleted: frozenset[int] = frozenset()
) -> dict[tuple[object, ...], list[int]]:
    classes: dict[tuple[object, ...], list[int]] = defaultdict(list)
    for point in VERTICES:
        if point not in deleted:
            classes[distance_label(center, point)].append(point)
    return dict(classes)


def large_classes_at(
    center: int, deleted: frozenset[int] = frozenset()
) -> list[frozenset[int]]:
    return [
        frozenset(points)
        for points in classes_at(center, deleted).values()
        if len(points) >= 4
    ]


def packet_rows(source: int) -> tuple[frozenset[int], frozenset[int]]:
    if source in CYCLE_PACKET_INDICES:
        index_1, index_2 = CYCLE_PACKET_INDICES[source]
        return (
            FIXED_CLASSES[CENTER_1][index_1],
            FIXED_CLASSES[CENTER_2][index_2],
        )
    row_1 = next(row for row in FIXED_CLASSES[CENTER_1] if source not in row)
    row_2 = next(row for row in FIXED_CLASSES[CENTER_2] if source not in row)
    return row_1, row_2


def critical_shell(source: int) -> frozenset[int]:
    return base_support(blocker(source))


def fresh_candidates(source: int) -> frozenset[int]:
    row_1, row_2 = packet_rows(source)
    return (row_1 | row_2) - critical_shell(source)


def successor(source: int) -> int:
    if source in CYCLE_SUCCESSOR:
        return CYCLE_SUCCESSOR[source]
    return min(fresh_candidates(source))


def model_payload() -> dict[str, object]:
    return {
        "cardinality": N,
        "base_offsets": sorted(BASE_OFFSETS),
        "fixed_centers": list(FIXED_CENTERS),
        "fixed_classes": {
            str(center): [sorted(row) for row in rows]
            for center, rows in FIXED_CLASSES.items()
        },
        "cycle": list(CYCLE),
        "cycle_packet_indices": {
            str(source): list(indices)
            for source, indices in CYCLE_PACKET_INDICES.items()
        },
        "cycle_successor": {
            str(source): target for source, target in CYCLE_SUCCESSOR.items()
        },
        "cycle_blocker": {
            str(source): center for source, center in CYCLE_BLOCKER.items()
        },
        "total_blocker_map": [blocker(source) for source in VERTICES],
        "total_successor_map": [successor(source) for source in VERTICES],
    }


def model_sha256() -> str:
    encoded = json.dumps(
        model_payload(), sort_keys=True, separators=(",", ":")
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def check() -> dict[str, object]:
    # Every unordered edge has at most one declared radius owner, so the labels
    # are well-defined and symmetric.
    for x in VERTICES:
        for y in VERTICES:
            if x != y:
                assert len(declared_radius_owners(x, y)) <= 1
            assert distance_label(x, y) == distance_label(y, x)

    # Exact declared classes and global K4 at every center.
    for center in VERTICES:
        declared = set(radius_classes(center))
        observed = set(large_classes_at(center))
        assert observed == declared
        assert all(len(row) == 4 for row in declared)
        assert all(center not in row for row in declared)

    # The two-circle intersection ceiling holds for every pair of declared
    # exact four-classes at distinct centers, including the extra fixed-center
    # rows rather than only the cyclic base classes.
    intersection_sizes: dict[tuple[int, int, int, int], int] = {}
    for center_1 in VERTICES:
        for center_2 in VERTICES:
            if center_1 >= center_2:
                continue
            for index_1, row_1 in enumerate(radius_classes(center_1)):
                for index_2, row_2 in enumerate(radius_classes(center_2)):
                    intersection_sizes[(center_1, index_1, center_2, index_2)] = (
                        len(row_1 & row_2)
                    )
    assert max(intersection_sizes.values()) <= 2

    # Total deletion-critical shell system.  Each chosen blocker is ordinary,
    # its unique four-class contains the source, and deletion destroys K4
    # there.
    for source in VERTICES:
        center = blocker(source)
        assert center not in FIXED_CENTERS
        assert center != source
        assert source in critical_shell(source)
        assert large_classes_at(center, frozenset({source})) == []

    # Every source survives deletion at both fixed centers.  In fact at least
    # two exact K4 classes remain, so neither fixed center can be a prescribed
    # critical blocker for any source.
    for source in VERTICES:
        for center in FIXED_CENTERS:
            assert len(large_classes_at(center, frozenset({source}))) >= 2

    # Exact common-deletion packet and fresh-successor conditions at every
    # source, not only at the displayed cycle.
    for source in VERTICES:
        row_1, row_2 = packet_rows(source)
        deleted = frozenset({source})
        assert source not in row_1
        assert source not in row_2
        assert len(row_1) == len(row_2) == 4
        assert row_1 in large_classes_at(CENTER_1, deleted)
        assert row_2 in large_classes_at(CENTER_2, deleted)
        assert len(row_1 & row_2) <= 2

        fresh = fresh_candidates(source)
        assert len(fresh) >= 3
        for point in fresh:
            assert point != source
            assert point not in critical_shell(source)
            assert blocker(point) != blocker(source)
            for center in FIXED_CENTERS:
                assert large_classes_at(center, frozenset({point}))

        target = successor(source)
        assert target in fresh
        assert blocker(target) != blocker(source)

    # The selected map contains the promised genuine period-three orbit.
    point = CYCLE[0]
    observed_cycle = []
    while point not in observed_cycle:
        observed_cycle.append(point)
        point = successor(point)
    assert point == CYCLE[0]
    assert tuple(observed_cycle) == CYCLE

    digest = model_sha256()
    assert digest == EXPECTED_MODEL_SHA256

    cycle_edges = []
    for source in CYCLE:
        row_1, row_2 = packet_rows(source)
        target = successor(source)
        cycle_edges.append(
            {
                "source": source,
                "target": target,
                "rows": [sorted(row_1), sorted(row_2)],
                "critical_shell": sorted(critical_shell(source)),
                "source_blocker": blocker(source),
                "target_blocker": blocker(target),
            }
        )

    return {
        "status": "PASS",
        "scope": (
            "exact finite symmetric distance-equality/global-K4/total-critical-"
            "shell abstraction; not Euclidean, convex, MEC, cap-ordered, or a "
            "CounterexampleData realization"
        ),
        "model_sha256": digest,
        "cardinality": N,
        "fixed_centers": list(FIXED_CENTERS),
        "fixed_center_class_counts": {
            str(center): len(FIXED_CLASSES[center]) for center in FIXED_CENTERS
        },
        "max_distinct_center_exact_class_intersection": max(
            intersection_sizes.values()
        ),
        "total_deletion_critical_sources": N,
        "common_deletion_survivor_sources": N,
        "minimum_fresh_successors_per_packet": min(
            len(fresh_candidates(source)) for source in VERTICES
        ),
        "aligned_fixed_center_critical_sources": 0,
        "successor_cycle": observed_cycle,
        "cycle_edges": cycle_edges,
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
