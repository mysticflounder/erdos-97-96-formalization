"""C3-symmetric numerical search for convex polygons with K_k at every vertex.

Points: m orbit representatives z_j (complex); the set is {z_j * w^t : t=0,1,2}, w = exp(2 pi i / 3).
Objective (per representative j, by symmetry): choose the k-subset of the other points whose distances
from z_j are most nearly equal; residual = sum of squared deviations from the subset mean.
Convexity: hinge penalty on the cross products of the angularly sorted polygon.
Alternating scheme: subset choice (combinatorial) then least-squares refinement, repeated.

usage: uv run python c3_search.py K M RESTARTS SEED
"""
import sys
import itertools
import numpy as np
from scipy.optimize import least_squares

K = int(sys.argv[1]) if len(sys.argv) > 1 else 4
M = int(sys.argv[2]) if len(sys.argv) > 2 else 3
RESTARTS = int(sys.argv[3]) if len(sys.argv) > 3 else 20
SEED = int(sys.argv[4]) if len(sys.argv) > 4 else 0
W = np.exp(2j * np.pi / 3)
rng = np.random.default_rng(SEED)
CONVEX_EPS = 0.02
SEP = float(sys.argv[5]) if len(sys.argv) > 5 else 0.3


def points_of(x):
    z = x[0::2] + 1j * x[1::2]
    return np.concatenate([z, z * W, z * W ** 2])


def convex_penalty(pts):
    ang = np.angle(pts)
    order = np.argsort(ang)
    p = pts[order]
    n = len(p)
    pen = []
    for i in range(n):
        a, b, c = p[i - 1], p[i], p[(i + 1) % n]
        u, v = b - a, c - b
        cr = (u.real * v.imag - u.imag * v.real)
        # normalise by lengths so the hinge is scale-free
        cr = cr / (abs(u) * abs(v) + 1e-12)
        pen.append(max(0.0, CONVEX_EPS - cr))
    return np.array(pen)


def choose_subsets(pts, m):
    """for representative j (index j in the first block) pick the k-subset of other points with the
    smallest distance spread; return list of index tuples."""
    subs = []
    for j in range(m):
        d = np.abs(pts - pts[j])
        idx = [i for i in range(len(pts)) if i != j]
        dd = np.array([d[i] for i in idx])
        o = np.argsort(dd)
        # best window of K consecutive sorted distances
        best, bi = None, None
        for s in range(len(o) - K + 1):
            win = dd[o[s:s + K]]
            spread = win.max() - win.min()
            if best is None or spread < best:
                best, bi = spread, [idx[t] for t in o[s:s + K]]
        subs.append(tuple(bi))
    return subs


def residuals(x, subs, m):
    pts = points_of(x)
    res = []
    for j, S in enumerate(subs):
        d = np.abs(pts[list(S)] - pts[j])
        mu = d.mean()
        res.extend(list(d - mu))
    res.extend(list(3.0 * convex_penalty(pts)))
    # separation: every pair of distinct points at distance >= SEP
    n = len(pts)
    D = np.abs(pts[:, None] - pts[None, :]) + np.eye(n) * 10
    res.extend(list(3.0 * np.maximum(0.0, SEP - D[np.triu_indices(n, 1)])))
    # scale fix: representative 0 at radius 1; all others inside the unit disc
    res.append(abs(pts[0]) - 1.0)
    res.extend(list(3.0 * np.maximum(0.0, np.abs(pts[1:m]) - 1.0)))
    return np.array(res)


def score(x, subs, m):
    r = residuals(x, subs, m)
    return float(np.sum(r ** 2))


best_overall = None
for rs in range(RESTARTS):
    # random start: radii in [0.6, 1], angles spread within a 120 degree sector
    r = rng.uniform(0.6, 1.0, M)
    th = np.sort(rng.uniform(0, 2 * np.pi / 3, M))
    x = np.empty(2 * M)
    x[0::2] = r * np.cos(th)
    x[1::2] = r * np.sin(th)
    prev = None
    for it in range(40):
        pts = points_of(x)
        subs = choose_subsets(pts, M)
        sol = least_squares(residuals, x, args=(subs, M), method='lm' if False else 'trf', max_nfev=400)
        x = sol.x
        sc = score(x, subs, M)
        if prev is not None and abs(prev - sc) < 1e-14:
            break
        prev = sc
    pts = points_of(x)
    subs = choose_subsets(pts, M)
    sc = score(x, subs, M)
    cp = convex_penalty(pts).max()
    if best_overall is None or sc < best_overall[0]:
        best_overall = (sc, x.copy(), subs, cp)
    print(f"restart {rs}: score {sc:.3e} convex_pen {cp:.2e}", file=sys.stderr)

sc, x, subs, cp = best_overall
pts = points_of(x)
print(f"K={K} M={M} n={3*M} best score {sc:.3e} max convex penalty {cp:.2e}")
for j, S in enumerate(subs):
    d = np.abs(pts[list(S)] - pts[j])
    print(f" rep {j}: subset {S} dists {np.round(d, 5)} spread {d.max()-d.min():.2e}")
print("points:", np.round(pts, 5).tolist())
