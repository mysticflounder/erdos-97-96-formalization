/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 2

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard2
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(5, 6), (5, 8), (6, 9), (6, 14), (9, 8), (9, 14), (13, 6), (13, 9)]
    forwardChoices := [{ center := 5, support := {6, 8} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 13, support := {6, 9} }]
    reverseChoices := [{ center := 3, support := {7, 10} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {8, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 3), (9, 14), (10, 1), (10, 3), (14, 1), (14, 9)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {1, 3} },
        { center := 14, support := {1, 9} }]
    reverseChoices := [{ center := 2, support := {7, 15} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 13} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨1, 6, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 13), [], (2, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(2, 15), [.row 2 15 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(9, 10), (9, 14), (11, 9), (11, 12), (12, 10), (12, 14), (14, 9), (14, 12)]
    forwardChoices := [{ center := 9, support := {10, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {10, 14} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 4, support := {2, 6} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 6} }]
    forwardData := {
      firstQuad := ⟨2, 10, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(11, 12), [.row 11 12 9, .flip 11 9], (9, 11)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 10, .flip 12 10], (10, 12)⟩
      path3 := ⟨(2, 11), [], (2, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 7], (5, 7)⟩
      path1 := ⟨(6, 10), [], (6, 10)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 6], (4, 6)⟩
      path3 := ⟨(5, 10), [], (5, 10)⟩ } },
  { hits := [(11, 12), (11, 15), (12, 11), (12, 15), (14, 0), (14, 12), (16, 0), (16, 11)]
    forwardChoices := [{ center := 11, support := {12, 15} },
        { center := 12, support := {11, 15} },
        { center := 14, support := {0, 12} },
        { center := 16, support := {0, 11} }]
    reverseChoices := [{ center := 0, support := {5, 16} },
        { center := 2, support := {4, 16} },
        { center := 4, support := {1, 5} },
        { center := 5, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨0, 11, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨11, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(11, 14), [], (11, 14)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(11, 15), [.row 11 15 12, .flip 11 12, .row 12 11 15], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 5⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(2, 5), [], (2, 5)⟩
      path1 := ⟨(0, 16), [.row 0 16 5], (0, 5)⟩
      path2 := ⟨(2, 4), [.row 2 4 16], (2, 16)⟩
      path3 := ⟨(1, 5), [.flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 1, .flip 4 1], (1, 4)⟩ } },
  { hits := [(11, 12), (11, 15), (12, 11), (12, 15), (14, 1), (14, 12), (15, 1), (15, 11)]
    forwardChoices := [{ center := 11, support := {12, 15} },
        { center := 12, support := {11, 15} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {1, 5} },
        { center := 5, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨11, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(11, 14), [], (11, 14)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(12, 14), [.flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(11, 15), [.row 11 15 12, .flip 11 12, .row 12 11 15], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 1, .flip 4 1], (1, 4)⟩
      path2 := ⟨(2, 4), [.row 2 4 15], (2, 15)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(0, 2), (0, 13), (1, 10), (1, 13), (2, 1), (2, 6), (4, 6), (4, 10), (10, 1), (10, 2)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 10} },
        { center := 10, support := {1, 2} }]
    reverseChoices := [{ center := 6, support := {14, 15} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 2, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1, .row 1 10 13], (1, 13)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path3 := ⟨(0, 13), [.row 0 13 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 14), [.row 6 14 15, .flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 14, .flip 16 14], (14, 16)⟩ } },
  { hits := [(0, 2), (0, 13), (1, 10), (1, 13), (2, 1), (2, 11), (10, 1), (10, 2), (12, 10), (12, 11)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {1, 11} },
        { center := 10, support := {1, 2} },
        { center := 12, support := {10, 11} }]
    reverseChoices := [{ center := 4, support := {5, 6} },
        { center := 6, support := {14, 15} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨2, 10, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 2, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1, .row 1 10 13], (1, 13)⟩
      path1 := ⟨(11, 12), [.flip 11 12, .row 12 11 10, .flip 12 10], (10, 12)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path3 := ⟨(0, 13), [.row 0 13 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 5), [.row 4 5 6], (4, 6)⟩
      path1 := ⟨(6, 14), [.row 6 14 15, .flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 14, .flip 16 14], (14, 16)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard2
end Problem97
