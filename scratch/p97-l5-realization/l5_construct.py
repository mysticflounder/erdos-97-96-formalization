"""Constructive realization of the P97 level-5 named fragment.

All equalities hold by construction: the three cap chains are strictly convex
curves inside the unit disc (MEC) meeting at the Moser apexes v1, v2, v3; class
members are computed as exact intersections of circles with these curves.

Chains: chord a->b plus outward offset delta(t), delta concave, delta(0)=delta(1)=0,
delta'' = -kappa(t) with kappa >= 0 piecewise constant (K cells).

Named structure produced:
  v1: classes at radii r, rho, each = {u in I3, p1, p2 in I1, w in I2}
  bP  = bisector(p1,p2) ∩ I1-curve, shell {p1, p2, X in I2-curve, Y in I3-curve}
  bR  = bisector(p1',p2') ∩ I1-curve, shell {p1', p2', X', Y'}
  v2: two classes, each = chosen crossings of circle(v2, s) with the I2/I1/I3 curves
  v3: two classes likewise.
Checks: strict convexity, disc, apex non-obtuse, exact class multiplicities,
no accidental extra equidistances at the named centers.
"""
import json
import sys
import numpy as np

TWO_PI = 2 * np.pi


class Chain:
    def __init__(self, a, b, kappa, scale):
        self.a = np.asarray(a, float)
        self.b = np.asarray(b, float)
        d = self.b - self.a
        self.L = np.linalg.norm(d)
        self.e = d / self.L
        n = np.array([d[1], -d[0]]) / self.L
        mid = (self.a + self.b) / 2
        self.n = n if n @ mid > 0 else -n      # outward = away from origin
        k = np.asarray(kappa, float) * scale
        K = len(k)
        # delta'' = -k on cells; delta'(t) = c - int_0^t k;  delta(1)=0 fixes c
        edges = np.linspace(0, 1, K + 1)
        # integral of int_0^t k dt over [0,1]
        I1 = 0.0
        cum = 0.0
        for i in range(K):
            h = edges[i + 1] - edges[i]
            I1 += cum * h + k[i] * h * h / 2
            cum += k[i] * h
        self.k, self.edges, self.c = k, edges, I1  # since int_0^1 delta' = c*1 - I1 = 0

    def delta_and_slope(self, t):
        t = np.clip(t, 0.0, 1.0)
        i = min(int(t * len(self.k)), len(self.k) - 1)
        # cumulative int_0^t k
        cum = 0.0
        val = 0.0
        for j in range(i):
            h = self.edges[j + 1] - self.edges[j]
            val += (self.c - cum) * h - self.k[j] * h * h / 2
            cum += self.k[j] * h
        h = t - self.edges[i]
        val += (self.c - cum) * h - self.k[i] * h * h / 2
        slope = self.c - cum - self.k[i] * h
        return val, slope

    def point(self, t):
        d, _ = self.delta_and_slope(t)
        return self.a + t * self.L * self.e + d * self.n

    def points(self, ts):
        return np.array([self.point(t) for t in ts])

    def max_norm(self, m=400):
        return max(np.linalg.norm(self.point(t)) for t in np.linspace(0, 1, m))

    def crossings(self, center, radius, m=2000):
        """parameters t in (0,1) where |point(t) - center| = radius (bisection refined)."""
        ts = np.linspace(0, 1, m + 1)
        f = np.array([np.linalg.norm(self.point(t) - center) - radius for t in ts])
        roots = []
        for i in range(m):
            if f[i] == 0.0:
                roots.append(ts[i])
            elif f[i] * f[i + 1] < 0:
                lo, hi = ts[i], ts[i + 1]
                flo = f[i]
                for _ in range(60):
                    mid = (lo + hi) / 2
                    fm = np.linalg.norm(self.point(mid) - center) - radius
                    if flo * fm <= 0:
                        hi = mid
                    else:
                        lo, flo = mid, fm
                roots.append((lo + hi) / 2)
        return [t for t in roots if 1e-9 < t < 1 - 1e-9]

    def bisector_crossing(self, p, q, m=2000):
        """parameter where the perpendicular bisector of pq meets the chain (expects exactly one)."""
        mid = (p + q) / 2
        d = q - p
        ts = np.linspace(0, 1, m + 1)
        f = np.array([(self.point(t) - mid) @ d for t in ts])
        roots = []
        for i in range(m):
            if f[i] * f[i + 1] < 0:
                lo, hi = ts[i], ts[i + 1]
                flo = f[i]
                for _ in range(60):
                    mm = (lo + hi) / 2
                    fm = (self.point(mm) - mid) @ d
                    if flo * fm <= 0:
                        hi = mm
                    else:
                        lo, flo = mm, fm
                roots.append((lo + hi) / 2)
        return roots


def build(par):
    A = par['A']  # apex angle at v1 (deg); v2 at angle 270-A', v3 at 270+A''
    # allow non-isosceles: v2 at 270 - A2, v3 at 270 + A3, angle at v1 = (A2+A3)/2... use arcs
    a2 = np.radians(270 - par['arc2'])
    a3 = np.radians(270 + par['arc3'])
    v1 = np.array([0.0, 1.0])
    v2 = np.array([np.cos(a2), np.sin(a2)])
    v3 = np.array([np.cos(a3), np.sin(a3)])
    C3 = Chain(v1, v2, par['k3'], par['s3'])   # I3: v1 -> v2
    C1 = Chain(v2, v3, par['k1'], par['s1'])   # I1: v2 -> v3
    C2 = Chain(v3, v1, par['k2'], par['s2'])   # I2: v3 -> v1
    log = []
    named = {}   # name -> (chain_id, t)
    def add(name, cid, t):
        named[name] = (cid, float(t))
    # v1 classes
    for tag, rad in (('r', par['r']), ('rho', par['rho'])):
        c1 = C1.crossings(v1, rad); c3 = C3.crossings(v1, rad); c2 = C2.crossings(v1, rad)
        log.append(f"v1 radius {tag}={rad:.4f}: I1 crossings {len(c1)}, I3 {len(c3)}, I2 {len(c2)}; |v1v2| {np.linalg.norm(v1-v2):.4f} |v1v3| {np.linalg.norm(v1-v3):.4f}")
        if len(c1) != 2 or len(c3) != 1 or len(c2) != 1:
            return None, log
        add('p1' + tag, 1, c1[0]); add('p2' + tag, 1, c1[1]); add('u' + tag, 3, c3[0]); add('w' + tag, 2, c2[0])
    # blockers
    for tag, bname in (('r', 'bP'), ('rho', 'bR')):
        p = C1.point(named['p1' + tag][1]); q = C1.point(named['p2' + tag][1])
        bc = C1.bisector_crossing(p, q)
        log.append(f"{bname}: bisector crossings on I1: {len(bc)}")
        if len(bc) != 1:
            return None, log
        b = C1.point(bc[0]); d = np.linalg.norm(b - p)
        add(bname, 1, bc[0])
        x2 = C2.crossings(b, d); x3 = C3.crossings(b, d)
        i1 = C1.crossings(b, d)
        mind = lambda C: min(np.linalg.norm(C.point(t) - b) for t in np.linspace(0, 1, 800))
        log.append(f"{bname}: d={d:.4f} circle crossings I2 {len(x2)} I3 {len(x3)} I1 {len(i1)}; min dist to I2 {mind(C2):.4f} I3 {mind(C3):.4f}; |b v2| {np.linalg.norm(b-v2):.4f} |b v3| {np.linalg.norm(b-v3):.4f}")
        if len(x2) < 1 or len(x3) < 1 or len(i1) != 2:
            return None, log
        # choose which crossing: parameter picks
        px = par.get('pick_' + bname, (0, -1))
        add('X' + tag, 2, x2[px[0]]); add('Y' + tag, 3, x3[px[1]])
    # v2 classes: crossings with I2 (>=2), I1 (1 near v3), I3 (near v1)
    for j, s in enumerate(par['s_v2']):
        c2 = C2.crossings(v2, s); c1 = C1.crossings(v2, s); c3 = C3.crossings(v2, s)
        prof = [np.linalg.norm(C2.point(t) - v2) for t in np.linspace(0, 1, 800)]
        log.append(f"v2 class {j} s={s:.4f}: I2 {len(c2)} I1 {len(c1)} I3 {len(c3)}; I2 profile min {min(prof):.4f} max {max(prof):.4f} end {prof[-1]:.4f}")
        pick = par['pick_v2'][j]   # list of (chain, index)
        try:
            for m, (cid, idx) in enumerate(pick):
                lst = {2: c2, 1: c1, 3: c3}[cid]
                add(f'v2c{j}m{m}', cid, lst[idx])
        except IndexError:
            return None, log
    for j, s in enumerate(par['s_v3']):
        c3 = C3.crossings(v3, s); c1 = C1.crossings(v3, s); c2 = C2.crossings(v3, s)
        prof = [np.linalg.norm(C3.point(t) - v3) for t in np.linspace(0, 1, 800)]
        log.append(f"v3 class {j} s={s:.4f}: I3 {len(c3)} I1 {len(c1)} I2 {len(c2)}; I3 profile min {min(prof):.4f} max {max(prof):.4f} start {prof[0]:.4f}")
        pick = par['pick_v3'][j]
        try:
            for m, (cid, idx) in enumerate(pick):
                lst = {3: c3, 1: c1, 2: c2}[cid]
                add(f'v3c{j}m{m}', cid, lst[idx])
        except IndexError:
            return None, log
    chains = {1: C1, 2: C2, 3: C3}
    # extra critical centers: {"name", "chain", "t", "through": existing name, "picks": [[chain, idx], ...]}
    for ex in par.get('extra_centers', []):
        cc = chains[ex['chain']].point(ex['t'])
        add(ex['name'], ex['chain'], ex['t'])
        if ex['through'] in ('v1', 'v2', 'v3'):
            sc, st = None, None
            sp = {'v1': v1, 'v2': v2, 'v3': v3}[ex['through']]
        else:
            sc, st = named[ex['through']]
            sp = chains[sc].point(st)
        rad = np.linalg.norm(cc - sp)
        cr = {cid: chains[cid].crossings(cc, rad) for cid in (1, 2, 3)}
        log.append(f"{ex['name']}: through {ex['through']} radius {rad:.4f}; crossings I1 {len(cr[1])} I2 {len(cr[2])} I3 {len(cr[3])}")
        try:
            for m, (cid, idx) in enumerate(ex['picks']):
                t = cr[cid][idx]
                # skip if this crossing is (numerically) the 'through' point itself
                if cid == sc and abs(t - st) < 1e-7:
                    return None, log + [f"{ex['name']}: pick {m} coincides with through-point; choose another index"]
                add(f"{ex['name']}m{m}", cid, t)
        except IndexError:
            return None, log
    # assemble cyclic order: v1, I3 (t asc), v2, I1, v3, I2
    seq = [('v1', v1)]
    for cid, vname, vpt in ((3, 'v2', v2), (1, 'v3', v3), (2, None, None)):
        items = sorted([(t, nm) for nm, (c, t) in named.items() if c == cid])
        for t, nm in items:
            seq.append((nm, chains[cid].point(t)))
        if vname:
            seq.append((vname, vpt))
    names = [s[0] for s in seq]
    P = np.array([s[1] for s in seq])
    return dict(names=names, P=P, named=named, chains=chains, v=(v1, v2, v3)), log


def analyze(cfg, par, tol=1e-7):
    names, P = cfg['names'], cfg['P']
    N = len(P)
    idx = {n: i for i, n in enumerate(names)}
    D = np.linalg.norm(P[:, None] - P[None], axis=2)
    ext = []
    for i in range(N):
        a, b, c = P[i - 1], P[i], P[(i + 1) % N]
        u, v = b - a, c - b
        ext.append(np.degrees(np.arctan2(u[0] * v[1] - u[1] * v[0], u @ v)))
    rep = dict(N=N, names=names, min_ext=round(min(ext), 4), total_turn=round(sum(ext), 4),
               max_norm=round(float(max(np.linalg.norm(P[i]) for i in range(N) if names[i] not in ('v1', 'v2', 'v3'))), 5),
               min_sep=round(float(min(D[i, (i + 1) % N] for i in range(N))), 5))
    v1, v2, v3 = cfg['v']
    tri = []
    for a, b, c in ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2)):
        cs = ((b - a) @ (c - a)) / (np.linalg.norm(b - a) * np.linalg.norm(c - a))
        tri.append(round(float(np.degrees(np.arccos(cs))), 3))
    rep['triangle'] = tri
    # class multiplicities at named centers
    def classes_at(i):
        ds = D[i].copy(); ds[i] = np.inf
        order = np.argsort(ds)
        groups = []
        cur = [order[0]]
        for k in range(1, N):
            if abs(ds[order[k]] - ds[order[k - 1]]) < tol:
                cur.append(order[k])
            else:
                groups.append(cur); cur = [order[k]]
        groups.append(cur)
        return [(round(float(ds[g[0]]), 6), [names[j] for j in g]) for g in groups if len(g) >= 3]
    rep['classes'] = {c: classes_at(idx[c]) for c in ['v1', 'v2', 'v3', 'bP', 'bR'] + [ex['name'] for ex in par.get('extra_centers', [])]}
    # every vertex: max multiplicity (informational)
    rep['max_mult_all'] = {names[i]: max((len(g[1]) for g in classes_at(i)), default=2) for i in range(N)}
    # cap counts
    i2, i3 = idx['v2'], idx['v3']
    rep['cap_sizes'] = dict(cap1=i3 - i2 + 1, cap2=N - i3 + 1, cap3=i2 + 1)
    ok = (min(ext) > 0.02 and rep['max_norm'] < 1 - 1e-6 and rep['min_sep'] > 1e-4 and max(tri) <= 90.0)
    # exactness of the eight named classes
    want = {'v1': 2, 'v2': 2, 'v3': 2, 'bP': 1, 'bR': 1}
    for ex in par.get('extra_centers', []):
        want[ex['name']] = 1
    exact = True
    for c, k in want.items():
        cl = rep['classes'][c]
        if k == 1:
            exact &= (len(cl) == 1 and len(cl[0][1]) == 4)
        else:
            exact &= (len(cl) == 2 and all(len(g[1]) == 4 for g in cl))
    rep['convex_ok'] = bool(ok)
    rep['classes_exact'] = bool(exact)
    rep['exterior_deg'] = [round(e, 3) for e in ext]
    return rep


if __name__ == "__main__":
    par = json.load(open(sys.argv[1]))
    cfg, log = build(par)
    print("\n".join(log), file=sys.stderr)
    if cfg is None:
        print(json.dumps(dict(built=False, log=log)))
        sys.exit(0)
    rep = analyze(cfg, par)
    rep['built'] = True
    rep['log'] = log
    rep['points'] = cfg['P'].tolist()
    print(json.dumps(rep, indent=1))
