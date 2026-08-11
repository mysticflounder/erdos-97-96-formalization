/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-10 positive cut

This file turns the source25-seeded mixed-v6 cell-10 survivor into one
proof-carrying `SourceOrderPositiveNogood`.  The same convex-five-point core
covers both direct and mirror source orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v6 cell-10 survivor cut. -/
def mixedV6Cell10PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 5, support := {0, 2, 3, 10} }
  , { center := 11, support := {1, 2, 5, 10} } ]

/-- The cell-10 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell10
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 1 2 11 5 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h5 := hdirect.surplus_between 5 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h5 := hmirror.surplus_between 5 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- The three positive selected rows from the mixed-v6 cell-10 survivor force
a convex-five-point equality core in either frozen boundary order. -/
def mixedV6Cell10PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell10PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell10PositiveChoices])
    have hrow5 : ({0, 2, 3, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 2, 3, 10} } : RowChoice Label)
        (by simp [mixedV6Cell10PositiveChoices])
    have hrow11 : ({1, 2, 5, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {1, 2, 5, 10} } : RowChoice Label)
        (by simp [mixedV6Cell10PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 2
        c := 11
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 5 0 2 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 11 2 1 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 2 5 (hrow11 (by decide)) (hrow11 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV6Cell10

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
