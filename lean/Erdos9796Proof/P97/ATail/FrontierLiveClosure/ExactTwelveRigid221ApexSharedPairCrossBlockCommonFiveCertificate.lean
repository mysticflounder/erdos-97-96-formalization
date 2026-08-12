/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex-shared-pair cross-block common-five certificates

This module packages the role-parametric obstruction mined from the successor
arm-static cell-6 survivor after installing the apex-pair cross-block family.
The two fixed apex rows share one second-opposite and one surplus point, while
one first-opposite row contains the surplus point and both apices.  The frozen
direct and reflected cap-block orders orient all twenty-four role assignments;
four checked positive-row incidences supply the metric equalities.

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

/-- The three variable roles in the apex-shared-pair cross-block family. -/
structure ApexSharedPairCrossBlockCommonFiveData where
  a : Label
  b : Label
  c : Label
deriving DecidableEq, Repr

/-- Check the three cap-block roles and the four source-row equality steps. -/
def ApexSharedPairCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexSharedPairCrossBlockCommonFiveData) : Bool :=
  decide (data.a ∈ secondOppositeInteriorLabels ∧
      data.b ∈ surplusInteriorLabels ∧
      data.c ∈ firstOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 0 data.a data.b) &&
    checkPrimitiveStep choices (.row 1 data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 0) &&
    checkPrimitiveStep choices (.row data.c data.b 1)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexSharedPairCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 0 b c 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.secondOpposite_between a ha
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.firstOpposite_after c hc
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.secondOpposite_after a ha
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.firstOpposite_between c hc
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked apex-shared-pair cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofApexSharedPairCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : ApexSharedPairCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexSharedPairCrossBlockCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ secondOppositeInteriorLabels ∧
        data.b ∈ surplusInteriorLabels ∧
        data.c ∈ firstOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 0
        b := data.b
        c := data.c
        y := 1
        hab := by
          have ha := hroles'.1
          have hb := hroles'.2.1
          simp [secondOppositeInteriorLabels] at ha
          simp [surplusInteriorLabels] at hb
          rcases ha with ha | ha | ha | ha <;>
            rcases hb with hb | hb | hb <;> simp [ha, hb]
        hxy := by decide
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.a data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 data.a data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 1) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexSharedPairCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
