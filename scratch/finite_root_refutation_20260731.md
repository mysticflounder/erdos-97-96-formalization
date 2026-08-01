# Finite/rational root audit (2026-07-31)

## Scope

This is a computational audit of the two live leaves in
`TwoSourceExactCollisionRowsTerminal`:

```lean
false_of_crossBlockerCoincidence
false_of_capSourceThirdCanonicalRowSurface
```

No production file was edited.  The checks below are projections of the
named equalities/incidences; they are not models of `CounterexampleData`.

## CrossBlockerCoincidence

`uv run python scratch/atail-force/cross-blocker-euclidean-audit/exact_12_branch_witnesses.py`
returns:

```text
verified 12 exact rational witnesses
```

All four equality arms (`A=b1`, `A=b2`, `B=a1`, `B=a2`) crossed with all
three `GeometricMultiplicityResidual` arms are satisfiable in the explicit
Euclidean projection.  For example, the first branch (`A=b1`, fresh third
fiber) has

```text
O=(0,0), a1=(3,4), a2=(3,-4), A=b1=(6,0),
B=(2,2), b2=(0,6), C=(20,17), t1=(23,21), t2=(16,20),
|O-a1|^2=|O-a2|^2=25, |O-b1|^2=|O-b2|^2=36.
```

The projection checks 39 exact rational predicates (row equalities,
distinctness, residual memberships, and modeled exact-four capacity), with no
failed checks.  It omits cap realization, all unnamed support points,
deletion packets/robustness, minimality, `noM44`, the full tri-apex residual
`T`, and every other carrier source.  Therefore this is **not a
counterexample to the Lean root theorem**.

The source-level Lean audit in
`scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean` and
`scratch/collision-equality-arms/CollisionEqualityArms.lean` proves that each
coincidence identifies the requested cross-hit with the selected shell's own
center, hence the cross-hit is *not* in that shell.  It also proves that the
whole displayed conclusion is impossible from the exact disjoint collision
rows.  Thus the live theorem cannot be closed by constructing its displayed
cross-hit/three-hit alternatives; it must derive `False` first from the global
hypotheses.

**Next usable constraint:** a producer consuming `T` together with the
two-cycle, exact-cap, deletion, and minimality data and yielding `False` (or a
positive incidence package such as a genuinely distinct selected row through
both collision sources).  The local equality itself is not a contradiction.

## CapSourceThirdCanonicalRowSurface

The exact rational replay

```bash
uv run python scratch/atail-force/fresh-third-no-alignment-euclidean/model.py \
  --output scratch/atail-force/fresh-third-no-alignment-euclidean/result.json
```

returns `SAT` for one of the 120 strict cyclic orders.  The witness is

```text
a1=(0,0), a2=(0,-1), bp=(0,1), br=(0,4), bq=(0,3),
p1=(-2,5), p2=(2,5), r1=(-3,10), r2=(3,10), q1=(-1,2), q2=(1,2),
order p1 < q1 < q2 < p2 < r2 < r1.
```

It realizes three pairwise distinct first-apex radii, equal blocker rows for
the `p`, `r`, and cap-source `q` pairs, distinct blocker values, and the two
q-row endpoint-omission disjunctions corresponding to the two
`CrossPairDeletionView`s.  This is a local witness for the cap-source surface,
not a `CounterexampleData` model: it has no carrier-wide convex/Moser/MEC
certificate, exact four-point support completions, cap endpoints or unnamed
points, q-free/K4 conditions, deletion robustness, minimality, `noM44`, or
tri-apex `T`.

The stronger alias-aware/order projection in
`fresh-third-no-alignment-euclidean-v2/result.json` is only `UNKNOWN`
(`sat=0`, `unsat=3`, `unknown=340`, 250 ms per branch), so it supplies no
refutation either.

**Next usable constraint:** retain the complete source-indexed critical map
and at least one genuinely global ingredient (all carrier K4/deletion
robustness, minimality, `noM44`, or `T`) to produce a direct contradiction or a
fully specified distinct-center row through the relevant pair.  The local
cap-source row and omission predicates alone are realizable.

## Bottom line

Both roots survive exact local finite/rational projections.  The artifacts
refute only the tempting *local* proof routes (matching cross-hit and
same-cap row construction); they do not refute either production theorem under
its full `CounterexampleData` hypotheses.  The honest frontier is a global
bridge from `T`/minimality/deletion data to `False`.

