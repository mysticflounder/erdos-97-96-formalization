/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex-pair cross-block common-five certificates

This module packages the role-parametric obstruction mined from the successor
arm-static cell-6 survivor.  The common-five core is `(2, x, 0, 1, y)`, where
`x` lies in the second-opposite interior and `y` lies in the surplus interior.
The frozen direct and reflected cap-block orders orient all twelve role
assignments.  Four positive selected-row incidences supply the metric
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

/-- The two variable roles in the apex-pair cross-block family. -/
structure ApexPairCrossBlockCommonFiveData where
  x : Label
  y : Label
deriving DecidableEq, Repr

/-- Check both cap-block roles and the four source-row equality steps. -/
def ApexPairCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexPairCrossBlockCommonFiveData) : Bool :=
  decide (data.x ∈ secondOppositeInteriorLabels ∧
      data.y ∈ surplusInteriorLabels) &&
    checkPrimitiveStep choices (.row data.x 2 0) &&
    checkPrimitiveStep choices (.row data.y 2 0) &&
    checkPrimitiveStep choices (.row 1 0 data.x) &&
    checkPrimitiveStep choices (.row 1 0 data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexPairCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {x y : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hy : y ∈ surplusInteriorLabels) :
    CommonFiveOrientationAt order.position 2 x 0 1 y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hdirect.secondOpposite_between x hx
    have hy' := hdirect.surplus_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hmirror.secondOpposite_after x hx
    have hy' := hmirror.surplus_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked apex-pair cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofApexPairCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : ApexPairCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexPairCrossBlockCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.x ∈ secondOppositeInteriorLabels ∧
        data.y ∈ surplusInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := data.x
        b := 0
        c := 1
        y := data.y
        hab := by decide
        hxy := by
          have hx := hroles'.1
          have hy := hroles'.2
          simp [secondOppositeInteriorLabels] at hx
          simp [surplusInteriorLabels] at hy
          rcases hx with hx | hx | hx | hx <;>
            rcases hy with hy | hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 2 0) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 2 0) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 0 data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 0 data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexPairCrossBlock
          hroles'.1 hroles'.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
