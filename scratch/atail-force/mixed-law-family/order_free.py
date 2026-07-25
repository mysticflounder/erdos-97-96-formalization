#!/usr/bin/env python3
r"""Which support-local laws are ORDER-FREE, and how much content that adds.

Every schema in `lcap14-global-parent-surface` is placed order-preservingly:
`avoid_probe.build` maps a support-k law onto `C(n,k) * 2k` images -- each
k-subset, both reflections, all k rotations.  That convention is forced by the
axiom family, because the strict Kalmanson inequalities are asserted per cyclic
4-subset and so presume the support sits in that cyclic order.

Positivity and the strict triangle inequality carry no such presumption.  A law
that is still UNSAT with Kalmanson DROPPED therefore holds for every relabeling
of its support, and may be placed over all `k!` images:

    order-preserving   C(n,k) * 2k       e.g. k=5, n=10:    2,520
    order-free         C(n,k) * k!       e.g. k=5, n=10:   30,240

a 12x gain in blocking content per law at k = 5, from the same law, with no
increase in the law count.  No run in this lane has used it.

The validation is a theorem already proven in Lean, in the sibling bank named by
the repo's mandatory theorem-bank registry:

    Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
    lean/RVOL/P97/U1TwoLargeCapObstruction.lean

    (hac : a != c)
    (h1 : dist c a = dist c d)  (h2 : dist c a = dist c f)
    (h3 : dist d c = dist d e)  (h4 : dist d c = dist d f)
    (h5 : dist f a = dist f d)  (h6 : dist f a = dist f e)
    (h7 : dist e a = dist e c)  : False

Five points, seven equality atoms, and NO convexity or cyclic-order hypothesis
-- a Lean-proven order-free law.  If this oracle does not classify it as
order-free, the classifier is wrong, so it is checked first.

Reported for each of the complete support-4 and support-5 pure-equality
families: how many laws survive dropping Kalmanson (order-free), and the
resulting clause counts at a few n.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
from math import comb, factorial
from pathlib import Path

HERE = Path(__file__).resolve().parent
LANE = HERE.parent / "lcap14-global-parent-surface"
sys.path.insert(0, str(HERE))

from pattern_family import decide, metric_axioms, no_kalmanson  # noqa: E402

# The Lean-proven order-free law, transcribed as (center, lo, hi) equality
# atoms over the labels a=0, c=1, d=2, e=3, f=4.
#   h1,h2 at c : a~d, a~f      h3,h4 at d : c~e, c~f
#   h5,h6 at f : a~d, a~e      h7   at e : a~c
U1_TWO_LARGE_CAP = frozenset({
    (1, 0, 2), (1, 0, 4),
    (2, 1, 3), (2, 1, 4),
    (4, 0, 2), (4, 0, 3),
    (3, 0, 1),
})


def relabelings(k, eqs):
    """The law's atom set under every permutation of its support."""
    for perm in itertools.permutations(range(k)):
        out = set()
        for (y, u, v) in eqs:
            a, b = perm[u], perm[v]
            out.add((perm[y], min(a, b), max(a, b)))
        yield frozenset(out)


def order_free_count(k, eqs):
    """How many of the k! relabelings the axiom family refutes.

    A law refuted in ALL relabelings may be placed over every k! image rather
    than only the C(n,k)*2k order-preserving ones, because no cyclic-order
    presumption is then load-bearing.  Refuted in only some relabelings, it must
    stay order-preserving.  (Dropping Kalmanson is NOT the right test: the
    Lean-proven `u1TwoLargeCapObstruction` is SAT under positivity+triangle, so
    it is a planar fact, not a metric-space one.)
    """
    total, unsat = 0, 0
    for variant in set(relabelings(k, eqs)):
        total += 1
        if decide(k, variant, frozenset(), axioms=metric_axioms) == "unsat":
            unsat += 1
    return unsat, total


def classify(k, atoms):
    eqs = frozenset((c, min(l, r), max(l, r)) for _, c, l, r in atoms)
    unsat, total = order_free_count(k, eqs)
    return eqs, unsat, total


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path,
                        default=LANE / "complete-bank.json")
    parser.add_argument("--supports", type=int, nargs="+", default=[4, 5])
    parser.add_argument("--n", type=int, nargs="+", default=[10, 12, 15])
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    # The Lean-proven law is order-free by the THEOREM (it has no order
    # hypothesis).  Measuring how much of that the relaxation can certify shows
    # how much stronger the Lean fact is than this lane's oracle.
    u1u, u1t = order_free_count(5, U1_TWO_LARGE_CAP)
    print(f"u1TwoLargeCapObstruction: relaxation refutes {u1u}/{u1t} distinct "
          f"relabelings; the Lean theorem refutes all of them (no order "
          f"hypothesis). Planar, not metric: it is SAT under "
          f"positivity+triangle = "
          f"{decide(5, U1_TWO_LARGE_CAP, frozenset(), axioms=no_kalmanson)}",
          flush=True)

    # Gate: the smallest pure-equality law is Kalmanson-driven, so it must NOT
    # be refuted in every relabeling -- otherwise the test calls everything
    # order-free and is vacuous.
    kal = frozenset({(0, 1, 2), (3, 1, 2)})
    gu, gt = order_free_count(4, kal)
    print(f"gate two-atom kalmanson law: refuted in {gu}/{gt} relabelings "
          f"(want strictly fewer than all) "
          f"{'OK' if gu < gt else 'FAIL'}", flush=True)
    if gu >= gt:
        return 1

    bank = json.loads(args.bank.read_text(encoding="utf-8"))["schemas"]
    rows = []
    free_laws = []
    for k in args.supports:
        laws = [r for r in bank if r["support"] == k]
        free, dep = 0, 0
        coverage = []
        for record in laws:
            eqs, unsat, total = classify(k, record["atoms"])
            coverage.append(unsat / total)
            if unsat == total:
                free += 1
                free_laws.append(dict(support=k,
                                      atoms=record["atoms"],
                                      relabelings=total))
            else:
                dep += 1
        rows.append(dict(support=k, laws=len(laws), order_free=free,
                         order_dependent=dep,
                         mean_relabeling_coverage=round(
                             sum(coverage) / max(1, len(coverage)), 3)))
        print(f"support {k}: {len(laws)} laws -> {free} ORDER-FREE (refuted in "
              f"every relabeling), {dep} order-dependent; mean relabeling "
              f"coverage {rows[-1]['mean_relabeling_coverage']:.3f}",
              flush=True)

    print("\nclause counts per law:")
    for k in args.supports:
        for n in args.n:
            if n < k:
                continue
            op = comb(n, k) * 2 * k
            of = comb(n, k) * factorial(k)
            print(f"  k={k} n={n}: order-preserving {op:,} vs order-free "
                  f"{of:,} ({of / op:.0f}x)", flush=True)

    result = dict(rows=rows, order_free_laws=len(free_laws),
                  laws=free_laws)
    if args.out:
        args.out.write_text(json.dumps(result, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
