/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Fourth exact-twelve arm-static cell-6 common-five cut

The authenticated survivor after the first three cell-6 cuts contains three
positive selected rows forcing one convex-five-point core in every
source-entitled frozen boundary order.  This file promotes exactly that
obstruction to a checked `SourceOrderPositiveNogood`.

This is one finite learned cut.  It is not terminal UNSAT, all-arm coverage,
an arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the fourth arm-static cell-6 cut. -/
def armStaticCell6FourthCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 3, 4, 10} }
  , { center := 6, support := {2, 3, 5, 8} }
  , { center := 10, support := {0, 2, 6, 9} } ]

/-- The frozen cap blocks orient the fourth cell-6 common-five core. -/
theorem FrozenBoundaryOrder.commonOrientation_core_3_0_2_10_6_armStaticCell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 3 0 2 10 6 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hdirect.surplus_between 3 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hmirror.surplus_between 3 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive rows force the fourth convex-five-point equality core
in every frozen source order. -/
def armStaticCell6FourthCommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := armStaticCell6FourthCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({2, 3, 4, 10} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 3, 4, 10} } : RowChoice Label)
        (by simp [armStaticCell6FourthCommonFivePositiveChoices])
    have hrow6 : ({2, 3, 5, 8} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {2, 3, 5, 8} } : RowChoice Label)
        (by simp [armStaticCell6FourthCommonFivePositiveChoices])
    have hrow10 : ({0, 2, 6, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 2, 6, 9} } : RowChoice Label)
        (by simp [armStaticCell6FourthCommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 3
        x := 0
        b := 2
        c := 10
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 3 2
          (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 6 3 2
          (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := EdgeClosure.row 10 2 0
          (hrow10 (by decide)) (hrow10 (by decide))
        cb_cy := EdgeClosure.row 10 2 6
          (hrow10 (by decide)) (hrow10 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_3_0_2_10_6_armStaticCell6

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
