/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-0 positive cut

This file turns the three selected rows from the source25-seeded cell-0
survivor into one proof-carrying `SourceOrderPositiveNogood`.  Two
convex-five-point cores cover the direct and mirror frozen boundary orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v6 cell-0 survivor cut. -/
def mixedV6Cell0PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 3, 4, 7} }
  , { center := 10, support := {0, 2, 3, 11} }
  , { center := 11, support := {1, 3, 6, 9} } ]

/-- The two cell-0 cores have a common orientation in the two frozen boundary
orders: the second core covers the direct order and the first the mirror order.
-/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell0
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 0 3 10 11 ∨
      CommonFiveOrientationAt order.position 1 11 3 10 0 := by
  rcases order.blocks with hdirect | hmirror
  ·
    unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  ·
    unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- The three positive selected rows at the mixed-v6 cell-0 survivor force one
of two convex-five-point equality cores. -/
def mixedV6Cell0PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell0PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({1, 3, 4, 7} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 3, 4, 7} } : RowChoice Label)
        (by simp [mixedV6Cell0PositiveChoices])
    have hrow10 : ({0, 2, 3, 11} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 2, 3, 11} } : RowChoice Label)
        (by simp [mixedV6Cell0PositiveChoices])
    have hrow11 : ({1, 3, 6, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {1, 3, 6, 9} } : RowChoice Label)
        (by simp [mixedV6Cell0PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 0
        b := 3
        c := 10
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 1 3 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 11 1 3 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := EdgeClosure.row 10 3 0 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 3 11 (hrow10 (by decide)) (hrow10 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 11
        b := 3
        c := 10
        y := 0
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 1 3 (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 0 1 3 (hrow0 (by decide)) (hrow0 (by decide))
        cb_cx := EdgeClosure.row 10 3 11 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 3 0 (hrow10 (by decide)) (hrow10 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV6Cell0 with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
