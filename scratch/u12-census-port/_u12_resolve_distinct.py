#!/usr/bin/env python3
"""Resolve distinctness (does a realization with all 12 points DISTINCT exist?) for
ℂ-alive |A|=12 cubes, via msolve char-0 SOLVE mode on the per-pair Rabinowitsch
saturation:  base equidistance polys  +  { t_k * d2(a,b) - 1 : all pairs a<b }.

[-1] (empty over QQ-bar) => NO distinct realization (NO_VALID_REAL, DEAD).
otherwise               => DISTINCT_ALIVE (a distinct realization exists).

msolve is used because the 86-variable saturation std blows up Singular for the
positive-dim, no-single-forced-pair cubes (the stage-2 TIMEOUTs).  This is the
exact char-0 emptiness oracle (same as _min_point_support.py / _u12_census stage1),
no bad-prime risk.  Smoke-gated on the known-DEAD codex + the known-NO_VALID_REAL
555 alive cube.

Usage:
  uv run python _u12_resolve_distinct.py smoke
  uv run python _u12_resolve_distinct.py resolve <alive.jsonl> [--timeout 900] [--threads 4] [--workers 6]
"""
import argparse
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor, as_completed
from itertools import combinations

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


gss = _load("gss", f"{HERE}/gen_singular_shadow.py")


def _sat_system(cube):
    n = len(cube)
    coords = [f"x{p}{ax}" for p in range(2, n) for ax in ("x", "y")]
    base = [f"({gss.d2(c, ks[0])})-({gss.d2(c, k)})" for c, ks in cube.items() for k in ks[1:]]
    pairs = list(combinations(range(n), 2))
    tvars = [f"t{k}" for k in range(len(pairs))]
    sat = [f"t{k}*({gss.d2(a, b)})-1" for k, (a, b) in enumerate(pairs)]
    allvars = coords + tvars
    syms = {v: sympy.Symbol(v) for v in allvars}
    exp = [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
           for p in base + sat]
    return allvars, exp


def resolve_one(cube, timeout=900, threads=4):
    """'DEAD' (NO_VALID_REAL), 'ALIVE' (distinct realization), 'TIMEOUT'."""
    allvars, exp = _sat_system(cube)
    inp = ",".join(allvars) + "\n0\n" + ",\n".join(exp) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", str(threads)],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        res = "DEAD" if raw.startswith("[-1]") else "ALIVE"
    except subprocess.TimeoutExpired:
        res = "TIMEOUT"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    return res


def smoke():
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    r = resolve_one(codex, timeout=300)
    print(f"[smoke] codex |A|=11 distinctness = {r} (expect DEAD: C-empty base)", flush=True)
    assert r == "DEAD", "codex smoke FAIL"
    alive555 = {int(k): v for k, v in json.loads(
        '{"0": [2, 5, 10, 11], "1": [2, 6, 8, 9], "2": [0, 4, 9, 10], "3": [0, 1, 9, 11], '
        '"4": [0, 2, 5, 7], "5": [4, 7, 8, 11], "6": [1, 3, 9, 10], "7": [6, 8, 10, 11], '
        '"8": [0, 3, 4, 6], "9": [3, 5, 6, 7], "10": [6, 7, 9, 11], "11": [3, 4, 5, 9]}').items()}
    r2 = resolve_one(alive555, timeout=600)
    print(f"[smoke] 555 ℂ-alive cube distinctness = {r2} "
          f"(expect DEAD: comp_g_m said NO_VALID_REAL/forced-pair)", flush=True)
    assert r2 == "DEAD", "555 smoke FAIL"
    print("[smoke] OK", flush=True)


def resolve(path, timeout, threads, workers):
    cubes = []
    with open(path) as f:
        for ln in f:
            d = json.loads(ln)
            cubes.append({int(k): v for k, v in d.items()})
    print(f"# resolving distinctness of {len(cubes)} ℂ-alive cubes from {os.path.basename(path)}",
          flush=True)
    tally = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0}
    alive_cubes, timeout_cubes = [], []
    done = [0]
    with ThreadPoolExecutor(max_workers=workers) as ex:
        futs = {ex.submit(resolve_one, cube, timeout, threads): cube for cube in cubes}
        for fut in as_completed(futs):
            v = fut.result()
            tally[v] += 1
            done[0] += 1
            if v == "ALIVE":
                alive_cubes.append(futs[fut])
                print(f"#   {done[0]}/{len(cubes)}: DISTINCT_ALIVE "
                      f"{json.dumps({str(p): futs[fut][p] for p in range(len(futs[fut]))})}", flush=True)
            elif v == "TIMEOUT":
                timeout_cubes.append(futs[fut])
                print(f"#   {done[0]}/{len(cubes)}: TIMEOUT", flush=True)
            elif done[0] % 20 == 0 or done[0] == len(cubes):
                print(f"#   {done[0]}/{len(cubes)}: {tally}", flush=True)
    print(f"# FINAL distinctness tally: {tally}", flush=True)
    prof = os.path.basename(path).replace("_u12_alive_", "").replace(".jsonl", "")
    if alive_cubes:
        with open(f"{HERE}/_u12_distinct_alive_{prof}.jsonl", "w") as f:
            for c in alive_cubes:
                f.write(json.dumps({str(p): c[p] for p in range(len(c))}) + "\n")
    if timeout_cubes:
        with open(f"{HERE}/_u12_distinct_timeout_{prof}.jsonl", "w") as f:
            for c in timeout_cubes:
                f.write(json.dumps({str(p): c[p] for p in range(len(c))}) + "\n")
    print(json.dumps({"file": os.path.basename(path), "n": len(cubes), "tally": tally,
                      "first_distinct_alive": ({str(p): alive_cubes[0][p] for p in range(len(alive_cubes[0]))}
                                               if alive_cubes else None)}), flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["smoke", "resolve"])
    ap.add_argument("path", nargs="?")
    ap.add_argument("--timeout", type=int, default=900)
    ap.add_argument("--threads", type=int, default=4)
    ap.add_argument("--workers", type=int, default=6)
    args = ap.parse_args()
    if args.cmd == "smoke":
        smoke()
    else:
        resolve(args.path, args.timeout, args.threads, args.workers)
