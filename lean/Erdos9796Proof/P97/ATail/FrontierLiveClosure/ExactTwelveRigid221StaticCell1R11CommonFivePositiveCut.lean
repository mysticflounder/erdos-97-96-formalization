/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 r11 common-five cut

The first live r11 survivor after eager installation of the 72-entry
source-order bank contains three positive selected rows that force one
convex-five-point core in every source-entitled frozen boundary order.

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

/-- The three selected rows used by the first live r11 cell-1 survivor cut. -/
def staticCell1R11CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 6, support := {4, 5, 10, 11} }
  , { center := 10, support := {3, 5, 8, 11} }
  , { center := 11, support := {2, 5, 8, 9} } ]

/-- The frozen boundary blocks and forced second-cap direction give the r11
cell-1 core one common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_8_10_5_6_11
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 8 10 5 6 11 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hdirect.apex_order
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive rows from the first live r11 survivor force a convex
five-point equality core in every frozen source order. -/
def staticCell1R11CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1R11CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow6 : ({4, 5, 10, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {4, 5, 10, 11} } : RowChoice Label)
        (by simp [staticCell1R11CommonFivePositiveChoices])
    have hrow10 : ({3, 5, 8, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {3, 5, 8, 11} } : RowChoice Label)
        (by simp [staticCell1R11CommonFivePositiveChoices])
    have hrow11 : ({2, 5, 8, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {2, 5, 8, 9} } : RowChoice Label)
        (by simp [staticCell1R11CommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 8
        x := 10
        b := 5
        c := 6
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 8 5
          (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 11 8 5
          (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 6 5 10
          (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 5 11
          (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_8_10_5_6_11 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
