#!/usr/bin/env python3
"""Build the full represented SelectedRowOrdinalComparison graph on Fin 12.

The boundary order is the natural order 0 < ... < 11.  Distance terms are
unordered pairs encoded as 12 * min(a, b) + max(a, b).  Both constructors of
ATailOrdinalKalmansonCycle.SelectedRowOrdinalComparison are included.
"""

from heapq import heappop, heappush
from itertools import combinations


ROWS = (
    frozenset((1, 2, 3, 4)),
    frozenset((2, 3, 4, 11)),
    frozenset((0, 3, 4, 5)),
    frozenset((2, 4, 5, 6)),
    frozenset((1, 6, 7, 8)),
    frozenset((3, 6, 7, 8)),
    frozenset((5, 7, 8, 9)),
    frozenset((6, 8, 9, 10)),
    frozenset((7, 9, 10, 11)),
    frozenset((0, 8, 10, 11)),
    frozenset((0, 1, 9, 11)),
    frozenset((0, 1, 2, 10)),
)


def term(a: int, b: int) -> int:
    return 12 * min(a, b) + max(a, b)


def ordinal_edges() -> set[tuple[int, int]]:
    edges: set[tuple[int, int]] = set()
    for ia, ib, ic, id_ in combinations(range(12), 4):
        # diagonalEqSide: the row at ia identifies ic and id.
        if ic in ROWS[ia] and id_ in ROWS[ia]:
            edges.add((term(ib, ic), term(ib, id_)))
        # diagonalEqLastSide: the row at ic identifies ia and id.
        if ia in ROWS[ic] and id_ in ROWS[ic]:
            edges.add((term(ia, ib), term(ib, id_)))
    return edges


def ordinal_edge_witnesses() -> list[tuple[str, tuple[int, int, int, int], int, int]]:
    witnesses: list[tuple[str, tuple[int, int, int, int], int, int]] = []
    for ia, ib, ic, id_ in combinations(range(12), 4):
        if ic in ROWS[ia] and id_ in ROWS[ia]:
            witnesses.append(
                ("diagonalEqSide", (ia, ib, ic, id_), term(ib, ic), term(ib, id_))
            )
        if ia in ROWS[ic] and id_ in ROWS[ic]:
            witnesses.append(
                (
                    "diagonalEqLastSide",
                    (ia, ib, ic, id_),
                    term(ia, ib),
                    term(ib, id_),
                )
            )
    return witnesses


class DisjointSet:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, vertex: int) -> int:
        while self.parent[vertex] != vertex:
            self.parent[vertex] = self.parent[self.parent[vertex]]
            vertex = self.parent[vertex]
        return vertex

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def distance_equalities() -> DisjointSet:
    quotient = DisjointSet(144)
    for center, row in enumerate(ROWS):
        terms = [term(center, point) for point in row]
        for other in terms[1:]:
            quotient.union(terms[0], other)
    return quotient


def quotient_edges(
    edges: set[tuple[int, int]], quotient: DisjointSet
) -> set[tuple[int, int]]:
    return {(quotient.find(left), quotient.find(right)) for left, right in edges}


def topological_rank(edges: set[tuple[int, int]]) -> list[int]:
    vertices = set(range(144))
    outgoing = {vertex: set() for vertex in vertices}
    indegree = {vertex: 0 for vertex in vertices}
    for left, right in edges:
        if right not in outgoing[left]:
            outgoing[left].add(right)
            indegree[right] += 1
    queue: list[int] = []
    for vertex in vertices:
        if indegree[vertex] == 0:
            heappush(queue, vertex)
    order: list[int] = []
    while queue:
        vertex = heappop(queue)
        order.append(vertex)
        for target in sorted(outgoing[vertex]):
            indegree[target] -= 1
            if indegree[target] == 0:
                heappush(queue, target)
    if len(order) != len(vertices):
        raise RuntimeError("the full ordinal graph has a directed cycle")
    rank = [0] * 144
    for index, vertex in enumerate(order):
        rank[vertex] = index
    return rank


def main() -> None:
    edges = ordinal_edges()
    used_vertices = {vertex for edge in edges for vertex in edge}
    rank = topological_rank(edges)
    assert all(rank[left] < rank[right] for left, right in edges)
    print(f"raw_used_vertices={len(used_vertices)}")
    print(f"raw_directed_edges={len(edges)}")
    print("raw_rank_vector=![" + ", ".join(map(str, rank)) + "]")

    quotient = distance_equalities()
    qedges = quotient_edges(edges, quotient)
    loops = sorted(left for left, right in qedges if left == right)
    print(f"quotient_classes={len({quotient.find(v) for v in range(144)})}")
    print(f"quotient_directed_edges={len(qedges)}")
    print(f"quotient_strict_loops={loops}")
    for witness in ordinal_edge_witnesses():
        kind, indices, left, right = witness
        if quotient.find(left) == quotient.find(right):
            print(
                "quotient_loop_witness="
                f"{kind} indices={indices} raw_edge=({left},{right}) "
                f"class={quotient.find(left)}"
            )
    if not loops:
        qrank = topological_rank(qedges)
        assert all(qrank[left] < qrank[right] for left, right in qedges)
        print("quotient_rank_vector=![" + ", ".join(map(str, qrank)) + "]")


if __name__ == "__main__":
    main()
