#!/usr/bin/env python3
"""Exact named-edge closure audit for both reverse alternating orientations.

Rows equate all distances from their center to named support members.  A row
with only one named hit contributes an edge/radius but no new equality between
two named edges.  This script computes the transitive equality closure of all
named edges supplied by the parent rows, the equilateral forward rows, and
either reciprocal or cyclic reverse one-hit rows.
"""

from __future__ import annotations


def edge(x: str, y: str) -> tuple[str, str]:
    assert x != y
    return tuple(sorted((x, y)))


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[tuple[str, str], tuple[str, str]] = {}

    def find(self, x: tuple[str, str]) -> tuple[str, str]:
        self.parent.setdefault(x, x)
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, *xs: tuple[str, str]) -> None:
        roots = [self.find(x) for x in xs]
        for root in roots[1:]:
            self.parent[root] = roots[0]

    def same(self, x: tuple[str, str], y: tuple[str, str]) -> bool:
        return self.find(x) == self.find(y)


def audit(reverse: str) -> None:
    uf = UnionFind()

    # Parent rows at O1 and O2.
    uf.union(edge("O1", "a"), edge("O1", "b"))
    uf.union(edge("O2", "z1"), edge("O2", "z2"))

    # Equilateral forward rows: z1 hits z2,O2,a; z2 hits z1,O2,b.
    uf.union(edge("z1", "z2"), edge("z1", "O2"), edge("z1", "a"))
    uf.union(edge("z2", "z1"), edge("z2", "O2"), edge("z2", "b"))

    # Reverse one-hit rows.  Each contributes only one named edge and hence no
    # equality to another named edge.  Calling find records the exact edge.
    if reverse == "reciprocal":
        uf.find(edge("a", "z1"))
        uf.find(edge("b", "z2"))
    elif reverse == "cyclic":
        uf.find(edge("a", "z2"))
        uf.find(edge("b", "z1"))
    else:
        raise AssertionError(reverse)

    tails = {
        "|b-z1|=|b-a|": (edge("b", "z1"), edge("b", "a")),
        "|a-z2|=|a-O2|": (edge("a", "z2"), edge("a", "O2")),
        "|O2-b|=|O2-a|": (edge("O2", "b"), edge("O2", "a")),
    }
    result = {name: uf.same(x, y) for name, (x, y) in tails.items()}
    assert result == {name: False for name in tails}
    print(reverse, result)


def main() -> None:
    audit("reciprocal")
    audit("cyclic")


if __name__ == "__main__":
    main()
