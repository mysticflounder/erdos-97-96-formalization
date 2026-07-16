/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SpentEntryTerminalMutualHitConsumer
import FrontierContinuationDispatcher
import BiapexContinuationGrid

/-!
# Shared-row provenance at a spent frontier entry

`FrontierRadiusSpentAtEntry.both_originalPoints_commonDeletion` correctly
shows that each original frontier endpoint is a common deletion at the two
opposite apices.  Its generic `CommonDeletionTwoCenterPacket` outputs,
however, may choose unrelated exact rows for the two deletions.

This file retains one alternate first-apex row and the frontier's original
second-apex row.  Both exact rows avoid both original endpoints, so they
simultaneously witness common deletion of `q` and `w`.

The retained rows do not give `False`.  The existing ordered-cap theorem only
forces their common support outside the surplus cap to have cardinality at
most one.  If their total overlap has cardinality two, it therefore has the
exact one-inside/one-outside split.  Choosing strict pairs in the two rows
then lands in the already-existing `biApex_two_by_two_survival_normal_form`;
the named original endpoints do not strengthen that normal form.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRSpentEntryProvenanceConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailPrescribedDeletionEdge
open ATailRFullParentEntryScratch
open BiapexContinuationGridScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

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

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private def selectedFourClassToQDeletedK4Class
    {D : CounterexampleData} {deleted center : ℝ²}
    (K : SelectedFourClass D.A center)
    (hdeleted : deleted ∉ K.support) :
    U5QDeletedK4Class D deleted center K.support where
  subset := by
    intro z hz
    change z ∈ (D.A.erase deleted).erase center
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ K.center_not_mem (h ▸ hz),
        Finset.mem_erase.mpr
          ⟨fun h ↦ hdeleted (h ▸ hz), K.support_subset_A hz⟩⟩
  card_four := by rw [K.support_card]
  q_not_mem := hdeleted
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- The two exact rows retained before forgetting the spent-entry source
pair.  The first row is chosen from the alternate first-apex radius on the
twice-erased carrier.  The second row is the existing frontier row. -/
structure SpentEntryOriginalPairSharedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) : Type where
  firstApexRow : SelectedFourClass D.A S.oppApex1
  firstApexRow_radius_eq :
    firstApexRow.radius = E.alternateRadius
  q_not_mem_firstApexRow :
    F.pair.q ∉ firstApexRow.support
  w_not_mem_firstApexRow :
    F.pair.w ∉ firstApexRow.support
  secondApex : FrontierSecondApexRow F

/-- Extract one exact alternate first-apex row and retain it alongside the
frontier's exact second-apex row. -/
theorem nonempty_spentEntryOriginalPairSharedRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    Nonempty (SpentEntryOriginalPairSharedRows E) := by
  classical
  let C :=
    SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
      S.oppApex1 E.alternateRadius
  have hCcard : 4 ≤ C.card := by
    simpa [C] using E.alternateRadius_four
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hCcard
  let K : SelectedFourClass D.A S.oppApex1 :=
    { support := T
      support_subset_A := by
        intro z hz
        have hzC := mem_selectedClass.mp (hTC hz)
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hzC.1).2).2
      support_card := hTcard
      radius := E.alternateRadius
      radius_pos := E.alternateRadius_pos
      support_eq_radius := by
        intro z hz
        exact (mem_selectedClass.mp (hTC hz)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTC hcenter)).2
        rw [dist_self] at hdist
        exact (ne_of_gt E.alternateRadius_pos) hdist.symm }
  have hqNot : F.pair.q ∉ K.support := by
    intro hq
    have hqCarrier := (mem_selectedClass.mp (hTC hq)).1
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hqCarrier).2).1 rfl
  have hwNot : F.pair.w ∉ K.support := by
    intro hw
    have hwCarrier := (mem_selectedClass.mp (hTC hw)).1
    exact (Finset.mem_erase.mp hwCarrier).1 rfl
  rcases nonempty_frontierSecondApexRow F with ⟨K₂⟩
  exact ⟨
    { firstApexRow := K
      firstApexRow_radius_eq := rfl
      q_not_mem_firstApexRow := hqNot
      w_not_mem_firstApexRow := hwNot
      secondApex := K₂ }⟩

namespace SpentEntryOriginalPairSharedRows

theorem q_not_mem_secondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    F.pair.q ∉ R.secondApex.row.support :=
  R.secondApex.q_not_mem

theorem w_not_mem_secondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    F.pair.w ∉ R.secondApex.row.support :=
  R.secondApex.w_not_mem

/-- The alternate first-apex exact row is disjoint from the spent original
radius class. -/
theorem firstApexRow_inter_originalClass_eq_empty
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    R.firstApexRow.support ∩
      SelectedClass D.A S.oppApex1 radius = ∅ := by
  ext z
  constructor
  · intro hz
    rcases Finset.mem_inter.mp hz with ⟨hzFirst, hzOriginal⟩
    exfalso
    apply E.alternateRadius_ne
    calc
      E.alternateRadius = R.firstApexRow.radius :=
        R.firstApexRow_radius_eq.symm
      _ = dist S.oppApex1 z :=
        (R.firstApexRow.support_eq_radius z hzFirst).symm
      _ = radius := (mem_selectedClass.mp hzOriginal).2
  · simp

def firstRowQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E)
    (deleted : ℝ²)
    (hdeleted : deleted ∉ R.firstApexRow.support) :
    U5QDeletedK4Class
      D deleted S.oppApex1 R.firstApexRow.support :=
  selectedFourClassToQDeletedK4Class R.firstApexRow hdeleted

def secondRowQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E)
    (deleted : ℝ²)
    (hdeleted : deleted ∉ R.secondApex.row.support) :
    U5QDeletedK4Class
      D deleted S.oppApex2 R.secondApex.row.support :=
  selectedFourClassToQDeletedK4Class R.secondApex.row hdeleted

/-- The original `q` common-deletion packet, with the two retained rows
installed rather than chosen anew. -/
noncomputable def toCommonDeletionAtQ
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    CommonDeletionTwoCenterPacket
      D H F.pair.q S.oppApex1 S.oppApex2 where
  q_mem_A := F.pair.q_mem_A
  center₁_mem_A := oppApex1_mem_A S
  center₂_mem_A := oppApex2_mem_A S
  centers_ne := oppApex1_ne_oppApex2 S
  survives₁ :=
    deletion_survives_of_not_mem_selected_support
      R.firstApexRow R.q_not_mem_firstApexRow
  survives₂ :=
    deletion_survives_of_not_mem_selected_support
      R.secondApex.row R.q_not_mem_secondApexRow
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H F.pair.q_mem_A
      (deletion_survives_of_not_mem_selected_support
        R.firstApexRow R.q_not_mem_firstApexRow)
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H F.pair.q_mem_A
      (deletion_survives_of_not_mem_selected_support
        R.secondApex.row R.q_not_mem_secondApexRow)
  B₁ := R.firstApexRow.support
  B₂ := R.secondApex.row.support
  row₁ := R.firstRowQDeleted F.pair.q R.q_not_mem_firstApexRow
  row₂ := R.secondRowQDeleted F.pair.q R.q_not_mem_secondApexRow
  B₁_card := R.firstApexRow.support_card
  B₂_card := R.secondApex.row.support_card
  overlap_le_two :=
    SelectedFourClass.inter_card_le_two
      R.firstApexRow R.secondApex.row (oppApex1_ne_oppApex2 S)

/-- The original `w` common-deletion packet using exactly the same two rows
as `toCommonDeletionAtQ`. -/
noncomputable def toCommonDeletionAtW
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    CommonDeletionTwoCenterPacket
      D H F.pair.w S.oppApex1 S.oppApex2 where
  q_mem_A := F.pair.w_mem_A
  center₁_mem_A := oppApex1_mem_A S
  center₂_mem_A := oppApex2_mem_A S
  centers_ne := oppApex1_ne_oppApex2 S
  survives₁ :=
    deletion_survives_of_not_mem_selected_support
      R.firstApexRow R.w_not_mem_firstApexRow
  survives₂ :=
    deletion_survives_of_not_mem_selected_support
      R.secondApex.row R.w_not_mem_secondApexRow
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H F.pair.w_mem_A
      (deletion_survives_of_not_mem_selected_support
        R.firstApexRow R.w_not_mem_firstApexRow)
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H F.pair.w_mem_A
      (deletion_survives_of_not_mem_selected_support
        R.secondApex.row R.w_not_mem_secondApexRow)
  B₁ := R.firstApexRow.support
  B₂ := R.secondApex.row.support
  row₁ := R.firstRowQDeleted F.pair.w R.w_not_mem_firstApexRow
  row₂ := R.secondRowQDeleted F.pair.w R.w_not_mem_secondApexRow
  B₁_card := R.firstApexRow.support_card
  B₂_card := R.secondApex.row.support_card
  overlap_le_two :=
    SelectedFourClass.inter_card_le_two
      R.firstApexRow R.secondApex.row (oppApex1_ne_oppApex2 S)

/-- The two common-deletion packets genuinely share both exact supports. -/
theorem commonDeletionPackets_share_rows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    R.toCommonDeletionAtQ.B₁ = R.toCommonDeletionAtW.B₁ ∧
      R.toCommonDeletionAtQ.B₂ = R.toCommonDeletionAtW.B₂ :=
  ⟨rfl, rfl⟩

/-- Existing ordered-cap geometry improves the generic overlap bound: the
two apex rows have at most one common support point outside the surplus cap,
because both centers lie in that cap. -/
theorem common_support_outside_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    (((R.firstApexRow.support ∩ R.secondApex.row.support) \
      S.surplusCap).card ≤ 1) := by
  classical
  rw [Finset.card_le_one]
  intro a ha b hb
  rcases Finset.mem_sdiff.mp ha with ⟨haBoth, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbBoth, hbOutside⟩
  rcases Finset.mem_inter.mp haBoth with ⟨haFirst, haSecond⟩
  rcases Finset.mem_inter.mp hbBoth with ⟨hbFirst, hbSecond⟩
  by_contra hab
  have hcap := capByIndex_surplusIdx_eq_surplusCap S
  exact false_of_two_cap_center_rows_common_outside_pair
    S S.surplusIdx D.convex R.firstApexRow R.secondApex.row
    (by simpa only [hcap] using oppApex1_mem_surplusCap S)
    (by simpa only [hcap] using oppApex2_mem_surplusCap S)
    (oppApex1_ne_oppApex2 S)
    haFirst hbFirst haSecond hbSecond
    (by simpa only [hcap] using haOutside)
    (by simpa only [hcap] using hbOutside) hab

private theorem firstApexRow_inter_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    (R.firstApexRow.support ∩ S.surplusCap).card ≤ 1 := by
  let DS := rebasePacket D S
  let C := D.A.filter
    fun z ↦ dist z S.oppApex1 = R.firstApexRow.radius
  have hsupportC : R.firstApexRow.support ⊆ C := by
    intro z hz
    exact Finset.mem_filter.mpr
      ⟨R.firstApexRow.support_subset_A hz, by
        simpa [dist_comm] using
          R.firstApexRow.support_eq_radius z hz⟩
  calc
    (R.firstApexRow.support ∩ S.surplusCap).card ≤
        (C ∩ S.surplusCap).card := by
      apply Finset.card_le_card
      intro z hz
      exact Finset.mem_inter.mpr
        ⟨hsupportC (Finset.mem_inter.mp hz).1,
          (Finset.mem_inter.mp hz).2⟩
    _ ≤ 1 := by
      simpa [DS, C, rebasePacket] using
        U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit
          DS R.firstApexRow.radius

/-- If the two retained rows attain the generic two-point overlap bound,
ordered-cap geometry fixes its exact cap split: one common point is in the
surplus cap and one is outside. -/
theorem overlap_two_forces_one_inside_one_outside_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E)
    (htwo :
      (R.firstApexRow.support ∩ R.secondApex.row.support).card = 2) :
    (((R.firstApexRow.support ∩ R.secondApex.row.support) ∩
        S.surplusCap).card = 1) ∧
      (((R.firstApexRow.support ∩ R.secondApex.row.support) \
        S.surplusCap).card = 1) := by
  let I := R.firstApexRow.support ∩ R.secondApex.row.support
  have hinside :
      (I ∩ S.surplusCap).card ≤ 1 := by
    calc
      (I ∩ S.surplusCap).card ≤
          (R.firstApexRow.support ∩ S.surplusCap).card := by
        apply Finset.card_le_card
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzI, hzSurplus⟩
        exact Finset.mem_inter.mpr
          ⟨(Finset.mem_inter.mp hzI).1, hzSurplus⟩
      _ ≤ 1 := R.firstApexRow_inter_surplusCap_card_le_one
  have houtside : (I \ S.surplusCap).card ≤ 1 := by
    simpa [I] using R.common_support_outside_surplusCap_card_le_one
  have hsplit := Finset.card_sdiff_add_card_inter I S.surplusCap
  have hIcard : I.card = 2 := by simpa [I] using htwo
  have hsum :
      (I \ S.surplusCap).card +
        (I ∩ S.surplusCap).card = 2 := by
    omega
  constructor
  · apply Nat.le_antisymm hinside
    omega
  · apply Nat.le_antisymm houtside
    omega

private theorem exists_two_distinct_of_two_le_card
    {α : Type*} [DecidableEq α] {T : Finset α}
    (hT : 2 ≤ T.card) :
    ∃ a b, a ∈ T ∧ b ∈ T ∧ a ≠ b := by
  rcases Finset.one_lt_card.mp (by omega : 1 < T.card) with
    ⟨a, ha, b, hb, hab⟩
  exact ⟨a, b, ha, hb, hab⟩

/-- After choosing strict pairs in the two retained rows, the spent-entry
surface lands exactly in the already-existing two-by-two normal form.
The named original endpoints do not occur in its conclusion. -/
theorem to_biApex_two_by_two_survival_normal_form
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (R : SpentEntryOriginalPairSharedRows E) :
    ∃ a b z₁ z₂ : ℝ²,
      a ∈ R.firstApexRow.support ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) ∧
      b ∈ R.firstApexRow.support ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) ∧
      a ≠ b ∧
      z₁ ∈ R.secondApex.row.support ∩
        (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)) ∧
      z₂ ∈ R.secondApex.row.support ∩
        (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)) ∧
      z₁ ≠ z₂ ∧
      (Nonempty (CommonDeletionTwoCenterPacket
          (rebasePacket D S) H a z₁ z₂) ∨
        Nonempty (CommonDeletionTwoCenterPacket
          (rebasePacket D S) H b z₁ z₂) ∨
        Nonempty (CrossedCriticalNormalForm
          (rebasePacket D S) H R.firstApexRow a b z₁ z₂) ∨
        Nonempty (CrossedCriticalNormalForm
          (rebasePacket D S) H R.firstApexRow b a z₁ z₂)) := by
  let DS := rebasePacket D S
  have hfirst :
      2 ≤ (R.firstApexRow.support ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card := by
    simpa [DS, rebasePacket] using
      BiapexContinuationGridScratch.firstApex_support_strictInterior_card_ge_two
        DS R.firstApexRow
  have hsecond :
      2 ≤ (R.secondApex.row.support ∩
        (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))).card := by
    simpa [DS, rebasePacket] using
      BiapexContinuationGridScratch.secondApex_support_strictInterior_card_ge_two
        DS R.secondApex.row
  rcases exists_two_distinct_of_two_le_card hfirst with
    ⟨a, b, ha, hb, hab⟩
  rcases exists_two_distinct_of_two_le_card hsecond with
    ⟨z₁, z₂, hz₁, hz₂, hz₁z₂⟩
  refine ⟨a, b, z₁, z₂, ha, hb, hab, hz₁, hz₂, hz₁z₂, ?_⟩
  simpa [DS] using
    ATailContinuationBankMatchScratch.biApex_two_by_two_survival_normal_form
      DS H R.firstApexRow R.secondApex.row
      ha hb hab hz₁ hz₂ hz₁z₂

end SpentEntryOriginalPairSharedRows

#print axioms nonempty_spentEntryOriginalPairSharedRows
#print axioms
  SpentEntryOriginalPairSharedRows.firstApexRow_inter_originalClass_eq_empty
#print axioms SpentEntryOriginalPairSharedRows.toCommonDeletionAtQ
#print axioms SpentEntryOriginalPairSharedRows.toCommonDeletionAtW
#print axioms
  SpentEntryOriginalPairSharedRows.common_support_outside_surplusCap_card_le_one
#print axioms
  SpentEntryOriginalPairSharedRows.overlap_two_forces_one_inside_one_outside_surplusCap
#print axioms
  SpentEntryOriginalPairSharedRows.to_biApex_two_by_two_survival_normal_form

end ATailRSpentEntryProvenanceConsumerScratch
end Problem97
