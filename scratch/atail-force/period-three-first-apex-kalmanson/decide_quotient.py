#!/usr/bin/env python3
"""Bounded exact decision for the period-three T0/T1 Kalmanson quotient.

The formula projects away CSS blocker values which never occur in the named
row equalities.  Boundary orders are generated from the three cap blocks and
the three source/blocker straddling constraints; no inherited 16-letter word
is treated as source coverage.  The search stops on the first exact SAT cell.
"""

from __future__ import annotations

from itertools import combinations, permutations
from multiprocessing import get_context
from random import Random

from z3 import Bool, If, Or, Real, Solver, Sum, sat, unknown


A = tuple(range(16))
first_apex, second_apex, surplus_vertex = 0, 1, 2
surplus_private = (5, 6, 7)
first_opp_private = (3, 8, 9, 10)
physical_private = (4, 11, 12, 13, 14, 15)
surplus_cap = frozenset({0, 1, *surplus_private})
first_opp_cap = frozenset({1, 2, *first_opp_private})
physical_cap = frozenset({2, 0, *physical_private})
strict_first = first_opp_cap - (surplus_cap | physical_cap)
physical_exact_five = frozenset({11, 12, 13, 5, 8})
cycle_sources = (11, 12, 13)
reverse_centers = (14, 15, 4)
eligible_outside = tuple(sorted(set(A) - physical_cap - physical_exact_five))
_metric_bases = {}


def between(order: tuple[int, ...], x: int, middle: int, y: int) -> bool:
    pos = {point: i for i, point in enumerate(order)}
    lo, hi = sorted((pos[x], pos[y]))
    return lo < pos[middle] < hi


def compatible_orders():
    """Generate cap-block orders; anchor one reflection representative.

    The physical block is filtered by the three exact straddles.  Reflection
    is quotiented by requiring source 11 to precede source 12.  This quotient
    is used only to find a SAT witness, not asserted as source coverage.
    """
    for physical in permutations(physical_private):
        if physical.index(11) > physical.index(12):
            continue
        if not between(physical, 11, 14, 12):
            continue
        if not between(physical, 12, 15, 13):
            continue
        if not between(physical, 13, 4, 11):
            continue
        for surplus in permutations(surplus_private):
            for first in permutations(first_opp_private):
                yield (0, *surplus, 1, *first, 2, *physical)


def cell(arm: str, role: str):
    if arm == "neq":
        t0 = frozenset({3, 8, 6, 12})
        t1 = frozenset({9, 10, 5, 11})
        first_classes = (t0, t1)
    elif role == "II":
        t0 = frozenset({3, 8, 9, 10})
        t1 = frozenset({9, 10, 5, 11})
        first_classes = (frozenset({3, 8, 9, 10, 5, 11}),)
    else:
        t0 = frozenset({3, 12, 8, 9})
        t1 = frozenset({8, 9, 10, 5})
        first_classes = (frozenset({3, 12, 8, 9, 10, 5}),)
    q, w = {"II": (3, 8), "IO": (3, 12), "OI": (12, 3)}[role]
    return q, w, t0, t1, first_classes


def solve_order(boundary: tuple[int, ...], arm: str, role: str):
    q, w, t0, t1, first_classes = cell(arm, role)
    assert set(boundary) == set(A)
    assert boundary[0] == 0 and boundary[4] == 1 and boundary[9] == 2
    assert q != w and {q, w} <= t0 and t1.isdisjoint({q, w})
    assert len(t0 & strict_first) >= 2 and len(t1 & strict_first) >= 2
    assert (q in strict_first, w in strict_first) == {
        "II": (True, True), "IO": (True, False), "OI": (False, True)
    }[role]
    assert eligible_outside == (1, 3, 6, 7, 9, 10)

    if boundary not in _metric_bases:
        solver = Solver()
        solver.set(timeout=10_000)
        d = {(i, j): Real(f"d_{i}_{j}") for i, j in combinations(A, 2)}
        dv0 = lambda i, j: d[tuple(sorted((i, j)))]
        base = [value >= 1 for value in d.values()]
        for a, b, c in combinations(A, 3):
            base.append(dv0(a, b) + dv0(b, c) >= dv0(a, c) + 1)
            base.append(dv0(a, b) + dv0(a, c) >= dv0(b, c) + 1)
            base.append(dv0(a, c) + dv0(b, c) >= dv0(a, b) + 1)
        for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
            a, b, c, e = (boundary[i] for i in (ia, ib, ic, id_))
            diagonal = dv0(a, c) + dv0(b, e)
            base.append(diagonal >= dv0(a, b) + dv0(c, e) + 1)
            base.append(diagonal >= dv0(a, e) + dv0(b, c) + 1)
        solver.add(*base)
        _metric_bases[boundary] = (solver, d)
    solver, d = _metric_bases[boundary]
    solver.push()
    pending = []
    def add(*constraints):
        pending.extend(constraints)
    dv = lambda i, j: d[tuple(sorted((i, j)))]
    different = lambda u, v: Or(u >= v + 1, v >= u + 1)

    # Named first-apex rows.  They remain selected subrows, not exact shells.
    r, rho = Real("first_r"), Real("first_rho")
    add(r >= 1, rho >= 1)
    for x in t0:
        add(dv(first_apex, x) == r)
    for x in t1:
        add(dv(first_apex, x) == rho)
    add(rho == r if arm == "eq" else different(rho, r))

    # Exact physical-apex five-class and the frontier second-apex inequality.
    physical_radius = Real("physical_radius")
    add(physical_radius >= 1)
    for x in physical_exact_five:
        add(dv(second_apex, x) == physical_radius)
    for x in set(A) - physical_exact_five - {second_apex}:
        add(different(dv(second_apex, x), physical_radius))
    add(different(dv(second_apex, q), dv(second_apex, w)))

    # Three exact reverse shells.  Only these blocker values occur in the
    # direct row equations; all other CSS map choices are projected away.
    pair_hit = {(edge, x): Bool(f"pair_{edge}_{x}")
                for edge in range(3) for x in eligible_outside}
    reverse_radius = [Real(f"reverse_radius_{edge}") for edge in range(3)]
    for edge, source in enumerate(cycle_sources):
        successor = cycle_sources[(edge + 1) % 3]
        center = reverse_centers[edge]
        add(reverse_radius[edge] >= 1)
        add(Sum([If(pair_hit[edge, x], 1, 0)
                        for x in eligible_outside]) == 2)
        add(dv(center, source) == reverse_radius[edge])
        add(dv(center, successor) == reverse_radius[edge])
        for x in eligible_outside:
            add(Or(pair_hit[edge, x] == False,
                          dv(center, x) == reverse_radius[edge]))
        exact_support_fixed = {source, successor}
        for x in set(A) - {center} - exact_support_fixed:
            if x in eligible_outside:
                add(Or(pair_hit[edge, x],
                              different(dv(center, x), reverse_radius[edge])))
            else:
                add(different(dv(center, x), reverse_radius[edge]))

        # Negate both named containment and the weaker first-apex return.
        add(Sum([If(pair_hit[edge, x], 1, 0)
                        for x in t0 if x in eligible_outside]) <= 1)
        add(Sum([If(pair_hit[edge, x], 1, 0)
                        for x in t1 if x in eligible_outside]) <= 1)
        for klass in first_classes:
            add(Sum([If(pair_hit[edge, x], 1, 0)
                            for x in klass if x in eligible_outside]) <= 1)
        for a, b in combinations(eligible_outside, 2):
            add(Or(pair_hit[edge, a] == False,
                          pair_hit[edge, b] == False,
                          different(dv(first_apex, a), dv(first_apex, b))))

    # Injective outside pairs and at-most-two intersection of distinct rows.
    for e, f in combinations(range(3), 2):
        add(Or(*[pair_hit[e, x] != pair_hit[f, x]
                        for x in eligible_outside]))
        add(Sum([If(pair_hit[e, x] & pair_hit[f, x], 1, 0)
                        for x in eligible_outside]) <= 1)

    solver.add(*pending)
    result = solver.check()
    if result == unknown:
        reason = solver.reason_unknown()
        solver.pop()
        return {"status": "unknown", "reason": reason}
    if result != sat:
        solver.pop()
        return {"status": "unsat"}
    model = solver.model()
    pairs = [[x for x in eligible_outside
              if bool(model.eval(pair_hit[edge, x]))] for edge in range(3)]
    relevant = {
        f"d(0,{x})": str(model.eval(dv(0, x)))
        for x in sorted(set().union(*map(set, pairs), t0, t1)) if x != 0
    }
    output = {
        "status": "sat", "arm": arm, "role": role,
        "boundary": list(boundary), "q": q, "w": w,
        "t0": sorted(t0), "t1": sorted(t1),
        "reverse_pairs": pairs, "first_apex_distances": relevant,
    }
    solver.pop()
    return output


def check_boundary(boundary: tuple[int, ...]):
    for arm in ("eq", "neq"):
        for role in ("II", "IO", "OI"):
            result = solve_order(boundary, arm, role)
            if result["status"] != "unsat":
                return result
    return {"status": "representatives_unsat", "boundary": list(boundary)}


def main() -> None:
    orders = list(compatible_orders())
    Random(20260717).shuffle(orders)
    completed = 0
    with get_context("spawn").Pool(processes=8) as pool:
        for result in pool.imap_unordered(check_boundary, orders, chunksize=1):
            completed += 1
            if result["status"] == "unknown":
                print({"completed_orders": completed, **result}, flush=True)
                pool.terminate()
                raise SystemExit(2)
            if result["status"] == "sat":
                print({"completed_orders": completed, **result}, flush=True)
                print("DECISION: EXACT_SAT_STOP", flush=True)
                print("NOT COVERAGE: one compatible generated order suffices to refute linear forcing", flush=True)
                pool.terminate()
                return
            if completed % 25 == 0:
                print({"completed_orders": completed,
                       "total_representative_orders": len(orders)}, flush=True)
    print({"completed_orders": completed,
           "status": "six_representatives_unsat"}, flush=True)
    print("DECISION: BOUNDED_UNSAT_NOT_SOURCE_COVERAGE", flush=True)


if __name__ == "__main__":
    main()
