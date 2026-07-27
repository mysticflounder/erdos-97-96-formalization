# Collision-global-math audit

## Result

I did not find a source-clean proof of

`ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`.

The full local collision packet is realizable, and the available global
interfaces do not force the ordered row occurrence required by the existing
Kalmanson terminals.  In particular, global minimal deletion does not identify
its deletion witnesses with the named strict-cap collision sources.

I did obtain and kernel-check a new global consequence in
`PrescribedCenterTwoRowDeletion.lean`.

## 2026-07-27 cap-eight connector extraction

`../TwoCollisionGlobalProducer.lean` now proves two additional source-derived
results, without introducing an outcome interface or a conditional closer.

`exists_capSource_thirdCanonicalRow_omits_each_collisionPair` turns the
cap-eight/global-deletion producer into an explicit canonical row.  It gives a
carrier source `z` in the **strict interior** of the first indexed cap, outside
all four named collision sources, such that the selected row at its blocker:

- has cardinality exactly four and contains `z`;
- has center distinct from both collision blocker centers;
- has center distinct from both named opposite apices; and
- omits at least one endpoint of each of the two collision source pairs.

The last two disjunctions are not assumptions.  They follow by applying
`cross_deletion_survives_iff_not_mem_selected_support` to the two
deletion-survival disjunctions produced from global minimality.

`triApex_patterns_and_exists_capSource_thirdCanonicalRow_connector` carries
that third row together with the exact strict-cap metric alternatives at all
three Moser apices:

```text
one positive-radius class with at least four strict-cap points
or
two distinct positive-radius classes with at least two strict-cap points each.
```

The complementary ordered-cap extraction remains kernel-checked in
`CollisionBlockerBetweenSources.lean`:
`exists_ordered_two_collision_triples` places each collision blocker strictly
between its two source endpoints in one common strict cap order.

Both files elaborate with Lean 4.27.0.  `#print axioms` reports only
`propext`, `Classical.choice`, and `Quot.sound`; neither file contains `sorry`,
`admit`, or a declared axiom.

### Exact remaining leaf after this extraction

The remaining mathematical step is no longer the original
cap-eight-or-cross-equality disjunction.  On the cap-eight arm, all of the
following are now kernel-produced:

1. two source-blocker-source triples in one strict cap order;
2. a third exact canonical four-row based at a different strict-cap source;
3. one forced omission by that row from each collision pair; and
4. the three exact tri-apex strict-cap radius patterns.

The stable leaf is the Euclidean/global-minimality incidence statement that
these data force a canonical row to have three points in one of the three rich
strict-cap radius slices:

```lean
∃ i x (hx : x ∈ D.A) r,
  ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
  3 ≤
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)).card
```

That conclusion immediately contradicts
`criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`.
The narrowing measure is explicit: the parent starts with a two-arm cap/equality
split and no ordered or connector witnesses; the remaining leaf has a single
three-hit conclusion and may assume the two ordered triples, the third exact
row with its two forced omissions, and all three rich metric patterns because
the checked producers above construct every one of them.

## Checked new lemmas

`blockingSubset_inter_exactFourRow_card_eq_one` proves:

- if `V` blocks K4 at `center`;
- restoring every member of `V` restores K4; and
- the ambient radius-`r` row at `center` has exactly four points,

then `V` meets that row in exactly one point.

The proof uses deletion minimality in both directions.  Missing the row leaves
the exact four-row as a surviving witness.  If two row points were deleted,
restore one and inspect the restored K4 radius: the original radius still has
at most three points, while any other radius would already survive deletion of
all of `V`.

`exists_prescribedCenter_blockingSubset_hits_two_exactRows` applies global
minimality with

```lean
U = D.A.erase center
```

so the remaining global blocker center is forced to equal `center`.  For two
distinct exact-four radii it produces a deletion-minimal `V` which:

- is nonempty and contained in `D.A.erase center`;
- blocks K4 at `center`;
- meets each exact row in exactly one point;
- has cardinality at least two; and
- has either a same-radius pair or a `MinimalDeletionCore`.

`exists_firstApex_blockingSubset_hits_collisionRows` specializes this to the
live collision data `P` and `Pρ`.  Each of the two unique row hits is classified
as either one of the named collision sources or a point outside
`S.capInteriorByIndex S.oppIndex1`, using the two exact-interior equations.

All three declarations check with only the standard axioms
`propext`, `Classical.choice`, and `Quot.sound`; there is no `sorry`.

Validation command:

```bash
cd lean
lake env lean ../scratch/collision-global-math/PrescribedCenterTwoRowDeletion.lean
```

## Exact unresolved alternative

For each exact collision row, global minimality chooses exactly one deleted
row point, but the hypotheses do not force that point to be one of the two
strict-cap sources.  It can be either of the row's two off-strict-cap points.
Even replacing the chosen point by a named source preserves all radius counts
at the first apex, but supplies no cross-membership in either collision
blocker's canonical shell.

Thus this route narrows the needed bridge to one of:

1. an alignment theorem forcing a minimal-deletion row hit into the strict cap;
2. a theorem coupling an off-strict-cap deletion hit to one of the two named
   collision fibers; or
3. the missing whole-carrier ordered row occurrence needed by an existing
   Kalmanson terminal.

## Global theorem audit

The strongest available whole-carrier interface is
`nonempty_wholeCarrierBiApexKalmansonSurface B`.  Together with
`blockerRowManifest`, it supplies a CCW indexing, a faithful K4 row at every
carrier center, the canonical shell system, both apex omissions, and minimality
connectivity.  Available terminals include
`false_of_global_equal_sum_core`,
`false_of_global_complementary_equal_sum_core`, and production
`CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`.

No current theorem derives the required four-index paired `EdgeClosure`
occurrence or five-row CCW incidence pattern from `P`, `Pρ`, the two
mutual-omission cycles, and connectivity.  Connectivity transports only a
one-point row membership along each path edge.

The robust-center terminal
`false_of_supportCentersBisectFrontierPair` is also not instantiable: its two
required bisector equalities concern the packet pair `F.pair.q/w`, not the four
named collision sources, and no current theorem supplies either equality.

The unique-four global-deletion coupling is inapplicable because its
`OriginalUniqueFourResidual.unique_K4_radius` contradicts the live hypothesis
of two distinct exact-four radii at `S.oppApex1`.  Unique-four holds at the
collision blocker centers, not at the first apex.

The curvature-packing global incidence searches retain satisfiable survivors
even with global K4 rows, exact `2+1+1` rows, strong connectivity, and the
scalar curvature ledger.  This is further evidence that an actual geometric
ordered-occurrence producer, rather than another incidence count, is missing.
