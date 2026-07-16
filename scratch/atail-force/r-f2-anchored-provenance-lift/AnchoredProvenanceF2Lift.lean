/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2StrictCellNormalForm
import AnchoredTwoRowCoverConsumer

/-!
# Scratch: anchored provenance lift into the F2 normal form

The generic F2 split remembers only a common-deletion source, two centers,
and two exact rows.  This file applies that split to the off-surplus
row-external source produced by an anchored coherent-R transition while
retaining the original coherent source, deleted point, fixed first-apex
marginal, and exact retained rows.

No new incidence is asserted.  In particular, nonmembership of a named point
in the selected second-apex support is not promoted to a second-apex distance
inequality: `SelectedFourClass` records a chosen exact four-set, not the full
radius class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2AnchoredProvenanceLiftScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2StrictCellNormalFormScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Retype the actual shared-row successor at the equal center `p`.  The two
supports and their radius witnesses are copied verbatim; no row is
reselected. -/
noncomputable def alignedSharedRowPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p) :
    CommonDeletionTwoCenterPacket
      D W.H X.point p S.oppApex2 where
  q_mem_A := X.point_mem_A
  center₁_mem_A := by
    simpa [← hcenter] using R.firstCenter_mem_A
  center₂_mem_A :=
    X.toSharedRowCommonDeletionPacket.center₂_mem_A
  centers_ne := by
    simpa [← hcenter] using R.firstCenter_ne_oppApex2
  survives₁ := by
    simpa [← hcenter] using X.survives_firstCenter
  survives₂ := X.survives_secondApex
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives W.H
      X.point_mem_A (by
        simpa [← hcenter] using X.survives_firstCenter)
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives W.H
      X.point_mem_A X.survives_secondApex
  B₁ := R.sourceRow.support
  B₂ := R.secondApexRow.support
  row₁ := {
    subset := by
      intro z hz
      simpa [← hcenter] using X.firstRowXDeleted.subset hz
    card_four := X.firstRowXDeleted.card_four
    q_not_mem := X.firstRowXDeleted.q_not_mem
    radius := X.firstRowXDeleted.radius
    radius_pos := X.firstRowXDeleted.radius_pos
    same_radius := by
      intro z hz
      simpa [← hcenter] using X.firstRowXDeleted.same_radius z hz }
  row₂ := X.secondRowXDeleted
  B₁_card := R.sourceRow.support_card
  B₂_card := R.secondApexRow.support_card
  overlap_le_two := R.toCommonDeletionTwoCenterPacket.overlap_le_two

@[simp] theorem alignedSharedRowPacket_B₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p) :
    (alignedSharedRowPacket X hcenter).B₁ = R.sourceRow.support := by
  rfl

@[simp] theorem alignedSharedRowPacket_B₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p) :
    (alignedSharedRowPacket X hcenter).B₂ =
      R.secondApexRow.support := by
  rfl

/-- The anchored producer really supplies an off-surplus source whose
aligned packet retains the live first row and the original second-apex row.
The two other named deleted sources are kept in their exact live-row roles. -/
theorem exists_offSurplus_alignedSharedRowPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (A : AnchoredSourceCriticalTransition R)
    (hcenter : R.firstCenter = p)
    (hqSurplus : q ∈ S.surplusCap) :
    ∃ X : RowExternalCommonDeletionSource A,
      X.point ∉ S.surplusCap ∧
        (alignedSharedRowPacket X hcenter).B₁ =
          ({q, t1, t2, t3} : Finset ℝ²) ∧
        (alignedSharedRowPacket X hcenter).B₂ =
          R.secondApexRow.support ∧
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        R.deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        R.sourcePair.x ∈ ({t1, t2, t3} : Finset ℝ²) := by
  rcases exists_offSurplus_sharedRowSource A with ⟨X, hXOff⟩
  have hrow :=
    W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter
  refine ⟨X, hXOff, ?_, alignedSharedRowPacket_B₂ X hcenter,
    ?_, ?_, ?_⟩
  · rw [alignedSharedRowPacket_B₁, hrow]
  · rw [← hrow]
    exact X.point_not_mem_sourceRow
  · exact W.coherent_deleted_not_mem_base_of_source_center_eq_p R hcenter
  · exact
      (W.coherent_source_center_eq_p_iff_mem_dangerousTriple
        R hqSurplus).mp hcenter

/-- A point outside the middle row is outside all four F2 cells. -/
def AvoidsAllF2Cells
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (z : ℝ²) : Prop :=
  z ∉ liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∧
    z ∉ supportOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∧
    z ∉ bothCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∧
    z ∉ outsideBothCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C)

theorem avoidsAllF2Cells_of_not_mem_middle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted z : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (hz : z ∉ C.B₂) :
    AvoidsAllF2Cells C z := by
  simp only [AvoidsAllF2Cells, liveOnlyCell, supportOnlyCell, bothCell,
    outsideBothCell, Finset.mem_sdiff, Finset.mem_inter,
    Finset.mem_union, not_and_or]
  tauto

/-- Exact provenance retained when the generic F2 normal form is applied to
the off-surplus shared-row successor of an anchored coherent-R transition. -/
structure AnchoredProvenanceF2NormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p) : Prop where
  fresh_off_surplus :
    X.point ∉ S.surplusCap
  q_mem_surplus :
    q ∈ S.surplusCap
  profile :
    TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²))
      S (alignedSharedRowPacket X hcenter)
  resolved :
    ResolvedF2StrictCellNormalForm
      S W (alignedSharedRowPacket X hcenter)
  first_row_eq_live :
    (alignedSharedRowPacket X hcenter).B₁ =
      ({q, t1, t2, t3} : Finset ℝ²)
  second_row_eq_retained :
    (alignedSharedRowPacket X hcenter).B₂ =
      R.secondApexRow.support
  coherent_source_mem_dangerousTriple :
    R.sourcePair.x ∈ ({t1, t2, t3} : Finset ℝ²)
  coherent_source_ne_q :
    R.sourcePair.x ≠ q
  fresh_ne_coherent_source :
    X.point ≠ R.sourcePair.x
  three_named_pairwise :
    X.point ≠ R.deleted ∧
      X.point ≠ R.sourcePair.x ∧
      R.sourcePair.x ≠ R.deleted
  fresh_mem_fixedMarginal :
    X.point ∈
      (SelectedClass D.A S.oppApex1 radius) \ S.surplusCap
  current_deleted_mem_fixedMarginal :
    R.deleted ∈
      (SelectedClass D.A S.oppApex1 radius) \ S.surplusCap
  coherent_source_mem_fixedMarginal :
    R.sourcePair.x ∈
      (SelectedClass D.A S.oppApex1 radius) \ S.surplusCap
  named_firstApex_same_radius :
    dist S.oppApex1 X.point = radius ∧
      dist S.oppApex1 R.deleted = radius ∧
      dist S.oppApex1 R.sourcePair.x = radius
  coherent_source_mem_first_row :
    R.sourcePair.x ∈ (alignedSharedRowPacket X hcenter).B₁
  fresh_not_mem_first_row :
    X.point ∉ (alignedSharedRowPacket X hcenter).B₁
  current_deleted_not_mem_first_row :
    R.deleted ∉ (alignedSharedRowPacket X hcenter).B₁
  named_not_mem_middle :
    X.point ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      R.deleted ∉ (alignedSharedRowPacket X hcenter).B₂ ∧
      R.sourcePair.x ∉ (alignedSharedRowPacket X hcenter).B₂
  fresh_mem_deletedCriticalSupport :
    X.point ∈
      deletedCriticalSupport (alignedSharedRowPacket X hcenter)
  coherent_source_outside_currentDeletedCriticalSupport :
    R.sourcePair.x ∉
      (W.H.selectedAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      ).toCriticalFourShell.support
  fresh_avoids_all_F2_cells :
    AvoidsAllF2Cells (alignedSharedRowPacket X hcenter) X.point
  current_deleted_avoids_all_F2_cells :
    AvoidsAllF2Cells (alignedSharedRowPacket X hcenter) R.deleted
  coherent_source_avoids_all_F2_cells :
    AvoidsAllF2Cells
      (alignedSharedRowPacket X hcenter) R.sourcePair.x
  coherent_source_on_first_row_radius :
    dist p R.sourcePair.x = R.sourceRow.radius
  fresh_off_first_row_radius :
    dist p X.point ≠ R.sourceRow.radius
  current_deleted_off_first_row_radius :
    dist p R.deleted ≠ R.sourceRow.radius
  fresh_source_firstCenter_dist_ne :
    dist p X.point ≠ dist p R.sourcePair.x
  deleted_source_firstCenter_dist_ne :
    dist p R.deleted ≠ dist p R.sourcePair.x
  fresh_survives_firstCenter :
    HasNEquidistantPointsAt 4 (D.A.erase X.point) p
  fresh_survives_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase X.point) S.oppApex2
  current_deleted_survives_firstCenter :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) p
  current_deleted_survives_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase R.deleted) S.oppApex2
  coherent_source_critical_at_firstCenter :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) p
  coherent_source_survives_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex2
  firstCenter_terminal_or_currentDeleted :
    p ∈ T.carrier ∨ p = R.deleted
  second_row_on_retained_radius :
    ∀ z ∈ (alignedSharedRowPacket X hcenter).B₂,
      dist S.oppApex2 z = R.secondApexRow.radius
  fixedClass_firstRow_card_le_two :
    ((SelectedClass D.A S.oppApex1 radius) ∩
      (alignedSharedRowPacket X hcenter).B₁).card ≤ 2
  fixedMarginal_secondRow_card_le_one :
    (((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) ∩
      (alignedSharedRowPacket X hcenter).B₂).card ≤ 1
  ambient_fixedMarginal_card_ge_five :
    5 ≤ ((SelectedClass D.A S.oppApex1 radius) \
      S.surplusCap).card
  ambient_fixedClass_card_ge_six :
    6 ≤ (SelectedClass D.A S.oppApex1 radius).card
  fresh_or_source_mem_strictOppCap1 :
    X.point ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      R.sourcePair.x ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  fresh_or_deleted_mem_strictOppCap1 :
    X.point ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      R.deleted ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

/-- End-to-end extraction from the actual aligned shared-row F2 packet. -/
theorem anchoredProvenanceF2NormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (hXOff : X.point ∉ S.surplusCap)
    (hqSurplus : q ∈ S.surplusCap)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²))
      S (alignedSharedRowPacket X hcenter)) :
    AnchoredProvenanceF2NormalForm W R A X hcenter := by
  have hsourceTriple :
      R.sourcePair.x ∈ ({t1, t2, t3} : Finset ℝ²) :=
    (W.coherent_source_center_eq_p_iff_mem_dangerousTriple
      R hqSurplus).mp hcenter
  have hsourceNeQ : R.sourcePair.x ≠ q :=
    W.coherent_source_ne_live_q R hqSurplus
  have hsourceRow :
      R.sourceRow.support =
        ({q, t1, t2, t3} : Finset ℝ²) :=
    W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter
  have hXNeSource : X.point ≠ R.sourcePair.x := by
    intro h
    apply X.point_not_mem_sourceRow
    simpa [h] using R.source_mem_sourceRow
  have hXMiddle :
      X.point ∉ (alignedSharedRowPacket X hcenter).B₂ := by
    simpa using X.point_not_mem_secondApexRow
  have hDeletedMiddle :
      R.deleted ∉ (alignedSharedRowPacket X hcenter).B₂ := by
    intro h
    have h' : R.deleted ∈ R.secondApexRow.support := by
      simpa using h
    exact (Finset.mem_erase.mp
      (R.secondApexRow.support_subset_A h')).1 rfl
  have hSourceMiddle :
      R.sourcePair.x ∉ (alignedSharedRowPacket X hcenter).B₂ := by
    simpa using R.source_not_mem_secondApexRow
  have hXFirstRadius :
      dist R.firstCenter X.point ≠ R.sourceRow.radius := by
    intro hdist
    exact X.point_not_mem_sourceRow
      (R.sourceRow.off_row_named_label_forbidden X.point_mem_A hdist)
  have hSourceFirstRadius :
      dist p R.sourcePair.x = R.sourceRow.radius := by
    simpa [hcenter] using R.source_eq_sourceRow_radius
  have hXFirstRadiusP :
      dist p X.point ≠ R.sourceRow.radius := by
    simpa [hcenter] using hXFirstRadius
  have hDeletedFirstRadiusP :
      dist p R.deleted ≠ R.sourceRow.radius := by
    simpa [hcenter] using R.deleted_ne_sourceRow_radius
  refine {
    fresh_off_surplus := hXOff
    q_mem_surplus := hqSurplus
    profile := F2
    resolved :=
      resolvedF2StrictCellNormalForm
        S W (alignedSharedRowPacket X hcenter) hqSurplus F2
    first_row_eq_live := by
      rw [alignedSharedRowPacket_B₁, hsourceRow]
    second_row_eq_retained := alignedSharedRowPacket_B₂ X hcenter
    coherent_source_mem_dangerousTriple := hsourceTriple
    coherent_source_ne_q := hsourceNeQ
    fresh_ne_coherent_source := hXNeSource
    three_named_pairwise :=
      ⟨X.point_ne_deleted, hXNeSource, R.source_ne_deleted⟩
    fresh_mem_fixedMarginal :=
      Finset.mem_sdiff.mpr ⟨X.point_mem_fixedClass, hXOff⟩
    current_deleted_mem_fixedMarginal :=
      Finset.mem_sdiff.mpr
        ⟨R.deleted_mem_fixedClass, R.deleted_off_surplus⟩
    coherent_source_mem_fixedMarginal :=
      Finset.mem_sdiff.mpr
        ⟨R.source_mem_fixedClass, R.sourcePair.x_off_surplus⟩
    named_firstApex_same_radius :=
      ⟨(mem_selectedClass.mp X.point_mem_fixedClass).2,
        (mem_selectedClass.mp R.deleted_mem_fixedClass).2,
        (mem_selectedClass.mp R.source_mem_fixedClass).2⟩
    coherent_source_mem_first_row := by
      simpa using R.source_mem_sourceRow
    fresh_not_mem_first_row := by
      simpa using X.point_not_mem_sourceRow
    current_deleted_not_mem_first_row := by
      simpa using R.deleted_not_mem_sourceRow
    named_not_mem_middle :=
      ⟨hXMiddle, hDeletedMiddle, hSourceMiddle⟩
    fresh_mem_deletedCriticalSupport :=
      deleted_mem_deletedCriticalSupport
        (alignedSharedRowPacket X hcenter)
    coherent_source_outside_currentDeletedCriticalSupport :=
      A.source_outside_deletedRow
    fresh_avoids_all_F2_cells :=
      avoidsAllF2Cells_of_not_mem_middle
        (alignedSharedRowPacket X hcenter) hXMiddle
    current_deleted_avoids_all_F2_cells :=
      avoidsAllF2Cells_of_not_mem_middle
        (alignedSharedRowPacket X hcenter) hDeletedMiddle
    coherent_source_avoids_all_F2_cells :=
      avoidsAllF2Cells_of_not_mem_middle
        (alignedSharedRowPacket X hcenter) hSourceMiddle
    coherent_source_on_first_row_radius := hSourceFirstRadius
    fresh_off_first_row_radius := hXFirstRadiusP
    current_deleted_off_first_row_radius := hDeletedFirstRadiusP
    fresh_source_firstCenter_dist_ne := by
      intro hdist
      exact hXFirstRadiusP (hdist.trans hSourceFirstRadius)
    deleted_source_firstCenter_dist_ne := by
      intro hdist
      exact hDeletedFirstRadiusP (hdist.trans hSourceFirstRadius)
    fresh_survives_firstCenter := by
      simpa [← hcenter] using X.survives_firstCenter
    fresh_survives_secondApex := X.survives_secondApex
    current_deleted_survives_firstCenter := by
      simpa [← hcenter] using R.deleted_survives_firstCenter
    current_deleted_survives_secondApex :=
      R.deleted_survives_secondApex
    coherent_source_critical_at_firstCenter := by
      simpa [← hcenter] using A.source_critical_at_firstCenter
    coherent_source_survives_secondApex :=
      A.source_survives_secondApex
    firstCenter_terminal_or_currentDeleted := by
      simpa [← hcenter] using R.firstCenter_terminal_or_self
    second_row_on_retained_radius := by
      intro z hz
      exact R.secondApexRow.support_eq_radius z
        (by simpa using hz)
    fixedClass_firstRow_card_le_two := by
      simpa using
        criticalFourShell_fixedClass_inter_card_le_two
          (radius := radius) R.sourceRow R.firstCenter_ne_oppApex1
    fixedMarginal_secondRow_card_le_one := by
      simpa using secondApexRow_inter_fixedMarginal_card_le_one A
    ambient_fixedMarginal_card_ge_five := by
      simpa [SelectedClass, dist_comm] using
        A.ambient_fixedMarginal_card_ge_five
    ambient_fixedClass_card_ge_six :=
      A.ambient_fixedClass_card_ge_six
    fresh_or_source_mem_strictOppCap1 :=
      one_of_two_fixed_offSurplus_mem_strictOppCap1
        D S radius X.point_mem_fixedClass R.source_mem_fixedClass
          hXOff R.sourcePair.x_off_surplus hXNeSource
    fresh_or_deleted_mem_strictOppCap1 :=
      one_of_two_fixed_offSurplus_mem_strictOppCap1
        D S radius X.point_mem_fixedClass R.deleted_mem_fixedClass
          hXOff R.deleted_off_surplus X.point_ne_deleted }

#print axioms alignedSharedRowPacket_B₁
#print axioms alignedSharedRowPacket_B₂
#print axioms exists_offSurplus_alignedSharedRowPacket
#print axioms avoidsAllF2Cells_of_not_mem_middle
#print axioms anchoredProvenanceF2NormalForm

end ATailRF2AnchoredProvenanceLiftScratch
end Problem97
