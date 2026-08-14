/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-! # Child41 two-Kalmanson cancellation bank, shard 11

This shard contains seven source-checked subset-minimal occurrences mined from
the authenticated Child40 SAT model.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinementsShard11
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 13), (0, 14), (5, 6), (5, 15), (7, 5), (7, 13), (11, 12), (11, 15), (12, 11), (12, 14), (13, 4), (13, 6), (14, 0), (14, 12), (15, 5), (15, 11), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 5, support := {6, 15} },
        { center := 7, support := {5, 13} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {0, 12} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {4, 16} },
        { center := 3, support := {10, 12} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 9, support := {3, 11} },
        { center := 11, support := {1, 10} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 4, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 13], (0, 13)⟩
      path3 := ⟨(7, 13), [.row 7 13 5, .flip 7 5], (5, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 9, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 11], (9, 11)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩ } },
  { hits := [(4, 10), (4, 12), (5, 8), (5, 15), (8, 5), (8, 12), (9, 10), (9, 14), (11, 8), (11, 9), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 4, support := {10, 12} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {8, 9, 12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4, 7, 8} },
        { center := 7, support := {2, 6} },
        { center := 8, support := {4, 11} },
        { center := 11, support := {1, 8} },
        { center := 12, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨4, 8, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(4, 12), [.row 4 12 10], (4, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 12, .flip 14 12, .row 12 14 11, .flip 12 11, .row 11 12 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 8, .flip 5 8, .row 8 5 12], (8, 12)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9], (9, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 8), [], (6, 8)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 8, .flip 11 8, .row 8 11 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(5, 8), [.row 5 8 7], (5, 7)⟩ } },
  { hits := [(5, 6), (5, 15), (7, 5), (7, 9), (8, 6), (8, 7), (9, 3), (9, 14), (10, 3), (10, 7), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {6, 15} },
        { center := 7, support := {5, 9} },
        { center := 8, support := {6, 7} },
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
        { center := 8, support := {9, 10} },
        { center := 9, support := {7, 11} },
        { center := 11, support := {1, 10} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 5, .flip 7 5], (5, 7)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(5, 6), [.row 5 6 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(7, 8), [.flip 7 8, .row 8 7 6, .flip 8 6], (6, 8)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 11], (9, 11)⟩
      path1 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩
      path2 := ⟨(8, 9), [.row 8 9 10], (8, 10)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩ } },
  { hits := [(5, 8), (5, 15), (6, 9), (6, 14), (8, 5), (8, 6), (11, 8), (11, 9), (11, 12), (11, 15), (12, 11), (12, 14), (13, 6), (13, 9), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 6, support := {9, 14} },
        { center := 8, support := {5, 6} },
        { center := 11, support := {8, 9, 12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {6, 9} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 3, support := {7, 10} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4, 7, 8} },
        { center := 8, support := {10, 11} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 8), [.flip 6 8, .row 8 6 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 8, .flip 11 8], (8, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(5, 7), [.row 5 7 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7], (2, 7)⟩
      path3 := ⟨(8, 10), [.row 8 10 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 8], (5, 8)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 5), (8, 7), (9, 3), (9, 14), (10, 3), (10, 7), (11, 8), (11, 9), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {5, 7} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {3, 7} },
        { center := 11, support := {8, 9, 12, 15} },
        { center := 12, support := {11, 14} },
        { center := 14, support := {9, 12} },
        { center := 15, support := {5, 11} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 2, support := {4, 7} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4, 7, 8} },
        { center := 6, support := {9, 13} },
        { center := 7, support := {2, 13} },
        { center := 8, support := {9, 11} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨3, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(3, 8), [], (3, 8)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 7), [.row 5 7 8], (5, 8)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 9), [.row 8 9 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(0, 13), (0, 14), (1, 8), (1, 13), (5, 8), (5, 15), (8, 5), (8, 6), (11, 12), (11, 15), (12, 11), (12, 14), (13, 4), (13, 6), (14, 0), (14, 12), (15, 5), (15, 11), (16, 0), (16, 4)]
    forwardChoices := [{ center := 0, support := {13, 14} },
        { center := 1, support := {8, 13} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {5, 6} },
        { center := 11, support := {12, 15} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {0, 12} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {0, 4} }]
    reverseChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {4, 16} },
        { center := 3, support := {10, 12} },
        { center := 4, support := {2, 5} },
        { center := 5, support := {1, 4} },
        { center := 8, support := {10, 11} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 4, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 0, .flip 14 0, .row 0 14 13], (0, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path1 := ⟨(0, 16), [.row 0 16 12], (0, 12)⟩
      path2 := ⟨(8, 10), [.row 8 10 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 16, .flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 8), (5, 15), (7, 9), (7, 13), (8, 5), (8, 7), (9, 3), (9, 14), (10, 3), (10, 7), (11, 12), (11, 15), (12, 11), (12, 14), (14, 9), (14, 12), (15, 5), (15, 11)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {8, 15} },
        { center := 7, support := {9, 13} },
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
        { center := 9, support := {3, 7} },
        { center := 11, support := {1, 8} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5, .row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 12, .flip 11 12, .row 12 11 14, .flip 12 14, .row 14 12 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩
      path2 := ⟨(8, 9), [.row 8 9 11, .flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 4, .flip 5 4, .row 4 5 2, .flip 4 2, .row 2 4 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } }
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
end ATailBlockerVExactSeventeenFortiethModelRefinementsShard11
end Problem97
