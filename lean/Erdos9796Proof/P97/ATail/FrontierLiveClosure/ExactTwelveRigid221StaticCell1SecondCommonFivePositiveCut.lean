/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 second common-five positive cut

The fresh static cell-1 survivor has seven full-support selected rows.  Four
common-five cores, in the canonical order supplied by the finite replay, cover
all 48 source-entitled frozen boundary orders.  This file packages that finite
obstruction as a proof-carrying `SourceOrderPositiveNogood`.

This is one finite learned cut only.  It is not terminal UNSAT, all-cell
coverage, an arbitrary-cardinality lift, or universal closure of the live
Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The seven full-support selected rows used by the static cell-1 survivor. -/
def staticCell1SecondCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 3, 6, 8} }
  , { center := 3, support := {0, 1, 4, 5} }
  , { center := 4, support := {0, 3, 5, 7} }
  , { center := 5, support := {0, 6, 7, 9} }
  , { center := 7, support := {1, 5, 6, 8} }
  , { center := 9, support := {1, 3, 7, 11} }
  , { center := 10, support := {4, 7, 9, 11} } ]

private theorem FrozenBoundaryOrder.position_ne_of_ne_staticCell1SecondCommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

private theorem six_orders_of_pairwise_ne_staticCell1SecondCommonFive
    {a b c : Nat} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    (a < b ∧ b < c) ∨
      (a < c ∧ c < b) ∨
      (b < a ∧ a < c) ∨
      (b < c ∧ c < a) ∨
      (c < a ∧ a < b) ∨
      (c < b ∧ b < a) := by
  omega

set_option maxHeartbeats 2000000 in
/-- The four canonical common-five cores cover all 48 frozen source orders. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1SecondCommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 3 9 7 10 4 ∨
      CommonFiveOrientationAt order.position 1 3 5 4 7 ∨
      CommonFiveOrientationAt order.position 1 7 5 4 3 ∨
      CommonFiveOrientationAt order.position 0 1 6 7 5 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_staticCell1SecondCommonFive (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1SecondCommonFive (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1SecondCommonFive (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      rcases six_orders_of_pairwise_ne_staticCell1SecondCommonFive
          h3ne4 h3ne5 h4ne5 with h345 | h354 | h435 | h453 | h534 | h543 <;>
        omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      rcases six_orders_of_pairwise_ne_staticCell1SecondCommonFive
          h3ne4 h3ne5 h4ne5 with h345 | h354 | h435 | h453 | h534 | h543 <;>
        omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      rcases six_orders_of_pairwise_ne_staticCell1SecondCommonFive
          h3ne4 h3ne5 h4ne5 with h345 | h354 | h435 | h453 | h534 | h543 <;>
        omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      rcases six_orders_of_pairwise_ne_staticCell1SecondCommonFive
          h3ne4 h3ne5 h4ne5 with h345 | h354 | h435 | h453 | h534 | h543 <;>
        omega

/-- The selected rows force one of the four common-five cores in every frozen
source order. -/
def staticCell1SecondCommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1SecondCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 3, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 3, 6, 8} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow3 : ({0, 1, 4, 5} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 5} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow4 : ({0, 3, 5, 7} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 3, 5, 7} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow5 : ({0, 6, 7, 9} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 6, 7, 9} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow7 : ({1, 5, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 5, 6, 8} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow9 : ({1, 3, 7, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 3, 7, 11} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    have hrow10 : ({4, 7, 9, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {4, 7, 9, 11} } : RowChoice Label)
        (by simp [staticCell1SecondCommonFivePositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 9
        b := 7
        c := 10
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 3 7 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 4 3 7 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 10 7 9 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 7 4 (hrow10 (by decide)) (hrow10 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 3
        b := 5
        c := 4
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 1 5 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 7 1 5 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 4 5 3 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cy := EdgeClosure.row 4 5 7 (hrow4 (by decide)) (hrow4 (by decide)) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 7
        b := 5
        c := 4
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 1 5 (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 3 1 5 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 4 5 7 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cy := EdgeClosure.row 4 5 3 (hrow4 (by decide)) (hrow4 (by decide)) }
    let coreD : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 6
        c := 7
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 6 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 5 0 6 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 7 6 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 6 5 (hrow7 (by decide)) (hrow7 (by decide)) }
    rcases order.sourceOrderCoverage_staticCell1SecondCommonFive hforced with
      hA | hB | hC | hD
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · exact order.false_of_convexFivePointCore hreal coreC hC
    · exact order.false_of_convexFivePointCore hreal coreD hD

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
