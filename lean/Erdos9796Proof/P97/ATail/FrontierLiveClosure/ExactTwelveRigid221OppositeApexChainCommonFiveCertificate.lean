/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Checked opposite-block apex-chain common-five certificates

This module packages the four-row obstruction with fixed apices `0`, `1`, and
`2`, one first-opposite label, and one second-opposite label.  The equality
from center `1` to the other two apices is allowed to use the checked
five-step closure path through rows centered at `0` and `2`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The two variable roles in the opposite-block apex-chain family. -/
structure OppositeApexChainCommonFiveData where
  a : Label
  y : Label
deriving DecidableEq, Repr

/-- The equality from `(1,0)` to `(1,2)` obtained by alternating endpoint
flips with the positive rows centered at `0` and `2`. -/
def oppositeApexChainPath : ClosurePathData Label :=
  { first := (1, 0)
    steps :=
      [ .flip 1 0
      , .row 0 1 2
      , .flip 0 2
      , .row 2 0 1
      , .flip 2 1 ]
    last := (1, 2) }

/-- Check the cap-block roles and the positive equality steps used by the
common-five core `(a,2,0,1,y)`. -/
def OppositeApexChainCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : OppositeApexChainCommonFiveData) : Bool :=
  decide (data.a ∈ firstOppositeInteriorLabels ∧
      data.y ∈ secondOppositeInteriorLabels) &&
    checkPrimitiveStep choices (.row 2 data.a 0) &&
    checkPrimitiveStep choices (.row data.y data.a 0) &&
    checkPath choices oppositeApexChainPath (1, 0) (1, 2) &&
    checkPrimitiveStep choices (.row 1 0 data.y)

/-- Direct and reflected cap-block orders orient every member of the family;
no order inside either opposite block is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_oppositeApexChain
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a y : Label}
    (ha : a ∈ firstOppositeInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 2 0 1 y := by
  rcases order.blocks with hdirect | hmirror
  · right
    constructor
    · unfold CyclicTripleAt
      have ha' := hdirect.firstOpposite_after a ha
      exact Or.inr (Or.inl ⟨hdirect.apex_order.1,
        hdirect.apex_order.2.trans ha'⟩)
    · unfold CyclicTripleAt
      have hy' := hdirect.secondOpposite_between y hy
      exact Or.inl ⟨hy'.1, hy'.2.trans hdirect.apex_order.2⟩
  · left
    constructor
    · unfold CyclicTripleAt
      have ha' := hmirror.firstOpposite_between a ha
      exact Or.inr (Or.inr ⟨ha'.1, ha'.2.trans hmirror.apex_order.2⟩)
    · unfold CyclicTripleAt
      have hy' := hmirror.secondOpposite_after y hy
      exact Or.inl ⟨hmirror.apex_order.1,
        hmirror.apex_order.2.trans hy'⟩

/-- Turn one checked opposite-block apex-chain record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofOppositeApexChainCommonFive
    (choices : List (RowChoice Label))
    (data : OppositeApexChainCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [OppositeApexChainCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ firstOppositeInteriorLabels ∧
        data.y ∈ secondOppositeInteriorLabels :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 2
        b := 0
        c := 1
        y := data.y
        hab := by
          have ha := hroles'.1
          simp [firstOppositeInteriorLabels] at ha
          rcases ha with ha | ha
          · simp [ha]
          · simp [ha]
        hxy := by
          have hy := hroles'.2
          simp [secondOppositeInteriorLabels] at hy
          rcases hy with hy | hy | hy | hy
          · simp [hy]
          · simp [hy]
          · simp [hy]
          · simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.a 0) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a 0) hya_yb
        cb_cx := edgeClosure_of_checkPath_positive hpositive
          oppositeApexChainPath hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 0 data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_oppositeApexChain
          hroles'.1 hroles'.2)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
