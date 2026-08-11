/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity

/-!
# Exact fifteen-point apex profiles

When a fifteen-point carrier has three closed Moser caps of cardinality at
least six, the cap-sum identity leaves no slack: every closed cap has six
points and every strict cap interior has four.

At an apex with rich-class structure this turns the abstract `S6 ∨ D44`
dichotomy into an exact classification of every selected four-point class.
In the `S6` branch every selected support lies in the six-point class.  In the
`D44` branch the two rich classes both have exactly four points and every
selected support equals one of them.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFifteenApexProfile

open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity

attribute [local instance] Classical.propDecidable

/-- The support of a selected four-class is contained in its ambient full
selected class. -/
theorem selectedFourClass_support_subset_selectedClass
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    K.support ⊆ SelectedClass A center K.radius := by
  intro x hx
  exact mem_selectedClass.mpr
    ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩

/-- The full class at the radius of a selected four-class has at least four
points. -/
theorem selectedFourClass_selectedClass_card_ge_four
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    4 ≤ (SelectedClass A center K.radius).card := by
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ (SelectedClass A center K.radius).card :=
      Finset.card_le_card (selectedFourClass_support_subset_selectedClass K)

/-- Three closed caps of cardinality at least six force at least fifteen
carrier points.  This is the cardinality floor of the all-large residual. -/
theorem card_ge_fifteen_of_all_cap_card_ge_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card) :
    15 ≤ A.card := by
  have hsum :
      (S.capByIndex (0 : Fin 3)).card +
          (S.capByIndex (1 : Fin 3)).card +
          (S.capByIndex (2 : Fin 3)).card = A.card + 3 := by
    have h := S.capSum
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
  have h0 := hlarge (0 : Fin 3)
  have h1 := hlarge (1 : Fin 3)
  have h2 := hlarge (2 : Fin 3)
  omega

/-- If one indexed cap has at least eight points while all three indexed caps
have at least six, the cap-sum identity forces at least seventeen carrier
points.  This is the cardinality floor of the enlarged-cap FreshThird
surface; in particular, exact-fifteen searches cannot model that live
residual. -/
theorem card_ge_seventeen_of_one_cap_card_ge_eight
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (height : 8 ≤ (S.capByIndex i).card)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card) :
    17 ≤ A.card := by
  have hsum :
      (S.capByIndex (0 : Fin 3)).card +
          (S.capByIndex (1 : Fin 3)).card +
          (S.capByIndex (2 : Fin 3)).card = A.card + 3 := by
    have h := S.capSum
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
  have h0 := hlarge (0 : Fin 3)
  have h1 := hlarge (1 : Fin 3)
  have h2 := hlarge (2 : Fin 3)
  fin_cases i <;>
    simp only [SurplusCapPacket.capByIndex] at hsum height h0 h1 h2 ⊢ <;>
    omega

/-- At the minimum carrier size seventeen, one indexed cap of cardinality at
least eight and three cap lower bounds of six are all sharp: the distinguished
cap has eight points and each other cap has six. -/
theorem capByIndex_card_profile_of_card_eq_seventeen
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : A.card = 17)
    (height : 8 ≤ (S.capByIndex i).card)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card) :
    (S.capByIndex i).card = 8 ∧
      ∀ j : Fin 3, j ≠ i → (S.capByIndex j).card = 6 := by
  have hsum :
      (S.capByIndex (0 : Fin 3)).card +
          (S.capByIndex (1 : Fin 3)).card +
          (S.capByIndex (2 : Fin 3)).card = A.card + 3 := by
    have h := S.capSum
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
  have h0 := hlarge (0 : Fin 3)
  have h1 := hlarge (1 : Fin 3)
  have h2 := hlarge (2 : Fin 3)
  constructor
  · fin_cases i <;>
      simp only [SurplusCapPacket.capByIndex] at hsum height h0 h1 h2 ⊢ <;>
      omega
  · intro j hji
    fin_cases i <;> fin_cases j <;>
      simp only [SurplusCapPacket.capByIndex] at hsum height h0 h1 h2 ⊢ <;>
      omega

/-- At exact carrier size fifteen, three cap lower bounds of six are all sharp. -/
theorem capByIndex_card_eq_six_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card)
    (i : Fin 3) :
    (S.capByIndex i).card = 6 := by
  have hsum :
      (S.capByIndex (0 : Fin 3)).card +
          (S.capByIndex (1 : Fin 3)).card +
          (S.capByIndex (2 : Fin 3)).card = A.card + 3 := by
    have h := S.capSum
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
  have h0 := hlarge (0 : Fin 3)
  have h1 := hlarge (1 : Fin 3)
  have h2 := hlarge (2 : Fin 3)
  fin_cases i <;>
    simp only [SurplusCapPacket.capByIndex] at hsum h0 h1 h2 ⊢ <;>
    omega

/-- At exact carrier size fifteen, each strict cap interior has four points. -/
theorem capInteriorByIndex_card_eq_four_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card)
    (i : Fin 3) :
    (S.capInteriorByIndex i).card = 4 := by
  have hcap := capByIndex_card_eq_six_of_card_eq_fifteen S hcard hlarge i
  have hinter := capInteriorByIndex_card_add_two S i
  omega

/-- If a strict cap interior has four points, then two distinct K4 radius
classes at its opposite apex partition it into two disjoint two-point slices. -/
theorem twoRichClassSlices_partition_of_capInterior_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hinterior : (S.capInteriorByIndex i).card = 4) :
    let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
      S.capInteriorByIndex i
    let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
      S.capInteriorByIndex i
    I₁.card = 2 ∧ I₂.card = 2 ∧ Disjoint I₁ I₂ ∧
      S.capInteriorByIndex i = I₁ ∪ I₂ := by
  classical
  let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
    S.capInteriorByIndex i
  let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
    S.capInteriorByIndex i
  have hI₁ : 2 ≤ I₁.card := by
    simpa [I₁] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₁ hfour₁
  have hI₂ : 2 ≤ I₂.card := by
    simpa [I₂] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₂ hfour₂
  have hdisjoint : Disjoint I₁ I₂ := by
    rw [Finset.disjoint_left]
    intro x hx₁ hx₂
    have hxr₁ := (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2
    have hxr₂ := (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2
    exact hne (hxr₁.symm.trans hxr₂)
  have hsub : I₁ ∪ I₂ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx₁ | hx₂
    · exact (Finset.mem_inter.mp hx₁).2
    · exact (Finset.mem_inter.mp hx₂).2
  have hunion : (I₁ ∪ I₂).card = I₁.card + I₂.card :=
    Finset.card_union_of_disjoint hdisjoint
  have hunion_le := Finset.card_le_card hsub
  have hI₁eq : I₁.card = 2 := by omega
  have hI₂eq : I₂.card = 2 := by omega
  have heq : S.capInteriorByIndex i = I₁ ∪ I₂ := by
    exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
  exact ⟨hI₁eq, hI₂eq, hdisjoint, heq⟩

/-- Exact cap occupancy at all three indices, packaged for downstream finite
encoders. -/
theorem exactCapProfile_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card) :
    ∀ i : Fin 3,
      (S.capByIndex i).card = 6 ∧
        (S.capInteriorByIndex i).card = 4 := by
  intro i
  exact ⟨capByIndex_card_eq_six_of_card_eq_fifteen S hcard hlarge i,
    capInteriorByIndex_card_eq_four_of_card_eq_fifteen S hcard hlarge i⟩

/-- In the exact-six-cap `S6` branch, its rich class has exactly six points. -/
theorem selectedClass_card_eq_six_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hcap : (S.capByIndex i).card = 6) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card = 6 := by
  have hle := oppositeVertex_selectedClass_card_le_cap_card S hconv i hr
  omega

/-- In the exact-six-cap `S6` branch, every selected four-point support at the
apex lies in the rich six-point class. -/
theorem selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hcap : (S.capByIndex i).card = 6) :
    K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r := by
  have hrichCard :=
    selectedClass_card_eq_six_of_cap_card_eq_six S hconv i hr hsix hcap
  have hKrFour := selectedFourClass_selectedClass_card_ge_four K
  have hradius : K.radius = r := by
    by_contra hne
    have hbound :=
      oppositeVertex_distinct_K4_radii_force_cap_card_ge_sum_sub_two
        S hconv i K.radius_pos hr hne
    omega
  simpa [hradius] using selectedFourClass_support_subset_selectedClass K

/-- In the exact-six-cap `D44` branch, both distinguished rich classes have
exactly four points. -/
theorem twoRichClasses_card_eq_four_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6) :
    (SelectedClass A (S.oppositeVertexByIndex i) r₁).card = 4 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r₂).card = 4 := by
  have hbound :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_sum_sub_two
      S hconv i hr₁ hr₂ hne
  omega

/-- In the exact-six-cap `D44` branch, no third K4 radius exists. -/
theorem selectedFourClass_radius_eq_one_of_twoRichRadii_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6) :
    K.radius = r₁ ∨ K.radius = r₂ := by
  classical
  by_contra hnot
  push_neg at hnot
  let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
    S.capInteriorByIndex i
  let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
    S.capInteriorByIndex i
  let IK := SelectedClass A (S.oppositeVertexByIndex i) K.radius ∩
    S.capInteriorByIndex i
  have hI₁ : 2 ≤ I₁.card := by
    simpa [I₁] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₁ hfour₁
  have hI₂ : 2 ≤ I₂.card := by
    simpa [I₂] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₂ hfour₂
  have hIK : 2 ≤ IK.card := by
    simpa [IK] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i K.radius_pos
        (selectedFourClass_selectedClass_card_ge_four K)
  have hdisjoint₁₂ : Disjoint I₁ I₂ := by
    rw [Finset.disjoint_left]
    intro x hx₁ hx₂
    have hx1 := (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2
    have hx2 := (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2
    exact hne (hx1.symm.trans hx2)
  have hdisjoint₁K : Disjoint I₁ IK := by
    rw [Finset.disjoint_left]
    intro x hx₁ hxK
    have hx1 := (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2
    have hxK := (mem_selectedClass.mp (Finset.mem_inter.mp hxK).1).2
    exact hnot.1 (hxK.symm.trans hx1)
  have hdisjoint₂K : Disjoint I₂ IK := by
    rw [Finset.disjoint_left]
    intro x hx₂ hxK
    have hx2 := (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2
    have hxK := (mem_selectedClass.mp (Finset.mem_inter.mp hxK).1).2
    exact hnot.2 (hxK.symm.trans hx2)
  have hdisjointUnion : Disjoint (I₁ ∪ I₂) IK :=
    Finset.disjoint_union_left.mpr ⟨hdisjoint₁K, hdisjoint₂K⟩
  have hsub : (I₁ ∪ I₂) ∪ IK ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_union.mp hx with hx | hx
      · exact (Finset.mem_inter.mp hx).2
      · exact (Finset.mem_inter.mp hx).2
    · exact (Finset.mem_inter.mp hx).2
  have hcard₁₂ : (I₁ ∪ I₂).card = I₁.card + I₂.card :=
    Finset.card_union_of_disjoint hdisjoint₁₂
  have hcardAll : ((I₁ ∪ I₂) ∪ IK).card = (I₁ ∪ I₂).card + IK.card :=
    Finset.card_union_of_disjoint hdisjointUnion
  have hle := Finset.card_le_card hsub
  have hinter := capInteriorByIndex_card_add_two S i
  omega

/-- In the exact-six-cap `D44` branch, every selected four-point support equals
one of the two exact rich four-classes. -/
theorem selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6) :
    K.support = SelectedClass A (S.oppositeVertexByIndex i) r₁ ∨
      K.support = SelectedClass A (S.oppositeVertexByIndex i) r₂ := by
  have hcards := twoRichClasses_card_eq_four_of_cap_card_eq_six
    S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hcap
  rcases selectedFourClass_radius_eq_one_of_twoRichRadii_of_cap_card_eq_six
      S hconv i K hr₁ hr₂ hne hfour₁ hfour₂ hcap with hr | hr
  · left
    have hsub : K.support ⊆
        SelectedClass A (S.oppositeVertexByIndex i) r₁ := by
      simpa [hr] using selectedFourClass_support_subset_selectedClass K
    apply Finset.eq_of_subset_of_card_le hsub
    rw [hcards.1, K.support_card]
  · right
    have hsub : K.support ⊆
        SelectedClass A (S.oppositeVertexByIndex i) r₂ := by
      simpa [hr] using selectedFourClass_support_subset_selectedClass K
    apply Finset.eq_of_subset_of_card_le hsub
    rw [hcards.2, K.support_card]

/-- In a six-point `D44` cap, two apex rows omitting points from opposite
interior slices have forced radii.  More precisely, if `C,M` are the two
known points of the first rich slice and `K` is a third interior point, then
`K` lies in the second rich class.  A row omitting `M` must be the second
class, while a row omitting `K` must be the first class.

This is the finite-exhaustion producer used by the exact-fifteen endpoint
lane.  It only concerns full selected classes and selected four-point rows;
it does not identify an arbitrary chosen four-subset with a full class. -/
theorem twoRichClass_deletedRows_forced_assignment_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6)
    (deletedAtM deletedAtK :
      SelectedFourClass A (S.oppositeVertexByIndex i))
    (C M K : ℝ²)
    (hCclass : C ∈ SelectedClass A (S.oppositeVertexByIndex i) r₁)
    (hMclass : M ∈ SelectedClass A (S.oppositeVertexByIndex i) r₁)
    (hCinterior : C ∈ S.capInteriorByIndex i)
    (hMinterior : M ∈ S.capInteriorByIndex i)
    (hKinterior : K ∈ S.capInteriorByIndex i)
    (hCM : C ≠ M) (hKC : K ≠ C) (hKM : K ≠ M)
    (hMdeleted : M ∉ deletedAtM.support)
    (hKdeleted : K ∉ deletedAtK.support) :
    K ∈ SelectedClass A (S.oppositeVertexByIndex i) r₂ ∧
      deletedAtM.support =
        SelectedClass A (S.oppositeVertexByIndex i) r₂ ∧
      deletedAtK.support =
        SelectedClass A (S.oppositeVertexByIndex i) r₁ := by
  classical
  let I := S.capInteriorByIndex i
  let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩ I
  let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩ I
  have hinterior : I.card = 4 := by
    have hadd := capInteriorByIndex_card_add_two S i
    dsimp [I]
    omega
  have hpartition :
      I₁.card = 2 ∧ I₂.card = 2 ∧ Disjoint I₁ I₂ ∧ I = I₁ ∪ I₂ := by
    simpa [I, I₁, I₂] using
      twoRichClassSlices_partition_of_capInterior_card_eq_four
        S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hinterior
  have hC_I₁ : C ∈ I₁ :=
    Finset.mem_inter.mpr ⟨hCclass, hCinterior⟩
  have hM_I₁ : M ∈ I₁ :=
    Finset.mem_inter.mpr ⟨hMclass, hMinterior⟩
  have hpairSub : ({C, M} : Finset ℝ²) ⊆ I₁ := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hC_I₁
    · exact hM_I₁
  have hI₁eq : I₁ = ({C, M} : Finset ℝ²) := by
    exact (Finset.eq_of_subset_of_card_le hpairSub (by
      simpa [hCM] using hpartition.1.le)).symm
  have hKnotI₁ : K ∉ I₁ := by
    rw [hI₁eq]
    simp [hKC, hKM]
  have hK_I₂ : K ∈ I₂ := by
    have hKunion : K ∈ I₁ ∪ I₂ := by
      rw [← hpartition.2.2.2]
      exact hKinterior
    rcases Finset.mem_union.mp hKunion with hK_I₁ | hK_I₂
    · exact (hKnotI₁ hK_I₁).elim
    · exact hK_I₂
  have hKclass :
      K ∈ SelectedClass A (S.oppositeVertexByIndex i) r₂ :=
    (Finset.mem_inter.mp hK_I₂).1
  have hMrow :
      deletedAtM.support =
        SelectedClass A (S.oppositeVertexByIndex i) r₂ := by
    rcases selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
        S hconv i deletedAtM hr₁ hr₂ hne hfour₁ hfour₂ hcap with hrow | hrow
    · exact (hMdeleted (by simpa [hrow] using hMclass)).elim
    · exact hrow
  have hKrow :
      deletedAtK.support =
        SelectedClass A (S.oppositeVertexByIndex i) r₁ := by
    rcases selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
        S hconv i deletedAtK hr₁ hr₂ hne hfour₁ hfour₂ hcap with hrow | hrow
    · exact hrow
    · exact (hKdeleted (by simpa [hrow] using hKclass)).elim
  exact ⟨hKclass, hMrow, hKrow⟩

/-- Center-transport form of
`twoRichClass_deletedRows_forced_assignment_of_cap_card_eq_six`.  Endpoint
packets name the same Moser apex through `oppApex1`, while cap-profile lemmas
name it through `oppositeVertexByIndex`; this adapter keeps that equality
explicit and avoids dependent transport at every consumer. -/
theorem twoRichClass_deletedRows_forced_assignment_of_center_eq_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {center : ℝ²}
    (hcenter : center = S.oppositeVertexByIndex i)
    {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A center r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A center r₂).card)
    (hcap : (S.capByIndex i).card = 6)
    (deletedAtM deletedAtK : SelectedFourClass A center)
    (C M K : ℝ²)
    (hCclass : C ∈ SelectedClass A center r₁)
    (hMclass : M ∈ SelectedClass A center r₁)
    (hCinterior : C ∈ S.capInteriorByIndex i)
    (hMinterior : M ∈ S.capInteriorByIndex i)
    (hKinterior : K ∈ S.capInteriorByIndex i)
    (hCM : C ≠ M) (hKC : K ≠ C) (hKM : K ≠ M)
    (hMdeleted : M ∉ deletedAtM.support)
    (hKdeleted : K ∉ deletedAtK.support) :
    K ∈ SelectedClass A center r₂ ∧
      deletedAtM.support = SelectedClass A center r₂ ∧
      deletedAtK.support = SelectedClass A center r₁ := by
  subst center
  exact twoRichClass_deletedRows_forced_assignment_of_cap_card_eq_six
    S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hcap
    deletedAtM deletedAtK C M K hCclass hMclass hCinterior hMinterior
    hKinterior hCM hKC hKM hMdeleted hKdeleted

/-- Consumer-facing form of
`twoRichClass_deletedRows_forced_assignment_of_cap_card_eq_six`: if a named
selected row already has the first rich radius, then the row omitting `K` is
exactly that retained row. -/
theorem twoRichClass_deletedRows_eq_retainedRow_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6)
    (retainedRow deletedAtM deletedAtK :
      SelectedFourClass A (S.oppositeVertexByIndex i))
    (hretainedRadius : retainedRow.radius = r₁)
    (C M K : ℝ²)
    (hCclass : C ∈ SelectedClass A (S.oppositeVertexByIndex i) r₁)
    (hMclass : M ∈ SelectedClass A (S.oppositeVertexByIndex i) r₁)
    (hCinterior : C ∈ S.capInteriorByIndex i)
    (hMinterior : M ∈ S.capInteriorByIndex i)
    (hKinterior : K ∈ S.capInteriorByIndex i)
    (hCM : C ≠ M) (hKC : K ≠ C) (hKM : K ≠ M)
    (hMdeleted : M ∉ deletedAtM.support)
    (hKdeleted : K ∉ deletedAtK.support) :
    K ∈ SelectedClass A (S.oppositeVertexByIndex i) r₂ ∧
      deletedAtM.support =
        SelectedClass A (S.oppositeVertexByIndex i) r₂ ∧
      deletedAtK.support = retainedRow.support := by
  have hbase :=
    twoRichClass_deletedRows_forced_assignment_of_cap_card_eq_six
      S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hcap
      deletedAtM deletedAtK C M K hCclass hMclass hCinterior hMinterior
      hKinterior hCM hKC hKM hMdeleted hKdeleted
  have hcards := twoRichClasses_card_eq_four_of_cap_card_eq_six
    S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hcap
  have hretainedSub : retainedRow.support ⊆
      SelectedClass A (S.oppositeVertexByIndex i) r₁ := by
    simpa [hretainedRadius] using
      selectedFourClass_support_subset_selectedClass retainedRow
  have hretainedEq : retainedRow.support =
      SelectedClass A (S.oppositeVertexByIndex i) r₁ := by
    apply Finset.eq_of_subset_of_card_le hretainedSub
    rw [hcards.1, retainedRow.support_card]
  exact ⟨hbase.1, hbase.2.1, hbase.2.2.trans hretainedEq.symm⟩

/-- Complete exact-fifteen classification of an arbitrary selected four-class
at a rich Moser apex.  This is the direct theorem-bank interface for the finite
encoder: the `S6` branch has one exact six-class containing the row, while the
`D44` branch has two exact four-classes and the row equals one of them. -/
theorem selectedFourClass_exactApexProfile_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hcard : A.card = 15)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card)
    (i : Fin 3) (K : SelectedFourClass A (S.oppositeVertexByIndex i))
    (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    (∃ r : ℝ, 0 < r ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r).card = 6 ∧
      K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r₁).card = 4 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r₂).card = 4 ∧
      (K.support = SelectedClass A (S.oppositeVertexByIndex i) r₁ ∨
        K.support = SelectedClass A (S.oppositeVertexByIndex i) r₂)) := by
  have hcap := capByIndex_card_eq_six_of_card_eq_fifteen S hcard hlarge i
  rcases hrich with ⟨r, hr, hsix⟩ | ⟨r₁, r₂, hr₁, hr₂, hne, hfour₁, hfour₂⟩
  · left
    exact ⟨r, hr,
      selectedClass_card_eq_six_of_cap_card_eq_six S hconv i hr hsix hcap,
      selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six
        S hconv i K hr hsix hcap⟩
  · right
    have hcards := twoRichClasses_card_eq_four_of_cap_card_eq_six
      S hconv i hr₁ hr₂ hne hfour₁ hfour₂ hcap
    exact ⟨r₁, r₂, hr₁, hr₂, hne, hcards.1, hcards.2,
      selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
        S hconv i K hr₁ hr₂ hne hfour₁ hfour₂ hcap⟩

/-- Global-K4 corollary of the exact-six-cap `S6` profile. -/
theorem exists_selectedFourClass_support_subset_richSixClass_of_globalK4
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (i : Fin 3) (hapex : S.oppositeVertexByIndex i ∈ A) {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hcap : (S.capByIndex i).card = 6) :
    ∃ K : SelectedFourClass A (S.oppositeVertexByIndex i),
      K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r := by
  let K := Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hapex)
  exact ⟨K, selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six
    S hconv i K hr hsix hcap⟩

/-- Global-K4 corollary of the exact-six-cap `D44` profile. -/
theorem exists_selectedFourClass_support_eq_one_of_twoRichClasses_of_globalK4
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (i : Fin 3) (hapex : S.oppositeVertexByIndex i ∈ A) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hcap : (S.capByIndex i).card = 6) :
    ∃ K : SelectedFourClass A (S.oppositeVertexByIndex i),
      K.support = SelectedClass A (S.oppositeVertexByIndex i) r₁ ∨
        K.support = SelectedClass A (S.oppositeVertexByIndex i) r₂ := by
  let K := Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hapex)
  exact ⟨K, selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
    S hconv i K hr₁ hr₂ hne hfour₁ hfour₂ hcap⟩

/-- Global-K4 producer for the complete exact-fifteen apex profile. -/
theorem exists_selectedFourClass_exactApexProfile_of_globalK4
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard : A.card = 15)
    (hlarge : ∀ j : Fin 3, 6 ≤ (S.capByIndex j).card)
    (i : Fin 3) (hapex : S.oppositeVertexByIndex i ∈ A)
    (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    ∃ K : SelectedFourClass A (S.oppositeVertexByIndex i),
      ((∃ r : ℝ, 0 < r ∧
        (SelectedClass A (S.oppositeVertexByIndex i) r).card = 6 ∧
        K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r) ∨
      (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
        (SelectedClass A (S.oppositeVertexByIndex i) r₁).card = 4 ∧
        (SelectedClass A (S.oppositeVertexByIndex i) r₂).card = 4 ∧
        (K.support = SelectedClass A (S.oppositeVertexByIndex i) r₁ ∨
          K.support = SelectedClass A (S.oppositeVertexByIndex i) r₂))) := by
  let K := Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hapex)
  exact ⟨K, selectedFourClass_exactApexProfile_of_card_eq_fifteen
    S hconv hcard hlarge i K hrich⟩

/-- Exhaustive tri-apex rich-profile split: either at least one indexed apex
has an `S6` witness, or every indexed apex has a `D44` witness.  This is the
smallest checked split needed by the S-profile CEGAR family; it avoids eight
role-labelled cases until a consumer genuinely needs them. -/
theorem exists_sixClass_or_all_twoRichClasses
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hrich : ∀ i : Fin 3,
      ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    (∃ i : Fin 3, ∃ r : ℝ, 0 < r ∧
      6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card) ∨
    (∀ i : Fin 3, ∃ r₁ r₂ : ℝ,
      0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card ∧
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card) := by
  classical
  by_cases hs : ∃ i : Fin 3, ∃ r : ℝ, 0 < r ∧
      6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card
  · exact Or.inl hs
  · right
    intro i
    rcases hrich i with hsix | hd44
    · exact False.elim (hs ⟨i, hsix⟩)
    · exact hd44

/-- At carrier cardinality fifteen with all three caps large, the exhaustive
tri-apex split has exact sizes: some apex has an exact six-class, or every
apex has two distinct exact four-classes. -/
theorem exists_exactSixClass_or_all_exactTwoFourClasses_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card)
    (hrich : ∀ i : Fin 3,
      ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    (∃ i : Fin 3, ∃ r : ℝ, 0 < r ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r).card = 6) ∨
    (∀ i : Fin 3, ∃ r₁ r₂ : ℝ,
      0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r₁).card = 4 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r₂).card = 4) := by
  rcases exists_sixClass_or_all_twoRichClasses S hrich with hs | hd
  · left
    rcases hs with ⟨i, r, hr, hsix⟩
    refine ⟨i, r, hr, ?_⟩
    exact selectedClass_card_eq_six_of_cap_card_eq_six
      S hconv i hr hsix
        (capByIndex_card_eq_six_of_card_eq_fifteen S hcard hlarge i)
  · right
    intro i
    rcases hd i with ⟨r₁, r₂, hr₁, hr₂, hne, hfour₁, hfour₂⟩
    have hcards := twoRichClasses_card_eq_four_of_cap_card_eq_six
      S hconv i hr₁ hr₂ hne hfour₁ hfour₂
        (capByIndex_card_eq_six_of_card_eq_fifteen S hcard hlarge i)
    exact ⟨r₁, r₂, hr₁, hr₂, hne, hcards.1, hcards.2⟩

end ATailExactFifteenApexProfile
end Problem97
