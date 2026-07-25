#!/usr/bin/env python3
"""General-n L-branch avoidance driver.

Layer (generalizing professor-probe/cover14.py to card n, profile (a,b,c),
a+b+c = n+3, a>=5, b>=6, c>=6; O1=0, O2=a-1, P=a+b-2):

  T  per-center equidistance transitivity
  A  all-center K4 trichotomy (nr | w5 | w44)
  R  O1,O2 robust
  N  NR: complete unique exact-4 class E_y
  H  total fixed-point-free selector into NR shells (minimality cover)
  I  bisector interleaving (Lemma D)
  O  Moser one-hit on both adjacent chains at all three vertices
  X  no OrderedCrossRowCore in either orientation
  F  frontier pair q,w co-radial at O1, non-surplus, >=4 class,
     double-deletion 4-sets at O1 and O2 avoiding q,w

CEGAR over schema-instance blocking:
  tier1a = bank schemas of support <= 6
  tier1b = extra complete-atlas minimal patterns (supports 4..5) not in bank
  tier2  = bank schemas of support >= 7
  terminal = exact strict-Kalmanson metric oracle on the full pattern
             (z3 QF_LRA, named atoms, core extraction + deletion
             minimization); any UNSAT core here is a NEW schema.

Every admitted schema blocks its full dihedral-embedding orbit at card n.
"""
import argparse, itertools, json, sys, time
from pathlib import Path

from pysat.solvers import Cadical195
from z3 import Solver, Real, Bool, Implies, Not, sat, unsat

SCRATCH = Path(__file__).resolve().parent


# ---------------- schema utilities (convention of schema_mine.py) ----------

def norm(sign, c, l, r):
    return (sign, c, min(l, r), max(l, r))


def support(atoms):
    pts = set()
    for _, c, l, r in atoms:
        pts.update((c, l, r))
    return sorted(pts)


def rerank(atoms):
    sup = support(atoms)
    rank = {p: i for i, p in enumerate(sup)}
    return len(sup), [(s, rank[c], rank[l], rank[r]) for s, c, l, r in atoms]


def canonical(atoms):
    k, ranked = rerank(atoms)
    best = None
    for reflect in (False, True):
        for rot in range(k):
            def act(i):
                return ((rot - i) if reflect else (i + rot)) % k
            image = tuple(sorted(norm(s, act(c), act(l), act(r))
                                 for s, c, l, r in ranked))
            if best is None or image < best:
                best = image
    return k, best


_ax_cache = {}


def _axiom_solver(k):
    if k in _ax_cache:
        return _ax_cache[k]
    s = Solver()
    d = {}
    for u, v in itertools.combinations(range(k), 2):
        d[(u, v)] = Real(f"d_{u}_{v}")
        s.add(d[(u, v)] > 0)
    def D(u, v):
        return d[(min(u, v), max(u, v))]
    for x, y, z in itertools.combinations(range(k), 3):
        s.add(D(x, z) < D(x, y) + D(y, z))
        s.add(D(x, y) < D(x, z) + D(y, z))
        s.add(D(y, z) < D(x, y) + D(x, z))
    for x, y, z, w in itertools.combinations(range(k), 4):
        s.add(D(x, z) + D(y, w) > D(x, y) + D(z, w))
        s.add(D(x, z) + D(y, w) > D(x, w) + D(y, z))
    _ax_cache[k] = (s, D)
    return s, D


def decide(k, atoms):
    s, D = _axiom_solver(k)
    s.push()
    for sign, c, l, r in atoms:
        if sign == "+":
            s.add(D(c, l) == D(c, r))
        else:
            s.add(D(c, l) != D(c, r))
    res = s.check()
    s.pop()
    return "sat" if res == sat else "unsat"


def minimize_schema(atoms):
    """Deletion-minimize a support-local-UNSAT pure schema, re-canonicalize."""
    k, ranked = rerank(atoms)
    assert decide(k, ranked) == "unsat"
    current = list(ranked)
    changed = True
    while changed:
        changed = False
        for i in range(len(current)):
            trial = current[:i] + current[i + 1:]
            if not trial:
                continue
            kk, rr = rerank(trial)
            if decide(kk, rr) == "unsat":
                current = trial
                changed = True
                break
    return canonical(current)


# ---------------- base layer ----------------------------------------------

class Enc:
    def __init__(self):
        self.n = 0
        self.clauses = []

    def new(self):
        self.n += 1
        return self.n

    def add(self, *lits):
        self.clauses.append(list(lits))


def build_layer(n, a, b):
    c = n + 3 - a - b
    assert a >= 5 and b >= 6 and c >= 6
    O1, O2, P = 0, a - 1, a + b - 2
    S = list(range(0, a))
    C1 = list(range(a - 1, a + b - 1))
    C2 = list(range(a + b - 2, n)) + [0]
    pts = list(range(n))
    E = Enc()
    ev_ = {}
    for y in pts:
        for u, v in itertools.combinations([p for p in pts if p != y], 2):
            ev_[(y, u, v)] = E.new()

    def ev(y, u, v):
        u, v = (u, v) if u < v else (v, u)
        return ev_[(y, u, v)]

    nr = {y: E.new() for y in pts}
    m = {(y, x): E.new() for y in pts for x in pts if x != y}
    w5 = {y: E.new() for y in pts}
    w44 = {y: E.new() for y in pts}
    f = {(y, x): E.new() for y in pts for x in pts if x != y}
    g1 = {(y, x): E.new() for y in pts for x in pts if x != y}
    g2 = {(y, x): E.new() for y in pts for x in pts if x != y}
    h = {(x, y): E.new() for x in pts for y in pts if y != x}

    # T
    for y in pts:
        others = [p for p in pts if p != y]
        for x, z, w in itertools.combinations(others, 3):
            E.add(-ev(y, x, z), -ev(y, z, w), ev(y, x, w))
            E.add(-ev(y, x, z), -ev(y, x, w), ev(y, z, w))
            E.add(-ev(y, x, w), -ev(y, z, w), ev(y, x, z))
    # A
    for y in pts:
        E.add(nr[y], w5[y], w44[y])
    # R
    E.add(-nr[O1])
    E.add(-nr[O2])
    # N
    for y in pts:
        others = [p for p in pts if p != y]
        mo = len(others)
        for T in itertools.combinations(others, mo - 3):   # at-least-4
            E.add(-nr[y], *[m[(y, x)] for x in T])
        for T in itertools.combinations(others, 5):        # at-most-4
            E.add(-nr[y], *[-m[(y, x)] for x in T])
        for u, v in itertools.combinations(others, 2):     # co-radial
            E.add(-nr[y], -m[(y, u)], -m[(y, v)], ev(y, u, v))
        for x in others:                                   # completeness
            for z in others:
                if z == x:
                    continue
                E.add(-nr[y], -m[(y, x)], -ev(y, x, z), m[(y, z)])
        for x in others:                                   # uniqueness
            rest = [p for p in others if p != x]
            for u, v, w in itertools.combinations(rest, 3):
                E.add(-nr[y], -ev(y, x, u), -ev(y, x, v), -ev(y, x, w),
                      m[(y, x)])
    # A-witness structure
    for y in pts:
        others = [p for p in pts if p != y]
        mo = len(others)
        for T in itertools.combinations(others, mo - 4):   # w5 at-least-5
            E.add(-w5[y], *[f[(y, x)] for x in T])
        for u, v in itertools.combinations(others, 2):
            E.add(-w5[y], -f[(y, u)], -f[(y, v)], ev(y, u, v))
        for T in itertools.combinations(others, mo - 3):   # w44 both >=4
            E.add(-w44[y], *[g1[(y, x)] for x in T])
            E.add(-w44[y], *[g2[(y, x)] for x in T])
        for u, v in itertools.combinations(others, 2):
            E.add(-w44[y], -g1[(y, u)], -g1[(y, v)], ev(y, u, v))
            E.add(-w44[y], -g2[(y, u)], -g2[(y, v)], ev(y, u, v))
            E.add(-w44[y], -g1[(y, u)], -g2[(y, v)], -ev(y, u, v))
            E.add(-w44[y], -g1[(y, v)], -g2[(y, u)], -ev(y, u, v))
        for x in others:
            E.add(-w44[y], -g1[(y, x)], -g2[(y, x)])
    # H
    for x in pts:
        ys = [y for y in pts if y != x]
        E.add(*[h[(x, y)] for y in ys])
        for y1, y2 in itertools.combinations(ys, 2):
            E.add(-h[(x, y1)], -h[(x, y2)])
        for y in ys:
            E.add(-h[(x, y)], nr[y])
            E.add(-h[(x, y)], m[(y, x)])
    # I
    for u, v in itertools.combinations(pts, 2):
        inside = set(range(u + 1, v))
        cands = [z for z in pts if z not in (u, v)]
        for z1, z2 in itertools.combinations(cands, 2):
            if (z1 in inside) != (z2 in inside):
                continue
            E.add(-ev(z1, u, v), -ev(z2, u, v))
    # O
    adj = {O1: [[p for p in S if p != O1], [p for p in C2 if p != O1]],
           O2: [[p for p in S if p != O2], [p for p in C1 if p != O2]],
           P:  [[p for p in C1 if p != P], [p for p in C2 if p != P]]}
    for y, chains in adj.items():
        for chain in chains:
            for u, v in itertools.combinations(chain, 2):
                E.add(-ev(y, u, v))
    # C: same-cap incidence bound (selectedFourClass_inter_capByIndex_card_le_two,
    # packet-generic production): a class centered in a cap meets that cap in
    # <= 2 points; encoded as no co-radial triple within the center's own cap.
    for cap in (S, C1, C2):
        capset = set(cap)
        for c in cap:
            others = [p for p in cap if p != c]
            for u, v, w in itertools.combinations(others, 3):
                E.add(-ev(c, u, v), -ev(c, u, w))
    # X
    for p1, p2, p3, p4, p5 in itertools.combinations(range(1, n), 5):
        for (a0, x, j, cc, k) in [(p1, p2, p3, p4, p5),
                                  (p5, p4, p3, p2, p1)]:
            E.add(-h[(cc, a0)], -h[(k, a0)], -h[(j, x)], -m[(x, k)],
                  -ev(O1, j, cc))
    # F
    nonS = [p for p in pts if p not in S]
    qs = {x: E.new() for x in nonS}
    ws = {x: E.new() for x in nonS}
    E.add(*qs.values())
    E.add(*ws.values())
    for u, v in itertools.combinations(nonS, 2):
        E.add(-qs[u], -qs[v])
        E.add(-ws[u], -ws[v])
    for x in nonS:
        E.add(-qs[x], -ws[x])
    for u in nonS:
        for v in nonS:
            if u != v:
                E.add(-qs[u], -ws[v], ev(O1, u, v))
    t1 = {x: E.new() for x in pts if x != O1}
    t2 = {x: E.new() for x in pts if x != O1}
    E.add(*t1.values())
    E.add(*t2.values())
    for u, v in itertools.combinations(list(t1), 2):
        E.add(-t1[u], -t1[v])
        E.add(-t2[u], -t2[v])
    for x in t1:
        E.add(-t1[x], -t2[x])
        if x in nonS:
            E.add(-t1[x], -qs[x])
            E.add(-t1[x], -ws[x])
            E.add(-t2[x], -qs[x])
            E.add(-t2[x], -ws[x])
        for u in nonS:
            if x != u:
                E.add(-qs[u], -t1[x], ev(O1, u, x))
                E.add(-qs[u], -t2[x], ev(O1, u, x))
    for ctr in (O1, O2):
        D = {x: E.new() for x in pts if x != ctr}
        lst = list(D)
        for T in itertools.combinations(lst, len(lst) - 3):
            E.add(*[D[x] for x in T])
        for u, v in itertools.combinations(lst, 2):
            E.add(-D[u], -D[v], ev(ctr, u, v))
        for x in lst:
            if x in nonS:
                E.add(-D[x], -qs[x])
                E.add(-D[x], -ws[x])
    meta = dict(ev=ev_, nr=nr, m=m, h=h, w5=w5, w44=w44,
                O1=O1, O2=O2, P=P, S=S, C1=C1, C2=C2)
    return E, meta


# ---------------- schema instance machinery --------------------------------

def placements(n, k):
    """All dihedral placements: increasing k-tuples x (rotation,reflect)."""
    for image in itertools.combinations(range(n), k):
        for reflect in (False, True):
            for rot in range(k):
                yield image, reflect, rot


def place_fun(image, k, reflect, rot):
    if reflect:
        return lambda i: image[(rot - i) % k]
    return lambda i: image[(rot + i) % k]


def scan_model(n, evtrue, schemas):
    """Return set of schema keys with at least one instance in the model."""
    found = set()
    for key in schemas:
        k, atoms = key
        hit = False
        for image in itertools.combinations(range(n), k):
            for reflect in (False, True):
                for rot in range(k):
                    ok = True
                    for sign, c, l, r in atoms:
                        cc = image[((rot - c) if reflect else (rot + c)) % k]
                        ll = image[((rot - l) if reflect else (rot + l)) % k]
                        rr = image[((rot - r) if reflect else (rot + r)) % k]
                        if ll > rr:
                            ll, rr = rr, ll
                        if (cc, ll, rr) not in evtrue:
                            ok = False
                            break
                    if ok:
                        found.add(key)
                        hit = True
                        break
                if hit:
                    break
            if hit:
                break
    return found


def orbit_clauses(n, key, ev_):
    k, atoms = key
    out = set()
    for image in itertools.combinations(range(n), k):
        for reflect in (False, True):
            for rot in range(k):
                lits = []
                for sign, c, l, r in atoms:
                    cc = image[((rot - c) if reflect else (rot + c)) % k]
                    ll = image[((rot - l) if reflect else (rot + l)) % k]
                    rr = image[((rot - r) if reflect else (rot + r)) % k]
                    if ll > rr:
                        ll, rr = rr, ll
                    var = ev_[(cc, ll, rr)]
                    lits.append(-var if sign == "+" else var)
                out.add(frozenset(lits))
    return out


# ---------------- metric oracle at card n ----------------------------------

def eqonly_feasible(n, evtrue):
    """Assert ONLY the equalities of the pattern (no disequalities) under
    positivity + strict triangle + strict Kalmanson.  SAT means the equality
    set is metrically realizable on the cyclic order, hence NO pure-equality
    schema instance (bank or otherwise) is present in the pattern."""
    s = Solver()
    d = {}
    for u, v in itertools.combinations(range(n), 2):
        d[(u, v)] = Real(f"d_{u}_{v}")
        s.add(d[(u, v)] > 0)
    def D(u, v):
        return d[(min(u, v), max(u, v))]
    for x, y, z in itertools.combinations(range(n), 3):
        s.add(D(x, z) < D(x, y) + D(y, z))
        s.add(D(x, y) < D(x, z) + D(y, z))
        s.add(D(y, z) < D(x, y) + D(x, z))
    for x, y, z, w in itertools.combinations(range(n), 4):
        s.add(D(x, z) + D(y, w) > D(x, y) + D(z, w))
        s.add(D(x, z) + D(y, w) > D(x, w) + D(y, z))
    for (c, u, v) in evtrue:
        s.add(D(c, u) == D(c, v))
    return "sat" if s.check() == sat else "unsat"


def metric_oracle(n, evtrue, evall):
    s = Solver()
    s.set(unsat_core=True)
    d = {}
    for u, v in itertools.combinations(range(n), 2):
        d[(u, v)] = Real(f"d_{u}_{v}")
        s.add(d[(u, v)] > 0)
    def D(u, v):
        return d[(min(u, v), max(u, v))]
    for x, y, z in itertools.combinations(range(n), 3):
        s.add(D(x, z) < D(x, y) + D(y, z))
        s.add(D(x, y) < D(x, z) + D(y, z))
        s.add(D(y, z) < D(x, y) + D(x, z))
    for x, y, z, w in itertools.combinations(range(n), 4):
        s.add(D(x, z) + D(y, w) > D(x, y) + D(z, w))
        s.add(D(x, z) + D(y, w) > D(x, w) + D(y, z))
    track = {}
    for (c, u, v) in evall:
        name = Bool(f"a_{c}_{u}_{v}_{(c,u,v) in evtrue}")
        if (c, u, v) in evtrue:
            s.add(Implies(name, D(c, u) == D(c, v)))
        else:
            s.add(Implies(name, Not(D(c, u) == D(c, v))))
        track[name] = ("+" if (c, u, v) in evtrue else "-", c, u, v)
    res = s.check(*track.keys())
    if res == sat:
        return "sat", None
    core = [track[b] for b in s.unsat_core()]
    return "unsat", core


# ---------------- driver ----------------------------------------------------

def run(n, a, b, bank_path, atlas_extra, budget, kmax=6, verbose=True):
    cx = n + 3 - a - b
    tag = f"n{n}-{a}{b}{cx}-k{kmax}"
    bank = json.loads(open(bank_path).read())["schemas"]
    tier1a, tier2 = [], []
    for rec in bank:
        key = (rec["support"], tuple(tuple(x) for x in rec["atoms"]))
        (tier1a if rec["support"] <= kmax else tier2).append(key)
    tier1b = [key for key in atlas_extra if key not in set(tier1a)]
    E, meta = build_layer(n, a, b)
    ev_ = meta["ev"]
    solver = Cadical195()
    for cl in E.clauses:
        solver.add_clause(cl)
    admitted = set()
    added_clauses = set()
    stats = dict(tier1a=0, tier1b=0, tier2=0, new=0)
    log = []

    def admit(key, tier):
        if key in admitted:
            return 0
        cls = orbit_clauses(n, key, ev_)
        fresh = 0
        for cl in cls:
            if cl not in added_clauses:
                solver.add_clause(list(cl))
                added_clauses.add(cl)
                fresh += 1
        admitted.add(key)
        stats[tier] += 1
        return fresh

    evall = list(ev_.keys())
    t0 = time.time()
    for it in range(1, budget + 1):
        if not solver.solve():
            msg = (f"[{tag}] UNSAT at iter {it}: admitted "
                   f"{stats} ({time.time()-t0:.0f}s)")
            print(msg, flush=True)
            return dict(tag=tag, result="UNSAT", iters=it, stats=stats,
                        admitted=sorted(admitted), log=log)
        model = set(l for l in solver.get_model() if l > 0)
        evtrue = set(k for k, var in ev_.items() if var in model)
        prog = None
        for tier, schemas in (("tier1a", tier1a), ("tier1b", tier1b),
                              ("tier2", tier2)):
            found = scan_model(n, evtrue, schemas)
            if found:
                nc = sum(admit(key, tier) for key in found)
                prog = (tier, len(found), nc)
                break
        if prog:
            if verbose:
                print(f"[{tag}] it{it}: {prog[0]} +{prog[1]} schemas "
                      f"({prog[2]} clauses) admitted={len(admitted)} "
                      f"({time.time()-t0:.0f}s)", flush=True)
            log.append((it, prog[0], prog[1]))
            continue
        # no bank/atlas instance: FULL-BANK AVOIDER.  Decide whether any
        # pure-equality schema could ever refute it (equality-only test),
        # then run the full oracle.
        eqonly = eqonly_feasible(n, evtrue)
        wit = Path(f"avoider-{tag}-it{it}.json")
        wit.write_text(json.dumps(
            dict(n=n, a=a, b=b, iteration=it, eqonly=eqonly,
                 evtrue=sorted(evtrue)), indent=1, default=list))
        print(f"[{tag}] it{it}: FULL-BANK AVOIDER; equality-only layer is "
              f"{eqonly.upper()} -> "
              f"{'NO pure-equality schema can refute it' if eqonly == 'sat' else 'some pure schema exists (not in bank)'}"
              f"; witness {wit}", flush=True)
        status, core = metric_oracle(n, evtrue, evall)
        if status == "sat":
            print(f"[{tag}] METRIC SURVIVOR at iter {it} "
                  f"(admitted {stats})", flush=True)
            return dict(tag=tag, result="SURVIVOR", iters=it, stats=stats,
                        evtrue=sorted(evtrue), log=log)
        pure = [at for at in core if at[0] == "+"]
        if len(pure) == len(core):
            key = minimize_schema([norm(*at) for at in core])
            kk = key[0]
            print(f"[{tag}] it{it}: NEW schema support={kk} "
                  f"atoms={list(key[1])}", flush=True)
            log.append((it, "new", key))
            admit(key, "new")
        else:
            # mixed core: block the concrete instance only
            lits = []
            for sign, c, u, v in core:
                var = ev_[(c, u, v)]
                lits.append(-var if sign == "+" else var)
            solver.add_clause(lits)
            log.append((it, "mixedcore", tuple(core)))
            print(f"[{tag}] it{it}: MIXED core size {len(core)}", flush=True)
    print(f"[{tag}] budget exhausted: admitted {stats}", flush=True)
    return dict(tag=tag, result="BUDGET", iters=budget, stats=stats, log=log)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bank", type=Path, required=True)
    ap.add_argument("--atlas", type=Path, default=None,
                    help="json list of [support, atoms] extra schemas")
    ap.add_argument("--profiles", type=str, required=True,
                    help="semicolon list n,a,b")
    ap.add_argument("--budget", type=int, default=400)
    ap.add_argument("--kmax", type=int, default=6)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--smoke", action="store_true")
    args = ap.parse_args()

    atlas_extra = []
    if args.atlas and args.atlas.exists():
        for rec in json.loads(args.atlas.read_text()):
            atlas_extra.append((rec[0], tuple(tuple(x) for x in rec[1])))

    if args.smoke:
        # smoke 1: base layer at 14 (5,6,6) is SAT with no blocking
        E, meta = build_layer(14, 5, 6)
        s = Cadical195()
        for cl in E.clauses:
            s.add_clause(cl)
        r1 = s.solve()
        # smoke 2: forcing nr[O1] makes it UNSAT
        s2 = Cadical195()
        for cl in E.clauses:
            s2.add_clause(cl)
        s2.add_clause([meta["nr"][meta["O1"]]])
        r2 = s2.solve()
        # smoke 3: oracle on S4-instance pattern is unsat, empty pattern sat
        ev_ = meta["ev"]
        inst = {(0, 1, 2), (1, 0, 2), (3, 0, 1)}
        st1, core = metric_oracle(6, inst, list(inst))
        st2, _ = metric_oracle(6, set(), [])
        print(f"smoke: layer SAT={r1} (want True); nr[O1] UNSAT={not r2} "
              f"(want True); S4-oracle={st1} (want unsat, core {core}); "
              f"empty-oracle={st2} (want sat)")
        return

    results = []
    for spec in args.profiles.split(";"):
        n, a, b = (int(x) for x in spec.split(","))
        results.append(run(n, a, b, args.bank, atlas_extra, args.budget,
                           kmax=args.kmax))
        args.out.write_text(json.dumps(results, indent=1, default=list))
    print("done:", [(r["tag"], r["result"]) for r in results])


if __name__ == "__main__":
    main()
