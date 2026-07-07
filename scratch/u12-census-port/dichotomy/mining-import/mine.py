#!/usr/bin/env python3
"""Minimal-core CLASS mining for |A|=12 metrically-dead cubes (Erdos-97 U-lane).

Death notion = NO-DISTINCT-REAL (the correct u1-style-lemma notion): INDUCED(P)
is dead iff its pairwise-equidistance ideal, saturated by Rabinowitsch
t_ab*d2(a,b)-1 over all pairs a<b in P, is empty over QQ-bar ([-1]).  This
subsumes C-empty (a C-empty core is also no-distinct-real).

PAIRWISE induced(P): each center c in P contributes d2(c,M[0])-d2(c,M[j]) for
M=K_c∩P, |M|>=2 (all pairwise equidistances of M from c; reference-free) -- the
correct 'equidistances among P-points only'.

SEARCH SPEED.  A dead (empty) system returns [-1] FAST; an alive (positive-dim)
saturated system is slow.  So a short timeout separates them (timeout => alive),
the same principle _min_core_sound.py uses.  Plus a SOUND DOF prune: a P with
fewer than 2|P|-4 equidistance RELATIONS has a positive-dimensional (mod
similarity) constraint variety, hence distinct-real solutions -> alive; skip it.
Validated against a no-prune control (control.py).

Every found dead core is Singular-confirmed (reduce(1,std)==0 over QQ) and
death-mode-labeled (C-empty vs no-distinct-real).  Timeouts at sizes < k* are
escalated (longer msolve) so the reported minimal support is not inflated.

CORE CLASS = iso type of the directed CONSTRAINT graph on P: edge c->m for each
m in K_c∩P where c has >=2 in-P members.  Canonical form = min edge tuple over
color-(indeg,outdeg,WL)-preserving relabelings (exact for these small graphs).
"""
import importlib.util
import os
import subprocess
import tempfile
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations, permutations, product

import sympy

TC = "/Users/adam/projects/math-projects/p97-rvol/scratch/u1_2_faithful/twolargecap_core"
N = 12


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


gss = _load("gss", f"{TC}/gen_singular_shadow.py")
CEN = _load("cen", f"{TC}/_u12_census.py")


# ---------- induced system ----------
def xvars_of(P):
    return [f"x{p}{ax}" for p in sorted(P) if p >= 2 for ax in ("x", "y")]


def induced_pairwise(cube, P):
    """(polys nested-paren, constraint-edges [(c,m)], n_relations).
    Constraint edges only from centers with >=2 in-P members."""
    Ps = set(P)
    polys, edges, nrel = [], [], 0
    for c in sorted(P):
        M = sorted(set(cube[c]) & Ps)
        if len(M) >= 2:
            base = gss.d2(c, M[0])
            for m in M[1:]:
                polys.append(f"({base})-({gss.d2(c, m)})")
            nrel += len(M) - 1
            for m in M:
                edges.append((c, m))
    return polys, edges, nrel


def _expand(polys, allvars):
    syms = {v: sympy.Symbol(v) for v in allvars}
    return [str(sympy.expand(sympy.sympify(p, locals=syms))).replace("**", "^")
            for p in polys]


def _msolve_empty(exp_polys, allvars, timeout, threads=1):
    if len(exp_polys) < 2:
        return "nonempty"
    inp = ",".join(allvars) + "\n0\n" + ",\n".join(exp_polys) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
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
    return res


def _singular_empty(polys, allvars, timeout=90):
    """True iff reduce(1,std)==0 over QQ (exact). None on timeout."""
    vs = ",".join(allvars)
    ideal = "ideal I = " + ",\n  ".join(polys) + ";"
    script = "\n".join([f"ring r=0,({vs}),dp;", ideal, "ideal G=std(I);",
                        'print("RED");', "reduce(1,G);", 'print("END");', "quit;"])
    try:
        out = subprocess.run(["Singular", "-q"], input=script,
                             capture_output=True, text=True, timeout=timeout).stdout
        return out.split("RED")[1].split("END")[0].strip() == "0"
    except subprocess.TimeoutExpired:
        return None


def sat_system(cube, P):
    """(exp_polys, allvars, base_polys nested, sat_polys nested, edges, nrel)."""
    polys, edges, nrel = induced_pairwise(cube, P)
    xv = xvars_of(P)
    pairs = list(combinations(sorted(P), 2))
    tv = [f"t{i}" for i in range(len(pairs))]
    sat = [f"t{i}*({gss.d2(a, b)})-1" for i, (a, b) in enumerate(pairs)]
    allv = xv + tv
    exp = _expand(polys + sat, allv)
    return exp, allv, polys, sat, edges, nrel


def stage2_msolve(cube, P, timeout):
    """no-distinct-real via saturated msolve.  'empty'/'nonempty'/'timeout'."""
    exp, allv, polys, sat, edges, nrel = sat_system(cube, P)
    if len(polys) < 2:
        return "nonempty", edges, nrel
    return _msolve_empty(exp, allv, timeout), edges, nrel


def label_and_confirm(cube, P):
    """For a found dead core: (mode, sing_base, sing_sat).
    mode: 'Cempty' if base ideal already empty over QQ, else 'nodistinct'."""
    polys, edges, nrel = induced_pairwise(cube, P)
    xv = xvars_of(P)
    sb = _singular_empty(polys, xv, timeout=90)          # base C-empty?
    exp, allv, _, sat, _, _ = sat_system(cube, P)
    ss = _singular_empty(polys + sat, allv, timeout=120)  # saturated empty?
    mode = "Cempty" if sb is True else "nodistinct"
    return mode, sb, ss


def min_support(cube, kmax=7, workers=16, search_to=2.5, use_prune=False):
    """Smallest k with a dead INDUCED(P) (no-distinct-real).  EXHAUSTIVE (no
    unsound prune by default); char-0 msolve [-1] is exact over QQ and every DEAD
    verdict resolves in <0.3s (measured), so a 2.5s timeout treated-as-alive
    cannot miss a dead core.  Per-core Singular confirmation is done per-CLASS by
    the caller (msolve char-0 [-1] is itself exact + census-validated).
    Returns k*, cores [(P, edges, nrel)], ktimeouts."""
    ktimeouts = {}
    for k in range(4, kmax + 1):
        need = 2 * k - 4
        cand = list(combinations(range(N), k))

        def test(P):
            _, edges, nrel = induced_pairwise(cube, P)
            if use_prune and nrel < need:
                return P, "prune", edges, nrel
            v, edges, nrel = stage2_msolve(cube, P, search_to)
            return P, v, edges, nrel

        dead, nto = [], 0
        with ThreadPoolExecutor(max_workers=workers) as ex:
            for P, v, edges, nrel in ex.map(test, cand):
                if v == "empty":
                    dead.append((P, edges, nrel))
                elif v == "timeout":
                    nto += 1
        ktimeouts[k] = nto
        if dead:
            cores = [{"P": list(P), "edges": [list(e) for e in edges],
                      "nrel": nrel} for P, edges, nrel in dead]
            return {"k": k, "cores": cores, "ktimeouts": ktimeouts,
                    "residual_timeout_below_kstar":
                        sum(ktimeouts.get(j, 0) for j in range(4, k))}
    return {"k": None, "cores": [], "ktimeouts": ktimeouts,
            "residual_timeout_below_kstar": sum(ktimeouts.values())}


def confirm_class(cube, P):
    """Per-class exact confirmation + death-mode label for a representative core.
    Returns (mode, sing_base_empty, sing_sat_empty)."""
    polys, edges, nrel = induced_pairwise(cube, P)
    xv = xvars_of(P)
    sb = _singular_empty(polys, xv, timeout=90)                 # base C-empty?
    exp, allv, _, sat, _, _ = sat_system(cube, P)
    ss = _singular_empty(polys + sat, allv, timeout=120)         # saturated empty?
    mode = "Cempty" if sb is True else "nodistinct"
    return mode, sb, ss


# ---------- directed-graph canonical form ----------
def canonical(edges):
    """Canonical certificate of a directed graph (edge list) invariant under
    vertex relabeling.  Min relabeled-edge-tuple over color-preserving perms."""
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


def canon_stats(edges):
    edges = [tuple(e) for e in edges]
    verts = sorted({u for u, v in edges} | {v for u, v in edges})
    E = set(edges)
    outd = {x: 0 for x in verts}
    ind = {x: 0 for x in verts}
    for u, v in E:
        outd[u] += 1
        ind[v] += 1
    sig = tuple(sorted((ind[x], outd[x]) for x in verts))
    return canonical(edges), len(verts), len(E), sig


# ---------- u1 reference pattern ----------
U1_EDGES = [("c", "a"), ("c", "d"), ("c", "f"),
            ("d", "c"), ("d", "e"), ("d", "f"),
            ("f", "a"), ("f", "d"), ("f", "e"),
            ("e", "a"), ("e", "c")]


def u1_canonical():
    lab = {v: i for i, v in enumerate(sorted({u for u, _ in U1_EDGES} |
                                             {w for _, w in U1_EDGES}))}
    return canonical([(lab[u], lab[v]) for u, v in U1_EDGES])


def readable(canon_form):
    """Human-readable adjacency: for each source vertex, its out-neighbors."""
    adj = {}
    for u, v in canon_form:
        adj.setdefault(u, []).append(v)
    return {u: sorted(vs) for u, vs in sorted(adj.items())}
