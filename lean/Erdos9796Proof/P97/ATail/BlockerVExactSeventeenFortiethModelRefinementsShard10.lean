/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 10

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard10
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 15), (3, 16), (7, 9), (7, 15), (9, 3), (9, 14), (11, 9), (11, 12), (12, 11), (12, 14), (13, 9), (13, 16), (14, 9), (14, 12), (16, 3), (16, 11)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {9, 15} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {9, 12} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {9, 16} },
        { center := 14, support := {9, 12} },
        { center := 16, support := {3, 11} }]
    reverseChoices := [{ center := 0, support := {5, 13} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {0, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {4, 7} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {1, 7} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨9, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(13, 16), [.row 13 16 9, .flip 13 9], (9, 13)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16, .flip 3 16, .row 16 3 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0, .row 0 13 5], (0, 5)⟩
      path2 := ⟨(0, 3), [.flip 0 3, .row 3 0 7], (3, 7)⟩
      path3 := ⟨(5, 7), [.row 5 7 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(5, 6), (5, 15), (6, 9), (6, 14), (7, 5), (7, 9), (11, 12), (11, 15), (12, 11), (12, 14), (13, 6), (13, 9), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {6, 15} },
        { center := 6, support := {9, 14} },
        { center := 7, support := {5, 9} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {6, 9} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {7, 10} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 9, support := {7, 11} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {1, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path1 := ⟨(7, 9), [.row 7 9 5, .flip 7 5], (5, 7)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 11], (9, 11)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩ } },
  { hits := [(7, 9), (7, 15), (8, 5), (8, 7), (9, 3), (9, 14), (10, 3), (10, 7), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 8, support := {5, 7} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {3, 7} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 6, support := {9, 13} },
        { center := 7, support := {2, 13} },
        { center := 8, support := {9, 11} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5], (5, 8)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩
      path2 := ⟨(8, 9), [.row 8 9 11], (8, 11)⟩
      path3 := ⟨(1, 11), [.row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(1, 8), (1, 10), (5, 8), (5, 15), (8, 5), (8, 12), (9, 10), (9, 14), (11, 9), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4, 7} },
        { center := 7, support := {2, 6} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 11, .flip 12 11, .row 11 12 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path3 := ⟨(11, 12), [.row 11 12 9, .flip 11 9], (9, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 7], (5, 7)⟩
      path2 := ⟨(4, 6), [], (4, 6)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(3, 4), (3, 15), (3, 16), (9, 3), (9, 14), (11, 12), (11, 15), (12, 11), (12, 14), (13, 4), (13, 9), (14, 9), (14, 12), (15, 11), (15, 16), (16, 3), (16, 4)]
    forwardChoices := [{ center := 3, support := {4, 15, 16} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {4, 9} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {11, 16} },
        { center := 16, support := {3, 4} }]
    reverseChoices := [{ center := 0, support := {12, 13} },
        { center := 1, support := {0, 5} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {7, 12} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 7, support := {2, 13} },
        { center := 13, support := {0, 1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path1 := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(3, 4), [.row 3 4 16, .flip 3 16, .row 16 3 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(9, 13), [.flip 9 13, .row 13 9 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 12, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 12], (3, 12)⟩
      path1 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0, .row 0 13 12], (0, 12)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 8), (1, 13), (5, 8), (5, 15), (8, 5), (8, 6), (11, 12), (11, 15), (12, 11), (12, 14), (13, 6), (13, 9), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {8, 13} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 6} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {6, 9} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {7, 10} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 8, support := {10, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path1 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(8, 10), [.row 8 10 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 8), (1, 13), (5, 8), (5, 15), (8, 5), (8, 7), (10, 1), (10, 7), (11, 12), (11, 15), (12, 11), (12, 14), (14, 1), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {8, 13} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 7} },
        { center := 10, support := {1, 7} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {1, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 6, support := {9, 15} },
        { center := 8, support := {9, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 1, .flip 14 1], (1, 14)⟩
      path1 := ⟨(1, 10), [.flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path3 := ⟨(0, 14), [.row 0 14 13], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(8, 9), [.row 8 9 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 15], (2, 15)⟩
      path3 := ⟨(6, 15), [.row 6 15 9], (6, 9)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard10
end Problem97
