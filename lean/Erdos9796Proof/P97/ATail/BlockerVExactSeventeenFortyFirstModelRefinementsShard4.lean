/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 4. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 12), (3, 4), (3, 15), (5, 3), (5, 15), (13, 4), (13, 5), (15, 5), (15, 12)]
    forwardChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {4, 15} },
        { center := 5, support := {3, 15} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {5, 12} }]
    reverseChoices := [{ center := 1, support := {4, 11} },
        { center := 3, support := {11, 12} },
        { center := 11, support := {1, 13} },
        { center := 13, support := {1, 12} },
        { center := 16, support := {4, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 3), [.row 0 3 12], (0, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 5, .flip 15 5, .row 5 15 3, .flip 5 3], (3, 5)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 4), [.row 1 4 11, .flip 1 11, .row 11 1 13], (11, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 3), (0, 14), (3, 4), (3, 16), (9, 3), (9, 14), (12, 4), (12, 9), (14, 9), (14, 16)]
    forwardChoices := [{ center := 0, support := {3, 14} },
        { center := 3, support := {4, 16} },
        { center := 9, support := {3, 14} },
        { center := 12, support := {4, 9} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 4, support := {7, 12} },
        { center := 7, support := {2, 13} },
        { center := 13, support := {0, 12} },
        { center := 16, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 3), [.row 0 3 14], (0, 14)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 3), (0, 14), (3, 15), (3, 16), (7, 9), (7, 15), (9, 3), (9, 14), (14, 9), (14, 16)]
    forwardChoices := [{ center := 0, support := {3, 14} },
        { center := 3, support := {15, 16} },
        { center := 7, support := {9, 15} },
        { center := 9, support := {3, 14} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {1, 7} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(0, 3), [.row 0 3 14], (0, 14)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 12), (0, 14), (1, 4), (1, 8), (8, 9), (8, 12), (9, 8), (9, 14), (12, 4), (12, 9)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 1, support := {4, 8} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {4, 9} }]
    reverseChoices := [{ center := 4, support := {7, 12} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 15, support := {8, 12} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨0, 9, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 12], (0, 12)⟩
      path2 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path3 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 12), (0, 16), (11, 5), (11, 14), (14, 11), (14, 16), (15, 11), (15, 12), (16, 5), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 11, support := {5, 14} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 5, support := {2, 11} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨0, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(0, 11), [], (0, 11)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(5, 16), [], (5, 16)⟩
      path2 := ⟨(5, 11), [.row 5 11 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (5, 8), (5, 15), (11, 5), (11, 15), (15, 5), (15, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {8, 15} },
        { center := 11, support := {5, 15} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 5, support := {1, 11} },
        { center := 11, support := {1, 8} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 11], (5, 11)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(2, 1), (2, 12), (6, 1), (6, 14), (8, 9), (8, 12), (9, 8), (9, 14), (14, 8), (14, 9)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 6, support := {1, 14} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 8], (2, 8)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4
end Problem97
