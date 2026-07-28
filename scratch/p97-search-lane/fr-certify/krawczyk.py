"""
krawczyk.py -- TRUSTED CORE: Krawczyk existence/uniqueness certifier,
plus the FR 20-gon system independently re-derived from Table 1 and
the edge list (SPEC.md Sec 3.4, "Independence rule"). This module's
own transcription of the source data below is NOT imported from
system.py -- system.py is producer-only. Stdlib only (fractions); no
floats, no mpmath anywhere in this file. Must not import producer.py
or system.py.

Krawczyk operator (SPEC.md Sec 3.2):

    K(X) = m - Y*F(m) + (I - Y*J(X))*(X - m)

with F the exact system, J(X) the interval Jacobian (affine/degree-1
in the free variables because F is quadratic), Y a rational
approximate inverse of the midpoint Jacobian (HINT from the producer;
this module only ever verifies the resulting contraction, it never
inverts anything itself). Certificate condition, evaluated entirely in
outward-rounded dyadic interval arithmetic:

    K(X) subset interior(X)

This proves EXISTENCE and UNIQUENESS of a root of F in X. Standard
Krawczyk theorem; see A. Neumaier, "Interval Methods for Systems of
Equations", Cambridge University Press, 1990, Theorem 5.1.8.

Source for this module's own Table-1 / edge-list transcription:
scratch/p97-search-lane/fishburn-reeds-notes.md, Table 1 (lines 29-40)
and the 15-pair edge list (line 44). Fishburn & Reeds, "Unit distances
between vertices of a convex polygon," Comput. Geom. 2 (1992) 81-91.
"""
from __future__ import annotations

from collections import Counter
from fractions import Fraction

from dyadic import DyadicInterval

# ---------------------------------------------------------------------
# Checker's OWN independent transcription of Table 1 (1000*x, 1000*y
# strings), i = 1..10, index 0 <-> i=1 in this flat list. Deliberately
# a different data layout (flat list, not system.py's dict) so this is
# a genuinely separate re-derivation, not a structural copy.
# ---------------------------------------------------------------------
_TABLE1_STRINGS = [
    ("469.633821777", "-92.982777730"),   # i=1
    ("471.414237018", "-89.969229800"),   # i=2
    ("473.126180256", "-87.048665472"),   # i=3
    ("520.000000000", "30.000000000"),    # i=4
    ("520.996246864", "33.000000000"),    # i=5
    ("522.000000000", "36.100000000"),    # i=6
    ("429.872125856", "342.595442083"),   # i=7
    ("429.224646090", "344.599064292"),   # i=8
    ("428.539574537", "346.658610393"),   # i=9
    ("390.440922261", "417.185267785"),   # i=10
]

_RAW_Y = [Fraction(sy) / 1000 for (_sx, sy) in _TABLE1_STRINGS]  # index k <-> i=k+1


def _gap(from_i: int, to_i: int) -> Fraction:
    return _RAW_Y[to_i - 1] - _RAW_Y[from_i - 1]


# gamma_k := y_{k+1} - y_k, fixed to the Table-1 differences (SPEC.md Sec 1).
GAMMA3 = _gap(3, 4)
GAMMA4 = _gap(4, 5)
GAMMA5 = _gap(5, 6)
GAMMA6 = _gap(6, 7)

# 15-pair unit-distance edge list: for each {i, j}, E_ij holds between
# i_A = (-x_i, y_i) and j_B = (x_j, y_j) (and the mirror edge (j_A,
# i_B) holds automatically by the built-in mirror symmetry).
EDGE_LIST_CHECKER = [
    (1, 10), (2, 10), (3, 10), (1, 9), (4, 9), (5, 9), (2, 5), (3, 4),
    (1, 6), (3, 7), (5, 7), (6, 7), (2, 8), (4, 8), (6, 8),
]

FREE_VAR_NAMES = [
    "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10",
    "y2", "y3", "y8", "y9", "y10",
]
N = 15  # free-variable / equation count (square system)

# Coordinate reconstruction table: x_i = v[var_index] + const;
# y_i = v[var_index] + const, or y_i = const if var_index is None
# (only y1, fixed at 0 by the chart -- SPEC.md Sec 1).
_COORD_X = {i: (i - 1, Fraction(0)) for i in range(1, 11)}
_COORD_Y = {
    1: (None, Fraction(0)),
    2: (10, Fraction(0)),
    3: (11, Fraction(0)),
    4: (11, GAMMA3),
    5: (11, GAMMA3 + GAMMA4),
    6: (11, GAMMA3 + GAMMA4 + GAMMA5),
    7: (11, GAMMA3 + GAMMA4 + GAMMA5 + GAMMA6),
    8: (12, Fraction(0)),
    9: (13, Fraction(0)),
    10: (14, Fraction(0)),
}


def _degree_count() -> Counter:
    c = Counter()
    for a, b in EDGE_LIST_CHECKER:
        c[a] += 1
        c[b] += 1
    return c


_DEGREE = _degree_count()
assert len(EDGE_LIST_CHECKER) == 15, "edge list must have exactly 15 pairs"
assert all(_DEGREE[i] == 3 for i in range(1, 11)), (
    f"checker's own edge list does not give degree 3 to every index: {dict(_DEGREE)}"
)


# ---------------------------------------------------------------------
# Exact (Fraction) system evaluation -- used only to compute F(m) at
# the (exact, rational) midpoint hint.
# ---------------------------------------------------------------------
def coords_exact(v):
    """v: length-15 list[Fraction]. Returns (x: {1..10: Fraction},
    y: {1..10: Fraction})."""
    x = {}
    y = {}
    for i in range(1, 11):
        xvar, xconst = _COORD_X[i]
        x[i] = v[xvar] + xconst
        yvar, yconst = _COORD_Y[i]
        ybase = v[yvar] if yvar is not None else Fraction(0)
        y[i] = ybase + yconst
    return x, y


def F_exact(v):
    """The 15 equations E_ij(v) = (x_i+x_j)^2 + (y_j-y_i)^2 - 1,
    evaluated exactly (Fraction) at the free vector v."""
    x, y = coords_exact(v)
    out = []
    for (i, j) in EDGE_LIST_CHECKER:
        e = (x[i] + x[j]) ** 2 + (y[j] - y[i]) ** 2 - 1
        out.append(e)
    return out


# ---------------------------------------------------------------------
# Interval reconstruction / interval Jacobian -- evaluated over the
# certified box X. Because F is quadratic, every partial derivative is
# affine (degree <= 1) in the free variables, so direct interval
# evaluation over X is a tight (rounding-only) enclosure of the true
# Jacobian range (SPEC.md Sec 3.2: "J entries are degree-1 interval
# evaluations").
# ---------------------------------------------------------------------
def coords_interval(X, P: int):
    """X: length-15 list[DyadicInterval]. Returns (x, y) dicts of
    DyadicInterval, i = 1..10."""
    zero = DyadicInterval.point(0, P)
    x = {}
    y = {}
    for i in range(1, 11):
        xvar, xconst = _COORD_X[i]
        x[i] = X[xvar] + DyadicInterval.point(xconst, P)
        yvar, yconst = _COORD_Y[i]
        ybase = X[yvar] if yvar is not None else zero
        y[i] = ybase + DyadicInterval.point(yconst, P)
    return x, y


def J_interval(X, P: int):
    """15x15 interval Jacobian of F over the box X."""
    x, y = coords_interval(X, P)
    zero = DyadicInterval.point(0, P)
    J = [[zero for _ in range(N)] for _ in range(N)]
    two = Fraction(2)
    for row, (i, j) in enumerate(EDGE_LIST_CHECKER):
        xi_var, _ = _COORD_X[i]
        xj_var, _ = _COORD_X[j]
        yi_var, _ = _COORD_Y[i]
        yj_var, _ = _COORD_Y[j]

        tx = (x[i] + x[j]) * two  # d/dx_i (x-part) == d/dx_j (x-part)
        J[row][xi_var] = J[row][xi_var] + tx
        J[row][xj_var] = J[row][xj_var] + tx

        ty = (y[j] - y[i]) * two  # d/dy_j (y-part) = +ty ; d/dy_i (y-part) = -ty
        if yi_var is not None:
            J[row][yi_var] = J[row][yi_var] - ty
        if yj_var is not None:
            J[row][yj_var] = J[row][yj_var] + ty
    return J


# ---------------------------------------------------------------------
# Generic linear-algebra helpers over (exact Fraction) x (DyadicInterval).
# ---------------------------------------------------------------------
def matvec_exact(M, v):
    """M: n x n Fraction (list of lists). v: length-n Fraction list."""
    n = len(v)
    out = []
    for r in range(n):
        s = Fraction(0)
        for c in range(n):
            s += M[r][c] * v[c]
        out.append(s)
    return out


def interval_matmat(Y, JX, P: int):
    """Y: n x n exact Fraction. JX: n x n DyadicInterval. Returns
    n x n DyadicInterval = Y @ JX (interval matrix product)."""
    n = len(Y)
    out = [[None] * n for _ in range(n)]
    for r in range(n):
        for c in range(n):
            acc = DyadicInterval.point(0, P)
            for k in range(n):
                yrk = Y[r][k]
                if yrk == 0:
                    continue
                acc = acc + JX[k][c] * yrk
            out[r][c] = acc
    return out


def interval_matvec(M, v):
    """M: n x n DyadicInterval. v: length-n DyadicInterval."""
    n = len(v)
    P = v[0].P
    out = []
    for r in range(n):
        acc = DyadicInterval.point(0, P)
        for c in range(n):
            acc = acc + M[r][c] * v[c]
        out.append(acc)
    return out


# ---------------------------------------------------------------------
# Generic Krawczyk certifier (system-agnostic; used both by the FR
# wrapper below and by smoke.py's G-POS/G-NEG/G-SING controls).
# ---------------------------------------------------------------------
def krawczyk_step(F_exact_fn, J_interval_fn, m, r, Y, P: int):
    """
    m: length-n list[Fraction] (midpoint hint).
    r: Fraction (scalar radius) or length-n list[Fraction].
    Y: n x n list[list[Fraction]] (approximate inverse-Jacobian hint).
    P: dyadic precision (bits).

    Returns a dict with the certified box X, the Krawczyk image K(X),
    per-coordinate containment margins, and pass/fail.
    """
    n = len(m)
    r_vec = [r] * n if isinstance(r, (Fraction, int)) else list(r)
    X = [DyadicInterval(m[i] - r_vec[i], m[i] + r_vec[i], P) for i in range(n)]

    Fm = F_exact_fn(m)                 # exact Fraction vector
    YFm = matvec_exact(Y, Fm)          # exact Fraction vector
    c = [m[i] - YFm[i] for i in range(n)]  # exact Fraction vector

    JX = J_interval_fn(X, P)           # n x n DyadicInterval
    YJX = interval_matmat(Y, JX, P)    # n x n DyadicInterval

    I_minus_YJX = [[None] * n for _ in range(n)]
    for rr in range(n):
        for cc in range(n):
            ident = DyadicInterval.point(1 if rr == cc else 0, P)
            I_minus_YJX[rr][cc] = ident - YJX[rr][cc]

    XminusM = [X[i] - DyadicInterval.point(m[i], P) for i in range(n)]
    linear = interval_matvec(I_minus_YJX, XminusM)

    KX = [DyadicInterval.point(c[i], P) + linear[i] for i in range(n)]

    lo_margins = [KX[i].lo - X[i].lo for i in range(n)]  # want > 0
    hi_margins = [X[i].hi - KX[i].hi for i in range(n)]  # want > 0
    passed = all(lm > 0 and hm > 0 for lm, hm in zip(lo_margins, hi_margins))

    return {
        "passed": passed,
        "P": P,
        "X": X,
        "KX": KX,
        "lo_margins": lo_margins,
        "hi_margins": hi_margins,
    }


def fr_certify(m, r, Y, P: int):
    """FR-system-specific wrapper around the generic Krawczyk step,
    using this module's own independently transcribed F/J."""
    return krawczyk_step(F_exact, J_interval, m, r, Y, P)


# ---------------------------------------------------------------------
# Side conditions C1-C4 (SPEC.md Sec 3.3), checked over the WHOLE
# certified box X (hence, in particular, at the certified root).
# ---------------------------------------------------------------------
def _full_cycle_points_interval(X, P: int):
    """20-point cyclic order B1..B10, A10..A1 (SPEC.md Sec 3.3 C1).
    A_i = (-x_i, y_i) (mirror symmetry, built in)."""
    x, y = coords_interval(X, P)
    pts = [(x[i], y[i]) for i in range(1, 11)]           # B1..B10
    pts += [(-x[i], y[i]) for i in range(10, 0, -1)]     # A10..A1
    assert len(pts) == 20
    return pts


def check_c1_convexity(X, orientation_sign: int, P: int):
    """All 20 consecutive-triple cross products strictly one sign
    (the sign itself is only a producer HINT; every triple is
    independently verified against that sign)."""
    pts = _full_cycle_points_interval(X, P)
    n = len(pts)
    margins = []
    ok = True
    for t in range(n):
        x0, y0 = pts[t - 1]
        x1, y1 = pts[t]
        x2, y2 = pts[(t + 1) % n]
        cross = (x1 - x0) * (y2 - y1) - (y1 - y0) * (x2 - x1)
        if orientation_sign > 0:
            margin = cross.lo   # need cross.lo > 0 strictly
            ok = ok and (cross.lo > 0)
        else:
            margin = -cross.hi  # need cross.hi < 0 strictly
            ok = ok and (cross.hi < 0)
        margins.append(margin)
    return {
        "passed": ok,
        "min_margin": str(min(margins)) if margins else None,
        "orientation_sign": orientation_sign,
        "n_triples": n,
    }


def check_c1b_hull_order(X, orientation_sign: int, P: int):
    """Hull-order certificate (orchestrator validation patch 2026-07-28):
    for each directed edge (p_t, p_{t+1}) of the 20-cycle, EVERY other
    vertex q lies strictly on the orientation side of the edge line
    (sign * cross(p_{t+1}-p_t, q-p_t) > 0; 20 edges x 18 points = 360
    strict interval checks). This is the halfplane characterization of
    a convex polygon: it proves the 20 points are in strictly convex
    position AND that B1..B10, A10..A1 is their hull order. C1's
    consecutive-triple test alone certifies only LOCAL convexity -- a
    star traversal (e.g. pentagram order) also has all-same-sign turns,
    so C1 by itself does not pin the hull order; C1b closes that gap
    (and subsumes C1's conclusion)."""
    pts = _full_cycle_points_interval(X, P)
    n = len(pts)
    margins = []
    ok = True
    for t in range(n):
        x0, y0 = pts[t]
        x1, y1 = pts[(t + 1) % n]
        ex = x1 - x0
        ey = y1 - y0
        for q in range(n):
            if q == t or q == (t + 1) % n:
                continue
            cross = ex * (pts[q][1] - y0) - ey * (pts[q][0] - x0)
            if orientation_sign > 0:
                margin = cross.lo   # need > 0 strictly
                ok = ok and (cross.lo > 0)
            else:
                margin = -cross.hi  # need cross.hi < 0 strictly
                ok = ok and (cross.hi < 0)
            margins.append(margin)
    return {
        "passed": ok,
        "min_margin": str(min(margins)) if margins else None,
        "orientation_sign": orientation_sign,
        "n_checks": len(margins),
    }


def check_c2_distinctness(X, P: int):
    """190 pairwise-distinctness interval checks (belt and suspenders
    on top of C1)."""
    pts = _full_cycle_points_interval(X, P)
    n = len(pts)
    ok = True
    failures = []
    for p in range(n):
        for q in range(p + 1, n):
            dx = pts[p][0] - pts[q][0]
            dy = pts[p][1] - pts[q][1]
            distinct = (dx.lo > 0 or dx.hi < 0) or (dy.lo > 0 or dy.hi < 0)
            if not distinct:
                ok = False
                failures.append((p, q))
    return {"passed": ok, "n_pairs": n * (n - 1) // 2, "failures": failures}


def check_c3_positivity(X):
    """x_i > 0 for i = 1..10 -- these are exactly the free variables
    at slots 0..9 of the box X."""
    margins = [X[i].lo for i in range(10)]
    ok = all(mg > 0 for mg in margins)
    return {"passed": ok, "min_margin": str(min(margins))}


def check_c4_degree():
    """Pure combinatorics: every index 1..10 has exactly 3 incident
    pairs in the checker's OWN copy of the edge list."""
    d = _degree_count()
    ok = len(EDGE_LIST_CHECKER) == 15 and all(d[i] == 3 for i in range(1, 11))
    return {
        "passed": ok,
        "degrees": {i: d[i] for i in range(1, 11)},
        "n_edges": len(EDGE_LIST_CHECKER),
    }
