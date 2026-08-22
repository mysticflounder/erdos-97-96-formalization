/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

/-! V2 source-valid two-Kalmanson candidate successor. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(5, 7), (5, 11), (7, 10), (7, 16), (10, 7), (10, 15), (11, 15), (11, 16), (13, 10), (13, 11)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {15, 16} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 5, support := {0, 1} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 11, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(11, 16), [.row 11 16 15], (11, 15)⟩
      path2 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7, .row 7 10 16], (7, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 5, 6⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(0, 6), (0, 9), (2, 5), (2, 10), (5, 7), (5, 11), (6, 4), (6, 7), (7, 6), (7, 10), (7, 16), (9, 4), (9, 7), (10, 7), (10, 15), (11, 15), (11, 16), (13, 9), (13, 10), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 6, support := {4, 7} },
        { center := 7, support := {6, 10} },
        { center := 9, support := {4, 7} },
        { center := 13, support := {9, 10} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 5, support := {0, 1} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {5, 9} },
        { center := 14, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨7, 9, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩
      path1 := ⟨(10, 13), [.flip 10 13, .row 13 10 9, .flip 13 9], (9, 13)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 10], (7, 10)⟩
      path3 := ⟨(0, 9), [.row 0 9 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 1, .flip 5 1, .row 1 5 11], (1, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 6, .flip 14 6], (6, 14)⟩ } },
  { hits := [(5, 7), (5, 15), (6, 8), (6, 10), (7, 10), (7, 16), (10, 7), (10, 15), (11, 5), (11, 16), (15, 5), (15, 8)]
    forwardChoices := [{ center := 5, support := {7, 15} },
        { center := 6, support := {8, 10} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {5, 16} },
        { center := 15, support := {5, 8} }]
    reverseChoices := [{ center := 1, support := {8, 11} },
        { center := 5, support := {0, 11} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 10, support := {6, 8} },
        { center := 11, support := {1, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 7), [.row 5 7 15, .flip 5 15, .row 15 5 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(11, 16), [.row 11 16 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(6, 8), [.row 6 8 10], (6, 10)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7, .row 7 10 16], (7, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1, .row 1 11 8], (1, 8)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(8, 10), [.flip 8 10, .row 10 8 6, .flip 10 6], (6, 10)⟩ } },
  { hits := [(2, 5), (2, 12), (4, 5), (4, 14), (12, 4), (12, 14), (14, 0), (14, 4), (16, 0), (16, 12)]
    forwardChoices := [{ center := 2, support := {5, 12} },
        { center := 4, support := {5, 14} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {0, 4} },
        { center := 16, support := {0, 12} }]
    reverseChoices := [{ center := 0, support := {4, 16} },
        { center := 2, support := {12, 16} },
        { center := 4, support := {2, 12} },
        { center := 12, support := {2, 11} },
        { center := 14, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨0, 12, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 5, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(4, 5), [.row 4 5 14, .flip 4 14, .row 14 4 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(2, 12), [.row 2 12 5], (2, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 11, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 2, .flip 12 2, .row 2 12 16], (2, 16)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 11, .flip 14 11], (11, 14)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 12), (4, 2), (4, 14), (14, 0), (14, 4), (16, 2), (16, 12)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 2, support := {1, 12} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 4} },
        { center := 16, support := {2, 12} }]
    reverseChoices := [{ center := 0, support := {4, 14} },
        { center := 2, support := {12, 16} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {4, 15} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩
      path1 := ⟨(1, 12), [], (1, 12)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 2, .flip 16 2], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨4, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(12, 14), [.row 12 14 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path1 := ⟨(4, 15), [], (4, 15)⟩
      path2 := ⟨(0, 4), [.row 0 4 14], (0, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(4, 13), (4, 14), (7, 10), (7, 13), (12, 4), (12, 14), (14, 4), (14, 10)]
    forwardChoices := [{ center := 4, support := {13, 14} },
        { center := 7, support := {10, 13} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {4, 10} }]
    reverseChoices := [{ center := 2, support := {6, 12} },
        { center := 4, support := {2, 12} },
        { center := 9, support := {3, 6} },
        { center := 12, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨4, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 10, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(4, 13), [.row 4 13 14, .flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(7, 10), [.row 7 10 13], (7, 13)⟩
      path3 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 6], (2, 6)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path3 := ⟨(6, 9), [.flip 6 9, .row 9 6 3, .flip 9 3], (3, 9)⟩ } },
  { hits := [(0, 6), (0, 14), (1, 0), (1, 4), (4, 2), (4, 14), (10, 2), (10, 6), (14, 0), (14, 4)]
    forwardChoices := [{ center := 0, support := {6, 14} },
        { center := 1, support := {0, 4} },
        { center := 4, support := {2, 14} },
        { center := 10, support := {2, 6} },
        { center := 14, support := {0, 4} }]
    reverseChoices := [{ center := 2, support := {12, 16} },
        { center := 6, support := {10, 14} },
        { center := 12, support := {2, 14} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 6, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 6], (0, 6)⟩
      path1 := ⟨(1, 10), [], (1, 10)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 4], (1, 4)⟩
      path3 := ⟨(6, 10), [.flip 6 10, .row 10 6 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(12, 14), [.row 12 14 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 10, .flip 16 10], (10, 16)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(6, 10), [.row 6 10 14], (6, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(0, 6), (0, 14), (4, 2), (4, 14), (6, 4), (6, 10), (10, 2), (10, 6), (14, 4), (14, 10)]
    forwardChoices := [{ center := 0, support := {6, 14} },
        { center := 4, support := {2, 14} },
        { center := 6, support := {4, 10} },
        { center := 10, support := {2, 6} },
        { center := 14, support := {4, 10} }]
    reverseChoices := [{ center := 2, support := {6, 12} },
        { center := 6, support := {10, 14} },
        { center := 10, support := {6, 12} },
        { center := 12, support := {2, 14} },
        { center := 16, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩
      path1 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 10, .flip 6 10, .row 10 6 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(0, 14), [.row 0 14 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path1 := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩
      path2 := ⟨(10, 12), [.row 10 12 6, .flip 10 6, .row 6 10 14], (6, 14)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(0, 1), (0, 6), (1, 0), (1, 15), (6, 4), (6, 10), (10, 6), (10, 15), (14, 0), (14, 1), (14, 4), (14, 10)]
    forwardChoices := [{ center := 0, support := {1, 6} },
        { center := 1, support := {0, 15} },
        { center := 6, support := {4, 10} },
        { center := 10, support := {6, 15} },
        { center := 14, support := {0, 1, 4, 10} }]
    reverseChoices := [{ center := 2, support := {6, 12, 15, 16} },
        { center := 6, support := {1, 10} },
        { center := 10, support := {6, 12} },
        { center := 15, support := {1, 16} },
        { center := 16, support := {10, 15} }]
    forwardData := {
      firstQuad := ⟨1, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(1, 15), [.row 1 15 0, .flip 1 0, .row 0 1 6], (0, 6)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 10, .flip 6 10, .row 10 6 15], (10, 15)⟩
      path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 1, .flip 14 1], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 6, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 6), [.row 2 6 15], (2, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 16, .flip 15 16, .row 16 15 10, .flip 16 10], (10, 16)⟩
      path2 := ⟨(10, 12), [.row 10 12 6, .flip 10 6, .row 6 10 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(2, 16), [.row 2 16 12], (2, 12)⟩ } },
  { hits := [(5, 7), (5, 11), (6, 8), (6, 10), (7, 10), (7, 16), (10, 7), (10, 15), (11, 15), (11, 16), (15, 8), (15, 11)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 6, support := {8, 10} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {15, 16} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 5, support := {0, 1} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 10, support := {6, 8} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(11, 16), [.row 11 16 15, .flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(6, 8), [.row 6 8 10], (6, 10)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7, .row 7 10 16], (7, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 1, .flip 5 1, .row 1 5 8], (1, 8)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(8, 10), [.flip 8 10, .row 10 8 6, .flip 10 6], (6, 10)⟩ } },
  { hits := [(3, 2), (3, 9), (4, 2), (4, 13), (8, 3), (8, 13), (13, 3), (13, 9)]
    forwardChoices := [{ center := 3, support := {2, 9} },
        { center := 4, support := {2, 13} },
        { center := 8, support := {3, 13} },
        { center := 13, support := {3, 9} }]
    reverseChoices := [{ center := 3, support := {7, 13} },
        { center := 8, support := {3, 13} },
        { center := 12, support := {3, 14} },
        { center := 13, support := {7, 14} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 13], (8, 13)⟩
      path1 := ⟨(9, 13), [.flip 9 13, .row 13 9 3, .flip 13 3], (3, 13)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 9], (3, 9)⟩
      path3 := ⟨(4, 13), [.row 4 13 2, .flip 4 2], (2, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 7), [.row 3 7 13], (3, 13)⟩
      path1 := ⟨(8, 13), [.row 8 13 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 14], (12, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 7, .flip 13 7], (7, 13)⟩ } },
  { hits := [(2, 5), (2, 10), (4, 5), (4, 14), (12, 4), (12, 14), (14, 4), (14, 10)]
    forwardChoices := [{ center := 2, support := {5, 10} },
        { center := 4, support := {5, 14} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {4, 10} }]
    reverseChoices := [{ center := 2, support := {6, 12} },
        { center := 4, support := {2, 12} },
        { center := 12, support := {2, 11} },
        { center := 14, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨4, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 5, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 5), [.row 4 5 14, .flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path3 := ⟨(2, 10), [.row 2 10 5], (2, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 11, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 2, .flip 12 2, .row 2 12 6], (2, 6)⟩
      path3 := ⟨(4, 14), [], (4, 14)⟩ } },
  { hits := [(0, 6), (0, 9), (2, 5), (2, 10), (3, 2), (3, 9), (6, 4), (6, 10), (9, 4), (9, 5), (10, 2), (10, 6)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 2, support := {5, 10} },
        { center := 3, support := {2, 9} },
        { center := 6, support := {4, 10} },
        { center := 9, support := {4, 5} },
        { center := 10, support := {2, 6} }]
    reverseChoices := [{ center := 6, support := {10, 14} },
        { center := 7, support := {11, 12} },
        { center := 10, support := {6, 12} },
        { center := 13, support := {7, 14} },
        { center := 14, support := {6, 11} },
        { center := 16, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 5, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 9], (3, 9)⟩
      path1 := ⟨(5, 9), [.flip 5 9, .row 9 5 4, .flip 9 4], (4, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 10, .flip 6 10, .row 10 6 2, .flip 10 2, .row 2 10 5], (2, 5)⟩
      path3 := ⟨(0, 9), [.row 0 9 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨7, 11, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 11), [.row 7 11 12], (7, 12)⟩
      path1 := ⟨(13, 14), [.row 13 14 7, .flip 13 7], (7, 13)⟩
      path2 := ⟨(10, 12), [.row 10 12 6, .flip 10 6, .row 6 10 14, .flip 6 14, .row 14 6 11, .flip 14 11], (11, 14)⟩
      path3 := ⟨(7, 16), [.flip 7 16, .row 16 7 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(5, 7), (5, 11), (6, 7), (6, 8), (7, 6), (7, 16), (10, 6), (10, 15), (11, 15), (11, 16), (15, 8), (15, 11)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 6, support := {7, 8} },
        { center := 7, support := {6, 16} },
        { center := 10, support := {6, 15} },
        { center := 11, support := {15, 16} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 5, support := {0, 1} },
        { center := 6, support := {1, 10} },
        { center := 9, support := {0, 10} },
        { center := 10, support := {8, 9} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(11, 16), [.row 11 16 15, .flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(6, 8), [.row 6 8 7, .flip 6 7, .row 7 6 16], (7, 16)⟩
      path3 := ⟨(10, 15), [.row 10 15 6, .flip 10 6], (6, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 1, .flip 5 1, .row 1 5 8], (1, 8)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 10], (6, 10)⟩
      path3 := ⟨(8, 10), [.flip 8 10, .row 10 8 9, .flip 10 9, .row 9 10 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(2, 1), (2, 10), (5, 1), (5, 7), (5, 11), (5, 15), (7, 10), (7, 16), (10, 2), (10, 7), (11, 15), (11, 16), (15, 2), (15, 11)]
    forwardChoices := [{ center := 2, support := {1, 10} },
        { center := 5, support := {1, 7, 11, 15} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {15, 16} },
        { center := 15, support := {2, 11} }]
    reverseChoices := [{ center := 1, support := {5, 14} },
        { center := 5, support := {0, 1} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {1, 5, 9, 15} },
        { center := 14, support := {6, 15} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(11, 16), [.row 11 16 15, .flip 11 15, .row 15 11 2, .flip 15 2], (2, 15)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 7, .flip 10 7, .row 7 10 16], (7, 16)⟩
      path3 := ⟨(5, 15), [.row 5 15 1, .flip 5 1], (1, 5)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 1, .flip 5 1, .row 1 5 14], (1, 14)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(1, 11), [.flip 1 11, .row 11 1 15], (11, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 6, .flip 14 6, .row 6 14 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 12), (4, 13), (4, 14), (8, 12), (8, 13), (14, 0), (14, 4)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 2, support := {1, 12} },
        { center := 4, support := {13, 14} },
        { center := 8, support := {12, 13} },
        { center := 14, support := {0, 4} }]
    reverseChoices := [{ center := 2, support := {12, 16} },
        { center := 8, support := {3, 4} },
        { center := 12, support := {2, 3} },
        { center := 14, support := {4, 15} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨2, 8, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 12), [.row 8 12 13], (8, 13)⟩
      path1 := ⟨(2, 13), [], (2, 13)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(4, 13), [.row 4 13 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (4, 2), (4, 14), (14, 0), (14, 1), (14, 4), (16, 0), (16, 2)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 1, 4} },
        { center := 16, support := {0, 2} }]
    reverseChoices := [{ center := 0, support := {14, 16} },
        { center := 2, support := {12, 15, 16} },
        { center := 12, support := {2, 14} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩
      path1 := ⟨(1, 16), [], (1, 16)⟩
      path2 := ⟨(1, 14), [.flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 2, .flip 16 2], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 14), [], (2, 14)⟩
      path1 := ⟨(0, 16), [.row 0 16 14], (0, 14)⟩
      path2 := ⟨(12, 14), [.row 12 14 2, .flip 12 2, .row 2 12 16], (2, 16)⟩
      path3 := ⟨(2, 15), [.row 2 15 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 5), (4, 5), (4, 14), (14, 0), (14, 4)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 2, support := {1, 5} },
        { center := 4, support := {5, 14} },
        { center := 14, support := {0, 4} }]
    reverseChoices := [{ center := 2, support := {12, 16} },
        { center := 12, support := {2, 11} },
        { center := 14, support := {11, 15} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 5), [.row 4 5 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩
      path1 := ⟨(2, 9), [], (2, 9)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 5], (2, 5)⟩
      path3 := ⟨(4, 9), [], (4, 9)⟩ }
    reverseData := {
      firstQuad := ⟨9, 11, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(11, 12), [.flip 11 12, .row 12 11 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path1 := ⟨(9, 14), [], (9, 14)⟩
      path2 := ⟨(9, 12), [], (9, 12)⟩
      path3 := ⟨(14, 15), [.row 14 15 11, .flip 14 11], (11, 14)⟩ } },
  { hits := [(0, 6), (0, 9), (6, 4), (6, 7), (6, 10), (7, 6), (7, 10), (9, 4), (9, 7), (10, 6), (10, 7), (13, 9), (13, 10)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 6, support := {4, 7} },
        { center := 7, support := {6, 10} },
        { center := 9, support := {4, 7} },
        { center := 13, support := {9, 10} }]
    reverseChoices := [{ center := 3, support := {6, 7} },
        { center := 6, support := {9, 10} },
        { center := 7, support := {9, 12} },
        { center := 10, support := {6, 12} },
        { center := 16, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨7, 9, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩
      path1 := ⟨(10, 13), [.flip 10 13, .row 13 10 9, .flip 13 9], (9, 13)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 10], (7, 10)⟩
      path3 := ⟨(0, 9), [.row 0 9 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 6), [.row 3 6 7], (3, 7)⟩
      path1 := ⟨(7, 9), [.row 7 9 12], (7, 12)⟩
      path2 := ⟨(10, 12), [.row 10 12 6, .flip 10 6, .row 6 10 9], (6, 9)⟩
      path3 := ⟨(7, 16), [.flip 7 16, .row 16 7 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 5), (4, 2), (4, 14), (14, 0), (14, 4), (15, 2), (15, 5)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 2, support := {1, 5} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 4} },
        { center := 15, support := {2, 5} }]
    reverseChoices := [{ center := 1, support := {11, 14} },
        { center := 2, support := {12, 16} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {11, 15} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 5⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩
      path1 := ⟨(1, 5), [], (1, 5)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 5], (2, 5)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨11, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(12, 14), [.row 12 14 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(1, 11), [.row 1 11 14], (1, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 11, .flip 14 11], (11, 14)⟩ } },
  { hits := [(5, 7), (5, 15), (6, 7), (6, 8), (7, 6), (7, 16), (10, 6), (10, 15), (11, 5), (11, 16), (15, 5), (15, 8)]
    forwardChoices := [{ center := 5, support := {7, 15} },
        { center := 6, support := {7, 8} },
        { center := 7, support := {6, 16} },
        { center := 10, support := {6, 15} },
        { center := 11, support := {5, 16} },
        { center := 15, support := {5, 8} }]
    reverseChoices := [{ center := 1, support := {8, 11} },
        { center := 5, support := {0, 11} },
        { center := 6, support := {1, 10} },
        { center := 9, support := {0, 10} },
        { center := 10, support := {8, 9} },
        { center := 11, support := {1, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 7), [.row 5 7 15, .flip 5 15, .row 15 5 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(11, 16), [.row 11 16 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(6, 8), [.row 6 8 7, .flip 6 7, .row 7 6 16], (7, 16)⟩
      path3 := ⟨(10, 15), [.row 10 15 6, .flip 10 6], (6, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1, .row 1 11 8], (1, 8)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 10], (6, 10)⟩
      path3 := ⟨(8, 10), [.flip 8 10, .row 10 8 9, .flip 10 9, .row 9 10 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(0, 6), (0, 9), (3, 9), (3, 16), (6, 4), (6, 7), (7, 6), (7, 16), (9, 4), (9, 7)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 3, support := {9, 16} },
        { center := 6, support := {4, 7} },
        { center := 7, support := {6, 16} },
        { center := 9, support := {4, 7} }]
    reverseChoices := [{ center := 7, support := {9, 12} },
        { center := 9, support := {0, 10} },
        { center := 10, support := {9, 12} },
        { center := 13, support := {0, 7} },
        { center := 16, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩
      path1 := ⟨(3, 16), [.row 3 16 9], (3, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 16], (7, 16)⟩
      path3 := ⟨(0, 9), [.row 0 9 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 12], (7, 12)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 7, .flip 13 7], (7, 13)⟩
      path2 := ⟨(10, 12), [.row 10 12 9, .flip 10 9, .row 9 10 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(7, 16), [.flip 7 16, .row 16 7 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(1, 4), (1, 13), (3, 4), (3, 9), (8, 3), (8, 13), (13, 3), (13, 9)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 3, support := {4, 9} },
        { center := 8, support := {3, 13} },
        { center := 13, support := {3, 9} }]
    reverseChoices := [{ center := 3, support := {7, 13} },
        { center := 8, support := {3, 13} },
        { center := 13, support := {7, 12} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 4, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 13], (8, 13)⟩
      path1 := ⟨(9, 13), [.flip 9 13, .row 13 9 3, .flip 13 3], (3, 13)⟩
      path2 := ⟨(3, 4), [.row 3 4 9], (3, 9)⟩
      path3 := ⟨(1, 13), [.row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 12, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 13], (3, 13)⟩
      path1 := ⟨(8, 13), [.row 8 13 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 7, .flip 13 7], (7, 13)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(2, 5), (2, 10), (5, 7), (5, 15), (7, 10), (7, 16), (10, 7), (10, 15), (11, 5), (11, 16)]
    forwardChoices := [{ center := 2, support := {5, 10} },
        { center := 5, support := {7, 15} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {5, 16} }]
    reverseChoices := [{ center := 5, support := {0, 11} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {1, 9} },
        { center := 14, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 7), [.row 5 7 15], (5, 15)⟩
      path1 := ⟨(11, 16), [.row 11 16 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(2, 5), [.row 2 5 10], (2, 10)⟩
      path3 := ⟨(10, 15), [.row 10 15 7, .flip 10 7, .row 7 10 16], (7, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 6, .flip 14 6], (6, 14)⟩ } },
  { hits := [(2, 1), (2, 10), (5, 1), (5, 7), (7, 10), (7, 16), (10, 2), (10, 7), (11, 5), (11, 16), (15, 2), (15, 5)]
    forwardChoices := [{ center := 2, support := {1, 10} },
        { center := 5, support := {1, 7} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {5, 16} },
        { center := 15, support := {2, 5} }]
    reverseChoices := [{ center := 1, support := {11, 14} },
        { center := 5, support := {0, 11} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {6, 15} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(11, 16), [.row 11 16 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 7, .flip 10 7, .row 7 10 16], (7, 16)⟩
      path3 := ⟨(5, 15), [.flip 5 15, .row 15 5 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 15], (11, 15)⟩
      path2 := ⟨(1, 11), [.row 1 11 14], (1, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 6, .flip 14 6, .row 6 14 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 10), (4, 13), (4, 14), (7, 10), (7, 13), (14, 0), (14, 4)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 2, support := {1, 10} },
        { center := 4, support := {13, 14} },
        { center := 7, support := {10, 13} },
        { center := 14, support := {0, 4} }]
    reverseChoices := [{ center := 2, support := {12, 16} },
        { center := 9, support := {3, 6} },
        { center := 12, support := {2, 3} },
        { center := 14, support := {6, 15} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨2, 7, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 10), [.row 7 10 13], (7, 13)⟩
      path1 := ⟨(2, 13), [], (2, 13)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 10], (2, 10)⟩
      path3 := ⟨(4, 13), [.row 4 13 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(6, 9), [.flip 6 9, .row 9 6 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 6, .flip 14 6], (6, 14)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 15), (11, 3), (11, 15), (12, 3), (12, 14), (14, 0), (14, 1)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 15} },
        { center := 11, support := {3, 15} },
        { center := 12, support := {3, 14} },
        { center := 14, support := {0, 1} }]
    reverseChoices := [{ center := 2, support := {15, 16} },
        { center := 4, support := {2, 13} },
        { center := 5, support := {1, 13} },
        { center := 15, support := {1, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 11, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(11, 14), [], (11, 14)⟩
      path1 := ⟨(1, 15), [.row 1 15 0, .flip 1 0, .row 0 1 14, .flip 0 14, .row 14 0 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(3, 11), [.flip 3 11, .row 11 3 15], (11, 15)⟩
      path3 := ⟨(12, 14), [.row 12 14 3, .flip 12 3], (3, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 5), [], (2, 5)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 16, .flip 15 16, .row 16 15 2, .flip 16 2, .row 2 16 15], (2, 15)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 13], (4, 13)⟩
      path3 := ⟨(5, 13), [.row 5 13 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(0, 6), (0, 14), (2, 5), (2, 10), (4, 2), (4, 14), (6, 4), (6, 10), (9, 4), (9, 5), (10, 2), (10, 6)]
    forwardChoices := [{ center := 0, support := {6, 14} },
        { center := 2, support := {5, 10} },
        { center := 4, support := {2, 14} },
        { center := 6, support := {4, 10} },
        { center := 9, support := {4, 5} },
        { center := 10, support := {2, 6} }]
    reverseChoices := [{ center := 6, support := {10, 14} },
        { center := 7, support := {11, 12} },
        { center := 10, support := {6, 12} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {6, 11} },
        { center := 16, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩
      path1 := ⟨(5, 9), [.flip 5 9, .row 9 5 4, .flip 9 4], (4, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 10, .flip 6 10, .row 10 6 2, .flip 10 2, .row 2 10 5], (2, 5)⟩
      path3 := ⟨(0, 14), [.row 0 14 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨7, 11, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(7, 11), [.row 7 11 12], (7, 12)⟩
      path1 := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩
      path2 := ⟨(10, 12), [.row 10 12 6, .flip 10 6, .row 6 10 14, .flip 6 14, .row 14 6 11, .flip 14 11], (11, 14)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(0, 6), (0, 9), (5, 7), (5, 15), (6, 4), (6, 7), (7, 6), (7, 10), (7, 16), (9, 4), (9, 7), (10, 7), (10, 15), (11, 5), (11, 16), (13, 9), (13, 10), (13, 11), (15, 5), (15, 11)]
    forwardChoices := [{ center := 0, support := {6, 9} },
        { center := 6, support := {4, 7} },
        { center := 7, support := {6, 10} },
        { center := 9, support := {4, 7} },
        { center := 13, support := {9, 10} }]
    reverseChoices := [{ center := 1, support := {5, 11} },
        { center := 3, support := {5, 6} },
        { center := 5, support := {0, 11} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {1, 9} }]
    forwardData := {
      firstQuad := ⟨7, 9, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩
      path1 := ⟨(10, 13), [.flip 10 13, .row 13 10 9, .flip 13 9], (9, 13)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 10], (7, 10)⟩
      path3 := ⟨(0, 9), [.row 0 9 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 5, 6⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 11], (5, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1, .row 1 11 5], (1, 5)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(1, 6), [.flip 1 6, .row 6 1 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩ } },
  { hits := [(0, 6), (0, 14), (4, 13), (4, 14), (6, 4), (6, 7), (7, 6), (7, 13), (9, 4), (9, 7)]
    forwardChoices := [{ center := 0, support := {6, 14} },
        { center := 4, support := {13, 14} },
        { center := 6, support := {4, 7} },
        { center := 7, support := {6, 13} },
        { center := 9, support := {4, 7} }]
    reverseChoices := [{ center := 7, support := {9, 12} },
        { center := 9, support := {3, 10} },
        { center := 10, support := {9, 12} },
        { center := 12, support := {2, 3} },
        { center := 16, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨4, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩
      path1 := ⟨(4, 13), [.row 4 13 14], (4, 14)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 13], (7, 13)⟩
      path3 := ⟨(0, 14), [.row 0 14 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 12], (7, 12)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2], (2, 12)⟩
      path2 := ⟨(10, 12), [.row 10 12 9, .flip 10 9, .row 9 10 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(4, 13), (4, 14), (8, 12), (8, 13), (12, 4), (12, 14), (14, 0), (14, 4), (16, 0), (16, 12)]
    forwardChoices := [{ center := 4, support := {13, 14} },
        { center := 8, support := {12, 13} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {0, 4} },
        { center := 16, support := {0, 12} }]
    reverseChoices := [{ center := 0, support := {4, 16} },
        { center := 2, support := {12, 16} },
        { center := 4, support := {2, 12} },
        { center := 8, support := {3, 4} },
        { center := 12, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨0, 12, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(8, 12), [.row 8 12 13], (8, 13)⟩
      path3 := ⟨(4, 13), [.row 4 13 14, .flip 4 14, .row 14 4 0, .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 16], (2, 16)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 4), (4, 2), (4, 14), (5, 1), (5, 15), (10, 2), (10, 15), (14, 0), (14, 4)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 4} },
        { center := 4, support := {2, 14} },
        { center := 5, support := {1, 15} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {0, 4} }]
    reverseChoices := [{ center := 2, support := {12, 16} },
        { center := 6, support := {1, 14} },
        { center := 11, support := {1, 15} },
        { center := 12, support := {2, 14} },
        { center := 15, support := {12, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 5⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4], (1, 4)⟩
      path1 := ⟨(1, 5), [.flip 1 5, .row 5 1 15], (5, 15)⟩
      path2 := ⟨(2, 5), [], (2, 5)⟩
      path3 := ⟨(10, 15), [.row 10 15 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 14], (6, 14)⟩
      path3 := ⟨(11, 15), [.row 11 15 1, .flip 11 1], (1, 11)⟩ } },
  { hits := [(3, 9), (3, 16), (7, 13), (7, 16), (8, 3), (8, 13), (13, 3), (13, 9)]
    forwardChoices := [{ center := 3, support := {9, 16} },
        { center := 7, support := {13, 16} },
        { center := 8, support := {3, 13} },
        { center := 13, support := {3, 9} }]
    reverseChoices := [{ center := 3, support := {7, 13} },
        { center := 8, support := {3, 13} },
        { center := 9, support := {0, 3} },
        { center := 13, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 13], (8, 13)⟩
      path1 := ⟨(9, 13), [.flip 9 13, .row 13 9 3, .flip 13 3], (3, 13)⟩
      path2 := ⟨(7, 13), [.row 7 13 16], (7, 16)⟩
      path3 := ⟨(3, 16), [.row 3 16 9], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(3, 7), [.row 3 7 13], (3, 13)⟩
      path1 := ⟨(8, 13), [.row 8 13 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(0, 13), [.flip 0 13, .row 13 0 7, .flip 13 7], (7, 13)⟩ } },
  { hits := [(0, 1), (0, 14), (1, 0), (1, 13), (4, 13), (4, 14), (14, 0), (14, 1)]
    forwardChoices := [{ center := 0, support := {1, 14} },
        { center := 1, support := {0, 13} },
        { center := 4, support := {13, 14} },
        { center := 14, support := {0, 1} }]
    reverseChoices := [{ center := 2, support := {15, 16} },
        { center := 12, support := {2, 3} },
        { center := 15, support := {3, 16} },
        { center := 16, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨3, 4, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 13), [.row 4 13 14], (4, 14)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 13), [], (3, 13)⟩
      path3 := ⟨(1, 14), [.flip 1 14, .row 14 1 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 13], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 14), [], (3, 14)⟩
      path1 := ⟨(2, 15), [.row 2 15 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2], (2, 12)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ } },
  { hits := [(2, 10), (2, 12), (4, 13), (4, 14), (8, 12), (8, 13), (12, 4), (12, 14), (14, 4), (14, 10)]
    forwardChoices := [{ center := 2, support := {10, 12} },
        { center := 4, support := {13, 14} },
        { center := 8, support := {12, 13} },
        { center := 12, support := {4, 14} },
        { center := 14, support := {4, 10} }]
    reverseChoices := [{ center := 2, support := {6, 12} },
        { center := 4, support := {2, 12} },
        { center := 8, support := {3, 4} },
        { center := 12, support := {2, 3} },
        { center := 14, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(2, 10), [.row 2 10 12], (2, 12)⟩
      path1 := ⟨(12, 14), [.row 12 14 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(8, 12), [.row 8 12 13], (8, 13)⟩
      path3 := ⟨(4, 13), [.row 4 13 14, .flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 12], (4, 12)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 6], (2, 6)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 35 := by
  native_decide

theorem cancellationOccurrences_all_check : cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def twoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem twoKalmansonRefinementClauses_length : twoKalmansonRefinementClauses.length = 140 := by
  native_decide

theorem twoKalmansonRefinementClauses_nodup : twoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_twoKalmansonRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ twoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twoKalmansonRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf ++ twoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf_length :
    canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf.length = 7409512 := by
  simp [canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf,
    canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_length,
    twoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval := sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_twoKalmansonRefinementClauses source clause hsuffix

#print axioms cancellationOccurrences_all_check
#print axioms twoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_twoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2
end Problem97
