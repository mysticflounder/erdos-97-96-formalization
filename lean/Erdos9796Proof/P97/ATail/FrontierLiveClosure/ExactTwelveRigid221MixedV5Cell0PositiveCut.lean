/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v5 cell-0 positive cut

This file turns the two convex-five-point certificates replayed by the
mixed-v5 cell-0 survivor into one proof-carrying `SourceOrderPositiveNogood`.
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

/-- The five selected rows used by the mixed-v5 cell-0 survivor cut. -/
def mixedV5Cell0PositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {2, 5, 6, 11} }
  , { center := 4, support := {1, 2, 3, 8} }
  , { center := 6, support := {1, 2, 4, 9} }
  , { center := 9, support := {3, 4, 7, 11} }
  , { center := 11, support := {0, 2, 3, 4} } ]

/-- The two cell-0 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell0
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 2 4 3 9 11 ∨
      CommonFiveOrientationAt order.position 4 6 2 3 11 := by
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
  have h23 := hne (a := (2 : Label)) (b := 3) (by decide)
  have h24 := hne (a := (2 : Label)) (b := 4) (by decide)
  have h26 := hne (a := (2 : Label)) (b := 6) (by decide)
  have h29 := hne (a := (2 : Label)) (b := 9) (by decide)
  have h211 := hne (a := (2 : Label)) (b := 11) (by decide)
  have h34 := hne (a := (3 : Label)) (b := 4) (by decide)
  have h36 := hne (a := (3 : Label)) (b := 6) (by decide)
  have h39 := hne (a := (3 : Label)) (b := 9) (by decide)
  have h311 := hne (a := (3 : Label)) (b := 11) (by decide)
  have h46 := hne (a := (4 : Label)) (b := 6) (by decide)
  have h49 := hne (a := (4 : Label)) (b := 9) (by decide)
  have h411 := hne (a := (4 : Label)) (b := 11) (by decide)
  have h69 := hne (a := (6 : Label)) (b := 9) (by decide)
  have h611 := hne (a := (6 : Label)) (b := 11) (by decide)
  have h911 := hne (a := (9 : Label)) (b := 11) (by decide)
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

/-- The five positive selected rows at the mixed-v5 cell-0 survivor force one
of two convex-five-point equality cores. -/
def mixedV5Cell0PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV5Cell0PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({2, 5, 6, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {2, 5, 6, 11} } : RowChoice Label)
        (by simp [mixedV5Cell0PositiveChoices])
    have hrow4 : ({1, 2, 3, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 3, 8} } : RowChoice Label)
        (by simp [mixedV5Cell0PositiveChoices])
    have hrow6 : ({1, 2, 4, 9} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {1, 2, 4, 9} } : RowChoice Label)
        (by simp [mixedV5Cell0PositiveChoices])
    have hrow9 : ({3, 4, 7, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {3, 4, 7, 11} } : RowChoice Label)
        (by simp [mixedV5Cell0PositiveChoices])
    have hrow11 : ({0, 2, 3, 4} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {0, 2, 3, 4} } : RowChoice Label)
        (by simp [mixedV5Cell0PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 4
        b := 3
        c := 9
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 2 3 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 11 2 3 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 9 3 4 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 3 11 (hrow9 (by decide)) (hrow9 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 6
        b := 2
        c := 3
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 4 2 (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 11 4 2 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 3 2 6 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 2 11 (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV5Cell0 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
