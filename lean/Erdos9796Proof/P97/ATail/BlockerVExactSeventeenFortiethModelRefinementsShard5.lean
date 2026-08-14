/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 5

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard5
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 13), (0, 14), (7, 13), (7, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 0), (14, 12), (16, 0), (16, 11)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 7, support := {13, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {0, 12} },
        { center := 16, support := {0, 11} }]
    reverseChoices := [{ center := 0, support := {5, 16} },
        { center := 2, support := {4, 16} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(11, 15), [.row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 13], (0, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(0, 15), [], (0, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 5, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(0, 16), [.row 0 16 5], (0, 5)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path3 := ⟨(0, 9), [], (0, 9)⟩ } },
  { hits := [(0, 13), (0, 14), (7, 13), (7, 15), (11, 12), (11, 15), (12, 11), (12, 14), (14, 1), (14, 12), (15, 1), (15, 11)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 7, support := {13, 15} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨1, 7, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [], (1, 13)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(2, 9), [], (2, 9)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩ } },
  { hits := [(1, 4), (1, 10), (3, 2), (3, 16), (4, 2), (4, 10), (10, 1), (10, 3), (15, 1), (15, 16), (16, 3), (16, 4)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 3, support := {2, 16} },
        { center := 4, support := {2, 10} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {1, 16} },
        { center := 16, support := {3, 4} }]
    reverseChoices := [{ center := 0, support := {12, 13} },
        { center := 1, support := {0, 15} },
        { center := 6, support := {13, 15} },
        { center := 12, support := {6, 14} },
        { center := 13, support := {0, 14} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩
      path1 := ⟨(15, 16), [.row 15 16 1, .flip 15 1], (1, 15)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 16, .flip 3 16, .row 16 3 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(4, 10), [.row 4 10 2, .flip 4 2], (2, 4)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 15], (1, 15)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 13], (6, 13)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 14], (12, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0, .row 0 13 12], (0, 12)⟩ } },
  { hits := [(1, 4), (1, 10), (9, 10), (9, 14), (11, 9), (11, 12), (12, 11), (12, 14), (14, 9), (14, 12), (16, 4), (16, 11)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 16, support := {4, 11} }]
    reverseChoices := [{ center := 0, support := {5, 12} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 6} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 11, .flip 12 11, .row 11 12 9, .flip 11 9], (9, 11)⟩
      path3 := ⟨(11, 16), [.flip 11 16, .row 16 11 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 5), [.row 0 5 12], (0, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 7], (5, 7)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (5, 8), (5, 15), (8, 5), (8, 12), (11, 12), (11, 15), (12, 10), (12, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {10, 11} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 4, support := {5, 6} },
        { center := 5, support := {1, 4} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 11, .flip 12 11, .row 11 12 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path3 := ⟨(8, 13), [], (8, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 5, .flip 4 5, .row 5 4 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(8, 16), [], (8, 16)⟩
      path2 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩
      path3 := ⟨(6, 16), [], (6, 16)⟩ } },
  { hits := [(1, 8), (1, 10), (5, 8), (5, 15), (8, 5), (8, 12), (12, 10), (12, 15), (14, 1), (14, 12), (15, 1), (15, 5)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 5} }]
    reverseChoices := [{ center := 1, support := {11, 15} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {1, 6} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 15], (12, 15)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 4), [.row 2 4 15], (2, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 6), [.row 4 6 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (2, 11), (2, 13), (9, 10), (9, 14), (11, 9), (11, 12), (12, 11), (12, 14), (14, 9), (14, 12)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 2, support := {11, 13} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 6} },
        { center := 14, support := {3, 5} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 11, .flip 12 11, .row 11 12 9, .flip 11 9], (9, 11)⟩
      path3 := ⟨(2, 11), [.row 2 11 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 14), [.flip 5 14, .row 14 5 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 7], (5, 7)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard5
end Problem97
