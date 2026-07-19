/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle

/-!
# A first-apex row preserving both retained sources and all outside-cap hits

The arbitrary one-point row selector used by the endpoint-fiber continuation
forgets two useful facts about the retained first-apex radius class:

* both consecutive retained sources lie in its strict opposite-cap interior;
* at most two members of the complete radius class lie outside that interior.

Consequently one can select a four-point row which preserves both retained
sources and every outside-interior member.  The row has exactly two remaining
points.  Each remaining point is in the strict interior or one of the two
adjacent closed caps, and the adjacent one-hit bounds forbid both remaining
points from occupying the same adjacent cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberProducerPushScratch

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle

attribute [local instance] Classical.propDecidable

/-- A four-point first-apex row retaining both consecutive interior sources,
all members of the complete radius class outside the strict opposite cap, and
the two named remainder points. -/
structure FirstApexTwoRemainderRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type where
  row : SelectedFourClass D.A S.oppApex1
  row_support_subset_frontierClass :
    row.support ⊆ SelectedClass D.A S.oppApex1 radius
  first_mem_row : W.first ∈ row.support
  second_mem_row : W.second ∈ row.support
  J₁ : ℝ²
  J₂ : ℝ²
  J₁_ne_J₂ : J₁ ≠ J₂
  J₁_mem_row : J₁ ∈ row.support
  J₂_mem_row : J₂ ∈ row.support
  J₁_ne_first : J₁ ≠ W.first
  J₁_ne_second : J₁ ≠ W.second
  J₂_ne_first : J₂ ≠ W.first
  J₂_ne_second : J₂ ≠ W.second
  remainder_eq :
    row.support \ {W.first, W.second} = {J₁, J₂}
  outside_subset_row :
    SelectedClass D.A S.oppApex1 radius \
        S.capInteriorByIndex S.oppIndex1 ⊆ row.support

/-- The retained radius is positive, using either interior source as a
non-apex member of the exact radius class. -/
private theorem retainedFrontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    0 < radius := by
  have hfirstNeApex : W.first ≠ S.oppApex1 := by
    have happ := oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
    simpa only [happ] using
      S.capInteriorByIndex_ne_oppositeVertexByIndex
        W.first_mem_capInterior
  have hdistPos : 0 < dist S.oppApex1 W.first :=
    dist_pos.mpr hfirstNeApex.symm
  have hdistRadius : dist S.oppApex1 W.first = radius := by
    simpa only [dist_comm] using
      (mem_selectedClass.mp W.first_mem_radius).2
  simpa only [hdistRadius] using hdistPos

/-- Preserve both retained interior sources and the complete outside-interior
part of the first-apex radius class in one selected four-row. -/
theorem nonempty_firstApexTwoRemainderRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    Nonempty (FirstApexTwoRemainderRow W) := by
  classical
  let C : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
  let I : Finset ℝ² := S.capInteriorByIndex S.oppIndex1
  let O : Finset ℝ² := C \ I
  let pair : Finset ℝ² := {W.first, W.second}
  let P : Finset ℝ² := pair ∪ O
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hradiusPos : 0 < radius := retainedFrontierRadius_pos W
  have hleftOne :
      (C ∩ S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [C, hcenter] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex1 radius
  have hrightOne :
      (C ∩ S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [C, hcenter] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex1 radius
  have hcover :
      O ⊆
        (C ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
          (C ∩ S.rightAdjacentCapByIndex S.oppIndex1) := by
    simpa [O, C, I, hcenter] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex1 hradiusPos
  have hOcard : O.card ≤ 2 := by
    calc
      O.card ≤
          ((C ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
            (C ∩ S.rightAdjacentCapByIndex S.oppIndex1)).card :=
        Finset.card_le_card hcover
      _ ≤ (C ∩ S.leftAdjacentCapByIndex S.oppIndex1).card +
            (C ∩ S.rightAdjacentCapByIndex S.oppIndex1).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hpairSub : pair ⊆ C := by
    intro z hz
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact W.first_mem_radius
    · exact W.second_mem_radius
  have hpairCard : pair.card = 2 := by
    simp [pair, W.first_ne_second]
  have hPsub : P ⊆ C := by
    intro z hz
    rcases Finset.mem_union.mp hz with hzPair | hzO
    · exact hpairSub hzPair
    · exact (Finset.mem_sdiff.mp hzO).1
  have hPcard : P.card ≤ 4 := by
    have hunion : P.card ≤ pair.card + O.card := by
      simpa [P] using Finset.card_union_le pair O
    omega
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
        (by simpa [C] using hPsub) hPcard
        R.frontierRadius_class_card_ge_four with
    ⟨T, hPT, hTClass, hTcard⟩
  have hpairT : pair ⊆ T := fun _ hz ↦ hPT (Finset.mem_union_left O hz)
  have hremCard : (T \ pair).card = 2 := by
    rw [Finset.card_sdiff_of_subset hpairT, hTcard, hpairCard]
    norm_num
  rw [Finset.card_eq_two] at hremCard
  rcases hremCard with ⟨J₁, J₂, hJne, hremEq⟩
  have hJ₁rem : J₁ ∈ T \ pair := by
    rw [hremEq]
    simp
  have hJ₂rem : J₂ ∈ T \ pair := by
    rw [hremEq]
    simp
  have hJ₁T : J₁ ∈ T := (Finset.mem_sdiff.mp hJ₁rem).1
  have hJ₂T : J₂ ∈ T := (Finset.mem_sdiff.mp hJ₂rem).1
  have hJ₁notPair : J₁ ∉ pair := (Finset.mem_sdiff.mp hJ₁rem).2
  have hJ₂notPair : J₂ ∉ pair := (Finset.mem_sdiff.mp hJ₂rem).2
  let row : SelectedFourClass D.A S.oppApex1 := {
    support := T
    support_subset_A := fun _ hz ↦
      (mem_selectedClass.mp (hTClass hz)).1
    support_card := hTcard
    radius := radius
    radius_pos := hradiusPos
    support_eq_radius := fun _ hz ↦
      (mem_selectedClass.mp (hTClass hz)).2
    center_not_mem := by
      intro hcenterMem
      have hzero := (mem_selectedClass.mp (hTClass hcenterMem)).2
      have : radius = 0 := by simpa using hzero.symm
      exact (ne_of_gt hradiusPos) this }
  exact ⟨{
    row := row
    row_support_subset_frontierClass := by
      simpa [row] using hTClass
    first_mem_row := by
      simpa [row] using hpairT (by simp [pair])
    second_mem_row := by
      simpa [row] using hpairT (by simp [pair])
    J₁ := J₁
    J₂ := J₂
    J₁_ne_J₂ := hJne
    J₁_mem_row := by simpa [row] using hJ₁T
    J₂_mem_row := by simpa [row] using hJ₂T
    J₁_ne_first := by
      simpa [pair] using fun h : J₁ = W.first ↦ hJ₁notPair (by simp [h])
    J₁_ne_second := by
      simpa [pair] using fun h : J₁ = W.second ↦ hJ₁notPair (by simp [h])
    J₂_ne_first := by
      simpa [pair] using fun h : J₂ = W.first ↦ hJ₂notPair (by simp [h])
    J₂_ne_second := by
      simpa [pair] using fun h : J₂ = W.second ↦ hJ₂notPair (by simp [h])
    remainder_eq := by simpa [row, pair] using hremEq
    outside_subset_row := by
      intro z hz
      have hzO : z ∈ O := by simpa [O, C, I] using hz
      have hzT : z ∈ T := hPT (Finset.mem_union_right pair hzO)
      simpa [row] using hzT }⟩

/-- Each remainder lies either in the strict opposite-cap interior or in one
of the two adjacent closed caps. -/
theorem remainder_mem_capInterior_or_adjacentCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) {J : ℝ²}
    (hJ : J ∈ Q.row.support) :
    J ∈ S.capInteriorByIndex S.oppIndex1 ∨
      J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
      J ∈ S.rightAdjacentCapByIndex S.oppIndex1 := by
  by_cases hI : J ∈ S.capInteriorByIndex S.oppIndex1
  · exact Or.inl hI
  · right
    have hcenter :
        S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
      oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
    have hclass : J ∈ SelectedClass D.A S.oppApex1 radius :=
      Q.row_support_subset_frontierClass hJ
    have houtside :
        J ∈ SelectedClass D.A S.oppApex1 radius \
          S.capInteriorByIndex S.oppIndex1 :=
      Finset.mem_sdiff.mpr ⟨hclass, hI⟩
    have hcover :=
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex1 (retainedFrontierRadius_pos W)
    have hcovered := hcover (by simpa [hcenter] using houtside)
    rcases Finset.mem_union.mp hcovered with hleft | hright
    · exact Or.inl (Finset.mem_inter.mp hleft).2
    · exact Or.inr (Finset.mem_inter.mp hright).2

/-- The two remainders cannot both lie in the same left adjacent cap. -/
theorem not_both_remainders_mem_leftAdjacentCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) :
    ¬ (Q.J₁ ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
      Q.J₂ ∈ S.leftAdjacentCapByIndex S.oppIndex1) := by
  intro hboth
  have hpairSub :
      ({Q.J₁, Q.J₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Q.row_support_subset_frontierClass Q.J₁_mem_row, hboth.1⟩
    · exact Finset.mem_inter.mpr
        ⟨Q.row_support_subset_frontierClass Q.J₂_mem_row, hboth.2⟩
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card := by
    calc
      2 = ({Q.J₁, Q.J₂} : Finset ℝ²).card := by
        simp [Q.J₁_ne_J₂]
      _ ≤ _ := Finset.card_le_card hpairSub
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hone :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  have hone' :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [hcenter] using hone
  omega

/-- The two remainders cannot both lie in the same right adjacent cap. -/
theorem not_both_remainders_mem_rightAdjacentCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) :
    ¬ (Q.J₁ ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
      Q.J₂ ∈ S.rightAdjacentCapByIndex S.oppIndex1) := by
  intro hboth
  have hpairSub :
      ({Q.J₁, Q.J₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Q.row_support_subset_frontierClass Q.J₁_mem_row, hboth.1⟩
    · exact Finset.mem_inter.mpr
        ⟨Q.row_support_subset_frontierClass Q.J₂_mem_row, hboth.2⟩
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card := by
    calc
      2 = ({Q.J₁, Q.J₂} : Finset ℝ²).card := by
        simp [Q.J₁_ne_J₂]
      _ ≤ _ := Finset.card_le_card hpairSub
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hone :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  have hone' :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    simpa [hcenter] using hone
  omega

/-- At least one remainder is genuinely fresh relative to the endpoint source
`W.next`; both are already distinct from `W.first` and `W.second`. -/
theorem exists_remainder_ne_next
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) :
    ∃ J : ℝ²,
      (J = Q.J₁ ∨ J = Q.J₂) ∧
      J ≠ W.first ∧ J ≠ W.second ∧ J ≠ W.next := by
  by_cases hJ₁ : Q.J₁ ≠ W.next
  · exact ⟨Q.J₁, Or.inl rfl, Q.J₁_ne_first,
      Q.J₁_ne_second, hJ₁⟩
  · have hJ₂ : Q.J₂ ≠ W.next := by
      intro h
      apply Q.J₁_ne_J₂
      exact (not_ne_iff.mp hJ₁).trans h.symm
    exact ⟨Q.J₂, Or.inr rfl, Q.J₂_ne_first,
      Q.J₂_ne_second, hJ₂⟩

/-- One of the two complement points is omitted by both actual critical
shells.  Its deletion therefore preserves K4 at the first apex and at both
distinct actual blockers. -/
structure PairRowCommonOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) : Type where
  source : ℝ²
  source_eq_remainder : source = Q.J₁ ∨ source = Q.J₂
  source_mem_row : source ∈ Q.row.support
  source_mem_radius : source ∈ SelectedClass D.A S.oppApex1 radius
  source_ne_first : source ≠ W.first
  source_ne_second : source ≠ W.second
  source_not_mem_firstShell :
    source ∉
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support
  source_not_mem_secondShell :
    source ∉
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support
  location :
    source ∈ S.capInteriorByIndex S.oppIndex1 ∨
      source ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
      source ∈ S.rightAdjacentCapByIndex S.oppIndex1
  firstPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt W.first W.first_mem_A)
  secondPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt W.second W.second_mem_A)

/-- The complement of a common omission: the two actual critical shells cut
the selected first-apex row into two disjoint two-point pieces. -/
structure PairRowExactTwoPairCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) : Prop where
  firstHits_card_eq_two :
    ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
      Q.row.support).card = 2
  secondHits_card_eq_two :
    ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
      Q.row.support).card = 2
  hits_disjoint :
    Disjoint
      ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
        Q.row.support)
      ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
        Q.row.support)
  hits_union_eq_row :
    ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          Q.row.support) ∪
        ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          Q.row.support) =
      Q.row.support

/-- Exact two-shell split on the pair-preserving four-row. -/
inductive PairRowActualShellOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) : Type
  | commonOmission (data : PairRowCommonOmission Q)
  | exactTwoPairCover (data : PairRowExactTwoPairCover Q)

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- For the two retained consecutive sources, a pair-preserving first-apex
row either contains a complement point omitted by both actual shells, or is
covered exactly by their two disjoint two-point intersections.

This statement does not assume source return.  If the second shell contains
`W.first`, the exact-cover arm is impossible and the common-omission arm is
forced automatically. -/
theorem nonempty_pairRowActualShellOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (Q : FirstApexTwoRemainderRow W) :
    Nonempty (PairRowActualShellOutcome Q) := by
  classical
  let C : Finset ℝ² := Q.row.support
  let I₁ : Finset ℝ² :=
    (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩ C
  let I₂ : Finset ℝ² :=
    (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩ C
  let K₁ : SelectedFourClass D.A (H.centerAt W.first W.first_mem_A) :=
    (H.selectedAt W.first W.first_mem_A).toSelectedFourClass
  let K₂ : SelectedFourClass D.A (H.centerAt W.second W.second_mem_A) :=
    (H.selectedAt W.second W.second_mem_A).toSelectedFourClass
  have hI₁Two : I₁.card ≤ 2 := by
    simpa [I₁, C, K₁] using
      SelectedFourClass.inter_card_le_two K₁ Q.row
        (R.actualBlocker_ne_firstApex W.first W.first_mem_A)
  have hI₂Two : I₂.card ≤ 2 := by
    simpa [I₂, C, K₂] using
      SelectedFourClass.inter_card_le_two K₂ Q.row
        (R.actualBlocker_ne_firstApex W.second W.second_mem_A)
  have hfirstI₁ : W.first ∈ I₁ := by
    exact Finset.mem_inter.mpr
      ⟨(H.selectedAt W.first W.first_mem_A).toCriticalFourShell.q_mem_support,
        Q.first_mem_row⟩
  have hsecondI₂ : W.second ∈ I₂ := by
    exact Finset.mem_inter.mpr
      ⟨(H.selectedAt W.second W.second_mem_A).toCriticalFourShell.q_mem_support,
        Q.second_mem_row⟩
  by_cases hjoint : (C \ (I₁ ∪ I₂)).Nonempty
  · rcases hjoint with ⟨source, hsource⟩
    have hsourceC : source ∈ C := (Finset.mem_sdiff.mp hsource).1
    have hsourceNotUnion : source ∉ I₁ ∪ I₂ :=
      (Finset.mem_sdiff.mp hsource).2
    have hsourceNotI₁ : source ∉ I₁ := by
      intro h
      exact hsourceNotUnion (Finset.mem_union_left I₂ h)
    have hsourceNotI₂ : source ∉ I₂ := by
      intro h
      exact hsourceNotUnion (Finset.mem_union_right I₁ h)
    have hsourceNotShell₁ :
        source ∉
          (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support := by
      intro h
      exact hsourceNotI₁ (Finset.mem_inter.mpr ⟨h, hsourceC⟩)
    have hsourceNotShell₂ :
        source ∉
          (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
      intro h
      exact hsourceNotI₂ (Finset.mem_inter.mpr ⟨h, hsourceC⟩)
    have hsourceNeFirst : source ≠ W.first := by
      intro h
      subst source
      exact hsourceNotShell₁
        (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.q_mem_support
    have hsourceNeSecond : source ≠ W.second := by
      intro h
      subst source
      exact hsourceNotShell₂
        (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.q_mem_support
    have hsourceRem :
        source ∈ Q.row.support \ {W.first, W.second} :=
      Finset.mem_sdiff.mpr ⟨by simpa [C] using hsourceC, by
        simp [hsourceNeFirst, hsourceNeSecond]⟩
    have hsourceEq : source = Q.J₁ ∨ source = Q.J₂ := by
      rw [Q.remainder_eq] at hsourceRem
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hsourceRem
    have hsourceRadius :
        source ∈ SelectedClass D.A S.oppApex1 radius :=
      Q.row_support_subset_frontierClass (by simpa [C] using hsourceC)
    have hsourceA : source ∈ D.A :=
      (mem_selectedClass.mp hsourceRadius).1
    have hsurvivesFirstApex :
        HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
      R.firstApexFullyDeletionRobust.survives source hsourceA
    have hsurvivesFirstBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt W.first W.first_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H W.first_mem_A).mpr hsourceNotShell₁
    have hsurvivesSecondBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt W.second W.second_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H W.second_mem_A).mpr hsourceNotShell₂
    rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        (oppApex1_mem_A S)
        (by simpa [CriticalShellSystem.blockerVertex] using
          (H.blockerVertex ⟨W.first, W.first_mem_A⟩).2)
        (R.actualBlocker_ne_firstApex W.first W.first_mem_A).symm
        hsurvivesFirstApex hsurvivesFirstBlocker with ⟨firstPacket⟩
    rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        (oppApex1_mem_A S)
        (by simpa [CriticalShellSystem.blockerVertex] using
          (H.blockerVertex ⟨W.second, W.second_mem_A⟩).2)
        (R.actualBlocker_ne_firstApex W.second W.second_mem_A).symm
        hsurvivesFirstApex hsurvivesSecondBlocker with ⟨secondPacket⟩
    exact ⟨PairRowActualShellOutcome.commonOmission {
      source := source
      source_eq_remainder := hsourceEq
      source_mem_row := by simpa [C] using hsourceC
      source_mem_radius := hsourceRadius
      source_ne_first := hsourceNeFirst
      source_ne_second := hsourceNeSecond
      source_not_mem_firstShell := hsourceNotShell₁
      source_not_mem_secondShell := hsourceNotShell₂
      location := remainder_mem_capInterior_or_adjacentCaps Q
        (by simpa [C] using hsourceC)
      firstPacket := firstPacket
      secondPacket := secondPacket }⟩
  · have hCsub : C ⊆ I₁ ∪ I₂ := by
      intro z hzC
      by_contra hzUnion
      exact hjoint ⟨z, Finset.mem_sdiff.mpr ⟨hzC, hzUnion⟩⟩
    have hUnionSub : I₁ ∪ I₂ ⊆ C := by
      intro z hz
      rcases Finset.mem_union.mp hz with hzI₁ | hzI₂
      · exact (Finset.mem_inter.mp hzI₁).2
      · exact (Finset.mem_inter.mp hzI₂).2
    have hUnion : I₁ ∪ I₂ = C :=
      Finset.Subset.antisymm hUnionSub hCsub
    have hCfour : C.card = 4 := by simpa [C] using Q.row.support_card
    have hI₁Card : I₁.card = 2 := by
      have hUnionCard : C.card ≤ I₁.card + I₂.card := by
        rw [← hUnion]
        exact Finset.card_union_le I₁ I₂
      have hI₁Pos : 0 < I₁.card :=
        Finset.card_pos.mpr ⟨W.first, hfirstI₁⟩
      omega
    have hI₂Card : I₂.card = 2 := by
      have hUnionCard : C.card ≤ I₁.card + I₂.card := by
        rw [← hUnion]
        exact Finset.card_union_le I₁ I₂
      have hI₂Pos : 0 < I₂.card :=
        Finset.card_pos.mpr ⟨W.second, hsecondI₂⟩
      omega
    have hInterEmpty : I₁ ∩ I₂ = ∅ := by
      apply Finset.card_eq_zero.mp
      have hcardIdentity := Finset.card_union_add_card_inter I₁ I₂
      rw [hUnion, hCfour, hI₁Card, hI₂Card] at hcardIdentity
      omega
    have hDisjoint : Disjoint I₁ I₂ := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact hInterEmpty
    exact ⟨PairRowActualShellOutcome.exactTwoPairCover {
      firstHits_card_eq_two := by simpa [I₁, C] using hI₁Card
      secondHits_card_eq_two := by simpa [I₂, C] using hI₂Card
      hits_disjoint := by simpa [I₁, I₂, C] using hDisjoint
      hits_union_eq_row := by simpa [I₁, I₂, C] using hUnion }⟩

#print axioms nonempty_firstApexTwoRemainderRow
#print axioms remainder_mem_capInterior_or_adjacentCaps
#print axioms not_both_remainders_mem_leftAdjacentCap
#print axioms not_both_remainders_mem_rightAdjacentCap
#print axioms exists_remainder_ne_next
#print axioms nonempty_pairRowActualShellOutcome

end ATailCriticalFiberProducerPushScratch
end Problem97
