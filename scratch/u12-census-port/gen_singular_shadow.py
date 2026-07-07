#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Singular Groebner/Nullstellensatz probe for a FIXED center-K4 shadow.

Builds the equidistance ideal of a shadow (each center's 4-incidence forced
equidistant), gauge-fixed x0=(0,0), x1=(1,0), over QQ (char 0).  Runs Singular
`std` + `dim`.  If std(I) = <1> the system is C-infeasible => a Nullstellensatz
certificate exists (1 in ideal), the clean kernel-checkable prize.  Otherwise
reports dimension for the next (saturation) stage.

Smoke modes validate the pipeline on known results FIRST (CLAUDE.md rule):
  --smoke-infeasible : x^2-1, x^2-2  -> std = <1>  (C-infeasible)
  --smoke-feasible   : x^2-1         -> dim 0, std != <1>  (C-feasible)

Usage:
  gen_singular_shadow.py [--emit-only] [--smoke-infeasible|--smoke-feasible]
"""
import argparse
import subprocess
import sys

CODEX_SHADOW = {
    0: [1, 2, 7, 8], 1: [4, 5, 7, 10], 2: [0, 3, 7, 9],
    3: [2, 5, 6, 9], 4: [1, 6, 8, 10], 5: [3, 4, 6, 7],
    6: [0, 2, 5, 8], 7: [3, 5, 9, 10], 8: [2, 4, 6, 10],
    9: [0, 1, 3, 6], 10: [0, 4, 8, 9],
}
N = 11


def coord(p):
    """Return (xexpr, yexpr) for point p under gauge x0=(0,0), x1=(1,0)."""
    if p == 0:
        return ("0", "0")
    if p == 1:
        return ("1", "0")
    return (f"x{p}x", f"x{p}y")


def d2(a, b):
    ax, ay = coord(a)
    bx, by = coord(b)
    return f"(({ax})-({bx}))^2+(({ay})-({by}))^2"


def shadow_polys(shadow):
    polys = []
    for c, ks in shadow.items():
        base = d2(c, ks[0])
        for k in ks[1:]:
            polys.append(f"({base})-({d2(c, k)})")
    return polys


def var_list():
    vs = []
    for p in range(2, N):
        vs += [f"x{p}x", f"x{p}y"]
    return vs


def certify_script(varlist, polys):
    """Extract explicit cofactors (lift) + verify identity, + mod-p check."""
    vs = ",".join(varlist)
    ideal = "ideal I = " + ",\n  ".join(polys) + ";"
    lines = [
        f"ring r = 0, ({vs}), dp;",
        ideal,
        "matrix T = lift(I, ideal(1));",
        "poly chk = 0;",
        "for (int i=1; i<=size(I); i=i+1) { chk = chk + I[i]*T[i,1]; }",
        'print("=== char0 lift identity  sum lambda_i g_i  (must be 1) ===");',
        "chk;",
        'print("=== nonzero cofactor count (producer support) ===");',
        "int nz; for (int j=1; j<=size(I); j=j+1){ if (T[j,1]!=0){nz=nz+1;} }",
        "nz;",
        f"ring rp = 32003, ({vs}), dp;",
        ideal.replace("ideal I", "ideal Ip"),
        "ideal Gp = std(Ip);",
        'print("=== mod-p(32003) reduce(1,std) (must be 0) ===");',
        "reduce(1, Gp);",
        "quit;",
    ]
    return "\n".join(lines)


def singular_script(varlist, polys):
    ring = f"ring r = 0, ({','.join(varlist)}), dp;"
    ideal = "ideal I = " + ",\n  ".join(polys) + ";"
    body = [
        ring,
        ideal,
        "ideal G = std(I);",
        'print("=== std leading / first elt ===");',
        "G[1];",
        'print("=== is_one (reduce(1,G)) ===");',
        "reduce(1, G);",
        'print("=== dim ===");',
        "dim(G);",
        'print("=== size(G) ===");',
        "size(G);",
        "quit;",
    ]
    return "\n".join(body)


def run_singular(script):
    proc = subprocess.run(["Singular", "-q"], input=script,
                          capture_output=True, text=True, timeout=1800)
    return proc.stdout, proc.stderr


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--emit-only", action="store_true")
    ap.add_argument("--smoke-infeasible", action="store_true")
    ap.add_argument("--smoke-feasible", action="store_true")
    ap.add_argument("--certify", action="store_true")
    args = ap.parse_args()

    if args.smoke_infeasible:
        varlist = ["x"]
        polys = ["x^2-1", "x^2-2"]
    elif args.smoke_feasible:
        varlist = ["x"]
        polys = ["x^2-1"]
    else:
        varlist = var_list()
        polys = shadow_polys(CODEX_SHADOW)

    if args.certify:
        script = certify_script(varlist, polys)
    else:
        script = singular_script(varlist, polys)
    print(f"# vars={len(varlist)} polys={len(polys)}", file=sys.stderr)
    if args.emit_only:
        print(script)
        return
    out, err = run_singular(script)
    print(out)
    if err.strip():
        print("--- stderr ---", file=sys.stderr)
        print(err, file=sys.stderr)


if __name__ == "__main__":
    main()
