/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredTwoRowCoverConsumer

/-!
# Freshness audit for the anchored critical-pair continuation

The anchored continuation always changes the unordered source pair: both
endpoints of the new pair differ from the old distinguished source.  This is
local freshness, but it is not a well-founded history extension.

The retained provenance gives an exact terminal-versus-erased classification
for the new pair's `deleted` endpoint.  The new row-external endpoint is only
known to lie in the ambient carrier.  In the terminal-hit arm, counting on
the terminal carrier sharpens this further:

* either a row-external successor lies in the terminal carrier, hence outside
  the whole erased history; or
* the terminal off-surplus fixed class has exactly three points, split as one
  source-row point, one second-apex-row point, and `deleted`.

Thus the first missing antecedent for strict terminal-carrier progress is the
exclusion of this exact three-point cover.  In the cycle arm the `deleted`
endpoint is itself already erased, so the ambient frontier continuation does
not append a new pair to the retained terminal history.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFrontierProgressAuditScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRActualBlockerTransitionScratch
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

theorem RowExternalCommonDeletionSource.point_ne_currentSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    X.point ≠ R.sourcePair.x := by
  intro h
  apply X.point_not_mem_sourceRow
  simpa [h] using R.source_mem_sourceRow

/-- The new frontier pair is not the old robust-history pair, even after
forgetting endpoint order.  This excludes immediate self-recurrence only. -/
theorem RowExternalCommonDeletionSource.successorPair_ne_sourcePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    ({R.deleted, X.point} : Finset ℝ²) ≠
      ({R.sourcePair.x, R.sourcePair.y} : Finset ℝ²) := by
  intro hpairs
  have hxNew :
      R.sourcePair.x ∈ ({R.deleted, X.point} : Finset ℝ²) := by
    rw [hpairs]
    simp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxNew
  rcases hxNew with hxDeleted | hxPoint
  · exact R.source_ne_deleted hxDeleted
  · apply X.point_not_mem_sourceRow
    simpa [hxPoint] using R.source_mem_sourceRow

/-- Provenance determines whether the retained `deleted` endpoint is in the
terminal carrier or in the already-erased history. -/
theorem CoherentRCommonDeletionPacket.deleted_mem_terminalCarrier_or_erasedHistory
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.deleted ∈ T.carrier ∨ R.deleted ∈ D.A \ T.carrier := by
  rcases R.provenance with
    ⟨K, _hsource, hdeletedCarrier⟩ |
      ⟨K, _hsource, hdeletedCycle⟩
  · exact Or.inl hdeletedCarrier
  · right
    rw [hdeletedCycle]
    exact K.source_mem_erased_at ⟨1, K.two_le_period⟩

/-- The current interfaces give no stronger carrier classification for the
new row-external point. -/
theorem RowExternalCommonDeletionSource.point_mem_terminalCarrier_or_erasedHistory
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    X.point ∈ T.carrier ∨ X.point ∈ D.A \ T.carrier := by
  by_cases hcarrier : X.point ∈ T.carrier
  · exact Or.inl hcarrier
  · exact Or.inr (Finset.mem_sdiff.mpr ⟨X.point_mem_A, hcarrier⟩)

/-- If the new point is retained, it is distinct from both endpoints of the
named erased history pair, not merely from its distinguished source. -/
theorem RowExternalCommonDeletionSource.point_ne_sourcePair_of_mem_terminalCarrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hcarrier : X.point ∈ T.carrier) :
    X.point ≠ R.sourcePair.x ∧ X.point ≠ R.sourcePair.y := by
  constructor
  · intro h
    apply X.point_not_mem_sourceRow
    simpa [h] using R.source_mem_sourceRow
  · intro h
    exact (Finset.mem_sdiff.mp R.sourcePair.y_mem_erased).2
      (by simpa [h] using hcarrier)

private theorem terminal_offSurplus_fixedClass_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius) :
    3 ≤ ((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap).card := by
  let F := T.carrier.filter fun x => dist x S.oppApex1 = radius
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFfour : 4 ≤ F.card := by
    rcases T.terminal with
      ⟨_q, _w, _hradius, _hq, _hw, _hqw, hcard, _hsecond⟩
    rcases hcard with hfour | hfive
    · simpa [F, SelectedClass, dist_comm] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
    · simpa [F, SelectedClass, dist_comm] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    calc
      (F ∩ S.surplusCap).card
          ≤ ((D.A.filter fun x => dist x S.oppApex1 = radius) ∩
              S.surplusCap).card :=
        Finset.card_le_card (by
          intro x hx
          rcases Finset.mem_inter.mp hx with ⟨hxF, hxCap⟩
          rcases Finset.mem_filter.mp hxF with ⟨hxCarrier, hxdist⟩
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr
              ⟨T.carrier_subset hxCarrier, hxdist⟩, hxCap⟩)
      _ ≤ 1 := by
        simpa [DS] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS radius
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hthree : 3 ≤ (F \ S.surplusCap).card := by omega
  simpa [F, SelectedClass, dist_comm] using hthree

private theorem terminalMarginal_inter_sourceRow_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) :
    ((((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap) ∩ R.sourceRow.support).card ≤ 1) := by
  let I :=
    ((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap) ∩ R.sourceRow.support
  let J :=
    (SelectedClass D.A S.oppApex1 radius) ∩ R.sourceRow.support
  have hJtwo : J.card ≤ 2 := by
    simpa [J] using
      criticalFourShell_fixedClass_inter_card_le_two
        (radius := radius) R.sourceRow R.firstCenter_ne_oppApex1
  have hxJ : R.sourcePair.x ∈ J :=
    Finset.mem_inter.mpr
      ⟨R.source_mem_fixedClass, R.source_mem_sourceRow⟩
  have hxNotI : R.sourcePair.x ∉ I := by
    intro hxI
    have hxCarrier :
        R.sourcePair.x ∈ T.carrier :=
      (mem_selectedClass.mp
        (Finset.mem_sdiff.mp (Finset.mem_inter.mp hxI).1).1).1
    exact (Finset.mem_sdiff.mp R.sourcePair.x_mem_erased).2 hxCarrier
  have hsub : insert R.sourcePair.x I ⊆ J := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzI
    · exact hxJ
    · rcases Finset.mem_inter.mp hzI with ⟨hzMarginal, hzRow⟩
      rcases Finset.mem_sdiff.mp hzMarginal with ⟨hzClass, _hzOff⟩
      rcases mem_selectedClass.mp hzClass with ⟨hzCarrier, hzdistance⟩
      exact Finset.mem_inter.mpr
        ⟨mem_selectedClass.mpr
          ⟨T.carrier_subset hzCarrier, hzdistance⟩, hzRow⟩
  have hcard :=
    Finset.card_le_card hsub
  rw [Finset.card_insert_of_notMem hxNotI] at hcard
  simpa [I] using (show I.card ≤ 1 by omega)

private theorem terminalMarginal_inter_secondApexRow_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ((((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap) ∩ R.secondApexRow.support).card ≤ 1) := by
  apply le_trans (Finset.card_le_card ?_)
    (secondApexRow_inter_fixedMarginal_card_le_one A)
  intro z hz
  rcases Finset.mem_inter.mp hz with ⟨hzMarginal, hzRow⟩
  rcases Finset.mem_sdiff.mp hzMarginal with ⟨hzClass, hzOff⟩
  rcases mem_selectedClass.mp hzClass with ⟨hzCarrier, hzdistance⟩
  exact Finset.mem_inter.mpr
    ⟨Finset.mem_sdiff.mpr
      ⟨mem_selectedClass.mpr
        ⟨T.carrier_subset hzCarrier, hzdistance⟩, hzOff⟩,
      hzRow⟩

/-- The exact terminal-carrier obstruction to selecting a new point outside
both retained rows. -/
structure TerminalThreePointTwoRowCoverResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) : Prop where
  marginal_card_eq_three :
    ((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap).card = 3
  outside_rows_eq_deleted :
    ((SelectedClass T.carrier S.oppApex1 radius) \ S.surplusCap) \
        (R.sourceRow.support ∪ R.secondApexRow.support) =
      {R.deleted}
  sourceRow_hits_one :
    ((((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap) ∩ R.sourceRow.support).card = 1)
  secondApexRow_hits_one :
    ((((SelectedClass T.carrier S.oppApex1 radius) \
      S.surplusCap) ∩ R.secondApexRow.support).card = 1)

/-- In the terminal-hit provenance arm, either the continuation point is
genuinely retained by the terminal carrier or the exact three-point cover is
forced. -/
theorem exists_terminalCarrier_sharedRowSource_or_threePointCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R)
    (hdeletedCarrier : R.deleted ∈ T.carrier) :
    (∃ X : RowExternalCommonDeletionSource A,
      X.point ∈ T.carrier ∧ X.point ∉ S.surplusCap) ∨
      TerminalThreePointTwoRowCoverResidual A := by
  classical
  let M :=
    (SelectedClass T.carrier S.oppApex1 radius) \ S.surplusCap
  let U := R.sourceRow.support ∪ R.secondApexRow.support
  have hMthree : 3 ≤ M.card := by
    simpa [M] using terminal_offSurplus_fixedClass_card_ge_three T
  have hsource :
      (M ∩ R.sourceRow.support).card ≤ 1 := by
    simpa [M] using terminalMarginal_inter_sourceRow_card_le_one A
  have hsecond :
      (M ∩ R.secondApexRow.support).card ≤ 1 := by
    simpa [M] using terminalMarginal_inter_secondApexRow_card_le_one A
  have hdecomp :
      M ∩ U =
        (M ∩ R.sourceRow.support) ∪
          (M ∩ R.secondApexRow.support) := by
    ext z
    simp [U, and_or_left]
  have hinter : (M ∩ U).card ≤ 2 := by
    rw [hdecomp]
    exact le_trans (Finset.card_union_le _ _) (by omega)
  have hdeletedM : R.deleted ∈ M := by
    refine Finset.mem_sdiff.mpr ⟨?_, R.deleted_off_surplus⟩
    exact mem_selectedClass.mpr
      ⟨hdeletedCarrier,
        (mem_selectedClass.mp R.deleted_mem_fixedClass).2⟩
  have hdeletedU : R.deleted ∉ U := by
    intro h
    rcases Finset.mem_union.mp h with hsourceRow | hsecondRow
    · exact R.deleted_not_mem_sourceRow hsourceRow
    · exact R.secondApexRowQDeleted.q_not_mem hsecondRow
  have hdeletedOutside : R.deleted ∈ M \ U :=
    Finset.mem_sdiff.mpr ⟨hdeletedM, hdeletedU⟩
  by_cases hex :
      ∃ x : ℝ², x ∈ M \ U ∧ x ≠ R.deleted
  · rcases hex with ⟨x, hxOutside, hxDeleted⟩
    rcases Finset.mem_sdiff.mp hxOutside with ⟨hxM, hxU⟩
    rcases Finset.mem_sdiff.mp hxM with ⟨hxClass, hxOff⟩
    have hxSource : x ∉ R.sourceRow.support := by
      intro h
      exact hxU (Finset.mem_union.mpr (Or.inl h))
    have hxSecond : x ∉ R.secondApexRow.support := by
      intro h
      exact hxU (Finset.mem_union.mpr (Or.inr h))
    left
    exact
      ⟨{
        point := x
        point_mem_fixedClass := by
          rcases mem_selectedClass.mp hxClass with
            ⟨hxCarrier, hxdistance⟩
          exact mem_selectedClass.mpr
            ⟨T.carrier_subset hxCarrier, hxdistance⟩
        point_ne_deleted := hxDeleted
        point_not_mem_sourceRow := hxSource
        point_not_mem_secondApexRow := hxSecond },
        (mem_selectedClass.mp hxClass).1, hxOff⟩
  · right
    have houtsideEq : M \ U = {R.deleted} := by
      apply Finset.Subset.antisymm
      · intro x hx
        have hxEq : x = R.deleted := by
          by_contra hxNe
          exact hex ⟨x, hx, hxNe⟩
        simp [hxEq]
      · intro x hx
        simpa only [Finset.mem_singleton.mp hx] using hdeletedOutside
    have houtsideCard : (M \ U).card = 1 := by
      rw [houtsideEq, Finset.card_singleton]
    have hsplit := Finset.card_sdiff_add_card_inter M U
    have hMcard : M.card = 3 := by omega
    have hinterCard : (M ∩ U).card = 2 := by omega
    have hunionCard :
        ((M ∩ R.sourceRow.support) ∪
          (M ∩ R.secondApexRow.support)).card = 2 := by
      rw [← hdecomp]
      exact hinterCard
    have hsourceCard :
        (M ∩ R.sourceRow.support).card = 1 := by
      have hunionLe := Finset.card_union_le
        (M ∩ R.sourceRow.support)
        (M ∩ R.secondApexRow.support)
      omega
    have hsecondCard :
        (M ∩ R.secondApexRow.support).card = 1 := by
      have hunionLe := Finset.card_union_le
        (M ∩ R.sourceRow.support)
        (M ∩ R.secondApexRow.support)
      omega
    exact
      { marginal_card_eq_three := by simpa [M] using hMcard
        outside_rows_eq_deleted := by
          simpa [M, U] using houtsideEq
        sourceRow_hits_one := by simpa [M] using hsourceCard
        secondApexRow_hits_one := by simpa [M] using hsecondCard }

/-- Strongest carrier-history normal form available from the current
interfaces.  The cycle arm is explicit: its retained `deleted` endpoint is
already in the erased history. -/
theorem anchored_frontier_historyFreshness_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    (∃ X : RowExternalCommonDeletionSource A,
      R.deleted ∈ T.carrier ∧
      X.point ∈ T.carrier ∧
      X.point ∉ S.surplusCap) ∨
    (R.deleted ∈ T.carrier ∧
      TerminalThreePointTwoRowCoverResidual A) ∨
    R.deleted ∈ D.A \ T.carrier := by
  rcases
      _root_.Problem97.ATailRFrontierProgressAuditScratch.CoherentRCommonDeletionPacket.deleted_mem_terminalCarrier_or_erasedHistory
        R with
    hdeletedCarrier | hdeletedErased
  · rcases
      exists_terminalCarrier_sharedRowSource_or_threePointCover
        A hdeletedCarrier with hsource | hresidual
    · left
      rcases hsource with ⟨X, hXCarrier, hXOff⟩
      exact ⟨X, hdeletedCarrier, hXCarrier, hXOff⟩
    · exact Or.inr (Or.inl ⟨hdeletedCarrier, hresidual⟩)
  · exact Or.inr (Or.inr hdeletedErased)

#print axioms RowExternalCommonDeletionSource.successorPair_ne_sourcePair
#print axioms
  CoherentRCommonDeletionPacket.deleted_mem_terminalCarrier_or_erasedHistory
#print axioms exists_terminalCarrier_sharedRowSource_or_threePointCover
#print axioms anchored_frontier_historyFreshness_normalForm

end ATailRFrontierProgressAuditScratch
end Problem97
