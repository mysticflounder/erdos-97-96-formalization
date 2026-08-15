#!/usr/bin/env python3
"""Exact linear probe for the named FreshThird five-role Kalmanson route.

The probe uses only rational linear arithmetic.  For each boundary order forced
by the direct/reflected cap blocks, it imposes all five-point Kalmanson
inequalities, strict triangle inequalities, the two proved source/fresh shell
equalities, and optionally either candidate endpoint-centered equality.

SAT is only a countermodel to this linear inequality abstraction; it is not a
Euclidean realization or a counterexample to the Lean theorem.
"""

from itertools import combinations

from z3 import Real, Solver, sat, unsat


ROLES = ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource")
ORDERS = (
    ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
    ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
    ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
    ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
)


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


DIST = {edge(a, b): Real(f"d_{a}_{b}") for a, b in combinations(ROLES, 2)}


def d(a: str, b: str):
    if a == b:
        return 0
    return DIST[edge(a, b)]


def solve(
    order: tuple[str, ...],
    endpoint_center: str | None,
    enabled_equalities: frozenset[str] | None = None,
):
    solver = Solver()
    for value in DIST.values():
        solver.add(value > 0)

    # Every triple of distinct vertices in a strictly convex carrier is
    # non-collinear, hence satisfies strict triangle inequalities.
    for a, b, c in combinations(ROLES, 3):
        solver.add(d(a, b) + d(b, c) > d(a, c))
        solver.add(d(a, b) + d(a, c) > d(b, c))
        solver.add(d(a, c) + d(b, c) > d(a, b))

    # Both strict Kalmanson inequalities for every increasing quadruple.
    for ia, ib, ic, id_ in combinations(range(5), 4):
        a, b, c, e = order[ia], order[ib], order[ic], order[id_]
        solver.add(d(b, c) + d(a, e) < d(a, c) + d(b, e))
        solver.add(d(a, b) + d(c, e) < d(a, c) + d(b, e))

    # Source row: canonical source and both shared endpoints have one radius.
    equalities = {
        "source-outside": d("sourceCenter", "canonicalSource")
        == d("sourceCenter", "qOutside"),
        "source-between": d("sourceCenter", "canonicalSource")
        == d("sourceCenter", "qBetween"),
        "fresh-pair": d("freshCenter", "qOutside")
        == d("freshCenter", "qBetween"),
        "between-row": d("qBetween", "canonicalSource")
        == d("qBetween", "qOutside"),
        "outside-row": d("qOutside", "canonicalSource")
        == d("qOutside", "qBetween"),
    }
    if enabled_equalities is None:
        enabled_equalities = frozenset(
            {"source-outside", "source-between", "fresh-pair"}
        )
        if endpoint_center == "qBetween":
            enabled_equalities |= {"between-row"}
        elif endpoint_center == "qOutside":
            enabled_equalities |= {"outside-row"}
        elif endpoint_center == "both":
            enabled_equalities |= {"between-row", "outside-row"}
    for name in enabled_equalities:
        solver.add(equalities[name])

    result = solver.check()
    witness = None
    if result == sat:
        model = solver.model()
        witness = {str(k): str(model.eval(v)) for k, v in DIST.items()}
    return result, witness


def main() -> None:
    for order in ORDERS:
        print("order:", " < ".join(order))
        for endpoint_center in (None, "qBetween", "qOutside", "both"):
            result, _witness = solve(order, endpoint_center)
            label = endpoint_center if endpoint_center is not None else "no endpoint row"
            print(f"  {label}: {result}")
        names = (
            "source-outside",
            "source-between",
            "fresh-pair",
            "between-row",
            "outside-row",
        )
        minimal = []
        for size in range(1, len(names) + 1):
            for subset in combinations(names, size):
                result, _ = solve(order, None, frozenset(subset))
                if result == unsat and not any(
                    set(old).issubset(subset) for old in minimal
                ):
                    minimal.append(subset)
        print("  minimal unsat equality cores:", minimal)


if __name__ == "__main__":
    main()
