/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Checked surplus-cross-block common-five certificates

This module packages the role-parametric three-row obstruction exposed by the
fourth static cell-1 canary.  The five-point core uses two surplus labels, the
fixed apex `2`, one first-opposite label, and one second-opposite label.  The
frozen cap blocks orient the core without fixing either surplus label's order
inside its block.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four variable roles in the surplus-cross-block common-five family. -/
structure SurplusCrossBlockCommonFiveData where
  a : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Check the four cap-block roles and the four source-row equality steps. -/
def SurplusCrossBlockCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SurplusCrossBlockCommonFiveData) : Bool :=
  decide (data.a ∈ surplusInteriorLabels ∧
      data.b ∈ firstOppositeInteriorLabels ∧
      data.c ∈ surplusInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 2 data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 2) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The frozen cap blocks orient every member of the surplus-cross-block
family; no order inside the surplus block is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_surplusCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c y : Label}
    (ha : a ∈ surplusInteriorLabels)
    (hb : b ∈ firstOppositeInteriorLabels)
    (hc : c ∈ surplusInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 2 b c y := by
  rcases order.blocks with hdirect | hmirror
  · right
    constructor
    · unfold CyclicTripleAt
      have ha' := hdirect.surplus_between a ha
      have hb' := hdirect.firstOpposite_after b hb
      exact Or.inr (Or.inr ⟨ha'.1, ha'.2.trans hb'⟩)
    · unfold CyclicTripleAt
      have hb' := hdirect.firstOpposite_after b hb
      have hc' := hdirect.surplus_between c hc
      have hy' := hdirect.secondOpposite_between y hy
      exact Or.inr (Or.inl ⟨hy'.2.trans hc'.1, hc'.2.trans hb'⟩)
  · left
    constructor
    · unfold CyclicTripleAt
      have ha' := hmirror.surplus_between a ha
      have hb' := hmirror.firstOpposite_between b hb
      exact Or.inr (Or.inr ⟨hb'.2.trans ha'.1, ha'.2⟩)
    · unfold CyclicTripleAt
      have hb' := hmirror.firstOpposite_between b hb
      have hc' := hmirror.surplus_between c hc
      have hy' := hmirror.secondOpposite_after y hy
      exact Or.inl ⟨hb'.2.trans hc'.1, hc'.2.trans hy'⟩

/-- Turn one checked surplus-cross-block record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofSurplusCrossBlockCommonFive
    (choices : List (RowChoice Label))
    (data : SurplusCrossBlockCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SurplusCrossBlockCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ surplusInteriorLabels ∧
        data.b ∈ firstOppositeInteriorLabels ∧
        data.c ∈ surplusInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 2
        b := data.b
        c := data.c
        y := data.y
        hab := by
          have ha := hroles'.1
          have hb := hroles'.2.1
          simp [surplusInteriorLabels] at ha
          simp [firstOppositeInteriorLabels] at hb
          rcases ha with ha | ha | ha <;>
            rcases hb with hb | hb <;> simp [ha, hb]
        hxy := by
          have hy := hroles'.2.2.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.a data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 2) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_surplusCrossBlock
          hroles'.1 hroles'.2.1 hroles'.2.2.1 hroles'.2.2.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
