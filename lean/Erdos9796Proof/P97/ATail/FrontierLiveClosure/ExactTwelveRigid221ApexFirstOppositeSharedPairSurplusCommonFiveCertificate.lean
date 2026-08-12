/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Apex/first-opposite shared-pair, surplus-center common-five certificates

The v19 arm-static cell-6 survivor contains a second-opposite row and a
surplus row sharing apex `0` and a first-opposite interior point.  The row
centered at apex `2` contains that shared point and both row centers.  The
frozen cap blocks orient the resulting convex-five-point core independently
of every order inside a block.

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
structure ApexFirstOppositeSharedPairSurplusCommonFiveData where
  x : Label
  b : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the three roles. -/
def ApexFirstOppositeSharedPairSurplusCommonFiveData.rolesValid
    (data : ApexFirstOppositeSharedPairSurplusCommonFiveData) : Prop :=
  data.x ∈ secondOppositeInteriorLabels ∧
    data.b ∈ firstOppositeInteriorLabels ∧
    data.y ∈ surplusInteriorLabels

instance instDecidableApexFirstOppositeSharedPairSurplusCommonFiveRolesValid
    (data : ApexFirstOppositeSharedPairSurplusCommonFiveData) :
    Decidable data.rolesValid := by
  unfold ApexFirstOppositeSharedPairSurplusCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the four equality steps used by the core. -/
def ApexFirstOppositeSharedPairSurplusCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairSurplusCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.x 0 data.b) &&
    checkPrimitiveStep choices (.row data.y 0 data.b) &&
    checkPrimitiveStep choices (.row 2 data.b data.x) &&
    checkPrimitiveStep choices (.row 2 data.b data.y)

/-- The cap-block order alone orients every member of this family. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexFirstOppositeSharedPairSurplus
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {x b y : Label}
    (hx : x ∈ secondOppositeInteriorLabels)
    (hb : b ∈ firstOppositeInteriorLabels)
    (hy : y ∈ surplusInteriorLabels) :
    CommonFiveOrientationAt order.position 0 x b 2 y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hdirect.secondOpposite_between x hx
    have hb' := hdirect.firstOpposite_after b hb
    have hy' := hdirect.surplus_between y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hx' := hmirror.secondOpposite_after x hx
    have hb' := hmirror.firstOpposite_between b hb
    have hy' := hmirror.surplus_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairSurplusCommonFive
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairSurplusCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexFirstOppositeSharedPairSurplusCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨hx, hb, hy⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := data.x
        b := data.b
        c := 2
        y := data.y
        hab := by
          simp [firstOppositeInteriorLabels] at hb
          rcases hb with hb | hb <;> simp [hb]
        hxy := by
          simp [secondOppositeInteriorLabels] at hx
          simp [surplusInteriorLabels] at hy
          rcases hx with hx | hx | hx | hx <;>
            rcases hy with hy | hy | hy <;> simp [hx, hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.x 0 data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y 0 data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.x) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 2 data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonFiveOrientation_apexFirstOppositeSharedPairSurplus hx hb hy)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
