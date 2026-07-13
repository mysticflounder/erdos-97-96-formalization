"""Exact finite countermodel to the blocker-graph abstraction used by ATAIL.

This is deliberately not claimed to be a Euclidean realization.  It retains
the equality/incidence facts exposed by ``CriticalShellSystem.blockerVertex``
and the selected-four API:

* twelve carrier vertices;
* one exact four-point class at every center;
* a genuine deletion-blocker for every source;
* a spanning blocker cycle;
* at most two common selected points for distinct centers; and
* symmetric distance-equality labels.

Nevertheless, the two fixed centers called ``apex1`` and ``apex2`` have no
two-point joint distance fiber, even before removing a surplus subset.
"""

from __future__ import annotations

from collections import defaultdict
import json


N = 12
VERTICES = tuple(range(N))
OFFSETS = frozenset({1, 2, 3, 5})
APEX1 = 0
APEX2 = 4
SURPLUS = frozenset({0, 1, 2, 3, 4})


def support(center: int) -> frozenset[int]:
    """The unique four-point selected/full class at ``center``."""

    return frozenset((center + offset) % N for offset in OFFSETS)


def blocker(source: int) -> int:
    """The chosen deletion-blocker center for ``source``."""

    return (source - 1) % N


def distance_label(x: int, y: int) -> tuple[object, ...]:
    """A symmetric abstraction of the equality type of ``dist x y``.

    The offsets have no opposite pair.  Consequently an unordered edge is in
    at most one chosen support relation, so every center may have its own
    radius label.  Every other edge receives a fresh label.
    """

    if x == y:
        return ("zero",)
    if y in support(x):
        return ("radius", x)
    if x in support(y):
        return ("radius", y)
    return ("edge", min(x, y), max(x, y))


def classes_at(center: int, deleted: frozenset[int] = frozenset()) -> dict:
    classes: dict[tuple[object, ...], list[int]] = defaultdict(list)
    for point in VERTICES:
        if point not in deleted:
            classes[distance_label(center, point)].append(point)
    return dict(classes)


def joint_fibers(c1: int, c2: int, retained: frozenset[int]) -> dict:
    fibers: dict[tuple[tuple[object, ...], tuple[object, ...]], list[int]] = (
        defaultdict(list)
    )
    for point in retained:
        fibers[(distance_label(c1, point), distance_label(c2, point))].append(point)
    return dict(fibers)


def check() -> dict[str, object]:
    # Symmetric distance-equality labels.
    for x in VERTICES:
        for y in VERTICES:
            assert distance_label(x, y) == distance_label(y, x)

    # Global K4 and exactness: each center has exactly one class of size four,
    # namely its declared support; all remaining classes are singletons.
    for center in VERTICES:
        classes = classes_at(center)
        large = [set(points) for points in classes.values() if len(points) >= 4]
        assert large == [set(support(center))]
        assert center not in support(center)
        assert len(support(center)) == 4

    # Every source lies on the shell at its blocker; deleting it destroys the
    # only K4 at that center.
    for source in VERTICES:
        center = blocker(source)
        assert center != source
        assert source in support(center)
        assert max(map(len, classes_at(center, frozenset({source})).values())) < 4

    # The blocker map is one spanning 12-cycle.
    orbit = []
    point = 0
    while point not in orbit:
        orbit.append(point)
        point = blocker(point)
    assert point == 0
    assert len(orbit) == N

    # This is the selected-class intersection ceiling available from the
    # two-circle theorem for distinct centers.
    intersections = {
        (c1, c2): len(support(c1) & support(c2))
        for c1 in VERTICES
        for c2 in VERTICES
        if c1 < c2
    }
    assert max(intersections.values()) <= 2

    # Yet the fixed apex pair has no two-point joint fiber.  Removing surplus
    # points cannot increase a fiber, so the off-surplus target also fails.
    all_fibers = joint_fibers(APEX1, APEX2, frozenset(VERTICES))
    off_fibers = joint_fibers(
        APEX1, APEX2, frozenset(VERTICES) - SURPLUS
    )
    assert max(map(len, all_fibers.values())) == 1
    assert max(map(len, off_fibers.values())) == 1

    return {
        "status": "PASS",
        "scope": "finite symmetric distance-equality abstraction; not Euclidean",
        "cardinality": N,
        "offsets": sorted(OFFSETS),
        "blocker_cycle": orbit,
        "max_distinct_center_support_intersection": max(intersections.values()),
        "apices": [APEX1, APEX2],
        "apex_support_intersection": sorted(support(APEX1) & support(APEX2)),
        "max_joint_fiber_all_points": max(map(len, all_fibers.values())),
        "surplus": sorted(SURPLUS),
        "max_joint_fiber_off_surplus": max(map(len, off_fibers.values())),
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
