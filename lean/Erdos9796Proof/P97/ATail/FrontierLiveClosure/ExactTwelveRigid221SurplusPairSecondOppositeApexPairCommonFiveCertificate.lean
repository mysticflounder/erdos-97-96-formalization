/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked surplus-pair/second-opposite/apex-pair common-five certificates

This module packages the source-order obstruction mined from the exact-twelve
cell-6 survivor after the apex-triple family.  The common-five core is
`(a, x, 0, 1, y)`, where `a` and `y` are ordered distinct surplus-interior
labels and `x` is a second-opposite-interior label.  The frozen direct and
reflected cap-block orders orient all 24 role assignments, hence all 48
source orders.  Four positive selected-row incidences supply the metric
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

/-- The three variable roles in the surplus-pair/second-opposite family. -/
structure SurplusPairSecondOppositeApexPairCommonFiveData where
  a : Label
  x : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the ordered-distinct roles and the four source-row equality steps. -/
def SurplusPairSecondOppositeApexPairCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SurplusPairSecondOppositeApexPairCommonFiveData) : Bool :=
  decide (data.a ∈ surplusInteriorLabels ∧
      data.y ∈ surplusInteriorLabels ∧
      data.a ≠ data.y ∧
      data.x ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row data.x data.a 0) &&
    checkPrimitiveStep choices (.row data.y data.a 0) &&
    checkPrimitiveStep choices (.row 1 0 data.x) &&
    checkPrimitiveStep choices (.row 1 0 data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_surplusPairSecondOppositeApexPair
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a x y : Label}
    (ha : a ∈ surplusInteriorLabels)
    (hx : x ∈ secondOppositeInteriorLabels)
    (hy : y ∈ surplusInteriorLabels)
    (_hay : a ≠ y) :
    CommonFiveOrientationAt order.position a x 0 1 y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.surplus_between a ha
    have hx' := hdirect.secondOpposite_between x hx
    have hy' := hdirect.surplus_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.surplus_between a ha
    have hx' := hmirror.secondOpposite_after x hx
    have hy' := hmirror.surplus_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked family record into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofSurplusPairSecondOppositeApexPairCommonFive
    (choices : List (RowChoice Label))
    (data : SurplusPairSecondOppositeApexPairCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SurplusPairSecondOppositeApexPairCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ surplusInteriorLabels ∧
        data.y ∈ surplusInteriorLabels ∧
        data.a ≠ data.y ∧
        data.x ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := data.x
        b := 0
        c := 1
        y := data.y
        hab := by
          have ha := hroles'.1
          simp [surplusInteriorLabels] at ha
          rcases ha with ha | ha | ha <;> simp [ha]
        hxy := by
          have hx := hroles'.2.2.2
          have hy := hroles'.2.1
          simp [secondOppositeInteriorLabels] at hx
          simp [surplusInteriorLabels] at hy
          rcases hx with hx | hx | hx | hx <;>
            rcases hy with hy | hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x data.a 0) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a 0) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 0 data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 0 data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_surplusPairSecondOppositeApexPair
          hroles'.1 hroles'.2.2.2 hroles'.2.1 hroles'.2.2.1)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
