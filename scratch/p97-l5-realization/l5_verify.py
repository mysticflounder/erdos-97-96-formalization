"""Independent verification of a realization JSON produced by l5_construct.py.
Only uses the point list and the role names; recomputes everything from coordinates."""
import json, sys, numpy as np
o = json.load(open(sys.argv[1]))
P = np.array(o['points']); names = o['names']; N = len(P)
idx = {n: i for i, n in enumerate(names)}
D = np.linalg.norm(P[:, None] - P[None], axis=2)
errs = []
# 1 convexity (ccw), simple, all cross > 0
for i in range(N):
    a, b, c = P[i - 1], P[i], P[(i + 1) % N]
    cr = (b[0] - a[0]) * (c[1] - b[1]) - (b[1] - a[1]) * (c[0] - b[0])
    if cr <= 1e-9: errs.append(f"non-strict-convex at {names[i]} cross={cr:.2e}")
# 2 disc / MEC
for i in range(N):
    r = np.linalg.norm(P[i])
    if names[i] in ('v1', 'v2', 'v3'):
        if abs(r - 1) > 1e-12: errs.append(f"apex {names[i]} not on unit circle")
    elif r >= 1 - 1e-6: errs.append(f"{names[i]} not strictly inside disc")
v1, v2, v3 = P[idx['v1']], P[idx['v2']], P[idx['v3']]
ang = lambda a, b, c: np.degrees(np.arccos(((b - a) @ (c - a)) / (np.linalg.norm(b - a) * np.linalg.norm(c - a))))
tri = [ang(v1, v2, v3), ang(v2, v3, v1), ang(v3, v1, v2)]
if max(tri) >= 90 - 1e-9: errs.append(f"triangle not acute {tri}")
# caps by cyclic order: v1 at 0, then I3, v2, I1, v3, I2
i2, i3 = idx['v2'], idx['v3']
I3 = set(range(1, i2)); I1 = set(range(i2 + 1, i3)); I2 = set(range(i3 + 1, N))
cap1 = I1 | {i2, i3}
def classes(i, tol=1e-9):
    d = D[i].copy(); d[i] = np.inf
    order = np.argsort(d); groups = []; cur = [order[0]]
    for k in range(1, N):
        if d[order[k]] == np.inf: break
        if abs(d[order[k]] - d[order[k - 1]]) < tol: cur.append(order[k])
        else: groups.append(cur); cur = [order[k]]
    groups.append(cur)
    return [g for g in groups if len(g) >= 3]
def where(i):
    return 'I1' if i in I1 else 'I2' if i in I2 else 'I3' if i in I3 else names[i]
# v1: exactly two classes, each of exactly 4, with exactly 2 in I1, 1 in I2, 1 in I3
cl = classes(idx['v1'])
if len(cl) != 2 or any(len(g) != 4 for g in cl): errs.append(f"v1 classes wrong: {[[names[j] for j in g] for g in cl]}")
for g in cl:
    locs = [where(j) for j in g]
    if sorted(locs) != ['I1', 'I1', 'I2', 'I3']: errs.append(f"v1 class location pattern {locs}")
# v2, v3 rich: two classes of size >= 4 (report)
for v, opp, adj in (('v2', 'I2', ['I1', 'I3']), ('v3', 'I3', ['I1', 'I2'])):
    cl2 = classes(idx[v])
    if len(cl2) < 2 or any(len(g) < 4 for g in cl2[:2]): errs.append(f"{v} not rich: {[[names[j] for j in g] for g in cl2]}")
    for g in cl2:
        locs = sorted(where(j) for j in g)
        if locs != sorted([opp, opp] + adj): errs.append(f"{v} class location pattern {locs}")
# no class at any center contains all three apexes
ap = {idx['v1'], idx['v2'], idx['v3']}
for i in range(N):
    for g in classes(i):
        if ap <= set(g): errs.append(f"class at {names[i]} contains all three apexes")
# blockers bP, bR: in I1, exactly one class of exactly 4, containing the v1 pair, shell ∩ closed cap1 = pair, bP strictly between the pair
for b, tag in (('bP', 'r'), ('bR', 'rho')):
    bi = idx[b]
    if bi not in I1: errs.append(f"{b} not in I1")
    clb = classes(bi)
    if len(clb) != 1 or len(clb[0]) != 4: errs.append(f"{b} not critical-exact: {[[names[j] for j in g] for g in clb]}")
    else:
        sh = set(clb[0]); pair = {idx['p1' + tag], idx['p2' + tag]}
        if not pair <= sh: errs.append(f"{b} shell misses its pair")
        if sh & cap1 != pair: errs.append(f"{b} shell meets closed cap1 in {[names[j] for j in sh & cap1]}")
        lo, hi = sorted(pair)
        if not (lo < bi < hi): errs.append(f"{b} not between its pair in cyclic order")
        # the pair must be one of v1's classes
        if not any(pair <= set(g) for g in cl): errs.append(f"{b} pair not a v1 class pair")
if idx['bP'] == idx['bR']: errs.append("bP = bR")
# source witness bS: through a cap1 point not among the four pair points, blocker not in {bP,bR,v1,v2}, exactly one class of 4, shell omits a point of each pair
if 'bS' in idx:
    cs = classes(idx['bS'])
    if len(cs) != 1 or len(cs[0]) != 4: errs.append("bS not critical-exact")
    else:
        sh = set(cs[0]); pairs = [{idx['p1r'], idx['p2r']}, {idx['p1rho'], idx['p2rho']}]
        src = [j for j in sh if j in I1 and j not in pairs[0] | pairs[1]]
        if not src: errs.append("bS shell has no eligible cap1 source")
        if any(pr <= sh for pr in pairs): errs.append("bS shell contains a whole pair")
    if idx['bS'] in (idx['bP'], idx['bR'], idx['v1'], idx['v2']): errs.append("bS forbidden center")
# cap sizes
sizes = dict(cap1=len(cap1), cap2=len(I2) + 2, cap3=len(I3) + 2)
if sizes['cap1'] < 8 or min(sizes.values()) < 6: errs.append(f"cap sizes {sizes}")
# summary
mult = {names[i]: max((len(g) for g in classes(i)), default=2) for i in range(N)}
print(json.dumps(dict(N=N, ok=not errs, errors=errs, triangle=[round(t, 3) for t in tri], cap_sizes=sizes,
                      min_cross=float(min(((P[(i+1)%N]-P[i])[0]*(P[(i+2)%N]-P[(i+1)%N])[1]-(P[(i+1)%N]-P[i])[1]*(P[(i+2)%N]-P[(i+1)%N])[0]) for i in range(N))),
                      centers_with_class_ge4={k: v for k, v in mult.items() if v >= 4}), indent=1))
