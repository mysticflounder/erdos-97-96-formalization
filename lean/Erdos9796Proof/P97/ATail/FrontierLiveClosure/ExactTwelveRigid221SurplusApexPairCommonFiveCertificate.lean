/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked surplus/apex-pair common-five certificates

This module packages the common-five obstruction repeatedly found by the
exact-twelve arm-static cell-6 canary.  The two middle roles are the fixed
apices `0` and `2`; the remaining roles range over the surplus,
first-opposite, and second-opposite cap interiors.  The cap blocks orient all
24 role assignments without choosing an order inside any interior block.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- Variable roles in the surplus/apex-pair common-five family. -/
structure SurplusApexPairCommonFiveData where
  a : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the cap-block roles and the four positive-row equality steps. -/
def SurplusApexPairCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SurplusApexPairCommonFiveData) : Bool :=
  decide (data.a ∈ surplusInteriorLabels ∧
      data.c ∈ firstOppositeInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 0 data.a 2) &&
    checkPrimitiveStep choices (.row data.y data.a 2) &&
    checkPrimitiveStep choices (.row data.c 2 0) &&
    checkPrimitiveStep choices (.row data.c 2 data.y)

/-- Every role assignment in the family has one common five-point
orientation in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_surplusApexPair
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a c y : Label}
    (ha : a ∈ surplusInteriorLabels)
    (hc : c ∈ firstOppositeInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 0 2 c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.surplus_between a ha
    have hc' := hdirect.firstOpposite_after c hc
    have hy' := hdirect.secondOpposite_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.surplus_between a ha
    have hc' := hmirror.firstOpposite_between c hc
    have hy' := hmirror.secondOpposite_after y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked family record into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofSurplusApexPairCommonFive
    (choices : List (RowChoice Label))
    (data : SurplusApexPairCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SurplusApexPairCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ surplusInteriorLabels ∧
        data.c ∈ firstOppositeInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 0
        b := 2
        c := data.c
        y := data.y
        hab := by
          have ha := hroles'.1
          simp [surplusInteriorLabels] at ha
          rcases ha with ha | ha | ha <;> simp [ha]
        hxy := by
          have hy := hroles'.2.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.a 2) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a 2) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 2 data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_surplusApexPair
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
