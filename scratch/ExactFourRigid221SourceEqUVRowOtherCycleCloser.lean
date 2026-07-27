/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221GlobalDeletionSplit
import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four source-equals-u cross-row cycle residual

This file reduces the production `sourceEqU_blockerVRowOther` leaf directly
to the physical five-point cycle decomposition.  The retained residual keeps
the global deletion packet, the deleted-row trace, the source/other placement,
and the exhaustive strict-cap split, while identifying the source blocker with
the non-`v` companion of the `v` row.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The strongest axiom-clean residual currently forced by the full
source-equals-`u`, cross-row blocker context. -/
def ExactFourRigid221SourceEqUVRowOtherTerminalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop :=
  ∃ xu xv : ℝ²,
    ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv

/-- Axiom-clean reduction of the production branch to the exact source-`u`
terminal, with the source blocker forced to the non-`v` row companion. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_terminalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ExactFourRigid221SourceEqUVRowOtherTerminalResidual P := by
  classical
  have contextU :
      ExactFourMutualOmissionSourceContext
        R P.rho P.u P.other P.u P.v := by
    simpa [P.huSource] using P.context
  have hsourceBlockerClassU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using P.hsourceBlockerClass
  have hblockerVRowU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using hblockerVRow
  have hblockerNeVU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ≠ P.v.1 := by
    simpa [P.huSource] using hblockerNeV
  obtain ⟨xu, xv, terminal⟩ :=
    exactFourRigid221_physicalApex_sourceEqUTerminal
      R P.hcard P.surface P.rho P.u P.other P.hrho P.hfive
        P.v P.huNeV P.huClass P.hvClass P.hvOmitted P.huOmitted
        contextU P.jointDeletion P.hclassFive P.globalDeletion
        P.hcenter hsourceBlockerClassU
  refine ⟨xu, xv, terminal, ?_⟩
  rcases terminal.source_blocker_placement with hdeleted | hv | hxv
  · have hmem :
        P.jointDeletion.deleted.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support :=
      hdeleted ▸ (Finset.mem_inter.mp hblockerVRowU).1
    exact (P.jointDeletion.deleted_not_mem_vRow hmem).elim
  · exact (hblockerNeVU hv).elim
  · simpa [P.huSource] using hxv

/-- The exact context-complete residual left by the source-equals-`u`,
cross-row blocker branch after the physical five-point cycle is named. -/
def ExactFourRigid221SourceEqUVRowOtherCycleResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop :=
  ∃ xu xv : ℝ²,
    ExactFourRigid221PhysicalFiveCycleDecomposition
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv ∧
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv

/-- Direct checked reduction of the production branch to the fully retained
physical five-point cycle residual. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_cycleResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ExactFourRigid221SourceEqUVRowOtherCycleResidual P := by
  classical
  have contextU :
      ExactFourMutualOmissionSourceContext
        R P.rho P.u P.other P.u P.v := by
    simpa [P.huSource] using P.context
  obtain ⟨xu, xv, cycle⟩ :=
    exactFourRigid221_physicalApex_fiveCycleDecomposition
      R P.hcard P.surface P.rho P.u P.other P.hrho P.hfive
        P.u P.v P.huNeV P.huClass P.hvClass P.hvOmitted P.huOmitted
        contextU P.jointDeletion P.hclassFive P.globalDeletion P.hcenter
  have hsourceBlockerClassU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using P.hsourceBlockerClass
  obtain ⟨txu, txv, terminal⟩ :=
    exactFourRigid221_physicalApex_sourceEqUTerminal
      R P.hcard P.surface P.rho P.u P.other P.hrho P.hfive
        P.v P.huNeV P.huClass P.hvClass P.hvOmitted P.huOmitted
        contextU P.jointDeletion P.hclassFive P.globalDeletion
        P.hcenter hsourceBlockerClassU
  have hxuMem :
      xu ∈ ({P.u.1, txu} : Finset ℝ²) := by
    rw [← terminal.named_rows.u_row_trace, cycle.u_row_trace]
    simp
  have hxuEq : xu = txu := by
    rcases Finset.mem_insert.mp hxuMem with hu | htxu
    · exact (cycle.xu_ne_u hu).elim
    · exact Finset.mem_singleton.mp htxu
  have hxvMem :
      xv ∈ ({P.v.1, txv} : Finset ℝ²) := by
    rw [← terminal.named_rows.v_row_trace, cycle.v_row_trace]
    simp
  have hxvEq : xv = txv := by
    rcases Finset.mem_insert.mp hxvMem with hv | htxv
    · exact (cycle.xv_ne_v hv).elim
    · exact Finset.mem_singleton.mp htxv
  subst txu
  subst txv
  refine ⟨xu, xv, cycle, terminal, ?_⟩
  have hblockerVRowU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using hblockerVRow
  have hblockerNeVU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ≠ P.v.1 := by
    simpa [P.huSource] using hblockerNeV
  have hpair :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        ({P.v.1, xv} : Finset ℝ²) := by
    rw [← cycle.v_row_trace]
    exact hblockerVRowU
  rcases Finset.mem_insert.mp hpair with hv | hxv
  · exact (hblockerNeVU hv).elim
  · simpa [P.huSource] using (Finset.mem_singleton.mp hxv)

/-- The single missing proposition for closing this branch is exclusion of
the axiom-clean terminal residual produced above. -/
def ExactFourRigid221SourceEqUVRowOtherTerminalExclusion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop :=
  ¬ ExactFourRigid221SourceEqUVRowOtherTerminalResidual P

/-- Conditional adapter showing that the terminal exclusion is exactly sufficient
for the production contradiction.  This is bookkeeping, not an unconditional
closure theorem. -/
theorem false_of_exactFourRigid221_sourceEqU_blockerVRowOther_of_terminalExclusion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (hexclusion :
      ExactFourRigid221SourceEqUVRowOtherTerminalExclusion P) : False :=
  hexclusion
    (exactFourRigid221_sourceEqU_blockerVRowOther_terminalResidual
      P hblockerVRow hblockerNeV)

#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_terminalResidual
#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_cycleResidual
#print axioms
  false_of_exactFourRigid221_sourceEqU_blockerVRowOther_of_terminalExclusion

end ATailFrontierLiveClosure
end Problem97
