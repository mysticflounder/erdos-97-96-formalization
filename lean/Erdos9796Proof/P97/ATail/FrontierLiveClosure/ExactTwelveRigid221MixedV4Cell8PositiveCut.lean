/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-8 positive cut

This file turns the three-row convex-five-point core at the terminal survivor
of mixed-v4 schedule cell 8 into one proof-carrying
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

/-- The three selected rows needed by the mixed-v4 cell-8 survivor cut. -/
def mixedV4Cell8PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 5, 7, 10} }
  , { center := 2, support := {1, 7, 10, 11} }
  , { center := 3, support := {0, 2, 10, 11} } ]

/-- The cell-8 five-point core has one common orientation in either frozen
cap-block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_7_0_10_3_2
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 7 0 10 3 2 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h3 := hdirect.surplus_between 3 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h3 := hmirror.surplus_between 3 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive selected rows at the mixed-v4 cell-8 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV4Cell8PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell8PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({3, 5, 7, 10} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 5, 7, 10} } : RowChoice Label)
        (by simp [mixedV4Cell8PositiveChoices])
    have hrow2 : ({1, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {1, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell8PositiveChoices])
    have hrow3 : ({0, 2, 10, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 2, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell8PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 7
        x := 0
        b := 10
        c := 3
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 7 10
          (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 2 7 10
          (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 3 10 0
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 10 2
          (hrow3 (by decide)) (hrow3 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_7_0_10_3_2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
