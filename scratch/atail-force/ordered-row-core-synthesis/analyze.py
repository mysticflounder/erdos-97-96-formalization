#!/usr/bin/env python3
"""Check the common ordered-row packet in three fresh `(4,5,6)` shadows.

This is an exact finite-incidence/equality-closure replay.  It does not assert
that the packet follows from the live K-A-PAIR hypotheses.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass


ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)

ROWS = {
    "survivor1": {
        0: (1, 3, 4, 5),
        1: (0, 2, 5, 6),
        2: (4, 6, 9, 11),
        3: (2, 4, 7, 10),
        4: (1, 5, 7, 11),
        5: (0, 1, 9, 10),
        6: (5, 8, 10, 11),
        7: (0, 3, 6, 11),
        8: (0, 3, 7, 9),
        9: (0, 4, 8, 10),
        10: (1, 6, 7, 8),
        11: (2, 3, 8, 9),
    },
    "survivor2": {
        0: (1, 3, 4, 5),
        1: (0, 2, 5, 6),
        2: (1, 7, 9, 11),
        3: (1, 4, 6, 10),
        4: (2, 3, 7, 10),
        5: (2, 4, 6, 9),
        6: (0, 5, 10, 11),
        7: (3, 6, 8, 11),
        8: (0, 3, 7, 9),
        9: (0, 4, 8, 10),
        10: (1, 6, 7, 8),
        11: (5, 8, 9, 10),
    },
    "survivor3": {
        0: (1, 3, 4, 5),
        1: (0, 2, 5, 6),
        2: (1, 7, 8, 10),
        3: (1, 4, 6, 9),
        4: (2, 3, 7, 11),
        5: (4, 6, 8, 11),
        6: (2, 4, 7, 9),
        7: (0, 5, 9, 11),
        8: (0, 3, 7, 9),
        9: (0, 4, 8, 10),
        10: (1, 6, 7, 11),
        11: (2, 3, 8, 9),
    },
}

DISCOVERED = {
    "survivor1": ("arc-overtake-reverse", {"O": 8, "A": 0, "D": 7,
        "E": 3, "F": 11, "C": 9}),
    "survivor2": ("nested-equal-chord", {"o": 8, "a": 9, "b": 3,
        "c": 7, "d": 0}),
    "survivor3": ("four-point-two-circle", {"Q": 0, "U": 8, "Y": 9,
        "V": 11}),
}


Edge = tuple[int, int]


def edge(x: int, y: int) -> Edge:
    return (x, y) if x < y else (y, x)


@dataclass
class EqualityClosure:
    parent: dict[Edge, Edge]
    adjacency: dict[Edge, list[tuple[Edge, int]]]

    @classmethod
    def from_rows(cls, rows: dict[int, tuple[int, ...]]) -> "EqualityClosure":
        parent: dict[Edge, Edge] = {}
        adjacency: dict[Edge, list[tuple[Edge, int]]] = {}

        def find(item: Edge) -> Edge:
            parent.setdefault(item, item)
            if parent[item] != item:
                parent[item] = find(parent[item])
            return parent[item]

        def union(left: Edge, right: Edge) -> None:
            lroot, rroot = find(left), find(right)
            if lroot != rroot:
                parent[rroot] = lroot

        for center, support in rows.items():
            spokes = [edge(center, member) for member in support]
            for spoke in spokes:
                parent.setdefault(spoke, spoke)
                adjacency.setdefault(spoke, [])
            for left, right in zip(spokes, spokes[1:]):
                union(left, right)
                adjacency[left].append((right, center))
                adjacency[right].append((left, center))
        for item in tuple(parent):
            parent[item] = find(item)
        return cls(parent, adjacency)

    def same(self, left: Edge, right: Edge) -> bool:
        return self.parent.get(left, left) == self.parent.get(right, right)

    def path(self, left: Edge, right: Edge) -> list[dict[str, object]]:
        if left == right:
            return []
        queue = [left]
        previous: dict[Edge, tuple[Edge, int] | None] = {left: None}
        for current in queue:
            for nxt, center in self.adjacency.get(current, []):
                if nxt in previous:
                    continue
                previous[nxt] = (current, center)
                if nxt == right:
                    queue = []
                    break
                queue.append(nxt)
        if right not in previous:
            raise AssertionError(f"no equality path from {left} to {right}")
        result = []
        current = right
        while previous[current] is not None:
            prior, center = previous[current]
            result.append({"from": prior, "to": current, "row_center": center})
            current = prior
        result.reverse()
        return result


def cyclic_subsequence(sequence: tuple[int, ...], order: tuple[int, ...]) -> bool:
    positions = {label: index for index, label in enumerate(order)}
    indices = [positions[label] for label in sequence]
    descents = sum(indices[i] >= indices[(i + 1) % len(indices)]
                   for i in range(len(indices)))
    return descents == 1


def require_equal(closure: EqualityClosure, left: Edge, right: Edge) -> None:
    if not closure.same(left, right):
        raise AssertionError(f"missing equality {left} = {right}")


def check_arc(closure: EqualityClosure, roles: dict[str, int], reverse: bool) -> None:
    o, a, c = roles["O"], roles["A"], roles["C"]
    d, e, f = roles["D"], roles["E"], roles["F"]
    for left, right in (
        (edge(o, a), edge(o, c)),
        (edge(o, a), edge(a, c)),
        (edge(o, a), edge(o, d)),
        (edge(o, a), edge(o, e)),
        (edge(d, a), edge(d, e)),
        (edge(d, a), edge(d, f)),
    ):
        require_equal(closure, left, right)
    order = tuple(reversed(ORDER)) if reverse else ORDER
    assert cyclic_subsequence((o, a, d, e, f, c), order)


def check_nested(closure: EqualityClosure, roles: dict[str, int]) -> None:
    o, a, b, c, d = (roles[key] for key in ("o", "a", "b", "c", "d"))
    for right in (edge(o, b), edge(o, c), edge(o, d), edge(a, d), edge(b, c)):
        require_equal(closure, edge(o, a), right)
    assert cyclic_subsequence((o, a, b, c, d), ORDER)


def check_fourpoint(closure: EqualityClosure, roles: dict[str, int]) -> None:
    q, u, y, v = (roles[key] for key in ("Q", "U", "Y", "V"))
    require_equal(closure, edge(q, u), edge(q, y))
    require_equal(closure, edge(u, v), edge(y, v))
    assert cyclic_subsequence((q, u, y, v), ORDER)


def build() -> dict[str, object]:
    common = {"o": 8, "a": 9, "b": 3, "c": 7, "d": 0, "f": 11}
    common_fourpoint = {"Q": common["d"], "U": common["o"],
        "Y": common["a"], "V": common["f"]}
    cases = []
    for name, rows in ROWS.items():
        assert set(rows) == set(range(12))
        assert all(len(set(support)) == 4 and center not in support
                   for center, support in rows.items())
        closure = EqualityClosure.from_rows(rows)
        discovered_name, roles = DISCOVERED[name]
        if discovered_name == "arc-overtake-reverse":
            check_arc(closure, roles, reverse=True)
        elif discovered_name == "nested-equal-chord":
            check_nested(closure, roles)
        else:
            check_fourpoint(closure, roles)

        # All three shadows share a strictly smaller direct-row packet:
        # the ordered o-row, the a-row through o,d, and the f-row through o,a.
        o, a, b, c, d, f = (common[key] for key in ("o", "a", "b", "c", "d", "f"))
        ordered_support = tuple(
            label for label in ORDER[ORDER.index(o) + 1 :] + ORDER[: ORDER.index(o)]
            if label in rows[o]
        )
        assert ordered_support == (a, b, c, d)
        assert o in rows[a] and d in rows[a]
        assert o in rows[f] and a in rows[f]
        assert cyclic_subsequence((d, o, a, f), ORDER)
        check_fourpoint(closure, common_fourpoint)

        shared_path = closure.path(edge(d, o), edge(d, a))
        bisector_path = closure.path(edge(o, f), edge(a, f))
        cases.append({
            "name": name,
            "discovered_core": discovered_name,
            "discovered_roles": roles,
            "common_ordered_row": {"center": o, "support": ordered_support},
            "common_roles": common,
            "common_direct_memberships": {
                str(a): sorted(rows[a]),
                str(f): sorted(rows[f]),
            },
            "outer_equidistance_path": shared_path,
            "interstitial_bisector_path": bisector_path,
            "common_fourpoint_roles": common_fourpoint,
        })

    return {
        "status": "PASS",
        "epistemic_status": "EXACT_FOR_THREE_FIXED_FINITE_SHADOWS_ONLY",
        "cyclic_order": ORDER,
        "cases": cases,
        "conclusion": (
            "All three shadows contain the same direct ordered-row packet; "
            "FourPointTwoCircleBisectorOrder is the compact common sink."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = build()
    print(json.dumps(result, sort_keys=args.check, indent=None if args.check else 2))


if __name__ == "__main__":
    main()
