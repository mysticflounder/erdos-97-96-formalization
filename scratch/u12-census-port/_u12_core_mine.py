#!/usr/bin/env python3
"""Minimal POINT-support miner for |A|=12 DEAD cubes (generalizes _min_point_support.py).

For a given DEAD cube {K_p} on N=12 points, computes
    min { |P| : P subset of the N points, INDUCED(P) is C-infeasible },
where INDUCED(P) = all equidistance generators (c,k0,kj) with {c,k0,kj} subset P.

Oracle: msolve char-0 SOLVE mode ([-1] == empty over QQ-bar == C-infeasible),
each INFEASIBLE verdict EXACT-re-confirmed with Singular reduce(1,std)==0 over QQ.
msolve-feasible / timeout treated feasible (infeasible is found fast).  Identical
method + oracles as the audited _min_point_support.py, just cube-parametric.

Per DEAD cube it records:
  - min_support k*
  - all minimal infeasible P at k* (Singular-confirmed)
  - per-core signature: sorted multiset {|K_c ∩ P| : c ∈ P} and full-4-star count
    (full 4-star = a center c∈P with all 4 class members in P; the |A|=11
     unit-equilateral-strip mechanism has EXACTLY one full 4-star + partials).

Reuses gen_singular_shadow.d2 (gauge x0=(0,0),x1=(1,0)) and _min_core_sound.gen_map.

Usage:
  uv run python _u12_core_mine.py smoke
  uv run python _u12_core_mine.py mine <profile:654|555> [--max-cubes 40] [--kmax 8]
"""
import argparse
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


gss = _load("gss", f"{HERE}/gen_singular_shadow.py")
MCS = _load("mcs", f"{HERE}/_min_core_sound.py")

N = 12
VARS = [f"x{p}{ax}" for p in range(2, N) for ax in ("x", "y")]


def build_cube_polys(cube):
    """Return (gen_map, POLYS nested-paren, EXP_POLYS expanded-for-msolve)."""
    gm = MCS.gen_map(cube)                 # [(c,k0,kj)]
    polys = [f"({gss.d2(c, k0)})-({gss.d2(c, k)})" for (c, k0, k) in gm]
    syms = {v: sympy.Symbol(v) for v in VARS}
    exp = [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^") for p in polys]
    return gm, polys, exp


def induced(gm, P):
    Ps = set(P)
    return [i for i, (c, k0, k) in enumerate(gm) if {c, k0, k} <= Ps]


def msolve_infeasible_char0(exp_polys, idxs, timeout=45, threads=1):
    """'infeasible' ([-1]) / 'feasible' / 'timeout'. char-0 solve mode."""
    if len(idxs) < 3:
        return "feasible"
    sub = [exp_polys[i] for i in idxs]
    inp = ",".join(VARS) + "\n0\n" + ",\n".join(sub) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", str(threads)],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        res = "infeasible" if raw.startswith("[-1]") else "feasible"
    except subprocess.TimeoutExpired:
        res = "timeout"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    return res


def singular_infeasible_char0(polys, idxs, timeout=120):
    """True iff reduce(1,std(I))==0 over QQ (exact). None on timeout."""
    sub = [polys[i] for i in idxs]
    vs = ",".join(VARS)
    ideal = "ideal I = " + ",\n  ".join(sub) + ";"
    script = "\n".join([f"ring r=0,({vs}),dp;", ideal, "ideal G=std(I);",
                        'print("RED");', "reduce(1,G);", 'print("END");', "quit;"])
    try:
        out = subprocess.run(["Singular", "-q"], input=script,
                             capture_output=True, text=True, timeout=timeout).stdout
        return out.split("RED")[1].split("END")[0].strip() == "0"
    except subprocess.TimeoutExpired:
        return None


def signature(cube, P):
    """Sorted multiset {|K_c ∩ P| : c ∈ P} and full-4-star count."""
    Ps = set(P)
    counts = []
    full_stars = []
    for c in sorted(P):
        inter = len(set(cube[c]) & Ps)
        counts.append(inter)
        if inter == 4:
            full_stars.append(c)
    return sorted(counts), full_stars


def mine_cube(cube, kmax=7, workers=16, ms_timeout=30):
    """Return dict: min_support, minimal cores (Singular-confirmed), signatures.

    msolve char-0 SOLVE mode: infeasible ([-1]) returns FAST, so a timeout reliably
    indicates a FEASIBLE (positive-dim) subsystem -> treated feasible (sound for the
    min-support upper bound; every reported core is exactly Singular-confirmed).
    """
    gm, polys, exp = build_cube_polys(cube)
    result = {"min_support": None, "cores": [], "kmax_reached": None, "n_timeout_feasible": 0}
    for k in range(3, min(kmax, N) + 1):
        Psets = [P for P in combinations(range(N), k)]
        cand = [(P, induced(gm, P)) for P in Psets]
        cand = [(P, g) for P, g in cand if len(g) >= 3]

        def test(item):
            P, g = item
            return P, g, msolve_infeasible_char0(exp, g, timeout=ms_timeout)

        infeas = []
        with ThreadPoolExecutor(max_workers=workers) as ex:
            for P, g, res in ex.map(test, cand):
                if res == "infeasible":
                    infeas.append((P, g))
                elif res == "timeout":
                    result["n_timeout_feasible"] += 1   # positive-dim feasible; no smaller-k core hidden
        if not infeas:
            continue
        # Singular-confirm each candidate; keep only confirmed infeasible
        cores = []
        for P, g in infeas:
            sc = singular_infeasible_char0(polys, g, timeout=120)
            if sc is True:
                sig, stars = signature(cube, P)
                cores.append({"P": list(P), "n_gens": len(g),
                              "centers": sorted({gm[i][0] for i in g}),
                              "signature": sig, "full_4stars": stars,
                              "n_full_4stars": len(stars)})
            elif sc is None:
                sig, stars = signature(cube, P)
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


def smoke():
    # Reproduce the |A|=11 codex min-support = 6 with two known cores.
    global N, VARS
    savedN, savedV = N, VARS
    N = 11
    VARS = [f"x{p}{ax}" for p in range(2, 11) for ax in ("x", "y")]
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    r = mine_cube(codex, kmax=6)
    N, VARS = savedN, savedV
    print(f"[smoke] codex |A|=11 min_support = {r['min_support']} (expect 6)", flush=True)
    Ps = sorted(tuple(c["P"]) for c in r["cores"])
    print(f"[smoke] cores P = {Ps}", flush=True)
    for c in r["cores"]:
        print(f"    P={c['P']} sig={c['signature']} full_4stars={c['full_4stars']}", flush=True)
    assert r["min_support"] == 6, "codex min-support smoke FAIL"
    got = set(tuple(c["P"]) for c in r["cores"])
    assert (0, 1, 2, 3, 6, 9) in got and (0, 1, 2, 3, 7, 9) in got, "codex cores smoke FAIL"
    # each known core must have exactly one full 4-star
    for c in r["cores"]:
        assert c["n_full_4stars"] == 1, f"expected 1 full-4star in {c['P']}"
    print("[smoke] OK: min-support 6, both known cores, each exactly one full-4-star", flush=True)


def mine(profile, max_cubes, kmax):
    path = f"{HERE}/_u12_dead_{profile}.jsonl"
    cubes = []
    with open(path) as f:
        for ln in f:
            d = json.loads(ln)
            cubes.append({int(k): v for k, v in d.items()})
    cubes = cubes[:max_cubes]
    print(f"# mining {len(cubes)} DEAD cubes from profile {profile}", flush=True)
    supports = Counter()
    sig_classes = Counter()          # signature (as tuple) -> count of minimal cores
    star_counts = Counter()          # n_full_4stars per minimal core
    per_cube = []
    unit_strip_cubes = 0
    for i, cube in enumerate(cubes):
        r = mine_cube(cube, kmax=kmax)
        ms = r["min_support"]
        supports[ms] += 1
        cube_has_unit_strip = False
        for c in r["cores"]:
            sig_classes[tuple(c["signature"])] += 1
            star_counts[c["n_full_4stars"]] += 1
            if c["n_full_4stars"] == 1:
                cube_has_unit_strip = True
        if cube_has_unit_strip:
            unit_strip_cubes += 1
        per_cube.append({"idx": i, "min_support": ms, "n_cores": len(r["cores"]),
                         "cores": r["cores"]})
        print(f"  cube {i}: min_support={ms} n_cores={len(r['cores'])} "
              f"sigs={[c['signature'] for c in r['cores']]} "
              f"stars={[c['n_full_4stars'] for c in r['cores']]}", flush=True)
    out = {
        "profile": profile, "n_cubes_mined": len(cubes),
        "min_support_distribution": dict(sorted(supports.items(), key=lambda x: (x[0] is None, x[0]))),
        "signature_classes": {str(list(k)): v for k, v in sorted(sig_classes.items())},
        "n_distinct_signature_classes": len(sig_classes),
        "full_4star_count_distribution": dict(sorted(star_counts.items())),
        "cubes_with_a_unit_equilateral_strip_core": unit_strip_cubes,
        "per_cube": per_cube,
    }
    with open(f"{HERE}/_u12_coremine_{profile}.json", "w") as f:
        json.dump(out, f, indent=2)
    summary = {k: v for k, v in out.items() if k != "per_cube"}
    print(json.dumps(summary, indent=2), flush=True)
    return out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["smoke", "mine"])
    ap.add_argument("profile", nargs="?", default="654")
    ap.add_argument("--max-cubes", type=int, default=40)
    ap.add_argument("--kmax", type=int, default=8)
    args = ap.parse_args()
    if args.cmd == "smoke":
        smoke()
    else:
        mine(args.profile, args.max_cubes, args.kmax)
