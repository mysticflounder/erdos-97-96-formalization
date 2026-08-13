/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySeventhModelRefinements

/-! # Child38 subset-minimal six-hit cancellation bank, shard 3

This shard contains seven authenticated subset-minimal six-hit occurrences.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(6, 9), (6, 14), (7, 9), (7, 15), (16, 14), (16, 15)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 7, support := {9, 15} },
        { center := 16, support := {14, 15} }]
    reverseChoices := [{ center := 0, support := {1, 2} },
        { center := 9, support := {1, 7} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨7, 14, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 7, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 14), [], (7, 14)⟩
      path1 := ⟨(15, 16), [.flip 15 16, .row 16 15 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 2], (0, 2)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(7, 4), (7, 15), (11, 0), (11, 4), (12, 0), (12, 15)]
    forwardChoices := [{ center := 7, support := {4, 15} },
        { center := 11, support := {0, 4} },
        { center := 12, support := {0, 15} }]
    reverseChoices := [{ center := 4, support := {1, 16} },
        { center := 5, support := {12, 16} },
        { center := 9, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨4, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(0, 11), [.flip 0 11, .row 11 0 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(12, 15), [.row 12 15 0, .flip 12 0], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 16], (4, 16)⟩
      path1 := ⟨(5, 16), [.row 5 16 12], (5, 12)⟩
      path2 := ⟨(1, 5), [], (1, 5)⟩
      path3 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(8, 0), (8, 6), (11, 0), (11, 4), (13, 4), (13, 6)]
    forwardChoices := [{ center := 8, support := {0, 6} },
        { center := 11, support := {0, 4} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 5, support := {12, 16} },
        { center := 8, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨0, 4, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path2 := ⟨(8, 10), [.row 8 10 16], (8, 16)⟩
      path3 := ⟨(5, 16), [.row 5 16 12], (5, 12)⟩ } },
  { hits := [(8, 0), (8, 7), (10, 1), (10, 7), (11, 0), (11, 1)]
    forwardChoices := [{ center := 8, support := {0, 7} },
        { center := 10, support := {1, 7} },
        { center := 11, support := {0, 1} }]
    reverseChoices := [{ center := 5, support := {15, 16} },
        { center := 6, support := {9, 15} },
        { center := 8, support := {9, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 10), [.flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 15), [], (8, 15)⟩
      path1 := ⟨(5, 16), [.row 5 16 15], (5, 15)⟩
      path2 := ⟨(8, 9), [.row 8 9 16], (8, 16)⟩
      path3 := ⟨(6, 15), [.row 6 15 9], (6, 9)⟩ } },
  { hits := [(8, 0), (8, 7), (10, 3), (10, 7), (16, 0), (16, 3)]
    forwardChoices := [{ center := 8, support := {0, 7} },
        { center := 10, support := {3, 7} },
        { center := 16, support := {0, 3} }]
    reverseChoices := [{ center := 0, support := {13, 16} },
        { center := 6, support := {9, 13} },
        { center := 8, support := {9, 16} }]
    forwardData := {
      firstQuad := ⟨0, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 13), [], (8, 13)⟩
      path1 := ⟨(0, 16), [.row 0 16 13], (0, 13)⟩
      path2 := ⟨(8, 9), [.row 8 9 16], (8, 16)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(8, 0), (8, 12), (12, 0), (12, 11), (14, 11), (14, 12)]
    forwardChoices := [{ center := 8, support := {0, 12} },
        { center := 12, support := {0, 11} },
        { center := 14, support := {11, 12} }]
    reverseChoices := [{ center := 2, support := {4, 5} },
        { center := 4, support := {5, 16} },
        { center := 8, support := {4, 16} }]
    forwardData := {
      firstQuad := ⟨0, 11, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 11), [], (0, 11)⟩
      path1 := ⟨(12, 14), [.flip 12 14, .row 14 12 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(0, 8), [.flip 0 8, .row 8 0 12], (8, 12)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 0, .flip 12 0], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 5, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 4), [.row 2 4 5], (2, 5)⟩
      path1 := ⟨(5, 16), [], (5, 16)⟩
      path2 := ⟨(4, 5), [.row 4 5 16], (4, 16)⟩
      path3 := ⟨(8, 16), [.row 8 16 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(10, 1), (10, 3), (11, 0), (11, 1), (16, 0), (16, 3)]
    forwardChoices := [{ center := 10, support := {1, 3} },
        { center := 11, support := {0, 1} },
        { center := 16, support := {0, 3} }]
    reverseChoices := [{ center := 0, support := {13, 16} },
        { center := 5, support := {15, 16} },
        { center := 6, support := {13, 15} }]
    forwardData := {
      firstQuad := ⟨0, 3, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 11), [], (3, 11)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 11), [.flip 1 11, .row 11 1 0, .flip 11 0], (0, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 13), [], (5, 13)⟩
      path1 := ⟨(0, 16), [.row 0 16 13], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(5, 15), [.row 5 15 16], (5, 16)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3
end Problem97
