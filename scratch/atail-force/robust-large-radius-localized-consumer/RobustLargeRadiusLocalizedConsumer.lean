/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustLargeRadiusCenterLocalization
import CommonDeletionUniformConsumer

/-!
# Scratch: common-deletion consumer for the localized large-radius pair

The shared-critical-pair arm of the large physical-apex radius transition is
not a new terminal residual.  The parent radius class contains at least five
points, whereas the fresh critical shell contains exactly four.  Hence some
point on the physical-apex radius lies outside the fresh shell.  Deleting that
point preserves a four-point witness at both the fresh center and the physical
apex, producing the existing `CommonDeletionTwoCenterPacket` continuation.

The center-localization theorem and exact shell-cap profile remain available
on the resulting packet, but are not needed for the cardinality collapse.
This file proves reductions, not a direct contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadiusLocalizedConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailRobustLargeRadiusGeometryScratch
open ATailRobustLargeRadiusCenterLocalizationScratch
open ATailCommonDeletionUniformConsumerScratch
open ATailRTwoOffLiveHandlerScratch
open ATailRReciprocalSwapReductionScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A five-point physical-apex radius class contains a point outside the
fresh exact four-shell. -/
theorem exists_physicalRadius_point_not_mem_sharedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card) :
    ∃ deleted : ℝ²,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support := by
  classical
  by_contra hextra
  have hsubset :
      SelectedClass D.A S.oppApex2 radius ⊆
        packet.shell.toCriticalFourShell.support := by
    intro x hx
    by_contra hxShell
    exact hextra ⟨x, hx, hxShell⟩
  have hcard := Finset.card_le_card hsubset
  rw [packet.shell.toCriticalFourShell.support_card] at hcard
  omega

/-- A selected exact shell survives deletion of a point outside its support. -/
private theorem freshCenter_survives_erase_of_not_mem_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius)
    {deleted : ℝ²}
    (hdeleted : deleted ∉ packet.shell.toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) packet.center := by
  let K : SelectedFourClass D.A packet.center :=
    packet.shell.toSelectedFourClass
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((D.A.erase deleted).filter
        fun z ↦ dist packet.center z = K.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzdeleted ↦ hdeleted (by
                  simpa [K, hzdeleted] using hz),
                K.support_subset_A hz⟩,
            K.support_eq_radius z hz⟩)

/-- The shared-critical-pair arm collapses to the already-existing common
deletion continuation.  This is a reduction, not a direct `False`. -/
theorem nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A)
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    ∃ deleted : ℝ²,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted packet.center S.oppApex2) := by
  classical
  rcases exists_physicalRadius_point_not_mem_sharedCriticalShell
      packet hfive with ⟨deleted, hdeletedRadius, hdeletedShell⟩
  have hdeletedA : deleted ∈ D.A :=
    (mem_selectedClass.mp hdeletedRadius).1
  have hfreshSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) packet.center :=
    freshCenter_survives_erase_of_not_mem_shell packet hdeletedShell
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
    refine ⟨radius, hradius, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase deleted) S.oppApex2 radius).card :=
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := deleted) (s := S.oppApex2)
        (d := radius) (n := 4) hfive
    simpa [SelectedClass] using hfour
  refine ⟨deleted, hdeletedRadius, hdeletedShell, ?_⟩
  exact nonempty_commonDeletionTwoCenterPacket H
    hdeletedA packet.center_mem_A (oppApex2_mem_A S)
    packet.center_ne_physicalApex hfreshSurvives hphysicalSurvives

/-- The strongest localized normal form retains the newly checked cap facts
while routing the shared pair into an existing common-deletion packet. -/
structure LocalizedSharedPairCommonDeletionReduction
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (radius : ℝ)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) : Type where
  deleted : ℝ²
  deleted_mem_radius :
    deleted ∈ SelectedClass D.A S.oppApex2 radius
  deleted_not_mem_shell :
    deleted ∉ packet.shell.toCriticalFourShell.support
  commonDeletion : CommonDeletionTwoCenterPacket
    D H deleted packet.center S.oppApex2
  center_mem_capInterior :
    packet.center ∈ S.capInteriorByIndex S.oppIndex2
  shell_inter_cap_eq_pair :
    packet.shell.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 =
      {packet.source, packet.partner}

/-- Package the common-deletion reduction together with the strict-cap center
localization and exact shell-cap intersection. -/
theorem nonempty_localizedSharedPairCommonDeletionReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A)
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    Nonempty (LocalizedSharedPairCommonDeletionReduction
      D S H radius packet) := by
  rcases nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
      H hradius hfive packet with
    ⟨deleted, hdeletedRadius, hdeletedShell, ⟨commonDeletion⟩⟩
  exact ⟨{
    deleted := deleted
    deleted_mem_radius := hdeletedRadius
    deleted_not_mem_shell := hdeletedShell
    commonDeletion := commonDeletion
    center_mem_capInterior := sharedCriticalPair_center_mem_capInterior packet
    shell_inter_cap_eq_pair := sharedCriticalPair_shell_inter_cap_eq_pair packet }⟩

/-- Applying the existing physical-second-apex common-deletion consumer sends
the shared pair to the established robust or swapped-unique-four frontiers. -/
theorem sharedCriticalPair_robust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (H : CriticalShellSystem D.A)
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
      H hradius hfive packet with
    ⟨_deleted, _hdeletedRadius, _hdeletedShell, ⟨commonDeletion⟩⟩
  exact physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
    commonDeletion

/-- The shared-critical-pair constructor is eliminated from the large-radius
minimal-deletion outcome. -/
inductive RobustLargeRadiusReducedOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type
  | commonDeletion
      (deleted center : ℝ²)
      (packet : CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2)
  | exactUniqueFive
      (profile : LargeCapUniqueFiveSecondApexRadius D S)

/-- Global minimality plus the large physical-apex radius now has only two
continuations: the existing common-deletion packet or the exact-unique-five
large-cap residual.  The former three-way transition's shared-pair arm is
absorbed by `nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair`. -/
theorem nonempty_reducedOutcome_of_largeSecondApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusReducedOutcome D S H) := by
  rcases nonempty_minimalDeletionOutcome_of_largeSecondApexRadius H F with
    ⟨outcome⟩
  cases outcome with
  | commonDeletion deleted center packet =>
    exact ⟨RobustLargeRadiusReducedOutcome.commonDeletion
      deleted center packet⟩
  | exactUniqueFive profile =>
    exact ⟨RobustLargeRadiusReducedOutcome.exactUniqueFive profile⟩
  | sharedCriticalPair packet =>
    rcases nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
        H F.radius_pos F.radius_class_card_ge_five packet with
      ⟨deleted, _hdeletedRadius, _hdeletedShell, ⟨commonDeletion⟩⟩
    exact ⟨RobustLargeRadiusReducedOutcome.commonDeletion
      deleted packet.center commonDeletion⟩

/-- Strongest checked parent reduction: the large physical-apex radius arm
reaches the robust physical-apex frontier, protected swapped `FA-UNIQ4`, or
the exact-unique-five large-cap residual.  No shared-pair or generic
common-deletion constructor remains. -/
inductive RobustLargeRadiusKnownFrontierOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type
  | robust
      (profile : FullyDeletionRobustAt D S.oppApex2)
  | swappedUniqueFour
      (profile : SwappedFirstApexUniqueFourFrontier D S H)
  | exactUniqueFive
      (profile : LargeCapUniqueFiveSecondApexRadius D S)

private theorem nonempty_knownFrontierOutcome_of_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (packet : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) :
    Nonempty (RobustLargeRadiusKnownFrontierOutcome D S H) := by
  rcases physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
      packet with hrobust | hswapped
  · rcases hrobust with ⟨robust⟩
    exact ⟨RobustLargeRadiusKnownFrontierOutcome.robust robust⟩
  · rcases hswapped with ⟨swapped⟩
    exact ⟨RobustLargeRadiusKnownFrontierOutcome.swappedUniqueFour swapped⟩

theorem nonempty_knownFrontierOutcome_of_largeSecondApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusKnownFrontierOutcome D S H) := by
  rcases nonempty_minimalDeletionOutcome_of_largeSecondApexRadius H F with
    ⟨outcome⟩
  cases outcome with
  | commonDeletion _deleted _center packet =>
    exact nonempty_knownFrontierOutcome_of_commonDeletion packet
  | exactUniqueFive profile =>
    exact ⟨RobustLargeRadiusKnownFrontierOutcome.exactUniqueFive profile⟩
  | sharedCriticalPair packet =>
    rcases sharedCriticalPair_robust_or_swappedUniqueFour
        H F.radius_pos F.radius_class_card_ge_five packet with
      hrobust | hswapped
    · rcases hrobust with ⟨robust⟩
      exact ⟨RobustLargeRadiusKnownFrontierOutcome.robust robust⟩
    · rcases hswapped with ⟨swapped⟩
      exact ⟨RobustLargeRadiusKnownFrontierOutcome.swappedUniqueFour swapped⟩

#print axioms exists_physicalRadius_point_not_mem_sharedCriticalShell
#print axioms nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
#print axioms nonempty_localizedSharedPairCommonDeletionReduction
#print axioms sharedCriticalPair_robust_or_swappedUniqueFour
#print axioms nonempty_reducedOutcome_of_largeSecondApexRadius
#print axioms nonempty_knownFrontierOutcome_of_largeSecondApexRadius

end ATailRobustLargeRadiusLocalizedConsumerScratch
end Problem97
