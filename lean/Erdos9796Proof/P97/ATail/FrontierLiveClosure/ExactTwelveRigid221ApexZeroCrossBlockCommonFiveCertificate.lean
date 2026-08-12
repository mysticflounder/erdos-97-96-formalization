/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex-zero cross-block common-five certificates

This module packages the role-parametric obstruction mined from the successor
arm-static cell-6 survivor after the zero-center cross-block family.  The fixed
roles are the apices `0` and `1`; `a` lies in the surplus interior, `x` in the
second-opposite interior, and `c` in the first-opposite interior.  The frozen
direct and reflected cap-block orders orient all 24 role assignments, while
four positive selected-row incidences supply the metric equalities.

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

/-- The three variable roles in the apex-zero cross-block family. -/
structure ApexZeroCrossBlockCommonFiveData where
  a : Label
  x : Label
  c : Label
deriving DecidableEq, Repr

/-- Check the three cap-block roles and the four source-row equality steps. -/
def ApexZeroCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexZeroCrossBlockCommonFiveData) : Bool :=
  decide (data.a ∈ surplusInteriorLabels ∧
      data.x ∈ secondOppositeInteriorLabels ∧
      data.c ∈ firstOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 1 data.a 0) &&
    checkPrimitiveStep choices (.row data.x data.a 0) &&
    checkPrimitiveStep choices (.row data.c 0 data.x) &&
    checkPrimitiveStep choices (.row data.c 0 1)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexZeroCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a x c : Label}
    (ha : a ∈ surplusInteriorLabels)
    (hx : x ∈ secondOppositeInteriorLabels)
    (hc : c ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a x 0 c 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.surplus_between a ha
    have hx' := hdirect.secondOpposite_between x hx
    have hc' := hdirect.firstOpposite_after c hc
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.surplus_between a ha
    have hx' := hmirror.secondOpposite_after x hx
    have hc' := hmirror.firstOpposite_between c hc
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked apex-zero cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofApexZeroCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : ApexZeroCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexZeroCrossBlockCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ surplusInteriorLabels ∧
        data.x ∈ secondOppositeInteriorLabels ∧
        data.c ∈ firstOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := data.x
        b := 0
        c := data.c
        y := 1
        hab := by
          have ha := hroles'.1
          simp [surplusInteriorLabels] at ha
          rcases ha with ha | ha | ha <;> simp [ha]
        hxy := by
          have hx := hroles'.2.1
          simp [secondOppositeInteriorLabels] at hx
          rcases hx with hx | hx | hx | hx <;> simp [hx]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x data.a 0) hya_yb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 data.a 0) hxa_xb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 0 data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 0 1) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexZeroCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
