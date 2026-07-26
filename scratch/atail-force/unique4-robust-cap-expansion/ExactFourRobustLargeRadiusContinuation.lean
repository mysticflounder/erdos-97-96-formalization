/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourRobustCapExpansion
import ExactFourTwoRadiusSuccessorNormalForm
import ExactFiveCycleEdgeNormalForm
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity

/-!
# Continuing the robust exact-four radius classification

The post-card-eleven robust exact-four surface forces growth in one of three
caps.  Its deletion-radius classification can be continued uniformly:

* two distinct exact-four radii are fed through the checked three-way
  minimal-deletion normal form under every cap-growth constructor; or
* a five-point radius is retained under surplus- or first-opposite-cap growth;
  under second-opposite-cap growth it enters the production robust-large-radius
  reduction and is normalized further to either a frontier-coupled
  common-deletion parent residual or the frontier-coupled exact-five physical
  omission cycle.

This is a source-level normalization, not a contradiction theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustLargeRadiusContinuationScratch

open ATailCriticalPairFrontier
open ATailCapApexRadiusRigidity
open ATailCommonDeletionUniformConsumerScratch
open ATailCommonDeletionParentConsumerScratch
open ATailExactFiveMutualOmissionClosureScratch
open ATailExactFiveMutualGlobalCapConsumerScratch
open ATailExactFiveReverseOutsidePairProducerScratch
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalOmissionCycleParentResidual
open ATailRobustTwoRadiusCenterLocalizationScratch
open ATailRobustLargeRadius
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourRobustCapExpansionScratch
open ATailUniqueFourRobustCompletionRadiusChoiceScratch

/-- A selected four-row contributes four points to its complete ambient
radius class. -/
private theorem selectedFourClass_ambientClass_card_ge_four
    {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) :
    4 ≤ (SelectedClass A center K.radius).card := by
  have hsub :
      K.support ⊆ SelectedClass A center K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hle := Finset.card_le_card hsub
  have hcard := K.support_card
  omega

/-- Under the no-five hypothesis, support-disjoint selected four-rows at the
same center cannot have the same radius. -/
private theorem selectedFourClass_radii_ne_of_disjoint_of_noFive
    {A : Finset ℝ²} {center : ℝ²}
    (hnoFive :
      ∀ candidateRadius : ℝ, 0 < candidateRadius →
        (SelectedClass A center candidateRadius).card < 5)
    (firstRow secondRow : SelectedFourClass A center)
    (hrows : Disjoint firstRow.support secondRow.support) :
    firstRow.radius ≠ secondRow.radius := by
  intro hradii
  have hfirstSub :
      firstRow.support ⊆
        SelectedClass A center firstRow.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨firstRow.support_subset_A hz,
        firstRow.support_eq_radius z hz⟩
  have hsecondSub :
      secondRow.support ⊆
        SelectedClass A center firstRow.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨secondRow.support_subset_A hz,
        (secondRow.support_eq_radius z hz).trans hradii.symm⟩
  have hunionSub :
      firstRow.support ∪ secondRow.support ⊆
        SelectedClass A center firstRow.radius := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · exact hfirstSub hz
    · exact hsecondSub hz
  have hunionCard :
      (firstRow.support ∪ secondRow.support).card = 8 := by
    rw [Finset.card_union_of_disjoint hrows,
      firstRow.support_card, secondRow.support_card]
  have hle := Finset.card_le_card hunionSub
  have hlt := hnoFive firstRow.radius firstRow.radius_pos
  omega

/-- Field-for-field adapter from the production common-deletion packet to the
older scratch packet consumed by the source-faithful successor theorem. -/
def continuationPacketOfProduction
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H deleted center₁ center₂) :
    ATailContinuationBankMatchScratch.CommonDeletionTwoCenterPacket
      D H deleted center₁ center₂ where
  q_mem_A := C.q_mem_A
  center₁_mem_A := C.center₁_mem_A
  center₂_mem_A := C.center₂_mem_A
  centers_ne := C.centers_ne
  survives₁ := C.survives₁
  survives₂ := C.survives₂
  actual_blocker_ne_center₁ := C.actual_blocker_ne_center₁
  actual_blocker_ne_center₂ := C.actual_blocker_ne_center₂
  B₁ := C.B₁
  B₂ := C.B₂
  row₁ := C.row₁
  row₂ := C.row₂
  B₁_card := C.B₁_card
  B₂_card := C.B₂_card
  overlap_le_two := C.overlap_le_two

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
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Robustness at the physical second apex eliminates the prescribed-critical
arm of a common-deletion packet, leaving its source-faithful second-row
successor. -/
theorem nonempty_secondRowCommonDeletionSuccessor_of_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (C : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) :
    Nonempty
      (ATailCommonDeletionUniformConsumerScratch.SecondRowCommonDeletionSuccessor
        (continuationPacketOfProduction C)) := by
  let Cscratch := continuationPacketOfProduction C
  let Rscratch := rtwoScratchRobust_of_production R
  rcases secondRowSuccessor_or_secondCenterCritical Cscratch with
    hsuccessor | ⟨source, ⟨P⟩⟩
  · exact hsuccessor
  · exact False.elim
      (P.blocks
        (Rscratch.survives source P.shell.toCriticalFourShell.q_mem_A))

/-- Uniform checked continuation of the two-distinct-radii classifier.  This
does not depend on which of the three physical caps grows. -/
structure ExactFourTwoDistinctRadiiContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  surface : ExactFourPostCardElevenRobustSurface R
  firstRadius : ℝ
  secondRadius : ℝ
  firstRadius_pos : 0 < firstRadius
  secondRadius_pos : 0 < secondRadius
  first_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex2 firstRadius).card
  second_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex2 secondRadius).card
  radii_ne : secondRadius ≠ firstRadius
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card
  all_positive_radius_class_card_lt_five :
    ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5
  firstRow : SelectedFourClass D.A S.oppApex2
  secondRow : SelectedFourClass D.A S.oppApex2
  firstRow_radius : firstRow.radius = firstRadius
  secondRow_radius : secondRow.radius = secondRadius
  supports_disjoint : Disjoint firstRow.support secondRow.support
  normalForm :
    ExactFourTwoRadiusNoFiveNormalForm
      (lateFirstApexSystem R) firstRow

/-- Feed a two-distinct-radii classifier through the checked two-row
minimal-deletion and successor normal forms. -/
theorem nonempty_twoDistinctRadiiContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRadius secondRadius : ℝ)
    (firstRadius_pos : 0 < firstRadius)
    (secondRadius_pos : 0 < secondRadius)
    (first_class_card_ge_four :
      4 ≤ (SelectedClass D.A S.oppApex2 firstRadius).card)
    (second_class_card_ge_four :
      4 ≤ (SelectedClass D.A S.oppApex2 secondRadius).card)
    (radii_ne : secondRadius ≠ firstRadius)
    (all_positive_radius_class_card_lt_five :
      ∀ candidateRadius : ℝ, 0 < candidateRadius →
        (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (firstRow_radius : firstRow.radius = firstRadius)
    (secondRow_radius : secondRow.radius = secondRadius)
    (supports_disjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty (ExactFourTwoDistinctRadiiContinuation R) := by
  have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hsecondSixByIndex :
      6 ≤ (S.capByIndex S.oppIndex2).card :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
      S D.convex S.oppIndex2 secondRadius_pos firstRadius_pos
      (by simpa only [← hcenter] using second_class_card_ge_four)
      (by simpa only [← hcenter] using first_class_card_ge_four)
      radii_ne
  have hsecondSix : 6 ≤ S.oppCap2.card := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hsecondSixByIndex
  have hcard : 4 < D.A.card := by
    have hlarge := R.carrier_card_gt_nine
    omega
  rcases nonempty_exactFourTwoRadiusNormalForm
      R.minimal (lateFirstApexSystem R) surface.secondApex_robust
      firstRow secondRow supports_disjoint hcard with ⟨rawNormalForm⟩
  rcases nonempty_exactFourTwoRadiusSuccessorNormalForm
      surface.secondApex_robust secondRow supports_disjoint rawNormalForm with
    ⟨successorNormalForm⟩
  rcases nonempty_exactFourTwoRadiusNoFiveNormalForm
      all_positive_radius_class_card_lt_five successorNormalForm with
    ⟨normalForm⟩
  exact ⟨{
    surface := surface
    firstRadius := firstRadius
    secondRadius := secondRadius
    firstRadius_pos := firstRadius_pos
    secondRadius_pos := secondRadius_pos
    first_class_card_ge_four := first_class_card_ge_four
    second_class_card_ge_four := second_class_card_ge_four
    radii_ne := radii_ne
    secondOppCap_card_ge_six := hsecondSix
    all_positive_radius_class_card_lt_five :=
      all_positive_radius_class_card_lt_five
    firstRow := firstRow
    secondRow := secondRow
    firstRow_radius := firstRow_radius
    secondRow_radius := secondRow_radius
    supports_disjoint := supports_disjoint
    normalForm := normalForm }⟩

/-- The first opposite cap is either one of the two remaining small exact
profiles, or the two exact-four physical rows already form the production
frontier-coupled residual for the large-cap branch. -/
inductive ExactFourTwoDistinctRadiiFirstCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (K : ExactFourTwoDistinctRadiiContinuation R) : Type
  | exactFour
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
  | exactFive
      (firstOppCap_card_eq_five : S.oppCap1.card = 5)
  | coupledLarge
      (residual :
        FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual
          D S (lateFirstApexSystem R))

/-- Split the first opposite cap at six.  On the large side, package the
already-retained two exact-four rows into the production physical-apex
residual, including its carrier-cardinality and original-frontier fields. -/
theorem nonempty_twoDistinctRadiiFirstCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (K : ExactFourTwoDistinctRadiiContinuation R) :
    Nonempty (ExactFourTwoDistinctRadiiFirstCapProfile K) := by
  by_cases hfirstSix : 6 ≤ S.oppCap1.card
  · have hfirstClassEqFour :
        (SelectedClass D.A S.oppApex2 K.firstRadius).card = 4 := by
      have hge := K.first_class_card_ge_four
      have hlt :=
        K.all_positive_radius_class_card_lt_five
          K.firstRadius K.firstRadius_pos
      omega
    have hsecondClassEqFour :
        (SelectedClass D.A S.oppApex2 K.secondRadius).card = 4 := by
      have hge := K.second_class_card_ge_four
      have hlt :=
        K.all_positive_radius_class_card_lt_five
          K.secondRadius K.secondRadius_pos
      omega
    let physical :
        PhysicalSecondApexExactTwoFourRadiusResidual D S := {
      first_cap_card_ge_six := hfirstSix
      second_cap_card_ge_six := K.secondOppCap_card_ge_six
      carrier_card_ge_fourteen :=
        carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
          D S hfirstSix K.secondOppCap_card_ge_six
      robust := K.surface.secondApex_robust
      radius := K.firstRadius
      otherRadius := K.secondRadius
      radius_pos := K.firstRadius_pos
      otherRadius_pos := K.secondRadius_pos
      radii_ne := K.radii_ne
      first_class_card_eq_four := hfirstClassEqFour
      second_class_card_eq_four := hsecondClassEqFour
      firstRow := K.firstRow
      secondRow := K.secondRow
      firstRow_radius := K.firstRow_radius
      secondRow_radius := K.secondRow_radius
      supports_disjoint := K.supports_disjoint }
    let coupled :
        FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual
          D S (lateFirstApexSystem R) := {
      minimal := R.minimal
      noM44 := R.noM44
      physical := physical
      frontierRadius := radius
      frontierRadius_pos := frontier_radius_pos F
      frontierRadius_class_card_ge_four := by
        rw [R.class_card_eq_four]
      frontier := lateFirstApexFrontier R }
    exact ⟨.coupledLarge coupled⟩
  · have hfirstLtSix : S.oppCap1.card < 6 := by omega
    have hfirstGeFour := K.surface.firstOppCap_card_ge_four
    have hsmall :
        S.oppCap1.card = 4 ∨ S.oppCap1.card = 5 := by
      omega
    rcases hsmall with hfour | hfive
    · exact ⟨.exactFour hfour⟩
    · exact ⟨.exactFive hfive⟩

/-- A common deletion continued through the robust physical second apex to
the source-faithful successor supplied by the existing uniform consumer. -/
structure ExactFiveSecondApexCommonDeletionSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (deleted center : ℝ²) : Type where
  packet :
    ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2
  successor :
    ATailCommonDeletionUniformConsumerScratch.SecondRowCommonDeletionSuccessor
      (continuationPacketOfProduction packet)

theorem nonempty_exactFiveSecondApexCommonDeletionSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (hdeletedA : deleted ∈ D.A)
    (hcenterA : center ∈ D.A)
    (hcenter_ne : center ≠ S.oppApex2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center) :
    Nonempty
      (ExactFiveSecondApexCommonDeletionSuccessor
        (S := S) (H := H) deleted center) := by
  rcases ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket
      H hdeletedA hcenterA (oppApex2_mem_A S) hcenter_ne hsurvives
      (R.survives deleted hdeletedA) with ⟨packet⟩
  rcases nonempty_secondRowCommonDeletionSuccessor_of_robust R packet with
    ⟨successor⟩
  exact ⟨{ packet := packet, successor := successor }⟩

/-- The exact-five bare cycle split after exploiting deletion robustness at
the physical second apex.  Both mutual-omission arms now reach the same
source-faithful common-deletion successor interface; only the all-reverse
capacity arm remains separate. -/
inductive ExactFiveBareCycleSecondApexNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    (cycle : PhysicalActualCriticalOmissionCycle H profile) : Type
  | mutualSameCapCommonDeletion
      (edge : PhysicalActualCriticalMutualOmissionEdge cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (sourceResidual : CycleSameCapCommonDeletionResidual cycle edge)
      (continuation :
        ExactFiveSecondApexCommonDeletionSuccessor
          (D := D) (S := S) (H := H)
          sourceResidual.deleted
          (H.blockerVertex sourceResidual.pair.source₁).1)
  | mutualEqualBlockerShell
      (edge : PhysicalActualCriticalMutualOmissionEdge cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (sourceResidual : CycleEqualBlockerShellResidual cycle edge)
      (continuation :
        ExactFiveSecondApexCommonDeletionSuccessor
          (D := D) (S := S) (H := H)
          sourceResidual.deleted
          (H.blockerVertex sourceResidual.pair.source₁).1)
  | allReverseCapacity
      (capacity : ExactFiveBareReverseOutsidePairCapacity cycle)
      (straddles :
        ∀ i : Fin cycle.period,
          Nonempty (ReverseRowCapStraddle cycle i))

theorem nonempty_exactFiveBareCycleSecondApexNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (cycle : PhysicalActualCriticalOmissionCycle H profile)
    (normalForm : ExactFiveBareCycleEdgeNormalForm cycle) :
    Nonempty (ExactFiveBareCycleSecondApexNormalForm cycle) := by
  cases normalForm with
  | mutualSameCapCommonDeletion edge crissCross sourceResidual =>
      rcases nonempty_exactFiveSecondApexCommonDeletionSuccessor R
          sourceResidual.packet.q_mem_A
          sourceResidual.packet.center₁_mem_A
          (R.centerAt_ne H
            sourceResidual.pair.source₁.1 sourceResidual.pair.source₁.2)
          sourceResidual.packet.survives₁ with ⟨continuation⟩
      exact ⟨.mutualSameCapCommonDeletion
        edge crissCross sourceResidual continuation⟩
  | mutualEqualBlockerShell edge crissCross sourceResidual =>
      have hdeletedA : sourceResidual.deleted ∈ D.A := by
        rcases sourceResidual.deleted_eq with hfirst | hsecond
        · rw [hfirst]
          exact PhysicalVertex.mem_A (cycle.source edge.index)
        · rw [hsecond]
          exact PhysicalVertex.mem_A
            (cycle.source (cycle.successorIndex edge.index))
      have hsurvives :
          HasNEquidistantPointsAt 4
            (D.A.erase sourceResidual.deleted)
            (H.blockerVertex sourceResidual.pair.source₁).1 :=
        ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem
          (H.selectedAt
            sourceResidual.pair.source₁.1
            sourceResidual.pair.source₁.2).toCriticalFourShell.toSelectedFourClass
          sourceResidual.deleted_not_mem_shell
      rcases nonempty_exactFiveSecondApexCommonDeletionSuccessor R
          hdeletedA
          (H.blockerVertex sourceResidual.pair.source₁).2
          (R.centerAt_ne H
            sourceResidual.pair.source₁.1 sourceResidual.pair.source₁.2)
          hsurvives with ⟨continuation⟩
      exact ⟨.mutualEqualBlockerShell
        edge crissCross sourceResidual continuation⟩
  | allReverseCapacity capacity straddles =>
      exact ⟨.allReverseCapacity capacity straddles⟩

/-- The frontier-coupled exact-five cycle after using the large-radius
parent's deletion robustness at the physical second apex.  As in the bare
cycle normal form, both mutual-omission arms reach the same source-faithful
common-deletion successor interface. -/
inductive ExactFiveCycleSecondApexNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {parent : RobustLargeRadiusParentSurface D S}
    (residual :
      FrontierCoupledExactFivePhysicalCycleParentResidual H parent) : Type
  | mutualSameCapCommonDeletion
      (edge :
        PhysicalActualCriticalMutualOmissionEdge residual.exactFive.cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (sourceResidual : SameCapCommonDeletionResidual residual edge)
      (continuation :
        ExactFiveSecondApexCommonDeletionSuccessor
          (D := D) (S := S) (H := H)
          sourceResidual.deleted
          (H.blockerVertex sourceResidual.pair.source₁).1)
  | mutualEqualBlockerShell
      (edge :
        PhysicalActualCriticalMutualOmissionEdge residual.exactFive.cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (sourceResidual : EqualBlockerShellResidual residual edge)
      (continuation :
        ExactFiveSecondApexCommonDeletionSuccessor
          (D := D) (S := S) (H := H)
          sourceResidual.deleted
          (H.blockerVertex sourceResidual.pair.source₁).1)
  | allReverseCapacity
      (capacity : FrontierCoupledReverseOutsidePairCapacity residual)
      (straddles :
        ∀ i : Fin residual.exactFive.cycle.period,
          Nonempty (ReverseRowCapStraddle residual.exactFive.cycle i))

theorem nonempty_exactFiveCycleSecondApexNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {parent : RobustLargeRadiusParentSurface D S}
    (residual :
      FrontierCoupledExactFivePhysicalCycleParentResidual H parent)
    (normalForm : ExactFiveCycleEdgeNormalForm residual) :
    Nonempty (ExactFiveCycleSecondApexNormalForm residual) := by
  let R := parent_secondApexFullyDeletionRobust parent
  cases normalForm with
  | mutualSameCapCommonDeletion edge crissCross sourceResidual =>
      rcases nonempty_exactFiveSecondApexCommonDeletionSuccessor R
          sourceResidual.packet.q_mem_A
          sourceResidual.packet.center₁_mem_A
          (R.centerAt_ne H
            sourceResidual.pair.source₁.1 sourceResidual.pair.source₁.2)
          sourceResidual.packet.survives₁ with ⟨continuation⟩
      exact ⟨.mutualSameCapCommonDeletion
        edge crissCross sourceResidual continuation⟩
  | mutualEqualBlockerShell edge crissCross sourceResidual =>
      have hdeletedA : sourceResidual.deleted ∈ D.A := by
        rcases sourceResidual.deleted_eq with hfirst | hsecond
        · rw [hfirst]
          exact PhysicalVertex.mem_A
            (residual.exactFive.cycle.source edge.index)
        · rw [hsecond]
          exact PhysicalVertex.mem_A
            (residual.exactFive.cycle.source
              (residual.exactFive.cycle.successorIndex edge.index))
      have hsurvives :
          HasNEquidistantPointsAt 4
            (D.A.erase sourceResidual.deleted)
            (H.blockerVertex sourceResidual.pair.source₁).1 :=
        ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem
          (H.selectedAt
            sourceResidual.pair.source₁.1
            sourceResidual.pair.source₁.2).toCriticalFourShell.toSelectedFourClass
          sourceResidual.deleted_not_mem_shell
      rcases nonempty_exactFiveSecondApexCommonDeletionSuccessor R
          hdeletedA
          (H.blockerVertex sourceResidual.pair.source₁).2
          (R.centerAt_ne H
            sourceResidual.pair.source₁.1 sourceResidual.pair.source₁.2)
          hsurvives with ⟨continuation⟩
      exact ⟨.mutualEqualBlockerShell
        edge crissCross sourceResidual continuation⟩
  | allReverseCapacity capacity straddles =>
      exact ⟨.allReverseCapacity capacity straddles⟩

/-- The robust part of the five-point-radius reduction.
The shared-critical-pair constructor has already been folded back into a
concrete common-deletion residual, and the exact-five profile is anchored to
the classified physical radius.  Mutual omission cycles are continued through
the robust physical second apex; only the all-reverse capacity arm remains. -/
inductive ExactFourFivePointRadiusReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (physicalRadius : ℝ) : Type
  | commonDeletion
      (residual :
        ATailPhysicalOmissionCycleParentResidual.CommonDeletionParentResidual
          (S := S) (lateFirstApexSystem R))
      (successor :
        ATailCommonDeletionUniformConsumerScratch.SecondRowCommonDeletionSuccessor
          (continuationPacketOfProduction residual.packet))
  | exactUniqueFive
      (profile :
        ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S)
      (profile_radius_eq : profile.radius = physicalRadius)
      (cycle :
        PhysicalActualCriticalOmissionCycle
          (lateFirstApexSystem R) profile)
      (normalForm : ExactFiveBareCycleSecondApexNormalForm cycle)

/-- Global minimality and physical-second-apex deletion robustness reduce a
five-point radius to a source-faithful common-deletion successor or the
exact-unique-five profile.  No cap-six bound is used. -/
theorem nonempty_fivePointRadiusReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (secondApex_robust :
      ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (physicalRadius : ℝ)
    (hradius : 0 < physicalRadius)
    (hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 physicalRadius).card) :
    Nonempty (ExactFourFivePointRadiusReduction R physicalRadius) := by
  let weak : FivePointSecondApexRadiusSurface D S := {
    minimal := R.minimal
    radius := physicalRadius
    radius_pos := hradius
    radius_class_card_ge_five := hfive }
  rcases nonempty_minimalDeletionOutcome_of_fivePointSecondApexRadius
      (lateFirstApexSystem R) weak with ⟨outcome⟩
  cases outcome with
  | commonDeletion deleted center packet =>
      let residual :
          ATailPhysicalOmissionCycleParentResidual.CommonDeletionParentResidual
            (S := S) (lateFirstApexSystem R) := {
        deleted := deleted
        center := center
        packet := packet }
      rcases nonempty_secondRowCommonDeletionSuccessor_of_robust
          secondApex_robust residual.packet with ⟨successor⟩
      exact ⟨.commonDeletion residual successor⟩
  | exactUniqueFive profile =>
      have hfour :
          4 ≤ (SelectedClass D.A S.oppApex2 physicalRadius).card := by
        omega
      have hradiusEq : physicalRadius = profile.radius :=
        profile.unique_K4_radius physicalRadius hradius hfour
      rcases nonempty_physicalActualCriticalOmissionCycle
          (lateFirstApexSystem R) profile with ⟨cycle⟩
      rcases nonempty_exactFiveBareCycleEdgeNormalForm
          (hcard := R.carrier_card_gt_nine) cycle with
        ⟨edgeNormalForm⟩
      rcases nonempty_exactFiveBareCycleSecondApexNormalForm
          secondApex_robust cycle edgeNormalForm with ⟨normalForm⟩
      exact ⟨.exactUniqueFive profile hradiusEq.symm cycle normalForm⟩
  | sharedCriticalPair packet =>
      rcases nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
          (lateFirstApexSystem R) hradius hfive packet with
        ⟨deleted, _hdeletedRadius, _hdeletedShell, ⟨commonDeletion⟩⟩
      let residual :
          ATailPhysicalOmissionCycleParentResidual.CommonDeletionParentResidual
            (S := S) (lateFirstApexSystem R) := {
        deleted := deleted
        center := packet.center
        packet := commonDeletion }
      rcases nonempty_secondRowCommonDeletionSuccessor_of_robust
          secondApex_robust residual.packet with ⟨successor⟩
      exact ⟨.commonDeletion residual successor⟩

/-- Strongest checked continuation of every cap-growth constructor on the
post-card-eleven robust exact-four surface. -/
inductive ExactFourPostCardElevenRobustContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type
  | surplusFivePoint
      (surface : ExactFourPostCardElevenRobustSurface R)
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (physicalRadius : ℝ)
      (radius_pos : 0 < physicalRadius)
      (radius_class_card_ge_five :
        5 ≤ (SelectedClass D.A S.oppApex2 physicalRadius).card)
      (reduction :
        ExactFourFivePointRadiusReduction R physicalRadius)
  | firstOppositeFivePoint
      (surface : ExactFourPostCardElevenRobustSurface R)
      (profile : ExactFourFirstOppositeCapGrowth S)
      (physicalRadius : ℝ)
      (radius_pos : 0 < physicalRadius)
      (radius_class_card_ge_five :
        5 ≤ (SelectedClass D.A S.oppApex2 physicalRadius).card)
      (reduction :
        ExactFourFivePointRadiusReduction R physicalRadius)
  | secondOppositeLargeRadiusCommonDeletion
      (surface : ExactFourPostCardElevenRobustSurface R)
      (profile : ExactFourSecondOppositeCapGrowth S)
      (parent : RobustLargeRadiusParentSurface D S)
      (residual :
        FrontierCoupledCommonDeletionParentResidual
          (lateFirstApexSystem R) parent)
      (continuation :
        ExactFiveSecondApexCommonDeletionSuccessor
          (D := D) (S := S) (H := lateFirstApexSystem R)
          residual.common.deleted residual.common.center)
  | secondOppositeLargeRadiusExactFiveCycle
      (surface : ExactFourPostCardElevenRobustSurface R)
      (profile : ExactFourSecondOppositeCapGrowth S)
      (parent : RobustLargeRadiusParentSurface D S)
      (residual :
        FrontierCoupledExactFivePhysicalCycleParentResidual
          (lateFirstApexSystem R) parent)
      (normalForm : ExactFiveCycleSecondApexNormalForm residual)
  | twoDistinctRadii
      (continuation : ExactFourTwoDistinctRadiiContinuation R)
      (firstCapProfile :
        ExactFourTwoDistinctRadiiFirstCapProfile continuation)

/-- Normalize the two-distinct-radii classifier under every cap-growth
constructor.  Only a five-point classifier still exposes the three cap-growth
alternatives, with the second-opposite case continued through the production
large-radius reduction. -/
theorem nonempty_exactFourPostCardElevenRobustContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    Nonempty (ExactFourPostCardElevenRobustContinuation R) := by
  cases surface.radiusClassification with
  | fivePointRadius physicalRadius hradius hfive =>
      cases surface.capGrowth with
      | surplus hsurplus =>
          rcases nonempty_fivePointRadiusReduction
              R surface.secondApex_robust physicalRadius hradius hfive with
            ⟨reduction⟩
          exact ⟨.surplusFivePoint surface hsurplus physicalRadius
            hradius hfive reduction⟩
      | firstOpposite profile =>
          rcases nonempty_fivePointRadiusReduction
              R surface.secondApex_robust physicalRadius hradius hfive with
            ⟨reduction⟩
          exact ⟨.firstOppositeFivePoint surface profile physicalRadius
            hradius hfive reduction⟩
      | secondOpposite profile =>
          let parent : RobustLargeRadiusParentSurface D S := {
            minimal := R.minimal
            noM44 := R.noM44
            oppCap2_card_ge_six := profile.secondOppCap_card_ge_six
            radius := physicalRadius
            radius_pos := hradius
            radius_class_card_ge_five := hfive }
          rcases frontierCoupledCommonDeletion_or_frontierCoupledExactFive
              (lateFirstApexSystem R) parent with hcommon | hexact
          · rcases hcommon with ⟨residual⟩
            rcases nonempty_secondRowCommonDeletionSuccessor_of_robust
                residual.secondApexFullyDeletionRobust
                residual.common.packet with ⟨successor⟩
            let continuation :
                ExactFiveSecondApexCommonDeletionSuccessor
                  (D := D) (S := S) (H := lateFirstApexSystem R)
                  residual.common.deleted residual.common.center := {
              packet := residual.common.packet
              successor := successor }
            exact ⟨.secondOppositeLargeRadiusCommonDeletion
              surface profile parent residual continuation⟩
          · rcases hexact with ⟨residual⟩
            rcases nonempty_exactFiveCycleEdgeNormalForm residual with
              ⟨edgeNormalForm⟩
            rcases nonempty_exactFiveCycleSecondApexNormalForm
                residual edgeNormalForm with ⟨normalForm⟩
            exact ⟨.secondOppositeLargeRadiusExactFiveCycle
              surface profile parent residual normalForm⟩
  | twoDistinctRadii firstRadius secondRadius firstRadius_pos
      secondRadius_pos first_class_card_ge_four
      second_class_card_ge_four radii_ne
      all_positive_radius_class_card_lt_five firstRow secondRow
      firstRow_radius secondRow_radius supports_disjoint =>
      rcases nonempty_twoDistinctRadiiContinuation R surface
          firstRadius secondRadius firstRadius_pos secondRadius_pos
          first_class_card_ge_four second_class_card_ge_four radii_ne
          all_positive_radius_class_card_lt_five firstRow secondRow
          firstRow_radius secondRow_radius supports_disjoint with
        ⟨continuation⟩
      rcases nonempty_twoDistinctRadiiFirstCapProfile continuation with
        ⟨firstCapProfile⟩
      exact ⟨.twoDistinctRadii continuation firstCapProfile⟩

#print axioms ExactFourTwoDistinctRadiiContinuation
#print axioms nonempty_twoDistinctRadiiContinuation
#print axioms ExactFourTwoDistinctRadiiFirstCapProfile
#print axioms nonempty_twoDistinctRadiiFirstCapProfile
#print axioms ExactFiveSecondApexCommonDeletionSuccessor
#print axioms nonempty_exactFiveSecondApexCommonDeletionSuccessor
#print axioms ExactFiveBareCycleSecondApexNormalForm
#print axioms nonempty_exactFiveBareCycleSecondApexNormalForm
#print axioms ExactFiveCycleSecondApexNormalForm
#print axioms nonempty_exactFiveCycleSecondApexNormalForm
#print axioms ExactFourFivePointRadiusReduction
#print axioms nonempty_secondRowCommonDeletionSuccessor_of_robust
#print axioms nonempty_fivePointRadiusReduction
#print axioms ExactFourPostCardElevenRobustContinuation
#print axioms nonempty_exactFourPostCardElevenRobustContinuation

end ATailUniqueFourRobustLargeRadiusContinuationScratch
end Problem97
