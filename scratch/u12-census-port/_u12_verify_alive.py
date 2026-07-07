#!/usr/bin/env python3
"""Rigorously adjudicate a candidate ALIVE |A|=12 cube.

Checks: (1) all PROVEN-necessary constraints (C1/C2/C4/one-hit at V,W/center-K4),
(2) Singular char-0 ideal dim + reduce(1,std) (ALIVE iff dim>=0),
(3) msolve char-0 solve-mode cross-check (feasible over QQ-bar iff not [-1]),
(4) Rabinowitsch distinctness (sat_empty): DEAD => no distinct realization,
    ALIVE => a distinct real/complex realization exists.
"""
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
from itertools import combinations

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


gss = _load("gss", f"{HERE}/gen_singular_shadow.py")
cen = _load("cen", f"{HERE}/_u12_census.py")
SAT = _load("sat", f"{HERE}/_sat_suppcore.py")

N = 12


def check_constraints(cube, prof):
    S, O1, O2 = prof["S"], prof["O1"], prof["O2"]
    V, W = cen.V, cen.W
    issues = []
    # C1: p not in K_p, |K_p|=4
    for p in range(N):
        kp = set(cube[p])
        if len(kp) != 4:
            issues.append(f"C1 |K_{p}|={len(kp)}")
        if p in kp:
            issues.append(f"C1 {p} in K_{p}")
    # center-K4 at all 12: every point has exactly a 4-class (given by |K_p|=4). OK by C1.
    # C2: |K_p ∩ K_q| <= 2
    for p, q in combinations(range(N), 2):
        if len(set(cube[p]) & set(cube[q])) > 2:
            issues.append(f"C2 |K_{p}∩K_{q}|={len(set(cube[p]) & set(cube[q]))}")
    # C4: each unordered pair in <= 2 classes
    pc = {}
    for p in range(N):
        for e in combinations(sorted(cube[p]), 2):
            pc[e] = pc.get(e, 0) + 1
    for e, c in pc.items():
        if c > 2:
            issues.append(f"C4 pair {e} in {c} classes")
    # one-hit at V, W
    kV = set(cube[V])
    if len(kV & (S - {V})) > 1 or len(kV & (O2 - {V})) > 1:
        issues.append(f"one-hit@V: S∩={sorted(kV&(S-{V}))} O2∩={sorted(kV&(O2-{V}))}")
    kW = set(cube[W])
    if len(kW & (S - {W})) > 1 or len(kW & (O1 - {W})) > 1:
        issues.append(f"one-hit@W: S∩={sorted(kW&(S-{W}))} O1∩={sorted(kW&(O1-{W}))}")
    return issues


def singular_dim(cube, timeout=300):
    vs = ",".join(cen.var_list())
    ideal = "ideal I = " + ",\n  ".join(cen.cube_polys(cube)) + ";"
    script = "\n".join([f"ring r = 0, ({vs}), dp;", ideal, "ideal G = std(I);",
                        'print("R1:");', "reduce(1,G);", 'print("DIM:");', "dim(G);", "quit;"])
    pr = subprocess.run(["Singular", "-q"], input=script, capture_output=True,
                        text=True, timeout=timeout)
    lines = [ln.strip() for ln in pr.stdout.splitlines()]
    r1 = next((lines[i + 1] for i, ln in enumerate(lines) if ln == "R1:"), None)
    dim = next((lines[i + 1] for i, ln in enumerate(lines) if ln == "DIM:"), None)
    return r1, dim


def msolve_solve(cube, timeout=300):
    vs = cen.var_list()
    polys = cen.cube_polys(cube)
    syms = {v: sympy.Symbol(v) for v in vs}
    exp = [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^") for p in polys]
    inp = ",".join(vs) + "\n0\n" + ",\n".join(exp) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "4"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
    except subprocess.TimeoutExpired:
        raw = "TIMEOUT"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    verdict = "INFEASIBLE([-1])" if raw.startswith("[-1]") else ("TIMEOUT" if raw == "TIMEOUT" else "FEASIBLE")
    return verdict, raw[:120]


def main():
    cube = json.loads(sys.argv[1])
    cube = {int(k): v for k, v in cube.items()}
    profname = sys.argv[2] if len(sys.argv) > 2 else "555"
    prof = cen.PROFILES[profname]
    print(f"cube = {json.dumps({str(p): cube[p] for p in range(N)})}")
    print(f"profile = {profname} caps={prof['caps']}")

    issues = check_constraints(cube, prof)
    print(f"\n[constraints] {'ALL PASS' if not issues else 'VIOLATIONS: ' + str(issues)}")

    r1, dim = singular_dim(cube)
    print(f"[singular char-0] reduce(1,std)={r1}  dim={dim}  "
          f"-> {'ALIVE (dim>=0)' if dim and dim != '-1' else 'DEAD'}")

    v, raw = msolve_solve(cube)
    print(f"[msolve char-0 solve] {v}  raw={raw!r}")

    d = SAT.sat_empty(cube, list(range(N)), timeout=600)
    dmap = {True: "DEAD (no distinct realization)", False: "ALIVE (distinct realization exists)"}
    print(f"[rabinowitsch distinctness] sat_empty={d} -> {dmap.get(d, d)}")


if __name__ == "__main__":
    main()
