/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-5 positive cut

This file turns a three-row convex-five-point core at the terminal survivor of
mixed-v4 schedule cell 5 into one proof-carrying `SourceOrderPositiveNogood`.

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

/-- The three selected rows needed by the mixed-v4 cell-5 survivor cut. -/
def mixedV4Cell5PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 3, 5, 7} }
  , { center := 5, support := {0, 1, 10, 11} }
  , { center := 10, support := {1, 3, 6, 9} } ]

/-- The cell-5 five-point core has one common orientation in either frozen
cap-block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_3_0_1_5_10
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 3 0 1 5 10 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive selected rows at the mixed-v4 cell-5 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV4Cell5PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell5PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({1, 3, 5, 7} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 3, 5, 7} } : RowChoice Label)
        (by simp [mixedV4Cell5PositiveChoices])
    have hrow5 : ({0, 1, 10, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 1, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell5PositiveChoices])
    have hrow10 : ({1, 3, 6, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {1, 3, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell5PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 0
        b := 1
        c := 5
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 3 1
          (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 10 3 1
          (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 5 1 0
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cy := EdgeClosure.row 5 1 10
          (hrow5 (by decide)) (hrow5 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_3_0_1_5_10

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
