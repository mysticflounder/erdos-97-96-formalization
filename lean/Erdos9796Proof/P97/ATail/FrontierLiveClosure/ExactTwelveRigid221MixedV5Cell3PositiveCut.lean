/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v5 cell-3 positive cut

This file turns the convex-five-point certificate replayed by the mixed-v5
cell-3 survivor into one proof-carrying `SourceOrderPositiveNogood`. The same
core covers both direct and mirror source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v5 cell-3 survivor cut. -/
def mixedV5Cell3PositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 2, 5, 11} }
  , { center := 4, support := {1, 2, 3, 7} }
  , { center := 11, support := {2, 3, 4, 8} } ]

/-- The cell-3 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell3
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 3 2 11 4 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- The three positive selected rows at the mixed-v5 cell-3 survivor force a
convex-five-point equality core. -/
def mixedV5Cell3PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV5Cell3PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow3 : ({1, 2, 5, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 5, 11} } : RowChoice Label)
        (by simp [mixedV5Cell3PositiveChoices])
    have hrow4 : ({1, 2, 3, 7} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {1, 2, 3, 7} } : RowChoice Label)
        (by simp [mixedV5Cell3PositiveChoices])
    have hrow11 : ({2, 3, 4, 8} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {2, 3, 4, 8} } : RowChoice Label)
        (by simp [mixedV5Cell3PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 3
        b := 2
        c := 11
        y := 4
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 1 2 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 4 1 2 (hrow4 (by decide)) (hrow4 (by decide))
        cb_cx := EdgeClosure.row 11 2 3 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 2 4 (hrow11 (by decide)) (hrow11 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV5Cell3

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
