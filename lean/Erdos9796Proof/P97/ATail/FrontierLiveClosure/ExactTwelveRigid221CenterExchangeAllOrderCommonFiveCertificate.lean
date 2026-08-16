/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221AllOrderCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CenterExchangeBoundaryOrderBridge

/-!
# Center-exchange all-order common-five certificates

The label-general common-five family quantifies an apex `a`, a shared pair
partner `b`, two centers `x` and `y` whose rows share the pair `{a, b}`, and
a collector `c` whose row contains `b` together with both centers.  The
strict all-orders check admits a role assignment only when one fixed
assignment is oriented in all forty-eight canonical boundary orders.  This
file widens the admissible domain to assignments whose orientation holds in
every order up to exchanging the two pair-centers: in each canonical order,
`(a, x, b, c, y)` or `(a, y, b, c, x)` is oriented.

The family's rows are symmetric under the center exchange — `(x, {a, b})`
and `(y, {a, b})` exchange with each other and the collector row steps
`(c, {b, x})`, `(c, {b, y})` exchange with each other — so both exchange
branches refute the same four checked membership steps.  The contradiction
case-splits on the transferred orientation disjunction and consumes the
checked `ConvexFivePointCore` with the roles as given or with the two
pair-centers exchanged.  Only positive selected-row membership is consumed —
no selected support is treated as a complete metric fibre.

This is a proof-carrying learned-cut family producer.  It is not terminal
UNSAT, all-arm coverage, an arbitrary-cardinality lift, or closure of a live
Rigid221 residual, and it asserts no orbit cardinality.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The center-exchange role domain: the side conditions of the strict
domain (`a ≠ b ∧ x ≠ y`, `x ∉ {a, b} ∧ y ∉ {a, b} ∧ c ∉ {b, x, y}`), with
the all-48 orientation check widened to admit the assignment or its
center exchange per order.  The side conditions are symmetric under the
center exchange. -/
def AllOrderCommonFiveData.centerExchangeRolesValid
    (data : AllOrderCommonFiveData) : Prop :=
  data.a ≠ data.b ∧ data.x ≠ data.y ∧
    data.x ≠ data.a ∧ data.x ≠ data.b ∧
    data.y ≠ data.a ∧ data.y ≠ data.b ∧
    data.c ≠ data.b ∧ data.c ≠ data.x ∧ data.c ≠ data.y ∧
    centerExchangeOrientedAll48 data.a data.x data.b data.c data.y = true

instance instDecidableAllOrderCommonFiveCenterExchangeRolesValid
    (data : AllOrderCommonFiveData) :
    Decidable data.centerExchangeRolesValid := by
  unfold AllOrderCommonFiveData.centerExchangeRolesValid
  infer_instance

/-- Check the center-exchange role assignment and the four equality steps
used by the core.  The four steps are the same four rows as the strict
family; only the role-domain check is widened. -/
def AllOrderCommonFiveData.centerExchangeCheck
    (choices : List (RowChoice Label)) (data : AllOrderCommonFiveData) :
    Bool :=
  decide data.centerExchangeRolesValid &&
    checkPrimitiveStep choices (.row data.x data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b data.x) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The v24 dominant mined core `(a, x, b, c, y) = (5, 6, 11, 7, 8)` lies in
the center-exchange role domain. -/
example :
    AllOrderCommonFiveData.centerExchangeRolesValid
      { a := 5, b := 11, c := 7, x := 6, y := 8 } := by
  decide

/-- The v24 dominant mined core lies outside the strict role domain: its
orientation exchanges the two pair-centers between the direct and the
reflected canonical orders. -/
example :
    ¬ AllOrderCommonFiveData.rolesValid
      { a := 5, b := 11, c := 7, x := 6, y := 8 } := by
  decide

/-- Turn one checked center-exchange common-five record into a
proof-carrying source-order learned cut. -/
def SourceOrderPositiveNogood.ofCenterExchangeAllOrderCommonFive
    (choices : List (RowChoice Label)) (data : AllOrderCommonFiveData)
    (hcheck : data.centerExchangeCheck choices = true) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [AllOrderCommonFiveData.centerExchangeCheck,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.centerExchangeRolesValid := of_decide_eq_true hroles
    obtain ⟨hab, hxy, _hxa, _hxb, _hya, _hyb, _hcb, _hcx, _hcy, horiented⟩ :=
      hroles'
    rcases order.commonFiveOrientationAt_or_exchange hforced horiented
      with horient | horient
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.a
          x := data.x
          b := data.b
          c := data.c
          y := data.y
          hab := hab
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
          exact horient)
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.a
          x := data.y
          b := data.b
          c := data.c
          y := data.x
          hab := hab
          hxy := hxy.symm
          xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.y data.a data.b) hya_yb
          ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.x data.a data.b) hxa_xb
          cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.c data.b data.y) hcb_cy
          cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.c data.b data.x) hcb_cx }
      exact order.false_of_convexFivePointCore hreal core
        (by
          dsimp only [core]
          exact horient)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
