/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# First-opposite-pair/surplus/second-opposite common-five certificates

The v21 arm-static cell-6 survivor has rows centered at both first-opposite
interior points that share a second-opposite point `a` and a surplus point `b`.
A row centered at a second-opposite point `c` contains `b` and both
first-opposite points.  The three rows form a convex common-five core in one of
the two orders of the first-opposite pair.

The checked role domain has 48 assignments: `a` and `c` are independently
second-opposite and `b` is surplus.  This is a finite proof-carrying learned-cut
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

/-- The three variable roles in the 48-member family. -/
structure FirstOppositePairSurplusSecondOppositeCommonFiveData where
  a : Label
  b : Label
  c : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the three roles. -/
def FirstOppositePairSurplusSecondOppositeCommonFiveData.rolesValid
    (data : FirstOppositePairSurplusSecondOppositeCommonFiveData) : Prop :=
  data.a ∈ secondOppositeInteriorLabels ∧
    data.b ∈ surplusInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels

instance firstOppositePairSurplusSecondOppositeCommonFiveDecidableRolesValid
    (data : FirstOppositePairSurplusSecondOppositeCommonFiveData) :
    Decidable data.rolesValid := by
  unfold FirstOppositePairSurplusSecondOppositeCommonFiveData.rolesValid
  infer_instance

/-- Check the four direct row equalities used by the two possible cores. -/
def FirstOppositePairSurplusSecondOppositeCommonFiveData.check
    (choices : List (RowChoice Label))
    (data : FirstOppositePairSurplusSecondOppositeCommonFiveData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row 10 data.a data.b) &&
    checkPrimitiveStep choices (.row 11 data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b 10) &&
    checkPrimitiveStep choices (.row data.c data.b 11)

/-- The cap-block order orients the core with first-opposite labels `10` and
`11`; no order inside either cap block is used. -/
theorem FrozenBoundaryOrder.commonFiveOrientation_firstOppositePairSurplusSecondOpposite
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c : Label}
    (ha : a ∈ secondOppositeInteriorLabels)
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position a 10 b c 11 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hdirect.secondOpposite_between a ha
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have ha' := hmirror.secondOpposite_after a ha
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.secondOpposite_after c hc
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- Turn one checked role assignment into a proof-carrying source-order cut. -/
def SourceOrderPositiveNogood.ofFirstOppositePairSurplusSecondOppositeCommonFive
    (choices : List (RowChoice Label))
    (data : FirstOppositePairSurplusSecondOppositeCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [FirstOppositePairSurplusSecondOppositeCommonFiveData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, h10a_10b⟩, h11a_11b⟩, hcb_c10⟩, hcb_c11⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨ha, hb, hc⟩
    have hab : data.a ≠ data.b := by
      simp [secondOppositeInteriorLabels] at ha
      simp [surplusInteriorLabels] at hb
      rcases ha with ha | ha | ha | ha <;>
        rcases hb with hb | hb | hb <;> simp [ha, hb]
    let coreForward : Census554.ConvexFivePointCore.Core row :=
      { a := data.a
        x := 10
        b := data.b
        c := data.c
        y := 11
        hab := hab
        hxy := by decide
        xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 10 data.a data.b) h10a_10b
        ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 11 data.a data.b) h11a_11b
        cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 10) hcb_c10
        cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.b 11) hcb_c11 }
    exact order.false_of_convexFivePointCore hreal coreForward
      (order.commonFiveOrientation_firstOppositePairSurplusSecondOpposite
        ha hb hc)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
