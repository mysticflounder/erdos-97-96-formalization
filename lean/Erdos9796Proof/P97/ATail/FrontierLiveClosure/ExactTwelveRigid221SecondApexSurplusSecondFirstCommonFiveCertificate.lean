/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Second-apex/surplus/second-opposite/first-opposite common-five certificates

The v18 arm-static cell-6 survivor contains rows centered at apex `0` and at a
first-opposite interior point that share apex `2` and a surplus point.  A row
centered at a second-opposite interior point contains the surplus point and
both row centers.  The frozen cap blocks orient the resulting convex-five-point
core independently of all order inside a block.

The checked role domain has 24 assignments.  This is a finite proof-carrying
learned-cut family.  It is not terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the 24-member family. -/
structure SecondApexSurplusSecondFirstCommonFiveData where
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the three roles. -/
def SecondApexSurplusSecondFirstCommonFiveData.rolesValid
    (data : SecondApexSurplusSecondFirstCommonFiveData) : Prop :=
  data.b ∈ surplusInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.y ∈ firstOppositeInteriorLabels

instance instDecidableSecondApexSurplusSecondFirstCommonFiveRolesValid
    (data : SecondApexSurplusSecondFirstCommonFiveData) :
    Decidable data.rolesValid := by
  unfold SecondApexSurplusSecondFirstCommonFiveData.rolesValid
  infer_instance

/-- Check the four direct row-equality steps used by the core. -/
def SecondApexSurplusSecondFirstCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SecondApexSurplusSecondFirstCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row 0 2 data.b) &&
    checkPrimitiveStep choices (.row data.y 2 data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 0) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The cap-block order alone orients every member of this family. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_secondApexSurplusSecondFirst
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {b c y : Label}
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position 2 0 b c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.firstOpposite_after y hy
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.firstOpposite_between y hy
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofSecondApexSurplusSecondFirstCommonFive
    (choices : List (RowChoice Label))
    (data : SecondApexSurplusSecondFirstCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SecondApexSurplusSecondFirstCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨hb, hc, hy⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 0
        b := data.b
        c := data.c
        y := data.y
        hab := by
          simp [surplusInteriorLabels] at hb
          rcases hb with hb | hb | hb <;> simp [hb]
        hxy := by
          simp [firstOppositeInteriorLabels] at hy
          rcases hy with hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 2 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 2 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonFiveOrientation_secondApexSurplusSecondFirst hb hc hy)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
