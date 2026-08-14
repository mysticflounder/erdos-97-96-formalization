/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 3. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 14), (0, 16), (14, 11), (14, 16), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 5, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 14), [], (5, 14)⟩
      path1 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩
      path2 := ⟨(11, 14), [.flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 11, .flip 15 11], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 11), [], (2, 11)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(2, 5), [.row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩
      path3 := ⟨(1, 11), [.row 1 11 5], (1, 5)⟩ } },
  { hits := [(1, 4), (1, 8), (8, 3), (8, 9), (9, 3), (9, 8), (12, 4), (12, 9)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {4, 9} }]
    reverseChoices := [{ center := 4, support := {7, 12} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {7, 13} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 9, .flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path1 := ⟨(8, 13), [.row 8 13 7, .flip 8 7, .row 7 8 13], (7, 13)⟩
      path2 := ⟨(4, 8), [], (4, 8)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (7, 9), (7, 13), (8, 3), (8, 9), (9, 3), (9, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 7, support := {9, 13} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {3, 8} }]
    reverseChoices := [{ center := 7, support := {8, 13} },
        { center := 8, support := {7, 13} },
        { center := 9, support := {3, 7} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 3, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 9, .flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(1, 9), [], (1, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 13), [], (3, 13)⟩
      path2 := ⟨(8, 13), [.row 8 13 7, .flip 8 7, .row 7 8 13], (7, 13)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(4, 6), (4, 11), (5, 6), (5, 15), (11, 5), (11, 15), (15, 5), (15, 11)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {5, 15} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 5, support := {1, 11} },
        { center := 11, support := {1, 10} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨4, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 6, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(4, 11), [.row 4 11 6], (4, 6)⟩
      path2 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(4, 10), [], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 10, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 10, .flip 12 10], (10, 12)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 11], (5, 11)⟩
      path3 := ⟨(6, 12), [], (6, 12)⟩ } },
  { hits := [(5, 8), (5, 15), (11, 5), (11, 15), (14, 8), (14, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 11, support := {5, 15} },
        { center := 14, support := {8, 11} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {5, 8} },
        { center := 5, support := {1, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨4, 8, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(11, 14), [.flip 11 14, .row 14 11 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(4, 11), [], (4, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 5), [.row 2 5 8], (2, 8)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(2, 6), [], (2, 6)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 11], (5, 11)⟩ } },
  { hits := [(7, 9), (7, 15), (9, 8), (9, 14), (11, 14), (11, 15), (14, 8), (14, 9)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨7, 8, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(7, 14), [], (7, 14)⟩
      path2 := ⟨(11, 14), [.row 11 14 15], (11, 15)⟩
      path3 := ⟨(7, 15), [.row 7 15 9], (7, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(1, 8), [], (1, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 8], (2, 8)⟩
      path3 := ⟨(1, 9), [.flip 1 9, .row 9 1 7, .flip 9 7], (7, 9)⟩ } },
  { hits := [(7, 9), (7, 15), (11, 5), (11, 15), (14, 9), (14, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 11, support := {5, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 11} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨5, 9, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(11, 14), [.flip 11 14, .row 14 11 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 5), [.row 2 5 7], (2, 7)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 11), [.row 1 11 5, .flip 1 5, .row 5 1 11], (5, 11)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3
end Problem97
