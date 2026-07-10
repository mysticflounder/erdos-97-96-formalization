#!/usr/bin/env python3
"""Instrumented certify diagnostic for a hard-CERTFAIL pattern (default:
frontier pattern 0).  certify_pattern's `attempt()` collapses four distinct
failure modes into a single None ("FAILED"); this probe separates them so we
know WHICH fix the pattern needs, not just that it failed.

sing_run returns None ONLY on TimeoutExpired (miner.py:301) and discards the
partial stdout, so a timeout hides WHERE Singular died.  To localise it, each
system is run as TWO Singular calls:

  Stage A (no lift):  ring; I; G=std(I); dim(G); reduce(1,G)
    - times out            -> the Grobner basis std(I) is the wall
    - returns RED1 != 0    -> 1 not in this ideal via GB; NO lift can certify
    - returns RED1 == 0    -> ideal is fine, proceed to B
  Stage B (full lift): the real certify_pattern.attempt script
    - times out            -> the lift(I, ideal(1)) specifically is the wall
    - returns CHK != 1     -> lift produced a wrong witness
    - returns CHK == 1     -> would have certified (re-checked in exact Fractions)

Run for BOTH the shrunk system (few t-vars, certify's primary path) and the
all-pairs system (certify's fallback).  msolve already proved the all-pairs
ideal empty in 0.3s, so RED1 SHOULD be 0 for it IF Singular's std terminates;
if std does NOT terminate, the finding is 'Singular is the wrong engine for
this scale' and the certificate must come from msolve / another route.

Read-only wrt bank.jsonl.  Env overrides:
  PROBE_TA_SHRUNK PROBE_TB_SHRUNK PROBE_TA_ALL PROBE_TB_ALL  (per-call timeouts)
"""
import os
import sys
import time
from fractions import Fraction
from itertools import combinations

sys.path.insert(0, ".")
import census554_lib as L  # noqa: E402
import miner  # noqa: E402

PAT = {0: frozenset({2, 10}), 2: frozenset({0, 9, 10}),
       4: frozenset({2, 5, 9}), 5: frozenset({0, 2, 7}),
       7: frozenset({2, 9, 10})}

TA_SHRUNK = int(os.environ.get("PROBE_TA_SHRUNK", "600"))
TB_SHRUNK = int(os.environ.get("PROBE_TB_SHRUNK", "600"))
TA_ALL = int(os.environ.get("PROBE_TA_ALL", "900"))
TB_ALL = int(os.environ.get("PROBE_TB_ALL", "900"))


def build(gens):
    """Replicate certify_pattern.attempt's ring/render setup exactly."""
    vs = miner.used_vars(gens)
    tnames = {i: f"t{i - len(L.VARS)}" for i in vs if i >= len(L.VARS)}
    names = [miner.var_name(i, tnames) for i in vs]
    remap = {i: k for k, i in enumerate(vs)}

    def render(p):
        q = {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in p.items()}
        return L.poly_str(q, varnames=names)
    return names, remap, [render(g) for g in gens]


def _extract(out, key):
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith(key):
            return ln[len(key):].strip()
    return None


def stage_a(gens, timeout, label):
    names, remap, gstrs = build(gens)
    script = "\n".join([
        f"ring r = 0, ({','.join(names)}), dp;",
        "ideal I = " + ",\n  ".join(gstrs) + ";",
        "ideal G = std(I);",
        'string("SDIM:", dim(G));',
        'string("RED1:", reduce(1, G));',
        "exit;"])
    t0 = time.time()
    out = miner.sing_run(script, timeout)
    dt = time.time() - t0
    if out is None:
        print(f"[A:{label}] TIMEOUT std/reduce at {timeout}s "
              f"(wall {dt:.0f}s) -> Grobner basis std(I) is the wall", flush=True)
        return None, None, True, dt
    sdim = _extract(out, "SDIM:")
    red1 = _extract(out, "RED1:")
    print(f"[A:{label}] returned {dt:.0f}s  SDIM={sdim}  RED1={red1!r}",
          flush=True)
    return sdim, red1, False, dt


def stage_b(gens, timeout, label):
    names, remap, gstrs = build(gens)
    script = "\n".join([
        f"ring r = 0, ({','.join(names)}), dp;",
        "ideal I = " + ",\n  ".join(gstrs) + ";",
        "ideal G = std(I);",
        'string("RED1:", reduce(1, G));',
        "matrix T = lift(I, ideal(1));",
        "poly chk = 0;",
        "int i;",
        "for (i = 1; i <= size(I); i = i + 1) { chk = chk + I[i]*T[i,1]; }",
        'string("CHK:", chk);',
        "exit;"])
    t0 = time.time()
    out = miner.sing_run(script, timeout)
    dt = time.time() - t0
    if out is None:
        print(f"[B:{label}] TIMEOUT full-lift at {timeout}s (wall {dt:.0f}s) "
              f"-> lift(I,ideal(1)) is the wall", flush=True)
        return True, None, None, dt
    red1 = _extract(out, "RED1:")
    chk = _extract(out, "CHK:")
    verdict = ("WOULD-CERTIFY" if chk == "1" else
               f"BAD-WITNESS chk={chk!r}" if red1 == "0" else
               f"RED1!=0 red1={red1!r}")
    print(f"[B:{label}] returned {dt:.0f}s  RED1={red1!r}  CHK={chk!r}  "
          f"-> {verdict}", flush=True)
    return False, red1, chk, dt


def main():
    polys, tags = miner.pattern_polys(PAT)
    pts = miner.pattern_points(PAT)
    print(f"pattern support {pts}, {len(polys)} equidistance generators",
          flush=True)

    all_pairs = [e for e in combinations(pts, 2) if e != (0, 1)]
    print(f"all-pairs Rabinowitsch: {len(all_pairs)} pairs "
          f"({len(all_pairs)} t-vars)", flush=True)

    # --- reproduce certify's shrink loop to obtain the shrunk pair set ---
    print("shrinking pair set with cheap msolve oracle "
          f"(CERT_SHRINK_TIMEOUT={miner.CERT_SHRINK_TIMEOUT}s) ...", flush=True)
    cur = list(all_pairs)
    for e in list(cur):
        if len(cur) == 1:
            break
        trial = [p for p in cur if p != e]
        rabs = miner.rabinowitsch_polys(PAT, pairs=trial)
        if miner.msolve_empty(polys + [r[0] for r in rabs],
                              timeout=miner.CERT_SHRINK_TIMEOUT):
            cur = trial
    print(f"shrunk to {len(cur)} pairs ({len(cur)} t-vars): {cur}", flush=True)

    shrunk_gens = polys + [r[0] for r in miner.rabinowitsch_polys(PAT, pairs=cur)]
    all_gens = polys + [r[0] for r in miner.rabinowitsch_polys(PAT, pairs=all_pairs)]

    print("\n=== SHRUNK system (certify primary path) ===", flush=True)
    sdim, red1, to, _ = stage_a(shrunk_gens, TA_SHRUNK, "shrunk")
    if not to and red1 == "0":
        stage_b(shrunk_gens, TB_SHRUNK, "shrunk")
    elif not to:
        print("[shrunk] RED1 != 0 -> shrunk ideal does not see 1; "
              "shrink over-reduced or GB incomplete; skipping lift", flush=True)

    print("\n=== ALL-PAIRS system (certify fallback path) ===", flush=True)
    sdim, red1, to, _ = stage_a(all_gens, TA_ALL, "allpairs")
    if not to and red1 == "0":
        stage_b(all_gens, TB_ALL, "allpairs")
    elif not to:
        print("[allpairs] RED1 != 0 while msolve says empty -> Singular GB "
              "disagrees with msolve; presentation/engine issue", flush=True)

    print("\nDONE", flush=True)


if __name__ == "__main__":
    main()
