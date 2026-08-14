/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinements

/-! Child43 two-Kalmanson cancellation bank, source-checked shard 0. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 15), (3, 2), (3, 15), (10, 2), (10, 3)]
    forwardChoices := [{ center := 0, support := {3, 15} },
        { center := 3, support := {2, 15} },
        { center := 10, support := {2, 3} }]
    reverseChoices := [{ center := 6, support := {13, 14} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨0, 2, 3, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(0, 10), [], (0, 10)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(0, 15), [.row 0 15 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 13, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(1, 14), [], (1, 14)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩ } },
  { hits := [(0, 12), (0, 15), (2, 12), (2, 13), (7, 13), (7, 15)]
    forwardChoices := [{ center := 0, support := {12, 15} },
        { center := 2, support := {12, 13} },
        { center := 7, support := {13, 15} }]
    reverseChoices := [{ center := 9, support := {1, 3} },
        { center := 14, support := {3, 4} },
        { center := 16, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨0, 2, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path1 := ⟨(0, 13), [], (0, 13)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(0, 14), (0, 15), (6, 9), (6, 14), (7, 9), (7, 15)]
    forwardChoices := [{ center := 0, support := {14, 15} },
        { center := 6, support := {9, 14} },
        { center := 7, support := {9, 15} }]
    reverseChoices := [{ center := 9, support := {1, 7} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {1, 2} }]
    forwardData := {
      firstQuad := ⟨0, 7, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 14), [], (7, 14)⟩
      path1 := ⟨(0, 15), [.row 0 15 14], (0, 14)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 2, .flip 16 2], (2, 16)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(1, 4), (1, 8), (13, 4), (13, 5), (16, 5), (16, 8)]
    forwardChoices := [{ center := 1, support := {4, 8} },
        { center := 13, support := {4, 5} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 3, support := {11, 12} },
        { center := 15, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(8, 16), [.flip 8 16, .row 16 8 5, .flip 16 5], (5, 16)⟩
      path2 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 8), [.row 0 8 11], (0, 11)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 4), (1, 10), (12, 5), (12, 10), (13, 4), (13, 5)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 12, support := {5, 10} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {6, 11} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩ } },
  { hits := [(1, 8), (1, 10), (12, 5), (12, 10), (16, 5), (16, 8)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 12, support := {5, 10} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 4, support := {6, 11} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 8, .flip 16 8], (8, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 6, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path1 := ⟨(0, 11), [.row 0 11 8], (0, 8)⟩
      path2 := ⟨(0, 6), [], (0, 6)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(2, 12), (2, 13), (14, 11), (14, 13), (15, 11), (15, 12)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 14, support := {11, 13} },
        { center := 15, support := {11, 12} }]
    reverseChoices := [{ center := 1, support := {4, 5} },
        { center := 2, support := {3, 5} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨2, 12, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨11, 13, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(13, 14), [.flip 13 14, .row 14 13 11, .flip 14 11], (11, 14)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 12, .flip 15 12], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 4, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 5⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 3), [.row 2 3 5], (2, 5)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(2, 4), [], (2, 4)⟩
      path3 := ⟨(1, 5), [.row 1 5 4], (1, 4)⟩ } }
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
end ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0
end Problem97
