/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221Ingress

/-!
# Concrete-row bridge for the exact-twelve Rigid221 lane

This module isolates the dependency on the source-selected concrete-row
producer.  The generic exact-twelve role, cap-profile, and `C1/C2/C4` ingress
remain independently checkable while that upstream producer is refactored.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

/-- Source-to-finite ingress for the concrete three-row exact-twelve lane.

The existing geometric producer chooses one faithful carrier pattern whose
physical-apex, first blocker, and next-blocker rows are the rows used by the
finite classifier.  The exact-twelve relabeling then pins the nine fixed roles
and places the joint-deletion point and `P.v` in two distinct members of
`variableRoleLabels`.

This theorem reduces every source model to one of the 42 ordered `(d,v)`
placements.  It does not assert that every placement is source-realizable,
that the finite clauses encode these equalities, or that the 42 placements
have been exhausted by checked certificates. -/
theorem exists_frozen_role_labeling_for_xuConcreteRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
    let hOA : S.oppApex2 ∈ D.A := by
      simpa [ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex2] using
        S.oppositeVertexByIndex_mem S.oppIndex2
    let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      Nonempty (FrozenRoleLabeling Q carrierPattern) ∧
        (carrierPattern.classAt S.oppApex2 hOA).support = BO ∧
        (carrierPattern.classAt c hcA).support = Kxv.support ∧
        (carrierPattern.classAt d hdA).support = Kc.support := by
  classical
  dsimp only
  obtain ⟨carrierPattern, hphysical, hxv, hnext⟩ :=
    pentagonOffClassBlocker_exists_faithfulCarrierPattern_for_xuConcreteRows Q
  exact ⟨carrierPattern,
    exists_frozen_role_labeling Q hcard carrierPattern,
    hphysical, hxv, hnext⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
