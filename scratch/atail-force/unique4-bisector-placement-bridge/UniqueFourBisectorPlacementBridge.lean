/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourThreeRowPlacementSourceAudit

/-!
# Exact-two strict-pair bisector localization

The exact-two distribution identifies the strict part of the first-apex
four-class with the retained pair.  Consequently, any selected row containing
both retained points has an equidistant center; if that carrier center is not
the first apex, the source residual localizes it to the strict first cap.

No cyclic placement or terminal occurrence is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourBisectorPlacementBridgeScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourThreeRowOccurrenceScratch

attribute [local instance] Classical.propDecidable

/-- In the exact-two arm, the two retained interior points are exactly the
strict-cap portion of the complete first-apex class. -/
theorem firstClass_inter_strict_eq_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 =
      {R.interior_q, R.interior_w} := by
  have hsubset :
      {R.interior_q, R.interior_w} ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
    exact ⟨R.interior_q_mem, R.interior_w_mem⟩
  have hpairCard : ({R.interior_q, R.interior_w} : Finset ℝ²).card = 2 := by
    simp [R.interior_q_ne_w]
  symm
  apply Finset.eq_of_subset_of_card_le hsubset
  rw [Q.strict_hit_eq_two, hpairCard]

/-- A selected four-row through both retained strict points has its carrier
center in the strict first cap, unless that center is the first apex itself. -/
theorem selectedFourClass_center_mem_strict_of_contains_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex1)
    (row : SelectedFourClass D.A center)
    (hq : R.interior_q ∈ row.support)
    (hw : R.interior_w ∈ row.support) :
    center ∈ S.capInteriorByIndex S.oppIndex1 := by
  apply R.bisector_center_mem_interior center hcenterA hcenterNe
  calc
    dist center R.interior_q = row.radius := row.support_eq_radius _ hq
    _ = dist center R.interior_w := (row.support_eq_radius _ hw).symm

/-- Selected-row form specialized to the first fixed-image row. -/
theorem FixedImageTwoRowIngress.center₁_mem_strict_of_contains_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q)
    (hq : R.interior_q ∈ P.row₁.support)
    (hw : R.interior_w ∈ P.row₁.support) :
    P.center₁.1 ∈ S.capInteriorByIndex S.oppIndex1 := by
  exact selectedFourClass_center_mem_strict_of_contains_interiorPair R
    P.center₁_mem_A P.center₁_ne_firstApex P.row₁ hq hw

/-- Selected-row form specialized to the second fixed-image row. -/
theorem FixedImageTwoRowIngress.center₂_mem_strict_of_contains_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (P : FixedImageTwoRowIngress R Q)
    (hq : R.interior_q ∈ P.row₂.support)
    (hw : R.interior_w ∈ P.row₂.support) :
    P.center₂.1 ∈ S.capInteriorByIndex S.oppIndex1 := by
  exact selectedFourClass_center_mem_strict_of_contains_interiorPair R
    P.center₂_mem_A P.center₂_ne_firstApex P.row₂ hq hw

/-- The same localization applies to the genuinely late completion row. -/
theorem completionCenter_mem_strict_of_contains_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (center : CriticalShellSystem.CarrierVertex D.A)
    (hcenterNe : center.1 ≠ S.oppApex1)
    (row : SelectedFourClass D.A center.1)
    (hq : R.interior_q ∈ row.support)
    (hw : R.interior_w ∈ row.support) :
    center.1 ∈ S.capInteriorByIndex S.oppIndex1 := by
  exact selectedFourClass_center_mem_strict_of_contains_interiorPair R
    center.2 hcenterNe row hq hw

#print axioms firstClass_inter_strict_eq_interiorPair
#print axioms selectedFourClass_center_mem_strict_of_contains_interiorPair
#print axioms FixedImageTwoRowIngress.center₁_mem_strict_of_contains_interiorPair
#print axioms FixedImageTwoRowIngress.center₂_mem_strict_of_contains_interiorPair
#print axioms completionCenter_mem_strict_of_contains_interiorPair

end ATailUniqueFourBisectorPlacementBridgeScratch
end Problem97
