import Mathlib

namespace Problem97

/-!
  Generic source-clean bridge for the finite set-system route.
  This is intentionally scratch-only: it proves the cardinality consequence
  of a three-set cover with at most one point contributed by each set, but it
  does not assert that the live geometric packet supplies these hypotheses.
-/
theorem Finset.card_le_three_of_three_cover_atMostOne
    {α : Type*} [DecidableEq α]
    (K T₁ T₂ T₃ : Finset α)
    (hK : K ⊆ T₁ ∪ T₂ ∪ T₃)
    (h₁ : (K ∩ T₁).card ≤ 1)
    (h₂ : (K ∩ T₂).card ≤ 1)
    (h₃ : (K ∩ T₃).card ≤ 1) :
    K.card ≤ 3 := by
  have hcover : K ⊆ (K ∩ T₁) ∪ (K ∩ T₂) ∪ (K ∩ T₃) := by
    intro x hx
    have hx' := hK hx
    simp only [Finset.mem_union, Finset.mem_inter] at hx' ⊢
    rcases hx' with (hx₁ | hx₂) | hx₃
    · exact Or.inl (Or.inl ⟨hx, hx₁⟩)
    · exact Or.inl (Or.inr ⟨hx, hx₂⟩)
    · exact Or.inr ⟨hx, hx₃⟩
  calc
    K.card ≤ ((K ∩ T₁) ∪ (K ∩ T₂) ∪ (K ∩ T₃)).card :=
      Finset.card_le_card hcover
    _ ≤ ((K ∩ T₁) ∪ (K ∩ T₂)).card + (K ∩ T₃).card :=
      Finset.card_union_le _ _
    _ ≤ (K ∩ T₁).card + (K ∩ T₂).card + (K ∩ T₃).card := by
      gcongr
      exact Finset.card_union_le _ _
    _ ≤ 3 := by omega

end Problem97
