/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourThreeRowPlacementSourceAudit
import CompleteRadiusPlacement

/-!
# Source ingress for complete-radius refinement on the exact-four arm

The exact-four residual supplies two selected rows whose centers lie in the
image of one fixed late critical system.  Non-surjectivity of that system's
blocker map supplies a third carrier center outside the whole image, and
global K4 supplies a selected row there.

This is the universal source packet available before any cross-row occurrence
claim.  In particular, no mutual membership or curvature placement is asserted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourCompleteRadiusSpineBridgeScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourCompleteRadiusPlacementAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourThreeRowOccurrenceScratch
open ATailUniqueFourThreeRowPlacementSourceAuditScratch

/-- Universal source data after the late critical-system choice: two rows at
distinct blocker-image centers and one row at a carrier center omitted from
the entire blocker image. -/
structure CompleteRadiusSpineIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) : Type where
  fixed : FixedImageTwoRowIngress R Q
  completionCenter : CriticalShellSystem.CarrierVertex D.A
  completion_not_blockerImage :
    ∀ source : CriticalShellSystem.CarrierVertex D.A,
      (lateFirstApexSystem R).blockerVertex source ≠ completionCenter
  completion_ne_firstApex : completionCenter.1 ≠ S.oppApex1
  completionRow : SelectedFourClass D.A completionCenter.1

namespace CompleteRadiusSpineIngress

/-- The first fixed center is the blocker image of its retained source. -/
theorem blockerVertex_source₁_eq_center₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    (lateFirstApexSystem R).blockerVertex J.fixed.source₁ =
      J.fixed.center₁ := by
  rfl

/-- The second fixed center is the blocker image of its retained source. -/
theorem blockerVertex_source₂_eq_center₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    (lateFirstApexSystem R).blockerVertex J.fixed.source₂ =
      J.fixed.center₂ := by
  rfl

/-- The omitted-image completion center differs from the first fixed center. -/
theorem completionCenter_ne_center₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    J.completionCenter ≠ J.fixed.center₁ := by
  intro h
  exact J.completion_not_blockerImage J.fixed.source₁
    (J.blockerVertex_source₁_eq_center₁.trans h.symm)

/-- The omitted-image completion center differs from the second fixed center. -/
theorem completionCenter_ne_center₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    J.completionCenter ≠ J.fixed.center₂ := by
  intro h
  exact J.completion_not_blockerImage J.fixed.source₂
    (J.blockerVertex_source₂_eq_center₂.trans h.symm)

/-- The first fixed row is locked to the complete critical shell chosen for
its source.  This records the complete-radius fact on the universal ingress. -/
theorem row₁_support_eq_criticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    J.fixed.row₁.support =
      ((lateFirstApexSystem R).selectedAt J.fixed.source₁.1
        J.fixed.source₁.2).toCriticalFourShell.support := by
  rfl

/-- The second fixed row is locked to the complete critical shell chosen for
its source. -/
theorem row₂_support_eq_criticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q) :
    J.fixed.row₂.support =
      ((lateFirstApexSystem R).selectedAt J.fixed.source₂.1
        J.fixed.source₂.2).toCriticalFourShell.support := by
  rfl

/-- Every selected four-class at the first fixed center has the same support
as the fixed row.  This is the deletion-critical complete-radius lock, not a
property of arbitrary global-K4 centers. -/
theorem anyRowAt_center₁_support_eq_row₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q)
    (K : SelectedFourClass D.A J.fixed.center₁.1) :
    K.support = J.fixed.row₁.support := by
  exact ((lateFirstApexSystem R).selectedFourClass_support_eq_shell
    J.fixed.source₁.1 J.fixed.source₁.2 K).trans
      J.row₁_support_eq_criticalShell.symm

/-- Every selected four-class at the second fixed center has the same support
as the fixed row. -/
theorem anyRowAt_center₂_support_eq_row₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q)
    (K : SelectedFourClass D.A J.fixed.center₂.1) :
    K.support = J.fixed.row₂.support := by
  exact ((lateFirstApexSystem R).selectedFourClass_support_eq_shell
    J.fixed.source₂.1 J.fixed.source₂.2 K).trans
      J.row₂_support_eq_criticalShell.symm

/-- If the completion row and the first fixed row form the two mutual links
of the complete-radius triangle, the second fixed row must contain the
completion center.  This reuses the checked local metric producer; it does
not assert that the five displayed incidences always occur. -/
theorem completionCenter_mem_row₂_of_forwardTriangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {Q : ExactTwoStrictHitDistribution R}
    (J : CompleteRadiusSpineIngress R Q)
    (hcenter₁_completion : J.fixed.center₁.1 ∈ J.completionRow.support)
    (hcenter₂_completion : J.fixed.center₂.1 ∈ J.completionRow.support)
    (hcompletion_center₁ : J.completionCenter.1 ∈ J.fixed.row₁.support)
    (hcenter₂_center₁ : J.fixed.center₂.1 ∈ J.fixed.row₁.support)
    (hcenter₁_center₂ : J.fixed.center₁.1 ∈ J.fixed.row₂.support) :
    J.completionCenter.1 ∈ J.fixed.row₂.support := by
  exact mem_blockerImageSelectedRow_of_twoStep_mutualTriangle
    (lateFirstApexSystem R) J.fixed.source₂.2 J.completionRow J.fixed.row₁
      J.fixed.row₂ J.completionCenter.2 hcenter₁_completion
        hcenter₂_completion hcompletion_center₁ hcenter₂_center₁
          hcenter₁_center₂

end CompleteRadiusSpineIngress

/-- The universal exact-four source extraction.  It gives three pairwise
distinct carrier centers and their rows, but no cross-row membership. -/
theorem exists_completeRadiusSpineIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (CompleteRadiusSpineIngress R Q) := by
  rcases exists_fixedImageTwoRowIngress R Q with ⟨fixed⟩
  rcases exists_omittedCenter_with_completionRow R with
    ⟨completionCenter, hnotImage, hneApex, ⟨completionRow⟩⟩
  exact ⟨{
    fixed := fixed
    completionCenter := completionCenter
    completion_not_blockerImage := hnotImage
    completion_ne_firstApex := hneApex
    completionRow := completionRow }⟩

#print axioms exists_completeRadiusSpineIngress
#print axioms CompleteRadiusSpineIngress.completionCenter_ne_center₁
#print axioms CompleteRadiusSpineIngress.completionCenter_ne_center₂
#print axioms CompleteRadiusSpineIngress.row₁_support_eq_criticalShell
#print axioms CompleteRadiusSpineIngress.row₂_support_eq_criticalShell
#print axioms CompleteRadiusSpineIngress.anyRowAt_center₁_support_eq_row₁
#print axioms CompleteRadiusSpineIngress.anyRowAt_center₂_support_eq_row₂
#print axioms
  CompleteRadiusSpineIngress.completionCenter_mem_row₂_of_forwardTriangle

end ATailUniqueFourCompleteRadiusSpineBridgeScratch
end Problem97
