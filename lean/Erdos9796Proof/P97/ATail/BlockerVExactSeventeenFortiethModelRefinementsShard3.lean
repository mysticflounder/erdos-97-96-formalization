/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 3

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard3
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 2), (0, 14), (2, 1), (2, 11), (4, 2), (4, 12), (12, 11), (12, 14), (14, 1), (14, 12)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 11} },
        { center := 4, support := {2, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} }]
    reverseChoices := [{ center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {5, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨2, 4, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(11, 12), [.flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path3 := ⟨(0, 14), [.row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(4, 5), [.row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 8), (1, 13), (6, 1), (6, 9), (9, 8), (9, 14), (14, 1), (14, 9)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {8, 13} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {1, 9} }]
    reverseChoices := [{ center := 2, support := {7, 15} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {7, 15} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 9], (6, 9)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 15], (2, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(0, 13), (0, 14), (2, 11), (2, 13), (11, 9), (11, 12), (12, 11), (12, 14), (14, 9), (14, 12)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 2, support := {11, 13} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 14, support := {3, 5} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(2, 13), [.row 2 13 11], (2, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 7, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 14), [.flip 3 14, .row 14 3 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(5, 7), [.row 5 7 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(2, 1), (2, 11), (6, 1), (6, 14), (11, 9), (11, 12), (12, 11), (12, 14), (14, 9), (14, 12)]
    forwardChoices := [{ center := 2, support := {1, 11} },
        { center := 6, support := {1, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {5, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 7, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path2 := ⟨(5, 7), [.row 5 7 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(2, 11), (2, 13), (5, 8), (5, 15), (7, 5), (7, 13), (11, 8), (11, 15), (15, 5), (15, 11)]
    forwardChoices := [{ center := 2, support := {11, 13} },
        { center := 5, support := {8, 15} },
        { center := 7, support := {5, 13} },
        { center := 11, support := {8, 15} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 5, support := {1, 8} },
        { center := 9, support := {3, 11} },
        { center := 11, support := {1, 8} },
        { center := 14, support := {3, 5} }]
    forwardData := {
      firstQuad := ⟨5, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 7), [.flip 5 7, .row 7 5 13], (7, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8], (5, 8)⟩
      path3 := ⟨(2, 13), [.row 2 13 11], (2, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(9, 11), [.row 9 11 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(5, 8), [.row 5 8 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 12), (11, 8), (11, 15), (14, 1), (14, 12), (15, 1), (15, 5)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 5} }]
    reverseChoices := [{ center := 1, support := {11, 15} },
        { center := 2, support := {4, 15} },
        { center := 5, support := {1, 8} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 11, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(11, 14), [], (11, 14)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(12, 14), [.flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.row 2 4 15], (2, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(1, 4), [], (1, 4)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(11, 12), (11, 15), (12, 11), (12, 15), (13, 9), (13, 16), (14, 9), (14, 12), (15, 11), (15, 16)]
    forwardChoices := [{ center := 11, support := {12, 15} },
        { center := 12, support := {11, 15} },
        { center := 13, support := {9, 16} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {11, 16} }]
    reverseChoices := [{ center := 1, support := {0, 5} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {0, 7} },
        { center := 4, support := {1, 5} },
        { center := 5, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨9, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨12, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 13), [.flip 9 13, .row 13 9 16], (13, 16)⟩
      path1 := ⟨(14, 16), [], (14, 16)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 15], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 4⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(0, 2), [], (0, 2)⟩
      path1 := ⟨(3, 7), [.row 3 7 0, .flip 3 0], (0, 3)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(2, 4), [.row 2 4 7], (2, 7)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard3
end Problem97
