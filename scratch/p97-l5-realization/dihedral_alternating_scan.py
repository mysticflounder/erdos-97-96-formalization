"""Scan alternating-radius 2k-gons (dihedral D_k, orbits A on even rays radius 1, B on odd rays radius rho)
for the property: every vertex has >= 4 other vertices at a common distance.
For k odd both orbits' partners come in mirror pairs; for k even the antipode is single (handled by brute force below).
Brute force: for each k, solve candidate rho from any equal-distance coincidence at an A vertex, then check all vertices exactly."""
import numpy as np, itertools, sys

def verts(k, rho):
    pts = []
    for j in range(k):
        pts.append((1.0*np.cos(2*np.pi*j/k), 1.0*np.sin(2*np.pi*j/k)))
        pts.append((rho*np.cos((2*j+1)*np.pi/k), rho*np.sin((2*j+1)*np.pi/k)))
    return np.array(pts)

def maxclass(P, i, tol=1e-9):
    d = np.linalg.norm(P - P[i], axis=1); d[i] = np.nan
    ds = np.sort(d[~np.isnan(d)])
    best = cnt = 1
    for a in range(1, len(ds)):
        cnt = cnt + 1 if abs(ds[a] - ds[a-1]) < tol else 1
        best = max(best, cnt)
    return best

def convex(P):
    n = len(P)
    for i in range(n):
        a, b, c = P[i-1], P[i], P[(i+1) % n]
        if (b[0]-a[0])*(c[1]-b[1]) - (b[1]-a[1])*(c[0]-b[0]) <= 1e-12:
            return False
    return True

found = []
for k in range(3, 61):
    # candidate rho values: A-vertex at (1,0): distances to A-partners: 2 sin(pi j/k) (j=1..k-1), to B-partners: sqrt(1+rho^2-2 rho cos((2j+1)pi/k))
    cands = set()
    for j in range(1, k):
        for jp in range(k):
            th = (2*jp+1)*np.pi/k
            s2 = 4*np.sin(np.pi*j/k)**2
            disc = np.cos(th)**2 - 1 + s2
            if disc < 0: continue
            for r in (np.cos(th) + np.sqrt(disc), np.cos(th) - np.sqrt(disc)):
                if r > 0: cands.add(round(r, 12))
    # also B-partner = B-partner coincidences at A vertex are impossible generically; and pairs of B-orbit distances at B vertex: 2 rho sin(pi m/k) = D  -> same rho candidates by symmetry (rho -> 1/rho scaling). add reciprocal candidates
    cands |= {round(1/r, 12) for r in list(cands) if r > 0}
    for r in sorted(cands):
        if not (np.cos(np.pi/k) < r < 1/np.cos(np.pi/k)): continue
        P = verts(k, r)
        if not convex(P): continue
        mA = maxclass(P, 0); mB = maxclass(P, 1)
        if mA >= 4 and mB >= 4:
            found.append((k, r, mA, mB))
            print("FOUND", k, r, mA, mB, flush=True)
        elif mA >= 4 or mB >= 4:
            pass
print("done; found", len(found))
