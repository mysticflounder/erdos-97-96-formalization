/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CanonicalBoundaryOrderBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Label-general all-order common-five certificates

The label-general membership family quantifies every role of the common-five
core: an apex `a`, a shared pair partner `b`, two centers `x` and `y` whose
rows share the pair `{a, b}`, and a collector `c` whose row contains `b`
together with both centers.  The family's three rows are `(x, {a, b})`,
`(y, {a, b})`, and the collector row at `c`, consumed through the two
primitive membership steps `(c, {b, x})` and `(c, {b, y})`.  Only positive
selected-row membership is consumed — no selected support is treated as a
complete metric fibre.

The admissible role domain mirrors the validated orbit enumeration literally:
`a ≠ b`, `x ≠ y`, `x ∉ {a, b}`, `y ∉ {a, b}`, `c ∉ {b, x, y}`, and the
decidable check `orientedAll48` that the five-point orientation holds in all
forty-eight canonical zero-cut boundary orders.  The canonical-order bridge
transfers the checked orientation to every realized frozen boundary order, so
the contradiction is the checked `ConvexFivePointCore` oriented by the frozen
cap blocks together with the retained second-cap order, in both the direct
and the reflected boundary order.

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

/-- The five quantified roles of the label-general common-five family: apex
`a`, shared pair partner `b`, collector `c`, and centers `x` and `y`.  The
rows of the family are `(x, {a, b})`, `(y, {a, b})`, `(c, {b, x})`, and
`(c, {b, y})` — the two centers `x` and `y` share the pair `{a, b}`, and the
collector row `c` contains `b` with both centers. -/
structure AllOrderCommonFiveData where
  a : Label
  b : Label
  c : Label
  x : Label
  y : Label
deriving DecidableEq, Repr

/-- The validated orbit role domain: the side conditions `a ≠ b ∧ x ≠ y`
(SC1), `x ∉ {a, b} ∧ y ∉ {a, b} ∧ c ∉ {b, x, y}` (SC2), and the all-48
orientation check (SC3), spelled out conjunct by conjunct.  Some label
inequalities are implied by SC3; they are kept so the proposition mirrors
the validated orbit enumeration literally. -/
def AllOrderCommonFiveData.rolesValid (data : AllOrderCommonFiveData) :
    Prop :=
  data.a ≠ data.b ∧ data.x ≠ data.y ∧
    data.x ≠ data.a ∧ data.x ≠ data.b ∧
    data.y ≠ data.a ∧ data.y ≠ data.b ∧
    data.c ≠ data.b ∧ data.c ≠ data.x ∧ data.c ≠ data.y ∧
    orientedAll48 data.a data.x data.b data.c data.y = true

instance instDecidableAllOrderCommonFiveRolesValid
    (data : AllOrderCommonFiveData) : Decidable data.rolesValid := by
  unfold AllOrderCommonFiveData.rolesValid
  infer_instance

/-- Check the role assignment and the four equality steps used by the core. -/
def AllOrderCommonFiveData.check
    (choices : List (RowChoice Label)) (data : AllOrderCommonFiveData) :
    Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.x data.a data.b) &&
    checkPrimitiveStep choices (.row data.y data.a data.b) &&
    checkPrimitiveStep choices (.row data.c data.b data.x) &&
    checkPrimitiveStep choices (.row data.c data.b data.y)

/-- The v23 dominant mined core `(a, x, b, c, y) = (1, 9, 7, 6, 11)` lies in
the validated role domain. -/
example :
    AllOrderCommonFiveData.rolesValid
      { a := 1, b := 7, c := 6, x := 9, y := 11 } := by
  decide

/-- Turn one checked label-general common-five record into a proof-carrying
source-order learned cut. -/
def SourceOrderPositiveNogood.ofAllOrderCommonFive
    (choices : List (RowChoice Label)) (data : AllOrderCommonFiveData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [AllOrderCommonFiveData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with ⟨⟨⟨⟨hroles, hxa_xb⟩, hya_yb⟩, hcb_cx⟩, hcb_cy⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    obtain ⟨hab, hxy, _hxa, _hxb, _hya, _hyb, _hcb, _hcx, _hcy, horiented⟩ :=
      hroles'
    let core : Census554.ConvexFivePointCore.Core row :=
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
        exact order.commonFiveOrientationAt_of_orientedAll48 hforced horiented)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
