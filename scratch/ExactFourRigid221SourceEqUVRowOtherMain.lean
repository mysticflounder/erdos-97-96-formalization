/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four source-equals-u, cross-row blocker branch

This scratch file works directly on the production
`sourceEqU_blockerVRowOther` leaf.  Its first checked reduction names both
rigid row companions and identifies the actual source blocker with the
non-`v` companion of the `v` row.
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

/-- Checked specialization of the source-equals-`u` terminal to the
cross-row blocker leaf. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_packet
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
    ∃ xu xv : ℝ²,
      ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv ∧
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv := by
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

/-- The exact cap-shape frontier of the cross-row blocker branch.  Every
constructor retains the full parent context, both rigid row companions, the
source-clean terminal packet, and the identification of the actual source
blocker with the non-`v` member of the `v` row. -/
inductive ExactFourRigid221SourceEqUVRowOtherCapShapeResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop
  | uHeavy
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
      (row_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 = {P.u.1, xu})
  | vHeavy
      (xu xv : ℝ²)
      (terminal :
        ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
      (pair_interior :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1, xv})
      (blocker_interior :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
          S.capInteriorByIndex S.oppIndex2)
      (row_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 = {P.v.1, xv})
  | exceptional
      (xu xv : ℝ²)
      (terminal :
        ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
      (packet :
        ExactFourRigid221PhysicalFiveExceptionalArm
          R P.rho P.u P.other P.u P.v P.jointDeletion
            P.globalDeletion xu xv)

/-- Source-clean exhaustive cap-shape decomposition of the current production
leaf.  This is a strict narrowing: each constructor fixes one constructor of
the terminal's exact three-way cap split without discarding any context. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_capShapeResidual
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
    ExactFourRigid221SourceEqUVRowOtherCapShapeResidual P := by
  obtain ⟨xu, xv, terminal, hblockerEq⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_packet
      P hblockerVRow hblockerNeV
  rcases terminal.cap_shape with
      ⟨hpairInterior, hblockerInterior, hrowCapTrace⟩ |
      ⟨hpairInterior, hblockerInterior, hrowCapTrace⟩ |
      ⟨hexceptional⟩
  · exact .uHeavy xu xv terminal hblockerEq
      hpairInterior hblockerInterior hrowCapTrace
  · exact .vHeavy xu xv terminal hblockerEq
      hpairInterior hblockerInterior hrowCapTrace
  · exact .exceptional xu xv terminal hblockerEq hexceptional

#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_packet

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_capShapeResidual

end ATailFrontierLiveClosure
end Problem97
