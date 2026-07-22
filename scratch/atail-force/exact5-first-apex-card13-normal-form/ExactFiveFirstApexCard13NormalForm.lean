/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexShellRoleExtractor
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds

/-!
# Exact-five first-apex normal form at carrier cardinality thirteen

This scratch file records the sharp first-apex consequences of the live
exact-five parent at the smallest possible carrier cardinality.  It keeps
ambient radius classes separate from selected four-subrows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveFirstApexCard13Scratch

open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem selectedClass_sdiff_capInterior_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r : ℝ} (hr : 0 < r) :
    (SelectedClass A (S.oppositeVertexByIndex i) r \
      S.capInteriorByIndex i).card ≤ 2 := by
  let T := SelectedClass A (S.oppositeVertexByIndex i) r
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i r
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i r
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hr
  calc
    (T \ S.capInteriorByIndex i).card
        ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
    _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_union_le _ _
    _ ≤ 2 := by omega

/-- At card thirteen the live exact-five cap profile is exactly `(5,6,5)` in
the displayed surplus/first-opposite/second-opposite order. -/
theorem cap_cards_eq_five_six_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : D.A.card = 13) :
    S.surplusCap.card = 5 ∧ S.oppCap1.card = 6 ∧
      S.oppCap2.card = 5 := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

/-- In the same-radius arm at card thirteen, the complete retained
first-apex radius class is exactly six points. -/
theorem firstApex_class_card_eq_six_of_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : P.doubleRadius = radius) :
    (SelectedClass D.A S.oppApex1 radius).card = 6 := by
  have hcap : (S.capByIndex S.oppIndex1).card = 6 := by
    rw [capByIndex_oppIndex1_eq_oppCap1]
    exact (cap_cards_eq_five_six_five Q hcard).2.1
  have hinteriorCard := capInteriorByIndex_card_add_two S S.oppIndex1
  rw [hcap] at hinteriorCard
  have houtside := selectedClass_sdiff_capInterior_card_le_two
    S D.convex S.oppIndex1 P.retainedRadius_pos
  rw [← oppApex1_eq_oppositeVertex_oppIndex1 S] at houtside
  have hinter :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card ≤ 4 :=
    (Finset.card_le_card Finset.inter_subset_right).trans (by omega)
  have hsplit := Finset.card_sdiff_add_card_inter
    (SelectedClass D.A S.oppApex1 radius)
    (S.capInteriorByIndex S.oppIndex1)
  have hlower := P.sameRadius_six hsame
  omega

/-- The same-radius six-class saturates all four strict points of the
six-point first opposite cap. -/
theorem firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : P.doubleRadius = radius) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 =
      S.capInteriorByIndex S.oppIndex1 := by
  have hcap : (S.capByIndex S.oppIndex1).card = 6 := by
    rw [capByIndex_oppIndex1_eq_oppCap1]
    exact (cap_cards_eq_five_six_five Q hcard).2.1
  have hinteriorCard := capInteriorByIndex_card_add_two S S.oppIndex1
  rw [hcap] at hinteriorCard
  have hclass := firstApex_class_card_eq_six_of_sameRadius Q P hcard hsame
  have houtside := selectedClass_sdiff_capInterior_card_le_two
    S D.convex S.oppIndex1 P.retainedRadius_pos
  rw [← oppApex1_eq_oppositeVertex_oppIndex1 S] at houtside
  have hsplit := Finset.card_sdiff_add_card_inter
    (SelectedClass D.A S.oppApex1 radius)
    (S.capInteriorByIndex S.oppIndex1)
  apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
  omega

/-- In the distinct-radius arm at card thirteen, the strict-cap portions of
the retained and double-deletion rows are disjoint two-point sets whose union
is the whole four-point strict first opposite cap. -/
theorem firstApex_distinctRadius_rows_partition_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : P.doubleRadius ≠ radius) :
    let I := S.capInteriorByIndex S.oppIndex1
    let T₀ := P.retainedRow.support ∩ I
    let T₁ := P.doubleRow.support ∩ I
    T₀.card = 2 ∧ T₁.card = 2 ∧ T₀ ∪ T₁ = I := by
  let I := S.capInteriorByIndex S.oppIndex1
  let T₀ := P.retainedRow.support ∩ I
  let T₁ := P.doubleRow.support ∩ I
  have hcap : (S.capByIndex S.oppIndex1).card = 6 := by
    rw [capByIndex_oppIndex1_eq_oppCap1]
    exact (cap_cards_eq_five_six_five Q hcard).2.1
  have hIcard : I.card = 4 := by
    have hinteriorCard := capInteriorByIndex_card_add_two S S.oppIndex1
    rw [hcap] at hinteriorCard
    simpa [I] using (show (S.capInteriorByIndex S.oppIndex1).card = 4 by omega)
  have hpair₀ : ({P.retainedInterior₁, P.retainedInterior₂} : Finset ℝ²) ⊆ T₀ := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.retainedInterior₁_mem_row, P.retainedInterior₁_mem_cap⟩
    · exact Finset.mem_inter.mpr
        ⟨P.retainedInterior₂_mem_row, P.retainedInterior₂_mem_cap⟩
  have hpair₁ : ({P.doubleInterior₁, P.doubleInterior₂} : Finset ℝ²) ⊆ T₁ := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.doubleInterior₁_mem_row, P.doubleInterior₁_mem_cap⟩
    · exact Finset.mem_inter.mpr
        ⟨P.doubleInterior₂_mem_row, P.doubleInterior₂_mem_cap⟩
  have hT₀two : 2 ≤ T₀.card := by
    have hle := Finset.card_le_card hpair₀
    simpa [Finset.card_pair P.retainedInterior_ne] using hle
  have hT₁two : 2 ≤ T₁.card := by
    have hle := Finset.card_le_card hpair₁
    simpa [Finset.card_pair P.doubleInterior_ne] using hle
  have hdisjoint : Disjoint T₀ T₁ := by
    rw [Finset.disjoint_left]
    intro x hx₀ hx₁
    exact Finset.disjoint_left.mp (P.distinctRadius_disjoint hdistinct)
      (Finset.mem_inter.mp hx₀).1 (Finset.mem_inter.mp hx₁).1
  have hunionSub : T₀ ∪ T₁ ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx₀ | hx₁
    · exact (Finset.mem_inter.mp hx₀).2
    · exact (Finset.mem_inter.mp hx₁).2
  have hunionCard : (T₀ ∪ T₁).card = T₀.card + T₁.card :=
    Finset.card_union_of_disjoint hdisjoint
  have hunionEq : T₀ ∪ T₁ = I := by
    apply Finset.eq_of_subset_of_card_le hunionSub
    rw [hunionCard, hIcard]
    omega
  have hunionCardEq : T₀.card + T₁.card = 4 := by
    rw [← hunionCard, hunionEq, hIcard]
  have hT₀eq : T₀.card = 2 := by omega
  have hT₁eq : T₁.card = 2 := by omega
  exact ⟨hT₀eq, hT₁eq, hunionEq⟩

/-- At card thirteen, the distinct-radius arm is sharper than a pair of
selected rows: both rows are their complete ambient exact four-classes. -/
theorem firstApex_distinctRadius_rows_are_exactClasses
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : P.doubleRadius ≠ radius) :
    P.retainedRow.support = SelectedClass D.A S.oppApex1 radius ∧
      P.doubleRow.support =
        SelectedClass D.A S.oppApex1 P.doubleRadius := by
  let I := S.capInteriorByIndex S.oppIndex1
  let C₀ := SelectedClass D.A S.oppApex1 radius
  let C₁ := SelectedClass D.A S.oppApex1 P.doubleRadius
  let J₀ := C₀ ∩ I
  let J₁ := C₁ ∩ I
  have hcap : (S.capByIndex S.oppIndex1).card = 6 := by
    rw [capByIndex_oppIndex1_eq_oppCap1]
    exact (cap_cards_eq_five_six_five Q hcard).2.1
  have hIcard : I.card = 4 := by
    have hinteriorCard := capInteriorByIndex_card_add_two S S.oppIndex1
    rw [hcap] at hinteriorCard
    simpa [I] using (show (S.capInteriorByIndex S.oppIndex1).card = 4 by omega)
  have hretainedSub : P.retainedRow.support ⊆ C₀ := by
    intro x hx
    apply mem_selectedClass.mpr
    exact ⟨P.retainedRow.support_subset_A hx,
      (P.retainedRow.support_eq_radius x hx).trans P.retainedRow_radius⟩
  have hdoubleSub : P.doubleRow.support ⊆ C₁ := by
    intro x hx
    apply mem_selectedClass.mpr
    exact ⟨P.doubleRow.support_subset_A hx,
      (P.doubleRow.support_eq_radius x hx).trans P.doubleRow_radius⟩
  have hJ₀two : 2 ≤ J₀.card := by
    let T₀ := P.retainedRow.support ∩ I
    have hpair : ({P.retainedInterior₁, P.retainedInterior₂} : Finset ℝ²) ⊆
        T₀ := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨P.retainedInterior₁_mem_row, P.retainedInterior₁_mem_cap⟩
      · exact Finset.mem_inter.mpr
          ⟨P.retainedInterior₂_mem_row, P.retainedInterior₂_mem_cap⟩
    have hTtwo : 2 ≤ T₀.card := by
      have hle := Finset.card_le_card hpair
      simpa [Finset.card_pair P.retainedInterior_ne] using hle
    have hsub : T₀ ⊆ J₀ := by
      intro x hx
      exact Finset.mem_inter.mpr
        ⟨hretainedSub (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
    exact hTtwo.trans (Finset.card_le_card hsub)
  have hJ₁two : 2 ≤ J₁.card := by
    let T₁ := P.doubleRow.support ∩ I
    have hpair : ({P.doubleInterior₁, P.doubleInterior₂} : Finset ℝ²) ⊆
        T₁ := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨P.doubleInterior₁_mem_row, P.doubleInterior₁_mem_cap⟩
      · exact Finset.mem_inter.mpr
          ⟨P.doubleInterior₂_mem_row, P.doubleInterior₂_mem_cap⟩
    have hTtwo : 2 ≤ T₁.card := by
      have hle := Finset.card_le_card hpair
      simpa [Finset.card_pair P.doubleInterior_ne] using hle
    have hsub : T₁ ⊆ J₁ := by
      intro x hx
      exact Finset.mem_inter.mpr
        ⟨hdoubleSub (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
    exact hTtwo.trans (Finset.card_le_card hsub)
  have hclassesDisjoint : Disjoint C₀ C₁ := by
    rw [Finset.disjoint_left]
    intro x hx₀ hx₁
    have hradius₀ := (mem_selectedClass.mp hx₀).2
    have hradius₁ := (mem_selectedClass.mp hx₁).2
    exact hdistinct (hradius₁.symm.trans hradius₀)
  have hJdisjoint : Disjoint J₀ J₁ := by
    rw [Finset.disjoint_left]
    intro x hx₀ hx₁
    exact Finset.disjoint_left.mp hclassesDisjoint
      (Finset.mem_inter.mp hx₀).1 (Finset.mem_inter.mp hx₁).1
  have hJunionSub : J₀ ∪ J₁ ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx₀ | hx₁
    · exact (Finset.mem_inter.mp hx₀).2
    · exact (Finset.mem_inter.mp hx₁).2
  have hJunionCard : (J₀ ∪ J₁).card = J₀.card + J₁.card :=
    Finset.card_union_of_disjoint hJdisjoint
  have hJ₀card : J₀.card = 2 := by
    have hle := Finset.card_le_card hJunionSub
    rw [hJunionCard, hIcard] at hle
    omega
  have hJ₁card : J₁.card = 2 := by
    have hle := Finset.card_le_card hJunionSub
    rw [hJunionCard, hIcard] at hle
    omega
  have houtside₀ := selectedClass_sdiff_capInterior_card_le_two
    S D.convex S.oppIndex1 P.retainedRadius_pos
  rw [← oppApex1_eq_oppositeVertex_oppIndex1 S] at houtside₀
  have houtside₁ := selectedClass_sdiff_capInterior_card_le_two
    S D.convex S.oppIndex1 P.doubleRadius_pos
  rw [← oppApex1_eq_oppositeVertex_oppIndex1 S] at houtside₁
  have hsplit₀ := Finset.card_sdiff_add_card_inter C₀ I
  have hsplit₁ := Finset.card_sdiff_add_card_inter C₁ I
  change (C₀ \ I).card ≤ 2 at houtside₀
  change (C₁ \ I).card ≤ 2 at houtside₁
  have hC₀card : C₀.card = 4 := by
    have hsubCard := Finset.card_le_card hretainedSub
    have hlower : 4 ≤ C₀.card := by
      simpa [P.retainedRow.support_card] using hsubCard
    change (C₀ ∩ I).card = 2 at hJ₀card
    omega
  have hC₁card : C₁.card = 4 := by
    have hsubCard := Finset.card_le_card hdoubleSub
    have hlower : 4 ≤ C₁.card := by
      simpa [P.doubleRow.support_card] using hsubCard
    change (C₁ ∩ I).card = 2 at hJ₁card
    omega
  constructor
  · apply Finset.eq_of_subset_of_card_le hretainedSub
    simpa [C₀, P.retainedRow.support_card] using hC₀card.le
  · apply Finset.eq_of_subset_of_card_le hdoubleSub
    simpa [C₁, P.doubleRow.support_card] using hC₁card.le

#print axioms cap_cards_eq_five_six_five
#print axioms firstApex_class_card_eq_six_of_sameRadius
#print axioms firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
#print axioms firstApex_distinctRadius_rows_partition_capInterior
#print axioms firstApex_distinctRadius_rows_are_exactClasses

end ATailExactFiveFirstApexCard13Scratch
end Problem97
