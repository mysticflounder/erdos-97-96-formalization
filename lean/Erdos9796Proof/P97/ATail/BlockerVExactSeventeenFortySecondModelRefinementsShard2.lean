/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinements

/-! Child43 two-Kalmanson cancellation bank, source-checked shard 2. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(9, 3), (9, 8), (10, 2), (10, 3), (16, 2), (16, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {2, 3} },
        { center := 16, support := {2, 8} }]
    reverseChoices := [{ center := 0, support := {8, 14} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 16), [], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(0, 13), [], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 8], (0, 8)⟩ } },
  { hits := [(11, 0), (11, 6), (12, 0), (12, 5), (13, 5), (13, 6)]
    forwardChoices := [{ center := 11, support := {0, 6} },
        { center := 12, support := {0, 5} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 4, support := {11, 16} },
        { center := 5, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨0, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(5, 10), [.row 5 10 16], (5, 16)⟩
      path3 := ⟨(4, 16), [.row 4 16 11], (4, 11)⟩ } },
  { hits := [(11, 0), (11, 9), (12, 0), (12, 5), (16, 5), (16, 9)]
    forwardChoices := [{ center := 11, support := {0, 9} },
        { center := 12, support := {0, 5} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 4, support := {11, 16} },
        { center := 5, support := {7, 16} }]
    forwardData := {
      firstQuad := ⟨0, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(5, 16), [.flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 7, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 7), [], (4, 7)⟩
      path1 := ⟨(0, 11), [.row 0 11 7], (0, 7)⟩
      path2 := ⟨(5, 7), [.row 5 7 16], (5, 16)⟩
      path3 := ⟨(4, 16), [.row 4 16 11], (4, 11)⟩ } },
  { hits := [(11, 6), (11, 9), (13, 5), (13, 6), (16, 5), (16, 9)]
    forwardChoices := [{ center := 11, support := {6, 9} },
        { center := 13, support := {5, 6} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 3, support := {10, 11} },
        { center := 5, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨5, 9, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(0, 11), [.row 0 11 7], (0, 7)⟩
      path2 := ⟨(5, 7), [.row 5 7 10], (5, 10)⟩
      path3 := ⟨(3, 10), [.row 3 10 11], (3, 11)⟩ } },
  { hits := [(0, 12), (0, 14), (9, 10), (9, 14), (11, 0), (11, 12), (12, 0), (12, 10)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {0, 12} },
        { center := 12, support := {0, 10} }]
    reverseChoices := [{ center := 4, support := {6, 16} },
        { center := 5, support := {4, 16} },
        { center := 7, support := {2, 6} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨0, 10, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 9, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(0, 10), [], (0, 10)⟩
      path1 := ⟨(11, 12), [.row 11 12 0, .flip 11 0], (0, 11)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 12, .flip 0 12, .row 12 0 10, .flip 12 10], (10, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 16], (5, 16)⟩
      path1 := ⟨(6, 16), [], (6, 16)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4, .row 4 16 6], (4, 6)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 1), (2, 13), (10, 1), (10, 2), (16, 2), (16, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {1, 13} },
        { center := 10, support := {1, 2} },
        { center := 16, support := {2, 8} }]
    reverseChoices := [{ center := 0, support := {8, 14} },
        { center := 6, support := {14, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(8, 16), [.flip 8 16, .row 16 8 2, .flip 16 2], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(0, 8), [.row 0 8 14], (0, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(5, 6), (5, 8), (6, 9), (6, 14), (9, 8), (9, 14), (11, 6), (11, 9)]
    forwardChoices := [{ center := 5, support := {6, 8} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {6, 9} }]
    reverseChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {8, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 10], (5, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩ } }
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
end ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2
end Problem97
