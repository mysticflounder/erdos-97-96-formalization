# FreshThird normalized residual consumer search (2026-08-03)

Scope: read-only theorem-bank/import audit for a kernel-checked (or source-clean
and transitively closed) theorem consuming
`FreshThirdNormalizedResidualRemainingCase P Pρ C Q`, or either
`firstNonHit`/`secondNonHit` constructor, and proving `False`.

## Live declarations and trust status

* `Erdos9796Proof.P97.ATail.FrontierLiveClosure.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
  (`FrontierLiveClosure.lean:11217`):
  `(C : TwoCapSourceThirdCanonicalRowSurface P Pρ) →
   (Q : FreshThirdBlockerFiber P Pρ) →
   FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase P Pρ C Q → False`.
  Body is `by sorry`; this is the sole load-bearing open leaf and is not a
  source-clean consumer.
* `...false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
  (`:11230`) consumes two `FreshThirdCapSourceInteraction` packets plus
  `FreshThirdNormalizedResidualCase` and proves `False`, but its `firstNonHit`
  and `secondNonHit` cases call the open theorem above.  Thus it is not
  transitively kernel-closed.
* `...false_of_twoCapSources_freshThirdBlockerFiber_residual` (`:12840`) and
  `..._core` (`:12884`) are source-clean wrappers only in syntax; both route
  through `normalized_residual`, so their axiom closure inherits the open
  `sorry`.

## Source-clean branch consumers found (not applicable to residual packet)

* `false_of_two_freshThirdCrossRowHits_distinctCenters`
  (`:10889`): consumes two positive `FreshThirdCrossRowHit` hypotheses and
  distinct center inequality; derives a 3-center perpendicular-bisector bound.
  Residual `firstNonHit`/`secondNonHit` supplies the negation of one hit, while
  `equalCrossRowCenters` supplies center equality, so hypotheses cannot be
  constructed from this packet.
* `false_of_freshThird_sameCapCrossRowAlignment` (`:9308`): consumes
  `FreshThirdSameCapCrossRowAlignment`, including cap membership, two endpoint
  omissions, and same-cap row data.  Neither non-hit constructor retains this
  alignment packet.
* `false_of_freshThirdEqualCenter_sameCapOppIndex` (`:10656`): consumes both
  cross-row hits, equal centers, and a same-cap interaction at
  `capIndex = S.oppIndex1`; this closes only the canonical equal-center arm
  before it is placed in the remaining packet.  It does not consume
  `firstNonHit`, `secondNonHit`, or noncanonical equal-center interactions.
* `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (`:10388`) is a
  source-clean normalizer from an interaction plus `¬FreshThirdCrossRowHit` to
  `FreshThirdCapSourceNonHit`; it is a producer, not a contradiction consumer.

## Nearest theorem-bank hit outside FreshThird

`Erdos9796Proof.P97.Phase3SharedPairSeparation.selectedFourClass_shared_pair_separated`
(`Phase3SharedPairSeparation.lean:31`) requires an injective CCW convex
boundary, carrier-to-boundary index map, two distinct centers, and reciprocal
membership of two distinct points in both selected rows.  FreshThird residual
data has no boundary transport/index map, and the equal-center arm explicitly
lacks distinct centers; non-hit arms lack reciprocal row incidence.  It is not
import-reachable from `ATail.FrontierLiveClosure` (the file has no import edge to
`Phase3SharedPairSeparation` or its `Phase3StructuralConstraintBank` wrapper),
and is inapplicable even if imported manually.

Another exact-four deletion theorem,
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission`
(`FrontierLiveClosure.lean:1474`), requires
`OriginalUniqueFourResidual`, common-radius classes, five-point cardinality,
and joint-deletion packets absent from `FreshThirdBlockerFiber`; it is likewise
inapplicable.

## Search result

`nthdegree docs search --lean` over FreshThird, non-hit, omission, equal-center,
and shared-pair concepts found only the declarations listed above and no
import-reachable source-clean theorem consuming
`FreshThirdNormalizedResidualRemainingCase` or either non-hit branch. Existing
theorem-bank/certificate registries contain no FreshThird/non-hit certificate.
The first missing bridge remains a new source-faithful incidence/metric or
cap/radius/order producer/terminal; wrappers, SAT artifacts, or conditional
`Closers` assumptions would be circular/non-kernel evidence.
