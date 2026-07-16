/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginTaggedCoordinator

/-!
# Scratch: source-faithful F1/F3 strict-role handlers

The aligned F1 and F3 residuals both retain the exact second-apex row cap
profile.  This file keeps the named row roles instead of projecting them to an
anonymous support shadow:

* F1 uses the actual selected critical support at the deleted source;
* F3 uses the retained live dangerous row.

For either named carrier, the two strict second-cap witnesses have exactly
three possible distributions: two in the named carrier, two in its row
complement, or one in each.  In the named-carrier-heavy arm, ordered-cap
uniqueness forces the corresponding actual center into strict `oppCap2`.

This is a checked reduction, not an unconditional contradiction.  The F3
live-heavy arm does close when the aligned live center is `oppApex1`, as on
the spent-origin branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF1F3HandlerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFailureProfilesParentLiftScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailROriginTaggedCoordinatorScratch
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

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v1_mem_C3

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

/-- Any strict subset of a row, split by a named carrier, has one of the
three exact two-point distribution shapes needed below. -/
private theorem strictCarrier_distribution
    {α : Type*} [DecidableEq α]
    (B carrier strict : Finset α)
    (htwo : 2 ≤ (B ∩ strict).card) :
    2 ≤ ((B ∩ carrier) ∩ strict).card ∨
      2 ≤ ((B \ carrier) ∩ strict).card ∨
      (((B ∩ carrier) ∩ strict).card = 1 ∧
        ((B \ carrier) ∩ strict).card = 1) := by
  have hpartition :
      B ∩ strict =
        ((B ∩ carrier) ∩ strict) ∪ ((B \ carrier) ∩ strict) := by
    ext z
    simp only [Finset.mem_inter, Finset.mem_union, Finset.mem_sdiff]
    by_cases hz : z ∈ carrier <;> aesop
  have hsum :
      2 ≤ ((B ∩ carrier) ∩ strict).card +
        ((B \ carrier) ∩ strict).card := by
    calc
      2 ≤ (B ∩ strict).card := htwo
      _ = (((B ∩ carrier) ∩ strict) ∪
          ((B \ carrier) ∩ strict)).card := by rw [hpartition]
      _ ≤ ((B ∩ carrier) ∩ strict).card +
          ((B \ carrier) ∩ strict).card :=
        Finset.card_union_le _ _
  by_cases hshared : 2 ≤ ((B ∩ carrier) ∩ strict).card
  · exact Or.inl hshared
  by_cases hother : 2 ≤ ((B \ carrier) ∩ strict).card
  · exact Or.inr (Or.inl hother)
  · exact Or.inr (Or.inr ⟨by omega, by omega⟩)

/-- The source-faithful common output of F1 and F3: their unique point outside
both named rows is a fresh source in the actual second-apex row, and the
existing branch-complete prescribed transition is retained at that source. -/
structure SingleOutsideSourceTransition
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type where
  source : FreshCriticalSource C
  source_mem_secondRow :
    source.point ∈ C.B₂
  source_not_mem_live :
    source.point ∉ ({q, t1, t2, t3} : Finset ℝ²)
  transition :
    FreshSourcePrescribedTransition C source

/-- Construct the unique outside source from the exact outside-cell
cardinality.  The source and its selected blocker come from the retained
critical system; no shell is reselected. -/
def singleOutsideSourceTransition_of_outsideBoth_card_eq_one
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (houtside :
      (outsideBothCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)).card = 1) :
    Nonempty (SingleOutsideSourceTransition S W C) := by
  have hpos :
      0 < (outsideBothCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)).card := by
    omega
  rcases Finset.card_pos.mp hpos with ⟨z, hz⟩
  have hz' :
      z ∈ C.B₂ ∧
        z ∉ ({q, t1, t2, t3} : Finset ℝ²) ∪
          deletedCriticalSupport C := by
    simpa only [outsideBothCell, Finset.mem_sdiff] using hz
  have hzNotLive :
      z ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
    intro hzLive
    exact hz'.2 (Finset.mem_union.mpr (Or.inl hzLive))
  have hzNotSupport :
      z ∉ deletedCriticalSupport C := by
    intro hzSupport
    exact hz'.2 (Finset.mem_union.mpr (Or.inr hzSupport))
  let X : FreshCriticalSource C :=
    freshCriticalSource_of_mem C
      (Finset.mem_union.mpr (Or.inr hz'.1)) hzNotSupport
  exact ⟨{
    source := X
    source_mem_secondRow := by
      change z ∈ C.B₂
      exact hz'.1
    source_not_mem_live := by
      change z ∉ ({q, t1, t2, t3} : Finset ℝ²)
      exact hzNotLive
    transition := freshSourcePrescribedTransition C X }⟩

/-- The uniform outside-source transition supplied by F1. -/
def f1SingleOutsideSourceTransition
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (SingleOutsideSourceTransition S W C) :=
  singleOutsideSourceTransition_of_outsideBoth_card_eq_one
    S W C failure.outsideBoth_card

/-- The same uniform outside-source transition supplied by F3. -/
def f3SingleOutsideSourceTransition
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (SingleOutsideSourceTransition S W C) :=
  singleOutsideSourceTransition_of_outsideBoth_card_eq_one
    S W C failure.outsideBoth_card

/-- The off-live source makes deletion survive at the retained live center,
so its prescribed transition has only two genuine arms: a successor common
deletion or a critical shell at the second apex.  In the critical arm the
shell support is the retained second row. -/
inductive SingleOutsideSourceOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (X : SingleOutsideSourceTransition S W C) : Type
  | successor
      (packet :
        CommonDeletionTwoCenterPacket
          D W.H X.source.point p S.oppApex2) :
      SingleOutsideSourceOutcome S W C X
  | secondApexCritical
      (critical :
        PrescribedCriticalAt D X.source.point S.oppApex2)
      (support_eq_secondRow :
        critical.shell.toCriticalFourShell.support = C.B₂) :
      SingleOutsideSourceOutcome S W C X

/-- Refine the generic three-way prescribed transition using the retained
off-live role. -/
def nonempty_singleOutsideSourceOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (X : SingleOutsideSourceTransition S W C) :
    Nonempty (SingleOutsideSourceOutcome S W C X) := by
  have hfirst :
      HasNEquidistantPointsAt 4 (D.A.erase X.source.point) p :=
    deletion_survives_liveFirstCenter_of_not_mem_liveBase
      W X.source_not_mem_live
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := X.source.point) D.K4 C.center₂_mem_A with
    hsecond | ⟨K, hblocks⟩
  · rcases nonempty_commonDeletionTwoCenterPacket
      W.H X.source.mem_A C.center₁_mem_A C.center₂_mem_A
      C.centers_ne hfirst hsecond with ⟨G⟩
    exact ⟨SingleOutsideSourceOutcome.successor G⟩
  · let P : PrescribedCriticalAt D X.source.point S.oppApex2 :=
      { shell := K, blocks := hblocks }
    exact ⟨SingleOutsideSourceOutcome.secondApexCritical P (by
      simpa [P] using
        prescribedCritical_support_eq_qDeletedRow P C.row₂ C.B₂_card)⟩

/-- The complete uniform producer exported by either F1 or F3. -/
structure SingleOutsideSourceProducer
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type where
  sourceData :
    SingleOutsideSourceTransition S W C
  outcome :
    SingleOutsideSourceOutcome S W C sourceData

/-- F1 produces the exact one-source continuation/critical packet. -/
def f1SingleOutsideSourceProducer
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (SingleOutsideSourceProducer S W C) := by
  rcases f1SingleOutsideSourceTransition S W C failure with ⟨sourceData⟩
  rcases nonempty_singleOutsideSourceOutcome S W C sourceData with ⟨outcome⟩
  exact ⟨{ sourceData := sourceData, outcome := outcome }⟩

/-- F3 produces the same exact one-source continuation/critical packet. -/
def f3SingleOutsideSourceProducer
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (SingleOutsideSourceProducer S W C) := by
  rcases f3SingleOutsideSourceTransition S W C failure with ⟨sourceData⟩
  rcases nonempty_singleOutsideSourceOutcome S W C sourceData with ⟨outcome⟩
  exact ⟨{ sourceData := sourceData, outcome := outcome }⟩

/-- Origin-retaining wrapper for the common F1/F3 producer. -/
structure OriginAwareSingleOutsideSourceTransition
    {D : CounterexampleData}
    (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : ATailCriticalPairFrontier.CriticalPairFrontier
      D S radius W.H)
    {deleted : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type where
  origin :
    RCommonDeletionOrigin S W F deleted p C
  output :
    SingleOutsideSourceProducer S W C

/-- Attach the unchanged origin tag to the F1 outside-source output. -/
def originAware_f1SingleOutsideSourceTransition
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier
      D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (OriginAwareSingleOutsideSourceTransition S W F C) := by
  rcases f1SingleOutsideSourceProducer S W C failure with ⟨output⟩
  exact ⟨{ origin := origin, output := output }⟩

/-- Attach the unchanged origin tag to the F3 outside-source output. -/
def originAware_f3SingleOutsideSourceTransition
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier
      D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty (OriginAwareSingleOutsideSourceTransition S W F C) := by
  rcases f3SingleOutsideSourceProducer S W C failure with ⟨output⟩
  exact ⟨{ origin := origin, output := output }⟩

/-- Two strict points shared by the second-apex row and the retained live row
force the actual live center outside both caps adjacent to `oppCap2`. -/
theorem two_liveShared_strict_forces_p_off_adjacentCaps
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤
        ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card) :
    p ∉ S.surplusCap ∧ p ∉ S.oppCap1 := by
  have hone :
      1 <
        ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have hxShared := Finset.mem_inter.mp hx |>.1 |> Finset.mem_inter.mp
  have hwShared := Finset.mem_inter.mp hw |>.1 |> Finset.mem_inter.mp
  have hxB : x ∈ C.B₂ := hxShared.1
  have hwB : w ∈ C.B₂ := hwShared.1
  have hxLive : x ∈ ({q, t1, t2, t3} : Finset ℝ²) := hxShared.2
  have hwLive : w ∈ ({q, t1, t2, t3} : Finset ℝ²) := hwShared.2
  have hxStrict : x ∈ strictSecondCap S := (Finset.mem_inter.mp hx).2
  have hwStrict : w ∈ strictSecondCap S := (Finset.mem_inter.mp hw).2
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
  have hsecondDist :
      dist S.oppApex2 x = dist S.oppApex2 w :=
    (C.row₂.same_radius x hxB).trans
      (C.row₂.same_radius w hwB).symm
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
      hpdist hsecondDist
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
      hpdist hsecondDist

/-- The live center in the F3 shared-heavy arm is therefore an actual strict
second-cap point. -/
theorem two_liveShared_strict_forces_p_mem_strictSecondCap
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤
        ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card) :
    p ∈ strictSecondCap S := by
  have hoff := two_liveShared_strict_forces_p_off_adjacentCaps S W C htwo
  have hpA : p ∈ D.A :=
    (Finset.mem_erase.mp
      W.liveRow.toCriticalFourShell.center_mem).2
  exact mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
    S hpA hoff.1 hoff.2

/-- Two strict points shared by the second-apex row and the actual selected
critical support at `deleted` force that actual blocker outside both adjacent
caps. -/
theorem two_deletedSupportShared_strict_forces_blocker_off_adjacentCaps
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤
        ((C.B₂ ∩ deletedCriticalSupport C) ∩
          strictSecondCap S).card) :
    W.H.centerAt deleted C.q_mem_A ∉ S.surplusCap ∧
      W.H.centerAt deleted C.q_mem_A ∉ S.oppCap1 := by
  have hone :
      1 <
        ((C.B₂ ∩ deletedCriticalSupport C) ∩
          strictSecondCap S).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have hxShared := Finset.mem_inter.mp hx |>.1 |> Finset.mem_inter.mp
  have hwShared := Finset.mem_inter.mp hw |>.1 |> Finset.mem_inter.mp
  have hxB : x ∈ C.B₂ := hxShared.1
  have hwB : w ∈ C.B₂ := hwShared.1
  have hxSupport : x ∈ deletedCriticalSupport C := hxShared.2
  have hwSupport : w ∈ deletedCriticalSupport C := hwShared.2
  have hxStrict : x ∈ strictSecondCap S := (Finset.mem_inter.mp hx).2
  have hwStrict : w ∈ strictSecondCap S := (Finset.mem_inter.mp hw).2
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hxB)).2).2
  have hwA : w ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hwB)).2).2
  have hblockerDist :
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
      hsecondDist hblockerDist
  · intro hblockerOpp
    exact ATAILForceScratch.false_of_sameCap_outsidePair_twoCenters
      S D.convex S.oppIndex1
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using
        oppApex2_mem_oppCap1 S)
      (by simpa only [capByIndex_oppIndex1_eq_oppCap1] using
        hblockerOpp)
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
      hsecondDist hblockerDist

/-- The actual blocker at the F1 deleted source is therefore a strict
second-cap point. -/
theorem two_deletedSupportShared_strict_forces_blocker_mem_strictSecondCap
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤
        ((C.B₂ ∩ deletedCriticalSupport C) ∩
          strictSecondCap S).card) :
    W.H.centerAt deleted C.q_mem_A ∈ strictSecondCap S := by
  have hoff :=
    two_deletedSupportShared_strict_forces_blocker_off_adjacentCaps
      S W C htwo
  have hblockerA : W.H.centerAt deleted C.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (W.H.selectedAt deleted C.q_mem_A).toCriticalFourShell.center_mem).2
  exact mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps
    S hblockerA hoff.1 hoff.2

/-- Exact F1 strict-role surface.  The shared-heavy branch names and
localizes the actual deleted-source blocker; no selected representative is
replaced. -/
structure F1StrictRoleNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_cap : SecondApexRowCapProfile S C)
    (_failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) : Prop where
  deletedSupport_shared_card :
    (C.B₂ ∩ deletedCriticalSupport C).card = 2
  row_complement_card :
    (C.B₂ \ deletedCriticalSupport C).card = 2
  branch :
    (2 ≤ ((C.B₂ ∩ deletedCriticalSupport C) ∩
        strictSecondCap S).card ∧
      W.H.centerAt deleted C.q_mem_A ∈ strictSecondCap S) ∨
      (2 ≤ ((C.B₂ \ deletedCriticalSupport C) ∩
        strictSecondCap S).card) ∨
      (((C.B₂ ∩ deletedCriticalSupport C) ∩
          strictSecondCap S).card = 1 ∧
        ((C.B₂ \ deletedCriticalSupport C) ∩
          strictSecondCap S).card = 1)

/-- Construct the source-faithful F1 strict-role surface from the checked
aligned branch fields. -/
theorem f1StrictRoleNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    F1StrictRoleNormalForm S W C cap failure := by
  have hcomplement :
      (C.B₂ \ deletedCriticalSupport C).card = 2 := by
    have hsplit :=
      Finset.card_sdiff_add_card_inter C.B₂ (deletedCriticalSupport C)
    rw [C.B₂_card, failure.inter_support_card] at hsplit
    omega
  refine {
    deletedSupport_shared_card := failure.inter_support_card
    row_complement_card := hcomplement
    branch := ?_ }
  rcases
      strictCarrier_distribution C.B₂ (deletedCriticalSupport C)
        (strictSecondCap S) cap.strict_second_cap_card_ge_two with
    hshared | hother | hmixed
  · exact Or.inl ⟨hshared,
      two_deletedSupportShared_strict_forces_blocker_mem_strictSecondCap
        S W C hshared⟩
  · exact Or.inr (Or.inl hother)
  · exact Or.inr (Or.inr hmixed)

/-- Exact F3 strict-role surface.  The shared-heavy branch names and
localizes the retained live center. -/
structure F3StrictRoleNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_cap : SecondApexRowCapProfile S C)
    (_failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) : Prop where
  live_shared_card :
    (C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)).card = 2
  row_complement_card :
    (C.B₂ \ ({q, t1, t2, t3} : Finset ℝ²)).card = 2
  branch :
    (2 ≤ ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
        strictSecondCap S).card ∧
      p ∈ strictSecondCap S) ∨
      (2 ≤ ((C.B₂ \ ({q, t1, t2, t3} : Finset ℝ²)) ∩
        strictSecondCap S).card) ∨
      (((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card = 1 ∧
        ((C.B₂ \ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card = 1)

/-- Construct the source-faithful F3 strict-role surface from the checked
aligned branch fields. -/
theorem f3StrictRoleNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    F3StrictRoleNormalForm S W C cap failure := by
  have hcomplement :
      (C.B₂ \ ({q, t1, t2, t3} : Finset ℝ²)).card = 2 := by
    have hsplit :=
      Finset.card_sdiff_add_card_inter C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
    rw [C.B₂_card, failure.inter_live_card] at hsplit
    omega
  refine {
    live_shared_card := failure.inter_live_card
    row_complement_card := hcomplement
    branch := ?_ }
  rcases
      strictCarrier_distribution C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (strictSecondCap S) cap.strict_second_cap_card_ge_two with
    hshared | hother | hmixed
  · exact Or.inl ⟨hshared,
      two_liveShared_strict_forces_p_mem_strictSecondCap
        S W C hshared⟩
  · exact Or.inr (Or.inl hother)
  · exact Or.inr (Or.inr hmixed)

/-- The F3 shared-heavy arm is impossible when alignment identifies the live
center with the first opposite apex.  This is the spent-origin specialization
available without weakening or replacing the retained packet. -/
theorem false_of_f3_liveShared_strict_of_p_eq_oppApex1
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (hp : p = S.oppApex1)
    (htwo :
      2 ≤
        ((C.B₂ ∩ ({q, t1, t2, t3} : Finset ℝ²)) ∩
          strictSecondCap S).card) :
    False := by
  have hoff := two_liveShared_strict_forces_p_off_adjacentCaps S W C htwo
  exact hoff.1 (by simpa only [hp] using oppApex1_mem_surplusCap S)

#print axioms two_liveShared_strict_forces_p_off_adjacentCaps
#print axioms two_liveShared_strict_forces_p_mem_strictSecondCap
#print axioms two_deletedSupportShared_strict_forces_blocker_off_adjacentCaps
#print axioms two_deletedSupportShared_strict_forces_blocker_mem_strictSecondCap
#print axioms f1SingleOutsideSourceTransition
#print axioms f3SingleOutsideSourceTransition
#print axioms nonempty_singleOutsideSourceOutcome
#print axioms f1SingleOutsideSourceProducer
#print axioms f3SingleOutsideSourceProducer
#print axioms originAware_f1SingleOutsideSourceTransition
#print axioms originAware_f3SingleOutsideSourceTransition
#print axioms f1StrictRoleNormalForm
#print axioms f3StrictRoleNormalForm
#print axioms false_of_f3_liveShared_strict_of_p_eq_oppApex1

end ATailRF1F3HandlerScratch
end Problem97
