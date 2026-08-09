/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 nineteenth positive cut

The source-50 cut targets the source-49-seeded cell-8 survivor. Three positive
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

/-- The three selected rows used by the source-50 cut. -/
def mixedV7Cell8NineteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 8, 9, 10} }
  , { center := 9, support := {0, 1, 3, 6} }
  , { center := 10, support := {0, 1, 7, 9} } ]

/-- The frozen boundary blocks and forced second-cap direction give the
source-49-seeded cell-8 core a common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_0_10_1_3_9
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 10 1 3 9 := by
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
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- Three positive rows from the source-49-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8NineteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8NineteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({1, 8, 9, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 8, 9, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8NineteenthPositiveChoices])
    have hrow9 : ({0, 1, 3, 6} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 1, 3, 6} } : RowChoice Label)
        (by simp [mixedV7Cell8NineteenthPositiveChoices])
    have hrow10 : ({0, 1, 7, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 7, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8NineteenthPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 10
        b := 1
        c := 3
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 0 1
          (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 9 0 1
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 3 1 10
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 1 9
          (hrow3 (by decide)) (hrow3 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_0_10_1_3_9 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
