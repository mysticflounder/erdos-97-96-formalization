/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TerminalThreePointResidual

/-!
# Source-faithful terminal common-deletion packet

The least-terminal-hit constructor starts with a second-apex K4 witness after
deleting both named terminal endpoints.  The existing coherent packet first
enlarges the carrier and then chooses a new arbitrary four-point subrow.  This
scratch refinement instead chooses the terminal row first and lifts that exact
support to the ambient carrier.

Consequently the strengthened packet retains both terminal endpoints, the
least-positive-terminal-hit predecessor, and a support-identical terminal and
ambient second-apex row.  The terminal three-point residual can then name its
two singleton row hits exactly.  No metric equality between those rows is
claimed here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalSourceFaithfulPacketScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRActualBlockerTransitionScratch
open ATailRFrontierProgressAuditScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRTransitionLiveSurfaceScratch
open ATailRTerminalThreePointResidualScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Choose an exact four-point row from a K4 witness. -/
private theorem nonempty_selectedFourClass_of_hasNEquidistantPointsAt
    {A : Finset ℝ²} {center : ℝ²}
    (h : HasNEquidistantPointsAt 4 A center) :
    Nonempty (SelectedFourClass A center) := by
  classical
  rcases h with ⟨r, hr, hcard⟩
  let C := A.filter fun z ↦ dist center z = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with
    ⟨B, hBC, hBcard⟩
  exact ⟨
    { support := B
      support_subset_A := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).1
      support_card := hBcard
      radius := r
      radius_pos := hr
      support_eq_radius := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).2
      center_not_mem := by
        intro hcenter
        have hdist := (Finset.mem_filter.mp (hBC hcenter)).2
        rw [dist_self] at hdist
        linarith }⟩

/-- Lift a selected row along a carrier inclusion without changing its
support or radius. -/
private def liftSelectedFourClass
    {A B : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) (hAB : A ⊆ B) :
    SelectedFourClass B center where
  support := K.support
  support_subset_A := fun _ hz ↦ hAB (K.support_subset_A hz)
  support_card := K.support_card
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.support_eq_radius
  center_not_mem := K.center_not_mem

/-- The terminal-hit coherent packet with the information discarded by the
old monotone-lift constructor retained explicitly. -/
structure SourceFaithfulTerminalCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A) : Type where
  predecessor : LeastPositiveTerminalHitPredecessor P H
  coherent : CoherentRCommonDeletionPacket T P H
  source_eq_predecessor :
    coherent.sourcePair.x = predecessor.predecessorPair.x
  otherTerminal : ℝ²
  deleted_mem_terminalMarginal :
    coherent.deleted ∈
      (T.carrier.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap
  otherTerminal_mem_terminalMarginal :
    otherTerminal ∈
      (T.carrier.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap
  deleted_ne_otherTerminal : coherent.deleted ≠ otherTerminal
  terminalSecondApexRow :
    SelectedFourClass
      ((T.carrier.erase coherent.deleted).erase otherTerminal) S.oppApex2
  secondApexRow_support_eq :
    coherent.secondApexRow.support = terminalSecondApexRow.support
  secondApexRow_radius_eq :
    coherent.secondApexRow.radius = terminalSecondApexRow.radius

namespace SourceFaithfulTerminalCommonDeletionPacket

/-- Build the source-faithful packet after choosing which terminal endpoint
is omitted from the predecessor's exact critical row. -/
private theorem nonempty_of_terminalEndpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (Q : AmbientRobustHistoryPair D S T.carrier radius)
    (hQpredecessor : Q.x = K.predecessorPair.x)
    {deleted other : ℝ²}
    (hdeleted : deleted ∈
      (T.carrier.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap)
    (hother : other ∈
      (T.carrier.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap)
    (hdeletedOther : deleted ≠ other)
    (hdeletedOmitted : deleted ∉
      (H.selectedAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support)
    (terminalRow :
      SelectedFourClass
        ((T.carrier.erase deleted).erase other) S.oppApex2) :
    Nonempty (SourceFaithfulTerminalCommonDeletionPacket T P H) := by
  have hdeletedCarrier : deleted ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hdeleted).1).1
  have hdeletedA : deleted ∈ D.A := T.carrier_subset hdeletedCarrier
  have hdeletedClass :
      deleted ∈ SelectedClass D.A S.oppApex1 radius := by
    exact mem_selectedClass.mpr
      ⟨hdeletedA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hdeleted).1).2⟩
  have hdeletedOff : deleted ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hdeleted).2
  have hsourceNeDeleted : Q.x ≠ deleted := by
    intro h
    exact (Finset.mem_sdiff.mp Q.x_mem_erased).2
      (by simpa [h] using hdeletedCarrier)
  have hsourceClass := (T.pair_endpoints_mem_fixedClass Q).1
  have hstrict := one_of_two_fixed_offSurplus_mem_strictOppCap1
    D S radius hsourceClass hdeletedClass Q.x_off_surplus
      hdeletedOff hsourceNeDeleted
  have hsmallSubset :
      ((T.carrier.erase deleted).erase other) ⊆
        ((D.A.erase Q.x).erase deleted) := by
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨_zOther, hzEraseDeleted⟩
    rcases Finset.mem_erase.mp hzEraseDeleted with
      ⟨hzDeleted, hzCarrier⟩
    have hzSource : z ≠ Q.x := by
      intro h
      exact (Finset.mem_sdiff.mp Q.x_mem_erased).2
        (by simpa [h] using hzCarrier)
    exact Finset.mem_erase.mpr
      ⟨hzDeleted,
        Finset.mem_erase.mpr ⟨hzSource, T.carrier_subset hzCarrier⟩⟩
  let ambientRow :
      SelectedFourClass
        ((D.A.erase Q.x).erase deleted) S.oppApex2 :=
    liftSelectedFourClass terminalRow hsmallSubset
  have hcenterTerminal :
      H.centerAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1 ∈ T.carrier := by
    simpa [hQpredecessor] using K.predecessor_blocker_mem_terminal
  let R : CoherentRCommonDeletionPacket T P H :=
    { sourcePair := Q
      deleted := deleted
      deleted_mem_fixedClass := hdeletedClass
      deleted_off_surplus := hdeletedOff
      source_ne_deleted := hsourceNeDeleted
      source_or_deleted_mem_strictOppCap1 := hstrict
      deleted_not_mem_sourceRow := hdeletedOmitted
      secondApexRow := ambientRow
      firstCenter_terminal_or_self := Or.inl hcenterTerminal
      provenance := Or.inl ⟨K, hQpredecessor, hdeletedCarrier⟩ }
  exact ⟨
    { predecessor := K
      coherent := R
      source_eq_predecessor := hQpredecessor
      otherTerminal := other
      deleted_mem_terminalMarginal := hdeleted
      otherTerminal_mem_terminalMarginal := hother
      deleted_ne_otherTerminal := hdeletedOther
      terminalSecondApexRow := terminalRow
      secondApexRow_support_eq := rfl
      secondApexRow_radius_eq := rfl }⟩

/-- The least-positive-terminal-hit producer can preserve the original
double-erased second-apex row exactly. -/
theorem LeastPositiveTerminalHitPredecessor.nonempty_sourceFaithfulTerminalPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    Nonempty (SourceFaithfulTerminalCommonDeletionPacket T P H) := by
  rcases exists_ambientRobustHistoryPair_with_source_of_erased
      D S T.history K.predecessor_mem_erased with
    ⟨predecessorRadius, Q, hQsource⟩
  have hQradius : predecessorRadius = radius :=
    T.pair_radius_eq_fixed Q
  subst predecessorRadius
  have hQpredecessor : Q.x = K.predecessorPair.x :=
    hQsource.trans K.predecessor_source_eq.symm
  let sourceRow :=
    (H.selectedAt Q.x
      (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell
  rcases T.terminal with
    ⟨q, w, _hradius, hq, hw, hqw, _hcard, hsecond⟩
  rcases nonempty_selectedFourClass_of_hasNEquidistantPointsAt hsecond with
    ⟨terminalRow⟩
  have hqCarrier : q ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
  have hwCarrier : w ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).1
  have hqA : q ∈ D.A := T.carrier_subset hqCarrier
  have hwA : w ∈ D.A := T.carrier_subset hwCarrier
  have hqClass : q ∈ SelectedClass D.A S.oppApex1 radius :=
    mem_selectedClass.mpr
      ⟨hqA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).2⟩
  have hwClass : w ∈ SelectedClass D.A S.oppApex1 radius :=
    mem_selectedClass.mpr
      ⟨hwA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).2⟩
  have hsourceClass := (T.pair_endpoints_mem_fixedClass Q).1
  have hsourceNotCarrier : Q.x ∉ T.carrier :=
    (Finset.mem_sdiff.mp Q.x_mem_erased).2
  have hsourceNeQ : Q.x ≠ q := by
    intro h
    exact hsourceNotCarrier (by simpa [h] using hqCarrier)
  have hsourceNeW : Q.x ≠ w := by
    intro h
    exact hsourceNotCarrier (by simpa [h] using hwCarrier)
  have hcenterNeFirst :
      H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 ≠
        S.oppApex1 :=
    AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 Q H
  have hinter :
      ((SelectedClass D.A S.oppApex1 radius) ∩
        sourceRow.support).card ≤ 2 := by
    exact criticalFourShell_fixedClass_inter_card_le_two
      sourceRow hcenterNeFirst
  have hsourceRow : Q.x ∈ sourceRow.support :=
    sourceRow.q_mem_support
  have hq_or_hw_omitted :
      q ∉ sourceRow.support ∨ w ∉ sourceRow.support := by
    by_cases hqRow : q ∈ sourceRow.support
    · right
      intro hwRow
      have hsourceInter :
          Q.x ∈
            (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hsourceClass, hsourceRow⟩
      have hqInter :
          q ∈ (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hqClass, hqRow⟩
      have hwInter :
          w ∈ (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hwClass, hwRow⟩
      have hthree :
          2 < ((SelectedClass D.A S.oppApex1 radius) ∩
            sourceRow.support).card := by
        rw [Finset.two_lt_card]
        exact ⟨Q.x, hsourceInter, q, hqInter, w, hwInter,
          hsourceNeQ, hsourceNeW, hqw⟩
      omega
    · exact Or.inl hqRow
  rcases hq_or_hw_omitted with hqOmitted | hwOmitted
  · exact nonempty_of_terminalEndpoint
      K Q hQpredecessor hq hw hqw hqOmitted terminalRow
  · let swappedTerminalRow :
        SelectedFourClass
          ((T.carrier.erase w).erase q) S.oppApex2 := by
      simpa [Finset.erase_right_comm] using terminalRow
    exact nonempty_of_terminalEndpoint
      K Q hQpredecessor hw hq hqw.symm hwOmitted swappedTerminalRow

/-- The retained deleted endpoint is still a terminal-carrier point. -/
theorem deleted_mem_terminalCarrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.coherent.deleted ∈ T.carrier :=
  (Finset.mem_filter.mp
    (Finset.mem_sdiff.mp W.deleted_mem_terminalMarginal).1).1

/-- The retained other endpoint is still a terminal-carrier point. -/
theorem otherTerminal_mem_terminalCarrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.otherTerminal ∈ T.carrier :=
  (Finset.mem_filter.mp
    (Finset.mem_sdiff.mp W.otherTerminal_mem_terminalMarginal).1).1

/-- The deleted endpoint lies in the terminal selected marginal used by the
current residual. -/
theorem deleted_mem_selectedMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.coherent.deleted ∈
      SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap := by
  rcases Finset.mem_sdiff.mp W.deleted_mem_terminalMarginal with
    ⟨hfilter, hoff⟩
  exact Finset.mem_sdiff.mpr
    ⟨mem_selectedClass.mpr
      ⟨(Finset.mem_filter.mp hfilter).1, by
        simpa [dist_comm] using (Finset.mem_filter.mp hfilter).2⟩,
      hoff⟩

/-- The other endpoint lies in the same terminal selected marginal. -/
theorem otherTerminal_mem_selectedMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.otherTerminal ∈
      SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap := by
  rcases Finset.mem_sdiff.mp W.otherTerminal_mem_terminalMarginal with
    ⟨hfilter, hoff⟩
  exact Finset.mem_sdiff.mpr
    ⟨mem_selectedClass.mpr
      ⟨(Finset.mem_filter.mp hfilter).1, by
        simpa [dist_comm] using (Finset.mem_filter.mp hfilter).2⟩,
      hoff⟩

/-- The original terminal row omits the endpoint chosen as the common
deletion. -/
theorem deleted_not_mem_terminalSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.coherent.deleted ∉ W.terminalSecondApexRow.support := by
  intro h
  have hsmall := W.terminalSecondApexRow.support_subset_A h
  exact
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp hsmall).2).1 rfl

/-- The original terminal row also omits the other named terminal endpoint. -/
theorem otherTerminal_not_mem_terminalSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.otherTerminal ∉ W.terminalSecondApexRow.support := by
  intro h
  have hsmall := W.terminalSecondApexRow.support_subset_A h
  exact (Finset.mem_erase.mp hsmall).1 rfl

/-- The support-identical ambient lift also omits the other terminal
endpoint. -/
theorem otherTerminal_not_mem_secondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.otherTerminal ∉ W.coherent.secondApexRow.support := by
  intro h
  rw [W.secondApexRow_support_eq] at h
  exact W.otherTerminal_not_mem_terminalSecondApexRow h

/-- The coherent first center is the actual least positive terminal hit. -/
theorem firstCenter_eq_leastPositiveTerminalHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.coherent.firstCenter =
      ((H.blockerVertex^[W.predecessor.hitTime])
        (actualBlockerStartVertex P)).1 := by
  simpa [CoherentRCommonDeletionPacket.firstCenter,
    W.source_eq_predecessor] using
      W.predecessor.predecessor_blocker_eq_hit

/-- In the exact terminal three-point residual, the other named terminal
endpoint is the unique source-row marginal hit. -/
theorem otherTerminal_mem_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.otherTerminal ∈ W.coherent.sourceRow.support := by
  by_contra hsource
  have houtside :
      W.otherTerminal ∈
        (SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) \
          (W.coherent.sourceRow.support ∪
            W.coherent.secondApexRow.support) :=
    Finset.mem_sdiff.mpr
      ⟨W.otherTerminal_mem_selectedMarginal, by
        intro hrows
        rcases Finset.mem_union.mp hrows with hs | hsecond
        · exact hsource hs
        · exact W.otherTerminal_not_mem_secondApexRow hsecond⟩
  rw [C.outside_rows_eq_deleted] at houtside
  have heq : W.otherTerminal = W.coherent.deleted := by
    simpa using houtside
  exact W.deleted_ne_otherTerminal heq.symm

/-- Exact singleton form of the source-row marginal. -/
theorem sourceRow_marginal_eq_otherTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        W.coherent.sourceRow.support) =
      {W.otherTerminal} := by
  apply Finset.eq_singleton_iff_unique_mem.mpr
  refine ⟨Finset.mem_inter.mpr
    ⟨W.otherTerminal_mem_selectedMarginal,
      W.otherTerminal_mem_sourceRow C⟩, ?_⟩
  intro z hz
  have hone :
      (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        W.coherent.sourceRow.support).card ≤ 1) := by
    exact le_of_eq C.sourceRow_hits_one
  rw [Finset.card_le_one] at hone
  exact hone z hz W.otherTerminal
    (Finset.mem_inter.mpr
      ⟨W.otherTerminal_mem_selectedMarginal,
        W.otherTerminal_mem_sourceRow C⟩)

/-- Name the unique terminal marginal point in the source-faithful
second-apex row. -/
def terminalSecondRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) : ℝ² :=
  Classical.choose (Finset.card_eq_one.mp C.secondApexRow_hits_one)

/-- Exact singleton form of the current second-apex-row marginal. -/
theorem secondApexRow_marginal_eq_terminalSecondRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        W.coherent.secondApexRow.support) =
      {W.terminalSecondRowHit C} :=
  Classical.choose_spec (Finset.card_eq_one.mp C.secondApexRow_hits_one)

/-- The same singleton statement holds for the original double-erased
terminal row because the ambient lift preserved its support exactly. -/
theorem terminalSecondApexRow_marginal_eq_terminalSecondRowHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        W.terminalSecondApexRow.support) =
      {W.terminalSecondRowHit C} := by
  rw [← W.secondApexRow_support_eq]
  exact W.secondApexRow_marginal_eq_terminalSecondRowHit C

/-- The named hit is a terminal marginal point. -/
theorem terminalSecondRowHit_mem_selectedMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ∈
      SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap := by
  have h :
      W.terminalSecondRowHit C ∈
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          W.coherent.secondApexRow.support) := by
    rw [W.secondApexRow_marginal_eq_terminalSecondRowHit C]
    simp
  exact (Finset.mem_inter.mp h).1

/-- The named hit lies in the original double-erased terminal row, not only
in an arbitrary row selected after ambient enlargement. -/
theorem terminalSecondRowHit_mem_terminalSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ∈ W.terminalSecondApexRow.support := by
  have h :
      W.terminalSecondRowHit C ∈
        W.coherent.secondApexRow.support := by
    have hinter :
        W.terminalSecondRowHit C ∈
          ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
            W.coherent.secondApexRow.support) := by
      rw [W.secondApexRow_marginal_eq_terminalSecondRowHit C]
      simp
    exact (Finset.mem_inter.mp hinter).2
  rwa [W.secondApexRow_support_eq] at h

/-- The two singleton row hits remain distinct: the named terminal-row hit
does not lie in the predecessor's source row. -/
theorem terminalSecondRowHit_not_mem_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ∉ W.coherent.sourceRow.support := by
  intro hsource
  have hmarginal := W.terminalSecondRowHit_mem_selectedMarginal C
  have hsecond : W.terminalSecondRowHit C ∈
      W.coherent.secondApexRow.support := by
    rw [W.secondApexRow_support_eq]
    exact W.terminalSecondRowHit_mem_terminalSecondApexRow C
  have hinter :
      W.terminalSecondRowHit C ∈
        (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
            W.coherent.sourceRow.support) ∩
          ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
            W.coherent.secondApexRow.support)) :=
    Finset.mem_inter.mpr
      ⟨Finset.mem_inter.mpr ⟨hmarginal, hsource⟩,
        Finset.mem_inter.mpr ⟨hmarginal, hsecond⟩⟩
  rw [terminalThreePoint_rows_inter_eq_empty C] at hinter
  simp at hinter

/-- The entire off-surplus terminal marginal is now source-faithfully named:
the deleted endpoint, the other endpoint, and the unique hit of the original
double-erased second-apex row. -/
theorem terminalMarginal_eq_named_triple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap =
      ({W.coherent.deleted, W.otherTerminal,
        W.terminalSecondRowHit C} : Finset ℝ²) := by
  rw [terminalThreePoint_row_partition C,
    W.sourceRow_marginal_eq_otherTerminal C,
    W.secondApexRow_marginal_eq_terminalSecondRowHit C]
  ext z
  simp [or_comm, or_left_comm]

/-- The named second-row hit is distinct from both terminal endpoints. -/
theorem terminalSecondRowHit_ne_endpoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ≠ W.coherent.deleted ∧
      W.terminalSecondRowHit C ≠ W.otherTerminal := by
  have hrow := W.terminalSecondRowHit_mem_terminalSecondApexRow C
  constructor
  · intro h
    rw [h] at hrow
    exact W.deleted_not_mem_terminalSecondApexRow hrow
  · intro h
    rw [h] at hrow
    exact W.otherTerminal_not_mem_terminalSecondApexRow hrow

#print axioms
  LeastPositiveTerminalHitPredecessor.nonempty_sourceFaithfulTerminalPacket
#print axioms deleted_mem_terminalCarrier
#print axioms otherTerminal_mem_terminalCarrier
#print axioms firstCenter_eq_leastPositiveTerminalHit
#print axioms otherTerminal_mem_sourceRow
#print axioms sourceRow_marginal_eq_otherTerminal
#print axioms secondApexRow_marginal_eq_terminalSecondRowHit
#print axioms terminalSecondApexRow_marginal_eq_terminalSecondRowHit
#print axioms terminalSecondRowHit_mem_terminalSecondApexRow
#print axioms terminalSecondRowHit_not_mem_sourceRow
#print axioms terminalMarginal_eq_named_triple
#print axioms terminalSecondRowHit_ne_endpoints

end SourceFaithfulTerminalCommonDeletionPacket

end

end ATailRTerminalSourceFaithfulPacketScratch
end Problem97
