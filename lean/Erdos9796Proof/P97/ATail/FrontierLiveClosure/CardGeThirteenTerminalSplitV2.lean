/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTwoRadiusSplit
import Erdos9796Proof.P97.ATail.SevenGoodSourceDistinctBlockerCommonDeletion
import Erdos9796Proof.P97.ATail.TwoFourClassesTwoFourShells
import Erdos9796Proof.P97.ATail.TwoRadiusDoublePartitionLargeInterior
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber

/-!
# Card-at-least-thirteen terminal split

This module preserves the two-radius card-at-least-thirteen branch.  Its
large-interior arm either closes by the two-shell partition contradiction or
retains the uncovered point as a typed three-center deletion packet.  The
adjacent-grid arm is returned unchanged.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourRobustCapExpansion
open ATailSevenGoodSourceDistinctBlockerCommonDeletion
open ATailThreeCenterCommonDeletion
open ATailTwoFourClassesTwoFourShells
open ATailTwoRadiusDoublePartitionLargeInterior
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open TwoSourceExactCollisionRowsTerminal

attribute [local instance] Classical.propDecidable

/-- The uncovered arm retains the two-radius rows, the good-source witness,
the uncovered carrier point, and the exact three-center deletion rows. -/
structure CardGeThirteenUncoveredThreeCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type where
  W : GoodSourceDistinctBlockerCommonDeletion R
  z : ℝ²
  z_mem_rows : z ∈ firstRow.support ∪ secondRow.support
  z_not_mem_row₁ : z ∉ W.row₁.support
  z_not_mem_row₂ : z ∉ W.row₂.support
  thirdRow : SelectedFourClass D.A S.oppApex2
  thirdRow_named :
    (z ∈ firstRow.support ∧ thirdRow = secondRow) ∨
    (z ∈ secondRow.support ∧ thirdRow = firstRow)
  thirdRow_survives :
    HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2
  thirdRow_omits : z ∉ thirdRow.support
  exactRows :
    Nonempty (ThreeCenterCommonDeletionExactRows D z
      ((lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2)
      ((lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2)
      S.oppApex2 W.row₁.support W.row₂.support thirdRow.support)

private noncomputable def normalized_row₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R) :
    SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2) :=
  ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2
    |>.toCriticalFourShell).toSelectedFourClass

private noncomputable def normalized_row₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R) :
    SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2) :=
  ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2
    |>.toCriticalFourShell).toSelectedFourClass

private theorem normalized_row₁_omits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R) :
    W.deleted ∉ (normalized_row₁ R W).support := by
  simpa [normalized_row₁] using
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) W.source₁.2).mp W.source₁_survives

private theorem normalized_row₂_omits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R) :
    W.deleted ∉ (normalized_row₂ R W).support := by
  simpa [normalized_row₂] using
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) W.source₂.2).mp W.source₂_survives

private noncomputable def normalized_witness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R) :
    GoodSourceDistinctBlockerCommonDeletion R :=
  { source₁ := W.source₁
    source₂ := W.source₂
    source₁_mem_good := W.source₁_mem_good
    source₂_mem_good := W.source₂_mem_good
    sources_ne := W.sources_ne
    blockers_ne := W.blockers_ne
    deleted := W.deleted
    deleted_is_frontier := W.deleted_is_frontier
    source₁_survives := W.source₁_survives
    source₂_survives := W.source₂_survives
    row₁ := normalized_row₁ R W
    row₂ := normalized_row₂ R W
    deleted_not_mem_row₁ := normalized_row₁_omits R W
    deleted_not_mem_row₂ := normalized_row₂_omits R W }

/-- The card-at-least-thirteen two-radius branch retains either an exact
three-center deletion packet or the adjacent-cap grid. -/
theorem nonempty_cardGeThirteenUncoveredThreeCenterPacket_or_exactAdjacentCapGrid
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
    Nonempty (CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow) ∨
      S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        firstRow.radius secondRow.radius := by
  classical
  have hsplit :=
    two_full_secondApex_classes_largeInterior_or_grid_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
      R hcard surface rho otherRadius firstRow secondRow hradii hnoFive
        hfirstRadius hsecondRadius hdisjoint
  rcases hsplit with hlarge | hgrid
  · obtain ⟨W₀⟩ :=
      exists_good_sources_distinctBlockers_commonDeletion R hcard
    let W := normalized_witness R W₀
    have hfirstSupport :
        firstRow.support = SelectedClass D.A S.oppApex2 rho := by
      simpa only [hfirstRadius] using
        (selectedFourClass_support_eq_selectedClass_of_card_lt_five firstRow
          (hnoFive firstRow.radius firstRow.radius_pos))
    have hsecondSupport :
        secondRow.support = SelectedClass D.A S.oppApex2 otherRadius := by
      simpa only [hsecondRadius] using
        (selectedFourClass_support_eq_selectedClass_of_card_lt_five secondRow
          (hnoFive secondRow.radius secondRow.radius_pos))
    have hC₀ρ : (W.row₁.support ∩ firstRow.support).card ≤ 2 := by
      rw [hfirstSupport]
      simpa [W, normalized_witness, normalized_row₁] using
        (actualLateRow_secondClass_card_le_two R surface W₀.source₁)
    have hC₁ρ : (W.row₂.support ∩ firstRow.support).card ≤ 2 := by
      rw [hfirstSupport]
      simpa [W, normalized_witness, normalized_row₂] using
        (actualLateRow_secondClass_card_le_two R surface W₀.source₂)
    have hC₀σ : (W.row₁.support ∩ secondRow.support).card ≤ 2 := by
      rw [hsecondSupport]
      simpa [W, normalized_witness, normalized_row₁] using
        (actualLateRow_secondClass_card_le_two R surface W₀.source₁)
    have hC₁σ : (W.row₂.support ∩ secondRow.support).card ≤ 2 := by
      rw [hsecondSupport]
      simpa [W, normalized_witness, normalized_row₂] using
        (actualLateRow_secondClass_card_le_two R surface W₀.source₂)
    have hpartition :=
      two_four_classes_two_four_shells_uncovered_or_doublePartition
        firstRow.support secondRow.support W.row₁.support W.row₂.support
        firstRow.support_card secondRow.support_card hdisjoint
        W.row₁.support_card W.row₂.support_card hC₀ρ hC₁ρ hC₀σ hC₁σ
    rcases hpartition with ⟨z, hzRows, hzC₀, hzC₁⟩ | hdouble
    · have hzA : z ∈ D.A := by
        rcases Finset.mem_union.mp hzRows with hz | hz
        · exact firstRow.support_subset_A hz
        · exact secondRow.support_subset_A hz
      have hcenter₀A :
          (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ∈ D.A :=
        (Finset.mem_erase.mp
          ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2
            |>.toCriticalFourShell.center_mem)).2
      have hcenter₁A :
          (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ∈ D.A :=
        (Finset.mem_erase.mp
          ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2
            |>.toCriticalFourShell.center_mem)).2
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
            (surface.secondApex_robust.centerAt_ne
              (lateFirstApexSystem R) W.source₁.1 W.source₁.2)
            (surface.secondApex_robust.centerAt_ne
              (lateFirstApexSystem R) W.source₂.1 W.source₂.2)
            W.row₁ W.row₂ secondRow hzC₀ hzC₁ hzSecondNot
        exact Or.inl ⟨{
          W := W
          z := z
          z_mem_rows := hzRows
          z_not_mem_row₁ := hzC₀
          z_not_mem_row₂ := hzC₁
          thirdRow := secondRow
          thirdRow_named := Or.inl ⟨hzFirst, rfl⟩
          thirdRow_survives := hthirdSurvives
          thirdRow_omits := hzSecondNot
          exactRows := hexactRows }⟩
      · have hzFirstNot : z ∉ firstRow.support := by
          intro hzFirst
          exact (Finset.disjoint_left.mp hdisjoint) hzFirst hzSecond
        have hthirdSurvives :
            HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2 :=
          selectedFourClass_survives_erase_of_not_mem firstRow hzFirstNot
        have hexactRows :=
          nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
            hzA hcenter₀A hcenter₁A hcenter₂A W.blockers_ne
            (surface.secondApex_robust.centerAt_ne
              (lateFirstApexSystem R) W.source₁.1 W.source₁.2)
            (surface.secondApex_robust.centerAt_ne
              (lateFirstApexSystem R) W.source₂.1 W.source₂.2)
            W.row₁ W.row₂ firstRow hzC₀ hzC₁ hzFirstNot
        exact Or.inl ⟨{
          W := W
          z := z
          z_mem_rows := hzRows
          z_not_mem_row₁ := hzC₀
          z_not_mem_row₂ := hzC₁
          thirdRow := firstRow
          thirdRow_named := Or.inr ⟨hzSecond, rfl⟩
          thirdRow_survives := hthirdSurvives
          thirdRow_omits := hzFirstNot
          exactRows := hexactRows }⟩
    · have hlarge' :
          5 ≤ ((firstRow.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
            (secondRow.support ∩ S.capInteriorByIndex S.oppIndex2)).card := by
        simpa only [SurplusCapPacket.oppInterior2] using hlarge
      have hcenter₀A :
          (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ∈ D.A :=
        (Finset.mem_erase.mp
          ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2
            |>.toCriticalFourShell.center_mem)).2
      have hcenter₁A :
          (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ∈ D.A :=
        (Finset.mem_erase.mp
          ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2
            |>.toCriticalFourShell.center_mem)).2
      exact (false_of_twoRadius_doublePartition_largeInterior
        firstRow secondRow
        ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2
          |>.toCriticalFourShell)
        ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2
          |>.toCriticalFourShell)
        hdisjoint hcenter₀A hcenter₁A
        (surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) W.source₁.1 W.source₁.2)
        (surface.secondApex_robust.centerAt_ne
          (lateFirstApexSystem R) W.source₂.1 W.source₂.2)
        hdouble hlarge').elim
  · exact Or.inr hgrid

#print axioms nonempty_cardGeThirteenUncoveredThreeCenterPacket_or_exactAdjacentCapGrid

end ATailFrontierLiveClosure
end Problem97
