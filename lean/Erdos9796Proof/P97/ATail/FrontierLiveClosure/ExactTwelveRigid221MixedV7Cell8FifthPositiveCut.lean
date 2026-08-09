/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 fifth positive cut

The source35-seeded cell-8 survivor contains three positive selected rows that
force one convex-five-point core.  That core has a common orientation in both
frozen boundary orders.

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

/-- The three selected rows used by the source35 cell-8 survivor cut. -/
def mixedV7Cell8FifthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 4, support := {0, 2, 7, 10} }
  , { center := 9, support := {1, 2, 4, 11} } ]

/-- The source35 cell-8 core has a common orientation in both frozen boundary
orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fifth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 1 2 9 4 := by
  exact order.commonOrientation_core_0_1_2_9_4

/-- The three positive rows from the source35 cell-8 survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8FifthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8FifthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8FifthPositiveChoices])
    have hrow4 : ({0, 2, 7, 10} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 2, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8FifthPositiveChoices])
    have hrow9 : ({1, 2, 4, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 2, 4, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FifthPositiveChoices])
    exact false_of_threeRows_core_0_1_2_9_4 hreal order
      (hrow1 (by decide)) (hrow1 (by decide))
      (hrow4 (by decide)) (hrow4 (by decide))
      (hrow9 (by decide)) (hrow9 (by decide)) (hrow9 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
