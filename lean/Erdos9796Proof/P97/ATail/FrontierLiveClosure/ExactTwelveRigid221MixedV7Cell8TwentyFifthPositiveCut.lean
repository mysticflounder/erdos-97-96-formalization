/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twenty-fifth positive cut

The source-56 cut targets the authenticated source-55-seeded cell-8 survivor.
Seven positive incidences in three selected rows force the
cardinality-independent `(5,9,0,10,4)` five-point core.

This is one finite learned cut. It does not prove terminal UNSAT, all-cell
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

/-- The three selected rows used by the source-56 cut. -/
def mixedV7Cell8TwentyFifthPositiveChoices : List (RowChoice Label) :=
  [ { center := 4, support := {0, 1, 5, 6} }
  , { center := 9, support := {0, 2, 4, 5} }
  , { center := 10, support := {0, 4, 7, 9} } ]

/-- The source-56 core has one common orientation in both frozen boundary
block orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8TwentyFifth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 5 9 0 10 4 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- Three positive rows from the authenticated source-55-seeded survivor force
a convex-five-point equality core in every frozen boundary order. -/
def mixedV7Cell8TwentyFifthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwentyFifthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow4 : ({0, 1, 5, 6} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 1, 5, 6} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFifthPositiveChoices])
    have hrow9 : ({0, 2, 4, 5} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 4, 5} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFifthPositiveChoices])
    have hrow10 : ({0, 4, 7, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 4, 7, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFifthPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 9
        b := 0
        c := 10
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 5 0 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 4 5 0 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 10 0 9 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 0 4 (hrow10 (by decide)) (hrow10 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV7Cell8TwentyFifth

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
