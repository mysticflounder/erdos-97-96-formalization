/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v6 cell-6 positive cut

This file turns the source23-seeded static-equality cell-6 survivor into one
proof-carrying `SourceOrderPositiveNogood`.  The four selected rows supply a
single common-five equality core in both frozen boundary orders.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four selected rows used by the source23-seeded mixed-v6 cell-6 cut. -/
def mixedV6Cell6PositiveChoices : List (RowChoice Label) :=
  [ { center := 6, support := {0, 3, 7, 8} }
  , { center := 7, support := {1, 5, 6, 8} }
  , { center := 8, support := {4, 6, 9, 11} }
  , { center := 11, support := {0, 2, 5, 7} } ]

/-- The cell-6 core has a common orientation in both frozen boundary orders. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 6 7 8 11 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
          (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
          (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    rcases hforced with hforward | hreverse <;> omega

/-- The positive selected rows from the mixed-v6 cell-6 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV6Cell6PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV6Cell6PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow6 : ({0, 3, 7, 8} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 3, 7, 8} } : RowChoice Label)
        (by simp [mixedV6Cell6PositiveChoices])
    have hrow7 : ({1, 5, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 5, 6, 8} } : RowChoice Label)
        (by simp [mixedV6Cell6PositiveChoices])
    have hrow8 : ({4, 6, 9, 11} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {4, 6, 9, 11} } : RowChoice Label)
        (by simp [mixedV6Cell6PositiveChoices])
    have hrow11 : ({0, 2, 5, 7} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {0, 2, 5, 7} } : RowChoice Label)
        (by simp [mixedV6Cell6PositiveChoices])
    have hcb : EdgeClosure row (8, 7) (8, 6) := by
      exact EdgeClosure.trans
        (EdgeClosure.trans
          (EdgeClosure.symm (EdgeClosure.flip 7 8))
          (EdgeClosure.symm (EdgeClosure.row 7 6 8
            (hrow7 (by decide)) (hrow7 (by decide)))))
        (EdgeClosure.trans (EdgeClosure.flip 7 6)
          (EdgeClosure.trans (EdgeClosure.row 6 7 8
            (hrow6 (by decide)) (hrow6 (by decide)))
            (EdgeClosure.flip 6 8)))
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 6
        b := 7
        c := 8
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 0 7 (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 11 0 7 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := hcb
        cb_cy := EdgeClosure.trans hcb (EdgeClosure.row 8 6 11
          (hrow8 (by decide)) (hrow8 (by decide))) }
    exact order.false_of_convexFivePointCore hreal core
      (order.commonOrientationCoverage_mixedV6Cell6 hforced)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
