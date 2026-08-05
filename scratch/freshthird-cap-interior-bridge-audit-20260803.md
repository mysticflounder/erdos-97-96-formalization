# FreshThird noncanonical same-cap cap-interior bridge audit

Date: 2026-08-03  
Scope: import-reachable declarations under `P97/ATail/FrontierLiveClosure.lean`; no production Lean edits.

## Verdict

No import-reachable theorem currently turns
`FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource` into `False`,
or into a stronger cap-interior/cardinality packet. The branch remains open with
the present interface. Its relevant hypotheses are:

```lean
centers_ne : H.centerAt source.1 source.2 ≠
  H.centerAt Q.source₁.1 Q.source₁.2
source₁_mem, source₂_mem : Q.source₁.1/Q.source₂.1 ∈
  (H.selectedAt source.1 source.2).toCriticalFourShell.support
overlap_eq : source-row-support ∩ Q₁-row-support =
  {Q.source₁.1, Q.source₂.1}
sourceCenter_mem, freshCenter_mem : both centers ∈
  S.capInteriorByIndex capIndex
fiberSource_mem_cap : Q.source₁.1 ∈ S.capByIndex capIndex ∨
  Q.source₂.1 ∈ S.capByIndex capIndex
hcapIndex : capIndex ≠ S.oppIndex1
```

`FreshThirdBlockerFiber` itself supplies only the common blocker, source
distinctness/freshness, and reciprocal shell membership; it supplies no radius
equality to a cap apex, no source-interior pair, and no both-sources-off-cap fact.

## Closest import-reachable consumers

* `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.selectedFourClass_outside_overlap_card_le_one`
  (`FrontierLiveClosure.lean:9097`) proves
  `((Kc.support \\ S.capByIndex i) ∩ (Kd.support \\ S.capByIndex i)).card ≤ 1`
  with exact shape
  ```lean
  {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
  {c d : ℝ²} (hcCap : c ∈ S.capByIndex i) (hdCap : d ∈ S.capByIndex i)
  (hcd : c ≠ d) (Kc : SelectedFourClass D.A c)
  (Kd : SelectedFourClass D.A d) :
    ((Kc.support \ S.capByIndex i) ∩ (Kd.support \ S.capByIndex i)).card ≤ 1
  ```
  for two distinct cap centers and selected four-classes. With `overlap_eq`, it
  closes only if both `Q.source₁.1` and `Q.source₂.1` are outside the cap. The
  current disjunction `fiberSource_mem_cap` explicitly allows one source in the
  cap, so the required cardinality-2 outside overlap is unavailable.

* `Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
  (`CapSelectedRowCounting.lean:278`) gives
  ```lean
  {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
  (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
  (hcenter : center ∈ S.capByIndex i) :
    (K.support ∩ S.capByIndex i).card ≤ 2
  ```
  when the class center lies in that cap. It is compatible with one or both Q sources in the cap and yields no
  contradiction from `overlap_eq`.

* `Problem97.ATailRetainedCollisionCapLocalization.actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`
  (`RetainedCollisionCapLocalization.lean:269`) forces equality of two centers,
  with exact hypotheses `Q : RetainedRadiusCollision (R := R)`,
  `hcommon`, `hrowCenter`, `hsource₁Off`, `hsource₂Off`, `hsource₁Row`, and
  `hsource₂Row` (the latter four are the two off-cap and two row-membership
  fields). It requires a `RetainedRadiusCollision`, both sources outside the
  cap, and source-faithful membership in the second row. `FreshThirdBlockerFiber` is not
  such a collision packet and lacks the both-off-cap hypotheses.

* The same file's
  `commonBlocker_mem_firstCapInterior_of_sources_mem` (line 308) and
  `commonShell_inter_firstCap_eq_sources` (line 371) require *both* collision
  sources in `S.capInteriorByIndex S.oppIndex1` and a `RetainedRadiusCollision`.
  FreshThird is noncanonical (`capIndex ≠ oppIndex1`) and has only an OR
  cap-membership condition, so neither applies.

* `Problem97.SurplusCapPacket.capInteriorByIndex_not_mem_capByIndex_of_ne`
  (`SurplusM44Packet/Shard02.lean:141`) and
  `capInteriorByIndex_ne_of_mem_of_mem_ne` (line 183) only separate different
  cap indices. They do not distinguish the same-cap branch.

* `Problem97.ATailCapApexRadiusRigidity.oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four`
  (`CapApexRadiusRigidity.lean:116`) can force an interior cardinality lower
  bound, but needs two distinct positive K4 radius classes centered at the
  Moser apex `S.oppositeVertexByIndex i`. FreshThird centers are arbitrary
  `H.centerAt ...`; no apex/radius/cardinality bridge is present.
  `capInteriorByIndex_card_add_two` (line 29) is only the closed-cap/interior
  cardinality identity.

* `Problem97.ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex`
  (`TwoCenterCapLocalization.lean:121`) needs two distinct points already in
  the same cap interior, equality of their distances from the indexed opposite
  apex, and equal distances from the candidate center. FreshThird has none of
  the strict-interior/physical-apex hypotheses.

The N8 same-cap declarations are in `P97/N8/N8hiSameCap.lean`, but are not on
the `FrontierLiveClosure` import path and use an incompatible
`FiniteEndpointShell`/N8 packet interface; they are not a bridge for this
branch.

## Missing producer shape

A useful next producer would need to provide at least one of:

1. `Q.source₁.1 ∉ S.capByIndex capIndex` and
   `Q.source₂.1 ∉ S.capByIndex capIndex` (then
   `selectedFourClass_outside_overlap_card_le_one` plus `overlap_eq` closes); or
2. an adapter from `FreshThirdBlockerFiber` to `RetainedRadiusCollision` carrying
   both-off-cap and source-faithful row fields; or
3. a genuine apex/radius theorem showing both Q sources lie in one strict cap
   interior at a common positive radius.

None of these producers is currently import-reachable from the FreshThird
coordinator.
