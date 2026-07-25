#!/usr/bin/env python3
"""Is the covering route closed at n >= 10 by construction, or only by budget?

`avoid_probe.py` is UNSAT at n = 8 and n = 9 with the complete support-local
schema family, and undecided at n = 10 (29.4 M clauses, 400 s timeout).  A
timeout leaves open whether a bigger bank or a longer run would flip it.  This
settles that without deciding the big instance.

The probe's blocking clauses all come from ONE source: schemas that the
support-local axiom family (positivity, strict triangle, both strict Kalmanson
per cyclic 4-subset) refutes.  So if a probe model's COMPLETE equality pattern
is realizable under those very axioms, then no schema of that family -- banked,
unbanked, of any support, at any atom count -- can embed in it, because an
embedding would transport the schema's unsatisfiability into a satisfiable
system.  A single satisfiable model therefore closes the whole family at that
n, and every larger n by the same witness extended.

Procedure: rebuild the probe CNF at n with `avoid_probe.build`, solve it with
CaDiCaL through pysat so the model survives, read off the complete equality
pattern over the `eq_{center}_{left}_{right}` variables, independently re-check
that the model really satisfies all-center K4 and the minimality cover, then
hand the full pattern to the biconditional oracle of `pattern_family.decide`.

  oracle SAT   -> the pattern is consistent with the support-local family, so
                  NO law of that family refutes it.  The covering route cannot
                  reach this n, and the n = 8/9 UNSAT verdicts are
                  small-cardinality effects, not the start of a general-n
                  argument.
  oracle UNSAT -> some law of the family does refute this model; the probe's
                  bank was incomplete and completing it is worth the cost.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
LANE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/"
            "scratch/atail-force/lcap14-global-parent-surface")
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(LANE))

from pysat.formula import CNF as PysatCNF  # noqa: E402
from pysat.solvers import Cadical195  # noqa: E402

import avoid_probe as AP  # noqa: E402
from pattern_family import all_triples, decide  # noqa: E402


def load_schemas(bank_path, max_support):
    bank = json.loads(bank_path.read_text(encoding="utf-8"))["schemas"]
    return [(r["support"], tuple(tuple(a) for a in r["atoms"]))
            for r in bank if r["support"] <= max_support]


def probe_model(n, schemas, cover, geometry):
    cnf, stats = AP.build(n, schemas, k4=True, cover=cover, geometry=geometry)
    formula = PysatCNF(from_clauses=cnf.clauses)
    solver = Cadical195(bootstrap_with=formula)
    t0 = time.time()
    ok = solver.solve()
    secs = round(time.time() - t0, 1)
    if not ok:
        solver.delete()
        return None, stats, secs
    model = {lit for lit in solver.get_model() if lit > 0}
    solver.delete()
    return model, stats, secs


def read_pattern(n, ids, model):
    """The complete equality pattern over the probe's eq variables."""
    eqs = set()
    missing = 0
    for center in range(n):
        for left, right in itertools.combinations(
                [p for p in range(n) if p != center], 2):
            name = f"eq_{center}_{left}_{right}"
            var = ids.get(name)
            if var is None:
                missing += 1
                continue
            if var in model:
                eqs.add((center, left, right))
    return frozenset(eqs), missing


def audit(n, eqs):
    """Re-check the structural claims in plain python, not via the solver."""
    classes = {}
    for center in range(n):
        others = [p for p in range(n) if p != center]
        # rebuild the radius partition from the equality relation
        blocks = []
        for p in others:
            for block in blocks:
                rep = block[0]
                lo, hi = min(rep, p), max(rep, p)
                if (center, lo, hi) in eqs:
                    block.append(p)
                    break
            else:
                blocks.append([p])
        classes[center] = blocks
    k4 = all(any(len(b) >= 4 for b in blocks)
             for blocks in classes.values())
    critical = {c for c, blocks in classes.items()
                if sum(1 for b in blocks if len(b) >= 4) == 1
                and max(len(b) for b in blocks) == 4}
    covered = set()
    for c in critical:
        for block in classes[c]:
            if len(block) == 4:
                covered.update(block)
    return dict(all_center_k4=k4,
                max_class=max(len(b) for blocks in classes.values()
                              for b in blocks),
                critical_centers=len(critical),
                covered_points=len(covered), n=n,
                cover_complete=len(covered) == n)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=10)
    parser.add_argument("--bank", type=Path,
                        default=LANE / "schema-bank.json")
    parser.add_argument("--max-support", type=int, default=5)
    parser.add_argument("--no-cover", action="store_true")
    parser.add_argument("--no-geometry", action="store_true")
    parser.add_argument("--oracle-timeout", type=int, default=0,
                        help="oracle timeout in seconds, 0 = none")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    schemas = load_schemas(args.bank, args.max_support)
    print(f"[n={args.n}] {len(schemas)} schemas of support "
          f"<= {args.max_support}", flush=True)

    model, stats, secs = probe_model(
        args.n, schemas, cover=not args.no_cover,
        geometry=not args.no_geometry)
    if model is None:
        print(f"[n={args.n}] probe UNSAT in {secs}s -- no model to test",
              flush=True)
        return 0

    cnf, _ = AP.build(args.n, schemas, k4=True, cover=not args.no_cover,
                      geometry=not args.no_geometry)
    eqs, missing = read_pattern(args.n, cnf.ids, model)
    universe = all_triples(args.n)
    neqs = universe - eqs
    report = audit(args.n, eqs)
    print(f"[n={args.n}] probe SAT in {secs}s; {len(eqs)} equality atoms of "
          f"{len(universe)}, {missing} vars absent; audit {report}", flush=True)

    t0 = time.time()
    status = decide(args.n, eqs, neqs,
                    timeout_ms=args.oracle_timeout * 1000)
    osecs = round(time.time() - t0, 1)
    print(f"[n={args.n}] biconditional oracle on the complete pattern: "
          f"{status} in {osecs}s", flush=True)

    if status == "sat":
        print(f"[n={args.n}] CLOSED BY CONSTRUCTION: the model's complete "
              f"pattern is consistent with the support-local axioms, so no "
              f"schema of that family -- any support, any atom count, banked "
              f"or not -- can refute it. The covering route cannot reach "
              f"n={args.n}.", flush=True)
    elif status == "unsat":
        print(f"[n={args.n}] the family DOES refute this model: the probe's "
              f"bank is incomplete here, and completing it is load-bearing.",
              flush=True)

    result = dict(n=args.n, probe="SAT", probe_seconds=secs,
                  schemas=len(schemas), max_support=args.max_support,
                  equality_atoms=len(eqs), triples=len(universe),
                  vars_absent=missing, audit=report,
                  oracle=status, oracle_seconds=osecs,
                  equalities=[list(a) for a in sorted(eqs)], **stats)
    if args.out:
        args.out.write_text(json.dumps(result, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
