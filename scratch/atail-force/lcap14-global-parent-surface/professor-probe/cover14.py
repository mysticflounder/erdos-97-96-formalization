#!/usr/bin/env python3
"""Card-14 combinatorial probe of the L-branch aggregate surface.

Positions 0..13 in convex cyclic order (CCW candidate).
Moser vertices: O1=0, O2=4, P=9.  Caps (closed):
  S  = {0,1,2,3,4}      (surplus, card 5)
  C1 = {4,5,6,7,8,9}    (first opposite, card 6, opposite vertex O1)
  C2 = {9,10,11,12,13,0}(second opposite, card 6, opposite vertex O2)
Strict interiors: I_S={1,2,3}, I1={5,6,7,8}, I2={10,11,12,13}.

Encoded facts (each PROVEN in production or elementary from PROVEN facts):
  T  per-center equidistance is an equivalence relation (transitivity)
  A  all-center K4: every center is NR (unique exact-4 class) or robust
     (>=5-class witness, or two disjoint >=4-class witnesses)
  R  O1, O2 robust
  N  NR structure: complete unique exact-4 class E_y
  H  total fixed-point-free critical selector H(x) with x in E_{H(x)},
     image inside NR  (minimality => W(x) nonempty; H = selector)
  I  bisector interleaving: two distinct centers equidistant from a pair
     must be separated by the pair in the cyclic order
  O  Moser one-hit: a class at a Moser vertex meets each adjacent cap
     minus the vertex in <=1 point
  X  no OrderedCrossRowCore pattern in either orientation
  F  (--frontier) retained frontier pair q,w co-radial at O1 in a >=4
     class, both non-surplus, double-deletion leaves >=4-class at O1
     and at O2
Flags disable families to localize results.
"""
import sys, itertools, subprocess

N = 14
O1, O2, P = 0, 4, 9
IS_, I1, I2 = [1,2,3], [5,6,7,8], [10,11,12,13]
CAPS = {"S": [0,1,2,3,4], "C1": [4,5,6,7,8,9], "C2": [9,10,11,12,13,0]}

class Enc:
    def __init__(self):
        self.n = 0
        self.clauses = []
        self.emap = {}
        self.names = {}
    def new(self, name):
        self.n += 1
        self.names[name] = self.n
        return self.n
    def add(self, *lits):
        self.clauses.append(list(lits))

def build(opts):
    E = Enc()
    pts = list(range(N))
    def pair(u, v): return (min(u,v), max(u,v))
    # variables
    e = {}
    for y in pts:
        for u, v in itertools.combinations([p for p in pts if p != y], 2):
            e[(y,u,v)] = E.new(f"e{y}_{u}_{v}")
    def ev(y,u,v):
        u,v = pair(u,v); return e[(y,u,v)]
    nr = {y: E.new(f"nr{y}") for y in pts}
    m  = {(y,x): E.new(f"m{y}_{x}") for y in pts for x in pts if x != y}
    w5 = {y: E.new(f"w5_{y}") for y in pts}
    w44= {y: E.new(f"w44_{y}") for y in pts}
    f  = {(y,x): E.new(f"f{y}_{x}") for y in pts for x in pts if x != y}
    g1 = {(y,x): E.new(f"g1_{y}_{x}") for y in pts for x in pts if x != y}
    g2 = {(y,x): E.new(f"g2_{y}_{x}") for y in pts for x in pts if x != y}
    h  = {(x,y): E.new(f"h{x}_{y}") for x in pts for y in pts if y != x}

    # T: transitivity per center
    if "T" in opts:
        for y in pts:
            others = [p for p in pts if p != y]
            for a,b,c in itertools.combinations(others, 3):
                E.add(-ev(y,a,b), -ev(y,b,c), ev(y,a,c))
                E.add(-ev(y,a,b), -ev(y,a,c), ev(y,b,c))
                E.add(-ev(y,a,c), -ev(y,b,c), ev(y,a,b))
    # A: all-center K4 trichotomy
    if "A" in opts:
        for y in pts:
            E.add(nr[y], w5[y], w44[y])
    # R: apices robust
    if "R" in opts:
        E.add(-nr[O1]); E.add(-nr[O2])
    # N: NR structure
    if "N" in opts:
        for y in pts:
            others = [p for p in pts if p != y]
            for T10 in itertools.combinations(others, 10):   # at-least-4
                E.add(-nr[y], *[m[(y,x)] for x in T10])
            for T5 in itertools.combinations(others, 5):     # at-most-4
                E.add(-nr[y], *[-m[(y,x)] for x in T5])
            for u,v in itertools.combinations(others, 2):    # co-radial
                E.add(-nr[y], -m[(y,u)], -m[(y,v)], ev(y,u,v))
            for x in others:                                  # completeness
                for z in others:
                    if z == x: continue
                    E.add(-nr[y], -m[(y,x)], -ev(y,x,z), m[(y,z)])
            for a in others:                                  # uniqueness
                rest = [p for p in others if p != a]
                for b,c,d in itertools.combinations(rest, 3):
                    E.add(-nr[y], -ev(y,a,b), -ev(y,a,c), -ev(y,a,d), m[(y,a)])
    # A-witness structure (needed whenever A in opts)
    if "A" in opts:
        for y in pts:
            others = [p for p in pts if p != y]
            for T9 in itertools.combinations(others, 9):     # w5 at-least-5
                E.add(-w5[y], *[f[(y,x)] for x in T9])
            for u,v in itertools.combinations(others, 2):
                E.add(-w5[y], -f[(y,u)], -f[(y,v)], ev(y,u,v))
            for T10 in itertools.combinations(others, 10):   # w44 at-least-4 each
                E.add(-w44[y], *[g1[(y,x)] for x in T10])
                E.add(-w44[y], *[g2[(y,x)] for x in T10])
            for u,v in itertools.combinations(others, 2):
                E.add(-w44[y], -g1[(y,u)], -g1[(y,v)], ev(y,u,v))
                E.add(-w44[y], -g2[(y,u)], -g2[(y,v)], ev(y,u,v))
                E.add(-w44[y], -g1[(y,u)], -g2[(y,v)], -ev(y,u,v))
                E.add(-w44[y], -g1[(y,v)], -g2[(y,u)], -ev(y,u,v))
            for x in others:
                E.add(-w44[y], -g1[(y,x)], -g2[(y,x)])
    # H: total selector into NR shells
    if "H" in opts:
        for x in pts:
            ys = [y for y in pts if y != x]
            E.add(*[h[(x,y)] for y in ys])
            for y1,y2 in itertools.combinations(ys, 2):
                E.add(-h[(x,y1)], -h[(x,y2)])
            for y in ys:
                E.add(-h[(x,y)], nr[y])
                E.add(-h[(x,y)], m[(y,x)])
    # I: bisector interleaving
    if "I" in opts:
        for u,v in itertools.combinations(pts, 2):
            inside = set(range(u+1, v))
            cands = [z for z in pts if z not in (u,v)]
            for z1,z2 in itertools.combinations(cands, 2):
                if (z1 in inside) != (z2 in inside):
                    continue  # separated: allowed
                E.add(-ev(z1,u,v), -ev(z2,u,v))
    # O: Moser one-hit on adjacent caps
    if "O" in opts:
        adj = {O1: [[1,2,3,4],[9,10,11,12,13]],
               O2: [[0,1,2,3],[5,6,7,8,9]],
               P : [[4,5,6,7,8],[10,11,12,13,0]]}
        for y, caps in adj.items():
            for cap in caps:
                for u,v in itertools.combinations(cap, 2):
                    E.add(-ev(y,u,v))
    # X: no OrderedCrossRowCore, both orientations
    if "X" in opts:
        for p1,p2,p3,p4,p5 in itertools.combinations(range(1,14), 5):
            for (a0,x,j,c,k) in [(p1,p2,p3,p4,p5), (p5,p4,p3,p2,p1)]:
                E.add(-h[(c,a0)], -h[(k,a0)], -h[(j,x)], -m[(x,k)],
                      -ev(O1,j,c))
    # F: frontier pair
    if "F" in opts:
        nonS = [p for p in pts if p not in CAPS["S"]]
        qs = {x: E.new(f"qs{x}") for x in nonS}
        ws = {x: E.new(f"ws{x}") for x in nonS}
        E.add(*qs.values()); E.add(*ws.values())
        for a,b in itertools.combinations(nonS,2):
            E.add(-qs[a], -qs[b]); E.add(-ws[a], -ws[b])
        for x in nonS:
            E.add(-qs[x], -ws[x])
        for a in nonS:
            for b in nonS:
                if a != b:
                    E.add(-qs[a], -ws[b], ev(O1,a,b))
        # class of q at O1 has >=4: two extra witnesses t1,t2
        t1 = {x: E.new(f"t1_{x}") for x in pts if x != O1}
        t2 = {x: E.new(f"t2_{x}") for x in pts if x != O1}
        E.add(*t1.values()); E.add(*t2.values())
        for a,b in itertools.combinations([x for x in pts if x != O1],2):
            E.add(-t1[a], -t1[b]); E.add(-t2[a], -t2[b])
        for x in t1:
            E.add(-t1[x], -t2[x])
            if x in nonS:
                E.add(-t1[x], -qs[x]); E.add(-t1[x], -ws[x])
                E.add(-t2[x], -qs[x]); E.add(-t2[x], -ws[x])
            for a in nonS:
                E.add(-qs[a], -t1[x], ev(O1,a,x)) if x != a else None
                E.add(-qs[a], -t2[x], ev(O1,a,x)) if x != a else None
        # double-deletion witnesses at O1 and O2: 4-sets avoiding {q,w}
        for tag, ctr in (("D1", O1), ("D2", O2)):
            D = {x: E.new(f"{tag}_{x}") for x in pts if x != ctr}
            for T10 in itertools.combinations(list(D), 10):
                E.add(*[D[x] for x in T10])
            for u,v in itertools.combinations(list(D),2):
                E.add(-D[u], -D[v], ev(ctr,u,v))
            for x in D:
                if x in nonS:
                    E.add(-D[x], -qs[x]); E.add(-D[x], -ws[x])
    return E, dict(e=e, nr=nr, m=m, w5=w5, w44=w44, h=h)

def solve(E, tag):
    path = f"/tmp/cover14-{tag}.cnf"
    with open(path, "w") as fh:
        fh.write(f"p cnf {E.n} {len(E.clauses)}\n")
        for c in E.clauses:
            fh.write(" ".join(map(str, c)) + " 0\n")
    r = subprocess.run(["cadical", "-q", path], capture_output=True, text=True)
    out = r.stdout
    if "s UNSATISFIABLE" in out:
        return None
    model = set()
    for line in out.splitlines():
        if line.startswith("v"):
            for tok in line.split()[1:]:
                val = int(tok)
                if val > 0: model.add(val)
    return model

def report(model, V):
    if model is None:
        print("  UNSAT")
        return
    nrset = [y for y in range(N) if V["nr"][y] in model]
    print(f"  SAT.  NR = {nrset}")
    for y in nrset:
        Ey = [x for x in range(N) if x != y and V["m"][(y,x)] in model]
        print(f"    E_{y} = {Ey}")
    Hmap = {}
    for x in range(N):
        for y in range(N):
            if y != x and V["h"][(x,y)] in model:
                Hmap[x] = y
    print(f"    H = {Hmap}")
    rob = [y for y in range(N) if y not in nrset]
    for y in rob:
        mode = "w5" if V["w5"][y] in model else ("w44" if V["w44"][y] in model else "?")
        print(f"    robust {y}: {mode}")

FULL = set("TARNHIOX")
runs = [
    ("smoke-noIOX", FULL - set("IOX"), None),
    ("smoke-contradict", FULL, "force-nr0"),
    ("full", FULL, None),
    ("full+frontier", FULL | set("F"), None),
]
for tag, opts, extra in runs:
    E, V = build(opts)
    if extra == "force-nr0":
        E.add(V["nr"][0])
    print(f"[{tag}] vars={E.n} clauses={len(E.clauses)}")
    model = solve(E, tag)
    report(model, V)
