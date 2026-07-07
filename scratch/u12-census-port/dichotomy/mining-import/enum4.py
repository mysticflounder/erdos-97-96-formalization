#!/usr/bin/env python3
"""COMPLETE enumeration of dead 4-vertex equidistance constraint-classes.

Enumerate every constraint graph on 4 abstract points (each vertex's out-nbhd is
a subset of the other 3; out-deg<=1 contributes no constraint -> passive).
Canonicalize (dedupe up to iso).  For each distinct class with >=1 active vertex,
test NO-DISTINCT-REAL death: pin p0=(0,0), p1=(1,0) (similarity gauge; the death
verdict is similarity-invariant so the pin is WLOG), equidistance relations for
active vertices, Rabinowitsch-saturate all 6 pairs, msolve char-0 [-1] => dead.
Singular-confirm every DEAD.  This is the complete 4-point bank universe (an
UPPER BOUND on the 4-point minimal-core classes that can occur in cubes).

Also enumerates 5-vertex classes optionally (--k5), but that space is larger.
"""
import subprocess
import sys
import tempfile
import os
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations, product

import sympy

import mine

gss = mine.gss


def coord(p):
    if p == 0:
        return ("0", "0")
    if p == 1:
        return ("1", "0")
    return (f"x{p}x", f"x{p}y")


def d2(a, b):
    ax, ay = coord(a)
    bx, by = coord(b)
    return f"(({ax})-({bx}))^2+(({ay})-({by}))^2"


def build_constraint_graph(k, out_nbhds):
    """out_nbhds[v] = frozenset of out-neighbors.  Constraint edges only from
    vertices with out-deg>=2."""
    edges = []
    for v in range(k):
        S = sorted(out_nbhds[v])
        if len(S) >= 2:
            for m in S:
                edges.append((v, m))
    return edges


def death_test(k, edges, timeout=8):
    """no-distinct-real via saturated msolve char-0 [-1].  Also Singular-confirm.
    Returns ('dead'|'alive'|'timeout', sing)."""
    # group edges by source (active vertex) -> its equidistant out-nbhd
    src = {}
    for u, v in edges:
        src.setdefault(u, []).append(v)
    xv = [f"x{p}{ax}" for p in range(2, k) for ax in ("x", "y")]
    base = []
    for c, S in src.items():
        S = sorted(S)
        for m in S[1:]:
            base.append(f"({d2(c, S[0])})-({d2(c, m)})")
    if len(base) < 1:
        return "alive", None
    pairs = list(combinations(range(k), 2))
    tv = [f"t{i}" for i in range(len(pairs))]
    sat = [f"t{i}*({d2(a, b)})-1" for i, (a, b) in enumerate(pairs)]
    allv = xv + tv
    syms = {v: sympy.Symbol(v) for v in allv}
    exp = [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
           for p in base + sat]
    inp = ",".join(allv) + "\n0\n" + ",\n".join(exp) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        v = "dead" if raw.startswith("[-1]") else "alive"
    except subprocess.TimeoutExpired:
        v = "timeout"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    sing = None
    if v == "dead":
        sing = mine._singular_empty([f"({p})" for p in base + sat], allv, 60)
    return v, sing


def enumerate_k(k, workers=8):
    others = {v: [u for u in range(k) if u != v] for v in range(k)}
    # each vertex: any subset of others (2^(k-1) options)
    per_vertex = []
    for v in range(k):
        subs = []
        for r in range(0, k):
            subs += [frozenset(c) for c in combinations(others[v], r)]
        per_vertex.append(subs)
    # dedupe by canonical constraint graph
    seen = {}
    for combo in product(*per_vertex):
        edges = build_constraint_graph(k, combo)
        if not edges:
            continue
        cf = mine.canonical(edges)
        if cf not in seen:
            seen[cf] = edges
    print(f"# k={k}: {len(seen)} distinct constraint-graph classes (>=1 active "
          f"vertex)", flush=True)

    items = list(seen.items())

    def test(item):
        cf, edges = item
        v, sing = death_test(k, edges)
        return cf, edges, v, sing
    dead = []
    to = 0
    with ThreadPoolExecutor(max_workers=workers) as ex:
        for cf, edges, v, sing in ex.map(test, items):
            if v == "dead":
                dead.append((cf, edges, sing))
            elif v == "timeout":
                to += 1
    print(f"# k={k}: DEAD classes = {len(dead)} (timeouts={to}); "
          f"Singular-confirmed {sum(1 for _,_,s in dead if s is True)}",
          flush=True)
    for cf, edges, sing in sorted(dead, key=lambda t: len(t[0])):
        _, nv, ne, sig = mine.canon_stats(edges)
        print(f"    nv={nv} ne={ne} sing={sing} adj={mine.readable(cf)}",
              flush=True)
    return dead


def main():
    print("=== COMPLETE dead-class enumeration ===", flush=True)
    d4 = enumerate_k(4, workers=8)
    u1c = mine.u1_canonical()
    print(f"\n# u1 canonical (nv=5) present among k=4? "
          f"{u1c in {cf for cf, _, _ in d4}}", flush=True)
    if len(sys.argv) > 1 and sys.argv[1] == "--k5":
        d5 = enumerate_k(5, workers=8)
        print(f"# u1 among k=5 dead classes? "
              f"{u1c in {cf for cf, _, _ in d5}}", flush=True)


if __name__ == "__main__":
    main()
