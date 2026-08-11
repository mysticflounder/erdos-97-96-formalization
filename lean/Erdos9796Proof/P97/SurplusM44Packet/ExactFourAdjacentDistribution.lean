/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Adjacent-cap distribution of an exact four-point selected class

An exact four-point class centered at an indexed Moser apex has two points
outside its own strict cap whenever it has exactly two points inside that cap.
The cap cover and the adjacent one-hit bounds then force exactly one point in
each adjacent closed cap.
-/

open scoped EuclideanGeometry

namespace Problem97

attribute [local instance] Classical.propDecidable

/-- An exact four-point selected class with two points in its indexed strict
cap has exactly one point in each adjacent closed cap. -/
theorem SurplusCapPacket.selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 4)
    (hinterior :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.capInteriorByIndex i).card = 2) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i).card = 1 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i).card = 1 := by
  let T := SelectedClass A (S.oppositeVertexByIndex i) radius
  let I := S.capInteriorByIndex i
  have houtside : (T \ I).card = 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter T I
    have hcardT : T.card = 4 := by simpa [T] using hcard
    have hinterior' : (T ∩ I).card = 2 := by
      simpa [T, I] using hinterior
    omega
  have hleft :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hright :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have hunionGe :
      2 ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
        (T ∩ S.rightAdjacentCapByIndex i)).card := by
    calc
      2 = (T \ I).card := houtside.symm
      _ ≤ _ := Finset.card_le_card hcover
  have hsumGe :
      2 ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
        (T ∩ S.rightAdjacentCapByIndex i).card :=
    hunionGe.trans (Finset.card_union_le _ _)
  have hleftEq :
      (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrightEq :
      (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  exact ⟨hleftEq, hrightEq⟩

/-- The two-by-two adjacent-cap grid forced by two distinct exact-four radii,
each with exactly two points in the indexed strict cap. -/
structure SurplusCapPacket.ExactFourTwoRadiusAdjacentCapGrid
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (radius ρ : ℝ) : Prop where
  radius_left_card_eq_one :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.leftAdjacentCapByIndex i).card = 1
  radius_right_card_eq_one :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.rightAdjacentCapByIndex i).card = 1
  rho_left_card_eq_one :
    (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
      S.leftAdjacentCapByIndex i).card = 1
  rho_right_card_eq_one :
    (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
      S.rightAdjacentCapByIndex i).card = 1
  left_disjoint :
    Disjoint
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i)
      (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
        S.leftAdjacentCapByIndex i)
  right_disjoint :
    Disjoint
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i)
      (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
        S.rightAdjacentCapByIndex i)

/-- Two distinct exact-four radii, each with two points in the indexed strict
cap, form an exact disjoint two-by-two grid across the adjacent caps. -/
theorem SurplusCapPacket.exactFourTwoRadiusAdjacentCapGrid
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius ρ : ℝ}
    (hradius : 0 < radius) (hρ : 0 < ρ) (hne : radius ≠ ρ)
    (hradiusCard :
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 4)
    (hρCard :
      (SelectedClass A (S.oppositeVertexByIndex i) ρ).card = 4)
    (hradiusInterior :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.capInteriorByIndex i).card = 2)
    (hρInterior :
      (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
        S.capInteriorByIndex i).card = 2) :
    S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ := by
  have hradiusAdjacent :=
    S.selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two
      hconv i hradius hradiusCard hradiusInterior
  have hρAdjacent :=
    S.selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two
      hconv i hρ hρCard hρInterior
  have hclasses :
      Disjoint
        (SelectedClass A (S.oppositeVertexByIndex i) radius)
        (SelectedClass A (S.oppositeVertexByIndex i) ρ) := by
    rw [Finset.disjoint_left]
    intro z hzRadius hzρ
    exact hne
      ((mem_selectedClass.mp hzRadius).2.symm.trans
        (mem_selectedClass.mp hzρ).2)
  exact {
    radius_left_card_eq_one := hradiusAdjacent.1
    radius_right_card_eq_one := hradiusAdjacent.2
    rho_left_card_eq_one := hρAdjacent.1
    rho_right_card_eq_one := hρAdjacent.2
    left_disjoint :=
      hclasses.mono Finset.inter_subset_left Finset.inter_subset_left
    right_disjoint :=
      hclasses.mono Finset.inter_subset_left Finset.inter_subset_left }

/-- On each adjacent side, at least one of the two distinct singleton hits is
strictly inside that adjacent cap.  The only non-strict selected point in a
positive-radius adjacent closed cap is its outer Moser endpoint, and the two
radius cells are disjoint. -/
theorem SurplusCapPacket.ExactFourTwoRadiusAdjacentCapGrid.exists_strict_hits
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {radius ρ : ℝ}
    (G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ)
    (hradius : 0 < radius) (hρ : 0 < ρ) :
    ((∃ x,
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentInteriorByIndex i) ∨
      ∃ x,
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
          S.leftAdjacentInteriorByIndex i) ∧
    ((∃ x,
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentInteriorByIndex i) ∨
      ∃ x,
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
          S.rightAdjacentInteriorByIndex i) := by
  let radiusClass := SelectedClass A (S.oppositeVertexByIndex i) radius
  let rhoClass := SelectedClass A (S.oppositeVertexByIndex i) ρ
  have hleft :
      (∃ x, x ∈ radiusClass ∩ S.leftAdjacentInteriorByIndex i) ∨
        ∃ x, x ∈ rhoClass ∩ S.leftAdjacentInteriorByIndex i := by
    have hradiusNonempty :
        (radiusClass ∩ S.leftAdjacentCapByIndex i).Nonempty :=
      Finset.card_pos.mp (by
        have hcard :
            (radiusClass ∩ S.leftAdjacentCapByIndex i).card = 1 := by
          simpa [radiusClass] using G.radius_left_card_eq_one
        omega)
    have hρNonempty :
        (rhoClass ∩ S.leftAdjacentCapByIndex i).Nonempty :=
      Finset.card_pos.mp (by
        have hcard :
            (rhoClass ∩ S.leftAdjacentCapByIndex i).card = 1 := by
          simpa [rhoClass] using G.rho_left_card_eq_one
        omega)
    rcases hradiusNonempty with ⟨x, hx⟩
    rcases hρNonempty with ⟨y, hy⟩
    have hxy : x ≠ y := by
      intro h
      subst y
      exact (Finset.disjoint_left.mp G.left_disjoint)
        (by simpa [radiusClass] using hx) (by simpa [rhoClass] using hy)
    by_cases hxouter : x = S.leftOuterVertexByIndex i
    · refine Or.inr ⟨y, Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hy).1, ?_⟩⟩
      apply S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
        i hρ (Finset.mem_inter.mp hy).1 (Finset.mem_inter.mp hy).2
      intro hyouter
      exact hxy (hxouter.trans hyouter.symm)
    · refine Or.inl ⟨x, Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hx).1, ?_⟩⟩
      exact S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
        i hradius (Finset.mem_inter.mp hx).1 (Finset.mem_inter.mp hx).2 hxouter
  have hright :
      (∃ x, x ∈ radiusClass ∩ S.rightAdjacentInteriorByIndex i) ∨
        ∃ x, x ∈ rhoClass ∩ S.rightAdjacentInteriorByIndex i := by
    have hradiusNonempty :
        (radiusClass ∩ S.rightAdjacentCapByIndex i).Nonempty :=
      Finset.card_pos.mp (by
        have hcard :
            (radiusClass ∩ S.rightAdjacentCapByIndex i).card = 1 := by
          simpa [radiusClass] using G.radius_right_card_eq_one
        omega)
    have hρNonempty :
        (rhoClass ∩ S.rightAdjacentCapByIndex i).Nonempty :=
      Finset.card_pos.mp (by
        have hcard :
            (rhoClass ∩ S.rightAdjacentCapByIndex i).card = 1 := by
          simpa [rhoClass] using G.rho_right_card_eq_one
        omega)
    rcases hradiusNonempty with ⟨x, hx⟩
    rcases hρNonempty with ⟨y, hy⟩
    have hxy : x ≠ y := by
      intro h
      subst y
      exact (Finset.disjoint_left.mp G.right_disjoint)
        (by simpa [radiusClass] using hx) (by simpa [rhoClass] using hy)
    by_cases hxouter : x = S.rightOuterVertexByIndex i
    · refine Or.inr ⟨y, Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hy).1, ?_⟩⟩
      apply S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
        i hρ (Finset.mem_inter.mp hy).1 (Finset.mem_inter.mp hy).2
      intro hyouter
      exact hxy (hxouter.trans hyouter.symm)
    · refine Or.inl ⟨x, Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hx).1, ?_⟩⟩
      exact S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
        i hradius (Finset.mem_inter.mp hx).1 (Finset.mem_inter.mp hx).2 hxouter
  simpa [radiusClass, rhoClass] using And.intro hleft hright

#print axioms SurplusCapPacket.selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two
#print axioms SurplusCapPacket.exactFourTwoRadiusAdjacentCapGrid
#print axioms SurplusCapPacket.ExactFourTwoRadiusAdjacentCapGrid.exists_strict_hits

end Problem97
