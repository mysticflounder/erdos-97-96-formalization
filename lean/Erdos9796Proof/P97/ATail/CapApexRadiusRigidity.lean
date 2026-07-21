/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting

/-!
# Small opposite-cap radius rigidity

At a Moser apex, a positive radius class with four carrier points has at
least two points in the strict interior of the opposite cap.  Together with
the adjacent-cap one-hit bounds, this makes cap sizes four and five rigid and
forces a closed cap of size at least six from two distinct K4 radii.

This is the production predecessor of the bi-apex robust cap dispatcher.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCapApexRadiusRigidity

attribute [local instance] Classical.propDecidable

/-- Deleting the two Moser endpoints from an indexed closed cap gives its
strict interior. -/
theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.capInteriorByIndex i).card + 2 = (S.capByIndex i).card := by
  fin_cases i
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem selectedClass_card_le_of_small_cap
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r : ℝ} (hr : 0 < r)
    {n : ℕ} (hinterior : (S.capInteriorByIndex i).card ≤ n) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ n + 2 := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) r
  let I := S.capInteriorByIndex i
  have hleftOne : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i r
  have hrightOne : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i r
  have hcover : T \ I ⊆
      (T ∩ S.leftAdjacentCapByIndex i) ∪ (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hr
  have houtside : (T \ I).card ≤ 2 := by
    calc
      (T \ I).card ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card := Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hinter : (T ∩ I).card ≤ n :=
    (Finset.card_le_card Finset.inter_subset_right).trans (by simpa [I] using hinterior)
  have hsplit := Finset.card_sdiff_add_card_inter T I
  change T.card ≤ n + 2
  omega

/-- Every positive radius class at the apex opposite a five-point cap has at
most five carrier points. -/
theorem oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 5) {r : ℝ} (hr : 0 < r) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ 5 := by
  apply selectedClass_card_le_of_small_cap S hconv i hr (n := 3)
  have hcard := capInteriorByIndex_card_add_two S i
  omega

/-- A positive radius class at the apex opposite a four-point cap has at
most four carrier points. -/
theorem oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) {r : ℝ} (hr : 0 < r) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ 4 := by
  apply selectedClass_card_le_of_small_cap S hconv i hr (n := 2)
  rw [S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap]

/-- Two distinct positive K4 radii at a Moser apex force four points in the
strict interior of its opposite cap. -/
theorem oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r ρ : ℝ}
    (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card)
    (hrρ : r ≠ ρ) :
    4 ≤ (S.capInteriorByIndex i).card := by
  classical
  let Ir := SelectedClass A (S.oppositeVertexByIndex i) r ∩ S.capInteriorByIndex i
  let Iρ := SelectedClass A (S.oppositeVertexByIndex i) ρ ∩ S.capInteriorByIndex i
  have hIr : 2 ≤ Ir.card := by
    simpa [Ir] using S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr hrFour
  have hIρ : 2 ≤ Iρ.card := by
    simpa [Iρ] using S.selectedClass_capInteriorByIndex_card_ge_two hconv i hρ hρFour
  have hdisjoint : Disjoint Ir Iρ := by
    rw [Finset.disjoint_left]
    intro x hxIr hxIρ
    have hxr : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIr).1).2
    have hxρ : dist (S.oppositeVertexByIndex i) x = ρ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIρ).1).2
    exact hrρ (hxr.symm.trans hxρ)
  have hsub : Ir ∪ Iρ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact (Finset.mem_inter.mp hx).2
    · exact (Finset.mem_inter.mp hx).2
  have hunion : (Ir ∪ Iρ).card = Ir.card + Iρ.card :=
    Finset.card_union_of_disjoint hdisjoint
  have hle := Finset.card_le_card hsub
  omega

/-- Two distinct positive K4 radii at a Moser apex require a closed opposite
cap of cardinality at least six. -/
theorem oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r ρ : ℝ}
    (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card)
    (hrρ : r ≠ ρ) :
    6 ≤ (S.capByIndex i).card := by
  have hinter := oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four
    S hconv i hr hρ hrFour hρFour hrρ
  have hcap := capInteriorByIndex_card_add_two S i
  omega

end ATailCapApexRadiusRigidity
end Problem97
