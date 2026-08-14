/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinements

/-! Child43 two-Kalmanson cancellation bank, source-checked shard 3. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(5, 6), (5, 16), (11, 6), (11, 9), (13, 5), (13, 16), (16, 5), (16, 9)]
    forwardChoices := [{ center := 5, support := {6, 16} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 3, support := {0, 11} },
        { center := 5, support := {7, 10} },
        { center := 11, support := {0, 10} }]
    forwardData := {
      firstQuad := ⟨5, 9, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 6, .flip 11 6], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(5, 7), [.row 5 7 10], (5, 10)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 7], (0, 7)⟩ } },
  { hits := [(5, 8), (5, 16), (8, 0), (8, 16), (12, 0), (12, 5), (16, 5), (16, 8)]
    forwardChoices := [{ center := 5, support := {8, 16} },
        { center := 8, support := {0, 16} },
        { center := 12, support := {0, 5} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 4, support := {11, 16} },
        { center := 8, support := {0, 16} },
        { center := 11, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨0, 5, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(5, 8), [.row 5 8 16, .flip 5 16, .row 16 5 8, .flip 16 8, .row 8 16 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(4, 16), [.row 4 16 11], (4, 11)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0, .row 0 11 8, .flip 0 8, .row 8 0 16], (8, 16)⟩
      path3 := ⟨(5, 16), [], (5, 16)⟩ } },
  { hits := [(1, 8), (1, 10), (2, 1), (2, 6), (4, 6), (4, 10), (10, 1), (10, 2), (16, 2), (16, 8)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 10} },
        { center := 10, support := {1, 2} },
        { center := 16, support := {2, 8} }]
    reverseChoices := [{ center := 0, support := {8, 14} },
        { center := 6, support := {14, 15} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1, .row 1 10 8], (1, 8)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path3 := ⟨(8, 16), [.flip 8 16, .row 16 8 2, .flip 16 2], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 14), [.row 6 14 15, .flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(0, 8), [.row 0 8 14], (0, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 6), (2, 13), (5, 6), (5, 16), (13, 5), (13, 16), (16, 5), (16, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {6, 13} },
        { center := 5, support := {6, 16} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 3, support := {0, 11} },
        { center := 11, support := {0, 10} },
        { center := 14, support := {3, 10} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 8), [.row 1 8 13], (1, 13)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 8, .flip 16 8], (8, 16)⟩
      path3 := ⟨(2, 13), [.row 2 13 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 8], (0, 8)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 3, .flip 15 3], (3, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 6), (5, 16), (12, 5), (12, 13), (13, 6), (13, 16), (16, 5), (16, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {6, 16} },
        { center := 12, support := {5, 13} },
        { center := 13, support := {6, 16} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 3, support := {0, 10} },
        { center := 4, support := {3, 11} },
        { center := 11, support := {0, 10} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 8), [.row 1 8 13], (1, 13)⟩
      path1 := ⟨(13, 16), [.row 13 16 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 8, .flip 16 8], (8, 16)⟩
      path3 := ⟨(12, 13), [.row 12 13 5, .flip 12 5], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 4), [.flip 3 4, .row 4 3 11], (4, 11)⟩
      path1 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 8], (0, 8)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 10], (3, 10)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 3, .flip 15 3], (3, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 8), (5, 16), (7, 9), (7, 13), (13, 5), (13, 16), (16, 5), (16, 9)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {8, 16} },
        { center := 7, support := {9, 13} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 3, support := {0, 11} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {0, 8} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨7, 9, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 8), [.row 5 8 16, .flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0, .row 0 11 7], (0, 7)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩ } },
  { hits := [(2, 6), (2, 13), (5, 6), (5, 16), (7, 9), (7, 13), (13, 5), (13, 16), (16, 5), (16, 9)]
    forwardChoices := [{ center := 2, support := {6, 13} },
        { center := 5, support := {6, 16} },
        { center := 7, support := {9, 13} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 3, support := {0, 11} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {0, 10} },
        { center := 14, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨7, 9, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path3 := ⟨(2, 13), [.row 2 13 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 7], (0, 7)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩ } }
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
end ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3
end Problem97
