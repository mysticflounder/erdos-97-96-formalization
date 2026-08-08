/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer

/-!
# Source-order coverage for one exact-twelve positive-row cut

This file independently checks the finite order calculation behind the first
proof-carrying positive-row cut.  The conclusion contains exactly the eight
order schemas found by the diagnostic Python search: one common-orientation
five-point core, four Kalmanson chains, and three shared-late-pair chains.

This is only arithmetic coverage of the source-entitled boundary orders.  It
does not prove the metric contradiction attached to any schema, certify a
solver journal, or close the live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress

/-- The strict five-position order consumed by the Kalmanson wrapper. -/
def KalmansonOrderAt (position : Label → Nat)
    (o a y e c : Label) : Prop :=
  position o < position a ∧ position a < position y ∧
    position y < position e ∧ position e < position c

/-- The strict four-position order consumed by the shared-late-pair wrapper. -/
def SharedLatePairOrderAt (position : Label → Nat)
    (a b c d : Label) : Prop :=
  position a < position b ∧ position b < position c ∧ position c < position d

private theorem FrozenBoundaryOrder.position_ne_of_ne_sourceCoverage
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

-- Independent arithmetic replay of the 48 source orders for the frozen-v8
-- positive-row cut.  No selected-row or metric fact is used here.
set_option maxHeartbeats 2000000 in
theorem FrozenBoundaryOrder.sourceOrderCoverage_frozenV8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 3 9 8 4 ∨
      KalmansonOrderAt order.position 2 3 5 11 10 ∨
      KalmansonOrderAt order.position 8 7 2 4 3 ∨
      KalmansonOrderAt order.position 2 5 3 10 11 ∨
      KalmansonOrderAt order.position 0 1 4 3 8 ∨
      SharedLatePairOrderAt order.position 0 9 8 5 ∨
      SharedLatePairOrderAt order.position 10 11 1 5 ∨
      SharedLatePairOrderAt order.position 0 11 10 5 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_sourceCoverage (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_sourceCoverage (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_sourceCoverage (by decide)
  have h10ne11 : order.position 10 ≠ order.position 11 :=
    order.position_ne_of_ne_sourceCoverage (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  change (order.index 10).val ≠ (order.index 11).val at h10ne11
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
