/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySeventhModelRefinements

/-! # Child38 subset-minimal six-hit cancellation bank, shard 1

This shard contains seven authenticated subset-minimal six-hit occurrences.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (12, 8), (12, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 12, support := {8, 11} }]
    reverseChoices := [{ center := 4, support := {5, 8} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 8, .flip 12 8], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 5), [.row 4 5 8], (4, 8)⟩
      path1 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 10), (4, 11), (5, 11), (5, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {11, 13} }]
    reverseChoices := [{ center := 11, support := {3, 5} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path1 := ⟨(1, 11), [], (1, 11)⟩
      path2 := ⟨(5, 11), [.row 5 11 13], (5, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 3, .flip 11 3], (3, 11)⟩
      path1 := ⟨(3, 12), [], (3, 12)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (5, 13), (5, 14), (9, 10), (9, 14)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 5, support := {13, 14} },
        { center := 9, support := {10, 14} }]
    reverseChoices := [{ center := 7, support := {2, 6} },
        { center := 11, support := {2, 3} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 5, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(5, 14), [.row 5 14 13], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(2, 1), (2, 12), (8, 0), (8, 12), (11, 0), (11, 1)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 8, support := {0, 12} },
        { center := 11, support := {0, 1} }]
    reverseChoices := [{ center := 5, support := {15, 16} },
        { center := 8, support := {4, 16} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨0, 2, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(0, 2), [], (0, 2)⟩
      path1 := ⟨(8, 12), [.row 8 12 0, .flip 8 0], (0, 8)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(0, 11), [.flip 0 11, .row 11 0 1, .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(5, 16), [.row 5 16 15], (5, 15)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 16], (8, 16)⟩
      path3 := ⟨(14, 16), [], (14, 16)⟩ } },
  { hits := [(2, 1), (2, 13), (5, 0), (5, 13), (11, 0), (11, 1)]
    forwardChoices := [{ center := 2, support := {1, 13} },
        { center := 5, support := {0, 13} },
        { center := 11, support := {0, 1} }]
    reverseChoices := [{ center := 5, support := {15, 16} },
        { center := 11, support := {3, 16} },
        { center := 14, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨0, 2, 5, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(0, 2), [], (0, 2)⟩
      path1 := ⟨(5, 13), [.row 5 13 0, .flip 5 0], (0, 5)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(0, 11), [.flip 0 11, .row 11 0 1, .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 15), [], (11, 15)⟩
      path1 := ⟨(5, 16), [.row 5 16 15], (5, 15)⟩
      path2 := ⟨(3, 11), [.flip 3 11, .row 11 3 16], (11, 16)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(2, 1), (2, 13), (5, 13), (5, 14), (6, 1), (6, 14)]
    forwardChoices := [{ center := 2, support := {1, 13} },
        { center := 5, support := {13, 14} },
        { center := 6, support := {1, 14} }]
    reverseChoices := [{ center := 10, support := {2, 15} },
        { center := 11, support := {2, 3} },
        { center := 14, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 5, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(5, 13), [.row 5 13 14], (5, 14)⟩
      path2 := ⟨(1, 5), [], (1, 5)⟩
      path3 := ⟨(6, 14), [.row 6 14 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.flip 3 11, .row 11 3 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(2, 6), (2, 13), (4, 6), (4, 11), (5, 11), (5, 13)]
    forwardChoices := [{ center := 2, support := {6, 13} },
        { center := 4, support := {6, 11} },
        { center := 5, support := {11, 13} }]
    reverseChoices := [{ center := 11, support := {3, 5} },
        { center := 12, support := {5, 10} },
        { center := 14, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path1 := ⟨(2, 11), [], (2, 11)⟩
      path2 := ⟨(5, 11), [.row 5 11 13], (5, 13)⟩
      path3 := ⟨(2, 13), [.row 2 13 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 10, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 3, .flip 11 3], (3, 11)⟩
      path1 := ⟨(3, 12), [], (3, 12)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 10, .flip 14 10], (10, 14)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1
end Problem97
