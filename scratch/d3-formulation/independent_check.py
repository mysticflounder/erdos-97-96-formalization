"""Independent verification of the D3 falsification witnesses.

Written by the orchestrating session, logic independent of the D3 agent's
verify_witness.py. Checks:

  Lattice witnesses (t1_results.json, exact integer arithmetic):
    - points distinct, classes are K4 (4 members, equidistant, center excluded)
    - C2 (pairwise class-intersection <= 2), C4 (pair in <= 2 classes)
    - cap structure (S/O1/O2 pairwise intersections = single Moser vertex,
      union = all labels, sizes >= 4, >= 2 caps of size >= 5)
    - H1 one-hit reported per Moser vertex (census imposed V,W only)
    - realization is the point set itself (distinct real points)

  Ring witnesses (t9_wit_*.json, mpmath 50 digits):
    - regenerate two concentric m-gons (outer r=1, inner r=b, twist pi/m),
      match every JSON coordinate to a regenerated point within 1e-9
    - every class member equidistant from its center to < 1e-40, and the
      class is the FULL radius class (exactly the 4 points at that radius,
      margin >= 1e-6 to every non-member)
    - general position: min |collinearity det| over all triples
    - min pairwise squared distance
    - same admissibility battery as above, H1 required at U, V, W (full)

Exit nonzero on any failure.
"""
import json, sys, itertools
from mpmath import mp, mpf, cos, sin, pi, sqrt

mp.dps = 50
FAIL = []

def check(cond, msg):
    if not cond:
        FAIL.append(msg)
        print(f"  FAIL: {msg}")
    return cond

# ---------- shared combinatorial battery over integer label indices ----------
def admissibility(name, n, U, V, W, S, O1, O2, classes, h1_required):
    """All args index-based: S/O1/O2 sets of indices, classes dict idx -> frozenset."""
    labels = set(range(n))
    check(S & O1 == {W}, f"{name}: S∩O1 != {{W}}")
    check(S & O2 == {V}, f"{name}: S∩O2 != {{V}}")
    check(O1 & O2 == {U}, f"{name}: O1∩O2 != {{U}}")
    check(S | O1 | O2 == labels, f"{name}: caps do not cover all labels")
    check(len(S) >= 4 and len(O1) >= 4 and len(O2) >= 4, f"{name}: a cap < 4")
    check(sum(1 for c in (S, O1, O2) if len(c) >= 5) >= 2, f"{name}: fewer than two caps >= 5")
    free = labels - {U, V, W}
    for p in free:
        check(sum(1 for c in (S, O1, O2) if p in c) == 1, f"{name}: free label {p} not in exactly one cap")
    # C1 structural
    check(set(classes.keys()) == labels, f"{name}: classes not defined on every label")
    for c, K in classes.items():
        check(len(K) == 4, f"{name}: |K({c})| != 4")
        check(c not in K, f"{name}: center {c} in own class")
        check(K <= labels, f"{name}: K({c}) not within labels")
    # C2
    for a, b in itertools.combinations(sorted(classes), 2):
        check(len(classes[a] & classes[b]) <= 2, f"{name}: C2 fails at ({a},{b})")
    # C4
    paircount = {}
    for c, K in classes.items():
        for a, b in itertools.combinations(sorted(K), 2):
            paircount[(a, b)] = paircount.get((a, b), 0) + 1
    bad = [k for k, v in paircount.items() if v > 2]
    check(not bad, f"{name}: C4 fails at pairs {bad[:5]}")
    # H1 per Moser vertex (report all; require the given set)
    h1 = {}
    for mv, nm in ((U, 'U'), (V, 'V'), (W, 'W')):
        ok = True
        for cap in (S, O1, O2):
            if mv in cap:
                ok = ok and len(classes[mv] & (cap - {mv})) <= 1
        h1[nm] = ok
    for nm in h1_required:
        check(h1[nm], f"{name}: H1 fails at required vertex {nm}")
    print(f"  {name}: caps ok, C1/C2/C4 ok, H1 U={h1['U']} V={h1['V']} W={h1['W']} (required: {h1_required})")

# ------------------------------- lattice ------------------------------------
def run_lattice(rec, idx):
    n = rec['n']
    uni = rec['universe']
    if uni.startswith('tri'):
        # triangular lattice: (i,j) -> (i + j/2, j*sqrt(3)/2), d2 = di^2 + di*dj + dj^2
        d2_tri = lambda p, q: (p[0]-q[0])**2 + (p[0]-q[0])*(p[1]-q[1]) + (p[1]-q[1])**2
    elif uni.startswith('sq'):
        d2_tri = lambda p, q: (p[0]-q[0])**2 + (p[1]-q[1])**2
    else:
        check(False, f"lattice[{idx}]: unknown universe {uni}")
        return
    pts = [tuple(p) for p in rec['subset']]
    name = f"lattice[{idx}] {uni} n={n}"
    print(f"\n== {name} ==")
    check(len(set(pts)) == n, f"{name}: points not distinct")
    w = rec['witness']
    key = {p: i for i, p in enumerate(pts)}
    U, V, W = (key[tuple(w[k])] for k in 'UVW')
    S, O1, O2 = (frozenset(key[tuple(p)] for p in w[k]) for k in ('S', 'O1', 'O2'))
    classes = {}
    for kstr, members in w['classes'].items():
        c = key[tuple(int(t) for t in kstr.strip('()').split(','))]
        classes[c] = frozenset(key[tuple(m)] for m in members)
    # metric K4: members equidistant from center, exact integers
    for c, K in classes.items():
        r2s = {d2_tri(pts[c], pts[m]) for m in K}
        check(len(r2s) == 1 and 0 not in r2s, f"{name}: class at {pts[c]} not equidistant (d2 set {r2s})")
    admissibility(name, n, U, V, W, S, O1, O2, classes, h1_required=('V', 'W'))
    print(f"  {name}: realization = the {n} distinct lattice points themselves (exact)")

# -------------------------------- rings -------------------------------------
RING_B = {
    't9_wit_m8_1.4534.json':  lambda: cos(3 * pi / 8) + sqrt(cos(3 * pi / 8) ** 2 + 1),
    't9_wit_m8_2.2853.json':  lambda: cos(pi / 8) + sqrt(cos(pi / 8) ** 2 + 1),
    't9_wit_m10_0.6180.json': lambda: (sqrt(5) - 1) / 2,
}

def run_ring(fname):
    data = json.load(open(f'scratch/d3-formulation/{fname}'))
    m = data['m']
    b = RING_B[fname]()
    check(abs(b - mpf(repr(data['b']))) < mpf('1e-12'), f"{fname}: b formula mismatch vs JSON")
    n = 2 * m
    name = f"ring {fname} (m={m}, n={n})"
    print(f"\n== {name} ==")
    pts = [(cos(2 * pi * k / m), sin(2 * pi * k / m)) for k in range(m)] + \
          [(b * cos(2 * pi * k / m + pi / m), b * sin(2 * pi * k / m + pi / m)) for k in range(m)]

    def locate(xy):
        x, y = (mpf(repr(t)) for t in xy)
        hits = [i for i, (px, py) in enumerate(pts) if abs(px - x) < mpf('1e-9') and abs(py - y) < mpf('1e-9')]
        check(len(hits) == 1, f"{name}: JSON point {xy} matches {len(hits)} regenerated points")
        return hits[0]

    def locate_key(kstr):
        return locate(tuple(float(t) for t in kstr.strip('()').split(',')))

    w = data['witness']
    U, V, W = (locate(w[k]) for k in 'UVW')
    S, O1, O2 = (frozenset(locate(p) for p in w[k]) for k in ('S', 'O1', 'O2'))
    classes = {locate_key(k): frozenset(locate(mm) for mm in v) for k, v in w['classes'].items()}

    d2 = [[(pts[i][0] - pts[j][0]) ** 2 + (pts[i][1] - pts[j][1]) ** 2 for j in range(n)] for i in range(n)]
    # exact-4 FULL radius classes
    for c, K in classes.items():
        r2s = [d2[c][mm] for mm in K]
        spread = max(r2s) - min(r2s)
        check(spread < mpf('1e-40'), f"{name}: class at {c} not equidistant (spread {spread})")
        r2 = r2s[0]
        at_r = {z for z in range(n) if z != c and abs(d2[c][z] - r2) < mpf('1e-30')}
        check(at_r == K, f"{name}: class at {c} is not the FULL radius class")
        margin = min(abs(d2[c][z] - r2) for z in range(n) if z != c and z not in K)
        check(margin > mpf('1e-6'), f"{name}: exactness margin at {c} only {margin}")
    # distinctness + general position
    mind2 = min(d2[i][j] for i in range(n) for j in range(i + 1, n))
    check(mind2 > mpf('0.1'), f"{name}: min pairwise d2 {mind2}")
    mindet = min(abs((pts[b_][0] - pts[a][0]) * (pts[c][1] - pts[a][1]) -
                     (pts[c][0] - pts[a][0]) * (pts[b_][1] - pts[a][1]))
                 for a, b_, c in itertools.combinations(range(n), 3))
    check(mindet > mpf('0.04'), f"{name}: min collinearity |det| {mindet}")
    print(f"  {name}: exact-4 full classes ok; min d2 = {float(mind2):.4f}; min |det| = {float(mindet):.4f}")
    admissibility(name, n, U, V, W, S, O1, O2, classes, h1_required=('U', 'V', 'W'))

for i, rec in enumerate(json.load(open('scratch/d3-formulation/t1_results.json'))):
    run_lattice(rec, i)
for f in RING_B:
    run_ring(f)

print(f"\n{'ALL CHECKS PASS' if not FAIL else f'{len(FAIL)} FAILURES'}")
sys.exit(1 if FAIL else 0)
