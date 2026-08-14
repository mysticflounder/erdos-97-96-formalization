/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Blocker multiplicity from two robust physical apices

Two deletion-robust carrier centers are both omitted from the retained finite
critical blocker endomap. After choosing one repeated blocker fiber, this
forces either a second repeated blocker value or a third source in the first
fiber. This is the sharp finite-map reduction; producing a contradiction from
the resulting fibers still requires geometric cap/order information.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexBlockerMultiplicity

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- If one collision were the only failure of injectivity, redirecting one of
its sources to the first omitted value would make the finite endomap
injective. Surjectivity of the repaired map would then hit the second omitted
value, a contradiction. -/
theorem second_fiber_or_larger_first_fiber_of_two_omissions
    {α : Type*} [Finite α]
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

/-- If a finite self-map omits three distinct values and already has two
distinct collision fibers, then either it has a third collision fiber or one
of the two known fibers contains a third source.

The fixed-point-free property of the blocker map is not needed for this
counting conclusion. -/
theorem third_fiber_or_larger_known_fiber_of_three_omissions
    {α : Type*} [Finite α]
    (f : α → α)
    {omitted₁ omitted₂ omitted₃ a₁ a₂ b₁ b₂ : α}
    (homitted₁ : ∀ x, f x ≠ omitted₁)
    (homitted₂ : ∀ x, f x ≠ omitted₂)
    (homitted₃ : ∀ x, f x ≠ omitted₃)
    (homitted₁₂ : omitted₁ ≠ omitted₂)
    (homitted₁₃ : omitted₁ ≠ omitted₃)
    (homitted₂₃ : omitted₂ ≠ omitted₃)
    (hfa : f a₁ = f a₂)
    (hfb : f b₁ = f b₂)
    (hvalues : f a₁ ≠ f b₁) :
    (∃ x y, x ≠ y ∧ f x = f y ∧
        f x ≠ f a₁ ∧ f x ≠ f b₁) ∨
      (∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ f x = f a₁) ∨
        ∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁ := by
  classical
  by_cases hthird :
      ∃ x y, x ≠ y ∧ f x = f y ∧
        f x ≠ f a₁ ∧ f x ≠ f b₁
  · exact Or.inl hthird
  · by_cases hlargerA :
        ∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ f x = f a₁
    · exact Or.inr (Or.inl hlargerA)
    · by_cases hlargerB :
          ∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁
      · exact Or.inr (Or.inr hlargerB)
      · exfalso
        have ha₂b₂ : a₂ ≠ b₂ := by
          intro hab
          apply hvalues
          calc
            f a₁ = f a₂ := hfa
            _ = f b₂ := congrArg f hab
            _ = f b₁ := hfb.symm
        have hb₂a₂ : b₂ ≠ a₂ := Ne.symm ha₂b₂
        let repaired : α → α := fun x ↦
          if x = a₂ then omitted₁
          else if x = b₂ then omitted₂
          else f x
        have hrepaired_injective : Function.Injective repaired := by
          intro x y hxy
          by_cases hxa : x = a₂
          · subst x
            by_cases hya : y = a₂
            · exact hya.symm
            · by_cases hyb : y = b₂
              · subst y
                exfalso
                apply homitted₁₂
                simpa [repaired, ha₂b₂, hb₂a₂] using hxy
              · exfalso
                have : omitted₁ = f y := by
                  simpa [repaired, hya, hyb] using hxy
                exact homitted₁ y this.symm
          · by_cases hxb : x = b₂
            · subst x
              by_cases hya : y = a₂
              · subst y
                exfalso
                apply homitted₁₂
                simpa [repaired, ha₂b₂, hb₂a₂] using hxy.symm
              · by_cases hyb : y = b₂
                · exact hyb.symm
                · exfalso
                  have : omitted₂ = f y := by
                    simpa [repaired, ha₂b₂, hb₂a₂, hya, hyb] using hxy
                  exact homitted₂ y this.symm
            · by_cases hya : y = a₂
              · subst y
                exfalso
                have : f x = omitted₁ := by
                  simpa [repaired, hxa, hxb] using hxy
                exact homitted₁ x this
              · by_cases hyb : y = b₂
                · subst y
                  exfalso
                  have : f x = omitted₂ := by
                    simpa [repaired, ha₂b₂, hb₂a₂, hxa, hxb] using hxy
                  exact homitted₂ x this
                · have hfxy : f x = f y := by
                    simpa [repaired, hxa, hxb, hya, hyb] using hxy
                  by_cases hxyne : x = y
                  · exact hxyne
                  · by_cases hxA : f x = f a₁
                    · have hxEq : x = a₁ := by
                        by_cases h : x = a₁
                        · exact h
                        · by_cases h' : x = a₂
                          · exact False.elim (hxa h')
                          · exact False.elim
                              (hlargerA ⟨x, h, h', hxA⟩)
                      have hyA : f y = f a₁ := hfxy.symm.trans hxA
                      have hyEq : y = a₁ := by
                        by_cases h : y = a₁
                        · exact h
                        · by_cases h' : y = a₂
                          · exact False.elim (hya h')
                          · exact False.elim
                              (hlargerA ⟨y, h, h', hyA⟩)
                      exact hxEq.trans hyEq.symm
                    · by_cases hxB : f x = f b₁
                      · have hxEq : x = b₁ := by
                          by_cases h : x = b₁
                          · exact h
                          · by_cases h' : x = b₂
                            · exact False.elim (hxb h')
                            · exact False.elim
                                (hlargerB ⟨x, h, h', hxB⟩)
                        have hyB : f y = f b₁ := hfxy.symm.trans hxB
                        have hyEq : y = b₁ := by
                          by_cases h : y = b₁
                          · exact h
                          · by_cases h' : y = b₂
                            · exact False.elim (hyb h')
                            · exact False.elim
                                (hlargerB ⟨y, h, h', hyB⟩)
                        exact hxEq.trans hyEq.symm
                      · exact False.elim
                          (hthird ⟨x, y, hxyne, hfxy, hxA, hxB⟩)
        have hrepaired_surjective : Function.Surjective repaired :=
          Finite.injective_iff_surjective.mp hrepaired_injective
        rcases hrepaired_surjective omitted₃ with ⟨x, hx⟩
        by_cases hxa : x = a₂
        · subst x
          apply homitted₁₃
          simpa [repaired] using hx
        · by_cases hxb : x = b₂
          · subst x
            apply homitted₂₃
            simpa [repaired, ha₂b₂, hb₂a₂] using hx
          · have : f x = omitted₃ := by
              simpa [repaired, hxa, hxb] using hx
            exact homitted₃ x this

/-- If a finite self-map omits four distinct values and already has three
distinct collision fibers, then either it has a fourth collision fiber or one
of the three known fibers contains a third source.

The proof redirects one source of the third known fiber to the first omitted
value, then applies `third_fiber_or_larger_known_fiber_of_three_omissions` to
the repaired map and the remaining three omitted values. -/
theorem fourth_fiber_or_larger_known_fiber_of_four_omissions
    {α : Type*} [Finite α]
    (f : α → α)
    {omitted₁ omitted₂ omitted₃ omitted₄ a₁ a₂ b₁ b₂ c₁ c₂ : α}
    (homitted₁ : ∀ x, f x ≠ omitted₁)
    (homitted₂ : ∀ x, f x ≠ omitted₂)
    (homitted₃ : ∀ x, f x ≠ omitted₃)
    (homitted₄ : ∀ x, f x ≠ omitted₄)
    (homitted₁₂ : omitted₁ ≠ omitted₂)
    (homitted₁₃ : omitted₁ ≠ omitted₃)
    (homitted₁₄ : omitted₁ ≠ omitted₄)
    (homitted₂₃ : omitted₂ ≠ omitted₃)
    (homitted₂₄ : omitted₂ ≠ omitted₄)
    (homitted₃₄ : omitted₃ ≠ omitted₄)
    (hfa : f a₁ = f a₂)
    (hfb : f b₁ = f b₂)
    (hfc : f c₁ = f c₂)
    (hvaluesAB : f a₁ ≠ f b₁)
    (hvaluesAC : f a₁ ≠ f c₁)
    (hvaluesBC : f b₁ ≠ f c₁) :
    (∃ x y, x ≠ y ∧ f x = f y ∧
        f x ≠ f a₁ ∧ f x ≠ f b₁ ∧ f x ≠ f c₁) ∨
      (∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ f x = f a₁) ∨
        (∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁) ∨
          ∃ x, x ≠ c₁ ∧ x ≠ c₂ ∧ f x = f c₁ := by
  classical
  have hc₂a₁ : c₂ ≠ a₁ := by
    intro h
    apply hvaluesAC
    calc
      f a₁ = f c₂ := congrArg f h.symm
      _ = f c₁ := hfc.symm
  have hc₂a₂ : c₂ ≠ a₂ := by
    intro h
    apply hvaluesAC
    calc
      f a₁ = f a₂ := hfa
      _ = f c₂ := congrArg f h.symm
      _ = f c₁ := hfc.symm
  have hc₂b₁ : c₂ ≠ b₁ := by
    intro h
    apply hvaluesBC
    calc
      f b₁ = f c₂ := congrArg f h.symm
      _ = f c₁ := hfc.symm
  have hc₂b₂ : c₂ ≠ b₂ := by
    intro h
    apply hvaluesBC
    calc
      f b₁ = f b₂ := hfb
      _ = f c₂ := congrArg f h.symm
      _ = f c₁ := hfc.symm
  have ha₁c₂ : a₁ ≠ c₂ := Ne.symm hc₂a₁
  have ha₂c₂ : a₂ ≠ c₂ := Ne.symm hc₂a₂
  have hb₁c₂ : b₁ ≠ c₂ := Ne.symm hc₂b₁
  have hb₂c₂ : b₂ ≠ c₂ := Ne.symm hc₂b₂
  let repaired : α → α := fun x ↦ if x = c₂ then omitted₁ else f x
  have hrepaired_omitted₂ : ∀ x, repaired x ≠ omitted₂ := by
    intro x
    by_cases hx : x = c₂
    · simpa [repaired, hx] using homitted₁₂
    · simpa [repaired, hx] using homitted₂ x
  have hrepaired_omitted₃ : ∀ x, repaired x ≠ omitted₃ := by
    intro x
    by_cases hx : x = c₂
    · simpa [repaired, hx] using homitted₁₃
    · simpa [repaired, hx] using homitted₃ x
  have hrepaired_omitted₄ : ∀ x, repaired x ≠ omitted₄ := by
    intro x
    by_cases hx : x = c₂
    · simpa [repaired, hx] using homitted₁₄
    · simpa [repaired, hx] using homitted₄ x
  have hra : repaired a₁ = repaired a₂ := by
    simp [repaired, ha₁c₂, ha₂c₂, hfa]
  have hrb : repaired b₁ = repaired b₂ := by
    simp [repaired, hb₁c₂, hb₂c₂, hfb]
  have hrvalues : repaired a₁ ≠ repaired b₁ := by
    simpa [repaired, ha₁c₂, hb₁c₂] using hvaluesAB
  rcases third_fiber_or_larger_known_fiber_of_three_omissions repaired
      hrepaired_omitted₂ hrepaired_omitted₃ hrepaired_omitted₄
      homitted₂₃ homitted₂₄ homitted₃₄ hra hrb hrvalues with
    hnew | hlargerA | hlargerB
  · rcases hnew with ⟨x, y, hxy, hrxy, hxA, hxB⟩
    have hxc₂ : x ≠ c₂ := by
      intro hx
      subst x
      by_cases hy : y = c₂
      · exact hxy hy.symm
      · have : omitted₁ = f y := by simpa [repaired, hy] using hrxy
        exact homitted₁ y this.symm
    have hyc₂ : y ≠ c₂ := by
      intro hy
      subst y
      have : f x = omitted₁ := by simpa [repaired, hxc₂] using hrxy
      exact homitted₁ x this
    have hfxy : f x = f y := by
      simpa [repaired, hxc₂, hyc₂] using hrxy
    have hxfA : f x ≠ f a₁ := by
      simpa [repaired, hxc₂, ha₁c₂] using hxA
    have hxfB : f x ≠ f b₁ := by
      simpa [repaired, hxc₂, hb₁c₂] using hxB
    by_cases hxfC : f x = f c₁
    · right; right; right
      by_cases hxc₁ : x = c₁
      · exact ⟨y, by intro hy; exact hxy (hxc₁.trans hy.symm), hyc₂,
          hfxy.symm.trans hxfC⟩
      · exact ⟨x, hxc₁, hxc₂, hxfC⟩
    · exact Or.inl ⟨x, y, hxy, hfxy, hxfA, hxfB, hxfC⟩
  · right; left
    rcases hlargerA with ⟨x, hxa₁, hxa₂, hrx⟩
    have hxc₂ : x ≠ c₂ := by
      intro hx
      subst x
      have : omitted₁ = f a₁ := by
        simpa [repaired, ha₁c₂] using hrx
      exact homitted₁ a₁ this.symm
    exact ⟨x, hxa₁, hxa₂, by
      simpa [repaired, hxc₂, ha₁c₂] using hrx⟩
  · right; right; left
    rcases hlargerB with ⟨x, hxb₁, hxb₂, hrx⟩
    have hxc₂ : x ≠ c₂ := by
      intro hx
      subst x
      have : omitted₁ = f b₁ := by
        simpa [repaired, hb₁c₂] using hrx
      exact homitted₁ b₁ this.symm
    exact ⟨x, hxb₁, hxb₂, by
      simpa [repaired, hxc₂, hb₁c₂] using hrx⟩

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

end ATailBiApexBlockerMultiplicity
end Problem97
