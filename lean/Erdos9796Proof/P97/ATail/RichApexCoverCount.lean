/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Mathlib

/-!
# Count kernels for the rich--rich apex-cover route

These are the small arithmetic kernels used by the constructive finite
obstruction.  They are intentionally independent of the finite `Fin 15`
labels and of the live geometric packet; the missing production step is the
adapter that supplies the decomposition counts and cut bounds.
-/

namespace Problem97

/-- The twelve-count contradiction behind the first rich apex-cover fact.

The three equalities count the two extra points in each rich row.  The next
two inequalities are the shared-apex cuts, and the final three are the
rich--rich pair cuts.  The singleton bounds and pointwise containments from
the finite decomposition are redundant for this arithmetic core.  Once an
adapter supplies these eight inequalities, `omega` closes the non-cover
branch without any computational enumeration.
-/
theorem richApexCountContradiction
    (x y p q u v s w z t m n : Nat)
    (hx : x + y + p + q = 2)
    (hu : u + v + s = 2)
    (hw : w + z + t = 2)
    (hm : q + s ≤ 1 + m)
    (hn : p + t ≤ 1 + n)
    (h01 : x + u + m ≤ 1)
    (h02 : y + w + n ≤ 1)
    (h12 : v + z ≤ 1) :
    False := by
  omega

/-- A finite set covered by three domains, each contributing at most one
point, has cardinality at most three. -/
theorem richApex_card_le_three_of_cover
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
