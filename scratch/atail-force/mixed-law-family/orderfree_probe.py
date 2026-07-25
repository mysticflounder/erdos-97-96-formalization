#!/usr/bin/env python3
r"""The queued configuration: all order-free support-5 laws placed over k!.

`order_free.py` measured that 96 of the 398 complete support-5 laws are refuted
under the full support-local family in EVERY one of the k! relabelings of their
support.  Kalmanson is the only order-dependent axiom, so those 96 carry no
cyclic-order presumption and may be placed over all k! images rather than the
C(n,k)*2k order-preserving ones -- 12x the content per law at k = 5, with no
increase in the law count.

This runs that configuration against the cardinality-free probe layer
(all-center K4, minimality shell cover, partition-level geometric families):

  base      complete support-<=5 bank, placed order-preservingly by
            avoid_probe.build, exactly as every prior run in this lane
  addition  the 96 order-free laws, placed over all k! images

Control: the identical base with the same 96 laws placed order-preservingly, so
any flip is attributable to the PLACEMENT and not to the laws.  The two runs
differ in nothing else.

Reported per n, with the model audited in python when SAT and its complete
pattern handed to the biconditional oracle, so a SAT verdict is never overread
as realizability.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
LANE = HERE.parent / "lcap14-global-parent-surface"
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(LANE))

from pysat.formula import CNF as PysatCNF  # noqa: E402
from pysat.solvers import Cadical195  # noqa: E402

import avoid_probe as AP  # noqa: E402
from pattern_family import all_triples, decide  # noqa: E402
from probe_model_test import audit, load_schemas, read_pattern  # noqa: E402
from proven_probe import place_free, place_ordered  # noqa: E402


def run(n, schemas, laws, free, label, timeout):
    t0 = time.time()
    cnf, stats = AP.build(n, schemas, k4=True, cover=True, geometry=True)
    ids = cnf.ids

    def eqvar(c, l, r):
        return ids[f"eq_{c}_{l}_{r}"]

    clauses = list(cnf.clauses)
    placer = place_free if free else place_ordered
    added = set()
    for law in laws:
        eqs = frozenset((c, min(l, r), max(l, r))
                        for _, c, l, r in law["atoms"])
        added |= placer(n, law["support"], eqs, eqvar)
    clauses.extend(list(c) for c in added)
    build = time.time() - t0

    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=clauses))
    t1 = time.time()
    ok = solver.solve()
    solve = time.time() - t1
    verdict = "SAT" if ok else "UNSAT"
    report = oracle = None
    if ok:
        model = {lit for lit in solver.get_model() if lit > 0}
        eqs, _ = read_pattern(n, ids, model)
        report = audit(n, eqs)
        oracle = decide(n, eqs, all_triples(n) - eqs)
    solver.delete()
    print(f"[n={n}] {label}: {verdict}  +{len(added):,} placement clauses, "
          f"{len(clauses):,} total  [build {build:.0f}s solve {solve:.0f}s]"
          + (f"  audit={report} oracle={oracle}" if ok else ""), flush=True)
    return dict(n=n, placement=label, verdict=verdict,
                placement_clauses=len(added), total_clauses=len(clauses),
                build_seconds=round(build, 1), solve_seconds=round(solve, 1),
                audit=report, oracle_on_model=oracle, base=stats)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, nargs="+", default=[10])
    parser.add_argument("--laws", type=Path, default=HERE / "order-free-k5.json")
    parser.add_argument("--bank", type=Path,
                        default=LANE / "complete-bank.json")
    parser.add_argument("--max-support", type=int, default=5)
    parser.add_argument("--control", action="store_true",
                        help="also run the order-preserving control")
    parser.add_argument("--timeout", type=float, default=0)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    laws = json.loads(args.laws.read_text())["laws"]
    schemas = load_schemas(args.bank, args.max_support)
    print(f"base bank: {len(schemas)} schemas of support <= "
          f"{args.max_support}; order-free laws: {len(laws)}", flush=True)

    results = []
    for n in args.n:
        if args.control:
            results.append(run(n, schemas, laws, False,
                               "order-preserving control", args.timeout))
        results.append(run(n, schemas, laws, True, "ORDER-FREE",
                           args.timeout))
        if args.out:
            args.out.write_text(
                json.dumps(dict(results=results), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
