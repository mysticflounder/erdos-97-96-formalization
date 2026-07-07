#!/usr/bin/env python3
"""T1: constructive search for a realizable admissible cube (n in 12..17).

Step 1: search finite planar point sets where EVERY point has >= 4 others
equidistant from it (an "all-K4 set"): subsets of triangular/square lattice
windows + parametric two-ring families, via randomized local search on exact
squared distances (rational/integer arithmetic — no floating point classes).

Step 2: for each all-K4 set found, decide whether SOME choice of per-point
4-classes + SOME frame labeling (U,V,W + cap assignment for a two-large-cap
profile at that n) satisfies the census admissibility: C1, C2 (|K_p cap K_q|<=2),
C4 (each pair in <=2 classes), one-hit at V and W. If yes: the set itself is a
distinct-real realization => the census-level uniform kill is FALSE at that n.

Also tracks the EXACT-4 variant (full radius class within the set has exactly 4
members) — the leaf's shell is exactly-4, so an exact-4 witness would defeat
even the exactness-strengthened statement.
"""
import itertools
import json
import random
import sys
from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations

# ---------------------------------------------------------------------------
# exact point universes
# ---------------------------------------------------------------------------


def tri_window(w=6, h=6):
    """Triangular lattice window, coordinates doubled to stay integral:
    point (i,j) -> (2i+j, j) in a sheared integer frame with squared distance
    d2((a1,b1),(a2,b2)) = ((da)^2*1 + ... ) computed via the quadratic form:
    actual coords: x = i + j/2, y = j*sqrt(3)/2 => d2 = (di+dj/2)^2 + 3/4 dj^2
    = di^2 + di*dj + dj^2 (integral in lattice coords)."""
    pts = [(i, j) for i in range(w) for j in range(h)]

    def d2(p, q):
        di, dj = p[0] - q[0], p[1] - q[1]
        return di * di + di * dj + dj * dj
    return pts, d2


def sq_window(w=6, h=6):
    pts = [(i, j) for i in range(w) for j in range(h)]

    def d2(p, q):
        return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2
    return pts, d2


def classes_of(subset, d2):
    """per point: dict radius -> list of others at that squared distance."""
    cl = {}
    for p in subset:
        by = defaultdict(list)
        for q in subset:
            if q != p:
                by[d2(p, q)].append(q)
        cl[p] = by
    return cl


def k4_deficiency(subset, d2, exact=False):
    """number of points lacking a >=4 (or ==4) class."""
    cl = classes_of(subset, d2)
    bad = 0
    for p in subset:
        sizes = [len(v) for v in cl[p].values()]
        ok = any(s == 4 for s in sizes) if exact else any(s >= 4 for s in sizes)
        if not ok:
            bad += 1
    return bad


def local_search(pts, d2, n, iters=20000, seed=0, exact=False):
    rng = random.Random(seed)
    best = None
    cur = rng.sample(pts, n)
    curbad = k4_deficiency(cur, d2, exact)
    for it in range(iters):
        if curbad == 0:
            return cur
        out_p = rng.choice(cur)
        in_p = rng.choice([p for p in pts if p not in cur])
        nxt = [p for p in cur if p != out_p] + [in_p]
        nb = k4_deficiency(nxt, d2, exact)
        if nb <= curbad or rng.random() < 0.02:
            cur, curbad = nxt, nb
        if best is None or curbad < best[1]:
            best = (cur[:], curbad)
    return None if best[1] > 0 else best[0]


# ---------------------------------------------------------------------------
# admissibility search for a found all-K4 set
# ---------------------------------------------------------------------------


def profiles_for(n):
    """two-large-cap (cS,cO1,cO2): sum=n+3, all>=4, at least two >=5,
    S the surplus (largest, by the census convention S >= O1 >= O2)."""
    out = []
    for cS in range(4, n):
        for cO1 in range(4, n):
            cO2 = n + 3 - cS - cO1
            if cO2 < 4 or not (cS >= cO1 >= cO2):
                continue
            if sum(1 for c in (cS, cO1, cO2) if c >= 5) < 2:
                continue
            out.append((cS, cO1, cO2))
    return out


def admissible_labeling(subset, d2, verbose=False, exact=False, max_label_tries=200000,
                        seed=0):
    """Search: labeling (U,V,W + cap split per profile) x per-point class choice.
    Classes: 4-subsets of maximal equal-radius classes (>=4); exact: ==4 full class.
    Constraint order: choose classes greedily with C2/C4 backtracking; one-hit
    only binds K_V,K_W. Returns witness dict or None."""
    n = len(subset)
    cl = classes_of(subset, d2)
    # candidate classes per point
    cand = {}
    for p in subset:
        cs = []
        for r, mem in cl[p].items():
            if exact:
                if len(mem) == 4:
                    cs.append(frozenset(mem))
            else:
                if len(mem) >= 4:
                    for c in combinations(mem, 4):
                        cs.append(frozenset(c))
        if not cs:
            return None
        cand[p] = cs
    rng = random.Random(seed)
    pts = list(subset)
    for prof in profiles_for(n):
        cS, cO1, cO2 = prof
        tries = 0
        while tries < max_label_tries // 10:
            tries += 1
            perm = pts[:]
            rng.shuffle(perm)
            Vp, Wp, Up = perm[0], perm[1], perm[2]
            rest = perm[3:]
            Sset = frozenset({Vp, Wp} | set(rest[:cS - 2]))
            O1set = frozenset({Up, Wp} | set(rest[cS - 2:cS - 2 + cO1 - 2]))
            O2set = frozenset({Up, Vp} | set(rest[cS - 2 + cO1 - 2:]))
            if len(O2set) != cO2:
                continue

            def onehit(p, kp):
                if p == Vp:
                    if len(kp & (Sset - {Vp})) > 1 or len(kp & (O2set - {Vp})) > 1:
                        return False
                if p == Wp:
                    if len(kp & (Sset - {Wp})) > 1 or len(kp & (O1set - {Wp})) > 1:
                        return False
                return True

            # backtracking class assignment, V and W first
            order = [Vp, Wp] + [p for p in pts if p not in (Vp, Wp)]
            assigned = {}
            paircount = Counter()

            def feas(p, kp):
                if not onehit(p, kp):
                    return None
                for q, kq in assigned.items():
                    if len(kp & kq) > 2:
                        return None
                pr = list(combinations(sorted(kp), 2))
                for e in pr:
                    if paircount[e] + 1 > 2:
                        return None
                return pr

            nodes = [0]

            def build(i):
                if i == n:
                    return True
                p = order[i]
                cs = cand[p][:]
                rng.shuffle(cs)
                for kp in cs:
                    nodes[0] += 1
                    if nodes[0] > 100000:
                        return False
                    pr = feas(p, kp)
                    if pr is None:
                        continue
                    assigned[p] = kp
                    for e in pr:
                        paircount[e] += 1
                    if build(i + 1):
                        return True
                    for e in pr:
                        paircount[e] -= 1
                    del assigned[p]
                return False

            if build(0):
                return {"profile": prof, "U": Up, "V": Vp, "W": Wp,
                        "S": sorted(Sset), "O1": sorted(O1set), "O2": sorted(O2set),
                        "classes": {str(p): sorted(assigned[p]) for p in pts}}
    return None


def main():
    rng_seeds = range(8)
    results = []
    for name, (pts, d2) in {
        "tri7x7": tri_window(7, 7),
        "tri6x6": tri_window(6, 6),
        "sq7x7": sq_window(7, 7),
    }.items():
        for n in (12, 13, 14, 15, 16):
            found = None
            for sd in rng_seeds:
                s = local_search(pts, d2, n, iters=30000, seed=sd)
                if s is not None:
                    found = s
                    break
            if found is None:
                print(f"[{name}] n={n}: NO all-K4 subset found (8 seeds x 30k iters)")
                continue
            exact4 = k4_deficiency(found, d2, exact=True) == 0
            print(f"[{name}] n={n}: all-K4 subset FOUND {sorted(found)} exact4={exact4}")
            wit = admissible_labeling(found, d2, seed=1)
            if wit:
                print(f"  ADMISSIBLE LABELING FOUND: {json.dumps(wit)}")
                results.append({"universe": name, "n": n, "subset": sorted(found),
                                "witness": wit, "exact4_variant": exact4})
            else:
                print("  no admissible labeling found (search bounded)")
    with open("t1_results.json", "w") as f:
        json.dump(results, f, indent=2, default=str)
    print(f"total realizable-admissible witnesses: {len(results)}")


if __name__ == "__main__":
    main()
