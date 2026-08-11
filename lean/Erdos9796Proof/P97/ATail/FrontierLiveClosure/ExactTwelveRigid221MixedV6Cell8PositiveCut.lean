/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-8 positive cut

This file turns the convex-five-point certificate found in the source25-seeded
cell-8 survivor into one proof-carrying `SourceOrderPositiveNogood`. The same
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

/-- The three selected rows used by the mixed-v6 cell-8 survivor cut. -/
def mixedV6Cell8PositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 2, 4, 7} }
  , { center := 4, support := {1, 2, 5, 8} }
  , { center := 9, support := {0, 1, 3, 4} } ]

/-- The cell-8 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 3 1 9 4 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    omega

/-- The three positive selected rows from the mixed-v6 cell-8 survivor force a
convex-five-point equality core in either frozen boundary order. -/
def mixedV6Cell8PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell8PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow3 : ({1, 2, 4, 7} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 4, 7} } : RowChoice Label)
        (by simp [mixedV6Cell8PositiveChoices])
    have hrow4 : ({1, 2, 5, 8} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 5, 8} } : RowChoice Label)
        (by simp [mixedV6Cell8PositiveChoices])
    have hrow9 : ({0, 1, 3, 4} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 1, 3, 4} } : RowChoice Label)
        (by simp [mixedV6Cell8PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 3
        b := 1
        c := 9
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 2 1 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 4 2 1 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 9 1 3 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 1 4 (hrow9 (by decide)) (hrow9 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV6Cell8

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
