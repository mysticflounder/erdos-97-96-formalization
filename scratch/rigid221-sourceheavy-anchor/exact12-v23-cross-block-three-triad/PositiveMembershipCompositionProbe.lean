import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge

/-! Probe for membership-assignment composition. -/

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress

open Census554.CoverCnf
open Census554.EqualityCore
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge

theorem positiveMembershipAssign_over_global_agrees_up_to
    (base : Nat → Bool) (globalCutoff localCutoff layerEnd : Nat)
    (row : RowPattern (Fin 12))
    (globalRequirementAt localRequirementAt : Nat → RowChoice (Fin 12))
    (hcutoff : globalCutoff ≤ localCutoff)
    (hrequirements : ∀ v, localCutoff < v → v ≤ layerEnd →
      localRequirementAt v = globalRequirementAt v)
    {v : Nat} (hv : v ≤ layerEnd) :
    positiveMembershipAssign
        (positiveMembershipAssign base globalCutoff row globalRequirementAt)
        localCutoff row localRequirementAt v =
      positiveMembershipAssign base globalCutoff row globalRequirementAt v := by
  by_cases hlocal : v ≤ localCutoff
  · exact positiveMembershipAssign_of_le _ _ _ _ hlocal
  · have hlocal_lt : localCutoff < v := Nat.lt_of_not_ge hlocal
    have hglobal_lt : globalCutoff < v := lt_of_le_of_lt hcutoff hlocal_lt
    rw [positiveMembershipAssign_of_lt _ _ _ _ hlocal_lt,
      positiveMembershipAssign_of_lt _ _ _ _ hglobal_lt,
      hrequirements v hlocal_lt hv]

end Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
