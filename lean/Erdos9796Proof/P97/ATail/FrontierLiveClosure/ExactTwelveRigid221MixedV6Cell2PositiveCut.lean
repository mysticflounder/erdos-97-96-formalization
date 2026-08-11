/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-2 positive cut

This file turns the source25-seeded mixed-v6 cell-2 survivor into one
proof-carrying `SourceOrderPositiveNogood`.  The retained convex-five-point
core covers all frozen boundary orders of the selected second-opposite labels.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v6 cell-2 survivor cut. -/
def mixedV6Cell2PositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {0, 1, 4, 7} }
  , { center := 6, support := {0, 1, 5, 9} }
  , { center := 7, support := {1, 3, 6, 8} } ]

/-- The cell-2 core covers all frozen cap-block orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell2
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 6 1 7 3 := by
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      omega
  · rcases h67 with h67 | h76
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      omega

/-- The three positive selected rows from the mixed-v6 cell-2 survivor force
one of the two convex-five-point equality cores. -/
def mixedV6Cell2PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell2PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow3 : ({0, 1, 4, 7} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 7} } : RowChoice Label)
        (by simp [mixedV6Cell2PositiveChoices])
    have hrow6 : ({0, 1, 5, 9} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 1, 5, 9} } : RowChoice Label)
        (by simp [mixedV6Cell2PositiveChoices])
    have hrow7 : ({1, 3, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 3, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell2PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 6
        b := 1
        c := 7
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 0 1 (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 3 0 1 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 7 1 6 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 1 3 (hrow7 (by decide)) (hrow7 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV6Cell2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
