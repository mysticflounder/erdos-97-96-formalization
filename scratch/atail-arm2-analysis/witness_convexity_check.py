"""Is the PROVEN-SAT SI1 {1-8} witness (from prover a3d2ad88) in GLOBAL convex
position? If not, D.convex (points of A in convex position) is a genuine
discriminator => Candidate-D convex-coupling probe is warranted.

Exact rational arithmetic. Witness coords verbatim from the prover report."""
from fractions import Fraction as Fr
from itertools import combinations


def _f(x):
    return Fr(*x) if isinstance(x, tuple) else Fr(x)


def P(a, b):
    return (_f(a), _f(b))


# 21 named A-points from the witness (gauge cL=(0,0), cR=(1,0))
pts = {
    "cL": P(0, 0), "cR": P(1, 0),
    "c0": P((1, 2), (3, 5)), "bc": P((1, 2), (-3, 10)), "bf": P((1, 2), -1),
    "s1": P((1, 6), (-1, 5)), "s2": P((5, 6), (-1, 5)), "f": P((1, 2), (-1, 5)),
    # frontier class (at c0): s1, s2, + two
    "fr3": P((41, 30), (3, 5)), "fr4": P((-11, 30), (3, 5)),
    # P = f survives-4 at c0
    "P1": P((3, 2), (3, 5)), "P2": P((-1, 2), (3, 5)),
    "P3": P((1, 2), (8, 5)), "P4": P((1, 2), (-2, 5)),
    # Q = shell(g) at bc: s1, s2, + two
    "Q3": P((1, 6), (-2, 5)), "Q4": P((5, 6), (-2, 5)),
    # M = g survives-4 at c0
    "M1": P((7, 6), (3, 5)), "M2": P((-1, 6), (3, 5)),
    "M3": P((1, 2), (19, 15)), "M4": P((1, 2), (-1, 15)),
    # N = shell(f) at bf: f, + three
    "N2": P((13, 10), -1), "N3": P((-3, 10), -1), "N4": P((1, 2), (-9, 5)),
}
# dedupe by coordinate (s1,s2,f appear in multiple classes)
uniq = {}
for name, p in pts.items():
    uniq.setdefault(p, name)
P_list = list(uniq.keys())
print(f"named entries={len(pts)}  distinct points={len(P_list)}")


def cross(o, a, b):
    return (a[0]-o[0])*(b[1]-o[1]) - (a[1]-o[1])*(b[0]-o[0])


# collinear triples (strict convex position forbids any)
collinear = [(uniq[a], uniq[b], uniq[c])
             for a, b, c in combinations(P_list, 3) if cross(a, b, c) == 0]
print(f"collinear triples: {len(collinear)}")
for t in collinear[:12]:
    print("   collinear:", t)

# convex-hull (monotone chain) then count strictly-interior points
S = sorted(P_list)
def half(points):
    h = []
    for p in points:
        while len(h) >= 2 and cross(h[-2], h[-1], p) <= 0:
            h.pop()
        h.append(p)
    return h
hull = half(S)[:-1] + half(S[::-1])[:-1]
hull_set = set(hull)
interior = [uniq[p] for p in P_list if p not in hull_set]
print(f"hull size={len(hull_set)}  strictly-interior points={len(interior)}")
print("   interior:", sorted(interior))
convex = (len(collinear) == 0 and len(interior) == 0)
print(f"\n=> witness in STRICT convex position: {convex}")
print("=> if False, D.convex EXCLUDES this witness; convexity is a discriminator")
