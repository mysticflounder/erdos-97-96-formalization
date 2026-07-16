/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TwoOffLiveFailureClassification
import LiveCommonDeletionExpansion
import GlobalCriticalContinuation
import same_cap_second_center

/-!
# Scratch: lift the two-off-live failure profiles to the retained full parent

This file specializes the exact F1/F2/F3 failure classification to the live
dangerous row and to a common-deletion second center at `oppApex2`.

The main positive output is an exact F2 cap/profile refinement.  It also
records the strongest role-faithful use of the existing same-cap consumer:
if the two strict `oppCap2` witnesses are both live-row points, then the live
center `p` is outside both caps adjacent to `oppCap2`.

This is a refinement, not an unconditional contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFailureProfilesParentLiftScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailGlobalCriticalContinuation
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- The part of the second opposite cap outside its two adjacent closed caps. -/
noncomputable def strictSecondCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Finset ℝ² :=
  S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)

/-- A q-deleted exact second row is also an ambient selected four-class. -/
def CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₂ where
  support := C.B₂
  support_subset_A := by
    intro z hz
    have hz' := C.row₂.subset hz
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz').2).2
  support_card := C.B₂_card
  radius := C.row₂.radius
  radius_pos := C.row₂.radius_pos
  support_eq_radius := C.row₂.same_radius
  center_not_mem := by
    intro hz
    exact (Finset.mem_erase.mp (C.row₂.subset hz)).1 rfl

/-- In F2, the deleted source's critical support has at most one live-row
point.  The two points of `support \ B` include the deleted source itself,
which is not live, while `B` contains no live/support overlap. -/
theorem TwoLiveExactCoverFailureProfile.support_inter_live_card_le_one
    {deleted : ℝ²} {B live support : Finset ℝ²}
    (F : TwoLiveExactCoverFailureProfile deleted B live support)
    (hdeleted_not_live : deleted ∉ live) :
    (support ∩ live).card ≤ 1 := by
  have hboth_empty : bothCell B live support = ∅ :=
    Finset.card_eq_zero.mp F.both_card
  have hsubset :
      support ∩ live ⊆ (support \ B).erase deleted := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzsupport, hzlive⟩
    apply Finset.mem_erase.mpr
    refine ⟨?_, Finset.mem_sdiff.mpr ⟨hzsupport, ?_⟩⟩
    · intro hzd
      exact hdeleted_not_live (hzd ▸ hzlive)
    · intro hzB
      have hzboth : z ∈ bothCell B live support := by
        simp only [bothCell, Finset.mem_inter]
        exact ⟨⟨hzB, hzlive⟩, hzsupport⟩
      rw [hboth_empty] at hzboth
      simp at hzboth
  have hcard :=
    Finset.card_le_card hsubset
  have herase :
      ((support \ B).erase deleted).card = 1 := by
    rw [Finset.card_erase_of_mem F.deleted_mem_support_sdiff_row,
      F.support_sdiff_row_card]
  rw [herase] at hcard
  exact hcard

/-- The same one-live bound holds in F1. -/
theorem OneLiveOverlapFailureProfile.support_inter_live_card_le_one
    {deleted : ℝ²} {B live support : Finset ℝ²}
    (F : OneLiveOverlapFailureProfile deleted B live support)
    (hdeleted_not_live : deleted ∉ live) :
    (support ∩ live).card ≤ 1 := by
  have hboth_empty : bothCell B live support = ∅ :=
    Finset.card_eq_zero.mp F.both_card
  have hsubset :
      support ∩ live ⊆ (support \ B).erase deleted := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzsupport, hzlive⟩
    apply Finset.mem_erase.mpr
    refine ⟨?_, Finset.mem_sdiff.mpr ⟨hzsupport, ?_⟩⟩
    · intro hzd
      exact hdeleted_not_live (hzd ▸ hzlive)
    · intro hzB
      have hzboth : z ∈ bothCell B live support := by
        simp only [bothCell, Finset.mem_inter]
        exact ⟨⟨hzB, hzlive⟩, hzsupport⟩
      rw [hboth_empty] at hzboth
      simp at hzboth
  have hcard :=
    Finset.card_le_card hsubset
  have herase :
      ((support \ B).erase deleted).card = 1 := by
    rw [Finset.card_erase_of_mem F.deleted_mem_support_sdiff_row,
      F.support_sdiff_row_card]
  rw [herase] at hcard
  exact hcard

/-- Any live-row common-deletion packet has at most two live points in the
deleted source's selected critical support.  This is the dangerous-circle
distinct-center bound on the first exact row. -/
theorem deletedCriticalSupport_inter_live_card_le_two
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²} {live : Finset ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (hrow : C.B₁ = live) :
    (deletedCriticalSupport C ∩ live).card ≤ 2 := by
  have htwo :
      2 ≤ (C.B₁ \ deletedCriticalSupport C).card := by
    simpa using two_le_row_sdiff_deletedCriticalSupport C (0 : Fin 2)
  have hsplit :=
    Finset.card_sdiff_add_card_inter C.B₁ (deletedCriticalSupport C)
  rw [C.B₁_card] at hsplit
  have hinter :
      (deletedCriticalSupport C ∩ live).card =
        (C.B₁ ∩ deletedCriticalSupport C).card := by
    rw [← hrow]
    congr 1
    exact Finset.inter_comm _ _
  rw [hinter]
  omega

/-- The F2 row is exactly the disjoint union of its two two-point cells. -/
theorem TwoLiveExactCoverFailureProfile.row_eq_liveOnly_union_supportOnly
    {deleted : ℝ²} {B live support : Finset ℝ²}
    (F : TwoLiveExactCoverFailureProfile deleted B live support) :
    B = liveOnlyCell B live support ∪ supportOnlyCell B live support := by
  have hboth_empty : bothCell B live support = ∅ :=
    Finset.card_eq_zero.mp F.both_card
  ext z
  constructor
  · intro hzB
    have hzUnion := F.row_subset_live_union_support hzB
    rcases Finset.mem_union.mp hzUnion with hzlive | hzsupport
    · by_cases hzsupport : z ∈ support
      · have hzboth : z ∈ bothCell B live support := by
          simp only [bothCell, Finset.mem_inter]
          exact ⟨⟨hzB, hzlive⟩, hzsupport⟩
        rw [hboth_empty] at hzboth
        simp at hzboth
      · exact Finset.mem_union.mpr <| Or.inl <|
          Finset.mem_sdiff.mpr
            ⟨Finset.mem_inter.mpr ⟨hzB, hzlive⟩, hzsupport⟩
    · by_cases hzlive : z ∈ live
      · have hzboth : z ∈ bothCell B live support := by
          simp only [bothCell, Finset.mem_inter]
          exact ⟨⟨hzB, hzlive⟩, hzsupport⟩
        rw [hboth_empty] at hzboth
        simp at hzboth
      · exact Finset.mem_union.mpr <| Or.inr <|
          Finset.mem_sdiff.mpr
            ⟨Finset.mem_inter.mpr ⟨hzB, hzsupport⟩, hzlive⟩
  · intro hz
    rcases Finset.mem_union.mp hz with hz | hz
    · exact (Finset.mem_inter.mp (Finset.mem_sdiff.mp hz).1).1
    · exact (Finset.mem_inter.mp (Finset.mem_sdiff.mp hz).1).1

/-- Cap information attached to every common-deletion row centered at the
second opposite apex, independently of which finite failure profile occurs. -/
structure SecondApexRowCapProfile
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted p : ℝ²}
    (S : SurplusCapPacket D.A)
    (C : CommonDeletionTwoCenterPacket D H deleted p S.oppApex2) : Prop where
  strict_second_cap_card_ge_two :
    2 ≤ (C.B₂ ∩ strictSecondCap S).card
  global_K4_on_strict :
    ∀ z ∈ C.B₂ ∩ strictSecondCap S,
      Nonempty (SelectedFourClass D.A z)

/-- Repacket the unchanged carrier data around the actual full-parent cap
packet and apply the second-apex strict-interior theorem. -/
theorem secondApexRow_to_capProfile
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted p : ℝ²}
    (S : SurplusCapPacket D.A)
    (C : CommonDeletionTwoCenterPacket D H deleted p S.oppApex2) :
    SecondApexRowCapProfile S C := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  let K : SelectedFourClass D.A S.oppApex2 :=
    CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
  refine {
    strict_second_cap_card_ge_two := ?_
    global_K4_on_strict := ?_ }
  · simpa [DS, K, strictSecondCap] using
      secondApex_support_strictInterior_card_ge_two DS K
  · intro z hz
    exact exists_selectedFourClass_of_globalK4 D.K4
      ((Finset.mem_erase.mp
        (Finset.mem_erase.mp
          (C.row₂.subset (Finset.mem_inter.mp hz).1)).2).2)

/-- The exact F2 parent-cap refinement at the second opposite apex. -/
structure TwoLiveExactCoverSecondApexProfile
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted p : ℝ²} {live : Finset ℝ²}
    (S : SurplusCapPacket D.A)
    (C : CommonDeletionTwoCenterPacket D H deleted p S.oppApex2) :
    Prop where
  failure :
    TwoLiveExactCoverFailureProfile deleted C.B₂ live
      (deletedCriticalSupport C)
  deletedSupport_inter_live_card_le_one :
    (deletedCriticalSupport C ∩ live).card ≤ 1
  strict_second_cap_card_ge_two :
    2 ≤ (C.B₂ ∩ strictSecondCap S).card
  strict_cell_distribution :
    let liveStrict :=
      liveOnlyCell C.B₂ live (deletedCriticalSupport C) ∩
        strictSecondCap S
    let supportStrict :=
      supportOnlyCell C.B₂ live (deletedCriticalSupport C) ∩
        strictSecondCap S
    2 ≤ liveStrict.card ∨
      2 ≤ supportStrict.card ∨
      (liveStrict.card = 1 ∧ supportStrict.card = 1)
  global_K4_on_strict :
    ∀ z ∈ C.B₂ ∩ strictSecondCap S,
      Nonempty (SelectedFourClass D.A z)

/-- The parent fact `q ∈ surplusCap` removes the original live source from the
strict second-cap region. -/
theorem liveSource_not_mem_strictSecondCap
    {D : CounterexampleData} {q : ℝ²}
    (S : SurplusCapPacket D.A)
    (hqSurplus : q ∈ S.surplusCap) :
    q ∉ strictSecondCap S := by
  intro hqStrict
  exact (Finset.mem_sdiff.mp hqStrict).2
    (Finset.mem_union.mpr (Or.inl hqSurplus))

/-- Build the exact F2 parent-cap profile from the live packet. -/
theorem twoLiveExactCover_to_secondApexProfile
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F : TwoLiveExactCoverFailureProfile deleted C.B₂
      ({q, t1, t2, t3} : Finset ℝ²) (deletedCriticalSupport C)) :
    TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  let K : SelectedFourClass D.A S.oppApex2 :=
    CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
  have hdeleted_not_live :
      deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    commonDeletion_deleted_not_mem_liveBase C
  have hstrict :
      2 ≤ (C.B₂ ∩ strictSecondCap S).card := by
    simpa [DS, K, strictSecondCap] using
      secondApex_support_strictInterior_card_ge_two DS K
  have hrow :=
    TwoLiveExactCoverFailureProfile.row_eq_liveOnly_union_supportOnly F
  let liveStrict :=
    liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  let supportStrict :=
    supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  have hstrict_eq :
      C.B₂ ∩ strictSecondCap S =
        liveStrict ∪ supportStrict := by
    rw [hrow]
    ext z
    simp only [Finset.mem_inter, Finset.mem_union, liveStrict, supportStrict]
    tauto
  have hdistribution :
      2 ≤ liveStrict.card ∨
        2 ≤ supportStrict.card ∨
        (liveStrict.card = 1 ∧ supportStrict.card = 1) := by
    by_cases hlive : 2 ≤ liveStrict.card
    · exact Or.inl hlive
    by_cases hsupport : 2 ≤ supportStrict.card
    · exact Or.inr (Or.inl hsupport)
    right
    right
    have hcard_union :
        2 ≤ (liveStrict ∪ supportStrict).card := by
      simpa [hstrict_eq] using hstrict
    have hunion_le :
        (liveStrict ∪ supportStrict).card ≤
          liveStrict.card + supportStrict.card :=
      Finset.card_union_le _ _
    omega
  refine {
    failure := F
    deletedSupport_inter_live_card_le_one :=
      TwoLiveExactCoverFailureProfile.support_inter_live_card_le_one
        F hdeleted_not_live
    strict_second_cap_card_ge_two := hstrict
    strict_cell_distribution := ?_
    global_K4_on_strict := ?_ }
  · simpa [liveStrict, supportStrict] using hdistribution
  · intro z hz
    exact exists_selectedFourClass_of_globalK4 D.K4
      ((Finset.mem_erase.mp
        (Finset.mem_erase.mp
          (C.row₂.subset (Finset.mem_inter.mp hz).1)).2).2)

/-- Actual live-packet specialization of the complete F1/F2/F3 trichotomy.

Every branch receives the second-apex cap profile.  F1 gains the sharp
one-live bound on the deleted critical support; F2 gains the full exact
two-cell cap refinement; F3 remains the exact finite profile from the
classification theorem. -/
theorem liveSecondApex_failure_refinement
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (hfail :
      ¬ 2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card) :
    SecondApexRowCapProfile S C ∧
      ((OneLiveOverlapFailureProfile deleted C.B₂
          ({q, t1, t2, t3} : Finset ℝ²) (deletedCriticalSupport C) ∧
        (deletedCriticalSupport C ∩
          ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 1) ∨
        TwoLiveExactCoverSecondApexProfile
          (live := ({q, t1, t2, t3} : Finset ℝ²)) S C ∨
        (TwoLiveOneOffFailureProfile deleted C.B₂
            ({q, t1, t2, t3} : Finset ℝ²) (deletedCriticalSupport C) ∧
          (deletedCriticalSupport C ∩
            ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2)) := by
  have hrow :
      C.B₁ = ({q, t1, t2, t3} : Finset ℝ²) :=
    commonDeletion_firstRow_eq_liveBase C
  have hdeleted_not_live :
      deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) :=
    commonDeletion_deleted_not_mem_liveBase C
  refine ⟨secondApexRow_to_capProfile S C, ?_⟩
  rcases twoOffLive_failure_trichotomy C hrow hfail with F1 | F2 | F3
  · exact Or.inl
      ⟨F1, OneLiveOverlapFailureProfile.support_inter_live_card_le_one
        F1 hdeleted_not_live⟩
  · exact Or.inr <| Or.inl <|
      twoLiveExactCover_to_secondApexProfile S W C F2
  · exact Or.inr <| Or.inr
      ⟨F3, deletedCriticalSupport_inter_live_card_le_two C hrow⟩

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

/-- Two strict live-row witnesses close the same-cap branches and therefore
force the live center outside both caps adjacent to `oppCap2`.

This is the strongest direct use of the current cap-order consumer whose roles
are supplied by the F2 packet without inventing a U5 audit class. -/
theorem twoLiveExactCover_two_liveStrict_forces_p_off_adjacentCaps
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    p ∉ S.surplusCap ∧ p ∉ S.oppCap1 := by
  have hone :
      1 < (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have hxLiveOnly :=
    Finset.mem_inter.mp hx |>.1 |> Finset.mem_sdiff.mp
  have hwLiveOnly :=
    Finset.mem_inter.mp hw |>.1 |> Finset.mem_sdiff.mp
  have hxB : x ∈ C.B₂ := (Finset.mem_inter.mp hxLiveOnly.1).1
  have hwB : w ∈ C.B₂ := (Finset.mem_inter.mp hwLiveOnly.1).1
  have hxLive :
      x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp hxLiveOnly.1).2
  have hwLive :
      w ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp hwLiveOnly.1).2
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
  have hpdist : dist p x = dist p w := by
    have hxSupport : x ∈ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact hxLive
    have hwSupport : w ∈ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact hwLive
    exact
      (W.liveRow.toCriticalFourShell.support_eq_radius x hxSupport).trans
        (W.liveRow.toCriticalFourShell.support_eq_radius w hwSupport).symm
  have hcdist : dist S.oppApex2 x =
      dist S.oppApex2 w :=
    (C.row₂.same_radius x hxB).trans (C.row₂.same_radius w hwB).symm
  constructor
  · intro hpSurplus
    exact ATAILForceScratch.false_of_sameCap_outsidePair_twoCenters
      S D.convex S.surplusIdx
      (by simpa only [capByIndex_surplusIdx_eq_surplusCap] using hpSurplus)
      (by simpa only [capByIndex_surplusIdx_eq_surplusCap] using
        oppApex2_mem_surplusCap S)
      C.centers_ne.symm hxA hwA hxw
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
      hpdist hcdist
  · intro hpOpp
    exact ATAILForceScratch.false_of_sameCap_outsidePair_twoCenters
      S D.convex S.oppIndex1
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using hpOpp)
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using
        oppApex2_mem_oppCap1 S)
      C.centers_ne.symm hxA hwA hxw
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
      hpdist hcdist

#print axioms TwoLiveExactCoverFailureProfile.support_inter_live_card_le_one
#print axioms OneLiveOverlapFailureProfile.support_inter_live_card_le_one
#print axioms deletedCriticalSupport_inter_live_card_le_two
#print axioms TwoLiveExactCoverFailureProfile.row_eq_liveOnly_union_supportOnly
#print axioms secondApexRow_to_capProfile
#print axioms liveSource_not_mem_strictSecondCap
#print axioms twoLiveExactCover_to_secondApexProfile
#print axioms liveSecondApex_failure_refinement
#print axioms twoLiveExactCover_two_liveStrict_forces_p_off_adjacentCaps

end ATailRFailureProfilesParentLiftScratch
end Problem97
