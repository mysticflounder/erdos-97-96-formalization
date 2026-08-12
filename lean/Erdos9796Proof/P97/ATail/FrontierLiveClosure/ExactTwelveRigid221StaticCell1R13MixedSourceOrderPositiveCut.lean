/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221KalmansonConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderCoverage
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 r13 mixed source-order cut

The fresh r13 survivor after eager installation of the 73-entry source-order
bank has complete coverage of all 48 source-entitled frozen boundary orders.
Two convex-five cores, one selected-row Kalmanson core, and the two
orientations of one shared-late-pair core provide the covering alternatives.

This is one finite learned cut. It is not terminal UNSAT, all-cell coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The seven selected rows used by the minimized live r13 cell-1 survivor cut. -/
def staticCell1R13MixedPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 2, 3, 4} }
  , { center := 2, support := {0, 1, 10, 11} }
  , { center := 3, support := {0, 1, 4, 5} }
  , { center := 4, support := {0, 3, 5, 7} }
  , { center := 5, support := {0, 7, 9, 10} }
  , { center := 10, support := {3, 5, 8, 11} }
  , { center := 11, support := {2, 5, 8, 9} } ]

private theorem FrozenBoundaryOrder.position_ne_of_ne_staticCell1R13Mixed
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

set_option maxHeartbeats 2000000 in
/-- The five metric alternatives cover all 48 frozen source orders. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1R13Mixed
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 7 4 0 3 5 ∨
      CommonFiveOrientationAt order.position 7 5 0 3 4 ∨
      KalmansonOrderAt order.position 0 2 4 3 1 ∨
      SharedLatePairOrderAt order.position 10 11 5 8 ∨
      SharedLatePairOrderAt order.position 11 10 5 8 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_staticCell1R13Mixed (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1R13Mixed (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_staticCell1R13Mixed (by decide)
  have h10ne11 : order.position 10 ≠ order.position 11 :=
    order.position_ne_of_ne_staticCell1R13Mixed (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  change (order.index 10).val ≠ (order.index 11).val at h10ne11
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        SharedLatePairOrderAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- The r13 positive rows refute every frozen source order. -/
def staticCell1R13MixedPositiveNogood : SourceOrderPositiveNogood where
  choices := staticCell1R13MixedPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced hconv hpositive
    have hrow0 : ({1, 2, 3, 4} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 2, 3, 4} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow2 : ({0, 1, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 1, 10, 11} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow3 : ({0, 1, 4, 5} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 5} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow4 : ({0, 3, 5, 7} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 3, 5, 7} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow5 : ({0, 7, 9, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 7, 9, 10} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow10 : ({3, 5, 8, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {3, 5, 8, 11} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    have hrow11 : ({2, 5, 8, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {2, 5, 8, 9} } : RowChoice Label)
        (by simp [staticCell1R13MixedPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 7
        x := 4
        b := 0
        c := 3
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 7 0
          (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 5 7 0
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 3 0 4
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 0 5
          (hrow3 (by decide)) (hrow3 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 7
        x := 5
        b := 0
        c := 3
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 7 0
          (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 4 7 0
          (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 3 0 5
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 0 4
          (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.sourceOrderCoverage_staticCell1R13Mixed hforced with
      hA | hB | hK | hS | hS
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · rcases hK with ⟨h02, h24, h43, h31⟩
      exact order.false_of_selectedRowsKalmanson hreal hconv
        0 2 4 3 1 h02 h24 h43 h31
        (hrow4 (by decide)) (hrow4 (by decide))
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow2 (by decide)) (hrow2 (by decide))
    · rcases hS with ⟨h10_11, h11_5, h5_8⟩
      exact order.false_of_twoRowsSharedLatePair hreal hconv
        10 11 5 8 h10_11 h11_5 h5_8
        (hrow10 (by decide)) (hrow10 (by decide))
        (hrow11 (by decide)) (hrow11 (by decide))
    · rcases hS with ⟨h11_10, h10_5, h5_8⟩
      exact order.false_of_twoRowsSharedLatePair hreal hconv
        11 10 5 8 h11_10 h10_5 h5_8
        (hrow11 (by decide)) (hrow11 (by decide))
        (hrow10 (by decide)) (hrow10 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
