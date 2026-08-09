/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-1 positive cut

The mixed-v4 cell-1 survivor contains one three-row convex-five-point core
whose common orientation holds in both frozen boundary orders.  This file
packages that core as a proof-carrying `SourceOrderPositiveNogood`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the mixed-v4 cell-1 survivor cut. -/
def mixedV4Cell1PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 5, 8, 11} }
  , { center := 2, support := {3, 7, 10, 11} }
  , { center := 6, support := {0, 2, 3, 7} } ]

/-- The cell-1 core has the forward orientation in the direct frozen order
and the reverse orientation in the mirror frozen order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_11_0_3_6_2
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 11 0 3 6 2 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- Three positive selected rows from the mixed-v4 cell-1 survivor force a
convex five-point equality core in either frozen boundary order. -/
def mixedV4Cell1PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell1PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({3, 5, 8, 11} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 5, 8, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1PositiveChoices])
    have hrow2 : ({3, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {3, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1PositiveChoices])
    have hrow6 : ({0, 2, 3, 7} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 3, 7} } : RowChoice Label)
        (by simp [mixedV4Cell1PositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 11
        x := 0
        b := 3
        c := 6
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 11 3 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 2 11 3 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 6 3 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 3 2 (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_11_0_3_6_2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
