/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinements

/-!
# Child40 two-Kalmanson cancellation bank, shard 5

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child39 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(4, 10), (4, 11), (9, 10), (9, 14), (16, 11), (16, 14)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 9, support := {10, 14} },
        { center := 16, support := {11, 14} }]
    reverseChoices := [{ center := 0, support := {2, 5} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨9, 11, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(9, 11), [], (9, 11)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 12), [], (2, 12)⟩ } },
  { hits := [(5, 3), (5, 16), (12, 0), (12, 3), (14, 0), (14, 16)]
    forwardChoices := [{ center := 5, support := {3, 16} },
        { center := 12, support := {0, 3} },
        { center := 14, support := {0, 16} }]
    reverseChoices := [{ center := 2, support := {0, 16} },
        { center := 4, support := {13, 16} },
        { center := 11, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 16], (5, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(0, 12), [.flip 0 12, .row 12 0 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(14, 16), [.row 14 16 0, .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 11, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 16], (2, 16)⟩
      path1 := ⟨(11, 16), [], (11, 16)⟩
      path2 := ⟨(11, 13), [.row 11 13 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(4, 16), [.row 4 16 13], (4, 13)⟩ } },
  { hits := [(5, 3), (5, 16), (12, 3), (12, 4), (13, 4), (13, 16)]
    forwardChoices := [{ center := 5, support := {3, 16} },
        { center := 12, support := {3, 4} },
        { center := 13, support := {4, 16} }]
    reverseChoices := [{ center := 3, support := {0, 12} },
        { center := 4, support := {12, 13} },
        { center := 11, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 12, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 16], (5, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(13, 16), [.row 13 16 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 12], (3, 12)⟩
      path1 := ⟨(4, 12), [.row 4 12 13], (4, 13)⟩
      path2 := ⟨(0, 4), [], (0, 4)⟩
      path3 := ⟨(11, 13), [.row 11 13 0, .flip 11 0], (0, 11)⟩ } },
  { hits := [(7, 4), (7, 15), (8, 0), (8, 15), (12, 0), (12, 4)]
    forwardChoices := [{ center := 7, support := {4, 15} },
        { center := 8, support := {0, 15} },
        { center := 12, support := {0, 4} }]
    reverseChoices := [{ center := 4, support := {12, 16} },
        { center := 8, support := {1, 16} },
        { center := 9, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨0, 4, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(0, 7), [], (0, 7)⟩
      path3 := ⟨(8, 15), [.row 8 15 0, .flip 8 0], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 8), [.flip 1 8, .row 8 1 16], (8, 16)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(4, 16), [.row 4 16 12], (4, 12)⟩ } },
  { hits := [(8, 0), (8, 6), (12, 0), (12, 4), (13, 4), (13, 6)]
    forwardChoices := [{ center := 8, support := {0, 6} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 4, support := {12, 16} },
        { center := 8, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨0, 4, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path2 := ⟨(8, 10), [.row 8 10 16], (8, 16)⟩
      path3 := ⟨(4, 16), [.row 4 16 12], (4, 12)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 1), (10, 3), (15, 1), (15, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {1, 8} }]
    reverseChoices := [{ center := 1, support := {8, 15} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 8], (1, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ } },
  { hits := [(14, 0), (14, 12), (15, 1), (15, 12), (16, 0), (16, 1)]
    forwardChoices := [{ center := 14, support := {0, 12} },
        { center := 15, support := {1, 12} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 1, support := {4, 15} },
        { center := 2, support := {4, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 14), [], (1, 14)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 1, .flip 16 1], (1, 16)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 12, .flip 15 12], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(2, 15), [], (2, 15)⟩
      path1 := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩
      path2 := ⟨(2, 4), [.row 2 4 16], (2, 16)⟩
      path3 := ⟨(1, 15), [.row 1 15 4], (1, 4)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5
end Problem97
