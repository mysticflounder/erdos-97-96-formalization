# Cross-blocker coincidence packet probe (read-only)

Scope: source audit of
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`.
No production Lean files were changed and no new `sorry`/wrapper was added.

## Live target and four arms

The target is still an unproved `sorry` at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7445-7456`.
Its full interface (distinct radii, exact-two cap intersections, disjoint
source pairs, distinct blockers, both localized packets and both mutual-
omission cycles) is declared at `:7401-7443`.  The disjunction is exactly

* `H.centerAt P.source₁ = Pρ.source₁`;
* `H.centerAt P.source₁ = Pρ.source₂`;
* `H.centerAt Pρ.source₁ = P.source₁`;
* `H.centerAt Pρ.source₁ = P.source₂`.

These are the four alternatives in
`ATailTwoCollisionGlobalProducer.CrossBlockerCoincidence`
(`lean/.../TwoCollisionGlobalProducer.lean:478-492`).  No arm has a checked
case theorem or an existing direct `False` consumer.

## What the packets actually provide

`LocalizedCollisionCommonDeletion` records only a fresh strict-cap point,
its non-membership in the predecessor shell, and a
`CommonDeletionTwoCenterPacket` (`RetainedStrictInteriorPairSelector.lean:422-437`).
Each `LocalizedCollisionMutualOmissionCycle` adds the two negative
cross-row memberships, distinct actual blockers, and two deletion packets
(`LocalizedCollisionMutualOmissionCycle.lean:137-163`).  In particular, under
the first arm, `Pρ.source₁` becoming the center of the `P` row is compatible
with `Pρ.source₁ ∉ row(P)` (center-not-in-own-support); the other three arms
are symmetric.  The packets do not provide a positive reciprocal incidence.

`CommonDeletionTwoCenterPacket` contributes exact four-point rows and only
`overlap_le_two` (`CommonDeletionTwoCenter.lean:25-46`), so a cardinality
contradiction would require a separately proved three-point overlap.  None is
derivable from the coincidence equality plus the packet fields.

The available two-circle terminal
`MinimalUniqueFourCover.false_of_centerAt_selectedFourClass_inter_card_ge_three`
(`MinimalUniqueFourCover.lean:390-407`) likewise requires an explicit
three-point intersection.  The cap theorem
`selectedFourClass_outside_overlap_card_le_one`
(`FrontierLiveClosure.lean:7298-7309`) is an upper bound only and supplies no
positive common outside point.  The exact-cap identity
`RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources`
(`RetainedStrictInteriorPairSelector.lean:251-293`) actually makes the
coincidence source lie outside the opposite shell, which is consistent with
the negative cycle fields rather than contradictory.

## Projection check

The existing exact rational audit
`scratch/atail-force/cross-blocker-euclidean-audit/` was rerun.  It reports
`verified 12 exact rational witnesses`: all `4 × 3` coincidence-arm ×
`GeometricMultiplicityResidual` (fresh-third, outside-first, outside-second)
projections satisfy the named row equalities, disequalities, and exact-four
occupancy.  This is explicitly only a projection (not a model of
`CounterexampleData`, cap order, deletion robustness, no-M44, or tri-apex
data), but it rules out the proposed local cap-intersection/cardinality route.

## Verdict

**No source-clean contradiction found in any of the four arms.**  Neither
`CommonDeletionTwoCenterPacket` overlap/cardinality nor the localized/mutual-
omission packets closes an arm.  The missing step is a genuinely global bridge
(minimality/no-M44, full ordered-cap geometry, carrier-wide K4 support/frame
confinement, or a tri-apex consequence), exactly as recorded in
`docs/computational-closure-plan-2026-07-28.md:251-258`.
