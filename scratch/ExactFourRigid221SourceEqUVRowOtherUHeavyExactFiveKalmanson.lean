/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherDeletionRadius
import scratch.ExactFourRigid221SourceEqUVRowOtherExactFiveBlockerCycle
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# The exact-five `u`-heavy Kalmanson reduction

The terminal boundary order places the actual source blocker strictly between
the source and its retained row companion.  The physical-apex row equality
therefore gives the same strict metric inequality in either orientation of
that triple.  This file combines that inequality with the already checked
blocker-cycle and deletion-radius consequences.

This is not a contradiction: closing the arm still requires a reverse strict
inequality, equivalently a second selected-row ordinal comparison crossing the
same source--companion interval.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailMinimalUniqueFourCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The source-blocker-source-row triple has one forced Kalmanson direction.
The remaining conjuncts expose the checked blocker cycle and the exact
two-deletion/four-point-restoration packet available at the physical apex. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    dist P.source.1 P.other.1 < dist P.source.1 xu ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.other.1 P.other.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        (lateFirstApexSystem R).centerAt P.other.1 P.other.2 ∧
      P.globalDeletion.deleted.card = 2 ∧
      (SelectedClass
        (D.A \ P.globalDeletion.deleted)
        S.oppApex2 P.rho).card = 3 ∧
      ∀ s ∈ P.globalDeletion.deleted,
        (SelectedClass
          (D.A \ P.globalDeletion.deleted.erase s)
          S.oppApex2 P.rho).card = 4 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hcycle :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_blockerCycle
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three
  have hotherBlocker :
      P.other.1 = Hlate.centerAt P.source.1 P.source.2 :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three
  have hotherEqXv : P.other.1 = xv :=
    hotherBlocker.trans blocker_eq
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hsourceClass : P.source.1 ∈ C := by
    simpa only [C, P.huSource] using P.huClass
  have hxuClass : xu ∈ C := by
    change xu ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [terminal.named_rows.physical_class]
    simp
  have hxvClass : xv ∈ C := by
    change xv ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [terminal.named_rows.physical_class]
    simp
  have hxuRow : xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩ C := by
      simpa only [Ku, C] using
        (show
          xu ∈
            (Hlate.selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [terminal.named_rows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp hmem).1
  have hrowEq :
      dist xv P.source.1 = dist xv xu := by
    simpa only [Ku, Hlate, P.huSource, blocker_eq] using
      (Ku.support_eq_radius P.u.1 Ku.q_mem_support).trans
        (Ku.support_eq_radius xu hxuRow).symm
  have hsourceNeApex : P.source.1 ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hsourceClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith [P.hrho]
  have huNeApex : P.u.1 ≠ S.oppApex2 := by
    simpa only [P.huSource] using hsourceNeApex
  have hxuNeApex : xu ≠ S.oppApex2 := by
    intro h
    have hdist := (mem_selectedClass.mp hxuClass).2
    rw [h] at hdist
    simp only [dist_self] at hdist
    linarith [P.hrho]
  rcases terminal.boundary_order with
    ⟨card_pos, boundary, blocker_index, source_index, companion_index,
      hboundaryInj, hboundaryImage, hboundaryCcw, hboundaryZero,
      hboundaryBlocker, hboundarySource, hboundaryCompanion, hbetween⟩
  let zero_index : Fin D.A.card := ⟨0, card_pos⟩
  have hzero :
      boundary zero_index = S.oppApex2 := by
    simpa only [zero_index] using hboundaryZero
  have hzeroSource : zero_index < source_index := by
    change 0 < source_index.val
    by_contra hnot
    have hval : source_index.val = 0 :=
      Nat.eq_zero_of_not_pos hnot
    have hindex : source_index = zero_index := by
      apply Fin.ext
      simpa only [zero_index] using hval
    apply huNeApex
    rw [← hboundarySource, hindex]
    exact hzero
  have hzeroCompanion : zero_index < companion_index := by
    change 0 < companion_index.val
    by_contra hnot
    have hval : companion_index.val = 0 :=
      Nat.eq_zero_of_not_pos hnot
    have hindex : companion_index = zero_index := by
      apply Fin.ext
      simpa only [zero_index] using hval
    apply hxuNeApex
    rw [← hboundaryCompanion, hindex]
    exact hzero
  have hapexBlockerCompanion :
      dist (boundary zero_index) (boundary blocker_index) =
        dist (boundary zero_index) (boundary companion_index) := by
    rw [hzero, hboundaryBlocker, hboundaryCompanion, hblockerEqU]
    exact
      (mem_selectedClass.mp hxvClass).2.trans
        (mem_selectedClass.mp hxuClass).2.symm
  have hapexBlockerSource :
      dist (boundary zero_index) (boundary blocker_index) =
        dist (boundary zero_index) (boundary source_index) := by
    rw [hzero, hboundaryBlocker, hboundarySource, hblockerEqU]
    exact
      (mem_selectedClass.mp hxvClass).2.trans
        (mem_selectedClass.mp P.huClass).2.symm
  have hkalmanson :
      dist P.source.1 P.other.1 < dist P.source.1 xu := by
    rcases hbetween with hforward | hreverse
    · have hstrict :=
        CapCrossingKalmansonBridge.dist_lt_of_ccw_of_dist_diagonal_eq_side
          D.convex hboundaryInj hboundaryImage hboundaryCcw
            hzeroSource hforward.1 hforward.2 hapexBlockerCompanion
      simpa only [hboundarySource, hboundaryBlocker, hboundaryCompanion,
        hotherEqXv, P.huSource, blocker_eq] using hstrict
    · have hstrict :=
        CapCrossingKalmansonBridge.dist_lt_of_ccw_of_dist_diagonal_eq_side
          D.convex hboundaryInj hboundaryImage hboundaryCcw
            hzeroCompanion hreverse.1 hreverse.2 hapexBlockerSource
      calc
        dist P.source.1 P.other.1 = dist xv P.source.1 := by
          rw [hotherEqXv, dist_comm]
        _ = dist xv xu := hrowEq
        _ = dist xu xv := dist_comm _ _
        _ < dist xu P.source.1 := by
          simpa only [hboundaryCompanion, hboundaryBlocker, hboundarySource,
            P.huSource, blocker_eq] using hstrict
        _ = dist P.source.1 xu := dist_comm _ _
  refine
    ⟨hkalmanson, hcycle.2.2.2.2.2.2.1,
      hcycle.2.2.2.2.2.2.2.1, hcycle.2.2.2.2.2.2.2.2,
      exactFourRigid221_sourceEqU_globalDeletion_card_eq_two P,
      exactFourRigid221_sourceEqU_remaining_rhoClass_card_eq_three P, ?_⟩
  intro s hs
  exact
    exactFourRigid221_sourceEqU_restored_rhoClass_card_eq_four P hs

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson

end ATailFrontierLiveClosure
end Problem97
