/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twentieth positive cut

The source-51 cut targets the source-50-seeded cell-8 survivor. Three positive
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

/-- The three selected rows used by the source-51 cut. -/
def mixedV7Cell8TwentiethPositiveChoices : List (RowChoice Label) :=
  [ { center := 4, support := {0, 1, 7, 9} }
  , { center := 5, support := {0, 2, 3, 7} }
  , { center := 6, support := {0, 4, 5, 10} } ]

/-- The frozen boundary blocks and forced second-cap direction give the
source-50-seeded cell-8 core a common orientation. -/
theorem FrozenBoundaryOrder.commonOrientation_core_7_4_0_6_5
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 7 4 0 6 5 := by
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
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    rcases hforced with hforward | hreverse <;> omega

/-- Three positive rows from the source-50-seeded survivor force a
convex-five-point equality core in every frozen source order. -/
def mixedV7Cell8TwentiethPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwentiethPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow4 : ({0, 1, 7, 9} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 1, 7, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentiethPositiveChoices])
    have hrow5 : ({0, 2, 3, 7} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 2, 3, 7} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentiethPositiveChoices])
    have hrow6 : ({0, 4, 5, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 4, 5, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8TwentiethPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 7
        x := 4
        b := 0
        c := 6
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 7 0 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 5 7 0 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 6 0 4 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 0 5 (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientation_core_7_4_0_6_5 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
