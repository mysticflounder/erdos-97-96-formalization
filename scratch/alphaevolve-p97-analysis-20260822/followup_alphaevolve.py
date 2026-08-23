"""Follow-up probes on the AlphaEvolve Erdos-97 data.

(a) Examine the exact-but-nonconvex solution of the 15-gon window system.
(b) Convexity-constrained polish: floor of the normalized score.
(c) Reflection symmetry of the 9-gon (C3 vs D3) and 15-gon C3 deviation.
(d) D5 all-axes ansatz on n=15: enumerate pairing types, solve 3-unknown systems.
"""
import numpy as np
from scipy.optimize import least_squares, minimize
import itertools

ns = {"np": np}
with open("alphaevolve_configs.txt") as f:
    for line in f:
        line = line.strip()
        if line:
            exec(line, ns)
P15 = np.array(ns["myarr4"], dtype=float)
P9 = np.array(ns["points"], dtype=float)


def dist_matrix(P):
    diff = P[:, None, :] - P[None, :, :]
    return np.sqrt((diff ** 2).sum(-1))


def convex_violations(P):
    n = len(P)
    crs = []
    for i in range(n):
        a, b, c = P[i], P[(i + 1) % n], P[(i + 2) % n]
        crs.append((b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0]))
    crs = np.array(crs)
    dom = np.sign(np.median(crs))
    bad = [i for i in range(n) if np.sign(crs[i]) != dom]
    return bad, crs


def windows_of(P, k):
    n = len(P)
    D = dist_matrix(P)
    wins = {}
    for v in range(n):
        others = [i for i in range(n) if i != v]
        dv = D[v, others]
        order = np.argsort(dv)
        sidx = [others[i] for i in order]
        sd = dv[order]
        best = (np.inf, 0)
        for i in range(len(sd) - k + 1):
            r = sd[i + k - 1] - sd[i]
            if r < best[0]:
                best = (r, i)
        wins[v] = [sidx[best[1] + j] for j in range(k)]
    return wins


def norm_score(P, k):
    n = len(P)
    D = dist_matrix(P)
    diam = D.max()
    sides = np.array([D[i, (i + 1) % n] for i in range(n)])
    q = sides.min() ** 2 / diam
    worst = 0.0
    for v in range(n):
        others = [i for i in range(n) if i != v]
        dv = np.sort(D[v, others])
        rng = min(dv[i + k - 1] - dv[i] for i in range(len(dv) - k + 1))
        worst = max(worst, rng)
    return worst / q


# ---------------------------------------------------------------- (a)
print("=== (a) exact nonconvex solution of the 15-gon window system ===")
WINS15 = windows_of(P15, 4)


def resid15(x):
    Q = x.reshape(15, 2)
    r = []
    for v in range(15):
        mem = WINS15[v]
        d0 = np.linalg.norm(Q[v] - Q[mem[0]])
        for u in mem[1:]:
            r.append(np.linalg.norm(Q[v] - Q[u]) - d0)
    return np.array(r)


sol = least_squares(resid15, P15.reshape(-1))
Q = sol.x.reshape(15, 2)
D = dist_matrix(Q)
np.fill_diagonal(D, np.inf)
bad, crs = convex_violations(Q)
print(f"residual^2={sol.cost:.3e}  min pair dist={D.min():.5f}  "
      f"diam={D[D < np.inf].max():.5f}")
sides = [np.linalg.norm(Q[i] - Q[(i + 1) % 15]) for i in range(15)]
print(f"min side={min(sides):.5f}  convexity violations at vertices: {bad}")
print(f"cross products: " + " ".join(f"{c:+.3f}" for c in crs))
disp = np.linalg.norm(Q - P15, axis=1)
print(f"vertex displacement from start: max={disp.max():.4f} mean={disp.mean():.4f}")

# ---------------------------------------------------------------- (b)
print("\n=== (b) convexity-constrained polish floor (15-gon, k=4) ===")


def objective(x, beta=200.0):
    Q = x.reshape(15, 2)
    n = 15
    Dm = dist_matrix(Q)
    diam = Dm.max()
    sides = np.array([Dm[i, (i + 1) % n] for i in range(n)])
    q = sides.min() ** 2 / diam
    # smooth max of per-vertex window ranges
    rngs = []
    for v in range(n):
        others = [i for i in range(n) if i != v]
        dv = np.sort(Dm[v, others])
        rngs.append(min(dv[i + 3] - dv[i] for i in range(len(dv) - 3)))
    rngs = np.array(rngs) / q
    smax = np.log(np.exp(beta * (rngs - rngs.max())).sum()) / beta + rngs.max()
    # convexity hinge
    pen = 0.0
    for i in range(n):
        a, b, c = Q[i], Q[(i + 1) % n], Q[(i + 2) % n]
        cr = (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])
        pen += max(0.0, 0.001 - cr) ** 2   # require positive orientation margin
    return smax + 1e4 * pen


rng = np.random.default_rng(0)
best = (np.inf, None)
for trial in range(12):
    x0 = P15.reshape(-1) + (0 if trial == 0 else rng.normal(0, 0.02, 30))
    res = minimize(objective, x0, method="Nelder-Mead",
                   options={"maxiter": 20000, "xatol": 1e-10, "fatol": 1e-12})
    Qt = res.x.reshape(15, 2)
    badt, _ = convex_violations(Qt)
    s = norm_score(Qt, 4)
    if not badt and s < best[0]:
        best = (s, res.x)
    print(f"  trial {trial}: convex={not badt}  normalized score={s:.5f}")
print(f"convex-constrained floor reached: {best[0]:.5f}  (AlphaEvolve: 0.48898)")

# ---------------------------------------------------------------- (c)
print("\n=== (c) symmetry refinement ===")


def reflection_check(P, tol=1e-6):
    C = P.mean(0)
    Q = P - C
    n = len(P)
    hits = 0
    for i in range(n):
        # candidate axis through vertex i and centroid
        ax = Q[i] / np.linalg.norm(Q[i])
        M = np.array([[ax[0]**2 - ax[1]**2, 2*ax[0]*ax[1]],
                      [2*ax[0]*ax[1], ax[1]**2 - ax[0]**2]])
        QR = Q @ M.T
        ok = all(np.sqrt(((Q - q) ** 2).sum(1)).min() < tol * np.abs(Q).max()
                 for q in QR)
        if ok:
            hits += 1
    return hits


print(f"9-gon reflections through vertices: {reflection_check(P9)}  "
      f"(0 => pure C3, no dihedral)")

# 15-gon deviation from exact C3: distance between P and rotated-by-5 P
C = P15.mean(0)
Q0 = P15 - C
th = 2 * np.pi / 3
R = np.array([[np.cos(th), -np.sin(th)], [np.sin(th), np.cos(th)]])
QR = Q0 @ R.T
# best index alignment: shift by 5
dev = [np.linalg.norm(QR[v] - Q0[(v + 5) % 15]) for v in range(15)]
scale = np.abs(Q0).max()
print(f"15-gon C3 deviation |R x_v - x_(v+5)| / scale: "
      f"max={max(dev)/scale:.4g} mean={np.mean(dev)/scale:.4g}")

# does exact C3 symmetrization make the score better or worse?
sym = np.zeros((15, 2))
R2 = R @ R
for v in range(15):
    sym[v] = (Q0[v] + (R.T @ Q0[(v + 5) % 15]) + (R2.T @ Q0[(v + 10) % 15])) / 3
badS, _ = convex_violations(sym)
print(f"C3-symmetrized 15-gon: convex={not badS}  score={norm_score(sym, 4):.5f} "
      f"(unsymmetrized 0.48898)")

# ---------------------------------------------------------------- (d)
print("\n=== (d) D5 all-axes ansatz, n=15: exhaustive pairing-type solve ===")
# 3 orbits, generator g_o at signed radius t_o on axis angle 0; orbit points:
# rotate by 72 deg. Vertex v0 = generator of orbit 0 on axis theta=0.
# Available mirror pairs w.r.t. axis 0, as seen from a point on axis 0:
#   own orbit o: pairs (R^1, R^4) radius-class A1(o), (R^2, R^3) class A2(o)
#   other orbit p: pairs (R^1 g_p, R^4 g_p) etc., plus the on-axis point g_p.
# A window = two pairs with equal radius (1 equation per orbit).


def orbit_points(t):
    # generators on axis theta=0 at signed distances t[o]; full 15 points
    pts = []
    for o in range(3):
        g = np.array([t[o], 0.0])
        for j in range(5):
            th = 2 * np.pi * j / 5
            Rj = np.array([[np.cos(th), -np.sin(th)], [np.sin(th), np.cos(th)]])
            pts.append(Rj @ g)
    return np.array(pts)


def pair_radius(t, o_view, pair):
    # radius from generator of orbit o_view (on axis 0, at (t[o_view],0))
    # pair = (orbit p, rotation power j) meaning points R^{+-j} g_p  (j=1 or 2)
    p, j = pair
    v = np.array([t[o_view], 0.0])
    th = 2 * np.pi * j / 5
    Rj = np.array([[np.cos(th), -np.sin(th)], [np.sin(th), np.cos(th)]])
    u = Rj @ np.array([t[p], 0.0])
    return np.linalg.norm(v - u)


# pair options per viewing orbit: (p, j) for p in 0..2, j in 1..2  (p==o_view is own)
PAIR_OPTS = [(p, j) for p in range(3) for j in (1, 2)]
combos_per_orbit = list(itertools.combinations(PAIR_OPTS, 2))
print(f"pairing choices per orbit: {len(combos_per_orbit)}; "
      f"total types {len(combos_per_orbit)**3}")

found = []
rng = np.random.default_rng(1)
for c0 in combos_per_orbit:
    for c1 in combos_per_orbit:
        for c2 in combos_per_orbit:
            choice = (c0, c1, c2)

            def resid(t, choice=choice):
                r = []
                for o in range(3):
                    (pa, pb) = choice[o]
                    r.append(pair_radius(t, o, pa) - pair_radius(t, o, pb))
                # gauge: fix scale
                r.append(np.abs(t).sum() - 3.0)
                return np.array(r)

            ok = False
            for trial in range(3):
                t0 = rng.normal(0, 1, 3) * 1.2
                s = least_squares(resid, t0)
                if s.cost < 1e-18:
                    t = s.x
                    pts = orbit_points(t)
                    Dm = dist_matrix(pts)
                    np.fill_diagonal(Dm, np.inf)
                    if Dm.min() < 1e-3:
                        continue  # coincident points
                    # order points angularly and test convex position
                    Cc = pts.mean(0)
                    ang = np.arctan2(pts[:, 1] - Cc[1], pts[:, 0] - Cc[0])
                    order = np.argsort(ang)
                    hull = pts[order]
                    badh, _ = convex_violations(hull)
                    # verify true 4-window score on ordered polygon
                    sc = norm_score(hull, 4) if not badh else np.inf
                    found.append((s.cost, choice, t.copy(), len(badh), sc))
                    ok = True
                    break

found.sort(key=lambda z: (z[3], z[4]))
print(f"exact metric solutions found: {len(found)}")
for cost, choice, t, nbad, sc in found[:10]:
    print(f"  choice={choice} t={np.round(t,4)} convex_violations={nbad} "
          f"score_if_convex={sc if sc < np.inf else 'n/a'}")
