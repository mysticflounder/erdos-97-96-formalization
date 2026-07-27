import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity

/-!
# Three omitted values and two known collision fibers

Scratch-only finite counting lemma.  This file is not imported by production.
-/

namespace Scratch.ExactFourThreeOmittedCounting

attribute [local instance] Classical.propDecidable

/-- If a finite self-map omits three distinct values and already has two
distinct collision fibers, then either there is a third collision fiber or
one of the two known fibers contains a third source.

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

/-- If the two named pairs exhaust their respective fibers, the same count
forces a third collision fiber.  These global fiber-exhaustion hypotheses are
strictly stronger than merely having two named collision rows. -/
theorem third_fiber_of_three_omissions_of_known_fibers_exact_two
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
    (hvalues : f a₁ ≠ f b₁)
    (hfiberA : ∀ x, f x = f a₁ → x = a₁ ∨ x = a₂)
    (hfiberB : ∀ x, f x = f b₁ → x = b₁ ∨ x = b₂) :
    ∃ x y, x ≠ y ∧ f x = f y ∧
      f x ≠ f a₁ ∧ f x ≠ f b₁ := by
  rcases third_fiber_or_larger_known_fiber_of_three_omissions f
      homitted₁ homitted₂ homitted₃
      homitted₁₂ homitted₁₃ homitted₂₃ hfa hfb hvalues with
    hthird | hlargerA | hlargerB
  · exact hthird
  · rcases hlargerA with ⟨x, hxa₁, hxa₂, hx⟩
    exact False.elim ((hfiberA x hx).elim hxa₁ hxa₂)
  · rcases hlargerB with ⟨x, hxb₁, hxb₂, hx⟩
    exact False.elim ((hfiberB x hx).elim hxb₁ hxb₂)

end Scratch.ExactFourThreeOmittedCounting
