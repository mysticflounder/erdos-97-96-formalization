/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 ninth positive cut

The source-40 cut targets the authenticated source-39-seeded cell-8 survivor.
Three positive selected rows force the ordered-cut-4669 convex-five-point core
in every source-entitled frozen boundary order.

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

/-- The three selected rows used by the source-40 cut. -/
def mixedV7Cell8NinthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 9, support := {0, 2, 4, 5} }
  , { center := 10, support := {0, 1, 4, 9} } ]

/-- The source-40 core has the same boundary-order shape as ordered cut 4669. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Ninth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 9 0 10 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- The three positive rows from the authenticated source-39-seeded survivor
force a convex-five-point equality core in every frozen boundary order. -/
def mixedV7Cell8NinthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8NinthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8NinthPositiveChoices])
    have hrow9 : ({0, 2, 4, 5} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 4, 5} } : RowChoice Label)
        (by simp [mixedV7Cell8NinthPositiveChoices])
    have hrow10 : ({0, 1, 4, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 4, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8NinthPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 9
        b := 0
        c := 10
        y := 1
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 2 0 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 1 2 0 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cx := EdgeClosure.row 10 0 9 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 0 1 (hrow10 (by decide)) (hrow10 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV7Cell8Ninth

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
