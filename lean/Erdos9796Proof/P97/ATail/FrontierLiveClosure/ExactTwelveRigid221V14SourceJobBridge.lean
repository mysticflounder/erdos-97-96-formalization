/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobSemantics

/-!
# Source-to-job bridge for exact-twelve normalized-v14 cells

This module identifies the geometric physical class and its `xu`-erasure
with the two frozen label sets used by the normalized-v14 cell compiler.  It
then packages the normalized source ingress as one concrete semantic job.

This is still an ingress theorem.  It does not reflect the emitted DIMACS
clauses, establish terminal coverage, or close the live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- Turn equality of the underlying carrier points into equality of their
frozen labels. -/
theorem frozenRoleLabel_eq_of_symm_val_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    {l : Label} {x : CarrierLabel D.A}
    (hx : (labeling.e.symm l).1 = x.1) :
    l = labeling.e x := by
  apply labeling.e.symm.injective
  simpa using Subtype.ext hx

/-- The source-side exact physical class is the compiler's frozen five-label
physical set. -/
theorem labelsOf_physicalClass_eq_frozenPhysicalLabels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    labelsOf labeling.e (SelectedClass D.A S.oppApex2 P.rho) =
      frozenPhysicalLabels
        (labeling.e P.jointDeletion.deleted) (labeling.e P.v) := by
  have h6 : labeling.e P.u = 6 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.u).symm
  have h9 : labeling.e ⟨packet.xu, Q.hxuA⟩ = 9 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xu).symm
  have h8 : labeling.e ⟨packet.xv, Q.hxvA⟩ = 8 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xv).symm
  ext l
  have hlabel (x : CarrierLabel D.A) :
      (labeling.e.symm l).1 = x.1 ↔ l = labeling.e x := by
    constructor
    · exact frozenRoleLabel_eq_of_symm_val_eq labeling
    · intro h
      simpa [h]
  rw [mem_labelsOf_iff, packet.physical_class]
  simp only [Finset.mem_insert, Finset.mem_union, Finset.mem_singleton]
  rw [hlabel P.jointDeletion.deleted, hlabel P.u,
    hlabel ⟨packet.xu, Q.hxuA⟩, hlabel P.v,
    hlabel ⟨packet.xv, Q.hxvA⟩]
  simp [frozenPhysicalLabels, h6, h9, h8,
    or_assoc, or_left_comm, or_comm]

/-- `labelsOf` commutes with erasing a carrier point. -/
theorem labelsOf_erase_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (T : Finset ℝ²) (x : CarrierLabel D.A) :
    labelsOf labeling.e (T.erase x.1) =
      (labelsOf labeling.e T).erase (labeling.e x) := by
  ext l
  have hiff : (labeling.e.symm l).1 = x.1 ↔ l = labeling.e x := by
    constructor
    · exact frozenRoleLabel_eq_of_symm_val_eq labeling
    · intro h
      simpa [h]
  simp [mem_labelsOf_iff, hiff]

/-- Labeling a two-point carrier set gives the corresponding two-label set. -/
theorem labelsOf_pair_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (x y : CarrierLabel D.A) :
    labelsOf labeling.e ({x.1, y.1} : Finset ℝ²) =
      {labeling.e x, labeling.e y} := by
  ext l
  have hx : (labeling.e.symm l).1 = x.1 ↔ l = labeling.e x := by
    constructor
    · exact frozenRoleLabel_eq_of_symm_val_eq labeling
    · intro h
      simpa [h]
  have hy : (labeling.e.symm l).1 = y.1 ↔ l = labeling.e y := by
    constructor
    · exact frozenRoleLabel_eq_of_symm_val_eq labeling
    · intro h
      simpa [h]
  simp [mem_labelsOf_iff, hx, hy]

/-- The five geometric physical-cycle edges label to the compiler's frozen
edge function, in the same source order. -/
theorem labelsOf_physicalEdges_eq_frozenPhysicalEdges
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    ∀ i : Fin 5,
      labelsOf labeling.e (![
        ({P.u.1, packet.xu} : Finset ℝ²),
        {packet.xu, P.jointDeletion.deleted.1},
        {P.jointDeletion.deleted.1, P.v.1},
        {P.v.1, packet.xv},
        {packet.xv, P.u.1}] i) =
        frozenPhysicalEdges
          (labeling.e P.jointDeletion.deleted) (labeling.e P.v) i := by
  have h6 : labeling.e P.u = 6 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.u).symm
  have h9 : labeling.e ⟨packet.xu, Q.hxuA⟩ = 9 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xu).symm
  have h8 : labeling.e ⟨packet.xv, Q.hxvA⟩ = 8 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xv).symm
  intro i
  fin_cases i
  · simpa [frozenPhysicalEdges, h6, h9] using
      labelsOf_pair_eq labeling P.u ⟨packet.xu, Q.hxuA⟩
  · simpa [frozenPhysicalEdges, h9] using
      labelsOf_pair_eq labeling ⟨packet.xu, Q.hxuA⟩
        P.jointDeletion.deleted
  · simpa [frozenPhysicalEdges] using
      labelsOf_pair_eq labeling P.jointDeletion.deleted P.v
  · simpa [frozenPhysicalEdges, h8] using
      labelsOf_pair_eq labeling P.v ⟨packet.xv, Q.hxvA⟩
  · simpa [frozenPhysicalEdges, h8, h6] using
      labelsOf_pair_eq labeling ⟨packet.xv, Q.hxvA⟩ P.u

/-- The five geometric physical sources label to the compiler's frozen source
function, in the same order. -/
theorem physicalSourceLabels_eq_frozenPhysicalSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    ∀ i : Fin 5,
      labeling.e (![
        P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
        P.v, ⟨packet.xv, Q.hxvA⟩] i) =
        frozenPhysicalSources
          (labeling.e P.jointDeletion.deleted) (labeling.e P.v) i := by
  have h6 : labeling.e P.u = 6 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.u).symm
  have h9 : labeling.e ⟨packet.xu, Q.hxuA⟩ = 9 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xu).symm
  have h8 : labeling.e ⟨packet.xv, Q.hxvA⟩ = 8 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xv).symm
  intro i
  fin_cases i <;> simp [frozenPhysicalSources, h6, h9, h8]

/-- The selected class after deleting `xu` is exactly the compiler's forced
row at the second-apex label `1`. -/
theorem labelsOf_erasedPhysicalClass_eq_frozenRowAtOne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    labelsOf labeling.e
        (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho) =
      frozenRowAtOne
        (labeling.e P.jointDeletion.deleted) (labeling.e P.v) := by
  have h9 : labeling.e ⟨packet.xu, Q.hxuA⟩ = 9 :=
    (frozenRoleLabel_eq_of_symm_val_eq labeling labeling.xu).symm
  rw [selectedClass_erase_eq]
  change labelsOf labeling.e
      ((SelectedClass D.A S.oppApex2 P.rho).erase
        (⟨packet.xu, Q.hxuA⟩ : CarrierLabel D.A).1) = _
  rw [labelsOf_erase_eq labeling]
  rw [labelsOf_physicalClass_eq_frozenPhysicalLabels Q labeling, h9]
  have h9NeDeleted : (9 : Label) ≠ labeling.e P.jointDeletion.deleted := by
    intro h
    have : (9 : Label) ∈ variableRoleLabels := by
      rw [h]
      exact labeling.deletedLabel_mem
    simpa [variableRoleLabels] using this
  have h9NeV : (9 : Label) ≠ labeling.e P.v := by
    intro h
    have : (9 : Label) ∈ variableRoleLabels := by
      rw [h]
      exact labeling.vLabel_mem
    simpa [variableRoleLabels] using this
  ext l
  simp only [frozenPhysicalLabels, frozenRowAtOne, Finset.mem_erase,
    Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hl9, hl6 | hl9' | hld | hlv | hl8⟩
    · exact Or.inl hl6
    · exact (hl9 hl9').elim
    · exact Or.inr (Or.inl hld)
    · exact Or.inr (Or.inr (Or.inl hlv))
    · exact Or.inr (Or.inr (Or.inr hl8))
  · intro h
    constructor
    · intro hl9
      subst l
      rcases h with h6 | hld | hlv | h8
      · exact (by decide : (9 : Label) ≠ 6) h6
      · exact h9NeDeleted hld
      · exact h9NeV hlv
      · exact (by decide : (9 : Label) ≠ 8) h8
    · rcases h with hl6 | hld | hlv | hl8
      · exact Or.inl hl6
      · exact Or.inr (Or.inr (Or.inl hld))
      · exact Or.inr (Or.inr (Or.inr (Or.inl hlv)))
      · exact Or.inr (Or.inr (Or.inr (Or.inr hl8)))

/-- Every normalized geometric v14 source packet selects one of the 648
schedule cells and satisfies that cell's complete semantic added-constraint
predicate.  This is the source-to-semantic-job bridge; it does not yet reflect
the predicate into the emitted DIMACS clauses or prove terminal coverage. -/
theorem exists_source_normalized_v14_semanticJob
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
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2))
    (hmissing :
      ¬ (let Hlate := lateFirstApexSystem R
        let Kxv :=
          (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
        let c := Hlate.centerAt packet.xv Q.hxvA
        let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
        let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
        let d := Hlate.centerAt c hcA
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        d ∈ BO ∧
          S.oppApex2 ∈ Kc.support ∧
          P.u.1 ∈ Kc.support ∧
          S.oppApex2 ∈ Kxv.support ∧
          d ∈ Kxv.support)) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        ∃ blocker : Fin 5 → Label,
          ∃ cell : FrozenV14JobCoordinate,
            cell.1.1 =
                (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∧
              FrozenSafeCubeOK
                (labeledRowPattern carrierPattern labeling.e) ∧
              FrozenV14AddedConstraintsHold
                (labeledRowPattern carrierPattern labeling.e) blocker
                (labeling.e P.jointDeletion.deleted) (labeling.e P.v)
                cell.2.1 cell.2.2.1 := by
  classical
  obtain ⟨carrierPattern, labeling, hplacement, hsafe, hphysicalRow,
      _hdeletedRow, _hvRow, _hnotSurplus, _hnotFirst, blocker,
      hblockerInjective, hblockerU, hblockerXv, _hblockerActual,
      hblockerNeSource, hblockerNeOne, hrowTrace, harm, _hd, hdAway⟩ :=
    exists_source_normalized_v14_physicalCycle_namedArm_distinguishedD
      Q hcard hsurplus hfirst hsecond hsecondInterior source
      hsourceOutside hsourceNamed hsurvives hcommon hmissing
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
  obtain ⟨cell, hcellPlacement, hcellArm, hcellD⟩ :=
    exists_jobCoordinate_of_normalized_semantics hplacement harm hdAway
  refine ⟨carrierPattern, labeling, blocker, cell, hcellPlacement, hsafe, ?_⟩
  exact frozenV14AddedConstraintsHold_of_facts hrowOne hrowSeven
    hblockerInjective hblockerU hblockerXv hblockerNeFrozenSource
    hblockerNeOne hrowTraceFrozen hcellArm hcellD

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
