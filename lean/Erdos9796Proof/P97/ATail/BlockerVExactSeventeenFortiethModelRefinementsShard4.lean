/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 4

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard4
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (11, 8), (11, 12), (11, 15), (12, 11), (12, 15), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 11, support := {8, 12, 15} },
        { center := 12, support := {11, 15} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 4, support := {1, 5} },
        { center := 5, support := {1, 4, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨4, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(12, 15), [.row 12 15 11, .flip 12 11, .row 11 12 15], (11, 15)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path3 := ⟨(4, 12), [], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 5, .flip 4 5, .row 5 4 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(5, 10), [], (5, 10)⟩
      path2 := ⟨(5, 8), [.row 5 8 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(4, 10), [], (4, 10)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 11), (3, 2), (3, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 1), (14, 12)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 11} },
        { center := 3, support := {2, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} }]
    reverseChoices := [{ center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {5, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(11, 15), [.row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path3 := ⟨(0, 14), [.row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 5), (0, 14), (5, 4), (5, 8), (7, 5), (7, 9), (9, 8), (9, 14), (14, 0), (14, 9), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 5, support := {4, 8} },
        { center := 7, support := {5, 9} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {0, 9} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {7, 16} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {7, 11} },
        { center := 11, support := {8, 12} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 8], (5, 8)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 9], (7, 9)⟩
      path3 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 0, .flip 14 0, .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 12), [.row 11 12 8, .flip 11 8], (8, 11)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 16, .flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path3 := ⟨(9, 11), [.row 9 11 7, .flip 9 7], (7, 9)⟩ } },
  { hits := [(0, 5), (0, 14), (5, 4), (5, 8), (8, 5), (8, 12), (9, 8), (9, 14), (14, 0), (14, 12), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 5, support := {4, 8} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {0, 12} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {4, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {8, 12} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(12, 14), [.flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 12), [.row 11 12 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(2, 4), [.row 2 4 16, .flip 2 16, .row 16 2 11, .flip 16 11], (11, 16)⟩
      path3 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 8), (1, 13), (2, 1), (2, 11), (11, 8), (11, 12), (12, 11), (12, 14), (14, 1), (14, 12)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {8, 13} },
        { center := 2, support := {1, 11} },
        { center := 11, support := {8, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} }]
    reverseChoices := [{ center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 8} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(5, 8), [.row 5 8 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 10), (1, 13), (4, 2), (4, 12), (10, 1), (10, 2), (12, 10), (12, 14), (14, 1), (14, 12)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {10, 13} },
        { center := 4, support := {2, 12} },
        { center := 10, support := {1, 2} },
        { center := 12, support := {10, 14} },
        { center := 14, support := {1, 12} }]
    reverseChoices := [{ center := 2, support := {4, 15} },
        { center := 4, support := {2, 6} },
        { center := 6, support := {14, 15} },
        { center := 12, support := {4, 14} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨2, 4, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 14], (6, 14)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 10), (1, 13), (8, 7), (8, 12), (10, 1), (10, 7), (12, 10), (12, 14), (14, 1), (14, 12)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {10, 13} },
        { center := 8, support := {7, 12} },
        { center := 10, support := {1, 7} },
        { center := 12, support := {10, 14} },
        { center := 14, support := {1, 12} }]
    reverseChoices := [{ center := 2, support := {4, 15} },
        { center := 4, support := {2, 6} },
        { center := 6, support := {9, 15} },
        { center := 8, support := {4, 9} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨7, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard4
end Problem97
