/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 7

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard7
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(7, 9), (7, 15), (9, 3), (9, 14), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (16, 3), (16, 11)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 16, support := {3, 11} }]
    reverseChoices := [{ center := 0, support := {5, 13} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨3, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(11, 15), [.row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 5, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(0, 13), [.row 0 13 5], (0, 5)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path3 := ⟨(0, 9), [], (0, 9)⟩ } },
  { hits := [(9, 10), (9, 14), (11, 9), (11, 15), (12, 10), (12, 11), (12, 14), (12, 15), (14, 1), (14, 9), (15, 1), (15, 11)]
    forwardChoices := [{ center := 9, support := {10, 14} },
        { center := 11, support := {9, 15} },
        { center := 12, support := {10, 11, 14, 15} },
        { center := 14, support := {1, 9} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {7, 15} },
        { center := 4, support := {1, 2, 5, 6} },
        { center := 5, support := {1, 7} },
        { center := 7, support := {2, 6} }]
    forwardData := {
      firstQuad := ⟨1, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(12, 14), [.row 12 14 10, .flip 12 10], (10, 12)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 9, .flip 11 9], (9, 11)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 15], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 7], (5, 7)⟩
      path2 := ⟨(4, 5), [.row 4 5 6], (4, 6)⟩
      path3 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 15], (2, 15)⟩ } },
  { hits := [(0, 5), (0, 14), (1, 8), (1, 10), (5, 4), (5, 8), (8, 5), (8, 12), (12, 10), (12, 14), (14, 0), (14, 12), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 1, support := {8, 10} },
        { center := 5, support := {4, 8} },
        { center := 8, support := {5, 12} },
        { center := 12, support := {10, 14} },
        { center := 14, support := {0, 12} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {4, 16} },
        { center := 4, support := {2, 6} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {8, 12} },
        { center := 15, support := {6, 8} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(11, 12), [.row 11 12 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(0, 5), (0, 14), (2, 1), (2, 6), (5, 6), (5, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 1), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 2, support := {1, 6} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 11, support := {1, 10} },
        { center := 14, support := {10, 15} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 2, 5, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(0, 2), [], (0, 2)⟩
      path1 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path3 := ⟨(0, 14), [.row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(11, 15), [], (11, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 5), (0, 14), (5, 4), (5, 8), (8, 5), (8, 12), (11, 8), (11, 15), (12, 14), (12, 15), (14, 0), (14, 12), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 5, support := {4, 8} },
        { center := 8, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {14, 15} },
        { center := 14, support := {0, 12} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {4, 16} },
        { center := 4, support := {1, 2} },
        { center := 5, support := {1, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {8, 12} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(12, 15), [.row 12 15 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 12), [.row 11 12 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(0, 5), (0, 14), (5, 4), (5, 15), (11, 12), (11, 15), (12, 11), (12, 14), (13, 4), (13, 9), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 5, support := {4, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {4, 9} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {7, 12} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 11, support := {1, 12} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 5, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(9, 13), [.flip 9 13, .row 13 9 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(0, 14), [.row 0 14 5], (0, 5)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(0, 13), [], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 11, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 12], (3, 12)⟩
      path1 := ⟨(2, 12), [], (2, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 5), (0, 14), (5, 4), (5, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 0), (14, 12), (15, 5), (15, 11), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 5, support := {4, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {0, 12} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {4, 16} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 11, support := {1, 12} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 5, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 5], (0, 5)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 11, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(11, 13), [], (11, 13)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path3 := ⟨(0, 13), [], (0, 13)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard7
end Problem97
