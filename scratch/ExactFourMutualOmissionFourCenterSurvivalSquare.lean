/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Four-center common-deletion survival square

This file isolates the global coverage still required after the four named
centers are known to survive deletion of the common source.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The three common-deletion packets already cover the physical apex and
the actual blockers of `u`, `v`, and the second deletion.  Consequently,
removability of the first deletion is equivalent to survival at every
remaining center.  This is the exact global coverage absent from the local
four-center survival-square hypotheses. -/
theorem
    exactFourMutualOmission_fourCenterCommonDeletion_deleted_isRemovable_iff_remainingCentersSurvive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    IsRemovableVertex D.A first.deleted.1 ↔
      ∀ center ∈ D.A.erase first.deleted.1,
        center ≠ S.oppApex2 →
        center ≠
          (lateFirstApexSystem R).centerAt u.1 u.2 →
        center ≠
          (lateFirstApexSystem R).centerAt v.1 v.2 →
        center ≠
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2 →
        HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) center := by
  constructor
  · intro hrem center hcenter _ _ _ _
    exact hrem.2 center hcenter
  · intro hremaining
    refine ⟨first.deleted.2, ?_⟩
    intro center hcenter
    by_cases hApex : center = S.oppApex2
    · simpa only [hApex] using first.uPacket.survives₂
    by_cases hU :
        center =
          (lateFirstApexSystem R).centerAt u.1 u.2
    · simpa only [hU] using first.uPacket.survives₁
    by_cases hV :
        center =
          (lateFirstApexSystem R).centerAt v.1 v.2
    · simpa only [hV] using first.vPacket.survives₁
    by_cases hSecond :
        center =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2
    · simpa only [hSecond] using crossPacket.survives₁
    exact hremaining center hcenter hApex hU hV hSecond

/-- Exact conditional closure of the four-center common-deletion residue.
The additional hypothesis is only the complement of the four centers already
covered by `first.uPacket`, `first.vPacket`, and `crossPacket`. -/
theorem
    false_of_exactFourMutualOmission_fourCenterCommonDeletion_of_remainingCentersSurvive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hremaining :
      ∀ center ∈ D.A.erase first.deleted.1,
        center ≠ S.oppApex2 →
        center ≠
          (lateFirstApexSystem R).centerAt u.1 u.2 →
        center ≠
          (lateFirstApexSystem R).centerAt v.1 v.2 →
        center ≠
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2 →
        HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) center) :
    False := by
  apply
    CounterexampleData.not_isRemovableVertex_of_minimal
      R.minimal first.deleted.1
  exact
    (exactFourMutualOmission_fourCenterCommonDeletion_deleted_isRemovable_iff_remainingCentersSurvive
      R rho u v first second crossPacket).2 hremaining

#print axioms
  exactFourMutualOmission_fourCenterCommonDeletion_deleted_isRemovable_iff_remainingCentersSurvive
#print axioms
  false_of_exactFourMutualOmission_fourCenterCommonDeletion_of_remainingCentersSurvive

end ATailFrontierLiveClosure
end Problem97
