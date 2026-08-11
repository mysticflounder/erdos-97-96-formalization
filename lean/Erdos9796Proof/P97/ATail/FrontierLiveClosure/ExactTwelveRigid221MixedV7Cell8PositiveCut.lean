/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 positive cut

This file turns the source31-seeded mixed-v7 cell-8 survivor into one
proof-carrying `SourceOrderPositiveNogood`.  Its three selected rows force the
same convex-five-point core used by the earlier mixed-v3 cell-8 cut.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v7 cell-8 survivor cut. -/
def mixedV7Cell8PositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 3, support := {1, 2, 9, 10} }
  , { center := 9, support := {0, 2, 3, 7} } ]

/-- The cell-8 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 9 2 3 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h3 := hdirect.surplus_between 3 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h3 := hmirror.surplus_between 3 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive selected rows from the mixed-v7 cell-8 survivor force
a convex-five-point equality core in either frozen boundary order. -/
def mixedV7Cell8PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8PositiveChoices])
    have hrow3 : ({1, 2, 9, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 9, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8PositiveChoices])
    have hrow9 : ({0, 2, 3, 7} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 2, 3, 7} } : RowChoice Label)
        (by simp [mixedV7Cell8PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 9
        b := 2
        c := 3
        y := 1
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 0 2 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide))
        cb_cx := EdgeClosure.row 3 2 9 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 2 1 (hrow3 (by decide)) (hrow3 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientationCoverage_mixedV7Cell8

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
