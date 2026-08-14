/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinements

/-! Child44 two-Kalmanson cancellation bank, source-checked shard 3. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 5), (0, 10), (1, 10), (1, 13), (2, 1), (2, 13), (13, 1), (13, 5)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {1, 13} },
        { center := 13, support := {1, 5} }]
    reverseChoices := [{ center := 3, support := {11, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(0, 10), [.row 0 10 5], (0, 5)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 1, .flip 13 1, .row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 11, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 11), [.row 3 11 15, .flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path1 := ⟨(14, 16), [], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 1), (2, 13), (10, 1), (10, 2), (12, 2), (12, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {1, 13} },
        { center := 10, support := {1, 2} },
        { center := 12, support := {2, 8} }]
    reverseChoices := [{ center := 4, support := {8, 14} },
        { center := 6, support := {14, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(8, 12), [.flip 8 12, .row 12 8 2, .flip 12 2], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(4, 8), [.row 4 8 14], (4, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 1), (2, 13), (12, 5), (12, 8), (13, 1), (13, 5)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {1, 13} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {1, 5} }]
    reverseChoices := [{ center := 3, support := {11, 15} },
        { center := 4, support := {8, 11} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 1, .flip 13 1, .row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 15, .flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 1), (2, 13), (13, 1), (13, 6), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {1, 13} },
        { center := 13, support := {1, 6} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 3, support := {10, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 14), [.flip 8 14, .row 14 8 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 1, .flip 13 1, .row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 15, .flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(2, 8), [.row 2 8 10], (2, 10)⟩
      path3 := ⟨(10, 15), [], (10, 15)⟩ } },
  { hits := [(3, 15), (3, 16), (5, 8), (5, 15), (8, 5), (8, 16), (12, 5), (12, 8)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 16} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 8, support := {0, 11} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 8, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 15), [], (8, 15)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 15), [.row 5 15 8, .flip 5 8, .row 8 5 16], (8, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 11), [.flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path3 := ⟨(0, 11), [], (0, 11)⟩ } },
  { hits := [(5, 8), (5, 12), (8, 5), (8, 16), (11, 12), (11, 16), (12, 5), (12, 8)]
    forwardChoices := [{ center := 5, support := {8, 12} },
        { center := 8, support := {5, 16} },
        { center := 11, support := {12, 16} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 5, support := {0, 4} },
        { center := 8, support := {0, 11} },
        { center := 11, support := {4, 8} }]
    forwardData := {
      firstQuad := ⟨10, 11, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(11, 12), [.row 11 12 16], (11, 16)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(10, 12), [], (10, 12)⟩
      path3 := ⟨(8, 16), [.row 8 16 5, .flip 8 5, .row 5 8 12, .flip 5 12, .row 12 5 8, .flip 12 8], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 5, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 8⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(0, 8), [.flip 0 8, .row 8 0 11, .flip 8 11, .row 11 8 4, .flip 11 4, .row 4 11 8], (4, 8)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 0, .flip 5 0], (0, 5)⟩
      path3 := ⟨(1, 8), [], (1, 8)⟩ } },
  { hits := [(5, 8), (5, 12), (11, 4), (11, 12), (12, 5), (12, 8), (13, 4), (13, 5)]
    forwardChoices := [{ center := 5, support := {8, 12} },
        { center := 11, support := {4, 12} },
        { center := 12, support := {5, 8} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {8, 11} },
        { center := 5, support := {4, 12} },
        { center := 11, support := {4, 8} }]
    forwardData := {
      firstQuad := ⟨4, 8, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(11, 12), [.row 11 12 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(5, 8), [.row 5 8 12, .flip 5 12, .row 12 5 8, .flip 12 8], (8, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 12], (5, 12)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 4, .flip 11 4, .row 4 11 8], (4, 8)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(5, 8), (5, 15), (7, 13), (7, 15), (8, 5), (8, 13), (12, 5), (12, 8)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 7, support := {13, 15} },
        { center := 8, support := {5, 13} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 8, support := {3, 11} },
        { center := 9, support := {1, 3} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨5, 7, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(5, 15), [.row 5 15 8, .flip 5 8, .row 8 5 13], (8, 13)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(1, 11), [.flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(6, 7), (6, 9), (7, 4), (7, 9), (13, 4), (13, 6), (14, 6), (14, 7)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 7, support := {4, 9} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {6, 7} }]
    reverseChoices := [{ center := 2, support := {9, 10} },
        { center := 3, support := {10, 12} },
        { center := 9, support := {7, 12} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 4, .flip 7 4], (4, 7)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 7, .flip 14 7], (7, 14)⟩
      path2 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 9, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 12], (9, 12)⟩
      path3 := ⟨(2, 10), [.row 2 10 9], (2, 9)⟩ } },
  { hits := [(0, 3), (0, 5), (3, 15), (3, 16), (5, 8), (5, 15), (8, 5), (8, 16), (9, 3), (9, 8)]
    forwardChoices := [{ center := 0, support := {3, 5} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 16} },
        { center := 9, support := {3, 8} }]
    reverseChoices := [{ center := 7, support := {8, 13} },
        { center := 8, support := {0, 11} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 15), [.row 5 15 8, .flip 5 8, .row 8 5 16], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 11), [.flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩ } }
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
end ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3
end Problem97
