#!/usr/bin/env python3
"""Coverage check: does every constrained |A|=12 cube contain the
u1TwoLargeCapObstruction incidence pattern?

The Lean lemma u1TwoLargeCapObstruction takes 5 points a,c,d,e,f (a!=c) and 7
distance equalities and derives False.  Squaring, the 7 equalities are pure
EQUIDISTANCE incidences (which point lies in which point's equidistant class
K_p).  So "the metric obstruction applies to a cube" reduces to a solver-free
set-embedding: find 5 DISTINCT labels a,c,d,e,f with

    K_c superset {a,d,f}    (h1: d in K_c ; h2: f in K_c ; a in K_c)
    K_d superset {c,e,f}    (h3: e in K_d ; h4: f in K_d ; c in K_d)
    K_f superset {a,d,e}    (h5: d in K_f ; h6: e in K_f ; a in K_f)
    K_e superset {a,c}      (h7: a in K_e ; c in K_e)

(no constraint on K_a; a is the forced-coincident apex).  If this pattern
embeds in EVERY constrained cube, coverage of the DoubleApexOffSurplusSharedRadiusPair
leaf is a bounded combinatorial fact, wireable through the single proven lemma.

Regenerates the exact census cubes (deterministic sampler, seed=7); no solver.
"""
import importlib.util
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(n, p):
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


CEN = _load("cen", f"{HERE}/_u12_census.py")


def contains_pattern(cube):
    """Return (a,c,d,e,f) witness tuple if the obstruction pattern embeds, else None."""
    K = {p: set(cube[p]) for p in cube}
    pts = list(cube.keys())
    for c in pts:
        for d in pts:
            if d == c or d not in K[c] or c not in K[d]:
                continue
            for f in pts:
                if f in (c, d) or f not in K[c] or f not in K[d] or d not in K[f]:
                    continue
                for e in pts:
                    if e in (c, d, f) or e not in K[d] or e not in K[f] or c not in K[e]:
                        continue
                    cand_a = (K[c] & K[f] & K[e]) - {c, d, e, f}
                    if cand_a:
                        a = min(cand_a)
                        return (a, c, d, e, f)
    return None


def run(profile, n_cubes, seed):
    prof = CEN.PROFILES[profile]
    cubes, att = CEN.sample_cubes(prof, n_cubes, seed)
    covered = 0
    misses = []
    for cube in cubes:
        w = contains_pattern(cube)
        if w is not None:
            covered += 1
        else:
            misses.append(cube)
    print(f"# profile {profile} caps={prof['caps']}: {len(cubes)} constrained cubes "
          f"({att} attempts), pattern-embeds in {covered}/{len(cubes)}", flush=True)
    if misses:
        print(f"#   {len(misses)} MISSES (no u1 pattern); first:", flush=True)
        print("    " + json.dumps({str(p): misses[0][p] for p in range(CEN.N)}), flush=True)
        with open(f"{HERE}/_u12_pattern_miss_{profile}.jsonl", "w") as fh:
            for cube in misses:
                fh.write(json.dumps({str(p): cube[p] for p in range(CEN.N)}) + "\n")
    return covered, len(cubes), len(misses)


def smoke():
    # The codex |A|=11 shadow is metrically DEAD; it should contain the pattern
    # (necessary for u1 to be the reason it dies).  Report, don't assert -- |A|=11
    # is a different label space, this is a sanity print only.
    gss = _load("gss", f"{HERE}/gen_singular_shadow.py")
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    w = contains_pattern(codex)
    print(f"[smoke] codex |A|=11 shadow pattern witness = {w}", flush=True)
    # Hand-built positive control: a cube that literally instantiates the pattern.
    ctrl = {0: [1, 3, 5, 6], 1: [0, 2, 3, 7], 2: [0, 1, 3, 8],
            3: [0, 1, 2, 4], 4: [0, 1, 9, 10], 5: [0, 6, 7, 8],
            6: [0, 5, 7, 8], 7: [1, 5, 6, 8], 8: [2, 5, 6, 7],
            9: [4, 10, 11, 0], 10: [4, 9, 11, 0], 11: [9, 10, 0, 4]}
    # a=0,c=1,d=2,f=3,e=4 : K_1>={0,2,3}? ; just report whatever embeds
    print(f"[smoke] control cube pattern witness = {contains_pattern(ctrl)}", flush=True)


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "smoke":
        smoke()
        sys.exit(0)
    tot_cov = tot = tot_miss = 0
    for profile in ("654", "555"):
        cov, n, miss = run(profile, 2000, 7)
        tot_cov += cov
        tot += n
        tot_miss += miss
    print(f"# TOTAL: pattern-embeds in {tot_cov}/{tot} constrained cubes; {tot_miss} misses",
          flush=True)
