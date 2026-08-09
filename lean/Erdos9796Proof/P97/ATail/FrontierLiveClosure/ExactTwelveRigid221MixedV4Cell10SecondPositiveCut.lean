/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-10 second positive cut

The post-bank cell-10 survivor contains two convex-five-point equality cores.
The forced second-cap order selects one core in each frozen boundary
orientation, yielding a five-row proof-carrying source-order nogood.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five selected rows used by the second mixed-v4 cell-10 cut. -/
def mixedV4Cell10SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 5, 8} }
  , { center := 5, support := {0, 1, 6, 9} }
  , { center := 6, support := {0, 3, 4, 9} }
  , { center := 8, support := {3, 5, 6, 9} }
  , { center := 9, support := {2, 4, 8, 10} } ]

/-- The two cell-10 cores cover both directions of the forced second cap in
both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell10Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 5 9 8 6 ∨
      CommonFiveOrientationAt order.position 8 0 4 6 9 := by
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
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · right
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega
    · left
      unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega

/-- Five positive selected rows from the second mixed-v4 cell-10 survivor
force one of two convex five-point equality cores. -/
def mixedV4Cell10SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell10SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({3, 4, 5, 8} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 4, 5, 8} } : RowChoice Label)
        (by simp [mixedV4Cell10SecondPositiveChoices])
    have hrow5 : ({0, 1, 6, 9} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 1, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell10SecondPositiveChoices])
    have hrow6 : ({0, 3, 4, 9} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 3, 4, 9} } : RowChoice Label)
        (by simp [mixedV4Cell10SecondPositiveChoices])
    have hrow8 : ({3, 5, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {3, 5, 6, 9} } : RowChoice Label)
        (by simp [mixedV4Cell10SecondPositiveChoices])
    have hrow9 : ({2, 4, 8, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 4, 8, 10} } : RowChoice Label)
        (by simp [mixedV4Cell10SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 5
        b := 9
        c := 8
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 0 9 (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 6 0 9 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := EdgeClosure.row 8 9 5 (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 9 6 (hrow8 (by decide)) (hrow8 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 8
        x := 0
        b := 4
        c := 6
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 8 4 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 9 8 4 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 6 4 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 4 9 (hrow6 (by decide)) (hrow6 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV4Cell10Second hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
