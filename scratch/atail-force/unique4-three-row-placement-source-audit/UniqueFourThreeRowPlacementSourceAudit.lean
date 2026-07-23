/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourThreeRowOccurrenceProducer

/-!
# Source audit for the exact-two three-row placement

The exact four-source fiber at the first apex makes the late blocker map
noninjective.  Since it is an endomap of a finite carrier, it is not
surjective.  Hence a completion center outside the whole fixed blocker image
exists, and global K4 supplies a row there.

This is genuine source progress toward the observed three-row schema.  It
does not assert any cyclic gap between the completion row and fixed-image rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourThreeRowPlacementSourceAuditScratch

open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private noncomputable def interiorQVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨R.interior_q, (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1⟩

private noncomputable def interiorWVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨R.interior_w, (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).1⟩

theorem interiorVertices_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    interiorQVertex R ≠ interiorWVertex R := by
  intro h
  exact R.interior_q_ne_w (congrArg Subtype.val h)

theorem lateBlockerVertex_interiorQ_eq_interiorW
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    (lateFirstApexSystem R).blockerVertex (interiorQVertex R) =
      (lateFirstApexSystem R).blockerVertex (interiorWVertex R) := by
  apply Subtype.ext
  exact (lateFirstApexSystem_centerAt_eq R (interiorQVertex R).2
      (Finset.mem_inter.mp R.interior_q_mem).1).trans
    (lateFirstApexSystem_centerAt_eq R (interiorWVertex R).2
      (Finset.mem_inter.mp R.interior_w_mem).1).symm

/-- The exact first-apex fiber forces at least one carrier center outside the
image of the late fixed blocker map. -/
theorem exists_carrier_not_in_lateBlockerImage
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ center : CriticalShellSystem.CarrierVertex D.A,
      ∀ source : CriticalShellSystem.CarrierVertex D.A,
        (lateFirstApexSystem R).blockerVertex source ≠ center := by
  let f := (lateFirstApexSystem R).blockerVertex
  have hnotInjective : ¬ Function.Injective f := by
    intro hinjective
    exact interiorVertices_ne R
      (hinjective (lateBlockerVertex_interiorQ_eq_interiorW R))
  have hnotSurjective : ¬ Function.Surjective f := by
    rw [← Finite.injective_iff_surjective]
    exact hnotInjective
  simp only [Function.Surjective] at hnotSurjective
  push_neg at hnotSurjective
  exact hnotSurjective

/-- A genuinely late global-K4 completion row exists at a carrier center
outside the entire image of the fixed late critical system. -/
theorem exists_omittedCenter_with_completionRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ center : CriticalShellSystem.CarrierVertex D.A,
      (∀ source : CriticalShellSystem.CarrierVertex D.A,
        (lateFirstApexSystem R).blockerVertex source ≠ center) ∧
      center.1 ≠ S.oppApex1 ∧
      Nonempty (SelectedFourClass D.A center.1) := by
  rcases exists_carrier_not_in_lateBlockerImage R with ⟨center, hcenter⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4 center.2 with ⟨row⟩
  have hcenterNe : center.1 ≠ S.oppApex1 := by
    intro hEq
    apply hcenter (interiorQVertex R)
    apply Subtype.ext
    exact (lateFirstApexSystem_centerAt_eq R (interiorQVertex R).2
      (Finset.mem_inter.mp R.interior_q_mem).1).trans hEq.symm
  exact ⟨center, hcenter, hcenterNe, ⟨row⟩⟩

#print axioms interiorVertices_ne
#print axioms lateBlockerVertex_interiorQ_eq_interiorW
#print axioms exists_carrier_not_in_lateBlockerImage
#print axioms exists_omittedCenter_with_completionRow

end ATailUniqueFourThreeRowPlacementSourceAuditScratch
end Problem97
