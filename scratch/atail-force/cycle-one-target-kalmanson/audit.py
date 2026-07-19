#!/usr/bin/env python3
"""Exact LRA audit for one complete row on the period-three cycle core.

This is an abstract distance audit, not a Euclidean realizability test.  It
checks the two complementary-chain orders modulo reflection and interchange
of the two outside targets.  All arithmetic used to replay a SAT model is
`fractions.Fraction` arithmetic independent of Z3's constraint objects.
"""

from __future__ import annotations

from fractions import Fraction
import itertools
import json

import z3


ORDERS: dict[str, tuple[str, ...]] = {
    # Both outside targets are in the same component of the complementary
    # chain after deleting o.  The reflected component and x/y exchange are
    # equivalent.
    "same_side": (
        "o", "x", "y", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right"
    ),
    # The two targets lie in the two different components separated by o.
    "split_side": (
        "o", "x", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right", "y"
    ),
}


def pair(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


class UnionFind:
    def __init__(self, items: set[tuple[str, str]]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: tuple[str, str]) -> tuple[str, str]:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, a: tuple[str, str], b: tuple[str, str]) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[max(ra, rb)] = min(ra, rb)


def equality_groups() -> tuple[tuple[tuple[str, str], ...], ...]:
    return (
        tuple(pair("o", z) for z in ("left", "q0", "q1", "q2", "right")),
        tuple(pair("c0", z) for z in ("q0", "q1", "x", "y")),
        (pair("c1", "q1"), pair("c1", "q2")),
        (pair("c2", "q2"), pair("c2", "q0")),
    )


def all_pairs(order: tuple[str, ...]) -> set[tuple[str, str]]:
    return {pair(a, b) for a, b in itertools.combinations(order, 2)}


def kalmanson_terms(
    order: tuple[str, ...],
) -> list[tuple[str, tuple[tuple[str, str], tuple[str, str]], tuple[tuple[str, str], tuple[str, str]]]]:
    result = []
    for a, b, c, d in itertools.combinations(order, 4):
        # d_bc + d_ad < d_ac + d_bd
        result.append((
            f"K1({a},{b},{c},{d})",
            (pair(b, c), pair(a, d)),
            (pair(a, c), pair(b, d)),
        ))
        # d_ab + d_cd < d_ac + d_bd
        result.append((
            f"K2({a},{b},{c},{d})",
            (pair(a, b), pair(c, d)),
            (pair(a, c), pair(b, d)),
        ))
    return result


def ordinal_closure(order: tuple[str, ...]) -> dict[str, object]:
    """Cancel equal terms in strict Kalmanson inequalities, then transitively close."""

    pairs = all_pairs(order)
    uf = UnionFind(pairs)
    for group in equality_groups():
        for term in group[1:]:
            uf.union(group[0], term)

    edges: set[tuple[tuple[str, str], tuple[str, str]]] = set()
    witnesses: dict[tuple[tuple[str, str], tuple[str, str]], str] = {}
    immediate = []
    for label, lhs, rhs in kalmanson_terms(order):
        left = (uf.find(lhs[0]), uf.find(lhs[1]))
        right = (uf.find(rhs[0]), uf.find(rhs[1]))
        if sorted(left) == sorted(right):
            immediate.append(label)
            continue
        for li in range(2):
            for ri in range(2):
                if left[li] == right[ri]:
                    edge = (left[1 - li], right[1 - ri])
                    edges.add(edge)
                    witnesses.setdefault(edge, label)

    vertices = {uf.find(term) for term in pairs}
    reach = {(u, v) for u, v in edges}
    changed = True
    while changed:
        changed = False
        new_edges = {
            (u, w)
            for u, v in reach
            for v2, w in reach
            if v == v2 and (u, w) not in reach
        }
        if new_edges:
            reach |= new_edges
            changed = True
    cycles = sorted(v for v in vertices if (v, v) in reach)
    return {
        "status": "UNSAT_ORDINAL" if immediate or cycles else "SAT_NOT_REFUTED_ORDINAL",
        "equivalence_class_count": len(vertices),
        "direct_comparison_count": len(edges),
        "transitive_comparison_count": len(reach),
        "immediate_equal_sum_conflicts": immediate,
        "strict_cycle_classes": [list(v) for v in cycles],
        "direct_comparisons": [
            {
                "less": list(u),
                "greater": list(v),
                "from": witnesses[(u, v)],
            }
            for u, v in sorted(edges)
        ],
    }


def z3_fraction(value: z3.ArithRef) -> Fraction:
    value = z3.simplify(value)
    if not z3.is_rational_value(value):
        raise AssertionError(f"non-rational model value: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def solve_full_lra(order: tuple[str, ...]) -> tuple[dict[str, object], dict[tuple[str, str], Fraction]]:
    pairs = sorted(all_pairs(order))
    dist = {term: z3.Real("d__" + "__".join(term)) for term in pairs}
    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=10_000)

    # Positivity is normalized to at least one.  Since the complete system is
    # homogeneous apart from strictness, every strict feasible ledger can be
    # scaled so that all finite strict margins are at least one.
    for term in pairs:
        solver.add(dist[term] >= 1)

    # Metric triangle inequalities (not needed for the Kalmanson implication,
    # but every Euclidean distance ledger satisfies them).
    for a, b, c in itertools.combinations(order, 3):
        solver.add(dist[pair(a, b)] <= dist[pair(a, c)] + dist[pair(b, c)])
        solver.add(dist[pair(a, c)] <= dist[pair(a, b)] + dist[pair(b, c)])
        solver.add(dist[pair(b, c)] <= dist[pair(a, b)] + dist[pair(a, c)])

    equality_count = 0
    for group in equality_groups():
        for term in group[1:]:
            solver.add(dist[term] == dist[group[0]])
            equality_count += 1

    # Exact named-class exclusions.  These are finite strict disequalities;
    # normalize the chosen side of each disjunction to have gap at least one.
    physical_radius = dist[pair("o", "left")]
    physical_exclusions = ["c0", "c1", "c2", "x", "y"]
    for z in physical_exclusions:
        dz = dist[pair("o", z)]
        solver.add(z3.Or(dz + 1 <= physical_radius, physical_radius + 1 <= dz))

    row_radius = dist[pair("c0", "q0")]
    row_exclusions = ["o", "left", "c1", "c2", "q2", "right"]
    for z in row_exclusions:
        dz = dist[pair("c0", z)]
        solver.add(z3.Or(dz + 1 <= row_radius, row_radius + 1 <= dz))

    kalmanson_count = 0
    for _label, lhs, rhs in kalmanson_terms(order):
        solver.add(dist[lhs[0]] + dist[lhs[1]] + 1 <= dist[rhs[0]] + dist[rhs[1]])
        kalmanson_count += 1

    status = solver.check()
    if status != z3.sat:
        return ({
            "status": str(status).upper(),
            "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
            "distance_variable_count": len(pairs),
            "row_equality_count": equality_count,
            "exact_class_exclusion_count": len(physical_exclusions) + len(row_exclusions),
            "triangle_inequality_count": 3 * len(list(itertools.combinations(order, 3))),
            "strict_kalmanson_count": kalmanson_count,
        }, {})

    model = solver.model()
    ledger = {term: z3_fraction(model.eval(var, model_completion=True)) for term, var in dist.items()}
    verify_ledger(order, ledger)
    min_kalmanson_slack = min(
        ledger[rhs[0]] + ledger[rhs[1]] - ledger[lhs[0]] - ledger[lhs[1]]
        for _label, lhs, rhs in kalmanson_terms(order)
    )
    min_triangle_slack = min(
        ledger[pair(a, c)] + ledger[pair(b, c)] - ledger[pair(a, b)]
        for a, b, c in itertools.permutations(order, 3)
        if a < b
    )
    return ({
        "status": "SAT_VERIFIED_RATIONAL_LRA_LEDGER",
        "distance_variable_count": len(pairs),
        "row_equality_count": equality_count,
        "exact_class_exclusion_count": len(physical_exclusions) + len(row_exclusions),
        "triangle_inequality_count": 3 * len(list(itertools.combinations(order, 3))),
        "strict_kalmanson_count": kalmanson_count,
        "minimum_strict_kalmanson_slack": str(min_kalmanson_slack),
        "minimum_distance": str(min(ledger.values())),
    }, ledger)


def verify_ledger(order: tuple[str, ...], ledger: dict[tuple[str, str], Fraction]) -> None:
    assert set(ledger) == all_pairs(order)
    assert all(value >= 1 for value in ledger.values())
    for a, b, c in itertools.combinations(order, 3):
        assert ledger[pair(a, b)] <= ledger[pair(a, c)] + ledger[pair(b, c)]
        assert ledger[pair(a, c)] <= ledger[pair(a, b)] + ledger[pair(b, c)]
        assert ledger[pair(b, c)] <= ledger[pair(a, b)] + ledger[pair(a, c)]
    for group in equality_groups():
        assert all(ledger[term] == ledger[group[0]] for term in group)
    physical_radius = ledger[pair("o", "left")]
    assert all(abs(ledger[pair("o", z)] - physical_radius) >= 1 for z in ("c0", "c1", "c2", "x", "y"))
    row_radius = ledger[pair("c0", "q0")]
    assert all(abs(ledger[pair("c0", z)] - row_radius) >= 1 for z in ("o", "left", "c1", "c2", "q2", "right"))
    for _label, lhs, rhs in kalmanson_terms(order):
        assert ledger[rhs[0]] + ledger[rhs[1]] - ledger[lhs[0]] - ledger[lhs[1]] >= 1


def smoke_test() -> None:
    # A four-point square-like rational metric is strict Kalmanson.
    order = ("a", "b", "c", "d")
    ledger = {
        pair("a", "b"): Fraction(1), pair("b", "c"): Fraction(1),
        pair("c", "d"): Fraction(1), pair("a", "d"): Fraction(1),
        pair("a", "c"): Fraction(2), pair("b", "d"): Fraction(2),
    }
    for _label, lhs, rhs in kalmanson_terms(order):
        assert ledger[rhs[0]] + ledger[rhs[1]] > ledger[lhs[0]] + ledger[lhs[1]]

    # Making all six distances equal contradicts either strict inequality.
    solver = z3.SolverFor("QF_LRA")
    variables = [z3.Real(f"smoke_{i}") for i in range(6)]
    solver.add(*(v == variables[0] for v in variables[1:]))
    solver.add(variables[0] + variables[1] + 1 <= variables[2] + variables[3])
    assert solver.check() == z3.unsat


def main() -> None:
    smoke_test()
    result: dict[str, object] = {
        "schema": "period3-cycle-one-complete-row-kalmanson-lra-v1",
        "epistemic_status": "EXACT_LRA_NOT_EUCLIDEAN_NOT_LEAN",
        "orders": {},
    }
    ledgers: dict[str, dict[str, str]] = {}
    for name, order in ORDERS.items():
        ordinal = ordinal_closure(order)
        full, ledger = solve_full_lra(order)
        result["orders"][name] = {
            "cyclic_order": list(order),
            "ordinal": ordinal,
            "full_lra": full,
        }
        ledgers[name] = {"~".join(term): str(value) for term, value in sorted(ledger.items())}
    result["rational_distance_ledgers"] = ledgers
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
