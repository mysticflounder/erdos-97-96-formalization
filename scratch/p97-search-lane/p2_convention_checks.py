"""Orchestrator audit checks for the P2 draft.

1. Exact re-verification of the C1 witness (Proposition 2): five unit
   distances + strict convex position in cyclic order (x,y,z,u,v,w),
   all in exact arithmetic (sympy).
2. Consistency scan: FR 20-gon cut matrix (rows a1..a10, cols b1..b10,
   FR's own indexing = C2 opposed convention, both sides bottom-to-top)
   must contain ZERO P1 and ZERO P2 (variant A or B) occurrences as
   submatrices -- since the configuration is certified realizable,
   any hit would contradict Theorem 1 / the P1 theorem.
   Also scan the column-reversed matrix (C1 reading) for comparison.

   MATRIX SYMMETRIZATION FIX (2026-07-28, second pass): the 15 pairs
   are UNORDERED -- pair {i,j} gives BOTH unit distances A_i B_j and
   A_j B_i (the paper's mirror-symmetric ansatz makes the two distances
   literally the same expression; fishburn-reeds-notes.md: "(i_A, j_B)
   AND (j_A, i_B) (matrix symmetric)"; seeds.py S-FR-20 adds both, and
   every index has degree exactly 3 only in the symmetric matrix).  The
   first committed version of this scan set only M[i-1][j-1], scanning
   a 15-one half-matrix; correct matrix has 30 ones.  Corrected
   results: native C2 still ZERO P1/P2/P4 occurrences (consistency
   intact); the C1 (column-reversed) reading has SIXTEEN P2 variant-B
   occurrences (previously reported as one -- artifact of the
   half-matrix).  Qualitative conclusion unchanged and strengthened.
"""
import sys
from itertools import combinations

from sympy import sqrt, Rational, cos, sin, pi, simplify, sign

# ---- 1. C1 witness exact check ----
c8 = cos(pi / 8)
s8 = sin(pi / 8)
h = sqrt(2) / 2
z = (0, 0)
u = (1, 0)
x = (1 - h, h)
w = (h, h)
y = (h - c8, h - s8)
v = (1 - h + c8, h - s8)

pts = {"x": x, "y": y, "z": z, "u": u, "v": v, "w": w}
pairs = [("x", "u"), ("x", "v"), ("y", "w"), ("z", "u"), ("z", "w")]
ok = True
for a, b in pairs:
    d2 = simplify((pts[a][0] - pts[b][0]) ** 2 + (pts[a][1] - pts[b][1]) ** 2)
    good = simplify(d2 - 1) == 0
    print(f"|{a}{b}|^2 == 1: {good}")
    ok = ok and good

order = ["x", "y", "z", "u", "v", "w"]
signs = set()
for i in range(6):
    p = pts[order[i]]
    q = pts[order[(i + 1) % 6]]
    for r_name in order:
        if r_name in (order[i], order[(i + 1) % 6]):
            continue
        r = pts[r_name]
        cr = simplify((q[0] - p[0]) * (r[1] - p[1]) - (q[1] - p[1]) * (r[0] - p[0]))
        s = sign(cr)
        if s == 0:
            print(f"DEGENERATE cross at edge {order[i]}{order[(i+1)%6]} vs {r_name}")
            ok = False
        signs.add(s)
strict_convex = len(signs) == 1
print(f"convex position, uniform strict sign over 24 checks: {strict_convex} (signs={signs})")
ok = ok and strict_convex

# ---- 2. FR matrix pattern scan ----
EDGES = [(1, 10), (2, 10), (3, 10), (1, 9), (4, 9), (5, 9), (2, 5),
         (3, 4), (1, 6), (3, 7), (5, 7), (6, 7), (2, 8), (4, 8), (6, 8)]
M = [[0] * 10 for _ in range(10)]
for i, j in EDGES:
    M[i - 1][j - 1] = 1  # row = a_i, col = b_j (FR indexing = C2 opposed)
    M[j - 1][i - 1] = 1  # unordered pair {i,j} also gives A_j B_i (symmetric)

assert sum(map(sum, M)) == 30 and all(sum(r) == 3 for r in M), \
    "FR matrix must be symmetric with 30 ones, degree 3 per row"


def count_p1(mat):
    hits = 0
    for r1, r2 in combinations(range(10), 2):
        for c1, c2 in combinations(range(10), 2):
            if mat[r1][c1] and mat[r1][c2] and mat[r2][c1] and mat[r2][c2]:
                hits += 1
    return hits


def count_p2(mat):
    hits_a = hits_b = 0
    for rows in combinations(range(10), 3):
        r1, r2, r3 = rows
        for cols in combinations(range(10), 3):
            c1, c2, c3 = cols
            if (mat[r1][c1] and mat[r1][c2] and mat[r2][c3]
                    and mat[r3][c1] and mat[r3][c3]):
                hits_a += 1
            if (mat[r1][c1] and mat[r1][c3] and mat[r2][c1]
                    and mat[r3][c2] and mat[r3][c3]):
                hits_b += 1
    return hits_a, hits_b


Mrev = [row[::-1] for row in M]  # column-reversed = C1 reading of the same data

p1 = count_p1(M)
p2a, p2b = count_p2(M)
p1r = count_p1(Mrev)
p2ar, p2br = count_p2(Mrev)
print(f"FR matrix (C2/native): P1 hits={p1}, P2 variant A={p2a}, variant B={p2b}")
print(f"FR matrix col-reversed (C1 reading): P1 hits={p1r}, P2 A={p2ar}, B={p2br}")
consistent = (p1 == 0 and p2a == 0 and p2b == 0)
print(f"C2 consistency (must all be zero): {consistent}")
ok = ok and consistent

print()
print("P2 AUDIT CHECKS:", "PASS" if ok else "FAIL")
assert ok, "P2 convention checks FAILED"
"""Scan FR native (C2) and col-reversed (C1) matrices for P4 staircase
occurrences, k=3..5, both variants (variant B = column-reversed A)."""
from itertools import combinations

EDGES = [(1, 10), (2, 10), (3, 10), (1, 9), (4, 9), (5, 9), (2, 5),
         (3, 4), (1, 6), (3, 7), (5, 7), (6, 7), (2, 8), (4, 8), (6, 8)]
M = [[0] * 10 for _ in range(10)]
for i, j in EDGES:
    M[i - 1][j - 1] = 1
    M[j - 1][i - 1] = 1  # symmetric (see symmetrization note above)


def p4_cells(k):
    cells = []
    for i in range(1, k):          # rows rho_1..rho_{k-1} -> idx i-1
        cells.append((i - 1, k - i - 1))   # c_{k-i}   -> idx k-i-1
        cells.append((i - 1, k - i))       # c_{k-i+1} -> idx k-i
    cells.append((k - 1, 0))               # wrap: c_1
    cells.append((k - 1, k - 1))           # wrap: c_k
    return cells


def count_p4(mat, k, mirror):
    hits = 0
    cells = p4_cells(k)
    for rows in combinations(range(10), k):
        for cols in combinations(range(10), k):
            use_cols = cols[::-1] if mirror else cols
            if all(mat[rows[ri]][use_cols[ci]] for ri, ci in cells):
                hits += 1
    return hits


Mrev = [row[::-1] for row in M]
for k in (3, 4, 5):
    a = count_p4(M, k, False); b = count_p4(M, k, True)
    ar = count_p4(Mrev, k, False); br = count_p4(Mrev, k, True)
    print(f"k={k}: C2/native A={a} B={b}   C1/col-reversed A={ar} B={br}")
