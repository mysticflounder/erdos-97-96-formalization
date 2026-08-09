/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v3 cell-7 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v3 cell-7 survivor into one proof-carrying `SourceOrderPositiveNogood`.
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

/-- The five selected rows used by the mixed-v3 cell-7 survivor cut. -/
def mixedV3Cell7PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 5, 11} }
  , { center := 1, support := {0, 2, 6, 8} }
  , { center := 4, support := {0, 2, 7, 11} }
  , { center := 5, support := {1, 2, 4, 7} }
  , { center := 11, support := {1, 4, 9, 10} } ]

/-- The two cell-7 cores cover both frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV3Cell7
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 2 5 4 ∨
      CommonFiveOrientationAt order.position 1 11 4 0 5 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  have hne {a b : Label} (hab : a ≠ b) :
      (order.index a).val ≠ (order.index b).val := by
    intro heq
    exact hab (order.position_injective heq)
  have h01 := hne (a := (0 : Label)) (b := 1) (by decide)
  have h02 := hne (a := (0 : Label)) (b := 2) (by decide)
  have h04 := hne (a := (0 : Label)) (b := 4) (by decide)
  have h05 := hne (a := (0 : Label)) (b := 5) (by decide)
  have h011 := hne (a := (0 : Label)) (b := 11) (by decide)
  have h12 := hne (a := (1 : Label)) (b := 2) (by decide)
  have h14 := hne (a := (1 : Label)) (b := 4) (by decide)
  have h15 := hne (a := (1 : Label)) (b := 5) (by decide)
  have h111 := hne (a := (1 : Label)) (b := 11) (by decide)
  have h24 := hne (a := (2 : Label)) (b := 4) (by decide)
  have h25 := hne (a := (2 : Label)) (b := 5) (by decide)
  have h211 := hne (a := (2 : Label)) (b := 11) (by decide)
  have h45 := hne (a := (4 : Label)) (b := 5) (by decide)
  have h411 := hne (a := (4 : Label)) (b := 11) (by decide)
  have h511 := hne (a := (5 : Label)) (b := 11) (by decide)
  clear hne
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
      omega

/-- The five positive selected rows at the mixed-v3 cell-7 survivor force one
of the two convex five-point equality cores, contradicting either frozen
boundary order. -/
def mixedV3Cell7PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV3Cell7PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({3, 4, 5, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 4, 5, 11} } : RowChoice Label)
        (by simp [mixedV3Cell7PositiveChoices])
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV3Cell7PositiveChoices])
    have hrow4 : ({0, 2, 7, 11} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 2, 7, 11} } : RowChoice Label)
        (by simp [mixedV3Cell7PositiveChoices])
    have hrow5 : ({1, 2, 4, 7} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 2, 4, 7} } : RowChoice Label)
        (by simp [mixedV3Cell7PositiveChoices])
    have hrow11 : ({1, 4, 9, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {1, 4, 9, 10} } : RowChoice Label)
        (by simp [mixedV3Cell7PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 2
        c := 5
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 4 0 2 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 5 2 1 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cy := EdgeClosure.row 5 2 4 (hrow5 (by decide)) (hrow5 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 11
        b := 4
        c := 0
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 1 4 (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 5 1 4 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 0 4 11 (hrow0 (by decide)) (hrow0 (by decide))
        cb_cy := EdgeClosure.row 0 4 5 (hrow0 (by decide)) (hrow0 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV3Cell7 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
