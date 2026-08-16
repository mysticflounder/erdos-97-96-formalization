"""Independent check of a point list: convex position (strict), min separation, per-vertex max multiplicity."""
import sys, json, itertools, math
pts = json.loads(sys.argv[1])
tol = float(sys.argv[2]) if len(sys.argv) > 2 else 1e-9
P = [complex(x, y) for x, y in pts]
n = len(P)
c = sum(P) / n
order = sorted(range(n), key=lambda i: math.atan2((P[i]-c).imag, (P[i]-c).real))
Q = [P[i] for i in order]
mincross = min(((Q[i]-Q[i-1]).real*(Q[(i+1)%n]-Q[i]).imag - (Q[i]-Q[i-1]).imag*(Q[(i+1)%n]-Q[i]).real) for i in range(n))
minsep = min(abs(P[i]-P[j]) for i in range(n) for j in range(i+1, n))
mults = []
for i in range(n):
    d = sorted(abs(P[j]-P[i]) for j in range(n) if j != i)
    best = 1
    for a in range(len(d)):
        b = a
        while b + 1 < len(d) and d[b+1] - d[a] <= tol:
            b += 1
        best = max(best, b - a + 1)
    mults.append(best)
print(json.dumps(dict(n=n, min_cross=mincross, min_sep=minsep, mults=mults, min_mult=min(mults))))
