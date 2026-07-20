"""
z3 NRA probe: is the globalcount (5,5,4) 11-point incidence table
(the SAT witness carrying oppApex1=V with a UNIQUE exact-4 radius class)
METRICALLY realizable in R^2?  (First: pure metric = intra-block equal
distances + pairwise distinctness.  Then optionally + convex position.)

Table source: p97-rvol/docs/u-lane/97-u1-2-doubleapex-residual-globalcount-verdict-2026-07-05.md
V = oppApex1, W = oppApex2, U = surplusApex.
"""
from z3 import Real, Solver, sat, unsat, And, Or, Not

pts = ["U","V","W","s1","s2","s3","a1","a2","a3","b1","b2"]
X = {p: (Real(p+"x"), Real(p+"y")) for p in pts}

def d2(p, q):
    (ax, ay), (bx, by) = X[p], X[q]
    return (ax-bx)*(ax-bx) + (ay-by)*(ay-by)

# radius blocks per center (center : list of blocks), from the verdict table
rows = {
 "V": [["U","s1","a1","a2"], ["W","b1"], ["s2","b2"], ["s3","a3"]],
 "W": [["s2","a3","b1","b2"], ["V","a1"], ["U","s1"], ["s3","a2"]],
 "U": [["V","W","s1","s3"], ["s2","a1","a3"], ["a2","b1","b2"]],
 "s1":[["U","V","W","s2"], ["s3","a1","b1"], ["a2","a3","b2"]],
 "s2":[["U","V","s3","a1"], ["W","s1","b2"], ["a2","a3","b1"]],
 "s3":[["V","W","a1","a2"], ["U","s2","a3"], ["s1","b1","b2"]],
 "a1":[["U","W","s3","a2"], ["V","s2","b1"], ["s1","a3","b2"]],
 "a2":[["V","W","a3","b1"], ["U","s1","s2"], ["s3","a1","b2"]],
 "a3":[["V","s2","s3","a2"], ["U","W","s1"], ["a1","b1","b2"]],
 "b1":[["V","s3","a3","b2"], ["U","W","a1"], ["s1","s2","a2"]],
 "b2":[["W","s2","s3","a1"], ["U","V","a2"], ["s1","a3","b1"]],
}

s = Solver()
# gauge: kill similarity by fixing V=(0,0), W=(1,0)
s.add(X["V"][0] == 0, X["V"][1] == 0, X["W"][0] == 1, X["W"][1] == 0)

# intra-block equal distances (the co-radial classes)
for c, blocks in rows.items():
    for B in blocks:
        for i in range(len(B)-1):
            s.add(d2(c, B[i]) == d2(c, B[i+1]))

# pairwise distinctness of all 11 points
for i in range(len(pts)):
    for j in range(i+1, len(pts)):
        s.add(d2(pts[i], pts[j]) > 0)

print("=== PROBE 1: pure metric realizability (intra-block eq + distinct) ===")
r = s.check()
print("verdict:", r)
if r == sat:
    m = s.model()
    def val(v):
        x = m[v]
        return x.as_fraction() if x is not None else None
    for p in pts:
        print(f"  {p}: ({val(X[p][0])}, {val(X[p][1])})")
