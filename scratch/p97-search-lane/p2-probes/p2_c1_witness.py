import numpy as np

# C1 witness polish: hull cyclic order (x,y,z,u,v,w), units xu,xv,yw,zu,zw.
# gauge z=(0,0), u=(1,0); w=e(a); x=u+e(b); v=x+e(c); y=w+e(d).
# min-margin = min over 24 supporting crosses with uniform orientation sign.

names = ["x", "y", "z", "u", "v", "w"]

def pts(a, b, c, d):
    z = np.array([0.0, 0.0]); u = np.array([1.0, 0.0])
    w = np.array([np.cos(a), np.sin(a)])
    x = u + np.array([np.cos(b), np.sin(b)])
    v = x + np.array([np.cos(c), np.sin(c)])
    y = w + np.array([np.cos(d), np.sin(d)])
    return dict(x=x, y=y, z=z, u=u, v=v, w=w)

def crosses(theta):
    P = pts(*theta)
    seq = [P[n] for n in names]
    out = []
    for i in range(6):
        A = seq[i]; Bp = seq[(i+1) % 6]; E = Bp - A
        for j in range(6):
            if j in (i, (i+1) % 6):
                continue
            p = seq[j]
            out.append(E[0]*(p[1]-A[1]) - E[1]*(p[0]-A[0]))
    return np.array(out)

def minmargin(theta):
    c = crosses(theta)
    return max(c.min(), (-c).min())   # uniform sign either way

# start near probe hit region: a~5.1deg, b~137deg, c~322deg, d~146deg
t0 = np.radians([5.1, 137.0, 322.0, 146.0])
from scipy.optimize import minimize
res = minimize(lambda t: -minmargin(t), t0, method="Nelder-Mead",
               options=dict(xatol=1e-12, fatol=1e-14, maxiter=40000, maxfev=80000))
topt = res.x
print("max min-margin:", -res.fun, "at degrees:", np.degrees(topt) % 360)

# try nice angle grids inside the region
best_nice = None
for denom in (12, 10, 9, 8, 6, 5):   # multiples of pi/denom = 15,18,20,22.5,30,36 deg
    step = np.pi / denom
    base = np.round(topt / step).astype(int)
    for da in range(-2, 3):
        for db in range(-2, 3):
            for dc in range(-2, 3):
                for dd in range(-2, 3):
                    t = (base + np.array([da, db, dc, dd])) * step
                    m = minmargin(t)
                    if m > 0.01 and (best_nice is None or denom < best_nice[0] or
                                     (denom == best_nice[0] and m > best_nice[1])):
                        best_nice = (denom, m, (base + np.array([da, db, dc, dd])) % (2*denom))
    if best_nice and best_nice[0] == denom:
        print("nice witness: angles = pi/%d * %s  margin %.4f" %
              (denom, best_nice[2].tolist(), best_nice[1]))
print("best nice:", best_nice)
if best_nice:
    denom, m, ks = best_nice
    t = ks * np.pi / denom
    P = pts(*t)
    print("points:", {k: np.round(v, 6).tolist() for k, v in P.items()})
    # distances check
    import itertools
    for pair in (("x","u"),("x","v"),("y","w"),("z","u"),("z","w")):
        p, q = P[pair[0]], P[pair[1]]
        print("  |%s%s| = %.12f" % (pair[0], pair[1], np.hypot(*(p-q))))
    # orientation: uniform sign of crosses
    c = crosses(t)
    print("  all crosses same sign:", (c > 0).all() or (c < 0).all(),
          " sign:", "+CCW" if (c > 0).all() else "-CW", " min|cross|:", np.abs(c).min())
