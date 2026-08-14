/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinements

/-! Child44 two-Kalmanson cancellation bank, source-checked shard 2. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(7, 4), (7, 13), (8, 13), (8, 16), (11, 4), (11, 16)]
    forwardChoices := [{ center := 7, support := {4, 13} },
        { center := 8, support := {13, 16} },
        { center := 11, support := {4, 16} }]
    reverseChoices := [{ center := 5, support := {0, 12} },
        { center := 8, support := {0, 3} },
        { center := 9, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨4, 8, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(11, 16), [.row 11 16 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 13], (7, 13)⟩
      path3 := ⟨(8, 13), [.row 8 13 16], (8, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 12], (5, 12)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(9, 12), [.row 9 12 3, .flip 9 3], (3, 9)⟩ } },
  { hits := [(8, 5), (8, 7), (13, 5), (13, 6), (14, 6), (14, 7)]
    forwardChoices := [{ center := 8, support := {5, 7} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {6, 7} }]
    reverseChoices := [{ center := 2, support := {9, 10} },
        { center := 3, support := {10, 11} },
        { center := 8, support := {9, 11} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 8), [], (6, 8)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5], (5, 8)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 7, .flip 14 7], (7, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(8, 9), [.row 8 9 11], (8, 11)⟩
      path3 := ⟨(2, 10), [.row 2 10 9], (2, 9)⟩ } },
  { hits := [(8, 5), (8, 16), (11, 4), (11, 16), (13, 4), (13, 5)]
    forwardChoices := [{ center := 8, support := {5, 16} },
        { center := 11, support := {4, 16} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 5, support := {0, 12} },
        { center := 8, support := {0, 11} }]
    forwardData := {
      firstQuad := ⟨4, 8, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(11, 16), [.row 11 16 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 16], (8, 16)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 12], (5, 12)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(8, 11), [.row 8 11 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 2), (10, 3), (12, 2), (12, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {2, 3} },
        { center := 12, support := {2, 8} }]
    reverseChoices := [{ center := 4, support := {8, 14} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨2, 8, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(2, 12), [.flip 2 12, .row 12 2 8, .flip 12 8], (8, 12)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(4, 13), [], (4, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(4, 14), [.row 4 14 8], (4, 8)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 3), (10, 7), (14, 7), (14, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {3, 7} },
        { center := 14, support := {7, 8} }]
    reverseChoices := [{ center := 2, support := {8, 9} },
        { center := 6, support := {9, 13} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [], (7, 9)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(7, 14), [.flip 7 14, .row 14 7 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(2, 9), [.row 2 9 8], (2, 8)⟩
      path2 := ⟨(7, 9), [], (7, 9)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(10, 1), (10, 2), (12, 2), (12, 5), (13, 1), (13, 5)]
    forwardChoices := [{ center := 10, support := {1, 2} },
        { center := 12, support := {2, 5} },
        { center := 13, support := {1, 5} }]
    reverseChoices := [{ center := 3, support := {11, 15} },
        { center := 4, support := {11, 14} },
        { center := 6, support := {14, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 13), [.flip 1 13, .row 13 1 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 2, .flip 12 2], (2, 12)⟩
      path3 := ⟨(2, 13), [], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩
      path1 := ⟨(3, 15), [.row 3 15 11], (3, 11)⟩
      path2 := ⟨(4, 11), [.row 4 11 14], (4, 14)⟩
      path3 := ⟨(3, 14), [], (3, 14)⟩ } },
  { hits := [(10, 1), (10, 7), (13, 1), (13, 6), (14, 6), (14, 7)]
    forwardChoices := [{ center := 10, support := {1, 7} },
        { center := 13, support := {1, 6} },
        { center := 14, support := {6, 7} }]
    reverseChoices := [{ center := 2, support := {9, 10} },
        { center := 3, support := {10, 15} },
        { center := 6, support := {9, 15} }]
    forwardData := {
      firstQuad := ⟨1, 6, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(1, 13), [.flip 1 13, .row 13 1 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 7, .flip 14 7], (7, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(3, 15), [.row 3 15 10], (3, 10)⟩
      path2 := ⟨(6, 9), [.row 6 9 15], (6, 15)⟩
      path3 := ⟨(2, 10), [.row 2 10 9], (2, 9)⟩ } },
  { hits := [(11, 4), (11, 9), (12, 5), (12, 9), (13, 4), (13, 5)]
    forwardChoices := [{ center := 11, support := {4, 9} },
        { center := 12, support := {5, 9} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {7, 11} },
        { center := 5, support := {7, 12} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 9, .flip 12 9], (9, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 7, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩
      path2 := ⟨(5, 7), [.row 5 7 12], (5, 12)⟩
      path3 := ⟨(4, 11), [.row 4 11 7], (4, 7)⟩ } },
  { hits := [(12, 5), (12, 8), (13, 5), (13, 6), (14, 6), (14, 8)]
    forwardChoices := [{ center := 12, support := {5, 8} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 3, support := {10, 11} },
        { center := 4, support := {8, 11} }]
    forwardData := {
      firstQuad := ⟨5, 6, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 12), [], (6, 12)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path3 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩ } },
  { hits := [(0, 3), (0, 5), (3, 4), (3, 15), (5, 3), (5, 15), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {3, 5} },
        { center := 3, support := {4, 15} },
        { center := 5, support := {3, 15} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 11, support := {1, 13} },
        { center := 13, support := {1, 12} },
        { center := 16, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 15), [.row 5 15 3, .flip 5 3], (3, 5)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 11), [.flip 1 11, .row 11 1 13], (11, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩ } }
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
end ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2
end Problem97
