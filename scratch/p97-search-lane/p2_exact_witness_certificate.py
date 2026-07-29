"""Skeptic audit: exact verification of Proposition 2 (C1 witness) in
fr-pattern-p2-proof-draft.md, using ONLY exact rational interval arithmetic
(no floating point anywhere). Also mechanical checks of the Corollary
relabeling table and the section-6 cell-set bookkeeping claims.
"""
from fractions import Fraction as F

# ---------- exact rational intervals ----------
class Iv:
    __slots__ = ("lo", "hi")
    def __init__(self, lo, hi=None):
        lo = F(lo); hi = F(hi) if hi is not None else lo
        assert lo <= hi
        self.lo, self.hi = lo, hi
    def __add__(self, o):
        o = as_iv(o); return Iv(self.lo + o.lo, self.hi + o.hi)
    def __radd__(self, o): return as_iv(o) + self
    def __sub__(self, o):
        o = as_iv(o); return Iv(self.lo - o.hi, self.hi - o.lo)
    def __rsub__(self, o): return as_iv(o) - self
    def __mul__(self, o):
        o = as_iv(o)
        cs = [self.lo*o.lo, self.lo*o.hi, self.hi*o.lo, self.hi*o.hi]
        return Iv(min(cs), max(cs))
    def __rmul__(self, o): return self * as_iv(o)
    def __neg__(self): return Iv(-self.hi, -self.lo)
    def strictly_pos(self): return self.lo > 0
    def strictly_neg(self): return self.hi < 0
    def excludes_zero(self): return self.lo > 0 or self.hi < 0
    def __repr__(self): return f"[{float(self.lo):.15f},{float(self.hi):.15f}]"

def as_iv(x):
    return x if isinstance(x, Iv) else Iv(F(x))

def sqrt_iv(x, prec=F(1, 10**15)):
    """Exact interval for sqrt of a positive Fraction, by bisection with
    exact square comparisons. Result [lo,hi] satisfies lo^2 <= x <= hi^2."""
    x = F(x); assert x > 0
    lo, hi = F(0), x + 1
    while hi - lo > prec:
        m = (lo + hi) / 2
        if m*m <= x:
            lo = m
        else:
            hi = m
    assert lo*lo <= x <= hi*hi
    return Iv(lo, hi)

# ---------- the witness ----------
sqrt2 = sqrt_iv(2)                    # [l,h] with l^2<=2<=h^2, width 1e-15
r = sqrt2 * F(1, 2)                   # sqrt(2)/2
# c = cos(pi/8) = sqrt(2+sqrt2)/2 ; need interval of sqrt of an interval:
# sqrt is monotone, so sqrt([a,b]) = [sqrt(a).lo, sqrt(b).hi]
def sqrt_of_iv(iv):
    lo = sqrt_iv(iv.lo); hi = sqrt_iv(iv.hi)
    return Iv(lo.lo, hi.hi)
c = sqrt_of_iv(as_iv(2) + sqrt2) * F(1, 2)
s = sqrt_of_iv(as_iv(2) - sqrt2) * F(1, 2)

z = (Iv(0), Iv(0))
u = (Iv(1), Iv(0))
x = (as_iv(1) - r, r)
w = (r, r)
y = (r - c, r - s)
v = (as_iv(1) - r + c, r - s)
pts = dict(x=x, y=y, z=z, u=u, v=v, w=w)

# ---------- 1. five distances: verify exactly (symbolic identities) ----------
# |zu|^2 = 1 trivially. |zw|^2 = r^2+r^2 where r=sqrt2/2 -> exactly 1.
# |xu|^2 = r^2+r^2 = 1. |xv|^2 = c^2+s^2, |yw|^2 = c^2+s^2.
# c^2 = (2+sqrt2)/4, s^2 = (2-sqrt2)/4 exactly, so c^2+s^2 = 1 exactly.
# These are identities in the field; interval check only corroborates:
def d2(p, q):
    return (p[0]-q[0])*(p[0]-q[0]) + (p[1]-q[1])*(p[1]-q[1])
for a, b in [("z","u"), ("z","w"), ("x","u"), ("x","v"), ("y","w")]:
    val = d2(pts[a], pts[b])
    assert val.lo <= 1 <= val.hi and (val.hi - val.lo) < F(1, 10**9), (a, b, val)
print("distances: intervals all contain 1 (exact identities verified by hand: "
      "r^2+r^2=1, c^2+s^2=(2+sqrt2)/4+(2-sqrt2)/4=1)")

# ---------- 2. 24 supporting cross-products, hull order (x,y,z,u,v,w) ----------
order = ["x", "y", "z", "u", "v", "w"]
def cross(o, a, b):
    return (a[0]-o[0])*(b[1]-o[1]) - (a[1]-o[1])*(b[0]-o[0])
min_lo = None
n_checked = 0
for i in range(6):
    p, q = order[i], order[(i+1) % 6]
    for k in order:
        if k in (p, q):
            continue
        cv = cross(pts[p], pts[q], pts[k])
        assert cv.strictly_pos(), ("cross not strictly positive", p, q, k, cv)
        n_checked += 1
        if min_lo is None or cv.lo < min_lo:
            min_lo = cv.lo
print(f"convexity: all {n_checked} supporting cross-products strictly positive "
      f"(exact rational lower bound on min = {float(min_lo):.6f})")

# ---------- 3. 20 triples: no three collinear ----------
from itertools import combinations
n_tri = 0
for a, b, cc in combinations(order, 3):
    cv = cross(pts[a], pts[b], pts[cc])
    assert cv.excludes_zero(), ("collinear triple?", a, b, cc, cv)
    n_tri += 1
print(f"no-3-collinear: all {n_tri} triple cross-products exclude zero exactly")

# ---------- 4. mirror symmetry across X=1/2 with relabel z<->u,x<->w,y<->v ----
# reflect(px,py) = (1-px, py); check reflect(z)=u etc. as exact identities:
# 1-0=1 ok; 1-(1-r)=r ok; 1-(r-c)=1-r+c ok. (identities, no intervals needed)
print("mirror symmetry across X=1/2: exact identities 1-0=1, 1-(1-r)=r, "
      "1-(r-c)=1-r+c  -- hold")

# ---------- 5. Corollary relabel table (mechanical) ----------
# H: cyclic order (x,y,z,w,v,u), variant-B pairs {xu,xw,yu,zv,zw}.
# relabel: x'=z, y'=y, z'=x, w'=u, v'=v, u'=w.
relabel = dict(z="x'", y="y'", x="z'", u="w'", v="v'", w="u'")
pairsB = [("x","u"), ("x","w"), ("y","u"), ("z","v"), ("z","w")]
mapped = sorted("".join(sorted((relabel[a], relabel[b]))) for a, b in pairsB)
targetA = sorted("".join(sorted(p)) for p in
                 [("x'","u'"), ("x'","v'"), ("y'","w'"), ("z'","u'"), ("z'","w'")])
assert mapped == targetA, (mapped, targetA)
# cyclic order check: (x,y,z,w,v,u) relabelled = (z',y',x',u',v',w');
# as an UNDIRECTED cycle its adjacency set must equal that of (x',y',z',w',v',u')
def adj(cycle):
    return sorted(tuple(sorted((cycle[i], cycle[(i+1) % len(cycle)])))
                  for i in range(len(cycle)))
c1 = ["z'", "y'", "x'", "u'", "v'", "w'"]
c2 = ["x'", "y'", "z'", "w'", "v'", "u'"]
assert adj(c1) == adj(c2)
print("corollary: relabeled variant-B pair set == variant-A pair set; "
      "relabeled cycle == theorem-1 template as undirected cycles")

# ---------- 6. section-6 bookkeeping on 3x3 cell sets ----------
A = {(1,1),(1,2),(2,3),(3,1),(3,3)}
B = {(1,1),(1,3),(2,1),(3,2),(3,3)}
colrev  = lambda S: {(r, 4-c) for r, c in S}
rowrev  = lambda S: {(4-r, c) for r, c in S}
transp  = lambda S: {(c, r) for r, c in S}
assert colrev(A) != A and colrev(A) != B          # single-axis reversal not a symmetry
assert rowrev(A) != A and rowrev(A) != B
assert rowrev(colrev(A)) == B                     # double reversal: A <-> B
assert rowrev(colrev(B)) == A
assert transp(A) == B and transp(B) == A          # transposition: A <-> B
P1 = {(1,1),(1,2),(2,1),(2,2)}
cr1 = {(r, 3-c) for r, c in P1}; rr1 = {(3-r, c) for r, c in P1}
assert cr1 == P1 and rr1 == P1                    # P1 orientation-neutral
print("cell-set bookkeeping: single-axis reversal maps A to neither variant; "
      "double reversal and transposition both swap A<->B; P1 invariant")

print("\nALL SKEPTIC CHECKS PASSED (exact rational arithmetic only)")
