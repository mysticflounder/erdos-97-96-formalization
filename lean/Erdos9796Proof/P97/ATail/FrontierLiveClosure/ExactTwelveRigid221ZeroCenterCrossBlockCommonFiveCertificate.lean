/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked zero-center cross-block common-five certificates

This module packages the role-parametric obstruction mined from the successor
arm-static cell-6 survivor after the fifth singleton common-five cut.  The
fixed roles are the apex `1` and center `0`; `x` lies in the surplus interior,
`b` in the second-opposite interior, and `y` in the first-opposite interior.
The frozen direct and reflected cap-block orders orient all 24 role
assignments, while four positive selected-row incidences supply the metric
equalities.

This is a family of proof-carrying finite refinements.  It is not terminal
UNSAT, all-arm coverage, an arbitrary-cardinality lift, or closure of a live
Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the zero-center cross-block family. -/
structure ZeroCenterCrossBlockCommonFiveData where
  x : Label
  b : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the three cap-block roles and the four source-row equality steps. -/
def ZeroCenterCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ZeroCenterCrossBlockCommonFiveData) : Bool :=
  decide (data.x ∈ surplusInteriorLabels ∧
      data.b ∈ secondOppositeInteriorLabels ∧
      data.y ∈ firstOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row data.x 1 data.b) &&
    checkPrimitiveStep choices (.row data.y 1 data.b) &&
    checkPrimitiveStep choices (.row 0 data.b data.x) &&
    checkPrimitiveStep choices (.row 0 data.b data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_zeroCenterCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {x b y : Label}
    (hx : x ∈ surplusInteriorLabels)
    (hb : b ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position 1 x b 0 y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hdirect.surplus_between x hx
    have hb' := hdirect.secondOpposite_between b hb
    have hy' := hdirect.firstOpposite_after y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hmirror.surplus_between x hx
    have hb' := hmirror.secondOpposite_after b hb
    have hy' := hmirror.firstOpposite_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked zero-center cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofZeroCenterCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : ZeroCenterCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ZeroCenterCrossBlockCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.x ∈ surplusInteriorLabels ∧
        data.b ∈ secondOppositeInteriorLabels ∧
        data.y ∈ firstOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := data.x
        b := data.b
        c := 0
        y := data.y
        hab := by
          have hb := hroles'.2.1
          simp [secondOppositeInteriorLabels] at hb
          rcases hb with hb | hb | hb | hb <;> simp [hb]
        hxy := by
          have hx := hroles'.1
          have hy := hroles'.2.2
          simp [surplusInteriorLabels] at hx
          simp [firstOppositeInteriorLabels] at hy
          rcases hx with hx | hx | hx <;>
            rcases hy with hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 1 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 1 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_zeroCenterCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
