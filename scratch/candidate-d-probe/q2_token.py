#!/usr/bin/env python3
"""Q2 composition test (token level): is {admissible double-apex pattern,
no non-Moser center whose canonical (m,s,l,r) type is in K} satisfiable at
n = 12..16?

Admissibility = census/D3 model (census554_lib.py style, generalized profile):
caps S,O1,O2 closed, sizes >= 4 with two >= 5; C1 (|K(p)|=4, p not in K(p));
C2 (|K(p) cap K(q)| <= 2); C4 (pair in <= 2 classes); FULL H1 (each Moser
vertex: <= 1 class member in each of its two containing caps, minus itself).

Type of non-Moser center c in cap X: m = |K(c) cap {U,V,W}|; s = |K(c) cap
int(X)| (c excluded automatically since c not in K(c)); l/r = members in the
two other cap interiors, in the cyclic left/right convention; canonical =
min((m,s,l,r),(m,s,r,l)).

Search: DFS with per-center candidate lists + C2/C4 pruning, deterministic
order. SAT => print witness pattern (the token-level D1 evasion witness).
"""
from __future__ import annotations

import json
import sys
from itertools import combinations

K_DEFAULT = {(0, 3, 0, 1), (0, 4, 0, 0), (1, 3, 0, 0)}


def build_labels(cS, cO1, cO2):
    # Moser: U=0, V=1, W=2. S contains V,W; O1 contains U,W; O2 contains U,V.
    n = cS + cO1 + cO2 - 3
    intS = list(range(3, 3 + cS - 2))
    intO1 = list(range(3 + cS - 2, 3 + cS - 2 + cO1 - 2))
    intO2 = list(range(3 + cS - 2 + cO1 - 2, n))
    S = frozenset([1, 2] + intS)
    O1 = frozenset([0, 2] + intO1)
    O2 = frozenset([0, 1] + intO2)
    return n, S, O1, O2, intS, intO1, intO2


def type_of(c, kc, caps_int, cap_of_int):
    m = len(kc & {0, 1, 2})
    own = cap_of_int[c]
    # cyclic convention: own cap X -> (left, right) = next caps cyclically;
    # reflection quotient makes the left/right naming immaterial.
    order = ["S", "O1", "O2"]
    i = order.index(own)
    left, right = order[(i + 1) % 3], order[(i + 2) % 3]
    s = len(kc & caps_int[own])
    l = len(kc & caps_int[left])
    r = len(kc & caps_int[right])
    return min((m, s, l, r), (m, s, r, l))


def solve(cS, cO1, cO2, K, max_nodes=4_000_000):
    n, S, O1, O2, intS, intO1, intO2 = build_labels(cS, cO1, cO2)
    caps_int = {"S": frozenset(intS), "O1": frozenset(intO1),
                "O2": frozenset(intO2)}
    cap_of_int = {}
    for c in intS:
        cap_of_int[c] = "S"
    for c in intO1:
        cap_of_int[c] = "O1"
    for c in intO2:
        cap_of_int[c] = "O2"

    def h1_ok(p, kp):
        if p == 0:  # U in O1, O2
            return len(kp & (O1 - {0})) <= 1 and len(kp & (O2 - {0})) <= 1
        if p == 1:  # V in S, O2
            return len(kp & (S - {1})) <= 1 and len(kp & (O2 - {1})) <= 1
        if p == 2:  # W in S, O1
            return len(kp & (S - {2})) <= 1 and len(kp & (O1 - {2})) <= 1
        return True

    cands = {}
    for p in range(n):
        cl = []
        for c in combinations([q for q in range(n) if q != p], 4):
            fc = frozenset(c)
            if not h1_ok(p, fc):
                continue
            if p >= 3 and len(fc & {0, 1, 2}) > 2:
                continue          # m <= 2, geometric (formulation 2.1)
            if p >= 3 and type_of(p, fc, caps_int, cap_of_int) in K:
                continue
            cl.append(fc)
        if not cl:
            return None, 0
        cands[p] = cl

    order = sorted(range(n), key=lambda p: len(cands[p]))
    assign = {}
    paircount = {}
    nodes = 0

    def ok_with(p, kp):
        for q, kq in assign.items():
            if len(kp & kq) > 2:
                return False
        for e in combinations(sorted(kp), 2):
            if paircount.get(e, 0) + 1 > 2:
                return False
        return True

    def dfs(i):
        nonlocal nodes
        if i == len(order):
            return True
        p = order[i]
        for kp in cands[p]:
            nodes += 1
            if nodes > max_nodes:
                return False
            if not ok_with(p, kp):
                continue
            assign[p] = kp
            for e in combinations(sorted(kp), 2):
                paircount[e] = paircount.get(e, 0) + 1
            if dfs(i + 1):
                return True
            del assign[p]
            for e in combinations(sorted(kp), 2):
                paircount[e] -= 1
        return False

    sat = dfs(0)
    return (dict(assign) if sat else None), nodes


def main():
    K_proven = {(2, 1, 0, 1), (2, 2, 0, 0)}
    K_plus = K_proven | {(0, 3, 0, 1), (0, 4, 0, 0), (1, 3, 0, 0)}
    kname = sys.argv[1] if len(sys.argv) > 1 else "proven"
    K = K_proven if kname == "proven" else K_plus
    profiles = {12: (5, 5, 5), 13: (6, 5, 5), 14: (6, 6, 5), 15: (6, 6, 6),
                16: (7, 6, 6)}
    out = {"K": sorted(map(list, K)), "K_name": kname}
    for n, prof in profiles.items():
        sol, nodes = solve(*prof, K)
        if sol:
            n_, S, O1, O2, iS, iO1, iO2 = build_labels(*prof)
            caps_int = {"S": frozenset(iS), "O1": frozenset(iO1),
                        "O2": frozenset(iO2)}
            cap_of_int = {c: nm for nm, ii in
                          (("S", iS), ("O1", iO1), ("O2", iO2)) for c in ii}
            types = {p: type_of(p, sol[p], caps_int, cap_of_int)
                     for p in sol if p >= 3}
            out[n] = {"profile": prof, "sat": True, "nodes": nodes,
                      "classes": {str(p): sorted(sol[p]) for p in sorted(sol)},
                      "types": {str(p): list(t) for p, t in types.items()}}
            print(f"n={n} {prof}: SAT (nodes={nodes}); "
                  f"types used: {sorted(set(types.values()))}", flush=True)
        else:
            out[n] = {"profile": prof, "sat": False, "nodes": nodes}
            print(f"n={n} {prof}: UNSAT within {nodes} nodes", flush=True)
    json.dump(out, open(f"q2_results_{kname}.json", "w"), indent=1)


if __name__ == "__main__":
    main()
