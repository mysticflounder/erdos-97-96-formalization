/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson

/-!
# Cancellation refinements after the canary two-Kalmanson root

The independently replayed SAT model exposes four further source-valid
two-Kalmanson cancellation occurrences. Their complete named-order and
orientation orbits contain sixteen clauses. Nine survive the immediate-parent
subsumption scan and form the Lean-owned production suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- Four source-valid cancellation occurrences in the authenticated successor model. -/
def cancellationOccurrences : List CancellationOccurrence := [
  { hits := [(4, 12), (4, 14), (5, 7), (5, 9), (7, 9), (7, 14), (9, 7), (9, 12)]
    forwardChoices := [{ center := 4, support := {12, 14} },
        { center := 5, support := {7, 9} },
        { center := 7, support := {9, 14} },
        { center := 9, support := {7, 12} }]
    reverseChoices := [{ center := 7, support := {4, 9} },
        { center := 9, support := {2, 7} },
        { center := 11, support := {7, 9} },
        { center := 12, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨4, 7, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(4, 14), [.row 4 14 12], (4, 12)⟩
      path2 := ⟨(5, 7), [.row 5 7 9], (5, 9)⟩
      path3 := ⟨(9, 12), [.row 9 12 7, .flip 9 7, .row 7 9 14], (7, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(2, 12), [.flip 2 12, .row 12 2 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 9, .flip 7 9, .row 9 7 2,
        .flip 9 2], (2, 9)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 7, .flip 11 7], (7, 11)⟩ } },
  { hits := [(5, 7), (5, 9), (7, 9), (7, 14), (9, 7), (9, 15), (12, 14), (12, 15)]
    forwardChoices := [{ center := 5, support := {7, 9} },
        { center := 7, support := {9, 14} },
        { center := 9, support := {7, 15} },
        { center := 12, support := {14, 15} }]
    reverseChoices := [{ center := 4, support := {1, 2} },
        { center := 7, support := {1, 9} },
        { center := 9, support := {2, 7} },
        { center := 11, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨7, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 9, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(5, 7), [.row 5 7 9], (5, 9)⟩
      path3 := ⟨(9, 15), [.row 9 15 7, .flip 9 7, .row 7 9 14], (7, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path1 := ⟨(1, 9), [], (1, 9)⟩
      path2 := ⟨(1, 7), [.flip 1 7, .row 7 1 9, .flip 7 9, .row 9 7 2,
        .flip 9 2], (2, 9)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 7, .flip 11 7], (7, 11)⟩ } },
  { hits := [(8, 3), (8, 10), (10, 3), (10, 8), (13, 2), (13, 10), (15, 2), (15, 8)]
    forwardChoices := [{ center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} },
        { center := 13, support := {2, 10} },
        { center := 15, support := {2, 8} }]
    reverseChoices := [{ center := 1, support := {8, 14} },
        { center := 3, support := {6, 14} },
        { center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} }]
    forwardData := {
      firstQuad := ⟨2, 8, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 10, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 13), [], (8, 13)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3,
        .flip 10 3], (3, 10)⟩
      path3 := ⟨(10, 13), [.flip 10 13, .row 13 10 2, .flip 13 2], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(1, 14), [.row 1 14 8], (1, 8)⟩
      path2 := ⟨(3, 6), [.row 3 6 14], (3, 14)⟩
      path3 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13], (6, 13)⟩ } },
  { hits := [(4, 5), (4, 12), (6, 4), (6, 8), (8, 6), (8, 10), (10, 8), (10, 12),
      (11, 5), (11, 6), (13, 4), (13, 10)]
    forwardChoices := [{ center := 4, support := {5, 12} },
        { center := 6, support := {4, 8} },
        { center := 8, support := {6, 10} },
        { center := 10, support := {8, 12} },
        { center := 11, support := {5, 6} },
        { center := 13, support := {4, 10} }]
    reverseChoices := [{ center := 3, support := {6, 12} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {4, 8} },
        { center := 8, support := {6, 10} },
        { center := 10, support := {8, 12} },
        { center := 12, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨4, 10, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 6, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(10, 12), [.row 10 12 8, .flip 10 8, .row 8 10 6, .flip 8 6,
        .row 6 8 4, .flip 6 4], (4, 6)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(4, 5), [.row 4 5 12], (4, 12)⟩
      path3 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(4, 6), [.flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 10,
        .flip 8 10, .row 10 8 12], (10, 12)⟩
      path1 := ⟨(3, 12), [.row 3 12 6], (3, 6)⟩
      path2 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 4, .flip 12 4], (4, 12)⟩ } }
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 4 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- Complete clause orbits of the four cancellation occurrences. -/
def fullModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem fullModelRefinementClauses_length : fullModelRefinementClauses.length = 16 := by
  native_decide

/-- Global clause indices surviving the immediate-parent subsumption scan. -/
def novelModelRefinementClauseIndices : List Nat :=
  [0, 1, 2, 3, 4, 6, 8, 10, 12]

theorem novelModelRefinementClauseIndices_length :
    novelModelRefinementClauseIndices.length = 9 := by
  native_decide

/-- Parent-unsubsumed production suffix in the original orbit order. -/
def modelRefinementClauses : Std.Sat.CNF Atom :=
  fullModelRefinementClauses.zipIdx.filterMap fun (clause, index) =>
    if index ∈ novelModelRefinementClauseIndices then some clause else none

theorem modelRefinementClauses_length : modelRefinementClauses.length = 9 := by
  native_decide

theorem modelRefinementClauses_subset :
    ∀ clause ∈ modelRefinementClauses, clause ∈ fullModelRefinementClauses := by
  native_decide

theorem sourceAssign_fullModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fullModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fullModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

theorem sourceAssign_modelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ modelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_fullModelRefinementClauses source clause
    (modelRefinementClauses_subset clause hclause)

/-- Lean-owned successor of the canary two-Kalmanson root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf :
    Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf ++
    modelRefinementClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf.length =
      7409295 := by
  simp only [
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf,
    List.length_append,
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf_length,
    modelRefinementClauses_length]

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf =
        true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_modelRefinementClauses source clause hsuffix

#print axioms cancellationOccurrences_all_check
#print axioms sourceAssign_fullModelRefinementClauses
#print axioms modelRefinementClauses_subset
#print axioms sourceAssign_modelRefinementClauses
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements
end Problem97
