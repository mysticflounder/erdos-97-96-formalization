/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherExactFive

/-!
# The exact-five `u`-heavy blocker cycle

The strict-cap saturation theorem identifies the retained peer with the
actual source blocker.  Consequently that peer is itself the canonical
unique-four center of the source row.  This file records the strongest
unconditional row-cycle packet obtained directly from that identity.
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

/-- In the exact-five `u`-heavy arm, the retained peer is the unique-four
center whose canonical class is the source row.  Its physical-class
intersection is exactly the source pair, while the peer itself is a common
point of the distinct `v`-row and its own selected row. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_blockerCycle
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
    IsUniqueFourCenter D.A P.other.1 ∧
      uniqueFourClass D.A P.other.1 =
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      uniqueFourClass D.A P.other.1 ∩
          SelectedClass D.A S.oppApex2 P.rho =
        {P.u.1, xu} ∧
      P.other.1 ∉ uniqueFourClass D.A P.other.1 ∧
      P.source.1 ∈ uniqueFourClass D.A P.other.1 ∧
      P.other ≠ P.v ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.other.1 P.other.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        (lateFirstApexSystem R).centerAt P.other.1 P.other.2 := by
  classical
  let Hlate := lateFirstApexSystem R
  have hotherBlocker :
      P.other.1 = Hlate.centerAt P.source.1 P.source.2 := by
    exact
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker
        P xu xv terminal blocker_eq pair_interior blocker_interior
          interior_card_eq_three
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hotherEqXv : P.other.1 = xv :=
    hotherBlocker.trans blocker_eq
  have hotherBlockerU :
      P.other.1 = Hlate.centerAt P.u.1 P.u.2 :=
    hotherEqXv.trans hblockerEqU.symm
  have huniqueSource :
      IsUniqueFourCenter D.A
        (Hlate.centerAt P.u.1 P.u.2) :=
    isUniqueFourCenter_centerAt Hlate P.u.1 P.u.2
  have huniqueOther : IsUniqueFourCenter D.A P.other.1 := by
    simpa only [hotherBlockerU] using huniqueSource
  have hclassSource :
      uniqueFourClass D.A
          (Hlate.centerAt P.u.1 P.u.2) =
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    uniqueFourClass_centerAt_eq_selectedAt_support
      Hlate P.u.1 P.u.2
  have hclassOther :
      uniqueFourClass D.A P.other.1 =
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    simpa only [hotherBlockerU] using hclassSource
  have hclassInter :
      uniqueFourClass D.A P.other.1 ∩
          SelectedClass D.A S.oppApex2 P.rho =
        {P.u.1, xu} := by
    rw [hclassOther]
    exact terminal.named_rows.u_row_trace
  have hotherNotClass :
      P.other.1 ∉ uniqueFourClass D.A P.other.1 := by
    rw [hclassOther]
    rw [hotherBlockerU]
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
  have hsourceClass :
      P.source.1 ∈ uniqueFourClass D.A P.other.1 := by
    rw [hclassOther]
    simpa only [Hlate] using P.context.source_mem_u_row
  have hotherNeV : P.other ≠ P.v := by
    intro hEq
    apply terminal.named_rows.xv_ne_v
    exact hotherEqXv.symm.trans (congrArg (fun z => z.1) hEq)
  have hotherVRow :
      P.other.1 ∈
        (Hlate.selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support := by
    have hxv :
        xv ∈
          (Hlate.selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [terminal.named_rows.v_row_trace]
      simp
    simpa [hotherEqXv] using (Finset.mem_inter.mp hxv).1
  have hotherOwnRow :
      P.other.1 ∈
        (Hlate.selectedAt
          P.other.1 P.other.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      P.other.1 P.other.2).toCriticalFourShell.q_mem_support
  exact
    ⟨huniqueOther, hclassOther, hclassInter, hotherNotClass,
      hsourceClass, hotherNeV, hotherVRow, hotherOwnRow,
      P.context.source_other_blockers_ne⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_blockerCycle

end ATailFrontierLiveClosure
end Problem97
