/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v3 cell-5 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v3 cell-5 survivor into one proof-carrying `SourceOrderPositiveNogood`.
The two cores cover all direct and mirror source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five selected rows used by the mixed-v3 cell-5 survivor cut. -/
def mixedV3Cell5PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 8, 11} }
  , { center := 2, support := {5, 7, 10, 11} }
  , { center := 6, support := {2, 4, 7, 10} }
  , { center := 7, support := {1, 4, 6, 8} }
  , { center := 10, support := {0, 5, 7, 8} } ]

/-- The two cell-5 cores cover both frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV3Cell5
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 4 0 8 10 7 ∨
      CommonFiveOrientationAt order.position 5 10 7 6 2 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The five positive selected rows at the mixed-v3 cell-5 survivor force one
of the two convex five-point equality cores, contradicting either frozen
boundary order. -/
def mixedV3Cell5PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV3Cell5PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({3, 4, 8, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 4, 8, 11} } : RowChoice Label)
        (by simp [mixedV3Cell5PositiveChoices])
    have hrow2 : ({5, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {5, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV3Cell5PositiveChoices])
    have hrow6 : ({2, 4, 7, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {2, 4, 7, 10} } : RowChoice Label)
        (by simp [mixedV3Cell5PositiveChoices])
    have hrow7 : ({1, 4, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 4, 6, 8} } : RowChoice Label)
        (by simp [mixedV3Cell5PositiveChoices])
    have hrow10 : ({0, 5, 7, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 5, 7, 8} } : RowChoice Label)
        (by simp [mixedV3Cell5PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 0
        b := 8
        c := 10
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 4 8 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 7 4 8 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 10 8 0 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 8 7 (hrow10 (by decide)) (hrow10 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 10
        b := 7
        c := 6
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 5 7 (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 2 5 7 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 6 7 10 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 7 2 (hrow6 (by decide)) (hrow6 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV3Cell5 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
