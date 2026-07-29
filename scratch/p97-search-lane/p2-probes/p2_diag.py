import numpy as np

# C2 normalized frame: z=(0,0), u=(1,0), CCW hull order (x,y,z,w,v,u),
# forced: x,y strictly above axis; w,v strictly below.
# x = u + e(pi - A) = (1-cosA, sinA), A in (0,pi)
# w = e(-B) = (cosB, -sinB),          B in (0,pi)
# v = x + e(g)  (must be below axis)
# y = w + e(h)  (must be above axis)
# feasibility = all 24 supporting-line crosses > 0 for cycle (x,y,z,w,v,u)
# diagnostic: maximize min over the 24 crosses AND the two half-plane margins
# (y_y, -v_y). Report the global max and blocking constraints.

names = ["x", "y", "z", "w", "v", "u"]

def pts(A, B, g, h):
    x = np.array([1 - np.cos(A), np.sin(A)])
    w = np.array([np.cos(B), -np.sin(B)])
    v = x + np.array([np.cos(g), np.sin(g)])
    y = w + np.array([np.cos(h), np.sin(h)])
    z = np.array([0.0, 0.0]); u = np.array([1.0, 0.0])
    return dict(x=x, y=y, z=z, w=w, v=v, u=u)

def margins(A, B, g, h):
    P = pts(A, B, g, h)
    seq = [P[n] for n in ["x", "y", "z", "w", "v", "u"]]
    out = []
    for i in range(6):
        a = seq[i]; b = seq[(i + 1) % 6]; E = b - a
        for j in range(6):
            if j in (i, (i + 1) % 6):
                continue
            p = seq[j]
            cr = E[0] * (p[1] - a[1]) - E[1] * (p[0] - a[0])
            out.append(((names[i], names[(i + 1) % 6], names[j]), cr))
    out.append((("halfplane", "y", "above"), P["y"][1]))
    out.append((("halfplane", "v", "below"), -P["v"][1]))
    return out

def minmargin(theta):
    A, B, g, h = theta
    if not (1e-6 < A < np.pi - 1e-6 and 1e-6 < B < np.pi - 1e-6):
        return -10.0
    return min(m for _, m in margins(A, B, g, h))

# coarse grid
NA = 60; NG = 90
As = np.linspace(0.02, np.pi - 0.02, NA)
Gs = np.linspace(-np.pi, np.pi, NG, endpoint=False)
best = (-10, None)
for A in As:
    for B in As:
        for g in Gs:
            for h in Gs:
                m = minmargin((A, B, g, h))
                if m > best[0]:
                    best = (m, (A, B, g, h))
print("coarse best min-margin:", best[0], "at", best[1])

# refine with Nelder-Mead if scipy available, else random walk
try:
    from scipy.optimize import minimize
    res = minimize(lambda t: -minmargin(t), best[1], method="Nelder-Mead",
                   options=dict(xatol=1e-10, fatol=1e-12, maxiter=20000, maxfev=40000))
    print("refined best min-margin:", -res.fun, "at", res.x)
    theta = res.x
except Exception as e:
    print("scipy unavailable:", e)
    theta = np.array(best[1])
    step = 0.1
    rng = np.random.default_rng(0)
    cur = minmargin(theta)
    for it in range(200000):
        cand = theta + rng.normal(scale=step, size=4)
        m = minmargin(cand)
        if m > cur:
            theta, cur = cand, m
        if it % 40000 == 39999:
            step *= 0.5
    print("refined best min-margin:", cur, "at", theta)

# blocking analysis at optimum
A, B, g, h = theta
ms = margins(A, B, g, h)
ms.sort(key=lambda t: t[1])
print("\nworst 8 constraints at optimum:")
for k, m in ms[:8]:
    print("   ", k, round(m, 6))
P = pts(A, B, g, h)
print("\npoints:", {k: np.round(v2, 4).tolist() for k, v2 in P.items()})
