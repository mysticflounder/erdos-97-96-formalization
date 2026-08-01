# Cap-card / source-clean bridge audit (2026-07-31)

## Verdict

There is no checked source-clean route currently visible from
`CapSourceThirdCanonicalRowSurface P Pρ` plus
`GeometricMultiplicityResidual P Pρ` to `False` in
`Problem97.ATail.TwoSourceExactCollisionRowsTerminal`.
The immediate terminal `false_of_capSourceThirdCanonicalRowSurface` remains a
literal `sorry` (the other terminal, `false_of_crossBlockerCoincidence`, is a
second literal `sorry`).  The live coordinator
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
dispatches the cap-source residual directly to that theorem.

## What cap-size/radius rigidity actually supplies

`CapApexRadiusRigidity.lean` provides only cardinality consequences:

* `capInteriorByIndex_card_add_two` (lines 29--44) gives
  `interior.card + 2 = cap.card`.
* `oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four`
  (116--147) and `...force_cap_card_ge_six` (151--162) turn two distinct
  positive K4 radii with class-card `>= 4` into strict-interior `>= 4` and
  closed-cap `>= 6`.
* The general sum-minus bounds (168--222) are likewise lower bounds.

The cap-source producer requires `8 <= cap.card`; the rigidity lemmas are
therefore compatible with that branch and do not generate a contradiction,
nor do they produce a third shell source, cross-row incidence, or successor
preimage.  The only relevant upper bounds are per-shell intersections (at
most two points in a rich class), not a cap-wide upper bound.

## Minimality / no-M44 applicability

`FrontierCommonDeletionParentResidual` does retain
`minimal : D.Minimal`, `noM44 : ¬ ∃ T, T.IsM44`, and `carrier_card_gt_nine`
(`OrientedPhysicalApexIngress.lean:251--260`).  Existing checked uses of
`noM44` only prove the disjunction that one opposite cap has size at least
five (`RetainedMatchingGeometricReduction.oppositeLargeCap_disjunction_of_parent`,
~296--307; same argument in `RetainedCollisionCapLocalization`).  They do not
refute a cap of size eight or localize the cap-source blocker.

The source-clean `sixCenterDeletionSurvivalPacket_of_oneSided` (FrontierLiveClosure
~9042--9190) packages one-sided survival as five-center robustness plus a
sixth source-blocker center and records a six-element center set.  Its only
consumer in `false_of_twoCapSources_oneSidedDeletionSurvival` (~9193--9214)
is a compatibility adapter that calls the sorry-backed cap-source terminal.
Thus the six-center packet is not a closure theorem.

## Existing checked branches that do close elsewhere

`false_of_frontierAllLargeCapsTriApex_all_low_hits` (~12298) is source-clean,
but it consumes a retained first-apex collision/omission packet (`P`) and
closes the low-hit coordinator.  A cap-source witness is a new third source,
not a `RetainedInteriorBlockerCollision`/directed-omission packet, so this
consumer cannot be applied without an additional producer converting the
cap-source row into one of those packets.  Such a conversion is exactly the
missing bridge, not a theorem already present.

The cap-source surface itself is constructed source-clean by
`exists_capSource_thirdCanonicalRow_omits_each_collisionPair` in
`TwoCollisionGlobalProducer.lean` (~619--643), but the construction only
records a source, its own selected 4-shell, blocker inequalities, and two
cross-deletion views.  It does not prove a contradiction.

## Residual branch fan-out

`false_of_twoCapSources_firstFiber` (~9220--9259) is source-clean through the
mutual-cross-membership split.  Equal blockers + common omitted endpoint and
one-sided deletion both route to compatibility adapters that call the cap-
source `sorry`; equal blockers + complementary membership and distinct
blockers + mutual membership are source-clean.  Consequently the remaining
residual-to-False work is concentrated in the fresh-third-fiber and one-sided
deletion producers (or a new theorem consuming the six-center packet), not in
cap-card arithmetic.

## Exact missing bridge

To remove the cap-source `sorry`, a new checked producer must use the retained
minimality/no-M44/tri-apex data and the cap-source witness's two deletion views
to derive either:

1. a concrete retained collision/omission packet consumable by the existing
   low-hit coordinators; or
2. a direct geometric contradiction (for example, a third-shell hit or an
   explicit M44 certificate).

No current theorem supplies either conclusion from the present
`CapSourceThirdCanonicalRowSurface` fields.
