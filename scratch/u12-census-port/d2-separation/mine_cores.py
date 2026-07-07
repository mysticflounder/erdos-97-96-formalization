#!/usr/bin/env python3
"""D2 dead-core mining driver.

Wraps the ported _u12_core_mine.mine_cube (msolve char-0 solve oracle +
Singular char-0 confirmation, identical methodology to the audited
_min_point_support.py) and persists results INCREMENTALLY as jsonl:
one record per dead cube:
  {"profile", "cube_idx", "cube", "min_support", "n_timeout_feasible",
   "elapsed_s", "cores": [{"P", "n_gens", "centers", "signature",
                           "full_4stars", "n_full_4stars", ["singular"]}]}

Usage:
  uv run --with sympy python mine_cores.py <profile> <start_idx> <end_idx> [--kmax 8] [--out FILE]
"""
import argparse
import importlib.util
import json
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


CM = _load("cm", f"{PORT}/_u12_core_mine.py")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("profile", choices=["654", "555"])
    ap.add_argument("start", type=int)
    ap.add_argument("end", type=int)
    ap.add_argument("--kmax", type=int, default=8)
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    out_path = args.out or f"{HERE}/mined_cores_{args.profile}.jsonl"
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
            print(f"# cube {i}: already mined, skip", flush=True)
            continue
        t0 = time.time()
        r = CM.mine_cube(cubes[i], kmax=args.kmax)
        el = round(time.time() - t0, 1)
        rec = {"profile": args.profile, "cube_idx": i,
               "cube": {str(p): cubes[i][p] for p in range(12)},
               "min_support": r["min_support"],
               "n_timeout_feasible": r["n_timeout_feasible"],
               "elapsed_s": el, "cores": r["cores"]}
        with open(out_path, "a") as f:
            f.write(json.dumps(rec) + "\n")
        print(f"# cube {i}: min_support={r['min_support']} n_cores={len(r['cores'])} "
              f"sigs={[c['signature'] for c in r['cores']]} "
              f"stars={[c['n_full_4stars'] for c in r['cores']]} ({el}s)", flush=True)


if __name__ == "__main__":
    main()
