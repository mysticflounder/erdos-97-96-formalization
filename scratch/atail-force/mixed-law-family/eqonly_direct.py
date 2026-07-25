#!/usr/bin/env python3
"""The equality-only question as ONE combined query, with no orbit blocking.

Same obligation as eqonly_cegar.py: can any pure-EQUALITY schema bank close
`false_of_frontierAllLargeCapsBiApexRobustResidual` (profile (6,6,6), carrier
cardinality >= 15, general in n)?

eqonly_cegar.py answered it by refutation-and-block: solve the Boolean layer
with CaDiCaL, hand the model's equality set to z3, mine the unsat core as a
pure-equality law, block its whole dihedral orbit, repeat.  Each orbit costs
30k-90k clauses; past roughly thirty laws the single CaDiCaL solve dominates
and the loop stalls at BUDGET without ever reaching a verdict.  The orbit
clauses are the cost, and they are only there to re-derive, propositionally,
facts the real-arithmetic theory already knows.

Here the two halves are put in one solver instead.  Boolean layer literals
become z3 Bools; the 105 pairwise distances become Reals under positivity,
strict triangle on every triple and both strict Kalmanson inequalities on
every cyclic 4-subset; and each co-radiality atom is linked by the ONE-WAY
implication

    ev(y,u,v)  ->  d(y,u) = d(y,v)

One-way is what makes this the equality-only relaxation: a true atom forces an
equality, a false atom forces nothing.  CDCL(T) then derives each pure-equality
law on demand as a theory lemma over the atoms actually assigned, which is the
orbit-blocking step done by the theory solver rather than by clause expansion.

Verdicts, both decisive:

  SAT    a layer model whose equality set is metrically realizable exists, and
         the model carries explicit rational distances witnessing it.  No
         pure-equality schema of any support refutes that pattern, so no
         pure-equality bank -- however complete -- can close the branch by
         covering.  The covering route needs forced-equality laws.
  UNSAT  every layer model's equality set is metrically contradictory.  The
         layer is refuted by pure-equality reasoning alone, so at this
         cardinality and profile the branch is impossible, subject to the layer
         faithfulness audit in
         docs/audits/2026-07-24-all-large-caps-terminal-route-inventory.md.

Smoke test (--smoke) validates both halves of the encoding against known
results before any production run: the real-arithmetic half against a mined
support-7 four-atom law that must come back UNSAT and its proper subsets that
must come back SAT, and the Boolean half by extracting a z3 model of the layer
clauses and re-evaluating every DIMACS clause in plain python.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from z3 import Bool, Implies, Or, Real, Solver, sat, unsat  # noqa: E402

from gen_avoid import build_layer  # noqa: E402

# A law mined by eqonly_cegar.py at n=15 (eqonly-n15.json, law index 1):
# support 7, four atoms, metrically UNSAT under the support-local family.
KNOWN_LAW = (7, (("+", 0, 1, 3), ("+", 0, 1, 4), ("+", 5, 2, 4), ("+", 6, 2, 3)))


def metric_axioms(s, n):
    """Positivity, strict triangle, both strict Kalmanson.  Returns D."""
    d = {}
    for u, v in itertools.combinations(range(n), 2):
        d[(u, v)] = Real(f"d_{u}_{v}")
        s.add(d[(u, v)] > 0)

    def D(u, v):
        return d[(min(u, v), max(u, v))]

    for x, y, z in itertools.combinations(range(n), 3):
        s.add(D(x, z) < D(x, y) + D(y, z))
        s.add(D(x, y) < D(x, z) + D(y, z))
        s.add(D(y, z) < D(x, y) + D(x, z))
    for x, y, z, w in itertools.combinations(range(n), 4):
        s.add(D(x, z) + D(y, w) > D(x, y) + D(z, w))
        s.add(D(x, z) + D(y, w) > D(x, w) + D(y, z))
    return d, D


def smoke() -> int:
    """Validate both halves of the encoding against known results."""
    failures = 0
    k, atoms = KNOWN_LAW

    # --- real-arithmetic half: the mined law must be UNSAT ---
    s = Solver()
    _, D = metric_axioms(s, k)
    for _, c, u, v in atoms:
        s.add(D(c, u) == D(c, v))
    res = s.check()
    ok = res == unsat
    failures += 0 if ok else 1
    print(f"smoke LRA  full law (support {k}, {len(atoms)} atoms): "
          f"{res} (want unsat) {'OK' if ok else 'FAIL'}")

    # every proper subset must be SAT, else the law was not minimal and the
    # axiom encoding is stronger than the one the bank machinery uses
    for drop in range(len(atoms)):
        s2 = Solver()
        _, D2 = metric_axioms(s2, k)
        for i, (_, c, u, v) in enumerate(atoms):
            if i != drop:
                s2.add(D2(c, u) == D2(c, v))
        r2 = s2.check()
        ok2 = r2 == sat
        failures += 0 if ok2 else 1
        print(f"smoke LRA  law minus atom {drop}: {r2} (want sat) "
              f"{'OK' if ok2 else 'FAIL'}")

    # --- Boolean half: z3 must reproduce a genuine layer model ---
    n, a, b = 14, 5, 6   # smallest layer the build accepts: a>=5, b>=6, c>=6
    E, meta = build_layer(n, a, b)
    s3 = Solver()
    B = {i: Bool(f"v{i}") for i in range(1, E.n + 1)}

    for clause in E.clauses:
        s3.add(Or([B[x] if x > 0 else B[-x] == False for x in clause]))  # noqa: E712
    r3 = s3.check()
    ok3 = r3 == sat
    failures += 0 if ok3 else 1
    print(f"smoke BOOL layer n={n} ({a},{b},{n + 3 - a - b}) alone: {r3} "
          f"(want sat) {'OK' if ok3 else 'FAIL'}")
    if ok3:
        m = s3.model()
        assign = {i: (m.eval(B[i], model_completion=True).__bool__())
                  for i in range(1, E.n + 1)}
        bad = 0
        for clause in E.clauses:
            if not any(assign[x] if x > 0 else not assign[-x] for x in clause):
                bad += 1
        failures += 0 if bad == 0 else 1
        print(f"smoke BOOL re-evaluated {len(E.clauses)} DIMACS clauses in "
              f"python: {bad} violated (want 0) {'OK' if bad == 0 else 'FAIL'}")

        # the linking implications must be consistent with SOME assignment:
        # check the extracted model's equality set is a set of triples on n pts
        ev_ = meta["ev"]
        evtrue = [key for key, var in ev_.items() if assign[var]]
        print(f"smoke BOOL extracted equality set: {len(evtrue)} atoms of "
              f"{len(ev_)} co-radiality vars")

    print(f"smoke: {failures} failures")
    return 1 if failures else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--n", type=int, default=15)
    parser.add_argument("--a", type=int, default=6, help="surplus cap size")
    parser.add_argument("--b", type=int, default=6, help="first opposite cap")
    parser.add_argument("--timeout", type=int, default=0,
                        help="z3 timeout in seconds, 0 = none")
    parser.add_argument("--escape", action="store_true",
                        help="add oppCap2_escape_gen clauses (non-surplus pairs)")
    parser.add_argument("--shortest-chord", action="store_true",
                        help="add the shortest-side exclusion over ALL pairs")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    if args.smoke:
        return smoke()

    n, a, b = args.n, args.a, args.b
    c = n + 3 - a - b
    tag = f"n{n}-{a}{b}{c}-direct"
    print(f"[{tag}] profile ({a},{b},{c}) sums to n+3 = {n + 3}", flush=True)

    E, meta = build_layer(n, a, b)
    ev_ = meta["ev"]
    s = Solver()
    if args.timeout:
        s.set("timeout", args.timeout * 1000)

    B = {i: Bool(f"v{i}") for i in range(1, E.n + 1)}
    for clause in E.clauses:
        s.add(Or([B[x] if x > 0 else B[-x] == False for x in clause]))  # noqa: E712
    print(f"[{tag}] layer: {E.n} bools, {len(E.clauses)} clauses", flush=True)

    extra = 0
    if args.escape or args.shortest_chord:
        O1, O2 = meta["O1"], meta["O2"]
        if args.shortest_chord:
            pool = [p for p in range(n) if p not in (O1, O2)]
            label = "shortest-chord (all pairs)"
        else:
            pool = [p for p in range(n) if p not in set(meta["S"])]
            label = "escape (non-surplus pairs)"
        for x, w in itertools.combinations(pool, 2):
            lo, hi = min(x, w), max(x, w)
            s.add(Or(B[ev_[(O1, lo, hi)]] == False,  # noqa: E712
                     B[ev_[(O2, lo, hi)]] == False))  # noqa: E712
            extra += 1
        print(f"[{tag}] {label}: +{extra} clauses over {len(pool)} points",
              flush=True)

    d, D = metric_axioms(s, n)
    print(f"[{tag}] metric: {len(d)} reals, "
          f"{3 * len(list(itertools.combinations(range(n), 3)))} triangle + "
          f"{2 * len(list(itertools.combinations(range(n), 4)))} kalmanson",
          flush=True)

    for (y, u, v), var in ev_.items():
        s.add(Implies(B[var], D(y, u) == D(y, v)))
    print(f"[{tag}] linked {len(ev_)} co-radiality atoms one-way to equalities",
          flush=True)

    t0 = time.time()
    res = s.check()
    secs = round(time.time() - t0, 1)
    print(f"[{tag}] z3 says {res} in {secs}s", flush=True)

    result = dict(tag=tag, n=n, profile=[a, b, c], seconds=secs,
                  bools=E.n, clauses=len(E.clauses), extra_clauses=extra,
                  escape=args.escape, shortest_chord=args.shortest_chord)

    if res == sat:
        m = s.model()
        evtrue = sorted(key for key, var in ev_.items()
                        if m.eval(B[var], model_completion=True).__bool__())
        dist = {}
        for (u, v), r in d.items():
            val = m.eval(r, model_completion=True)
            dist[f"{u}_{v}"] = str(val)
        result.update(verdict="DECISIVE-SAT", equalities=len(evtrue),
                      equality_atoms=[list(k) for k in evtrue],
                      distances=dist)
        print(f"[{tag}] DECISIVE-SAT: layer model with {len(evtrue)} equality "
              f"atoms is metrically REALIZABLE, with explicit rational "
              f"distances. No pure-equality schema of any support refutes it.",
              flush=True)
    elif res == unsat:
        result.update(verdict="LAYER-UNSAT")
        print(f"[{tag}] LAYER-UNSAT: every layer model's equality set is "
              f"metrically contradictory. Pure-equality reasoning alone "
              f"refutes the branch at n={n}, profile ({a},{b},{c}).",
              flush=True)
    else:
        result.update(verdict="UNKNOWN", reason=str(s.reason_unknown()))
        print(f"[{tag}] UNKNOWN: {s.reason_unknown()}", flush=True)

    if args.out:
        args.out.write_text(json.dumps(result, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
