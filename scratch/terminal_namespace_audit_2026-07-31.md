# TwoSourceExactCollisionRowsTerminal audit (2026-07-31)

Scope: current `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`,
namespace lines 7397--11189.  Source audit only; no production edits.

## Literal `sorry`

Exactly two literals occur in this namespace:

| lines | declaration | status |
|---:|---|---|
| 7452--7456 | `false_of_crossBlockerCoincidence` | load-bearing terminal; assumes `CrossBlockerCoincidence` and `GeometricMultiplicityResidual`, and must globally exclude the four cross-blocker equalities using retained minimality/no-M44/tri-apex/two-cycle data. |
| 7491--7495 | `false_of_capSourceThirdCanonicalRowSurface` | load-bearing terminal; assumes `CapSourceThirdCanonicalRowSurface` and the same geometric-multiplicity residual.  This is the consolidated cap-eight/cardinality-sharp producer. |

No other literal `sorry`, `admit`, or local `axiom` occurs in the namespace.

## `sorryAx` transitive inventory

`#print axioms` on the current import (`scratch/audit_two_source_axioms.lean`)
reports `sorryAx` exactly for the two terminals above and these source-clean
compatibility wrappers (none is an independent obligation):

* `false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`
* `false_of_capSource_freshThirdBlockerFiber`
* `false_of_twoCapSources_oneSidedDeletionSurvival`
* `false_of_twoCapSources_firstFiber`
* `false_of_freshCanonicalRowOverride`
* `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
* `false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius`
* `false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii`
* `false_of_capSource_freshOutsideFirstBlockerFiber`
* `false_of_capSource_freshOutsideSecondBlockerFiber`

The checked same-cap alignment, mutual-membership, deletion, and row-count
lemmas have no `sorryAx` (only `propext`, `Classical.choice`, and `Quot.sound`).
The wrappers route to `false_of_capSourceThirdCanonicalRowSurface` (the
override wrapper reaches it through the fresh-third adapter); the second-fiber
wrapper is just the swapped first-fiber route.

## Direct consumers and publish spine

The sole live coordinator immediately outside the namespace is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(11347--11373): its residual split calls `false_of_capSourceThirdCanonicalRowSurface`
for the cap-source arm and `false_of_crossBlockerCoincidence` for the
cross-blocker arm.  The checked outer spine is:

```
exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
  -> exists_three_hit_of_two_collisionRows_capCross_normalForm (11495)
  -> exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions (11708)
  -> false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits (11764)
  -> false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits (12213)
  -> false_of_exactFourCollision_secondRadius_and_all_low_hits (12264)
  -> false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits (12288)
  -> false_of_retainedInteriorBlockerCollision_and_all_low_hits (12311)
  -> false_of_frontierAllLargeCapsTriApex_all_low_hits (12352)
  -> exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex (12352)
  -> false_of_frontierAllLargeCapsTriApexUniformMetricResidual
  -> false_of_frontierAllLargeCapsTriApexRobustResidual
```

The first two arrows are the only points where the namespace's direct `sorry`
terminals enter the publish path.  Replacing adapters does not discharge either
terminal.

## Non-circular closure route

Both roots already have checked producers for their hypotheses: the outer
coordinator obtains `GeometricMultiplicityResidual` from
`collisionCrossHit_or_geometricMultiplicity`, and obtains either the canonical
cap-source surface or `CrossBlockerCoincidence` from the finite
`hcapEightOrCross` split.  A non-circular route must therefore prove the two
roots directly from those retained global hypotheses (minimality/no-M44,
localized mutual-omission cycles, cap cardinality, and tri-apex geometry).
The local ordered-cap overlap lemma only supplies an upper bound and does not
produce the missing positive outside point; alignment/adapters are bookkeeping,
not closure.
