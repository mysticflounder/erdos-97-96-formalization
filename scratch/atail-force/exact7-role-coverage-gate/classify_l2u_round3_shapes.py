#!/usr/bin/env python3
"""Classify the 73 universal round-3 L2u laws by Lean terminal shape.

For each universal (u, uc, m) pattern (kills == buildable denominator), the
claimed reduction is the Finding 14a mechanism with the class of u:

- transporting center K(u): b0 for p0a/p0b (r0), b1 for p1a/p1b (r1),
  O for e1/e2 (class O); merged p-points try both sides' centers.
- If m is in K's class members (or K's class contains both u and m via the
  shared radius), the kill is a TWO-CENTER bisector on chord {u, m} with
  centers {uc, K}: d(uc,u) = d(uc,m) is the asserted row, d(K,u) = d(K,m)
  is the class radius (one or two hops).  The four-point linear arrangement
  of (uc, K, u, m) in the base's block order must then be one of the four
  ported terminals (after / enclosed / split / before) in EVERY killed base.
- Otherwise the pattern is a THREE-CENTER cycle candidate (reported, not
  arrangement-checked here).

Order model (machine-verified in Finding 14a over all 876 survivors): the
six blocks [EA][S-bag][O][O1-bag][W][s0 b0 s1 b1 s2] are position-ordered;
bag-internal order is NOT fixed, so two points in the same bag get an
UNORDERED verdict unless they are the same point.
"""

import json
from collections import defaultdict

CLASS_CENTER = {
    "p0a": "b0", "p0b": "b0",
    "p1a": "b1", "p1b": "b1",
    "e1": "O", "e2": "O",
}
MERGED_CENTERS = {"p0a+p1a": ["b0", "b1"], "p0b+p1b": ["b0", "b1"]}


def block_rank(schema):
    """point -> (block index, None) with bag membership kept for tie checks."""
    ranks = {}
    for bi, blk in enumerate(schema["blocks"]):
        for pos, pt in enumerate(blk["points"]):
            # ordered blocks: position within block is meaningful
            ranks[pt] = (bi, pos if blk.get("ordered", True) else None)
    return ranks


def cmp_points(ranks, a, b):
    """-1 if a < b, 1 if a > b, None if same unordered bag."""
    ba, pa = ranks[a]
    bb, pb = ranks[b]
    if ba != bb:
        return -1 if ba < bb else 1
    if pa is None or pb is None:
        return None
    return -1 if pa < pb else 1


def arrangement(ranks, uc, K, u, m):
    """Classify the linear arrangement of centers {uc, K} vs chord {u, m}.

    Returns one of 'after', 'enclosed', 'split', 'before', or None when the
    order is not determined (same-bag tie) or matches no ported terminal.
    """
    cu = cmp_points(ranks, u, m)
    if cu is None:
        return None
    p1, p2 = (u, m) if cu < 0 else (m, u)
    sides = []
    for c in (uc, K):
        c1 = cmp_points(ranks, c, p1)
        c2 = cmp_points(ranks, c, p2)
        if c1 is None or c2 is None:
            return None
        if c1 < 0 and c2 < 0:
            sides.append("B")   # before both
        elif c1 > 0 and c2 > 0:
            sides.append("A")   # after both
        else:
            sides.append("E")   # strictly between
    pair = "".join(sorted(sides))
    return {"AA": "after", "EE": "enclosed", "AB": "split", "BB": "before"}.get(pair)


def class_map(schema):
    return {c["center"]: c["members"] for c in schema["exact_classes"]}


def main():
    kills = json.load(open("l2u_round3_scale_kills.json"))
    denom = json.load(open("l2u_round3_denominators.json"))
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}

    by_pat = defaultdict(list)
    for k in kills:
        by_pat[(k["u"], k["uc"], k["m"])].append(k["base"])

    two_center, cycles = [], []
    for pat, bases in sorted(by_pat.items()):
        u, uc, m = pat
        if len(bases) != denom.get(",".join(pat)):
            continue  # non-universal
        centers = MERGED_CENTERS[u] if u in MERGED_CENTERS else [CLASS_CENTER[u]]
        # candidate transporting centers: class must hold u and m in every base
        candidates = [
            K for K in centers
            if all(
                u in class_map(schemas[b]).get(K, []) and
                m in class_map(schemas[b]).get(K, [])
                for b in bases
            )
        ]
        if not candidates:
            cycles.append((pat, len(bases)))
            continue
        per_k = {}
        for K in candidates:
            arrs = defaultdict(int)
            for b in bases:
                ranks = block_rank(schemas[b])
                arrs[arrangement(ranks, uc, K, u, m)] += 1
            per_k[K] = dict(arrs)
        # prefer a K whose arrangement is a single named terminal everywhere
        chosen = next(
            (K for K, arrs in per_k.items()
             if len(arrs) == 1 and None not in arrs),
            candidates[0],
        )
        two_center.append((pat, len(bases), chosen, per_k[chosen]))

    print(f"{len(two_center)} two-center patterns, {len(cycles)} cycle patterns\n")
    print("== two-center (chord {u,m}, centers {uc, K}) ==")
    bad = 0
    for pat, n, K, arrs in two_center:
        flag = ""
        if None in arrs or len(arrs) > 1:
            flag = "  <-- MIXED/UNRESOLVED" if len(arrs) > 1 or None in arrs else ""
        if None in arrs:
            bad += 1
        print(f"  {','.join(pat):22s} {n:4d}  K={K:3s}  {arrs}{flag}")
    print(f"\n  patterns with unresolved arrangements: {bad}")
    print("\n== three-center cycle candidates ==")
    for pat, n in cycles:
        print(f"  {','.join(pat):22s} {n:4d}")


if __name__ == "__main__":
    main()
