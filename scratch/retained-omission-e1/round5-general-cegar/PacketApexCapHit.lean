import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile

/-! Scratch validation of a cardinality-free apex-row cap-hit theorem. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPacketApexCapHitScratch

open ATailExactFifteenApexProfile
open ATailCapApexRadiusRigidity
open ATailApexRichClassStructure

attribute [local instance] Classical.propDecidable

/-- Any chosen four-point row centered at a Moser apex has at least two
support points in that apex's strict cap interior.  This is cardinality-free:
the full ambient radius class has at most two points outside the strict cap. -/
theorem selectedFourClass_support_inter_capInterior_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) :
    2 ≤ (K.support ∩ S.capInteriorByIndex i).card := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) K.radius
  let I := S.capInteriorByIndex i
  have hsupport : K.support ⊆ T := by
    simpa [T] using selectedFourClass_support_subset_selectedClass K
  have hfullInside : T.card - 2 ≤ (T ∩ I).card := by
    simpa [T, I] using
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        hconv i K.radius_pos
  have hfullSplit : (T \ I).card + (T ∩ I).card = T.card := by
    simp [Finset.card_sdiff_add_card_inter]
  have hfullOutside : (T \ I).card ≤ 2 := by
    omega
  have hsupportOutside : (K.support \ I).card ≤ 2 := by
    calc
      (K.support \ I).card ≤ (T \ I).card :=
        Finset.card_le_card
          (Finset.sdiff_subset_sdiff hsupport (by rfl))
      _ ≤ 2 := hfullOutside
  have hsupportSplit :
      (K.support \ I).card + (K.support ∩ I).card = K.support.card := by
    simp [Finset.card_sdiff_add_card_inter]
  have hcard : K.support.card = 4 := K.support_card
  change 2 ≤ (K.support ∩ I).card
  omega

/-- Three pairwise distinct positive K4 radii at a Moser apex force six
points in the strict opposite-cap interior, hence eight in the closed cap. -/
theorem three_distinct_K4_radii_force_cap_card_ge_eight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r₁ r₂ r₃ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hr₃ : 0 < r₃)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hfour₃ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₃).card)
    (hne₁₂ : r₁ ≠ r₂) (hne₁₃ : r₁ ≠ r₃) (hne₂₃ : r₂ ≠ r₃) :
    8 ≤ (S.capByIndex i).card := by
  classical
  let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
    S.capInteriorByIndex i
  let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
    S.capInteriorByIndex i
  let I₃ := SelectedClass A (S.oppositeVertexByIndex i) r₃ ∩
    S.capInteriorByIndex i
  have hI₁ : 2 ≤ I₁.card := by
    simpa [I₁] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₁ hfour₁
  have hI₂ : 2 ≤ I₂.card := by
    simpa [I₂] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₂ hfour₂
  have hI₃ : 2 ≤ I₃.card := by
    simpa [I₃] using
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₃ hfour₃
  have hdisjoint₁₂ : Disjoint I₁ I₂ := by
    rw [Finset.disjoint_left]
    intro x hx₁ hx₂
    have hx₁r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2
    have hx₂r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2
    exact hne₁₂ (hx₁r.symm.trans hx₂r)
  have hdisjoint₁₃ : Disjoint I₁ I₃ := by
    rw [Finset.disjoint_left]
    intro x hx₁ hx₃
    have hx₁r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₁).1).2
    have hx₃r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₃).1).2
    exact hne₁₃ (hx₁r.symm.trans hx₃r)
  have hdisjoint₂₃ : Disjoint I₂ I₃ := by
    rw [Finset.disjoint_left]
    intro x hx₂ hx₃
    have hx₂r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₂).1).2
    have hx₃r := (mem_selectedClass.mp (Finset.mem_inter.mp hx₃).1).2
    exact hne₂₃ (hx₂r.symm.trans hx₃r)
  have hdisjointUnion : Disjoint (I₁ ∪ I₂) I₃ :=
    Finset.disjoint_union_left.mpr ⟨hdisjoint₁₃, hdisjoint₂₃⟩
  have hsub : (I₁ ∪ I₂) ∪ I₃ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_union.mp hx with hx | hx
      · exact (Finset.mem_inter.mp hx).2
      · exact (Finset.mem_inter.mp hx).2
    · exact (Finset.mem_inter.mp hx).2
  have hcard₁₂ : (I₁ ∪ I₂).card = I₁.card + I₂.card :=
    Finset.card_union_of_disjoint hdisjoint₁₂
  have hcardAll : ((I₁ ∪ I₂) ∪ I₃).card = (I₁ ∪ I₂).card + I₃.card :=
    Finset.card_union_of_disjoint hdisjointUnion
  have hle := Finset.card_le_card hsub
  have hcap := capInteriorByIndex_card_add_two S i
  omega

/-- Encoder-facing generalization of the exact-six `S6` projection. -/
theorem selectedFourClass_support_subset_richSix_or_cap_card_ge_eight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card) :
    K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r ∨
      8 ≤ (S.capByIndex i).card := by
  by_cases heq : K.radius = r
  · left
    simpa [heq] using selectedFourClass_support_subset_selectedClass K
  · right
    have hbound :=
      oppositeVertex_distinct_K4_radii_force_cap_card_ge_sum_sub_two
        S hconv i K.radius_pos hr heq
    have hfour := selectedFourClass_selectedClass_card_ge_four K
    omega

/-- Encoder-facing generalization of the exact-six `D44` projection. -/
theorem selectedFourClass_support_subset_one_of_twoRich_or_cap_card_ge_eight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i)) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card) :
    K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r₁ ∨
      K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) r₂ ∨
      8 ≤ (S.capByIndex i).card := by
  by_cases heq₁ : K.radius = r₁
  · exact Or.inl (by
      simpa [heq₁] using selectedFourClass_support_subset_selectedClass K)
  by_cases heq₂ : K.radius = r₂
  · exact Or.inr (Or.inl (by
      simpa [heq₂] using selectedFourClass_support_subset_selectedClass K))
  · exact Or.inr (Or.inr
      (three_distinct_K4_radii_force_cap_card_ge_eight S hconv i
        hr₁ hr₂ K.radius_pos hfour₁ hfour₂
        (selectedFourClass_selectedClass_card_ge_four K)
        hne (fun h => heq₁ h.symm) (fun h => heq₂ h.symm)))

end ATailPacketApexCapHitScratch
end Problem97
