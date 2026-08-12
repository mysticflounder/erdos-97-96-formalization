/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Checked block-spanning common-five certificates

This module packages a recurring ordered-CEGAR obstruction as one small
source-facing checker.  The roles are fixed across the frozen cap blocks:

* `a` lies in the second-opposite interior;
* `x` and `c` lie in the surplus interior;
* the remaining two core labels are the fixed apices `0` and `1`.

The cap blocks alone give a common orientation to `(a,x,0,c,1)`, in either
the direct or reflected boundary order.  Four checked positive-row steps then
produce the metric equalities required by `ConvexFivePointCore`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the block-spanning common-five family. -/
structure BlockSpanningCommonFiveData where
  a : Label
  x : Label
  c : Label
deriving DecidableEq, Repr

/-- Check the cap-block roles, the two distinctness conditions needed by the
five-point core, and its four source-row equality steps. -/
def BlockSpanningCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : BlockSpanningCommonFiveData) : Bool :=
  decide (data.a ∈ secondOppositeInteriorLabels ∧
      data.x ∈ surplusInteriorLabels ∧
      data.c ∈ surplusInteriorLabels ∧
      data.a ≠ 0 ∧ data.x ≠ 1) &&
    checkPrimitiveStep choices (.row data.x data.a 0) &&
    checkPrimitiveStep choices (.row 1 data.a 0) &&
    checkPrimitiveStep choices (.row data.c 0 data.x) &&
    checkPrimitiveStep choices (.row data.c 0 1)

/-- The frozen cap blocks orient every member of the block-spanning family;
no order within an individual cap interior is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_blockSpanning
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a x c : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hx : x ∈ surplusInteriorLabels)
    (hc : c ∈ surplusInteriorLabels) :
    CommonFiveOrientationAt order.position a x 0 c 1 := by
  rcases order.blocks with hdirect | hmirror
  · left
    constructor
    · unfold CyclicTripleAt
      have ha' := hdirect.secondOpposite_between a ha
      have hx' := hdirect.surplus_between x hx
      exact Or.inr (Or.inr ⟨ha'.1, ha'.2.trans hx'.1⟩)
    · unfold CyclicTripleAt
      have hc' := hdirect.surplus_between c hc
      exact Or.inl ⟨hdirect.apex_order.1.trans hc'.1, hc'.2⟩
  · right
    constructor
    · unfold CyclicTripleAt
      have ha' := hmirror.secondOpposite_after a ha
      have hx' := hmirror.surplus_between x hx
      exact Or.inr (Or.inl
        ⟨hmirror.apex_order.1.trans hx'.1, hx'.2.trans ha'⟩)
    · unfold CyclicTripleAt
      have hc' := hmirror.surplus_between c hc
      exact Or.inl ⟨hmirror.apex_order.1, hc'.1⟩

/-- A checked positive-row certificate constructs the corresponding
block-spanning five-point equality core. -/
theorem nonempty_blockSpanningCommonFiveCore_of_positiveCheck
    {row : RowPattern Label} {choices : List (RowChoice Label)}
    (hrows : PositiveRowsMatch row choices)
    (data : BlockSpanningCommonFiveData)
    (hcheck : data.check choices = true) :
    Nonempty (Census554.ConvexFivePointCore.Core row) := by
  simp only [BlockSpanningCommonFiveData.check, Bool.and_eq_true] at hcheck
  rcases hcheck with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
  have hroles' : data.a ∈ secondOppositeInteriorLabels ∧
      data.x ∈ surplusInteriorLabels ∧
      data.c ∈ surplusInteriorLabels ∧
      data.a ≠ 0 ∧ data.x ≠ 1 :=
    of_decide_eq_true hroles
  exact ⟨{
    a := data.a
    x := data.x
    b := 0
    c := data.c
    y := 1
    hab := hroles'.2.2.2.1
    hxy := hroles'.2.2.2.2
    xa_xb := edgeClosure_of_checkPrimitiveStep_positive hrows
      (.row data.x data.a 0) hxa_xb
    ya_yb := edgeClosure_of_checkPrimitiveStep_positive hrows
      (.row 1 data.a 0) hya_yb
    cb_cx := edgeClosure_of_checkPrimitiveStep_positive hrows
      (.row data.c 0 data.x) hcb_cx
    cb_cy := edgeClosure_of_checkPrimitiveStep_positive hrows
      (.row data.c 0 1) hcb_cy }⟩

/-- Turn one checked block-spanning common-five record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofBlockSpanningCommonFive
    (choices : List (RowChoice Label))
    (data : BlockSpanningCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [BlockSpanningCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.a ∈ secondOppositeInteriorLabels ∧
        data.x ∈ surplusInteriorLabels ∧
        data.c ∈ surplusInteriorLabels ∧
        data.a ≠ 0 ∧ data.x ≠ 1 :=
      of_decide_eq_true hroles
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := data.x
        b := 0
        c := data.c
        y := 1
        hab := hroles'.2.2.2.1
        hxy := hroles'.2.2.2.2
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x data.a 0) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 1 data.a 0) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 0 data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c 0 1) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_blockSpanning
          hroles'.1 hroles'.2.1 hroles'.2.2.1)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
