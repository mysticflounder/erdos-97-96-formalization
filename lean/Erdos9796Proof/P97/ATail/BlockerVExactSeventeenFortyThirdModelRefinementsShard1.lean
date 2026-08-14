/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinements

/-! Child44 two-Kalmanson cancellation bank, source-checked shard 1. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(1, 8), (1, 13), (8, 5), (8, 13), (12, 5), (12, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 8, support := {5, 13} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 8, support := {3, 11} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 13], (8, 13)⟩
      path1 := ⟨(1, 12), [], (1, 12)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 8), [.row 4 8 11], (4, 11)⟩
      path1 := ⟨(3, 11), [], (3, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(2, 11), (2, 13), (7, 13), (7, 15), (16, 11), (16, 15)]
    forwardChoices := [{ center := 2, support := {11, 13} },
        { center := 7, support := {13, 15} },
        { center := 16, support := {11, 15} }]
    reverseChoices := [{ center := 0, support := {1, 5} },
        { center := 9, support := {1, 3} },
        { center := 14, support := {3, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 13, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 11), [.row 2 11 13], (2, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 5], (0, 5)⟩
      path1 := ⟨(5, 14), [.flip 5 14, .row 14 5 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(3, 15), (3, 16), (5, 12), (5, 15), (11, 12), (11, 16)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 5, support := {12, 15} },
        { center := 11, support := {12, 16} }]
    reverseChoices := [{ center := 5, support := {0, 4} },
        { center := 11, support := {1, 4} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 11, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 15), [], (11, 15)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(11, 12), [.row 11 12 16], (11, 16)⟩
      path3 := ⟨(5, 15), [.row 5 15 12], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 5, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 11), [.flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 0, .flip 5 0], (0, 5)⟩
      path3 := ⟨(0, 11), [], (0, 11)⟩ } },
  { hits := [(3, 15), (3, 16), (7, 13), (7, 15), (8, 13), (8, 16)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {13, 15} },
        { center := 8, support := {13, 16} }]
    reverseChoices := [{ center := 8, support := {0, 3} },
        { center := 9, support := {1, 3} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 8, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 15), [], (8, 15)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(8, 13), [.row 8 13 16], (8, 16)⟩
      path3 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 9), [], (0, 9)⟩ } },
  { hits := [(4, 6), (4, 12), (11, 4), (11, 12), (13, 4), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 12} },
        { center := 11, support := {4, 12} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 5, support := {4, 12} },
        { center := 12, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 11, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 12], (4, 12)⟩
      path1 := ⟨(11, 13), [], (11, 13)⟩
      path2 := ⟨(11, 12), [.row 11 12 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(3, 5), [], (3, 5)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 12], (5, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(4, 10), (4, 12), (5, 3), (5, 12), (9, 3), (9, 10)]
    forwardChoices := [{ center := 4, support := {10, 12} },
        { center := 5, support := {3, 12} },
        { center := 9, support := {3, 10} }]
    reverseChoices := [{ center := 7, support := {6, 13} },
        { center := 11, support := {4, 13} },
        { center := 12, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨4, 5, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(4, 12), [.row 4 12 10], (4, 10)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 12], (5, 12)⟩
      path3 := ⟨(9, 10), [.row 9 10 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 13], (7, 13)⟩
      path3 := ⟨(11, 13), [.row 11 13 4, .flip 11 4], (4, 11)⟩ } },
  { hits := [(4, 10), (4, 12), (9, 10), (9, 14), (15, 12), (15, 14)]
    forwardChoices := [{ center := 4, support := {10, 12} },
        { center := 9, support := {10, 14} },
        { center := 15, support := {12, 14} }]
    reverseChoices := [{ center := 1, support := {2, 4} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨4, 9, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(4, 12), [.row 4 12 10], (4, 10)⟩
      path2 := ⟨(9, 12), [], (9, 12)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 12, .flip 15 12], (12, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 4, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 2), [.row 1 2 4], (1, 4)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 12), [], (2, 12)⟩ } },
  { hits := [(5, 12), (5, 15), (7, 4), (7, 15), (11, 4), (11, 12)]
    forwardChoices := [{ center := 5, support := {12, 15} },
        { center := 7, support := {4, 15} },
        { center := 11, support := {4, 12} }]
    reverseChoices := [{ center := 5, support := {4, 12} },
        { center := 9, support := {1, 12} },
        { center := 11, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨4, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 11, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(11, 12), [.row 11 12 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(5, 15), [.row 5 15 12], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 12], (5, 12)⟩
      path3 := ⟨(1, 11), [.flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩ } },
  { hits := [(6, 7), (6, 9), (12, 8), (12, 9), (14, 7), (14, 8)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 12, support := {8, 9} },
        { center := 14, support := {7, 8} }]
    reverseChoices := [{ center := 2, support := {8, 9} },
        { center := 4, support := {7, 8} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path1 := ⟨(9, 14), [], (9, 14)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 8, .flip 12 8], (8, 12)⟩
      path3 := ⟨(8, 14), [.flip 8 14, .row 14 8 7, .flip 14 7], (7, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 7), [.row 4 7 8], (4, 8)⟩
      path1 := ⟨(8, 10), [], (8, 10)⟩
      path2 := ⟨(2, 8), [.row 2 8 9], (2, 9)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 8), (9, 14), (12, 8), (12, 9)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {8, 9} }]
    reverseChoices := [{ center := 4, support := {7, 8} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 8, .flip 12 8], (8, 12)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 7), [.row 4 7 8], (4, 8)⟩
      path1 := ⟨(2, 8), [], (2, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩ } }
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
end ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1
end Problem97
