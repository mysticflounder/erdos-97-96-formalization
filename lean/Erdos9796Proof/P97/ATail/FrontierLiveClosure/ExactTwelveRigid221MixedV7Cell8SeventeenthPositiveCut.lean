/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 seventeenth positive cut

The source-48 cut targets the source-47-seeded cell-8 survivor. Five positive
selected rows force one of two convex-five-point cores, according to the forced
orientation of the second-opposite cap block.

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

/-- The five selected rows used by the source-48 cut. -/
def mixedV7Cell8SeventeenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {3, 6, 10, 11} }
  , { center := 5, support := {2, 8, 10, 11} }
  , { center := 7, support := {1, 5, 6, 8} }
  , { center := 8, support := {3, 4, 6, 9} } ]

/-- The forced direction of the second-opposite block selects one of the two
source-47-seeded cell-8 cores in either frozen boundary orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Seventeenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 3 2 6 1 8 ∨
      CommonFiveOrientationAt order.position 2 1 8 7 5 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      omega

/-- The five positive rows from the source-47-seeded survivor force one of two
convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8SeventeenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8SeventeenthPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventeenthPositiveChoices])
    have hrow2 : ({3, 6, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {3, 6, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventeenthPositiveChoices])
    have hrow5 : ({2, 8, 10, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {2, 8, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventeenthPositiveChoices])
    have hrow7 : ({1, 5, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 5, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventeenthPositiveChoices])
    have hrow8 : ({3, 4, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {3, 4, 6, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8SeventeenthPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 2
        b := 6
        c := 1
        y := 8
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 3 6 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 8 3 6 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cx := EdgeClosure.row 1 6 2 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cy := EdgeClosure.row 1 6 8 (hrow1 (by decide)) (hrow1 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 8
        c := 7
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 8 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 5 2 8 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 7 8 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 8 5 (hrow7 (by decide)) (hrow7 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Seventeenth hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
