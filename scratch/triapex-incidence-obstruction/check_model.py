"""Check the finite incidence obstruction for the tri-apex concentration route.

This is theorem-discovery evidence only.  It checks the exact finite
distance-equality shadow described in the companion audit; it does not encode
planarity, MEC geometry, convex independence, or the full Lean residual.
"""

from collections import Counter
from itertools import combinations


POINTS = frozenset(range(15))
NONAPICES = frozenset(range(12))
APICES = frozenset({12, 13, 14})

STRICT_CAPS = (
    frozenset({0, 1, 2, 3}),
    frozenset({4, 5, 6, 7}),
    frozenset({8, 9, 10, 11}),
)
RICH_CLASSES = (
    STRICT_CAPS[0] | {13, 14},
    STRICT_CAPS[1] | {12, 14},
    STRICT_CAPS[2] | {12, 13},
)
SHELLS = (
    frozenset({1, 6, 9, 14}),
    frozenset({2, 7, 10, 14}),
    frozenset({3, 7, 11, 13}),
    frozenset({0, 4, 10, 13}),
    frozenset({1, 5, 6, 8}),
    frozenset({3, 6, 10, 14}),
    frozenset({1, 7, 11, 14}),
    frozenset({3, 4, 11, 12}),
    frozenset({1, 5, 9, 11}),
    frozenset({1, 4, 11, 13}),
    frozenset({0, 7, 12, 13}),
    frozenset({3, 5, 12, 13}),
)
BLOCKER = (10, 4, 1, 7, 3, 8, 5, 2, 4, 0, 1, 6, 11, 9, 5)


def install_equal_distance_classes() -> dict[tuple[int, int], tuple[int, int]]:
    """Close the prescribed same-distance constraints under equality.

    An apex--apex edge belongs to the rich classes centered at both endpoints,
    so the corresponding radius classes must merge.  A disjoint-color
    assignment would therefore overconstrain the model.
    """
    edges = tuple(combinations(sorted(POINTS), 2))
    parent = {edge: edge for edge in edges}

    def find(edge: tuple[int, int]) -> tuple[int, int]:
        while parent[edge] != edge:
            parent[edge] = parent[parent[edge]]
            edge = parent[edge]
        return edge

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    def install(center: int, support: frozenset[int]) -> None:
        star = [tuple(sorted((center, point))) for point in support]
        assert all(edge[0] != edge[1] for edge in star)
        for edge in star[1:]:
            union(star[0], edge)

    for center, support in enumerate(SHELLS):
        install(center, support)
    for apex, support in zip(sorted(APICES), RICH_CLASSES, strict=True):
        install(apex, support)

    return {edge: find(edge) for edge in edges}


def has_k4(
    carrier: frozenset[int],
    colors: dict[tuple[int, int], tuple[int, int]],
) -> bool:
    """Finite equality-shadow form of the per-center K4 property."""
    for center in carrier:
        counts = Counter(
            colors[tuple(sorted((center, point)))]
            for point in carrier
            if point != center
        )
        if not counts or max(counts.values()) < 4:
            return False
    return True


def main() -> None:
    assert all(len(cap) == 4 for cap in STRICT_CAPS)
    assert all(len(rich) == 6 for rich in RICH_CLASSES)
    assert all(len(shell) == 4 for shell in SHELLS)

    assert all(source in SHELLS[BLOCKER[source]] for source in POINTS)
    assert all(BLOCKER[source] != source for source in POINTS)
    assert set(BLOCKER).isdisjoint(APICES)
    fibers = Counter(BLOCKER)
    assert max(fibers.values()) == 2
    assert sorted(fibers.values()).count(2) == 3

    assert max(len(left & right) for left, right in combinations(SHELLS, 2)) <= 2
    assert max(len(shell & rich) for shell in SHELLS for rich in RICH_CLASSES) <= 2
    assert all(not APICES <= shell for shell in SHELLS)

    colors = install_equal_distance_classes()
    actual_rich_classes = []
    for apex, prescribed in zip(sorted(APICES), RICH_CLASSES, strict=True):
        witness = next(iter(prescribed))
        radius_color = colors[tuple(sorted((apex, witness)))]
        actual = frozenset(
            point
            for point in POINTS
            if point != apex
            and colors[tuple(sorted((apex, point)))] == radius_color
        )
        assert actual == prescribed
        actual_rich_classes.append(actual)
    assert (
        max(
            len(shell & rich)
            for shell in SHELLS
            for rich in actual_rich_classes
        )
        <= 2
    )

    assert has_k4(POINTS, colors)
    proper_k4 = []
    for mask in range(1, (1 << len(POINTS)) - 1):
        carrier = frozenset(point for point in POINTS if mask & (1 << point))
        if has_k4(carrier, colors):
            proper_k4.append(carrier)
    assert not proper_k4

    print("vertices=15 shells=12 rich_classes=3")
    print(f"blocker_fiber_max={max(fibers.values())} doubled_fibers=3")
    print("max_shell_shell_intersection=2")
    print("max_shell_rich_class_intersection=2")
    print("proper_nonempty_K4_subcarriers=0")
    print("scope=finite distance-equality shadow only; no planar/MEC claim")


if __name__ == "__main__":
    main()
