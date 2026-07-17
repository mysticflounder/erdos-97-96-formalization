#!/usr/bin/env python3
"""Prefix-monotone strict-Kalmanson filter for the robust row DFS.

``has_ordinal_contradiction`` is deliberately independent of the checkpoint
audit driver.  It accepts a cyclic order and any *partial* collection of
equal-distance rows.  Adding rows only merges distance classes, so a strict
self-edge or directed cycle found here persists under every completion.

Intended integration in ``robust-all-center-marco/bank_cegar.py``::

    from ...kalmanson-consumer.prefix_filter import has_ordinal_contradiction

    # Inside dfs_candidate.prefix_compatible, after `actual` is assembled:
    if has_ordinal_contradiction(
        shadow.hull_order(surface.frame), actual
    ):
        return False

Here ``actual`` already contains the ambient exact first-apex class plus the
currently chosen selected rows.  The filter uses no floating point or solver.
"""

from __future__ import annotations

from collections import defaultdict
import itertools
from typing import Hashable, Iterable, Mapping, Protocol, Sequence, TypeVar


Label = TypeVar("Label", bound=Hashable)


class RowLike(Protocol[Label]):
    center: Label
    support: Iterable[Label]


class DisjointSet:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, value: int) -> int:
        if self.parent[value] != value:
            self.parent[value] = self.find(self.parent[value])
        return self.parent[value]

    def union(self, left: int, right: int) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[right] = left


def _row_parts(row: RowLike[Label] | Mapping[str, object]) -> tuple[Label, tuple[Label, ...]]:
    if isinstance(row, Mapping):
        return row["center"], tuple(row["support"])  # type: ignore[return-value]
    return row.center, tuple(row.support)


def has_ordinal_contradiction(
    cyclic_order: Sequence[Label],
    rows: Iterable[RowLike[Label] | Mapping[str, object]],
) -> bool:
    """Return true exactly when the partial equality quotient has a strict cycle."""

    order = tuple(cyclic_order)
    positions = {label: index for index, label in enumerate(order)}
    if len(positions) != len(order):
        raise ValueError("cyclic order repeats a label")
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge_id(left: Label, right: Label) -> int:
        if left == right:
            raise ValueError("row support contains its center")
        edge = (left, right) if positions[left] < positions[right] else (right, left)
        return edge_index[edge]

    quotient = DisjointSet(len(edges))
    for row in rows:
        center, support = _row_parts(row)
        support_edges = tuple(edge_id(center, point) for point in support)
        if not support_edges:
            continue
        for edge in support_edges[1:]:
            quotient.union(support_edges[0], edge)

    adjacency: dict[int, set[int]] = defaultdict(set)
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for left, right in (
            ((edge_id(a, c), edge_id(b, d)),
             (edge_id(a, b), edge_id(c, d))),
            ((edge_id(a, c), edge_id(b, d)),
             (edge_id(a, d), edge_id(b, c))),
        ):
            left_classes = tuple(quotient.find(edge) for edge in left)
            right_classes = tuple(quotient.find(edge) for edge in right)
            for left_index in (0, 1):
                for right_index in (0, 1):
                    if left_classes[left_index] != right_classes[right_index]:
                        continue
                    smaller = right_classes[1 - right_index]
                    larger = left_classes[1 - left_index]
                    if smaller == larger:
                        return True
                    adjacency[smaller].add(larger)

    for start in set(quotient.find(edge) for edge in range(len(edges))):
        reached: set[int] = set()
        pending = list(adjacency[start])
        while pending:
            current = pending.pop()
            if current == start:
                return True
            if current in reached:
                continue
            reached.add(current)
            pending.extend(adjacency[current] - reached)
    return False


def _self_test() -> None:
    order = ("O", "t1", "I", "A", "J", "C")
    assert not has_ordinal_contradiction(order, ())
    # The terminal survivor's three-row core:
    # OA=AC gives OI<IC; Jt1=JO gives It1<OI; IC=It1 closes the cycle.
    rows = (
        {"center": "A", "support": ("O", "C")},
        {"center": "I", "support": ("C", "t1")},
        {"center": "J", "support": ("t1", "O")},
    )
    assert has_ordinal_contradiction(order, rows)
    # Every proper two-row prefix remains admissible to this ordinal filter.
    for omitted in range(3):
        assert not has_ordinal_contradiction(
            order, tuple(row for index, row in enumerate(rows) if index != omitted)
        )


if __name__ == "__main__":
    _self_test()
    print("prefix-filter self-test: PASS")
