/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 second positive cut

This file turns the source32-seeded mixed-v7 cell-8 survivor into one
proof-carrying `SourceOrderPositiveNogood`.  Although the discovery certificate
listed three convex-five-point cores and eight selected rows, two of those
cores already cover every frozen source order and require only five rows.

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

/-- The five selected rows retained from the source32 cell-8 survivor. -/
def mixedV7Cell8SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 3, 4, 6} }
  , { center := 1, support := {0, 2, 6, 8} }
  , { center := 7, support := {1, 6, 8, 10} }
  , { center := 8, support := {4, 6, 9, 11} }
  , { center := 10, support := {0, 1, 7, 8} } ]

/-- Two of the source32 cell-8 cores cover both directions of the forced
second-cap order in both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 10 1 7 6 ∨
      CommonFiveOrientationAt order.position 4 0 6 1 8 := by
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
      have h4 := hdirect.surplus_between 4 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega

/-- The five positive selected rows from the source32 cell-8 survivor force
one of two convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({1, 3, 4, 6} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 3, 4, 6} } : RowChoice Label)
        (by simp [mixedV7Cell8SecondPositiveChoices])
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8SecondPositiveChoices])
    have hrow7 : ({1, 6, 8, 10} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 6, 8, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8SecondPositiveChoices])
    have hrow8 : ({4, 6, 9, 11} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {4, 6, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8SecondPositiveChoices])
    have hrow10 : ({0, 1, 7, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 7, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 10
        b := 1
        c := 7
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 0 1 (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.trans (EdgeClosure.flip 6 0)
          (EdgeClosure.trans
            (EdgeClosure.row 0 6 1 (hrow0 (by decide)) (hrow0 (by decide)))
            (EdgeClosure.trans (EdgeClosure.flip 0 1)
              (EdgeClosure.trans
                (EdgeClosure.row 1 0 6 (hrow1 (by decide)) (hrow1 (by decide)))
                (EdgeClosure.flip 1 6))))
        cb_cx := EdgeClosure.row 7 1 10 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 1 6 (hrow7 (by decide)) (hrow7 (by decide)) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 0
        b := 6
        c := 1
        y := 8
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 4 6 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 8 4 6 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cx := EdgeClosure.row 1 6 0 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cy := EdgeClosure.row 1 6 8 (hrow1 (by decide)) (hrow1 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Second hforced with hA | hC
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreC hC

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
