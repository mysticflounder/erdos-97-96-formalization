/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector

/-!
# Eight-incidence two-Kalmanson refinement of the sparse-six four-row root

The active-selector SAT survivor contains a checked two-Kalmanson cancellation
using four selected rows and eight positive incidences. This module banks the
two named-order and two orientation placements, appends their four clauses to
the original four-row root, and exposes the conditional finite-UNSAT landing
contract.

The exact-rational projection records have SHA-256 digests
`b9136fce39543a36ae7aa6dd9a85b9e2172f1ddba6a2c903c2cc4e8d367eced0`
and `d8d6a88343aec65a464a30512925353278c65c2bbc61cf7b129886ad54e8383e`.
The Lean checks below replay the projected row choices, paths, ordered
quadrilaterals, and cancellation permutations; the digests are provenance,
not proof inputs.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellation

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open
  ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Four positional rows used by the forward projected certificate. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 3} },
    { center := 3, support := {9, 16} },
    { center := 8, support := {3, 16} },
    { center := 16, support := {1, 9} }]

/-- Four reflected positional rows used by the reverse projected certificate. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {7, 15} },
    { center := 8, support := {0, 13} },
    { center := 13, support := {0, 7} },
    { center := 16, support := {13, 15} }]

/-- The eight positive positional incidences consumed by the certificate. -/
def forwardHits : List Hit :=
  [(16, 9), (16, 1), (3, 9), (3, 16),
    (8, 16), (8, 3), (0, 3), (0, 1)]

/-- Place the eight-incidence occurrence in one named order and orientation. -/
def eightHitTwoKalmansonHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

/-- Forward certificate projected from the authenticated active-selector model. -/
def forwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 3, 16⟩
  firstForm := .adjacentSides
  secondQuad := ⟨3, 8, 9, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 2, 3, 1⟩
  path0 := ⟨(0, 1), [.row 0 1 3], (0, 3)⟩
  path1 := ⟨(3, 16), [.row 3 16 9], (3, 9)⟩
  path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 16], (8, 16)⟩
  path3 := ⟨(9, 16),
    [.flip 9 16, .row 16 9 1, .flip 16 1],
    (1, 16)⟩ }

/-- Reverse certificate projected independently from the reflected source rows. -/
def reverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 13, 15, 16⟩
  firstForm := .adjacentSides
  secondQuad := ⟨0, 7, 8, 13⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 1, 0, 2⟩
  path0 := ⟨(0, 13),
    [.flip 0 13, .row 13 0 7, .flip 13 7],
    (7, 13)⟩
  path1 := ⟨(15, 16),
    [.flip 15 16, .row 16 15 13, .flip 16 13],
    (13, 16)⟩
  path2 := ⟨(0, 7), [.row 0 7 15], (0, 15)⟩
  path3 := ⟨(8, 13), [.row 8 13 0, .flip 8 0], (0, 8)⟩ }

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
    (hall : ∀ hit ∈ eightHitTwoKalmansonHits order direction,
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
      simp only [eightHitTwoKalmansonHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ eightHitTwoKalmansonHits order direction,
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
      simp only [eightHitTwoKalmansonHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem false_of_eightHitTwoKalmansonHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ eightHitTwoKalmansonHits order direction,
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

/-- One guarded eight-incidence two-Kalmanson cancellation clause. -/
def eightHitTwoKalmansonClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (eightHitTwoKalmansonHits order direction)

theorem sourceAssign_eightHitTwoKalmansonClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (eightHitTwoKalmansonClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_eightHitTwoKalmansonHits source order direction horder.symm hall

/-- Complete orbit over both named source orders and cyclic orientations. -/
def eightHitTwoKalmansonClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => eightHitTwoKalmansonClause order direction

theorem eightHitTwoKalmansonClauses_length :
    eightHitTwoKalmansonClauses.length = 4 := by
  decide

theorem sourceAssign_eightHitTwoKalmansonClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ eightHitTwoKalmansonClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [eightHitTwoKalmansonClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_eightHitTwoKalmansonClause source order direction

/-- Lean-owned successor of the original cumulative sparse-six four-row root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf :
    Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorCnf ++
    eightHitTwoKalmansonClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf.length =
      7409261 := by
  simp [extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf,
    extendedCocircularOrderSparseSixPointFourRowBisectorCnf_length,
    eightHitTwoKalmansonClauses_length]

/-- The order-zero forward occurrence has the exact active-selector labels. -/
theorem orderZero_forward_hits :
    eightHitTwoKalmansonHits 0 .forward =
      [(14, 15), (14, 6), (11, 15), (11, 14),
        (2, 14), (2, 11), (0, 11), (0, 6)] := by
  decide

/-- Exact DIMACS clause that rejects the authenticated active-selector model. -/
theorem orderZero_forward_clause_dimacs :
    (eightHitTwoKalmansonClause 0 .forward).map litToDimacs =
      [-307, -254, -245, -203, -202, -49, -46, -12, -7] := by
  decide

/-- Exact reflected DIMACS clause in named order zero. -/
theorem orderZero_reverse_clause_dimacs :
    (eightHitTwoKalmansonClause 0 .reverse).map litToDimacs =
      [-307, -8, -14, -93, -86, -35, -40, -244, -252] := by
  decide

/-- Exact forward DIMACS clause in named order one. -/
theorem orderOne_forward_clause_dimacs :
    (eightHitTwoKalmansonClause 1 .forward).map litToDimacs =
      [-308, -254, -245, -203, -202, -49, -46, -12, -7] := by
  decide

/-- Exact reflected DIMACS clause in named order one. -/
theorem orderOne_reverse_clause_dimacs :
    (eightHitTwoKalmansonClause 1 .reverse).map litToDimacs =
      [-308, -8, -14, -93, -86, -35, -40, -244, -252] := by
  decide

/-
The new orbit is appended directly to the 7,409,257-clause original parent.
Exact non-membership in that fully expanded list is intentionally not reduced
inside Lean: kernel reduction of the multi-million-clause membership query is
not a cheap regression. The four clause values above are serialization
sentinels, not a novelty proof. Before a solver launch, the materializer must
compare them with the exact parent CNF bytes and fail if the suffix adds no new
clause.
-/

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_eightHitTwoKalmansonClauses source clause hsuffix

/-- Conditional finite-UNSAT landing contract for the eight-incidence child. -/
theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf_unsat
    {A : Finset ℝ²}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf
      source horder⟩

#print axioms forwardData_check
#print axioms reverseData_check
#print axioms sourceAssign_eightHitTwoKalmansonClause
#print axioms orderZero_forward_clause_dimacs
#print axioms orderZero_reverse_clause_dimacs
#print axioms orderOne_forward_clause_dimacs
#print axioms orderOne_reverse_clause_dimacs
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf
#print axioms
  false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonCnf_unsat

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellation
end Problem97
