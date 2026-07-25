#!/usr/bin/env python3
r"""Probe-level CEGAR with the BICONDITIONAL oracle: general-n mixed laws.

`avoid_probe.py` asks whether an all-center-K4 cyclic structure carrying the
minimality shell cover and the partition-level geometric families can avoid a
bank of support-local schemas.  It is UNSAT at n = 8 and n = 9 and undecided at
n = 10 with the complete pure-equality family (29.4 M clauses).

`probe_model_test.py` settles why: the n = 10 probe model produced by the
21-schema bank is refuted by the support-local axioms in 0.0 s.  So the family
does have content at n = 10; the bank simply lacks it.  That makes refine-and-
block affordable at the probe layer, where the pure-equality lane was not:

  probe SAT -> read the model's COMPLETE equality pattern -> refute it with the
  biconditional oracle -> mine a minimal core -> block every order-preserving
  placement of that core -> repeat.

Two things distinguish this from the pure-equality lane.  First the oracle is
biconditional: a false atom asserts a DISEQUALITY, so a mined core may contain
negative atoms and is then a forced-equality law -- "these equalities force a
further equality" -- which no pure-equality bank can express at any support or
atom count, and which the lane's covering analysis identifies as the missing
general-n content.  Second the layer is the cardinality-free probe (all-center
K4, cover, geometry) rather than a fixed cap profile, so a mined law is
support-local and valid at every n, not a fact about one profile.

Verdicts:

  LAYER-UNSAT   the probe layer plus the mined laws is contradictory at this n.
                Every mined law is support-local, so the law SET is general-n;
                the UNSAT itself is at this n.
  DECISIVE-SAT  a probe model whose complete pattern is realizable under the
                support-local axioms.  No law of that family -- any support,
                any atom count, banked or not -- can refute it, so the covering
                route cannot reach this n.  Reported with the witness pattern.
  BUDGET        neither inside the iteration budget.

Blocking is order-preserving, matching `avoid_probe.build`: for each k-subset
image of the support, both reflections and all k rotations, with a positive
atom contributing `-eq` and a negative atom contributing `+eq`.

--smoke validates the core extractor and the blocking placement against known
results before any production run.
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
from pattern_family import (all_triples, decide, dihedral,  # noqa: E402
                            positivity_only, relabel)
from probe_model_test import audit, load_schemas, read_pattern  # noqa: E402


def induced(eqs, pts):
    """The complete induced pattern on `pts`, reindexed to 0..k-1.

    `pts` is sorted, so reindexing preserves the ambient cyclic order and the
    Kalmanson axioms of the sub-support are the induced ones.
    """
    index = {p: i for i, p in enumerate(pts)}
    k = len(pts)
    sub = set()
    for (y, u, v) in eqs:
        if y in index and u in index and v in index:
            a, b = index[u], index[v]
            sub.add((index[y], min(a, b), max(a, b)))
    sub = frozenset(sub)
    return k, sub, all_triples(k) - sub


def smallest_refuting_subset(n, eqs, kmin, kmax):
    """Least-support refutation of a complete pattern, by direct search.

    Assumption-based unsat cores do not return at this size -- the same failure
    mode that made `coord_cegar.py` unusable -- but a plain check of a complete
    pattern is immediate.  So the core is found by searching point-subsets in
    increasing size instead of by tracking atoms, which also yields the
    smallest-support law available rather than an arbitrary one.
    """
    for k in range(kmin, kmax + 1):
        for pts in itertools.combinations(range(n), k):
            kk, sub, nsub = induced(eqs, pts)
            if decide(kk, sub, nsub) == "unsat":
                return list(pts), sub, nsub
    return None, None, None


def split(core):
    eqs = frozenset((y, u, v) for sign, y, u, v in core if sign == "+")
    neqs = frozenset((y, u, v) for sign, y, u, v in core if sign == "-")
    return eqs, neqs


def support(core):
    pts = set()
    for _, y, u, v in core:
        pts.update((y, u, v))
    return sorted(pts)


def reindex(core, pts):
    """Rename a core's points to 0..k-1 preserving their cyclic order."""
    index = {p: i for i, p in enumerate(pts)}
    out = []
    for sign, y, u, v in core:
        a, b = index[u], index[v]
        out.append((sign, index[y], min(a, b), max(a, b)))
    return tuple(sorted(out))


def minimize_core(n, core):
    """Drop atoms of either sign while the refutation survives."""
    eqs, neqs = split(core)
    changed = True
    while changed:
        changed = False
        for atom in sorted(eqs):
            if decide(n, eqs - {atom}, neqs) == "unsat":
                eqs = eqs - {atom}
                changed = True
                break
        if changed:
            continue
        for atom in sorted(neqs):
            if decide(n, eqs, neqs - {atom}) == "unsat":
                neqs = neqs - {atom}
                changed = True
                break
    return ([("+", *a) for a in sorted(eqs)]
            + [("-", *a) for a in sorted(neqs)])


def canonical_law(k, law):
    """Least representative under the dihedral group of the k-cycle."""
    best = None
    for perm in dihedral(k):
        pos = relabel(frozenset((y, u, v) for s, y, u, v in law if s == "+"),
                      perm)
        neg = relabel(frozenset((y, u, v) for s, y, u, v in law if s == "-"),
                      perm)
        cand = (tuple(sorted(pos)), tuple(sorted(neg)))
        if best is None or cand < best:
            best = cand
    return best


def placements(n, k, law, eqvar):
    """Every order-preserving placement, as CNF clauses over the eq vars."""
    out = []
    for image in itertools.combinations(range(n), k):
        for reflect in (False, True):
            for rotation in range(k):
                def place(i):
                    j = ((rotation - i) if reflect else (i + rotation)) % k
                    return image[j]
                lits = []
                ok = True
                for sign, c, l, r in law:
                    cc, ll, rr = place(c), place(l), place(r)
                    if cc in (ll, rr) or ll == rr:
                        ok = False
                        break
                    var = eqvar(cc, ll, rr)
                    lits.append(-var if sign == "+" else var)
                if ok and lits:
                    out.append(frozenset(lits))
    return out


def smoke() -> int:
    failures = 0

    def check(label, got, want):
        nonlocal failures
        ok = got == want
        failures += 0 if ok else 1
        print(f"smoke {label}: {got} (want {want}) {'OK' if ok else 'FAIL'}")

    # 1. the subset search must locate the known two-atom Kalmanson law inside
    #    a larger pattern, at its own support and no larger, and `induced` must
    #    restrict a pattern to a point subset preserving cyclic order.
    eqs = frozenset({(0, 1, 2), (3, 1, 2)})
    check("induced restriction", induced(frozenset({(0, 1, 2), (4, 1, 5)}),
                                        [0, 1, 2, 3]),
          (4, frozenset({(0, 1, 2)}), all_triples(4) - {(0, 1, 2)}))
    planted = frozenset({(0, 2, 3), (4, 2, 3)})
    pts, sub, _ = smallest_refuting_subset(6, planted, 4, 6)
    check("subset search finds the planted law", pts, [0, 2, 3, 4])
    check("subset search law at its own support", sub,
          frozenset({(0, 1, 2), (3, 1, 2)}))

    # 2. minimize_core must be idempotent on an already-minimal law, and must
    #    strip the inert disequalities off a complete pattern.
    check("minimize idempotent",
          tuple(minimize_core(4, [("+", *a) for a in sorted(eqs)])),
          (("+", 0, 1, 2), ("+", 3, 1, 2)))
    full = minimize_core(4, [("+", *a) for a in sorted(eqs)]
                         + [("-", *a) for a in sorted(all_triples(4) - eqs)])
    check("minimize strips inert disequalities", tuple(full),
          (("+", 0, 1, 2), ("+", 3, 1, 2)))

    # 3. the generic all-disequality pattern must NOT be refutable, so the
    #    oracle is not vacuously unsat, and the subset search must find nothing.
    check("generic pattern", decide(4, frozenset(), all_triples(4)), "sat")
    check("subset search finds nothing in a generic pattern",
          smallest_refuting_subset(5, frozenset(), 4, 5)[0], None)

    # 4. reindex must preserve cyclic order and produce a support-k law.
    check("reindex", reindex([("+", 2, 5, 9), ("-", 5, 2, 9)], [2, 5, 9]),
          (("+", 0, 1, 2), ("-", 1, 0, 2)))

    # 5. placements must reproduce avoid_probe's own count and polarity
    #    convention.  A pure-positive support-4 law at n=6 blocks
    #    C(6,4) * 2 * 4 = 120 placements, all-negative literals.
    ids = {}

    def eqvar(c, l, r):
        return ids.setdefault(f"eq_{c}_{l}_{r}", len(ids) + 1)
    pos = placements(6, 4, [("+", 0, 1, 2), ("+", 3, 1, 2)], eqvar)
    check("placement count", len(pos), 120)
    check("placement polarity all negative",
          all(all(x < 0 for x in clause) for clause in pos), True)
    mixed = placements(6, 4, [("+", 0, 1, 2), ("-", 3, 1, 2)], eqvar)
    check("mixed placement has a positive literal",
          all(any(x > 0 for x in clause) for clause in mixed), True)

    # 6. the algebraic filter must still separate transitivity from geometry,
    #    so a mined mixed law can be classified.
    check("equilateral is algebraic",
          decide(4, frozenset({(1, 2, 3), (2, 1, 3)}),
                 frozenset({(3, 1, 2)}), axioms=positivity_only), "unsat")

    print(f"smoke: {failures} failures")
    return 1 if failures else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--n", type=int, default=10)
    parser.add_argument("--bank", type=Path, default=LANE / "schema-bank.json")
    parser.add_argument("--max-support", type=int, default=5)
    parser.add_argument("--budget", type=int, default=2000)
    parser.add_argument("--min-law-support", type=int, default=4)
    parser.add_argument("--max-law-support", type=int, default=7,
                        help="largest support searched for a refutation")
    parser.add_argument("--out", type=Path)
    parser.add_argument("--laws-in", type=Path,
                        help="mined laws from a previous n, in bank shape; "
                        "carried in unfiltered so a law set can be tested "
                        "across cardinalities")
    parser.add_argument("--laws-out", type=Path,
                        help="write the mined law set after every new law")
    args = parser.parse_args()

    if args.smoke:
        return smoke()

    n = args.n
    schemas = load_schemas(args.bank, args.max_support)
    if args.laws_in:
        carried = json.loads(args.laws_in.read_text())["schemas"]
        extra = [(r["support"], tuple(tuple(a) for a in r["atoms"]))
                 for r in carried if r["support"] <= n]
        print(f"[n={n}] carried {len(extra)} laws from {args.laws_in}",
              flush=True)
        schemas = schemas + extra
    cnf, stats = AP.build(n, schemas, k4=True, cover=True, geometry=True)
    ids = cnf.ids

    def eqvar(c, l, r):
        l, r = min(l, r), max(l, r)
        return ids[f"eq_{c}_{l}_{r}"]

    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=cnf.clauses))
    print(f"[n={n}] probe layer: {len(ids)} vars, {len(cnf.clauses)} clauses, "
          f"{stats}", flush=True)

    universe = all_triples(n)
    laws, seen = [], set()
    added = 0
    wide = 0
    t0 = time.time()
    result = None

    for it in range(1, args.budget + 1):
        tsolve = time.time()
        if not solver.solve():
            result = dict(verdict="LAYER-UNSAT", iterations=it)
            print(f"[n={n}] it{it}: LAYER-UNSAT after {len(laws)} mined laws "
                  f"({time.time() - t0:.0f}s)", flush=True)
            break
        model = {lit for lit in solver.get_model() if lit > 0}
        eqs, _ = read_pattern(n, ids, model)
        neqs = universe - eqs
        dsolve = time.time() - tsolve

        tsearch = time.time()
        pts, sub, nsub = smallest_refuting_subset(
            n, eqs, args.min_law_support, args.max_law_support)
        dsearch = time.time() - tsearch
        if pts is None:
            # No sub-support up to the cap refutes the pattern.  Fall back to
            # the whole instance so the loop still advances, and count it so
            # the run's strength is never overstated.
            whole = decide(n, eqs, neqs)
            if whole == "sat":
                report = audit(n, eqs)
                result = dict(verdict="DECISIVE-SAT", iterations=it,
                              audit=report,
                              equalities=[list(a) for a in sorted(eqs)])
                print(f"[n={n}] it{it}: DECISIVE-SAT -- the complete pattern "
                      f"is realizable under the support-local axioms, so no "
                      f"law of that family refutes it. audit={report} "
                      f"({time.time() - t0:.0f}s)", flush=True)
                break
            wide += 1
            print(f"[n={n}] it{it}: refuted only above support "
                  f"{args.max_law_support} ({whole}); blocking this instance "
                  f"only ({time.time() - t0:.0f}s)", flush=True)
            solver.add_clause([-eqvar(*a) for a in sorted(eqs)])
            continue

        k = len(pts)
        tmin = time.time()
        reduced = tuple(minimize_core(
            k, [("+", *a) for a in sorted(sub)]
            + [("-", *a) for a in sorted(nsub)]))
        dmin = time.time() - tmin
        law = [(s, pts[y], pts[u], pts[v]) for s, y, u, v in reduced]
        key = canonical_law(k, reduced)
        algebraic = decide(k, *split(reduced),
                           axioms=positivity_only) == "unsat"
        fresh = key not in seen
        if fresh:
            seen.add(key)
            laws.append(dict(support=k, atoms=[list(a) for a in reduced],
                             forced_equality=any(s == "-" for s, *_ in reduced),
                             algebraic=algebraic))

        batch = placements(n, k, reduced, eqvar)
        for clause in batch:
            solver.add_clause(list(clause))
        added += len(batch)
        neg = sum(1 for s, *_ in reduced if s == "-")
        print(f"[n={n}] it{it}: law {len(laws)} support={k} atoms="
              f"{len(reduced)} ({neg} disequalities, "
              f"{'ALGEBRAIC' if algebraic else 'geometric'}), "
              f"{'new' if fresh else 'repeat'}, +{len(batch)} clauses, "
              f"{added} total [solve {dsolve:.1f}s search {dsearch:.1f}s "
              f"min {dmin:.1f}s] ({time.time() - t0:.0f}s)", flush=True)
        if args.laws_out:
            args.laws_out.write_text(json.dumps(
                dict(schemas=[dict(support=law["support"],
                                   atoms=law["atoms"]) for law in laws]),
                indent=1) + "\n")

    if result is None:
        result = dict(verdict="BUDGET", iterations=args.budget)
        print(f"[n={n}] budget exhausted", flush=True)

    forced = [law for law in laws if law["forced_equality"]]
    result.update(n=n, schemas=len(schemas), clauses_added=added,
                  wide_instance_blocks=wide,
                  laws=laws, laws_total=len(laws),
                  forced_equality_laws=len(forced),
                  geometric_forced_equality_laws=len(
                      [law for law in forced if not law["algebraic"]]),
                  seconds=round(time.time() - t0, 1), **stats)
    if args.out:
        args.out.write_text(json.dumps(result, indent=1) + "\n")
    print(f"[n={n}] {result['verdict']}: {len(laws)} laws, "
          f"{result['forced_equality_laws']} with a disequality, "
          f"{result['geometric_forced_equality_laws']} of those geometric",
          flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
