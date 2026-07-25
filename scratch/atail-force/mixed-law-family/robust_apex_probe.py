#!/usr/bin/env python3
r"""The probe layer plus the terminal's OWN robustness field.

Every prior run in this lane encoded a layer the terminal strictly implies but
does not equal: all-center K4, the minimality shell cover, bisector capacity,
interleaving, circle-pair.  That layer is SAT at n = 10 and at n = 15, and
Results 5 and 6 showed no support-<=5 law under any placement and no Lean-proven
support-6..8 law refutes it.  So the closing content must be a field the layer
abstracts away.

`FullyDeletionRobustAt` is such a field, and it is the strongest one the
terminal carries.  At `FrontierLiveClosure.lean:249` BOTH opposite apices of the
surplus packet are fully deletion robust:

    lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean:27
    structure FullyDeletionRobustAt (D : CounterexampleData) (center : R^2) where
      survives : forall z, z in D.A -> HasNEquidistantPointsAt 4 (D.A.erase z) center

-- deleting ANY single carrier point still leaves a 4-point equidistant class at
that apex.  Equivalently the apex has a radius class of size >= 5, or two
disjoint classes of size >= 4.  The `cover` block encodes the opposite property
(a critical center whose shell is its ONLY >=4 class) and says nothing about
robust centers, so this is genuinely new content rather than a re-encoding.

Encoded here directly from the Lean definition, quantifier for quantifier: for
each deleted point z, some 4-subset of the survivors is pairwise co-radial at
the apex.  No paraphrase, so an UNSAT verdict is about the terminal's field and
not about a convenient approximation of it.

Two apices are designated robust.  Which two is immaterial to the probe -- it
has no cap structure and every point is interchangeable -- so index 0 and 1 are
used, and `--robust` varies the count to locate the threshold.
"""

from __future__ import annotations

import argparse
import itertools
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


def robust_clauses(cnf, n, center):
    """FullyDeletionRobustAt at `center`, transcribed from the Lean structure.

    survives : forall z in A, HasNEquidistantPointsAt 4 (A.erase z) center
    """
    def eq(c, l, r):
        return cnf.var(f"eq_{c}_{min(l, r)}_{max(l, r)}")

    added = 0
    for z in range(n):
        others = [p for p in range(n) if p != center and p != z]
        if len(others) < 4:
            # Fewer than four survivors: no 4-class can exist after this
            # deletion, so robustness at `center` is outright unsatisfiable.
            # Assert that, rather than skipping the obligation.
            bot = cnf.var(f"bot_{center}_{z}")
            cnf.add([bot])
            cnf.add([-bot])
            added += 2
            continue
        selectors = []
        for quad in itertools.combinations(others, 4):
            sel = cnf.var(f"rob_{center}_{z}_" + "_".join(map(str, quad)))
            selectors.append(sel)
            for left, right in itertools.combinations(quad, 2):
                cnf.add([-sel, eq(center, left, right)])
                added += 1
        cnf.add(selectors)
        added += 1
    return added


def max_class_clauses(cnf, n, bound):
    """No center carries a radius class of size > `bound`.

    Under the transitivity already asserted by `avoid_probe.build`, a spanning
    star of `bound` edges from one member pins the whole class, so forbidding
    that star forbids the class.
    """
    def eq(c, l, r):
        return cnf.var(f"eq_{c}_{min(l, r)}_{max(l, r)}")

    added = 0
    for center in range(n):
        others = [p for p in range(n) if p != center]
        for group in itertools.combinations(others, bound + 1):
            hub, rim = group[0], group[1:]
            cnf.add([-eq(center, hub, other) for other in rim])
            added += 1
    return added


def run(n, schemas, robust, oracle_on_model, max_class=None):
    t0 = time.time()
    cnf, stats = AP.build(n, schemas, k4=True, cover=True, geometry=True)
    base = len(cnf.clauses)
    for center in range(robust):
        robust_clauses(cnf, n, center)
    if max_class is not None:
        max_class_clauses(cnf, n, max_class)
    build = time.time() - t0

    solver = Cadical195(bootstrap_with=PysatCNF(from_clauses=cnf.clauses))
    t1 = time.time()
    ok = solver.solve()
    solve = time.time() - t1
    report = oracle = None
    if ok and oracle_on_model:
        model = {lit for lit in solver.get_model() if lit > 0}
        eqs, _ = read_pattern(n, cnf.ids, model)
        report = audit(n, eqs)
        oracle = decide(n, eqs, all_triples(n) - eqs)
    solver.delete()
    tag = f"{robust} fully-robust center(s)" + (
        f", max class <= {max_class}" if max_class is not None else "")
    print(f"[n={n}] {tag}: "
          f"{'SAT' if ok else 'UNSAT'}  base {base:,} -> "
          f"{len(cnf.clauses):,} clauses  "
          f"[build {build:.0f}s solve {solve:.0f}s]"
          + (f"  audit={report} oracle={oracle}" if report else ""),
          flush=True)
    return dict(n=n, robust=robust, max_class=max_class,
                verdict="SAT" if ok else "UNSAT",
                base_clauses=base, total_clauses=len(cnf.clauses),
                build_seconds=round(build, 1), solve_seconds=round(solve, 1),
                audit=report, oracle_on_model=oracle)


def smoke() -> int:
    """The encoding must be refutable and satisfiable for the right reasons."""
    ok = True
    # A center cannot be robust when there are too few points to rebuild a
    # 4-class after a deletion: at n = 5 the center has 4 others, and deleting
    # one of them leaves 3.  Must be UNSAT on the robustness clauses ALONE.
    cnf = AP.CNF()
    robust_clauses(cnf, 5, 0)
    s = Cadical195(bootstrap_with=PysatCNF(from_clauses=cnf.clauses))
    got = s.solve()
    s.delete()
    print(f"  smoke n=5 robust-alone: {'SAT' if got else 'UNSAT'} "
          f"(want UNSAT) {'OK' if not got else 'FAIL'}", flush=True)
    ok &= not got
    # At n = 6 the center has 5 others; deleting any one leaves 4, so the
    # unique satisfying shape is the full 5-class.  Must be SAT.
    cnf = AP.CNF()
    robust_clauses(cnf, 6, 0)
    s = Cadical195(bootstrap_with=PysatCNF(from_clauses=cnf.clauses))
    got = s.solve()
    s.delete()
    print(f"  smoke n=6 robust-alone: {'SAT' if got else 'UNSAT'} "
          f"(want SAT) {'OK' if got else 'FAIL'}", flush=True)
    ok &= got
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--n", type=int, nargs="+", default=[15])
    ap.add_argument("--robust", type=int, nargs="+", default=[0, 1, 2])
    ap.add_argument("--bank", type=Path, default=LANE / "schema-bank.json")
    ap.add_argument("--max-support", type=int, default=5)
    ap.add_argument("--max-class", type=int, default=None,
                    help="forbid any radius class larger than this")
    ap.add_argument("--smoke", action="store_true")
    ap.add_argument("--no-oracle", action="store_true")
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()

    if args.smoke:
        return smoke()

    print("smoke test of the robustness encoding:", flush=True)
    if smoke() != 0:
        print("ENCODING SMOKE TEST FAILED -- results would be meaningless",
              flush=True)
        return 1

    schemas = load_schemas(args.bank, args.max_support)
    print(f"\nbase: {len(schemas)} relaxation schemas (support <= "
          f"{args.max_support}) + all-center K4 + cover + geometry", flush=True)
    results = []
    for n in args.n:
        for robust in args.robust:
            results.append(run(n, schemas, robust, not args.no_oracle,
                               args.max_class))
            if args.out:
                args.out.write_text(
                    json.dumps(dict(results=results), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
