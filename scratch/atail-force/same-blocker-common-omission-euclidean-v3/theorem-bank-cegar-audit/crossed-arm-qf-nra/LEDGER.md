# Crossed-arm fixed-role QF_NRA ledger

Date: 2026-08-01

This ledger is written before running either target formula.  It fixes the
scope of the audit and prevents a solver outcome from silently changing the
encoded theorem.

## Fixed roles

For each crossed-arm survivor, retain only the union of the three canonical
exact rows and their centers:

```text
bp = blocker(P.source1)
bq = blocker(source)
br = blocker(Prho.source1)

row(bp) = {P.source1, P.source2, Q.source, Q.other}
row(bq) = {source, source', crossed-common point, fourth_bq}
row(br) = {Prho.source1, Prho.source2, crossed-opposite point, fourth_br}
```

Each survivor has ten distinct retained points.  The precise finite names and
cyclic subsequences are loaded from the replayed witness JSON, not transcribed
as independent input.

## Degrees of freedom and equality count

- Coordinates: ten labeled planar points give 20 real variables.
- Gauge: `bp = (0,0)` and `P.source1 = (1,0)` removes two translations,
  one rotation, and one positive scale: four equations and 16 remaining
  coordinate degrees of freedom.  The two gauge points are distinct because
  every retained name is pairwise distinct.
- Metric equations: one four-point co-radial row needs three spanning
  squared-distance equalities.  Three rows therefore contribute nine named
  polynomial equalities.
- Nominal post-metric dimension: `20 - 4 - 9 = 7`, before checking algebraic
  independence.  No claim of independence is inferred from this count.
- Named distinctness: all 45 unordered pairs have positive squared distance.
  These are strict inequalities, not equality constraints.
- Retained-point row exactness: at each center the five other retained targets
  outside its four-point support have squared distance unequal to the row
  radius, for 15 disequalities.  Exactness against the seven removed carrier
  points is out of scope because those points have no variables in this local
  core.

## Incremental order stages

1. `metric`: gauge, 45 pairwise-distinctness inequalities, and the nine row
   equalities.  No cyclic order is encoded.
2. `local-turn`: the metric stage plus positive orientation of each cyclically
   consecutive triple in the retained ten-point survivor subsequence (ten
   inequalities).  This is a deliberate relaxation: it does not by itself
   assert a simple or convex polygon.
3. `edge-convex`: the metric stage plus the exact, less-redundant supporting
   edge characterization: every nonendpoint lies strictly left of every
   directed consecutive boundary edge (`10*(10-2)=80` inequalities).  This
   exactly enforces the reported CCW strict-convex cyclic order.
4. `full-convex`: the metric stage plus positive orientation of every
   increasing triple in the retained cyclic subsequence (`choose(10,3)=120`
   inequalities).  This redundant exact-order cross-check also implies
   distinctness and non-collinearity; explicit distinctness remains for
   uniform replay and diagnostics.

Every solver call is independently capped at 30 seconds.  A later stage is
never treated as evidence about an earlier or stronger omitted stage.

## ENCODED

- One shared pair of real Cartesian coordinates for each of the ten retained
  named points.
- The orientation-preserving similarity gauge described above.
- Pairwise named-point distinctness.
- Exactly the nine spanning squared-distance equalities for the three reported
  canonical four-point rows `bp`, `bq`, and `br`, plus all 15 complementary
  radius disequalities among retained points.
- At `local-turn`, only the ten adjacent positive turns in the exact retained
  survivor order.
- At `edge-convex`, all 80 strict supporting-edge inequalities; at
  `full-convex`, all 120 positive increasing-triple orientations in the exact
  same order.
- Separate formulas and solver calls for `source-at-common` and
  `other-at-common`.
- Exact post-SAT replay of every asserted polynomial equality and strict
  inequality in the returned Z3 model.

## OMITTED

- The other seven carrier points and all rows except `bp`, `bq`, and `br`.
- Complementary radius disequalities against the seven removed carrier points;
  row completeness is enforced only inside the retained ten-point core.
- Every unreported radius-equivalence class and the q-free deletion condition.
- The other selected K4 rows and the collision five-center deletion packet,
  beyond the three canonical rows retained here.
- Cap-crossing Kalmanson and shared-pair-separation inequalities not logically
  implied by the encoded coordinates and cyclic order.
- MEC and nonobtuse-triangle conditions.
- Full `CounterexampleData`, `noM44`, cap membership/cardinality, minimality,
  blocker provenance, and arbitrary-cardinality reduction.
- A Lean theorem, Lean build, kernel proof, proof-blueprint closure, and
  transitive axiom audit.

## Trust boundary and fail-closed policy

This is external bounded solver evidence.  `SAT` counts only after exact model
replay.  `UNSAT` from Z3 is retained as an uncertified diagnostic and must be
cross-checked/minimized before suggesting a theorem.  `UNKNOWN` is not evidence
in either direction: the exact SMT-LIB formula is emitted and cross-checked
with bounded cvc5 `--nl-cov`.  No solver result closes a Lean obligation.
