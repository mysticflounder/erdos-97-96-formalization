/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinements

/-! Child44 two-Kalmanson cancellation bank, source-checked shard 0. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 5), (9, 3), (9, 8), (12, 5), (12, 8)]
    forwardChoices := [{ center := 0, support := {3, 5} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 7, support := {8, 13} },
        { center := 16, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 9), [], (5, 9)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 8, .flip 12 8], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨7, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(4, 11), [.row 4 11 8], (4, 8)⟩ } },
  { hits := [(0, 5), (0, 10), (1, 4), (1, 10), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {4, 10} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 15, support := {6, 12} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 5, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 4, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 4), [], (0, 4)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path3 := ⟨(0, 10), [.row 0 10 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨3, 11, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 12, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(1, 4), (1, 8), (11, 4), (11, 9), (12, 8), (12, 9)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 11, support := {4, 9} },
        { center := 12, support := {8, 9} }]
    reverseChoices := [{ center := 4, support := {7, 8} },
        { center := 5, support := {7, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 11), [], (8, 11)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(8, 12), [.flip 8 12, .row 12 8 9, .flip 12 9], (9, 12)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 8), [], (5, 8)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(5, 7), [.row 5 7 12], (5, 12)⟩
      path3 := ⟨(4, 8), [.row 4 8 7], (4, 7)⟩ } },
  { hits := [(1, 4), (1, 8), (12, 5), (12, 8), (13, 4), (13, 5)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {8, 11} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 4), (1, 8), (13, 4), (13, 6), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 3, support := {10, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 14), [.flip 8 14, .row 14 8 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(2, 8), [.row 2 8 10], (2, 10)⟩
      path3 := ⟨(10, 15), [], (10, 15)⟩ } },
  { hits := [(1, 4), (1, 10), (4, 10), (4, 12), (11, 4), (11, 12)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 4, support := {10, 12} },
        { center := 11, support := {4, 12} }]
    reverseChoices := [{ center := 5, support := {4, 12} },
        { center := 12, support := {4, 6} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(4, 10), [.row 4 10 12], (4, 12)⟩
      path3 := ⟨(11, 12), [.row 11 12 4, .flip 11 4], (4, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 12], (5, 12)⟩
      path1 := ⟨(6, 12), [.flip 6 12, .row 12 6 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 6), [], (4, 6)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 4), (1, 13), (2, 1), (2, 13), (13, 1), (13, 4)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 2, support := {1, 13} },
        { center := 13, support := {1, 4} }]
    reverseChoices := [{ center := 3, support := {12, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 3, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(3, 13), [], (3, 13)⟩
      path2 := ⟨(1, 3), [], (1, 3)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨1, 12, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(1, 12), [], (1, 12)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 12), [.row 3 12 15, .flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 6), (4, 10), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {6, 10} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 12, support := {6, 10} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 14), [.flip 8 14, .row 14 8 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path3 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(2, 8), [.row 2 8 10], (2, 10)⟩
      path3 := ⟨(10, 15), [], (10, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 10), (4, 12), (5, 8), (5, 12)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 12} },
        { center := 5, support := {8, 12} }]
    reverseChoices := [{ center := 11, support := {4, 8} },
        { center := 12, support := {4, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 12], (5, 12)⟩
      path3 := ⟨(4, 12), [.row 4 12 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 6), (2, 13), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {6, 13} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 14, support := {3, 10} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 14), [.flip 8 14, .row 14 8 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(2, 8), [.row 2 8 10], (2, 10)⟩
      path3 := ⟨(10, 15), [], (10, 15)⟩ } }
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 10 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 40 := by
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
end ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0
end Problem97
