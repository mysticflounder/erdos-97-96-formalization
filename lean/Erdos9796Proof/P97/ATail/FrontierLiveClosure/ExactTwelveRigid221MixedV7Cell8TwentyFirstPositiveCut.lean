/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twenty-first positive cut

The source-52 cut targets the source-51-seeded cell-8 survivor. Three positive
selected rows force one convex-five-point core in every frozen source order.

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

/-- The three selected rows used by the source-52 cut. -/
def mixedV7Cell8TwentyFirstPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 3, 4, 11} }
  , { center := 3, support := {1, 2, 4, 9} }
  , { center := 4, support := {1, 2, 5, 8} } ]

/-- Both frozen boundary blocks give the source-51-seeded cell-8 core the same
common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_1_3_2_0_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (_hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 3 2 0 4 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    omega

/-- Three positive rows from the source-51-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8TwentyFirstPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwentyFirstPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({2, 3, 4, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 3, 4, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFirstPositiveChoices])
    have hrow3 : ({1, 2, 4, 9} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 4, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFirstPositiveChoices])
    have hrow4 : ({1, 2, 5, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 5, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyFirstPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 3
        b := 2
        c := 0
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 1 2 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 4 1 2 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 0 2 3 (hrow0 (by decide)) (hrow0 (by decide))
        cb_cy := EdgeClosure.row 0 2 4 (hrow0 (by decide)) (hrow0 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_1_3_2_0_4 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
