/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221Ingress

/-!
# Placement transport for the exact-twelve Rigid221 lane

This module turns the source-side `(deleted,v)` placement split into an exact
finite domain and proves the row-pattern transport needed to compare finite
certificates across admissible carrier relabelings.

The result is an ingress/transport adapter.  It does not prove that one fixed
CEGAR cell covers all 42 placements, that the source-safe candidate predicates
are equivariant, or that either exact-twelve terminal leaf is contradictory.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

attribute [local instance] Classical.propDecidable

/-- Exact finite domain of the two variable source-role labels. -/
def frozenPlacementDomain : Finset (Label × Label) :=
  (variableRoleLabels ×ˢ variableRoleLabels).filter fun placement =>
    placement.1 ≠ placement.2

@[simp] theorem mem_frozenPlacementDomain_iff (d v : Label) :
    (d, v) ∈ frozenPlacementDomain ↔
      d ∈ variableRoleLabels ∧ v ∈ variableRoleLabels ∧ d ≠ v := by
  simp [frozenPlacementDomain, and_assoc]

/-- There are exactly `7 * 6 = 42` ordered source-role placements. -/
theorem frozenPlacementDomain_card : frozenPlacementDomain.card = 42 := by
  decide

/-- Composition of carrier labels is exactly finite row-pattern reindexing. -/
theorem labeledRowPattern_trans
    {A : Finset ℝ²} (carrierPattern : FaithfulCarrierPattern A)
    (labeling : CarrierLabel A ≃ Label) (relabeling : Label ≃ Label) :
    labeledRowPattern carrierPattern (labeling.trans relabeling) =
      GenericRowNogoodCertificate.reindexRowPattern relabeling
        (labeledRowPattern carrierPattern labeling) := by
  funext center
  ext point
  simp [labeledRowPattern,
    GenericRowNogoodCertificate.mem_reindexRowPattern_iff]

/-- Every source-produced frozen labeling lies in the exact placement domain. -/
theorem FrozenRoleLabeling.placement_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern) :
    (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∈
      frozenPlacementDomain := by
  exact mem_frozenPlacementDomain_iff _ _ |>.2
    ⟨labeling.deletedLabel_mem, labeling.vLabel_mem,
      labeling.deletedLabel_ne_vLabel⟩

/-- Relabel a frozen source instance through a permutation which fixes every
named role and preserves the variable-role domain. -/
noncomputable def FrozenRoleLabeling.relabel
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
    (relabeling : Label ≃ Label)
    (hfixed : ∀ i ∈ fixedRoleLabels, relabeling.symm i = i)
    (hvariable : ∀ i, relabeling i ∈ variableRoleLabels ↔
      i ∈ variableRoleLabels) :
    FrozenRoleLabeling Q carrierPattern := by
  refine
    { e := labeling.e.trans relabeling
      surplusApex := ?_
      secondApex := ?_
      firstApex := ?_
      u := ?_
      blockerXv := ?_
      xv := ?_
      xu := ?_
      interiorQ := ?_
      interiorW := ?_
      deletedLabel_mem := ?_
      vLabel_mem := ?_
      deletedLabel_ne_vLabel := ?_
      rowsMatch := rowsMatch_labeledRows carrierPattern _
      realizes := realizes_labeledRowPattern carrierPattern _ }
  · change (labeling.e.symm (relabeling.symm 0)).1 = S.surplusApex
    rw [hfixed 0 (by decide)]
    exact labeling.surplusApex
  · change (labeling.e.symm (relabeling.symm 1)).1 = S.oppApex2
    rw [hfixed 1 (by decide)]
    exact labeling.secondApex
  · change (labeling.e.symm (relabeling.symm 2)).1 = S.oppApex1
    rw [hfixed 2 (by decide)]
    exact labeling.firstApex
  · change (labeling.e.symm (relabeling.symm 6)).1 = P.u.1
    rw [hfixed 6 (by decide)]
    exact labeling.u
  · change (labeling.e.symm (relabeling.symm 7)).1 =
      (lateFirstApexSystem R).centerAt packet.xv Q.hxvA
    rw [hfixed 7 (by decide)]
    exact labeling.blockerXv
  · change (labeling.e.symm (relabeling.symm 8)).1 = packet.xv
    rw [hfixed 8 (by decide)]
    exact labeling.xv
  · change (labeling.e.symm (relabeling.symm 9)).1 = packet.xu
    rw [hfixed 9 (by decide)]
    exact labeling.xu
  · change (labeling.e.symm (relabeling.symm 10)).1 = R.interior_q
    rw [hfixed 10 (by decide)]
    exact labeling.interiorQ
  · change (labeling.e.symm (relabeling.symm 11)).1 = R.interior_w
    rw [hfixed 11 (by decide)]
    exact labeling.interiorW
  · change relabeling (labeling.e P.jointDeletion.deleted) ∈
      variableRoleLabels
    exact (hvariable _).2 labeling.deletedLabel_mem
  · change relabeling (labeling.e P.v) ∈ variableRoleLabels
    exact (hvariable _).2 labeling.vLabel_mem
  · change relabeling (labeling.e P.jointDeletion.deleted) ≠
      relabeling (labeling.e P.v)
    exact relabeling.injective.ne labeling.deletedLabel_ne_vLabel

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
