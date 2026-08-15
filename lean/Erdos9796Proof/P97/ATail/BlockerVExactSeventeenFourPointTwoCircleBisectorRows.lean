/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenConvexFivePointFourthRows
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore

/-!
# Three-row two-circle bisector clauses for exact seventeen

The terminal SAT model of the fourth-row five-point child contains two centers
equidistant from the same pair of points.  Boundary order puts both common
points strictly on the same side of the center chord.  This module banks the
cardinality-independent contradiction, its complete two-order/two-orientation
orbit, and the corresponding `SourceRealization` bridge.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFourPointTwoCircleBisectorRows

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFourthRows
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The three selected rows generating the canonical two-circle core. -/
def negativeChoices : List (RowChoice Label) :=
  [{ center := 10, support := {7, 16} },
    { center := 7, support := {10, 16} },
    { center := 5, support := {7, 10} }]

/-- Reflection of the canonical three selected rows. -/
def positiveChoices : List (RowChoice Label) :=
  [{ center := 6, support := {0, 9} },
    { center := 9, support := {0, 6} },
    { center := 11, support := {6, 9} }]

/-- The six positive incidences serialized into one guarded clause. -/
def baseHits : List Hit :=
  [(10, 7), (10, 16), (7, 10), (7, 16), (5, 7), (5, 10)]

/-- Transport the positional motif into one named source order and reflected
placement. -/
def bisectorOrderHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  baseHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

private theorem baseHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ negativeChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ baseHits := by
  native_decide +revert

private theorem reflectedBaseHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ positiveChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ baseHits := by
  native_decide +revert

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_negative {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ bisectorOrderHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      negativeChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [bisectorOrderHits, List.mem_map]
      exact ⟨(choice.center, point),
        baseHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_positive {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ bisectorOrderHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      positiveChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [bisectorOrderHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedBaseHit_of_choice choice hchoice point hpoint, rfl⟩)

private def negativeCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P negativeChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P :=
  { q := 16
    v := 5
    u := 10
    y := 7
    huy := by decide
    qu_qy := EdgeClosure.trans (EdgeClosure.flip 16 10)
      (EdgeClosure.trans
        (EdgeClosure.row 10 16 7
          (hrows ({ center := 10, support := {7, 16} } : RowChoice Label)
            (by native_decide) (by native_decide))
          (hrows ({ center := 10, support := {7, 16} } : RowChoice Label)
            (by native_decide) (by native_decide)))
        (EdgeClosure.trans (EdgeClosure.flip 10 7)
          (EdgeClosure.trans
            (EdgeClosure.row 7 10 16
              (hrows ({ center := 7, support := {10, 16} } : RowChoice Label)
                (by native_decide) (by native_decide))
              (hrows ({ center := 7, support := {10, 16} } : RowChoice Label)
                (by native_decide) (by native_decide)))
            (EdgeClosure.flip 7 16))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 10 5)
      (EdgeClosure.trans
        (EdgeClosure.row 5 10 7
          (hrows ({ center := 5, support := {7, 10} } : RowChoice Label)
            (by native_decide) (by native_decide))
          (hrows ({ center := 5, support := {7, 10} } : RowChoice Label)
            (by native_decide) (by native_decide)))
        (EdgeClosure.flip 5 7)) }

private def positiveCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P positiveChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P :=
  { q := 0
    v := 11
    u := 6
    y := 9
    huy := by decide
    qu_qy := EdgeClosure.trans (EdgeClosure.flip 0 6)
      (EdgeClosure.trans
        (EdgeClosure.row 6 0 9
          (hrows ({ center := 6, support := {0, 9} } : RowChoice Label)
            (by native_decide) (by native_decide))
          (hrows ({ center := 6, support := {0, 9} } : RowChoice Label)
            (by native_decide) (by native_decide)))
        (EdgeClosure.trans (EdgeClosure.flip 6 9)
          (EdgeClosure.trans
            (EdgeClosure.row 9 6 0
              (hrows ({ center := 9, support := {0, 6} } : RowChoice Label)
                (by native_decide) (by native_decide))
              (hrows ({ center := 9, support := {0, 6} } : RowChoice Label)
                (by native_decide) (by native_decide)))
            (EdgeClosure.flip 9 0))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 6 11)
      (EdgeClosure.trans
        (EdgeClosure.row 11 6 9
          (hrows ({ center := 11, support := {6, 9} } : RowChoice Label)
            (by native_decide) (by native_decide))
          (hrows ({ center := 11, support := {6, 9} } : RowChoice Label)
            (by native_decide) (by native_decide)))
        (EdgeClosure.flip 11 9)) }

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem false_of_negativeRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P negativeChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg
    hreal (negativeCore hrows)
  · change signedArea2 (pointOf 10) (pointOf 16) (pointOf 5) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (10 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 7) (pointOf 16) (pointOf 5) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (7 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_positiveRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P positiveChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core
    hreal (positiveCore hrows)
  · change 0 < signedArea2 (pointOf 6) (pointOf 0) (pointOf 11)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (6 : Label)) (k := (11 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 9) (pointOf 0) (pointOf 11)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (9 : Label)) (k := (11 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorOrderHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ bisectorOrderHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_negativeRows hreal source.boundary_ccw
      (positiveRowsMatch_negative source source.model.order direction rfl hsame hall)
  · exact false_of_positiveRows hreal source.boundary_ccw
      (positiveRowsMatch_positive source source.model.order direction rfl hsame hall)

/-- One three-row two-circle clause for a named source order and reflected
placement. -/
def bisectorOrderClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (bisectorOrderHits order direction)

theorem sourceAssign_bisectorOrderClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (bisectorOrderClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorOrderHits source order direction horder.symm hall

/-- Complete orbit: two named source orders and both reflections. -/
def bisectorOrderClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => bisectorOrderClause order direction

theorem bisectorOrderClauses_length : bisectorOrderClauses.length = 4 := by
  native_decide

theorem sourceAssign_bisectorOrderClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ bisectorOrderClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [bisectorOrderClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_bisectorOrderClause source order direction

/-- Lean-owned successor root after the three-row two-circle orbit. -/
def extendedBisectorOrderCnf : Std.Sat.CNF Atom :=
  extendedFourthRowCnf ++ bisectorOrderClauses

theorem extendedBisectorOrderCnf_clause_count :
    extendedBisectorOrderCnf.length = 5846100 := by
  simp [extendedBisectorOrderCnf, extendedFourthRowCnf_clause_count,
    bisectorOrderClauses_length]

/-- The order-zero forward clause is exactly the smallest new obstruction in
the replayed thirteenth model. -/
theorem orderZero_forward_hits :
    bisectorOrderHits 0 .forward =
      [(16, 7), (16, 14), (7, 16), (7, 14), (9, 7), (9, 16)] := by
  native_decide

/-- Gate B for the successor root containing the thirteenth-model
refinement. -/
theorem sourceAssign_extendedBisectorOrderCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedBisectorOrderCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedBisectorOrderCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedFourthRowCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_bisectorOrderClauses source clause hnew

/-- Certificate-to-source landing contract for the three-row two-circle child
root. -/
theorem false_of_sourceRealization_of_extendedBisectorOrderCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedBisectorOrderCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedBisectorOrderCnf source⟩

#print axioms sourceAssign_bisectorOrderClause
#print axioms sourceAssign_extendedBisectorOrderCnf

end ATailBlockerVExactSeventeenFourPointTwoCircleBisectorRows
end Problem97
