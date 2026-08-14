/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinements

/-!
# Child40 two-Kalmanson cancellation bank, shard 4

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child39 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
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
  { hits := [(0, 5), (0, 9), (12, 4), (12, 9), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {5, 9} },
        { center := 12, support := {4, 9} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {7, 12} },
        { center := 16, support := {7, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 5), [.row 0 5 9], (0, 9)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(11, 16), [.flip 11 16, .row 16 11 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(0, 9), (0, 11), (6, 9), (6, 14), (16, 11), (16, 14)]
    forwardChoices := [{ center := 0, support := {9, 11} },
        { center := 6, support := {9, 14} },
        { center := 16, support := {11, 14} }]
    reverseChoices := [{ center := 0, support := {2, 5} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨6, 11, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(0, 11), [.row 0 11 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(5, 10), [], (5, 10)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
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
  { hits := [(1, 4), (1, 8), (13, 4), (13, 5), (15, 5), (15, 8)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {5, 8} }]
    reverseChoices := [{ center := 1, support := {8, 11} },
        { center := 3, support := {11, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(8, 15), [.flip 8 15, .row 15 8 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 11], (1, 11)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(2, 1), (2, 12), (6, 1), (6, 14), (11, 12), (11, 14)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 6, support := {1, 14} },
        { center := 11, support := {12, 14} }]
    reverseChoices := [{ center := 5, support := {2, 4} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 14], (11, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 5, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 2, .flip 5 2], (2, 5)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(2, 12), (2, 13), (7, 13), (7, 15), (11, 12), (11, 15)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 7, support := {13, 15} },
        { center := 11, support := {12, 15} }]
    reverseChoices := [{ center := 5, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨2, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 11, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 15], (11, 15)⟩
      path3 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 5, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 5, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 5), [], (3, 5)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4
end Problem97
