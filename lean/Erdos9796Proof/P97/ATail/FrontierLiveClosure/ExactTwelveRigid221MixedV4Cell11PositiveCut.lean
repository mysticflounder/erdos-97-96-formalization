/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-11 positive cut

This file turns the three-row convex-five-point core at the terminal survivor
of mixed-v4 schedule cell 11 into one proof-carrying
`SourceOrderPositiveNogood`.

It proves one finite learned cut.  It does not prove terminal UNSAT,
all-cell coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows needed by the mixed-v4 cell-11 survivor cut. -/
def mixedV4Cell11PositiveChoices : List (RowChoice Label) :=
  [ { center := 7, support := {1, 4, 6, 8} }
  , { center := 9, support := {0, 1, 5, 6} }
  , { center := 11, support := {4, 6, 7, 9} } ]

/-- The retained order of the second-opposite cap determines which common
orientation is used by the cell-11 core. -/
theorem FrozenBoundaryOrder.commonOrientation_core_1_7_6_11_9
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 7 6 11 9 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive selected rows at the mixed-v4 cell-11 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV4Cell11PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell11PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow7 : ({1, 4, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 4, 6, 8} } : RowChoice Label)
        (by simp [mixedV4Cell11PositiveChoices])
    have hrow9 : ({0, 1, 5, 6} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 1, 5, 6} } : RowChoice Label)
        (by simp [mixedV4Cell11PositiveChoices])
    have hrow11 : ({4, 6, 7, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {4, 6, 7, 9} } : RowChoice Label)
        (by simp [mixedV4Cell11PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 7
        b := 6
        c := 11
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 1 6
          (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 9 1 6
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 11 6 7
          (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 6 9
          (hrow11 (by decide)) (hrow11 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_1_7_6_11_9 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
