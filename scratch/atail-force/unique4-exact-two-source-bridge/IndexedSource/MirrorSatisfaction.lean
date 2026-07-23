/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectSatisfaction
import MirrorKalmanson
import MirrorCapFamilies

/-!
# Mirror-branch dense-formula satisfaction and branch aggregate

Assembles the eighteen per-family satisfaction proofs into the single
`DenseFamilySatisfaction` record for a mirror `(5,5,4)` exact-two
boundary packet under the reflection transport `ρ(i) = -i`, and combines
both branches through the packet-existence disjunction: every `(5,5,4)`
exact-two residual carries a boundary packet whose own geometry
satisfies every retained family of the selected p5 dense formula, in the
orientation the packet realizes.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Every retained family of the selected p5 dense formula is satisfied
by the mirror exact-two packet's own geometry under the reflection index
transport `ρ(i) = -i`. -/
theorem mirrorSatisfaction
    (P : P5MirrorBoundaryPacket R profile distribution) :
    MirrorSatisfaction P.core where
  radius_partition_transitivity :=
    radiusPartitionTransitivitySat P.core mirrorIndex
  row_at_least_4 :=
    rowAtLeastFourSat P.core (σ := mirrorIndex) mirrorIndex_injective
  selected_row_subset_radius_class :=
    selectedRowSubsetRadiusClassSat P.core mirrorIndex
  mutual_triangle_cross_center_radius_transport :=
    mutualTriangleCrossCenterRadiusTransportSat P.core mirrorIndex
  full_class_cyclic_alternation :=
    fullClassCyclicAlternationSat_mirror P.core
  first_apex_not_in_own_class :=
    firstApexNotInOwnClassSat P.core (σ := mirrorIndex) mirrorIndex_zero
  first_apex_row_eq_class :=
    firstApexRowEqClassSat P.core (σ := mirrorIndex) mirrorIndex_zero
  exact_two_strict_hits_at_least_2 :=
    exactTwoStrictHitsAtLeastTwoSat_mirror P
  exact_two_left_adjacent_hit_at_least_1 :=
    exactTwoLeftAdjacentHitAtLeastOneSat_mirror P
  exact_two_right_adjacent_hit_at_least_1 :=
    exactTwoRightAdjacentHitAtLeastOneSat_mirror P
  selected_row_endpoint_own_cap_at_most_one := fun k =>
    selectedRowEndpointOwnCapAtMostOneSat_mirror P k
  selected_row_own_cap_at_most_two := fun k =>
    selectedRowOwnCapAtMostTwoSat_mirror P k
  seeded_full_linear_kalmanson_cut :=
    seededFullLinearKalmansonCutSat_mirror P.core
  verified_kalmanson_order_schema_cut :=
    verifiedKalmansonOrderSchemaCutSat_mirror P.core

/-- Every `(5,5,4)` exact-two residual reaches a boundary packet whose
own geometry satisfies every retained family of the selected p5 dense
formula: the direct packet under the identity transport, or the mirror
packet under the reflection `ρ(i) = -i`.  No solver-selected row
assignment appears in either branch. -/
theorem exists_satisfying_p5_packet
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) :
    (∃ P : P5DirectBoundaryPacket R profile distribution,
      DirectSatisfaction P.core) ∨
    (∃ P : P5MirrorBoundaryPacket R profile distribution,
      MirrorSatisfaction P.core) := by
  rcases nonempty_p5DirectBoundaryPacket_or_mirror R profile
    distribution with ⟨P⟩ | ⟨P⟩
  · exact Or.inl ⟨P, directSatisfaction P⟩
  · exact Or.inr ⟨P, mirrorSatisfaction P⟩

end P5IndexedSourceScratch
end Problem97

#print axioms Problem97.P5IndexedSourceScratch.mirrorSatisfaction
#print axioms
  Problem97.P5IndexedSourceScratch.exists_satisfying_p5_packet
