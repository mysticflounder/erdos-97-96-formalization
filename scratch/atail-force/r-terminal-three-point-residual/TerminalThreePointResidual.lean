/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FrontierProgressAudit

/-!
# Exact normal form for the terminal three-point residual

The terminal `1 + 1 + deleted` residual is not eliminated by the current
one-hit and cap-order interfaces.  They do force a sharper exact profile:

* the terminal first-apex class has exactly four points;
* exactly one of those points lies in the surplus cap;
* the three off-surplus points are `deleted`, the unique source-row hit, and
  the unique second-apex-row hit;
* those two row hits are distinct; and
* the off-surplus marginal has either three strict `oppCap1` points, or two
  strict `oppCap1` points and the unique `oppCap2` hit.

Thus a single common terminal-marginal point of the two retained rows is a
precise sufficient antecedent for contradiction, but no current field
produces that incidence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalThreePointResidualScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRFrontierProgressAuditScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

theorem terminalThreePoint_fixedClass_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    (SelectedClass T.carrier S.oppApex1 radius).card = 4 := by
  classical
  let F := SelectedClass T.carrier S.oppApex1 radius
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hterminal : F.card = 4 ∨ F.card = 5 := by
    rcases T.terminal with
      ⟨_q, _w, _hradius, _hq, _hw, _hqw, hcard, _hsecond⟩
    simpa [F] using hcard
  have hM : (F \ S.surplusCap).card = 3 := by
    simpa [F] using C.marginal_card_eq_three
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    calc
      (F ∩ S.surplusCap).card
          ≤ ((D.A.filter fun x => dist x S.oppApex1 = radius) ∩
              S.surplusCap).card :=
        Finset.card_le_card (by
          intro x hx
          rcases Finset.mem_inter.mp hx with ⟨hxF, hxCap⟩
          rcases mem_selectedClass.mp hxF with ⟨hxCarrier, hxdist⟩
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr
              ⟨T.carrier_subset hxCarrier, by
                simpa [dist_comm] using hxdist⟩,
              hxCap⟩)
      _ ≤ 1 := by
        simpa [DS] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS radius
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hF : F.card = 4 := by omega
  simpa [F] using hF

theorem terminalThreePoint_fixedClass_surplus_hits_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((SelectedClass T.carrier S.oppApex1 radius) ∩
      S.surplusCap).card = 1 := by
  let F := SelectedClass T.carrier S.oppApex1 radius
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hF : F.card = 4 := by
    simpa [F] using terminalThreePoint_fixedClass_card_eq_four C
  have hM : (F \ S.surplusCap).card = 3 := by
    simpa [F] using C.marginal_card_eq_three
  have hhit : (F ∩ S.surplusCap).card = 1 := by omega
  simpa [F] using hhit

theorem terminalThreePoint_row_partition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    (SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) =
      (({R.deleted} : Finset ℝ²) ∪
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          R.sourceRow.support)) ∪
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          R.secondApexRow.support) := by
  classical
  let M := SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap
  let U := R.sourceRow.support ∪ R.secondApexRow.support
  have hdeletedOutside : R.deleted ∈ M \ U := by
    rw [C.outside_rows_eq_deleted]
    simp
  ext x
  constructor
  · intro hxM
    by_cases hxU : x ∈ U
    · rcases Finset.mem_union.mp hxU with hxSource | hxSecond
      · exact Finset.mem_union.mpr
          (Or.inl (Finset.mem_union.mpr
            (Or.inr (Finset.mem_inter.mpr ⟨hxM, hxSource⟩))))
      · exact Finset.mem_union.mpr
          (Or.inr (Finset.mem_inter.mpr ⟨hxM, hxSecond⟩))
    · have hxOutside : x ∈ M \ U :=
        Finset.mem_sdiff.mpr ⟨hxM, hxU⟩
      rw [C.outside_rows_eq_deleted] at hxOutside
      have hxDeleted : x = R.deleted := by simpa using hxOutside
      exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_union.mpr (Or.inl (by simp [hxDeleted]))))
  · intro hx
    rcases Finset.mem_union.mp hx with hxLeft | hxSecond
    · rcases Finset.mem_union.mp hxLeft with hxDeleted | hxSource
      · have hxEq : x = R.deleted := by simpa using hxDeleted
        subst x
        simpa [M] using (Finset.mem_sdiff.mp hdeletedOutside).1
      · exact (Finset.mem_inter.mp hxSource).1
    · exact (Finset.mem_inter.mp hxSecond).1

theorem terminalThreePoint_rows_inter_eq_empty
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        R.sourceRow.support) ∩
      ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        R.secondApexRow.support)) = ∅ := by
  classical
  let M := SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap
  let U := R.sourceRow.support ∪ R.secondApexRow.support
  let Arow := M ∩ R.sourceRow.support
  let Brow := M ∩ R.secondApexRow.support
  have houtsideCard : (M \ U).card = 1 := by
    rw [C.outside_rows_eq_deleted, Finset.card_singleton]
  have hsplit := Finset.card_sdiff_add_card_inter M U
  have hinterCard : (M ∩ U).card = 2 := by
    have hM : M.card = 3 := by
      simpa [M] using C.marginal_card_eq_three
    omega
  have hdecomp : M ∩ U = Arow ∪ Brow := by
    ext x
    simp [U, Arow, Brow, and_or_left]
  have hunionCard : (Arow ∪ Brow).card = 2 := by
    rw [← hdecomp]
    exact hinterCard
  have hAcard : Arow.card = 1 := by
    simpa [Arow, M] using C.sourceRow_hits_one
  have hBcard : Brow.card = 1 := by
    simpa [Brow, M] using C.secondApexRow_hits_one
  have hunionSplit := Finset.card_union_add_card_inter Arow Brow
  have hinterZero : (Arow ∩ Brow).card = 0 := by omega
  have hinterEmpty : Arow ∩ Brow = ∅ := Finset.card_eq_zero.mp hinterZero
  simpa [Arow, Brow, M] using hinterEmpty

theorem terminalThreePoint_cap_partition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (_C : TerminalThreePointTwoRowCoverResidual A) :
    (SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) =
      ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        S.oppCap2) ∪
      ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))) := by
  classical
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  ext x
  constructor
  · intro hxM
    rcases Finset.mem_sdiff.mp hxM with ⟨hxClass, hxOff⟩
    rcases mem_selectedClass.mp hxClass with ⟨hxCarrier, hxdist⟩
    have hxFilter :
        x ∈ D.A.filter (fun z => dist z S.oppApex1 = radius) :=
      Finset.mem_filter.mpr
        ⟨T.carrier_subset hxCarrier, by simpa [dist_comm] using hxdist⟩
    have hcover :
        x ∈ S.surplusCap ∪ S.oppCap2 ∪
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) := by
      simpa [DS] using
        U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover DS radius hxFilter
    simp only [Finset.mem_union] at hcover
    rcases hcover with (hxSurplus | hxOpp2) | hxStrict
    · exact False.elim (hxOff hxSurplus)
    · exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_inter.mpr ⟨hxM, hxOpp2⟩))
    · exact Finset.mem_union.mpr
        (Or.inr (Finset.mem_inter.mpr ⟨hxM, hxStrict⟩))
  · intro hx
    rcases Finset.mem_union.mp hx with hxOpp2 | hxStrict
    · exact (Finset.mem_inter.mp hxOpp2).1
    · exact (Finset.mem_inter.mp hxStrict).1

theorem terminalThreePoint_oppCap2_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (_C : TerminalThreePointTwoRowCoverResidual A) :
    (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
      S.oppCap2).card ≤ 1) := by
  classical
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  calc
    (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        S.oppCap2).card)
        ≤ ((D.A.filter (fun x => dist x S.oppApex1 = radius) ∩
            S.oppCap2).card) :=
      Finset.card_le_card (by
        intro x hx
        rcases Finset.mem_inter.mp hx with ⟨hxMarginal, hxOpp2⟩
        rcases Finset.mem_sdiff.mp hxMarginal with ⟨hxClass, _hxOff⟩
        rcases mem_selectedClass.mp hxClass with ⟨hxCarrier, hxdist⟩
        exact Finset.mem_inter.mpr
          ⟨Finset.mem_filter.mpr
            ⟨T.carrier_subset hxCarrier, by
              simpa [dist_comm] using hxdist⟩,
            hxOpp2⟩)
    _ ≤ 1 := by
      simpa [DS] using
        U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS radius

/-- Exact cap multiplicity of the three-point off-surplus marginal. -/
theorem terminalThreePoint_cap_card_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          S.oppCap2).card = 0 ∧
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card = 3) ∨
      (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          S.oppCap2).card = 1 ∧
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card = 2)) := by
  classical
  let M := SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap
  let O := M ∩ S.oppCap2
  let I := M ∩ (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
  have hM : M.card = 3 := by
    simpa [M] using C.marginal_card_eq_three
  have hpartition : M = O ∪ I := by
    simpa [M, O, I] using terminalThreePoint_cap_partition C
  have hunionCard : (O ∪ I).card = 3 := by
    rw [← hpartition]
    exact hM
  have hinterEmpty : O ∩ I = ∅ := by
    rw [Finset.eq_empty_iff_forall_notMem]
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxO, hxI⟩
    have hxOpp2 : x ∈ S.oppCap2 := (Finset.mem_inter.mp hxO).2
    have hxStrict :
        x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
      (Finset.mem_inter.mp hxI).2
    exact (Finset.mem_sdiff.mp hxStrict).2
      (Finset.mem_union.mpr (Or.inr hxOpp2))
  have hunionSplit := Finset.card_union_add_card_inter O I
  have hinterZero : (O ∩ I).card = 0 := by rw [hinterEmpty]; simp
  have hO : O.card ≤ 1 := by
    simpa [O, M] using terminalThreePoint_oppCap2_card_le_one C
  have hcases :
      (O.card = 0 ∧ I.card = 3) ∨
        (O.card = 1 ∧ I.card = 2) := by
    omega
  simpa [O, I, M] using hcases

/-- The strongest current terminal residual normal form. -/
structure TerminalThreePointCapRowNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) : Prop where
  fixedClass_card_eq_four :
    (SelectedClass T.carrier S.oppApex1 radius).card = 4
  fixedClass_surplus_hits_one :
    ((SelectedClass T.carrier S.oppApex1 radius) ∩ S.surplusCap).card = 1
  row_partition :
    (SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) =
      (({R.deleted} : Finset ℝ²) ∪
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          R.sourceRow.support)) ∪
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          R.secondApexRow.support)
  row_marginals_disjoint :
    (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        R.sourceRow.support) ∩
      ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
        R.secondApexRow.support)) = ∅
  cap_card_split :
    ((((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          S.oppCap2).card = 0 ∧
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card = 3) ∨
      (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          S.oppCap2).card = 1 ∧
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card = 2))

theorem terminalThreePoint_toCapRowNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    TerminalThreePointCapRowNormalForm C where
  fixedClass_card_eq_four := terminalThreePoint_fixedClass_card_eq_four C
  fixedClass_surplus_hits_one := terminalThreePoint_fixedClass_surplus_hits_one C
  row_partition := terminalThreePoint_row_partition C
  row_marginals_disjoint := terminalThreePoint_rows_inter_eq_empty C
  cap_card_split := terminalThreePoint_cap_card_split C

/-- A single common point of the two row marginals closes the exact residual.
This is the smallest missing cross-incidence antecedent exposed by the
current interfaces. -/
theorem false_of_common_terminalMarginal_rowPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hcommon : ∃ z : ℝ²,
      z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
      z ∈ R.sourceRow.support ∧
      z ∈ R.secondApexRow.support) :
    False := by
  rcases hcommon with ⟨z, hzM, hzSource, hzSecond⟩
  have hz :
      z ∈
        (((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
            R.sourceRow.support) ∩
          ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) ∩
            R.secondApexRow.support)) :=
    Finset.mem_inter.mpr
      ⟨Finset.mem_inter.mpr ⟨hzM, hzSource⟩,
        Finset.mem_inter.mpr ⟨hzM, hzSecond⟩⟩
  rw [terminalThreePoint_rows_inter_eq_empty C] at hz
  simp at hz

#print axioms
  terminalThreePoint_fixedClass_card_eq_four
#print axioms
  terminalThreePoint_fixedClass_surplus_hits_one
#print axioms terminalThreePoint_row_partition
#print axioms terminalThreePoint_rows_inter_eq_empty
#print axioms terminalThreePoint_cap_partition
#print axioms terminalThreePoint_cap_card_split
#print axioms terminalThreePoint_toCapRowNormalForm
#print axioms false_of_common_terminalMarginal_rowPoint

end ATailRTerminalThreePointResidualScratch
end Problem97
