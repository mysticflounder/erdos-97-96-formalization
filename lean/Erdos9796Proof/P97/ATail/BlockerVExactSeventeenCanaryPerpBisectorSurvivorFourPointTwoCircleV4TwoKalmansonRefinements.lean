/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

/-! Source-valid v4 two-Kalmanson successor of the FourPoint root. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 15), (1, 0), (1, 8), (8, 3), (8, 12), (10, 8), (10, 13), (13, 12), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {3, 15} },
        { center := 1, support := {0, 8} },
        { center := 8, support := {3, 12} },
        { center := 10, support := {8, 13} },
        { center := 13, support := {12, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 4} },
        { center := 6, support := {3, 8} },
        { center := 8, support := {4, 13} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨0, 1, 3, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 8], (1, 8)⟩
      path1 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path2 := ⟨(8, 10), [.flip 8 10, .row 10 8 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨8, 13, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(15, 16), [.row 15 16 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩
      path3 := ⟨(6, 8), [.row 6 8 3, .flip 6 3], (3, 6)⟩ } },
  { hits := [(1, 8), (1, 16), (2, 5), (2, 16), (5, 1), (5, 7), (7, 5), (7, 8), (12, 1), (12, 7)]
    forwardChoices := [{ center := 1, support := {8, 16} },
        { center := 2, support := {5, 16} },
        { center := 5, support := {1, 7} },
        { center := 7, support := {5, 8} },
        { center := 12, support := {1, 7} }]
    reverseChoices := [{ center := 4, support := {9, 15} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(2, 5), [.row 2 5 16], (2, 16)⟩
      path3 := ⟨(1, 16), [.row 1 16 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path1 := ⟨(4, 15), [.row 4 15 9], (4, 9)⟩
      path2 := ⟨(11, 14), [.flip 11 14, .row 14 11 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16), (13, 12), (13, 15), (14, 4), (14, 12), (15, 0), (15, 13), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 13, support := {12, 15} },
        { center := 14, support := {4, 12} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {3, 16} },
        { center := 2, support := {4, 12} },
        { center := 3, support := {1, 4} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 12, .flip 14 12], (12, 14)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(2, 14), [], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 12), [], (3, 12)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩
      path3 := ⟨(2, 12), [.row 2 12 4], (2, 4)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 16), (8, 15), (8, 16), (9, 6), (9, 8), (15, 0), (15, 6)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 16} },
        { center := 8, support := {15, 16} },
        { center := 9, support := {6, 8} },
        { center := 15, support := {0, 6} }]
    reverseChoices := [{ center := 1, support := {10, 16} },
        { center := 7, support := {8, 10} },
        { center := 8, support := {0, 1} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path1 := ⟨(8, 16), [.row 8 16 15], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 1, .flip 8 1], (1, 8)⟩
      path1 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩
      path2 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path3 := ⟨(1, 10), [.row 1 10 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(3, 4), (3, 15), (6, 3), (6, 14), (11, 13), (11, 14), (13, 6), (13, 15), (15, 3), (15, 13), (16, 4), (16, 6)]
    forwardChoices := [{ center := 3, support := {4, 15} },
        { center := 6, support := {3, 14} },
        { center := 11, support := {13, 14} },
        { center := 13, support := {6, 15} },
        { center := 15, support := {3, 13} },
        { center := 16, support := {4, 6} }]
    reverseChoices := [{ center := 0, support := {10, 12} },
        { center := 1, support := {3, 13} },
        { center := 3, support := {1, 10} },
        { center := 5, support := {2, 3} },
        { center := 10, support := {2, 13} },
        { center := 13, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨6, 11, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(11, 13), [.row 11 13 14], (11, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 3, .flip 6 3], (3, 6)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 13, .flip 15 13, .row 13 15 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 5, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 2, .flip 5 2], (2, 5)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 13], (10, 13)⟩
      path2 := ⟨(0, 10), [.row 0 10 12], (0, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 3, .flip 1 3, .row 3 1 10], (3, 10)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (3, 4), (3, 15), (7, 3), (7, 8), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 3, support := {4, 15} },
        { center := 7, support := {3, 8} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 9, support := {8, 13} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 8), [], (4, 8)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(7, 8), [.row 7 8 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 9, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 13], (9, 13)⟩
      path1 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩
      path2 := ⟨(0, 9), [], (0, 9)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 13), (5, 7), (5, 12), (7, 5), (7, 8), (12, 5), (12, 7), (13, 12), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 13} },
        { center := 5, support := {7, 12} },
        { center := 7, support := {5, 8} },
        { center := 12, support := {5, 7} },
        { center := 13, support := {12, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 4} },
        { center := 4, support := {9, 11} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {4, 9} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path1 := ⟨(1, 12), [], (1, 12)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(4, 15), [], (4, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 8), (1, 16), (5, 7), (5, 12), (7, 5), (7, 8), (8, 12), (8, 16), (12, 5), (12, 7)]
    forwardChoices := [{ center := 1, support := {8, 16} },
        { center := 5, support := {7, 12} },
        { center := 7, support := {5, 8} },
        { center := 8, support := {12, 16} },
        { center := 12, support := {5, 7} }]
    reverseChoices := [{ center := 4, support := {9, 11} },
        { center := 8, support := {0, 4} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {4, 9} },
        { center := 15, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨7, 8, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 12), [.row 8 12 16], (8, 16)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path3 := ⟨(1, 16), [.row 1 16 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(4, 15), [], (4, 15)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 2), (0, 3), (0, 15), (1, 0), (1, 16), (2, 5), (2, 16), (3, 4), (3, 15), (4, 2), (4, 5), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 2, 3, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {5, 16} },
        { center := 3, support := {4, 15} },
        { center := 4, support := {2, 5} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {1, 12} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 13, 14, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 4⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 5), [.row 4 5 2, .flip 4 2], (2, 4)⟩
      path1 := ⟨(2, 16), [.row 2 16 5], (2, 5)⟩
      path2 := ⟨(0, 2), [.row 0 2 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨12, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(11, 12), [.flip 11 12, .row 12 11 14], (12, 14)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩ } },
  { hits := [(0, 2), (0, 15), (2, 1), (2, 13), (3, 2), (3, 15), (12, 0), (12, 1), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {1, 13} },
        { center := 3, support := {2, 15} },
        { center := 12, support := {0, 1} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 4, support := {15, 16} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨4, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(4, 16), [.row 4 16 15], (4, 15)⟩
      path2 := ⟨(1, 3), [.row 1 3 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 1), (0, 3), (1, 8), (1, 16), (8, 3), (8, 16), (9, 6), (9, 8), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {1, 3} },
        { center := 1, support := {8, 16} },
        { center := 8, support := {3, 16} },
        { center := 9, support := {6, 8} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 7, support := {8, 10} },
        { center := 8, support := {0, 13} },
        { center := 15, support := {0, 8} },
        { center := 16, support := {13, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 3, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 3], (0, 3)⟩
      path1 := ⟨(3, 8), [.flip 3 8, .row 8 3 16], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨8, 13, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 13), [.row 8 13 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(15, 16), [.flip 15 16, .row 16 15 13, .flip 16 13], (13, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path3 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 13), (9, 6), (9, 8), (13, 6), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 13} },
        { center := 9, support := {6, 8} },
        { center := 13, support := {6, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 10} },
        { center := 7, support := {8, 10} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(3, 10), [.row 3 10 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(0, 1), (0, 2), (0, 3), (0, 15), (1, 0), (1, 9), (3, 4), (3, 15), (4, 2), (4, 9), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 2, 3, 15} },
        { center := 1, support := {0, 9} },
        { center := 3, support := {4, 15} },
        { center := 4, support := {2, 9} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 12, support := {7, 14} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 13, 14, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 4⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 9), [.row 4 9 2, .flip 4 2], (2, 4)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(0, 2), [.row 0 2 1, .flip 0 1, .row 1 0 9], (1, 9)⟩
      path3 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨12, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 12), [.flip 7 12, .row 12 7 14], (12, 14)⟩
      path1 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 13, .flip 16 13], (13, 16)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (3, 4), (3, 15), (6, 3), (6, 7), (7, 4), (7, 8), (12, 1), (12, 7), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 3, support := {4, 15} },
        { center := 6, support := {3, 7} },
        { center := 7, support := {4, 8} },
        { center := 12, support := {1, 7} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 4, support := {9, 15} },
        { center := 9, support := {8, 12} },
        { center := 10, support := {9, 13} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 4, .flip 7 4], (4, 7)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(6, 7), [.row 6 7 3, .flip 6 3], (3, 6)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 12], (9, 12)⟩
      path1 := ⟨(4, 15), [.row 4 15 9], (4, 9)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (3, 14), (3, 15), (6, 7), (6, 14), (7, 3), (7, 8), (12, 1), (12, 7), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 3, support := {14, 15} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {3, 8} },
        { center := 12, support := {1, 7} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 4, support := {9, 15} },
        { center := 9, support := {8, 13} },
        { center := 10, support := {2, 9} },
        { center := 13, support := {1, 2} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 7, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(6, 7), [.row 6 7 14], (6, 14)⟩
      path3 := ⟨(3, 14), [.row 3 14 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 13], (9, 13)⟩
      path1 := ⟨(4, 15), [.row 4 15 9], (4, 9)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(2, 13), [.flip 2 13, .row 13 2 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 9), (1, 16), (2, 1), (2, 16), (13, 6), (13, 9), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {9, 16} },
        { center := 2, support := {1, 16} },
        { center := 13, support := {6, 9} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 3, support := {7, 10} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨1, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 7, .flip 15 7], (7, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 16), (8, 12), (8, 16), (10, 8), (10, 13), (13, 12), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 16} },
        { center := 8, support := {12, 16} },
        { center := 10, support := {8, 13} },
        { center := 13, support := {12, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 4} },
        { center := 6, support := {3, 8} },
        { center := 8, support := {0, 4} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path1 := ⟨(8, 16), [.row 8 16 12], (8, 12)⟩
      path2 := ⟨(8, 10), [.flip 8 10, .row 10 8 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(6, 8), [.row 6 8 3, .flip 6 3], (3, 6)⟩ } },
  { hits := [(0, 3), (0, 15), (1, 0), (1, 8), (8, 3), (8, 15), (9, 6), (9, 8), (15, 0), (15, 6)]
    forwardChoices := [{ center := 0, support := {3, 15} },
        { center := 1, support := {0, 8} },
        { center := 8, support := {3, 15} },
        { center := 9, support := {6, 8} },
        { center := 15, support := {0, 6} }]
    reverseChoices := [{ center := 1, support := {10, 16} },
        { center := 7, support := {8, 10} },
        { center := 8, support := {1, 13} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨0, 1, 3, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 8], (1, 8)⟩
      path1 := ⟨(3, 8), [.flip 3 8, .row 8 3 15], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 0, .flip 15 0, .row 0 15 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨8, 13, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(8, 13), [.row 8 13 1, .flip 8 1], (1, 8)⟩
      path1 := ⟨(15, 16), [.row 15 16 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path3 := ⟨(1, 10), [.row 1 10 16, .flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩ } },
  { hits := [(4, 9), (4, 10), (6, 10), (6, 14), (9, 6), (9, 14), (13, 6), (13, 9)]
    forwardChoices := [{ center := 4, support := {9, 10} },
        { center := 6, support := {10, 14} },
        { center := 9, support := {6, 14} },
        { center := 13, support := {6, 9} }]
    reverseChoices := [{ center := 3, support := {7, 10} },
        { center := 7, support := {2, 10} },
        { center := 10, support := {2, 6} },
        { center := 12, support := {6, 7} }]
    forwardData := {
      firstQuad := ⟨4, 6, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 9), [.flip 6 9, .row 9 6 14], (9, 14)⟩
      path1 := ⟨(4, 10), [.row 4 10 9], (4, 9)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 10], (6, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 6, .flip 10 6], (6, 10)⟩
      path2 := ⟨(7, 10), [.row 7 10 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(6, 12), [.flip 6 12, .row 12 6 7, .flip 12 7], (7, 12)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (5, 1), (5, 12), (10, 8), (10, 13), (13, 12), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 5, support := {1, 12} },
        { center := 10, support := {8, 13} },
        { center := 13, support := {12, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 4} },
        { center := 6, support := {3, 8} },
        { center := 11, support := {4, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(8, 10), [.flip 8 10, .row 10 8 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨6, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(6, 8), [.row 6 8 3, .flip 6 3], (3, 6)⟩
      path1 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(6, 11), [], (6, 11)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (3, 4), (3, 15), (8, 3), (8, 16), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 3, support := {4, 15} },
        { center := 8, support := {3, 16} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 8, support := {0, 13} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨3, 6, 8, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(8, 16), [.row 8 16 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(6, 16), [], (6, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 9, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 13], (8, 13)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(0, 9), [], (0, 9)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (3, 2), (3, 15), (4, 2), (4, 9), (7, 3), (7, 4), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 3, support := {2, 15} },
        { center := 4, support := {2, 9} },
        { center := 7, support := {3, 4} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 9, support := {12, 13} },
        { center := 12, support := {7, 14} },
        { center := 13, support := {1, 14} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 9), [.row 4 9 2, .flip 4 2], (2, 4)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩
      path3 := ⟨(4, 7), [.flip 4 7, .row 7 4 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(7, 12), [.flip 7 12, .row 12 7 14], (12, 14)⟩
      path1 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩
      path2 := ⟨(9, 12), [.row 9 12 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩ } },
  { hits := [(0, 3), (0, 15), (3, 2), (3, 15), (14, 0), (14, 2), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {3, 15} },
        { center := 3, support := {2, 15} },
        { center := 14, support := {0, 2} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 2, support := {14, 16} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨0, 2, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 9), [], (2, 9)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 3], (0, 3)⟩
      path3 := ⟨(0, 9), [], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨9, 13, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 14), [], (9, 14)⟩
      path3 := ⟨(2, 16), [.row 2 16 14], (2, 14)⟩ } },
  { hits := [(0, 2), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16), (3, 2), (3, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 3, support := {2, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨0, 14, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(15, 16), [.row 15 16 0, .flip 15 0], (0, 15)⟩
      path2 := ⟨(1, 3), [.row 1 3 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 2), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16), (13, 12), (13, 15), (14, 2), (14, 12), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 13, support := {12, 15} },
        { center := 14, support := {2, 12} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 2, support := {4, 14} },
        { center := 3, support := {1, 4} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 2], (0, 2)⟩
      path3 := ⟨(2, 14), [.flip 2 14, .row 14 2 12, .flip 14 12], (12, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 14, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(15, 16), [.row 15 16 0, .flip 15 0], (0, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(2, 14), [.row 2 14 4], (2, 4)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16), (3, 2), (3, 15), (14, 2), (14, 4), (15, 0), (15, 13), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 3, support := {2, 15} },
        { center := 14, support := {2, 4} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {3, 16} },
        { center := 2, support := {12, 14} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 2, .flip 14 2], (2, 14)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 12), [.row 2 12 14], (2, 14)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(1, 3), [.row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (2, 1), (2, 13), (13, 9), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 2, support := {1, 13} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 7} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(0, 9), [], (0, 9)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(9, 13), [.flip 9 13, .row 13 9 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨7, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(3, 7), [.row 3 7 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩
      path3 := ⟨(14, 16), [], (14, 16)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 13), (10, 2), (10, 8), (13, 12), (13, 15), (14, 2), (14, 12), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 13} },
        { center := 10, support := {2, 8} },
        { center := 13, support := {12, 15} },
        { center := 14, support := {2, 12} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 2, support := {4, 14} },
        { center := 3, support := {1, 4} },
        { center := 6, support := {8, 14} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(8, 10), [.flip 8 10, .row 10 8 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(2, 14), [.flip 2 14, .row 14 2 12, .flip 14 12], (12, 14)⟩ }
    reverseData := {
      firstQuad := ⟨6, 8, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(6, 8), [.row 6 8 14], (6, 14)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(2, 14), [.row 2 14 4], (2, 4)⟩ } },
  { hits := [(0, 1), (0, 2), (1, 0), (1, 8), (5, 7), (5, 12), (7, 5), (7, 8), (12, 0), (12, 1), (12, 5), (12, 7), (14, 2), (14, 12)]
    forwardChoices := [{ center := 0, support := {1, 2} },
        { center := 1, support := {0, 8} },
        { center := 5, support := {7, 12} },
        { center := 7, support := {5, 8} },
        { center := 12, support := {0, 1, 5, 7} },
        { center := 14, support := {2, 12} }]
    reverseChoices := [{ center := 2, support := {4, 14} },
        { center := 4, support := {9, 11, 15, 16} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {4, 9} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {14, 15} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 0, .flip 12 0], (0, 12)⟩
      path2 := ⟨(0, 2), [.row 0 2 1, .flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(12, 14), [.flip 12 14, .row 14 12 2, .flip 14 2], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(4, 15), [.row 4 15 16], (4, 16)⟩
      path2 := ⟨(2, 4), [.row 2 4 14], (2, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 16), (2, 1), (2, 16), (9, 6), (9, 8), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {8, 16} },
        { center := 2, support := {1, 16} },
        { center := 9, support := {6, 8} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 7, support := {8, 10} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 6), [], (1, 6)⟩
      path1 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (5, 7), (5, 12), (7, 5), (7, 8), (8, 12), (8, 15), (12, 0), (12, 1), (12, 5), (12, 7)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 5, support := {7, 12} },
        { center := 7, support := {5, 8} },
        { center := 8, support := {12, 15} },
        { center := 12, support := {0, 1, 5, 7} }]
    reverseChoices := [{ center := 4, support := {9, 11, 15, 16} },
        { center := 8, support := {1, 4} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {4, 9} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 0, .flip 12 0], (0, 12)⟩
      path2 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 8, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(4, 15), [.row 4 15 16], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 9), (4, 5), (4, 9), (5, 1), (5, 7), (7, 5), (7, 8), (12, 1), (12, 7)]
    forwardChoices := [{ center := 1, support := {8, 9} },
        { center := 4, support := {5, 9} },
        { center := 5, support := {1, 7} },
        { center := 7, support := {5, 8} },
        { center := 12, support := {1, 7} }]
    reverseChoices := [{ center := 4, support := {9, 15} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {9, 15} },
        { center := 12, support := {7, 11} },
        { center := 15, support := {7, 8} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 9⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(4, 5), [.row 4 5 9], (4, 9)⟩
      path3 := ⟨(1, 9), [.row 1 9 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 11, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path1 := ⟨(4, 15), [.row 4 15 9], (4, 9)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 7, .flip 12 7], (7, 12)⟩
      path3 := ⟨(7, 15), [.flip 7 15, .row 15 7 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 5), (2, 16), (3, 2), (3, 15), (7, 3), (7, 5), (14, 2), (14, 4), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {5, 16} },
        { center := 3, support := {2, 15} },
        { center := 7, support := {3, 5} },
        { center := 14, support := {2, 4} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 2, support := {12, 14} },
        { center := 9, support := {11, 13} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 2, .flip 14 2], (2, 14)⟩
      path1 := ⟨(2, 16), [.row 2 16 5], (2, 5)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 11, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 12), [.row 2 12 14], (2, 14)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩ } },
  { hits := [(0, 2), (0, 15), (2, 1), (2, 5), (3, 2), (3, 15), (7, 3), (7, 5), (12, 0), (12, 1), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {1, 5} },
        { center := 3, support := {2, 15} },
        { center := 7, support := {3, 5} },
        { center := 12, support := {0, 1} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 4, support := {15, 16} },
        { center := 9, support := {11, 13} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {11, 15} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 5], (2, 5)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 2], (0, 2)⟩
      path3 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨4, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 11, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(14, 15), [.row 14 15 11, .flip 14 11], (11, 14)⟩
      path1 := ⟨(4, 16), [.row 4 16 15], (4, 15)⟩
      path2 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩ } },
  { hits := [(0, 1), (0, 2), (0, 3), (0, 15), (3, 2), (3, 15), (12, 0), (12, 1), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {1, 2, 3, 15} },
        { center := 3, support := {2, 15} },
        { center := 12, support := {0, 1} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 4, support := {15, 16} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {1, 13, 14, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 3, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 2, 3⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 3), [], (1, 3)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(0, 1), [.row 0 1 3], (0, 3)⟩
      path3 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨4, 13, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨13, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(13, 15), [], (13, 15)⟩
      path1 := ⟨(4, 16), [.row 4 16 15], (4, 15)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 13, .flip 16 13], (13, 16)⟩ } },
  { hits := [(2, 13), (2, 16), (8, 15), (8, 16), (13, 6), (13, 15), (15, 6), (15, 13)]
    forwardChoices := [{ center := 2, support := {13, 16} },
        { center := 8, support := {15, 16} },
        { center := 13, support := {6, 15} },
        { center := 15, support := {6, 13} }]
    reverseChoices := [{ center := 1, support := {3, 10} },
        { center := 3, support := {1, 10} },
        { center := 8, support := {0, 1} },
        { center := 14, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨2, 6, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(6, 13), [.flip 6 13, .row 13 6 15, .flip 13 15, .row 15 13 6, .flip 15 6], (6, 15)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(8, 15), [.row 8 15 16], (8, 16)⟩
      path3 := ⟨(6, 16), [], (6, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 1, .flip 3 1, .row 1 3 10], (1, 10)⟩
      path1 := ⟨(1, 14), [], (1, 14)⟩
      path2 := ⟨(1, 8), [.flip 1 8, .row 8 1 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 5), (3, 2), (3, 15), (7, 3), (7, 5), (10, 2), (10, 8), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 5} },
        { center := 3, support := {2, 15} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {2, 8} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 6, support := {8, 14} },
        { center := 9, support := {11, 13} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {11, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 5], (2, 5)⟩
      path1 := ⟨(8, 10), [.flip 8 10, .row 10 8 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨6, 8, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(6, 8), [.row 6 8 14], (6, 14)⟩
      path1 := ⟨(14, 15), [.row 14 15 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(3, 2), (3, 15), (10, 2), (10, 13), (13, 6), (13, 15), (15, 6), (15, 13)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 10, support := {2, 13} },
        { center := 13, support := {6, 15} },
        { center := 15, support := {6, 13} }]
    reverseChoices := [{ center := 1, support := {3, 10} },
        { center := 3, support := {1, 10} },
        { center := 6, support := {3, 14} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨2, 6, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 6, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 6), [], (2, 6)⟩
      path1 := ⟨(10, 13), [.row 10 13 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 13, .flip 15 13, .row 13 15 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 6), [.flip 3 6, .row 6 3 14], (6, 14)⟩
      path1 := ⟨(1, 10), [.row 1 10 3, .flip 1 3, .row 3 1 10], (3, 10)⟩
      path2 := ⟨(1, 6), [], (1, 6)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (3, 4), (3, 15), (4, 9), (4, 10), (6, 3), (6, 10), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 3, support := {4, 15} },
        { center := 4, support := {9, 10} },
        { center := 6, support := {3, 10} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 10, support := {6, 13} },
        { center := 12, support := {6, 7} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩
      path3 := ⟨(6, 10), [.row 6 10 3, .flip 6 3], (3, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩
      path2 := ⟨(6, 10), [.flip 6 10, .row 10 6 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩ } },
  { hits := [(1, 8), (1, 9), (5, 7), (5, 12), (7, 5), (7, 8), (12, 5), (12, 7), (13, 9), (13, 12)]
    forwardChoices := [{ center := 1, support := {8, 9} },
        { center := 5, support := {7, 12} },
        { center := 7, support := {5, 8} },
        { center := 12, support := {5, 7} },
        { center := 13, support := {9, 12} }]
    reverseChoices := [{ center := 3, support := {4, 7} },
        { center := 4, support := {9, 11} },
        { center := 9, support := {8, 11} },
        { center := 11, support := {4, 9} },
        { center := 15, support := {7, 8} }]
    forwardData := {
      firstQuad := ⟨1, 7, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 9, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 8), [.row 7 8 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path1 := ⟨(1, 12), [], (1, 12)⟩
      path2 := ⟨(1, 9), [.row 1 9 8], (1, 8)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 9, .flip 13 9], (9, 13)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(7, 15), [.flip 7 15, .row 15 7 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 7], (3, 7)⟩
      path3 := ⟨(7, 9), [], (7, 9)⟩ } },
  { hits := [(0, 3), (0, 15), (1, 0), (1, 9), (3, 2), (3, 15), (4, 2), (4, 9), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {3, 15} },
        { center := 1, support := {0, 9} },
        { center := 3, support := {2, 15} },
        { center := 4, support := {2, 9} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 12, support := {7, 14} },
        { center := 13, support := {1, 14} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 13} }]
    forwardData := {
      firstQuad := ⟨0, 1, 4, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 4⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 9], (1, 9)⟩
      path1 := ⟨(4, 9), [.row 4 9 2, .flip 4 2], (2, 4)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 3], (0, 3)⟩
      path3 := ⟨(0, 4), [], (0, 4)⟩ }
    reverseData := {
      firstQuad := ⟨12, 13, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 12, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(7, 12), [.flip 7 12, .row 12 7 14], (12, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 7, .flip 15 7], (7, 15)⟩ } },
  { hits := [(1, 8), (1, 16), (5, 1), (5, 12), (8, 12), (8, 16), (9, 6), (9, 8), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {8, 16} },
        { center := 5, support := {1, 12} },
        { center := 8, support := {12, 16} },
        { center := 9, support := {6, 8} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 7, support := {8, 10} },
        { center := 8, support := {0, 4} },
        { center := 11, support := {4, 15} },
        { center := 15, support := {0, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path1 := ⟨(8, 12), [.row 8 12 16], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path3 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (8, 15), (8, 16), (15, 0), (15, 6), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 8, support := {15, 16} },
        { center := 15, support := {0, 6} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 1, support := {10, 16} },
        { center := 8, support := {0, 1} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨7, 8, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 15), [.row 8 15 16], (8, 16)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(7, 15), [], (7, 15)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 0, .flip 1 0, .row 0 1 15, .flip 0 15, .row 15 0 6, .flip 15 6], (6, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 9), [], (1, 9)⟩
      path1 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 16, .flip 15 16, .row 16 15 1, .flip 16 1, .row 1 16 10], (1, 10)⟩
      path2 := ⟨(1, 8), [.flip 1 8, .row 8 1 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 9), [], (0, 9)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (2, 1), (2, 13), (3, 2), (3, 15), (10, 2), (10, 8), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 2, support := {1, 13} },
        { center := 3, support := {2, 15} },
        { center := 10, support := {2, 8} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 6, support := {8, 14} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(8, 10), [.flip 8 10, .row 10 8 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨6, 8, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(6, 8), [.row 6 8 14], (6, 14)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(1, 3), [.row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 5), (2, 16), (3, 4), (3, 15), (4, 5), (4, 10), (6, 3), (6, 10), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {5, 16} },
        { center := 3, support := {4, 15} },
        { center := 4, support := {5, 10} },
        { center := 6, support := {3, 10} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 10, support := {6, 13} },
        { center := 12, support := {6, 11} },
        { center := 13, support := {1, 12} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 5), [.row 4 5 10], (4, 10)⟩
      path1 := ⟨(2, 16), [.row 2 16 5], (2, 5)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(6, 10), [.row 6 10 3, .flip 6 3], (3, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(11, 12), [.flip 11 12, .row 12 11 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(6, 10), [.flip 6 10, .row 10 6 13], (10, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 8), (5, 1), (5, 12), (8, 12), (8, 15), (9, 6), (9, 8), (15, 0), (15, 6)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 8} },
        { center := 5, support := {1, 12} },
        { center := 8, support := {12, 15} },
        { center := 9, support := {6, 8} },
        { center := 15, support := {0, 6} }]
    reverseChoices := [{ center := 1, support := {10, 16} },
        { center := 7, support := {8, 10} },
        { center := 8, support := {1, 4} },
        { center := 11, support := {4, 15} },
        { center := 15, support := {8, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path1 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 6, .flip 9 6], (6, 9)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path1 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 10], (7, 10)⟩
      path3 := ⟨(1, 10), [.row 1 10 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16), (13, 6), (13, 15), (15, 0), (15, 13), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 13, support := {6, 15} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 1, support := {3, 16} },
        { center := 3, support := {1, 10} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨5, 6, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(6, 13), [.flip 6 13, .row 13 6 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 6, .flip 16 6], (6, 16)⟩
      path1 := ⟨(5, 16), [], (5, 16)⟩
      path2 := ⟨(5, 13), [], (5, 13)⟩
      path3 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 10], (0, 10)⟩
      path1 := ⟨(1, 14), [], (1, 14)⟩
      path2 := ⟨(1, 10), [], (1, 10)⟩
      path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 9), (1, 16), (2, 1), (2, 16), (4, 9), (4, 10), (16, 1), (16, 10)]
    forwardChoices := [{ center := 1, support := {9, 16} },
        { center := 2, support := {1, 16} },
        { center := 4, support := {9, 10} },
        { center := 16, support := {1, 10} }]
    reverseChoices := [{ center := 0, support := {6, 15} },
        { center := 12, support := {6, 7} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨1, 4, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 10, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path1 := ⟨(1, 10), [], (1, 10)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path3 := ⟨(10, 16), [.flip 10 16, .row 16 10 1, .flip 16 1, .row 1 16 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(0, 6), [.row 0 6 15, .flip 0 15, .row 15 0 7, .flip 15 7], (7, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩ } },
  { hits := [(0, 2), (0, 15), (2, 1), (2, 13), (12, 0), (12, 1), (13, 12), (13, 15), (14, 2), (14, 12), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {1, 13} },
        { center := 12, support := {0, 1} },
        { center := 13, support := {12, 15} },
        { center := 14, support := {2, 12} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 2, support := {4, 14} },
        { center := 3, support := {1, 4} },
        { center := 4, support := {15, 16} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 12, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 2], (0, 2)⟩
      path3 := ⟨(2, 14), [.flip 2 14, .row 14 2 12, .flip 14 12], (12, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(4, 16), [.row 4 16 15], (4, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(2, 14), [.row 2 14 4], (2, 4)⟩ } },
  { hits := [(0, 1), (0, 3), (1, 0), (1, 16), (3, 2), (3, 15), (8, 15), (8, 16), (14, 0), (14, 2), (15, 3), (15, 6), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {1, 3} },
        { center := 1, support := {0, 16} },
        { center := 3, support := {2, 15} },
        { center := 8, support := {15, 16} },
        { center := 14, support := {0, 2} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {14, 16} },
        { center := 8, support := {0, 1} },
        { center := 13, support := {1, 14} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {13, 15} }]
    forwardData := {
      firstQuad := ⟨0, 2, 3, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(8, 15), [.row 8 15 16], (8, 16)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 0, .flip 1 0, .row 0 1 3], (0, 3)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 13, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 8), [.flip 1 8, .row 8 1 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 16, .flip 15 16, .row 16 15 13, .flip 16 13], (13, 16)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 10], (1, 10)⟩
      path3 := ⟨(2, 16), [.row 2 16 14], (2, 14)⟩ } },
  { hits := [(5, 7), (5, 12), (7, 3), (7, 5), (8, 3), (8, 12), (12, 5), (12, 7)]
    forwardChoices := [{ center := 5, support := {7, 12} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {3, 12} },
        { center := 12, support := {5, 7} }]
    reverseChoices := [{ center := 4, support := {9, 11} },
        { center := 8, support := {4, 13} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {4, 9} }]
    forwardData := {
      firstQuad := ⟨7, 8, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(3, 7), [.flip 3 7, .row 7 3 5, .flip 7 5, .row 5 7 12, .flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path3 := ⟨(8, 16), [], (8, 16)⟩ }
    reverseData := {
      firstQuad := ⟨8, 9, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 9, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(9, 13), [.row 9 13 11, .flip 9 11, .row 11 9 4, .flip 11 4, .row 4 11 9], (4, 9)⟩
      path1 := ⟨(8, 16), [], (8, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(9, 16), [], (9, 16)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (5, 1), (5, 12), (11, 12), (11, 13), (13, 9), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 5, support := {1, 12} },
        { center := 11, support := {12, 13} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 7} },
        { center := 5, support := {3, 4} },
        { center := 11, support := {4, 15} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨5, 11, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(11, 12), [.row 11 12 13], (11, 13)⟩
      path1 := ⟨(5, 13), [], (5, 13)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path3 := ⟨(9, 13), [.flip 9 13, .row 13 9 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(4, 7), [], (4, 7)⟩
      path1 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(4, 5), [.flip 4 5, .row 5 4 3, .flip 5 3], (3, 5)⟩
      path3 := ⟨(3, 7), [.row 3 7 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩ } },
  { hits := [(0, 2), (0, 15), (1, 0), (1, 16), (2, 5), (2, 16), (3, 2), (3, 15), (7, 3), (7, 5), (15, 0), (15, 3)]
    forwardChoices := [{ center := 0, support := {2, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {5, 16} },
        { center := 3, support := {2, 15} },
        { center := 7, support := {3, 5} },
        { center := 15, support := {0, 3} }]
    reverseChoices := [{ center := 1, support := {13, 16} },
        { center := 9, support := {11, 13} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 5], (2, 5)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 2], (0, 2)⟩
      path3 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 14, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(0, 14), [.flip 0 14, .row 14 0 11, .flip 14 11], (11, 14)⟩
      path1 := ⟨(15, 16), [.row 15 16 0, .flip 15 0], (0, 15)⟩
      path2 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (5, 1), (5, 12), (11, 9), (11, 13), (13, 12), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 5, support := {1, 12} },
        { center := 11, support := {9, 13} },
        { center := 13, support := {12, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 4} },
        { center := 5, support := {3, 7} },
        { center := 11, support := {4, 15} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path1 := ⟨(9, 12), [], (9, 12)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 13], (11, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(5, 7), [.row 5 7 3, .flip 5 3], (3, 5)⟩
      path1 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(3, 4), [.row 3 4 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩
      path3 := ⟨(5, 11), [], (5, 11)⟩ } },
  { hits := [(3, 4), (3, 14), (6, 3), (6, 14), (15, 3), (15, 6), (16, 4), (16, 6)]
    forwardChoices := [{ center := 3, support := {4, 14} },
        { center := 6, support := {3, 14} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {4, 6} }]
    reverseChoices := [{ center := 0, support := {10, 12} },
        { center := 1, support := {10, 13} },
        { center := 10, support := {2, 13} },
        { center := 13, support := {2, 12} }]
    forwardData := {
      firstQuad := ⟨3, 6, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 14), [.row 6 14 3, .flip 6 3], (3, 6)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 14], (3, 14)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 10, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 10), [.flip 2 10, .row 10 2 13], (10, 13)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(0, 10), [.row 0 10 12], (0, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 2, .flip 13 2], (2, 13)⟩ } },
  { hits := [(3, 4), (3, 15), (8, 3), (8, 15), (15, 3), (15, 6), (16, 4), (16, 6)]
    forwardChoices := [{ center := 3, support := {4, 15} },
        { center := 8, support := {3, 15} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {4, 6} }]
    reverseChoices := [{ center := 0, support := {10, 12} },
        { center := 1, support := {10, 13} },
        { center := 8, support := {1, 13} },
        { center := 13, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 6, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(8, 15), [.row 8 15 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 4, .flip 16 4], (4, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 8), [.flip 1 8, .row 8 1 13], (8, 13)⟩
      path1 := ⟨(0, 10), [.row 0 10 12], (0, 12)⟩
      path2 := ⟨(0, 8), [], (0, 8)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 10], (1, 10)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 16), (2, 5), (2, 16), (3, 2), (3, 15), (4, 2), (4, 5), (7, 3), (7, 4), (15, 0), (15, 3), (16, 1), (16, 4)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {5, 16} },
        { center := 3, support := {2, 15} },
        { center := 4, support := {2, 5} },
        { center := 7, support := {3, 4} },
        { center := 15, support := {0, 3} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 1, support := {13, 16} },
        { center := 9, support := {12, 13} },
        { center := 12, support := {11, 14} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 11} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 5), [.row 4 5 2, .flip 4 2], (2, 4)⟩
      path1 := ⟨(2, 16), [.row 2 16 5], (2, 5)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path3 := ⟨(4, 7), [.flip 4 7, .row 7 4 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨0, 11, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(11, 12), [.flip 11 12, .row 12 11 14], (12, 14)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 11, .flip 14 11], (11, 14)⟩
      path2 := ⟨(9, 12), [.row 9 12 13], (9, 13)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 0, .flip 15 0, .row 0 15 12], (0, 12)⟩ } },
  { hits := [(0, 1), (0, 15), (1, 0), (1, 9), (5, 1), (5, 11), (10, 11), (10, 13), (13, 9), (13, 15), (15, 0), (15, 13)]
    forwardChoices := [{ center := 0, support := {1, 15} },
        { center := 1, support := {0, 9} },
        { center := 5, support := {1, 11} },
        { center := 10, support := {11, 13} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 3, support := {1, 7} },
        { center := 6, support := {3, 5} },
        { center := 11, support := {5, 15} },
        { center := 15, support := {7, 16} },
        { center := 16, support := {1, 15} }]
    forwardData := {
      firstQuad := ⟨5, 10, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(10, 11), [.row 10 11 13], (10, 13)⟩
      path1 := ⟨(5, 13), [], (5, 13)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 11], (5, 11)⟩
      path3 := ⟨(9, 13), [.flip 9 13, .row 13 9 15, .flip 13 15, .row 15 13 0, .flip 15 0, .row 0 15 1, .flip 0 1, .row 1 0 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 7), [], (5, 7)⟩
      path1 := ⟨(11, 15), [.row 11 15 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(5, 6), [.flip 5 6, .row 6 5 3, .flip 6 3], (3, 6)⟩
      path3 := ⟨(3, 7), [.row 3 7 1, .flip 3 1, .row 1 3 16, .flip 1 16, .row 16 1 15, .flip 16 15, .row 15 16 7, .flip 15 7], (7, 15)⟩ } },
  { hits := [(1, 9), (1, 16), (2, 1), (2, 13), (8, 15), (8, 16), (13, 9), (13, 15), (15, 6), (15, 13), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {9, 16} },
        { center := 2, support := {1, 13} },
        { center := 8, support := {15, 16} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {6, 13} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 1, support := {3, 10} },
        { center := 3, support := {1, 7} },
        { center := 8, support := {0, 1} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨1, 2, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(9, 13), [.flip 9 13, .row 13 9 15, .flip 13 15, .row 15 13 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(8, 15), [.row 8 15 16], (8, 16)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1, .row 1 16 9], (1, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 8), [.flip 1 8, .row 8 1 0, .flip 8 0], (0, 8)⟩
      path1 := ⟨(0, 10), [.row 0 10 15, .flip 0 15, .row 15 0 7, .flip 15 7], (7, 15)⟩
      path2 := ⟨(3, 7), [.row 3 7 1, .flip 3 1, .row 1 3 10], (1, 10)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 59 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v4TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v4TwoKalmansonRefinementClauses_length :
    v4TwoKalmansonRefinementClauses.length = 236 := by
  native_decide

theorem v4TwoKalmansonRefinementClauses_nodup :
    v4TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_v4TwoKalmansonRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v4TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v4TwoKalmansonRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    v4TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf.length =
      7409752 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    v4TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v4TwoKalmansonRefinementClauses source clause hsuffix

#print axioms cancellationOccurrences_all_check
#print axioms v4TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v4TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
end Problem97
