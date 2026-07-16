/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CrossSurvivalEliminator

/-!
# Scratch: global source selection from a surviving continuation row

This file takes the exact `CrossSurvivalOutput` row one generation further.
The input is not a cardinality-only shadow: it retains the actual
`CounterexampleData`, ordered surplus-cap packet, and common
`CriticalShellSystem` selected by the parent.

If the deleted source's chosen blocker remains in `oppCap2`, ordered-cap
uniqueness forces one survivor-row source outside both `oppCap2` and the
deleted source's critical shell.  Global K4 then supplies a row centered at
that fresh source.  The new row has at least two points outside the old row
and has an exact membership/deletion-survival split against both the deleted
source and the old row center.

The remaining alternative is equally concrete: the deleted source's chosen
blocker has left `oppCap2`.  No contradiction is claimed for that branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalSourceSelectionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailContinuationCapOrderClassifierScratch
open ATailContinuationGeometryClassifier
open ATailContinuationBankMatchScratch
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

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

/-- A selected four-row survives deletion of every point omitted from its
support. -/
private theorem erase_survives_of_not_mem_selectedSupport
    {A : Finset ℝ²} {center deleted : ℝ²}
    (K : SelectedFourClass A center)
    (hdeleted : deleted ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase deleted).filter
        fun x => dist center x = K.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h => hdeleted (h ▸ hx), K.support_subset_A hx⟩,
          K.support_eq_radius x hx⟩

/-- Exact Boolean boundary for a selected row relative to one deletion: the
deleted point either belongs to the chosen support or that very support
survives the deletion. -/
theorem mem_or_erase_survives
    {A : Finset ℝ²} {center deleted : ℝ²}
    (K : SelectedFourClass A center) :
    deleted ∈ K.support ∨
      HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  by_cases h : deleted ∈ K.support
  · exact Or.inl h
  · exact Or.inr (erase_survives_of_not_mem_selectedSupport K h)

/-- Compare an actual selected row with the chosen critical row sourced at
one of its support points.  If the two centers coincide, criticality locks
the supports exactly.  Otherwise the two-circle bound leaves at least two
points of the actual row outside the critical row. -/
theorem sourceBlocker_rowLock_or_twoEscapes
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center source : ℝ²}
    (K : SelectedFourClass D.A center)
    (hsource : source ∈ K.support) :
    K.support =
        (H.selectedAt source (K.support_subset_A hsource)).toCriticalFourShell.support ∨
      2 ≤ (K.support \
        (H.selectedAt source (K.support_subset_A hsource)).toCriticalFourShell.support).card := by
  let hsourceA : source ∈ D.A := K.support_subset_A hsource
  by_cases hcenters : H.centerAt source hsourceA = center
  · left
    have hradius :
        K.radius =
          (H.selectedAt source hsourceA).toCriticalFourShell.radius := by
      calc
        K.radius = dist center source :=
          (K.support_eq_radius source hsource).symm
        _ = dist (H.centerAt source hsourceA) source := by
          rw [hcenters]
        _ = (H.selectedAt source hsourceA).toCriticalFourShell.radius :=
          (H.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
            source
            (H.selectedAt source hsourceA).toCriticalFourShell.q_mem_support
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      apply
        (H.selectedAt source hsourceA).toCriticalFourShell.off_row_named_label_forbidden
          (K.support_subset_A hz)
      calc
        dist (H.centerAt source hsourceA) z = dist center z := by
          rw [hcenters]
        _ = K.radius := K.support_eq_radius z hz
        _ = (H.selectedAt source hsourceA).toCriticalFourShell.radius :=
          hradius
    · rw [K.support_card,
        (H.selectedAt source hsourceA).toCriticalFourShell.support_card]
  · right
    have hinter :
        (K.support ∩
          (H.selectedAt source hsourceA).toCriticalFourShell.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two
        K
        (H.selectedAt source hsourceA).toSelectedFourClass
        (fun h => hcenters h.symm)
    have hsplit := Finset.card_sdiff_add_card_inter K.support
      (H.selectedAt source hsourceA).toCriticalFourShell.support
    have hcard := K.support_card
    simpa [hsourceA] using (show
      2 ≤ (K.support \
        (H.selectedAt source hsourceA).toCriticalFourShell.support).card by
          omega)

/-- One fresh source selected from the survivor row, together with both
second-generation rows that are genuinely available:

* the source's chosen critical-blocker row from the common system; and
* a global-K4 row centered at the source itself.

The global row has two witnesses outside the old survivor row.  Its
membership splits record the precise next consumer boundary instead of
assuming either deletion survival. -/
structure GlobalEscapeSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (C : SurvivingContinuationRow D S H) where
  source : ℝ²
  source_mem_row : source ∈ C.row.support
  source_mem_A : source ∈ D.A
  source_outside_oppCap2 : source ∉ S.oppCap2
  source_outside_deletedShell :
    source ∉
      (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support
  blocker_ne_deletedBlocker :
    H.centerAt source source_mem_A ≠
      H.centerAt C.deleted C.deleted_mem_A
  blockerRow_lock_or_twoEscapes :
    C.row.support =
        (H.selectedAt source source_mem_A).toCriticalFourShell.support ∨
      2 ≤ (C.row.support \
        (H.selectedAt source source_mem_A).toCriticalFourShell.support).card
  globalRow : SelectedFourClass D.A source
  globalRow_twoEscapes :
    2 ≤ (globalRow.support \ C.row.support).card
  deleted_mem_globalRow_or_survives :
    C.deleted ∈ globalRow.support ∨
      HasNEquidistantPointsAt 4 (D.A.erase C.deleted) source
  oldCenter_mem_globalRow_or_survives :
    C.center ∈ globalRow.support ∨
      HasNEquidistantPointsAt 4 (D.A.erase C.center) source

namespace GlobalEscapeSource

/-- The fresh source is distinct from the old survivor center because it is
a support point of a row whose center is excluded from its support. -/
theorem source_ne_oldCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C) : E.source ≠ C.center := by
  intro h
  exact C.row.center_not_mem (by simpa [h] using E.source_mem_row)

/-- Prescribed deletion criticality at the fresh center locks the arbitrary
global-K4 row chosen there to the resulting exact critical shell. -/
theorem globalRow_support_eq_criticalSupport_of_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C)
    {q : ℝ²}
    (Q : CriticalSelectedFourClass D.A q E.source)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q) E.source) :
    E.globalRow.support = Q.toCriticalFourShell.support := by
  have hqGlobal : q ∈ E.globalRow.support := by
    by_contra hqOutside
    exact hblocked
      (erase_survives_of_not_mem_selectedSupport E.globalRow hqOutside)
  have hradius :
      E.globalRow.radius = Q.toCriticalFourShell.radius := by
    calc
      E.globalRow.radius = dist E.source q :=
        (E.globalRow.support_eq_radius q hqGlobal).symm
      _ = Q.toCriticalFourShell.radius :=
        Q.toCriticalFourShell.support_eq_radius q
          Q.toCriticalFourShell.q_mem_support
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    exact Q.toCriticalFourShell.off_row_named_label_forbidden
      (E.globalRow.support_subset_A hz)
      ((E.globalRow.support_eq_radius z hz).trans hradius)
  · rw [E.globalRow.support_card,
      Q.toCriticalFourShell.support_card]

/-- At the fresh center, one prescribed deletion has a branch-complete exact
outcome.  If deletion survives, the old survivor center and the fresh source
form an existing `CommonDeletionTwoCenterPacket`.  If it does not, global K4
produces a named critical shell and locks the chosen global row to it.

This is the precise consumer boundary behind the informal "prescribed
deletion criticality" edge: no selector alignment is assumed. -/
theorem commonDeletion_or_prescribedCritical_at_globalEscapeSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C)
    {q : ℝ²}
    (hqA : q ∈ D.A)
    (holdSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) C.center) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H q C.center E.source) ∨
      ∃ Q : CriticalSelectedFourClass D.A q E.source,
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q) E.source ∧
        E.globalRow.support = Q.toCriticalFourShell.support := by
  rcases erase_survives_or_criticalSelectedFourClass_at
      D.K4 E.source_mem_A with hsourceSurvives | ⟨Q, hblocked⟩
  · left
    exact nonempty_commonDeletionTwoCenterPacket
      (D := rebasePacket D S) H hqA C.center_mem_A E.source_mem_A
      E.source_ne_oldCenter.symm holdSurvives hsourceSurvives
  · right
    exact ⟨Q, hblocked,
      E.globalRow_support_eq_criticalSupport_of_blocked Q hblocked⟩

/-- Specialization to the continuation's deleted source.  The survivor fact
stored in `C` supplies the old-center half of the common-deletion packet. -/
theorem deletedSource_commonDeletion_or_prescribedCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H C.deleted C.center E.source) ∨
      ∃ Q : CriticalSelectedFourClass D.A C.deleted E.source,
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase C.deleted) E.source ∧
        E.globalRow.support = Q.toCriticalFourShell.support :=
  E.commonDeletion_or_prescribedCritical_at_globalEscapeSource
    C.deleted_mem_A C.survives

/-- The old row also survives deletion of its own center, since a positive
radius selected row never contains its center.  Hence the same exact split is
available with the old center as the prescribed deletion. -/
theorem oldCenter_commonDeletion_or_prescribedCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H C.center C.center E.source) ∨
      ∃ Q : CriticalSelectedFourClass D.A C.center E.source,
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase C.center) E.source ∧
        E.globalRow.support = Q.toCriticalFourShell.support := by
  apply E.commonDeletion_or_prescribedCritical_at_globalEscapeSource
    C.center_mem_A
  exact erase_survives_of_not_mem_selectedSupport C.row C.row.center_not_mem

end GlobalEscapeSource

/-- Retain the parent second-apex row when orienting a cross-survival.  The
lighter `SurvivingContinuationRow` deliberately forgot this row, but the next
ordered-cap consumer needs the fact that both continuation centers are the
strict `oppCap2` pair selected by the same second-apex circle. -/
structure CrossSurvivalApexPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) where
  survivor : SurvivingContinuationRow D S H
  apexRow : SelectedFourClass D.A S.oppApex2
  center_mem_apexRow :
    survivor.center ∈ apexRow.support ∩
      (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
  deleted_mem_apexRow :
    survivor.deleted ∈ apexRow.support ∩
      (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))

/-- The continuation center is strictly outside the surplus cap. -/
private theorem CrossSurvivalApexPacket.center_not_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.center ∉ S.surplusCap := by
  intro hcenter
  exact
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp O.center_mem_apexRow).2).2
      (Finset.mem_union.mpr (Or.inl hcenter))

/-- The deleted continuation source is also strictly outside the surplus
cap. -/
private theorem CrossSurvivalApexPacket.deleted_not_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.deleted ∉ S.surplusCap := by
  intro hdeleted
  exact
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp O.deleted_mem_apexRow).2).2
      (Finset.mem_union.mpr (Or.inl hdeleted))

/-- Exact residual when the fresh global-K4 source is forced to be the
second apex.  Both prescribed deletions are critical at that same apex, and
the chosen global row is locked to both resulting critical shells. -/
structure ApexDoubleCriticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  escape : GlobalEscapeSource O.survivor
  source_eq_oppApex2 : escape.source = S.oppApex2
  deletedCritical :
    CriticalSelectedFourClass D.A O.survivor.deleted escape.source
  deletedBlocks :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase O.survivor.deleted) escape.source
  deletedSupport :
    escape.globalRow.support =
      deletedCritical.toCriticalFourShell.support
  centerCritical :
    CriticalSelectedFourClass D.A O.survivor.center escape.source
  centerBlocks :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase O.survivor.center) escape.source
  centerSupport :
    escape.globalRow.support = centerCritical.toCriticalFourShell.support

/-- Exact residual when the deleted source's retained critical blocker is
the second apex.  The parent apex row is then exactly the shell already
selected by the common critical system. -/
structure DeletedBlockerApexAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  blocker_eq_oppApex2 :
    H.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
      S.oppApex2
  apexRow_support_eq_shell :
    O.apexRow.support =
      (H.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A).toCriticalFourShell.support

/-- Orient the cross-survival without dropping its parent second-apex row. -/
theorem nonempty_crossSurvivalApexPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    Nonempty (CrossSurvivalApexPacket D S H) := by
  rcases hcross with ⟨hsurvives, ⟨R⟩⟩ | ⟨hsurvives, ⟨R⟩⟩
  · exact ⟨{
      survivor := {
        center := P.z₁
        deleted := P.z₂
        center_mem_A := P.z₁_mem_A
        deleted_mem_A := P.z₂_mem_A
        center_ne_deleted := P.z₁_ne_z₂
        center_strict := (Finset.mem_inter.mp P.z₁_mem).2
        survives := hsurvives
        exactRow := R }
      apexRow := K.row
      center_mem_apexRow := P.z₁_mem
      deleted_mem_apexRow := P.z₂_mem }⟩
  · exact ⟨{
      survivor := {
        center := P.z₂
        deleted := P.z₁
        center_mem_A := P.z₂_mem_A
        deleted_mem_A := P.z₁_mem_A
        center_ne_deleted := P.z₁_ne_z₂.symm
        center_strict := (Finset.mem_inter.mp P.z₂_mem).2
        survives := hsurvives
        exactRow := R }
      apexRow := K.row
      center_mem_apexRow := P.z₂_mem
      deleted_mem_apexRow := P.z₁_mem }⟩

private theorem mem_surplusCap_or_oppCap1_or_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.surplusCap ∨ x ∈ S.oppCap1 ∨ x ∈ S.oppCap2 := by
  have hcaps :
      x ∈ S.partition.C1 ∨
        x ∈ S.partition.C2 ∨ x ∈ S.partition.C3 := by
    by_cases hxM : x ∈ S.triangle.verts
    · have hcount := S.partition.moser_in_two x hxM
      by_contra hnone
      simp only [not_or] at hnone
      simp [hnone.1, hnone.2.1, hnone.2.2] at hcount
    · have hcount := S.partition.nonmoser_in_one x hxA hxM
      by_contra hnone
      simp only [not_or] at hnone
      simp [hnone.1, hnone.2.1, hnone.2.2] at hcount
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi, or_comm, or_left_comm, or_assoc] using
        hcaps

/-- An escape source outside `oppCap2` is either in the surplus cap or in the
strict interior of `oppCap1`. -/
theorem GlobalEscapeSource.source_mem_surplusCap_or_strictOppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {C : SurvivingContinuationRow D S H}
    (E : GlobalEscapeSource C) :
    E.source ∈ S.surplusCap ∨
      E.source ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  rcases mem_surplusCap_or_oppCap1_or_oppCap2 S E.source_mem_A with
    hsurplus | hopp1 | hopp2
  · exact Or.inl hsurplus
  · by_cases hsurplus : E.source ∈ S.surplusCap
    · exact Or.inl hsurplus
    · exact Or.inr (Finset.mem_sdiff.mpr ⟨hopp1, by
        intro hunion
        rcases Finset.mem_union.mp hunion with hs | h2
        · exact hsurplus hs
        · exact E.source_outside_oppCap2 h2⟩)
  · exact False.elim (E.source_outside_oppCap2 hopp2)

/-- Outside the surplus cap, the two prescribed-deletion splits cannot both
land in their critical arms.  Both critical supports would force the fresh
global row to contain the two strict `oppCap2` continuation centers, while
the ordered-cap theorem says a strict `oppCap1` center distinguishes that
pair by distance.

Thus every global escape yields a common-deletion packet for either the
original deleted source or the old continuation center, unless the fresh
source itself has entered the surplus cap. -/
theorem globalEscape_commonDeletion_or_source_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (E : GlobalEscapeSource O.survivor) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.deleted
          O.survivor.center E.source) ∨
      Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center
          O.survivor.center E.source) ∨
      E.source ∈ S.surplusCap := by
  rcases E.source_mem_surplusCap_or_strictOppCap1 with
    hsurplus | hstrict
  · exact Or.inr (Or.inr hsurplus)
  · rcases E.deletedSource_commonDeletion_or_prescribedCritical with
      hcommonDeleted | ⟨Qdeleted, hdeletedBlocks, hdeletedSupport⟩
    · exact Or.inl hcommonDeleted
    · rcases E.oldCenter_commonDeletion_or_prescribedCritical with
        hcommonCenter | ⟨Qcenter, hcenterBlocks, hcenterSupport⟩
      · exact Or.inr (Or.inl hcommonCenter)
      · exfalso
        have hdeletedGlobal :
            O.survivor.deleted ∈ E.globalRow.support := by
          rw [hdeletedSupport]
          exact Qdeleted.toCriticalFourShell.q_mem_support
        have hcenterGlobal :
            O.survivor.center ∈ E.globalRow.support := by
          rw [hcenterSupport]
          exact Qcenter.toCriticalFourShell.q_mem_support
        have hseparates :
            dist E.source O.survivor.center ≠
              dist E.source O.survivor.deleted :=
          firstCap_center_separates_secondApex_pair
            (rebasePacket D S) O.apexRow
            O.center_mem_apexRow O.deleted_mem_apexRow
            O.survivor.center_ne_deleted hstrict
        exact hseparates
          ((E.globalRow.support_eq_radius
              O.survivor.center hcenterGlobal).trans
            (E.globalRow.support_eq_radius
              O.survivor.deleted hdeletedGlobal).symm)

/-- Sharpen the surplus localization to an exact apex-alignment residual.

If both prescribed deletion arms are critical, the global row contains the
continuation center and deleted source.  The second apex already bisects that
outside pair.  Ordered-cap uniqueness therefore excludes every other source
in the surplus cap.  The sole residual is the fresh source being exactly the
second apex, with both critical shells retained. -/
theorem globalEscape_commonDeletion_or_apexDoubleCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (E : GlobalEscapeSource O.survivor) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.deleted
          O.survivor.center E.source) ∨
      Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center
          O.survivor.center E.source) ∨
      Nonempty (ApexDoubleCriticalResidual O) := by
  rcases E.deletedSource_commonDeletion_or_prescribedCritical with
      hcommonDeleted | ⟨Qdeleted, hdeletedBlocks, hdeletedSupport⟩
  · exact Or.inl hcommonDeleted
  · rcases E.oldCenter_commonDeletion_or_prescribedCritical with
        hcommonCenter | ⟨Qcenter, hcenterBlocks, hcenterSupport⟩
    · exact Or.inr (Or.inl hcommonCenter)
    · have hdeletedGlobal :
          O.survivor.deleted ∈ E.globalRow.support := by
        rw [hdeletedSupport]
        exact Qdeleted.toCriticalFourShell.q_mem_support
      have hcenterGlobal :
          O.survivor.center ∈ E.globalRow.support := by
        rw [hcenterSupport]
        exact Qcenter.toCriticalFourShell.q_mem_support
      rcases E.source_mem_surplusCap_or_strictOppCap1 with
        hsourceSurplus | hsourceStrict
      · by_cases hsourceApex : E.source = S.oppApex2
        · exact Or.inr (Or.inr ⟨{
            escape := E
            source_eq_oppApex2 := hsourceApex
            deletedCritical := Qdeleted
            deletedBlocks := hdeletedBlocks
            deletedSupport := hdeletedSupport
            centerCritical := Qcenter
            centerBlocks := hcenterBlocks
            centerSupport := hcenterSupport }⟩)
        · exfalso
          have hseparates :
              dist E.source O.survivor.center ≠
                dist E.source O.survivor.deleted := by
            apply second_center_separates_outside_pair
              S D.convex S.surplusIdx
              (c₁ := S.oppApex2) (c₂ := E.source)
              (a := O.survivor.center) (b := O.survivor.deleted)
            · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
                oppApex2_mem_surplusCap S
            · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
                hsourceSurplus
            · exact fun h => hsourceApex h.symm
            · exact O.survivor.center_mem_A
            · exact O.survivor.deleted_mem_A
            · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
                O.center_not_mem_surplusCap
            · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
                O.deleted_not_mem_surplusCap
            · exact O.survivor.center_ne_deleted
            · exact
                (O.apexRow.support_eq_radius O.survivor.center
                    (Finset.mem_inter.mp O.center_mem_apexRow).1).trans
                  (O.apexRow.support_eq_radius O.survivor.deleted
                    (Finset.mem_inter.mp O.deleted_mem_apexRow).1).symm
          exact hseparates
            ((E.globalRow.support_eq_radius
                O.survivor.center hcenterGlobal).trans
              (E.globalRow.support_eq_radius
                O.survivor.deleted hdeletedGlobal).symm)
      · exfalso
        have hseparates :
            dist E.source O.survivor.center ≠
              dist E.source O.survivor.deleted :=
          firstCap_center_separates_secondApex_pair
            (rebasePacket D S) O.apexRow
            O.center_mem_apexRow O.deleted_mem_apexRow
            O.survivor.center_ne_deleted hsourceStrict
        exact hseparates
          ((E.globalRow.support_eq_radius
              O.survivor.center hcenterGlobal).trans
            (E.globalRow.support_eq_radius
              O.survivor.deleted hdeletedGlobal).symm)

private theorem selectedBlocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- Once the old center is outside the deleted source's chosen critical
shell, the retained cross-deletion equivalence supplies the relocated
common-deletion packet. -/
private theorem commonDeletion_at_deletedBlocker_of_center_not_mem_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (hcenterNotShell :
      O.survivor.center ∉
        (H.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.support) :
    Nonempty (CommonDeletionTwoCenterPacket
      (rebasePacket D S) H O.survivor.center O.survivor.center
        (H.centerAt O.survivor.deleted
          O.survivor.deleted_mem_A)) := by
  have hblockerSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.center)
        (H.centerAt O.survivor.deleted O.survivor.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.survivor.deleted_mem_A).mpr hcenterNotShell
  have holdSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.center) O.survivor.center :=
    erase_survives_of_not_mem_selectedSupport
      O.survivor.row O.survivor.row.center_not_mem
  exact nonempty_commonDeletionTwoCenterPacket
    (D := rebasePacket D S) H O.survivor.center_mem_A
    O.survivor.center_mem_A
    (selectedBlocker_mem_A H O.survivor.deleted_mem_A)
    (fun h => O.survivor.blocker_ne_center h.symm)
    holdSurvives hblockerSurvives

/-- A deleted-source blocker aligned with the second apex identifies the
parent apex row with the retained critical shell. -/
private theorem apexRow_support_eq_deletedShell_of_blocker_alignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (halign :
      H.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
        S.oppApex2) :
    O.apexRow.support =
      (H.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A).toCriticalFourShell.support := by
  have hradius :
      O.apexRow.radius =
        (H.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.radius := by
    calc
      O.apexRow.radius = dist S.oppApex2 O.survivor.deleted :=
        (O.apexRow.support_eq_radius O.survivor.deleted
          (Finset.mem_inter.mp O.deleted_mem_apexRow).1).symm
      _ = dist
          (H.centerAt O.survivor.deleted O.survivor.deleted_mem_A)
          O.survivor.deleted := by rw [halign]
      _ = (H.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.radius :=
        (H.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
            O.survivor.deleted
            (H.selectedAt O.survivor.deleted
              O.survivor.deleted_mem_A).toCriticalFourShell.q_mem_support
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    apply
      (H.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A).toCriticalFourShell.off_row_named_label_forbidden
        (O.apexRow.support_subset_A hz)
    calc
      dist (H.centerAt O.survivor.deleted
          O.survivor.deleted_mem_A) z =
          dist S.oppApex2 z := by rw [halign]
      _ = O.apexRow.radius := O.apexRow.support_eq_radius z hz
      _ = (H.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.radius := hradius
  · rw [O.apexRow.support_card,
      (H.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A).toCriticalFourShell.support_card]

/-- The relocated deleted-source blocker has the same exact endpoint.  If it
lies in strict `oppCap1`, ordered-cap separation forces the old continuation
center out of its critical shell.  The critical-system cross-deletion
equivalence then supplies a second K4 survivor, hence a common-deletion
packet.  The only residual is blocker localization to the surplus cap. -/
theorem relocatedDeletedBlocker_commonDeletion_or_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (hblockerOutside :
      H.centerAt O.survivor.deleted O.survivor.deleted_mem_A ∉
        S.oppCap2) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center O.survivor.center
          (H.centerAt O.survivor.deleted O.survivor.deleted_mem_A)) ∨
      H.centerAt O.survivor.deleted O.survivor.deleted_mem_A ∈
        S.surplusCap := by
  let blocker :=
    H.centerAt O.survivor.deleted O.survivor.deleted_mem_A
  have hblockerA : blocker ∈ D.A :=
    selectedBlocker_mem_A H O.survivor.deleted_mem_A
  rcases mem_surplusCap_or_oppCap1_or_oppCap2 S hblockerA with
    hsurplus | hopp1 | hopp2
  · exact Or.inr hsurplus
  · by_cases hsurplus : blocker ∈ S.surplusCap
    · exact Or.inr hsurplus
    · left
      have hstrict :
          blocker ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
        Finset.mem_sdiff.mpr ⟨hopp1, by
          intro hunion
          rcases Finset.mem_union.mp hunion with hs | h2
          · exact hsurplus hs
          · exact hblockerOutside h2⟩
      have hcenterNotShell :
          O.survivor.center ∉
            (H.selectedAt O.survivor.deleted
              O.survivor.deleted_mem_A).toCriticalFourShell.support := by
        intro hcenterShell
        have hseparates :
            dist blocker O.survivor.center ≠
              dist blocker O.survivor.deleted :=
          firstCap_center_separates_secondApex_pair
            (rebasePacket D S) O.apexRow
            O.center_mem_apexRow O.deleted_mem_apexRow
            O.survivor.center_ne_deleted hstrict
        apply hseparates
        exact
          ((H.selectedAt O.survivor.deleted
              O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
                O.survivor.center hcenterShell).trans
            ((H.selectedAt O.survivor.deleted
              O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
                O.survivor.deleted
                (H.selectedAt O.survivor.deleted
                  O.survivor.deleted_mem_A).toCriticalFourShell.q_mem_support).symm
      have hblockerSurvives :
          HasNEquidistantPointsAt 4
            (D.A.erase O.survivor.center) blocker :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H O.survivor.deleted_mem_A).mpr hcenterNotShell
      have holdSurvives :
          HasNEquidistantPointsAt 4
            (D.A.erase O.survivor.center) O.survivor.center :=
        erase_survives_of_not_mem_selectedSupport
          O.survivor.row O.survivor.row.center_not_mem
      exact nonempty_commonDeletionTwoCenterPacket
        (D := rebasePacket D S) H O.survivor.center_mem_A
        O.survivor.center_mem_A hblockerA
        (fun h => O.survivor.blocker_ne_center h.symm)
        holdSurvives hblockerSurvives
  · exact False.elim (hblockerOutside hopp2)

/-- Sharpen blocker localization to exact second-apex alignment.

If the relocated blocker is any other point of the surplus cap, the second
apex and that blocker would be two distinct centers of the same cap.  The
apex bisects the strict outside continuation pair, so ordered-cap uniqueness
forces the blocker not to bisect it.  Hence the old center is outside the
deleted source's critical shell and the common-deletion packet follows.
Outside the surplus cap, the earlier strict-`oppCap1` argument applies. -/
theorem relocatedDeletedBlocker_commonDeletion_or_apexAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (hblockerOutside :
      H.centerAt O.survivor.deleted O.survivor.deleted_mem_A ∉
        S.oppCap2) :
    Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center O.survivor.center
          (H.centerAt O.survivor.deleted
            O.survivor.deleted_mem_A)) ∨
      Nonempty (DeletedBlockerApexAlignment O) := by
  let blocker :=
    H.centerAt O.survivor.deleted O.survivor.deleted_mem_A
  have hblockerA : blocker ∈ D.A :=
    selectedBlocker_mem_A H O.survivor.deleted_mem_A
  by_cases hblockerSurplus : blocker ∈ S.surplusCap
  · by_cases hblockerApex : blocker = S.oppApex2
    · right
      have halign :
          H.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
            S.oppApex2 := by
        simpa only [blocker] using hblockerApex
      exact ⟨{
        blocker_eq_oppApex2 := halign
        apexRow_support_eq_shell :=
          apexRow_support_eq_deletedShell_of_blocker_alignment O halign }⟩
    · left
      apply commonDeletion_at_deletedBlocker_of_center_not_mem_shell O
      intro hcenterShell
      have hseparates :
          dist blocker O.survivor.center ≠
            dist blocker O.survivor.deleted := by
        apply second_center_separates_outside_pair
          S D.convex S.surplusIdx
          (c₁ := S.oppApex2) (c₂ := blocker)
          (a := O.survivor.center) (b := O.survivor.deleted)
        · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
            oppApex2_mem_surplusCap S
        · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
            hblockerSurplus
        · exact fun h => hblockerApex h.symm
        · exact O.survivor.center_mem_A
        · exact O.survivor.deleted_mem_A
        · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
            O.center_not_mem_surplusCap
        · simpa only [capByIndex_surplusIdx_eq_surplusCap] using
            O.deleted_not_mem_surplusCap
        · exact O.survivor.center_ne_deleted
        · exact
            (O.apexRow.support_eq_radius O.survivor.center
                (Finset.mem_inter.mp O.center_mem_apexRow).1).trans
              (O.apexRow.support_eq_radius O.survivor.deleted
                (Finset.mem_inter.mp O.deleted_mem_apexRow).1).symm
      apply hseparates
      exact
        ((H.selectedAt O.survivor.deleted
            O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
              O.survivor.center hcenterShell).trans
          ((H.selectedAt O.survivor.deleted
            O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
              O.survivor.deleted
              (H.selectedAt O.survivor.deleted
                O.survivor.deleted_mem_A).toCriticalFourShell.q_mem_support).symm
  · left
    rcases mem_surplusCap_or_oppCap1_or_oppCap2 S hblockerA with
      hsurplus | hopp1 | hopp2
    · exact False.elim (hblockerSurplus hsurplus)
    · apply commonDeletion_at_deletedBlocker_of_center_not_mem_shell O
      intro hcenterShell
      have hstrict :
          blocker ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
        Finset.mem_sdiff.mpr ⟨hopp1, by
          intro hunion
          rcases Finset.mem_union.mp hunion with hs | h2
          · exact hblockerSurplus hs
          · exact hblockerOutside h2⟩
      have hseparates :
          dist blocker O.survivor.center ≠
            dist blocker O.survivor.deleted :=
        firstCap_center_separates_secondApex_pair
          (rebasePacket D S) O.apexRow
          O.center_mem_apexRow O.deleted_mem_apexRow
          O.survivor.center_ne_deleted hstrict
      apply hseparates
      exact
        ((H.selectedAt O.survivor.deleted
            O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
              O.survivor.center hcenterShell).trans
          ((H.selectedAt O.survivor.deleted
            O.survivor.deleted_mem_A).toCriticalFourShell.support_eq_radius
              O.survivor.deleted
              (H.selectedAt O.survivor.deleted
                O.survivor.deleted_mem_A).toCriticalFourShell.q_mem_support).symm
    · exact False.elim (hblockerOutside hopp2)

/-- If the deleted source's blocker remains in the survivor center's cap,
ordered-cap uniqueness selects a source outside both that cap and the deleted
critical shell.  Its common-system blocker is different from the deleted
blocker, and global K4 produces a genuinely expanding second-generation row.

If the blocker does not remain in the cap, the right disjunct records that
unresolved geometric relocation exactly. -/
theorem nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (C : SurvivingContinuationRow D S H) :
    Nonempty (GlobalEscapeSource C) ∨
      H.centerAt C.deleted C.deleted_mem_A ∉ S.oppCap2 := by
  by_cases hblockerCap :
      H.centerAt C.deleted C.deleted_mem_A ∈ S.oppCap2
  · left
    have hexists :
        ∃ source : ℝ²,
          source ∈ C.row.support \ S.oppCap2 ∧
          source ∉
            (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support := by
      by_contra hnone
      have hall :
          ∀ source : ℝ²,
            source ∈ C.row.support \ S.oppCap2 →
            source ∈
              (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support := by
        intro source hsource
        by_contra hsourceOutside
        exact hnone ⟨source, hsource, hsourceOutside⟩
      have hone : 1 < (C.row.support \ S.oppCap2).card := by
        have htwo := C.two_le_support_outside_oppCap2_card
        omega
      rcases Finset.one_lt_card.mp hone with
        ⟨a, ha, b, hb, hab⟩
      have haRow : a ∈ C.row.support := (Finset.mem_sdiff.mp ha).1
      have hbRow : b ∈ C.row.support := (Finset.mem_sdiff.mp hb).1
      have haOutside : a ∉ S.oppCap2 := (Finset.mem_sdiff.mp ha).2
      have hbOutside : b ∉ S.oppCap2 := (Finset.mem_sdiff.mp hb).2
      have haShell := hall a ha
      have hbShell := hall b hb
      have hseparates :
          dist (H.centerAt C.deleted C.deleted_mem_A) a ≠
            dist (H.centerAt C.deleted C.deleted_mem_A) b := by
        apply second_center_separates_outside_pair
          S D.convex S.oppIndex2
          (c₁ := C.center)
          (c₂ := H.centerAt C.deleted C.deleted_mem_A)
          (a := a) (b := b)
        · simpa [capByIndex_oppIndex2_eq_oppCap2] using
            C.center_mem_oppCap2
        · simpa [capByIndex_oppIndex2_eq_oppCap2] using hblockerCap
        · exact C.blocker_ne_center.symm
        · exact C.row.support_subset_A haRow
        · exact C.row.support_subset_A hbRow
        · simpa [capByIndex_oppIndex2_eq_oppCap2] using haOutside
        · simpa [capByIndex_oppIndex2_eq_oppCap2] using hbOutside
        · exact hab
        · exact (C.row.support_eq_radius a haRow).trans
            (C.row.support_eq_radius b hbRow).symm
      apply hseparates
      exact
        ((H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support_eq_radius
            a haShell).trans
          ((H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support_eq_radius
            b hbShell).symm
    rcases hexists with ⟨source, hsourceOutsideCap, hsourceOutsideShell⟩
    have hsourceRow : source ∈ C.row.support :=
      (Finset.mem_sdiff.mp hsourceOutsideCap).1
    have hsourceA : source ∈ D.A := C.row.support_subset_A hsourceRow
    rcases exists_selectedFourClass_of_globalK4 D.K4 hsourceA with
      ⟨Ksource⟩
    have hsourceNeCenter : source ≠ C.center := by
      intro h
      exact C.row.center_not_mem (by simpa [h] using hsourceRow)
    have hinter :
        (Ksource.support ∩ C.row.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two
        Ksource C.row hsourceNeCenter
    have hsplit := Finset.card_sdiff_add_card_inter
      Ksource.support C.row.support
    have htwoEscapes :
        2 ≤ (Ksource.support \ C.row.support).card := by
      rw [Ksource.support_card] at hsplit
      omega
    refine ⟨{
      source := source
      source_mem_row := hsourceRow
      source_mem_A := hsourceA
      source_outside_oppCap2 := (Finset.mem_sdiff.mp hsourceOutsideCap).2
      source_outside_deletedShell := hsourceOutsideShell
      blocker_ne_deletedBlocker :=
        blocker_centers_ne_of_not_mem_other_selected_support
          H hsourceA C.deleted_mem_A hsourceOutsideShell
      blockerRow_lock_or_twoEscapes := ?_
      globalRow := Ksource
      globalRow_twoEscapes := htwoEscapes
      deleted_mem_globalRow_or_survives := mem_or_erase_survives Ksource
      oldCenter_mem_globalRow_or_survives := mem_or_erase_survives Ksource }⟩
    simpa only [Subsingleton.elim hsourceA
      (C.row.support_subset_A hsourceRow)] using
      sourceBlocker_rowLock_or_twoEscapes H C.row hsourceRow
  · exact Or.inr hblockerCap

/-- Full frontier adapter: every concrete cross-survival output reaches the
global source-selection dichotomy above.  This statement visibly retains the
actual frontier and its common critical-shell system. -/
theorem crossSurvival_globalSourceSelection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    ∃ C : SurvivingContinuationRow D S H,
      Nonempty (GlobalEscapeSource C) ∨
        H.centerAt C.deleted C.deleted_mem_A ∉ S.oppCap2 := by
  rcases nonempty_survivingContinuationRow_of_crossSurvival
      F K P hcross with ⟨C⟩
  exact ⟨C,
    nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2 C⟩

/-- Strongest checked cross-survival consumer normal form.

Every branch now reaches either an existing exact two-center
common-deletion packet or a point canonically produced by the common critical
system/global-K4 continuation that lies in the surplus cap.  The latter is
the only unconsumed localization; no arbitrary finite-shadow incidence is
assumed.
-/
theorem crossSurvival_commonDeletion_or_surplusLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    ∃ O : CrossSurvivalApexPacket D S H,
      (∃ E : GlobalEscapeSource O.survivor,
        Nonempty (CommonDeletionTwoCenterPacket
            (rebasePacket D S) H O.survivor.deleted
              O.survivor.center E.source) ∨
          Nonempty (CommonDeletionTwoCenterPacket
            (rebasePacket D S) H O.survivor.center
              O.survivor.center E.source) ∨
          E.source ∈ S.surplusCap) ∨
      (Nonempty (CommonDeletionTwoCenterPacket
          (rebasePacket D S) H O.survivor.center O.survivor.center
            (H.centerAt O.survivor.deleted
              O.survivor.deleted_mem_A)) ∨
        H.centerAt O.survivor.deleted O.survivor.deleted_mem_A ∈
          S.surplusCap) := by
  rcases nonempty_crossSurvivalApexPacket F K P hcross with ⟨O⟩
  refine ⟨O, ?_⟩
  rcases
      nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2
        O.survivor with hescape | hblockerOutside
  · rcases hescape with ⟨E⟩
    exact Or.inl ⟨E,
      globalEscape_commonDeletion_or_source_mem_surplusCap O E⟩
  · exact Or.inr
      (relocatedDeletedBlocker_commonDeletion_or_mem_surplusCap
        O hblockerOutside)

/-- Final exact normal form for the global source-selection lane.

The broad surplus-cap alternatives above are eliminated.  Every
cross-survival reaches either an existing common-deletion two-center packet,
or one of two named second-apex alignments carrying the precise retained
critical-shell data needed by the prescribed-deletion consumer. -/
theorem crossSurvival_commonDeletion_or_apexCriticalAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    ∃ O : CrossSurvivalApexPacket D S H,
      (∃ E : GlobalEscapeSource O.survivor,
        Nonempty (CommonDeletionTwoCenterPacket
            (rebasePacket D S) H O.survivor.deleted
              O.survivor.center E.source) ∨
          Nonempty (CommonDeletionTwoCenterPacket
            (rebasePacket D S) H O.survivor.center
              O.survivor.center E.source)) ∨
      Nonempty (ApexDoubleCriticalResidual O) ∨
      Nonempty (CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center O.survivor.center
          (H.centerAt O.survivor.deleted
            O.survivor.deleted_mem_A)) ∨
      Nonempty (DeletedBlockerApexAlignment O) := by
  rcases nonempty_crossSurvivalApexPacket F K P hcross with ⟨O⟩
  refine ⟨O, ?_⟩
  rcases
      nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2
        O.survivor with hescape | hblockerOutside
  · rcases hescape with ⟨E⟩
    rcases globalEscape_commonDeletion_or_apexDoubleCritical O E with
      hcommonDeleted | hcommonCenter | haligned
    · exact Or.inl ⟨E, Or.inl hcommonDeleted⟩
    · exact Or.inl ⟨E, Or.inr hcommonCenter⟩
    · exact Or.inr (Or.inl haligned)
  · rcases
      relocatedDeletedBlocker_commonDeletion_or_apexAlignment
        O hblockerOutside with hcommon | haligned
    · exact Or.inr (Or.inr (Or.inl hcommon))
    · exact Or.inr (Or.inr (Or.inr haligned))

#print axioms mem_or_erase_survives
#print axioms sourceBlocker_rowLock_or_twoEscapes
#print axioms GlobalEscapeSource.deletedSource_commonDeletion_or_prescribedCritical
#print axioms GlobalEscapeSource.oldCenter_commonDeletion_or_prescribedCritical
#print axioms globalEscape_commonDeletion_or_source_mem_surplusCap
#print axioms globalEscape_commonDeletion_or_apexDoubleCritical
#print axioms relocatedDeletedBlocker_commonDeletion_or_mem_surplusCap
#print axioms relocatedDeletedBlocker_commonDeletion_or_apexAlignment
#print axioms nonempty_globalEscapeSource_or_deletedBlocker_outside_oppCap2
#print axioms crossSurvival_globalSourceSelection
#print axioms crossSurvival_commonDeletion_or_surplusLocalization
#print axioms crossSurvival_commonDeletion_or_apexCriticalAlignment

end ATailGlobalSourceSelectionScratch
end Problem97
