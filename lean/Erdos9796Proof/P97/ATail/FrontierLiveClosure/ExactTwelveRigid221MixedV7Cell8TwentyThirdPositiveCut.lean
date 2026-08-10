/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twenty-third positive cut

The source-54 cut targets the source-53-seeded cell-8 survivor. Three positive
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

/-- The three selected rows used by the source-54 cut. -/
def mixedV7Cell8TwentyThirdPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 3, 5, 11} }
  , { center := 3, support := {1, 2, 4, 8} }
  , { center := 5, support := {1, 2, 3, 10} } ]

/-- Both frozen boundary blocks give the source-53-seeded cell-8 core the same
common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_1_3_2_0_5
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (_hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 3 2 0 5 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    omega

/-- Three positive rows from the source-53-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8TwentyThirdPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwentyThirdPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({2, 3, 5, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 3, 5, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyThirdPositiveChoices])
    have hrow3 : ({1, 2, 4, 8} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 4, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyThirdPositiveChoices])
    have hrow5 : ({1, 2, 3, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 2, 3, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentyThirdPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 3
        b := 2
        c := 0
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 1 2 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 5 1 2 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 0 2 3 (hrow0 (by decide)) (hrow0 (by decide))
        cb_cy := EdgeClosure.row 0 2 5 (hrow0 (by decide)) (hrow0 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_1_3_2_0_5 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
