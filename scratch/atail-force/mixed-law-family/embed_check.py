#!/usr/bin/env python3
r"""Does the LEAN-PROVEN support-6..8 family reach the terminal's cardinality?

The target terminal has all three caps at >= 6, hence carrier cardinality >= 15.
Placing the 21 proven radius laws as clauses at n = 15 costs P(15,6) = 3,603,600
per support-6 law -- 28.8M clauses for the support-6 block alone, and far more
above it.  That is the same wall the mined support-6 family hit.

The question does not need those clauses.  Placement is only a way of asserting
"no model contains this pattern".  Solve the BASE layer at n = 15, take a model,
and search each proven law directly for an injective embedding into it:

  no embedding for any law  ->  that model avoids the entire proven family, so
                               the family cannot close the terminal, and no
                               amount of placement budget changes that
  some law embeds           ->  that law is violated in the model, so placing
                               it is real added content and the budget is worth
                               spending

The search is backtracking with propagation over the law's atom list, not
brute-force over P(n,k): each atom fixes a co-radiality that prunes immediately,
and every law here is anchored by a star (one center with four co-radial points),
so the branching collapses at depth two.

Injective embeddings also discharge each law's distinctness hypotheses, since
distinct indices are distinct points.
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
from probe_model_test import audit, load_schemas, read_pattern  # noqa: E402


def embed(atoms, support, n, holds):
    """Injective map law-point -> model-point satisfying every atom, or None.

    Atoms are ordered so each successive atom shares a point with the prefix,
    which keeps the assignment connected and the branching low.
    """
    order = []
    placed = set()
    remaining = list(atoms)
    while remaining:
        pick = None
        for atom in remaining:
            if not placed or (set(atom) & placed):
                pick = atom
                break
        if pick is None:
            pick = remaining[0]
        remaining.remove(pick)
        order.append(pick)
        placed |= set(pick)

    assign = {}

    def go(index):
        if index == len(order):
            # Any law point not touched by an atom is unconstrained; the law
            # still applies, so fill it with any unused model point.
            free = [p for p in range(support) if p not in assign]
            unused = [v for v in range(n) if v not in set(assign.values())]
            if len(unused) < len(free):
                return None
            for p, v in zip(free, unused):
                assign[p] = v
            return dict(assign)
        y, u, v = order[index]
        for point in (y, u, v):
            pass
        candidates = []
        for cy in ([assign[y]] if y in assign else range(n)):
            for cu in ([assign[u]] if u in assign else range(n)):
                for cv in ([assign[v]] if v in assign else range(n)):
                    if len({cy, cu, cv}) != 3:
                        continue
                    taken = {assign[k] for k in assign}
                    fresh = [c for p, c in ((y, cy), (u, cu), (v, cv))
                             if p not in assign]
                    if len(set(fresh)) != len(fresh):
                        continue
                    if any(f in taken for f in fresh):
                        continue
                    if not holds(cy, cu, cv):
                        continue
                    candidates.append((cy, cu, cv))
        for cy, cu, cv in candidates:
            added = []
            for p, c in ((y, cy), (u, cu), (v, cv)):
                if p not in assign:
                    assign[p] = c
                    added.append(p)
            got = go(index + 1)
            if got is not None:
                return got
            for p in added:
                del assign[p]
        return None

    return go(0)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--n", type=int, default=15)
    ap.add_argument("--laws", type=Path,
                    default=HERE / "proven-radius-laws.json")
    ap.add_argument("--bank", type=Path, default=LANE / "schema-bank.json")
    ap.add_argument("--max-support", type=int, default=5)
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()

    laws = [l for l in json.loads(args.laws.read_text())["laws"]
            if l["support"] >= 6]
    schemas = load_schemas(args.bank, args.max_support)
    print(f"base: {len(schemas)} relaxation schemas (support <= "
          f"{args.max_support}) + all-center K4 + cover + geometry, at "
          f"n = {args.n}", flush=True)
    print(f"proven laws to embed: {len(laws)} at supports "
          f"{sorted({l['support'] for l in laws})}", flush=True)

    t0 = time.time()
    cnf, stats = AP.build(args.n, schemas, k4=True, cover=True, geometry=True)
    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=cnf.clauses))
    ok = solver.solve()
    print(f"base layer at n={args.n}: {'SAT' if ok else 'UNSAT'} "
          f"({len(cnf.clauses):,} clauses, {time.time() - t0:.0f}s)", flush=True)
    if not ok:
        solver.delete()
        print("base layer alone is UNSAT -- proven laws not needed", flush=True)
        return 0

    model = {lit for lit in solver.get_model() if lit > 0}
    eqs, _ = read_pattern(args.n, cnf.ids, model)
    solver.delete()
    report = audit(args.n, eqs)
    print(f"model audit: {report}", flush=True)

    eqset = set(eqs)

    def holds(c, l, r):
        return (c, min(l, r), max(l, r)) in eqset

    hits, misses = [], []
    for law in laws:
        t1 = time.time()
        got = embed([tuple(a) for a in law["atoms"]], law["support"],
                    args.n, holds)
        elapsed = time.time() - t1
        tag = "EMBEDS" if got else "no embedding"
        print(f"  [k={law['support']}] {tag:14s} ({elapsed:.1f}s)  "
              f"{law['name']}", flush=True)
        (hits if got else misses).append(
            dict(name=law["name"], support=law["support"], embedding=got))

    print(f"\n{len(hits)} of {len(laws)} proven laws embed in this model",
          flush=True)
    if not hits:
        print("This model avoids the ENTIRE proven support-6..8 family. "
              "Placing those laws at n=15 cannot refute it, at any budget.",
              flush=True)
    if args.out:
        args.out.write_text(json.dumps(
            dict(n=args.n, base=stats, audit=report,
                 embeds=hits, avoids=misses), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
