/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Checked apex-cross-block common-five certificates

This module packages a second role-parametric three-row obstruction.  The five
roles are the fixed apices `0`, `2`, a first-opposite label, a second-opposite
label, and a surplus label.  Their cap blocks alone orient the five-point core;
four checked positive-row steps then supply its metric equalities.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the apex-cross-block common-five family. -/
structure ApexCrossBlockCommonFiveData where
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the three cap-block roles and the four source-row equality steps. -/
def ApexCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexCrossBlockCommonFiveData) : Bool :=
  decide (data.b ∈ firstOppositeInteriorLabels ∧
      data.c ∈ secondOppositeInteriorLabels ∧
      data.y ∈ surplusInteriorLabels) &&
    checkPrimitiveStep choices (.row 2 0 data.b) &&
    checkPrimitiveStep choices (.row data.y 0 data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 2) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The frozen cap blocks orient every member of the apex-cross-block family;
no order inside any cap interior is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {b c y : Label}
    (hb : b ∈ firstOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ surplusInteriorLabels) :
    CommonFiveOrientationAt order.position 0 2 b c y := by
  rcases order.blocks with hdirect | hmirror
  · left
    constructor
    · unfold CyclicTripleAt
      have hb' := hdirect.firstOpposite_after b hb
      exact Or.inl ⟨hdirect.apex_order.1,
        hdirect.apex_order.2.trans hb'⟩
    · unfold CyclicTripleAt
      have hb' := hdirect.firstOpposite_after b hb
      have hc' := hdirect.secondOpposite_between c hc
      have hy' := hdirect.surplus_between y hy
      exact Or.inr (Or.inl ⟨hc'.2.trans hy'.1, hy'.2.trans hb'⟩)
  · right
    constructor
    · unfold CyclicTripleAt
      have hb' := hmirror.firstOpposite_between b hb
      exact Or.inl ⟨hb'.1, hb'.2.trans hmirror.apex_order.2⟩
    · unfold CyclicTripleAt
      have hb' := hmirror.firstOpposite_between b hb
      have hc' := hmirror.secondOpposite_after c hc
      have hy' := hmirror.surplus_between y hy
      exact Or.inl ⟨hb'.2.trans hy'.1, hy'.2.trans hc'⟩

/-- Turn one checked apex-cross-block record into a proof-carrying source-order
learned cut. -/
def SourceOrderPositiveNogood.ofApexCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : ApexCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexCrossBlockCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.b ∈ firstOppositeInteriorLabels ∧
        data.c ∈ secondOppositeInteriorLabels ∧
        data.y ∈ surplusInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 2
        b := data.b
        c := data.c
        y := data.y
        hab := by
          have hb := hroles'.1
          simp [firstOppositeInteriorLabels] at hb
          rcases hb with hb | hb
          · simp [hb]
          · simp [hb]
        hxy := by
          have hy := hroles'.2.2
          simp [surplusInteriorLabels] at hy
          rcases hy with hy | hy | hy
          · simp [hy]
          · simp [hy]
          · simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 0 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 0 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 2) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
