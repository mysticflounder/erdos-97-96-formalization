/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve arm-static cell-6 common-five cut

The authenticated arm-static cell-6 canary is SAT, but three of its positive
selected rows force one convex-five-point core in every source-entitled frozen
boundary order.  This file promotes that finite obstruction to a checked
`SourceOrderPositiveNogood`.

This is one learned cut.  It is not terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the arm-static cell-6 survivor cut. -/
def armStaticCell6CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 5, support := {0, 7, 9, 11} }
  , { center := 6, support := {0, 3, 4, 7} }
  , { center := 9, support := {1, 5, 6, 7} } ]

/-- The frozen boundary blocks give the arm-static cell-6 core one common
orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_0_6_7_9_5_armStaticCell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 6 7 9 5 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive rows from the arm-static survivor force a
convex-five-point equality core in every frozen source order. -/
def armStaticCell6CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := armStaticCell6CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow5 : ({0, 7, 9, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 7, 9, 11} } : RowChoice Label)
        (by simp [armStaticCell6CommonFivePositiveChoices])
    have hrow6 : ({0, 3, 4, 7} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 3, 4, 7} } : RowChoice Label)
        (by simp [armStaticCell6CommonFivePositiveChoices])
    have hrow9 : ({1, 5, 6, 7} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 5, 6, 7} } : RowChoice Label)
        (by simp [armStaticCell6CommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 6
        b := 7
        c := 9
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 0 7
          (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 5 0 7
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 9 7 6
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 7 5
          (hrow9 (by decide)) (hrow9 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_0_6_7_9_5_armStaticCell6 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
