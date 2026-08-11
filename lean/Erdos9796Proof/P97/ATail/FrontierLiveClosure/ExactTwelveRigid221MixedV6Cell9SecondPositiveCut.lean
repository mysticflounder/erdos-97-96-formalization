/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-9 second positive cut

This file turns the four selected rows from the mixed-v6 cell-9 survivor into
one proof-carrying `SourceOrderPositiveNogood`. The recorded
convex-five-point core covers both frozen boundary orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four selected rows used by the mixed-v6 cell-9 second survivor cut. -/
def mixedV6Cell9SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {0, 1, 10, 11} }
  , { center := 4, support := {1, 2, 5, 8} }
  , { center := 10, support := {0, 1, 3, 4} } ]

/-- The cell-9 second core has the same orientation in both frozen boundary
orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell9Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 4 1 10 0 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- Four positive selected rows from the mixed-v6 cell-9 second survivor force
the convex-five-point equality core in the frozen order. -/
def mixedV6Cell9SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell9SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell9SecondPositiveChoices])
    have hrow2 : ({0, 1, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 1, 10, 11} } : RowChoice Label)
        (by simp [mixedV6Cell9SecondPositiveChoices])
    have hrow4 : ({1, 2, 5, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 5, 8} } : RowChoice Label)
        (by simp [mixedV6Cell9SecondPositiveChoices])
    have hrow10 : ({0, 1, 3, 4} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 3, 4} } : RowChoice Label)
        (by simp [mixedV6Cell9SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 4
        b := 1
        c := 10
        y := 0
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 4 2 1 (hrow4 (by decide)) (hrow4 (by decide))
        ya_yb := EdgeClosure.trans (EdgeClosure.flip 0 2)
          (EdgeClosure.trans
            (EdgeClosure.row 2 0 1 (hrow2 (by decide)) (hrow2 (by decide)))
            (EdgeClosure.trans (EdgeClosure.flip 2 1)
              (EdgeClosure.trans
                (EdgeClosure.row 1 2 0 (hrow1 (by decide)) (hrow1 (by decide)))
                (EdgeClosure.flip 1 0))))
        cb_cx := EdgeClosure.row 10 1 4 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 1 0 (hrow10 (by decide)) (hrow10 (by decide)) }
    exact order.false_of_convexFivePointCore hreal coreA
      order.commonOrientationCoverage_mixedV6Cell9Second

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
