/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementOrbits
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-!
# Normalized source-safe ingress for the exact-twelve Rigid221 lane

This module composes source relabeling with the checked 21-representative
placement cover.  Crucially, the safe candidate contract is rederived from the
geometric source after relabeling; no unproved equivariance assumption about
the finite candidate table is used.

The result is still an ingress theorem.  Closing a live branch requires a
checked finite coverage theorem for every representative cell.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

/-- Every fully frozen source instance can be normalized to one of the 21
placement representatives while retaining a freshly source-derived safe cube. -/
theorem FrozenRoleLabeling.exists_normalized_safeCubeOK
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
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu}) :
    ∃ normalized : FrozenRoleLabeling Q carrierPattern,
      (normalized.e P.jointDeletion.deleted, normalized.e P.v) ∈
          frozenPlacementRepresentatives ∧
        FrozenSafeCubeOK
          (labeledRowPattern carrierPattern normalized.e) := by
  let placement : Label × Label :=
    (labeling.e P.jointDeletion.deleted, labeling.e P.v)
  have hplacement : placement ∈ frozenPlacementDomain := by
    exact labeling.placement_mem
  let relabeling := normalizingRelabeling placement
  let normalized : FrozenRoleLabeling Q carrierPattern :=
    labeling.relabel_of_admissible relabeling
      (normalizingRelabeling_admissible placement)
  have hrepresentative : normalizePlacement placement ∈
      frozenPlacementRepresentatives :=
    Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩
  have hinteriors : FrozenInteriorProfile normalized :=
    normalized.interiorProfile hsurplus hfirst hsecond hsecondInterior
  have hcaps : FrozenClosedCapProfile normalized :=
    hinteriors.closedCapProfile hsurplus hfirst hsecond
  refine ⟨normalized, ?_, normalized.safeCubeOK hinteriors hcaps⟩
  change normalizePlacement placement ∈ frozenPlacementRepresentatives
  exact hrepresentative

/-- With the checked physical-pair separation facts, the same construction
lands in the sharper 12-representative domain. -/
theorem FrozenRoleLabeling.exists_normalized_separated_safeCubeOK
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
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (hnotSurplus :
      ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
        labeling.e P.v ∈ surplusCapLabels))
    (hnotFirst :
      ¬ (labeling.e P.jointDeletion.deleted ∈ firstOppositeCapLabels ∧
        labeling.e P.v ∈ firstOppositeCapLabels)) :
    ∃ normalized : FrozenRoleLabeling Q carrierPattern,
      (normalized.e P.jointDeletion.deleted, normalized.e P.v) ∈
          frozenSeparatedPlacementRepresentatives ∧
        FrozenSafeCubeOK
          (labeledRowPattern carrierPattern normalized.e) := by
  let placement : Label × Label :=
    (labeling.e P.jointDeletion.deleted, labeling.e P.v)
  have hplacement : placement ∈ frozenSeparatedPlacementDomain := by
    exact labeling.separatedPlacement_mem hnotSurplus hnotFirst
  let relabeling := normalizingRelabeling placement
  let normalized : FrozenRoleLabeling Q carrierPattern :=
    labeling.relabel_of_admissible relabeling
      (normalizingRelabeling_admissible placement)
  have hrepresentative : normalizePlacement placement ∈
      frozenSeparatedPlacementRepresentatives :=
    Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩
  have hinteriors : FrozenInteriorProfile normalized :=
    normalized.interiorProfile hsurplus hfirst hsecond hsecondInterior
  have hcaps : FrozenClosedCapProfile normalized :=
    hinteriors.closedCapProfile hsurplus hfirst hsecond
  refine ⟨normalized, ?_, normalized.safeCubeOK hinteriors hcaps⟩
  change normalizePlacement placement ∈
    frozenSeparatedPlacementRepresentatives
  exact hrepresentative

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
