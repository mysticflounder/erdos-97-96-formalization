/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySeventhModelRefinements

/-! # Child38 subset-minimal six-hit cancellation bank, shard 0

This shard contains seven authenticated subset-minimal six-hit occurrences.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 2), (0, 5), (10, 2), (10, 3), (15, 3), (15, 5)]
    forwardChoices := [{ center := 0, support := {2, 5} },
        { center := 10, support := {2, 3} },
        { center := 15, support := {3, 5} }]
    reverseChoices := [{ center := 1, support := {11, 13} },
        { center := 6, support := {13, 14} },
        { center := 16, support := {11, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 3, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 5, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(0, 3), [], (0, 3)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 3, .flip 15 3], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 11), [.row 1 11 13], (1, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 5), (0, 9), (11, 4), (11, 9), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {5, 9} },
        { center := 11, support := {4, 9} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 5, support := {7, 12} },
        { center := 16, support := {7, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 5), [.row 0 5 9], (0, 9)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(5, 11), [], (5, 11)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(11, 16), [.flip 11 16, .row 16 11 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(5, 7), [.row 5 7 12], (5, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(0, 9), (0, 11), (5, 0), (5, 11), (11, 0), (11, 9)]
    forwardChoices := [{ center := 0, support := {9, 11} },
        { center := 5, support := {0, 11} },
        { center := 11, support := {0, 9} }]
    reverseChoices := [{ center := 5, support := {7, 16} },
        { center := 11, support := {5, 16} },
        { center := 16, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨0, 5, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(0, 6), [], (0, 6)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 0, .flip 11 0, .row 0 11 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 7, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(1, 7), [], (1, 7)⟩
      path1 := ⟨(11, 16), [.row 11 16 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(5, 7), [.row 5 7 16, .flip 5 16, .row 16 5 7, .flip 16 7], (7, 16)⟩
      path3 := ⟨(1, 11), [], (1, 11)⟩ } },
  { hits := [(0, 9), (0, 11), (5, 11), (5, 13), (7, 9), (7, 13)]
    forwardChoices := [{ center := 0, support := {9, 11} },
        { center := 5, support := {11, 13} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 11, support := {3, 5} },
        { center := 16, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(0, 11), [.row 0 11 9], (0, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(5, 13), [.row 5 13 11], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 9), (0, 11), (5, 11), (5, 14), (6, 9), (6, 14)]
    forwardChoices := [{ center := 0, support := {9, 11} },
        { center := 5, support := {11, 14} },
        { center := 6, support := {9, 14} }]
    reverseChoices := [{ center := 10, support := {2, 7} },
        { center := 11, support := {2, 5} },
        { center := 16, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(0, 11), [.row 0 11 9], (0, 9)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(5, 14), [.row 5 14 11], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(1, 4), (1, 10), (13, 4), (13, 5), (15, 5), (15, 10)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {5, 10} }]
    reverseChoices := [{ center := 1, support := {6, 11} },
        { center := 3, support := {11, 12} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 5, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(10, 15), [.flip 10 15, .row 15 10 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 6), [.row 1 6 11], (1, 11)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 4), (1, 13), (2, 1), (2, 13), (11, 1), (11, 4)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 2, support := {1, 13} },
        { center := 11, support := {1, 4} }]
    reverseChoices := [{ center := 5, support := {12, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(4, 13), [], (4, 13)⟩
      path2 := ⟨(4, 11), [.flip 4 11, .row 11 4 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 13), [.row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 12), [.row 5 12 15], (5, 15)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(3, 12), [], (3, 12)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0
end Problem97
