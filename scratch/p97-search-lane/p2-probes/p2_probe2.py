import numpy as np

# P2 variant A unit pairs: xu, xv, yw, zu, zw ; delta = 1
# gauge z=(0,0), u=(1,0); w=z+e(a); x=u+e(b); v=x+e(c); y=w+e(d)
# C1 cycle (x,y,z,u,v,w); C2 cycle (x,y,z,w,v,u)
# CORRECT predicate: for the cyclic sequence P0..P5, every directed edge
# (Pi,Pi+1) has all 4 remaining vertices strictly on the same side, with a
# uniform global sign (+1 => CCW convex hexagon in that vertex order).
# Accept either global sign (mirror = other variant of the same family).

N = 96
th = (np.arange(N) + 0.37) * 2*np.pi / N
cosT, sinT = np.cos(th), np.sin(th)

# meshgrid over (c,d) once
C, D = np.meshgrid(np.arange(N), np.arange(N), indexing="ij")
ec = np.stack([cosT[C], sinT[C]], axis=-1)   # (N,N,2) unit vec for v
ed = np.stack([cosT[D], sinT[D]], axis=-1)   # for y

def edge_test(seq_pts):
    # seq_pts: list of 6 arrays broadcastable to (N,N,2)
    # returns (all_pos, all_neg) boolean arrays over the (c,d) grid
    TOL = 1e-7
    pos = None; neg = None
    for i in range(6):
        A = seq_pts[i]; B = seq_pts[(i+1) % 6]
        E = B - A
        for j in range(6):
            if j == i or j == (i+1) % 6:
                continue
            P = seq_pts[j]
            cr = E[..., 0]*(P[..., 1]-A[..., 1]) - E[..., 1]*(P[..., 0]-A[..., 0])
            p = cr > TOL; n = cr < -TOL
            pos = p if pos is None else (pos & p)
            neg = n if neg is None else (neg & n)
            if pos is not None and not pos.any() and not neg.any():
                return pos, neg
    return pos, neg

zpt = np.zeros((1, 1, 2)); upt = np.zeros((1, 1, 2)); upt = upt + np.array([1.0, 0.0])

best = {"C1": None, "C2": None}
count = {"C1": 0, "C2": 0}
samples = {"C1": [], "C2": []}

for ia in range(N):
    wv = np.array([cosT[ia], sinT[ia]])
    wpt = np.broadcast_to(wv, (1, 1, 2))
    ypt = (wv + ed)[None, ...] if False else (wv + ed)  # (N,N,2) over d... need c,d grid shape
    # ed has shape (N,N,2) indexed [c,d]; y depends on d only -> fine, use full grid arrays
    ygrid = wv + ed          # (N,N,2), varies along d axis only? ed[c,d] = e(c_th? ) careful:
    # ec[c,d] = e(th[c]) (varies along axis 0), ed[c,d] = e(th[d]) (varies along axis 1)
    for ib in range(N):
        xv = np.array([1.0 + cosT[ib], sinT[ib]])
        xpt = np.broadcast_to(xv, (N, N, 2))
        vgrid = xv + ec      # varies along c axis (axis 0)
        wg = np.broadcast_to(wv, (N, N, 2))
        zg = np.broadcast_to(np.array([0.0, 0.0]), (N, N, 2))
        ug = np.broadcast_to(np.array([1.0, 0.0]), (N, N, 2))
        yg = ygrid           # (N,N,2)

        for name, seq in (("C1", [xpt, yg, zg, ug, vgrid, wg]),
                          ("C2", [xpt, yg, zg, wg, vgrid, ug])):
            pos, neg = edge_test(seq)
            m = pos | neg
            k = int(m.sum())
            if k:
                count[name] += k
                idx = np.argwhere(m)
                for (icc, idd) in idx[:2]:
                    pts = dict(x=xv.tolist(),
                               y=(wv + np.array([cosT[idd], sinT[idd]])).tolist(),
                               z=[0.0, 0.0], u=[1.0, 0.0],
                               v=(xv + np.array([cosT[icc], sinT[icc]])).tolist(),
                               w=wv.tolist())
                    if len(samples[name]) < 8:
                        samples[name].append((ia, ib, int(icc), int(idd), pts))

for name in ("C1", "C2"):
    print(name, "valid convex-order hits:", count[name])
    for rec in samples[name][:4]:
        print("  ", rec[:4], {k: [round(t, 4) for t in v] for k, v in rec[4].items()})
