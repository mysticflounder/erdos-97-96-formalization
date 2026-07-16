/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TerminalSourceFaithfulPacket
import TerminalCapRowMetricBridge
import ReciprocalSwapReduction

/-!
# Named metric and cap localization for the source-faithful terminal residual

The source-faithful packet names all three retained off-surplus points of the
terminal first-apex class. Together with the two erased endpoints of the
robust predecessor pair, these give five distinct points on one off-surplus
first-apex fiber.

The opposite-apex escape theorem makes second-apex distance injective on this
named five-point set. The MEC cap cover and one-hit theorem then put at least
four of the five points in strict `oppCap1`. This is an exact metric/order
localization, not the missing source-circle equality.

In the aligned live-dangerous branch, the named second-row hit is forced
outside the dangerous base. Its own selected critical shell therefore has
center different from `p`; the remaining global critical-map split is whether
that center is the second opposite apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalNamedMetricAttackScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFrontierProgressAuditScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch
open ATailRTerminalSourceFaithfulPacketScratch
open ATailRTerminalSourceFaithfulPacketScratch.SourceFaithfulTerminalCommonDeletionPacket
open ATailRTerminalThreePointResidualScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

noncomputable section

namespace SourceFaithfulTerminalCommonDeletionPacket

/-- The two erased robust endpoints followed by the three named retained
off-surplus terminal points. -/
def terminalNamedFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) : Finset ℝ² :=
  {W.coherent.sourcePair.x, W.coherent.sourcePair.y, W.coherent.deleted,
    W.otherTerminal, W.terminalSecondRowHit C}

/-- The other named terminal endpoint remains in the ambient fixed class. -/
theorem otherTerminal_mem_ambientFixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    W.otherTerminal ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp W.otherTerminal_mem_selectedMarginal with
    ⟨hclass, _hoff⟩
  rcases mem_selectedClass.mp hclass with ⟨hcarrier, hdistance⟩
  exact mem_selectedClass.mpr ⟨T.carrier_subset hcarrier, hdistance⟩

/-- The named terminal second-row hit remains in the ambient fixed class. -/
theorem terminalSecondRowHit_mem_ambientFixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp (W.terminalSecondRowHit_mem_selectedMarginal C) with
    ⟨hclass, _hoff⟩
  rcases mem_selectedClass.mp hclass with ⟨hcarrier, hdistance⟩
  exact mem_selectedClass.mpr ⟨T.carrier_subset hcarrier, hdistance⟩

/-- The named terminal second-row hit is off the surplus cap. -/
theorem terminalSecondRowHit_off_surplus
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    W.terminalSecondRowHit C ∉ S.surplusCap :=
  (Finset.mem_sdiff.mp (W.terminalSecondRowHit_mem_selectedMarginal C)).2

/-- All five named points are pairwise distinct. -/
theorem terminalNamedFive_card_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    (terminalNamedFive W C).card = 5 := by
  have hxNotCarrier :
      W.coherent.sourcePair.x ∉ T.carrier :=
    (Finset.mem_sdiff.mp W.coherent.sourcePair.x_mem_erased).2
  have hyNotCarrier :
      W.coherent.sourcePair.y ∉ T.carrier :=
    (Finset.mem_sdiff.mp W.coherent.sourcePair.y_mem_erased).2
  have hxDeleted : W.coherent.sourcePair.x ≠ W.coherent.deleted :=
    W.coherent.source_ne_deleted
  have hxOther : W.coherent.sourcePair.x ≠ W.otherTerminal := by
    intro h
    apply hxNotCarrier
    rw [h]
    exact W.otherTerminal_mem_terminalCarrier
  have hxHit :
      W.coherent.sourcePair.x ≠ W.terminalSecondRowHit C := by
    intro h
    apply hxNotCarrier
    rw [h]
    exact
      (mem_selectedClass.mp
        (Finset.mem_sdiff.mp
          (W.terminalSecondRowHit_mem_selectedMarginal C)).1).1
  have hyDeleted : W.coherent.sourcePair.y ≠ W.coherent.deleted := by
    intro h
    apply hyNotCarrier
    rw [h]
    exact W.deleted_mem_terminalCarrier
  have hyOther : W.coherent.sourcePair.y ≠ W.otherTerminal := by
    intro h
    apply hyNotCarrier
    rw [h]
    exact W.otherTerminal_mem_terminalCarrier
  have hyHit :
      W.coherent.sourcePair.y ≠ W.terminalSecondRowHit C := by
    intro h
    apply hyNotCarrier
    rw [h]
    exact
      (mem_selectedClass.mp
        (Finset.mem_sdiff.mp
          (W.terminalSecondRowHit_mem_selectedMarginal C)).1).1
  rcases W.terminalSecondRowHit_ne_endpoints C with
    ⟨hhitDeleted, hhitOther⟩
  have hdeletedHit :
      W.coherent.deleted ≠ W.terminalSecondRowHit C :=
    hhitDeleted.symm
  have hotherHit :
      W.otherTerminal ≠ W.terminalSecondRowHit C :=
    hhitOther.symm
  simp [terminalNamedFive, W.coherent.sourcePair.x_ne_y, hxDeleted,
    hxOther, hxHit, hyDeleted, hyOther, hyHit, W.deleted_ne_otherTerminal,
    hdeletedHit, hotherHit]

/-- Every named point lies in the same ambient off-surplus first-apex
fiber. -/
theorem mem_terminalNamedFive_fixedMarginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    {z : ℝ²} (hz : z ∈ terminalNamedFive W C) :
    z ∈ SelectedClass D.A S.oppApex1 radius ∧ z ∉ S.surplusCap := by
  simp only [terminalNamedFive, Finset.mem_insert, Finset.mem_singleton] at hz
  rcases hz with rfl | rfl | rfl | rfl | rfl
  · exact ⟨W.coherent.source_mem_fixedClass,
      W.coherent.sourcePair.x_off_surplus⟩
  · exact ⟨(T.pair_endpoints_mem_fixedClass W.coherent.sourcePair).2,
      W.coherent.sourcePair.y_off_surplus⟩
  · exact ⟨W.coherent.deleted_mem_fixedClass,
      W.coherent.deleted_off_surplus⟩
  · exact ⟨otherTerminal_mem_ambientFixedClass W,
      (Finset.mem_sdiff.mp W.otherTerminal_mem_selectedMarginal).2⟩
  · exact ⟨terminalSecondRowHit_mem_ambientFixedClass W C,
      terminalSecondRowHit_off_surplus W C⟩

/-- Second-apex distance is injective on the five named points. -/
theorem terminalNamedFive_secondApex_distance_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    Set.InjOn (fun z : ℝ² ↦ dist z S.oppApex2)
      (terminalNamedFive W C : Set ℝ²) := by
  intro x hx y hy hdistance
  have hxNamed : x ∈ terminalNamedFive W C := by simpa using hx
  have hyNamed : y ∈ terminalNamedFive W C := by simpa using hy
  rcases mem_terminalNamedFive_fixedMarginal W C hxNamed with
    ⟨hxClass, hxOff⟩
  rcases mem_terminalNamedFive_fixedMarginal W C hyNamed with
    ⟨hyClass, hyOff⟩
  by_contra hxy
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S
    (mem_selectedClass.mp hxClass).1
    (mem_selectedClass.mp hyClass).1
    hxOff hyOff hxy
    (by simpa [dist_comm] using (mem_selectedClass.mp hxClass).2)
    (by simpa [dist_comm] using (mem_selectedClass.mp hyClass).2)
    rfl hdistance.symm

/-- At most one named point lies in `oppCap2`. -/
theorem terminalNamedFive_oppCap2_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ((terminalNamedFive W C) ∩ S.oppCap2).card ≤ 1 := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  calc
    ((terminalNamedFive W C) ∩ S.oppCap2).card
        ≤ ((D.A.filter fun z ↦ dist z S.oppApex1 = radius) ∩
            S.oppCap2).card :=
      Finset.card_le_card (by
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzNamed, hzOpp2⟩
        rcases mem_terminalNamedFive_fixedMarginal W C hzNamed with
          ⟨hzClass, _hzOff⟩
        exact Finset.mem_inter.mpr
          ⟨Finset.mem_filter.mpr
            ⟨(mem_selectedClass.mp hzClass).1, by
              simpa [dist_comm] using (mem_selectedClass.mp hzClass).2⟩,
            hzOpp2⟩)
    _ ≤ 1 := by
      simpa [DS] using
        U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS radius

/-- The named five-point set splits between `oppCap2` and strict
`oppCap1`. -/
theorem terminalNamedFive_cap_partition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    terminalNamedFive W C =
      ((terminalNamedFive W C) ∩ S.oppCap2) ∪
        ((terminalNamedFive W C) ∩
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))) := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  ext z
  constructor
  · intro hzNamed
    rcases mem_terminalNamedFive_fixedMarginal W C hzNamed with
      ⟨hzClass, hzOff⟩
    have hzFilter :
        z ∈ D.A.filter fun x ↦ dist x S.oppApex1 = radius :=
      Finset.mem_filter.mpr
        ⟨(mem_selectedClass.mp hzClass).1, by
          simpa [dist_comm] using (mem_selectedClass.mp hzClass).2⟩
    have hcover :=
      U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover DS radius hzFilter
    simp only [Finset.mem_union] at hcover
    rcases hcover with (hzSurplus | hzOpp2) | hzStrict
    · exact False.elim (hzOff (by simpa [DS] using hzSurplus))
    · exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_inter.mpr ⟨hzNamed, by simpa [DS] using hzOpp2⟩))
    · exact Finset.mem_union.mpr
        (Or.inr (Finset.mem_inter.mpr ⟨hzNamed, by simpa [DS] using hzStrict⟩))
  · intro hz
    rcases Finset.mem_union.mp hz with hzOpp2 | hzStrict
    · exact (Finset.mem_inter.mp hzOpp2).1
    · exact (Finset.mem_inter.mp hzStrict).1

/-- At least four of the five named points lie in strict `oppCap1`. -/
theorem terminalNamedFive_strictOppCap1_card_ge_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    4 ≤ ((terminalNamedFive W C) ∩
      (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card := by
  let N := terminalNamedFive W C
  let O := N ∩ S.oppCap2
  let I := N ∩ (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
  have hN : N.card = 5 := by
    simpa [N] using terminalNamedFive_card_eq_five W C
  have hO : O.card ≤ 1 := by
    simpa [N, O] using terminalNamedFive_oppCap2_card_le_one W C
  have hpartition : N = O ∪ I := by
    simpa [N, O, I] using terminalNamedFive_cap_partition W C
  have hinter : O ∩ I = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzO, hzI⟩
    have hzOpp2 : z ∈ S.oppCap2 := (Finset.mem_inter.mp hzO).2
    have hzStrict :
        z ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
      (Finset.mem_inter.mp hzI).2
    exact (Finset.mem_sdiff.mp hzStrict).2
      (Finset.mem_union.mpr (Or.inr hzOpp2))
  have hsplit := Finset.card_union_add_card_inter O I
  rw [hinter, Finset.card_empty, add_zero] at hsplit
  have hUnion : (O ∪ I).card = 5 := by
    rw [← hpartition]
    exact hN
  have hI : 4 ≤ I.card := by omega
  simpa [N, I] using hI

/-- The named hit lies at the stored radius of the original double-erased
second-apex row. -/
theorem terminalSecondRowHit_eq_terminalSecondApexRow_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    dist S.oppApex2 (W.terminalSecondRowHit C) =
      W.terminalSecondApexRow.radius :=
  W.terminalSecondApexRow.support_eq_radius _
    (W.terminalSecondRowHit_mem_terminalSecondApexRow C)

/-- The residual itself puts the named hit strictly off the exact source
circle. Any theorem proving the opposite equality closes the residual. -/
theorem terminalSecondRowHit_ne_sourceRow_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    dist W.coherent.firstCenter (W.terminalSecondRowHit C) ≠
      W.coherent.sourceRow.radius := by
  intro hdistance
  apply W.terminalSecondRowHit_not_mem_sourceRow C
  exact W.coherent.sourceRow.off_row_named_label_forbidden
    (mem_selectedClass.mp
      (terminalSecondRowHit_mem_ambientFixedClass W C)).1
    hdistance

/-- Regard the original double-erased terminal row as an ambient selected
four-class without changing its support or radius. -/
def terminalSecondApexRowAmbient
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H) :
    SelectedFourClass D.A S.oppApex2 where
  support := W.terminalSecondApexRow.support
  support_subset_A := by
    intro z hz
    have hzSmall := W.terminalSecondApexRow.support_subset_A hz
    exact T.carrier_subset
      (Finset.mem_erase.mp (Finset.mem_erase.mp hzSmall).2).2
  support_card := W.terminalSecondApexRow.support_card
  radius := W.terminalSecondApexRow.radius
  radius_pos := W.terminalSecondApexRow.radius_pos
  support_eq_radius := W.terminalSecondApexRow.support_eq_radius
  center_not_mem := W.terminalSecondApexRow.center_not_mem

/-- The total critical map at the named hit either chooses the second apex,
making the original terminal row its exact critical shell, or chooses a
different center whose exact shell meets that row in at most two points. -/
theorem terminalSecondRowHit_criticalRow_dichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    let z := W.terminalSecondRowHit C
    let hzA : z ∈ D.A :=
      (mem_selectedClass.mp
        (terminalSecondRowHit_mem_ambientFixedClass W C)).1
    (H.centerAt z hzA = S.oppApex2 ∧
        (H.selectedAt z hzA).toCriticalFourShell.support =
          W.terminalSecondApexRow.support) ∨
      (H.centerAt z hzA ≠ S.oppApex2 ∧
        (((H.selectedAt z hzA).toCriticalFourShell.support ∩
          W.terminalSecondApexRow.support).card ≤ 2)) := by
  dsimp only
  let z := W.terminalSecondRowHit C
  let hzA : z ∈ D.A :=
    (mem_selectedClass.mp
      (terminalSecondRowHit_mem_ambientFixedClass W C)).1
  by_cases hcenter : H.centerAt z hzA = S.oppApex2
  · left
    refine ⟨hcenter, ?_⟩
    have hzTerminal :
        z ∈ W.terminalSecondApexRow.support :=
      W.terminalSecondRowHit_mem_terminalSecondApexRow C
    have hzShell :
        z ∈ (H.selectedAt z hzA).toCriticalFourShell.support :=
      (H.selectedAt z hzA).toCriticalFourShell.q_mem_support
    have hradius :
        W.terminalSecondApexRow.radius =
          (H.selectedAt z hzA).toCriticalFourShell.radius := by
      calc
        W.terminalSecondApexRow.radius =
            dist S.oppApex2 z :=
          (W.terminalSecondApexRow.support_eq_radius z hzTerminal).symm
        _ = dist (H.centerAt z hzA) z := by rw [hcenter]
        _ = (H.selectedAt z hzA).toCriticalFourShell.radius :=
          (H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z hzShell
    symm
    apply Finset.eq_of_subset_of_card_le
    · intro u hu
      exact
        (H.selectedAt z hzA).toCriticalFourShell.off_row_named_label_forbidden
          ((terminalSecondApexRowAmbient W).support_subset_A hu)
          (by
            calc
              dist (H.centerAt z hzA) u =
                  dist S.oppApex2 u := by rw [hcenter]
              _ = W.terminalSecondApexRow.radius :=
                W.terminalSecondApexRow.support_eq_radius u hu
              _ = (H.selectedAt z hzA).toCriticalFourShell.radius :=
                hradius)
    · rw [W.terminalSecondApexRow.support_card,
        (H.selectedAt z hzA).toCriticalFourShell.support_card]
  · right
    refine ⟨hcenter, ?_⟩
    have hinter :=
      SelectedFourClass.inter_card_le_two
        (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass
        (terminalSecondApexRowAmbient W) hcenter
    simpa [CriticalFourShell.toSelectedFourClass,
      terminalSecondApexRowAmbient] using hinter

/-- The named terminal-row hit is already a complete global continuation
source.  Its omission preserves the retained first-center row.  At the
physical second apex, global `K4` then gives either a second surviving row,
hence a fresh common deletion, or a prescribed critical row.  In the latter
case source-faithfulness identifies the critical support with the original
double-erased terminal row. -/
theorem terminalSecondRowHit_commonDeletion_or_secondApexCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    Nonempty (CommonDeletionTwoCenterPacket
        D H (W.terminalSecondRowHit C)
          W.coherent.firstCenter S.oppApex2) ∨
      ∃ K : CriticalSelectedFourClass
          D.A (W.terminalSecondRowHit C) S.oppApex2,
        ¬ HasNEquidistantPointsAt 4
            (D.A.erase (W.terminalSecondRowHit C)) S.oppApex2 ∧
          K.toCriticalFourShell.support =
            W.terminalSecondApexRow.support := by
  let z := W.terminalSecondRowHit C
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp
      (terminalSecondRowHit_mem_ambientFixedClass W C)).1
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4
        (D.A.erase z) W.coherent.firstCenter :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      (mem_selectedClass.mp
        W.coherent.sourcePair.x_mem_class).1).mpr
      (W.terminalSecondRowHit_not_mem_sourceRow C)
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := z) D.K4
      W.coherent.toCommonDeletionTwoCenterPacket.center₂_mem_A with
    hsurvivesSecond | ⟨K, hblocked⟩
  · left
    exact nonempty_commonDeletionTwoCenterPacket H
      hzA
      W.coherent.firstCenter_mem_A
      W.coherent.toCommonDeletionTwoCenterPacket.center₂_mem_A
      W.coherent.firstCenter_ne_oppApex2
      hsurvivesFirst
      hsurvivesSecond
  · right
    refine ⟨K, hblocked, ?_⟩
    have hsupport :
        K.toCriticalFourShell.support =
          W.coherent.secondApexRow.support :=
      Problem97.ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual.secondApexRow_eq_criticalSupport_of_blocked
        (R := W.coherent) hblocked K
    exact hsupport.trans W.secondApexRow_support_eq

/-- The critical alternative above is not a new metric producer obligation.
The fixed-surplus non-surplus swap sends it directly to the existing
first-apex unique-four branch. -/
theorem terminalSecondRowHit_commonDeletion_or_swappedFirstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    Nonempty (CommonDeletionTwoCenterPacket
        D H (W.terminalSecondRowHit C)
          W.coherent.firstCenter S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases terminalSecondRowHit_commonDeletion_or_secondApexCritical W C with
    hcommon | ⟨K, hblocked, _hsupport⟩
  · exact Or.inl hcommon
  · exact Or.inr
      (secondApexCritical_reorients_to_firstApexUniqueFour K hblocked)

/-- The complete source-faithful terminal anchored arm has no remaining
terminal-only producer.  A retained row-external point is already a common
deletion on the two coherent centers.  In the exact three-point fallback, the
named terminal-row hit supplies the common-deletion-or-swapped-unique-four
split above. -/
theorem sourceFaithfulTerminalAnchored_commonDeletion_or_swappedFirstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    (A : AnchoredSourceCriticalTransition W.coherent) :
    (∃ z : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H z W.coherent.firstCenter S.oppApex2)) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases exists_terminalCarrier_sharedRowSource_or_threePointCover
      A W.deleted_mem_terminalCarrier with
    ⟨X, _hXCarrier, _hXOff⟩ | C
  · exact Or.inl
      ⟨X.point, ⟨X.toSharedRowCommonDeletionPacket⟩⟩
  · rcases
      terminalSecondRowHit_commonDeletion_or_swappedFirstApexUniqueFour
        W C with
      hcommon | hswapped
    · exact Or.inl ⟨W.terminalSecondRowHit C, hcommon⟩
    · exact Or.inr hswapped

/-- Exact ordered-cap realization carrying the named strict points. -/
structure TerminalNamedFiveOrderedCapLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) : Type where
  m : ℕ
  L : Problem97.CGN.OrderedCap m
  Packet : Problem97.CGN.MecCapPacket D.A L
  Hside : Problem97.CGN.MinorCapSideHypotheses Packet
  Hord : Problem97.CGN.StrictCapOrder D.A L
  cap_image : Finset.univ.image L.points = S.oppCap1
  namedFive_card_eq_five : (terminalNamedFive W C).card = 5
  secondApex_distance_injective :
    Set.InjOn (fun z : ℝ² ↦ dist z S.oppApex2)
      (terminalNamedFive W C : Set ℝ²)
  strict_named_card_ge_four :
    4 ≤ ((terminalNamedFive W C) ∩
      (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card
  strict_named_subset_ordered_cap :
    ((terminalNamedFive W C) ∩
      (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))) ⊆
        Finset.univ.image L.points

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- Build the ordered-cap localization of the named five-point packet. -/
theorem nonempty_terminalNamedFiveOrderedCapLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    Nonempty (TerminalNamedFiveOrderedCapLocalization W C) := by
  have hcapEq := capByIndex_oppIndex1_eq_oppCap1 S
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapImage : Finset.univ.image L.points = S.oppCap1 :=
    hcap.trans hcapEq
  exact ⟨{
    m := m
    L := L
    Packet := Packet
    Hside := Hside
    Hord := Hord
    cap_image := hcapImage
    namedFive_card_eq_five := terminalNamedFive_card_eq_five W C
    secondApex_distance_injective :=
      terminalNamedFive_secondApex_distance_injective W C
    strict_named_card_ge_four :=
      terminalNamedFive_strictOppCap1_card_ge_four W C
    strict_named_subset_ordered_cap := by
      intro z hz
      rw [hcapImage]
      exact
        (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1 }⟩

/-- In the aligned branch, the other named terminal endpoint is one of the
three dangerous labels. -/
theorem aligned_otherTerminal_mem_dangerousTriple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {Wlive : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P Wlive.H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hqSurplus : q ∈ S.surplusCap)
    (hcenter : W.coherent.firstCenter = p) :
    W.otherTerminal ∈ ({t1, t2, t3} : Finset ℝ²) := by
  have hbase : W.otherTerminal ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [← Wlive.coherent_sourceRow_support_eq_base_of_center_eq_p
      W.coherent hcenter]
    exact W.otherTerminal_mem_sourceRow C
  rcases Finset.mem_insert.mp hbase with hq | htriple
  · exact False.elim
      ((Finset.mem_sdiff.mp W.otherTerminal_mem_selectedMarginal).2
        (by simpa [hq] using hqSurplus))
  · exact htriple

/-- In the aligned branch, the named terminal second-row hit lies outside
the dangerous base. -/
theorem aligned_terminalSecondRowHit_not_mem_dangerousBase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {Wlive : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P Wlive.H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hcenter : W.coherent.firstCenter = p) :
    W.terminalSecondRowHit C ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  rw [← Wlive.coherent_sourceRow_support_eq_base_of_center_eq_p
    W.coherent hcenter]
  exact W.terminalSecondRowHit_not_mem_sourceRow C

/-- Consequently the named hit's own selected critical-shell center is not
the live dangerous center. -/
theorem aligned_terminalSecondRowHit_blocker_ne_p
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {Wlive : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P Wlive.H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hcenter : W.coherent.firstCenter = p) :
    let z := W.terminalSecondRowHit C
    let hzA : z ∈ D.A :=
      (mem_selectedClass.mp
        (terminalSecondRowHit_mem_ambientFixedClass W C)).1
    Wlive.H.centerAt z hzA ≠ p := by
  dsimp only
  intro hzCenter
  apply aligned_terminalSecondRowHit_not_mem_dangerousBase W C hcenter
  exact (Wlive.centerAt_eq_p_iff _ _).mp hzCenter

#print axioms terminalNamedFive_card_eq_five
#print axioms terminalNamedFive_secondApex_distance_injective
#print axioms terminalNamedFive_strictOppCap1_card_ge_four
#print axioms terminalSecondRowHit_ne_sourceRow_radius
#print axioms terminalSecondRowHit_criticalRow_dichotomy
#print axioms terminalSecondRowHit_commonDeletion_or_secondApexCritical
#print axioms
  terminalSecondRowHit_commonDeletion_or_swappedFirstApexUniqueFour
#print axioms
  sourceFaithfulTerminalAnchored_commonDeletion_or_swappedFirstApexUniqueFour
#print axioms nonempty_terminalNamedFiveOrderedCapLocalization
#print axioms aligned_otherTerminal_mem_dangerousTriple
#print axioms aligned_terminalSecondRowHit_blocker_ne_p

end SourceFaithfulTerminalCommonDeletionPacket

end

end ATailRTerminalNamedMetricAttackScratch
end Problem97
