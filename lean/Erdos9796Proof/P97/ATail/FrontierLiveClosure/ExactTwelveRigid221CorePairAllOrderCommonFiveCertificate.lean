/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CenterExchangeAllOrderCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CorePairBoundaryOrderBridge

/-!
# Core-pair all-order common-five certificates

The center-exchange family admits a five-point role assignment when that
assignment, or its center exchange, is oriented in each of the forty-eight
canonical boundary orders.  This file widens the admissible domain to an
ordered pair of role assignments: the contradiction is available when, in each
canonical order, one of the two assignments is oriented up to its own center
exchange.  Neither assignment needs to orient the whole order deck.

The checked rows are the union of both assignments' rows — eight primitive
membership steps, `(x, {a, b})`, `(y, {a, b})`, `(c, {b, x})`, `(c, {b, y})`
for each of the two assignments.  Because the union contains each
assignment's own four steps, every branch of the four-way orientation
disjunction has the four rows its `ConvexFivePointCore` consumes, so the
case-split needs no further membership.  Only positive selected-row
membership is consumed — no selected support is treated as a complete metric
fibre.

The center-exchange family is the degenerate case in which the two
assignments coincide; the widening is therefore conservative, and a pattern
already admitted there gains nothing here.

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

/-- The label side conditions of the common-five role domain, without the
orientation check: `a ≠ b ∧ x ≠ y`, `x ∉ {a, b}`, `y ∉ {a, b}`, and
`c ∉ {b, x, y}`.  They are symmetric under exchanging the two
pair-centers. -/
def AllOrderCommonFiveData.sideConditions (data : AllOrderCommonFiveData) :
    Prop :=
  data.a ≠ data.b ∧ data.x ≠ data.y ∧
    data.x ≠ data.a ∧ data.x ≠ data.b ∧
    data.y ≠ data.a ∧ data.y ≠ data.b ∧
    data.c ≠ data.b ∧ data.c ≠ data.x ∧ data.c ≠ data.y

instance instDecidableAllOrderCommonFiveSideConditions
    (data : AllOrderCommonFiveData) : Decidable data.sideConditions := by
  unfold AllOrderCommonFiveData.sideConditions
  infer_instance

/-- A pair of common-five role assignments on the same twelve labels. -/
structure CorePairCommonFiveData where
  left : AllOrderCommonFiveData
  right : AllOrderCommonFiveData
deriving DecidableEq, Repr

/-- The core-pair role domain: the side conditions of both assignments,
together with the check that each canonical boundary order orients one of the
two assignments up to its own center exchange. -/
def CorePairCommonFiveData.rolesValid (data : CorePairCommonFiveData) : Prop :=
  data.left.sideConditions ∧ data.right.sideConditions ∧
    corePairOrientedAll48
      data.left.a data.left.x data.left.b data.left.c data.left.y
      data.right.a data.right.x data.right.b data.right.c data.right.y = true

instance instDecidableCorePairCommonFiveRolesValid
    (data : CorePairCommonFiveData) : Decidable data.rolesValid := by
  unfold CorePairCommonFiveData.rolesValid
  infer_instance

/-- Check the core-pair role assignment and the eight equality steps used by
the four candidate cores: the four steps of each assignment. -/
def CorePairCommonFiveData.check
    (choices : List (RowChoice Label)) (data : CorePairCommonFiveData) :
    Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.left.x data.left.a data.left.b) &&
    checkPrimitiveStep choices (.row data.left.y data.left.a data.left.b) &&
    checkPrimitiveStep choices (.row data.left.c data.left.b data.left.x) &&
    checkPrimitiveStep choices (.row data.left.c data.left.b data.left.y) &&
    checkPrimitiveStep choices (.row data.right.x data.right.a data.right.b) &&
    checkPrimitiveStep choices (.row data.right.y data.right.a data.right.b) &&
    checkPrimitiveStep choices (.row data.right.c data.right.b data.right.x) &&
    checkPrimitiveStep choices (.row data.right.c data.right.b data.right.y)

/-- The v25 mined core pair on the label set `{5, 7, 8, 10, 11}` —
`(a, x, b, c, y) = (10, 7, 8, 5, 11)` together with `(7, 5, 8, 10, 11)` —
lies in the core-pair role domain. -/
example :
    CorePairCommonFiveData.rolesValid
      { left := { a := 10, b := 8, c := 5, x := 7, y := 11 }
        right := { a := 7, b := 8, c := 10, x := 5, y := 11 } } := by
  decide

/-- Neither assignment of the v25 mined core pair lies in the center-exchange
role domain: each orients only part of the canonical order deck, so the pair
is a genuine widening rather than a repackaging of an admitted pattern. -/
example :
    ¬ AllOrderCommonFiveData.centerExchangeRolesValid
      { a := 10, b := 8, c := 5, x := 7, y := 11 } := by
  decide

example :
    ¬ AllOrderCommonFiveData.centerExchangeRolesValid
      { a := 7, b := 8, c := 10, x := 5, y := 11 } := by
  decide

/-- Turn one checked core-pair common-five record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofCorePairAllOrderCommonFive
    (choices : List (RowChoice Label)) (data : CorePairCommonFiveData)
    (hcheck : data.check choices = true) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [CorePairCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with
      ⟨⟨⟨⟨⟨⟨⟨⟨hroles, hlxa_xb⟩, hlya_yb⟩, hlcb_cx⟩, hlcb_cy⟩,
        hrxa_xb⟩, hrya_yb⟩, hrcb_cx⟩, hrcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    obtain ⟨hleft, hright, horiented⟩ := hroles'
    obtain ⟨hlab, hlxy, _, _, _, _, _, _, _⟩ := hleft
    obtain ⟨hrab, hrxy, _, _, _, _, _, _, _⟩ := hright
    rcases order.commonFiveOrientationAt_corePair hforced horiented with
      horient | horient | horient | horient
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.left.a
          x := data.left.x
          b := data.left.b
          c := data.left.c
          y := data.left.y
          hab := hlab
          hxy := hlxy
          xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.x data.left.a data.left.b) hlxa_xb
          ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.y data.left.a data.left.b) hlya_yb
          cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.c data.left.b data.left.x) hlcb_cx
          cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.c data.left.b data.left.y) hlcb_cy }
      exact order.false_of_convexFivePointCore hreal core
        (by
          dsimp only [core]
          exact horient)
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.left.a
          x := data.left.y
          b := data.left.b
          c := data.left.c
          y := data.left.x
          hab := hlab
          hxy := hlxy.symm
          xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.y data.left.a data.left.b) hlya_yb
          ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.x data.left.a data.left.b) hlxa_xb
          cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.c data.left.b data.left.y) hlcb_cy
          cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.left.c data.left.b data.left.x) hlcb_cx }
      exact order.false_of_convexFivePointCore hreal core
        (by
          dsimp only [core]
          exact horient)
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.right.a
          x := data.right.x
          b := data.right.b
          c := data.right.c
          y := data.right.y
          hab := hrab
          hxy := hrxy
          xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.x data.right.a data.right.b) hrxa_xb
          ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.y data.right.a data.right.b) hrya_yb
          cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.c data.right.b data.right.x) hrcb_cx
          cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.c data.right.b data.right.y) hrcb_cy }
      exact order.false_of_convexFivePointCore hreal core
        (by
          dsimp only [core]
          exact horient)
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := data.right.a
          x := data.right.y
          b := data.right.b
          c := data.right.c
          y := data.right.x
          hab := hrab
          hxy := hrxy.symm
          xa_xb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.y data.right.a data.right.b) hrya_yb
          ya_yb := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.x data.right.a data.right.b) hrxa_xb
          cb_cx := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.c data.right.b data.right.y) hrcb_cy
          cb_cy := edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.right.c data.right.b data.right.x) hrcb_cx }
      exact order.false_of_convexFivePointCore hreal core
        (by
          dsimp only [core]
          exact horient)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
