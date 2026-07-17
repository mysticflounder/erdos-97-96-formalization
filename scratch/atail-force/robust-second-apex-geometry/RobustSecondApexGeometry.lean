/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionUniformConsumer
import SmallCardParentBypass

/-!
# Scratch: geometry of a deletion-robust physical second apex

Full deletion robustness at a fixed center has two exact radius-level causes.
Either one ambient radius class already contains at least five points, or
deleting a member of an exact four-point class exposes a distinct K4 radius.

At a Moser apex the second alternative gives two support-disjoint selected
four-classes and forces the opposite closed cap to have cardinality at least
six.  The first alternative is compatible with a cap of cardinality five;
there it is the unique exact five-point K4 radius and reorients to the existing
protected swapped unique-five frontier.

Thus the cap/MEC one-hit geometry consumes the robust endpoint through cap
five, but leaves two explicit possibilities once the opposite cap has at
least six points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustSecondApexGeometryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDeletedApexOmissionProducerScratch
open ATailFullGeometryProducerScratch
open ATailRF1F3OutcomeReductionScratch
open ATailRReciprocalSwapReductionScratch
open ATailRSmallCardParentBypassScratch
open ATailRTwoOffLiveHandlerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exact radius-level alternatives forced by deletion robustness at the
physical second Moser apex. -/
inductive SecondApexDeletionRobustRadiusClassification
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop
  | fivePointRadius
      (radius : ℝ)
      (radius_pos : 0 < radius)
      (class_card_ge_five :
        5 ≤ (SelectedClass D.A S.oppApex2 radius).card) :
      SecondApexDeletionRobustRadiusClassification D S
  | twoDistinctRadii
      (radius otherRadius : ℝ)
      (radius_pos : 0 < radius)
      (otherRadius_pos : 0 < otherRadius)
      (first_class_card_ge_four :
        4 ≤ (SelectedClass D.A S.oppApex2 radius).card)
      (second_class_card_ge_four :
        4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card)
      (radii_ne : otherRadius ≠ radius)
      (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
      (firstRow_radius : firstRow.radius = radius)
      (secondRow_radius : secondRow.radius = otherRadius)
      (supports_disjoint : Disjoint firstRow.support secondRow.support)
      (oppCap2_card_ge_six : 6 ≤ S.oppCap2.card) :
      SecondApexDeletionRobustRadiusClassification D S

/-- Full deletion robustness is equivalent, at the level needed here, to a
five-point radius or to a second radius exposed after deleting a member of an
exact four-point radius class. -/
theorem fullyDeletionRobustAt_secondApex_radiusClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (R : FullyDeletionRobustAt D S.oppApex2) :
    SecondApexDeletionRobustRadiusClassification D S := by
  obtain ⟨radius, hradius, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S))
  by_cases hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 radius).card
  · exact SecondApexDeletionRobustRadiusClassification.fivePointRadius
      radius hradius hfive
  · have hcard :
        (SelectedClass D.A S.oppApex2 radius).card = 4 := by
      omega
    have hnonempty :
        (SelectedClass D.A S.oppApex2 radius).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨z, hzClass⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    obtain ⟨otherRadius, hotherRadius, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (R.survives z hzA)
    have hfourOther :
        4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans
        (Finset.card_le_card (Finset.erase_subset _ _))
    have hradii : otherRadius ≠ radius := by
      intro hsame
      subst otherRadius
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hzClass, hcard] at hfourErase
      omega
    obtain ⟨firstRow, hfirstRadius⟩ :=
      exists_selectedFourClass_at_radius_of_four_le_selectedClass
        hradius hfour
    obtain ⟨secondRow, hsecondRadius⟩ :=
      exists_selectedFourClass_at_radius_of_four_le_selectedClass
        hotherRadius hfourOther
    have hdisjoint : Disjoint firstRow.support secondRow.support := by
      rw [Finset.disjoint_left]
      intro x hxFirst hxSecond
      apply hradii
      calc
        otherRadius = secondRow.radius := hsecondRadius.symm
        _ = dist S.oppApex2 x :=
          (secondRow.support_eq_radius x hxSecond).symm
        _ = firstRow.radius := firstRow.support_eq_radius x hxFirst
        _ = radius := hfirstRadius
    have hcenter :
        S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
      oppApex2_eq_oppositeVertex_oppIndex2 S
    have hcap : 6 ≤ (S.capByIndex S.oppIndex2).card :=
      oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
        S D.convex S.oppIndex2 hotherRadius hradius
        (by simpa only [← hcenter] using hfourOther)
        (by simpa only [← hcenter] using hfour)
        hradii
    exact SecondApexDeletionRobustRadiusClassification.twoDistinctRadii
      radius otherRadius hradius hotherRadius hfour hfourOther hradii
      firstRow secondRow hfirstRadius hsecondRadius hdisjoint
      (by simpa only [capByIndex_oppIndex2_eq_oppCap2] using hcap)

/-- Either radius alternative is sufficient for full deletion robustness. -/
theorem fullyDeletionRobustAt_secondApex_of_radiusClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (C : SecondApexDeletionRobustRadiusClassification D S) :
    FullyDeletionRobustAt D S.oppApex2 := by
  rcases C with
    ⟨radius, hradius, hfive⟩ |
      ⟨_radius, _otherRadius, _hradius, _hotherRadius,
        _hfour, _hfourOther, _hradii, firstRow, secondRow,
        _hfirstRadius, _hsecondRadius, hdisjoint, _hcapSix⟩
  · exact fullyDeletionRobustAt_of_five_le_selectedClass hradius hfive
  · exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
      firstRow secondRow hdisjoint

/-- Exact radius-level normal form for full deletion robustness at the
physical second apex. -/
theorem fullyDeletionRobustAt_secondApex_iff_radiusClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} :
    FullyDeletionRobustAt D S.oppApex2 ↔
      SecondApexDeletionRobustRadiusClassification D S :=
  ⟨fullyDeletionRobustAt_secondApex_radiusClassification,
    fullyDeletionRobustAt_secondApex_of_radiusClassification⟩

/-- Deletion robustness is impossible at the apex opposite a four-point
closed cap. -/
theorem not_fullyDeletionRobustAt_secondApex_of_oppCap2_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hcap : S.oppCap2.card = 4) :
    ¬ FullyDeletionRobustAt D S.oppApex2 := by
  intro R
  have hcapByIndex : (S.capByIndex S.oppIndex2).card = 4 := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hcap
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  rcases fullyDeletionRobustAt_secondApex_radiusClassification R with
    ⟨radius, hradius, hfive⟩ |
      ⟨_radius, _otherRadius, _hradius, _hotherRadius,
        _hfour, _hfourOther, _hradii, _firstRow, _secondRow,
        _hfirstRadius, _hsecondRadius, _hdisjoint, hcapSix⟩
  · have hle :
        (SelectedClass D.A S.oppApex2 radius).card ≤ 4 := by
      simpa only [← hcenter] using
        oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
          S D.convex S.oppIndex2 hcapByIndex hradius
    omega
  · omega

/-- Exact radius profile left by deletion robustness when the opposite cap
has cardinality five. -/
structure SecondApexUniqueFiveRadius
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  radius : ℝ
  radius_pos : 0 < radius
  class_card_eq_five :
    (SelectedClass D.A S.oppApex2 radius).card = 5
  unique_K4_radius :
    ∀ otherRadius : ℝ, 0 < otherRadius →
      4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card →
      otherRadius = radius

/-- On a five-point opposite cap, full deletion robustness has exactly one
possible form: the unique K4 radius is an ambient five-point class. -/
theorem nonempty_secondApexUniqueFiveRadius_of_fullyDeletionRobustAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (R : FullyDeletionRobustAt D S.oppApex2)
    (hcap : S.oppCap2.card = 5) :
    Nonempty (SecondApexUniqueFiveRadius D S) := by
  have hcapByIndex : (S.capByIndex S.oppIndex2).card = 5 := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hcap
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  rcases fullyDeletionRobustAt_secondApex_radiusClassification R with
    ⟨radius, hradius, hfive⟩ |
      ⟨_radius, _otherRadius, _hradius, _hotherRadius,
        _hfour, _hfourOther, _hradii, _firstRow, _secondRow,
        _hfirstRadius, _hsecondRadius, _hdisjoint, hcapSix⟩
  · have hle :
        (SelectedClass D.A S.oppApex2 radius).card ≤ 5 := by
      simpa only [← hcenter] using
        oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
          S D.convex S.oppIndex2 hcapByIndex hradius
    have hcard :
        (SelectedClass D.A S.oppApex2 radius).card = 5 := by
      omega
    refine ⟨{
      radius := radius
      radius_pos := hradius
      class_card_eq_five := hcard
      unique_K4_radius := ?_ }⟩
    intro otherRadius hotherRadius hfourOther
    have hfourOther' :
        4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2) otherRadius).card := by
      simpa only [← hcenter] using hfourOther
    have hfour' :
        4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2) radius).card := by
      simpa only [← hcenter] using (show
        4 ≤ (SelectedClass D.A S.oppApex2 radius).card by omega)
    exact oppositeVertex_K4_radius_unique_of_cap_card_eq_five
      S D.convex S.oppIndex2 hcapByIndex
      hotherRadius hradius hfourOther' hfour'
  · omega

private theorem frontier_pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with
    ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

/-- A protected swapped exact-four frontier is incompatible with full
deletion robustness at its physical first apex. -/
theorem false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : FullyDeletionRobustAt D S.oppApex2)
    (T : SwappedFirstApexUniqueFourFrontier D S H) :
    False := by
  have hsurvivesPhysical :=
    R.survives T.frontier.pair.q T.frontier.pair.q_mem_A
  have hsurvivesSwapped :
      HasNEquidistantPointsAt 4
        (D.A.erase T.frontier.pair.q) T.packet.oppApex1 := by
    simpa only [T.firstApex_eq] using hsurvivesPhysical
  obtain ⟨otherRadius, hotherRadius, hfourErase⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      hsurvivesSwapped
  rw [selectedClass_erase_eq] at hfourErase
  have hfourAmbient :
      4 ≤ (SelectedClass D.A T.packet.oppApex1 otherRadius).card :=
    hfourErase.trans
      (Finset.card_le_card (Finset.erase_subset _ _))
  have hradius : otherRadius = T.radius :=
    T.firstClass_unique_radius otherRadius hotherRadius hfourAmbient
  subst otherRadius
  rw [Finset.card_erase_of_mem
      (frontier_pair_q_mem_firstClass T.frontier),
    T.firstClass_card_eq_four] at hfourErase
  omega

/-- At a five-point physical second cap, the robust endpoint is not new: it
reorients to the existing protected swapped unique-five frontier. -/
theorem fullyDeletionRobustAt_secondApex_reorients_to_swappedUniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (R : FullyDeletionRobustAt D S.oppApex2)
    (hcap : S.oppCap2.card = 5) :
    Nonempty (SwappedFirstApexUniqueFiveFrontier D S H) := by
  have hcapByIndex : (S.capByIndex S.oppIndex2).card = 5 := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hcap
  rcases secondSmallCap_reorients_to_swappedUnique S H
      (Or.inr hcapByIndex) with hfour | hfive
  · rcases hfour with ⟨T⟩
    exact False.elim
      (false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour R T)
  · exact hfive

#print axioms fullyDeletionRobustAt_secondApex_radiusClassification
#print axioms fullyDeletionRobustAt_secondApex_of_radiusClassification
#print axioms fullyDeletionRobustAt_secondApex_iff_radiusClassification
#print axioms not_fullyDeletionRobustAt_secondApex_of_oppCap2_card_eq_four
#print axioms nonempty_secondApexUniqueFiveRadius_of_fullyDeletionRobustAt
#print axioms false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour
#print axioms fullyDeletionRobustAt_secondApex_reorients_to_swappedUniqueFive

end ATailRobustSecondApexGeometryScratch
end Problem97
