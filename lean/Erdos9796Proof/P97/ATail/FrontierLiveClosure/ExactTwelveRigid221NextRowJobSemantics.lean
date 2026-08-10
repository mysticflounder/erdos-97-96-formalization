/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NormalizedNextRowOnlyHitIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge

/-!
# Exact-twelve next-row-only-hit job semantics

This module packages the normalized geometric ingress in the exact finite
vocabulary used by the successor compiler.  In particular, it proves rather
than assumes that the physical selected class and its `xu`-erasure are the
frozen five-label and four-label sets, respectively.

This is a source-to-finite ingress contract.  It is not finite coverage, a
terminal UNSAT certificate, or a proof of the live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- Exact semantic contract for the clauses added by one normalized
next-row-only-hit placement cell. -/
def FrozenNextRowOnlyHitAddedConstraintsHold (row : RowPattern Label)
    (blocker : Fin 5 → Label) (jointDeletion v : Label) : Prop :=
  row 1 = frozenRowAtOne jointDeletion v ∧
    row 7 ∩ frozenPhysicalLabels jointDeletion v = {6, 8} ∧
    Function.Injective blocker ∧
    blocker 0 = 8 ∧ blocker 4 = 7 ∧
    (∀ i, blocker i ≠ frozenPhysicalSources jointDeletion v i) ∧
    (∀ i, blocker i ≠ 1) ∧
    (∀ i, row (blocker i) ∩ frozenPhysicalLabels jointDeletion v =
      frozenPhysicalEdges jointDeletion v i) ∧
    FrozenNextRowOnlyHitDichotomy row blocker

/-- Forget the successor-only dichotomy while retaining the exact common
physical-cycle facts used by the shared CNF prefix. -/
theorem frozenPhysicalCycleCnfAddedConstraintsHold_of_nextRowOnlyHit
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    {jointDeletion v : Label}
    (h : FrozenNextRowOnlyHitAddedConstraintsHold
      row blocker jointDeletion v) :
    FrozenPhysicalCycleCnfAddedConstraintsHold
      row blocker jointDeletion v := by
  rcases h with
    ⟨hrowOne, hrowSeven, hinjective, hblockerU, hblockerXv,
      hneSource, hneOne, hrowTrace, _hnext⟩
  exact ⟨hrowOne, hrowSeven, hinjective, hblockerU, hblockerXv,
    hneSource, hneOne, hrowTrace, trivial, trivial⟩

/-- Either arm of the source-proved next-row dichotomy makes its witness
different from the joint-deletion and `v` blockers.  This is the exact
semantic fact encoded by the two optional negative blocker clauses. -/
theorem nextRowDichotomy_witness_ne_middleBlockers
    {row : RowPattern Label} {blocker : Fin 5 → Label} {d : Label}
    (hInjective : Function.Injective blocker)
    (hbranch :
      ({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).card = 5 ∨
        (d = blocker 1 ∧ 7 ∈ row (blocker 1))) :
    d ≠ blocker 2 ∧ d ≠ blocker 3 := by
  rcases hbranch with hcard | ⟨hd1, _⟩
  · constructor
    · intro hd2
      have hle :
          ({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).card ≤ 4 := by
        simpa [hd2] using
          (Finset.card_le_four (a := blocker 1) (b := 1)
            (c := blocker 3) (d := blocker 2))
      omega
    · intro hd3
      have hle :
          ({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).card ≤ 4 := by
        simpa [hd3] using
          (Finset.card_le_four (a := blocker 1) (b := blocker 2)
            (c := 1) (d := blocker 3))
      omega
  · constructor
    · intro h
      have h' : (1 : Fin 5) = 2 := hInjective (hd1.symm.trans h)
      omega
    · intro h
      have h' : (1 : Fin 5) = 3 := hInjective (hd1.symm.trans h)
      omega

/-- Every source model in the next-row-only-hit branch produces one normalized
placement cell satisfying exactly the successor compiler's finite semantics. -/
theorem exists_source_normalized_nextRowOnlyHitJob
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        ∃ blocker : Fin 5 → Label,
          (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∈
              frozenSeparatedPlacementRepresentatives ∧
            FrozenSafeCubeOK
              (labeledRowPattern carrierPattern labeling.e) ∧
            FrozenNextRowOnlyHitAddedConstraintsHold
              (labeledRowPattern carrierPattern labeling.e) blocker
              (labeling.e P.jointDeletion.deleted) (labeling.e P.v) := by
  classical
  obtain ⟨carrierPattern, labeling, hplacement, hsafe, hphysicalRow,
      _hdeletedRow, _hvRow, _hnotSurplus, _hnotFirst, blocker,
      hblockerInjective, hblockerU, hblockerXv, _hblockerActual,
      hblockerNeSource, hblockerNeOne, hrowTrace, hnext⟩ :=
    exists_source_normalized_physicalCycle_nextRowOnlyHitDichotomy
      Q hcard hsurplus hfirst hsecond hsecondInterior hnextRowOnlyHit
  let row := labeledRowPattern carrierPattern labeling.e
  let jointDeletion := labeling.e P.jointDeletion.deleted
  let v := labeling.e P.v
  have hphysical :
      labelsOf labeling.e (SelectedClass D.A S.oppApex2 P.rho) =
        frozenPhysicalLabels jointDeletion v := by
    simpa [jointDeletion, v] using
      labelsOf_physicalClass_eq_frozenPhysicalLabels Q labeling
  have hrowOne : row 1 = frozenRowAtOne jointDeletion v := by
    calc
      row 1 = labelsOf labeling.e
          (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho) := by
        simpa [row] using hphysicalRow
      _ = frozenRowAtOne jointDeletion v := by
        simpa [jointDeletion, v] using
          labelsOf_erasedPhysicalClass_eq_frozenRowAtOne Q labeling
  have hblockerNeFrozenSource :
      ∀ i, blocker i ≠ frozenPhysicalSources jointDeletion v i := by
    intro i
    rw [← physicalSourceLabels_eq_frozenPhysicalSources Q labeling i]
    exact hblockerNeSource i
  have hrowTraceFrozen : ∀ i,
      row (blocker i) ∩ frozenPhysicalLabels jointDeletion v =
        frozenPhysicalEdges jointDeletion v i := by
    intro i
    calc
      row (blocker i) ∩ frozenPhysicalLabels jointDeletion v =
          row (blocker i) ∩
            labelsOf labeling.e (SelectedClass D.A S.oppApex2 P.rho) := by
        rw [hphysical]
      _ = labelsOf labeling.e (![
          ({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv},
          {packet.xv, P.u.1}] i) := by
        simpa [row] using hrowTrace i
      _ = frozenPhysicalEdges jointDeletion v i := by
        simpa [jointDeletion, v] using
          labelsOf_physicalEdges_eq_frozenPhysicalEdges Q labeling i
  have hrowSeven :
      row 7 ∩ frozenPhysicalLabels jointDeletion v = {6, 8} := by
    have h := hrowTraceFrozen 4
    rw [hblockerXv] at h
    simpa [frozenPhysicalEdges, Finset.ext_iff,
      or_assoc, or_left_comm, or_comm] using h
  refine ⟨carrierPattern, labeling, blocker, hplacement, hsafe, ?_⟩
  exact ⟨hrowOne, hrowSeven, hblockerInjective, hblockerU,
    hblockerXv, hblockerNeFrozenSource, hblockerNeOne,
    hrowTraceFrozen, hnext⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
