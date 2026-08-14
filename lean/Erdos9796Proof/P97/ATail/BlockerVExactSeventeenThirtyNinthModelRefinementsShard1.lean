/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinements

/-!
# Child40 two-Kalmanson cancellation bank, shard 1

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child39 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(2, 1), (2, 12), (5, 1), (5, 14), (11, 12), (11, 14)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 5, support := {1, 14} },
        { center := 11, support := {12, 14} }]
    reverseChoices := [{ center := 5, support := {2, 4} },
        { center := 11, support := {2, 15} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 11, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(11, 12), [.row 11 12 14], (11, 14)⟩
      path3 := ⟨(5, 14), [.row 5 14 1, .flip 5 1], (1, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 11, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 5, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 11), [.flip 2 11, .row 11 2 15], (11, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 2, .flip 5 2], (2, 5)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(2, 5), (2, 12), (13, 5), (13, 6), (15, 6), (15, 12)]
    forwardChoices := [{ center := 2, support := {5, 12} },
        { center := 13, support := {5, 6} },
        { center := 15, support := {6, 12} }]
    reverseChoices := [{ center := 1, support := {4, 10} },
        { center := 3, support := {10, 11} },
        { center := 14, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨2, 6, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(2, 6), [], (2, 6)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(2, 5), [.row 2 5 12], (2, 12)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path1 := ⟨(10, 14), [], (10, 14)⟩
      path2 := ⟨(3, 10), [.row 3 10 11], (3, 11)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 4, .flip 14 4], (4, 14)⟩ } },
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
  { hits := [(3, 15), (3, 16), (6, 5), (6, 16), (8, 5), (8, 15)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 6, support := {5, 16} },
        { center := 8, support := {5, 15} }]
    reverseChoices := [{ center := 8, support := {1, 11} },
        { center := 10, support := {0, 11} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 6), [.flip 5 6, .row 6 5 16], (6, 16)⟩
      path1 := ⟨(8, 15), [.row 8 15 5, .flip 8 5], (5, 8)⟩
      path2 := ⟨(6, 15), [], (6, 15)⟩
      path3 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 10), [], (1, 10)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 8), [.flip 1 8, .row 8 1 11], (8, 11)⟩
      path3 := ⟨(10, 11), [.row 10 11 0, .flip 10 0], (0, 10)⟩ } },
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
  { hits := [(6, 3), (6, 5), (12, 3), (12, 4), (13, 4), (13, 5)]
    forwardChoices := [{ center := 6, support := {3, 5} },
        { center := 12, support := {3, 4} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {12, 13} },
        { center := 10, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨3, 4, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 6), [], (4, 6)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(5, 6), [.flip 5 6, .row 6 5 3, .flip 6 3], (3, 6)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩
      path2 := ⟨(10, 11), [.row 10 11 13], (10, 13)⟩
      path3 := ⟨(4, 13), [.row 4 13 12], (4, 12)⟩ } },
  { hits := [(6, 3), (6, 16), (12, 0), (12, 3), (14, 0), (14, 16)]
    forwardChoices := [{ center := 6, support := {3, 16} },
        { center := 12, support := {0, 3} },
        { center := 14, support := {0, 16} }]
    reverseChoices := [{ center := 2, support := {0, 16} },
        { center := 4, support := {13, 16} },
        { center := 10, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨3, 6, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 6), [.flip 3 6, .row 6 3 16], (6, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(0, 12), [.flip 0 12, .row 12 0 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(14, 16), [.row 14 16 0, .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 16], (2, 16)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(10, 13), [.row 10 13 0, .flip 10 0], (0, 10)⟩
      path3 := ⟨(4, 16), [.row 4 16 13], (4, 13)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1
end Problem97
