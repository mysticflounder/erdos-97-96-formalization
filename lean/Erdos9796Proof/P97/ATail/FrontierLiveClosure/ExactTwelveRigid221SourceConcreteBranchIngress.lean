/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceSafeIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ConcreteBranchSurface

/-!
# Source ingress for the exact-twelve concrete branch cuts

This module combines the concrete physical-apex row producer with the frozen
source-safe candidate contract.  It proves that the joint-deletion and `v`
labels occur in that row and therefore cannot occupy the same adjacent closed
cap.  The conclusion is a source theorem for a new branch encoding; it does
not modify the frozen source-safe v1 schema.
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

/-- Every live exact-twelve pentagon-off-class residual induces a source-safe
finite row family in which the joint-deletion label and the `v` label lie in
the physical second-apex row and are separated across its two adjacent closed
caps.  Consequently only the 24 cross-cap ordered placements can remain from
the original 42-placement relabeling split. -/
theorem exists_source_safeCubeOK_with_physicalPair_separated
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        let row := labeledRowPattern carrierPattern labeling.e
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        FrozenSafeCubeOK row ∧
          row 1 = labelsOf labeling.e BO ∧
          labeling.e P.jointDeletion.deleted ∈ row 1 ∧
          labeling.e P.v ∈ row 1 ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
            labeling.e P.v ∈ surplusCapLabels) ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈
                firstOppositeCapLabels ∧
            labeling.e P.v ∈ firstOppositeCapLabels) := by
  classical
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
  obtain ⟨carrierPattern, ⟨labeling⟩, hphysical, _hxv, _hnext⟩ :=
    exists_frozen_role_labeling_for_xuConcreteRows Q hcard
  rcases pentagonOffClassBlocker_card_twelve_exact_cap_profile
      P packet Q hcard with
    ⟨hsurplus, hfirst, hsecond, hsecondInterior, _growth⟩
  let interiors := labeling.interiorProfile
    hsurplus hfirst hsecond hsecondInterior
  let caps := interiors.closedCapProfile hsurplus hfirst hsecond
  have hsafe : FrozenSafeCubeOK
      (labeledRowPattern carrierPattern labeling.e) :=
    labeling.safeCubeOK interiors caps
  have hphysicalRow :
      labeledRowPattern carrierPattern labeling.e 1 =
        labelsOf labeling.e BO := by
    ext label
    simp only [mem_labeledRowPattern_iff, mem_labelsOf_iff]
    have hcenter : labeling.e.symm 1 = ⟨S.oppApex2, hOA⟩ :=
      Subtype.ext labeling.secondApex
    rw [hcenter, hphysical]

  have hxuNeDeleted : packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Q.hxuNotDeletedRow
    rw [h]
    exact (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [h] using Q.hvDeletedRow
  have hdeletedBO : P.jointDeletion.deleted.1 ∈ BO := by
    dsimp only [BO]
    rw [mem_selectedClass]
    exact ⟨
      Finset.mem_erase.mpr ⟨hxuNeDeleted.symm,
        (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).1⟩,
      (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2⟩
  have hvBO : P.v.1 ∈ BO := by
    dsimp only [BO]
    rw [mem_selectedClass]
    exact ⟨
      Finset.mem_erase.mpr ⟨hxuNeV.symm,
        (mem_selectedClass.mp P.hvClass).1⟩,
      (mem_selectedClass.mp P.hvClass).2⟩
  have hdeletedRow : labeling.e P.jointDeletion.deleted ∈
      labeledRowPattern carrierPattern labeling.e 1 := by
    rw [mem_labeledRowPattern_iff]
    simp only [Equiv.symm_apply_apply]
    have hcenter : labeling.e.symm 1 = ⟨S.oppApex2, hOA⟩ :=
      Subtype.ext labeling.secondApex
    rw [hcenter, hphysical]
    exact hdeletedBO
  have hvRow : labeling.e P.v ∈
      labeledRowPattern carrierPattern labeling.e 1 := by
    rw [mem_labeledRowPattern_iff]
    simp only [Equiv.symm_apply_apply]
    have hcenter : labeling.e.symm 1 = ⟨S.oppApex2, hOA⟩ :=
      Subtype.ext labeling.secondApex
    rw [hcenter, hphysical]
    exact hvBO
  have hseparated :=
    hsafe.secondApex_row_pair_adjacentCaps_separate
      hdeletedRow hvRow labeling.deletedLabel_ne_vLabel
  exact ⟨carrierPattern, labeling, hsafe, hphysicalRow, hdeletedRow, hvRow,
    hseparated.1, hseparated.2⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
