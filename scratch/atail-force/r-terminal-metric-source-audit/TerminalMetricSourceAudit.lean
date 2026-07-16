/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TerminalCapRowMetricBridge

/-!
# Source-faithful audit lemmas for the terminal metric residual

The terminal three-point residual itself locates the retained common deletion
inside the terminal carrier.  This rules out the minimal-cycle provenance arm
of the coherent packet and exposes the least-positive-terminal-hit predecessor
as the only possible source.

This does not yet locate the unique second-apex-row terminal hit on the exact
source circle.  It is a provenance refinement for that remaining producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalMetricSourceAuditScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRActualBlockerTransitionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRFrontierProgressAuditScratch
open ATailRTerminalThreePointResidualScratch
open ATailSubcarrierTerminalInvariantScratch

/-- The point singled out as lying outside both retained rows is still a point
of the terminal carrier. -/
theorem terminalThreePoint_deleted_mem_terminalCarrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    R.deleted ∈ T.carrier := by
  classical
  have hdeletedOutside :
      R.deleted ∈
        ((SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap) \
          (R.sourceRow.support ∪ R.secondApexRow.support)) := by
    rw [C.outside_rows_eq_deleted]
    simp
  have hdeletedMarginal :
      R.deleted ∈
        SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap :=
    (Finset.mem_sdiff.mp hdeletedOutside).1
  exact
    (mem_selectedClass.mp (Finset.mem_sdiff.mp hdeletedMarginal).1).1

/-- A terminal three-point cover forces the coherent common-deletion packet
into its least-positive-terminal-hit provenance arm.

The exact outside-both-rows equation puts `R.deleted` in the terminal
marginal, hence in `T.carrier`.  In the cycle arm the same point is a named
minimal-cycle source in `D.A \ T.carrier`, a contradiction. -/
theorem terminalThreePoint_forces_leastTerminalHitProvenance
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ∃ K : LeastPositiveTerminalHitPredecessor P H,
      R.sourcePair.x = K.predecessorPair.x ∧
        R.deleted ∈ T.carrier := by
  have hdeletedCarrier : R.deleted ∈ T.carrier :=
    terminalThreePoint_deleted_mem_terminalCarrier C
  rcases R.provenance with hterminal | hcycle
  · exact hterminal
  · rcases hcycle with ⟨K, _hsource, hdeleted⟩
    have hdeletedErased : R.deleted ∈ D.A \ T.carrier := by
      rw [hdeleted]
      exact K.source_mem_erased_at ⟨1, K.two_le_period⟩
    exact False.elim
      ((Finset.mem_sdiff.mp hdeletedErased).2 hdeletedCarrier)

/-- The forced predecessor also identifies `R.firstCenter` with the actual
least positive terminal hit.  The point is named source-faithfully, but no
current field identifies it with the unique second-apex-row marginal hit. -/
theorem terminalThreePoint_exposes_leastTerminalHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A) :
    ∃ K : LeastPositiveTerminalHitPredecessor P H,
      R.sourcePair.x = K.predecessorPair.x ∧
        R.deleted ∈ T.carrier ∧
        R.firstCenter =
          ((H.blockerVertex^[K.hitTime])
            (actualBlockerStartVertex P)).1 := by
  rcases terminalThreePoint_forces_leastTerminalHitProvenance C with
    ⟨K, hsource, hdeleted⟩
  refine ⟨K, hsource, hdeleted, ?_⟩
  simpa [CoherentRCommonDeletionPacket.firstCenter, hsource] using
    K.predecessor_blocker_eq_hit

/-- Forget the two prescribed ambient deletions and regard the retained
second-apex row as a q-allowed ambient K4 class. -/
noncomputable def secondApexRowToU5QAllowedK4Class
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    U5QAllowedK4Class D S.oppApex2 R.secondApexRow.support where
  subset := by
    intro z hz
    have hzDouble := R.secondApexRow.support_subset_A hz
    have hzA :
        z ∈ D.A :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hzDouble).2).2
    rw [CounterexampleData.skeleton]
    exact Finset.mem_erase.mpr
      ⟨by
        intro hzcenter
        apply R.secondApexRow.center_not_mem
        simpa [hzcenter] using hz,
        hzA⟩
  card_four := by
    rw [R.secondApexRow.support_card]
  radius := R.secondApexRow.radius
  radius_pos := R.secondApexRow.radius_pos
  same_radius := R.secondApexRow.support_eq_radius

/-- The applicable dangerous-circle theorem gives only an upper bound for
the retained second-apex row.  It cannot produce the required terminal hit. -/
theorem secondApexRow_inter_dangerousBase_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H)
    (htriple :
      U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²))
    (hcenter : S.oppApex2 ≠ p) :
    (R.secondApexRow.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2 := by
  simpa using
    U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two
      htriple (secondApexRowToU5QAllowedK4Class R) hcenter

#print axioms terminalThreePoint_deleted_mem_terminalCarrier
#print axioms terminalThreePoint_forces_leastTerminalHitProvenance
#print axioms terminalThreePoint_exposes_leastTerminalHit
#print axioms secondApexRow_inter_dangerousBase_card_le_two

end ATailRTerminalMetricSourceAuditScratch
end Problem97
