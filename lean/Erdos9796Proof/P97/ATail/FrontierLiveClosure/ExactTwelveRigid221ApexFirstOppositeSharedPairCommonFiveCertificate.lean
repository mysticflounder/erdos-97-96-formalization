/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Checked apex/first-opposite shared-pair common-five certificates

The successor arm-static cell-6 survivor has one second-opposite row and one
first-opposite row sharing the pair formed by apex `0` and a first-opposite
interior point.  The row centered at apex `2` contains that shared point and
the two row centers.  Swapping those two centers supplies the two possible
common-five cores; exactly one is oriented in every frozen source order.

The checked role domain has eight assignments: the second-opposite center is
arbitrary and the two first-opposite roles are distinct.  This is a finite
proof-carrying learned-cut family.  It is not terminal UNSAT, all-arm coverage,
an arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three variable roles in the apex/first-opposite shared-pair family. -/
structure ApexFirstOppositeSharedPairCommonFiveData where
  x : Label
  b : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful role domain for the eight-member family. -/
def ApexFirstOppositeSharedPairCommonFiveData.rolesValid
    (data : ApexFirstOppositeSharedPairCommonFiveData) : Prop :=
  data.x ∈ secondOppositeInteriorLabels ∧
    data.b ∈ firstOppositeInteriorLabels ∧
    data.y ∈ firstOppositeInteriorLabels ∧
    data.b ≠ data.y

instance instDecidableApexFirstOppositeSharedPairCommonFiveRolesValid
    (data : ApexFirstOppositeSharedPairCommonFiveData) :
    Decidable data.rolesValid := by
  unfold ApexFirstOppositeSharedPairCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the four equality steps used by both cores. -/
def ApexFirstOppositeSharedPairCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.x 0 data.b) &&
    checkPrimitiveStep choices (.row data.y 0 data.b) &&
    checkPrimitiveStep choices (.row 2 data.b data.x) &&
    checkPrimitiveStep choices (.row 2 data.b data.y)

/-- Swapping the second- and first-opposite row centers covers both possible
orders of the two first-opposite interior labels. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexFirstOppositeSharedPair
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {x b y : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ firstOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels)
    (hby : b ≠ y) :
    CommonFiveOrientationAt order.position 0 x b 2 y ∨
      CommonFiveOrientationAt order.position 0 y b 2 x := by
  have hpos : order.position b ≠ order.position y := by
    intro heq
    exact hby (order.position_injective heq)
  unfold FrozenBoundaryOrder.position at hpos
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hdirect.secondOpposite_between x hx
    have hb' := hdirect.firstOpposite_after b hb
    have hy' := hdirect.firstOpposite_after y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hmirror.secondOpposite_after x hx
    have hb' := hmirror.firstOpposite_between b hb
    have hy' := hmirror.firstOpposite_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairCommonFive
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexFirstOppositeSharedPairCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨hx, hb, hy, hby⟩
    have hx_ne_y : data.x ≠ data.y := by
      simp [secondOppositeInteriorLabels] at hx
      simp [firstOppositeInteriorLabels] at hy
      rcases hx with hx | hx | hx | hx <;>
        rcases hy with hy | hy <;> simp [hx, hy]
    let coreXY : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := data.x
        b := data.b
        c := 2
        y := data.y
        hab := by
          simp [firstOppositeInteriorLabels] at hb
          rcases hb with hb | hb <;> simp [hb]
        hxy := hx_ne_y
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 0 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 0 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.y) hcb_cy }
    let coreYX : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := data.y
        b := data.b
        c := 2
        y := data.x
        hab := by
          simp [firstOppositeInteriorLabels] at hb
          rcases hb with hb | hb <;> simp [hb]
        hxy := hx_ne_y.symm
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 0 data.b) hya_yb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 0 data.b) hxa_xb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.y) hcb_cy
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.x) hcb_cx }
    rcases order.commonFiveOrientation_apexFirstOppositeSharedPair
        hx hb hy hby with hcore | hcore
    · exact order.false_of_convexFivePointCore hreal coreXY hcore
    · exact order.false_of_convexFivePointCore hreal coreYX hcore

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
