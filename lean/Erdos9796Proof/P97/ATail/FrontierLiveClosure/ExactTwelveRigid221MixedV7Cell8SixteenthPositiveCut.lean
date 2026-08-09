/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 sixteenth positive cut

The source-47 cut targets the authenticated source-46-seeded cell-8 survivor.
The three selected rows centered at `1`, `3`, and `6` instantiate the
source-block-oriented convex-five core `(0, 6, 2, 3, 1)`.

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

/-- The three selected rows used by the source-47 cut. -/
def mixedV7Cell8SixteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {1, 2, 4, 6} }
  , { center := 6, support := {0, 2, 5, 7} } ]

/-- The source blocks alone place the retained core in common orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Sixteenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 6 2 3 1 :=
  order.commonOrientation_core_0_6_2_3_1

/-- Three positive selected rows from the source-46-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8SixteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8SixteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8SixteenthPositiveChoices])
    have hrow3 : ({1, 2, 4, 6} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 4, 6} } : RowChoice Label)
        (by simp [mixedV7Cell8SixteenthPositiveChoices])
    have hrow6 : ({0, 2, 5, 7} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 5, 7} } : RowChoice Label)
        (by simp [mixedV7Cell8SixteenthPositiveChoices])
    exact false_of_threeRows_core_0_6_2_3_1 hreal order
      (hrow6 (by decide)) (hrow6 (by decide))
      (hrow1 (by decide)) (hrow1 (by decide))
      (hrow3 (by decide)) (hrow3 (by decide)) (hrow3 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
