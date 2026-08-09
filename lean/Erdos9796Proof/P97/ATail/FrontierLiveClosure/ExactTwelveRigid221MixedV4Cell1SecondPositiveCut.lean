/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-1 second positive cut

The post-bank mixed-v4 cell-1 survivor contains two symmetric three-row
convex-five-point cores.  Their union covers both possible orders of the first
opposite labels in either frozen boundary orientation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the post-bank cell-1 survivor cut. -/
def mixedV4Cell1SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 2, support := {1, 7, 10, 11} }
  , { center := 9, support := {2, 4, 10, 11} }
  , { center := 11, support := {1, 3, 4, 10} } ]

/-- Swapping the two witnesses covers both possible relative orders of labels
`10` and `11`, in both frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell1Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 2 10 9 11 ∨
      CommonFiveOrientationAt order.position 1 11 10 9 2 := by
  have h1011 : order.position 10 < order.position 11 ∨
      order.position 11 < order.position 10 :=
    lt_or_gt_of_ne (fun heq => (by decide : (10 : Label) ≠ 11)
      (order.position_injective heq))
  change (order.index 10).val < (order.index 11).val ∨
    (order.index 11).val < (order.index 10).val at h1011
  rcases order.blocks with hdirect | hmirror
  · rcases h1011 with h1011 | h1110
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases h1011 with h1011 | h1110
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- Three positive selected rows from the post-bank cell-1 survivor force one
of two symmetric convex-five-point equality cores. -/
def mixedV4Cell1SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell1SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow2 : ({1, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {1, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1SecondPositiveChoices])
    have hrow9 : ({2, 4, 10, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 4, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1SecondPositiveChoices])
    have hrow11 : ({1, 3, 4, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {1, 3, 4, 10} } : RowChoice Label)
        (by simp [mixedV4Cell1SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 2
        b := 10
        c := 9
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 1 10 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 11 1 10 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 9 10 2 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 10 11 (hrow9 (by decide)) (hrow9 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 11
        b := 10
        c := 9
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 1 10 (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 2 1 10 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 9 10 11 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 10 2 (hrow9 (by decide)) (hrow9 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV4Cell1Second with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
