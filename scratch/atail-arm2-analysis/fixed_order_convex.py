"""DEFINITIVE 3-center convex witness search (SAT direction) for SI1 {1-8}.

Pipeline:
  1. NUMERIC random search for a strict-convex-position config of the 13 forced
     points (concyclic constraints auto-satisfied by angle parametrization on
     the three circles).  Reads off the CCW cyclic order.
  2. Hand that order to z3 (qfnra-nlsat) as consecutive-triple CCW sign
     constraints -> exact RATIONAL solution respecting concyclic + that order.
  3. EXACT-rational validate the full SI1 {1-8} with the class identifications
     M=frontier\\{g}, P=frontier\\{f}, N=shell(f), Q=shell(g).

core13's constraints WITH these class ids imply all of {1-8} (overlaps
|M cap N|={f}, |P cap Q|={s1,s2} both <=2; mutual omission holds).  So a
validated SAT witness => full {1-8}+D.convex is SAT => D.convex does NOT close
SI1 (finer lever = D.K4).  UNSAT-in-this-structure is NOT definitive (f is
pinned to the frontier circle here).

Gauge: s1=(0,0), s2=(1,0)  (both on circle(c0) and circle(bc)).
Circles:
  circle(c0) card 5 = {s1,s2,fr3,fr4,f}   [c0 on x=1/2]
  circle(bc) card 4 = {s1,s2,w1,w2}       [bc on x=1/2, equal blocker]
  circle(bf) card 4 = {f,u1,u2,u3}
"""
import math
import random
import z3
from fractions import Fraction as Fr

NAMES = ['c0', 'bc', 'bf', 's1', 's2', 'f', 'fr3', 'fr4', 'w1', 'w2',
         'u1', 'u2', 'u3']


# ---------- Phase 1: numeric convex-order search ----------
def numeric_points(p):
    (yc0, ybc, phi, a3, a4, wb1, wb2, bfx, bfy, u1a, u2a, u3a) = p
    c0 = (0.5, yc0)
    R0 = math.hypot(0.5, yc0)
    bc = (0.5, ybc)
    Rb = math.hypot(0.5, ybc)

    def onc(ctr, R, ang):
        return (ctr[0] + R * math.cos(ang), ctr[1] + R * math.sin(ang))

    s1 = (0.0, 0.0)
    s2 = (1.0, 0.0)
    f = onc(c0, R0, phi)
    fr3 = onc(c0, R0, a3)
    fr4 = onc(c0, R0, a4)
    w1 = onc(bc, Rb, wb1)
    w2 = onc(bc, Rb, wb2)
    bf = (bfx, bfy)
    Rf = math.hypot(bf[0] - f[0], bf[1] - f[1])
    u1 = onc(bf, Rf, u1a)
    u2 = onc(bf, Rf, u2a)
    u3 = onc(bf, Rf, u3a)
    return {'c0': c0, 'bc': bc, 'bf': bf, 's1': s1, 's2': s2, 'f': f,
            'fr3': fr3, 'fr4': fr4, 'w1': w1, 'w2': w2,
            'u1': u1, 'u2': u2, 'u3': u3}


def convex_order(pts, eps=1e-7):
    names = list(pts)
    P = [pts[n] for n in names]
    n = len(P)
    for i in range(n):
        for j in range(i + 1, n):
            if abs(P[i][0] - P[j][0]) < eps and abs(P[i][1] - P[j][1]) < eps:
                return None

    def cross(o, a, b):
        return ((P[a][0] - P[o][0]) * (P[b][1] - P[o][1])
                - (P[a][1] - P[o][1]) * (P[b][0] - P[o][0]))

    idx = sorted(range(n), key=lambda k: (P[k][0], P[k][1]))
    lower = []
    for k in idx:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], k) <= eps:
            lower.pop()
        lower.append(k)
    upper = []
    for k in reversed(idx):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], k) <= eps:
            upper.pop()
        upper.append(k)
    hull = lower[:-1] + upper[:-1]
    if len(hull) != n:
        return None
    return [names[k] for k in hull]


def convex_penalty(p):
    """0 iff all 13 points are strict-convex-position vertices; else >0."""
    try:
        pts = numeric_points(p)
    except (ValueError, OverflowError):
        return 1e6
    names = list(pts)
    P = [pts[n] for n in names]
    n = len(P)
    # distinctness penalty
    dpen = 0.0
    for i in range(n):
        for j in range(i + 1, n):
            dd = (P[i][0] - P[j][0]) ** 2 + (P[i][1] - P[j][1]) ** 2
            if dd < 1e-4:
                dpen += (1e-4 - dd) * 1e6
    try:
        import numpy as np
        from scipy.spatial import ConvexHull
        arr = np.array(P)
        hull = ConvexHull(arr)
        vert = set(hull.vertices.tolist())
        interior = [i for i in range(n) if i not in vert]
        # depth of each interior point below the hull (max facet violation, >0)
        depth = 0.0
        eqs = hull.equations  # each row a·x + b <= 0 on hull interior side
        for i in interior:
            x = arr[i]
            viol = np.max(eqs[:, :2] @ x + eqs[:, 2])  # closest facet signed
            depth += max(0.0, -viol) + 0.05  # +0.05 per interior point
        return depth + dpen
    except Exception:
        return 1e6 + dpen


def search_order(restarts=60):
    from scipy.optimize import differential_evolution
    two_pi = 2 * math.pi
    bounds = [(-3, 3),        # yc0  (UNBIASED sign)
              (-3, 3),        # ybc  (UNBIASED sign)
              (0, two_pi),    # phi (f on circle c0)
              (0, two_pi),    # fr3
              (0, two_pi),    # fr4
              (0, two_pi),    # w1
              (0, two_pi),    # w2
              (-4, 5),        # bfx
              (-5, 5),        # bfy
              (0, two_pi),    # u1
              (0, two_pi),    # u2
              (0, two_pi)]    # u3
    best = None
    for k in range(restarts):
        res = differential_evolution(
            convex_penalty, bounds, maxiter=300, popsize=25,
            tol=1e-9, seed=20260719 + k, polish=True, mutation=(0.4, 1.6),
            recombination=0.85)
        if best is None or res.fun < best.fun:
            best = res
        if res.fun <= 1e-9:
            pts = numeric_points(res.x)
            order = convex_order(pts)
            if order is not None:
                print(f'  DE restart {k}: convex margin achieved (pen={res.fun:.2e})')
                return order, list(res.x), pts
    print(f'  DE best penalty over {restarts} restarts: {best.fun:.4f}'
          ' (>0 => no convex config found)')
    return None, None, None


# ---------- Phase 2: exact z3 solve in the found order ----------
def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def zpt(n):
    return (z3.Real(n + 'x'), z3.Real(n + 'y'))


def exact_solve(order, tmo=60000):
    s1 = (z3.RealVal(0), z3.RealVal(0))
    s2 = (z3.RealVal(1), z3.RealVal(0))
    c0, bc, bf = zpt('c0'), zpt('bc'), zpt('bf')
    fr3, fr4, f = zpt('fr3'), zpt('fr4'), zpt('f')
    w1, w2 = zpt('w1'), zpt('w2')
    u1, u2, u3 = zpt('u1'), zpt('u2'), zpt('u3')
    pts = {'s1': s1, 's2': s2, 'c0': c0, 'bc': bc, 'bf': bf,
           'fr3': fr3, 'fr4': fr4, 'f': f, 'w1': w1, 'w2': w2,
           'u1': u1, 'u2': u2, 'u3': u3}
    C = []
    R1 = d2(c0, s1)
    for q in (s2, fr3, fr4, f):
        C += [d2(c0, q) == R1]
    C += [R1 > 0]
    R2 = d2(bc, s1)
    for q in (s2, w1, w2):
        C += [d2(bc, q) == R2]
    C += [R2 > 0]
    R3 = d2(bf, f)
    for q in (u1, u2, u3):
        C += [d2(bf, q) == R3]
    C += [R3 > 0]
    ns = list(pts)
    for i in range(len(ns)):
        for j in range(i + 1, len(ns)):
            a, b = pts[ns[i]], pts[ns[j]]
            C += [z3.Or(a[0] != b[0], a[1] != b[1])]
    # convex in the given cyclic order: consecutive triples all CCW
    seq = [pts[nm] for nm in order]
    m = len(seq)
    for i in range(m):
        a, b, cc = seq[i], seq[(i + 1) % m], seq[(i + 2) % m]
        cross = ((b[0] - a[0]) * (cc[1] - b[1])
                 - (b[1] - a[1]) * (cc[0] - b[0]))
        C += [cross > 0]
    s = z3.Tactic('qfnra-nlsat').solver()
    s.add(C)
    s.set('timeout', tmo)
    r = s.check()
    if r != z3.sat:
        return r, None
    mdl = s.model()
    out = {}
    for nm, pp in pts.items():
        vx = mdl.eval(pp[0], model_completion=True)
        vy = mdl.eval(pp[1], model_completion=True)
        out[nm] = (Fr(str(vx.as_fraction())) if hasattr(vx, 'as_fraction')
                   else Fr(int(vx.as_long())),
                   Fr(str(vy.as_fraction())) if hasattr(vy, 'as_fraction')
                   else Fr(int(vy.as_long())))
    return r, out


# ---------- Phase 2': exact RATIONAL construction by chord-slope snapping ----------
def build_rational(params, D):
    """Reconstruct all 13 points as EXACT rationals.  Circles auto-satisfy
    concyclicity: s1=(0,0),s2=(1,0) lie on circle(c0)/(bc) for any rational
    center on x=1/2; further points are rational second-intersections of
    rational-slope chords through a rational anchor (concyclic exactly)."""
    (yc0f, ybcf, phi, a3, a4, wb1, wb2, bfxf, bfyf, u1a, u2a, u3a) = params
    npts = numeric_points(params)

    def rs(x):
        return Fr(round(x * D), D)

    def slope(p0num, qnum):
        return (qnum[1] - p0num[1]) / (qnum[0] - p0num[0])

    def second_through(center, p0, t):
        cx, cy = center
        ax, ay = p0[0] - cx, p0[1] - cy
        s = Fr(-2) * (ax + ay * t) / (1 + t * t)
        return (p0[0] + s, p0[1] + t * s)

    s1 = (Fr(0), Fr(0))
    s2 = (Fr(1), Fr(0))
    c0 = (Fr(1, 2), rs(yc0f))
    bc = (Fr(1, 2), rs(ybcf))

    def on_c0(qnum):
        return second_through(c0, s1, rs(slope(npts['s1'], qnum)))

    def on_bc(qnum):
        return second_through(bc, s1, rs(slope(npts['s1'], qnum)))

    f = on_c0(npts['f'])
    fr3 = on_c0(npts['fr3'])
    fr4 = on_c0(npts['fr4'])
    w1 = on_bc(npts['w1'])
    w2 = on_bc(npts['w2'])
    bf = (rs(bfxf), rs(bfyf))

    def on_bf(qnum):
        return second_through(bf, f, rs(slope(npts['f'], qnum)))

    u1 = on_bf(npts['u1'])
    u2 = on_bf(npts['u2'])
    u3 = on_bf(npts['u3'])
    return {'c0': c0, 'bc': bc, 'bf': bf, 's1': s1, 's2': s2, 'f': f,
            'fr3': fr3, 'fr4': fr4, 'w1': w1, 'w2': w2,
            'u1': u1, 'u2': u2, 'u3': u3}


def exact_strict_convex(W):
    pl = list(W.values())

    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    from itertools import combinations
    for t in combinations(range(len(pl)), 3):
        if cross(pl[t[0]], pl[t[1]], pl[t[2]]) == 0:
            return False
    S = sorted(range(len(pl)), key=lambda k: (pl[k][0], pl[k][1]))

    def half(seq):
        h = []
        for k in seq:
            while len(h) >= 2 and cross(pl[h[-2]], pl[h[-1]], pl[k]) <= 0:
                h.pop()
            h.append(k)
        return h
    hull = set(half(S)[:-1]) | set(half(S[::-1])[:-1])
    return len(hull) == len(pl)


def rational_witness(params):
    for D in (6, 12, 24, 60, 120, 360, 840, 2520, 27720, 360360):
        W = build_rational(params, D)
        if len(set(W.values())) == 13 and exact_strict_convex(W):
            return W, D
    return None, None


# ---------- Phase 3: exact validation of {1-8} ----------
def qd2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def validate(W):
    ok = True

    def chk(cond, msg):
        nonlocal ok
        ok = ok and cond
        print(f'   [{"OK " if cond else "FAIL"}] {msg}')

    c0, bc, bf = W['c0'], W['bc'], W['bf']
    s1, s2, f = W['s1'], W['s2'], W['f']
    fr3, fr4 = W['fr3'], W['fr4']
    w1, w2 = W['w1'], W['w2']
    u1, u2, u3 = W['u1'], W['u2'], W['u3']
    R0 = qd2(c0, s1)
    chk(all(qd2(c0, q) == R0 for q in (s2, fr3, fr4, f)),
        'frontier: {s1,s2,fr3,fr4,f} concyclic on circle(c0)')
    Rb = qd2(bc, s1)
    chk(all(qd2(bc, q) == Rb for q in (s2, w1, w2)),
        'shell(g): {s1,s2,w1,w2} concyclic on circle(bc), equal blocker')
    Rf = qd2(bf, f)
    chk(all(qd2(bf, q) == Rf for q in (u1, u2, u3)),
        'shell(f): {f,u1,u2,u3} concyclic on circle(bf)')
    chk(c0 != bc and c0 != bf and bc != bf, 'centers pairwise distinct')
    # class identifications
    frontier = {s1, s2, fr3, fr4, f}
    M = frontier - {s1}          # g survives at c0
    P = frontier - {f}           # f survives at c0
    N = {f, u1, u2, u3}          # shell(f), g survives at bf
    Q = {s1, s2, w1, w2}         # shell(g), f survives at bc
    chk(len(M) == 4 and s1 not in M, 'M=frontier\\{g} card4, g absent (survive c0)')
    chk(len(P) == 4 and f not in P, 'P=frontier\\{f} card4, f absent (survive c0)')
    chk(len(N) == 4 and s1 not in N, 'N=shell(f) card4, g absent (survive bf)')
    chk(len(Q) == 4 and f not in Q, 'Q=shell(g) card4, f absent (survive bc)')
    chk(len(M & N) <= 2, f'|M cap N|={len(M & N)} <= 2')
    chk(len(P & Q) <= 2, f'|P cap Q|={len(P & Q)} <= 2')
    chk(f not in Q, 'mutual omission: f not in shell(g)')
    chk(s1 not in N, 'mutual omission: g not in shell(f)')
    # strict convex position: no collinear triple, all on hull
    pl = list(W.values())

    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    from itertools import combinations
    coll = [t for t in combinations(range(len(pl)), 3)
            if cross(pl[t[0]], pl[t[1]], pl[t[2]]) == 0]
    chk(len(coll) == 0, f'no collinear triple ({len(coll)} found)')
    S = sorted(range(len(pl)), key=lambda k: (pl[k][0], pl[k][1]))

    def half(seq):
        h = []
        for k in seq:
            while len(h) >= 2 and cross(pl[h[-2]], pl[h[-1]], pl[k]) <= 0:
                h.pop()
            h.append(k)
        return h
    hull = set(half(S)[:-1]) | set(half(S[::-1])[:-1])
    chk(len(hull) == len(pl), f'all {len(pl)} points are hull vertices (strict convex)')
    return ok


if __name__ == '__main__':
    print('=' * 68)
    print('SI1 3-center convex witness: numeric-order -> exact z3 -> validate')
    print('=' * 68)
    print('Phase 1: numeric convex-order search ...')
    order, params, npts = search_order()
    if order is None:
        print('  NO convex config found numerically (heavy signal toward UNSAT'
              ' for this structure; NOT definitive).')
        raise SystemExit
    print(f'  FOUND convex order (CCW): {order}')
    print('Phase 2: exact RATIONAL construction (chord-slope snapping) ...')
    W, D = rational_witness(params)
    if W is None:
        print('  rational snapping did not land a convex config; trying z3 ...')
        r, W = exact_solve(order)
        print(f'  z3 -> {r}')
        if r != z3.sat:
            raise SystemExit
    else:
        print(f'  exact rational witness constructed (denominator base D={D})')
    print('  exact rational witness:')
    for nm in NAMES:
        print(f'     {nm} = {W[nm]}')
    print('Phase 3: EXACT validation of SI1 {1-8} + strict convex position ...')
    good = validate(W)
    print('\nVERDICT:', 'SAT (validated) => D.convex does NOT close SI1;'
          ' finer lever = D.K4' if good else 'validation FAILED (bug)')
