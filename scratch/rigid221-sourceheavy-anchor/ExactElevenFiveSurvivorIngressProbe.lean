import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceSafeIngress
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

/-- Probe for the exact-twelve `nextRowOnlyHit` ingress: deleting `u` leaves an
exact eleven-point carrier with five exact surviving rows and the distinct
actual blocker row.  This is normalization for a finite consumer, not a
contradiction. -/
theorem pentagonOffClassBlocker_uDeletion_exactEleven_fiveSurvivorRows_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (huNotKc :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      P.u.1 ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let d := Hlate.centerAt c hcA
    (D.A.erase P.u.1).card = 11 ∧
      Nonempty
        (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
          D H P.u.1 P.u.2
          (Hlate.centerAt packet.xu Q.hxuA)
          (Hlate.centerAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2)
          S.oppApex2
          (Hlate.centerAt P.v.1 P.v.2)
          d) := by
  classical
  have hcardErase : (D.A.erase P.u.1).card = 11 := by
    rw [Finset.card_erase_of_mem P.u.2, hcard]
  refine ⟨hcardErase, ?_⟩
  exact
    ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary H P.u.2
      (pentagonOffClassBlocker_uDeletion_fiveCenterSurvival_of_u_not_mem_nextRow
        Q huNotKc)

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow
#print axioms Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.nextRowOnlyHit_fiveDistinct_or_positiveRowCollision
