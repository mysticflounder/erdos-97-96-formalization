/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Second exact-twelve arm-static cell-6 common-five cut

After the first arm-static cell-6 common-five cut is installed, the next
authenticated SAT survivor contains three positive selected rows that force a
second convex-five-point core in every source-entitled frozen boundary order.
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

/-- The three selected rows used by the second arm-static cell-6 cut. -/
def armStaticCell6SecondCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 2, support := {0, 3, 10, 11} }
  , { center := 3, support := {0, 1, 4, 5} }
  , { center := 11, support := {0, 5, 9, 10} } ]

/-- The frozen cap blocks give the second arm-static cell-6 core one common
orientation; the forced second-cap direction is not needed. -/
theorem FrozenBoundaryOrder.commonOrientation_core_5_11_0_2_3_armStaticCell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 5 11 0 2 3 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hdirect.surplus_between 5 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have h3 := hdirect.surplus_between 3 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hmirror.surplus_between 5 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have h3 := hmirror.surplus_between 3 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive rows from the second arm-static survivor force a
convex-five-point equality core in every frozen source order. -/
def armStaticCell6SecondCommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := armStaticCell6SecondCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow2 : ({0, 3, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 3, 10, 11} } : RowChoice Label)
        (by simp [armStaticCell6SecondCommonFivePositiveChoices])
    have hrow3 : ({0, 1, 4, 5} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 1, 4, 5} } : RowChoice Label)
        (by simp [armStaticCell6SecondCommonFivePositiveChoices])
    have hrow11 : ({0, 5, 9, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {0, 5, 9, 10} } : RowChoice Label)
        (by simp [armStaticCell6SecondCommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 11
        b := 0
        c := 2
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 5 0
          (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 3 5 0
          (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 2 0 11
          (hrow2 (by decide)) (hrow2 (by decide))
        cb_cy := EdgeClosure.row 2 0 3
          (hrow2 (by decide)) (hrow2 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_5_11_0_2_3_armStaticCell6

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
