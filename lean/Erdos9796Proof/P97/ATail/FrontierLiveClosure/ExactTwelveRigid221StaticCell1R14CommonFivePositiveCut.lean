/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 r14 common-five cut

The live r14 survivor after eager installation of the 74-entry source-order
bank contains three positive selected rows that force the same convex-five-point
core used by the r9 cut.  The row centered at label `9` has a different selected
support, but still supplies the two incidences consumed by that core.

This is one finite learned cut. It is not terminal UNSAT, all-cell coverage, an
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

/-- The three selected rows used by the live r14 cell-1 survivor cut. -/
def staticCell1R14CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 5, support := {0, 7, 9, 10} }
  , { center := 7, support := {4, 6, 8, 10} }
  , { center := 9, support := {2, 4, 7, 10} } ]

/-- The frozen boundary blocks and forced second-cap direction give the r14
cell-1 core one common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_4_7_10_5_9_r14
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 4 7 10 5 9 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- The three positive rows from the live r14 survivor force the r9
convex-five-point equality core in every frozen source order. -/
def staticCell1R14CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1R14CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow5 : ({0, 7, 9, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 7, 9, 10} } : RowChoice Label)
        (by simp [staticCell1R14CommonFivePositiveChoices])
    have hrow7 : ({4, 6, 8, 10} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {4, 6, 8, 10} } : RowChoice Label)
        (by simp [staticCell1R14CommonFivePositiveChoices])
    have hrow9 : ({2, 4, 7, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 4, 7, 10} } : RowChoice Label)
        (by simp [staticCell1R14CommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 7
        b := 10
        c := 5
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 4 10
          (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 9 4 10
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 5 10 7
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cy := EdgeClosure.row 5 10 9
          (hrow5 (by decide)) (hrow5 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_4_7_10_5_9_r14 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
