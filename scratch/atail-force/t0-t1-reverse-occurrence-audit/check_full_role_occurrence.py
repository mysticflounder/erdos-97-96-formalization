#!/usr/bin/env python3
"""SMT audit of the named T0/T1-to-reverse-pair occurrence target.

This is a finite distance/Kalmanson shadow, not a planar Euclidean or MEC
realization.  It retains a total source-critical map, global K4, prescribed
deletion failure, the exact period-three all-reverse rows, the full cap order,
all three q/w role cases, and both rho arms.  SAT refutes forcing inside this
stated abstraction only.
"""

from __future__ import annotations

from itertools import combinations

from z3 import And, Bool, If, Or, Real, Solver, Sum, sat


A = tuple(range(16))
first_apex, second_apex, surplus_vertex = 0, 1, 2
surplus_cap = frozenset({0, 1, 5, 6, 7})
opp_cap_1 = frozenset({1, 2, 3, 8, 9, 10})
opp_cap_2 = frozenset({2, 0, 4, 11, 12, 13, 14, 15})
strict_first = opp_cap_1 - (surplus_cap | opp_cap_2)
boundary = (0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 11, 14, 12, 4, 15, 13)
opp_cap_2_order = (2, 11, 14, 12, 4, 15, 13, 0)
physical_exact_five = frozenset({11, 12, 13, 5, 8})
cycle_sources = (11, 12, 13)

blocker = {
    0: 2, 1: 3, 2: 5, 3: 6, 4: 7, 5: 8, 6: 9, 7: 10,
    8: 3, 9: 10, 10: 2, 11: 4, 12: 14, 13: 15, 14: 5, 15: 6,
}
blocker_centers = frozenset(blocker.values())


def dist_var(i: int, j: int):
    assert i != j
    a, b = sorted((i, j))
    return Real(f"d_{a}_{b}")


def different(u, v):
    return Or(u >= v + 1, v >= u + 1)


def role_case(arm: str, role: str) -> dict[str, object]:
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

    if role == "II":
        q, w = 3, 8
    elif role == "IO":
        q, w = 3, 12
    else:
        q, w = 12, 3

    return {
        "q": q, "w": w, "t0": t0, "t1": t1,
        "first_classes": first_classes,
    }


def solve_cell(arm: str, role: str, negate_target: bool = True,
               include_minimality: bool = True,
               include_kalmanson: bool = True) -> dict[str, object]:
    data = role_case(arm, role)
    q, w = data["q"], data["w"]
    t0, t1 = data["t0"], data["t1"]
    first_classes = data["first_classes"]
    eligible_outside = tuple(sorted(set(A) - opp_cap_2 - physical_exact_five))

    # Source-faithful role and row sanity, checked outside SMT.
    assert set(boundary) == set(A)
    assert boundary[:5] == (0, 5, 6, 7, 1)
    assert boundary[4:10] == (1, 3, 8, 9, 10, 2)
    assert boundary[9:] + boundary[:1] == opp_cap_2_order
    assert q != w and {q, w} <= t0 and {q, w}.isdisjoint(surplus_cap)
    assert len(t0) == len(t1) == 4 and t1.isdisjoint({q, w})
    assert len(t0 & strict_first) >= 2 and len(t1 & strict_first) >= 2
    assert (q in strict_first, w in strict_first) == {
        "II": (True, True), "IO": (True, False), "OI": (False, True)
    }[role]
    assert q in strict_first or w in strict_first
    if arm == "neq":
        assert t0.isdisjoint(t1)
    else:
        assert len(first_classes[0]) == 6 and t0 <= first_classes[0]
        assert t1 <= first_classes[0]
        assert len(first_classes[0] & surplus_cap) <= 1
        assert len(first_classes[0] & opp_cap_2) <= 1
    assert eligible_outside == (1, 3, 6, 7, 9, 10)

    s = Solver()
    d = {(i, j): dist_var(i, j) for i, j in combinations(A, 2)}
    dv = lambda i, j: d[tuple(sorted((i, j)))]
    for value in d.values():
        s.add(value >= 1)

    # Full strict metric and strict Kalmanson closure for the fixed cyclic order.
    for a, b, c in combinations(A, 3):
        s.add(dv(a, b) + dv(b, c) >= dv(a, c) + 1)
        s.add(dv(a, b) + dv(a, c) >= dv(b, c) + 1)
        s.add(dv(a, c) + dv(b, c) >= dv(a, b) + 1)
    if include_kalmanson:
        for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
            a, b, c, e = (boundary[i] for i in (ia, ib, ic, id_))
            diagonal_sum = dv(a, c) + dv(b, e)
            s.add(diagonal_sum >= dv(a, b) + dv(c, e) + 1)
            s.add(diagonal_sum >= dv(a, e) + dv(b, c) + 1)

    # One selected K4 row at every carrier center.
    hit = {(c, x): Bool(f"hit_{c}_{x}") for c in A for x in A}
    radius = {c: Real(f"rad_{c}") for c in A}
    for c in A:
        s.add(radius[c] >= 1)
        s.add(hit[c, c] == False)
        s.add(Sum([If(hit[c, x], 1, 0) for x in A]) == 4)
        for x in A:
            if x != c:
                s.add(Or(hit[c, x] == False, dv(c, x) == radius[c]))
        for cap in (surplus_cap, opp_cap_1, opp_cap_2):
            if c in cap:
                s.add(Sum([If(hit[c, x], 1, 0) for x in cap]) <= 2)

    for x in A:
        s.add(hit[first_apex, x] == (x in t0))
    chosen_second = frozenset({11, 12, 13, 5})
    for x in A:
        s.add(hit[second_apex, x] == (x in chosen_second))

    # First-apex T0/T1 radius data and the exact rho split.
    r, rho = radius[first_apex], Real("rho")
    s.add(rho >= 1)
    for x in t1:
        s.add(dv(first_apex, x) == rho)
    if arm == "eq":
        s.add(rho == r)
    else:
        s.add(different(rho, r))

    # Exact physical-apex five-class.
    for x in physical_exact_five:
        s.add(dv(second_apex, x) == radius[second_apex])
    for x in set(A) - physical_exact_five - {second_apex}:
        s.add(different(dv(second_apex, x), radius[second_apex]))

    # Total CSS: exact four-class at every blocker value, containing every
    # source in its fiber.  Let the solver choose the three exact two-point
    # outside residuals rather than pinning one unrepresentative assignment.
    pair_hit = {(edge, x): Bool(f"pair_{edge}_{x}")
                for edge in range(3) for x in eligible_outside}
    for edge, source in enumerate(cycle_sources):
        successor = cycle_sources[(edge + 1) % 3]
        center = blocker[successor]
        s.add(Sum([If(pair_hit[edge, x], 1, 0)
                   for x in eligible_outside]) == 2)
        for x in A:
            if x in {source, successor}:
                s.add(hit[center, x])
            elif x in eligible_outside:
                s.add(hit[center, x] == pair_hit[edge, x])
            else:
                s.add(hit[center, x] == False)
        if negate_target:
            # Negate the named occurrence in each row and also the weaker
            # return to any known first-apex class.
            s.add(Sum([If(pair_hit[edge, x], 1, 0) for x in t0
                       if x in eligible_outside]) <= 1)
            s.add(Sum([If(pair_hit[edge, x], 1, 0) for x in t1
                       if x in eligible_outside]) <= 1)
            for klass in first_classes:
                s.add(Sum([If(pair_hit[edge, x], 1, 0) for x in klass
                           if x in eligible_outside]) <= 1)
            for a, b in combinations(eligible_outside, 2):
                s.add(Or(pair_hit[edge, a] == False,
                         pair_hit[edge, b] == False,
                         different(dv(first_apex, a), dv(first_apex, b))))
    for e, f in combinations(range(3), 2):
        s.add(Or(*[pair_hit[e, x] != pair_hit[f, x]
                   for x in eligible_outside]))
        s.add(Sum([If(And(pair_hit[e, x], pair_hit[f, x]), 1, 0)
                   for x in eligible_outside]) <= 1)
    for source, center in blocker.items():
        s.add(hit[center, source])
    for center in blocker_centers:
        for x in A:
            if x != center:
                s.add(Or(hit[center, x], different(dv(center, x), radius[center])))

    # Every pair of distinct selected circles has at most two displayed
    # common points.  Use the full known apex classes, not merely T0.
    for c, e in combinations(A, 2):
        s.add(Sum([If(And(hit[c, x], hit[e, x]), 1, 0) for x in A]) <= 2)
    for c in A:
        if c != first_apex:
            for klass in first_classes:
                s.add(Sum([If(hit[c, x], 1, 0) for x in klass]) <= 2)
        if c != second_apex:
            s.add(Sum([If(hit[c, x], 1, 0) for x in physical_exact_five]) <= 2)

    # Exact all-reverse membership/forward omission and straddling.
    positions = {x: i for i, x in enumerate(opp_cap_2_order)}
    for edge, source in enumerate(cycle_sources):
        successor = cycle_sources[(edge + 1) % 3]
        reverse_center = blocker[successor]
        own_center = blocker[source]
        s.add(hit[reverse_center, source], hit[reverse_center, successor])
        s.add(hit[own_center, successor] == False)
        lo, hi = sorted((positions[source], positions[successor]))
        assert lo < positions[reverse_center] < hi
    assert len({blocker[x] for x in cycle_sources}) == 3

    # Source-by-source deletion failure.  Combined with the selected row at
    # every center, this is the discrete global K4/minimality surface.
    if include_minimality:
        for source, center in blocker.items():
            remaining = [x for x in A if x not in {source, center}]
            for four in combinations(remaining, 4):
                base = dv(center, four[0])
                s.add(Or(*[different(base, dv(center, x)) for x in four[1:]]))

    result = s.check()
    output = {
        "arm": arm,
        "role": role,
        "negate_target": negate_target,
        "include_minimality": include_minimality,
        "include_kalmanson": include_kalmanson,
        "status": str(result),
        "q": q,
        "w": w,
        "t0": sorted(t0),
        "t1": sorted(t1),
    }
    if result == sat:
        model = s.model()
        chosen_pairs = [
            [x for x in eligible_outside if model.eval(pair_hit[edge, x])]
            for edge in range(3)
        ]
        output["reverse_pairs"] = chosen_pairs
        output["first_pair_distances"] = [
            [str(model.eval(dv(first_apex, a))),
             str(model.eval(dv(first_apex, b)))]
            for a, b in chosen_pairs
        ]
    return output


def main() -> None:
    # Decisive finite/full-role surface: total CSS, global K4, and exact
    # source-by-source deletion failure, but no linearized Euclidean crossing
    # inequalities.  This is the abstraction whose target is being audited.
    results = [solve_cell(arm, role, True, True, False)
               for arm in ("eq", "neq") for role in ("II", "IO", "OI")]
    for result in results:
        print(result)
    assert all(result["status"] == "sat" for result in results)
    print("PASS: all six rho/role cells are SAT in the finite full-role shadow")
    print("PASS: named T0/T1 occurrence and all first-apex returns are absent")
    # Regression against accidental promotion: one fixed auxiliary blocker
    # map is already incompatible with Kalmanson before target negation.  That
    # is not a map-independent proof of the occurrence.
    kalmanson_probe = solve_cell("eq", "II", False, False, True)
    print({"kalmanson_fixed_map_probe": kalmanson_probe})
    assert kalmanson_probe["status"] == "unsat"
    print("NOT CLAIMED: map-independent Kalmanson coverage, planar Euclidean/MEC realization, or noM44")


if __name__ == "__main__":
    main()
