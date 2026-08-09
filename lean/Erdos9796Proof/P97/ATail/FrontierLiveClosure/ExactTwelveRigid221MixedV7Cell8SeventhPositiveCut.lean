/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 seventh positive cut

The source-38 cut targets a source-37-seeded cell-8 survivor whose selected
rows at centers `4`, `5`, and `6` force one convex-five-point core.  That core
has a common orientation in both frozen boundary block orders.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the source-38 cut. -/
def mixedV7Cell8SeventhPositiveChoices : List (RowChoice Label) :=
  [ { center := 4, support := {0, 2, 7, 10} }
  , { center := 5, support := {0, 9, 10, 11} }
  , { center := 6, support := {3, 4, 5, 10} } ]

/-- The source-37-seeded cell-8 core has a common orientation in both frozen
boundary block orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Seventh
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 4 10 6 5 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- The three positive rows from the source-37-seeded cell-8 survivor force a
convex-five-point equality core in every frozen boundary order. -/
def mixedV7Cell8SeventhPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8SeventhPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow4 : ({0, 2, 7, 10} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 2, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventhPositiveChoices])
    have hrow5 : ({0, 9, 10, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 9, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventhPositiveChoices])
    have hrow6 : ({3, 4, 5, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {3, 4, 5, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventhPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 4
        b := 10
        c := 6
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 0 10
          (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 5 0 10
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 6 10 4
          (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 10 5
          (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV7Cell8Seventh

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
