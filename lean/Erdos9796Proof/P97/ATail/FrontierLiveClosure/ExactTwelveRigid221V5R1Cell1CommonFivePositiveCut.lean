/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve v5-r1 cell-1 common-five positive cut

The minimized positive-membership footprint of the v5-r1 cell-1 survivor supplies two
convex-five-point equality cores. Their common orientations cover all 48 source-entitled frozen
boundary orders, yielding one proof-carrying `SourceOrderPositiveNogood`.

This is one finite learned cut. It is not terminal UNSAT, all-cell coverage, an
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

/-- The minimized positive memberships used by the v5-r1 cell-1 common-five cut. -/
def v5R1Cell1CommonFivePositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 2, 3, 4} }
  , { center := 1, support := {0, 3, 6, 8} }
  , { center := 5, support := {0, 6, 7, 9} }
  , { center := 6, support := {0, 2, 9, 10} }
  , { center := 7, support := {1, 5, 6, 8} }
  , { center := 9, support := {1, 2, 7, 11} } ]

/-- The two minimized common-five cores cover all 48 source-entitled frozen boundary orders. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_v5R1Cell1CommonFive
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 0 2 6 9 ∨
      CommonFiveOrientationAt order.position 0 1 6 7 5 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega

/-- The v5-r1 cell-1 minimized positive memberships force one of two convex-five-point equality
cores in every source-entitled frozen boundary order. -/
def v5R1Cell1CommonFivePositiveNogood : SourceOrderPositiveNogood where
  choices := v5R1Cell1CommonFivePositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow0 : ({1, 2, 3, 4} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 2, 3, 4} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    have hrow1 : ({0, 3, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 3, 6, 8} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    have hrow5 : ({0, 6, 7, 9} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 6, 7, 9} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    have hrow6 : ({0, 2, 9, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 9, 10} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    have hrow7 : ({1, 5, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 5, 6, 8} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    have hrow9 : ({1, 2, 7, 11} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {1, 2, 7, 11} } : RowChoice Label)
        (by simp [v5R1Cell1CommonFivePositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 0
        b := 2
        c := 6
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 1 2 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 9 1 2 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 6 2 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 2 9 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 1
        b := 6
        c := 7
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 0 6 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 5 0 6 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 7 6 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 6 5 (hrow7 (by decide)) (hrow7 (by decide)) }
    rcases order.sourceOrderCoverage_v5R1Cell1CommonFive hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
