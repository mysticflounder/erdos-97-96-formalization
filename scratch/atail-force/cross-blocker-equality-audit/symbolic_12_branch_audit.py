#!/usr/bin/env python3
"""Exhaust the 4 x 3 cross-blocker/residual symbolic equality branches.

Only positive row memberships and negative memberships exposed by the live
theorem parameters are used.  The model contracts EdgeClosure.flip by storing
unordered edges and closes the row generators transitively.
"""

from __future__ import annotations

from itertools import combinations, permutations, product


ARMS = {
    "A=b1": ("A", "b1", "B in row(A)"),
    "A=b2": ("A", "b2", "B in row(A)"),
    "B=a1": ("B", "a1", "A in row(B)"),
    "B=a2": ("B", "a2", "A in row(B)"),
}
RESIDUALS = ("third", "outside-first", "outside-second")


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[object, object] = {}

    def find(self, value: object) -> object:
        self.parent.setdefault(value, value)
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: object, right: object) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[max(left, right)] = min(left, right)


def edge(left: str, right: str) -> tuple[str, str]:
    return tuple(sorted((left, right)))  # type: ignore[return-value]


def branch(arm: str, residual: str) -> dict[str, object]:
    aliases = UnionFind()
    left, right, first_missing = ARMS[arm]
    aliases.union(left, right)

    def canon(label: str) -> str:
        return str(aliases.find(label))

    rows: dict[str, set[str]] = {
        canon("A"): {canon("a1"), canon("a2")},
        canon("B"): {canon("b1"), canon("b2")},
    }
    negatives: dict[str, set[str]] = {
        canon("A"): {canon("A"), canon("b1")},
        canon("B"): {canon("B"), canon("a1")},
    }
    if residual == "third":
        rows[canon("C")] = {canon("t1"), canon("t2")}
        negatives[canon("C")] = {canon("C")}
    elif residual == "outside-first":
        rows[canon("A")].update({canon("x"), canon("o")})
    elif residual == "outside-second":
        rows[canon("B")].update({canon("x"), canon("o")})
    else:
        raise ValueError(residual)

    for center, points in rows.items():
        if center in points:
            raise AssertionError(f"inconsistent center membership in {arm}/{residual}")
    for center, points in negatives.items():
        conflict = points & rows.get(center, set())
        if conflict:
            raise AssertionError(
                f"positive/negative conflict {conflict} in {arm}/{residual}"
            )

    closure = UnionFind()
    for center, points in rows.items():
        for first, second in combinations(sorted(points), 2):
            closure.union(edge(center, first), edge(center, second))

    labels = sorted(
        set(rows)
        | set().union(*rows.values())
        | set().union(*negatives.values())
    )

    def equal_edges(
        first: tuple[str, str], second: tuple[str, str]
    ) -> bool:
        return closure.find(first) == closure.find(second)

    duplicate = None
    for p, q, r in combinations(labels, 3):
        for a, b in combinations(labels, 2):
            if (
                equal_edges(edge(a, p), edge(a, q))
                and equal_edges(edge(a, p), edge(a, r))
                and equal_edges(edge(b, p), edge(b, q))
                and equal_edges(edge(b, p), edge(b, r))
            ):
                duplicate = (a, b, p, q, r)
                break
        if duplicate:
            break

    exact_off = None
    for center, outside in negatives.items():
        for inside, z in product(sorted(rows.get(center, ())), sorted(outside)):
            if equal_edges(edge(center, inside), edge(center, z)):
                exact_off = (center, inside, z)
                break
        if exact_off:
            break

    perp = None
    for a, b in combinations(labels, 2):
        bisectors = [
            center
            for center in labels
            if equal_edges(edge(center, a), edge(center, b))
        ]
        if len(bisectors) >= 3:
            perp = (a, b, *bisectors[:3])
            break

    equal_k4 = None
    for p, t1 in permutations(labels, 2):
        base = edge(p, t1)
        for t2 in labels:
            for t3 in labels:
                targets = (
                    edge(p, t2),
                    edge(p, t3),
                    edge(t1, t2),
                    edge(t1, t3),
                    edge(t2, t3),
                )
                if all(equal_edges(base, target) for target in targets):
                    equal_k4 = (p, t1, t2, t3)
                    break
            if equal_k4:
                break
        if equal_k4:
            break

    components: dict[object, set[tuple[str, str]]] = {}
    for center, points in rows.items():
        for point in points:
            e = edge(center, point)
            components.setdefault(closure.find(e), set()).add(e)

    return {
        "arm": arm,
        "residual": residual,
        "rows": {
            center: sorted(points) for center, points in sorted(rows.items())
        },
        "component_sizes": sorted(
            (len(component) for component in components.values()), reverse=True
        ),
        "duplicate": duplicate,
        "exact_off": exact_off,
        "perp": perp,
        "equal_k4": equal_k4,
        "first_missing_cross_row_bridge": first_missing,
    }


def main() -> None:
    results = [branch(arm, residual) for arm, residual in product(ARMS, RESIDUALS)]
    print("arm residual components dup exact perp k4 first-missing")
    for result in results:
        print(
            result["arm"],
            result["residual"],
            result["component_sizes"],
            bool(result["duplicate"]),
            bool(result["exact_off"]),
            bool(result["perp"]),
            bool(result["equal_k4"]),
            result["first_missing_cross_row_bridge"],
        )
    assert len(results) == 12
    assert all(
        result[key] is None
        for result in results
        for key in ("duplicate", "exact_off", "perp", "equal_k4")
    )


if __name__ == "__main__":
    main()
