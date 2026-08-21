/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector

/-!
# Two-Kalmanson cancellation refinement of the sparse-six four-row root

The SAT-profile canary for the physical-none cell contains two selected rows
with the same two positive incidences.  The exact-rational producer projects
those four incidences to a checked two-Kalmanson cancellation certificate.
This module banks its named-order and reflection orbit, appends four clauses
to the cumulative sparse-six root, and exposes the finite-UNSAT landing
contract used by the physical-cell campaign.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellation

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open
  ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The two positional rows supplying the forward certificate. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 5, support := {6, 7} },
    { center := 11, support := {6, 7} }]

/-- Reflection of the two positional rows supplying the reverse certificate. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {9, 10} },
    { center := 11, support := {9, 10} }]

/-- The four positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(5, 6), (5, 7), (11, 6), (11, 7)]

/-- Transport the positional occurrence into one named source order and orientation. -/
def twoKalmansonCancellationHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

/-- Checked forward certificate projected from the authenticated canary rows. -/
def forwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨6, 7, 11, 13⟩
  firstForm := .innerOuter
  secondQuad := ⟨5, 6, 7, 13⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 3, 2, 1⟩
  path0 := ⟨(7, 11),
    [.flip 7 11, .row 11 7 6, .flip 11 6],
    (6, 11)⟩
  path1 := ⟨(6, 13), [], (6, 13)⟩
  path2 := ⟨(5, 6), [.row 5 6 7], (5, 7)⟩
  path3 := ⟨(7, 13), [], (7, 13)⟩ }

/-- Checked certificate projected independently from the reflected canary rows. -/
def reverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨9, 10, 11, 15⟩
  firstForm := .innerOuter
  secondQuad := ⟨5, 9, 10, 15⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 3, 2, 1⟩
  path0 := ⟨(10, 11),
    [.flip 10 11, .row 11 10 9, .flip 11 9],
    (9, 11)⟩
  path1 := ⟨(9, 15), [], (9, 15)⟩
  path2 := ⟨(5, 9), [.row 5 9 10], (5, 10)⟩
  path3 := ⟨(10, 15), [], (10, 15)⟩ }

theorem forwardData_check : forwardData.check forwardChoices = true := by
  decide

theorem reverseData_check : reverseData.check reverseChoices = true := by
  decide

private theorem forwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ forwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ forwardHits := by
  decide +revert

private theorem reflectedForwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ reverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ forwardHits := by
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

private theorem positiveRowsMatch_forward {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ twoKalmansonCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      forwardChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [twoKalmansonCancellationHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ twoKalmansonCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      reverseChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [twoKalmansonCancellationHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem false_of_twoKalmansonCancellationHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ twoKalmansonCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal forwardChoices
      (positiveRowsMatch_forward source source.model.order direction rfl hsame hall)
      forwardData forwardData_check
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal reverseChoices
      (positiveRowsMatch_reverse source source.model.order direction rfl hsame hall)
      reverseData reverseData_check

/-- One guarded two-Kalmanson cancellation clause. -/
def twoKalmansonCancellationClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (twoKalmansonCancellationHits order direction)

theorem sourceAssign_twoKalmansonCancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (twoKalmansonCancellationClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_twoKalmansonCancellationHits source order direction horder.symm hall

/-- Complete orbit over both named source orders and cyclic orientations. -/
def twoKalmansonCancellationClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => twoKalmansonCancellationClause order direction

theorem twoKalmansonCancellationClauses_length :
    twoKalmansonCancellationClauses.length = 4 := by
  decide

theorem sourceAssign_twoKalmansonCancellationClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twoKalmansonCancellationClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twoKalmansonCancellationClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_twoKalmansonCancellationClause source order direction

/-- Lean-owned successor of the cumulative sparse-six four-row root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf :
    Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorCnf ++
    twoKalmansonCancellationClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf.length =
      7409261 := by
  simp [extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf,
    extendedCocircularOrderSparseSixPointFourRowBisectorCnf_length,
    twoKalmansonCancellationClauses_length]

/-- The order-zero forward occurrence has the exact labels found in the canary. -/
theorem orderZero_forward_hits :
    twoKalmansonCancellationHits 0 .forward =
      [(9, 12), (9, 7), (3, 12), (3, 7)] := by
  decide

/-- The motivating guarded clause has the canonical exact DIMACS literals. -/
theorem orderZero_forward_clause_dimacs :
    (twoKalmansonCancellationClause 0 .forward).map litToDimacs =
      [-307, -166, -161, -64, -59] := by
  decide

/-- Reflection of the motivating clause also has its exact DIMACS literals. -/
theorem orderZero_reverse_clause_dimacs :
    (twoKalmansonCancellationClause 0 .reverse).map litToDimacs =
      [-307, -68, -67, -170, -169] := by
  decide

/-- The second named order has its exact forward DIMACS clause. -/
theorem orderOne_forward_clause_dimacs :
    (twoKalmansonCancellationClause 1 .forward).map litToDimacs =
      [-308, -214, -212, -61, -59] := by
  decide

/-- The second named order has its exact reflected DIMACS clause. -/
theorem orderOne_reverse_clause_dimacs :
    (twoKalmansonCancellationClause 1 .reverse).map litToDimacs =
      [-308, -68, -67, -221, -220] := by
  decide

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_twoKalmansonCancellationClauses source clause hsuffix

/-- Certificate-to-source landing contract for the two-Kalmanson child. -/
theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf_unsat
    {A : Finset ℝ²}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf
      source horder⟩

#print axioms forwardData_check
#print axioms reverseData_check
#print axioms sourceAssign_twoKalmansonCancellationClause
#print axioms orderZero_forward_clause_dimacs
#print axioms orderZero_reverse_clause_dimacs
#print axioms orderOne_forward_clause_dimacs
#print axioms orderOne_reverse_clause_dimacs
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf
#print axioms
  false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf_unsat

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellation
end Problem97
