/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 2. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(12, 0), (12, 1), (15, 1), (15, 5), (16, 0), (16, 5)]
    forwardChoices := [{ center := 12, support := {0, 1} },
        { center := 15, support := {1, 5} },
        { center := 16, support := {0, 5} }]
    reverseChoices := [{ center := 0, support := {11, 16} },
        { center := 1, support := {11, 15} },
        { center := 4, support := {15, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 12), [.flip 1 12, .row 12 1 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 5, .flip 16 5], (5, 16)⟩
      path2 := ⟨(5, 15), [.flip 5 15, .row 15 5 1, .flip 15 1], (1, 15)⟩
      path3 := ⟨(1, 16), [], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 15), [.row 4 15 16], (4, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 11], (0, 11)⟩
      path2 := ⟨(1, 11), [.row 1 11 15], (1, 15)⟩
      path3 := ⟨(0, 15), [], (0, 15)⟩ } },
  { hits := [(12, 0), (12, 4), (13, 4), (13, 5), (16, 0), (16, 5)]
    forwardChoices := [{ center := 12, support := {0, 4} },
        { center := 13, support := {4, 5} },
        { center := 16, support := {0, 5} }]
    reverseChoices := [{ center := 0, support := {11, 16} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {12, 16} }]
    forwardData := {
      firstQuad := ⟨0, 5, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 5, .flip 16 5], (5, 16)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(0, 13), [], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 12), [.row 4 12 16], (4, 16)⟩
      path1 := ⟨(0, 16), [.row 0 16 11], (0, 11)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(0, 12), [], (0, 12)⟩ } },
  { hits := [(12, 1), (12, 4), (13, 4), (13, 5), (15, 1), (15, 5)]
    forwardChoices := [{ center := 12, support := {1, 4} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {1, 5} }]
    reverseChoices := [{ center := 1, support := {11, 15} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {12, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path1 := ⟨(1, 12), [], (1, 12)⟩
      path2 := ⟨(4, 12), [.row 4 12 15], (4, 15)⟩
      path3 := ⟨(1, 15), [.row 1 15 11], (1, 11)⟩ } },
  { hits := [(12, 1), (12, 9), (14, 9), (14, 11), (15, 1), (15, 11)]
    forwardChoices := [{ center := 12, support := {1, 9} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {1, 11} }]
    reverseChoices := [{ center := 1, support := {5, 15} },
        { center := 2, support := {5, 7} },
        { center := 4, support := {7, 15} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(11, 14), [.flip 11 14, .row 14 11 9, .flip 14 9], (9, 14)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 5), [.row 2 5 7], (2, 7)⟩
      path1 := ⟨(1, 7), [], (1, 7)⟩
      path2 := ⟨(4, 7), [.row 4 7 15], (4, 15)⟩
      path3 := ⟨(1, 15), [.row 1 15 5], (1, 5)⟩ } },
  { hits := [(12, 4), (12, 9), (13, 4), (13, 16), (14, 9), (14, 16)]
    forwardChoices := [{ center := 12, support := {4, 9} },
        { center := 13, support := {4, 16} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 3, support := {0, 12} },
        { center := 4, support := {7, 12} }]
    forwardData := {
      firstQuad := ⟨9, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 16], (13, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7], (2, 7)⟩
      path1 := ⟨(3, 7), [], (3, 7)⟩
      path2 := ⟨(4, 7), [.row 4 7 12], (4, 12)⟩
      path3 := ⟨(3, 12), [.row 3 12 0, .flip 3 0], (0, 3)⟩ } },
  { hits := [(0, 12), (0, 14), (8, 9), (8, 12), (9, 8), (9, 14), (14, 8), (14, 9)]
    forwardChoices := [{ center := 0, support := {12, 14} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 14, support := {8, 9} }]
    reverseChoices := [{ center := 2, support := {7, 8} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 16, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨0, 1, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(1, 12), [], (1, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 12], (0, 12)⟩
      path2 := ⟨(8, 12), [.row 8 12 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 8], (2, 8)⟩
      path3 := ⟨(2, 10), [], (2, 10)⟩ } },
  { hits := [(0, 14), (0, 16), (12, 0), (12, 9), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {14, 16} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {7, 16} },
        { center := 16, support := {0, 2} }]
    forwardData := {
      firstQuad := ⟨0, 1, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 12), [], (1, 12)⟩
      path1 := ⟨(0, 14), [.row 0 14 16, .flip 0 16, .row 16 0 14, .flip 16 14, .row 14 16 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 0, .flip 16 0, .row 0 16 2, .flip 0 2, .row 2 0 7], (2, 7)⟩
      path2 := ⟨(4, 7), [.row 4 7 16], (4, 16)⟩
      path3 := ⟨(2, 10), [], (2, 10)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2
end Problem97
