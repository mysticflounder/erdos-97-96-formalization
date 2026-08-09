/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 fourteenth positive cut

The source-45 cut targets the authenticated source-44-seeded cell-8 survivor.
The three selected rows centered at `0`, `2`, and `10` instantiate the
source-block-only convex-five core `(11, 0, 3, 10, 2)`.

This is one finite learned cut. It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the source-45 cut. -/
def mixedV7Cell8FourteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 3, 5, 11} }
  , { center := 2, support := {3, 9, 10, 11} }
  , { center := 10, support := {0, 2, 3, 4} } ]

/-- The source blocks alone place the retained core in common orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fourteenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 11 0 3 10 2 :=
  order.commonOrientation_core_11_0_3_10_2

/-- Three positive selected rows from the source-44-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8FourteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8FourteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({2, 3, 5, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 3, 5, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FourteenthPositiveChoices])
    have hrow2 : ({3, 9, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {3, 9, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FourteenthPositiveChoices])
    have hrow10 : ({0, 2, 3, 4} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 2, 3, 4} } : RowChoice Label)
        (by simp [mixedV7Cell8FourteenthPositiveChoices])
    exact false_of_threeRows_core_11_0_3_10_2 hreal order
      (hrow0 (by decide)) (hrow0 (by decide))
      (hrow2 (by decide)) (hrow2 (by decide))
      (hrow10 (by decide)) (hrow10 (by decide)) (hrow10 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
