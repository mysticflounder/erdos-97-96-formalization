/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderCoverage
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# Exact-twelve next-row cell-3 positive cut

This file turns the independently replayed cell-3 source-order certificate from
the exact-twelve `nextRowOnlyHit` successor wave into one proof-carrying
`SourceOrderPositiveNogood`.  The equality-closure paths are the paths recorded
by the diagnostic certificate; all row assumptions are positive incidences.

This is one finite learned cut.  It is not terminal UNSAT, all-cell coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The ten selected rows used by the unresolved next-row cell-3 survivor. -/
def nextRowCell3PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 3, 4, 5} }
  , { center := 1, support := {2, 6, 8, 10} }
  , { center := 2, support := {0, 4, 10, 11} }
  , { center := 4, support := {7, 9, 10, 11} }
  , { center := 5, support := {0, 3, 8, 10} }
  , { center := 6, support := {2, 3, 5, 9} }
  , { center := 7, support := {0, 1, 6, 8} }
  , { center := 9, support := {0, 4, 5, 6} }
  , { center := 10, support := {5, 7, 8, 9} }
  , { center := 11, support := {1, 2, 5, 10} } ]

private def nextRowCell3Path30_35 : ClosurePathData Label :=
  { first := (3, 0)
    steps :=
      [ .flip 3 0
      , .row 0 3 5
      , .flip 0 5
      , .row 5 0 3
      , .flip 5 3 ]
    last := (3, 5) }

private def nextRowCell3Path90_95 : ClosurePathData Label :=
  { first := (9, 0)
    steps := [.row 9 0 5]
    last := (9, 5) }

private def nextRowCell3Path65_63 : ClosurePathData Label :=
  { first := (6, 5)
    steps := [.row 6 5 3]
    last := (6, 3) }

private def nextRowCell3Path65_69 : ClosurePathData Label :=
  { first := (6, 5)
    steps := [.row 6 5 9]
    last := (6, 9) }

private def nextRowCell3Path20_2ten : ClosurePathData Label :=
  { first := (2, 0)
    steps := [.row 2 0 10]
    last := (2, 10) }

private def nextRowCell3Path50_5ten : ClosurePathData Label :=
  { first := (5, 0)
    steps := [.row 5 0 10]
    last := (5, 10) }

private def nextRowCell3PathElevenTen_11two : ClosurePathData Label :=
  { first := (11, 10)
    steps := [.row 11 10 2]
    last := (11, 2) }

private def nextRowCell3PathElevenTen_11five : ClosurePathData Label :=
  { first := (11, 10)
    steps := [.row 11 10 5]
    last := (11, 5) }

private theorem FrozenBoundaryOrder.position_ne_of_ne_nextRowCell3
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

-- Arithmetic replay of all 48 source-entitled orders for the next-row cell-3
-- positive rows.
set_option maxHeartbeats 2000000 in
-- `omega` discharges the complete direct/mirror and forced-order case table.
theorem FrozenBoundaryOrder.sourceOrderCoverage_nextRowCell3
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 3 5 6 9 ∨
      CommonFiveOrientationAt order.position 0 2 10 11 5 ∨
      CommonFiveOrientationAt order.position 0 9 5 6 3 ∨
      KalmansonOrderAt order.position 0 7 9 4 1 ∨
      KalmansonOrderAt order.position 0 7 9 5 1 ∨
      KalmansonOrderAt order.position 10 1 4 9 8 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne_nextRowCell3 (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne_nextRowCell3 (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne_nextRowCell3 (by decide)
  have h10ne11 : order.position 10 ≠ order.position 11 :=
    order.position_ne_of_ne_nextRowCell3 (by decide)
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
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt KalmansonOrderAt
        FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

private theorem FrozenBoundaryOrder.boundary_image_eq_pointOf_image_nextRowCell3
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    Finset.univ.image order.boundary = Finset.univ.image pointOf := by
  classical
  have hindex_bijective : Function.Bijective order.index :=
    (Fintype.bijective_iff_injective_and_card order.index).2
      ⟨order.index_injective, by simp [order.n_eq_twelve]⟩
  ext p
  constructor
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨i, -, rfl⟩
    rcases hindex_bijective.surjective i with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨label, Finset.mem_univ _, (order.point_eq label).symm⟩
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨label, -, rfl⟩
    exact Finset.mem_image.mpr
      ⟨order.index label, Finset.mem_univ _, order.point_eq label⟩

private theorem FrozenBoundaryOrder.false_of_kalmansonOrderAt_nextRowCell3
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (o a y e c : Label) (horder : KalmansonOrderAt order.position o a y e c)
    (hO_mem_y : o ∈ row y) (hE_mem_y : e ∈ row y)
    (hE_mem_o : e ∈ row o) (hC_mem_o : c ∈ row o)
    (hC_mem_a : c ∈ row a) (hO_mem_a : o ∈ row a) : False := by
  rcases horder with ⟨hOA, hAY, hYE, hEC⟩
  have hOA_lt_AE :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective
        order.boundary_image_eq_pointOf_image_nextRowCell3 order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hOA)
      (by simpa only [FrozenBoundaryOrder.position] using hAY)
      (by simpa only [FrozenBoundaryOrder.position] using hYE)
  have hAE_lt_AO :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective
        order.boundary_image_eq_pointOf_image_nextRowCell3 order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hOA)
      (by simpa only [FrozenBoundaryOrder.position] using hAY.trans hYE)
      (by simpa only [FrozenBoundaryOrder.position] using hEC)
  have hYRow := hreal.equidist y o hO_mem_y e hE_mem_y
  have hORow := hreal.equidist o e hE_mem_o c hC_mem_o
  have hARow := hreal.equidist a c hC_mem_a o hO_mem_a
  simp only [order.point_eq] at hOA_lt_AE hAE_lt_AO
  have hYRow' : dist (pointOf o) (pointOf y) = dist (pointOf y) (pointOf e) := by
    simpa only [dist_comm (pointOf o) (pointOf y)] using hYRow
  have hARow' : dist (pointOf a) (pointOf c) = dist (pointOf o) (pointOf a) := by
    simpa only [dist_comm (pointOf a) (pointOf o)] using hARow
  linarith

/-- The cell-3 diagnostic cut, with every equality path and metric branch
replayed in Lean. -/
def nextRowCell3PositiveNogood : SourceOrderPositiveNogood where
  choices := nextRowCell3PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced hconv hpositive
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 3
        b := 5
        c := 6
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path30_35 (by native_decide)
        ya_yb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path90_95 (by native_decide)
        cb_cx := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path65_63 (by native_decide)
        cb_cy := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path65_69 (by native_decide) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 2
        b := 10
        c := 11
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path20_2ten (by native_decide)
        ya_yb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path50_5ten (by native_decide)
        cb_cx := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3PathElevenTen_11two (by native_decide)
        cb_cy := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3PathElevenTen_11five (by native_decide) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 9
        b := 5
        c := 6
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path90_95 (by native_decide)
        ya_yb := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path30_35 (by native_decide)
        cb_cx := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path65_69 (by native_decide)
        cb_cy := edgeClosure_of_checkPath_positive hpositive
          nextRowCell3Path65_63 (by native_decide) }
    have hrow0 : ({1, 3, 4, 5} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {1, 3, 4, 5} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    have hrow1 : ({2, 6, 8, 10} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {2, 6, 8, 10} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    have hrow4 : ({7, 9, 10, 11} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {7, 9, 10, 11} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    have hrow7 : ({0, 1, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {0, 1, 6, 8} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    have hrow9 : ({0, 4, 5, 6} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 4, 5, 6} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    have hrow10 : ({5, 7, 8, 9} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {5, 7, 8, 9} } : RowChoice Label)
        (by simp [nextRowCell3PositiveChoices])
    rcases order.sourceOrderCoverage_nextRowCell3 hforced with
      hA | hB | hC | hK1 | hK2 | hK3
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB
    · exact order.false_of_convexFivePointCore hreal coreC hC
    · exact order.false_of_kalmansonOrderAt_nextRowCell3 hreal hconv
        0 7 9 4 1 hK1
        (hrow9 (by decide)) (hrow9 (by decide))
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow7 (by decide)) (hrow7 (by decide))
    · exact order.false_of_kalmansonOrderAt_nextRowCell3 hreal hconv
        0 7 9 5 1 hK2
        (hrow9 (by decide)) (hrow9 (by decide))
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow7 (by decide)) (hrow7 (by decide))
    · exact order.false_of_kalmansonOrderAt_nextRowCell3 hreal hconv
        10 1 4 9 8 hK3
        (hrow4 (by decide)) (hrow4 (by decide))
        (hrow10 (by decide)) (hrow10 (by decide))
        (hrow1 (by decide)) (hrow1 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
