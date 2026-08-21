/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellation

/-!
# Six-incidence two-circle bisector refinement of the true EightHit root

The terminal order-zero survivor of the true eight-incidence two-Kalmanson root
contains three selected rows that make two distinct points equidistant from the
same two centers. Boundary order places those points on the same strict side of
the center chord. This module banks the complete named-order and orientation
orbit, appends its four clauses to the true EightHit root, and exposes the
conditional finite-UNSAT landing contract.

The active order-zero reverse clause uses the six source incidences
`(3,8), (3,6), (8,4), (8,6), (6,8), (6,4)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisector

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open
  ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Three positional rows used by the positive-orientation geometry branch. -/
def positiveChoices : List (RowChoice Label) :=
  [{ center := 5, support := {14, 15} },
    { center := 14, support := {4, 15} },
    { center := 15, support := {4, 14} }]

/-- Reflection of the three positional rows. -/
def negativeChoices : List (RowChoice Label) :=
  [{ center := 11, support := {1, 2} },
    { center := 2, support := {1, 12} },
    { center := 1, support := {2, 12} }]

/-- The six positive positional incidences consumed by the two-circle core. -/
def sixHitBisectorBaseHits : List Hit :=
  [(5, 14), (5, 15), (14, 4), (14, 15), (15, 14), (15, 4)]

/-- Place the six-incidence occurrence in one named order and orientation. -/
def sixHitBisectorHits (order : NamedOrder) (direction : Orientation) : List Hit :=
  sixHitBisectorBaseHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

private theorem positiveHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ positiveChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ sixHitBisectorBaseHits := by
  decide +revert

private theorem reflectedNegativeHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ negativeChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ sixHitBisectorBaseHits := by
  decide +revert

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

private theorem positiveRowsMatch_positive {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ sixHitBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      positiveChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [sixHitBisectorHits, List.mem_map]
      exact ⟨(choice.center, point),
        positiveHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_negative {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ sixHitBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      negativeChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [sixHitBisectorHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedNegativeHit_of_choice choice hchoice point hpoint, rfl⟩)

private def positiveCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P positiveChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 5
  v := 4
  u := 14
  y := 15
  huy := by decide
  qu_qy := EdgeClosure.row 5 14 15
    (hrows ({ center := 5, support := {14, 15} } : RowChoice Label)
      (by decide) (by decide))
    (hrows ({ center := 5, support := {14, 15} } : RowChoice Label)
      (by decide) (by decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(14, 4), [.row 14 4 15, .flip 14 15, .row 15 14 4],
      (15, 4)⟩ (by decide) }

private def negativeCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P negativeChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 11
  v := 12
  u := 2
  y := 1
  huy := by decide
  qu_qy := EdgeClosure.row 11 2 1
    (hrows ({ center := 11, support := {1, 2} } : RowChoice Label)
      (by decide) (by decide))
    (hrows ({ center := 11, support := {1, 2} } : RowChoice Label)
      (by decide) (by decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(2, 12), [.row 2 12 1, .flip 2 1, .row 1 2 12],
      (1, 12)⟩ (by decide) }

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem false_of_positiveRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P positiveChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core
    hreal (positiveCore hrows)
  · change 0 < signedArea2 (pointOf 14) (pointOf 5) (pointOf 4)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (5 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 5) (pointOf 4)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (5 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_negativeRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P negativeChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg
    hreal (negativeCore hrows)
  · change signedArea2 (pointOf 2) (pointOf 11) (pointOf 12) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (11 : Label)) (k := (12 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 1) (pointOf 11) (pointOf 12) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (11 : Label)) (k := (12 : Label))
      (by decide) (by decide)

private theorem false_of_sixHitBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ sixHitBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_positiveRows hreal source.boundary_ccw
      (positiveRowsMatch_positive source source.model.order direction rfl hsame hall)
  · exact false_of_negativeRows hreal source.boundary_ccw
      (positiveRowsMatch_negative source source.model.order direction rfl hsame hall)

/-- One guarded six-incidence two-circle bisector clause. -/
def sixHitBisectorClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (sixHitBisectorHits order direction)

theorem sourceAssign_sixHitBisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (sixHitBisectorClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_sixHitBisectorHits source order direction horder.symm hall

/-- Complete orbit over both named source orders and cyclic orientations. -/
def sixHitBisectorClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => sixHitBisectorClause order direction

theorem sixHitBisectorClauses_length : sixHitBisectorClauses.length = 4 := by
  decide

theorem sourceAssign_sixHitBisectorClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ sixHitBisectorClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [sixHitBisectorClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_sixHitBisectorClause source order direction

/-- Lean-owned successor of the true EightHit two-Kalmanson root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf :
    Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf ++
    sixHitBisectorClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf.length =
      7409265 := by
  simp [extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf,
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf_length,
    sixHitBisectorClauses_length]

/-- The reverse order-zero occurrence has the exact terminal-model labels. -/
theorem orderZero_reverse_hits :
    sixHitBisectorHits 0 .reverse =
      [(3, 8), (3, 6), (8, 4), (8, 6), (6, 8), (6, 4)] := by
  decide

/-- Exact DIMACS clause that rejects the authenticated terminal model. -/
theorem orderZero_reverse_clause_dimacs :
    (sixHitBisectorClause 0 .reverse).map litToDimacs =
      [-307, -60, -58, -141, -143, -111, -107] := by
  decide

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf =
        true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_sixHitBisectorClauses source clause hsuffix

/-- Conditional finite-UNSAT landing contract for the six-incidence child. -/
theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf_unsat
    {A : Finset ℝ²}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf =
          true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf
      source horder⟩

#print axioms sourceAssign_sixHitBisectorClause
#print axioms orderZero_reverse_clause_dimacs
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf
#print axioms
  false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf_unsat

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisector
end Problem97
