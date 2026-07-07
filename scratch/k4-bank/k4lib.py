#!/usr/bin/env python3
"""Self-contained exact-rational library for the k=4 window universe.

INDEPENDENT re-implementation (does not import census554_lib / miner / classify).

Point model: 4 window points 0,1,2,3.  Gauge point 0 -> (0,0), point 1 -> (1,0),
points 2,3 free.  Coordinate variable GLOBAL indices (for the Lean checker):
    x2x = 0, x2y = 1, x3x = 2, x3y = 3.
Rabinowitsch separator t-variables get global index 4 + (pair position).

Poly representation: dict {monomial: Fraction}, monomial = tuple of (varidx, exp)
sorted by varidx, exps > 0.  This mirrors the Lean sparse-poly semantics exactly.
"""

from fractions import Fraction
from itertools import combinations, permutations

# ----- global variable indexing (matches the emitted Lean module) -----
COORD_NAME = {0: "x2x", 1: "x2y", 2: "x3x", 3: "x3y"}
COORD_IDX = {v: i for i, v in COORD_NAME.items()}


def tname(g):
    """Singular/human name for a t-var of global index g (>=4)."""
    return f"t{g - 4}"


def var_name(g):
    return COORD_NAME[g] if g < 4 else tname(g)


# ----- exact sparse polynomial layer -----

def pconst(c):
    c = Fraction(c)
    return {(): c} if c else {}


def pvar(g):
    return {((g, 1),): Fraction(1)}


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


# ----- geometry (gauged) -----

def coord2(p):
    """Coordinates of point p as (x_poly, y_poly) under the gauge."""
    if p == 0:
        return (pconst(0), pconst(0))
    if p == 1:
        return (pconst(1), pconst(0))
    if p == 2:
        return (pvar(0), pvar(1))
    if p == 3:
        return (pvar(2), pvar(3))
    raise ValueError(p)


def d2poly(a, b):
    (ax, ay), (bx, by) = coord2(a), coord2(b)
    dx, dy = psub(ax, bx), psub(ay, by)
    return padd(pmul(dx, dx), pmul(dy, dy))


# ----- pattern (witness map) -> generators -----

def pattern_polys(pat):
    """Equidistance generators of a witness map {c: sorted members}.

    Returns (polys, tags).  tag = (c, m0, m)."""
    polys, tags = [], []
    for c in sorted(pat):
        M = sorted(pat[c])
        base = d2poly(c, M[0])
        for m in M[1:]:
            p = psub(base, d2poly(c, m))
            if p:
                polys.append(p)
                tags.append((c, M[0], m))
    return polys, tags


def pattern_points(pat):
    pts = set()
    for c, M in pat.items():
        pts.add(c)
        pts.update(M)
    return sorted(pts)


def rabinowitsch(pairs):
    """t_j·d2(a,b) - 1 for the given pairs; global t-var index = 4 + position.

    Returns list of (poly, (a,b), tvar_global_idx)."""
    out = []
    for j, (a, b) in enumerate(pairs):
        d = d2poly(a, b)
        tv = 4 + j
        t = pvar(tv)
        out.append((padd(pmul(t, d), pconst(-1)), (a, b), tv))
    return out


def all_pairs():
    return [e for e in combinations(range(4), 2)]


def used_vars(polys):
    vs = set()
    for p in polys:
        for m in p:
            for i, _ in m:
                vs.add(i)
    return sorted(vs)


# ----- enumeration + canonicalization (independent) -----

def enumerate_maps():
    """All witness maps on {0,1,2,3} with >=1 active center (|K(c)|>=2)."""
    others = {v: [u for u in range(4) if u != v] for v in range(4)}
    per_vertex = []
    for v in range(4):
        subs = []
        for r in range(0, 4):
            subs += [frozenset(c) for c in combinations(others[v], r)]
        per_vertex.append(subs)
    from itertools import product
    for combo in product(*per_vertex):
        g = {v: sorted(combo[v]) for v in range(4) if len(combo[v]) >= 2}
        if g:
            yield g


def edge_set(g):
    return frozenset((c, m) for c, M in g.items() for m in M)


def canon_brute(g):
    """Brute-force S4 canonical form: min relabeled edge tuple over all 24
    permutations of {0,1,2,3}.  Independent of classify.py.canonical."""
    E = edge_set(g)
    best = None
    for perm in permutations(range(4)):
        rel = tuple(sorted((perm[c], perm[m]) for (c, m) in E))
        if best is None or rel < best:
            best = rel
    return best


def R_of(g):
    return sum(len(M) - 1 for M in g.values())


def readable(g):
    """Human string e.g. 0:[1,2,3];1:[2,3];2:[0,1,3]."""
    return ";".join(f"{c}:{sorted(g[c])}".replace(" ", "")
                    for c in sorted(g))
