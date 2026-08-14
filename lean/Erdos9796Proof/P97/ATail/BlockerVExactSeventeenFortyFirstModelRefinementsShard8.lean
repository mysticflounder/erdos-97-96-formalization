/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 8. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 15), (3, 16), (7, 9), (7, 15), (9, 3), (9, 14), (10, 2), (10, 3), (14, 9), (14, 16), (16, 2), (16, 14)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {9, 15} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {2, 3} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {0, 7} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {1, 7} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14, .row 14 16 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 2, .flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(3, 15), (3, 16), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 3, support := {15, 16} },
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
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨0, 1, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(1, 12), [.flip 1 12, .row 12 1 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 11, .flip 14 11, .row 11 14 15, .flip 11 15, .row 15 11 1, .flip 15 1], (1, 15)⟩
      path2 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩
      path3 := ⟨(1, 16), [], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 15), [.row 4 15 16], (4, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 2, .flip 0 2, .row 2 0 5, .flip 2 5, .row 5 2 1, .flip 5 1, .row 1 5 15], (1, 15)⟩
      path2 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(0, 15), [], (0, 15)⟩ } },
  { hits := [(5, 3), (5, 15), (9, 3), (9, 8), (11, 14), (11, 15), (14, 8), (14, 11), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 9, support := {3, 8} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {8, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 8} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {8, 13} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 11], (0, 11)⟩
      path1 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path2 := ⟨(0, 7), [], (0, 7)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 8], (2, 8)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 3), (8, 9), (9, 3), (9, 8), (11, 5), (11, 15), (14, 9), (14, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {3, 8} },
        { center := 11, support := {5, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {7, 13} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨5, 9, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(11, 14), [.flip 11 14, .row 14 11 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 5), [.row 2 5 7], (2, 7)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 11], (5, 11)⟩
      path3 := ⟨(7, 13), [.row 7 13 8, .flip 7 8, .row 8 7 13], (8, 13)⟩ } },
  { hits := [(7, 9), (7, 15), (9, 3), (9, 14), (10, 1), (10, 3), (11, 14), (11, 15), (14, 9), (14, 11), (15, 1), (15, 11)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {1, 3} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨1, 3, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ } },
  { hits := [(0, 12), (0, 14), (0, 16), (8, 9), (8, 12), (9, 8), (9, 14), (12, 0), (12, 9), (14, 8), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 14, 16} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 8} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 16, support := {0, 2, 4} }]
    forwardData := {
      firstQuad := ⟨0, 8, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 12], (0, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 8, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 8], (2, 8)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4], (4, 16)⟩ } },
  { hits := [(0, 12), (0, 16), (8, 9), (8, 12), (9, 8), (9, 14), (12, 0), (12, 9), (14, 8), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7, 8} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨8, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(8, 14), [.flip 8 14, .row 14 8 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 12], (8, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(8, 13), [], (8, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 7], (2, 7)⟩
      path1 := ⟨(3, 8), [], (3, 8)⟩
      path2 := ⟨(3, 7), [], (3, 7)⟩
      path3 := ⟨(2, 8), [.row 2 8 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8
end Problem97
