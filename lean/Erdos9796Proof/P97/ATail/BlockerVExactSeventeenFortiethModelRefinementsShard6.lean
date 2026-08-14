/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 6

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard6
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(2, 6), (2, 11), (4, 6), (4, 10), (9, 10), (9, 14), (11, 9), (11, 12), (12, 11), (12, 14), (14, 9), (14, 12)]
    forwardChoices := [{ center := 2, support := {6, 11} },
        { center := 4, support := {6, 10} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(2, 10), [], (2, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 11, .flip 12 11, .row 11 12 9, .flip 11 9], (9, 11)⟩
      path3 := ⟨(2, 11), [.row 2 11 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 7], (5, 7)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(5, 8), (5, 15), (7, 5), (7, 9), (9, 8), (9, 14), (12, 14), (12, 15), (14, 1), (14, 9), (15, 1), (15, 5)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 7, support := {5, 9} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {14, 15} },
        { center := 14, support := {1, 9} },
        { center := 15, support := {1, 5} }]
    reverseChoices := [{ center := 1, support := {11, 15} },
        { center := 2, support := {7, 15} },
        { center := 4, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {7, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨1, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5, .row 5 15 8], (5, 8)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 9], (7, 9)⟩
      path3 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path1 := ⟨(1, 15), [.row 1 15 11, .flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 15], (2, 15)⟩
      path3 := ⟨(9, 11), [.row 9 11 7, .flip 9 7], (7, 9)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (9, 3), (9, 8), (11, 12), (11, 15), (15, 5), (15, 11), (16, 3), (16, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {3, 8} },
        { center := 11, support := {12, 15} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {3, 11} }]
    reverseChoices := [{ center := 0, support := {5, 13} },
        { center := 1, support := {5, 11} },
        { center := 5, support := {1, 4} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 11, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 12), [], (3, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 5, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(0, 8), [], (0, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 5], (0, 5)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (9, 8), (9, 14), (11, 12), (11, 15), (12, 11), (12, 14), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨4, 9, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(12, 14), [.row 12 14 11, .flip 12 11, .row 11 12 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(4, 12), [], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 6, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(6, 8), [], (6, 8)⟩
      path2 := ⟨(2, 6), [], (2, 6)⟩
      path3 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (9, 8), (9, 14), (12, 14), (12, 15), (14, 1), (14, 12), (15, 1), (15, 5)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {14, 15} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 5} }]
    reverseChoices := [{ center := 1, support := {11, 15} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨1, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(12, 14), [.flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path1 := ⟨(1, 15), [.row 1 15 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(2, 4), [.row 2 4 15], (2, 15)⟩
      path3 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (11, 8), (11, 15), (14, 0), (14, 12), (15, 5), (15, 11), (16, 0), (16, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 14, support := {0, 12} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 11} }]
    reverseChoices := [{ center := 0, support := {5, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {4, 16} },
        { center := 5, support := {1, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨8, 11, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 11), [.flip 8 11, .row 11 8 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 4), [.row 2 4 16], (2, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 5], (0, 5)⟩
      path2 := ⟨(0, 4), [], (0, 4)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(6, 9), (6, 14), (7, 9), (7, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 1), (14, 12), (15, 1), (15, 11)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 7, support := {9, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 9, support := {1, 7} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨1, 7, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 14), [], (7, 14)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard6
end Problem97
