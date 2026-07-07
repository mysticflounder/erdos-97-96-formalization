#!/usr/bin/env python3
"""T7: minimal-core localization for STAGE-2 dead cubes (C-alive, distinctness-dead).

The committed mining only localized stage-1 (C-equidistance-dead) cubes
(k* <= 8 on all 239). Nobody checked whether the 2118 stage-2 kills localize.
For a bounded-dead-core-extraction lemma (BDCE) to cover all admissible cubes,
stage-2 cubes must also carry bounded saturated-dead induced subsystems.

Oracle per subset P: induced equalities (pairwise-induced schema, M = K_c cap P,
|M|>=2) + gauge pin on the two smallest labels of P + Rabinowitsch separators on
ALL pairs within P. msolve char-0: [-1] => saturated-dead subsystem.
Soundness of the pin: similarity transitivity (Lemma G of the dichotomy report);
a saturated-dead induced subsystem certifies no realization of the cube with all
12 points distinct restricted... (monotonicity: cube solution restricted to P is
a solution of the induced system with P distinct.)

Smoke: (i) a stage-1 dead cube must yield a core at k <= its recorded k* range;
(ii) subsets of a DISTINCT-ALIVE system must never be reported dead (use the
k=4 mutual-equidistance rhombus pattern, realizable => all its subsets alive).
"""
import json
import os
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor, as_completed
from itertools import combinations

import sympy

PORT = "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/u12-census-port"
HERE = os.path.dirname(os.path.abspath(__file__))
N = 12


def d2(pa, pb, coord):
    ax, ay = coord[pa]
    bx, by = coord[pb]
    return f"(({ax})-({bx}))^2+(({ay})-({by}))^2"


def induced_groups(cube, P):
    Pset = set(P)
    groups = {}
    for c in P:
        M = [k for k in cube[c] if k in Pset]
        if len(M) >= 2:
            groups[c] = sorted(M)
    return groups


def subset_system(cube, P):
    """(varlist, polys) for induced system on P: gauge on two smallest labels,
    equalities + all-pair Rabinowitsch within P."""
    Ps = sorted(P)
    g = induced_groups(cube, Ps)
    if not g:
        return None, None, 0
    a0, a1 = Ps[0], Ps[1]
    coord = {}
    for p in Ps:
        if p == a0:
            coord[p] = ("0", "0")
        elif p == a1:
            coord[p] = ("1", "0")
        else:
            coord[p] = (f"x{p}x", f"x{p}y")
    xv = [f"x{p}{ax}" for p in Ps if p not in (a0, a1) for ax in ("x", "y")]
    eq = []
    for c, M in g.items():
        base = d2(c, M[0], coord)
        for m in M[1:]:
            eq.append(f"({base})-({d2(c, m, coord)})")
    pairs = list(combinations(Ps, 2))
    tv = [f"t{k}" for k in range(len(pairs))]
    sat = [f"t{k}*({d2(a, b, coord)})-1" for k, (a, b) in enumerate(pairs)]
    R = len(eq)
    syms = {v: sympy.Symbol(v) for v in xv + tv}
    polys = [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
             for p in eq + sat]
    return xv + tv, polys, R


def msolve_empty(varlist, polys, timeout=25):
    inp = ",".join(varlist) + "\n0\n" + ",\n".join(polys) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        return "DEAD" if raw.startswith("[-1]") else "ALIVE"
    except subprocess.TimeoutExpired:
        return "TIMEOUT"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass


def mine_cube(cube, kmax=8, workers=8, verbose=True):
    """Return (kstar, cores_at_kstar, tally) with the saturated oracle."""
    for k in range(3, kmax + 1):
        subs = [P for P in combinations(range(N), k)]
        found = []
        checked = 0
        with ThreadPoolExecutor(max_workers=workers) as ex:
            futs = {}
            for P in subs:
                vl, polys, R = subset_system(cube, P)
                if vl is None or R < 2:
                    continue
                futs[ex.submit(msolve_empty, vl, polys)] = (P, R)
            for fut in as_completed(futs):
                v = fut.result()
                checked += 1
                if v == "DEAD":
                    found.append(futs[fut])
        if verbose:
            print(f"    k={k}: checked {checked} induced subsystems, dead: {len(found)}",
                  flush=True)
        if found:
            return k, found
    return None, []


def smoke():
    # (i) stage-1 dead cube: known k* small
    with open(f"{PORT}/_u12_dead_654.jsonl") as f:
        cube = {int(a): b for a, b in json.loads(f.readline()).items()}
    k, cores = mine_cube(cube, kmax=6, workers=8, verbose=True)
    print(f"[smoke] stage-1 dead cube 654[0]: saturated k* = {k} "
          f"(expect <= 6; stage-1 cores are also saturated-dead)")
    assert k is not None and k <= 6
    # (ii) never-dead gate: realizable pattern (rhombus, mutual equidistance
    # delta=+2 S2 from D2 smoke) embedded as a fake 4-point cube fragment
    fake = {0: [1, 2, 3, 4], 1: [0, 2, 3, 4], 2: [0, 1, 3, 4], 3: [0, 1, 2, 4],
            4: [0, 1, 2, 3]}
    # build the S2 pattern system directly on P={0,1,2,3}: groups 0:[1,2],[1,3]; 1:[0,2],[0,3]; 2:[0,1]; 3:[0,1]
    cube_s2 = {0: [1, 2, 3, 99], 1: [0, 2, 3, 99], 2: [0, 1, 98, 99], 3: [0, 1, 98, 99]}
    vl, polys, R = subset_system(cube_s2, (0, 1, 2, 3))
    v = msolve_empty(vl, polys, timeout=30)
    print(f"[smoke] S2 mutual-equidistance rhombus pattern (R={R}): {v} (expect ALIVE)")
    assert v == "ALIVE"
    print("[smoke] OK")


def run(slice_, idxs, kmax, workers):
    with open(f"{PORT}/d2-separation/alive_2000_{slice_}.jsonl") as f:
        alive = [json.loads(ln) for ln in f]
    results = []
    for i in idxs:
        cube = {int(a): b for a, b in alive[i].items()}
        print(f"# stage-2 cube {slice_}[{i}] (C-alive, distinctness-dead per census logs)",
              flush=True)
        k, cores = mine_cube(cube, kmax=kmax, workers=workers)
        print(f"  -> saturated k* = {k}; n_cores_at_kstar = {len(cores)}", flush=True)
        for P, R in cores[:6]:
            print(f"     core P={P} R={R}", flush=True)
        results.append({"slice": slice_, "idx": i, "kstar": k,
                        "n_cores": len(cores),
                        "cores": [[list(P), R] for P, R in cores]})
    with open(f"{HERE}/t7_{slice_}.json", "w") as f:
        json.dump(results, f, indent=2)
    print(json.dumps([{k: r[k] for k in ("slice", "idx", "kstar", "n_cores")}
                      for r in results]), flush=True)


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["smoke", "run"])
    ap.add_argument("slice", nargs="?", default="654")
    ap.add_argument("--idxs", type=str, default="0,1,2")
    ap.add_argument("--kmax", type=int, default=8)
    ap.add_argument("--workers", type=int, default=8)
    args = ap.parse_args()
    if args.cmd == "smoke":
        smoke()
    else:
        run(args.slice, [int(x) for x in args.idxs.split(",")], args.kmax, args.workers)
