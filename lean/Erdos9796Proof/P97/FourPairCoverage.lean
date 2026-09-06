/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card

/-!
# Coverage by overlaps of four two-point supports

Three disjointness relations in an ambient set of size at most six force one
of two further overlaps, provided the second and fourth supports are distinct.
In an ambient set of size at most seven, the same three disjointness relations
force one of the three remaining overlaps, without a distinctness hypothesis.
-/

namespace Problem97.FourPairCoverage

/-- Four two-element subsets of a set of size at most six, with the indicated
three disjoint pairs and distinct second and fourth sets, have an overlap in
the first and fourth sets or in the second and third sets. -/
theorem overlap_of_disjoint_pairs {α : Type*} [DecidableEq α]
    (U A B C D : Finset α) (hU : U.card ≤ 6)
    (hAU : A ⊆ U) (hBU : B ⊆ U) (hCU : C ⊆ U) (hDU : D ⊆ U)
    (hA : A.card = 2) (hB : B.card = 2) (hC : C.card = 2) (hD : D.card = 2)
    (hAB : Disjoint A B) (hAC : Disjoint A C) (hCD : Disjoint C D)
    (hBD : B ≠ D) :
    (A ∩ D).Nonempty ∨ (B ∩ C).Nonempty := by
  classical
  by_contra h
  have hAD : Disjoint A D := by
    apply Finset.disjoint_left.mpr
    intro x hxA hxD
    exact h (Or.inl ⟨x, Finset.mem_inter.mpr ⟨hxA, hxD⟩⟩)
  have hBC : Disjoint B C := by
    apply Finset.disjoint_left.mpr
    intro x hxB hxC
    exact h (Or.inr ⟨x, Finset.mem_inter.mpr ⟨hxB, hxC⟩⟩)
  let E := U \ (A ∪ C)
  have hACU : A ∪ C ⊆ U := Finset.union_subset hAU hCU
  have hACcard : (A ∪ C).card = 4 := by
    simp [Finset.card_union_of_disjoint hAC, hA, hC]
  have hEcard : E.card ≤ 2 := by
    dsimp [E]
    rw [Finset.card_sdiff_of_subset hACU, hACcard]
    exact Nat.sub_le_sub_right hU 4
  have hBE : B ⊆ E := by
    intro x hxB
    apply Finset.mem_sdiff.mpr
    refine ⟨hBU hxB, ?_⟩
    intro hxAC
    rcases Finset.mem_union.mp hxAC with hxA | hxC
    · exact Finset.disjoint_left.mp hAB hxA hxB
    · exact Finset.disjoint_left.mp hBC hxB hxC
  have hDE : D ⊆ E := by
    intro x hxD
    apply Finset.mem_sdiff.mpr
    refine ⟨hDU hxD, ?_⟩
    intro hxAC
    rcases Finset.mem_union.mp hxAC with hxA | hxC
    · exact Finset.disjoint_left.mp hAD hxA hxD
    · exact Finset.disjoint_left.mp hCD hxC hxD
  have hBEq : B = E := Finset.eq_of_subset_of_card_le hBE (by simpa [hB] using hEcard)
  have hDEq : D = E := Finset.eq_of_subset_of_card_le hDE (by simpa [hD] using hEcard)
  exact hBD (hBEq.trans hDEq.symm)

/-- Four two-element subsets of a set of size at most seven, with the indicated
three disjoint pairs, overlap in at least one of the three remaining pairs. -/
theorem overlap_of_three_disjoint_pairs {α : Type*} [DecidableEq α]
    (U A B C D : Finset α) (hU : U.card ≤ 7)
    (hAU : A ⊆ U) (hBU : B ⊆ U) (hCU : C ⊆ U) (hDU : D ⊆ U)
    (hA : A.card = 2) (hB : B.card = 2) (hC : C.card = 2) (hD : D.card = 2)
    (hAB : Disjoint A B) (hAC : Disjoint A C) (hCD : Disjoint C D) :
    (A ∩ D).Nonempty ∨ (B ∩ C).Nonempty ∨ (B ∩ D).Nonempty := by
  classical
  by_contra h
  have hAD : Disjoint A D := by
    apply Finset.disjoint_left.mpr
    intro x hxA hxD
    exact h (Or.inl ⟨x, Finset.mem_inter.mpr ⟨hxA, hxD⟩⟩)
  have hBC : Disjoint B C := by
    apply Finset.disjoint_left.mpr
    intro x hxB hxC
    exact h (Or.inr (Or.inl ⟨x, Finset.mem_inter.mpr ⟨hxB, hxC⟩⟩))
  have hBD : Disjoint B D := by
    apply Finset.disjoint_left.mpr
    intro x hxB hxD
    exact h (Or.inr (Or.inr ⟨x, Finset.mem_inter.mpr ⟨hxB, hxD⟩⟩))
  have hABCD : Disjoint (A ∪ B) (C ∪ D) := by
    apply Finset.disjoint_left.mpr
    intro x hxAB hxCD
    rcases Finset.mem_union.mp hxAB with hxA | hxB
    · rcases Finset.mem_union.mp hxCD with hxC | hxD
      · exact Finset.disjoint_left.mp hAC hxA hxC
      · exact Finset.disjoint_left.mp hAD hxA hxD
    · rcases Finset.mem_union.mp hxCD with hxC | hxD
      · exact Finset.disjoint_left.mp hBC hxB hxC
      · exact Finset.disjoint_left.mp hBD hxB hxD
  have hcard : ((A ∪ B) ∪ (C ∪ D)).card = 8 := by
    rw [Finset.card_union_of_disjoint hABCD, Finset.card_union_of_disjoint hAB,
      Finset.card_union_of_disjoint hCD, hA, hB, hC, hD]
  have hsub : (A ∪ B) ∪ (C ∪ D) ⊆ U :=
    Finset.union_subset (Finset.union_subset hAU hBU) (Finset.union_subset hCU hDU)
  have hle : 8 ≤ U.card := by
    rw [← hcard]
    exact Finset.card_le_card hsub
  exact (by decide : ¬ (8 : ℕ) ≤ 7) (hle.trans hU)

end Problem97.FourPairCoverage
