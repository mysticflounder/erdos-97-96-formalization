/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Apex/first-opposite shared-pair, second-opposite-center certificates

The successor arm-static cell-6 survivor contains two rows, centered at apex
`0` and at a first-opposite interior point, that share a second-opposite point
and a surplus point.  A row centered at another second-opposite point contains
the surplus point and both row centers.  The frozen cap blocks orient the
resulting convex-five-point core independently of all order inside a block.

The checked role domain has 96 assignments.  This is a finite proof-carrying
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

/-- The four variable roles in the 96-member family. -/
structure ApexFirstOppositeSharedPairSecondOppositeCommonFiveData where
  a : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the four roles. -/
def ApexFirstOppositeSharedPairSecondOppositeCommonFiveData.rolesValid
    (data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData) : Prop :=
  data.a ∈ secondOppositeInteriorLabels ∧
    data.b ∈ surplusInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.y ∈ firstOppositeInteriorLabels

instance instDecidableApexFirstOppositeSharedPairSecondOppositeCommonFiveRolesValid
    (data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData) :
    Decidable data.rolesValid := by
  unfold ApexFirstOppositeSharedPairSecondOppositeCommonFiveData.rolesValid
  infer_instance

/-- Check the four direct row-equality steps used by the core. -/
def ApexFirstOppositeSharedPairSecondOppositeCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row 0 data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 0) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The cap-block order alone orients every member of this family.  In
particular, no relative order between the two second-opposite roles is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_apexFirstOppositeSharedPairSecondOpposite
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c y : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 0 b c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.secondOpposite_between a ha
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.firstOpposite_after y hy
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.secondOpposite_after a ha
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.firstOpposite_between y hy
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairSecondOppositeCommonFive
    (choices : List (RowChoice Label))
    (data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [ApexFirstOppositeSharedPairSecondOppositeCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨ha, hb, hc, hy⟩
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 0
        b := data.b
        c := data.c
        y := data.y
        hab := by
          simp [secondOppositeInteriorLabels] at ha
          simp [surplusInteriorLabels] at hb
          rcases ha with ha | ha | ha | ha <;>
            rcases hb with hb | hb | hb <;> simp [ha, hb]
        hxy := by
          simp [firstOppositeInteriorLabels] at hy
          rcases hy with hy | hy <;> simp [hy]
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 0 data.a data.b) hxa_xb
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.y data.a data.b) hya_yb
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 0) hcb_cx
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b data.y) hcb_cy }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonFiveOrientation_apexFirstOppositeSharedPairSecondOpposite
        ha hb hc hy)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
