/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Reciprocal first-opposite/surplus/second-opposite common-five certificates

The v20 arm-static cell-6 survivor has reciprocal selected rows centered at a
first-opposite point `a` and apex `2`.  Together they identify the two distances
from a surplus point `x` to `a` and `2`.  The row centered at apex `0` contains
`a` and `2`, while a second-opposite row contains `2`, `x`, and `0`.  These four
rows therefore produce the convex common-five core `(a,x,2,c,0)`.

The checked role domain has 24 assignments: `a` is first-opposite, `x` is
surplus, and `c` is second-opposite.  This is a finite proof-carrying learned-cut
family.  It is not terminal UNSAT, all-arm coverage, an arbitrary-cardinality
lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the reciprocal four-row family. -/
structure ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData where
  a : Label
  x : Label
  c : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the 24-member family. -/
def ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData.rolesValid
    (data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData) : Prop :=
  data.a ∈ firstOppositeInteriorLabels ∧
    data.x ∈ surplusInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels

instance instDecidableReciprocalFirstOppositeSurplusSecondOppositeCommonFiveRolesValid
    (data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData) :
    Decidable data.rolesValid := by
  unfold ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the five primitive row equalities used by
the common-five core. -/
def ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.a data.x 2) &&
    checkPrimitiveStep choices (.row 2 data.a data.x) &&
    checkPrimitiveStep choices (.row 0 data.a 2) &&
    checkPrimitiveStep choices (.row data.c 2 data.x) &&
    checkPrimitiveStep choices (.row data.c 2 0)

/-- Every valid role assignment has a common five-point orientation in each
source-entitled boundary order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_reciprocalFirstOppositeSurplusSecondOpposite
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a x c : Label}
    (ha : a ∈ firstOppositeInteriorLabels)
    (hx : x ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a x 2 c 0 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.firstOpposite_after a ha
    have hx' := hdirect.surplus_between x hx
    have hc' := hdirect.secondOpposite_between c hc
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.firstOpposite_between a ha
    have hx' := hmirror.surplus_between x hx
    have hc' := hmirror.secondOpposite_after c hc
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofReciprocalFirstOppositeSurplusSecondOppositeCommonFive
    (choices : List (RowChoice Label))
    (data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with
      ⟨⟨⟨⟨⟨hroles, hax_a2⟩, h2a_2x⟩, h0a_02⟩, hc2_cx⟩, hc2_c0⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨ha, hx, hc⟩
    let hax : EdgeClosure row (data.a, data.x) (data.a, 2) :=
      edgeClosure_of_checkPrimitiveStep_positive hpositive
        (.row data.a data.x 2) hax_a2
    let h2x : EdgeClosure row (2, data.a) (2, data.x) :=
      edgeClosure_of_checkPrimitiveStep_positive hpositive
        (.row 2 data.a data.x) h2a_2x
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := data.x
        b := 2
        c := data.c
        y := 0
        hab := by
          simp [firstOppositeInteriorLabels] at ha
          rcases ha with ha | ha <;> simp [ha]
        hxy := by
          simp [surplusInteriorLabels] at hx
          rcases hx with hx | hx | hx <;> simp [hx]
        xa_xb := EdgeClosure.trans (EdgeClosure.flip data.x data.a)
          (EdgeClosure.trans hax
            (EdgeClosure.trans (EdgeClosure.flip data.a 2)
              (EdgeClosure.trans h2x (EdgeClosure.flip 2 data.x))))
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.a 2) h0a_02
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 data.x) hc2_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 0) hc2_c0 }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonFiveOrientation_reciprocalFirstOppositeSurplusSecondOpposite
        ha hx hc)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
