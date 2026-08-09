/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-4 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v4 cell-4 survivor into one proof-carrying `SourceOrderPositiveNogood`.
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

/-- The five selected rows used by the mixed-v4 cell-4 survivor cut. -/
def mixedV4Cell4PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {2, 4, 8, 10} }
  , { center := 4, support := {2, 3, 6, 11} }
  , { center := 7, support := {1, 3, 6, 8} }
  , { center := 8, support := {1, 4, 6, 9} } ]

/-- The two cell-4 cores cover both frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 2 1 6 8 4 ∨
      CommonFiveOrientationAt order.position 2 1 8 7 3 := by
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
  have h12 := hne (a := (1 : Label)) (b := 2) (by decide)
  have h13 := hne (a := (1 : Label)) (b := 3) (by decide)
  have h14 := hne (a := (1 : Label)) (b := 4) (by decide)
  have h16 := hne (a := (1 : Label)) (b := 6) (by decide)
  have h17 := hne (a := (1 : Label)) (b := 7) (by decide)
  have h18 := hne (a := (1 : Label)) (b := 8) (by decide)
  have h23 := hne (a := (2 : Label)) (b := 3) (by decide)
  have h24 := hne (a := (2 : Label)) (b := 4) (by decide)
  have h26 := hne (a := (2 : Label)) (b := 6) (by decide)
  have h27 := hne (a := (2 : Label)) (b := 7) (by decide)
  have h28 := hne (a := (2 : Label)) (b := 8) (by decide)
  have h34 := hne (a := (3 : Label)) (b := 4) (by decide)
  have h36 := hne (a := (3 : Label)) (b := 6) (by decide)
  have h37 := hne (a := (3 : Label)) (b := 7) (by decide)
  have h38 := hne (a := (3 : Label)) (b := 8) (by decide)
  have h46 := hne (a := (4 : Label)) (b := 6) (by decide)
  have h47 := hne (a := (4 : Label)) (b := 7) (by decide)
  have h48 := hne (a := (4 : Label)) (b := 8) (by decide)
  have h67 := hne (a := (6 : Label)) (b := 7) (by decide)
  have h68 := hne (a := (6 : Label)) (b := 8) (by decide)
  have h78 := hne (a := (7 : Label)) (b := 8) (by decide)
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

/-- The five positive selected rows at the mixed-v4 cell-4 survivor force one
of the two convex five-point equality cores, contradicting either frozen
boundary order. -/
def mixedV4Cell4PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell4PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV4Cell4PositiveChoices])
    have hrow3 : ({2, 4, 8, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {2, 4, 8, 10} } : RowChoice Label)
        (by simp [mixedV4Cell4PositiveChoices])
    have hrow4 : ({2, 3, 6, 11} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {2, 3, 6, 11} } : RowChoice Label)
        (by simp [mixedV4Cell4PositiveChoices])
    have hrow7 : ({1, 3, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 3, 6, 8} } : RowChoice Label)
        (by simp [mixedV4Cell4PositiveChoices])
    have hrow8 : ({1, 4, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {1, 4, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell4PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 6
        c := 8
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 6 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 4 2 6 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 8 6 1 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 6 4 (hrow8 (by decide)) (hrow8 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 8
        c := 7
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 8 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 3 2 8 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 7 8 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 8 3 (hrow7 (by decide)) (hrow7 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV4Cell4 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
