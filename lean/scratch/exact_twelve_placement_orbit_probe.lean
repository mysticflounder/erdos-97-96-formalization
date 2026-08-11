import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementTransport

/-! Probe for the exact-twelve frozen-placement orbit cover. -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress

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

/-- Normalize the unnamed surplus labels to `3`, and when both placement
coordinates are unnamed normalize the second one to `4`. -/
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

/-- The representatives generated from the complete source placement domain. -/
def frozenPlacementRepresentatives : Finset (Label × Label) :=
  frozenPlacementDomain.image normalizePlacement

set_option maxRecDepth 100000 in
theorem normalizingRelabeling_admissible :
    ∀ placement, AdmissibleFrozenRelabeling
      (normalizingRelabeling placement) := by
  decide

set_option maxRecDepth 100000 in
theorem normalizePlacement_mem_domain :
    ∀ placement ∈ frozenPlacementDomain,
      normalizePlacement placement ∈ frozenPlacementDomain := by
  decide

set_option maxRecDepth 100000 in
theorem frozenPlacementRepresentatives_card :
    frozenPlacementRepresentatives.card = 21 := by
  decide

theorem frozenPlacementRepresentatives_cover
    (placement : Label × Label) (hplacement : placement ∈ frozenPlacementDomain) :
    ∃ representative ∈ frozenPlacementRepresentatives,
      ∃ relabeling : Label ≃ Label,
        AdmissibleFrozenRelabeling relabeling ∧
          relabelPlacement relabeling placement = representative := by
  refine ⟨normalizePlacement placement, ?_, normalizingRelabeling placement,
    normalizingRelabeling_admissible placement, rfl⟩
  exact Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
