#!/usr/bin/env python3
"""Independent enumeration + dead/alive classification of the k=4 universe.

Enumerate all admissible witness maps, canonicalize (brute S4), decide each
class dead/alive via msolve char-0 ([-1] <=> C-empty) on
  {equidistance generators} ∪ {all-pairs Rabinowitsch},
cross-check the dead set against the dichotomy run's Tier C canons, and run
smoke gates (i) vesica and (ii) dead/alive pair.
"""
import json
import os
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor

import k4lib as K

HERE = os.path.dirname(os.path.abspath(__file__))


def msolve_empty(polys, timeout=30):
    """True iff msolve reports the ideal C-empty ([-1] in output)."""
    vs = K.used_vars(polys)
    names = [K.var_name(g) for g in vs]
    remap = {g: i for i, g in enumerate(vs)}
    strs = []
    for p in polys:
        q = {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in p.items()}
        strs.append(poly_str(q, names))
    inp = ",".join(names) + "\n0\n" + ",\n".join(strs) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        return raw.startswith("[-1]")
    except subprocess.TimeoutExpired:
        return None
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass


def poly_str(p, names):
    if not p:
        return "0"
    terms = []
    for m, c in sorted(p.items()):
        if c.denominator != 1:
            coeff = f"({c.numerator}/{c.denominator})"
        else:
            coeff = str(c.numerator)
        body = "*".join(f"{names[i]}^{e}" if e > 1 else names[i] for i, e in m)
        if body and coeff == "1":
            terms.append(body)
        elif body and coeff == "-1":
            terms.append("-" + body)
        elif body:
            terms.append(f"{coeff}*{body}")
        else:
            terms.append(coeff)
    return "+".join(terms).replace("+-", "-")


def class_dead(g, timeout=30):
    polys, _ = K.pattern_polys(g)
    rabs = K.rabinowitsch(K.all_pairs())
    return msolve_empty(polys + [r[0] for r in rabs], timeout=timeout)


def dichotomy_canon(g):
    """Reproduce classify.py.canonical over the SUPPORT edge set, so we can map
    our reps onto the dichotomy's recorded canon strings for cross-check."""
    edges = [(c, m) for c, M in sorted(g.items()) for m in M]
    verts = sorted({u for u, v in edges} | {v for u, v in edges})
    E = set(edges)
    # degree-refinement colours (verbatim shape of classify.py:153-169)
    ind = {x: 0 for x in verts}
    outd = {x: 0 for x in verts}
    for u, v in E:
        outd[u] += 1
        ind[v] += 1
    col = {x: (ind[x], outd[x]) for x in verts}
    from itertools import permutations, product
    for _ in range(len(verts)):
        nc = {}
        for x in verts:
            inc = tuple(sorted(col[u] for (u, v) in E if v == x))
            oc = tuple(sorted(col[v] for (u, v) in E if u == x))
            nc[x] = (col[x], inc, oc)
        comp = {c: i for i, c in enumerate(sorted(set(nc.values())))}
        nc = {x: comp[nc[x]] for x in verts}
        if nc == col:
            break
        col = nc
    groups = {}
    for x in verts:
        groups.setdefault(col[x], []).append(x)
    order = sorted(groups)
    perms = [list(permutations(groups[c])) for c in order]
    best = None
    for combo in product(*perms):
        mp, idx = {}, 0
        for tup in combo:
            for x in tup:
                mp[x] = idx
                idx += 1
        rel = tuple(sorted((mp[u], mp[v]) for (u, v) in E))
        if best is None or rel < best:
            best = rel
    return best


def main():
    # 1. enumerate classes (brute S4 canon)
    seen = {}
    total_maps = 0
    for g in K.enumerate_maps():
        total_maps += 1
        ck = K.canon_brute(g)
        if ck not in seen:
            seen[ck] = g
    classes = list(seen.values())
    print(f"# enumerated {total_maps} admissible maps -> {len(classes)} "
          f"canonical classes (brute S4)", flush=True)

    # 2. classify each class dead/alive
    def run(g):
        return (g, class_dead(g))
    results = []
    with ThreadPoolExecutor(max_workers=4) as ex:
        for g, dead in ex.map(run, classes):
            results.append((g, dead))
    dead = [g for g, d in results if d is True]
    alive = [g for g, d in results if d is False]
    to = [g for g, d in results if d is None]
    print(f"# dead={len(dead)} alive={len(alive)} timeout={len(to)}", flush=True)
    if to:
        print("# TIMEOUTS (must resolve):", [K.readable(g) for g in to], flush=True)

    # 3. delta multiset of dead classes
    deltas = sorted(K.R_of(g) - 4 for g in dead)
    print(f"# dead delta multiset = {deltas}", flush=True)

    # 4. cross-check dead set against the dichotomy Tier C canons
    dich = [json.loads(ln) for ln in open(f"{HERE}/dichotomy_dead_canons.json")]
    dich_canons = set()
    for row in dich:
        # canon stored as python-tuple string; eval into a tuple-of-tuples
        dich_canons.add(eval(row["canon"]))
    my_dich_canons = {dichotomy_canon(g) for g in dead}
    match = my_dich_canons == dich_canons
    print(f"# dead-set matches dichotomy Tier C canons: {match} "
          f"(mine {len(my_dich_canons)}, dich {len(dich_canons)})", flush=True)
    if not match:
        print("#   only in mine:", my_dich_canons - dich_canons, flush=True)
        print("#   only in dich:", dich_canons - my_dich_canons, flush=True)

    # 5. smoke gate (i): vesica dead
    vesica = {0: [1, 2, 3], 1: [2, 3], 2: [0, 1, 3]}
    gi = class_dead(vesica)
    print(f"# SMOKE (i) vesica {K.readable(vesica)} dead? {gi}", flush=True)

    # 6. smoke gate (ii): dead in / alive out
    dead_pair = {0: [1, 2, 3], 1: [2, 3], 2: [0, 3], 3: [1, 2]}
    alive_pair = {0: [1, 2, 3], 1: [2, 3], 2: [1, 3], 3: [1, 2]}
    gd = class_dead(dead_pair)
    ga = class_dead(alive_pair)
    dead_canon_set = {K.canon_brute(g) for g in dead}
    dead_in = K.canon_brute(dead_pair) in dead_canon_set
    alive_out = K.canon_brute(alive_pair) not in dead_canon_set
    print(f"# SMOKE (ii) dead-pair {K.readable(dead_pair)} dead? {gd}; "
          f"in-dead-set? {dead_in}", flush=True)
    print(f"# SMOKE (ii) alive-pair {K.readable(alive_pair)} dead? {ga}; "
          f"NOT-in-dead-set? {alive_out}", flush=True)

    # 7. persist the dead classes with kill shapes and readable forms
    dead_out = []
    for g in sorted(dead, key=lambda g: (K.R_of(g), K.readable(g))):
        dead_out.append({
            "readable": K.readable(g),
            "pattern": {str(c): sorted(M) for c, M in g.items()},
            "R": K.R_of(g), "delta": K.R_of(g) - 4,
            "brute_canon": str(K.canon_brute(g)),
            "dichotomy_canon": str(dichotomy_canon(g)),
        })
    with open(f"{HERE}/dead_classes.json", "w") as f:
        json.dump(dead_out, f, indent=2)
    print(f"# wrote {len(dead_out)} dead classes -> dead_classes.json", flush=True)

    ok = (len(classes) == 44 and len(dead) == 10 and match and gi is True
          and gd is True and ga is False and dead_in and alive_out and not to)
    print(f"\n# ENUMERATION GATE: {'PASS' if ok else 'FAIL'}", flush=True)
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
