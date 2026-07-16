/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CoherentRCommonDeletionProvenance

/-!
# Reciprocal-row split at the least terminal hit

The coherent common-deletion producer already chooses a terminal endpoint
`deleted` outside the predecessor source's selected critical row.  There are
then exactly two possibilities:

* the predecessor source also avoids `deleted`'s selected critical row, which
  is the existing anchored-source input; or
* the predecessor source belongs to `deleted`'s row, giving a genuinely
  asymmetric directed cross.

The second branch below retains the common fixed first-apex radius, individual
deletion survival at both opposite apices, the critical/surviving deletion
contrast at the predecessor blocker, distinct blocker centers, the banked
two-circle overlap bound, and the banked opposite-side signed-area
consequence.  It is a residual packet, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace CoherentRCommonDeletionPacket

private theorem terminal_radius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius) :
    0 < radius := by
  rcases T.terminal with
    ⟨_q, _w, hradius, _hq, _hw, _hqw, _hcard, _hsecond⟩
  exact hradius

private theorem terminal_fixedClass_card_ge_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius) :
    4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card := by
  rcases T.terminal with
    ⟨_q, _w, _hradius, _hq, _hw, _hqw, hcard, _hsecond⟩
  rcases hcard with hfour | hfive
  · omega
  · omega

/-- The terminal fixed class, together with the erased coherent source,
gives at least five ambient points on the distinguished first-apex circle. -/
theorem ambient_fixedClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    5 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
  let C := SelectedClass T.carrier S.oppApex1 radius
  have hsourceNotC : R.sourcePair.x ∉ C := by
    intro hsource
    exact (Finset.mem_sdiff.mp R.sourcePair.x_mem_erased).2
      (mem_selectedClass.mp hsource).1
  have hinsert :
      insert R.sourcePair.x C ⊆
        SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzC
    · exact R.source_mem_fixedClass
    · exact mem_selectedClass.mpr
        ⟨T.carrier_subset (mem_selectedClass.mp hzC).1,
          (mem_selectedClass.mp hzC).2⟩
  have hcardInsert :
      C.card + 1 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
    have hle := Finset.card_le_card hinsert
    simpa [Finset.card_insert_of_notMem hsourceNotC] using hle
  have hterminal : 4 ≤ C.card := by
    simpa [C] using terminal_fixedClass_card_ge_four T
  omega

/-- Deleting the coherent source preserves the terminal fixed-radius K4 at
the first opposite apex, because the source lies outside the terminal
carrier. -/
theorem source_survives_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex1 := by
  have hsub :
      SelectedClass T.carrier S.oppApex1 radius ⊆
        SelectedClass (D.A.erase R.sourcePair.x) S.oppApex1 radius := by
    intro z hz
    have hzCarrier := (mem_selectedClass.mp hz).1
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr
        ⟨fun hzx ↦
          (Finset.mem_sdiff.mp R.sourcePair.x_mem_erased).2
            (hzx ▸ hzCarrier),
          T.carrier_subset hzCarrier⟩,
        (mem_selectedClass.mp hz).2⟩
  refine ⟨radius, terminal_radius_pos T, ?_⟩
  have hfour :
      4 ≤ (SelectedClass
        (D.A.erase R.sourcePair.x) S.oppApex1 radius).card :=
    (terminal_fixedClass_card_ge_four T).trans
      (Finset.card_le_card hsub)
  simpa [SelectedClass] using hfour

/-- Deleting the named terminal endpoint also preserves K4 at the first
opposite apex: the terminal class plus the erased coherent source gives five
ambient points at the fixed radius before the deletion. -/
theorem deleted_survives_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) S.oppApex1 := by
  refine ⟨radius, terminal_radius_pos T, ?_⟩
  have hfour :
      4 ≤ (SelectedClass (D.A.erase R.deleted)
        S.oppApex1 radius).card :=
    selectedClass_erase_card_ge_of_succ_le
      (R.ambient_fixedClass_card_ge_five)
  simpa [SelectedClass] using hfour

/-- Regard the directed pair `(deleted, source)` as a survivor relocation
packet.  Its two second-apex survivals come from the retained exact
double-deletion row. -/
noncomputable def deletedSourceRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    SurvivorPairRelocationPacket D S radius H where
  q := R.deleted
  w := R.sourcePair.x
  q_mem_A := (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  w_mem_A := (mem_selectedClass.mp R.source_mem_fixedClass).1
  q_mem_marginal := Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨(mem_selectedClass.mp R.deleted_mem_fixedClass).1,
        by simpa [dist_comm] using
          (mem_selectedClass.mp R.deleted_mem_fixedClass).2⟩,
      R.deleted_off_surplus⟩
  w_mem_marginal := Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨(mem_selectedClass.mp R.source_mem_fixedClass).1,
        by simpa [dist_comm] using
          (mem_selectedClass.mp R.source_mem_fixedClass).2⟩,
      R.sourcePair.x_off_surplus⟩
  q_ne_w := R.source_ne_deleted.symm
  q_survives := R.deleted_survives_secondApex
  w_survives := R.source_survives_secondApex
  q_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_secondApex
  w_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.source_mem_fixedClass).1
      R.source_survives_secondApex

/-- Exact asymmetric cross data left when the predecessor source belongs to
the terminal endpoint's selected row.

The reverse incidence remains absent: `deleted` is outside the source row.
Consequently deletion of `deleted` survives at the source blocker while
deletion of the source is critical there. -/
structure ReciprocalDirectedCrossResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : Type where
  source_mem_deletedRow :
    R.sourcePair.x ∈
      (H.selectedAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support
  deleted_not_mem_sourceRow : R.deleted ∉ R.sourceRow.support
  source_mem_fixedClass :
    R.sourcePair.x ∈ SelectedClass D.A S.oppApex1 radius
  deleted_mem_fixedClass :
    R.deleted ∈ SelectedClass D.A S.oppApex1 radius
  source_off_surplus : R.sourcePair.x ∉ S.surplusCap
  deleted_off_surplus : R.deleted ∉ S.surplusCap
  source_or_deleted_mem_strictOppCap1 :
    R.sourcePair.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      R.deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  source_survives_firstApex :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex1
  deleted_survives_firstApex :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) S.oppApex1
  source_survives_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex2
  deleted_survives_secondApex :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) S.oppApex2
  source_critical_at_firstCenter :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) R.firstCenter
  deleted_survives_firstCenter :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) R.firstCenter
  blocker_centers_ne :
    R.firstCenter ≠
      H.centerAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  selectedRows_inter_card_le_two :
    (((H.selectedAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support ∩
      R.sourceRow.support).card ≤ 2)
  sourceRow_exact_after_deleted :
    SelectedClass (D.A.erase R.deleted) R.firstCenter R.sourceRow.radius =
      R.sourceRow.support
  sourceRow_unique_radius_after_deleted :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass (D.A.erase R.deleted)
        R.firstCenter tau).card →
      tau = R.sourceRow.radius
  directedCross_signedArea_product_neg :
    signedArea2 R.sourcePair.x S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
      signedArea2 R.deleted S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0

end CoherentRCommonDeletionPacket

open CoherentRCommonDeletionPacket

/-- The least-terminal-hit branch either supplies the already-isolated
source-outside input, or a fully retained asymmetric directed-cross residual.
-/
theorem LeastPositiveTerminalHitPredecessor.sourceOutside_or_reciprocalDirectedCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    (∃ R : CoherentRCommonDeletionPacket T P H,
      R.SourceOutsideDeletedCriticalShell) ∨
    (∃ R : CoherentRCommonDeletionPacket T P H,
      Nonempty (ReciprocalDirectedCrossResidual R)) := by
  rcases K.nonempty_coherentRCommonDeletionPacket with ⟨R⟩
  by_cases houtside : R.SourceOutsideDeletedCriticalShell
  · exact Or.inl ⟨R, houtside⟩
  · right
    have hsourceIn :
        R.sourcePair.x ∈
          (H.selectedAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support := by
      change ¬ R.sourcePair.x ∉
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support
        at houtside
      exact not_not.mp houtside
    have hcenters :
        R.firstCenter ≠
          H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1 := by
      have hne :=
        blocker_centers_ne_of_not_mem_other_selected_support H
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
          (mem_selectedClass.mp R.source_mem_fixedClass).1
          R.deleted_not_mem_sourceRow
      simpa [firstCenter] using hne.symm
    have hinter :=
      selected_support_inter_card_le_two_of_not_mem_other_selected_support H
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        (mem_selectedClass.mp R.source_mem_fixedClass).1
        R.deleted_not_mem_sourceRow
    have hexact :=
      cross_survival_unique_radius_and_exact_support H
        (mem_selectedClass.mp R.source_mem_fixedClass).1
        R.deleted_survives_firstCenter
    have hdeletedBlockerNeFirst :
        H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1 ≠
          S.oppApex1 :=
      actual_blocker_ne_of_deletion_survives H
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        R.deleted_survives_firstApex
    have hsign :=
      signedArea_product_neg_of_cross_membership
        R.deletedSourceRelocationPacket hsourceIn hdeletedBlockerNeFirst
    refine ⟨R, ⟨{
      source_mem_deletedRow := hsourceIn
      deleted_not_mem_sourceRow := R.deleted_not_mem_sourceRow
      source_mem_fixedClass := R.source_mem_fixedClass
      deleted_mem_fixedClass := R.deleted_mem_fixedClass
      source_off_surplus := R.sourcePair.x_off_surplus
      deleted_off_surplus := R.deleted_off_surplus
      source_or_deleted_mem_strictOppCap1 :=
        R.source_or_deleted_mem_strictOppCap1
      source_survives_firstApex := R.source_survives_firstApex
      deleted_survives_firstApex := R.deleted_survives_firstApex
      source_survives_secondApex := R.source_survives_secondApex
      deleted_survives_secondApex := R.deleted_survives_secondApex
      source_critical_at_firstCenter :=
        R.source_deletion_critical_at_firstCenter
      deleted_survives_firstCenter := R.deleted_survives_firstCenter
      blocker_centers_ne := hcenters
      selectedRows_inter_card_le_two := by
        simpa [sourceRow] using hinter
      sourceRow_exact_after_deleted := by
        simpa [firstCenter, sourceRow] using hexact.1
      sourceRow_unique_radius_after_deleted := by
        simpa [firstCenter, sourceRow] using hexact.2
      directedCross_signedArea_product_neg := by
        simpa [deletedSourceRelocationPacket] using hsign
    }⟩⟩

#print axioms CoherentRCommonDeletionPacket.ambient_fixedClass_card_ge_five
#print axioms CoherentRCommonDeletionPacket.source_survives_firstApex
#print axioms CoherentRCommonDeletionPacket.deleted_survives_firstApex
#print axioms CoherentRCommonDeletionPacket.deletedSourceRelocationPacket
#print axioms LeastPositiveTerminalHitPredecessor.sourceOutside_or_reciprocalDirectedCross

end ATailRFullParentEntryScratch
end Problem97
