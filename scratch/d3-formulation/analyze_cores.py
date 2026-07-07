#!/usr/bin/env python3
"""D3 formulation-pass data analysis over the committed dichotomy/D2 artifacts.

T5: killing-pair role structure (which pairs are forced-degenerate, by frame role)
T2: frame-role signature diversity of mined cores (finite-kind covering plausibility)
T3: complete k=4 universe: dead vs alive canons, printed as star systems
Extra: role composition of core point sets; center-role multisets.
Read-only on repo data; writes nothing.
"""
import json
import os
from ast import literal_eval
from collections import Counter, defaultdict
from itertools import combinations

PORT = "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/u12-census-port"

PROFILES = {
    "654": {"S": frozenset({1, 2, 3, 4, 5, 6}),
            "O1": frozenset({0, 2, 7, 8, 9}),
            "O2": frozenset({0, 1, 10, 11})},
    "555": {"S": frozenset({1, 2, 3, 4, 5}),
            "O1": frozenset({0, 2, 6, 7, 8}),
            "O2": frozenset({0, 1, 9, 10, 11})},
}


def role(p, prof):
    if p == 0:
        return "U"
    if p == 1:
        return "V"
    if p == 2:
        return "W"
    for nm in ("S", "O1", "O2"):
        if p in PROFILES[prof][nm]:
            return nm
    raise ValueError(p)


def pair_role(a, b, prof):
    ra, rb = role(a, prof), role(b, prof)
    return "-".join(sorted([ra, rb]))


def induced_groups(cube, P):
    """Pairwise-induced schema (dichotomy convention): center c in P with
    M = K_c cap P, |M| >= 2 contributes |M|-1 constraints."""
    Pset = set(P)
    groups = {}
    for c in P:
        M = [k for k in cube[str(c)] if k in Pset]
        if len(M) >= 2:
            groups[c] = sorted(M)
    return groups


def load_jsonl(path):
    with open(path) as f:
        return [json.loads(ln) for ln in f if ln.strip()]


def main():
    rows = load_jsonl(f"{PORT}/dichotomy/per_core_dichotomy.jsonl")
    A = [r for r in rows if r["tier"] == "A-classrep"]
    B = [r for r in rows if r["tier"] == "B-instance"]
    C = [r for r in rows if r["tier"] == "C-abstract4"]
    print(f"rows: A={len(A)} B={len(B)} C={len(C)}")

    # ---------------- T5: killing-pair roles ----------------
    # killing_pairs indices are relabeled (position in sorted P) -> original label
    print("\n=== T5: killing-pair roles (forced-degenerate pairs, gauge-free) ===")
    for tier_name, tier in (("A", A), ("B", B)):
        cnt = Counter()
        rows_with = 0
        for r in tier:
            if not r.get("killing_pairs"):
                continue
            rows_with += 1
            Ps = sorted(r["P"])
            for a, b in r["killing_pairs"]:
                cnt[pair_role(Ps[a], Ps[b], r["slice"])] += 1
        tot = sum(cnt.values())
        print(f"tier {tier_name}: rows with >=1 killing pair: {rows_with}; "
              f"pair-role distribution ({tot} pairs):")
        for k, v in cnt.most_common():
            print(f"    {k:10s} {v:5d}  {100*v/tot:.1f}%")

    # mode x killing summary
    print("\nmode split by tier:")
    for tier_name, tier in (("A", A), ("B", B)):
        print(f"  {tier_name}:", Counter(r["mode"] for r in tier))

    # gauge-pair (U,V)=(0,1) membership in cores
    print("\ncore point-set role composition:")
    for tier_name, tier in (("A", A), ("B", B)):
        has01 = sum(1 for r in tier if 0 in r["P"] and 1 in r["P"])
        print(f"  {tier_name}: cores containing both 0(U),1(V): {has01}/{len(tier)}")
        comp = Counter()
        for r in tier:
            comp[tuple(sorted(role(p, r["slice"]) for p in r["P"]))] += 1
        for k, v in comp.most_common(12):
            print(f"    {k}: {v}")
        print(f"    ... distinct role-compositions: {len(comp)}")

    # ---------------- T2: frame-role signatures ----------------
    # For tier B rows we can rebuild groups from the dead files.
    print("\n=== T2: frame-role constraint signatures (tier B, rebuilt from cubes) ===")
    dead = {s: load_jsonl(f"{PORT}/_u12_dead_{s}.jsonl") for s in ("654", "555")}
    sig_cnt = Counter()
    canon_cnt = Counter()
    center_role_cnt = Counter()
    nrebuilt = 0
    mismatch = 0
    for r in B:
        cube = dead[r["slice"]][r["cube_idx"]]
        g = induced_groups(cube, r["P"])
        R = sum(len(M) - 1 for M in g.values())
        if R != r["R"]:
            mismatch += 1
            continue
        nrebuilt += 1
        # signature: multiset over centers of (center_role, sorted member roles)
        sig = tuple(sorted(
            (role(c, r["slice"]), tuple(sorted(role(m, r["slice"]) for m in M)))
            for c, M in g.items()))
        sig_cnt[sig] += 1
        canon_cnt[r["canon_h"]] += 1
        center_role_cnt[tuple(sorted(role(c, r["slice"]) for c in g))] += 1
    print(f"rebuilt {nrebuilt}/{len(B)} tier-B cores (R mismatches: {mismatch})")
    print(f"distinct exact canons: {len(canon_cnt)}; distinct role signatures: {len(sig_cnt)}; "
          f"distinct center-role multisets: {len(center_role_cnt)}")
    print("top center-role multisets:")
    for k, v in center_role_cnt.most_common(15):
        print(f"    {k}: {v}")

    # ---------------- T3: complete k=4 universe ----------------
    print("\n=== T3: complete abstract k=4 universe (tier C) ===")
    print(f"total {len(C)}: dead {sum(1 for r in C if r['verdict']=='C_DEAD')} / "
          f"alive {sum(1 for r in C if r['verdict']=='C_ALIVE_SATURATED')}")

    def canon_to_groups(canon_s):
        edges = literal_eval(canon_s)
        g = defaultdict(list)
        for c, m in edges:
            g[c].append(m)
        return {c: sorted(ms) for c, ms in g.items()}

    def describe(g):
        # structural bits: mutual edges (c in M_d and d in M_c), full stars, R, centers
        R = sum(len(M) - 1 for M in g.values())
        centers = sorted(g)
        mutual = sorted((c, d) for c in g for d in g
                        if c < d and d in g[c] and c in g[d])
        full = [c for c, M in g.items() if len(M) == 3]  # k=4: full star = 3 others... members include base
        return R, centers, mutual, full

    for verdict in ("C_DEAD", "C_ALIVE_SATURATED"):
        print(f"\n-- {verdict} k=4 classes --")
        for r in sorted([x for x in C if x["verdict"] == verdict],
                        key=lambda x: (x["delta"], x["R"])):
            g = canon_to_groups(r["canon"])
            R, centers, mutual, full = describe(g)
            gs = "; ".join(f"{c}:{g[c]}" for c in centers)
            print(f"  delta={r['delta']:+d} R={R} mode={r['mode']:9s} "
                  f"nkill={r['n_killing_pairs']} centers={len(centers)} "
                  f"mutual={len(mutual)} full4={len(full)}   {gs}")

    # the u1 class
    u1 = [r for r in rows if r.get("is_u1")]
    for r in u1:
        print(f"\nu1TwoLargeCapObstruction class: slice={r['slice']} k={r['k']} R={r['R']} "
              f"delta={r['delta']} mode={r['mode']} canon={r['canon']}")
        print(f"  P={r['P']} killing_pairs(rel)={r['killing_pairs']}")


if __name__ == "__main__":
    main()
