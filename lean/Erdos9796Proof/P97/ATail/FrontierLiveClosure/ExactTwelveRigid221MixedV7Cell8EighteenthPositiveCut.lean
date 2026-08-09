/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 eighteenth positive cut

The source-49 cut targets the source-48-seeded cell-8 survivor. Seven positive
selected rows force one of three convex-five-point cores in every frozen source
order.

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

/-- The seven selected rows used by the source-49 cut. -/
def mixedV7Cell8EighteenthPositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 8, 9, 11} }
  , { center := 5, support := {1, 2, 7, 10} }
  , { center := 7, support := {3, 5, 6, 8} }
  , { center := 8, support := {4, 6, 9, 11} }
  , { center := 9, support := {2, 3, 6, 11} }
  , { center := 10, support := {0, 1, 7, 9} }
  , { center := 11, support := {3, 5, 7, 10} } ]

/-- The frozen boundary blocks and forced second-cap direction select one of
the three source-48-seeded cell-8 cores. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eighteenth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 5 7 11 10 ∨
      CommonFiveOrientationAt order.position 6 7 3 11 9 ∨
        CommonFiveOrientationAt order.position 6 8 11 3 9 := by
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
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- The seven positive rows from the source-48-seeded survivor force one of
three convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8EighteenthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8EighteenthPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({1, 8, 9, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 8, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow5 : ({1, 2, 7, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 2, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow7 : ({3, 5, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {3, 5, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow8 : ({4, 6, 9, 11} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {4, 6, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow9 : ({2, 3, 6, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 3, 6, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow10 : ({0, 1, 7, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 7, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    have hrow11 : ({3, 5, 7, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {3, 5, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8EighteenthPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 5
        b := 7
        c := 11
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 1 7 (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 10 1 7
          (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 11 7 5
          (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 7 10
          (hrow11 (by decide)) (hrow11 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 6
        x := 7
        b := 3
        c := 11
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 6 3 (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 9 6 3 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 11 3 7
          (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy :=
          EdgeClosure.trans (EdgeClosure.flip 11 3)
            (EdgeClosure.trans
              (EdgeClosure.row 3 11 9 (hrow3 (by decide)) (hrow3 (by decide)))
              (EdgeClosure.trans (EdgeClosure.flip 3 9)
                (EdgeClosure.trans
                  (EdgeClosure.row 9 3 11
                    (hrow9 (by decide)) (hrow9 (by decide)))
                  (EdgeClosure.flip 9 11)))) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 6
        x := 8
        b := 11
        c := 3
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 8 6 11 (hrow8 (by decide)) (hrow8 (by decide))
        ya_yb := EdgeClosure.row 9 6 11 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 3 11 8 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 11 9 (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Eighteenth hforced with
      hA | hB | hC
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · exact order.false_of_convexFivePointCore hreal coreC hC

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
