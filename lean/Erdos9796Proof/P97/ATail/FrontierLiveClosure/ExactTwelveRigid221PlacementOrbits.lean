/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementTransport

/-!
# Placement orbits for the exact-twelve Rigid221 lane

The nine named role labels are frozen.  The only admissible relabelings used
here permute the three unnamed surplus labels `3`, `4`, and `5`.  This module
constructs a deterministic normalizer, proves that the 42 ordered
`(deleted,v)` placements are covered by exactly 21 representatives, and uses
the source-proved physical-pair separation to reduce the live domain from 24
placements to a stable list of 12 representatives.

This is a checked orbit cover for the placement coordinates only.  Using it to
transport a CEGAR result still requires equivariance of the source-safe
candidate predicate and of certificate replay.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- The exact hypotheses accepted by `FrozenRoleLabeling.relabel`. -/
def AdmissibleFrozenRelabeling (relabeling : Label ≃ Label) : Prop :=
  (∀ i ∈ fixedRoleLabels, relabeling.symm i = i) ∧
    ∀ i, relabeling i ∈ variableRoleLabels ↔ i ∈ variableRoleLabels

instance (relabeling : Label ≃ Label) :
    Decidable (AdmissibleFrozenRelabeling relabeling) := by
  unfold AdmissibleFrozenRelabeling
  infer_instance

/-- Apply a label permutation to an ordered `(deleted,v)` placement. -/
def relabelPlacement (relabeling : Label ≃ Label)
    (placement : Label × Label) : Label × Label :=
  (relabeling placement.1, relabeling placement.2)

/-- Normalize unnamed placement coordinates to `3`, and, when both coordinates
are unnamed, normalize the second coordinate to `4`. -/
def normalizingRelabeling (placement : Label × Label) : Label ≃ Label :=
  if placement.1 ∈ surplusInteriorLabels then
    if placement.2 ∈ surplusInteriorLabels then
      let first := Equiv.swap placement.1 3
      first.trans (Equiv.swap (first placement.2) 4)
    else
      Equiv.swap placement.1 3
  else if placement.2 ∈ surplusInteriorLabels then
    Equiv.swap placement.2 3
  else
    Equiv.refl Label

/-- Canonical representative of an ordered placement. -/
def normalizePlacement (placement : Label × Label) : Label × Label :=
  relabelPlacement (normalizingRelabeling placement) placement

/-- Representatives generated from the complete source placement domain. -/
def frozenPlacementRepresentatives : Finset (Label × Label) :=
  frozenPlacementDomain.image normalizePlacement

/-- The source-faithful placement domain after the checked physical-pair
separation theorem: the two variable roles cannot lie in the same adjacent
closed cap. -/
def frozenSeparatedPlacementDomain : Finset (Label × Label) :=
  frozenPlacementDomain.filter fun placement =>
    ¬ (placement.1 ∈ surplusCapLabels ∧
        placement.2 ∈ surplusCapLabels) ∧
      ¬ (placement.1 ∈ firstOppositeCapLabels ∧
        placement.2 ∈ firstOppositeCapLabels)

@[simp] theorem mem_frozenSeparatedPlacementDomain_iff (d v : Label) :
    (d, v) ∈ frozenSeparatedPlacementDomain ↔
      (d, v) ∈ frozenPlacementDomain ∧
        ¬ (d ∈ surplusCapLabels ∧ v ∈ surplusCapLabels) ∧
        ¬ (d ∈ firstOppositeCapLabels ∧
          v ∈ firstOppositeCapLabels) := by
  simp [frozenSeparatedPlacementDomain, and_assoc]

/-- Representatives of the checked separated source-placement domain. -/
def frozenSeparatedPlacementRepresentatives : Finset (Label × Label) :=
  frozenSeparatedPlacementDomain.image normalizePlacement

/-- Stable proof-facing order for the 12 separated placement representatives.
The computational scheduler may serialize this list, but must still prove its
own schema agrees with these coordinates. -/
def frozenSeparatedPlacementRepresentativeList : List (Label × Label) :=
  [(0, 2), (0, 3), (2, 0), (2, 10), (2, 11), (3, 0),
    (3, 10), (3, 11), (10, 2), (10, 3), (11, 2), (11, 3)]

/-- The stable representative list has no duplicate cells. -/
theorem frozenSeparatedPlacementRepresentativeList_nodup :
    frozenSeparatedPlacementRepresentativeList.Nodup := by
  decide

set_option maxRecDepth 100000 in
/-- The stable representative list enumerates exactly the normalized
separated-placement set. -/
theorem frozenSeparatedPlacementRepresentativeList_toFinset :
    frozenSeparatedPlacementRepresentativeList.toFinset =
      frozenSeparatedPlacementRepresentatives := by
  decide

set_option maxRecDepth 100000 in
/-- Every deterministic normalizer is admissible for frozen source relabeling.
This is an exhaustive kernel reduction over the finite label type. -/
theorem normalizingRelabeling_admissible :
    ∀ placement, AdmissibleFrozenRelabeling
      (normalizingRelabeling placement) := by
  decide

set_option maxRecDepth 100000 in
/-- Normalization preserves the exact ordered placement domain. -/
theorem normalizePlacement_mem_domain :
    ∀ placement ∈ frozenPlacementDomain,
      normalizePlacement placement ∈ frozenPlacementDomain := by
  decide

set_option maxRecDepth 100000 in
/-- The 42 raw ordered placements normalize to exactly 21 representatives. -/
theorem frozenPlacementRepresentatives_card :
    frozenPlacementRepresentatives.card = 21 := by
  decide

set_option maxRecDepth 100000 in
/-- Physical-pair separation leaves exactly 24 ordered placements. -/
theorem frozenSeparatedPlacementDomain_card :
    frozenSeparatedPlacementDomain.card = 24 := by
  decide

set_option maxRecDepth 100000 in
/-- The admissible `S3` action reduces the 24 separated placements to exactly
12 representatives.  No swap of the frozen labels `10` and `11` is used. -/
theorem frozenSeparatedPlacementRepresentatives_card :
    frozenSeparatedPlacementRepresentatives.card = 12 := by
  decide

set_option maxRecDepth 100000 in
/-- Normalization preserves the checked separated placement domain. -/
theorem normalizePlacement_mem_separatedDomain :
    ∀ placement ∈ frozenSeparatedPlacementDomain,
      normalizePlacement placement ∈ frozenSeparatedPlacementDomain := by
  decide

/-- Every source placement is carried to a checked representative by an
admissible relabeling. -/
theorem frozenPlacementRepresentatives_cover
    (placement : Label × Label) (hplacement : placement ∈ frozenPlacementDomain) :
    ∃ representative ∈ frozenPlacementRepresentatives,
      ∃ relabeling : Label ≃ Label,
        AdmissibleFrozenRelabeling relabeling ∧
          relabelPlacement relabeling placement = representative := by
  refine ⟨normalizePlacement placement, ?_, normalizingRelabeling placement,
    normalizingRelabeling_admissible placement, rfl⟩
  exact Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩

/-- Every separated source placement is carried to one of the 12 checked
representatives by its deterministic admissible relabeling. -/
theorem frozenSeparatedPlacementRepresentatives_cover
    (placement : Label × Label)
    (hplacement : placement ∈ frozenSeparatedPlacementDomain) :
    ∃ representative ∈ frozenSeparatedPlacementRepresentatives,
      ∃ relabeling : Label ≃ Label,
        AdmissibleFrozenRelabeling relabeling ∧
          relabelPlacement relabeling placement = representative := by
  refine ⟨normalizePlacement placement, ?_, normalizingRelabeling placement,
    normalizingRelabeling_admissible placement, rfl⟩
  exact Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩

/-- Source-produced physical-pair separation places the two variable labels in
the exact 24-placement separated domain. -/
theorem FrozenRoleLabeling.separatedPlacement_mem
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
    (hnotSurplus :
      ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
        labeling.e P.v ∈ surplusCapLabels))
    (hnotFirst :
      ¬ (labeling.e P.jointDeletion.deleted ∈ firstOppositeCapLabels ∧
        labeling.e P.v ∈ firstOppositeCapLabels)) :
    (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∈
      frozenSeparatedPlacementDomain := by
  exact mem_frozenSeparatedPlacementDomain_iff _ _ |>.2
    ⟨labeling.placement_mem, hnotSurplus, hnotFirst⟩

/-- Convenience adapter from the orbit-level admissibility predicate to a
relabelled frozen source realization. -/
noncomputable def FrozenRoleLabeling.relabel_of_admissible
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
    (hadmissible : AdmissibleFrozenRelabeling relabeling) :
    FrozenRoleLabeling Q carrierPattern :=
  labeling.relabel relabeling hadmissible.1 hadmissible.2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
