/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import IndexedSourceValuation

/-!
# Transport-generic family satisfaction

Satisfaction proofs for the retained families whose clause semantics do
not depend on the index transport beyond injectivity and fixing the first
apex: `radius_partition_transitivity`, `row_at_least_4`,
`selected_row_subset_radius_class`,
`mutual_triangle_cross_center_radius_transport` (any injective transport),
and `first_apex_not_in_own_class`, `first_apex_row_eq_class` (any
transport fixing index `0`).  Both the direct and the mirror branch
instantiate these.

The order-dependent and cap-position-dependent families are proved per
branch elsewhere.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The exact-two core forces carrier cardinality eleven. -/
theorem carrier_card_eq_eleven (Q : ExactTwoBoundaryCore R distribution) :
    D.A.card = 11 := by
  rw [← Q.boundary_image,
    Finset.card_image_of_injective _ Q.boundary_injective]
  simp

/-- Selected-class support transport along an equality of centers. -/
theorem classAt_support_congr {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) {c d : ℝ²}
    (hc : c ∈ A) (hd : d ∈ A) (h : c = d) :
    (F.classAt c hc).support = (F.classAt d hd).support := by
  subst h
  rfl

/-- Two members of one selected four-class are equidistant from its
center. -/
private theorem support_dist_eq
    {A : Finset ℝ²} {center x y : ℝ²}
    (Row : SelectedFourClass A center)
    (hx : x ∈ Row.support) (hy : y ∈ Row.support) :
    dist center x = dist center y :=
  (Row.support_eq_radius _ hx).trans (Row.support_eq_radius _ hy).symm

/-- Family `radius_partition_transitivity` holds for every transport. -/
theorem radiusPartitionTransitivitySat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) :
    RadiusPartitionTransitivitySat Q σ := by
  intro c x y z h1 h2
  unfold radiusEq at h1 h2 ⊢
  exact h1.trans h2

/-- Family `selected_row_subset_radius_class` holds for every
transport. -/
theorem selectedRowSubsetRadiusClassSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) :
    SelectedRowSubsetRadiusClassSat Q σ := by
  intro c l r hl hr
  unfold rowMem at hl hr
  unfold radiusEq
  exact support_dist_eq _ hl hr

/-- Family `mutual_triangle_cross_center_radius_transport` holds for
every transport. -/
theorem mutualTriangleCrossCenterRadiusTransportSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) :
    MutualTriangleCrossCenterRadiusTransportSat Q σ := by
  intro a mid bc h_am h_abc h_ma h_mbc
  unfold rowMem at h_am h_abc h_ma h_mbc
  unfold radiusEq
  have h1 :
      dist (Q.boundary (σ a)) (Q.boundary (σ mid)) =
        dist (Q.boundary (σ a)) (Q.boundary (σ bc)) :=
    support_dist_eq _ h_am h_abc
  have h2 :
      dist (Q.boundary (σ mid)) (Q.boundary (σ a)) =
        dist (Q.boundary (σ mid)) (Q.boundary (σ bc)) :=
    support_dist_eq _ h_ma h_mbc
  rw [dist_comm (Q.boundary (σ bc)) (Q.boundary (σ a)),
    dist_comm (Q.boundary (σ bc)) (Q.boundary (σ mid)), ← h1,
    dist_comm (Q.boundary (σ a)) (Q.boundary (σ mid))]
  exact h2

/-- The boundary positions carrying the selected row of a fixed center. -/
private def rowHitIndices (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c : Label) : Finset Label :=
  Finset.univ.filter fun p => rowMem Q σ c p

private theorem rowHitIndices_image
    (Q : ExactTwoBoundaryCore R distribution) {σ : Label → Label}
    (hσ : Function.Injective σ) (c : Label) :
    (rowHitIndices Q σ c).image (fun p => Q.boundary (σ p)) =
      (Q.carrierPattern.classAt (Q.boundary (σ c))
        (boundary_mem_carrier Q (σ c))).support := by
  classical
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨p, hp, rfl⟩
    exact (Finset.mem_filter.mp hp).2
  · intro hx
    have hxA : x ∈ D.A :=
      (Q.carrierPattern.classAt _ _).support_subset_A hx
    rw [← Q.boundary_image] at hxA
    rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
    have hsurj : Function.Surjective σ :=
      Finite.surjective_of_injective hσ
    rcases hsurj i with ⟨p, rfl⟩
    exact Finset.mem_image.mpr
      ⟨p, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx⟩, rfl⟩

private theorem rowHitIndices_card
    (Q : ExactTwoBoundaryCore R distribution) {σ : Label → Label}
    (hσ : Function.Injective σ) (c : Label) :
    (rowHitIndices Q σ c).card = 4 := by
  have himage := rowHitIndices_image Q hσ c
  have hinj : Function.Injective fun p => Q.boundary (σ p) :=
    fun _ _ h => hσ (Q.boundary_injective h)
  rw [← Finset.card_image_of_injective (rowHitIndices Q σ c) hinj,
    himage]
  exact (Q.carrierPattern.classAt _ _).support_card

/-- Family `row_at_least_4` holds for every injective transport. -/
theorem rowAtLeastFourSat (Q : ExactTwoBoundaryCore R distribution)
    {σ : Label → Label} (hσ : Function.Injective σ) :
    RowAtLeastFourSat Q σ := by
  classical
  intro c T hcT hTcard
  by_contra hnone
  push_neg at hnone
  have hsubset : rowHitIndices Q σ c ⊆ (insert c T)ᶜ := by
    intro p hp
    have hrow : rowMem Q σ c p := (Finset.mem_filter.mp hp).2
    rw [Finset.mem_compl, Finset.mem_insert]
    rintro (rfl | hpT)
    · exact (Q.carrierPattern.classAt _ _).center_not_mem hrow
    · exact hnone p hpT hrow
  have hcard := Finset.card_le_card hsubset
  rw [rowHitIndices_card Q hσ c, Finset.card_compl,
    Finset.card_insert_of_not_mem hcT, hTcard] at hcard
  simp at hcard

/-- Family `first_apex_not_in_own_class` holds for every transport fixing
index `0`. -/
theorem firstApexNotInOwnClassSat
    (Q : ExactTwoBoundaryCore R distribution)
    {σ : Label → Label} (hσ0 : σ 0 = 0) :
    FirstApexNotInOwnClassSat Q σ := by
  intro hhit
  rw [classHit_iff_dist, hσ0, Q.boundary_zero, dist_self] at hhit
  exact absurd hhit.symm (ne_of_gt (frontier_radius_pos F))

/-- The selected row at the transported first apex is the distinguished
selected class. -/
theorem classAt_transported_zero_support
    (Q : ExactTwoBoundaryCore R distribution)
    {σ : Label → Label} (hσ0 : σ 0 = 0) :
    (Q.carrierPattern.classAt (Q.boundary (σ 0))
        (boundary_mem_carrier Q (σ 0))).support =
      SelectedClass D.A S.oppApex1 radius := by
  rw [classAt_support_congr Q.carrierPattern
    (boundary_mem_carrier Q (σ 0)) Q.firstApex_mem
    (by rw [hσ0, Q.boundary_zero])]
  exact Q.firstApex_row_eq

/-- Family `first_apex_row_eq_class` holds for every transport fixing
index `0`. -/
theorem firstApexRowEqClassSat
    (Q : ExactTwoBoundaryCore R distribution)
    {σ : Label → Label} (hσ0 : σ 0 = 0) :
    FirstApexRowEqClassSat Q σ := by
  intro p _hp
  unfold rowMem classHit
  rw [classAt_transported_zero_support Q hσ0]

end P5IndexedSourceScratch
end Problem97

#print axioms Problem97.P5IndexedSourceScratch.radiusPartitionTransitivitySat
#print axioms Problem97.P5IndexedSourceScratch.rowAtLeastFourSat
#print axioms Problem97.P5IndexedSourceScratch.firstApexRowEqClassSat
