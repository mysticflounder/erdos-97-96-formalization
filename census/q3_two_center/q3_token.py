#!/usr/bin/env python3
"""Q3 composition retest (token level, STATE item 8): does granting the
Q3 joint kills close the token-level D1 evasion at n = 12..16?

Model = q2_token.py (census/D3 admissibility: caps >= 4 with two >= 5,
C1, C2, C4, full H1, m <= 2 for non-Moser) + the Q3 two-center joint
kills on every Moser pair {a,b} with shared cap X, other caps Y, Z:
  - K-Q3-5: K(a) ∩ K(b) ∩ int(X) = ∅  (no shared member in the caps'
    common cap interior; proven for the S-pair, transfers to all three
    pairs by cap-relabeling symmetry — the proof uses only E-MEC,
    I-OBT at all corners, cap signs, H1).
  - K-Q3-1: not (K(a) ∩ K(b) ∩ int(Y) ≠ ∅ and ∩ int(Z) ≠ ∅)
    (mirror-pair argument, same transfer).
Same-side double-shares (third vertex + a Y/Z-interior shared member)
are already excluded by H1 in the token model — checked in kill_notes
F-Q3-2 casework (slot conflicts / H1 budgets).

Unlike q2_token (one profile per n), sweep ALL unordered cap profiles
(each >= 4, at least two >= 5) per n — the joint kills are not
symmetric in profile shape.
"""
from __future__ import annotations

import json
import os
import sys
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.normpath(os.path.join(HERE, "..",
                                                 "candidate_d_probe")))
import q2_token as qt  # noqa: E402

# Moser pair -> (shared cap key, other two): S contains V=1,W=2;
# O1 contains U=0,W=2; O2 contains U=0,V=1 (q2_token.build_labels).
PAIR_CAP = {frozenset((1, 2)): ("S", "O1", "O2"),
            frozenset((0, 2)): ("O1", "S", "O2"),
            frozenset((0, 1)): ("O2", "S", "O1")}


def joint_ok(a, ka, b, kb, caps_int):
    shared = ka & kb
    if not shared:
        return True
    x, y, z = PAIR_CAP[frozenset((a, b))]
    if shared & caps_int[x]:
        return False                      # K-Q3-5
    if (shared & caps_int[y]) and (shared & caps_int[z]):
        return False                      # K-Q3-1
    return True


def solve(cS, cO1, cO2, K, max_nodes=4_000_000):
    n, S, O1, O2, intS, intO1, intO2 = qt.build_labels(cS, cO1, cO2)
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
        if p == 0:
            return len(kp & (O1 - {0})) <= 1 and len(kp & (O2 - {0})) <= 1
        if p == 1:
            return len(kp & (S - {1})) <= 1 and len(kp & (O2 - {1})) <= 1
        if p == 2:
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
                continue
            if p >= 3 and qt.type_of(p, fc, caps_int, cap_of_int) in K:
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
        for q2, kq in assign.items():
            if len(kp & kq) > 2:
                return False
            if p < 3 and q2 < 3 and not joint_ok(p, kp, q2, kq, caps_int):
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


def profiles_for(n):
    tot = n + 3
    out = []
    for a in range(4, tot):
        for b in range(a, tot):
            c = tot - a - b
            if c < b:
                continue
            if sum(1 for x in (a, b, c) if x >= 5) >= 2:
                out.append((a, b, c))
    return out


def main():
    K_proven = {(2, 1, 0, 1), (2, 2, 0, 0)}
    K_plus = K_proven | {(0, 3, 0, 1), (0, 4, 0, 0), (1, 3, 0, 0)}
    kname = sys.argv[1] if len(sys.argv) > 1 else "proven"
    K = K_proven if kname == "proven" else K_plus
    out = {"K": sorted(map(list, K)), "K_name": kname,
           "joint_kills": ["K-Q3-1", "K-Q3-5"]}
    for n in range(12, 17):
        per = {}
        any_sat = False
        for prof in profiles_for(n):
            sol, nodes = solve(*prof, K)
            per[str(prof)] = {"sat": sol is not None, "nodes": nodes}
            if sol is not None:
                any_sat = True
                per[str(prof)]["classes"] = {
                    str(p): sorted(sol[p]) for p in sorted(sol)}
            print(f"n={n} {prof}: "
                  f"{'SAT' if sol else 'UNSAT'} (nodes={nodes})", flush=True)
        out[str(n)] = {"any_sat": any_sat, "profiles": per}
        print(f"n={n}: {'SAT' if any_sat else 'UNSAT across all profiles'}",
              flush=True)
    with open(os.path.join(HERE, f"q3_token_{kname}.json"), "w") as f:
        json.dump(out, f, indent=1)


if __name__ == "__main__":
    main()
