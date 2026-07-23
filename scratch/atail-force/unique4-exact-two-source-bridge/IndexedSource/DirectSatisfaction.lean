/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CyclicAlternationCore
import DirectKalmanson
import DirectCapFamilies

/-!
# Direct-branch dense-formula satisfaction

Assembles the eighteen per-family satisfaction proofs into the single
`DenseFamilySatisfaction` record for a direct `(5,5,4)` exact-two
boundary packet under the identity index transport.
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
by the direct exact-two packet's own geometry under the identity index
transport. -/
theorem directSatisfaction
    (P : P5DirectBoundaryPacket R profile distribution) :
    DirectSatisfaction P.core where
  radius_partition_transitivity :=
    radiusPartitionTransitivitySat P.core directIndex
  row_at_least_4 :=
    rowAtLeastFourSat P.core (σ := directIndex) Function.injective_id
  selected_row_subset_radius_class :=
    selectedRowSubsetRadiusClassSat P.core directIndex
  mutual_triangle_cross_center_radius_transport :=
    mutualTriangleCrossCenterRadiusTransportSat P.core directIndex
  full_class_cyclic_alternation :=
    fullClassCyclicAlternationSat_direct P.core
  first_apex_not_in_own_class :=
    firstApexNotInOwnClassSat P.core (σ := directIndex) rfl
  first_apex_row_eq_class :=
    firstApexRowEqClassSat P.core (σ := directIndex) rfl
  exact_two_strict_hits_at_least_2 :=
    exactTwoStrictHitsAtLeastTwoSat_direct P
  exact_two_left_adjacent_hit_at_least_1 :=
    exactTwoLeftAdjacentHitAtLeastOneSat_direct P
  exact_two_right_adjacent_hit_at_least_1 :=
    exactTwoRightAdjacentHitAtLeastOneSat_direct P
  selected_row_endpoint_own_cap_at_most_one := fun k =>
    selectedRowEndpointOwnCapAtMostOneSat_direct P k
  selected_row_own_cap_at_most_two := fun k =>
    selectedRowOwnCapAtMostTwoSat_direct P k
  seeded_full_linear_kalmanson_cut :=
    seededFullLinearKalmansonCutSat_direct P.core
  verified_kalmanson_order_schema_cut :=
    verifiedKalmansonOrderSchemaCutSat_direct P.core

end P5IndexedSourceScratch
end Problem97

#print axioms Problem97.P5IndexedSourceScratch.directSatisfaction
