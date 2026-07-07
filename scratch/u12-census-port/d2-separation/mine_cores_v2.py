#!/usr/bin/env python3
"""D2 dead-core mining driver, v2: gauge-pair pruned candidate sweep.

Identical oracle stack to the ported _u12_core_mine.mine_cube (msolve char-0
solve + Singular char-0 confirmation, same timeouts), with ONE provably sound
candidate restriction: only subsets P with {0,1} <= P are tested.

Soundness (proof, also in report.md): if P misses point 0 and point 1, place
all points of P at one location -> every equidistance difference vanishes, so
INDUCED(P) is C-feasible.  If P contains 0 but not 1, place all points of P
at the gauge position of 0 (0,0); every d2 difference vanishes.  Symmetrically
for 1 without 0 (all at (1,0)).  Hence every C-infeasible induced subsystem
contains BOTH gauge points, and pruning them changes no mining result
(min_support, core set) -- only skips provably-feasible msolve calls.
Validated empirically against unpruned runs (see report).

Usage:
  uv run --with sympy python mine_cores_v2.py <profile> <start> <end> [--kmax 8] [--out FILE]
"""
import argparse
import importlib.util
import json
import os
import time
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


CM = _load("cm", f"{PORT}/_u12_core_mine.py")
N = 12


def mine_cube_pruned(cube, kmax=8, workers=16, ms_timeout=30):
    """CM.mine_cube with the gauge-pair candidate restriction; same oracles."""
    gm, polys, exp = CM.build_cube_polys(cube)
    result = {"min_support": None, "cores": [], "kmax_reached": None,
              "n_timeout_feasible": 0, "n_candidates_tested": 0}
    for k in range(3, min(kmax, N) + 1):
        # PRUNED: {0,1} <= P (provably necessary for C-infeasibility, see doc)
        Psets = [(0, 1) + rest for rest in combinations(range(2, N), k - 2)]
        cand = [(P, CM.induced(gm, P)) for P in Psets]
        cand = [(P, g) for P, g in cand if len(g) >= 3]
        result["n_candidates_tested"] += len(cand)

        def test(item):
            P, g = item
            return P, g, CM.msolve_infeasible_char0(exp, g, timeout=ms_timeout)

        infeas = []
        with ThreadPoolExecutor(max_workers=workers) as ex:
            for P, g, res in ex.map(test, cand):
                if res == "infeasible":
                    infeas.append((P, g))
                elif res == "timeout":
                    result["n_timeout_feasible"] += 1
        if not infeas:
            continue
        cores = []
        for P, g in infeas:
            sc = CM.singular_infeasible_char0(polys, g, timeout=120)
            if sc is True:
                sig, stars = CM.signature(cube, P)
                cores.append({"P": list(P), "n_gens": len(g),
                              "centers": sorted({gm[i][0] for i in g}),
                              "signature": sig, "full_4stars": stars,
                              "n_full_4stars": len(stars)})
            elif sc is None:
                sig, stars = CM.signature(cube, P)
                cores.append({"P": list(P), "n_gens": len(g),
                              "centers": sorted({gm[i][0] for i in g}),
                              "signature": sig, "full_4stars": stars,
                              "n_full_4stars": len(stars), "singular": "TIMEOUT"})
        if cores:
            result["min_support"] = k
            result["cores"] = cores
            return result
    result["kmax_reached"] = kmax
    return result


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("profile", choices=["654", "555"])
    ap.add_argument("start", type=int)
    ap.add_argument("end", type=int)
    ap.add_argument("--kmax", type=int, default=8)
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    out_path = args.out or f"{HERE}/mined_cores_v2_{args.profile}.jsonl"
    cubes = []
    with open(f"{PORT}/_u12_dead_{args.profile}.jsonl") as f:
        for ln in f:
            d = json.loads(ln)
            cubes.append({int(k): v for k, v in d.items()})

    done = set()
    if os.path.exists(out_path):
        with open(out_path) as f:
            for ln in f:
                try:
                    done.add(json.loads(ln)["cube_idx"])
                except Exception:
                    pass

    for i in range(args.start, min(args.end, len(cubes))):
        if i in done:
            continue
        t0 = time.time()
        r = mine_cube_pruned(cubes[i], kmax=args.kmax)
        el = round(time.time() - t0, 1)
        rec = {"profile": args.profile, "cube_idx": i,
               "cube": {str(p): cubes[i][p] for p in range(12)},
               "min_support": r["min_support"],
               "n_timeout_feasible": r["n_timeout_feasible"],
               "n_candidates_tested": r["n_candidates_tested"],
               "elapsed_s": el, "cores": r["cores"]}
        with open(out_path, "a") as f:
            f.write(json.dumps(rec) + "\n")
        print(f"# cube {i}: min_support={r['min_support']} n_cores={len(r['cores'])} "
              f"({el}s)", flush=True)


if __name__ == "__main__":
    main()
