#!/usr/bin/env python3
"""Independent semantic checker for a cover14 full(+frontier) SAT witness.

Rebuilds the instance, solves, then verifies the witness against the
INTENDED semantics (not the clauses): trichotomy, NR class structure,
selector, interleaving, one-hit, no ordered pattern in either orientation.
"""
import itertools, subprocess, importlib.util

spec = importlib.util.spec_from_file_location("cover14",
    "/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/d4fa82b5-5541-499b-a62a-7f77e86add50/scratchpad/cover14.py")
src = open(spec.origin).read().split("FULL = set(")[0]
mod = {}
exec(compile(src, "cover14_core", "exec"), mod)
build, N = mod["build"], mod["N"]

E, V = build(set("TARNHIOXF"))
path = "/tmp/check14.cnf"
with open(path, "w") as fh:
    fh.write(f"p cnf {E.n} {len(E.clauses)}\n")
    for c in E.clauses:
        fh.write(" ".join(map(str, c)) + " 0\n")
r = subprocess.run(["cadical", "-q", path], capture_output=True, text=True)
assert "s UNSATISFIABLE" not in r.stdout, "unexpected UNSAT"
model = set()
for line in r.stdout.splitlines():
    if line.startswith("v"):
        for tok in line.split()[1:]:
            v = int(tok)
            if v > 0:
                model.add(v)

e, nr, m, w5, w44, h = (V[k] for k in ("e", "nr", "m", "w5", "w44", "h"))
f = {k: v for k, v in V.items()}
def ET(y, u, v):
    a, b = min(u, v), max(u, v)
    return e[(y, a, b)] in model

fails = []
def chk(cond, msg):
    if not cond:
        fails.append(msg)

pts = list(range(N))
# equivalence per center
for y in pts:
    others = [p for p in pts if p != y]
    for a, b, c in itertools.combinations(others, 3):
        if ET(y,a,b) and ET(y,b,c):
            chk(ET(y,a,c), f"transitivity fails at {y} {a} {b} {c}")
# trichotomy and class structure
NRset = [y for y in pts if nr[y] in model]
chk(0 not in NRset and 4 not in NRset, "apex marked NR")
for y in pts:
    others = [p for p in pts if p != y]
    # compute real equivalence classes of e at y
    classes = []
    seen = set()
    for a in others:
        if a in seen: continue
        cls = [a] + [b for b in others if b != a and ET(y,a,b)]
        seen.update(cls)
        classes.append(sorted(cls))
    big = [c for c in classes if len(c) >= 4]
    if y in NRset:
        Ey = sorted(x for x in others if m[(y,x)] in model)
        chk(len(Ey) == 4, f"E_{y} card {len(Ey)}")
        chk(big == [Ey], f"NR {y}: K4 classes {big} vs E_y {Ey}")
    else:
        five = any(len(c) >= 5 for c in classes)
        two4 = len(big) >= 2
        chk(five or two4, f"robust {y} has classes {big}: no witness")
# selector
Hmap = {}
for x in pts:
    ys = [y for y in pts if y != x and h[(x,y)] in model]
    chk(len(ys) == 1, f"H not functional at {x}")
    Hmap[x] = ys[0]
    chk(ys[0] in NRset, f"H({x}) robust")
    chk(m[(ys[0], x)] in model, f"{x} not in shell of its blocker")
# interleaving
for u, v in itertools.combinations(pts, 2):
    inside = set(range(u+1, v))
    ctrs = [z for z in pts if z not in (u, v) and ET(z, u, v)]
    for z1, z2 in itertools.combinations(ctrs, 2):
        chk((z1 in inside) != (z2 in inside),
            f"interleaving fails pair {u},{v} centers {z1},{z2}")
    chk(len(ctrs) <= 2, f"capacity fails {u},{v}: {ctrs}")
# one-hit
adj = {0: [[1,2,3,4],[9,10,11,12,13]],
       4: [[0,1,2,3],[5,6,7,8,9]],
       9: [[4,5,6,7,8],[10,11,12,13,0]]}
for y, caps in adj.items():
    for cap in caps:
        for u, v in itertools.combinations(cap, 2):
            chk(not ET(y,u,v), f"one-hit fails at {y}: {u},{v}")
# ordered pattern, both orientations
found = []
for p1,p2,p3,p4,p5 in itertools.combinations(range(1,14), 5):
    for (a0,x,j,c,k) in [(p1,p2,p3,p4,p5),(p5,p4,p3,p2,p1)]:
        if Hmap[c]==a0 and Hmap[k]==a0 and Hmap[j]==x \
           and m[(x,k)] in model and ET(0,j,c):
            found.append((a0,x,j,c,k))
chk(not found, f"ordered pattern present: {found[:3]}")
# frontier
print("semantic check:", "ALL PASS" if not fails else f"{len(fails)} FAILURES")
for msg in fails[:10]:
    print(" ", msg)
# fiber stats for the report
from collections import Counter
fib = Counter(Hmap.values())
rep = [b for b, c in fib.items() if c >= 2]
print("NR =", NRset)
print("H =", Hmap)
print("repeated-fiber blockers:", {b: fib[b] for b in rep})
