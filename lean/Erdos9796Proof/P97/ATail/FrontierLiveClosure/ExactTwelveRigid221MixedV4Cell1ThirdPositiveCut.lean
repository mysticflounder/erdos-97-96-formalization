/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-1 third positive cut

The next post-bank cell-1 survivor contains two symmetric three-row
convex-five-point cores.  Their union covers both possible relative orders of
the second-opposite labels `6` and `7`, in either frozen boundary orientation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the third post-bank cell-1 survivor cut. -/
def mixedV4Cell1ThirdPositiveChoices : List (RowChoice Label) :=
  [ { center := 2, support := {1, 7, 10, 11} }
  , { center := 6, support := {2, 7, 9, 10} }
  , { center := 10, support := {1, 3, 6, 7} } ]

/-- Swapping the two witnesses covers both relative orders of labels `6` and
`7`, in both frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell1Third
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 2 7 6 10 ∨
      CommonFiveOrientationAt order.position 1 10 7 6 2 := by
  have h67 : order.position 6 < order.position 7 ∨
      order.position 7 < order.position 6 :=
    lt_or_gt_of_ne (fun heq => (by decide : (6 : Label) ≠ 7)
      (order.position_injective heq))
  change (order.index 6).val < (order.index 7).val ∨
    (order.index 7).val < (order.index 6).val at h67
  rcases order.blocks with hdirect | hmirror
  · rcases h67 with h67 | h76
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
  · rcases h67 with h67 | h76
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega

/-- Three positive selected rows from the third post-bank cell-1 survivor force
one of two symmetric convex-five-point equality cores. -/
def mixedV4Cell1ThirdPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell1ThirdPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow2 : ({1, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {1, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1ThirdPositiveChoices])
    have hrow6 : ({2, 7, 9, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {2, 7, 9, 10} } : RowChoice Label)
        (by simp [mixedV4Cell1ThirdPositiveChoices])
    have hrow10 : ({1, 3, 6, 7} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {1, 3, 6, 7} } : RowChoice Label)
        (by simp [mixedV4Cell1ThirdPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 2
        b := 7
        c := 6
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 1 7 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 10 1 7 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 6 7 2 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 7 10 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 10
        b := 7
        c := 6
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 1 7 (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 2 1 7 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 6 7 10 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 7 2 (hrow6 (by decide)) (hrow6 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV4Cell1Third with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
