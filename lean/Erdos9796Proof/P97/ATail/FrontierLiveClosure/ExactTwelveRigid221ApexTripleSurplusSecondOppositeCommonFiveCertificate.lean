/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex-triple/surplus/second-opposite common-five certificates

This module packages the source-order obstruction mined from the exact-twelve
cell-6 survivor after the second-opposite shared-pair family.  The common-five
core is `(1, 0, 2, c, y)`, where `c` lies in the surplus interior and `y` lies
in the second-opposite interior.  The frozen direct and reflected cap-block
orders orient all twelve role assignments.  Four positive selected-row
incidences supply the metric equalities.

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

/-- The surplus and second-opposite roles in the family. -/
structure ApexTripleSurplusSecondOppositeCommonFiveData where
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Check both cap-block roles and the four source-row equality steps. -/
def ApexTripleSurplusSecondOppositeCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexTripleSurplusSecondOppositeCommonFiveData) : Bool :=
  decide (data.c ∈ surplusInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 0 1 2) &&
    checkPrimitiveStep choices (.row data.y 1 2) &&
    checkPrimitiveStep choices (.row data.c 2 0) &&
    checkPrimitiveStep choices (.row data.c 2 data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexTripleSurplusSecondOpposite
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {c y : Label}
    (hc : c ∈ surplusInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position 1 0 2 c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hc' := hdirect.surplus_between c hc
    have hy' := hdirect.secondOpposite_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hc' := hmirror.surplus_between c hc
    have hy' := hmirror.secondOpposite_after y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked family record into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofApexTripleSurplusSecondOppositeCommonFive
    (choices : List (RowChoice Label))
    (data : ApexTripleSurplusSecondOppositeCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexTripleSurplusSecondOppositeCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.c ∈ surplusInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 0
        b := 2
        c := data.c
        y := data.y
        hab := by decide
        hxy := by
          have hy := hroles'.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 1 2) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 1 2) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexTripleSurplusSecondOpposite
          hroles'.1 hroles'.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
