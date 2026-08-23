"""Structural pattern analysis of AlphaEvolve Erdos-97 artifacts.

Configurations: myarr1-3 (cheat/cluster constructions), myarr4 (best honest
15-gon for the 4-equidistant case), nine (exact C3 9-gon for 3-equidistant).
"""
import numpy as np
import itertools

np_float64 = np.float64

ns = {"np": np}
with open("alphaevolve_configs.txt") as f:
    for line in f:
        line = line.strip()
        if line:
            exec(line, ns)

POLYS = {
    "myarr1_cheat20": (ns["myarr1"], 4),
    "myarr2_cheat20": (ns["myarr2"], 4),
    "myarr3_cheat35": (ns["myarr3"], 4),
    "myarr4_best15": (ns["myarr4"], 4),
    "nine_exact3": (ns["points"], 3),
}


def dist_matrix(P):
    diff = P[:, None, :] - P[None, :, :]
    return np.sqrt((diff ** 2).sum(-1))


def is_convex(P):
    n = len(P)
    signs = []
    for i in range(n):
        a, b, c = P[i], P[(i + 1) % n], P[(i + 2) % n]
        cr = (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])
        signs.append(np.sign(cr))
    return all(s == signs[0] for s in signs)


def best_window(dists_sorted_idx, dists_sorted, k):
    best = (np.inf, None)
    for i in range(len(dists_sorted) - k + 1):
        rng = dists_sorted[i + k - 1] - dists_sorted[i]
        if rng < best[0]:
            best = (rng, i)
    i = best[1]
    return best[0], dists_sorted_idx[i:i + k], dists_sorted[i:i + k]


def symmetry_group(P, tol=1e-4):
    """Return rotation orders m (about centroid) mapping vertex set to itself."""
    C = P.mean(0)
    Q = P - C
    n = len(P)
    found = []
    for m in range(2, n + 1):
        th = 2 * np.pi / m
        R = np.array([[np.cos(th), -np.sin(th)], [np.sin(th), np.cos(th)]])
        QR = Q @ R.T
        # match each rotated point to nearest original
        ok = True
        for q in QR:
            d = np.sqrt(((Q - q) ** 2).sum(1)).min()
            if d > tol * np.abs(Q).max():
                ok = False
                break
        if ok:
            found.append(m)
    return found


def cluster_multiset(vals, reltol):
    """Greedy 1-d clustering of the distance multiset; return sizes of clusters."""
    vals = np.sort(vals)
    scale = vals.mean()
    groups = []
    cur = [vals[0]]
    for v in vals[1:]:
        if v - cur[-1] <= reltol * scale:
            cur.append(v)
        else:
            groups.append(cur)
            cur = [v]
    groups.append(cur)
    return sorted((len(g) for g in groups), reverse=True), len(groups)


def modes(seq):
    """Count local maxima of a linear sequence (distance profile from v)."""
    m = 0
    for i in range(1, len(seq) - 1):
        if seq[i] > seq[i - 1] and seq[i] > seq[i + 1]:
            m += 1
    # endpoints
    if len(seq) >= 2 and seq[0] > seq[1]:
        m += 1
    if len(seq) >= 2 and seq[-1] > seq[-2]:
        m += 1
    return m


def analyze(name, pts, k):
    P = np.array(pts, dtype=float)
    n = len(P)
    D = dist_matrix(P)
    diam = D.max()
    sides = np.array([D[i, (i + 1) % n] for i in range(n)])
    min_side = sides.min()
    q = min_side ** 2 / diam
    print(f"\n=== {name}  n={n}  k={k} ===")
    print(f"convex={is_convex(P)}  diam={diam:.6f}  min_side={min_side:.6f}  "
          f"norm q=s^2/D={q:.6f}")
    print(f"rot symmetries (orders): {symmetry_group(P)}")

    windows = {}
    errs = np.zeros(n)
    radii = np.zeros(n)
    for v in range(n):
        others = [i for i in range(n) if i != v]
        dv = D[v, others]
        order = np.argsort(dv)
        sidx = [others[i] for i in order]
        sd = dv[order]
        rng, members, wd = best_window(sidx, sd, k)
        windows[v] = list(members)
        errs[v] = rng
        radii[v] = wd.mean()

    nerr = errs / q
    print(f"per-vertex normalized err  max={nerr.max():.4g}  min={nerr.min():.4g}  "
          f"mean={nerr.mean():.4g}  std={nerr.std():.4g}")
    print("normalized err by vertex: " +
          " ".join(f"{e:.3g}" for e in nerr))
    print("radius r(v)/diam by vertex: " +
          " ".join(f"{r/diam:.3f}" for r in radii))

    # combinatorial offsets of chosen window members
    offs = []
    for v in range(n):
        o = sorted(((u - v) % n) for u in windows[v])
        offs.append(o)
    print("window offsets per vertex:")
    for v in range(n):
        print(f"  v{v:2d}: {offs[v]}  r={radii[v]:.4f}  err_n={nerr[v]:.3g}")

    # reciprocity and load
    recip = sum(1 for v in range(n) for u in windows[v] if v in windows[u])
    load = np.zeros(n, dtype=int)
    for v in range(n):
        for u in windows[v]:
            load[u] += 1
    print(f"directed incidences={k*n}  reciprocated={recip}  "
          f"load(min/max/mean)={load.min()}/{load.max()}/{load.mean():.2f}")
    print("load by vertex: " + " ".join(str(x) for x in load))

    # common-radius check across vertices
    rspread = (radii.max() - radii.min()) / radii.mean()
    print(f"r(v) spread across vertices: {rspread:.4g} (0 => single global radius)")

    # distance multiset multiplicity structure
    pair_d = D[np.triu_indices(n, 1)]
    sizes, ngroups = cluster_multiset(pair_d, 1e-3)
    print(f"distance multiset: {len(pair_d)} pairs -> {ngroups} clusters @1e-3; "
          f"top sizes {sizes[:8]}")

    # distance-profile modes per vertex (circle-crossing structure)
    mode_counts = []
    for v in range(n):
        seq = [D[v, (v + j) % n] for j in range(1, n)]
        mode_counts.append(modes(seq))
    print(f"distance-profile local-max count per vertex: {mode_counts}")

    # worst vertex geometry
    w = int(np.argmax(nerr))
    dm_pair = np.unravel_index(np.argmax(D), D.shape)
    ms_i = int(np.argmin(sides))
    print(f"worst vertex v{w}; diameter pair {dm_pair}; min side ({ms_i},{(ms_i+1)%n})")
    return P, windows, errs, q


def jacobian_rank(P, windows, k, label):
    """Rank of the equidistance constraint Jacobian at P (fixed combinatorics)."""
    n = len(P)
    m = (k - 1) * n

    def resid(x):
        Q = x.reshape(n, 2)
        r = []
        for v in range(n):
            mem = windows[v]
            d0 = np.linalg.norm(Q[v] - Q[mem[0]])
            for u in mem[1:]:
                r.append(np.linalg.norm(Q[v] - Q[u]) - d0)
        return np.array(r)

    x0 = P.reshape(-1)
    f0 = resid(x0)
    eps = 1e-7 * max(1.0, np.abs(x0).max())
    J = np.zeros((m, 2 * n))
    for j in range(2 * n):
        xp = x0.copy()
        xp[j] += eps
        J[:, j] = (resid(xp) - f0) / eps
    sv = np.linalg.svd(J, compute_uv=False)
    # similarity group: translations(2)+rotation(1)+scaling(1) act trivially
    thresh = sv.max() * 1e-8
    rank = int((sv > thresh).sum())
    dof = 2 * n - 4
    print(f"[{label}] constraints={m}  unknowns={2*n}  dof mod similarity={dof}  "
          f"Jacobian rank={rank}  nullity={2*n-rank} (>=4 trivial)")
    print(f"  smallest 8 singular values: "
          + " ".join(f"{s:.2e}" for s in sv[-8:]))
    print(f"  => constraint deficiency (naive m - rank) = {m - rank};  "
          f"local solution-manifold dim beyond similarity = {2*n - rank - 4}")
    return resid


def polish(P, k, label, iters=400):
    """Least-squares polish with window re-selection each round."""
    from scipy.optimize import least_squares
    n = len(P)
    x = P.reshape(-1).copy()

    def select(Q):
        Dm = dist_matrix(Q)
        wins = {}
        for v in range(n):
            others = [i for i in range(n) if i != v]
            dv = Dm[v, others]
            order = np.argsort(dv)
            sidx = [others[i] for i in order]
            sd = dv[order]
            _, mem, _ = best_window(sidx, sd, k)
            wins[v] = list(mem)
        return wins

    def score(Q):
        Dm = dist_matrix(Q)
        diam = Dm.max()
        sides = np.array([Dm[i, (i + 1) % n] for i in range(n)])
        qn = sides.min() ** 2 / diam
        worst = 0.0
        for v in range(n):
            others = [i for i in range(n) if i != v]
            dv = np.sort(Dm[v, others])
            rng = min(dv[i + k - 1] - dv[i] for i in range(len(dv) - k + 1))
            worst = max(worst, rng)
        return worst / qn

    prev = None
    for it in range(6):
        Q = x.reshape(n, 2)
        wins = select(Q)

        def resid(xx, wins=wins):
            QQ = xx.reshape(n, 2)
            r = []
            for v in range(n):
                mem = wins[v]
                d0 = np.linalg.norm(QQ[v] - QQ[mem[0]])
                for u in mem[1:]:
                    r.append(np.linalg.norm(QQ[v] - QQ[u]) - d0)
            # soft anti-collapse: pin diameter to its current value
            return np.array(r)

        sol = least_squares(resid, x, max_nfev=iters)
        x = sol.x
        s = score(x.reshape(n, 2))
        Q = x.reshape(n, 2)
        print(f"[{label}] round {it}: residual^2={sol.cost:.3e}  "
              f"normalized score={s:.4g}  convex={is_convex(Q)}")
        if prev is not None and abs(prev - s) < 1e-12:
            break
        prev = s
    return x.reshape(n, 2)


for name, (pts, k) in POLYS.items():
    P, wins, errs, q = analyze(name, pts, k)
    if name in ("myarr4_best15", "nine_exact3"):
        jacobian_rank(P, wins, k, name)

print("\n=== POLISH PROBE: can the 15-gon be pushed to a 4-equidistant CE? ===")
P15 = np.array(POLYS["myarr4_best15"][0], dtype=float)
polish(P15, 4, "polish15")
