#!/usr/bin/env python3
r"""The probe layer against LEAN-PROVEN order-free laws.

Every schema this lane has used comes from the support-local relaxation
(positivity, strict triangle, both strict Kalmanson per cyclic 4-subset) and is
placed order-preservingly, over `C(n,k) * 2k` images, because Kalmanson presumes
the support sits in that cyclic order.

`u1TwoLargeCapObstruction` is different on both counts.  It is proven in Lean in
the sibling bank named by the repo's theorem-bank registry
(`lean/RVOL/P97/U1TwoLargeCapObstruction.lean`), it has **no** convexity or
cyclic-order hypothesis, and `order_free.py` measures that the relaxation
refutes it in all 120 relabelings of its support.  So it may be placed over all
`k!` images -- at n = 10 that is `C(10,5) * 120 = 30,240` clauses against 2,520
order-preserving, and at n = 15 `C(15,5) * 120 = 360,360` against 30,030.

It is also strictly stronger than this lane's oracle: it is SAT under
positivity + strict triangle, so it is a PLANAR fact rather than a metric-space
one, and no amount of mining against a metric relaxation can produce it.

That matters for the goal beyond raw clause count.  A verdict resting on this
law rests on a Lean theorem, so an UNSAT here is a proof skeleton rather than
relaxation evidence.  Reported against a control that places the same law
order-preservingly, so any flip is attributable to the placement and not to the
law.
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
sys.path.insert(0, str(LANE))

from pysat.formula import CNF as PysatCNF  # noqa: E402
from pysat.solvers import Cadical195  # noqa: E402

import avoid_probe as AP  # noqa: E402
from order_free import U1_TWO_LARGE_CAP, order_free_count  # noqa: E402
from probe_model_test import audit, load_schemas, read_pattern  # noqa: E402
from pattern_family import all_triples, decide  # noqa: E402


def place_free(n, k, eqs, eqvar):
    """All k! injective placements: valid only for an order-free law."""
    out = set()
    for image in itertools.permutations(range(n), k):
        lits = []
        ok = True
        for (y, u, v) in sorted(eqs):
            cc, ll, rr = image[y], image[u], image[v]
            if cc in (ll, rr) or ll == rr:
                ok = False
                break
            lits.append(-eqvar(cc, min(ll, rr), max(ll, rr)))
        if ok and lits:
            out.add(frozenset(lits))
    return out


def place_ordered(n, k, eqs, eqvar):
    """The order-preserving convention of avoid_probe.build, for control."""
    out = set()
    for image in itertools.combinations(range(n), k):
        for reflect in (False, True):
            for rotation in range(k):
                lits = []
                ok = True
                for (y, u, v) in sorted(eqs):
                    def place(i):
                        j = ((rotation - i) if reflect else (i + rotation)) % k
                        return image[j]
                    cc, ll, rr = place(y), place(u), place(v)
                    if cc in (ll, rr) or ll == rr:
                        ok = False
                        break
                    lits.append(-eqvar(cc, min(ll, rr), max(ll, rr)))
                if ok and lits:
                    out.add(frozenset(lits))
    return out


def run(n, schemas, eqs, k, free, extra_label):
    cnf, stats = AP.build(n, schemas, k4=True, cover=True, geometry=True)
    ids = cnf.ids

    def eqvar(c, l, r):
        return ids[f"eq_{c}_{l}_{r}"]

    clauses = list(cnf.clauses)
    placer = place_free if free else place_ordered
    added = placer(n, k, eqs, eqvar)
    clauses.extend(list(c) for c in added)
    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=clauses))
    ok = solver.solve()
    verdict = "SAT" if ok else "UNSAT"
    eqpat = None
    report = None
    oracle = None
    if ok:
        model = {lit for lit in solver.get_model() if lit > 0}
        eqpat, _ = read_pattern(n, ids, model)
        report = audit(n, eqpat)
        oracle = decide(n, eqpat, all_triples(n) - eqpat)
    solver.delete()
    print(f"[n={n}] {extra_label}: {verdict}  "
          f"(+{len(added)} placement clauses, {len(clauses)} total)"
          + (f"  audit={report} oracle={oracle}" if ok else ""), flush=True)
    return dict(n=n, placement=extra_label, verdict=verdict,
                placement_clauses=len(added), total_clauses=len(clauses),
                audit=report, oracle_on_model=oracle,
                base=stats)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, nargs="+", default=[8, 9, 10])
    parser.add_argument("--bank", type=Path, default=LANE / "schema-bank.json")
    parser.add_argument("--max-support", type=int, default=5)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    k = 5
    eqs = U1_TWO_LARGE_CAP
    unsat, total = order_free_count(k, eqs)
    print(f"u1TwoLargeCapObstruction order-free check: refuted in "
          f"{unsat}/{total} relabelings "
          f"{'OK' if unsat == total else 'FAIL -- not order-free'}", flush=True)
    if unsat != total:
        return 1

    schemas = load_schemas(args.bank, args.max_support)
    print(f"base bank: {len(schemas)} schemas of support <= "
          f"{args.max_support}", flush=True)
    for n in args.n:
        print(f"[n={n}] placement budget: order-preserving "
              f"{comb(n, k) * 2 * k:,} vs order-free "
              f"{comb(n, k) * factorial(k):,}", flush=True)

    results = []
    for n in args.n:
        results.append(run(n, schemas, eqs, k, False, "order-preserving"))
        results.append(run(n, schemas, eqs, k, True, "ORDER-FREE"))

    if args.out:
        args.out.write_text(json.dumps(dict(results=results), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
