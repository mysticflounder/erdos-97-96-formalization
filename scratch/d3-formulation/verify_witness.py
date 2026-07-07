#!/usr/bin/env python3
"""Independent verification of the T1 realizable-admissible witnesses, plus:
- H1 at U (full one-hit) check
- U,V,W collinearity check (witness realization)
- exact-labeling variant availability (per-point full-class-exactly-4 coverage)
- msolve stage-1/stage-2 verdicts of the witness CUBE (must be ALIVE/ALIVE)
- CEGAR collinearity saturation: equalities + all-pair distinctness separators
  + iteratively-added collinearity separators for triples collinear in the
  current model. Decides whether the witness cube admits a C-realization that
  is pairwise-distinct AND avoids the added collinear triples.
"""
import json
import os
import subprocess
import sys
import tempfile
from collections import defaultdict
from itertools import combinations

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))

WITS = json.load(open(f"{HERE}/t1_results.json"))


def tri_xy(p):
    i, j = p
    return (sympy.Rational(2 * i + j, 2), j)  # scaled: x = i + j/2 (times 1), y = j*sqrt3/2 -> use quadratic form instead


def d2_tri(p, q):
    di, dj = p[0] - q[0], p[1] - q[1]
    return di * di + di * dj + dj * dj


def d2_sq(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def collinear_tri(a, b, c):
    # in lattice coords (i,j) -> real (i + j/2, j*sqrt3/2): collinearity is
    # preserved under the linear map, so integer determinant works
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0]) == 0


def verify(wit):
    n = wit["n"]
    uni = wit["universe"]
    d2 = d2_tri if uni.startswith("tri") else d2_sq
    pts = [tuple(p) for p in wit["subset"]]
    w = wit["witness"]
    cls = {tuple(json.loads(k.replace("(", "[").replace(")", "]"))): [tuple(x) for x in v]
           for k, v in w["classes"].items()}
    S = set(map(tuple, w["S"]))
    O1 = set(map(tuple, w["O1"]))
    O2 = set(map(tuple, w["O2"]))
    Up, Vp, Wp = tuple(w["U"]), tuple(w["V"]), tuple(w["W"])
    ok = True
    # cap structure
    assert S & O1 == {Wp} and S & O2 == {Vp} and O1 & O2 == {Up}, "cap intersections"
    assert S | O1 | O2 == set(pts), "cap cover"
    caps_ok = all(len(c) >= 4 for c in (S, O1, O2)) and \
        sum(1 for c in (S, O1, O2) if len(c) >= 5) >= 2
    # C1 + equidistance
    for p in pts:
        K = cls[p]
        assert len(K) == 4 and p not in K, f"C1 fail {p}"
        r = {d2(p, q) for q in K}
        assert len(r) == 1, f"equidistance fail at {p}: {r}"
    # C2
    for p, q in combinations(pts, 2):
        assert len(set(cls[p]) & set(cls[q])) <= 2, f"C2 fail {p},{q}"
    # C4
    paircnt = defaultdict(int)
    for p in pts:
        for a, b in combinations(sorted(cls[p]), 2):
            paircnt[(a, b)] += 1
    assert max(paircnt.values()) <= 2, "C4 fail"
    # H1 at V,W (census) and at U (full)
    def hits(m, cap):
        return len(set(cls[m]) & (cap - {m}))
    h1_vw = hits(Vp, S) <= 1 and hits(Vp, O2) <= 1 and hits(Wp, S) <= 1 and hits(Wp, O1) <= 1
    h1_u = hits(Up, O1) <= 1 and hits(Up, O2) <= 1
    # Moser triple collinear in the witness realization?
    uvw_col = collinear_tri(Up, Vp, Wp) if uni.startswith("tri") else \
        (Vp[0] - Up[0]) * (Wp[1] - Up[1]) - (Vp[1] - Up[1]) * (Wp[0] - Up[0]) == 0
    # collinear triples count in realization
    n_col = sum(1 for a, b, c in combinations(pts, 3)
                if (collinear_tri(a, b, c) if uni.startswith("tri")
                    else (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0]) == 0))
    # exact-4 coverage: point q covered if some center c has cls[c] ni q and
    # cls[c] == full radius class of c (exactly 4 at that radius in the subset)
    def full_class(c):
        K = cls[c]
        r = d2(c, K[0])
        return sorted(q for q in pts if q != c and d2(c, q) == r)
    exact_centers = [c for c in pts if sorted(cls[c]) == full_class(c)]
    covered = {q for c in exact_centers for q in cls[c]}
    print(f"[{uni} n={n}] caps_ok={caps_ok} C1/C2/C4/equid OK "
          f"H1(V,W)={h1_vw} H1(U)={h1_u} UVW_collinear={uvw_col} "
          f"collinear_triples={n_col}/{len(list(combinations(pts,3)))} "
          f"exact_centers={len(exact_centers)}/{n} exact_covered={len(covered)}/{n}")
    return dict(pts=pts, cls=cls, d2=d2, uni=uni, n=n)


# ---------- algebraic side ----------

def coordmap(pts):
    ps = sorted(pts)
    a0, a1 = ps[0], ps[1]
    cm = {}
    xv = []
    for p in ps:
        if p == a0:
            cm[p] = ("0", "0")
        elif p == a1:
            cm[p] = ("1", "0")
        else:
            sx, sy = f"x{ps.index(p)}x", f"x{ps.index(p)}y"
            cm[p] = (sx, sy)
            xv += [sx, sy]
    return cm, xv


def d2expr(a, b, cm):
    ax, ay = cm[a]
    bx, by = cm[b]
    return f"(({ax})-({bx}))^2+(({ay})-({by}))^2"


def colexpr(a, b, c, cm):
    ax, ay = cm[a]
    bx, by = cm[b]
    cx, cy = cm[c]
    return (f"(({bx})-({ax}))*(({cy})-({ay}))-(({by})-({ay}))*(({cx})-({ax}))")


def msolve_solve(varlist, polys, timeout=600, threads=4, get_model=False):
    inp = ",".join(varlist) + "\n0\n" + ",\n".join(polys) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False, dir=HERE) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", str(threads)],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        if raw.startswith("[-1]"):
            return "DEAD", None
        return "ALIVE", raw if get_model else None
    except subprocess.TimeoutExpired:
        return "TIMEOUT", None
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass


def expand(polys, allvars):
    syms = {v: sympy.Symbol(v) for v in allvars}
    return [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
            for p in polys]


def stage_verdicts(V):
    pts, cls = V["pts"], V["cls"]
    cm, xv = coordmap(pts)
    eq = []
    for c in sorted(pts):
        K = cls[c]
        b = d2expr(c, K[0], cm)
        for m in K[1:]:
            eq.append(f"({b})-({d2expr(c, m, cm)})")
    s1, _ = msolve_solve(xv, expand(eq, xv), timeout=600)
    pairs = list(combinations(sorted(pts), 2))
    tv = [f"t{k}" for k in range(len(pairs))]
    sat = [f"t{k}*({d2expr(a, b, cm)})-1" for k, (a, b) in enumerate(pairs)]
    s2, _ = msolve_solve(xv + tv, expand(eq + sat, xv + tv), timeout=1200, threads=4)
    print(f"  stage1={s1} stage2={s2} (expect ALIVE/ALIVE: witness realizes the cube)")
    return s1, s2


def cegar_collinearity(V, max_rounds=6):
    """equalities + all-pair Rabinowitsch + collinearity separators for the
    triples collinear in the WITNESS realization (round 0), then... since
    msolve gives no rational point easily, we do the decisive single round:
    all triples collinear in the witness + (optionally) ALL triples if round-0
    stays alive and system size permits."""
    pts, cls, d2, uni = V["pts"], V["cls"], V["d2"], V["uni"]
    cm, xv = coordmap(pts)
    eq = []
    for c in sorted(pts):
        K = cls[c]
        b = d2expr(c, K[0], cm)
        for m in K[1:]:
            eq.append(f"({b})-({d2expr(c, m, cm)})")
    pairs = list(combinations(sorted(pts), 2))
    tv = [f"t{k}" for k in range(len(pairs))]
    sat = [f"t{k}*({d2expr(a, b, cm)})-1" for k, (a, b) in enumerate(pairs)]

    def is_col(a, b, c):
        return (collinear_tri(a, b, c) if uni.startswith("tri")
                else (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0]) == 0)

    wit_col = [t for t in combinations(sorted(pts), 3) if is_col(*t)]
    gv = [f"g{k}" for k in range(len(wit_col))]
    gsep = [f"g{k}*({colexpr(a, b, c, cm)})-1" for k, (a, b, c) in enumerate(wit_col)]
    allv = xv + tv + gv
    print(f"  round0: adding {len(wit_col)} witness-collinear-triple separators "
          f"(+{len(pairs)} pair separators)")
    v, _ = msolve_solve(allv, expand(eq + sat + gsep, allv), timeout=1800, threads=6)
    print(f"  CEGAR round0 verdict: {v}")
    if v == "ALIVE":
        # full Gamma: every triple
        allt = list(combinations(sorted(pts), 3))
        gv = [f"g{k}" for k in range(len(allt))]
        gsep = [f"g{k}*({colexpr(a, b, c, cm)})-1" for k, (a, b, c) in enumerate(allt)]
        allv = xv + tv + gv
        print(f"  full-Gamma: {len(allt)} triple separators; vars={len(allv)}")
        v2, _ = msolve_solve(allv, expand(eq + sat + gsep, allv), timeout=3600, threads=6)
        print(f"  CEGAR full-Gamma verdict: {v2}")
        return v, v2
    return v, None


if __name__ == "__main__":
    which = int(sys.argv[1]) if len(sys.argv) > 1 else 0
    stage = sys.argv[2] if len(sys.argv) > 2 else "all"
    V = verify(WITS[which])
    if stage in ("all", "stages"):
        stage_verdicts(V)
    if stage in ("all", "cegar"):
        cegar_collinearity(V)
