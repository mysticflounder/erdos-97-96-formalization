/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 r10 common-five cut

The first live r10 survivor after eager installation of the 71-entry
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

/-- The three selected rows used by the first live r10 cell-1 survivor cut. -/
def staticCell1R10CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 7, support := {4, 6, 8, 10} }
  , { center := 9, support := {2, 4, 7, 11} }
  , { center := 11, support := {4, 5, 6, 9} } ]

/-- The frozen boundary blocks and forced second-cap direction orient either
the displayed core or the core obtained by swapping its two row centers. -/
theorem FrozenBoundaryOrder.commonOrientation_core_6_7_4_9_11_or_swap
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 6 7 4 9 11 ∨
      CommonFiveOrientationAt order.position 6 11 4 9 7 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive rows from the first live r10 survivor force a convex
five-point equality core in every frozen source order. -/
def staticCell1R10CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1R10CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow7 : ({4, 6, 8, 10} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {4, 6, 8, 10} } : RowChoice Label)
        (by simp [staticCell1R10CommonFivePositiveChoices])
    have hrow9 : ({2, 4, 7, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 4, 7, 11} } : RowChoice Label)
        (by simp [staticCell1R10CommonFivePositiveChoices])
    have hrow11 : ({4, 5, 6, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {4, 5, 6, 9} } : RowChoice Label)
        (by simp [staticCell1R10CommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 6
        x := 7
        b := 4
        c := 9
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 6 4
          (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 11 6 4
          (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 9 4 7
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 4 11
          (hrow9 (by decide)) (hrow9 (by decide)) }
    let swappedCore : Census554.ConvexFivePointCore.Core row :=
      { a := 6
        x := 11
        b := 4
        c := 9
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 6 4
          (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 7 6 4
          (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 9 4 11
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 4 7
          (hrow9 (by decide)) (hrow9 (by decide)) }
    rcases order.commonOrientation_core_6_7_4_9_11_or_swap hforced with
      horient | horient
    · exact order.false_of_convexFivePointCore hreal core horient
    · exact order.false_of_convexFivePointCore hreal swappedCore horient

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
