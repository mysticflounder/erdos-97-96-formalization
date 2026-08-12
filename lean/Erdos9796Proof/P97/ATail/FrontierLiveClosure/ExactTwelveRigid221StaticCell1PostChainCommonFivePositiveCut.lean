/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve static cell-1 post-chain common-five cut

The first cell-1 survivor after the r5 source-order chain contains one
three-row convex-five-point core.  Its common orientation follows from either
frozen cap-block order, so the three full selected rows form a proof-carrying
`SourceOrderPositiveNogood`.

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

/-- The core `(a,x,b,c,y) = (6,1,0,2,11)` has a common orientation in either
frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_6_1_0_2_11
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 6 1 0 2 11 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- The frozen source-order interface covers the single common-five core used
by this cut.  This named adapter is recorded in the authenticated bank entry. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1PostChainCommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 6 1 0 2 11 :=
  order.commonOrientation_core_6_1_0_2_11

/-- The three selected rows supply the complete equality core used by the
post-chain cell-1 survivor. -/
theorem false_of_threeRows_core_6_1_0_2_11
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h10 : 0 ∈ row 1) (h16 : 6 ∈ row 1)
    (h20 : 0 ∈ row 2) (h21 : 1 ∈ row 2) (h211 : 11 ∈ row 2)
    (h110 : 0 ∈ row 11) (h116 : 6 ∈ row 11) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 6
      x := 1
      b := 0
      c := 2
      y := 11
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 6 0 h16 h10
      ya_yb := EdgeClosure.row 11 6 0 h116 h110
      cb_cx := EdgeClosure.row 2 0 1 h20 h21
      cb_cy := EdgeClosure.row 2 0 11 h20 h211 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_6_1_0_2_11

/-- The three full selected-row choices occurring in the post-chain cell-1
survivor.  The proof below uses only seven positive memberships. -/
def staticCell1PostChainCommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 3, 6, 8} }
  , { center := 2, support := {0, 1, 10, 11} }
  , { center := 11, support := {0, 4, 6, 9} } ]

/-- The post-chain cell-1 three-row pattern is impossible in every
source-entitled frozen boundary order. -/
def staticCell1PostChainCommonFivePositiveNogood :
    SourceOrderPositiveNogood where
  choices := staticCell1PostChainCommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 3, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 3, 6, 8} } : RowChoice Label)
        (by simp [staticCell1PostChainCommonFivePositiveChoices])
    have hrow2 : ({0, 1, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 1, 10, 11} } : RowChoice Label)
        (by simp [staticCell1PostChainCommonFivePositiveChoices])
    have hrow11 : ({0, 4, 6, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {0, 4, 6, 9} } : RowChoice Label)
        (by simp [staticCell1PostChainCommonFivePositiveChoices])
    exact false_of_threeRows_core_6_1_0_2_11 hreal order
      (hrow1 (by decide)) (hrow1 (by decide))
      (hrow2 (by decide)) (hrow2 (by decide)) (hrow2 (by decide))
      (hrow11 (by decide)) (hrow11 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
