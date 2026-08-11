/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-6 second positive cut

This file turns the selected-row mixed-v6 cell-6 second survivor into one
proof-carrying `SourceOrderPositiveNogood`.  The two detector-minimal
convex-five-point cores cover all frozen source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The six detector-minimal rows used by the mixed-v6 cell-6 second cut. -/
def mixedV6Cell6SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {2, 6, 7, 10} }
  , { center := 4, support := {1, 2, 8, 10} }
  , { center := 6, support := {1, 2, 4, 11} }
  , { center := 7, support := {1, 3, 6, 8} }
  , { center := 9, support := {0, 1, 4, 7} } ]

/-- The two detector-minimal cell-6 second cores cover both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell6Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 2 6 3 7 ∨
      CommonFiveOrientationAt order.position 8 4 1 9 7 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
          (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
          (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      omega
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      omega

/-- The selected rows force one of the two detector-minimal convex-five-point cores. -/
def mixedV6Cell6SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell6SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    have hrow3 : ({2, 6, 7, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {2, 6, 7, 10} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    have hrow4 : ({1, 2, 8, 10} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 8, 10} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    have hrow6 : ({1, 2, 4, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {1, 2, 4, 11} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    have hrow7 : ({1, 3, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 3, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    have hrow9 : ({0, 1, 4, 7} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 1, 4, 7} } : RowChoice Label)
        (by simp [mixedV6Cell6SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 2
        b := 6
        c := 3
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.trans (EdgeClosure.flip 2 1)
          (EdgeClosure.trans
            (EdgeClosure.row 1 2 6 (hrow1 (by decide)) (hrow1 (by decide)))
            (EdgeClosure.trans (EdgeClosure.flip 1 6)
              (EdgeClosure.trans
                (EdgeClosure.row 6 1 2 (hrow6 (by decide)) (hrow6 (by decide)))
                (EdgeClosure.flip 6 2))))
        ya_yb := EdgeClosure.row 7 1 6 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 3 6 2 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 6 7 (hrow3 (by decide)) (hrow3 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 8
        x := 4
        b := 1
        c := 9
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 8 1 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 7 8 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 9 1 4 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 1 7 (hrow9 (by decide)) (hrow9 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV6Cell6Second hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
