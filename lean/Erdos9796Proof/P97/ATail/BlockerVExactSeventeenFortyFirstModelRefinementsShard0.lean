/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 0. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 16), (3, 2), (3, 16), (10, 2), (10, 3)]
    forwardChoices := [{ center := 0, support := {3, 16} },
        { center := 3, support := {2, 16} },
        { center := 10, support := {2, 3} }]
    reverseChoices := [{ center := 6, support := {13, 14} },
        { center := 13, support := {0, 14} },
        { center := 16, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(0, 16), [.row 0 16 3], (0, 3)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 13, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [], (0, 14)⟩
      path2 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 13, .flip 16 13], (13, 16)⟩ } },
  { hits := [(0, 14), (0, 16), (3, 2), (3, 16), (16, 2), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 3, support := {2, 16} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 13, support := {0, 14} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(0, 3), [], (0, 3)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 13, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 14], (0, 14)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩ } },
  { hits := [(0, 14), (0, 16), (3, 15), (3, 16), (11, 14), (11, 15)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 3, support := {15, 16} },
        { center := 11, support := {14, 15} }]
    reverseChoices := [{ center := 5, support := {1, 2} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 14), [], (3, 14)⟩
      path1 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩
      path2 := ⟨(11, 14), [.row 11 14 15], (11, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 13), [], (2, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 14), (0, 16), (13, 5), (13, 16), (16, 5), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 3, support := {0, 11} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 5, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(5, 13), [.flip 5 13, .row 13 5 16], (13, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩
      path2 := ⟨(0, 13), [], (0, 13)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 11], (0, 11)⟩
      path1 := ⟨(3, 16), [], (3, 16)⟩
      path2 := ⟨(3, 11), [.row 3 11 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩ } },
  { hits := [(1, 4), (1, 8), (12, 4), (12, 9), (14, 8), (14, 9)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 12, support := {4, 9} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 4, support := {7, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(8, 14), [.flip 8 14, .row 14 8 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path1 := ⟨(2, 12), [], (2, 12)⟩
      path2 := ⟨(2, 8), [.row 2 8 7], (2, 7)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 4), (1, 10), (11, 5), (11, 10), (13, 4), (13, 5)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 11, support := {5, 10} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 5, support := {6, 11} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(5, 6), [.row 5 6 11], (5, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩ } },
  { hits := [(1, 4), (1, 13), (2, 1), (2, 13), (12, 1), (12, 4)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 2, support := {1, 13} },
        { center := 12, support := {1, 4} }]
    reverseChoices := [{ center := 4, support := {12, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [], (2, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 12), [.row 4 12 15], (4, 15)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(3, 12), [], (3, 12)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0
end Problem97
