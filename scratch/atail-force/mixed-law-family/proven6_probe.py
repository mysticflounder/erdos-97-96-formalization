#!/usr/bin/env python3
r"""The probe layer plus the LEAN-PROVEN support->=6 radius laws.

The covering-route measurement in `REPORT.md` established two things.  First,
the disequality half of the biconditional oracle is provably inert below support
6 (every complete pattern at supports 4 and 5 decided, zero geometric content).
Second, the complete support-<=5 bank is STILL SAT at n = 10 even placed over
all k! images, which is the maximal placement any support-5 law admits.  So the
content that can close this layer must live at support >= 6, and mining it from
the support-local relaxation was measured at 29.4M clauses at n = 10.

`mine_radius_laws.py` found that it does not have to be mined.  Twenty-one laws
in the sibling `p97-rvol` bank are already pure equality-atom laws at support 6,
7 and 8 once the scalar radius witness `r` is eliminated across its star, and
all nineteen source files are sorry-free and axiom-free.

None of them carries a convexity or cyclic-order hypothesis, so each is
ORDER-FREE by the theorem -- not by this lane's relaxation oracle -- and may be
placed over all injective images `P(n,k)` rather than the `C(n,k)*2k`
order-preserving ones.  Injective placement also discharges each law's
distinctness hypotheses for free, since distinct indices are distinct points.

An UNSAT here rests on Lean theorems rather than on relaxation evidence, so it
is a proof skeleton.  Reported against the same base with the added laws placed
order-preservingly, so a flip is attributable to placement, not to the laws.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from math import perm
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


def place(n, laws, eqvar, free):
    placer = place_free if free else place_ordered
    out = set()
    for law in laws:
        eqs = frozenset((y, u, v) for y, u, v in law["atoms"])
        out |= placer(n, law["support"], eqs, eqvar)
    return out


def run(n, schemas, laws, free, label, oracle_on_model):
    t0 = time.time()
    cnf, stats = AP.build(n, schemas, k4=True, cover=True, geometry=True)
    ids = cnf.ids

    def eqvar(c, l, r):
        return ids[f"eq_{c}_{l}_{r}"]

    clauses = list(cnf.clauses)
    added = place(n, laws, eqvar, free)
    clauses.extend(list(c) for c in added)
    build = time.time() - t0

    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=clauses))
    t1 = time.time()
    ok = solver.solve()
    solve = time.time() - t1
    report = oracle = None
    if ok and oracle_on_model:
        model = {lit for lit in solver.get_model() if lit > 0}
        eqs, _ = read_pattern(n, ids, model)
        report = audit(n, eqs)
        oracle = decide(n, eqs, all_triples(n) - eqs)
    solver.delete()
    print(f"[n={n}] {label}: {'SAT' if ok else 'UNSAT'}  "
          f"+{len(added):,} placement clauses, {len(clauses):,} total  "
          f"[build {build:.0f}s solve {solve:.0f}s]"
          + (f"  audit={report} oracle={oracle}" if report else ""),
          flush=True)
    return dict(n=n, placement=label, verdict="SAT" if ok else "UNSAT",
                placement_clauses=len(added), total_clauses=len(clauses),
                build_seconds=round(build, 1), solve_seconds=round(solve, 1),
                audit=report, oracle_on_model=oracle, base=stats)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--n", type=int, nargs="+", default=[10])
    ap.add_argument("--laws", type=Path,
                    default=HERE / "proven-radius-laws.json")
    ap.add_argument("--bank", type=Path, default=LANE / "schema-bank.json")
    ap.add_argument("--max-support", type=int, default=5,
                    help="support ceiling of the BASE relaxation bank")
    ap.add_argument("--proven-support", type=int, nargs="+", default=[6],
                    help="which proven law supports to place")
    ap.add_argument("--control", action="store_true")
    ap.add_argument("--no-oracle", action="store_true")
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()

    every = json.loads(args.laws.read_text(encoding="utf-8"))["laws"]
    laws = [l for l in every if l["support"] in set(args.proven_support)]
    schemas = load_schemas(args.bank, args.max_support)
    print(f"base bank: {len(schemas)} relaxation schemas of support <= "
          f"{args.max_support}", flush=True)
    print(f"proven laws at support {sorted(set(args.proven_support))}: "
          f"{len(laws)}", flush=True)
    for law in laws:
        print(f"  [k={law['support']}] {law['n_atoms']} atoms  {law['name']}",
              flush=True)
    for n in args.n:
        budget = sum(perm(n, l["support"]) for l in laws)
        print(f"[n={n}] injective placement budget: {budget:,} clauses",
              flush=True)

    results = []
    for n in args.n:
        if args.control:
            results.append(run(n, schemas, laws, False,
                               "order-preserving control",
                               not args.no_oracle))
        results.append(run(n, schemas, laws, True, "PROVEN ORDER-FREE",
                           not args.no_oracle))
        if args.out:
            args.out.write_text(
                json.dumps(dict(results=results), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
