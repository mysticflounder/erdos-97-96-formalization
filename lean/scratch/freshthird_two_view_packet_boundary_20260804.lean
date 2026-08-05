import Erdos9796Proof.P97.ATail.FrontierLiveClosure

set_option maxHeartbeats 1000000

/-!
PARKED-SPEC: generic source-clean boundary probe for two cap-source deletion
views.  It records the finite alternative already used by
`commonCollisionEndpointOmission_or_complementaryMembership`; it does not
claim a double-deletion consumer for the FreshThird residual.
-/

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

structure TwoSourceDeletionViewBoundary (α : Type*) where
  support_left : Finset α
  support_right : Finset α
  endpoint_a : α
  endpoint_b : α
  endpoint_c : α
  endpoint_d : α
  first : endpoint_a ∉ support_left ∨ endpoint_b ∉ support_left
  first2 : endpoint_a ∉ support_right ∨ endpoint_b ∉ support_right
  second : endpoint_c ∉ support_left ∨ endpoint_d ∉ support_left
  second2 : endpoint_c ∉ support_right ∨ endpoint_d ∉ support_right

theorem TwoSourceDeletionViewBoundary.finite_split
    {α : Type*} (V : TwoSourceDeletionViewBoundary α) :
    ((V.endpoint_a ∉ V.support_left ∧ V.endpoint_a ∉ V.support_right) ∨
        (V.endpoint_b ∉ V.support_left ∧ V.endpoint_b ∉ V.support_right) ∨
        (V.endpoint_c ∉ V.support_left ∧ V.endpoint_c ∉ V.support_right) ∨
        (V.endpoint_d ∉ V.support_left ∧ V.endpoint_d ∉ V.support_right)) ∨
      (((V.endpoint_a ∈ V.support_left ∧ V.endpoint_b ∈ V.support_right) ∨
          (V.endpoint_b ∈ V.support_left ∧ V.endpoint_a ∈ V.support_right)) ∧
        ((V.endpoint_c ∈ V.support_left ∧ V.endpoint_d ∈ V.support_right) ∨
          (V.endpoint_d ∈ V.support_left ∧ V.endpoint_c ∈ V.support_right))) := by
  have h1 := V.first
  have h2 := V.first2
  have h3 := V.second
  have h4 := V.second2
  tauto

end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
