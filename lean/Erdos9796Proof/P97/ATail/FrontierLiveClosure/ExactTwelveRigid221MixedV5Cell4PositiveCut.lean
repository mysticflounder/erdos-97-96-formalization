/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v5 cell-4 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v5 cell-4 survivor into one proof-carrying `SourceOrderPositiveNogood`.
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

/-- The five selected rows used by the mixed-v5 cell-4 survivor cut. -/
def mixedV5Cell4PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 5, 11} }
  , { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {3, 8, 10, 11} }
  , { center := 6, support := {2, 3, 5, 8} }
  , { center := 9, support := {0, 2, 10, 11} } ]

/-- The two cell-4 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 3 2 8 1 6 ∨
      CommonFiveOrientationAt order.position 3 2 11 9 0 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      omega
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- The five positive selected rows at the mixed-v5 cell-4 survivor force one
of two convex-five-point equality cores. -/
def mixedV5Cell4PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV5Cell4PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({3, 4, 5, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 4, 5, 11} } : RowChoice Label)
        (by simp [mixedV5Cell4PositiveChoices])
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV5Cell4PositiveChoices])
    have hrow2 : ({3, 8, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {3, 8, 10, 11} } : RowChoice Label)
        (by simp [mixedV5Cell4PositiveChoices])
    have hrow6 : ({2, 3, 5, 8} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {2, 3, 5, 8} } : RowChoice Label)
        (by simp [mixedV5Cell4PositiveChoices])
    have hrow9 : ({0, 2, 10, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 10, 11} } : RowChoice Label)
        (by simp [mixedV5Cell4PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 2
        b := 8
        c := 1
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 3 8 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 6 3 8 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := EdgeClosure.row 1 8 2 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cy := EdgeClosure.row 1 8 6 (hrow1 (by decide)) (hrow1 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 2
        b := 11
        c := 9
        y := 0
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 3 11 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 0 3 11 (hrow0 (by decide)) (hrow0 (by decide))
        cb_cx := EdgeClosure.row 9 11 2 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 11 0 (hrow9 (by decide)) (hrow9 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV5Cell4 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
