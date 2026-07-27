/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherMain

/-!
# Exact-four source-equals-u, additional strict second-cap sources

This file strengthens the source-equals-`u`, cross-row-blocker packet with
source/incidence data supplied by the production robust-cap API.  The new
sources are members of the already named physical five, not sixth points:
one admits a source-valid interior-pair deletion, and a distinct strict
second-cap peer is omitted from its actual late row and has a different
actual blocker.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The live cross-row-blocker packet enriched by two source incidences on
the named physical five.

The `goodSource` fields are strictly stronger than the local five-point
packet: they record a source-valid strict first-cap deletion which preserves
four equidistant points at the source's actual late blocker.  The `peer`
fields then record a distinct strict second-cap source outside that late row,
with a necessarily different actual blocker. -/
inductive ExactFourRigid221SourceEqUVRowOtherAdditionalSourceResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop
  | intro
      (xu xv : ℝ²)
      (terminal :
        ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
      (blocker_mem_v_row :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho)
      (blocker_ne_v :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
      (goodSource : CarrierVertex D.A)
      (goodSource_class :
        goodSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
      (goodSource_interior :
        goodSource.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (goodSource_outside :
        goodSource ∈ outsideFirstApexFiber R)
      (goodSource_deletion_survival :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2))
      (goodSource_mem_named_five :
        goodSource.1 ∈
          insert P.jointDeletion.deleted.1
            (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}))
      (peer : CarrierVertex D.A)
      (peer_ne_goodSource : peer ≠ goodSource)
      (peer_class :
        peer.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
      (peer_interior :
        peer.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (peer_not_mem_goodSource_row :
        peer.1 ∉
          ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support)
      (peer_blocker_ne_goodSource_blocker :
        ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2) ≠
          (lateFirstApexSystem R).centerAt peer.1 peer.2)
      (peer_mem_named_five :
        peer.1 ∈
          insert P.jointDeletion.deleted.1
            (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}))

/-- Source-clean producer for the additional-source residual on the live
`sourceEqU_blockerVRowOther` leaf. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_additionalSourceResidual
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
    ExactFourRigid221SourceEqUVRowOtherAdditionalSourceResidual P := by
  obtain ⟨xu, xv, terminal, hblockerEq⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_packet
      P hblockerVRow hblockerNeV
  obtain ⟨goodSource, hgoodClass, hgoodInterior, hgoodOutside, hgoodSurvival⟩ :=
    exists_interiorPairGoodOutsideSource_mem_secondClassInterior
      R P.surface.secondApex_robust P.hrho P.hfive
  have hgoodRowBound :=
    actualLateRow_secondClassInterior_card_le_two
      R P.surface goodSource hgoodClass hgoodInterior
  obtain ⟨peer, hpeerNe, hpeerClass, hpeerInterior,
      hpeerOmitted, hblockersNe⟩ :=
    exists_omittedSecondClassInteriorPeer
      R goodSource P.hrho P.hfive hgoodRowBound
  have hgoodNamed :
      goodSource.1 ∈
        insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) := by
    rw [← terminal.named_rows.physical_class]
    exact hgoodClass
  have hpeerNamed :
      peer.1 ∈
        insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) := by
    rw [← terminal.named_rows.physical_class]
    exact hpeerClass
  exact .intro xu xv terminal hblockerEq hblockerVRow hblockerNeV
    goodSource hgoodClass hgoodInterior hgoodOutside hgoodSurvival hgoodNamed
    peer hpeerNe hpeerClass hpeerInterior hpeerOmitted hblockersNe hpeerNamed

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_additionalSourceResidual

end ATailFrontierLiveClosure
end Problem97
