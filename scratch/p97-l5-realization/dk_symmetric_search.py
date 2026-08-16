"""D_k-symmetric numerical search for convex polygons with K_K at every vertex.

Symmetry group D_k = rotations by 2 pi / k (w) and reflection s across the x-axis.
Orbits: `A` generic representatives v_j (orbit {w^i v_j, w^i conj(v_j)}, size 2k) and
`B` axis representatives u_l (real, orbit {w^i u_l}, size k).  n = 2kA + kB.

Free equalities used by every row (this is why the D_k count is only ONE equation
overdetermined for K=4, and underdetermined for K=3): for any point p and any i,
dist(p, w^i p) = dist(p, w^-i p) = 2 |p| sin(pi i / k); for an axis point u and any
image x, dist(u, x) = dist(u, conj x).
Row residuals: a row picks the rotation pair index i (1 <= i < k/2) with the best fit;
a generic v then needs K-2 further images at radius 2|v| sin(pi i/k); an axis u needs
K-2 further members where an off-axis image counts double (mirror pair) and an on-axis
image counts once.  Greedy nearest choice, then least squares, alternated.
Hinge penalties: strict convexity, minimum separation SEP, unit disc.

usage: uv run python dk_symmetric_search.py K k A B RESTARTS SEED SEP
"""
import sys
import numpy as np
from scipy.optimize import least_squares

K = int(sys.argv[1]) if len(sys.argv) > 1 else 4
k = int(sys.argv[2]) if len(sys.argv) > 2 else 3
A = int(sys.argv[3]) if len(sys.argv) > 3 else 2
B = int(sys.argv[4]) if len(sys.argv) > 4 else 1
RESTARTS = int(sys.argv[5]) if len(sys.argv) > 5 else 20
SEED = int(sys.argv[6]) if len(sys.argv) > 6 else 0
SEP = float(sys.argv[7]) if len(sys.argv) > 7 else 0.15
CONVEX_EPS = 0.02
W = np.exp(2j * np.pi / k)
PAIR_IDX = [i for i in range(1, k) if 2 * i < k]      # rotation pair indices (w^i, w^-i distinct)
rng = np.random.default_rng(SEED)
N = 2 * k * A + k * B


def points_of(x):
    pts = []
    reps = []
    for j in range(A):
        v = x[2 * j] + 1j * x[2 * j + 1]
        reps.append(len(pts))
        for i in range(k):
            pts.append(v * W ** i)
        for i in range(k):
            pts.append(np.conj(v) * W ** i)
    for l in range(B):
        u = x[2 * A + l] + 0j
        reps.append(len(pts))
        for i in range(k):
            pts.append(u * W ** i)
    return np.array(pts), reps


def convex_penalty(pts):
    ang = np.angle(pts)
    order = np.argsort(ang)
    p = pts[order]
    n = len(p)
    pen = []
    for i in range(n):
        a, b, c = p[i - 1], p[i], p[(i + 1) % n]
        u, v = b - a, c - b
        cr = (u.real * v.imag - u.imag * v.real) / (abs(u) * abs(v) + 1e-12)
        pen.append(max(0.0, CONVEX_EPS - cr))
    return np.array(pen)


def row_choice(pts, idx, is_axis):
    """returns (pair index i, [(image index, weight)...]) minimising the greedy deviation."""
    p = pts[idx]
    best = None
    for i in PAIR_IDX:
        r = 2.0 * abs(p) * np.sin(np.pi * i / k)
        cand = []
        for t in range(len(pts)):
            if t == idx:
                continue
            if abs(pts[t] - p * W ** i) < 1e-12 or abs(pts[t] - p * W ** (-i)) < 1e-12:
                continue
            dev = abs(abs(pts[t] - p) - r)
            if is_axis:
                if abs(pts[t].imag) < 1e-12:
                    cand.append((dev, t, 1))
                elif pts[t].imag > 0:
                    cand.append((dev, t, 2))
            else:
                cand.append((dev, t, 1))
        cand.sort()
        need = K - 2
        chosen = []
        total = 0.0
        for dev, t, wgt in cand:
            if need <= 0:
                break
            chosen.append((t, wgt))
            total += wgt * dev * dev
            need -= wgt
        if best is None or total < best[0]:
            best = (total, i, chosen)
    return best[1], best[2]


def residuals(x, choices):
    pts, reps = points_of(x)
    res = []
    for m, idx in enumerate(reps):
        p = pts[idx]
        i, chosen = choices[m]
        r = 2.0 * abs(p) * np.sin(np.pi * i / k)
        for t, wgt in chosen:
            res.append(np.sqrt(wgt) * (abs(pts[t] - p) - r))
    res.extend(list(3.0 * convex_penalty(pts)))
    n = len(pts)
    D = np.abs(pts[:, None] - pts[None, :]) + np.eye(n) * 10
    res.extend(list(3.0 * np.maximum(0.0, SEP - D[np.triu_indices(n, 1)])))
    res.extend(list(3.0 * np.maximum(0.0, np.abs(pts) - 1.0)))
    res.append(max(np.abs(pts)) - 1.0)
    return np.array(res)


def choices_of(x):
    pts, reps = points_of(x)
    return [row_choice(pts, idx, m >= A) for m, idx in enumerate(reps)]


def score(x):
    return float(np.sum(residuals(x, choices_of(x)) ** 2))


best = None
for rs in range(RESTARTS):
    x = np.empty(2 * A + B)
    for j in range(A):
        rad = rng.uniform(0.5, 1.0)
        th = rng.uniform(0.02, np.pi / k - 0.02)
        x[2 * j] = rad * np.cos(th)
        x[2 * j + 1] = rad * np.sin(th)
    for l in range(B):
        x[2 * A + l] = rng.uniform(0.5, 1.0) * rng.choice([-1.0, 1.0])
    prev = None
    for it in range(60):
        ch = choices_of(x)
        sol = least_squares(residuals, x, args=(ch,), max_nfev=600)
        x = sol.x
        sc = score(x)
        if prev is not None and abs(prev - sc) < 1e-15:
            break
        prev = sc
    sc = score(x)
    if best is None or sc < best[0]:
        best = (sc, x.copy())
    print(f"restart {rs}: score {sc:.3e}", file=sys.stderr)

sc, x = best
pts, reps = points_of(x)
ch = choices_of(x)
print(f"K={K} k={k} A={A} B={B} n={N} best score {sc:.3e} max convex penalty {convex_penalty(pts).max():.2e}")
for m, idx in enumerate(reps):
    p = pts[idx]
    i, chosen = ch[m]
    r = 2.0 * abs(p) * np.sin(np.pi * i / k)
    print(f" rep {m} ({'axis' if m >= A else 'generic'}) |p|={abs(p):.5f} pair i={i} r={r:.5f} extras {[(t, wgt, round(abs(pts[t] - p), 5)) for t, wgt in chosen]}")
print("points:", [(round(z.real, 5), round(z.imag, 5)) for z in pts])
