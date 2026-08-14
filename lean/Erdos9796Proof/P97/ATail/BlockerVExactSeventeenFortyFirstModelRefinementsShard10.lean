/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 10. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 12), (0, 16), (1, 10), (1, 13), (2, 12), (2, 13), (9, 10), (9, 14), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {12, 13} },
        { center := 9, support := {10, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 6} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 7], (4, 7)⟩
      path3 := ⟨(4, 15), [], (4, 15)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (4, 6), (4, 10), (9, 10), (9, 14), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 4, support := {6, 10} },
        { center := 9, support := {10, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(2, 10), [], (2, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 7], (4, 7)⟩
      path3 := ⟨(4, 12), [], (4, 12)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (5, 6), (5, 15), (11, 14), (11, 15), (14, 11), (14, 16), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 5, support := {1, 2} },
        { center := 11, support := {1, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨0, 5, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 12), [], (5, 12)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (4, 10), (4, 11), (9, 10), (9, 14), (12, 0), (12, 9), (14, 9), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 4, support := {10, 11} },
        { center := 9, support := {10, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {5, 6} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨9, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(9, 11), [], (9, 11)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 7], (4, 7)⟩
      path3 := ⟨(4, 12), [], (4, 12)⟩ } },
  { hits := [(0, 12), (0, 16), (5, 3), (5, 15), (8, 3), (8, 12), (11, 14), (11, 15), (14, 11), (14, 16), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 5, support := {3, 15} },
        { center := 8, support := {3, 12} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 5, support := {1, 2} },
        { center := 8, support := {4, 13} },
        { center := 11, support := {1, 13} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path1 := ⟨(8, 16), [], (8, 16)⟩
      path2 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩ } },
  { hits := [(0, 12), (0, 16), (6, 9), (6, 14), (8, 3), (8, 12), (9, 3), (9, 8), (12, 0), (12, 9), (14, 8), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 6, support := {9, 14} },
        { center := 8, support := {3, 12} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 8} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {4, 13} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path1 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 8], (2, 8)⟩
      path3 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(0, 12), (0, 16), (7, 4), (7, 15), (11, 14), (11, 15), (12, 0), (12, 4), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 7, support := {4, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 9, support := {1, 12} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 7, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(2, 7), [], (2, 7)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(2, 12), [], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path3 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10
end Problem97
