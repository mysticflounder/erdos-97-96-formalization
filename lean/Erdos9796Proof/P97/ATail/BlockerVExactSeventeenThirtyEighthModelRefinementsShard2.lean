/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySeventhModelRefinements

/-! # Child38 subset-minimal six-hit cancellation bank, shard 2

This shard contains seven authenticated subset-minimal six-hit occurrences.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(2, 12), (2, 13), (5, 0), (5, 13), (8, 0), (8, 12)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 5, support := {0, 13} },
        { center := 8, support := {0, 12} }]
    reverseChoices := [{ center := 8, support := {4, 16} },
        { center := 11, support := {3, 16} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨0, 5, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 13], (5, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.row 8 12 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(11, 16), [.row 11 16 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 16], (8, 16)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(2, 12), (2, 13), (5, 11), (5, 13), (14, 11), (14, 12)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 5, support := {11, 13} },
        { center := 14, support := {11, 12} }]
    reverseChoices := [{ center := 2, support := {4, 5} },
        { center := 11, support := {3, 5} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 11), [], (2, 11)⟩
      path1 := ⟨(12, 14), [.flip 12 14, .row 14 12 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(5, 11), [.row 5 11 13], (5, 13)⟩
      path3 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 4), [.row 2 4 5], (2, 5)⟩
      path1 := ⟨(5, 14), [], (5, 14)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 3, .flip 11 3], (3, 11)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(3, 2), (3, 15), (10, 2), (10, 3), (16, 3), (16, 15)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 10, support := {2, 3} },
        { center := 16, support := {3, 15} }]
    reverseChoices := [{ center := 0, support := {1, 13} },
        { center := 6, support := {13, 14} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 3, .flip 16 3], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 6, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 13], (0, 13)⟩
      path1 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path2 := ⟨(0, 6), [], (0, 6)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(3, 2), (3, 16), (10, 1), (10, 2), (14, 1), (14, 16)]
    forwardChoices := [{ center := 3, support := {2, 16} },
        { center := 10, support := {1, 2} },
        { center := 14, support := {1, 16} }]
    reverseChoices := [{ center := 2, support := {0, 15} },
        { center := 6, support := {14, 15} },
        { center := 13, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨1, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 3, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 3), [], (1, 3)⟩
      path1 := ⟨(14, 16), [.row 14 16 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path3 := ⟨(1, 10), [.flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 15], (2, 15)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(6, 15), [.row 6 15 14], (6, 14)⟩ } },
  { hits := [(4, 10), (4, 11), (5, 11), (5, 14), (9, 10), (9, 14)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 5, support := {11, 14} },
        { center := 9, support := {10, 14} }]
    reverseChoices := [{ center := 7, support := {2, 6} },
        { center := 11, support := {2, 5} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨4, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(5, 14), [.row 5 14 11], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 7), [], (5, 7)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩ } },
  { hits := [(5, 0), (5, 13), (7, 13), (7, 15), (12, 0), (12, 15)]
    forwardChoices := [{ center := 5, support := {0, 13} },
        { center := 7, support := {13, 15} },
        { center := 12, support := {0, 15} }]
    reverseChoices := [{ center := 4, support := {1, 16} },
        { center := 9, support := {1, 3} },
        { center := 11, support := {3, 16} }]
    forwardData := {
      firstQuad := ⟨0, 5, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 13], (5, 13)⟩
      path1 := ⟨(12, 15), [.row 12 15 0, .flip 12 0], (0, 12)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 16], (4, 16)⟩
      path1 := ⟨(11, 16), [.row 11 16 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 11), [], (1, 11)⟩ } },
  { hits := [(5, 13), (5, 14), (7, 13), (7, 15), (16, 14), (16, 15)]
    forwardChoices := [{ center := 5, support := {13, 14} },
        { center := 7, support := {13, 15} },
        { center := 16, support := {14, 15} }]
    reverseChoices := [{ center := 0, support := {1, 2} },
        { center := 9, support := {1, 3} },
        { center := 11, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨5, 14, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(5, 14), [.row 5 14 13], (5, 13)⟩
      path1 := ⟨(15, 16), [.flip 15 16, .row 16 15 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 2], (0, 2)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 11), [], (1, 11)⟩ } },
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
end ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2
end Problem97
