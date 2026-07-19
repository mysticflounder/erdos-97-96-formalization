/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite two-shell cover core

This is the project-independent combinatorial heart of the pair-preserving
first-apex row split.  Two nonempty subsets of a four-element row, each of
cardinality at most two, either leave a common omitted point or form an exact
disjoint two-by-two cover.
-/

namespace Problem97
namespace ATailCriticalFiberProducerPushScratch

/-- A four-point carrier and two nonempty at-most-two subsets admit exactly
the common-omission / disjoint-two-pair-cover split. -/
theorem nonempty_complement_or_exact_disjoint_two_pair_cover
    {α : Type*} [DecidableEq α] {C I₁ I₂ : Finset α}
    (hCcard : C.card = 4)
    (hI₁sub : I₁ ⊆ C) (hI₂sub : I₂ ⊆ C)
    (hI₁card : I₁.card ≤ 2) (hI₂card : I₂.card ≤ 2)
    (hI₁nonempty : I₁.Nonempty) (hI₂nonempty : I₂.Nonempty) :
    (C \ (I₁ ∪ I₂)).Nonempty ∨
      (I₁.card = 2 ∧ I₂.card = 2 ∧
        Disjoint I₁ I₂ ∧ I₁ ∪ I₂ = C) := by
  by_cases houtside : (C \ (I₁ ∪ I₂)).Nonempty
  · exact Or.inl houtside
  · right
    have hCsub : C ⊆ I₁ ∪ I₂ := by
      intro z hzC
      by_contra hzUnion
      exact houtside ⟨z, Finset.mem_sdiff.mpr ⟨hzC, hzUnion⟩⟩
    have hUnionSub : I₁ ∪ I₂ ⊆ C := Finset.union_subset hI₁sub hI₂sub
    have hUnion : I₁ ∪ I₂ = C :=
      Finset.Subset.antisymm hUnionSub hCsub
    have hUnionCard : C.card ≤ I₁.card + I₂.card := by
      rw [← hUnion]
      exact Finset.card_union_le I₁ I₂
    have hI₁pos : 0 < I₁.card := Finset.card_pos.mpr hI₁nonempty
    have hI₂pos : 0 < I₂.card := Finset.card_pos.mpr hI₂nonempty
    have hI₁eq : I₁.card = 2 := by omega
    have hI₂eq : I₂.card = 2 := by omega
    have hInterEmpty : I₁ ∩ I₂ = ∅ := by
      apply Finset.card_eq_zero.mp
      have hcardIdentity := Finset.card_union_add_card_inter I₁ I₂
      rw [hUnion, hCcard, hI₁eq, hI₂eq] at hcardIdentity
      omega
    have hDisjoint : Disjoint I₁ I₂ := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact hInterEmpty
    exact ⟨hI₁eq, hI₂eq, hDisjoint, hUnion⟩

#print axioms nonempty_complement_or_exact_disjoint_two_pair_cover

end ATailCriticalFiberProducerPushScratch
end Problem97
