import numpy as np

# P2 variant A: rows x,y,z (r1<r2<r3), cols u,v,w (c1<c2<c3)
# unit pairs: xu, xv, yw, zu, zw  (delta = 1)
# gauge: z=(0,0), u=(1,0); w on C(z,1); x on C(u,1); v on C(x,1); y on C(w,1)
# C1 cyclic order: (x,y,z,u,v,w)   [both arcs along same traversal]
# C2 cyclic order: (x,y,z,w,v,u)   [arcs along opposite traversals]
# accept either orientation (CW hit = mirror = variant B, equivalent family)

N = 180
th = (np.arange(N) + 0.5) * 2*np.pi / N   # offset to dodge exact degeneracies
z = np.array([0.0, 0.0]); u = np.array([1.0, 0.0])

def cross(o, p, q):
    return (p[0]-o[0])*(q[1]-o[1]) - (p[1]-o[1])*(q[0]-o[0])

hits = {"C1": [], "C2": []}
TOL = 1e-9

cosT, sinT = np.cos(th), np.sin(th)

for ia in range(N):
    w = np.array([cosT[ia], sinT[ia]])
    yx = w[0] + cosT; yy = w[1] + sinT            # y over d-grid
    for ib in range(N):
        x = np.array([1.0 + cosT[ib], sinT[ib]])
        vx = x[0] + cosT; vy = x[1] + sinT        # v over c-grid

        # ---- C1: cycle (x,y,z,u,v,w) ----
        # crosses depending on d (at y, z, x):
        cy = (yx - x[0])*(0 - yy) - (yy - x[1])*(0 - yx)                 # at y: (y-x) x (z-y)
        cz = (0 - yx)*(0 - 0) - (0 - yy)*(1 - 0)                          # at z: (z-y) x (u-z)
        cx = (x[0] - w[0])*(yy - x[1]) - (x[1] - w[1])*(yx - x[0])        # at x: (x-w) x (y-x)
        d_pos = (cy > TOL) & (cz > TOL) & (cx > TOL)
        d_neg = (cy < -TOL) & (cz < -TOL) & (cx < -TOL)
        # crosses depending on c (at u, v, w):
        cu = (1 - 0)*(vy - 0) - (0 - 0)*(vx - 1)                          # at u: (u-z) x (v-u)
        cv = (vx - 1)*(w[1] - vy) - (vy - 0)*(w[0] - vx)                  # at v: (v-u) x (w-v)
        cw = (w[0] - vx)*(x[1] - w[1]) - (w[1] - vy)*(x[0] - w[0])        # at w: (w-v) x (x-w)
        c_pos = (cu > TOL) & (cv > TOL) & (cw > TOL)
        c_neg = (cu < -TOL) & (cv < -TOL) & (cw < -TOL)
        if (d_pos.any() and c_pos.any()) or (d_neg.any() and c_neg.any()):
            for sgn, dm, cm in ((1, d_pos, c_pos), (-1, d_neg, c_neg)):
                if dm.any() and cm.any():
                    for idd in np.nonzero(dm)[0]:
                        for icc in np.nonzero(cm)[0]:
                            hits["C1"].append((ia, ib, icc, idd, sgn))

        # ---- C2: cycle (x,y,z,w,v,u) ----
        cy2 = (yx - x[0])*(0 - yy) - (yy - x[1])*(0 - yx)                 # at y: (y-x) x (z-y)
        cz2 = (0 - yx)*(w[1] - 0) - (0 - yy)*(w[0] - 0)                   # at z: (z-y) x (w-z)
        cx2 = (x[0] - 1)*(yy - x[1]) - (x[1] - 0)*(yx - x[0])             # at x: (x-u) x (y-x)
        d_pos2 = (cy2 > TOL) & (cz2 > TOL) & (cx2 > TOL)
        d_neg2 = (cy2 < -TOL) & (cz2 < -TOL) & (cx2 < -TOL)
        cw2 = (w[0] - 0)*(vy - w[1]) - (w[1] - 0)*(vx - w[0])             # at w: (w-z) x (v-w)
        cv2 = (vx - w[0])*(0 - vy) - (vy - w[1])*(1 - vx)                 # at v: (v-w) x (u-v)
        cu2 = (1 - vx)*(x[1] - 0) - (0 - vy)*(x[0] - 1)                   # at u: (u-v) x (x-u)
        c_pos2 = (cw2 > TOL) & (cv2 > TOL) & (cu2 > TOL)
        c_neg2 = (cw2 < -TOL) & (cv2 < -TOL) & (cu2 < -TOL)
        if (d_pos2.any() and c_pos2.any()) or (d_neg2.any() and c_neg2.any()):
            for sgn, dm, cm in ((1, d_pos2, c_pos2), (-1, d_neg2, c_neg2)):
                if dm.any() and cm.any():
                    for idd in np.nonzero(dm)[0]:
                        for icc in np.nonzero(cm)[0]:
                            hits["C2"].append((ia, ib, icc, idd, sgn))

for k in ("C1", "C2"):
    print(k, "raw grid hits:", len(hits[k]))
    if hits[k]:
        # print a few sample witnesses with margins
        for rec in hits[k][:5]:
            ia, ib, icc, idd, sgn = rec
            w = np.array([cosT[ia], sinT[ia]])
            x = np.array([1.0 + cosT[ib], sinT[ib]])
            v = x + np.array([cosT[icc], sinT[icc]])
            y = w + np.array([cosT[idd], sinT[idd]])
            pts = dict(x=x, y=y, z=z, u=u, v=v, w=w)
            print("  sgn", sgn, {kk: np.round(vv, 4).tolist() for kk, vv in pts.items()})
np.save("/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/5dfab928-f645-438d-8e17-30fae9784b75/scratchpad/p2_hits.npy",
        np.array(hits["C1"] + [(-1,)*5] + hits["C2"], dtype=float) if (hits["C1"] or hits["C2"]) else np.zeros((0,5)))
