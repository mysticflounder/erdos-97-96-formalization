/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-2 positive cut

This file turns the audited singleton core at the mixed-v4 cell-2 survivor
into one proof-carrying `SourceOrderPositiveNogood`.

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

/-- The full survivor supports needed by the mixed-v4 cell-2 positive cut. -/
def mixedV4Cell2PositiveChoices : List (RowChoice Label) :=
  [ { center := 6, support := {0, 1, 5, 9} }
  , { center := 7, support := {1, 6, 8, 10} }
  , { center := 10, support := {1, 3, 4, 5} } ]

/-- The audited five-point core has one common orientation in either frozen
cap-block order.  The forced direction is not needed for this cut. -/
theorem FrozenBoundaryOrder.commonOrientation_core_5_6_1_7_10
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 5 6 1 7 10 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive selected rows at the mixed-v4 cell-2 survivor force the
audited convex five-point equality core, contradicting either frozen boundary
order. -/
def mixedV4Cell2PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell2PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow6 : ({0, 1, 5, 9} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 1, 5, 9} } : RowChoice Label)
        (by simp [mixedV4Cell2PositiveChoices])
    have hrow7 : ({1, 6, 8, 10} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 6, 8, 10} } : RowChoice Label)
        (by simp [mixedV4Cell2PositiveChoices])
    have hrow10 : ({1, 3, 4, 5} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {1, 3, 4, 5} } : RowChoice Label)
        (by simp [mixedV4Cell2PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 6
        b := 1
        c := 7
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 5 1
          (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 10 5 1
          (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 7 1 6
          (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 1 10
          (hrow7 (by decide)) (hrow7 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_5_6_1_7_10

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
