/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2LiveHeavyPlacementAudit

/-!
# Scratch: F2 support-heavy reduction

This file analyzes the support-heavy arm of the exact F2 second-apex profile.
The two strict support-only witnesses belong both to the common-deletion
second row and to the selected critical shell at the actual deleted source.
Ordered-cap uniqueness therefore localizes the actual deleted-source blocker,
without replacing the retained critical system or inventing a U5 role.

The mixed one-live/one-support arm is retained as an exact finite-cell
boundary only.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SupportHeavyReductionScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex2_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusCap, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusCap, hi] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusCap, hi] using S.partition.v2_mem_C3

private theorem oppApex2_mem_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap1, hi] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap1, hi] using S.partition.v2_mem_C1

/-- Two strict support-only witnesses force the actual deleted-source blocker
outside both caps adjacent to `oppCap2`.

The equal-radius equations come from the actual retained selected shell at
`deleted` and from the actual common-deletion second row. -/
theorem twoLiveExactCover_two_supportStrict_forces_deletedBlocker_off_adjacentCaps
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    W.H.centerAt deleted C.q_mem_A ∉ S.surplusCap ∧
      W.H.centerAt deleted C.q_mem_A ∉ S.oppCap1 := by
  have hone :
      1 < (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have hxSupportOnly :=
    Finset.mem_inter.mp hx |>.1 |> Finset.mem_sdiff.mp
  have hwSupportOnly :=
    Finset.mem_inter.mp hw |>.1 |> Finset.mem_sdiff.mp
  have hxB : x ∈ C.B₂ :=
    (Finset.mem_inter.mp hxSupportOnly.1).1
  have hwB : w ∈ C.B₂ :=
    (Finset.mem_inter.mp hwSupportOnly.1).1
  have hxSupport : x ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp hxSupportOnly.1).2
  have hwSupport : w ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp hwSupportOnly.1).2
  have hxStrict : x ∈ strictSecondCap S :=
    (Finset.mem_inter.mp hx).2
  have hwStrict : w ∈ strictSecondCap S :=
    (Finset.mem_inter.mp hw).2
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hxB)).2).2
  have hwA : w ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hwB)).2).2
  have hdeletedDist :
      dist (W.H.centerAt deleted C.q_mem_A) x =
        dist (W.H.centerAt deleted C.q_mem_A) w := by
    exact
      ((W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell.support_eq_radius
        x (by simpa [deletedCriticalSupport] using hxSupport)).trans
      ((W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell.support_eq_radius
        w (by simpa [deletedCriticalSupport] using hwSupport)).symm
  have hsecondDist :
      dist S.oppApex2 x = dist S.oppApex2 w :=
    (C.row₂.same_radius x hxB).trans
      (C.row₂.same_radius w hwB).symm
  constructor
  · intro hblockerSurplus
    exact ATAILForceScratch.false_of_sameCap_outsidePair_twoCenters
      S D.convex S.surplusIdx
      (by simpa only [capByIndex_surplusIdx_eq_surplusCap] using
        oppApex2_mem_surplusCap S)
      (by simpa only [capByIndex_surplusIdx_eq_surplusCap] using
        hblockerSurplus)
      C.actual_blocker_ne_center₂
      hxA hwA hxw
      (by
        rw [capByIndex_surplusIdx_eq_surplusCap]
        intro hxCap
        exact (Finset.mem_sdiff.mp hxStrict).2
          (Finset.mem_union.mpr (Or.inl hxCap)))
      (by
        rw [capByIndex_surplusIdx_eq_surplusCap]
        intro hwCap
        exact (Finset.mem_sdiff.mp hwStrict).2
          (Finset.mem_union.mpr (Or.inl hwCap)))
      hsecondDist hdeletedDist
  · intro hblockerOpp1
    exact ATAILForceScratch.false_of_sameCap_outsidePair_twoCenters
      S D.convex S.oppIndex1
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using
        oppApex2_mem_oppCap1 S)
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using
        hblockerOpp1)
      C.actual_blocker_ne_center₂
      hxA hwA hxw
      (by
        rw [capByIndex_oppIndex1_eq_oppCap1]
        intro hxCap
        exact (Finset.mem_sdiff.mp hxStrict).2
          (Finset.mem_union.mpr (Or.inr hxCap)))
      (by
        rw [capByIndex_oppIndex1_eq_oppCap1]
        intro hwCap
        exact (Finset.mem_sdiff.mp hwStrict).2
          (Finset.mem_union.mpr (Or.inr hwCap)))
      hsecondDist hdeletedDist

/-- The actual deleted-source blocker is therefore in strict `oppCap2`. -/
theorem twoLiveExactCover_two_supportStrict_forces_deletedBlocker_mem_strictSecondCap
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    W.H.centerAt deleted C.q_mem_A ∈ strictSecondCap S := by
  have hoff :=
    twoLiveExactCover_two_supportStrict_forces_deletedBlocker_off_adjacentCaps
      S W C F2 htwo
  have hblockerA : W.H.centerAt deleted C.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell.center_mem).2
  exact mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
    S hblockerA hoff.1 hoff.2

/-- The deleted source's selected critical shell exactly saturates the
`oppCap2` cap-incidence bound. -/
theorem twoLiveExactCover_two_supportStrict_saturates_deletedSupport_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    (deletedCriticalSupport C ∩ S.oppCap2).card = 2 := by
  let K : SelectedFourClass D.A
      (W.H.centerAt deleted C.q_mem_A) :=
    (W.H.selectedAt deleted C.q_mem_A).toSelectedFourClass
  have hblockerStrict :=
    twoLiveExactCover_two_supportStrict_forces_deletedBlocker_mem_strictSecondCap
      S W C F2 htwo
  have hblockerOpp2 :
      W.H.centerAt deleted C.q_mem_A ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hblockerStrict).1
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hupper :
      (deletedCriticalSupport C ∩ S.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 K
          (by simpa only [hcapEq] using hblockerOpp2)
    simpa [K, deletedCriticalSupport,
      CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass, hcapEq] using hraw
  have hsub :
      supportOnlyCell C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∩ strictSecondCap S ⊆
        deletedCriticalSupport C ∩ S.oppCap2 := by
    intro z hz
    have hzSupportOnly :=
      Finset.mem_inter.mp hz |>.1 |> Finset.mem_sdiff.mp
    have hzSupport : z ∈ deletedCriticalSupport C :=
      (Finset.mem_inter.mp hzSupportOnly.1).2
    have hzOpp2 : z ∈ S.oppCap2 :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1
    exact Finset.mem_inter.mpr ⟨hzSupport, hzOpp2⟩
  have hlower :
      2 ≤ (deletedCriticalSupport C ∩ S.oppCap2).card :=
    htwo.trans (Finset.card_le_card hsub)
  omega

/-- Exact checked reduction of the support-heavy branch. -/
structure F2SupportHeavyReduction
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Prop where
  supportStrict_card :
    (supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S).card = 2
  deletedBlocker_off_adjacentCaps :
    W.H.centerAt deleted C.q_mem_A ∉ S.surplusCap ∧
      W.H.centerAt deleted C.q_mem_A ∉ S.oppCap1
  deletedBlocker_mem_strictSecondCap :
    W.H.centerAt deleted C.q_mem_A ∈ strictSecondCap S
  deletedSupport_oppCap2_card :
    (deletedCriticalSupport C ∩ S.oppCap2).card = 2

/-- Package the exact support-heavy reduction. -/
theorem twoLiveExactCover_to_supportHeavyReduction
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    F2SupportHeavyReduction S W C := by
  have hsubset :
      supportOnlyCell C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∩ strictSecondCap S ⊆
        supportOnlyCell C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) :=
    Finset.inter_subset_left
  have hupper :=
    Finset.card_le_card hsubset
  have hsupportStrict :
      (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card = 2 := by
    have htotal := F2.failure.supportOnly_card
    omega
  exact {
    supportStrict_card := hsupportStrict
    deletedBlocker_off_adjacentCaps :=
      twoLiveExactCover_two_supportStrict_forces_deletedBlocker_off_adjacentCaps
        S W C F2 htwo
    deletedBlocker_mem_strictSecondCap :=
      twoLiveExactCover_two_supportStrict_forces_deletedBlocker_mem_strictSecondCap
        S W C F2 htwo
    deletedSupport_oppCap2_card :=
      twoLiveExactCover_two_supportStrict_saturates_deletedSupport_oppCap2
        S W C F2 htwo }

/-- The exact unresolved mixed arm: one strict live-only point and one strict
support-only point.  No blocker, audit-center, or q-critical role is added. -/
structure F2MixedOneLiveOneSupportBoundary
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Prop where
  liveStrict_card :
    (liveOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S).card = 1
  supportStrict_card :
    (supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S).card = 1

/-- If neither heavy arm occurs, the profile's checked trichotomy leaves
exactly the mixed one-live/one-support boundary. -/
theorem twoLiveExactCover_to_mixedBoundary_of_not_heavy
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (hnotLive :
      ¬ 2 ≤ (liveOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card)
    (hnotSupport :
      ¬ 2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    F2MixedOneLiveOneSupportBoundary S W C := by
  rcases F2.strict_cell_distribution with hlive | hsupport | hmixed
  · exact False.elim (hnotLive hlive)
  · exact False.elim (hnotSupport hsupport)
  · exact ⟨hmixed.1, hmixed.2⟩

/-- The two mixed witnesses are necessarily distinct, solely because one is
live-only and the other support-only. -/
theorem F2MixedOneLiveOneSupportBoundary.exists_distinct_witnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : F2MixedOneLiveOneSupportBoundary S W C) :
    ∃ x s : ℝ²,
      x ∈ liveOnlyCell C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∩ strictSecondCap S ∧
        s ∈ supportOnlyCell C.B₂
          ({q, t1, t2, t3} : Finset ℝ²)
          (deletedCriticalSupport C) ∩ strictSecondCap S ∧
        x ≠ s := by
  have hliveNonempty :
      (liveOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).Nonempty :=
    Finset.card_pos.mp (by
      rw [P.liveStrict_card]
      omega)
  have hsupportNonempty :
      (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).Nonempty :=
    Finset.card_pos.mp (by
      rw [P.supportStrict_card]
      omega)
  rcases hliveNonempty with ⟨x, hx⟩
  rcases hsupportNonempty with ⟨s, hs⟩
  refine ⟨x, s, hx, hs, ?_⟩
  have hxLive :
      x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hx).1).1).2
  have hsNotLive :
      s ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp (Finset.mem_inter.mp hs).1).2
  intro hxs
  exact hsNotLive (hxs ▸ hxLive)

#print axioms
  twoLiveExactCover_two_supportStrict_forces_deletedBlocker_off_adjacentCaps
#print axioms
  twoLiveExactCover_two_supportStrict_forces_deletedBlocker_mem_strictSecondCap
#print axioms
  twoLiveExactCover_two_supportStrict_saturates_deletedSupport_oppCap2
#print axioms twoLiveExactCover_to_supportHeavyReduction
#print axioms twoLiveExactCover_to_mixedBoundary_of_not_heavy
#print axioms
  F2MixedOneLiveOneSupportBoundary.exists_distinct_witnesses

end ATailRF2SupportHeavyReductionScratch
end Problem97
