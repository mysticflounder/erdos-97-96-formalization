/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinements

/-! Child43 two-Kalmanson cancellation bank, source-checked shard 1. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 15), (3, 16), (8, 0), (8, 16), (14, 0), (14, 15)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 8, support := {0, 16} },
        { center := 14, support := {0, 15} }]
    reverseChoices := [{ center := 2, support := {1, 16} },
        { center := 8, support := {0, 16} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨0, 8, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 16], (8, 16)⟩
      path1 := ⟨(14, 16), [], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(8, 16), [.row 8 16 0, .flip 8 0], (0, 8)⟩ } },
  { hits := [(4, 6), (4, 10), (12, 5), (12, 10), (13, 5), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 12, support := {5, 10} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 4, support := {6, 11} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(4, 6), (4, 11), (8, 0), (8, 11), (11, 0), (11, 6)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 8, support := {0, 11} },
        { center := 11, support := {0, 6} }]
    reverseChoices := [{ center := 5, support := {10, 16} },
        { center := 8, support := {5, 16} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path1 := ⟨(8, 11), [.row 8 11 0, .flip 8 0], (0, 8)⟩
      path2 := ⟨(4, 8), [], (4, 8)⟩
      path3 := ⟨(0, 11), [.flip 0 11, .row 11 0 6, .flip 11 6], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 16], (8, 16)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 16), [.row 5 16 10], (5, 10)⟩ } },
  { hits := [(5, 6), (5, 8), (11, 6), (11, 9), (16, 8), (16, 9)]
    forwardChoices := [{ center := 5, support := {6, 8} },
        { center := 11, support := {6, 9} },
        { center := 16, support := {8, 9} }]
    reverseChoices := [{ center := 0, support := {7, 8} },
        { center := 5, support := {7, 10} },
        { center := 11, support := {8, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩
      path1 := ⟨(8, 11), [], (8, 11)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(8, 16), [.flip 8 16, .row 16 8 9, .flip 16 9], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 10], (5, 10)⟩
      path1 := ⟨(0, 10), [], (0, 10)⟩
      path2 := ⟨(0, 8), [.row 0 8 7], (0, 7)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩ } },
  { hits := [(5, 8), (5, 16), (13, 5), (13, 16), (16, 5), (16, 8)]
    forwardChoices := [{ center := 5, support := {8, 16} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 3, support := {0, 11} },
        { center := 11, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨0, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(0, 8), [], (0, 8)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 8), [.row 5 8 16, .flip 5 16, .row 16 5 8, .flip 16 8], (8, 16)⟩
      path3 := ⟨(0, 13), [], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(4, 11), [], (4, 11)⟩
      path2 := ⟨(0, 4), [], (0, 4)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0, .row 0 11 8], (0, 8)⟩ } },
  { hits := [(8, 0), (8, 16), (11, 0), (11, 6), (13, 6), (13, 16)]
    forwardChoices := [{ center := 8, support := {0, 16} },
        { center := 11, support := {0, 6} },
        { center := 13, support := {6, 16} }]
    reverseChoices := [{ center := 3, support := {0, 10} },
        { center := 5, support := {10, 16} },
        { center := 8, support := {0, 16} }]
    forwardData := {
      firstQuad := ⟨0, 8, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 16], (8, 16)⟩
      path1 := ⟨(11, 16), [], (11, 16)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(13, 16), [.row 13 16 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 10], (3, 10)⟩
      path1 := ⟨(5, 10), [.row 5 10 16], (5, 16)⟩
      path2 := ⟨(0, 5), [], (0, 5)⟩
      path3 := ⟨(8, 16), [.row 8 16 0, .flip 8 0], (0, 8)⟩ } },
  { hits := [(8, 0), (8, 16), (12, 0), (12, 5), (13, 5), (13, 16)]
    forwardChoices := [{ center := 8, support := {0, 16} },
        { center := 12, support := {0, 5} },
        { center := 13, support := {5, 16} }]
    reverseChoices := [{ center := 3, support := {0, 11} },
        { center := 4, support := {11, 16} },
        { center := 8, support := {0, 16} }]
    forwardData := {
      firstQuad := ⟨0, 8, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 12, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 16], (8, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(4, 11), [.row 4 11 16], (4, 16)⟩
      path2 := ⟨(0, 4), [], (0, 4)⟩
      path3 := ⟨(8, 16), [.row 8 16 0, .flip 8 0], (0, 8)⟩ } }
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
end ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1
end Problem97
