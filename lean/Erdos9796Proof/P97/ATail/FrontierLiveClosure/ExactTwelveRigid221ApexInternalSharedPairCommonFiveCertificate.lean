/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex-internal shared-pair common-five certificates

The next arm-static cell-6 survivor has two retained second-cap rows sharing
one second-cap point and one surplus point.  A third second-cap row contains
the surplus point and the two row centres.  The two ordered pairs in the
retained `6,7,8,9` block have the same direction, so every source-entitled
boundary order orients the resulting common five-point core.

The checked role domain has 36 assignments: the four second-cap roles are
distinct, the two ordered pairs have the same direction, and the shared point
is one of the three surplus labels.  This is a finite proof-carrying learned-cut
family.  It is not terminal UNSAT, all-arm coverage, an arbitrary-cardinality
lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five variable roles in the apex-internal shared-pair family. -/
structure ApexInternalSharedPairCommonFiveData where
  a : Label
  x : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful role domain for the 36-member family. -/
def ApexInternalSharedPairCommonFiveData.rolesValid
    (data : ApexInternalSharedPairCommonFiveData) : Prop :=
  data.a ∈ secondOppositeInteriorLabels ∧
    data.x ∈ secondOppositeInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.y ∈ secondOppositeInteriorLabels ∧
    data.b ∈ surplusInteriorLabels ∧
    data.a ≠ data.x ∧
    data.a ≠ data.c ∧
    data.a ≠ data.y ∧
    data.x ≠ data.c ∧
    data.x ≠ data.y ∧
    data.c ≠ data.y ∧
    ((data.a.val < data.x.val ∧ data.c.val < data.y.val) ∨
      (data.x.val < data.a.val ∧ data.y.val < data.c.val))

instance instDecidableApexInternalSharedPairCommonFiveRolesValid
    (data : ApexInternalSharedPairCommonFiveData) :
    Decidable data.rolesValid := by
  unfold ApexInternalSharedPairCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the five equality steps used by the core. -/
def ApexInternalSharedPairCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexInternalSharedPairCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.x data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b data.x) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- Same-direction numerical pairs inherit the same direction in either
retained second-cap order. -/
private theorem FrozenBoundaryOrder.secondCap_same_direction_pairs
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {a x c y : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hx : x ∈ secondOppositeInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels)
    (hpairs : (a.val < x.val ∧ c.val < y.val) ∨
      (x.val < a.val ∧ y.val < c.val)) :
    (order.position a < order.position x ∧
        order.position c < order.position y) ∨
      (order.position x < order.position a ∧
        order.position y < order.position c) := by
  unfold FrozenForcedSecondCapOrder at hforced
  simp [secondOppositeInteriorLabels] at ha hx hc hy
  rcases ha with rfl | rfl | rfl | rfl <;>
    rcases hx with rfl | rfl | rfl | rfl <;>
    rcases hc with rfl | rfl | rfl | rfl <;>
    rcases hy with rfl | rfl | rfl | rfl <;>
    simp at hpairs ⊢ <;> omega

/-- Every valid role assignment has a common five-point orientation in each
source-entitled boundary order. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexInternalSharedPair
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    {a x b c y : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ secondOppositeInteriorLabels)
    (hpairs : (a.val < x.val ∧ c.val < y.val) ∨
      (x.val < a.val ∧ y.val < c.val)) :
    CommonFiveOrientationAt order.position a x b c y := by
  have hpairOrder := order.secondCap_same_direction_pairs hforced ha hx hc hy hpairs
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hpairOrder
    have ha' := hdirect.secondOpposite_between a ha
    have hx' := hdirect.secondOpposite_between x hx
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.secondOpposite_between y hy
    rcases hpairOrder with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    unfold FrozenBoundaryOrder.position at hpairOrder
    have ha' := hmirror.secondOpposite_after a ha
    have hx' := hmirror.secondOpposite_after x hx
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.secondOpposite_after y hy
    rcases hpairOrder with hforward | hreverse <;> omega

/-- Turn one checked apex-internal shared-pair record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofApexInternalSharedPairCommonFive
    (choices : List (RowChoice Label))
    (data : ApexInternalSharedPairCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexInternalSharedPairCommonFiveData.check, Bool.and_eq_true]
      at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with
      ⟨ha, hx, hc, hy, hb, _hax, _hac, _hay, _hxc, hxy, _hcy, hpairs⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := data.x
        b := data.b
        c := data.c
        y := data.y
        hab := by
          simp [secondOppositeInteriorLabels] at ha
          simp [surplusInteriorLabels] at hb
          rcases ha with ha | ha | ha | ha <;>
            rcases hb with hb | hb | hb <;> simp [ha, hb]
        hxy := hxy
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x data.a data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (by
        dsimp only [core]
        exact order.commonFiveOrientation_apexInternalSharedPair hforced
          ha hx hb hc hy hpairs)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
