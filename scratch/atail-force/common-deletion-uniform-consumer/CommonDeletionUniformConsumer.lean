/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RTwoOffLiveHandler
import SurvivalCoverBankMatch

/-!
# Scratch: uniform consumer for a physical-second-apex common deletion

The generic common-deletion expansion can cycle because both row centers are
arbitrary.  Once the second center is the physical second apex, no iteration is
needed.  Choose a point of the second exact row outside the first row.  Deleting
that point preserves the first row.  At the second center, the prescribed
deletion split gives either:

* a successor row, whose radius comparison with the retained second row makes
  the second center fully deletion-robust; or
* a prescribed critical shell at the physical second apex, which reorients to
  the existing swapped first-apex unique-four frontier.

This file retains the exact successor shape before projecting it to deletion
robustness.  It does not claim that either final branch is already false.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonDeletionUniformConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducerScratch
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SecondApexRadiusTransportScratch
open ATailRReciprocalSwapReductionScratch
open ATailRTwoOffLiveHandlerScratch
open ATailSurvivalCoverBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- The first exact deleted row as an ambient selected four-class. -/
def CommonDeletionTwoCenterPacket.firstRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₁ where
  support := C.B₁
  support_subset_A := by
    intro z hz
    have hz' := C.row₁.subset hz
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz').2).2
  support_card := C.B₁_card
  radius := C.row₁.radius
  radius_pos := C.row₁.radius_pos
  support_eq_radius := C.row₁.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₁.subset hz)).1 rfl

/-- A successor chosen from the old second row and outside the old first row.
The retained source membership is exactly what makes equal-radius succession
produce a fifth point at the second center. -/
structure SecondRowCommonDeletionSuccessor
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) : Type where
  source : ℝ²
  source_mem_secondRow : source ∈ C.B₂
  source_not_mem_firstRow : source ∉ C.B₁
  packet : CommonDeletionTwoCenterPacket D H source center₁ center₂
  secondCenterShape : SuccessorSecondApexShape C packet

/-- Refine a successor from the retained second row by comparing its new
second-center radius with the old one. -/
def SecondRowCommonDeletionSuccessor.ofPacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ source : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂}
    (hsourceSecond : source ∈ C.B₂)
    (hsourceFirst : source ∉ C.B₁)
    (G : CommonDeletionTwoCenterPacket D H source center₁ center₂) :
    SecondRowCommonDeletionSuccessor C where
  source := source
  source_mem_secondRow := hsourceSecond
  source_not_mem_firstRow := hsourceFirst
  packet := G
  secondCenterShape := by
    let K := CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
    let L := CommonDeletionTwoCenterPacket.secondRowSelectedFourClass G
    by_cases hradius : G.row₂.radius = C.row₂.radius
    · apply SuccessorSecondApexShape.sameRadiusOverflow hradius
      apply five_le_selectedClass_of_selectedFourClass_and_extra
        L (by
          intro z hz
          exact L.support_subset_A hz)
        (Finset.mem_erase.mp
          (Finset.mem_erase.mp (C.row₂.subset hsourceSecond)).2).2
        (by simpa [L] using G.row₂.q_not_mem)
      calc
        dist center₂ source = C.row₂.radius :=
          C.row₂.same_radius source hsourceSecond
        _ = G.row₂.radius := hradius.symm
    · apply SuccessorSecondApexShape.alternateRadius hradius
      rcases sameCenter_radius_eq_or_support_disjoint K L with
        heq | hdisjoint
      · exact False.elim (hradius heq.symm)
      · simpa [K, L] using hdisjoint

/-- Either exact successor shape makes the second center survive every
carrier deletion. -/
theorem SecondRowCommonDeletionSuccessor.secondCenterFullyDeletionRobust
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂}
    (N : SecondRowCommonDeletionSuccessor C) :
    FullyDeletionRobustAt D center₂ := by
  rcases N.secondCenterShape with
    ⟨_radiusEq, hfive⟩ | ⟨_radiusNe, hdisjoint⟩
  · exact fullyDeletionRobustAt_of_five_le_selectedClass
      N.packet.row₂.radius_pos hfive
  · let K := CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
    let L := CommonDeletionTwoCenterPacket.secondRowSelectedFourClass N.packet
    apply fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses K L
    simpa [K, L] using hdisjoint

/-- One point of the second row is absent from the first row.  At that point,
the prescribed deletion split yields either a source-faithful successor or a
critical shell at the second center. -/
theorem secondRowSuccessor_or_secondCenterCritical
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    Nonempty (SecondRowCommonDeletionSuccessor C) ∨
      ∃ source : ℝ², Nonempty (PrescribedCriticalAt D source center₂) := by
  have hsplit := Finset.card_sdiff_add_card_inter C.B₂ C.B₁
  have hinter : (C.B₂ ∩ C.B₁).card ≤ 2 := by
    simpa [Finset.inter_comm] using C.overlap_le_two
  have hdiff : 2 ≤ (C.B₂ \ C.B₁).card := by
    rw [C.B₂_card] at hsplit
    omega
  have hnonempty : (C.B₂ \ C.B₁).Nonempty :=
    Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨source, hsource⟩
  rcases Finset.mem_sdiff.mp hsource with
    ⟨hsourceSecond, hsourceFirst⟩
  have hsourceA : source ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hsourceSecond)).2).2
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase source) center₁ :=
    selectedFourClass_survives_erase_of_not_mem
      (CommonDeletionTwoCenterPacket.firstRowSelectedFourClass C)
      hsourceFirst
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := source) D.K4 C.center₂_mem_A with
    hsurvivesSecond | ⟨K, hblocks⟩
  · left
    rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        C.center₁_mem_A C.center₂_mem_A C.centers_ne
        hsurvivesFirst hsurvivesSecond with ⟨G⟩
    exact ⟨SecondRowCommonDeletionSuccessor.ofPacket
      hsourceSecond hsourceFirst G⟩
  · exact Or.inr ⟨source, ⟨⟨K, hblocks⟩⟩⟩

/-- If the second center is the physical second apex, the generic packet has
exactly two source-faithful outputs: the exact old-second-row successor shape,
or the existing swapped unique-four frontier.  The first center remains
arbitrary. -/
theorem physicalSecondApex_commonDeletion_successor_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) :
    Nonempty (SecondRowCommonDeletionSuccessor C) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases secondRowSuccessor_or_secondCenterCritical C with
    hsuccessor | hcritical
  · exact Or.inl hsuccessor
  · rcases hcritical with ⟨source, ⟨P⟩⟩
    exact Or.inr
      (secondApexCritical_reorients_to_firstApexUniqueFour
        P.shell P.blocks)

/-- Coarse geometric projection of the exact physical-second-apex output. -/
theorem physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases physicalSecondApex_commonDeletion_successor_or_swappedUniqueFour C with
    hsuccessor | hswapped
  · rcases hsuccessor with ⟨N⟩
    exact Or.inl ⟨N.secondCenterFullyDeletionRobust⟩
  · exact Or.inr hswapped

/-- The provenance-retaining card-at-least-fourteen endpoint.  The original
actual-blocker source, the deleted frontier point, and the exact successor
shape remain available to the next geometric consumer. -/
structure SourceFaithfulCardFourteenSecondApexReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Type where
  deleted : ℝ²
  deleted_mem_A : deleted ∈ D.A
  source : CriticalShellSystem.CarrierVertex D.A
  deleted_eq_frontier : deleted = P.q ∨ deleted = P.w
  source_outside_qBlockerFiber : source ∈ Finset.univ \ qBlockerFiber P
  sourceCenter_ne_secondApex :
    H.centerAt source.1 source.2 ≠ S.oppApex2
  sourceCenter_survives :
    HasNEquidistantPointsAt 4 (D.A.erase deleted)
      (H.centerAt source.1 source.2)
  packet : CommonDeletionTwoCenterPacket D H deleted
    (H.centerAt source.1 source.2) S.oppApex2
  outcome : Nonempty (SecondRowCommonDeletionSuccessor packet) ∨
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H)

/-- Construct the fully source-faithful physical-second-apex reduction. -/
theorem nonempty_sourceFaithfulCardFourteenSecondApexReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    Nonempty (SourceFaithfulCardFourteenSecondApexReduction P) := by
  rcases exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
      P hnotFour hwSupport hcard with
    ⟨deleted, hdeleted, source, hdeletedCases, hsourceOutside,
      hcenter, hsurvives, ⟨C⟩⟩
  exact ⟨{
    deleted := deleted
    deleted_mem_A := hdeleted
    source := source
    deleted_eq_frontier := hdeletedCases
    source_outside_qBlockerFiber := hsourceOutside
    sourceCenter_ne_secondApex := hcenter
    sourceCenter_survives := hsurvives
    packet := C
    outcome :=
      physicalSecondApex_commonDeletion_successor_or_swappedUniqueFour C }⟩

/-- The card-at-least-fourteen survival-cover producer now reaches the same
two physical-second-apex endpoints without any live-center alignment. -/
theorem card_ge_fourteen_survivalCover_robust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases nonempty_sourceFaithfulCardFourteenSecondApexReduction
      P hnotFour hwSupport hcard with ⟨R⟩
  rcases R.outcome with hsuccessor | hswapped
  · rcases hsuccessor with ⟨N⟩
    exact Or.inl ⟨N.secondCenterFullyDeletionRobust⟩
  · exact Or.inr hswapped

/-- Motive-valued endpoint spelling the two remaining mathematical consumers
needed to turn the card-at-least-fourteen producer into a contradiction. -/
theorem card_ge_fourteen_survivalCover_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card)
    (hrobust : FullyDeletionRobustAt D S.oppApex2 → False)
    (hswapped : SwappedFirstApexUniqueFourFrontier D S H → False) :
    False := by
  rcases card_ge_fourteen_survivalCover_robust_or_swappedUniqueFour
      P hnotFour hwSupport hcard with hrobustOutput | hswappedOutput
  · rcases hrobustOutput with ⟨R⟩
    exact hrobust R
  · rcases hswappedOutput with ⟨U⟩
    exact hswapped U

#print axioms CommonDeletionTwoCenterPacket.firstRowSelectedFourClass
#print axioms SecondRowCommonDeletionSuccessor.ofPacket
#print axioms SecondRowCommonDeletionSuccessor.secondCenterFullyDeletionRobust
#print axioms secondRowSuccessor_or_secondCenterCritical
#print axioms physicalSecondApex_commonDeletion_successor_or_swappedUniqueFour
#print axioms physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
#print axioms nonempty_sourceFaithfulCardFourteenSecondApexReduction
#print axioms card_ge_fourteen_survivalCover_robust_or_swappedUniqueFour
#print axioms card_ge_fourteen_survivalCover_false

end ATailCommonDeletionUniformConsumerScratch
end Problem97
