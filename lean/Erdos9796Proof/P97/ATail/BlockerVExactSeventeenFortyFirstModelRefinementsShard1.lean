/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 1. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (14, 8), (14, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 14, support := {8, 11} }]
    reverseChoices := [{ center := 2, support := {5, 8} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 14), [], (10, 14)⟩
      path2 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 5), [.row 2 5 8], (2, 8)⟩
      path1 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ } },
  { hits := [(4, 6), (4, 10), (11, 5), (11, 10), (13, 5), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 11, support := {5, 10} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 5, support := {6, 11} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(5, 6), [.row 5 6 11], (5, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(5, 3), (5, 15), (7, 9), (7, 15), (8, 3), (8, 9)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 7, support := {9, 15} },
        { center := 8, support := {3, 9} }]
    reverseChoices := [{ center := 8, support := {7, 13} },
        { center := 9, support := {1, 7} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15], (5, 15)⟩
      path1 := ⟨(7, 15), [.row 7 15 9], (7, 9)⟩
      path2 := ⟨(3, 7), [], (3, 7)⟩
      path3 := ⟨(8, 9), [.row 8 9 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 8), [], (1, 8)⟩
      path1 := ⟨(11, 13), [.row 11 13 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 13], (8, 13)⟩
      path3 := ⟨(1, 9), [.flip 1 9, .row 9 1 7, .flip 9 7], (7, 9)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 8), (9, 14), (14, 8), (14, 9)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(6, 10), [], (6, 10)⟩
      path2 := ⟨(8, 10), [], (8, 10)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 8], (2, 8)⟩
      path3 := ⟨(3, 10), [], (3, 10)⟩ } },
  { hits := [(8, 3), (8, 9), (9, 3), (9, 8), (14, 8), (14, 9)]
    forwardChoices := [{ center := 8, support := {3, 9} },
        { center := 9, support := {3, 8} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {7, 13} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 9, .flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(9, 15), [], (9, 15)⟩
      path2 := ⟨(9, 14), [.flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(8, 15), [], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 7), [.row 2 7 8], (2, 8)⟩
      path1 := ⟨(8, 14), [], (8, 14)⟩
      path2 := ⟨(8, 13), [.row 8 13 7, .flip 8 7, .row 7 8 13], (7, 13)⟩
      path3 := ⟨(7, 14), [], (7, 14)⟩ } },
  { hits := [(8, 9), (8, 12), (14, 9), (14, 11), (15, 11), (15, 12)]
    forwardChoices := [{ center := 8, support := {9, 12} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {11, 12} }]
    reverseChoices := [{ center := 1, support := {4, 5} },
        { center := 2, support := {5, 7} },
        { center := 8, support := {4, 7} }]
    forwardData := {
      firstQuad := ⟨8, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(8, 11), [], (8, 11)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(5, 8), [], (5, 8)⟩
      path2 := ⟨(2, 5), [.row 2 5 7], (2, 7)⟩
      path3 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(10, 1), (10, 2), (12, 0), (12, 1), (16, 0), (16, 2)]
    forwardChoices := [{ center := 10, support := {1, 2} },
        { center := 12, support := {0, 1} },
        { center := 16, support := {0, 2} }]
    reverseChoices := [{ center := 0, support := {14, 16} },
        { center := 4, support := {15, 16} },
        { center := 6, support := {14, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 12), [.flip 1 12, .row 12 1 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 16), [], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 14), [], (4, 14)⟩
      path1 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩
      path2 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩
      path3 := ⟨(4, 15), [.row 4 15 16], (4, 16)⟩ } }
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 7 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 28 := by
  native_decide

theorem sourceAssign_refinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ refinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [refinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

#print axioms sourceAssign_refinementClauses
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1
end Problem97
