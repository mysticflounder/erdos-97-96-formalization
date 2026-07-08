#!/usr/bin/env python3
"""Exhaustive intra-cap dead-pattern classification for the (5,5,4) census.

CLAIM produced by this script (on clean completion): the emitted list is ALL
minimal dead patterns whose support lies inside a single cap (S = {1,2,3,4,5},
O1 = {0,2,6,7,8}, O2 = {0,1,9,10}), where
  - pattern = {center c: mask M_c}, |M_c| >= 2, c not in M_c  (miner.py sense),
  - "candidate-feasible": every M_c is contained in at least one C1+one-hit
    candidate class of c (L.candidates(c)) — masks that violate this occur in
    NO cube and are vacuous,
  - necessary C2/C4 filters (|M_p ∩ M_q| <= 2; every point-pair in <= 2 masks)
    prune patterns contained in no constraint-valid cube,
  - dead = miner deadness: pattern equalities + all-pairs Rabinowitsch ℂ-empty
    (msolve tri-state oracle; UNDECIDED recorded, never coerced),
  - minimal w.r.t. the census containment order (instance_subsumes): patterns
    are processed in increasing total-generator order, so every proper
    sub-pattern is tested first; both filters are monotone under mask shrink.
Every minimal dead pattern is certified exactly (Singular lift + python exact
Fraction identity re-check, miner.certify_pattern) and checked for
realizability (backtracking completion to a full constraint-valid cube).

Enumeration is exhaustive BY CONSTRUCTION over candidate-feasible intra-cap
patterns; dedupe is by AUTOS canonical form (verdicts AUTOS-invariant).

Smoke gate (mandatory, runs first; abort on failure):
  1. known banked intra-cap patterns are msolve-dead;
  2. a trivially satisfiable pattern is not dead;
  3. (post-enumeration) every banked intra-cap pattern is subsumed by a found
     minimal dead pattern's orbit.

Outputs (in scratch/census-554/):
  intracap_results.jsonl   one row per minimal dead canonical pattern
  intracap_certs/          exact certificates
  intracap.log             full log
"""

import json
import os
import subprocess
import sys
import tempfile
import time
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import census554_lib as L
import miner

sys.set_int_max_str_digits(0)

HERE = os.path.dirname(os.path.abspath(__file__))
CERTDIR = os.path.join(HERE, "intracap_certs")
RESULTS = os.path.join(HERE, "intracap_results.jsonl")
LOGFILE = os.path.join(HERE, "intracap.log")
os.makedirs(CERTDIR, exist_ok=True)

CAPS = {"S": L.S, "O1": L.O1, "O2": L.O2}

_logf = open(LOGFILE, "a")


def log(msg):
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    _logf.write(line + "\n")
    _logf.flush()


# ---------------- tri-state msolve oracle (None = timeout/undecided) --------

def msolve_empty3(polys, timeout):
    """True/False/None: ℂ-empty / nonempty / undecided (timeout)."""
    vs = miner.used_vars(polys)
    tnames = {i: f"t{i - len(L.VARS)}" for i in vs if i >= len(L.VARS)}
    names = [miner.var_name(i, tnames) for i in vs]
    remap = {i: k for k, i in enumerate(vs)}
    strs = []
    for p in polys:
        q = {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in p.items()}
        strs.append(L.poly_str(q, varnames=names))
    inp = ",".join(names) + "\n0\n" + ",\n".join(strs) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".ms", dir=miner.SCRATCH,
                                     delete=False) as f:
        f.write(inp)
        path = f.name
    out = path + ".out"
    try:
        subprocess.run(["msolve", "-f", path, "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
        return raw.startswith("[-1]")
    except subprocess.TimeoutExpired:
        return None
    finally:
        for q in (path, out):
            try:
                os.unlink(q)
            except OSError:
                pass


def pattern_dead3(pat, timeout):
    """Tri-state deadness via iterated pairwise saturation (Singular, exact).

    dead ⟺ V(pattern polys) ⊆ ∪_pairs V(d2(a,b))
         ⟺ 1 ∈ I : (∏ d2)^∞  =  (...(I : d2_1^∞) : d2_2^∞ ...) : d2_m^∞
    (standard: I:(fg)^∞ = (I:f^∞):g^∞).  Equivalent to the census miner's
    Rabinowitsch deadness, but with no t-variables — decides positive-
    dimensional alive systems (where msolve/GB-with-t-vars stall) in ~ms.
    Benchmarked 2026-07-08: 8/8 agreement with expected verdicts incl. two
    cases that stalled msolve AND plain-GB at 300+s (see intracap.log)."""
    polys, _ = miner.pattern_polys(pat)
    if not polys:
        return False
    pts = miner.pattern_points(pat)
    pairs = [e for e in combinations(pts, 2) if e != (0, 1)]
    vs = miner.used_vars(polys + [L.d2poly(a, b) for a, b in pairs])
    names = [L.VARS[i] for i in vs]
    remap = {i: k for k, i in enumerate(vs)}

    def render(p):
        q = {tuple(sorted((remap[i], e) for i, e in m)): c
             for m, c in p.items()}
        return L.poly_str(q, varnames=names)

    # NB: `S = sat(S, f)[1];` (self-assignment through the indexed proc
    # return) silently CORRUPTS the result in Singular 4.4.1 — verified
    # 2026-07-08: it returned a garbage 1-generator ideal (dim 4 -> 7,
    # impossible for saturation) on a provably-dead pattern.  Assigning via
    # an intermediate list variable is correct (matches a manual
    # iterated-quotient loop).  Do not "simplify" this back.
    lines = ['LIB "elim.lib";',
             f"ring r = 0, ({','.join(names)}), dp;",
             "ideal S = " + ",\n  ".join(render(g) for g in polys) + ";"]
    for a, b in pairs:
        lines.append(f"list LL = sat(S, {render(L.d2poly(a, b))});"
                     f" S = LL[1]; kill LL;")
    lines += ['string("RED1:", reduce(1, std(S)));', "exit;"]
    out = miner.sing_run("\n".join(lines), timeout)
    if out is None:
        return None
    verdict = None
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith("RED1:"):
            verdict = (ln == "RED1:0")
            break
    if verdict is False:
        # adversarial cross-check in the dangerous direction (a silent
        # wrong-ALIVE breaks classification completeness): if msolve
        # terminates and says EMPTY, the oracles conflict -> abort loudly.
        rabs = miner.rabinowitsch_polys(pat)
        m = msolve_empty3(polys + [r[0] for r in rabs], 5)
        if m is True:
            raise RuntimeError(
                f"ORACLE CONFLICT: itersat=alive, msolve=dead on {pat}")
    return verdict


# ---------------- enumeration ----------------

def center_mask_options(cap):
    """Candidate-feasible masks per center of the cap (support ⊆ cap)."""
    opts = {}
    for c in sorted(cap):
        cands = L.candidates(c)
        pool = sorted(cap - {c})
        ok = []
        for k in range(2, min(4, len(pool)) + 1):
            for M in combinations(pool, k):
                Mf = frozenset(M)
                if any(Mf <= K for K in cands):
                    ok.append(Mf)
        opts[c] = ok
    return opts


def pairwise_ok(pat):
    """Necessary C2/C4 conditions for containment in a valid cube."""
    cs = sorted(pat)
    for a, b in combinations(cs, 2):
        if len(pat[a] & pat[b]) > 2:          # C2: |K_a ∩ K_b| <= 2
            return False
    paircount = {}
    for c in cs:
        for e in combinations(sorted(pat[c]), 2):
            paircount[e] = paircount.get(e, 0) + 1
            if paircount[e] > 2:              # C4: pair covered <= 2 times
                return False
    return True


def enumerate_cap(capname, cap):
    opts = center_mask_options(cap)
    centers = [c for c in sorted(cap) if opts[c]]
    log(f"[{capname}] mask-carrying centers: "
        + ", ".join(f"{c}({len(opts[c])} masks)" for c in centers))
    pats = []

    def rec(i, cur):
        if i == len(centers):
            if cur:
                pats.append(dict(cur))
            return
        c = centers[i]
        rec(i + 1, cur)
        for M in opts[c]:
            cur[c] = M
            rec(i + 1, cur)
            del cur[c]

    rec(0, {})
    n_raw = len(pats)
    pats = [p for p in pats if pairwise_ok(p)]
    n_filt = len(pats)
    # AUTOS canonical dedupe
    seen, out = set(), []
    for p in sorted(pats, key=lambda p: (miner.n_gens(p), len(p))):
        ck = miner.canon_key(p)
        if ck in seen:
            continue
        seen.add(ck)
        out.append(p)
    log(f"[{capname}] raw {n_raw} -> C2/C4-filtered {n_filt} "
        f"-> canonical {len(out)}")
    return out


# ---------------- realizability (backtracking completion) ----------------

def realizable(pat, node_cap=2_000_000):
    """True/False/None: does a full constraint-valid cube contain pat?"""
    cands = {}
    for p in range(L.N):
        cs = L.candidates(p)
        if p in pat:
            cs = [K for K in cs if pat[p] <= K]
            if not cs:
                return False
        cands[p] = cs
    order = sorted(range(L.N), key=lambda p: len(cands[p]))
    nodes = [0]

    def bt(i, chosen, paircount):
        if i == len(order):
            return True
        nodes[0] += 1
        if nodes[0] > node_cap:
            return None
        p = order[i]
        for K in cands[p]:
            if any(len(K & Kq) > 2 for Kq in chosen.values()):
                continue
            pc2 = dict(paircount)
            bad = False
            for e in combinations(sorted(K), 2):
                pc2[e] = pc2.get(e, 0) + 1
                if pc2[e] > 2:
                    bad = True
                    break
            if bad:
                continue
            chosen[p] = K
            r = bt(i + 1, chosen, pc2)
            del chosen[p]
            if r is not False:
                return r
        return False

    return bt(0, {}, {})


# ---------------- smoke gate ----------------

KNOWN_INTRACAP = [
    # (pid, pattern) — the zero-cross-cap rows found in bank.jsonl 2026-07-08
    ("pat_00237", {0: {6, 7}, 6: {0, 7, 8}, 8: {0, 6, 7}}),
    ("pat_00423", {6: {2, 7, 8}, 7: {2, 6}, 8: {2, 6, 7}}),
    ("pat_00432", {3: {2, 4}, 4: {2, 3, 5}, 5: {2, 3, 4}}),
    ("pat_00707", {0: {6, 7}, 6: {7, 8}, 7: {0, 6, 8}, 8: {0, 6}}),
    ("pat_01711", {0: {2, 6, 7}, 6: {0, 2, 7}, 7: {6, 8}, 8: {0, 2}}),
    ("pat_02213", {0: {1, 9, 10}, 9: {0, 1}, 10: {0, 1, 9}}),
    ("pat_04388", {0: {7, 8}, 6: {0, 2, 8}, 7: {0, 2}, 8: {0, 7}}),
    ("pat_04401", {0: {2, 6, 8}, 6: {0, 2, 8}, 7: {0, 2}, 8: {0, 7}}),
]


def smoke():
    log("=== smoke gate ===")
    for pid, pat in KNOWN_INTRACAP[:3]:
        pf = {c: frozenset(M) for c, M in pat.items()}
        r = pattern_dead3(pf, 60)
        assert r is True, f"smoke FAIL: banked {pid} not msolve-dead (got {r})"
        log(f"  {pid}: dead ✓")
    sat_pat = {6: frozenset({0, 2})}
    r = pattern_dead3(sat_pat, 60)
    assert r is False, f"smoke FAIL: satisfiable pattern reported {r}"
    log("  trivial satisfiable pattern: not dead ✓")
    log("smoke gate PASS")


# ---------------- main ----------------

def main():
    t0 = time.time()
    smoke()

    minimal = []          # list of (capname, pat)
    subsume_insts = []    # orbit instances of found minimal dead patterns
    undecided = []

    for capname, cap in CAPS.items():
        cands = enumerate_cap(capname, cap)
        cands.sort(key=lambda p: (miner.n_gens(p), len(p)))
        # group by ngens; parallel msolve within a group, subsumption between
        by_g = {}
        for p in cands:
            by_g.setdefault(miner.n_gens(p), []).append(p)
        for g in sorted(by_g):
            grp = [p for p in by_g[g]
                   if not any(miner.instance_subsumes(d, p)
                              for d in subsume_insts)]
            skipped = len(by_g[g]) - len(grp)
            if not grp:
                if skipped:
                    log(f"[{capname}] gens={g}: all {skipped} subsumed")
                continue
            with ThreadPoolExecutor(max_workers=12) as ex:
                flags = list(ex.map(lambda p: pattern_dead3(p, 60), grp))
            retry = [p for p, f in zip(grp, flags) if f is None]
            if retry:
                log(f"[{capname}] gens={g}: {len(retry)} timeouts, "
                    f"retry at 600s")
                with ThreadPoolExecutor(max_workers=4) as ex:
                    rflags = list(ex.map(lambda p: pattern_dead3(p, 600),
                                         retry))
                rmap = dict(zip(map(id, retry), rflags))
                flags = [rmap.get(id(p), f) for p, f in zip(grp, flags)]
            dead_here = 0
            for p, f in zip(grp, flags):
                if f is None:
                    undecided.append((capname, p))
                elif f is True:
                    minimal.append((capname, p))
                    for img in miner.orbit(p):
                        subsume_insts.append(img)
                    dead_here += 1
            log(f"[{capname}] gens={g}: tested {len(grp)} "
                f"(skipped {skipped} subsumed) -> {dead_here} minimal dead")

    log(f"enumeration done: {len(minimal)} minimal dead canonical patterns, "
        f"{len(undecided)} UNDECIDED, wall {time.time()-t0:.0f}s")
    for capname, p in undecided:
        log(f"  UNDECIDED [{capname}]: {{ {p} }}")

    # post-enumeration smoke: every banked intra-cap pattern subsumed
    log("=== post-enumeration smoke: banked intra-cap rows subsumed ===")
    all_ok = True
    for pid, pat in KNOWN_INTRACAP:
        pf = {c: frozenset(M) for c, M in pat.items()}
        hit = any(miner.instance_subsumes(d, pf) for d in subsume_insts)
        log(f"  {pid}: {'subsumed ✓' if hit else 'NOT SUBSUMED ✗'}")
        all_ok = all_ok and hit
    assert all_ok, "post-enumeration smoke FAIL: banked row not covered"

    # certify + realizability
    log("=== certifying minimal dead patterns (Singular + exact Fractions) ===")
    rows = []
    for i, (capname, p) in enumerate(minimal):
        cert = miner.certify_pattern(p, timeout=600)
        if cert is None:
            log(f"  [{i:03d}] {capname} CERTFAIL {{ {p} }}")
            status = "CERTFAIL"
            certpath = None
            kill = None
        else:
            certpath = os.path.join(CERTDIR, f"intracap_{i:03d}.json")
            with open(certpath, "w") as f:
                json.dump(cert, f)
            status = "CERTIFIED"
            kill = cert["kill"]
        rz = realizable(p)
        rows.append({
            "idx": i,
            "cap": capname,
            "pattern": {str(c): sorted(p[c]) for c in sorted(p)},
            "n_gens": miner.n_gens(p),
            "n_orbit": len(miner.orbit(p)),
            "status": status,
            "kill": kill,
            "realizable": rz,
            "cert": os.path.relpath(certpath, HERE) if certpath else None,
        })
        log(f"  [{i:03d}] {capname} {status} kill={kill} "
            f"realizable={rz} gens={miner.n_gens(p)} "
            f"pat={{ {', '.join(f'{c}:{sorted(p[c])}' for c in sorted(p))} }}")

    with open(RESULTS, "w") as f:
        for r in rows:
            f.write(json.dumps(r) + "\n")
    ncert = sum(1 for r in rows if r["status"] == "CERTIFIED")
    log(f"DONE: {len(rows)} minimal dead, {ncert} certified, "
        f"{len(undecided)} undecided, wall {time.time()-t0:.0f}s")
    log(f"results -> {RESULTS}")


if __name__ == "__main__":
    main()
