#!/usr/bin/env python3
"""C-vs-R dichotomy classification of the |A|=12 mined dead cores.

Dispatch: D1 lead 1 of docs/d1-rigidity-literature-scan-2026-07-06.md (Wu 1986 /
Chou 1988 saturation machinery; see scan section 4.3 FLAG) and
docs/closure-plan-2026-07-06.md section 7. One bit per dead core: is the core
dead over C (equality ideal + Rabinowitsch distinctness = unit ideal, i.e.
reduced Groebner basis {1} over QQ) or only over R (complex distinct-separated
solutions exist; the kill would be real-geometric)?

Core population of record: mining-import/result_{654,555}.json (see
mining-import/PROVENANCE.md) — 146 + 120 constraint-graph classes of minimal
no-distinct-real cores mined 2026-07-06 from the seed-7 census sample prefix
(70 resp. 60 cubes). Only class representatives were persisted; the dichotomy
verdict is a class invariant (proof in report.md section 3), so classifying
all representatives classifies the full mined population.

ENCODING (independent re-implementation per the dispatch spec):
  - core = (k labeled points, active-center groups {c: M_c}, M_c = sorted
    in-core members of c's equidistance class, |M_c| >= 2)
  - points relabeled 0..k-1 by sorted original label; gauge p0=(0,0), p1=(1,0)
    (similarity acts transitively on ordered pairs with nonzero squared
    separation — WLOG argument in report.md section 2)
  - equalities: d2(c, M_c[0]) - d2(c, M_c[j]),  d2 = squared distance
  - distinctness: one Rabinowitsch variable per pair, t_i*d2(a,b) - 1 = 0
  - C-dead  <=>  reduced GB over QQ of the full system = {1}
    (Singular: option(redSB); std; reduce(1,G) == 0 — exact char 0;
     cross-check: msolve char-0 SOLVE mode, [-1] <=> empty over QQ-bar)

Phases (run in order):
  uv run --with sympy python classify.py smoke        # mandatory gates; STOP on failure
  uv run --with sympy python classify.py tierA        # all 266 record classes
  uv run --with sympy python classify.py tierC        # complete abstract k=4 universe
  uv run --with sympy python classify.py tierB --cubes N  # fresh mining from _u12_dead_*.jsonl
  uv run --with sympy python classify.py orderings    # gate (iii): second orderings per delta
  uv run --with sympy python classify.py report       # merge rows, print tables
"""
import argparse
import hashlib
import json
import os
import random
import subprocess
import sys
import tempfile
import time
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from itertools import combinations, permutations, product

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)                      # scratch/u12-census-port
IMP = f"{HERE}/mining-import"
N = 12

# ---------------------------------------------------------------------------
# Verbatim ports from the census/mining of record (provenance: PROVENANCE.md).
# sample_cubes/PROFILES/onehit_ok: scratch/u12-census-port/_u12_census.py
# canonical/canon_stats/readable/U1: mining-import/mine.py
# ---------------------------------------------------------------------------
U, V, W = 0, 1, 2
PROFILES = {
    "654": {"S": frozenset({1, 2, 3, 4, 5, 6}),
            "O1": frozenset({0, 2, 7, 8, 9}),
            "O2": frozenset({0, 1, 10, 11}),
            "caps": (6, 5, 4)},
    "555": {"S": frozenset({1, 2, 3, 4, 5}),
            "O1": frozenset({0, 2, 6, 7, 8}),
            "O2": frozenset({0, 1, 9, 10, 11}),
            "caps": (5, 5, 5)},
}


def onehit_ok(prof, p, kp):
    S, O1, O2 = prof["S"], prof["O1"], prof["O2"]
    if p == V:
        if len(kp & (S - {V})) > 1 or len(kp & (O2 - {V})) > 1:
            return False
    if p == W:
        if len(kp & (S - {W})) > 1 or len(kp & (O1 - {W})) > 1:
            return False
    return True


def sample_cubes(prof, n_cubes, seed, max_attempts_factor=2000, node_budget=200000):
    rng = random.Random(seed)
    cand = {p: [frozenset(c) for c in combinations([q for q in range(N) if q != p], 4)]
            for p in range(N)}
    out, seen, attempts = [], set(), 0
    while len(out) < n_cubes and attempts < n_cubes * max_attempts_factor:
        attempts += 1
        order = list(range(N))
        rng.shuffle(order)
        assigned, paircount = {}, {}
        nodes = [0]
        over = [False]

        def feasible(p, kp):
            if not onehit_ok(prof, p, kp):
                return None
            for q, kq in assigned.items():
                if len(kp & kq) > 2:
                    return None
            pr = list(combinations(sorted(kp), 2))
            for e in pr:
                if paircount.get(e, 0) + 1 > 2:
                    return None
            return pr

        def build(i):
            if i == N:
                return True
            p = order[i]
            cs = cand[p][:]
            rng.shuffle(cs)
            for kp in cs:
                nodes[0] += 1
                if nodes[0] > node_budget:
                    over[0] = True
                    return False
                pr = feasible(p, kp)
                if pr is None:
                    continue
                assigned[p] = kp
                for e in pr:
                    paircount[e] = paircount.get(e, 0) + 1
                if build(i + 1):
                    return True
                for e in pr:
                    paircount[e] -= 1
                del assigned[p]
                if over[0]:
                    return False
            return False

        if build(0) and not over[0]:
            cube = {p: sorted(assigned[p]) for p in range(N)}
            key = tuple(tuple(cube[p]) for p in range(N))
            if key not in seen:
                seen.add(key)
                out.append(cube)
    return out, attempts


def canonical(edges):
    edges = [tuple(e) for e in edges]
    verts = sorted({u for u, v in edges} | {v for u, v in edges})
    if not verts:
        return ()
    E = set(edges)
    outd = {x: 0 for x in verts}
    ind = {x: 0 for x in verts}
    for u, v in E:
        outd[u] += 1
        ind[v] += 1
    col = {x: (ind[x], outd[x]) for x in verts}
    for _ in range(len(verts)):
        nc = {}
        for x in verts:
            inc = tuple(sorted(col[u] for (u, v) in E if v == x))
            oc = tuple(sorted(col[v] for (u, v) in E if u == x))
            nc[x] = (col[x], inc, oc)
        comp = {c: i for i, c in enumerate(sorted(set(nc.values())))}
        nc = {x: comp[nc[x]] for x in verts}
        if nc == col:
            break
        col = nc
    groups = {}
    for x in verts:
        groups.setdefault(col[x], []).append(x)
    order = sorted(groups)
    perms = [list(permutations(groups[c])) for c in order]
    best = None
    for combo in product(*perms):
        mp, idx = {}, 0
        for tup in combo:
            for x in tup:
                mp[x] = idx
                idx += 1
        rel = tuple(sorted((mp[u], mp[v]) for (u, v) in E))
        if best is None or rel < best:
            best = rel
    return best


# ---------------------------------------------------------------------------
# Core extraction (pairwise-induced schema of mine.py, re-derived from cube+P)
# ---------------------------------------------------------------------------
def groups_of(cube, P):
    """{c: sorted members of K_c∩P} over active centers c∈P (|K_c∩P|>=2)."""
    Ps = set(P)
    g = {}
    for c in sorted(P):
        M = sorted(set(cube[c]) & Ps)
        if len(M) >= 2:
            g[c] = M
    return g


def edges_of_groups(g):
    return [(c, m) for c, M in sorted(g.items()) for m in M]


def nrel_of_groups(g):
    return sum(len(M) - 1 for M in g.values())


# ---------------------------------------------------------------------------
# Independent encoder (relabeled two-pin gauge) — the dispatch's encoding
# ---------------------------------------------------------------------------
_X = {}


def _sym(name):
    if name not in _X:
        _X[name] = sympy.Symbol(name)
    return _X[name]


def coord_rel(l):
    """Relabeled point l: 0 -> (0,0), 1 -> (1,0), else free symbols."""
    if l == 0:
        return (sympy.Integer(0), sympy.Integer(0))
    if l == 1:
        return (sympy.Integer(1), sympy.Integer(0))
    return (_sym(f"x{l}x"), _sym(f"x{l}y"))


def d2_rel(a, b):
    ax, ay = coord_rel(a)
    bx, by = coord_rel(b)
    return (ax - bx) ** 2 + (ay - by) ** 2


def encode_core(k, groups_rel, pins=True, rab_pairs="all", single_pair=None):
    """Build (varlist, poly_strings) for the relabeled core system.

    groups_rel: {c: [members]} in labels 0..k-1.  pins: gauge 0->(0,0),
    1->(1,0) (if False, all 2k coordinates free — used for the canonical
    single-pair kill test).  rab_pairs: 'all' | 'none'.  single_pair: add one
    Rabinowitsch separator for exactly this pair (used with rab_pairs='none').
    """
    if pins:
        xv = [f"x{l}{ax}" for l in range(2, k) for ax in ("x", "y")]
        crd = coord_rel
    else:
        xv = [f"x{l}{ax}" for l in range(0, k) for ax in ("x", "y")]

        def crd(l):
            return (_sym(f"x{l}x"), _sym(f"x{l}y"))

    def dd(a, b):
        ax, ay = crd(a)
        bx, by = crd(b)
        return (ax - bx) ** 2 + (ay - by) ** 2

    eq = []
    for c, M in sorted(groups_rel.items()):
        base = dd(c, M[0])
        for m in M[1:]:
            eq.append(base - dd(c, m))
    sat = []
    tv = []
    if rab_pairs == "all":
        for i, (a, b) in enumerate(combinations(range(k), 2)):
            t = _sym(f"t{i}")
            tv.append(f"t{i}")
            sat.append(t * dd(a, b) - 1)
    if single_pair is not None:
        a, b = single_pair
        t = _sym("t0")
        tv.append("t0")
        sat.append(t * dd(a, b) - 1)
    polys = [str(sympy.expand(p)).replace("**", "^") for p in eq + sat]
    return xv + tv, polys


def relabel_core(P, groups):
    """Map original labels to 0..k-1 by sorted order; return (k, groups_rel)."""
    Ps = sorted(P)
    mp = {p: i for i, p in enumerate(Ps)}
    return len(Ps), {mp[c]: sorted(mp[m] for m in M) for c, M in groups.items()}


# ---------------------------------------------------------------------------
# Solver runners (exact char 0)
# ---------------------------------------------------------------------------
def singular_gb(varlist, polys, timeout=120, order="dp", reverse_vars=False):
    """Reduced GB over QQ.  Returns dict: unit (True/False/None on timeout),
    gb_size, secs."""
    vs = list(reversed(varlist)) if reverse_vars else list(varlist)
    ideal = "ideal I = " + ",\n  ".join(polys) + ";"
    script = "\n".join([
        f"ring r = 0, ({','.join(vs)}), {order};",
        "option(redSB);",
        ideal,
        "ideal G = std(I);",
        'print("RED1");', "reduce(1, G);", 'print("SIZE");', "size(G);",
        'print("END");', "quit;"])
    t0 = time.time()
    try:
        out = subprocess.run(["Singular", "-q"], input=script, capture_output=True,
                             text=True, timeout=timeout).stdout
        red = out.split("RED1")[1].split("SIZE")[0].strip()
        size = int(out.split("SIZE")[1].split("END")[0].strip())
        return {"unit": red == "0", "gb_size": size, "secs": round(time.time() - t0, 3)}
    except subprocess.TimeoutExpired:
        return {"unit": None, "gb_size": None, "secs": round(time.time() - t0, 3)}
    except Exception as e:
        return {"unit": None, "gb_size": None, "secs": round(time.time() - t0, 3),
                "error": f"{type(e).__name__}: {e}", "raw": out[:400] if 'out' in dir() else ""}


def msolve_empty(varlist, polys, timeout=60, threads=1):
    """msolve char-0 SOLVE mode.  'empty' ([-1]) / 'nonempty' / 'timeout'."""
    inp = ",".join(varlist) + "\n0\n" + ",\n".join(polys) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    t0 = time.time()
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", str(threads)],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        res = "empty" if raw.startswith("[-1]") else "nonempty"
    except subprocess.TimeoutExpired:
        res = "timeout"
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass
    return res, round(time.time() - t0, 3)


# ---------------------------------------------------------------------------
# Faithful port of the record's mining oracle (original-label gauge) — Tier B
# ---------------------------------------------------------------------------
def coord_orig(p):
    if p == 0:
        return (sympy.Integer(0), sympy.Integer(0))
    if p == 1:
        return (sympy.Integer(1), sympy.Integer(0))
    return (_sym(f"x{p}x"), _sym(f"x{p}y"))


def d2_orig(a, b):
    ax, ay = coord_orig(a)
    bx, by = coord_orig(b)
    return (ax - bx) ** 2 + (ay - by) ** 2


def sat_system_orig(cube, P):
    """(varlist, expanded polys, groups, nrel) — mine.py's stage2 system."""
    g = groups_of(cube, P)
    eq = []
    for c, M in sorted(g.items()):
        base = d2_orig(c, M[0])
        for m in M[1:]:
            eq.append(base - d2_orig(c, m))
    xv = [f"x{p}{ax}" for p in sorted(P) if p >= 2 for ax in ("x", "y")]
    pairs = list(combinations(sorted(P), 2))
    tv = [f"t{i}" for i in range(len(pairs))]
    sat = [_sym(f"t{i}") * d2_orig(a, b) - 1 for i, (a, b) in enumerate(pairs)]
    polys = [str(sympy.expand(p)).replace("**", "^") for p in eq + sat]
    return xv + tv, polys, g, nrel_of_groups(g)


def min_support(cube, kmax=7, workers=14, search_to=1.5):
    """Faithful port of mine.py min_support (exhaustive, saturated oracle)."""
    ktimeouts = {}
    for k in range(4, kmax + 1):
        cand = list(combinations(range(N), k))

        def test(P):
            allv, polys, g, nrel = sat_system_orig(cube, P)
            neq = sum(len(M) - 1 for M in g.values())
            if neq < 2:
                return P, "nonempty", g, nrel
            v, _ = msolve_empty(allv, polys, timeout=search_to)
            return P, v, g, nrel

        dead, nto = [], 0
        with ThreadPoolExecutor(max_workers=workers) as ex:
            for P, v, g, nrel in ex.map(test, cand):
                if v == "empty":
                    dead.append((P, g, nrel))
                elif v == "timeout":
                    nto += 1
        ktimeouts[k] = nto
        if dead:
            return {"k": k, "cores": [(list(P), g, nrel) for P, g, nrel in dead],
                    "ktimeouts": ktimeouts,
                    "residual_timeout_below_kstar":
                        sum(ktimeouts.get(j, 0) for j in range(4, k))}
    return {"k": None, "cores": [], "ktimeouts": ktimeouts,
            "residual_timeout_below_kstar": sum(ktimeouts.values())}


# ---------------------------------------------------------------------------
# Row classification (the dichotomy bit + secondary bits) for one core
# ---------------------------------------------------------------------------
def classify_core(core_id, slice_, kind, cube_idx, P, groups, weights=None,
                  with_pairs=True, gb_timeout=120):
    k, grel = relabel_core(P, groups)
    R = nrel_of_groups(groups)
    delta = R - (2 * k - 4)
    canon = canonical(edges_of_groups(groups))

    # main bit: full system (pins + all-pairs Rabinowitsch), reduced GB over QQ
    allv, polys = encode_core(k, grel, pins=True, rab_pairs="all")
    sg = singular_gb(allv, polys, timeout=gb_timeout)
    ms, ms_secs = msolve_empty(allv, polys, timeout=60)

    # secondary: pinned base (equality-only) emptiness
    bv, bp = encode_core(k, grel, pins=True, rab_pairs="none")
    if bp:
        sb = singular_gb(bv, bp, timeout=60)
    else:
        sb = {"unit": False, "gb_size": 0, "secs": 0.0}

    # secondary: canonical single-pair kills (unpinned equalities + one separator)
    killing, kill_unknown = [], 0
    if with_pairs:
        for (a, b) in combinations(range(k), 2):
            pv, pp = encode_core(k, grel, pins=False, rab_pairs="none",
                                 single_pair=(a, b))
            r, _ = msolve_empty(pv, pp, timeout=2.5)
            if r == "empty":
                s2 = singular_gb(pv, pp, timeout=30)
                if s2["unit"] is True:
                    killing.append([a, b])
                else:
                    kill_unknown += 1
            elif r == "timeout":
                kill_unknown += 1

    if sg["unit"] is True:
        verdict = "C_DEAD"
    elif sg["unit"] is False:
        verdict = "C_ALIVE_SATURATED"      # would be R-only-dead if really dead
    else:
        verdict = "UNRESOLVED_GB_TIMEOUT"
    row = {
        "core_id": core_id, "tier": kind, "slice": slice_, "cube_idx": cube_idx,
        "P": sorted(P), "k": k, "R": R, "delta": delta,
        "verdict": verdict,
        "gb_size": sg["gb_size"], "gb_secs": sg["secs"],
        "msolve": ms, "msolve_secs": ms_secs,
        "msolve_agree": (ms == "empty") == (sg["unit"] is True) if sg["unit"] is not None and ms != "timeout" else None,
        "base_pinned_empty": sb["unit"],
        "mode": ("Cempty" if sb["unit"] is True else
                 ("nodistinct" if sb["unit"] is False else "base_timeout")),
        "n_killing_pairs": len(killing) if with_pairs else None,
        "killing_pairs": killing if with_pairs else None,
        "killing_unknown": kill_unknown if with_pairs else None,
        "canon": str(canon),
        "canon_h": hashlib.sha1(str(canon).encode()).hexdigest()[:10],
    }
    if weights:
        row.update(weights)
    return row


def append_rows(path, rows):
    with open(path, "a") as f:
        for r in rows:
            f.write(json.dumps(r) + "\n")


# ---------------------------------------------------------------------------
# Record loading
# ---------------------------------------------------------------------------
def load_record(prof):
    with open(f"{IMP}/result_{prof}.json") as f:
        return json.load(f)


def load_dead_jsonl(prof):
    cubes = []
    with open(f"{PORT}/_u12_dead_{prof}.jsonl") as f:
        for ln in f:
            d = json.loads(ln)
            cubes.append({int(k): v for k, v in d.items()})
    return cubes


def sample_of_record(prof, M):
    cubes, _ = sample_cubes(PROFILES[prof], 2000, 7)
    return cubes[:M]


# ---------------------------------------------------------------------------
# Phase: smoke
# ---------------------------------------------------------------------------
def smoke():
    res = {"pass": True, "gates": {}}

    def gate(name, ok, detail):
        res["gates"][name] = {"ok": bool(ok), "detail": detail}
        print(f"[smoke] {name}: {'OK' if ok else 'FAIL'} — {detail}", flush=True)
        if not ok:
            res["pass"] = False

    # (i) toy C-dead systems
    g = singular_gb(["x", "y", "t"], ["x-y", "t*(x-y)-1"])
    gate("i.toy_linear", g["unit"] is True and g["gb_size"] == 1,
         f"<x-y, t(x-y)-1> reduced GB size={g['gb_size']} unit={g['unit']}")
    g = singular_gb(["x", "y", "t"], ["x-y", "t*(x-y)^2-1"])
    gate("i.toy_squared", g["unit"] is True,
         f"<x-y, t(x-y)^2-1> unit={g['unit']}")
    g = singular_gb(["x", "y"], ["x-y"])
    gate("i.toy_negative_control", g["unit"] is False,
         f"<x-y> alone unit={g['unit']} (must be False)")

    # (R0) determinism of the seed-7 sample vs record Cempty labels
    for prof, M in (("654", 120), ("555", 60)):
        rec = load_record(prof)
        cubes = sample_of_record(prof, M)
        dead_keys = set()
        for cb in load_dead_jsonl(prof):
            dead_keys.add(tuple(tuple(cb[p]) for p in range(N)))
        n_ce = sum(1 for cb in cubes
                   if tuple(tuple(cb[p]) for p in range(N)) in dead_keys)
        ok = n_ce == rec["n_Cempty"]
        mism = 0
        for pc in rec["percube"]:
            cb = cubes[pc["idx"]]
            isce = tuple(tuple(cb[p]) for p in range(N)) in dead_keys
            if isce != pc["Cempty"]:
                mism += 1
        gate(f"R0.sample_determinism_{prof}", ok and mism == 0,
             f"prefix-{M} Cempty {n_ce} (rec {rec['n_Cempty']}); percube mismatches {mism}")

    # (R1) delta distribution reproduction (654; memory: {-1:6,0:56,1:79,2:5})
    rec = load_record("654")
    overdet = Counter()
    for cf, info in rec["classes"].items():
        out = {}
        for u_, v_ in info["rep_edges"]:
            out.setdefault(u_, set()).add(v_)
        Rr = sum(len(s) - 1 for s in out.values() if len(s) >= 2)
        overdet[Rr - (2 * info["nv"] - 4)] += 1
    gate("R1.delta_654", dict(overdet) == {-1: 6, 0: 56, 1: 79, 2: 5},
         f"{dict(sorted(overdet.items()))}")

    # (ii-eq) equality-only encoding vs recorded stage-1 verdicts.
    # DEAD side: 3 cubes per slice from _u12_dead_*.jsonl -> msolve [-1] and
    # Singular unit. ALIVE side: 654: 3 cubes from _u12_alive_654.jsonl;
    # 555: 3 record-sample cubes with Cempty=False (no alive-555 jsonl exists).
    # Gate standard mirrors the census DEAD spot-confirm (its record: 23
    # confirmed / 2 Singular timeouts / 0 disagreements at cube scale):
    # msolve must reproduce the recorded DEAD verdict on 3/3; Singular must
    # never DISAGREE (unit=False is a hard fail); Singular timeouts at
    # whole-cube scale (20 vars) are soft — require >=2/3 confirms. The
    # deliverable systems are cores (<=6 points), where GBs complete fast.
    rng = random.Random(20260706)
    for prof in ("654", "555"):
        dead = load_dead_jsonl(prof)
        picks = rng.sample(range(len(dead)), 3)
        ms_ok, sg_conf, sg_dis, sg_to = [], 0, 0, 0
        for i in picks:
            cube = dead[i]
            g_full = groups_of(cube, list(range(N)))
            k, grel = relabel_core(list(range(N)), g_full)
            bv, bp = encode_core(k, grel, pins=True, rab_pairs="none")
            r, _ = msolve_empty(bv, bp, timeout=120)
            s = singular_gb(bv, bp, timeout=300)
            ms_ok.append(r == "empty")
            if s["unit"] is True:
                sg_conf += 1
            elif s["unit"] is None:
                sg_to += 1
            else:
                sg_dis += 1
        gate(f"ii-eq.dead_{prof}",
             all(ms_ok) and sg_dis == 0 and sg_conf >= 2,
             f"3 dead cubes idx {picks}: msolve [-1] {ms_ok}; Singular "
             f"confirm/timeout/disagree = {sg_conf}/{sg_to}/{sg_dis}")
    alive654 = []
    with open(f"{PORT}/_u12_alive_654.jsonl") as f:
        for ln in f:
            d = json.loads(ln)
            alive654.append({int(kk): v for kk, v in d.items()})
    picks = rng.sample(range(len(alive654)), 3)
    oks = []
    for i in picks:
        cube = alive654[i]
        g_full = groups_of(cube, list(range(N)))
        k, grel = relabel_core(list(range(N)), g_full)
        bv, bp = encode_core(k, grel, pins=True, rab_pairs="none")
        r, _ = msolve_empty(bv, bp, timeout=120)
        oks.append(r == "nonempty")
    gate("ii-eq.alive_654", all(oks),
         f"3 alive cubes idx {picks}: equality-only msolve nonempty = {oks}")
    rec5 = load_record("555")
    ca_idx = [pc["idx"] for pc in rec5["percube"] if not pc["Cempty"]][:3]
    cubes5 = sample_of_record("555", 60)
    oks = []
    for i in ca_idx:
        cube = cubes5[i]
        g_full = groups_of(cube, list(range(N)))
        k, grel = relabel_core(list(range(N)), g_full)
        bv, bp = encode_core(k, grel, pins=True, rab_pairs="none")
        r, _ = msolve_empty(bv, bp, timeout=120)
        oks.append(r == "nonempty")
    gate("ii-eq.alive_555", all(oks),
         f"3 C-alive sample cubes idx {ca_idx}: equality-only msolve nonempty = {oks}")

    # (ii-wit) witnessed distinct-alive core-shaped system under the FULL
    # encoding must NOT be unit. Square + center, k=5, R=6, delta=0.
    # Witness: p0=(0,0) p1=(1,0) p2=(1,1) p3=(0,1) p4=(1/2,1/2).
    groups_w = {4: [0, 1, 2, 3], 0: [1, 3], 1: [0, 2], 2: [1, 3]}
    wit = {0: (0, 0), 1: (1, 0), 2: (1, 1), 3: (0, 1),
           4: (sympy.Rational(1, 2), sympy.Rational(1, 2))}
    okw = True
    for c, M in groups_w.items():
        d0 = (wit[c][0] - wit[M[0]][0]) ** 2 + (wit[c][1] - wit[M[0]][1]) ** 2
        for m in M[1:]:
            dm = (wit[c][0] - wit[m][0]) ** 2 + (wit[c][1] - wit[m][1]) ** 2
            okw = okw and sympy.simplify(d0 - dm) == 0
    for a, b in combinations(range(5), 2):
        dd = (wit[a][0] - wit[b][0]) ** 2 + (wit[a][1] - wit[b][1]) ** 2
        okw = okw and sympy.simplify(dd) != 0
    gate("ii-wit.witness_valid", okw, "square+center satisfies all 6 equalities, "
         "all 10 pairs separated (exact sympy)")
    wv, wp = encode_core(5, groups_w, pins=True, rab_pairs="all")
    r, _ = msolve_empty(wv, wp, timeout=120)
    s = singular_gb(wv, wp, timeout=300)
    gate("ii-wit.full_encoding_alive", r == "nonempty" and s["unit"] is False,
         f"full encoding: msolve={r}, Singular unit={s['unit']} "
         f"(gb_size={s['gb_size']}) — must be nonempty/False")

    # (ii-consistency, informative) full encoding on one recorded-ALIVE cube:
    # stage-2 record says ALL alive cubes are distinct-DEAD, so expect unit.
    cube = alive654[picks[0]]
    g_full = groups_of(cube, list(range(N)))
    k, grel = relabel_core(list(range(N)), g_full)
    fv, fp = encode_core(k, grel, pins=True, rab_pairs="all")
    r, rs = msolve_empty(fv, fp, timeout=900)
    gate("ii-consistency.alive_cube_saturated", r == "empty",
         f"alive-654 cube idx {picks[0]} full saturation: msolve={r} in {rs}s "
         f"(stage-2 record: distinct-DEAD; the literal task gate premise "
         f"'alive cube has a real solution' is contradicted by the record — "
         f"substitution documented in report)")

    # (R2) re-mine record cubes and compare (k*, n_cores, classes)
    for prof, idxs in (("654", [0, 1]), ("555", [0])):
        rec = load_record(prof)
        cubes = sample_of_record(prof, rec["M"])
        for i in idxs:
            r = min_support(cubes[i], kmax=7, workers=14, search_to=1.5)
            pc = rec["percube"][i]
            classes_mine = sorted({str(canonical(edges_of_groups(g)))
                                   for _, g, _ in r["cores"]})
            classes_rec = sorted(set(pc["classes"]))
            ok = (r["k"] == pc["k"] and len(r["cores"]) == pc["n_cores"]
                  and classes_mine == classes_rec)
            gate(f"R2.remine_{prof}_cube{i}", ok,
                 f"k*={r['k']}(rec {pc['k']}) n_cores={len(r['cores'])}"
                 f"(rec {pc['n_cores']}) classes match={classes_mine == classes_rec}")

    with open(f"{HERE}/smoke_results.json", "w") as f:
        json.dump(res, f, indent=2)
    print(f"[smoke] overall: {'PASS' if res['pass'] else 'FAIL'}", flush=True)
    return 0 if res["pass"] else 1


# ---------------------------------------------------------------------------
# Phase: tierA — all record classes
# ---------------------------------------------------------------------------
def tierA(workers=10):
    out = f"{HERE}/rows_tierA.jsonl"
    if os.path.exists(out):
        os.unlink(out)
    tasks = []
    for prof in ("654", "555"):
        rec = load_record(prof)
        cubes = sample_of_record(prof, rec["M"])
        for cf, info in rec["classes"].items():
            cube = cubes[info["rep_cube"]]
            P = info["rep_P"]
            g = groups_of(cube, P)
            # validation: re-derived edges must equal rep_edges
            e_mine = sorted(tuple(e) for e in edges_of_groups(g))
            e_rec = sorted(tuple(e) for e in info["rep_edges"])
            assert e_mine == e_rec, f"edge mismatch {prof} {cf}"
            cid = f"{prof}:class:{hashlib.sha1(cf.encode()).hexdigest()[:10]}"
            tasks.append((cid, prof, info["rep_cube"], P, g,
                          {"n_cores": info["n_cores"], "n_cubes": info["n_cubes"],
                           "is_u1": info["is_u1"], "rec_canon": cf}))
    print(f"# tierA: {len(tasks)} class representatives", flush=True)
    t0 = time.time()
    done = [0]

    def run(t):
        cid, prof, ci, P, g, w = t
        return classify_core(cid, prof, "A-classrep", ci, P, g, weights=w)

    rows = []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        for row in ex.map(run, tasks):
            rows.append(row)
            done[0] += 1
            if done[0] % 20 == 0 or done[0] == len(tasks):
                vc = Counter(r["verdict"] for r in rows)
                print(f"  {done[0]}/{len(tasks)} verdicts={dict(vc)} "
                      f"({time.time()-t0:.0f}s)", flush=True)
    # class canon must match the record's key (sanity)
    mismatch = [r for r in rows if r["canon"] != r["rec_canon"]]
    print(f"# tierA canon-vs-record mismatches: {len(mismatch)}", flush=True)
    append_rows(out, rows)
    vc = Counter(r["verdict"] for r in rows)
    print(f"# tierA DONE: {dict(vc)}; rows -> {out}", flush=True)


# ---------------------------------------------------------------------------
# Phase: tierC — complete abstract k=4 universe
# ---------------------------------------------------------------------------
def tierC(workers=10):
    out = f"{HERE}/rows_tierC.jsonl"
    if os.path.exists(out):
        os.unlink(out)
    k = 4
    others = {v_: [u_ for u_ in range(k) if u_ != v_] for v_ in range(k)}
    per_vertex = []
    for v_ in range(k):
        subs = []
        for rr in range(0, k):
            subs += [frozenset(c) for c in combinations(others[v_], rr)]
        per_vertex.append(subs)
    seen = {}
    for combo in product(*per_vertex):
        g = {v_: sorted(combo[v_]) for v_ in range(k) if len(combo[v_]) >= 2}
        if not g:
            continue
        cf = canonical(edges_of_groups(g))
        if cf not in seen:
            seen[cf] = g
    print(f"# tierC: {len(seen)} distinct abstract k=4 constraint classes "
          f"(>=1 active vertex)", flush=True)

    def run(item):
        cf, g = item
        cid = f"abs4:class:{hashlib.sha1(str(cf).encode()).hexdigest()[:10]}"
        return classify_core(cid, "abstract", "C-abstract4", None,
                             list(range(4)), g, with_pairs=False)

    rows = []
    with ThreadPoolExecutor(max_workers=workers) as ex:
        for row in ex.map(run, list(seen.items())):
            rows.append(row)
    vc = Counter(r["verdict"] for r in rows)
    dead = [r for r in rows if r["verdict"] == "C_DEAD"]
    print(f"# tierC verdicts: {dict(vc)}; dead classes = {len(dead)}", flush=True)
    for r in sorted(dead, key=lambda r: (r["R"], r["canon"])):
        print(f"    R={r['R']} delta={r['delta']} canon={r['canon']}", flush=True)
    append_rows(out, rows)
    # containment check: every nv=4 record class must be among the dead canon set
    dead_canons = {r["canon"] for r in dead}
    for prof in ("654", "555"):
        rec = load_record(prof)
        nv4 = [cf for cf, info in rec["classes"].items() if info["nv"] == 4]
        missing = [cf for cf in nv4 if cf not in dead_canons]
        print(f"# tierC containment {prof}: {len(nv4)} nv=4 record classes, "
              f"{len(missing)} NOT in abstract dead set "
              f"{'(FAIL)' if missing else '(OK)'}", flush=True)


# ---------------------------------------------------------------------------
# Phase: tierB — fresh mining from the dead JSONL files
# ---------------------------------------------------------------------------
def tierB(cubes_per_slice=40, seed=20260706, budget_min=None, workers=14):
    out = f"{HERE}/rows_tierB.jsonl"
    prog = f"{HERE}/tierB_progress.json"
    done_idx = {"654": set(), "555": set()}
    if os.path.exists(prog):
        with open(prog) as f:
            saved = json.load(f)
        done_idx = {k: set(v) for k, v in saved["done_idx"].items()}
    t0 = time.time()
    rng = random.Random(seed)
    plan = {}
    for prof in ("654", "555"):
        dead = load_dead_jsonl(prof)
        idxs = rng.sample(range(len(dead)), min(cubes_per_slice, len(dead)))
        plan[prof] = (dead, idxs)
    for prof in ("654", "555"):
        dead, idxs = plan[prof]
        for ci in idxs:
            if ci in done_idx[prof]:
                continue
            if budget_min and (time.time() - t0) / 60 > budget_min:
                print(f"# tierB: budget reached; stopping", flush=True)
                break
            tc0 = time.time()
            r = min_support(dead[ci], kmax=7, workers=workers, search_to=1.5)
            rows = []
            for P, g, nrel in r["cores"]:
                cid = f"{prof}:deadfile-cube{ci}:P{'-'.join(map(str, P))}"
                rows.append(classify_core(cid, prof, "B-instance", ci, P, g,
                                          weights={"kstar": r["k"],
                                                   "resid_to": r["residual_timeout_below_kstar"]},
                                          with_pairs=False))
            append_rows(out, rows)
            done_idx[prof].add(ci)
            with open(prog, "w") as f:
                json.dump({"done_idx": {k: sorted(v) for k, v in done_idx.items()}}, f)
            vc = Counter(x["verdict"] for x in rows)
            print(f"  [{prof}] cube {ci}: k*={r['k']} cores={len(rows)} "
                  f"verdicts={dict(vc)} resid_to={r['residual_timeout_below_kstar']} "
                  f"({time.time()-tc0:.0f}s; total {(time.time()-t0)/60:.1f}m)", flush=True)
    print("# tierB DONE", flush=True)


# ---------------------------------------------------------------------------
# Phase: orderings — gate (iii)
# ---------------------------------------------------------------------------
def orderings():
    rows = [json.loads(ln) for ln in open(f"{HERE}/rows_tierA.jsonl")]
    picks = {}
    for r in rows:
        if r["verdict"] != "C_DEAD":
            continue
        key = (r["slice"], r["delta"])
        if key not in picks:
            picks[key] = r
    results = []
    for (prof, delta), r in sorted(picks.items()):
        rec = load_record(prof)
        info = rec["classes"][r["rec_canon"]]
        cubes = sample_of_record(prof, rec["M"])
        cube = cubes[info["rep_cube"]]
        g = groups_of(cube, info["rep_P"])
        k, grel = relabel_core(info["rep_P"], g)
        allv, polys = encode_core(k, grel, pins=True, rab_pairs="all")
        s_lp = singular_gb(allv, polys, timeout=300, order="lp")
        s_rev = singular_gb(allv, polys, timeout=300, order="dp", reverse_vars=True)
        ok = s_lp["unit"] is True and s_rev["unit"] is True
        results.append({"slice": prof, "delta": delta, "core_id": r["core_id"],
                        "lp_unit": s_lp["unit"], "lp_secs": s_lp["secs"],
                        "revdp_unit": s_rev["unit"], "revdp_secs": s_rev["secs"],
                        "ok": ok})
        print(f"[orderings] {prof} delta={delta}: lp unit={s_lp['unit']} "
              f"({s_lp['secs']}s), reversed-dp unit={s_rev['unit']} "
              f"({s_rev['secs']}s) {'OK' if ok else 'FAIL'}", flush=True)
    with open(f"{HERE}/orderings.json", "w") as f:
        json.dump(results, f, indent=2)
    allok = all(x["ok"] for x in results)
    print(f"[orderings] overall: {'PASS' if allok else 'FAIL'}", flush=True)


# ---------------------------------------------------------------------------
# Phase: report — merge rows + print tables
# ---------------------------------------------------------------------------
def report():
    merged = f"{HERE}/per_core_dichotomy.jsonl"
    rows = []
    for part in ("rows_tierA.jsonl", "rows_tierB.jsonl", "rows_tierC.jsonl"):
        p = f"{HERE}/{part}"
        if os.path.exists(p):
            rows += [json.loads(ln) for ln in open(p)]
    with open(merged, "w") as f:
        for r in rows:
            f.write(json.dumps(r) + "\n")
    print(f"# merged {len(rows)} rows -> {merged}", flush=True)

    def table(rws, title, keys):
        print(f"\n== {title} ==", flush=True)
        c = Counter(tuple(r[k] for k in keys) for r in rws)
        for kk, v in sorted(c.items(), key=lambda x: str(x[0])):
            print(f"  {dict(zip(keys, kk))}: {v}", flush=True)

    A = [r for r in rows if r["tier"] == "A-classrep"]
    B = [r for r in rows if r["tier"] == "B-instance"]
    C = [r for r in rows if r["tier"] == "C-abstract4"]
    table(A, "Tier A (record classes) — verdict x slice", ["slice", "verdict"])
    table(A, "Tier A — slice x k x delta x verdict", ["slice", "k", "delta", "verdict"])
    table(A, "Tier A — mode (pinned base) x slice", ["slice", "mode"])
    kp = Counter((r["slice"], r["n_killing_pairs"] and r["n_killing_pairs"] > 0)
                 for r in A if r["n_killing_pairs"] is not None)
    print(f"\nsingle-separator-kill classes (>=1 killing pair): {dict(kp)}", flush=True)
    # weighted by n_cubes / n_cores
    wc = Counter()
    for r in A:
        wc[(r["slice"], r["verdict"])] += r.get("n_cores", 1)
    print(f"\nTier A weighted by n_cores: {dict(wc)}", flush=True)
    if B:
        table(B, "Tier B (fresh instances) — verdict x slice", ["slice", "verdict"])
        table(B, "Tier B — slice x k x delta x verdict", ["slice", "k", "delta", "verdict"])
        # cross-tier consistency: same canon => same verdict
        av = {r["canon"]: r["verdict"] for r in A}
        agree = sum(1 for r in B if r["canon"] in av and av[r["canon"]] == r["verdict"])
        known = sum(1 for r in B if r["canon"] in av)
        newc = len({r["canon"] for r in B} - set(av))
        print(f"\nTier B canon known in Tier A: {known}/{len(B)}; verdict agree "
              f"{agree}/{known}; NEW classes: {newc}", flush=True)
    if C:
        table(C, "Tier C (abstract k=4) — verdict", ["verdict"])
    ok_ms = sum(1 for r in rows if r.get("msolve_agree") is True)
    print(f"\nmsolve-vs-Singular agreement: {ok_ms}/{len([r for r in rows if r.get('msolve_agree') is not None])}",
          flush=True)
    gbs = [r["gb_secs"] for r in rows if r["gb_secs"] is not None]
    print(f"GB time: max={max(gbs):.2f}s median={sorted(gbs)[len(gbs)//2]:.2f}s", flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("phase", choices=["smoke", "tierA", "tierB", "tierC",
                                      "orderings", "report"])
    ap.add_argument("--cubes", type=int, default=40)
    ap.add_argument("--seed", type=int, default=20260706)
    ap.add_argument("--budget-min", type=int, default=None)
    ap.add_argument("--workers", type=int, default=10)
    args = ap.parse_args()
    if args.phase == "smoke":
        sys.exit(smoke())
    elif args.phase == "tierA":
        tierA(workers=args.workers)
    elif args.phase == "tierB":
        tierB(cubes_per_slice=args.cubes, seed=args.seed,
              budget_min=args.budget_min, workers=args.workers)
    elif args.phase == "tierC":
        tierC(workers=args.workers)
    elif args.phase == "orderings":
        orderings()
    else:
        report()
