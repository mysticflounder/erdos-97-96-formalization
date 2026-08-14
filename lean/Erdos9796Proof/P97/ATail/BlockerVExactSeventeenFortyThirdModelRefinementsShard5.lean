/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinements

/-! Child44 two-Kalmanson cancellation bank, source-checked shard 5. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(1, 4), (1, 10), (6, 1), (6, 14), (9, 10), (9, 14), (10, 1), (10, 7), (13, 4), (13, 6), (14, 6), (14, 7)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {6, 7} }]
    reverseChoices := [{ center := 2, support := {9, 10} },
        { center := 3, support := {10, 12} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 15} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨7, 9, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(7, 14), [.flip 7 14, .row 14 7 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 9⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 9), [.row 2 9 10, .flip 2 10, .row 10 2 15], (10, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (2, 6), (2, 13), (6, 1), (6, 14), (9, 10), (9, 14), (10, 1), (10, 7), (14, 6), (14, 7)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 2, support := {6, 13} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 14, support := {6, 7} }]
    reverseChoices := [{ center := 2, support := {9, 10} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {3, 10} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨7, 9, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(7, 14), [.flip 7 14, .row 14 7 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 7, 9⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 9), [.row 2 9 10, .flip 2 10, .row 10 2 15], (10, 15)⟩ } },
  { hits := [(4, 6), (4, 12), (5, 8), (5, 12), (7, 4), (7, 13), (8, 5), (8, 13), (12, 5), (12, 8), (13, 4), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 12} },
        { center := 5, support := {8, 12} },
        { center := 7, support := {4, 13} },
        { center := 8, support := {5, 13} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 4, support := {8, 11} },
        { center := 8, support := {3, 11} },
        { center := 9, support := {3, 12} },
        { center := 11, support := {4, 8} },
        { center := 12, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 12], (4, 12)⟩
      path1 := ⟨(7, 13), [.row 7 13 4, .flip 7 4], (4, 7)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5, .row 5 12 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 9, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(4, 8), [.row 4 8 11, .flip 4 11, .row 11 4 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 12], (9, 12)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(5, 8), (5, 12), (7, 9), (7, 13), (8, 5), (8, 13), (9, 8), (9, 14), (12, 5), (12, 9), (15, 12), (15, 14)]
    forwardChoices := [{ center := 5, support := {8, 12} },
        { center := 7, support := {9, 13} },
        { center := 8, support := {5, 13} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {5, 9} },
        { center := 15, support := {12, 14} }]
    reverseChoices := [{ center := 1, support := {2, 4} },
        { center := 4, support := {7, 11} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {3, 11} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {4, 8} }]
    forwardData := {
      firstQuad := ⟨7, 8, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(7, 13), [.row 7 13 9], (7, 9)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 5, .flip 12 5, .row 5 12 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 12, .flip 15 12], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path1 := ⟨(3, 9), [.flip 3 9, .row 9 3 7, .flip 9 7], (7, 9)⟩
      path2 := ⟨(1, 2), [.row 1 2 4], (1, 4)⟩
      path3 := ⟨(4, 7), [.row 4 7 11, .flip 4 11, .row 11 4 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩ } },
  { hits := [(0, 5), (0, 10), (1, 10), (1, 13), (5, 3), (5, 8), (8, 5), (8, 13), (10, 1), (10, 3), (12, 5), (12, 8), (13, 1), (13, 5)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {10, 13} },
        { center := 5, support := {3, 8} },
        { center := 8, support := {5, 13} },
        { center := 10, support := {1, 3} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {1, 5} }]
    reverseChoices := [{ center := 3, support := {11, 15} },
        { center := 4, support := {8, 11} },
        { center := 6, support := {13, 15} },
        { center := 8, support := {3, 11} },
        { center := 11, support := {8, 13} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path1 := ⟨(0, 10), [.row 0 10 5], (0, 5)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 1, .flip 13 1, .row 1 13 10, .flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 11, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path1 := ⟨(3, 11), [.row 3 11 15, .flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 13], (6, 13)⟩
      path2 := ⟨(11, 13), [.row 11 13 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(1, 4), (1, 13), (2, 1), (2, 6), (4, 6), (4, 12), (5, 8), (5, 12), (8, 5), (8, 13), (12, 5), (12, 8), (13, 1), (13, 4)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 12} },
        { center := 5, support := {8, 12} },
        { center := 8, support := {5, 13} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {1, 4} }]
    reverseChoices := [{ center := 3, support := {12, 15} },
        { center := 4, support := {8, 11} },
        { center := 8, support := {3, 11} },
        { center := 11, support := {4, 8} },
        { center := 12, support := {4, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path1 := ⟨(4, 6), [.row 4 6 12], (4, 12)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5, .row 5 12 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 8), [.row 4 8 11, .flip 4 11, .row 11 4 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 12), [.row 3 12 15, .flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 4), (1, 13), (4, 2), (4, 12), (5, 8), (5, 12), (8, 5), (8, 13), (10, 1), (10, 2), (12, 5), (12, 8), (13, 1), (13, 4)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 4, support := {2, 12} },
        { center := 5, support := {8, 12} },
        { center := 8, support := {5, 13} },
        { center := 10, support := {1, 2} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {1, 4} }]
    reverseChoices := [{ center := 3, support := {12, 15} },
        { center := 4, support := {8, 11} },
        { center := 6, support := {14, 15} },
        { center := 8, support := {3, 11} },
        { center := 11, support := {4, 8} },
        { center := 12, support := {4, 14} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(1, 10), [.flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5, .row 5 12 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 8), [.row 4 8 11, .flip 4 11, .row 11 4 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 12), [.row 3 12 15, .flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(6, 15), [.row 6 15 14], (6, 14)⟩ } }
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
end ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5
end Problem97
