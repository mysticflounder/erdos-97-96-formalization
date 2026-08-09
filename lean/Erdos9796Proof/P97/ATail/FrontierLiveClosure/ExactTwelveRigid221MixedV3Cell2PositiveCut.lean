/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v3 cell-2 positive cut

This file turns the three-row convex-five-point certificates found at the
terminal survivor of mixed-v3 schedule cell 2 into one proof-carrying
`SourceOrderPositiveNogood`.

It proves one finite learned cut.  It does not prove terminal UNSAT,
all-cell coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v3 cell-2 survivor cut. -/
def mixedV3Cell2PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {2, 6, 7, 11} }
  , { center := 4, support := {0, 1, 3, 6} } ]

/-- The cell-2 survivor has one of two common orientations in either frozen
cap-block order.  The alternatives account for the two possible orders of
the selected surplus labels in the source-order replay. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_core_2_6_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 3 6 4 1 ∨
      CommonFiveOrientationAt order.position 2 1 6 4 3 := by
  have h34 : order.position 3 ≠ order.position 4 := by
    intro heq
    exact (by decide : (3 : Label) ≠ 4) (order.position_injective heq)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive selected rows at the mixed-v3 cell-2 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV3Cell2PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV3Cell2PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV3Cell2PositiveChoices])
    have hrow3 : ({2, 6, 7, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {2, 6, 7, 11} } : RowChoice Label)
        (by simp [mixedV3Cell2PositiveChoices])
    have hrow4 : ({0, 1, 3, 6} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 1, 3, 6} } : RowChoice Label)
        (by simp [mixedV3Cell2PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 3
        b := 6
        c := 4
        y := 1
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 2 6
          (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 1 2 6
          (hrow1 (by decide)) (hrow1 (by decide))
        cb_cx := EdgeClosure.row 4 6 3
          (hrow4 (by decide)) (hrow4 (by decide))
        cb_cy := EdgeClosure.row 4 6 1
          (hrow4 (by decide)) (hrow4 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 6
        c := 4
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 6
          (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 3 2 6
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 4 6 1
          (hrow4 (by decide)) (hrow4 (by decide))
        cb_cy := EdgeClosure.row 4 6 3
          (hrow4 (by decide)) (hrow4 (by decide)) }
    rcases order.commonOrientationCoverage_core_2_6_4 with hcore | hcore
    · exact order.false_of_convexFivePointCore hreal coreA hcore
    · exact order.false_of_convexFivePointCore hreal coreB hcore

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
