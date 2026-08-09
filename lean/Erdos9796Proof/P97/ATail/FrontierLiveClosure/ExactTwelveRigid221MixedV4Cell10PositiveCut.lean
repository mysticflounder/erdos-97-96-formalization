/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-10 positive cut

The post-bank cell-10 survivor contains two convex-five-point equality cores.
The forced second-cap order selects one of the two cores in each frozen
boundary orientation, giving a proof-carrying positive selected-row nogood.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The six selected rows used by the mixed-v4 cell-10 survivor cut. -/
def mixedV4Cell10PositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {0, 5, 9, 10} }
  , { center := 4, support := {2, 3, 7, 8} }
  , { center := 5, support := {0, 4, 6, 9} }
  , { center := 6, support := {4, 7, 9, 11} }
  , { center := 8, support := {3, 5, 6, 9} }
  , { center := 9, support := {0, 2, 7, 10} } ]

/-- The two cell-10 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell10
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 2 4 7 6 9 ∨
      CommonFiveOrientationAt order.position 0 3 9 8 5 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega

/-- The six positive selected rows at the mixed-v4 cell-10 survivor force one
of two convex-five-point equality cores. -/
def mixedV4Cell10PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell10PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({0, 5, 9, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 5, 9, 10} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    have hrow4 : ({2, 3, 7, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {2, 3, 7, 8} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    have hrow5 : ({0, 4, 6, 9} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 4, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    have hrow6 : ({4, 7, 9, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {4, 7, 9, 11} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    have hrow8 : ({3, 5, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {3, 5, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    have hrow9 : ({0, 2, 7, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 7, 10} } : RowChoice Label)
        (by simp [mixedV4Cell10PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 4
        b := 7
        c := 6
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 2 7 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 9 2 7 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 6 7 4 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 7 9 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 3
        b := 9
        c := 8
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 0 9 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 5 0 9 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 8 9 3 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 9 5 (hrow8 (by decide)) (hrow8 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV4Cell10 hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
