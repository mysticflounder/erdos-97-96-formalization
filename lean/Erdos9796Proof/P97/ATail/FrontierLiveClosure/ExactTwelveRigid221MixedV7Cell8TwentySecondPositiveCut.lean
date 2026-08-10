/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twenty-second positive cut

The source-53 cut targets the source-52-seeded cell-8 survivor. Three positive
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

/-- The three selected rows used by the source-53 cut. -/
def mixedV7Cell8TwentySecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 4, 6, 9} }
  , { center := 7, support := {1, 3, 6, 8} }
  , { center := 8, support := {5, 6, 9, 11} } ]

/-- Both frozen boundary blocks give the source-52-seeded cell-8 core the same
common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_9_3_6_7_8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 9 3 6 7 8 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- Three positive rows from the source-52-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8TwentySecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwentySecondPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({1, 4, 6, 9} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 4, 6, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentySecondPositiveChoices])
    have hrow7 : ({1, 3, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 3, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentySecondPositiveChoices])
    have hrow8 : ({5, 6, 9, 11} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {5, 6, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentySecondPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 9
        x := 3
        b := 6
        c := 7
        y := 8
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 9 6 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 8 9 6 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cx := EdgeClosure.row 7 6 3 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 6 8 (hrow7 (by decide)) (hrow7 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_9_3_6_7_8 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
