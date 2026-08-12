/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 post-ThreeTriad common-five cut

The first survivor after installing the block-spanning family and the
ThreeTriad membership cut contains one three-row convex-five-point core.  Its
common orientation follows from either frozen cap-block order, so the three
displayed selected rows form a proof-carrying `SourceOrderPositiveNogood`.

This is one finite learned cut.  It is not terminal UNSAT, all-cell coverage,
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

/-- The core `(a,x,b,c,y) = (8,1,3,9,11)` has a common orientation in either
frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_8_1_3_9_11
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 8 1 3 9 11 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- The frozen source-order interface covers the single common-five core used
by this cut.  This named adapter is recorded in the authenticated bank entry. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1AfterThreeTriadCommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 8 1 3 9 11 :=
  order.commonOrientation_core_8_1_3_9_11

/-- The three selected rows supply the complete equality core used by the
post-ThreeTriad cell-1 survivor. -/
theorem false_of_threeRows_core_8_1_3_9_11
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h13 : 3 ∈ row 1) (h18 : 8 ∈ row 1)
    (h91 : 1 ∈ row 9) (h93 : 3 ∈ row 9) (h911 : 11 ∈ row 9)
    (h113 : 3 ∈ row 11) (h118 : 8 ∈ row 11) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 8
      x := 1
      b := 3
      c := 9
      y := 11
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 8 3 h18 h13
      ya_yb := EdgeClosure.row 11 8 3 h118 h113
      cb_cx := EdgeClosure.row 9 3 1 h93 h91
      cb_cy := EdgeClosure.row 9 3 11 h93 h911 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_8_1_3_9_11

/-- The three full selected-row choices occurring in the post-ThreeTriad
cell-1 survivor.  The proof below uses only seven positive memberships. -/
def staticCell1AfterThreeTriadCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 3, 6, 8} }
  , { center := 9, support := {1, 3, 7, 11} }
  , { center := 11, support := {3, 5, 8, 10} } ]

/-- The post-ThreeTriad cell-1 three-row pattern is impossible in every
source-entitled frozen boundary order. -/
def staticCell1AfterThreeTriadCommonFivePositiveNogood :
    SourceOrderPositiveNogood where
  choices := staticCell1AfterThreeTriadCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 3, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 3, 6, 8} } : RowChoice Label)
        (by simp [staticCell1AfterThreeTriadCommonFivePositiveChoices])
    have hrow9 : ({1, 3, 7, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 3, 7, 11} } : RowChoice Label)
        (by simp [staticCell1AfterThreeTriadCommonFivePositiveChoices])
    have hrow11 : ({3, 5, 8, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {3, 5, 8, 10} } : RowChoice Label)
        (by simp [staticCell1AfterThreeTriadCommonFivePositiveChoices])
    exact false_of_threeRows_core_8_1_3_9_11 hreal order
      (hrow1 (by decide)) (hrow1 (by decide))
      (hrow9 (by decide)) (hrow9 (by decide)) (hrow9 (by decide))
      (hrow11 (by decide)) (hrow11 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
