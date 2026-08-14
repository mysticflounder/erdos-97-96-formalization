/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinements

/-!
# Child40 two-Kalmanson cancellation bank, shard 0

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child39 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(6, 5), (6, 16), (13, 5), (13, 16)]
    forwardChoices := [{ center := 6, support := {5, 16} },
        { center := 13, support := {5, 16} }]
    reverseChoices := [{ center := 3, support := {0, 11} },
        { center := 10, support := {0, 11} }]
    forwardData := {
      firstQuad := ⟨1, 6, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 6), [.flip 5 6, .row 6 5 16], (6, 16)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(10, 11), [.row 10 11 0, .flip 10 0], (0, 10)⟩
      path3 := ⟨(3, 12), [], (3, 12)⟩ } },
  { hits := [(0, 2), (0, 9), (10, 2), (10, 3), (12, 3), (12, 9)]
    forwardChoices := [{ center := 0, support := {2, 9} },
        { center := 10, support := {2, 3} },
        { center := 12, support := {3, 9} }]
    reverseChoices := [{ center := 4, support := {7, 13} },
        { center := 6, support := {13, 14} },
        { center := 16, support := {7, 14} }]
    forwardData := {
      firstQuad := ⟨0, 3, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 3), [], (0, 3)⟩
      path1 := ⟨(9, 12), [.flip 9 12, .row 12 9 3, .flip 12 3], (3, 12)⟩
      path2 := ⟨(0, 2), [.row 0 2 9], (0, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 7), [.row 4 7 13], (4, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 6), (0, 9), (12, 4), (12, 9), (13, 4), (13, 6)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 12, support := {4, 9} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 4, support := {7, 12} },
        { center := 16, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨0, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 6), [.row 0 6 9], (0, 9)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(10, 16), [.flip 10 16, .row 16 10 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(0, 6), (0, 11), (4, 5), (4, 11), (13, 5), (13, 6)]
    forwardChoices := [{ center := 0, support := {6, 11} },
        { center := 4, support := {5, 11} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 12, support := {5, 11} },
        { center := 16, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨0, 5, 6, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 5, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 5), [], (0, 5)⟩
      path1 := ⟨(6, 13), [.flip 6 13, .row 13 6 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(4, 5), [.row 4 5 11], (4, 11)⟩
      path3 := ⟨(0, 11), [.row 0 11 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 11, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 11], (3, 11)⟩
      path1 := ⟨(11, 16), [], (11, 16)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(0, 9), (0, 11), (5, 9), (5, 14), (16, 11), (16, 14)]
    forwardChoices := [{ center := 0, support := {9, 11} },
        { center := 5, support := {9, 14} },
        { center := 16, support := {11, 14} }]
    reverseChoices := [{ center := 0, support := {2, 5} },
        { center := 11, support := {2, 7} },
        { center := 16, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨5, 11, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(5, 9), [.row 5 9 14], (5, 14)⟩
      path3 := ⟨(0, 11), [.row 0 11 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(5, 11), [], (5, 11)⟩
      path2 := ⟨(7, 11), [.flip 7 11, .row 11 7 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(1, 4), (1, 8), (9, 3), (9, 8), (12, 3), (12, 4)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {3, 4} }]
    reverseChoices := [{ center := 4, support := {12, 13} },
        { center := 7, support := {8, 13} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 12), [.flip 3 12, .row 12 3 4, .flip 12 4], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(4, 13), [.row 4 13 12], (4, 12)⟩ } },
  { hits := [(1, 4), (1, 8), (13, 4), (13, 6), (15, 6), (15, 8)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 13, support := {4, 6} },
        { center := 15, support := {6, 8} }]
    reverseChoices := [{ center := 1, support := {8, 10} },
        { center := 3, support := {10, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 7 := by native_decide
theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 28 := by native_decide

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
end ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0
end Problem97
