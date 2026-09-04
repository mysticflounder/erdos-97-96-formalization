/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTerminalSplitV2

/-!
# Strict-interior normal form for the card-at-least-thirteen branch

The large-interior arm is used only on the union of the two selected
second-apex rows.  A three-point trace of an actual blocker on that union
contains two points from one selected radius class; the common-center
localization then rules the trace out.  Removing the two blocker traces from
the five-point interior union therefore leaves a strict-interior uncovered
point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCapInteriorEquidistant
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourRobustCapExpansion
open ATailSevenGoodSourceDistinctBlockerCommonDeletion
open ATailThreeCenterCommonDeletion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

/- A finite-cardinality extraction used by the source adapter below. -/
theorem exists_mem_of_card_ge_five_of_two_traces_card_le_two
    {α : Type*} [DecidableEq α]
    {I C₀ C₁ : Finset α}
    (hI : 5 ≤ I.card)
    (hC₀ : (C₀ ∩ I).card ≤ 2)
    (hC₁ : (C₁ ∩ I).card ≤ 2) :
    ∃ z ∈ I, z ∉ C₀ ∧ z ∉ C₁ := by
  by_contra h
  have hcover : I ⊆ C₀ ∪ C₁ := by
    intro z hz
    by_contra hz'
    have hz₀ : z ∉ C₀ := by
      intro hz₀
      exact hz' (Finset.mem_union_left C₁ hz₀)
    have hz₁ : z ∉ C₁ := by
      intro hz₁
      exact hz' (Finset.mem_union_right C₀ hz₁)
    exact h ⟨z, hz, hz₀, hz₁⟩
  have hsub : I ⊆ (C₀ ∩ I) ∪ (C₁ ∩ I) := by
    intro z hz
    rcases Finset.mem_union.mp (hcover hz) with hz₀ | hz₁
    · exact Finset.mem_union_left (C₁ ∩ I)
        (Finset.mem_inter.mpr ⟨hz₀, hz⟩)
    · exact Finset.mem_union_right (C₀ ∩ I)
        (Finset.mem_inter.mpr ⟨hz₁, hz⟩)
  have hcard : I.card ≤ (C₀ ∩ I).card + (C₁ ∩ I).card := by
    calc
      I.card ≤ ((C₀ ∩ I) ∪ (C₁ ∩ I)).card := Finset.card_le_card hsub
      _ ≤ (C₀ ∩ I).card + (C₁ ∩ I).card := Finset.card_union_le _ _
  omega

private theorem false_of_shell_sameClass_pair_on_interior_union
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source center : ℝ²}
    (K : SelectedFourClass D.A S.oppApex2)
    (C : CriticalFourShell D.A source center)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    {x y z : ℝ²}
    (hxC : x ∈ C.support) (hyC : y ∈ C.support)
    (hzC : z ∈ C.support)
    (hxI : x ∈ S.capInteriorByIndex S.oppIndex2)
    (hyI : y ∈ S.capInteriorByIndex S.oppIndex2)
    (hzI : z ∈ S.capInteriorByIndex S.oppIndex2)
    (hxK : x ∈ K.support) (hyK : y ∈ K.support)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    False := by
  have hcenterEq : dist center x = dist center y :=
    (C.support_eq_radius x hxC).trans (C.support_eq_radius y hyC).symm
  have hphysicalEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (K.support_eq_radius x hxK).trans (K.support_eq_radius y hyK).symm
  have hcenterI : center ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe hxI hyI hxy hcenterEq hphysicalEq
  have hcenterZ : dist center x = dist center z :=
    (C.support_eq_radius x hxC).trans (C.support_eq_radius z hzC).symm
  have hcenterX : center ≠ x := fun h => C.center_not_mem_support (h ▸ hxC)
  have hcenterY : center ≠ y := fun h => C.center_not_mem_support (h ▸ hyC)
  have hcenterZne : center ≠ z := fun h => C.center_not_mem_support (h ▸ hzC)
  exact false_of_capInterior_center_equidistant_three_points
    hcenterI hxI hyI hzI hxy hxz hyz hcenterX hcenterY hcenterZne
    hcenterEq hcenterZ

private theorem actualShell_inter_selectedInteriorUnion_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source center : ℝ²}
    (K₀ K₁ : SelectedFourClass D.A S.oppApex2)
    (C : CriticalFourShell D.A source center)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2) :
    (C.support ∩
      ((K₀.support ∩ S.oppInterior2) ∪
        (K₁.support ∩ S.oppInterior2))).card ≤ 2 := by
  by_contra hnot
  have hthree : 3 ≤
      (C.support ∩
        ((K₀.support ∩ S.oppInterior2) ∪
          (K₁.support ∩ S.oppInterior2))).card := by
    omega
  rcases Finset.two_lt_card.mp hthree with
    ⟨x, hx, y, hy, z, hz, hxy, hxz, hyz⟩
  have hxC := (Finset.mem_inter.mp hx).1
  have hxI := (Finset.mem_inter.mp hx).2
  have hyC := (Finset.mem_inter.mp hy).1
  have hyI := (Finset.mem_inter.mp hy).2
  have hzC := (Finset.mem_inter.mp hz).1
  have hzI := (Finset.mem_inter.mp hz).2
  have class_mem (w : ℝ²)
      (hw : w ∈ (K₀.support ∩ S.oppInterior2) ∪
        (K₁.support ∩ S.oppInterior2)) :
      (w ∈ K₀.support ∧ w ∈ S.oppInterior2) ∨
        (w ∈ K₁.support ∧ w ∈ S.oppInterior2) := by
    rcases Finset.mem_union.mp hw with hw | hw
    · exact Or.inl (Finset.mem_inter.mp hw)
    · exact Or.inr (Finset.mem_inter.mp hw)
  rcases class_mem x hxI with ⟨hxK₀, hxI'⟩ | ⟨hxK₁, hxI'⟩ <;>
    rcases class_mem y hyI with ⟨hyK₀, hyI'⟩ | ⟨hyK₁, hyI'⟩ <;>
      rcases class_mem z hzI with ⟨hzK₀, hzI'⟩ | ⟨hzK₁, hzI'⟩
  · exact false_of_shell_sameClass_pair_on_interior_union K₀ C
      hcenterA hcenterNe hxC hyC hzC hxI' hyI' hzI' hxK₀ hyK₀ hxy hxz hyz
  · exact false_of_shell_sameClass_pair_on_interior_union K₀ C
      hcenterA hcenterNe hxC hyC hzC hxI' hyI' hzI' hxK₀ hyK₀ hxy hxz hyz
  · exact false_of_shell_sameClass_pair_on_interior_union K₀ C
      hcenterA hcenterNe hxC hzC hyC hxI' hzI' hyI' hxK₀ hzK₀ hxz hxy hyz.symm
  · exact false_of_shell_sameClass_pair_on_interior_union K₁ C
      hcenterA hcenterNe hyC hzC hxC hyI' hzI' hxI' hyK₁ hzK₁ hyz hxy.symm hxz.symm
  · exact false_of_shell_sameClass_pair_on_interior_union K₀ C
      hcenterA hcenterNe hyC hzC hxC hyI' hzI' hxI' hyK₀ hzK₀ hyz hxy.symm hxz.symm
  · exact false_of_shell_sameClass_pair_on_interior_union K₁ C
      hcenterA hcenterNe hxC hzC hyC hxI' hzI' hyI' hxK₁ hzK₁ hxz hxy hyz.symm
  · exact false_of_shell_sameClass_pair_on_interior_union K₁ C
      hcenterA hcenterNe hxC hyC hzC hxI' hyI' hzI' hxK₁ hyK₁ hxy hxz hyz
  · exact false_of_shell_sameClass_pair_on_interior_union K₁ C
      hcenterA hcenterNe hxC hyC hzC hxI' hyI' hzI' hxK₁ hyK₁ hxy hxz hyz

/-- The existing uncovered packet, augmented with strict-interior membership
of its chosen point. -/
structure CardGeThirteenUncoveredStrictInteriorPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type where
  base : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow
  z_mem_oppInterior2 : base.z ∈ S.oppInterior2

theorem nonempty_cardGeThirteenUncoveredStrictInteriorPacket_or_exactAdjacentCapGrid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty (CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow) ∨
      S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        firstRow.radius secondRow.radius := by
  classical
  have hsplit :=
    two_full_secondApex_classes_largeInterior_or_grid_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
      R hcard surface rho otherRadius firstRow secondRow hradii hnoFive
        hfirstRadius hsecondRadius hdisjoint
  rcases hsplit with hlarge | hgrid
  · obtain ⟨W⟩ := exists_good_sources_distinctBlockers_commonDeletion R hcard
    let C₀ :=
      ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2).toCriticalFourShell
    let C₁ :=
      ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2).toCriticalFourShell
    let I := (firstRow.support ∩ S.oppInterior2) ∪
      (secondRow.support ∩ S.oppInterior2)
    have hI : 5 ≤ I.card := by
      simpa [I] using hlarge
    have hcenter₀A :
        (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ∈ D.A := by
      simpa [C₀] using
        (Finset.mem_erase.mp C₀.center_mem).2
    have hcenter₁A :
        (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ∈ D.A := by
      simpa [C₁] using
        (Finset.mem_erase.mp C₁.center_mem).2
    have hcenter₀Ne :
        (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ≠
          S.oppApex2 := by
      simpa [C₀] using
        surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) W.source₁.1 W.source₁.2
    have hcenter₁Ne :
        (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ≠
          S.oppApex2 := by
      simpa [C₁] using
        surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) W.source₂.1 W.source₂.2
    have hC₀ : (C₀.support ∩ I).card ≤ 2 := by
      simpa [I] using
        actualShell_inter_selectedInteriorUnion_card_le_two firstRow secondRow C₀
          hcenter₀A hcenter₀Ne
    have hC₁ : (C₁.support ∩ I).card ≤ 2 := by
      simpa [I] using
        actualShell_inter_selectedInteriorUnion_card_le_two firstRow secondRow C₁
          hcenter₁A hcenter₁Ne
    obtain ⟨z, hzI, hzC₀, hzC₁⟩ :=
      exists_mem_of_card_ge_five_of_two_traces_card_le_two hI hC₀ hC₁
    have hzOpp : z ∈ S.oppInterior2 := by
      rcases Finset.mem_union.mp hzI with hz | hz
      · exact (Finset.mem_inter.mp hz).2
      · exact (Finset.mem_inter.mp hz).2
    have hzRows : z ∈ firstRow.support ∪ secondRow.support := by
      rcases Finset.mem_union.mp hzI with hz | hz
      · exact Finset.mem_union_left _ (Finset.mem_inter.mp hz).1
      · exact Finset.mem_union_right _ (Finset.mem_inter.mp hz).1
    have hzA : z ∈ D.A := by
      rcases Finset.mem_union.mp hzRows with hz | hz
      · exact firstRow.support_subset_A hz
      · exact secondRow.support_subset_A hz
    have hrow₁ : W.row₁.support = C₀.support := by
      simpa [C₀] using
        (lateFirstApexSystem R).selectedFourClass_support_eq_shell
          W.source₁.1 W.source₁.2 W.row₁
    have hrow₂ : W.row₂.support = C₁.support := by
      simpa [C₁] using
        (lateFirstApexSystem R).selectedFourClass_support_eq_shell
          W.source₂.1 W.source₂.2 W.row₂
    have hzRow₁ : z ∉ W.row₁.support := by
      rw [hrow₁]
      exact hzC₀
    have hzRow₂ : z ∉ W.row₂.support := by
      rw [hrow₂]
      exact hzC₁
    have hcenter₂A : S.oppApex2 ∈ D.A := by
      simpa only [oppositeVertexByIndex_oppIndex2] using
        S.oppositeVertexByIndex_mem S.oppIndex2
    rcases Finset.mem_union.mp hzRows with hzFirst | hzSecond
    · have hzSecondNot : z ∉ secondRow.support := by
        intro hzSecond
        exact (Finset.disjoint_left.mp hdisjoint) hzFirst hzSecond
      have hthirdSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2 :=
        selectedFourClass_survives_erase_of_not_mem secondRow hzSecondNot
      have hexactRows :=
        nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
          hzA hcenter₀A hcenter₁A hcenter₂A W.blockers_ne
          hcenter₀Ne hcenter₁Ne W.row₁ W.row₂ secondRow hzRow₁ hzRow₂ hzSecondNot
      exact Or.inl ⟨{
        base := {
          W := W
          z := z
          z_mem_rows := hzRows
          z_not_mem_row₁ := hzRow₁
          z_not_mem_row₂ := hzRow₂
          thirdRow := secondRow
          thirdRow_named := Or.inl ⟨hzFirst, rfl⟩
          thirdRow_survives := hthirdSurvives
          thirdRow_omits := hzSecondNot
          exactRows := hexactRows }
        z_mem_oppInterior2 := by
          exact hzOpp }⟩
    · have hzFirstNot : z ∉ firstRow.support := by
        intro hzFirst
        exact (Finset.disjoint_left.mp hdisjoint) hzFirst hzSecond
      have hthirdSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2 :=
        selectedFourClass_survives_erase_of_not_mem firstRow hzFirstNot
      have hexactRows :=
        nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
          hzA hcenter₀A hcenter₁A hcenter₂A W.blockers_ne
          hcenter₀Ne hcenter₁Ne W.row₁ W.row₂ firstRow hzRow₁ hzRow₂ hzFirstNot
      exact Or.inl ⟨{
        base := {
          W := W
          z := z
          z_mem_rows := hzRows
          z_not_mem_row₁ := hzRow₁
          z_not_mem_row₂ := hzRow₂
          thirdRow := firstRow
          thirdRow_named := Or.inr ⟨hzSecond, rfl⟩
          thirdRow_survives := hthirdSurvives
          thirdRow_omits := hzFirstNot
          exactRows := hexactRows }
        z_mem_oppInterior2 := by
          exact hzOpp }⟩
  · exact Or.inr hgrid

end ATailFrontierLiveClosure
end Problem97
