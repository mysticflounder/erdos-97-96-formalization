/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.AdjacentCapContainment
import Erdos9796Proof.P97.ATail.SlotOccupantDichotomy
import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm

/-!
# Foreign occupants in a two-radius adjacent-cap split

The exact-fifteen two-radius branch gives one occupant in each adjacent cap for
each of two distinct radius classes.  The slot dichotomy says that each such
occupant is either a strict-interior point of its receiving cap or the one
surviving Moser endpoint.  There are only two endpoint values, while the four
occupants are distinct.  Consequently at least two of the four occupants are
strict-interior foreign hits.

This is a lower-bound producer for the planned safe-slice classifier.  It does
not assert the stronger global upper bound on foreign hits, and it uses no
metric facts beyond the selected-class radius semantics.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SurplusCapPacket

attribute [local instance] Classical.propDecidable

/-- Two distinct radius classes with one point in each adjacent cap contribute
at least two strict-interior (foreign) occupants. -/
theorem twoRadii_adjacentCap_foreign_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {r₁ r₂ : ℝ} (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hleft₁ :
      (SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
        S.leftAdjacentCapByIndex i).card = 1)
    (hright₁ :
      (SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
        S.rightAdjacentCapByIndex i).card = 1)
    (hleft₂ :
      (SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
        S.leftAdjacentCapByIndex i).card = 1)
    (hright₂ :
      (SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
        S.rightAdjacentCapByIndex i).card = 1) :
    2 ≤
      (((SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
          S.leftAdjacentCapByIndex i) ∩
          S.capInteriorByIndex (leftAdjacentIndex i)) ∪
        ((SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
          S.rightAdjacentCapByIndex i) ∩
          S.capInteriorByIndex (rightAdjacentIndex i)) ∪
        ((SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
          S.leftAdjacentCapByIndex i) ∩
          S.capInteriorByIndex (leftAdjacentIndex i)) ∪
        ((SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
          S.rightAdjacentCapByIndex i) ∩
          S.capInteriorByIndex (rightAdjacentIndex i))).card := by
  let K₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁
  let K₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂
  let U₁ := K₁ ∩ S.leftAdjacentCapByIndex i
  let U₂ := K₁ ∩ S.rightAdjacentCapByIndex i
  let U₃ := K₂ ∩ S.leftAdjacentCapByIndex i
  let U₄ := K₂ ∩ S.rightAdjacentCapByIndex i
  have hU₁ : U₁.card = 1 := by simpa [U₁, K₁] using hleft₁
  have hU₂ : U₂.card = 1 := by simpa [U₂, K₁] using hright₁
  have hU₃ : U₃.card = 1 := by simpa [U₃, K₂] using hleft₂
  have hU₄ : U₄.card = 1 := by simpa [U₄, K₂] using hright₂
  have hKdisj : Disjoint K₁ K₂ := by
    simpa [K₁, K₂] using
      (ATailPairedCommonDeletionNormalForm.selectedClass_disjoint_of_radius_ne
        (A := A)
        (p := S.oppositeVertexByIndex i) hne)
  have hcenter_not_K₁ : S.oppositeVertexByIndex i ∉ K₁ := by
    intro h
    have hd := (mem_selectedClass.mp h).2
    rw [dist_self] at hd
    exact (ne_of_gt hr₁) hd.symm
  have hcenter_not_K₂ : S.oppositeVertexByIndex i ∉ K₂ := by
    intro h
    have hd := (mem_selectedClass.mp h).2
    rw [dist_self] at hd
    exact (ne_of_gt hr₂) hd.symm
  have hU₁₂ : Disjoint U₁ U₂ := by
    rw [Finset.disjoint_left]
    intro x hx₁ hx₂
    have hxK : x ∈ K₁ := (Finset.mem_inter.mp hx₁).1
    have hxcenter := S.eq_oppositeVertexByIndex_of_mem_adjacentCaps i
      (mem_selectedClass.mp hxK).1
      (Finset.mem_inter.mp hx₁).2 (Finset.mem_inter.mp hx₂).2
    exact hcenter_not_K₁ (by simpa [hxcenter] using hxK)
  have hU₃₄ : Disjoint U₃ U₄ := by
    rw [Finset.disjoint_left]
    intro x hx₃ hx₄
    have hxK : x ∈ K₂ := (Finset.mem_inter.mp hx₃).1
    have hxcenter := S.eq_oppositeVertexByIndex_of_mem_adjacentCaps i
      (mem_selectedClass.mp hxK).1
      (Finset.mem_inter.mp hx₃).2 (Finset.mem_inter.mp hx₄).2
    exact hcenter_not_K₂ (by simpa [hxcenter] using hxK)
  have hcross (U V : Finset ℝ²) (hU : U ⊆ K₁) (hV : V ⊆ K₂) :
      Disjoint U V := by
    rw [Finset.disjoint_left]
    intro x hxU hxV
    exact Finset.disjoint_left.mp hKdisj (hU hxU) (hV hxV)
  have hU₁₃ := hcross U₁ U₃ (by intro x hx; exact (Finset.mem_inter.mp hx).1)
    (by intro x hx; exact (Finset.mem_inter.mp hx).1)
  have hU₁₄ := hcross U₁ U₄ (by intro x hx; exact (Finset.mem_inter.mp hx).1)
    (by intro x hx; exact (Finset.mem_inter.mp hx).1)
  have hU₂₃ := hcross U₂ U₃ (by intro x hx; exact (Finset.mem_inter.mp hx).1)
    (by intro x hx; exact (Finset.mem_inter.mp hx).1)
  have hU₂₄ := hcross U₂ U₄ (by intro x hx; exact (Finset.mem_inter.mp hx).1)
    (by intro x hx; exact (Finset.mem_inter.mp hx).1)
  have hU₁₂₃ : Disjoint (U₁ ∪ U₂) U₃ := by
    rw [Finset.disjoint_left]
    intro x hx hx₃
    rcases Finset.mem_union.mp hx with hx₁ | hx₂
    · exact Finset.disjoint_left.mp hU₁₃ hx₁ hx₃
    · exact Finset.disjoint_left.mp hU₂₃ hx₂ hx₃
  have hU₁₂₄ : Disjoint (U₁ ∪ U₂) U₄ := by
    rw [Finset.disjoint_left]
    intro x hx hx₄
    rcases Finset.mem_union.mp hx with hx₁ | hx₂
    · exact Finset.disjoint_left.mp hU₁₄ hx₁ hx₄
    · exact Finset.disjoint_left.mp hU₂₄ hx₂ hx₄
  have hU₁₂card : (U₁ ∪ U₂).card = 2 := by
    rw [Finset.card_union_of_disjoint hU₁₂, hU₁, hU₂]
  have hU₁₂₃card : ((U₁ ∪ U₂) ∪ U₃).card = 3 := by
    rw [Finset.card_union_of_disjoint hU₁₂₃, hU₁₂card, hU₃]
  have hU₁₂₃₄ : Disjoint ((U₁ ∪ U₂) ∪ U₃) U₄ := by
    rw [Finset.disjoint_left]
    intro x hx hx₄
    rcases Finset.mem_union.mp hx with hx₁₂ | hx₃
    · exact Finset.disjoint_left.mp hU₁₂₄ hx₁₂ hx₄
    · exact Finset.disjoint_left.mp hU₃₄ hx₃ hx₄
  let U := ((U₁ ∪ U₂) ∪ U₃) ∪ U₄
  have hUcard : U.card = 4 := by
    simpa [U] using
      (show (((U₁ ∪ U₂) ∪ U₃) ∪ U₄).card = 4 by
        rw [Finset.card_union_of_disjoint hU₁₂₃₄, hU₁₂₃card, hU₄])
  let eL := S.oppositeVertexByIndex (rightAdjacentIndex i)
  let eR := S.oppositeVertexByIndex (leftAdjacentIndex i)
  let E : Finset ℝ² := {eL, eR}
  have hEcard : E.card ≤ 2 := by
    by_cases h : eL = eR
    · simp [E, h]
    · simp [E, h]
  let I₁ := U₁ ∩ S.capInteriorByIndex (leftAdjacentIndex i)
  let I₂ := U₂ ∩ S.capInteriorByIndex (rightAdjacentIndex i)
  let I₃ := U₃ ∩ S.capInteriorByIndex (leftAdjacentIndex i)
  let I₄ := U₄ ∩ S.capInteriorByIndex (rightAdjacentIndex i)
  let I := I₁ ∪ I₂ ∪ I₃ ∪ I₄
  have hforeign : U \ E ⊆ I := by
    intro x hx
    have hxE : x ∉ E := (Finset.mem_sdiff.mp hx).2
    have hxU : x ∈ U := (Finset.mem_sdiff.mp hx).1
    change x ∈ I₁ ∪ I₂ ∪ I₃ ∪ I₄
    rcases Finset.mem_union.mp hxU with hx₁₂₃ | hx₄
    · rcases Finset.mem_union.mp hx₁₂₃ with hx₁₂ | hx₃
      · rcases Finset.mem_union.mp hx₁₂ with hx₁ | hx₂
        · rcases mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_leftAdjacentCap
            S i hr₁ (Finset.mem_inter.mp hx₁).1 (Finset.mem_inter.mp hx₁).2 with hi | heq
          · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr
              (Or.inl (Finset.mem_union.mpr
                (Or.inl (Finset.mem_inter.mpr ⟨hx₁, hi⟩))))))
          · exact (hxE (by simp [E, eL, heq])).elim
        · rcases mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_rightAdjacentCap
            S i hr₁ (Finset.mem_inter.mp hx₂).1 (Finset.mem_inter.mp hx₂).2 with hi | heq
          · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr
              (Or.inl (Finset.mem_union.mpr
                (Or.inr (Finset.mem_inter.mpr ⟨hx₂, hi⟩))))))
          · exact (hxE (by simp [E, eR, heq])).elim
      · rcases mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_leftAdjacentCap
          S i hr₂ (Finset.mem_inter.mp hx₃).1 (Finset.mem_inter.mp hx₃).2 with hi | heq
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr
            (Or.inr (Finset.mem_inter.mpr ⟨hx₃, hi⟩))))
        · exact (hxE (by simp [E, eL, heq])).elim
    · rcases mem_capInteriorByIndex_or_eq_oppositeVertex_of_mem_rightAdjacentCap
        S i hr₂ (Finset.mem_inter.mp hx₄).1 (Finset.mem_inter.mp hx₄).2 with hi | heq
      · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx₄, hi⟩))
      · exact (hxE (by simp [E, eR, heq])).elim
  have hminus_card := Finset.card_sdiff_add_card_inter U E
  have hinter_card : (U ∩ E).card ≤ E.card :=
    Finset.card_le_card Finset.inter_subset_right
  have hminus_ge : 2 ≤ (U \ E).card := by
    omega
  have hIcard : 2 ≤ I.card := by
    exact hminus_ge.trans (Finset.card_le_card hforeign)
  simpa [I₁, I₂, I₃, I₄, I, U₁, U₂, U₃, U₄, K₁, K₂] using hIcard

end SurplusCapPacket
end Problem97
