#!/usr/bin/env python3
"""Size the constrained (5,5,4) cube space BEFORE attempting exhaustion.

1. Exact isolated per-center candidate counts (C1 + one-hit).
2. Knuth backtrack-tree estimator for the RAW count of full cubes
   (C1/C2/C4/one-hit): at each level (fixed center order), enumerate the
   feasible candidates given the partial assignment, pick one uniformly,
   multiply the counts.  The product is an unbiased estimator of the number
   of raw solutions.  Report mean and spread over many trials.
"""

import random
import statistics
import sys
from itertools import combinations

import census554_lib as L


def knuth_trial(rng, order, cand):
    assigned, paircount = {}, {}
    prod = 1
    for p in order:
        feas = []
        for kp in cand[p]:
            ok = True
            for q, kq in assigned.items():
                if len(kp & kq) > 2:
                    ok = False
                    break
            if not ok:
                continue
            prs = list(combinations(sorted(kp), 2))
            if any(paircount.get(e, 0) + 1 > 2 for e in prs):
                continue
            feas.append((kp, prs))
        if not feas:
            return 0
        prod *= len(feas)
        kp, prs = feas[rng.randrange(len(feas))]
        assigned[p] = kp
        for e in prs:
            paircount[e] = paircount.get(e, 0) + 1
    return prod


def main():
    trials = int(sys.argv[1]) if len(sys.argv) > 1 else 2000
    cand = {p: L.candidates(p) for p in range(L.N)}
    print("isolated candidate counts per center:")
    for p in range(L.N):
        print(f"  center {p}: {len(cand[p])}")
    order = list(range(L.N))
    rng = random.Random(20260706)
    ests = [knuth_trial(rng, order, cand) for _ in range(trials)]
    mean = statistics.fmean(ests)
    nz = sum(1 for e in ests if e)
    print(f"\nKnuth estimator, {trials} trials (order 0..10):")
    print(f"  nonzero paths: {nz}/{trials}")
    print(f"  mean estimate of RAW cube count: {mean:.4e}")
    if nz > 1:
        sd = statistics.stdev(ests)
        print(f"  stdev: {sd:.4e}  (stderr {sd/ (trials ** 0.5):.4e})")
    qs = statistics.quantiles(ests, n=10)
    print(f"  deciles: {[f'{q:.2e}' for q in qs]}")
    print(f"  canonical-group size: {len(L.AUTOS)} (lower bounds canonical "
          f"count by raw/72)")


if __name__ == "__main__":
    main()
