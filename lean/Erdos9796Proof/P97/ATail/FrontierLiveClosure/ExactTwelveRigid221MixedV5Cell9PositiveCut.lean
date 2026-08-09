/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v5 cell-9 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v5 cell-9 survivor into one proof-carrying `SourceOrderPositiveNogood`.
Each core covers twelve forward and twelve reverse source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five selected rows used by the mixed-v5 cell-9 survivor cut. -/
def mixedV5Cell9PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {1, 9, 10, 11} }
  , { center := 6, support := {0, 2, 3, 5} }
  , { center := 9, support := {1, 2, 5, 6} }
  , { center := 10, support := {1, 4, 5, 8} } ]

/-- The two cell-9 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell9
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 2 9 6 ∨
      CommonFiveOrientationAt order.position 5 9 1 3 10 := by
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
  have h03 := hne (a := (0 : Label)) (b := 3) (by decide)
  have h05 := hne (a := (0 : Label)) (b := 5) (by decide)
  have h06 := hne (a := (0 : Label)) (b := 6) (by decide)
  have h09 := hne (a := (0 : Label)) (b := 9) (by decide)
  have h010 := hne (a := (0 : Label)) (b := 10) (by decide)
  have h12 := hne (a := (1 : Label)) (b := 2) (by decide)
  have h13 := hne (a := (1 : Label)) (b := 3) (by decide)
  have h15 := hne (a := (1 : Label)) (b := 5) (by decide)
  have h16 := hne (a := (1 : Label)) (b := 6) (by decide)
  have h19 := hne (a := (1 : Label)) (b := 9) (by decide)
  have h110 := hne (a := (1 : Label)) (b := 10) (by decide)
  have h23 := hne (a := (2 : Label)) (b := 3) (by decide)
  have h25 := hne (a := (2 : Label)) (b := 5) (by decide)
  have h26 := hne (a := (2 : Label)) (b := 6) (by decide)
  have h29 := hne (a := (2 : Label)) (b := 9) (by decide)
  have h210 := hne (a := (2 : Label)) (b := 10) (by decide)
  have h35 := hne (a := (3 : Label)) (b := 5) (by decide)
  have h36 := hne (a := (3 : Label)) (b := 6) (by decide)
  have h39 := hne (a := (3 : Label)) (b := 9) (by decide)
  have h310 := hne (a := (3 : Label)) (b := 10) (by decide)
  have h56 := hne (a := (5 : Label)) (b := 6) (by decide)
  have h59 := hne (a := (5 : Label)) (b := 9) (by decide)
  have h510 := hne (a := (5 : Label)) (b := 10) (by decide)
  have h69 := hne (a := (6 : Label)) (b := 9) (by decide)
  have h610 := hne (a := (6 : Label)) (b := 10) (by decide)
  have h910 := hne (a := (9 : Label)) (b := 10) (by decide)
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

/-- The five positive selected rows at the mixed-v5 cell-9 survivor force one
of two convex-five-point equality cores. -/
def mixedV5Cell9PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV5Cell9PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV5Cell9PositiveChoices])
    have hrow3 : ({1, 9, 10, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 9, 10, 11} } : RowChoice Label)
        (by simp [mixedV5Cell9PositiveChoices])
    have hrow6 : ({0, 2, 3, 5} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 3, 5} } : RowChoice Label)
        (by simp [mixedV5Cell9PositiveChoices])
    have hrow9 : ({1, 2, 5, 6} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 2, 5, 6} } : RowChoice Label)
        (by simp [mixedV5Cell9PositiveChoices])
    have hrow10 : ({1, 4, 5, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {1, 4, 5, 8} } : RowChoice Label)
        (by simp [mixedV5Cell9PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 2
        c := 9
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 6 0 2 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := EdgeClosure.row 9 2 1 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 2 6 (hrow9 (by decide)) (hrow9 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 9
        b := 1
        c := 3
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 5 1 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 10 5 1 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 3 1 9 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 1 10 (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV5Cell9 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
