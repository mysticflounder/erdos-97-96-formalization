/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingLargeCapConsumer

/-!
# Common-deletion normalization of the retained blocker matching

The second-cap-large reverse-hit arm does not need a separate Kalmanson
consumer. The reverse shell has cardinality four and exactly two points in
the first opposite cap. A five-point second cap has at least three strict
interior points, all outside the first cap, so one of them is absent from the
reverse shell. Deleting that point preserves K4 at both the first apex and the
reverse blocker.

Consequently every retained matching large-cap outcome reaches one
source-valid `CommonDeletionTwoCenterPacket`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingCommonDeletionNormalization

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

/-- The second-cap-large reverse-hit arm contains a strict second-cap source
outside the reverse shell. Deleting that source preserves K4 at both the
first apex and the reverse blocker. -/
theorem exists_fresh_secondCap_commonDeletion_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (hinter :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
    (hsecondLarge : 5 ≤ (S.capByIndex S.oppIndex2).card) :
    ∃ fresh : ℝ²,
      fresh ∈ S.capInteriorByIndex S.oppIndex2 ∧
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) := by
  classical
  let I := S.capInteriorByIndex S.oppIndex2
  let C := S.capByIndex S.oppIndex1
  let K :=
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  have hIthree : 3 ≤ I.card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex2
    change I.card + 2 = (S.capByIndex S.oppIndex2).card at hcard
    omega
  have hKinter : K ∩ C = ({O.kept, O.deleted} : Finset ℝ²) := by
    simpa [K, C] using hinter
  have hKoutsideCard : (K \ C).card = 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter K C
    rw [hKinter] at hsplit
    have hKcard : K.card = 4 := by
      simpa [K] using
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_card
    rw [hKcard] at hsplit
    simpa [O.sources_ne] using hsplit
  have hIinterSub : I ∩ K ⊆ K \ C := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzI, hzK⟩
    apply Finset.mem_sdiff.mpr
    refine ⟨hzK, ?_⟩
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hzI
      S.oppIndex1_ne_oppIndex2.symm
  have hIinterCard : (I ∩ K).card ≤ 2 := by
    have hle := Finset.card_le_card hIinterSub
    simpa [hKoutsideCard] using hle
  have hfreshCard : 1 ≤ (I \ K).card := by
    have hsplit := Finset.card_sdiff_add_card_inter I K
    omega
  rcases Finset.card_pos.mp (show 0 < (I \ K).card by omega) with
    ⟨fresh, hfresh⟩
  have hfreshI : fresh ∈ I := (Finset.mem_sdiff.mp hfresh).1
  have hfreshNotK : fresh ∉ K := (Finset.mem_sdiff.mp hfresh).2
  have hfreshA : fresh ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex2 (by simpa [I] using hfreshI)
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase fresh)
        (H.centerAt O.deleted O.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.deleted_mem_A).mpr (by simpa [K] using hfreshNotK)
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase fresh) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives fresh hfreshA
  have hblockerA : H.centerAt O.deleted O.deleted_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨O.deleted, O.deleted_mem_A⟩).2
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfreshA (oppApex1_mem_A S) hblockerA
      O.packet.actual_blocker_ne_center₁.symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  exact ⟨fresh, by simpa [I] using hfreshI,
    by simpa [K] using hfreshNotK, ⟨packet⟩⟩

/-- All three large-cap outcomes have the same normal form: a source-valid
common deletion at the first apex and an actual critical blocker. -/
theorem exists_commonDeletionPacket_of_largeCapConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (L : RetainedMatchingLargeCapConsumerOutcome R) :
    ∃ deleted center₂ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket D H deleted S.oppApex1 center₂) := by
  cases L with
  | pairedCommonDeletion P O reverse_omission reversePacket oppositeLargeCap =>
      exact ⟨O.kept, H.centerAt O.deleted O.deleted_mem_A, ⟨reversePacket⟩⟩
  | firstCapFreshCommonDeletion P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq firstCapLarge fresh fresh_mem_capInterior
      fresh_ne_kept fresh_ne_deleted fresh_not_mem_reverseShell freshPacket =>
      exact ⟨fresh, H.centerAt O.deleted O.deleted_mem_A, ⟨freshPacket⟩⟩
  | secondCapLocalizedReverseHit P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq secondCapLarge =>
      rcases exists_fresh_secondCap_commonDeletion_of_reverseHit O
          reverseShell_inter_cap_eq secondCapLarge with
        ⟨fresh, _hfreshInterior, _hfreshNotShell, ⟨freshPacket⟩⟩
      exact ⟨fresh, H.centerAt O.deleted O.deleted_mem_A, ⟨freshPacket⟩⟩

/-- The complete retained matching reduction reaches a common-deletion packet
without any remaining cap-side split. -/
theorem exists_commonDeletionPacket_of_matchingReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : RetainedMatchingGeometricReduction R) :
    ∃ deleted center₂ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket D H deleted S.oppApex1 center₂) := by
  rcases nonempty_retainedMatchingLargeCapConsumerOutcome G with ⟨L⟩
  exact exists_commonDeletionPacket_of_largeCapConsumerOutcome L

#print axioms exists_fresh_secondCap_commonDeletion_of_reverseHit
#print axioms exists_commonDeletionPacket_of_largeCapConsumerOutcome
#print axioms exists_commonDeletionPacket_of_matchingReduction

end ATailRetainedMatchingCommonDeletionNormalization
end Problem97
