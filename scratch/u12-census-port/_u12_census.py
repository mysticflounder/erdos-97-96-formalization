#!/usr/bin/env python3
"""|A|=12 two-large-cap center-K4 aliveness census (generalizes uniformity_constrained_cubes.py).

Two cap profiles on 12 labeled points (U=0,V=1,W=2 fixed; Moser vertices shared:
U in O1,O2; V in S,O2; W in S,O1):
  (6,5,4): S={1,2,3,4,5,6}   O1={0,2,7,8,9}   O2={0,1,10,11}   |A|=6+5+4-3=12
  (5,5,5): S={1,2,3,4,5}     O1={0,2,6,7,8}   O2={0,1,9,10,11} |A|=5+5+5-3=12

Per-cube constraints (all PROVEN necessary, identical to the |A|=11 sampler):
  C1 p not in K_p, |K_p|=4 ; C2 |K_p∩K_q|<=2 ; C4 each unordered pair in <=2 classes ;
  ONE-HIT at V (<=1 of K_V in S\\V, <=1 in O2\\V) and at W (<=1 in S\\W, <=1 in O1\\W) ;
  center-K4 at ALL 12 centers.  Geometry-free (no convexity).

Reuses gen_singular_shadow.d2/coord (gauge x0=(0,0),x1=(1,0)) and _sat_suppcore.sat_empty
(Rabinowitsch distinctness).  Certify: Singular char-0 reduce(1,std)+dim -> DEAD(<1>)/ALIVE/TIMEOUT.

Usage:
  uv run python _u12_census.py smoke
  uv run python _u12_census.py census <profile:654|555> --n-cubes 2000 --seed 7 --workers 16 [--timeout 120]
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
DIST = _load("dist", f"{HERE}/_u12_distinct.py")   # audited comp_g_m per-pair saturation (cross-check)
RES = _load("res", f"{HERE}/_u12_resolve_distinct.py")  # msolve per-pair saturation (fast primary)

N = 12
U, V, W = 0, 1, 2

PROFILES = {
    "654": {"S": frozenset({1, 2, 3, 4, 5, 6}),
            "O1": frozenset({0, 2, 7, 8, 9}),
            "O2": frozenset({0, 1, 10, 11}),
            "caps": (6, 5, 4)},
    "555": {"S": frozenset({1, 2, 3, 4, 5}),
            "O1": frozenset({0, 2, 6, 7, 8}),
            "O2": frozenset({0, 1, 9, 10, 11}),
            "caps": (5, 5, 5)},
}


def _validate_profile(prof):
    S, O1, O2 = prof["S"], prof["O1"], prof["O2"]
    assert V in S and W in S, "V,W must be in S"
    assert U in O1 and W in O1, "U,W must be in O1"
    assert U in O2 and V in O2, "U,V must be in O2"
    assert len(S | O1 | O2) == N, "caps must cover all N points"
    assert len(S) + len(O1) + len(O2) - 3 == N, "cap sizes must give |A|=N"
    # each free (non-Moser) point in exactly one cap
    for p in range(3, N):
        memb = sum(p in c for c in (S, O1, O2))
        assert memb == 1, f"free point {p} in {memb} caps (must be 1)"


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
    """Randomized-restart backtracking with a per-attempt node budget: a single
    build() that explores > node_budget nodes is abandoned (return via budget flag)
    and a fresh random order is tried.  Bounds each attempt so a 'hard' random
    order cannot exhaust an enormous subtree (needed at N=12)."""
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
                if len(kp & kq) > 2:               # C2
                    return None
            pr = list(combinations(sorted(kp), 2))
            for e in pr:
                if paircount.get(e, 0) + 1 > 2:    # C4
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


def _exp_polys(cube):
    vs = var_list()
    syms = {v: sympy.Symbol(v) for v in vs}
    return [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
            for p in cube_polys(cube)]


def _singular_dead(cube, timeout=120):
    """True iff reduce(1,std(I))==0 over QQ (C-empty/DEAD). None on timeout."""
    vs = ",".join(var_list())
    ideal = "ideal I = " + ",\n  ".join(cube_polys(cube)) + ";"
    script = "\n".join([f"ring r = 0, ({vs}), dp;", ideal, "ideal G = std(I);",
                        'print("R1:");', "reduce(1,G);", 'print("END");', "quit;"])
    try:
        out = subprocess.run(["Singular", "-q"], input=script, capture_output=True,
                             text=True, timeout=timeout).stdout
        return out.split("R1:")[1].split("END")[0].strip() == "0"
    except subprocess.TimeoutExpired:
        return None


def certify(cube, timeout=120):
    """ℂ-aliveness via msolve char-0 SOLVE mode: [-1]==empty variety over QQ-bar
    ==DEAD (rigorous exact char-0, no bad-prime risk), else ALIVE.  This is the same
    oracle _min_point_support.py uses; smoke-validated against the known-DEAD codex.
    Returns 'DEAD','ALIVE','TIMEOUT'."""
    exp = _exp_polys(cube)
    inp = ",".join(var_list()) + "\n0\n" + ",\n".join(exp) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        ms = "DEAD" if raw.startswith("[-1]") else "ALIVE"
    except subprocess.TimeoutExpired:
        ms = "TIMEOUT"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    return ms


def certify_distinct(cube, timeout=600):
    """Distinctness via msolve char-0 per-pair Rabinowitsch saturation ([-1]==no
    distinct realization).  Fast primary; DISTINCT_ALIVE hits are cross-confirmed
    with the audited comp_g_m engine in census().  Returns 'DEAD'/'ALIVE'/'TIMEOUT'."""
    return RES.resolve_one(cube, timeout=timeout, threads=2)


def comp_g_verdict(cube, timeout=300):
    """Audited comp_g_m verdict: DISTINCT_ALIVE / NO_VALID_REAL / C_EMPTY / TIMEOUT."""
    return DIST.adjudicate(cube, timeout=timeout)["verdict"]


def smoke():
    # 1) codex |A|=11 shadow must be DEAD (known result) via the same Singular certify shape
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    vs = ",".join([f"x{p}{ax}" for p in range(2, 11) for ax in ("x", "y")])
    ideal = "ideal I = " + ",\n  ".join(
        f"({gss.d2(c, ks[0])})-({gss.d2(c, k)})" for c, ks in codex.items() for k in ks[1:]) + ";"
    script = "\n".join([f"ring r = 0, ({vs}), dp;", ideal, "ideal G = std(I);",
                        'print("R1:");', "reduce(1,G);", 'print("DIM:");', "dim(G);", "quit;"])
    pr = subprocess.run(["Singular", "-q"], input=script, capture_output=True, text=True, timeout=120)
    lines = [ln.strip() for ln in pr.stdout.splitlines()]
    r1 = next(lines[i + 1] for i, ln in enumerate(lines) if ln == "R1:")
    dim = next(lines[i + 1] for i, ln in enumerate(lines) if ln == "DIM:")
    print(f"[smoke] codex |A|=11 shadow: reduce(1,std)={r1} dim={dim} "
          f"-> {'DEAD OK' if r1 == '0' and dim == '-1' else 'FAIL'}", flush=True)
    assert r1 == "0" and dim == "-1", "codex smoke FAIL"
    # msolve char-0 solve-mode path on the same known-DEAD codex (the census primary oracle)
    cd_ms = certify(codex, timeout=120)
    print(f"[smoke] codex |A|=11 via msolve-primary certify() = {cd_ms} (expect DEAD)", flush=True)
    assert cd_ms == "DEAD", "codex msolve-path smoke FAIL"
    # 2) profiles validate
    for name, prof in PROFILES.items():
        _validate_profile(prof)
        print(f"[smoke] profile {name} caps={prof['caps']} valid; "
              f"S={sorted(prof['S'])} O1={sorted(prof['O1'])} O2={sorted(prof['O2'])}", flush=True)
    # 3) sample a couple cubes per profile and certify (sanity)
    for name in PROFILES:
        cubes, att = sample_cubes(PROFILES[name], 3, seed=1)
        print(f"[smoke] profile {name}: sampled {len(cubes)} in {att} attempts", flush=True)
        for cube in cubes:
            print(f"    {certify(cube, timeout=180)}  {json.dumps({str(p): cube[p] for p in range(N)})}", flush=True)
    print("[smoke] OK", flush=True)


def census(profile, n_cubes, seed, workers, timeout, dtimeout):
    prof = PROFILES[profile]
    _validate_profile(prof)
    cubes, att = sample_cubes(prof, n_cubes, seed)
    print(f"# profile {profile} caps={prof['caps']}: sampled {len(cubes)} distinct "
          f"constrained cubes ({att} attempts)", flush=True)
    tally = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0, "ERR": 0}
    alive = []
    dead = []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        futs = {ex.submit(certify, cube, timeout): cube for cube in cubes}
        for fut in as_completed(futs):
            v = fut.result()
            tally[v] = tally.get(v, 0) + 1
            if v == "ALIVE":
                alive.append(futs[fut])
            elif v == "DEAD":
                dead.append(futs[fut])
    print(f"# stage1 C-equidistance tally: {tally}", flush=True)
    # stage2: distinctness re-test on C-alive
    dtally = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0, "NONE": 0}
    still_alive = []
    if alive:
        done = [0]
        with ThreadPoolExecutor(max_workers=workers) as ex:
            futs = {ex.submit(certify_distinct, cube, dtimeout): cube for cube in alive}
            for fut in as_completed(futs):
                v = fut.result()
                done[0] += 1
                if v == "ALIVE" or done[0] % 10 == 0 or done[0] == len(alive):
                    print(f"#   stage2 {done[0]}/{len(alive)}: {v}"
                          + (f"  <-- DISTINCT_ALIVE {json.dumps(futs[fut])}" if v == "ALIVE" else ""),
                          flush=True)
                dtally[v] = dtally.get(v, 0) + 1
                if v == "ALIVE":
                    still_alive.append(futs[fut])
    print(f"# stage2 distinctness-on-C-alive tally: {dtally}", flush=True)

    # persist cube files IMMEDIATELY (before the fragile downstream validators) so a
    # validator crash never loses the decisive census data.
    with open(f"{HERE}/_u12_dead_{profile}.jsonl", "w") as f:
        for cube in dead:
            f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    with open(f"{HERE}/_u12_alive_{profile}.jsonl", "w") as f:
        for cube in alive:
            f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    if still_alive:
        with open(f"{HERE}/_u12_alive_distinct_{profile}.jsonl", "w") as f:
            for cube in still_alive:
                f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")

    # independent Singular spot-confirmation of msolve DEAD verdicts on a random sample
    import random
    rng = random.Random(seed)
    sample = dead[:] if len(dead) <= 25 else rng.sample(dead, 25)
    conf = {"confirmed_dead": 0, "singular_timeout": 0, "disagree": 0}
    with ThreadPoolExecutor(max_workers=workers) as ex:
        futs = [ex.submit(_singular_dead, cube, 300) for cube in sample]
        for fut in as_completed(futs):
            r = fut.result()
            if r is True:
                conf["confirmed_dead"] += 1
            elif r is None:
                conf["singular_timeout"] += 1
            else:
                conf["disagree"] += 1
    print(f"# DEAD spot-confirm (Singular reduce(1,std)==0 on {len(sample)} sampled DEAD): {conf}",
          flush=True)

    # cross-confirm stage-2 with the AUDITED comp_g_m engine: EVERY DISTINCT_ALIVE hit
    # (decisive) + a random sample of stage-2 DEAD verdicts.
    xchk = {"alive_confirmed": 0, "alive_refuted": 0, "dead_confirmed": 0,
            "dead_refuted": 0, "timeout": 0}
    xsample = still_alive[:] + (rng.sample(alive, min(15, len(alive))) if alive else [])
    for cube in xsample:
        try:
            av = comp_g_verdict(cube)   # comp_g_m verdict (non-fatal: audited cross-check only)
        except Exception as e:
            xchk["timeout"] += 1
            print(f"#   [xchk] comp_g_m error (skipped): {type(e).__name__}", flush=True)
            continue
        msv = "ALIVE" if cube in still_alive else "DEAD"
        if av == "DISTINCT_ALIVE":
            xchk["alive_confirmed" if msv == "ALIVE" else "alive_refuted"] += 1
        elif av in ("NO_VALID_REAL", "C_EMPTY"):
            xchk["dead_confirmed" if msv == "DEAD" else "dead_refuted"] += 1
        else:
            xchk["timeout"] += 1
    print(f"# stage2 comp_g_m cross-confirm on {len(xsample)} cubes "
          f"(all DISTINCT_ALIVE + sample DEAD): {xchk}", flush=True)

    out = {
        "profile": profile, "caps": list(prof["caps"]),
        "sampled": len(cubes), "attempts": att,
        "stage1_C_equidistance": tally,
        "stage2_distinctness_on_C_alive": dtally,
        "n_dead": len(dead), "n_alive_C": len(alive),
        "n_still_alive_distinct": len(still_alive),
        "dead_spot_confirm_singular": conf,
        "stage2_comp_g_m_crosscheck": xchk,
    }
    # persist first alive cube + all alive cubes
    first_alive = None
    if alive:
        first_alive = {str(p): alive[0][p] for p in range(N)}
        out["first_alive_C"] = first_alive
        with open(f"{HERE}/_u12_alive_{profile}.jsonl", "w") as f:
            for cube in alive:
                f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    if still_alive:
        out["first_still_alive_distinct"] = {str(p): still_alive[0][p] for p in range(N)}
        with open(f"{HERE}/_u12_alive_distinct_{profile}.jsonl", "w") as f:
            for cube in still_alive:
                f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    # persist all dead cubes for core-mining
    with open(f"{HERE}/_u12_dead_{profile}.jsonl", "w") as f:
        for cube in dead:
            f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    with open(f"{HERE}/_u12_census_{profile}.json", "w") as f:
        json.dump(out, f, indent=2)
    print(json.dumps(out), flush=True)
    return out


def dumpdead(profile, n_cubes, seed, workers, timeout):
    """Stage-1 only: sample the deterministic seed cubes, run the msolve ℂ-aliveness
    oracle, and persist the DEAD (ℂ-empty) cubes for core-mining.  Fast (no stage-2)."""
    prof = PROFILES[profile]
    _validate_profile(prof)
    cubes, att = sample_cubes(prof, n_cubes, seed)
    tally = {"DEAD": 0, "ALIVE": 0, "TIMEOUT": 0}
    dead = []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        futs = {ex.submit(certify, cube, timeout): cube for cube in cubes}
        for fut in as_completed(futs):
            v = fut.result()
            tally[v] = tally.get(v, 0) + 1
            if v == "DEAD":
                dead.append(futs[fut])
    with open(f"{HERE}/_u12_dead_{profile}.jsonl", "w") as f:
        for cube in dead:
            f.write(json.dumps({str(p): cube[p] for p in range(N)}) + "\n")
    print(f"# dumpdead profile {profile}: sampled {len(cubes)} ({att} attempts) "
          f"stage1 {tally}; wrote {len(dead)} DEAD -> _u12_dead_{profile}.jsonl", flush=True)
    return dead


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["smoke", "census", "dumpdead"])
    ap.add_argument("profile", nargs="?", default="654")
    ap.add_argument("--n-cubes", type=int, default=2000)
    ap.add_argument("--seed", type=int, default=7)
    ap.add_argument("--workers", type=int, default=16)
    ap.add_argument("--timeout", type=int, default=120)
    ap.add_argument("--dtimeout", type=int, default=300)
    args = ap.parse_args()
    if args.cmd == "smoke":
        smoke()
    elif args.cmd == "dumpdead":
        dumpdead(args.profile, args.n_cubes, args.seed, args.workers, args.timeout)
    else:
        census(args.profile, args.n_cubes, args.seed, args.workers, args.timeout, args.dtimeout)
