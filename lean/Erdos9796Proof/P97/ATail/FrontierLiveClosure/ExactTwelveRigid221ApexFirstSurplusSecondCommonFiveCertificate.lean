/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Apex/first-opposite/surplus/second-opposite common-five certificates

This module packages the broadest source-clean family mined from the next
exact-twelve arm-static cell-6 survivor.  The common-five core is
`(a, 0, b, 1, y)`, where `a` lies in the first-opposite block, `b` lies in the
surplus block, and `y` lies in the second-opposite block.  The frozen direct
and reflected cap-block orders orient all 24 role assignments independently of
the order inside every block.  Four positive selected-row incidences supply
the metric equalities.

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

/-- The three variable roles in the apex/first/surplus/second family. -/
structure ApexFirstSurplusSecondCommonFiveData where
  a : Label
  b : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the cap-block roles and the four source-row equality steps. -/
def ApexFirstSurplusSecondCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexFirstSurplusSecondCommonFiveData) : Bool :=
  decide (data.a ∈ firstOppositeInteriorLabels ∧
      data.b ∈ surplusInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 0 data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row 1 data.b 0) &&
    checkPrimitiveStep choices (.row 1 data.b data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexFirstSurplusSecond
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b y : Label}
    (ha : a ∈ firstOppositeInteriorLabels)
    (hb : b ∈ surplusInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 0 b 1 y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.firstOpposite_after a ha
    have hb' := hdirect.surplus_between b hb
    have hy' := hdirect.secondOpposite_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.firstOpposite_between a ha
    have hb' := hmirror.surplus_between b hb
    have hy' := hmirror.secondOpposite_after y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked family record into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofApexFirstSurplusSecondCommonFive
    (choices : List (RowChoice Label))
    (data : ApexFirstSurplusSecondCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexFirstSurplusSecondCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ firstOppositeInteriorLabels ∧
        data.b ∈ surplusInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 0
        b := data.b
        c := 1
        y := data.y
        hab := by
          have ha := hroles'.1
          have hb := hroles'.2.1
          simp [firstOppositeInteriorLabels] at ha
          simp [surplusInteriorLabels] at hb
          rcases ha with ha | ha <;>
            rcases hb with hb | hb | hb <;> simp [ha, hb]
        hxy := by
          have hy := hroles'.2.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.a data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 data.b 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexFirstSurplusSecond
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
