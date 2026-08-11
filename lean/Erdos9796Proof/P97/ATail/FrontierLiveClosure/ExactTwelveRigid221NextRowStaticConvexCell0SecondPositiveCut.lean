/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve next-row static-convex cell-0 second positive cut

After replaying the first static-convex cell-0 positive cut, the next
authenticated survivor contains three sufficient convex-five-point cores. Their
common orientations cover all 48 source-entitled frozen boundary orders. This
file packages that finite obstruction as a proof-carrying
`SourceOrderPositiveNogood`.

This is one finite learned cut. It is not terminal UNSAT, all-cell coverage,
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

/-- The six selected rows used by the second static-convex cell-0 survivor. -/
def nextRowStaticConvexCell0SecondPositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {0, 4, 5, 6} }
  , { center := 5, support := {1, 4, 7, 10} }
  , { center := 6, support := {0, 5, 7, 9} }
  , { center := 7, support := {1, 4, 6, 8} }
  , { center := 9, support := {2, 4, 7, 8} }
  , { center := 11, support := {3, 6, 7, 9} } ]

private theorem FrozenBoundaryOrder.position_ne_of_ne_nextRowStaticConvexCell0Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

-- Arithmetic replay of all 48 source-entitled orders for this survivor.
set_option maxHeartbeats 2000000 in
theorem FrozenBoundaryOrder.sourceOrderCoverage_nextRowStaticConvexCell0Second
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 4 3 6 11 7 ∨
      CommonFiveOrientationAt order.position 4 7 6 11 3 ∨
      CommonFiveOrientationAt order.position 4 9 7 6 5 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_nextRowStaticConvexCell0Second (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_nextRowStaticConvexCell0Second (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_nextRowStaticConvexCell0Second (by decide)
  have h10ne11 : order.position 10 ≠ order.position 11 :=
    order.position_ne_of_ne_nextRowStaticConvexCell0Second (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  change (order.index 10).val ≠ (order.index 11).val at h10ne11
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- The second survivor's positive selected rows force a convex five-point core
in every frozen source order. -/
def nextRowStaticConvexCell0SecondPositiveNogood : SourceOrderPositiveNogood where
  choices := nextRowStaticConvexCell0SecondPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow3 : ({0, 4, 5, 6} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {0, 4, 5, 6} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    have hrow5 : ({1, 4, 7, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 4, 7, 10} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    have hrow6 : ({0, 5, 7, 9} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 5, 7, 9} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    have hrow7 : ({1, 4, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 4, 6, 8} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    have hrow9 : ({2, 4, 7, 8} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 4, 7, 8} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    have hrow11 : ({3, 6, 7, 9} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {3, 6, 7, 9} } : RowChoice Label)
        (by simp [nextRowStaticConvexCell0SecondPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 3
        b := 6
        c := 11
        y := 7
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 4 6 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := EdgeClosure.row 7 4 6 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cx := EdgeClosure.row 11 6 3 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 6 7 (hrow11 (by decide)) (hrow11 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 7
        b := 6
        c := 11
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 7 4 6 (hrow7 (by decide)) (hrow7 (by decide))
        ya_yb := EdgeClosure.row 3 4 6 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 11 6 7 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cy := EdgeClosure.row 11 6 3 (hrow11 (by decide)) (hrow11 (by decide)) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 4
        x := 9
        b := 7
        c := 6
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 4 7 (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 5 4 7 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 6 7 9 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 7 5 (hrow6 (by decide)) (hrow6 (by decide)) }
    rcases order.sourceOrderCoverage_nextRowStaticConvexCell0Second hforced with
      hA | hB | hC
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · exact order.false_of_convexFivePointCore hreal coreC hC

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
