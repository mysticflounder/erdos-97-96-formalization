/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 17. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 12), (0, 16), (1, 10), (1, 13), (2, 12), (2, 13), (6, 7), (6, 9), (9, 10), (9, 14), (10, 1), (10, 7), (12, 0), (12, 1), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {12, 13} },
        { center := 6, support := {7, 9} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {15, 16} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {7, 9} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path1 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(0, 12), (0, 16), (2, 6), (2, 12), (5, 6), (5, 15), (11, 14), (11, 15), (12, 0), (12, 4), (13, 4), (13, 5), (14, 11), (14, 16), (15, 5), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {6, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 11, support := {1, 10} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨4, 5, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 12), [], (5, 12)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path3 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 12), (0, 16), (3, 4), (3, 15), (8, 3), (8, 12), (10, 1), (10, 3), (11, 14), (11, 15), (12, 0), (12, 4), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {4, 15} },
        { center := 8, support := {3, 12} },
        { center := 10, support := {1, 3} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {13, 15} },
        { center := 8, support := {4, 13} },
        { center := 13, support := {1, 12} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 3, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path1 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (3, 15), (3, 16), (8, 3), (8, 12), (9, 3), (9, 14), (11, 14), (11, 15), (12, 0), (12, 9), (14, 9), (14, 11), (15, 5), (15, 11), (16, 0), (16, 5)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {15, 16} },
        { center := 8, support := {3, 12} },
        { center := 9, support := {3, 14} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 5} }]
    reverseChoices := [{ center := 0, support := {11, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 4, support := {7, 16} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 13} },
        { center := 8, support := {4, 13} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(5, 15), [.flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path3 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 5, .flip 16 5], (5, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 11), [.row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 11], (0, 11)⟩
      path3 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(0, 12), (0, 16), (5, 3), (5, 15), (8, 3), (8, 12), (11, 14), (11, 15), (12, 0), (12, 4), (13, 4), (13, 5), (14, 11), (14, 16), (15, 5), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 5, support := {3, 15} },
        { center := 8, support := {3, 12} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 8, support := {4, 13} },
        { center := 11, support := {1, 13} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(5, 3), (5, 8), (5, 15), (8, 3), (8, 9), (9, 8), (9, 14), (11, 14), (11, 15), (13, 5), (13, 16), (14, 9), (14, 11), (14, 16), (15, 5), (15, 11), (16, 5), (16, 14)]
    forwardChoices := [{ center := 5, support := {3, 8, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 13, support := {5, 16} },
        { center := 14, support := {9, 11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {5, 14} }]
    reverseChoices := [{ center := 0, support := {2, 11} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5, 7} },
        { center := 3, support := {0, 11} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 11, support := {1, 8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 5, .flip 16 5], (5, 16)⟩
      path3 := ⟨(3, 13), [], (3, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 11], (0, 11)⟩
      path2 := ⟨(0, 8), [], (0, 8)⟩
      path3 := ⟨(11, 13), [.row 11 13 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (3, 15), (3, 16), (8, 9), (8, 12), (9, 8), (9, 14), (11, 14), (11, 15), (12, 0), (12, 9), (14, 8), (14, 9), (14, 11), (15, 5), (15, 11), (16, 0), (16, 5)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 3, support := {15, 16} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 9} },
        { center := 14, support := {8, 9, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 5} }]
    reverseChoices := [{ center := 0, support := {11, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 7, 8} },
        { center := 4, support := {7, 16} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {4, 7} },
        { center := 13, support := {0, 1} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨3, 5, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 15), [.flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 12], (8, 12)⟩
      path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 0, .flip 12 0, .row 0 12 16, .flip 0 16, .row 16 0 5, .flip 16 5], (5, 16)⟩
      path3 := ⟨(8, 14), [.flip 8 14, .row 14 8 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 11), [.row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7], (2, 7)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(4, 7), [.row 4 7 16, .flip 4 16, .row 16 4 0, .flip 16 0, .row 0 16 11], (0, 11)⟩
      path3 := ⟨(2, 8), [.row 2 8 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩ } }
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17
end Problem97
