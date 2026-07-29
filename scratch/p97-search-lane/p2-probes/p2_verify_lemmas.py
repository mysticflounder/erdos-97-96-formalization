import numpy as np

# Validate the two proof lemmas by random sampling.
# Frame: z=(0,0), u=(1,0); x=(1-cosA, sinA) above (A in (0,pi));
# w=(cosB,-sinB) below (B in (0,pi)); v=x+e(g); y=w+e(h).
# Unit distances by construction: zu, zw, xu, xv, yw.
#
# Lemma U (u-side): IF x above, w below, and the two edge-support conditions
#   at u hold — all of {x,y,z,w} strictly on one side of line(v,u), and all
#   of {y,z,w,v} strictly on one side of line(u,x) — THEN B > 2A.
# Lemma Z (z-side): IF x above, w below, and edge-supports at z hold —
#   all of {x,w,v,u} strictly one side of line(y,z), all of {x,y,v,u}
#   strictly one side of line(z,w) — THEN A > 2B.
# Also count joint satisfaction (expect 0).

rng = np.random.default_rng(7)
M = 4_000_000
A = rng.uniform(1e-3, np.pi - 1e-3, M)
B = rng.uniform(1e-3, np.pi - 1e-3, M)
g = rng.uniform(-np.pi, np.pi, M)
h = rng.uniform(-np.pi, np.pi, M)

xx = 1 - np.cos(A); xy = np.sin(A)
wx = np.cos(B);     wy = -np.sin(B)
vx = xx + np.cos(g); vy = xy + np.sin(g)
yx = wx + np.cos(h); yy = wy + np.sin(h)
zx = np.zeros(M); zy = np.zeros(M)
ux = np.ones(M);  uy = np.zeros(M)

def side(ax, ay, bx, by, px, py):
    return (bx-ax)*(py-ay) - (by-ay)*(px-ax)

def oneside(ax, ay, bx, by, pts, tol=1e-12):
    crs = [side(ax, ay, bx, by, px, py) for (px, py) in pts]
    allpos = np.ones(M, bool); allneg = np.ones(M, bool)
    for c in crs:
        allpos &= (c > tol); allneg &= (c < -tol)
    return allpos | allneg

# edge-support at u: edges (v,u) and (u,x)
su1 = oneside(vx, vy, ux, uy, [(xx,xy),(yx,yy),(zx,zy),(wx,wy)])
su2 = oneside(ux, uy, xx, xy, [(yx,yy),(zx,zy),(wx,wy),(vx,vy)])
CU = su1 & su2          # x above, w below already enforced by parametrization
# edge-support at z: edges (y,z) and (z,w)
sz1 = oneside(yx, yy, zx, zy, [(xx,xy),(wx,wy),(vx,vy),(ux,uy)])
sz2 = oneside(zx, zy, wx, wy, [(xx,xy),(yx,yy),(vx,vy),(ux,uy)])
CZ = sz1 & sz2

nu = int(CU.sum()); nz = int(CZ.sum()); nj = int((CU & CZ).sum())
print("samples satisfying edge-supports at u:", nu)
print("  of those, violations of B > 2A:", int((CU & ~(B > 2*A)).sum()))
if nu:
    print("  min (B - 2A) over CU samples:", float((B - 2*A)[CU].min()))
print("samples satisfying edge-supports at z:", nz)
print("  of those, violations of A > 2B:", int((CZ & ~(A > 2*B)).sum()))
if nz:
    print("  min (A - 2B) over CZ samples:", float((A - 2*B)[CZ].min()))
print("samples satisfying BOTH:", nj)

# Also validate the two sub-lemmas directly:
# (i) interior angle at u (= angle vux) < pi/2 whenever |xu|=|xv|=1, no collinear:
ang_vux = np.arccos(np.clip(((vx-ux)*(xx-ux)+(vy-uy)*(xy-uy)) /
                            (np.hypot(vx-ux, vy-uy)*np.hypot(xx-ux, xy-uy)), -1, 1))
print("max angle(vux) over CU samples (rad, expect < pi/2):",
      float(ang_vux[CU].max()) if nu else None, " pi/2 =", np.pi/2)
# (ii) angle xuw < angle xuv over CU samples:
ang_xuw = np.arccos(np.clip(((xx-ux)*(wx-ux)+(xy-uy)*(wy-uy)) /
                            (np.hypot(xx-ux, xy-uy)*np.hypot(wx-ux, wy-uy)), -1, 1))
if nu:
    print("max (angle_xuw - angle_vux) over CU (expect < 0):",
          float((ang_xuw - ang_vux)[CU].max()))
