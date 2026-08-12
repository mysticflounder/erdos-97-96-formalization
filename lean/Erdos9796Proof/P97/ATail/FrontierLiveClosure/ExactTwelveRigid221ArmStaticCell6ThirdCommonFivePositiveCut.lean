/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Third exact-twelve arm-static cell-6 common-five cut

After the first two arm-static cell-6 common-five cuts are installed, the next
authenticated SAT survivor contains three positive selected rows that force a
third convex-five-point core in every source-entitled frozen boundary order.
This file promotes exactly that obstruction to a checked
`SourceOrderPositiveNogood`.

This is one learned cut.  It is not terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the third arm-static cell-6 cut. -/
def armStaticCell6ThirdCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 3, 6, 8} }
  , { center := 3, support := {0, 1, 4, 5} }
  , { center := 6, support := {0, 4, 7, 11} } ]

/-- The frozen cap blocks give the third arm-static cell-6 core one common
orientation; the forced second-cap direction is not needed. -/
theorem FrozenBoundaryOrder.commonOrientation_core_4_6_0_1_3_armStaticCell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 4 6 0 1 3 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h3 := hdirect.surplus_between 3 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h3 := hmirror.surplus_between 3 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive rows from the third arm-static survivor force a
convex-five-point equality core in every frozen source order. -/
def armStaticCell6ThirdCommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := armStaticCell6ThirdCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 3, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 3, 6, 8} } : RowChoice Label)
        (by simp [armStaticCell6ThirdCommonFivePositiveChoices])
    have hrow3 : ({0, 1, 4, 5} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 5} } : RowChoice Label)
        (by simp [armStaticCell6ThirdCommonFivePositiveChoices])
    have hrow6 : ({0, 4, 7, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 4, 7, 11} } : RowChoice Label)
        (by simp [armStaticCell6ThirdCommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 6
        b := 0
        c := 1
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 4 0
          (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 3 4 0
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 1 0 6
          (hrow1 (by decide)) (hrow1 (by decide))
        cb_cy := EdgeClosure.row 1 0 3
          (hrow1 (by decide)) (hrow1 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_4_6_0_1_3_armStaticCell6

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
