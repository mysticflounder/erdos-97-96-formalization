#!/usr/bin/env python3
"""T6: n=13 uniformity probe for the census-level admissible-cube kill.

Mirrors the committed |A|=12 census conventions (C1/C2/C4, one-hit at V,W,
gauge x0=(0,0), x1=(1,0), star-form generators, msolve char-0 stage-1 +
per-pair Rabinowitsch stage-2) at N=13 with two-large-cap profiles
(7,5,4), (6,6,4), (6,5,5) (S = surplus cap containing V,W; U in O1 cap O2).

Falsification target: a stage-2 DISTINCT-ALIVE admissible cube at n=13
refutes the n-uniform census-level lemma shape.
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

PORT = "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/u12-census-port"
HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


gss = _load("gss", f"{PORT}/gen_singular_shadow.py")  # d2/coord are label-generic

N = 13
U, V, W = 0, 1, 2


def _mkprof(cS, cO1, cO2):
    n = cS + cO1 + cO2 - 3
    sfree = list(range(3, 3 + cS - 2))
    o1free = list(range(3 + cS - 2, 3 + cS - 2 + cO1 - 2))
    o2free = list(range(3 + cS - 2 + cO1 - 2, n))
    return {"S": frozenset({1, 2} | set(sfree)),
            "O1": frozenset({0, 2} | set(o1free)),
            "O2": frozenset({0, 1} | set(o2free)),
            "caps": (cS, cO1, cO2), "n": n}


# S contains V,W ; O1 contains U,W ; O2 contains U,V ; free pts in exactly one cap
PROFILES = {
    "754": _mkprof(7, 5, 4),
    "664": _mkprof(6, 6, 4),
    "655": _mkprof(6, 5, 5),
    "854": _mkprof(8, 5, 4),
    "764": _mkprof(7, 6, 4),
    "755": _mkprof(7, 5, 5),
    "665": _mkprof(6, 6, 5),
    "965": _mkprof(9, 6, 5),   # n=17 spot probe
}


def _validate_profile(prof):
    S, O1, O2 = prof["S"], prof["O1"], prof["O2"]
    n = prof["n"]
    assert V in S and W in S and U in O1 and W in O1 and U in O2 and V in O2
    assert len(S | O1 | O2) == n
    assert len(S) + len(O1) + len(O2) - 3 == n
    for p in range(3, n):
        assert sum(p in c for c in (S, O1, O2)) == 1


def onehit_ok(prof, p, kp):
    S, O1, O2 = prof["S"], prof["O1"], prof["O2"]
    if p == V:
        if len(kp & (S - {V})) > 1 or len(kp & (O2 - {V})) > 1:
            return False
    if p == W:
        if len(kp & (S - {W})) > 1 or len(kp & (O1 - {W})) > 1:
            return False
    return True


def sample_cubes(prof, n_cubes, seed, max_attempts_factor=2000, node_budget=200000):
    import random
    rng = random.Random(seed)
    cand = {p: [frozenset(c) for c in combinations([q for q in range(N) if q != p], 4)]
            for p in range(N)}
    out, seen, attempts = [], set(), 0
    while len(out) < n_cubes and attempts < n_cubes * max_attempts_factor:
        attempts += 1
        order = list(range(N))
        rng.shuffle(order)
        assigned, paircount = {}, {}
        nodes = [0]
        over = [False]

        def feasible(p, kp):
            if not onehit_ok(prof, p, kp):
                return None
            for q, kq in assigned.items():
                if len(kp & kq) > 2:
                    return None
            pr = list(combinations(sorted(kp), 2))
            for e in pr:
                if paircount.get(e, 0) + 1 > 2:
                    return None
            return pr

        def build(i):
            if i == N:
                return True
            p = order[i]
            cs = cand[p][:]
            rng.shuffle(cs)
            for kp in cs:
                nodes[0] += 1
                if nodes[0] > node_budget:
                    over[0] = True
                    return False
                pr = feasible(p, kp)
                if pr is None:
                    continue
                assigned[p] = kp
                for e in pr:
                    paircount[e] = paircount.get(e, 0) + 1
                if build(i + 1):
                    return True
                for e in pr:
                    paircount[e] -= 1
                del assigned[p]
                if over[0]:
                    return False
            return False

        if build(0) and not over[0]:
            cube = {p: sorted(assigned[p]) for p in range(N)}
            key = tuple(tuple(cube[p]) for p in range(N))
            if key not in seen:
                seen.add(key)
                out.append(cube)
    return out, attempts


def var_list():
    return [f"x{p}{ax}" for p in range(2, N) for ax in ("x", "y")]


def cube_polys(cube):
    polys = []
    for c, ks in cube.items():
        base = gss.d2(c, ks[0])
        for k in ks[1:]:
            polys.append(f"({base})-({gss.d2(c, k)})")
    return polys


def _exp(polys, extra_vars=()):
    syms = {v: sympy.Symbol(v) for v in var_list()}
    for v in extra_vars:
        syms[v] = sympy.Symbol(v)
    return [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
            for p in polys]


def _msolve(varlist, polys, timeout, threads=1):
    inp = ",".join(varlist) + "\n0\n" + ",\n".join(polys) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", str(threads)],
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


def certify_stage1(cube, timeout=120):
    return _msolve(var_list(), _exp(cube_polys(cube)), timeout)


def certify_stage2(cube, timeout=600):
    base = cube_polys(cube)
    pairs = list(combinations(range(N), 2))
    tvars = [f"t{k}" for k in range(len(pairs))]
    sat = [f"t{k}*({gss.d2(a, b)})-1" for k, (a, b) in enumerate(pairs)]
    return _msolve(var_list() + tvars, _exp(base + sat, tvars), timeout, threads=2)


def smoke():
    # gate 1: known-DEAD codex |A|=11 through the same msolve path
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    global N
    saveN = N
    N = 11
    v = certify_stage1(codex, timeout=120)
    N = saveN
    print(f"[smoke] codex |A|=11 stage1 = {v} (expect DEAD)")
    assert v == "DEAD"
    # gate 2: an |A|=12 dead cube from the committed census reproduces DEAD
    with open(f"{PORT}/_u12_dead_654.jsonl") as f:
        cube12 = {int(k): v for k, v in json.loads(f.readline()).items()}
    N = 12
    v = certify_stage1(cube12, timeout=120)
    N = saveN
    print(f"[smoke] committed 654 dead cube stage1 = {v} (expect DEAD)")
    assert v == "DEAD"
    # gate 3: an |A|=12 ALIVE cube reproduces ALIVE (stage-1)
    with open(f"{PORT}/d2-separation/alive_2000_654.jsonl") as f:
        cubeA = {int(k): v for k, v in json.loads(f.readline()).items()}
    N = 12
    v = certify_stage1(cubeA, timeout=120)
    N = saveN
    print(f"[smoke] committed 654 alive cube stage1 = {v} (expect ALIVE)")
    assert v == "ALIVE"
    for name, prof in PROFILES.items():
        _validate_profile(prof)
    print("[smoke] profiles valid; OK")


def run(profile, n_cubes, seed, workers, t1, t2):
    prof = PROFILES[profile]
    _validate_profile(prof)
    cubes, att = sample_cubes(prof, n_cubes, seed)
    print(f"# n=13 profile {profile} caps={prof['caps']}: sampled {len(cubes)} "
          f"({att} attempts)", flush=True)
    tally = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0}
    alive = []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        futs = {ex.submit(certify_stage1, c, t1): c for c in cubes}
        for fut in as_completed(futs):
            v = fut.result()
            tally[v] += 1
            if v == "ALIVE":
                alive.append(futs[fut])
    print(f"# stage1 tally: {tally}", flush=True)
    d = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0}
    hits = []
    done = 0
    with ThreadPoolExecutor(max_workers=max(2, workers // 2)) as ex:
        futs = {ex.submit(certify_stage2, c, t2): c for c in alive}
        for fut in as_completed(futs):
            v = fut.result()
            d[v] += 1
            done += 1
            if v == "ALIVE":
                hits.append(futs[fut])
                print(f"#   stage2 DISTINCT-ALIVE HIT: {json.dumps({str(p): futs[fut][p] for p in range(N)})}",
                      flush=True)
            if done % 10 == 0 or done == len(alive):
                print(f"#   stage2 {done}/{len(alive)}: {d}", flush=True)
    print(f"# stage2 tally: {d}", flush=True)
    out = {"profile": profile, "n": N, "sampled": len(cubes), "stage1": tally,
           "stage2_on_alive": d, "distinct_alive": len(hits)}
    with open(f"{HERE}/t6_{profile}.json", "w") as f:
        json.dump(out, f, indent=2)
        if hits:
            f.write("\n")
    if hits:
        with open(f"{HERE}/t6_{profile}_hits.jsonl", "w") as f:
            for c in hits:
                f.write(json.dumps({str(p): c[p] for p in range(N)}) + "\n")
    print(json.dumps(out), flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["smoke", "run"])
    ap.add_argument("profile", nargs="?", default="754")
    ap.add_argument("--n-cubes", type=int, default=100)
    ap.add_argument("--seed", type=int, default=7)
    ap.add_argument("--workers", type=int, default=8)
    ap.add_argument("--t1", type=int, default=120)
    ap.add_argument("--t2", type=int, default=600)
    args = ap.parse_args()
    if args.cmd == "smoke":
        smoke()
    else:
        N = PROFILES[args.profile]["n"]
        globals()["N"] = N
        run(args.profile, args.n_cubes, args.seed, args.workers, args.t1, args.t2)
