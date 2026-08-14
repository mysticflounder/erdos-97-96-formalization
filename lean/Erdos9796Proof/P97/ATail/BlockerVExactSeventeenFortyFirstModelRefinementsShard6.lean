/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 6. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 14), (1, 4), (1, 8), (3, 4), (3, 16), (8, 3), (8, 9), (9, 8), (9, 14), (14, 9), (14, 16)]
    forwardChoices := [{ center := 0, support := {3, 14} },
        { center := 1, support := {4, 8} },
        { center := 3, support := {4, 16} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 13, support := {0, 12} },
        { center := 15, support := {8, 12} },
        { center := 16, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 4, 8⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 3), [.row 0 3 14], (0, 14)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(1, 8), [.row 1 8 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 12, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(0, 3), (0, 14), (3, 15), (3, 16), (5, 8), (5, 15), (8, 3), (8, 9), (9, 8), (9, 14), (14, 9), (14, 16)]
    forwardChoices := [{ center := 0, support := {3, 14} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(0, 3), [.row 0 3 14], (0, 14)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 15], (5, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 12), (0, 14), (7, 4), (7, 15), (11, 14), (11, 15), (12, 4), (12, 9), (14, 9), (14, 11), (15, 11), (15, 12)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 7, support := {4, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {4, 9} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {11, 12} }]
    reverseChoices := [{ center := 1, support := {4, 5} },
        { center := 2, support := {5, 7} },
        { center := 4, support := {7, 12} },
        { center := 5, support := {1, 2} },
        { center := 9, support := {1, 12} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨0, 9, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 12], (0, 12)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 7, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7], (2, 7)⟩
      path1 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4], (4, 16)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 1), (2, 12), (6, 1), (6, 14), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {1, 12} },
        { center := 6, support := {1, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {4, 15} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 7, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 7], (2, 7)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (3, 4), (3, 16), (4, 2), (4, 6), (12, 0), (12, 4), (16, 0), (16, 2)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 3, support := {4, 16} },
        { center := 4, support := {2, 6} },
        { center := 12, support := {0, 4} },
        { center := 16, support := {0, 2} }]
    reverseChoices := [{ center := 0, support := {14, 16} },
        { center := 4, support := {12, 16} },
        { center := 12, support := {10, 14} },
        { center := 13, support := {0, 12} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 14], (12, 14)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩ } },
  { hits := [(0, 12), (0, 16), (3, 2), (3, 15), (11, 14), (11, 15), (14, 11), (14, 16), (15, 11), (15, 12), (16, 2), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {2, 15} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 5, support := {1, 2} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨0, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(0, 3), [], (0, 3)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 13, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 14], (0, 14)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩ } },
  { hits := [(0, 12), (0, 16), (3, 4), (3, 16), (4, 2), (4, 11), (12, 0), (12, 4), (15, 11), (15, 12), (16, 0), (16, 2)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {4, 16} },
        { center := 4, support := {2, 11} },
        { center := 12, support := {0, 4} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 2} }]
    reverseChoices := [{ center := 0, support := {14, 16} },
        { center := 1, support := {4, 5} },
        { center := 4, support := {12, 16} },
        { center := 12, support := {5, 14} },
        { center := 13, support := {0, 12} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 11), [.row 4 11 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 14], (12, 14)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6
end Problem97
