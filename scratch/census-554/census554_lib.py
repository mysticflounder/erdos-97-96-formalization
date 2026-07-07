#!/usr/bin/env python3
"""(5,5,4) |A|=11 two-large-cap census core library.

Labeled profile (fixed by the leaf data, NOT a WLOG among the 5-caps):
  U=0 surplusApex  (Moser vertex opposite the designated surplus cap S)
  V=1 the opposite apex whose opposite cap O1 is the SECOND 5-cap
  W=2 the opposite apex whose opposite cap O2 is the 4-cap
  S  = {1,2,3,4,5}   surplus cap  (contains V,W; interior {3,4,5}; hosts q)
  O1 = {0,2,6,7,8}   second 5-cap (contains U,W; interior {6,7,8})
  O2 = {0,1,9,10}    4-cap        (contains U,V; interior {9,10})

Constraint set (exact port of the audited sampler
p97-rvol/scratch/u1_2_faithful/twolargecap_core/uniformity_constrained_cubes.py;
its docstring: "all PROVEN necessary"):
  C1  p not in K_p, |K_p| = 4                (center-K4 class at every center)
  C2  |K_p ∩ K_q| <= 2  for p != q           (two distinct-center circles)
  C4  each unordered pair lies in <= 2 classes  (strict convexity: >=3 centers
       equidistant from {a,b} would be 3 collinear points on the bisector)
  ONE-HIT at V: |K_V ∩ (S-{V})| <= 1 and |K_V ∩ (O2-{V})| <= 1
  ONE-HIT at W: |K_W ∩ (S-{W})| <= 1 and |K_W ∩ (O1-{W})| <= 1
  (one-hit proven only at the opposite apices V,W)

Canonical group AUTOS: permutations of interior labels within each cap,
fixing U,V,W pointwise and each cap setwise (3!*3!*2! = 72).  The group can
NEVER exchange S-interior with O1-interior labels, so the surplus designation
is respected by construction.

Gauge for the metric ideal: point 0 -> (0,0), point 1 -> (1,0); free
coordinates x{p}x, x{p}y for p in 2..10 (18 variables).  This matches the
sample100 engine (u12_metric.py / comp_g_m: "v"=pt0 -> (0,0), "w"=pt1 -> (1,0)).
"""

from fractions import Fraction
from itertools import combinations, permutations

N = 11
U, V, W = 0, 1, 2
S = frozenset({1, 2, 3, 4, 5})
O1 = frozenset({0, 2, 6, 7, 8})
O2 = frozenset({0, 1, 9, 10})
FREE = [(3, 4, 5), (6, 7, 8), (9, 10)]
ALL_PAIRS = [(a, b) for a in range(N) for b in range(a + 1, N)]


def onehit_ok(p, kp):
    """Exact port of the audited sampler's one-hit predicate."""
    if p == V:
        if len(kp & (S - {V})) > 1 or len(kp & (O2 - {V})) > 1:
            return False
    if p == W:
        if len(kp & (S - {W})) > 1 or len(kp & (O1 - {W})) > 1:
            return False
    return True


def candidates(p):
    """All C1+one-hit-feasible classes for center p (frozensets)."""
    return [frozenset(c)
            for c in combinations([q for q in range(N) if q != p], 4)
            if onehit_ok(p, frozenset(c))]


def cube_ok(cube):
    """Full constraint check for a complete cube {p: iterable-of-4}."""
    ks = {p: frozenset(cube[p]) for p in range(N)}
    paircount = {}
    for p in range(N):
        kp = ks[p]
        if len(kp) != 4 or p in kp:
            return False
        if not onehit_ok(p, kp):
            return False
        for e in combinations(sorted(kp), 2):
            paircount[e] = paircount.get(e, 0) + 1
            if paircount[e] > 2:
                return False
    for p, q in combinations(range(N), 2):
        if len(ks[p] & ks[q]) > 2:
            return False
    return True


def build_automorphisms():
    autos = []
    for pS in permutations(FREE[0]):
        for pO1 in permutations(FREE[1]):
            for pO2 in permutations(FREE[2]):
                m = {i: i for i in range(N)}
                for a, b in zip(FREE[0], pS):
                    m[a] = b
                for a, b in zip(FREE[1], pO1):
                    m[a] = b
                for a, b in zip(FREE[2], pO2):
                    m[a] = b
                autos.append(tuple(m[i] for i in range(N)))
    return autos


AUTOS = build_automorphisms()


def canon(cube):
    """Canonical form (tuple of 11 sorted 4-tuples) under AUTOS.

    Relabels both centers and members: cube -> {m[p]: {m[x]}}.  AUTOS fixes
    0,1,2 and each cap-interior set, hence preserves S/O1/O2 and every
    constraint, and induces a variable permutation of the metric ideal
    (gauge points 0,1 are fixed), so verdicts are AUTOS-invariant."""
    ks = {p: frozenset(cube[p]) for p in range(N)}
    best = None
    for m in AUTOS:
        key = tuple(tuple(sorted(m[x] for x in ks[inv_p]))
                    for p in range(N)
                    for inv_p in (m.index(p),))
        if best is None or key < best:
            best = key
    return best


# ---------------- exact sparse polynomial layer (independent encoder) -------
# Poly = dict[monomial tuple[(varidx, exp), ...] sorted] -> Fraction

VARS = [f"x{p}{ax}" for p in range(2, N) for ax in ("x", "y")]
VIDX = {v: i for i, v in enumerate(VARS)}


def coord(p):
    """Coordinates of point p as a pair of Polys under the gauge."""
    if p == 0:
        return (pconst(0), pconst(0))
    if p == 1:
        return (pconst(1), pconst(0))
    return (pvar(VIDX[f"x{p}x"]), pvar(VIDX[f"x{p}y"]))


def pconst(c):
    c = Fraction(c)
    return {(): c} if c else {}


def pvar(i):
    return {((i, 1),): Fraction(1)}


def padd(a, b):
    out = dict(a)
    for m, c in b.items():
        s = out.get(m, Fraction(0)) + c
        if s:
            out[m] = s
        else:
            out.pop(m, None)
    return out


def pneg(a):
    return {m: -c for m, c in a.items()}


def psub(a, b):
    return padd(a, pneg(b))


def _mmul(m1, m2):
    d = {}
    for i, e in m1:
        d[i] = d.get(i, 0) + e
    for i, e in m2:
        d[i] = d.get(i, 0) + e
    return tuple(sorted(d.items()))


def pmul(a, b):
    out = {}
    for m1, c1 in a.items():
        for m2, c2 in b.items():
            m = _mmul(m1, m2)
            s = out.get(m, Fraction(0)) + c1 * c2
            if s:
                out[m] = s
            else:
                out.pop(m, None)
    return out


def d2poly(a, b):
    """Squared distance polynomial between points a, b (exact, gauged)."""
    (ax, ay), (bx, by) = coord(a), coord(b)
    dx, dy = psub(ax, bx), psub(ay, by)
    return padd(pmul(dx, dx), pmul(dy, dy))


def cube_eq_polys(cube):
    """The equidistance ideal generators: per center, d2(c,k0)-d2(c,ki)."""
    polys = []
    for c in range(N):
        ks = sorted(cube[c])
        base = d2poly(c, ks[0])
        for k in ks[1:]:
            p = psub(base, d2poly(c, k))
            if p:
                polys.append(p)
    return polys


def poly_str(p, varnames=None):
    """Render a Poly as a Singular/human-readable string (exact integers or
    fractions; census polys have integer coefficients)."""
    vs = varnames or VARS
    if not p:
        return "0"
    terms = []
    for m, c in sorted(p.items()):
        parts = []
        if c.denominator != 1:
            parts.append(f"({c.numerator}/{c.denominator})")
        elif c.numerator != 1 or not m:
            parts.append(str(c.numerator) if c.numerator != 1 or not m else "")
        body = "*".join([f"{vs[i]}^{e}" if e > 1 else vs[i] for i, e in m])
        coeff = parts[0] if parts and parts[0] else ""
        if coeff and body:
            terms.append(f"{coeff}*{body}")
        elif body:
            terms.append(body)
        else:
            terms.append(coeff if coeff else "1")
    return "+".join(terms).replace("+-", "-")


def load_cubes_jsonl(path):
    import json
    out = []
    with open(path) as f:
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            d = json.loads(ln)
            out.append({int(k): sorted(v) for k, v in d.items()})
    return out
