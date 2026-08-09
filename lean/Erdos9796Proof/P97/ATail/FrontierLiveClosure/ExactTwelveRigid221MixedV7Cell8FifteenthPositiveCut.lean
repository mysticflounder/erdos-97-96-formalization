/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221MixedV4Cell1PositiveCut

/-!
# Exact-twelve mixed-v7 cell-8 fifteenth positive cut

The source-46 cut targets the authenticated source-45-seeded cell-8 survivor.
The three selected rows centered at `0`, `2`, and `6` instantiate the previously
checked convex-five core `(11, 0, 3, 6, 2)`.

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

/-- The three selected rows used by the source-46 cut. -/
def mixedV7Cell8FifteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 9, 11} }
  , { center := 2, support := {0, 3, 10, 11} }
  , { center := 6, support := {0, 2, 3, 4} } ]

/-- The source blocks alone place the retained core in common orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fifteenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 11 0 3 6 2 :=
  order.commonOrientation_core_11_0_3_6_2

/-- Three positive selected rows from the source-45-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8FifteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8FifteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({3, 4, 9, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 4, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FifteenthPositiveChoices])
    have hrow2 : ({0, 3, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 3, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FifteenthPositiveChoices])
    have hrow6 : ({0, 2, 3, 4} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 3, 4} } : RowChoice Label)
        (by simp [mixedV7Cell8FifteenthPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 11
        x := 0
        b := 3
        c := 6
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 11 3 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 2 11 3 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 6 3 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 3 2 (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV7Cell8Fifteenth

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
