# Global Kalmanson closer report

## Result

The production leaf

```text
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

is **not closed** by the current equality/Kalmanson surface.

`GlobalKalmansonCloser.lean` kernel-checks the exact positive result:

1. either of the two paired equality-closure patterns on one increasing
   quadruple contradicts a strict Kalmanson inequality;
2. each retained collision supplies one equality closure, centered at its
   common blocker, between its two collision sources; and
3. every blocker/source equality arm of `hcapEightOrCross` merely renames that
   center and hence supplies one named one-star closure.

All four checked declarations report only:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, `sorryAx`, custom axiom, native oracle, or use of the
production leaf.

## What the named anchors actually force

Write the two collision pairs as `(p1,p2)` and `(q1,q2)`, with blockers `bp`
and `bq`.  The collision rows give

```text
dist bp p1 = dist bp p2
dist bq q1 = dist bq q2.
```

For example, the anchor `bp = q1` yields only

```text
dist q1 p1 = dist q1 p2.
```

It does **not** yield `q1` in the row centered at `q1`: selected critical
shells omit their center.  It also does not align the second collision
equality with the same four-label Kalmanson sum.  The other three named
anchor arms are identical after swapping the two pairs or their sources.

The localized mutual-omission packets add negative incidences.  They do not
produce the missing positive occurrence or a second equality closure.

## Exact Kalmanson terminal and missing producer

The checked terminal is

```lean
PairedKalmansonClosure.false_of_ccw
```

for `ia < ib < ic < id`.  It accepts either

```text
bc = ac  and  ad = bd
```

or

```text
ab = ac  and  cd = bd
```

in the global `EdgeClosure` relation and derives `False`.

The smallest missing statement for this route is the following
**PARKED-SPEC**, not a proved obligation:

```text
Under the exact hypotheses of the production leaf, together with the
negation of its three-hit and four cross-hit conclusions, construct a CCW
boundary and ia < ib < ic < id for which the reindexed faithful-carrier row
pattern has PairedKalmansonClosure ia ib ic id.
```

Equivalently, after one named blocker/source anchor has supplied its checked
one-star closure, a viable producer must supply:

- the complementary closure on the same ordered quartet; and
- the common cyclic order witnessing the relevant strict Kalmanson sum.

The `8 <= cap.card` arm supplies neither anchor, so any uniform producer must
also handle that arm using stronger live geometry.

The closest already-banked source-specific alternative is
`ATailRetainedCollisionDifferentPairConsumer.OrderedDifferentPairCrossHit.false`
(and its alternate-order companion).  To reach it one must construct both:

- a positive occurrence of the opposite collision source in the fresh
  selected row; and
- one of the terminal's exact six-point CCW orders.

Current connectivity gives one row edge at a time and the current localized
packets give omissions, so neither field follows from the present interface.

## Why a pure structural Kalmanson coverage theorem is unavailable

The exact rational artifact

```text
scratch/atail-force/uniform-cycle-coverage-audit/
  n11_a1_minimal0.full_lra.json
```

is independently verified as `SAT_VERIFIED_FULL_KALMANSON_METRIC`.  It
satisfies the audited row/blocker structural surface and all strict Kalmanson
inequalities.  Its blocker map has three collision fibers:

```text
blocker 4: sources {2,9}
blocker 6: sources {4,7}
blocker 3: sources {5,8}.
```

Thus multiple named collision rows do not force a global paired closure in
the pure abstract Kalmanson surface.

This is not a counterexample to the production leaf: the metric is not
Euclidean.  The follow-up Euclidean-cell audit finds a six-label local
incompatibility matching
`u5_qcritical_aux_base_collision_metric_incompatibility`.  That sharpens the
route boundary: a successful uniform theorem must use planar Euclidean
rank/PSD information, exact radius filters, cap/MEC placement, common
critical-map coupling, or a finite Euclidean-obstruction coverage theorem.
Kalmanson inequalities plus row incidence and blocker connectivity alone are
insufficient.

## Theorem-bank sweep

No existing imported theorem constructs the missing producer.

- `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
  needs two rows sharing two ordered points.
- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle` needs an explicit cycle
  of strict ordinal comparisons.
- `OrderedDifferentPairCrossHit.false` needs the positive cross occurrence
  and exact order described above.
- `Census554.EqualityCore.six_row_anchor_collision` needs a much larger
  pre-aligned equality core.
- `u5_qcritical_aux_base_collision_metric_incompatibility` is catalogued in
  the sibling `p97-rvol` bank; the corresponding local corpus entry is not
  present in this checkout's current source tree.

The most direct next bridge is therefore an occurrence-and-order producer for
the existing different-pair terminal, or a genuinely Euclidean finite-cell
coverage theorem that constructs `PairedKalmansonClosure` (or another banked
metric obstruction) from the no-hit hard branch.

