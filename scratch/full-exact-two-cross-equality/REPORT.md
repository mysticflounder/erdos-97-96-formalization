# Cross-blocker equality branches: focused audit

## Result

No imported `TwoCenterBisectorParity`, Kalmanson, cap-order, reflection, or
outside-pair theorem closes any of the four equality arms of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`FrontierLiveClosure.lean:2202` in the audited checkout).

The local metric and strict-cap geometry is genuinely feasible.  The
kernel-checked file `CrossEqualityMetricModel.lean` gives an exact rational
six-point model and proves:

- both collision-row source pairs are bisected by the physical apex;
- each pair is bisected by its blocker;
- the blockers are distinct;
- all sources and blockers lie in one strict cap relative to the physical
  apex;
- the six distinct geometric points have a strict-convex cyclic order; and
- all four syntactic blocker/source equality arms are obtained from the same
  model by swapping row labels and/or source order.

Therefore a proof of `False` in an equality arm cannot come from the currently
available two-center parity/Kalmanson or same-cap localization facts alone.  It
must use additional combinatorial content of the exact shell supports,
`LPρ/MPρ`, `LP/MP`, or genuinely global `T`/minimality/`noM44` data.

This is not a model of `CounterexampleData`, `R`, `Rρ`, or `T`; constructing
one would amount to modeling the unresolved global counterexample package.
It is a model of all currently extracted metric, strict-cap, blocker
distinction, source-disjointness, and convex-order consequences relevant to
the four equality arms.

## Exact model

Use rational Euclidean coordinates

```
O = (0, 2)
a = (-4, 0)
b = (4, 0)
c = (0, -1)
C = (21/10, -4/5)
d = (72/25, 29/25)
m = (0, -4)
```

The branch `A = c` has rows `(a,b)` with blocker `c` and `(c,d)` with blocker
`C`.  The strict-convex cyclic order is

```
a, c, C, b, d, O.
```

Every non-`O` point is strictly closer to `m` than `O` is.  The other three
branches are the following relabellings:

| branch | first sources | second sources | first blocker | second blocker |
|---|---|---|---|---|
| `A = c` | `a,b` | `c,d` | `c` | `C` |
| `A = d` | `a,b` | `d,c` | `c` | `C` |
| `C = a` | `c,d` | `a,b` | `C` | `c` |
| `C = b` | `d,c` | `a,b` | `C` | `c` |

## Existing-theorem audit

- `ATail/TwoCenterBisectorParity.lean:53,74,112,134`: the four
  `false_of_two_centers_equidistant_pair_*` lemmas eliminate only the
  non-alternating placements of two centers around a chord.  Equality leaves
  the alternating/interleaving placement; the model realizes it.
- `ATail/TwoCenterCapLocalization.lean:121`:
  `commonPhysicalPair_center_mem_capInteriorByIndex` puts the blocker in the
  same strict cap as its source pair.  This is compatible with the equality
  arm and is realized by the model.
- `CapSelectedRowCounting.lean:283`:
  `outsidePair_unique_capCenter` requires the common pair to be outside the
  ordered cap.  Here both source pairs are in the same strict cap.
- `ATail/RetainedCollisionCapLocalization.lean:177`:
  `actualRow_center_eq_commonBlocker_of_contains_collisionSources` requires a
  third actual row containing both collision sources.  None of the equality
  hypotheses supplies those two positive incidences.
- `U1CarrierInjection.lean:590`:
  `CriticalFourShell.center_not_mem_support` makes the cross-hit naming the
  identified blocker/source itself impossible in each equality branch.  Thus
  closure must produce a different cross-hit arm or a three-hit.
- `ATail/FrontierLiveClosure.lean:2122`:
  `selectedFourClass_outside_overlap_card_le_one` is an upper bound and gives
  no positive shared outside point.

The first missing bridge is consequently a theorem turning the forced
interleaving of the two source pairs, together with both localized
mutual-omission cycles, into either a named cross-hit or a three-hit.  No
imported theorem has that input/output shape.

## Check

From `lean/`:

```bash
lake env lean ../scratch/full-exact-two-cross-equality/CrossEqualityMetricModel.lean
```

Exit code: `0`.

The three theorem certificates depend only on Lean/mathlib's standard
`propext`, `Classical.choice`, and `Quot.sound` axioms; there is no `sorry`.
