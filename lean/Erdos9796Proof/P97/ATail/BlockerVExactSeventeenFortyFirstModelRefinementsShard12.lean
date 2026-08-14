/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 12. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 15), (3, 16), (5, 8), (5, 15), (8, 3), (8, 9), (9, 8), (9, 14), (10, 2), (10, 3), (14, 9), (14, 16), (16, 2), (16, 14)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 10, support := {2, 3} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {0, 7} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14, .row 14 16 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 15], (5, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 2, .flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(3, 15), (3, 16), (5, 8), (5, 15), (8, 6), (8, 9), (9, 8), (9, 14), (13, 5), (13, 6), (14, 9), (14, 16), (16, 5), (16, 14)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {6, 9} },
        { center := 9, support := {8, 14} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 2, support := {0, 7} },
        { center := 3, support := {10, 11} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 10} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 5, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 15), [.row 5 15 8], (5, 8)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 11), [.flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 11], (0, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(4, 6), (4, 11), (5, 6), (5, 8), (8, 6), (8, 9), (9, 8), (9, 14), (11, 5), (11, 14), (13, 5), (13, 6), (14, 9), (14, 11)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 5, support := {6, 8} },
        { center := 8, support := {6, 9} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {5, 14} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {9, 11} }]
    reverseChoices := [{ center := 2, support := {5, 7} },
        { center := 3, support := {10, 11} },
        { center := 5, support := {2, 11} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 10} },
        { center := 11, support := {8, 10} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨4, 5, 6, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩
      path1 := ⟨(4, 11), [.row 4 11 6], (4, 6)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 11, .flip 14 11, .row 11 14 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 5, .flip 2 5, .row 5 2 11], (5, 11)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 10, .flip 12 10], (10, 12)⟩ } },
  { hits := [(5, 3), (5, 15), (6, 9), (6, 14), (9, 3), (9, 14), (11, 14), (11, 15), (14, 9), (14, 11), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 13} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 11], (0, 11)⟩
      path1 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(0, 7), [], (0, 7)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(5, 3), (5, 15), (8, 3), (8, 6), (11, 14), (11, 15), (13, 6), (13, 16), (14, 11), (14, 16), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 8, support := {3, 6} },
        { center := 11, support := {14, 15} },
        { center := 13, support := {6, 16} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 3, support := {0, 10} },
        { center := 5, support := {1, 2} },
        { center := 8, support := {10, 13} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path1 := ⟨(13, 16), [.row 13 16 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 13), [], (3, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 10], (3, 10)⟩
      path1 := ⟨(8, 10), [.row 8 10 13], (8, 13)⟩
      path2 := ⟨(0, 8), [], (0, 8)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩ } },
  { hits := [(5, 3), (5, 15), (9, 3), (9, 14), (11, 14), (11, 15), (12, 0), (12, 9), (14, 9), (14, 11), (15, 5), (15, 11), (16, 0), (16, 5)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 5} }]
    reverseChoices := [{ center := 0, support := {11, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 4, support := {7, 16} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 13} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 9, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 5, .flip 16 5], (5, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(0, 16), [.row 0 16 11], (0, 11)⟩
      path2 := ⟨(4, 7), [.row 4 7 16], (4, 16)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(5, 3), (5, 15), (9, 3), (9, 14), (11, 14), (11, 15), (12, 4), (12, 9), (13, 4), (13, 5), (14, 9), (14, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {3, 15} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {4, 9} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {7, 12} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 13} },
        { center := 11, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12
end Problem97
