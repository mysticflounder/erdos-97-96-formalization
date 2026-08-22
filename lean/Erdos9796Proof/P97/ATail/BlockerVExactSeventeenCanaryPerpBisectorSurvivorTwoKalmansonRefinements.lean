/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements

/-!
# Full two-Kalmanson successor from the authenticated exact-seventeen canary

The canary survivor model contains seventeen source-valid two-Kalmanson
cancellations. Each occurrence carries checked forward and reflected data.
Their full named-order/orientation orbits contribute sixty-eight clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- All seventeen source-valid cancellations from the authenticated canary model. -/
def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(2, 1), (2, 11), (5, 1), (5, 7), (6, 7), (6, 14), (7, 5), (7, 6), (10, 11), (10, 14), (11, 2), (11, 6), (12, 2), (12, 5)]
    forwardChoices := [{ center := 2, support := {1, 11} },
        { center := 5, support := {1, 7} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {11, 14} },
        { center := 11, support := {2, 6} },
        { center := 12, support := {2, 5} }]
    reverseChoices := [{ center := 4, support := {11, 14} },
        { center := 5, support := {10, 14} },
        { center := 6, support := {2, 5} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {5, 15} }]
    forwardData := {
      firstQuad := ⟨6, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(10, 11), [.row 10 11 14], (10, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 2, .flip 12 2], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.flip 5 6, .row 6 5 2, .flip 6 2], (2, 6)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path2 := ⟨(4, 11), [.row 4 11 14], (4, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 5, .flip 14 5, .row 5 14 10], (5, 10)⟩ } },
  { hits := [(10, 12), (10, 14), (12, 2), (12, 15), (15, 2), (15, 14), (16, 12), (16, 15)]
    forwardChoices := [{ center := 10, support := {12, 14} },
        { center := 12, support := {2, 15} },
        { center := 15, support := {2, 14} },
        { center := 16, support := {12, 15} }]
    reverseChoices := [{ center := 0, support := {1, 4} },
        { center := 1, support := {2, 14} },
        { center := 4, support := {1, 14} },
        { center := 6, support := {2, 4} }]
    forwardData := {
      firstQuad := ⟨2, 12, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(2, 12), [.flip 2 12, .row 12 2 15], (12, 15)⟩
      path1 := ⟨(15, 16), [.flip 15 16, .row 16 15 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(10, 12), [.row 10 12 14], (10, 14)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 4, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 6⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 1), [.row 0 1 4], (0, 4)⟩
      path1 := ⟨(4, 14), [.row 4 14 1, .flip 4 1], (1, 4)⟩
      path2 := ⟨(1, 2), [.row 1 2 14], (1, 14)⟩
      path3 := ⟨(4, 6), [.flip 4 6, .row 6 4 2, .flip 6 2], (2, 6)⟩ } },
  { hits := [(2, 5), (2, 11), (5, 1), (5, 7), (6, 7), (6, 14), (7, 5), (7, 6), (10, 11), (10, 14), (11, 2), (11, 6), (15, 1), (15, 2)]
    forwardChoices := [{ center := 2, support := {5, 11} },
        { center := 5, support := {1, 7} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {11, 14} },
        { center := 11, support := {2, 6} },
        { center := 15, support := {1, 2} }]
    reverseChoices := [{ center := 1, support := {14, 15} },
        { center := 5, support := {10, 14} },
        { center := 6, support := {2, 5} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {5, 11} }]
    forwardData := {
      firstQuad := ⟨6, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(10, 11), [.row 10 11 14], (10, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path2 := ⟨(2, 5), [.row 2 5 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 6), [.flip 5 6, .row 6 5 2, .flip 6 2], (2, 6)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path2 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5, .row 5 14 10], (5, 10)⟩
      path3 := ⟨(1, 15), [.row 1 15 14], (1, 14)⟩ } },
  { hits := [(4, 5), (4, 12), (5, 7), (5, 15), (7, 5), (7, 6), (8, 6), (8, 12), (12, 7), (12, 15)]
    forwardChoices := [{ center := 4, support := {5, 12} },
        { center := 5, support := {7, 15} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {6, 12} },
        { center := 12, support := {7, 15} }]
    reverseChoices := [{ center := 4, support := {1, 9} },
        { center := 8, support := {4, 10} },
        { center := 9, support := {10, 11} },
        { center := 11, support := {1, 9} },
        { center := 12, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨6, 7, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 15], (5, 15)⟩
      path1 := ⟨(8, 12), [.row 8 12 6, .flip 8 6], (6, 8)⟩
      path2 := ⟨(4, 5), [.row 4 5 12], (4, 12)⟩
      path3 := ⟨(12, 15), [.row 12 15 7, .flip 12 7], (7, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 10], (8, 10)⟩
      path1 := ⟨(9, 10), [.row 9 10 11, .flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 9], (4, 9)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 4, .flip 12 4], (4, 12)⟩ } },
  { hits := [(0, 4), (0, 10), (1, 0), (1, 7), (6, 7), (6, 10), (7, 4), (7, 6), (8, 0), (8, 6)]
    forwardChoices := [{ center := 0, support := {4, 10} },
        { center := 1, support := {0, 7} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {4, 6} },
        { center := 8, support := {0, 6} }]
    reverseChoices := [{ center := 8, support := {10, 16} },
        { center := 9, support := {10, 12} },
        { center := 10, support := {6, 9} },
        { center := 15, support := {9, 16} },
        { center := 16, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨0, 1, 4, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 7], (1, 7)⟩
      path1 := ⟨(4, 7), [.flip 4 7, .row 7 4 6, .flip 7 6, .row 6 7 10], (6, 10)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 10), [.row 0 10 4], (0, 4)⟩ }
    reverseData := {
      firstQuad := ⟨9, 12, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(9, 12), [.row 9 12 10, .flip 9 10, .row 10 9 6, .flip 10 6], (6, 10)⟩
      path1 := ⟨(15, 16), [.row 15 16 9, .flip 15 9], (9, 15)⟩
      path2 := ⟨(8, 10), [.row 8 10 16], (8, 16)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 12, .flip 16 12], (12, 16)⟩ } },
  { hits := [(4, 5), (4, 10), (5, 7), (5, 13), (6, 7), (6, 10), (7, 5), (7, 6), (11, 6), (11, 13)]
    forwardChoices := [{ center := 4, support := {5, 10} },
        { center := 5, support := {7, 13} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {5, 6} },
        { center := 11, support := {6, 13} }]
    reverseChoices := [{ center := 5, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {6, 9} },
        { center := 11, support := {3, 9} },
        { center := 12, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨4, 6, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(6, 10), [.row 6 10 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 13], (5, 13)⟩
      path1 := ⟨(4, 11), [], (4, 11)⟩
      path2 := ⟨(4, 5), [.row 4 5 10], (4, 10)⟩
      path3 := ⟨(11, 13), [.row 11 13 6, .flip 11 6], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 3, .flip 11 3], (3, 11)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 10], (5, 10)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 6, .flip 12 6], (6, 12)⟩ } },
  { hits := [(0, 4), (0, 15), (3, 4), (3, 14), (13, 3), (13, 15), (15, 3), (15, 14)]
    forwardChoices := [{ center := 0, support := {4, 15} },
        { center := 3, support := {4, 14} },
        { center := 13, support := {3, 15} },
        { center := 15, support := {3, 14} }]
    reverseChoices := [{ center := 1, support := {2, 13} },
        { center := 3, support := {1, 13} },
        { center := 13, support := {2, 12} },
        { center := 16, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨0, 3, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 13, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 4), [.row 3 4 14], (3, 14)⟩
      path1 := ⟨(0, 15), [.row 0 15 4], (0, 4)⟩
      path2 := ⟨(3, 13), [.flip 3 13, .row 13 3 15], (13, 15)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 3, .flip 15 3], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 12, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 3, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 13), [.flip 12 13, .row 13 12 2, .flip 13 2], (2, 13)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(1, 2), [.row 1 2 13], (1, 13)⟩
      path3 := ⟨(3, 13), [.row 3 13 1, .flip 3 1], (1, 3)⟩ } },
  { hits := [(2, 11), (2, 16), (10, 11), (10, 14), (11, 2), (11, 16), (15, 2), (15, 14)]
    forwardChoices := [{ center := 2, support := {11, 16} },
        { center := 10, support := {11, 14} },
        { center := 11, support := {2, 16} },
        { center := 15, support := {2, 14} }]
    reverseChoices := [{ center := 1, support := {2, 14} },
        { center := 5, support := {0, 14} },
        { center := 6, support := {2, 5} },
        { center := 14, support := {0, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(11, 15), [], (11, 15)⟩
      path1 := ⟨(2, 16), [.row 2 16 11, .flip 2 11, .row 11 2 16], (11, 16)⟩
      path2 := ⟨(10, 11), [.row 10 11 14], (10, 14)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 5, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 6⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 5, .flip 14 5, .row 5 14 0, .flip 5 0], (0, 5)⟩
      path2 := ⟨(1, 2), [.row 1 2 14], (1, 14)⟩
      path3 := ⟨(5, 6), [.flip 5 6, .row 6 5 2, .flip 6 2], (2, 6)⟩ } },
  { hits := [(3, 9), (3, 14), (13, 3), (13, 15), (15, 3), (15, 14), (16, 9), (16, 15)]
    forwardChoices := [{ center := 3, support := {9, 14} },
        { center := 13, support := {3, 15} },
        { center := 15, support := {3, 14} },
        { center := 16, support := {9, 15} }]
    reverseChoices := [{ center := 0, support := {1, 7} },
        { center := 1, support := {2, 13} },
        { center := 3, support := {1, 13} },
        { center := 13, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨3, 9, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 13, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 9), [.row 3 9 14], (3, 14)⟩
      path1 := ⟨(15, 16), [.flip 15 16, .row 16 15 9, .flip 16 9], (9, 16)⟩
      path2 := ⟨(3, 13), [.flip 3 13, .row 13 3 15], (13, 15)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 3, .flip 15 3], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 3, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 1), [.row 0 1 7], (0, 7)⟩
      path1 := ⟨(7, 13), [.flip 7 13, .row 13 7 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(1, 2), [.row 1 2 13], (1, 13)⟩
      path3 := ⟨(3, 13), [.row 3 13 1, .flip 3 1], (1, 3)⟩ } },
  { hits := [(3, 2), (3, 14), (12, 2), (12, 15), (13, 3), (13, 15), (15, 3), (15, 14)]
    forwardChoices := [{ center := 3, support := {2, 14} },
        { center := 12, support := {2, 15} },
        { center := 13, support := {3, 15} },
        { center := 15, support := {3, 14} }]
    reverseChoices := [{ center := 1, support := {2, 13} },
        { center := 3, support := {1, 13} },
        { center := 4, support := {1, 14} },
        { center := 13, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 13, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 14], (3, 14)⟩
      path1 := ⟨(12, 15), [.row 12 15 2, .flip 12 2], (2, 12)⟩
      path2 := ⟨(3, 13), [.flip 3 13, .row 13 3 15], (13, 15)⟩
      path3 := ⟨(14, 15), [.flip 14 15, .row 15 14 3, .flip 15 3], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 3, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 14], (4, 14)⟩
      path1 := ⟨(13, 14), [.row 13 14 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(1, 2), [.row 1 2 13], (1, 13)⟩
      path3 := ⟨(3, 13), [.row 3 13 1, .flip 3 1], (1, 3)⟩ } },
  { hits := [(2, 5), (2, 11), (5, 7), (5, 13), (6, 7), (6, 14), (7, 5), (7, 6), (10, 11), (10, 14), (11, 6), (11, 13)]
    forwardChoices := [{ center := 2, support := {5, 11} },
        { center := 5, support := {7, 13} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {11, 14} },
        { center := 11, support := {6, 13} }]
    reverseChoices := [{ center := 5, support := {3, 10} },
        { center := 6, support := {2, 5} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {3, 9} },
        { center := 14, support := {5, 11} }]
    forwardData := {
      firstQuad := ⟨6, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(10, 11), [.row 10 11 14], (10, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 13], (5, 13)⟩
      path2 := ⟨(2, 5), [.row 2 5 11], (2, 11)⟩
      path3 := ⟨(11, 13), [.row 11 13 6, .flip 11 6], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 6), [.flip 5 6, .row 6 5 2, .flip 6 2], (2, 6)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 10], (5, 10)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(5, 7), (5, 15), (7, 5), (7, 6), (8, 6), (8, 12), (12, 5), (12, 7), (16, 12), (16, 15)]
    forwardChoices := [{ center := 5, support := {7, 15} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {6, 12} },
        { center := 12, support := {5, 7} },
        { center := 16, support := {12, 15} }]
    reverseChoices := [{ center := 0, support := {1, 4} },
        { center := 4, support := {9, 11} },
        { center := 8, support := {4, 10} },
        { center := 9, support := {10, 11} },
        { center := 11, support := {1, 9} }]
    forwardData := {
      firstQuad := ⟨6, 7, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 12, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 15], (5, 15)⟩
      path1 := ⟨(8, 12), [.row 8 12 6, .flip 8 6], (6, 8)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 4, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 10], (8, 10)⟩
      path1 := ⟨(9, 10), [.row 9 10 11, .flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(0, 1), [.row 0 1 4], (0, 4)⟩
      path3 := ⟨(4, 11), [.row 4 11 9], (4, 9)⟩ } },
  { hits := [(0, 10), (0, 11), (2, 5), (2, 11), (5, 7), (5, 13), (6, 7), (6, 10), (7, 5), (7, 6), (11, 6), (11, 13)]
    forwardChoices := [{ center := 0, support := {10, 11} },
        { center := 2, support := {5, 11} },
        { center := 5, support := {7, 13} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {5, 6} },
        { center := 11, support := {6, 13} }]
    reverseChoices := [{ center := 5, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {6, 9} },
        { center := 11, support := {3, 9} },
        { center := 14, support := {5, 11} },
        { center := 16, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨0, 6, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 10), [.row 6 10 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 13], (5, 13)⟩
      path1 := ⟨(0, 11), [.row 0 11 10], (0, 10)⟩
      path2 := ⟨(2, 5), [.row 2 5 11], (2, 11)⟩
      path3 := ⟨(11, 13), [.row 11 13 6, .flip 11 6], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 3, .flip 11 3], (3, 11)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 6, .flip 16 6], (6, 16)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 10], (5, 10)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(0, 10), (0, 11), (2, 5), (2, 11), (5, 1), (5, 7), (6, 7), (6, 10), (7, 5), (7, 6), (11, 2), (11, 6), (15, 1), (15, 2)]
    forwardChoices := [{ center := 0, support := {10, 11} },
        { center := 2, support := {5, 11} },
        { center := 5, support := {1, 7} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {5, 6} },
        { center := 11, support := {2, 6} },
        { center := 15, support := {1, 2} }]
    reverseChoices := [{ center := 1, support := {14, 15} },
        { center := 5, support := {10, 14} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {6, 9} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {5, 11} },
        { center := 16, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨0, 6, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(6, 10), [.row 6 10 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(0, 11), [.row 0 11 10], (0, 10)⟩
      path2 := ⟨(2, 5), [.row 2 5 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 2, .flip 15 2], (2, 15)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 6, .flip 16 6], (6, 16)⟩
      path2 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5, .row 5 14 10], (5, 10)⟩
      path3 := ⟨(1, 15), [.row 1 15 14], (1, 14)⟩ } },
  { hits := [(0, 10), (0, 11), (2, 5), (2, 11), (5, 7), (5, 15), (6, 7), (6, 10), (7, 5), (7, 6), (11, 2), (11, 6), (12, 2), (12, 15)]
    forwardChoices := [{ center := 0, support := {10, 11} },
        { center := 2, support := {5, 11} },
        { center := 5, support := {7, 15} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {5, 6} },
        { center := 11, support := {2, 6} },
        { center := 12, support := {2, 15} }]
    reverseChoices := [{ center := 4, support := {1, 14} },
        { center := 5, support := {10, 14} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {6, 9} },
        { center := 11, support := {1, 9} },
        { center := 14, support := {5, 11} },
        { center := 16, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨0, 6, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 10), [.row 6 10 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 15], (5, 15)⟩
      path1 := ⟨(0, 11), [.row 0 11 10], (0, 10)⟩
      path2 := ⟨(2, 5), [.row 2 5 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(12, 15), [.row 12 15 2, .flip 12 2], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 6, .flip 16 6], (6, 16)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 14], (4, 14)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5, .row 5 14 10], (5, 10)⟩ } },
  { hits := [(0, 10), (0, 11), (2, 1), (2, 11), (5, 1), (5, 7), (6, 7), (6, 10), (7, 5), (7, 6), (11, 2), (11, 6), (12, 2), (12, 5)]
    forwardChoices := [{ center := 0, support := {10, 11} },
        { center := 2, support := {1, 11} },
        { center := 5, support := {1, 7} },
        { center := 6, support := {7, 10} },
        { center := 7, support := {5, 6} },
        { center := 11, support := {2, 6} },
        { center := 12, support := {2, 5} }]
    reverseChoices := [{ center := 4, support := {11, 14} },
        { center := 5, support := {10, 14} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {6, 9} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {5, 15} },
        { center := 16, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨0, 6, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(6, 10), [.row 6 10 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(0, 11), [.row 0 11 10], (0, 10)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 2, .flip 12 2], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 15], (11, 15)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 6, .flip 16 6], (6, 16)⟩
      path2 := ⟨(4, 11), [.row 4 11 14], (4, 14)⟩
      path3 := ⟨(14, 15), [.row 14 15 5, .flip 14 5, .row 5 14 10], (5, 10)⟩ } },
  { hits := [(2, 5), (2, 11), (5, 7), (5, 15), (6, 7), (6, 14), (7, 5), (7, 6), (10, 11), (10, 14), (11, 2), (11, 6), (12, 2), (12, 15)]
    forwardChoices := [{ center := 2, support := {5, 11} },
        { center := 5, support := {7, 15} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {11, 14} },
        { center := 11, support := {2, 6} },
        { center := 12, support := {2, 15} }]
    reverseChoices := [{ center := 4, support := {1, 14} },
        { center := 5, support := {10, 14} },
        { center := 6, support := {2, 5} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {1, 9} },
        { center := 14, support := {5, 11} }]
    forwardData := {
      firstQuad := ⟨6, 10, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(10, 11), [.row 10 11 14], (10, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 15], (5, 15)⟩
      path2 := ⟨(2, 5), [.row 2 5 11, .flip 2 11, .row 11 2 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(12, 15), [.row 12 15 2, .flip 12 2], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(5, 6), [.flip 5 6, .row 6 5 2, .flip 6 2], (2, 6)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 14], (4, 14)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5, .row 5 14 10], (5, 10)⟩ } }]


theorem cancellationOccurrences_length :
    cancellationOccurrences.length = 17 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- The complete named-order/orientation orbit of every checked occurrence. -/
def twoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem twoKalmansonRefinementClauses_length :
    twoKalmansonRefinementClauses.length = 68 := by
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

/-- Lean-owned successor after adjoining all sixty-eight source-valid clauses. -/
def canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorRefinementCnf ++ twoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf.length = 7409372 := by
  simp [canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorRefinementCnf_length,
    twoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_twoKalmansonRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf = true) : False := by
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf source horder⟩

#print axioms cancellationOccurrences_all_check
#print axioms sourceAssign_twoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf
#print axioms false_of_sourceRealization_of_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_unsat

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements
end Problem97
