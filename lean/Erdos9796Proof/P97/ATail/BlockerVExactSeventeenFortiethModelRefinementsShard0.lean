/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 0

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 2), (0, 13), (2, 1), (2, 13), (10, 1), (10, 2)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 2, support := {1, 13} },
        { center := 10, support := {1, 2} }]
    reverseChoices := [{ center := 6, support := {14, 15} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 2, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(0, 13), [.row 0 13 2], (0, 2)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩
      path1 := ⟨(3, 15), [], (3, 15)⟩
      path2 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 14, .flip 16 14], (14, 16)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 10), (1, 13), (9, 10), (9, 14)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {10, 13} },
        { center := 9, support := {10, 14} }]
    reverseChoices := [{ center := 7, support := {2, 6} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 9, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 15), [], (2, 15)⟩ } },
  { hits := [(1, 4), (1, 8), (9, 3), (9, 8), (16, 3), (16, 4)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 9, support := {3, 8} },
        { center := 16, support := {3, 4} }]
    reverseChoices := [{ center := 0, support := {12, 13} },
        { center := 7, support := {8, 13} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 16), [], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 8), [], (0, 8)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 12], (0, 12)⟩ } },
  { hits := [(3, 2), (3, 16), (10, 1), (10, 2), (15, 1), (15, 16)]
    forwardChoices := [{ center := 3, support := {2, 16} },
        { center := 10, support := {1, 2} },
        { center := 15, support := {1, 16} }]
    reverseChoices := [{ center := 1, support := {0, 15} },
        { center := 6, support := {14, 15} },
        { center := 13, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨1, 3, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 3, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 3), [], (1, 3)⟩
      path1 := ⟨(15, 16), [.row 15 16 1, .flip 15 1], (1, 15)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path3 := ⟨(1, 10), [.flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 15], (1, 15)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(6, 15), [.row 6 15 14], (6, 14)⟩ } },
  { hits := [(4, 6), (4, 12), (13, 6), (13, 9), (14, 9), (14, 12)]
    forwardChoices := [{ center := 4, support := {6, 12} },
        { center := 13, support := {6, 9} },
        { center := 14, support := {9, 12} }]
    reverseChoices := [{ center := 2, support := {4, 7} },
        { center := 3, support := {7, 10} },
        { center := 12, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 12], (4, 12)⟩
      path1 := ⟨(12, 14), [.flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 4), [.row 2 4 7], (2, 7)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(4, 10), (4, 12), (11, 12), (11, 15), (12, 10), (12, 15)]
    forwardChoices := [{ center := 4, support := {10, 12} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 5, support := {1, 4} },
        { center := 12, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨4, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10], (10, 12)⟩
      path2 := ⟨(4, 10), [.row 4 10 12], (4, 12)⟩
      path3 := ⟨(11, 12), [.row 11 12 15], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 6, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 6], (4, 6)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(6, 12), [.flip 6 12, .row 12 6 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 8), (9, 14), (11, 8), (11, 9)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {8, 9} }]
    reverseChoices := [{ center := 5, support := {7, 8} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 8, .flip 11 8], (8, 11)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 8], (5, 8)⟩
      path1 := ⟨(2, 8), [], (2, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard0
end Problem97
