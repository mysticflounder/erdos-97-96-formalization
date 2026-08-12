/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked adjacent-apex cross-block common-five certificates

This module packages the role-parametric obstruction mined from the first
arm-static cell-6 survivor after installing the surplus/apex-pair family.  Its
five roles are the adjacent fixed apices `1`, `0`, one surplus label, one
first-opposite label, and one second-opposite label.  The frozen cap blocks
orient every one of the 24 role assignments; four checked positive-row steps
supply the metric equalities.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the adjacent-apex cross-block family. -/
structure AdjacentApexCrossBlockCommonFiveData where
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the three cap-block roles and the four source-row equality steps. -/
def AdjacentApexCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : AdjacentApexCrossBlockCommonFiveData) : Bool :=
  decide (data.b ∈ surplusInteriorLabels ∧
      data.c ∈ firstOppositeInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 0 1 data.b) &&
    checkPrimitiveStep choices (.row data.y 1 data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 0) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- Every role assignment in the family has one common five-point orientation
in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_adjacentApexCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {b c y : Label}
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ firstOppositeInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position 1 0 b c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.firstOpposite_after c hc
    have hy' := hdirect.secondOpposite_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.firstOpposite_between c hc
    have hy' := hmirror.secondOpposite_after y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked adjacent-apex cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofAdjacentApexCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : AdjacentApexCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [AdjacentApexCrossBlockCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.b ∈ surplusInteriorLabels ∧
        data.c ∈ firstOppositeInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 0
        b := data.b
        c := data.c
        y := data.y
        hab := by
          have hb := hroles'.1
          simp [surplusInteriorLabels] at hb
          rcases hb with hb | hb | hb <;> simp [hb]
        hxy := by
          have hy := hroles'.2.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 1 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 1 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_adjacentApexCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
