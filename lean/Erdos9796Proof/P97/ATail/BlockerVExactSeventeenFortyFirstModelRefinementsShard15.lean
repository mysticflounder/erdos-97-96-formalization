/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 15. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 12), (0, 16), (3, 2), (3, 15), (10, 1), (10, 2), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {2, 15} },
        { center := 10, support := {1, 2} },
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
        { center := 6, support := {14, 15} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 10, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(1, 10), [.flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(6, 15), [.row 6 15 14], (6, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (5, 3), (5, 15), (8, 3), (8, 12), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 5, support := {3, 15} },
        { center := 8, support := {3, 12} },
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
        { center := 8, support := {4, 13} },
        { center := 11, support := {1, 13} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15], (5, 15)⟩
      path1 := ⟨(8, 15), [], (8, 15)⟩
      path2 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 8), [], (1, 8)⟩
      path1 := ⟨(11, 13), [.row 11 13 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩ } },
  { hits := [(0, 12), (0, 16), (5, 3), (5, 15), (10, 1), (10, 3), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 5, support := {3, 15} },
        { center := 10, support := {1, 3} },
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
        { center := 6, support := {13, 15} },
        { center := 11, support := {1, 13} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 10, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15], (5, 15)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(1, 10), [.flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(11, 13), [.row 11 13 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(6, 15), [.row 6 15 13], (6, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (5, 6), (5, 8), (8, 9), (8, 12), (9, 8), (9, 14), (12, 0), (12, 4), (13, 4), (13, 6), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 5, support := {6, 8} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 3, support := {10, 12} },
        { center := 4, support := {12, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 11, support := {8, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 10, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (6, 1), (6, 9), (7, 9), (7, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 6, support := {1, 9} },
        { center := 7, support := {9, 15} },
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
        { center := 9, support := {1, 7} },
        { center := 10, support := {7, 15} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 6, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 9], (6, 9)⟩
      path1 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path2 := ⟨(1, 7), [], (1, 7)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path1 := ⟨(10, 15), [.row 10 15 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (8, 9), (8, 12), (9, 8), (9, 14), (12, 0), (12, 1), (14, 8), (14, 9), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {8, 9, 11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5, 7, 8} },
        { center := 4, support := {15, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(11, 14), [.flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 5), [.row 2 5 8], (2, 8)⟩
      path1 := ⟨(1, 8), [], (1, 8)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(1, 15), [.row 1 15 5], (1, 5)⟩ } },
  { hits := [(1, 4), (1, 8), (3, 4), (3, 15), (8, 3), (8, 9), (9, 8), (9, 14), (10, 1), (10, 3), (11, 14), (11, 15), (14, 9), (14, 11), (15, 1), (15, 11)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 3, support := {4, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 10, support := {1, 3} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 3, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 4, 8⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(1, 8), [.row 1 8 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 12, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 12, .flip 15 12], (12, 15)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15
end Problem97
