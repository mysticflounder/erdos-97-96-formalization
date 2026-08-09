/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-2 second positive cut

The post-bank cell-2 survivor contains a three-row convex-five-point core
whose common orientation holds in both frozen boundary orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the second mixed-v4 cell-2 cut. -/
def mixedV4Cell2SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 4, support := {2, 3, 7, 8} }
  , { center := 5, support := {1, 4, 8, 11} } ]

/-- The cell-2 core has one common orientation in either frozen cap-block
order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_2_4_8_5_1
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 4 8 5 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    omega

/-- Three positive selected rows from the second mixed-v4 cell-2 survivor
force a convex five-point equality core. -/
def mixedV4Cell2SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell2SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV4Cell2SecondPositiveChoices])
    have hrow4 : ({2, 3, 7, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {2, 3, 7, 8} } : RowChoice Label)
        (by simp [mixedV4Cell2SecondPositiveChoices])
    have hrow5 : ({1, 4, 8, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 4, 8, 11} } : RowChoice Label)
        (by simp [mixedV4Cell2SecondPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 4
        b := 8
        c := 5
        y := 1
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 2 8 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.row 1 2 8 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cx := EdgeClosure.row 5 8 4 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cy := EdgeClosure.row 5 8 1 (hrow5 (by decide)) (hrow5 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_2_4_8_5_1

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
