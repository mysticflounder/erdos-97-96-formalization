/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 eleventh positive cut

The source-42 cut targets the authenticated source-41-seeded cell-8 survivor.
Its selected supports differ from source 41, but the same seven positive
incidences force the cardinality-independent `(2,9,0,10,1)` three-row core.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the source-42 cut. -/
def mixedV7Cell8EleventhPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 9, support := {0, 2, 5, 7} }
  , { center := 10, support := {0, 1, 7, 9} } ]

/-- The source-42 core is the membership-only ordered-cut-4669 obstruction. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eleventh
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 9 0 10 1 :=
  order.commonOrientation_core_2_9_0_10_1

/-- The three positive rows from the authenticated source-41-seeded survivor
force a convex-five-point equality core in every frozen boundary order. -/
def mixedV7Cell8EleventhPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8EleventhPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8EleventhPositiveChoices])
    have hrow9 : ({0, 2, 5, 7} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 5, 7} } : RowChoice Label)
        (by simp [mixedV7Cell8EleventhPositiveChoices])
    have hrow10 : ({0, 1, 7, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 7, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8EleventhPositiveChoices])
    exact false_of_threeRows_core_2_9_0_10_1 hreal order
      (hrow9 (by decide)) (hrow9 (by decide))
      (hrow1 (by decide)) (hrow1 (by decide))
      (hrow10 (by decide)) (hrow10 (by decide)) (hrow10 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
