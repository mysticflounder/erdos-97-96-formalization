/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinements

/-! Child43 two-Kalmanson cancellation bank, source-checked shard 4. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 4), (3, 16), (5, 3), (5, 16), (10, 2), (10, 3), (13, 4), (13, 5), (16, 2), (16, 5)]
    forwardChoices := [{ center := 3, support := {4, 16} },
        { center := 5, support := {3, 16} },
        { center := 10, support := {2, 3} },
        { center := 13, support := {4, 5} },
        { center := 16, support := {2, 5} }]
    reverseChoices := [{ center := 0, support := {11, 14} },
        { center := 3, support := {11, 12} },
        { center := 6, support := {13, 14} },
        { center := 11, support := {0, 13} },
        { center := 13, support := {0, 12} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 5, .flip 16 5, .row 5 16 3, .flip 5 3], (3, 5)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 11, 12, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path1 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 11, .flip 0 11, .row 11 0 13], (11, 13)⟩ } },
  { hits := [(5, 3), (5, 16), (8, 11), (8, 16), (9, 3), (9, 8), (15, 5), (15, 11), (16, 5), (16, 8)]
    forwardChoices := [{ center := 5, support := {3, 16} },
        { center := 8, support := {11, 16} },
        { center := 9, support := {3, 8} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 1, support := {5, 11} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {0, 5} },
        { center := 11, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 16, .flip 5 16, .row 16 5 8, .flip 16 8, .row 8 16 11], (8, 11)⟩
      path1 := ⟨(9, 15), [], (9, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 5, .flip 15 5], (5, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 5), [.row 1 5 11], (1, 11)⟩
      path1 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path2 := ⟨(1, 7), [], (1, 7)⟩
      path3 := ⟨(11, 13), [.row 11 13 0, .flip 11 0, .row 0 11 8, .flip 0 8, .row 8 0 5, .flip 8 5], (5, 8)⟩ } },
  { hits := [(5, 6), (5, 16), (6, 1), (6, 9), (13, 6), (13, 16), (15, 1), (15, 5), (16, 5), (16, 9)]
    forwardChoices := [{ center := 5, support := {6, 16} },
        { center := 6, support := {1, 9} },
        { center := 13, support := {6, 16} },
        { center := 15, support := {1, 5} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 1, support := {11, 15} },
        { center := 3, support := {0, 10} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {0, 10} }]
    forwardData := {
      firstQuad := ⟨1, 5, 6, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(6, 9), [.row 6 9 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(13, 16), [.row 13 16 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 10, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 10], (3, 10)⟩
      path1 := ⟨(7, 10), [.flip 7 10, .row 10 7 15], (10, 15)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 7], (0, 7)⟩
      path3 := ⟨(1, 15), [.row 1 15 11], (1, 11)⟩ } },
  { hits := [(5, 6), (5, 16), (7, 9), (7, 13), (12, 5), (12, 13), (13, 6), (13, 16), (16, 5), (16, 9)]
    forwardChoices := [{ center := 5, support := {6, 16} },
        { center := 7, support := {9, 13} },
        { center := 12, support := {5, 13} },
        { center := 13, support := {6, 16} },
        { center := 16, support := {5, 9} }]
    reverseChoices := [{ center := 0, support := {7, 11} },
        { center := 3, support := {0, 10} },
        { center := 4, support := {3, 11} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {0, 10} }]
    forwardData := {
      firstQuad := ⟨7, 9, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.row 13 16 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 9, .flip 16 9], (9, 16)⟩
      path3 := ⟨(12, 13), [.row 12 13 5, .flip 12 5], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 4), [.flip 3 4, .row 4 3 11], (4, 11)⟩
      path1 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 7], (0, 7)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 10], (3, 10)⟩
      path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩ } },
  { hits := [(0, 12), (0, 14), (7, 9), (7, 13), (9, 10), (9, 14), (11, 9), (11, 12), (12, 0), (12, 10), (14, 0), (14, 13)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 7, support := {9, 13} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {0, 10} },
        { center := 14, support := {0, 13} }]
    reverseChoices := [{ center := 2, support := {3, 16} },
        { center := 4, support := {6, 16} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 6} },
        { center := 9, support := {3, 7} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨9, 10, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 9, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(11, 12), [.row 11 12 9, .flip 11 9], (9, 11)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(13, 14), [.flip 13 14, .row 14 13 0, .flip 14 0, .row 0 14 12, .flip 0 12, .row 12 0 10, .flip 12 10], (10, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 3), [.row 2 3 16, .flip 2 16, .row 16 2 4, .flip 16 4, .row 4 16 6], (4, 6)⟩
      path1 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 7], (5, 7)⟩
      path3 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(0, 3), (0, 12), (2, 6), (2, 12), (5, 6), (5, 16), (8, 0), (8, 16), (9, 3), (9, 8), (12, 0), (12, 5), (16, 5), (16, 8)]
    forwardChoices := [{ center := 0, support := {3, 12} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {6, 16} },
        { center := 8, support := {0, 16} },
        { center := 9, support := {3, 8} },
        { center := 12, support := {0, 5} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 4, support := {11, 16} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {0, 16} },
        { center := 11, support := {0, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {4, 13} }]
    forwardData := {
      firstQuad := ⟨2, 5, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 8, .flip 16 8, .row 8 16 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩
      path2 := ⟨(0, 3), [.row 0 3 12, .flip 0 12, .row 12 0 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 4, .flip 16 4, .row 4 16 11], (4, 11)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 8, .flip 0 8, .row 8 0 16], (8, 16)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 12), (0, 14), (2, 6), (2, 12), (5, 6), (5, 16), (8, 11), (8, 16), (9, 8), (9, 14), (12, 0), (12, 5), (14, 0), (14, 11), (16, 5), (16, 8)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {6, 16} },
        { center := 8, support := {11, 16} },
        { center := 9, support := {8, 14} },
        { center := 12, support := {0, 5} },
        { center := 14, support := {0, 11} },
        { center := 16, support := {5, 8} }]
    reverseChoices := [{ center := 0, support := {8, 11} },
        { center := 2, support := {5, 16} },
        { center := 4, support := {11, 16} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {0, 5} },
        { center := 11, support := {0, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨2, 5, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 16, .flip 5 16, .row 16 5 8, .flip 16 8, .row 8 16 11], (8, 11)⟩
      path1 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 0, .flip 14 0, .row 0 14 12, .flip 0 12, .row 12 0 5, .flip 12 5], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 5), [.row 2 5 16, .flip 2 16, .row 16 2 4, .flip 16 4, .row 4 16 11], (4, 11)⟩
      path1 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 0, .flip 11 0, .row 0 11 8, .flip 0 8, .row 8 0 5, .flip 8 5], (5, 8)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ } }
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
end ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4
end Problem97
