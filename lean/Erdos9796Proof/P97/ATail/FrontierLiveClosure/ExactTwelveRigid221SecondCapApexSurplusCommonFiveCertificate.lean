/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked second-cap/apex/surplus common-five certificates

This module packages the role-parametric obstruction mined from the next
arm-static cell-6 survivor.  The fixed apex is `2`; the roles `x`, `b`, and
`c` are a monotone three-label subsequence of the retained second-opposite
cap order, and `y` lies in the surplus-cap interior.  The common boundary
order and retained second-cap direction orient all 24 role assignments.

This is a family of proof-carrying learned cuts.  It is not terminal UNSAT,
all-arm coverage, an arbitrary-cardinality lift, or closure of a live
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

/-- The four variable roles in the second-cap/apex/surplus family. -/
structure SecondCapApexSurplusCommonFiveData where
  x : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- The three second-cap labels occur monotonically in the retained numerical
label order.  Since the source theorem permits only the forward or reverse
`6,7,8,9` boundary order, this is exactly the source-faithful role domain. -/
def SecondCapApexSurplusCommonFiveData.rolesValid
    (data : SecondCapApexSurplusCommonFiveData) : Prop :=
  data.x ∈ secondOppositeInteriorLabels ∧
    data.b ∈ secondOppositeInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.y ∈ surplusInteriorLabels ∧
    ((data.x.val < data.b.val ∧ data.b.val < data.c.val) ∨
      (data.c.val < data.b.val ∧ data.b.val < data.x.val))

/-- Check the role domain and the four source-row equality steps. -/
def SecondCapApexSurplusCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SecondCapApexSurplusCommonFiveData) : Bool :=
  decide (data.x ∈ secondOppositeInteriorLabels ∧
      data.b ∈ secondOppositeInteriorLabels ∧
      data.c ∈ secondOppositeInteriorLabels ∧
      data.y ∈ surplusInteriorLabels ∧
      ((data.x.val < data.b.val ∧ data.b.val < data.c.val) ∨
        (data.c.val < data.b.val ∧ data.b.val < data.x.val))) &&
    checkPrimitiveStep choices (.row data.x 2 data.b) &&
    checkPrimitiveStep choices (.row data.y 2 data.b) &&
    checkPrimitiveStep choices (.row data.c data.b data.x) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- A valid role triple inherits one of the two retained second-cap orders. -/
private theorem FrozenBoundaryOrder.secondCap_monotone_three
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {x b c : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ secondOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hmono : (x.val < b.val ∧ b.val < c.val) ∨
      (c.val < b.val ∧ b.val < x.val)) :
    (order.position x < order.position b ∧
        order.position b < order.position c) ∨
      (order.position c < order.position b ∧
        order.position b < order.position x) := by
  unfold FrozenForcedSecondCapOrder at hforced
  simp [secondOppositeInteriorLabels] at hx hb hc
  rcases hx with rfl | rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl | rfl <;>
    rcases hc with rfl | rfl | rfl | rfl <;>
    simp at hmono ⊢ <;> omega

/-- Every valid role assignment has one common five-point orientation in the
source-entitled boundary order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_secondCapApexSurplus
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {x b c y : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ secondOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ surplusInteriorLabels)
    (hmono : (x.val < b.val ∧ b.val < c.val) ∨
      (c.val < b.val ∧ b.val < x.val)) :
    CommonFiveOrientationAt order.position 2 x b c y := by
  have hsecond := order.secondCap_monotone_three hforced hx hb hc hmono
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hsecond
    have h2 := hdirect.apex_order
    have hx' := hdirect.secondOpposite_between x hx
    have hb' := hdirect.secondOpposite_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.surplus_between y hy
    rcases hsecond with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hsecond
    have h2 := hmirror.apex_order
    have hx' := hmirror.secondOpposite_after x hx
    have hb' := hmirror.secondOpposite_after b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.surplus_between y hy
    rcases hsecond with hforward | hreverse <;> omega

/-- Turn one checked second-cap/apex/surplus record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofSecondCapApexSurplusCommonFive
    (choices : List (RowChoice Label))
    (data : SecondCapApexSurplusCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SecondCapApexSurplusCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.x ∈ secondOppositeInteriorLabels ∧
        data.b ∈ secondOppositeInteriorLabels ∧
        data.c ∈ secondOppositeInteriorLabels ∧
        data.y ∈ surplusInteriorLabels ∧
        ((data.x.val < data.b.val ∧ data.b.val < data.c.val) ∨
          (data.c.val < data.b.val ∧ data.b.val < data.x.val)) :=
      of_decide_eq_true hroles
    rcases hroles' with ⟨hx, hb, hc, hy, hmono⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := data.x
        b := data.b
        c := data.c
        y := data.y
        hab := by
          simp [secondOppositeInteriorLabels] at hb
          rcases hb with hb | hb | hb | hb <;> simp [hb]
        hxy := by
          simp [secondOppositeInteriorLabels] at hx
          simp [surplusInteriorLabels] at hy
          rcases hx with hx | hx | hx | hx <;>
            rcases hy with hy | hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 2 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 2 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_secondCapApexSurplus hforced
          hx hb hc hy hmono)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
