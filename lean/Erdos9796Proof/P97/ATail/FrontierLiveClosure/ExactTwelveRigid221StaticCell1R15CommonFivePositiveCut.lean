/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 r15 common-five cut

The live r15 survivor after eager installation of the 75-entry source-order
bank contains three positive selected rows that force one convex-five-point
core in every source-entitled frozen boundary order.

This is one finite learned cut. It is not terminal UNSAT, all-cell coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the live r15 cell-1 survivor cut. -/
def staticCell1R15CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 7, support := {4, 6, 8, 10} }
  , { center := 9, support := {3, 7, 8, 10} }
  , { center := 10, support := {0, 4, 8, 11} } ]

/-- The frozen boundary blocks give the r15 cell-1 core one common
orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_4_7_8_9_10_r15
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 4 7 8 9 10 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive rows from the live r15 survivor force a
convex-five-point equality core in every frozen source order. -/
def staticCell1R15CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1R15CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow7 : ({4, 6, 8, 10} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {4, 6, 8, 10} } : RowChoice Label)
        (by simp [staticCell1R15CommonFivePositiveChoices])
    have hrow9 : ({3, 7, 8, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {3, 7, 8, 10} } : RowChoice Label)
        (by simp [staticCell1R15CommonFivePositiveChoices])
    have hrow10 : ({0, 4, 8, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 4, 8, 11} } : RowChoice Label)
        (by simp [staticCell1R15CommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 7
        b := 8
        c := 9
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 4 8
          (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 10 4 8
          (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 9 8 7
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 8 10
          (hrow9 (by decide)) (hrow9 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_4_7_8_9_10_r15 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
