/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Blocker multiplicity from two robust physical apices

Two deletion-robust carrier centers are both omitted from the retained finite
critical blocker endomap.  After choosing one repeated blocker fiber, this
forces either a second repeated blocker value or a third source in the first
fiber.  This is a finite-map reduction only; it does not supply the ordered
cross-support incidence required by an existing geometric terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexStrategyAudit

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- If one collision were the only failure of injectivity, redirecting one
of its sources to the first omitted value would make the finite endomap
injective.  Surjectivity of the repaired map would then hit the second
omitted value, a contradiction. -/
theorem second_fiber_or_larger_first_fiber_of_two_omissions
    {α : Type*} [Finite α] [DecidableEq α]
    (f : α → α) {omitted₁ omitted₂ source₁ source₂ : α}
    (homitted₁ : ∀ source, f source ≠ omitted₁)
    (homitted₂ : ∀ source, f source ≠ omitted₂)
    (homitted_ne : omitted₂ ≠ omitted₁) :
    (∃ a b, a ≠ b ∧ f a = f b ∧ f a ≠ f source₁) ∨
      ∃ source, source ≠ source₁ ∧ source ≠ source₂ ∧
        f source = f source₁ := by
  by_cases hsecond :
      ∃ a b, a ≠ b ∧ f a = f b ∧ f a ≠ f source₁
  · exact Or.inl hsecond
  · by_cases hlarger :
        ∃ source, source ≠ source₁ ∧ source ≠ source₂ ∧
          f source = f source₁
    · exact Or.inr hlarger
    · exfalso
      let repaired : α → α := fun source ↦
        if source = source₂ then omitted₁ else f source
      have hrepaired_injective : Function.Injective repaired := by
        intro a b hab
        by_cases ha : a = source₂
        · subst a
          by_cases hb : b = source₂
          · exact hb.symm
          · have homit_eq : omitted₁ = f b := by
              simpa [repaired, hb] using hab
            exact False.elim (homitted₁ b homit_eq.symm)
        · by_cases hb : b = source₂
          · subst b
            have homit_eq : f a = omitted₁ := by
              simpa [repaired, ha] using hab
            exact False.elim (homitted₁ a homit_eq)
          · have hf : f a = f b := by
              simpa [repaired, ha, hb] using hab
            by_cases heq : a = b
            · exact heq
            · have hcenter : f a = f source₁ := by
                by_contra hne
                exact hsecond ⟨a, b, heq, hf, hne⟩
              have ha_pair : a = source₁ ∨ a = source₂ := by
                by_cases ha₁ : a = source₁
                · exact Or.inl ha₁
                · by_cases ha₂ : a = source₂
                  · exact Or.inr ha₂
                  · exact False.elim (hlarger ⟨a, ha₁, ha₂, hcenter⟩)
              have hbcenter : f b = f source₁ := hf.symm.trans hcenter
              have hb_pair : b = source₁ ∨ b = source₂ := by
                by_cases hb₁ : b = source₁
                · exact Or.inl hb₁
                · by_cases hb₂ : b = source₂
                  · exact Or.inr hb₂
                  · exact False.elim (hlarger ⟨b, hb₁, hb₂, hbcenter⟩)
              rcases ha_pair with ha₁ | ha₂
              · rcases hb_pair with hb₁ | hb₂
                · exact ha₁.trans hb₁.symm
                · exact False.elim (hb hb₂)
              · exact False.elim (ha ha₂)
      have hrepaired_surjective : Function.Surjective repaired :=
        Finite.injective_iff_surjective.mp hrepaired_injective
      rcases hrepaired_surjective omitted₂ with ⟨source, hsource⟩
      by_cases hs : source = source₂
      · subst source
        have : omitted₁ = omitted₂ := by
          simpa [repaired] using hsource
        exact homitted_ne this.symm
      · have : f source = omitted₂ := by
          simpa [repaired, hs] using hsource
        exact homitted₂ source this

/-- On the live bi-apex robust endpoint, the retained critical map has either
two distinct nontrivial blocker fibers or one fiber containing at least three
distinct sources. -/
theorem FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (R : FrontierBiApexRobustResidual parent) :
    ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      source₁ ≠ source₂ ∧
      H.blockerVertex source₁ = H.blockerVertex source₂ ∧
      ((∃ a b : CriticalShellSystem.CarrierVertex D.A,
          a ≠ b ∧
          H.blockerVertex a = H.blockerVertex b ∧
          H.blockerVertex a ≠ H.blockerVertex source₁) ∨
        ∃ source : CriticalShellSystem.CarrierVertex D.A,
          source ≠ source₁ ∧ source ≠ source₂ ∧
          H.blockerVertex source = H.blockerVertex source₁) := by
  let firstApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, parent.common.packet.center₁_mem_A⟩
  let secondApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, parent.common.packet.center₂_mem_A⟩
  rcases R.firstApex_robust.exists_distinct_sources_same_blocker
      H parent.common.packet.center₁_mem_A with
    ⟨source₁, source₂, hsources, hblockers⟩
  refine ⟨source₁, source₂, hsources, hblockers, ?_⟩
  have hfirst_omitted : ∀ source, H.blockerVertex source ≠ firstApex := by
    intro source
    exact R.firstApex_robust.blockerVertex_ne H source
      parent.common.packet.center₁_mem_A
  have hsecond_omitted : ∀ source, H.blockerVertex source ≠ secondApex := by
    intro source
    exact R.secondApex_robust.blockerVertex_ne H source
      parent.common.packet.center₂_mem_A
  have hapices_ne : secondApex ≠ firstApex := by
    intro h
    have hvalue : S.oppApex2 = S.oppApex1 := congrArg Subtype.val h
    exact parent.common.packet.centers_ne hvalue.symm
  exact second_fiber_or_larger_first_fiber_of_two_omissions
    H.blockerVertex hfirst_omitted hsecond_omitted hapices_ne

#print axioms second_fiber_or_larger_first_fiber_of_two_omissions
#print axioms FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber

end ATailBiApexStrategyAudit
end Problem97
