/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v5 cell-11 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v5 cell-11 survivor into one proof-carrying `SourceOrderPositiveNogood`.
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

/-- The five selected rows used by the mixed-v5 cell-11 survivor cut. -/
def mixedV5Cell11PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {0, 2, 7, 10} }
  , { center := 4, support := {1, 2, 3, 5} }
  , { center := 8, support := {1, 3, 6, 9} }
  , { center := 11, support := {2, 3, 4, 8} } ]

/-- The two cell-11 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell11
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 2 4 3 ∨
      CommonFiveOrientationAt order.position 1 4 3 11 8 := by
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
  have h04 := hne (a := (0 : Label)) (b := 4) (by decide)
  have h08 := hne (a := (0 : Label)) (b := 8) (by decide)
  have h011 := hne (a := (0 : Label)) (b := 11) (by decide)
  have h12 := hne (a := (1 : Label)) (b := 2) (by decide)
  have h13 := hne (a := (1 : Label)) (b := 3) (by decide)
  have h14 := hne (a := (1 : Label)) (b := 4) (by decide)
  have h18 := hne (a := (1 : Label)) (b := 8) (by decide)
  have h111 := hne (a := (1 : Label)) (b := 11) (by decide)
  have h23 := hne (a := (2 : Label)) (b := 3) (by decide)
  have h24 := hne (a := (2 : Label)) (b := 4) (by decide)
  have h28 := hne (a := (2 : Label)) (b := 8) (by decide)
  have h211 := hne (a := (2 : Label)) (b := 11) (by decide)
  have h34 := hne (a := (3 : Label)) (b := 4) (by decide)
  have h38 := hne (a := (3 : Label)) (b := 8) (by decide)
  have h311 := hne (a := (3 : Label)) (b := 11) (by decide)
  have h48 := hne (a := (4 : Label)) (b := 8) (by decide)
  have h411 := hne (a := (4 : Label)) (b := 11) (by decide)
  have h811 := hne (a := (8 : Label)) (b := 11) (by decide)
  clear hne
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The five positive selected rows at the mixed-v5 cell-11 survivor force one
of two convex-five-point equality cores. -/
def mixedV5Cell11PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV5Cell11PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV5Cell11PositiveChoices])
    have hrow3 : ({0, 2, 7, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 2, 7, 10} } : RowChoice Label)
        (by simp [mixedV5Cell11PositiveChoices])
    have hrow4 : ({1, 2, 3, 5} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 3, 5} } : RowChoice Label)
        (by simp [mixedV5Cell11PositiveChoices])
    have hrow8 : ({1, 3, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {1, 3, 6, 9} } : RowChoice Label)
        (by simp [mixedV5Cell11PositiveChoices])
    have hrow11 : ({2, 3, 4, 8} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {2, 3, 4, 8} } : RowChoice Label)
        (by simp [mixedV5Cell11PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 2
        c := 4
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 3 0 2 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 4 2 1 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cy := EdgeClosure.row 4 2 3 (hrow4 (by decide)) (hrow4 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 4
        b := 3
        c := 11
        y := 8
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 1 3 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 8 1 3 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cx := EdgeClosure.row 11 3 4 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 3 8 (hrow11 (by decide)) (hrow11 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV5Cell11 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
