# FreshThird normalized-remaining branch bridge audit (2026-08-03)

Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` (theorem starts at line 11324 and is still `sorry`).

## Interfaces checked

* `FreshThirdCapSourceInteraction` (lines 10375--10426) has four constructors:
  `sameBlocker`, `sourceRowOmission`, `distinctBlockersDifferentCaps`, and
  `sameCapWithInternalFiberSource`.
* `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (10487--10510)
  proves that failed `FreshThirdCrossRowHit` normalizes only to
  `FreshThirdCapSourceNonHit`: equal blocker/support equality or one-sided
  Q-endpoint omission with `HasNEquidistantPointsAt 4` after erasure.
* `FreshThirdNormalizedResidualRemainingCase` (11280--11314) retains
  `firstNonHit(data, secondInteraction)`, `secondNonHit(firstInteraction,data)`,
  and `equalCrossRowCenters(firstHit, secondHit, centers_eq,
  firstNonCanonical, secondNonCanonical)`.

## One concrete source-clean branch (already wired)

The equal-center product
`distinctBlockersDifferentCaps × sameCapWithInternalFiberSource` (and its
reverse) is contradictory.  In the first interaction, both centers lie in
`sourceCap` and `freshCap`, with `sourceCap ≠ freshCap`; in the second, both
centers lie in `capIndex'`.  Rewriting the first center equality
(`centers_eq`) transfers the second source-center membership to the first
center.  `SurplusCapPacket.capInteriorByIndex_ne_of_mem_of_mem_ne` then forces
`sourceCap = capIndex'`; applying the same primitive to the fresh center forces
`freshCap = capIndex'`, contradicting `caps_ne`.

This is the branch code at lines 11434--11453 (and symmetric code at
11467--11484).  The canonical-index subcase is separately closed by
`false_of_freshThirdEqualCenter_sameCapOppIndex` (10759), using
`freshThirdEqualCenterExactFourRow_of_hits` (10635) and the cap-intersection
cardinality bound.

## Why the requested remaining branches do not have a bridge

* `firstNonHit`/`secondNonHit`: after normalization, `sameBlocker` gives only
  center/support equality, while `sourceRowOmission` gives only one omitted
  Q endpoint and deletion survival.  The available equivalence
  `cross_deletion_survives_iff_not_mem_selected_support` merely converts
  omission to survival; it has no `False` conclusion.  Existing consumers
  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` (13706) and
  `false_of_twoCapSources_sameBlockerAllEndpointOmission` (12873) require,
  respectively, a common `SelectedClass` radius plus mutual cross-membership,
  or first-fiber witnesses/all-endpoint omission; neither is present in the
  generic `FreshThirdBlockerFiber` packet.
* Equal-center `distinctBlockersDifferentCaps × distinctBlockersDifferentCaps`
  is not contradictory from cap-index uniqueness: `centers_eq` yields equality
  of the two source-cap indices and equality of the two fresh-cap indices, but
  each interaction's own `sourceCap ≠ freshCap` remains consistent.  The
  generic mutual-cross terminal is inapplicable (it needs unequal source
  blocker centers and mutual incidence between the two cap-source rows).
* Equal-center noncanonical `sameCapWithInternalFiberSource × sameCap...` has
  both centers in a common non-`oppIndex1` cap and at least one fresh endpoint
  *inside* that cap.  `false_of_freshThird_sameCapCrossRowAlignment` (9359)
  instead requires both Q endpoints to be off-cap; the opposite hypothesis is
  retained here.  The only equal-center cap terminal,
  `false_of_freshThirdEqualCenter_sameCapOppIndex`, requires
  `capIndex = S.oppIndex1`, which is exactly the branch excluded before this
  residual.

The `nthdegree docs search --lean --agentic` query for these constructor shapes
returned no additional source-clean declaration (the agentic mode emitted no
answer in this environment); ordinary indexed searches found only the three
terminals named above and the existing wrappers.  Thus the first missing
producer is a branch-specific non-hit/deletion contradiction, or a strengthening
that supplies common radius + reciprocal row incidence (for the generic
two-cap terminal), or an equal-center noncanonical metric/order consumer.
No closure claim is justified for the target `sorry`.
