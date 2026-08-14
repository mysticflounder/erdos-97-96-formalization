/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 7. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 12), (0, 16), (3, 4), (3, 16), (8, 3), (8, 12), (10, 2), (10, 3), (12, 0), (12, 4), (16, 0), (16, 2)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {4, 16} },
        { center := 8, support := {3, 12} },
        { center := 10, support := {2, 3} },
        { center := 12, support := {0, 4} },
        { center := 16, support := {0, 2} }]
    reverseChoices := [{ center := 0, support := {14, 16} },
        { center := 4, support := {12, 16} },
        { center := 6, support := {13, 14} },
        { center := 8, support := {4, 13} },
        { center := 13, support := {0, 12} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (6, 1), (6, 14), (12, 0), (12, 1), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 6, support := {1, 14} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 10, support := {2, 15} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 6, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 14], (6, 14)⟩
      path1 := ⟨(11, 14), [.flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(1, 11), [], (1, 11)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(1, 4), [.row 1 4 5], (1, 5)⟩
      path1 := ⟨(10, 15), [.row 10 15 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 5), [.row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (6, 9), (6, 14), (8, 9), (8, 12), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 6, support := {9, 14} },
        { center := 8, support := {9, 12} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 8, support := {4, 7} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 7], (2, 7)⟩
      path1 := ⟨(2, 8), [], (2, 8)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (8, 3), (8, 12), (9, 3), (9, 14), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 8, support := {3, 12} },
        { center := 9, support := {3, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 13} },
        { center := 8, support := {4, 13} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(8, 13), [], (8, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(8, 14), [], (8, 14)⟩
      path2 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(7, 14), [], (7, 14)⟩ } },
  { hits := [(0, 14), (0, 16), (6, 9), (6, 14), (9, 8), (9, 14), (12, 0), (12, 9), (14, 8), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 8} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 9, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 16], (4, 16)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 8], (2, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(0, 14), (0, 16), (8, 3), (8, 9), (9, 3), (9, 8), (12, 0), (12, 9), (14, 8), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 8} },
        { center := 4, support := {7, 16} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {7, 13} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 8, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 12), [], (8, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 9, .flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 16], (4, 16)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 8], (2, 8)⟩
      path2 := ⟨(2, 7), [], (2, 7)⟩
      path3 := ⟨(8, 13), [.row 8 13 7, .flip 8 7, .row 7 8 13], (7, 13)⟩ } },
  { hits := [(3, 4), (3, 16), (9, 3), (9, 14), (10, 2), (10, 3), (12, 4), (12, 9), (14, 9), (14, 16), (16, 2), (16, 14)]
    forwardChoices := [{ center := 3, support := {4, 16} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {2, 3} },
        { center := 12, support := {4, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 12} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {2, 13} },
        { center := 13, support := {0, 12} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14, .row 14 16 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 2, .flip 0 2, .row 2 0 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7
end Problem97
