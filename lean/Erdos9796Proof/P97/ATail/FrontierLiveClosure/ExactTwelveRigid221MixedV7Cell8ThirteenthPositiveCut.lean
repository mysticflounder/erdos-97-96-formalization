/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 thirteenth positive cut

The source-44 cut targets the authenticated source-43-seeded cell-8 survivor.
Only the three selected rows centered at `0`, `1`, and `6` are needed: they
instantiate the source-block-only convex-five core `(3, 0, 2, 1, 6)`.

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

/-- The three selected rows used by the source-44 cut. -/
def mixedV7Cell8ThirteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 3, 5, 11} }
  , { center := 1, support := {0, 2, 6, 8} }
  , { center := 6, support := {0, 2, 3, 4} } ]

/-- The source blocks alone place the retained core in common orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Thirteenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 3 0 2 1 6 :=
  order.commonOrientation_core_3_0_2_1_6

/-- Three positive selected rows from the source-43-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8ThirteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8ThirteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({2, 3, 5, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 3, 5, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirteenthPositiveChoices])
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirteenthPositiveChoices])
    have hrow6 : ({0, 2, 3, 4} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 3, 4} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirteenthPositiveChoices])
    exact false_of_threeRows_core_3_0_2_1_6 hreal order
      (hrow0 (by decide)) (hrow0 (by decide))
      (hrow6 (by decide)) (hrow6 (by decide))
      (hrow1 (by decide)) (hrow1 (by decide)) (hrow1 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
