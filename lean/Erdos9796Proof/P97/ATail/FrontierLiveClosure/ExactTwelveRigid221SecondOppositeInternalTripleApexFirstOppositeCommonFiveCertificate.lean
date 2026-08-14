/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Second-opposite internal-triple/apex/first-opposite common-five certificates

The v23 arm-static cell-6 survivor's all-order mine exposes a common-five
core whose dominant instance is `(a,x,b,c,y) = (1, 9, 7, 6, 11)`.  The roles
are:

* the fixed Moser apex `1`;
* `x`, `b`, `c` pairwise distinct in the second-opposite interior block, with
  `b` numerically strictly between `x` and `c` — the retained second-cap
  order carries either direction of `6,7,8,9`, so numeric betweenness is
  exactly positional betweenness of the internal triple;
* `y` in the first-opposite interior block.

The rows centered at `x` and `y` share the pair `{1, b}`, and the row
centered at `c` contains `b` and both centers.  Only positive selected-row
membership is consumed — no selected support is treated as a complete metric
fibre.  The contradiction is the checked `ConvexFivePointCore` oriented by
the frozen cap blocks together with the retained second-cap order, in both
the direct and the reflected boundary order; the betweenness hypothesis is
load-bearing, since every non-between role assignment loses the common
orientation in some source-entitled order.

The checked role domain has `8 * 2 = 16` assignments.  This is a finite
proof-carrying learned-cut family.  It is not terminal UNSAT, all-arm
coverage, an arbitrary-cardinality lift, or closure of a live Rigid221
residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four variable roles in the second-opposite internal-triple family. -/
structure SecondOppositeInternalTripleApexFirstOppositeCommonFiveData where
  x : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful role domain for the 16-member family.  Strict numeric
betweenness of `b` makes the three second-opposite roles pairwise distinct. -/
def SecondOppositeInternalTripleApexFirstOppositeCommonFiveData.rolesValid
    (data : SecondOppositeInternalTripleApexFirstOppositeCommonFiveData) :
    Prop :=
  data.x ∈ secondOppositeInteriorLabels ∧
    data.b ∈ secondOppositeInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.y ∈ firstOppositeInteriorLabels ∧
    ((data.x.val < data.b.val ∧ data.b.val < data.c.val) ∨
      (data.c.val < data.b.val ∧ data.b.val < data.x.val))

instance instDecidableSecondOppositeInternalTripleApexFirstOppositeRolesValid
    (data : SecondOppositeInternalTripleApexFirstOppositeCommonFiveData) :
    Decidable data.rolesValid := by
  unfold SecondOppositeInternalTripleApexFirstOppositeCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the four equality steps used by the core. -/
def SecondOppositeInternalTripleApexFirstOppositeCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : SecondOppositeInternalTripleApexFirstOppositeCommonFiveData) :
    Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.x 1 data.b) &&
    checkPrimitiveStep choices (.row data.y 1 data.b) &&
    checkPrimitiveStep choices (.row data.c data.b data.x) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- A numerically between middle point is positionally between in either
retained second-cap order. -/
private theorem FrozenBoundaryOrder.secondCap_position_between
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {x b c : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ secondOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hbetween : (x.val < b.val ∧ b.val < c.val) ∨
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
    simp at hbetween ⊢ <;> omega

/-- Every valid role assignment has a common five-point orientation in each
source-entitled boundary order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_secondOppositeInternalTripleApexFirstOpposite
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {x b c y : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ secondOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels)
    (hbetween : (x.val < b.val ∧ b.val < c.val) ∨
      (c.val < b.val ∧ b.val < x.val)) :
    CommonFiveOrientationAt order.position 1 x b c y := by
  have hmid := order.secondCap_position_between hforced hx hb hc hbetween
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hmid
    have hx' := hdirect.secondOpposite_between x hx
    have hb' := hdirect.secondOpposite_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.firstOpposite_after y hy
    have hapex := hdirect.apex_order
    rcases hmid with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hmid
    have hx' := hmirror.secondOpposite_after x hx
    have hb' := hmirror.secondOpposite_after b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.firstOpposite_between y hy
    have hapex := hmirror.apex_order
    rcases hmid with hforward | hreverse <;> omega

/-- Turn one checked second-opposite internal-triple record into a
proof-carrying source-order learned cut. -/
def SourceOrderPositiveNogood.ofSecondOppositeInternalTripleApexFirstOppositeCommonFive
    (choices : List (RowChoice Label))
    (data : SecondOppositeInternalTripleApexFirstOppositeCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only
      [SecondOppositeInternalTripleApexFirstOppositeCommonFiveData.check,
        Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨hx, hb, hc, hy, hbetween⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := data.x
        b := data.b
        c := data.c
        y := data.y
        hab := by
          simp [secondOppositeInteriorLabels] at hb
          rcases hb with hb | hb | hb | hb <;> simp [hb]
        hxy := by
          simp [secondOppositeInteriorLabels] at hx
          simp [firstOppositeInteriorLabels] at hy
          rcases hx with hx | hx | hx | hx <;>
            rcases hy with hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 1 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 1 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact
          order.commonFiveOrientation_secondOppositeInternalTripleApexFirstOpposite
            hforced hx hb hc hy hbetween)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
