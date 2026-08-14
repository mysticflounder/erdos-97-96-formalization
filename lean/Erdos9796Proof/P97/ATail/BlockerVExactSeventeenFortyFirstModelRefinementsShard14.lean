/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 14. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 12), (0, 16), (1, 8), (1, 13), (2, 12), (2, 13), (6, 1), (6, 9), (9, 8), (9, 14), (12, 0), (12, 1), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {8, 13} },
        { center := 2, support := {12, 13} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {15, 16} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {7, 15} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 9], (6, 9)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 1), (2, 6), (5, 6), (5, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {1, 6} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 11, support := {1, 10} },
        { center := 14, support := {10, 15} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 2, 5, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path1 := ⟨(5, 6), [.row 5 6 15], (5, 15)⟩
      path2 := ⟨(1, 5), [], (1, 5)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 1), (2, 13), (7, 13), (7, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {1, 13} },
        { center := 7, support := {13, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 9, support := {1, 3} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 2, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path2 := ⟨(1, 7), [], (1, 7)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (4, 6), (4, 11), (7, 4), (7, 15), (11, 14), (11, 15), (12, 0), (12, 4), (14, 11), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 4, support := {6, 11} },
        { center := 7, support := {4, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 14, support := {11, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 9, support := {1, 12} },
        { center := 12, support := {5, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨4, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path1 := ⟨(11, 15), [.row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path3 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (4, 6), (4, 11), (11, 5), (11, 14), (12, 0), (12, 4), (13, 4), (13, 5), (14, 11), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 4, support := {6, 11} },
        { center := 11, support := {5, 14} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {11, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 5} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {2, 11} },
        { center := 12, support := {5, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(5, 11), [.row 5 11 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (5, 6), (5, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 11, support := {1, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 5, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 12), [], (5, 12)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(5, 6), [.row 5 6 15], (5, 15)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 12), (2, 13), (7, 13), (7, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {12, 13} },
        { center := 7, support := {13, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 9, support := {1, 3} },
        { center := 14, support := {3, 4} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 7, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14
end Problem97
