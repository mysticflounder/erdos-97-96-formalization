/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 late three-core common-five cut

The r7 cell-1 survivor contains three convex-five-point cores whose common
orientations cover all 48 source-entitled frozen boundary orders.  This file
packages their five selected rows as a proof-carrying
`SourceOrderPositiveNogood`.

This is one finite learned cut.  It is not terminal UNSAT, all-cell coverage,
an arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five selected rows used by the r7 static cell-1 survivor. -/
def staticCell1LateThreeCoreCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {0, 1, 4, 5} }
  , { center := 4, support := {0, 3, 5, 7} }
  , { center := 5, support := {0, 7, 9, 10} }
  , { center := 6, support := {4, 5, 9, 10} }
  , { center := 10, support := {3, 5, 8, 11} } ]

private theorem FrozenBoundaryOrder.position_ne_of_ne_staticCell1LateThreeCore
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

private theorem six_orders_of_pairwise_ne_staticCell1LateThreeCore
    {a b c : Nat} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    (a < b ∧ b < c) ∨
      (a < c ∧ c < b) ∨
      (b < a ∧ a < c) ∨
      (b < c ∧ c < a) ∨
      (c < a ∧ a < b) ∨
      (c < b ∧ b < a) := by
  omega

-- Arithmetic replay of all 48 source-entitled orders for the three cores.
set_option maxHeartbeats 2000000 in
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1LateThreeCoreCommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 3 10 5 6 4 ∨
      CommonFiveOrientationAt order.position 3 4 5 6 10 ∨
      CommonFiveOrientationAt order.position 7 5 0 3 4 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_staticCell1LateThreeCore (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1LateThreeCore (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1LateThreeCore (by decide)
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
      rcases six_orders_of_pairwise_ne_staticCell1LateThreeCore
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
      rcases six_orders_of_pairwise_ne_staticCell1LateThreeCore
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
      rcases six_orders_of_pairwise_ne_staticCell1LateThreeCore
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
      rcases six_orders_of_pairwise_ne_staticCell1LateThreeCore
          h3ne4 h3ne5 h4ne5 with h345 | h354 | h435 | h453 | h534 | h543 <;>
        omega

/-- The r7 survivor's five positive selected rows force one of three convex
five-point contradictions in every source-entitled frozen order. -/
def staticCell1LateThreeCoreCommonFivePositiveNogood :
    SourceOrderPositiveNogood where
  choices := staticCell1LateThreeCoreCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({0, 1, 4, 5} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 5} } : RowChoice Label)
        (by simp [staticCell1LateThreeCoreCommonFivePositiveChoices])
    have hrow4 : ({0, 3, 5, 7} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 3, 5, 7} } : RowChoice Label)
        (by simp [staticCell1LateThreeCoreCommonFivePositiveChoices])
    have hrow5 : ({0, 7, 9, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 7, 9, 10} } : RowChoice Label)
        (by simp [staticCell1LateThreeCoreCommonFivePositiveChoices])
    have hrow6 : ({4, 5, 9, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {4, 5, 9, 10} } : RowChoice Label)
        (by simp [staticCell1LateThreeCoreCommonFivePositiveChoices])
    have hrow10 : ({3, 5, 8, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {3, 5, 8, 11} } : RowChoice Label)
        (by simp [staticCell1LateThreeCoreCommonFivePositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 10
        b := 5
        c := 6
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 3 5 (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 4 3 5 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 6 5 10 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 5 4 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 4
        b := 5
        c := 6
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 3 5 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 10 3 5 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 6 5 4 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 5 10 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 7
        x := 5
        b := 0
        c := 3
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 7 0 (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 4 7 0 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 3 0 5 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 0 4 (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.sourceOrderCoverage_staticCell1LateThreeCoreCommonFive hforced with
      hA | hB | hC
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · exact order.false_of_convexFivePointCore hreal coreC hC

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
