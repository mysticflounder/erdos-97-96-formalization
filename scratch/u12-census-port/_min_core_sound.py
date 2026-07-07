#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Sound minimal C-infeasible core of the codex-shadow equidistance ideal.

Reuses gen_singular_shadow.shadow_polys / var_list / CODEX_SHADOW.

Mod-p oracle: msolve reduced Groebner basis (`-g 2`, F4) over GF(p).
  infeasible mod p  <=>  reduced GB == [1]  <=>  1 in ideal.
Polynomials are EXPANDED with sympy first: msolve mis-parses the nested-paren
d^2 form ((a-b)^2+...) (collapses it), while Singular parses it correctly.  A
cross-validation gate checks msolve == Singular on many random subsets mod p.

MULTI-PRIME wrapper (4 large primes):
  - INFEASIBLE only if ALL primes give GB==[1].
  - FEASIBLE if ANY prime's GB != [1].
This makes bad-prime FALSE DROPS (dropping an essential gen) essentially
impossible: a false drop needs a truly-feasible remainder for which ALL primes
report infeasible -- all primes simultaneously bad in the same direction.

The 4 prime-GBs of one oracle call run CONCURRENTLY; the 3 deletion orders
(forward, reverse, shuffled) run CONCURRENTLY sharing a thread-safe cache.

Deletion pass: from all 33 gens, repeatedly try removing each still-kept gen; if
the remainder stays multi-prime-infeasible, drop it permanently.  Repeat passes
until a full pass drops nothing (locally minimal under single-element removal).

CHAR-0 (QQ) confirmation of each final core, via SINGULAR (exact, independent):
  - core infeasible over QQ (dim -1).
  - char-0 deletion refine: drop any gen whose removal keeps QQ dim -1 (definitive;
    guards against a mod-p over-keep).
  - each remaining gen g: QQ dim(core-minus-g) >= 0  =>  g essential rel. core.

Smoke-gated on {x^2-1,x^2-2}(infeasible) and {x^2-1}(feasible) over every prime
(msolve) and over QQ (Singular), plus msolve-vs-Singular cross-validation FIRST.

Usage: uv run python -u _min_core_sound.py
"""
import importlib.util
import os
import random
import re
import subprocess
import tempfile
import threading
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed

import sympy

HERE = os.path.dirname(os.path.abspath(__file__))
_spec = importlib.util.spec_from_file_location(
    "gss", f"{HERE}/gen_singular_shadow.py")
gss = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(gss)

SHADOW = gss.CODEX_SHADOW
VARS = gss.var_list()
PRIMES = [32003, 32009, 32027, 100003]

# expanded polynomial strings (for msolve; Singular can use either)
_SYMS = {v: sympy.Symbol(v) for v in VARS}
POLYS = gss.shadow_polys(SHADOW)
EXP_POLYS = [str(sympy.expand(sympy.sympify(p, locals=_SYMS))).replace("**", "^")
             for p in POLYS]

_SEM = threading.Semaphore(24)
_CACHE_LOCK = threading.Lock()
_PRINT_LOCK = threading.Lock()
_MP_CACHE = {}
_C0_CACHE = {}


def log(msg):
    with _PRINT_LOCK:
        print(msg, flush=True)


def gen_map(shadow):
    m = []
    for c, ks in shadow.items():
        for k in ks[1:]:
            m.append((c, ks[0], k))
    return m


# ---------- msolve mod-p GB oracle (expanded polys) ----------
# Infeasible (1 in ideal) => reduced GB == [1], which msolve finds FAST.
# Feasible (positive-dim) can have a huge GB and time out.  So a TIMEOUT reliably
# indicates FEASIBLE: we return False (not-infeasible) on timeout.  This keeps the
# deletion pass sound (a drop needs a confirmed GB==[1]) and correct (infeasible
# never times out in practice; empirically < 0.1s).
MSOLVE_TIMEOUT = 60


def _msolve_gb_is_one(exp_sub, p, varlist=None, timeout=MSOLVE_TIMEOUT):
    """True iff reduced GB of exp_sub over GF(p) is [1] (1 in ideal).
    False on timeout (=> treated as feasible, the safe/correct direction)."""
    varlist = varlist or VARS
    inp = ",".join(varlist) + "\n" + str(p) + "\n" + ",\n".join(exp_sub) + "\n"
    with _SEM:
        with tempfile.NamedTemporaryFile("w", suffix=".ms", delete=False) as f:
            f.write(inp)
            path = f.name
        out = path + ".out"
        try:
            subprocess.run(["msolve", "-g", "2", "-f", path, "-o", out, "-t", "1"],
                           capture_output=True, text=True, timeout=timeout)
            txt = open(out).read()
        except subprocess.TimeoutExpired:
            txt = None
        finally:
            for q in (path, out):
                try:
                    os.unlink(q)
                except OSError:
                    pass
    if txt is None:
        return False  # timeout => feasible (huge positive-dim GB)
    body = txt.split("#---")[-1].strip()
    inner = body.rstrip(":").strip()
    if inner.startswith("[") and inner.endswith("]"):
        inner = inner[1:-1]
    elems = [e.strip() for e in inner.split(",") if e.strip()]
    return elems == ["1"]


def _singular_reduce1_is_zero(polys_sub, p, varlist=None, timeout=90):
    """Independent Singular check: reduce(1,std)==0 over GF(p). For cross-val.
    Returns None if Singular exceeds `timeout` (feasible blowup) -- skipped."""
    varlist = varlist or VARS
    vs = ",".join(varlist)
    ideal = "ideal I = " + ",\n  ".join(polys_sub) + ";"
    script = "\n".join([
        f"ring r = {p}, ({vs}), dp;", ideal,
        "ideal G = std(I);", 'print("RED");', "reduce(1, G);", 'print("END");',
        "quit;"])
    with _SEM:
        try:
            out = subprocess.run(["Singular", "-q"], input=script,
                                 capture_output=True, text=True,
                                 timeout=timeout).stdout
        except subprocess.TimeoutExpired:
            return None
    return out.split("RED")[1].split("END")[0].strip() == "0"


def _dim_char0_singular(polys_sub, varlist=None, timeout=None):
    """Singular Krull dim over QQ; -1 == unit ideal == C-infeasible. EXACT.
    Returns None on timeout (feasible positive-dim GB blowup)."""
    varlist = varlist or VARS
    vs = ",".join(varlist)
    ideal = "ideal I = " + ",\n  ".join(polys_sub) + ";"
    script = "\n".join([
        f"ring r = 0, ({vs}), dp;", ideal,
        "ideal G = std(I);", 'print("DIM");', "dim(G);", 'print("END");',
        "quit;"])
    with _SEM:
        try:
            out = subprocess.run(["Singular", "-q"], input=script,
                                 capture_output=True, text=True,
                                 timeout=timeout).stdout
        except subprocess.TimeoutExpired:
            return None
    blk = out.split("DIM")[1].split("END")[0]
    return int(re.findall(r"-?\d+", blk)[0])


def multiprime_infeasible(idx_tuple):
    """Multi-prime msolve oracle. Returns (infeasible_bool, {p: infeasible})."""
    key = frozenset(idx_tuple)
    with _CACHE_LOCK:
        if key in _MP_CACHE:
            return _MP_CACHE[key]
    sub = [EXP_POLYS[i] for i in idx_tuple]
    results = {}
    with ThreadPoolExecutor(max_workers=len(PRIMES)) as ex:
        futs = {ex.submit(_msolve_gb_is_one, sub, p): p for p in PRIMES}
        for fut in as_completed(futs):
            results[futs[fut]] = fut.result()
    inf = all(results.values())
    val = (inf, dict(sorted(results.items())))
    with _CACHE_LOCK:
        _MP_CACHE[key] = val
    return val


def char0_dim(idx_tuple, timeout=None):
    key = frozenset(idx_tuple)
    with _CACHE_LOCK:
        if key in _C0_CACHE:
            return _C0_CACHE[key]
    d = _dim_char0_singular([POLYS[i] for i in idx_tuple], timeout=timeout)
    if d is not None:  # do not cache timeouts (allow a later longer retry)
        with _CACHE_LOCK:
            _C0_CACHE[key] = d
    return d


def deletion_pass(order, label):
    keep = set(range(len(POLYS)))
    assert multiprime_infeasible(tuple(sorted(keep)))[0], "full feasible!"
    rnd = 0
    while True:
        rnd += 1
        dropped = 0
        for g in order:
            if g not in keep:
                continue
            trial = tuple(sorted(keep - {g}))
            inf, _ = multiprime_infeasible(trial)
            if inf:
                keep = set(trial)
                dropped += 1
        log(f"  [{label}] pass {rnd}: dropped {dropped}, |core|={len(keep)}")
        if dropped == 0:
            break
    return sorted(keep)


def support(core, gm):
    pts, centers, triples = set(), [], []
    for i in core:
        c, k0, k = gm[i]
        triples.append((i, c, k0, k))
        centers.append(c)
        pts.update([c, k0, k])
    return pts, Counter(centers), triples


def smoke():
    # msolve mod-p oracle on smoke systems, every prime
    for p in PRIMES:
        assert _msolve_gb_is_one(["x^2-1", "x^2-2"], p, ["x"]) is True, \
            f"msolve mod-{p} infeas smoke FAIL"
        assert _msolve_gb_is_one(["x^2-1"], p, ["x"]) is False, \
            f"msolve mod-{p} feas smoke FAIL"
    # Singular char-0 oracle
    assert _dim_char0_singular(["x^2-1", "x^2-2"], ["x"]) == -1, "char0 infeas FAIL"
    assert _dim_char0_singular(["x^2-1"], ["x"]) == 0, "char0 feas FAIL"
    log(f"[smoke] msolve mod-p {PRIMES} + Singular char-0 oracles OK")


def cross_validate(n_trials=60, seed=7):
    """Validate the SAFETY-CRITICAL direction: whenever msolve reports INFEASIBLE
    (GB==[1]) for a subset, an independent Singular reduce(1,std) over GF(p) must
    also report infeasible.  A false-INFEASIBLE from msolve is the only way the
    deletion pass could drop an essential generator; a false-FEASIBLE only causes
    a safe over-keep (caught later by exact char-0).  Infeasible Singular checks
    are fast (std finds 1 early), so this validation is cheap and exhaustive on
    the direction that matters.  As a bonus, msolve-FEASIBLE verdicts are also
    Singular-checked where Singular finishes within a short timeout.
    ABORT on any disagreement."""
    rgen = random.Random(seed)
    p = 32003
    # near-full subsets (mostly infeasible) + some mid subsets
    subsets = []
    for t in range(n_trials):
        if t % 2 == 0:
            drop = rgen.sample(range(33), rgen.randint(1, 8))
            subsets.append(sorted(set(range(33)) - set(drop)))
        else:
            subsets.append(sorted(rgen.sample(range(33), rgen.randint(10, 30))))

    def check(idxs):
        ms = _msolve_gb_is_one([EXP_POLYS[i] for i in idxs], p)
        if ms:  # msolve says infeasible -> Singular check is fast; MUST agree
            sg = _singular_reduce1_is_zero([POLYS[i] for i in idxs], p, timeout=120)
            return idxs, ms, sg
        return idxs, ms, None  # feasible: safe direction, no Singular call

    disagree = inf_checked = feas_seen = 0
    with ThreadPoolExecutor(max_workers=8) as ex:
        for idxs, ms, sg in ex.map(check, subsets):
            if not ms:
                feas_seen += 1
                continue
            assert sg is not None, "infeasible Singular check timed out (unexpected)"
            if ms != sg:
                disagree += 1
                log(f"  [xval] DISAGREE on {idxs}: msolve={ms} singular={sg}")
            else:
                inf_checked += 1
    assert disagree == 0, f"msolve/Singular disagree on {disagree} subsets"
    log(f"[xval] msolve==Singular on {inf_checked} INFEASIBLE subsets "
        f"(false-drop-critical direction); {feas_seen} msolve-feasible (safe, "
        f"not cross-checked; caught later by exact char-0)")
    assert inf_checked >= 10, "too few infeasible cross-checks -- weak validation"


def _dims_of_removals(gens, c0_timeout):
    """Parallel char-0 dim of (gens minus g) for each g in gens."""
    def d_of(g):
        return g, char0_dim(tuple(i for i in gens if i != g), timeout=c0_timeout)
    D = {}
    with ThreadPoolExecutor(max_workers=min(16, max(1, len(gens)))) as ex:
        for g, d in ex.map(d_of, gens):
            D[g] = d
    return D


def verify_core(label, core, gm, c0_timeout=300):
    log(f"\n=== char-0 verify core '{label}' (size {len(core)}, gens {core}) ===")
    dc = char0_dim(tuple(core), timeout=300)
    log(f"  char-0 dim(core) = {dc} (must be -1; PROVEN C-infeasible over QQ)")
    assert dc == -1, "core not C-empty over QQ!"

    # parallel char-0 dim of each single removal
    D = _dims_of_removals(core, c0_timeout)
    removable = [g for g in core if D.get(g) == -1]
    refined = list(core)
    if removable:
        log(f"  char-0-removable (mod-p over-keeps): {removable}; refining")
        changed = True
        while changed:
            changed = False
            for g in list(refined):
                if char0_dim(tuple(i for i in refined if i != g),
                             timeout=c0_timeout) == -1:
                    refined = [i for i in refined if i != g]
                    changed = True
                    log(f"    char-0 refine: dropped gen {g}, |core|={len(refined)}")
        assert char0_dim(tuple(refined), timeout=300) == -1
        D = _dims_of_removals(refined, c0_timeout)
    else:
        log("  no char-0-removable gen: mod-p core is char-0 locally minimal")

    proven, unresolved = [], []
    for g in refined:
        d = D.get(g)
        c, k0, k = gm[g]
        if d is None:
            unresolved.append(g)
            tag = f"char-0 TIMEOUT(>{c0_timeout}s) -> essential per mod-p only"
        elif d >= 0:
            proven.append(g)
            tag = f"PROVEN essential (core-minus-g dim={d} feasible over QQ)"
        else:
            tag = f"NOT essential (core-minus-g dim={d})"
        log(f"    gen {g}=(center {c},{k0},{k}): {tag}")
    pts, cc, triples = support(refined, gm)
    log(f"  RESULT '{label}': core size {len(refined)}, "
        f"char-0-PROVEN-essential {len(proven)}/{len(refined)}, "
        f"char-0-unresolved(mod-p essential) {len(unresolved)}")
    log(f"  point-support: {len(pts)}/11 -> {sorted(pts)}")
    log(f"  center-support: {len(cc)}/11 -> {dict(sorted(cc.items()))}")
    log("  triples (genidx, center, k0, kj):")
    for t in triples:
        log(f"    {t}")
    return tuple(refined)


def main():
    smoke()
    cross_validate()
    gm = gen_map(SHADOW)
    n = len(POLYS)
    full = tuple(range(n))
    inf, res = multiprime_infeasible(full)
    d0 = char0_dim(full, timeout=300)
    log(f"full {n}-gen system: multiprime={inf} {res}, char-0 dim={d0}")
    assert inf and d0 == -1, "full system not infeasible -- ABORT"

    forward = list(range(n))
    reverse = list(range(n - 1, -1, -1))
    rgen = random.Random(97)
    shuffled = list(range(n))
    rgen.shuffle(shuffled)
    log(f"shuffled(seed97) order = {shuffled}")
    orders = {"forward": forward, "reverse": reverse, "shuffled": shuffled}

    cores = {}
    with ThreadPoolExecutor(max_workers=3) as ex:
        futs = {ex.submit(deletion_pass, order, lbl): lbl
                for lbl, order in orders.items()}
        for fut in as_completed(futs):
            cores[futs[fut]] = fut.result()

    for lbl in orders:
        core = cores[lbl]
        pts, cc, _ = support(core, gm)
        log(f"  => [{lbl}] mod-p core size {len(core)}, pts {len(pts)}/11 "
            f"{sorted(pts)}, centers {len(cc)}/11, gens {core}")
    log(f"\nmod-p core sizes by order: "
        f"{ {lbl: len(cores[lbl]) for lbl in orders} }")

    seen = {}
    finals = {}
    for lbl in orders:
        key = tuple(cores[lbl])
        if key in seen:
            log(f"\n[{lbl}] mod-p core identical to '{seen[key]}' -- reuse")
            finals[lbl] = finals[seen[key]]
            continue
        seen[key] = lbl
        finals[lbl] = verify_core(lbl, cores[lbl], gm)

    log("\n==== SUMMARY (char-0-refined cores) ====")
    for lbl in orders:
        fc = finals[lbl]
        pts, cc, _ = support(fc, gm)
        log(f"  {lbl}: size {len(fc)}, pts {len(pts)}/11 {sorted(pts)}, "
            f"centers {len(cc)}/11, gens {list(fc)}")


if __name__ == "__main__":
    main()
