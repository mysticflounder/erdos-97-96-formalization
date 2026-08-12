/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood

/-!
# Fifth exact-twelve arm-static cell-6 common-five cut

The authenticated survivor after installing the surplus three-triad family
contains three positive selected rows forcing one convex-five-point core in
every source-entitled frozen boundary order.  This file promotes exactly that
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

/-- The three selected rows used by the fifth arm-static cell-6 cut. -/
def armStaticCell6FifthCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 5, support := {0, 1, 7, 9} }
  , { center := 7, support := {1, 2, 6, 8} }
  , { center := 9, support := {1, 2, 4, 10} } ]

/-- The frozen cap blocks orient the fifth cell-6 common-five core. -/
theorem FrozenBoundaryOrder.commonOrientation_core_2_7_1_5_9_armStaticCell6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 7 1 5 9 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hdirect.surplus_between 5 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h5 := hmirror.surplus_between 5 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The three positive rows force the fifth convex-five-point equality core
in every frozen source order. -/
def armStaticCell6FifthCommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := armStaticCell6FifthCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow5 : ({0, 1, 7, 9} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 1, 7, 9} } : RowChoice Label)
        (by simp [armStaticCell6FifthCommonFivePositiveChoices])
    have hrow7 : ({1, 2, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 2, 6, 8} } : RowChoice Label)
        (by simp [armStaticCell6FifthCommonFivePositiveChoices])
    have hrow9 : ({1, 2, 4, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 2, 4, 10} } : RowChoice Label)
        (by simp [armStaticCell6FifthCommonFivePositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 7
        b := 1
        c := 5
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 2 1
          (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 9 2 1
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 5 1 7
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cy := EdgeClosure.row 5 1 9
          (hrow5 (by decide)) (hrow5 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_2_7_1_5_9_armStaticCell6

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
