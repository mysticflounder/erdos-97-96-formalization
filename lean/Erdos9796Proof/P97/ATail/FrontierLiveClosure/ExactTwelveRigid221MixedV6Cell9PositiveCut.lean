/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-9 positive cut

This file turns the convex-five-point certificate found in the source23-seeded
cell-9 survivor into one proof-carrying `SourceOrderPositiveNogood`. The same
three-row core covers both direct and mirror source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v6 cell-9 survivor cut. -/
def mixedV6Cell9PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 4, support := {0, 2, 10, 11} }
  , { center := 6, support := {0, 1, 4, 10} } ]

/-- The cell-9 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell9
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 1 0 6 4 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    omega

/-- Three positive selected rows from the mixed-v6 cell-9 survivor force a
convex-five-point equality core in either frozen boundary order. -/
def mixedV6Cell9PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell9PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell9PositiveChoices])
    have hrow4 : ({0, 2, 10, 11} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 2, 10, 11} } : RowChoice Label)
        (by simp [mixedV6Cell9PositiveChoices])
    have hrow6 : ({0, 1, 4, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 1, 4, 10} } : RowChoice Label)
        (by simp [mixedV6Cell9PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 0
        c := 6
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 0 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 4 2 0 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 6 0 1 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 0 4 (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV6Cell9

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
