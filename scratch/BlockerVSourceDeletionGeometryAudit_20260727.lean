/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Blocker-v source-deletion geometry audit

This scratch file isolates what the exact-five physical-apex class supplies
after deleting the source, and the additional centered-at-`v` statement that
would be needed to contradict criticality at the source row.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- The rigid exact-five class survives deletion of the source at its actual
physical-apex center. -/
theorem exactFive_physicalApex_survives_sourceDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    HasNEquidistantPointsAt 4 (D.A.erase P.source.1) S.oppApex2 := by
  refine ⟨P.rho, P.hrho, ?_⟩
  have hcard :
      4 ≤
        (SelectedClass (D.A.erase P.source.1) S.oppApex2 P.rho).card :=
    selectedClass_erase_card_ge_of_succ_le
      (n := 4) (A := D.A) (x := P.source.1)
      (s := S.oppApex2) (d := P.rho) (by rw [P.hclassFive])
  simpa [SelectedClass] using hcard

/-- A point in the positive-radius physical-apex class is not the apex. -/
theorem rigid221_v_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.v.1 ≠ S.oppApex2 := by
  intro hv
  have hdist := (mem_selectedClass.mp P.hvClass).2
  rw [hv, dist_self] at hdist
  exact (ne_of_gt P.hrho) hdist.symm

/-- The requested centered-at-`v` survival is exactly the missing
positive-radius selected-class witness after deleting the source. -/
theorem blockerV_sourceDeletion_survives_of_secondRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond :
      ∃ tau : ℝ, 0 < tau ∧
        4 ≤ (SelectedClass (D.A.erase P.source.1) P.v.1 tau).card) :
    HasNEquidistantPointsAt 4 (D.A.erase P.source.1) P.v.1 := by
  rcases hsecond with ⟨tau, htau, hcard⟩
  exact ⟨tau, htau, by simpa [SelectedClass] using hcard⟩

/-- Under the blocker identity, any centered-at-`v` survival witness directly
contradicts the defining criticality of the source row. -/
theorem blockerV_sourceDeletion_survival_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.source.1) P.v.1) :
    False := by
  apply
    (lateFirstApexSystem R).no_qfree_at
      P.source.1 P.source.2
  simpa [hblocker] using hsurvives

/-- Consequently, the exact missing second-radius statement is itself
incompatible with the existing source-row criticality. -/
theorem blockerV_no_sourceDeletion_secondRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    ¬ ∃ tau : ℝ, 0 < tau ∧
        4 ≤ (SelectedClass (D.A.erase P.source.1) P.v.1 tau).card := by
  intro hsecond
  exact blockerV_sourceDeletion_survival_false P hblocker
    (blockerV_sourceDeletion_survives_of_secondRadius P hsecond)

end ATailFrontierLiveClosure
end Problem97
