/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwoTripleRowRefinements

/-!
# Current-root two-Kalmanson occurrence refinements

The authenticated exact-seventeen current-root-v2 SAT survivor has fifty-four
new subset-minimal positive-incidence supports for the existing generic
two-Kalmanson cancellation theorem. Each record contains the independently
replayed forward and reflected certificate from
scratch/runs/exact17-two-triple-row-piqd/current-root-v2/wave-mine/analysis.json.

Each occurrence yields the four named-order/orientation clauses already checked
by the generic source theorem, for a complete 216-clause suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCurrentRootTwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwoTripleRowRefinements
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- The complete fifty-four-support wave-local cancellation bank. -/
def currentRootTwoKalmansonOccurrences : List CancellationOccurrence :=
[
  { hits := [(2, 13), (2, 16), (13, 11), (13, 16),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 2, support := {13, 16} },
        { center := 13, support := {11, 16} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {0, 5} },
        { center := 14, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨2, 11, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 16], (13, 16)⟩
      path1 := ⟨(2, 15), [], (2, 15)⟩
      path2 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 11,
                          .flip 15 11], (11, 15)⟩
      path3 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 5, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 3, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 5), [.row 3 5 0,
                          .flip 3 0], (0, 3)⟩
      path1 := ⟨(1, 14), [], (1, 14)⟩
      path2 := ⟨(1, 3), [.row 1 3 5], (1, 5)⟩
      path3 := ⟨(0, 14), [.flip 0 14,
                          .row 14 0 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(5, 3), (5, 7), (7, 3), (7, 5),
      (8, 5), (8, 7)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {5, 7} }]
    reverseChoices := [{ center := 8, support := {9, 11} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨5, 7, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(7, 8), [.flip 7 8,
                          .row 8 7 5,
                          .flip 8 5], (5, 8)⟩
      path1 := ⟨(5, 11), [], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(7, 11), [], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨9, 11, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 13], (9, 13)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(8, 9), [.row 8 9 11], (8, 11)⟩
      path3 := ⟨(11, 16), [], (11, 16)⟩ } },
  { hits := [(5, 3), (5, 7), (7, 3), (7, 6),
      (10, 6), (10, 7)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 7, support := {3, 6} },
        { center := 10, support := {6, 7} }]
    reverseChoices := [{ center := 6, support := {9, 10} },
        { center := 9, support := {10, 13} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨3, 6, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 6,
                          .flip 10 6], (6, 10)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7], (5, 7)⟩
      path3 := ⟨(6, 7), [.flip 6 7,
                          .row 7 6 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨6, 9, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(9, 10), [.row 9 10 13], (9, 13)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(6, 9), [.row 6 9 10], (6, 10)⟩
      path3 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9], (9, 11)⟩ } },
  { hits := [(5, 3), (5, 8), (7, 3), (7, 5),
      (11, 5), (11, 8)]
    forwardChoices := [{ center := 5, support := {3, 8} },
        { center := 7, support := {3, 5} },
        { center := 11, support := {5, 8} }]
    reverseChoices := [{ center := 5, support := {8, 11} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 7), [.flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path1 := ⟨(3, 8), [], (3, 8)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 8], (5, 8)⟩
      path3 := ⟨(8, 11), [.flip 8 11,
                          .row 11 8 5,
                          .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨8, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(5, 8), [.row 5 8 11], (5, 11)⟩
      path3 := ⟨(11, 13), [.row 11 13 8,
                          .flip 11 8], (8, 11)⟩ } },
  { hits := [(6, 9), (6, 12), (9, 12), (9, 13),
      (12, 9), (12, 13)]
    forwardChoices := [{ center := 6, support := {9, 12} },
        { center := 9, support := {12, 13} },
        { center := 12, support := {9, 13} }]
    reverseChoices := [{ center := 4, support := {3, 7} },
        { center := 7, support := {3, 4} },
        { center := 10, support := {4, 7} }]
    forwardData := {
      firstQuad := ⟨5, 6, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 9), [.row 6 9 12], (6, 12)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(5, 9), [], (5, 9)⟩
      path3 := ⟨(12, 13), [.row 12 13 9,
                          .flip 12 9,
                          .row 9 12 13], (9, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 4, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 7, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 4), [.flip 3 4,
                          .row 4 3 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3], (3, 7)⟩
      path1 := ⟨(2, 7), [], (2, 7)⟩
      path2 := ⟨(2, 4), [], (2, 4)⟩
      path3 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 4,
                          .flip 10 4], (4, 10)⟩ } },
  { hits := [(0, 2), (0, 5), (1, 2), (1, 16),
      (2, 1), (2, 16), (11, 1), (11, 5)]
    forwardChoices := [{ center := 0, support := {2, 5} },
        { center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 11, support := {1, 5} }]
    reverseChoices := [{ center := 5, support := {11, 15} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} },
        { center := 16, support := {11, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 5, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(5, 16), [], (5, 16)⟩
      path2 := ⟨(5, 11), [.flip 5 11,
                          .row 11 5 1,
                          .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 16), [.row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 11, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 14), [], (5, 14)⟩
      path1 := ⟨(0, 15), [.flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩
      path2 := ⟨(5, 11), [.row 5 11 15], (5, 15)⟩
      path3 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 11,
                          .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 2), (0, 14), (1, 2), (1, 16),
      (2, 1), (2, 16), (16, 1), (16, 14)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 16, support := {1, 14} }]
    reverseChoices := [{ center := 0, support := {2, 15} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 9, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 9, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 9), [], (0, 9)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩
      path2 := ⟨(0, 2), [.row 0 2 14], (0, 14)⟩
      path3 := ⟨(9, 16), [], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 9, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 9, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 9), [], (0, 9)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 2,
                          .flip 16 2], (2, 16)⟩
      path2 := ⟨(0, 2), [.row 0 2 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩
      path3 := ⟨(9, 16), [], (9, 16)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 3), (5, 7),
      (7, 3), (7, 5), (10, 4), (10, 7)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {3, 7} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {4, 7} }]
    reverseChoices := [{ center := 6, support := {9, 12} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {9, 13} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 7, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path1 := ⟨(0, 7), [], (0, 7)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 4,
                          .flip 10 4], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨9, 11, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 13], (9, 13)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(6, 9), [.row 6 9 12], (6, 12)⟩
      path3 := ⟨(12, 16), [.flip 12 16,
                          .row 16 12 11,
                          .flip 16 11], (11, 16)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 16),
      (3, 2), (3, 15), (11, 1), (11, 15)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 3, support := {2, 15} },
        { center := 11, support := {1, 15} }]
    reverseChoices := [{ center := 5, support := {1, 15} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨1, 2, 3, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 15], (3, 15)⟩
      path1 := ⟨(1, 16), [.row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩
      path2 := ⟨(1, 3), [], (1, 3)⟩
      path3 := ⟨(11, 15), [.row 11 15 1,
                          .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 14), [], (5, 14)⟩
      path1 := ⟨(0, 15), [.flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩
      path2 := ⟨(1, 5), [.flip 1 5,
                          .row 5 1 15], (5, 15)⟩
      path3 := ⟨(13, 14), [.row 13 14 1,
                          .flip 13 1], (1, 13)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 16),
      (11, 1), (11, 8), (14, 2), (14, 8)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 11, support := {1, 8} },
        { center := 14, support := {2, 8} }]
    reverseChoices := [{ center := 2, support := {8, 14} },
        { center := 5, support := {8, 15} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 8, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(8, 11), [.flip 8 11,
                          .row 11 8 1,
                          .flip 11 1], (1, 11)⟩
      path1 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 8,
                          .flip 14 8], (8, 14)⟩
      path2 := ⟨(2, 11), [], (2, 11)⟩
      path3 := ⟨(1, 16), [.row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 8, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 8), [.row 5 8 15], (5, 15)⟩
      path1 := ⟨(2, 15), [], (2, 15)⟩
      path2 := ⟨(2, 14), [.row 2 14 8], (2, 8)⟩
      path3 := ⟨(0, 15), [.flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 16),
      (14, 0), (14, 2), (16, 0), (16, 1)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 14, support := {0, 2} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 2, support := {14, 16} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0], (0, 14)⟩
      path1 := ⟨(0, 15), [], (0, 15)⟩
      path2 := ⟨(2, 15), [], (2, 15)⟩
      path3 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 14), [.row 2 14 16], (2, 16)⟩
      path1 := ⟨(1, 16), [], (1, 16)⟩
      path2 := ⟨(1, 14), [], (1, 14)⟩
      path3 := ⟨(0, 16), [.row 0 16 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩ } },
  { hits := [(2, 1), (2, 13), (11, 1), (11, 15),
      (13, 11), (13, 15), (15, 11), (15, 13)]
    forwardChoices := [{ center := 2, support := {1, 13} },
        { center := 11, support := {1, 15} },
        { center := 13, support := {11, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 5} },
        { center := 5, support := {1, 15} },
        { center := 14, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨2, 11, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11], (11, 15)⟩
      path1 := ⟨(2, 15), [], (2, 15)⟩
      path2 := ⟨(1, 2), [.flip 1 2,
                          .row 2 1 13], (2, 13)⟩
      path3 := ⟨(11, 15), [.row 11 15 1,
                          .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 5, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(3, 5), [.row 3 5 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 15], (5, 15)⟩
      path1 := ⟨(2, 14), [], (2, 14)⟩
      path2 := ⟨(2, 5), [], (2, 5)⟩
      path3 := ⟨(14, 15), [.row 14 15 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(5, 3), (5, 7), (7, 3), (7, 5),
      (10, 7), (10, 15), (11, 5), (11, 15)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {7, 15} },
        { center := 11, support := {5, 15} }]
    reverseChoices := [{ center := 5, support := {1, 11} },
        { center := 6, support := {1, 9} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨7, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 15], (10, 15)⟩
      path1 := ⟨(11, 15), [.row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(7, 11), [], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 6, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 13], (9, 13)⟩
      path2 := ⟨(1, 5), [.flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path3 := ⟨(6, 9), [.row 6 9 1,
                          .flip 6 1], (1, 6)⟩ } },
  { hits := [(6, 7), (6, 9), (7, 6), (7, 11),
      (10, 6), (10, 7), (13, 9), (13, 11)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 7, support := {6, 11} },
        { center := 10, support := {6, 7} },
        { center := 13, support := {9, 11} }]
    reverseChoices := [{ center := 3, support := {5, 7} },
        { center := 6, support := {9, 10} },
        { center := 9, support := {5, 10} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨6, 7, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 6,
                          .flip 10 6], (6, 10)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(6, 9), [.row 6 9 7,
                          .flip 6 7,
                          .row 7 6 11], (7, 11)⟩
      path3 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 9,
                          .flip 13 9], (9, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 9,
                          .flip 10 9,
                          .row 9 10 5,
                          .flip 9 5], (5, 9)⟩
      path2 := ⟨(3, 5), [.row 3 5 7], (3, 7)⟩
      path3 := ⟨(6, 9), [.row 6 9 10], (6, 10)⟩ } },
  { hits := [(9, 8), (9, 13), (11, 8), (11, 15),
      (13, 11), (13, 15), (15, 11), (15, 13)]
    forwardChoices := [{ center := 9, support := {8, 13} },
        { center := 11, support := {8, 15} },
        { center := 13, support := {11, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 5} },
        { center := 5, support := {1, 8} },
        { center := 7, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨9, 11, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 8,
                          .flip 11 8], (8, 11)⟩
      path1 := ⟨(9, 15), [], (9, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9,
                          .row 9 8 13], (9, 13)⟩
      path3 := ⟨(11, 15), [], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 5, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(3, 5), [.row 3 5 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 8], (5, 8)⟩
      path1 := ⟨(2, 7), [], (2, 7)⟩
      path2 := ⟨(2, 5), [], (2, 5)⟩
      path3 := ⟨(7, 8), [.row 7 8 3,
                          .flip 7 3], (3, 7)⟩ } },
  { hits := [(0, 2), (0, 4), (1, 2), (1, 16),
      (2, 1), (2, 16), (3, 4), (3, 10),
      (16, 1), (16, 10)]
    forwardChoices := [{ center := 0, support := {2, 4} },
        { center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 3, support := {4, 10} },
        { center := 16, support := {1, 10} }]
    reverseChoices := [{ center := 0, support := {6, 15} },
        { center := 13, support := {6, 12} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} },
        { center := 16, support := {12, 14} }]
    forwardData := {
      firstQuad := ⟨0, 3, 4, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 10, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path1 := ⟨(0, 10), [], (0, 10)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(10, 16), [.flip 10 16,
                          .row 16 10 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(12, 13), [.flip 12 13,
                          .row 13 12 6,
                          .flip 13 6], (6, 13)⟩
      path1 := ⟨(6, 16), [], (6, 16)⟩
      path2 := ⟨(0, 6), [.row 0 6 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 12,
                          .flip 16 12], (12, 16)⟩ } },
  { hits := [(0, 2), (0, 4), (1, 2), (1, 16),
      (2, 1), (2, 16), (15, 0), (15, 4),
      (16, 0), (16, 1)]
    forwardChoices := [{ center := 0, support := {2, 4} },
        { center := 1, support := {2, 16} },
        { center := 2, support := {1, 16} },
        { center := 15, support := {0, 4} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 1, support := {12, 16} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {0, 14} },
        { center := 16, support := {12, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 4, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path1 := ⟨(4, 16), [], (4, 16)⟩
      path2 := ⟨(4, 15), [.flip 4 15,
                          .row 15 4 0,
                          .flip 15 0], (0, 15)⟩
      path3 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 16], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 12, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 12), [.row 1 12 16], (1, 16)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 12,
                          .flip 16 12], (12, 16)⟩
      path2 := ⟨(1, 14), [], (1, 14)⟩
      path3 := ⟨(0, 16), [.row 0 16 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 0,
                          .flip 14 0], (0, 14)⟩ } },
  { hits := [(0, 2), (0, 14), (1, 0), (1, 16),
      (2, 6), (2, 16), (4, 2), (4, 14),
      (14, 0), (14, 6)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {6, 16} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 6} }]
    reverseChoices := [{ center := 2, support := {10, 16} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {0, 10} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 6], (2, 6)⟩
      path2 := ⟨(2, 4), [.flip 2 4,
                          .row 4 2 14], (4, 14)⟩
      path3 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(2, 10), [.row 2 10 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path1 := ⟨(12, 14), [.row 12 14 2,
                          .flip 12 2], (2, 12)⟩
      path2 := ⟨(0, 14), [.flip 0 14,
                          .row 14 0 10,
                          .flip 14 10], (10, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 0,
                          .flip 15 0], (0, 15)⟩ } },
  { hits := [(0, 2), (0, 14), (1, 0), (1, 16),
      (2, 6), (2, 16), (4, 6), (4, 14),
      (14, 0), (14, 2)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {6, 16} },
        { center := 4, support := {6, 14} },
        { center := 14, support := {0, 2} }]
    reverseChoices := [{ center := 2, support := {14, 16} },
        { center := 12, support := {2, 10} },
        { center := 14, support := {0, 10} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 6], (2, 6)⟩
      path2 := ⟨(4, 6), [.row 4 6 14], (4, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 2,
                          .flip 12 2], (2, 12)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path2 := ⟨(0, 14), [.flip 0 14,
                          .row 14 0 10,
                          .flip 14 10], (10, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 0,
                          .flip 15 0], (0, 15)⟩ } },
  { hits := [(0, 2), (0, 14), (1, 0), (1, 16),
      (2, 13), (2, 16), (9, 13), (9, 14),
      (14, 0), (14, 2)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {0, 16} },
        { center := 2, support := {13, 16} },
        { center := 9, support := {13, 14} },
        { center := 14, support := {0, 2} }]
    reverseChoices := [{ center := 2, support := {14, 16} },
        { center := 7, support := {2, 3} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {0, 16} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 16], (1, 16)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 7), [.flip 3 7,
                          .row 7 3 2,
                          .flip 7 2], (2, 7)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path2 := ⟨(0, 14), [.flip 0 14,
                          .row 14 0 3,
                          .flip 14 3], (3, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 0,
                          .flip 15 0], (0, 15)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 6),
      (4, 2), (4, 14), (14, 0), (14, 6),
      (16, 0), (16, 1)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 6} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 2, support := {10, 16} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {10, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(2, 4), [.flip 2 4,
                          .row 4 2 14], (4, 14)⟩
      path3 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(2, 10), [.row 2 10 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path1 := ⟨(12, 14), [.row 12 14 2,
                          .flip 12 2], (2, 12)⟩
      path2 := ⟨(14, 15), [.row 14 15 10,
                          .flip 14 10], (10, 14)⟩
      path3 := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 6),
      (4, 6), (4, 14), (14, 0), (14, 2),
      (16, 0), (16, 1)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 14} },
        { center := 14, support := {0, 2} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 2, support := {14, 16} },
        { center := 12, support := {2, 10} },
        { center := 14, support := {10, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(4, 6), [.row 4 6 14], (4, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 2,
                          .flip 12 2], (2, 12)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 10,
                          .flip 14 10], (10, 14)⟩
      path3 := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 13),
      (9, 13), (9, 14), (14, 0), (14, 2),
      (16, 0), (16, 1)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 13} },
        { center := 9, support := {13, 14} },
        { center := 14, support := {0, 2} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 2, support := {14, 16} },
        { center := 7, support := {2, 3} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2,
                          .row 2 1 13], (2, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 7), [.flip 3 7,
                          .row 7 3 2,
                          .flip 7 2], (2, 7)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 14,
                          .flip 16 14], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 3,
                          .flip 14 3], (3, 14)⟩
      path3 := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ } },
  { hits := [(1, 0), (1, 2), (2, 1), (2, 6),
      (4, 2), (4, 14), (14, 0), (14, 6),
      (16, 1), (16, 14)]
    forwardChoices := [{ center := 1, support := {0, 2} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {0, 6} },
        { center := 16, support := {1, 14} }]
    reverseChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {10, 16} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {14, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(2, 4), [.flip 2 4,
                          .row 4 2 14], (4, 14)⟩
      path3 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 0,
                          .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 10), [.row 2 10 16], (2, 16)⟩
      path1 := ⟨(12, 14), [.row 12 14 2,
                          .flip 12 2], (2, 12)⟩
      path2 := ⟨(0, 2), [.row 0 2 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 0), (1, 2), (2, 1), (2, 6),
      (4, 6), (4, 14), (14, 0), (14, 2),
      (16, 1), (16, 14)]
    forwardChoices := [{ center := 1, support := {0, 2} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 14} },
        { center := 14, support := {0, 2} },
        { center := 16, support := {1, 14} }]
    reverseChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {14, 16} },
        { center := 12, support := {2, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {14, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(4, 6), [.row 4 6 14], (4, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 2,
                          .flip 12 2], (2, 12)⟩
      path1 := ⟨(2, 14), [.row 2 14 16], (2, 16)⟩
      path2 := ⟨(0, 2), [.row 0 2 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 0), (1, 2), (2, 1), (2, 13),
      (9, 13), (9, 14), (14, 0), (14, 2),
      (16, 1), (16, 14)]
    forwardChoices := [{ center := 1, support := {0, 2} },
        { center := 2, support := {1, 13} },
        { center := 9, support := {13, 14} },
        { center := 14, support := {0, 2} },
        { center := 16, support := {1, 14} }]
    reverseChoices := [{ center := 0, support := {2, 15} },
        { center := 2, support := {14, 16} },
        { center := 7, support := {2, 3} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {14, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 13], (2, 13)⟩
      path1 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 1,
                          .flip 16 1], (1, 16)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 7), [.flip 3 7,
                          .row 7 3 2,
                          .flip 7 2], (2, 7)⟩
      path1 := ⟨(2, 14), [.row 2 14 16], (2, 16)⟩
      path2 := ⟨(0, 2), [.row 0 2 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 2), (1, 3), (2, 1), (2, 6),
      (3, 2), (3, 15), (7, 3), (7, 6),
      (11, 1), (11, 15)]
    forwardChoices := [{ center := 1, support := {2, 3} },
        { center := 2, support := {1, 6} },
        { center := 3, support := {2, 15} },
        { center := 7, support := {3, 6} },
        { center := 11, support := {1, 15} }]
    reverseChoices := [{ center := 5, support := {1, 15} },
        { center := 9, support := {10, 13} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {13, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 6, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 15], (3, 15)⟩
      path1 := ⟨(6, 7), [.flip 6 7,
                          .row 7 6 3,
                          .flip 7 3], (3, 7)⟩
      path2 := ⟨(1, 3), [.row 1 3 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path3 := ⟨(11, 15), [.row 11 15 1,
                          .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨9, 10, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(9, 10), [.row 9 10 13], (9, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 1,
                          .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 5), [.flip 1 5,
                          .row 5 1 15], (5, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 3), (1, 16), (6, 1), (6, 12),
      (8, 12), (8, 16), (12, 3), (12, 10),
      (16, 1), (16, 10)]
    forwardChoices := [{ center := 1, support := {3, 16} },
        { center := 6, support := {1, 12} },
        { center := 8, support := {12, 16} },
        { center := 12, support := {3, 10} },
        { center := 16, support := {1, 10} }]
    reverseChoices := [{ center := 0, support := {6, 15} },
        { center := 4, support := {6, 13} },
        { center := 8, support := {0, 4} },
        { center := 10, support := {4, 15} },
        { center := 15, support := {0, 13} }]
    forwardData := {
      firstQuad := ⟨8, 10, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 6, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 3,
                          .flip 12 3], (3, 12)⟩
      path1 := ⟨(8, 16), [.row 8 16 12], (8, 12)⟩
      path2 := ⟨(1, 3), [.row 1 3 16,
                          .flip 1 16,
                          .row 16 1 10,
                          .flip 16 10], (10, 16)⟩
      path3 := ⟨(6, 12), [.row 6 12 1,
                          .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 6, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 13], (4, 13)⟩
      path1 := ⟨(0, 8), [.flip 0 8,
                          .row 8 0 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 10), [.flip 4 10,
                          .row 10 4 15], (10, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 0,
                          .flip 15 0,
                          .row 0 15 6], (0, 6)⟩ } },
  { hits := [(2, 13), (2, 16), (8, 5), (8, 16),
      (11, 5), (11, 15), (13, 11), (13, 15),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 2, support := {13, 16} },
        { center := 8, support := {5, 16} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {11, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 5} },
        { center := 5, support := {1, 11} },
        { center := 8, support := {0, 11} },
        { center := 14, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨2, 8, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 13), [], (8, 13)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(5, 8), [.flip 5 8,
                          .row 8 5 16], (8, 16)⟩
      path3 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 5), [.row 3 5 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path1 := ⟨(0, 14), [.flip 0 14,
                          .row 14 0 3,
                          .flip 14 3], (3, 14)⟩
      path2 := ⟨(0, 5), [], (0, 5)⟩
      path3 := ⟨(8, 11), [.row 8 11 0,
                          .flip 8 0], (0, 8)⟩ } },
  { hits := [(5, 3), (5, 10), (6, 7), (6, 9),
      (7, 3), (7, 6), (10, 6), (10, 7),
      (12, 9), (12, 10)]
    forwardChoices := [{ center := 5, support := {3, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {3, 6} },
        { center := 10, support := {6, 7} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 6, support := {9, 10} },
        { center := 9, support := {10, 13} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 10], (5, 10)⟩
      path1 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 6,
                          .flip 10 6], (6, 10)⟩
      path2 := ⟨(6, 9), [.row 6 9 7,
                          .flip 6 7,
                          .row 7 6 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9], (9, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(7, 10), [.flip 7 10,
                          .row 10 7 9,
                          .flip 10 9,
                          .row 9 10 13], (9, 13)⟩
      path2 := ⟨(6, 9), [.row 6 9 10], (6, 10)⟩
      path3 := ⟨(11, 13), [.row 11 13 6,
                          .flip 11 6], (6, 11)⟩ } },
  { hits := [(5, 7), (5, 8), (6, 7), (6, 12),
      (7, 5), (7, 6), (8, 5), (8, 12),
      (14, 6), (14, 8)]
    forwardChoices := [{ center := 5, support := {7, 8} },
        { center := 6, support := {7, 12} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {5, 12} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 8, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {4, 9} },
        { center := 11, support := {8, 9} }]
    forwardData := {
      firstQuad := ⟨7, 8, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(8, 12), [.row 8 12 5,
                          .flip 8 5,
                          .row 5 8 7,
                          .flip 5 7,
                          .row 7 5 6,
                          .flip 7 6,
                          .row 6 7 12], (6, 12)⟩
      path1 := ⟨(7, 14), [], (7, 14)⟩
      path2 := ⟨(7, 12), [], (7, 12)⟩
      path3 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 8,
                          .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 8), [.flip 4 8,
                          .row 8 4 11,
                          .flip 8 11,
                          .row 11 8 9,
                          .flip 11 9,
                          .row 9 11 10,
                          .flip 9 10,
                          .row 10 9 4,
                          .flip 10 4], (4, 10)⟩
      path1 := ⟨(3, 10), [], (3, 10)⟩
      path2 := ⟨(3, 8), [], (3, 8)⟩
      path3 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩ } },
  { hits := [(6, 1), (6, 12), (9, 12), (9, 13),
      (11, 1), (11, 15), (13, 11), (13, 15),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 6, support := {1, 12} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {1, 15} },
        { center := 13, support := {11, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 5} },
        { center := 5, support := {1, 15} },
        { center := 7, support := {3, 4} },
        { center := 10, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨6, 9, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 12), [.row 9 12 13], (9, 13)⟩
      path1 := ⟨(6, 13), [], (6, 13)⟩
      path2 := ⟨(1, 6), [.flip 1 6,
                          .row 6 1 12], (6, 12)⟩
      path3 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 1,
                          .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 5), [.row 3 5 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 15], (5, 15)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(4, 7), [.flip 4 7,
                          .row 7 4 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(10, 15), [.row 10 15 4,
                          .flip 10 4], (4, 10)⟩ } },
  { hits := [(8, 5), (8, 12), (9, 12), (9, 13),
      (11, 5), (11, 15), (13, 11), (13, 15),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 8, support := {5, 12} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {11, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 5} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨8, 9, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 12), [.row 9 12 13], (9, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(5, 8), [.flip 5 8,
                          .row 8 5 12], (8, 12)⟩
      path3 := ⟨(11, 13), [.flip 11 13,
                          .row 13 11 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 5), [.row 3 5 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path1 := ⟨(8, 11), [.row 8 11 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 7), [.flip 4 7,
                          .row 7 4 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(3, 8), [], (3, 8)⟩ } },
  { hits := [(8, 12), (8, 16), (9, 12), (9, 14),
      (12, 9), (12, 10), (13, 9), (13, 16),
      (16, 10), (16, 14)]
    forwardChoices := [{ center := 8, support := {12, 16} },
        { center := 9, support := {12, 14} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 16} },
        { center := 16, support := {10, 14} }]
    reverseChoices := [{ center := 0, support := {2, 6} },
        { center := 3, support := {0, 7} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {2, 4} },
        { center := 8, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨8, 10, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 14], (9, 14)⟩
      path1 := ⟨(8, 16), [.row 8 16 12], (8, 12)⟩
      path2 := ⟨(9, 13), [.flip 9 13,
                          .row 13 9 16], (13, 16)⟩
      path3 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 10,
                          .flip 16 10], (10, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 6, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 2,
                          .flip 7 2], (2, 7)⟩
      path1 := ⟨(0, 8), [.flip 0 8,
                          .row 8 0 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(0, 2), [.row 0 2 6], (0, 6)⟩
      path3 := ⟨(3, 7), [.row 3 7 0,
                          .flip 3 0], (0, 3)⟩ } },
  { hits := [(0, 5), (0, 14), (1, 0), (1, 2),
      (2, 1), (2, 6), (4, 2), (4, 14),
      (11, 1), (11, 5), (14, 0), (14, 6)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 1, support := {0, 2} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {2, 14} },
        { center := 11, support := {1, 5} },
        { center := 14, support := {0, 6} }]
    reverseChoices := [{ center := 2, support := {10, 16} },
        { center := 5, support := {11, 15} },
        { center := 12, support := {2, 14} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {14, 16} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(5, 11), [.flip 5 11,
                          .row 11 5 1,
                          .flip 11 1], (1, 11)⟩
      path2 := ⟨(2, 4), [.flip 2 4,
                          .row 4 2 14], (4, 14)⟩
      path3 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 0,
                          .flip 14 0,
                          .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 11, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 10), [.row 2 10 16,
                          .flip 2 16,
                          .row 16 2 11,
                          .flip 16 11], (11, 16)⟩
      path1 := ⟨(12, 14), [.row 12 14 2,
                          .flip 12 2], (2, 12)⟩
      path2 := ⟨(5, 11), [.row 5 11 15], (5, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 5), (0, 14), (1, 0), (1, 2),
      (2, 1), (2, 6), (4, 6), (4, 14),
      (11, 1), (11, 5), (14, 0), (14, 2)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 1, support := {0, 2} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 14} },
        { center := 11, support := {1, 5} },
        { center := 14, support := {0, 2} }]
    reverseChoices := [{ center := 2, support := {14, 16} },
        { center := 5, support := {11, 15} },
        { center := 12, support := {2, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {14, 16} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩
      path1 := ⟨(5, 11), [.flip 5 11,
                          .row 11 5 1,
                          .flip 11 1], (1, 11)⟩
      path2 := ⟨(4, 6), [.row 4 6 14], (4, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 11, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 2,
                          .flip 12 2], (2, 12)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 11,
                          .flip 16 11], (11, 16)⟩
      path2 := ⟨(5, 11), [.row 5 11 15], (5, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(0, 5), (0, 14), (1, 0), (1, 2),
      (2, 1), (2, 13), (9, 13), (9, 14),
      (11, 1), (11, 5), (14, 0), (14, 2)]
    forwardChoices := [{ center := 0, support := {5, 14} },
        { center := 1, support := {0, 2} },
        { center := 2, support := {1, 13} },
        { center := 9, support := {13, 14} },
        { center := 11, support := {1, 5} },
        { center := 14, support := {0, 2} }]
    reverseChoices := [{ center := 2, support := {14, 16} },
        { center := 5, support := {11, 15} },
        { center := 7, support := {2, 3} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {14, 16} },
        { center := 16, support := {2, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1,
                          .row 1 0 2,
                          .flip 1 2,
                          .row 2 1 13], (2, 13)⟩
      path1 := ⟨(5, 11), [.flip 5 11,
                          .row 11 5 1,
                          .flip 11 1], (1, 11)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(2, 14), [.flip 2 14,
                          .row 14 2 0,
                          .flip 14 0,
                          .row 0 14 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 11, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 7), [.flip 3 7,
                          .row 7 3 2,
                          .flip 7 2], (2, 7)⟩
      path1 := ⟨(2, 14), [.row 2 14 16,
                          .flip 2 16,
                          .row 16 2 11,
                          .flip 16 11], (11, 16)⟩
      path2 := ⟨(5, 11), [.row 5 11 15], (5, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14,
                          .flip 15 14,
                          .row 14 15 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 6),
      (3, 2), (3, 10), (8, 7), (8, 16),
      (10, 6), (10, 7), (16, 1), (16, 10)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 6} },
        { center := 3, support := {2, 10} },
        { center := 8, support := {7, 16} },
        { center := 10, support := {6, 7} },
        { center := 16, support := {1, 10} }]
    reverseChoices := [{ center := 0, support := {6, 15} },
        { center := 6, support := {9, 10} },
        { center := 8, support := {0, 9} },
        { center := 13, support := {6, 14} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 6, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 10, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 10], (3, 10)⟩
      path1 := ⟨(6, 10), [.flip 6 10,
                          .row 10 6 7,
                          .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.flip 7 8,
                          .row 8 7 16], (8, 16)⟩
      path3 := ⟨(10, 16), [.flip 10 16,
                          .row 16 10 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 10), [.row 6 10 9], (6, 9)⟩
      path1 := ⟨(13, 14), [.row 13 14 6,
                          .flip 13 6], (6, 13)⟩
      path2 := ⟨(0, 6), [.row 0 6 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩
      path3 := ⟨(8, 9), [.row 8 9 0,
                          .flip 8 0], (0, 8)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 6),
      (3, 2), (3, 10), (10, 6), (10, 15),
      (13, 15), (13, 16), (16, 1), (16, 10)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 6} },
        { center := 3, support := {2, 10} },
        { center := 10, support := {6, 15} },
        { center := 13, support := {15, 16} },
        { center := 16, support := {1, 10} }]
    reverseChoices := [{ center := 0, support := {6, 15} },
        { center := 3, support := {0, 1} },
        { center := 6, support := {1, 10} },
        { center := 13, support := {6, 14} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 6, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 10], (3, 10)⟩
      path1 := ⟨(6, 10), [.flip 6 10,
                          .row 10 6 15], (10, 15)⟩
      path2 := ⟨(13, 15), [.row 13 15 16], (13, 16)⟩
      path3 := ⟨(10, 16), [.flip 10 16,
                          .row 16 10 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 3, 6⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 10), [.row 6 10 1,
                          .flip 6 1], (1, 6)⟩
      path1 := ⟨(13, 14), [.row 13 14 6,
                          .flip 13 6], (6, 13)⟩
      path2 := ⟨(1, 3), [.flip 1 3,
                          .row 3 1 0,
                          .flip 3 0], (0, 3)⟩
      path3 := ⟨(0, 6), [.row 0 6 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 10,
                          .flip 14 10], (10, 14)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 13),
      (3, 2), (3, 15), (9, 13), (9, 14),
      (13, 15), (13, 16), (16, 1), (16, 14)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 13} },
        { center := 3, support := {2, 15} },
        { center := 9, support := {13, 14} },
        { center := 13, support := {15, 16} },
        { center := 16, support := {1, 14} }]
    reverseChoices := [{ center := 0, support := {2, 15} },
        { center := 3, support := {0, 1} },
        { center := 7, support := {2, 3} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 15], (3, 15)⟩
      path1 := ⟨(13, 15), [.row 13 15 16], (13, 16)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16,
                          .row 16 14 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 3), [.flip 1 3,
                          .row 3 1 0,
                          .flip 3 0], (0, 3)⟩
      path1 := ⟨(13, 14), [.row 13 14 1,
                          .flip 13 1], (1, 13)⟩
      path2 := ⟨(0, 2), [.row 0 2 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 3,
                          .flip 14 3], (3, 14)⟩
      path3 := ⟨(3, 7), [.flip 3 7,
                          .row 7 3 2,
                          .flip 7 2], (2, 7)⟩ } },
  { hits := [(1, 2), (1, 16), (2, 1), (2, 13),
      (3, 2), (3, 15), (13, 15), (13, 16),
      (15, 0), (15, 13), (16, 0), (16, 1)]
    forwardChoices := [{ center := 1, support := {2, 16} },
        { center := 2, support := {1, 13} },
        { center := 3, support := {2, 15} },
        { center := 13, support := {15, 16} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 1, support := {3, 16} },
        { center := 3, support := {0, 1} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 15], (3, 15)⟩
      path1 := ⟨(13, 15), [.row 13 15 16], (13, 16)⟩
      path2 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 0,
                          .flip 15 0], (0, 15)⟩
      path3 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 1,
                          .flip 16 1,
                          .row 1 16 2,
                          .flip 1 2,
                          .row 2 1 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 3, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(1, 3), [.row 1 3 16], (1, 16)⟩
      path1 := ⟨(13, 14), [.row 13 14 1,
                          .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 3), [.flip 1 3,
                          .row 3 1 0,
                          .flip 3 0], (0, 3)⟩
      path3 := ⟨(0, 16), [.row 0 16 15,
                          .flip 0 15,
                          .row 15 0 14,
                          .flip 15 14,
                          .row 14 15 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(4, 6), (4, 11), (5, 3), (5, 7),
      (6, 1), (6, 7), (7, 3), (7, 5),
      (7, 6), (7, 11), (11, 1), (11, 5)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 5, support := {3, 7} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {3, 5, 6, 11} },
        { center := 11, support := {1, 5} }]
    reverseChoices := [{ center := 5, support := {11, 15} },
        { center := 9, support := {5, 10, 11, 13} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {9, 13} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨1, 4, 6, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path1 := ⟨(1, 11), [.flip 1 11,
                          .row 11 1 5,
                          .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(7, 11), [.row 7 11 6,
                          .flip 7 6,
                          .row 6 7 1,
                          .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 10,
                          .flip 9 10,
                          .row 10 9 15], (10, 15)⟩
      path2 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 5,
                          .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 15), [.row 5 15 11], (5, 11)⟩ } },
  { hits := [(8, 12), (8, 16), (9, 12), (9, 13),
      (12, 9), (12, 10), (13, 9), (13, 16),
      (15, 0), (15, 13), (16, 0), (16, 10)]
    forwardChoices := [{ center := 8, support := {12, 16} },
        { center := 9, support := {12, 13} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 16} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {0, 10} }]
    reverseChoices := [{ center := 0, support := {6, 16} },
        { center := 1, support := {3, 16} },
        { center := 3, support := {0, 7} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨8, 10, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 16], (13, 16)⟩
      path1 := ⟨(8, 16), [.row 8 16 12], (8, 12)⟩
      path2 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 0,
                          .flip 15 0], (0, 15)⟩
      path3 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 10,
                          .flip 16 10], (10, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 6, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 3, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 0,
                          .flip 3 0], (0, 3)⟩
      path1 := ⟨(0, 8), [.flip 0 8,
                          .row 8 0 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(1, 3), [.row 1 3 16], (1, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 6], (0, 6)⟩ } },
  { hits := [(1, 2), (1, 3), (2, 1), (2, 13),
      (3, 2), (3, 15), (6, 1), (6, 12),
      (9, 12), (9, 13), (12, 3), (12, 9),
      (13, 9), (13, 15)]
    forwardChoices := [{ center := 1, support := {2, 3} },
        { center := 2, support := {1, 13} },
        { center := 3, support := {2, 15} },
        { center := 6, support := {1, 12} },
        { center := 9, support := {12, 13} },
        { center := 12, support := {3, 9} },
        { center := 13, support := {9, 15} }]
    reverseChoices := [{ center := 3, support := {1, 7} },
        { center := 4, support := {7, 13} },
        { center := 7, support := {3, 4} },
        { center := 10, support := {4, 15} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {13, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 6, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3,
                          .row 3 2 15], (3, 15)⟩
      path1 := ⟨(13, 15), [.row 13 15 9,
                          .flip 13 9,
                          .row 9 13 12,
                          .flip 9 12,
                          .row 12 9 3,
                          .flip 12 3], (3, 12)⟩
      path2 := ⟨(1, 3), [.row 1 3 2,
                          .flip 1 2,
                          .row 2 1 13], (2, 13)⟩
      path3 := ⟨(6, 12), [.row 6 12 1,
                          .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(1, 3), [.flip 1 3,
                          .row 3 1 7,
                          .flip 3 7,
                          .row 7 3 4,
                          .flip 7 4,
                          .row 4 7 13], (4, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 1,
                          .flip 13 1], (1, 13)⟩
      path2 := ⟨(4, 10), [.flip 4 10,
                          .row 10 4 15], (10, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15,
                          .row 15 13 14,
                          .flip 15 14,
                          .row 14 15 3,
                          .flip 14 3], (3, 14)⟩ } },
  { hits := [(3, 4), (3, 10), (8, 7), (8, 12),
      (9, 12), (9, 13), (10, 7), (10, 15),
      (12, 9), (12, 10), (13, 9), (13, 15),
      (15, 4), (15, 13)]
    forwardChoices := [{ center := 3, support := {4, 10} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {12, 13} },
        { center := 10, support := {7, 15} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {4, 13} }]
    reverseChoices := [{ center := 1, support := {3, 12} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {6, 7} },
        { center := 6, support := {1, 9} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 9} },
        { center := 13, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨7, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(7, 8), [.flip 7 8,
                          .row 8 7 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 4,
                          .flip 15 4], (4, 15)⟩
      path2 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path3 := ⟨(10, 15), [.row 10 15 7,
                          .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 12], (1, 12)⟩
      path1 := ⟨(8, 9), [.row 8 9 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(1, 6), [.flip 1 6,
                          .row 6 1 9], (6, 9)⟩
      path3 := ⟨(12, 13), [.flip 12 13,
                          .row 13 12 6,
                          .flip 13 6], (6, 13)⟩ } },
  { hits := [(3, 10), (3, 15), (8, 7), (8, 12),
      (9, 12), (9, 13), (10, 4), (10, 7),
      (12, 9), (12, 10), (13, 9), (13, 15),
      (15, 4), (15, 13)]
    forwardChoices := [{ center := 3, support := {10, 15} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {12, 13} },
        { center := 10, support := {4, 7} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {4, 13} }]
    reverseChoices := [{ center := 1, support := {3, 12} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {6, 7} },
        { center := 6, support := {9, 12} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 9} },
        { center := 13, support := {1, 6} }]
    forwardData := {
      firstQuad := ⟨7, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 8), [.flip 7 8,
                          .row 8 7 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 4,
                          .flip 15 4], (4, 15)⟩
      path2 := ⟨(4, 10), [.flip 4 10,
                          .row 10 4 7,
                          .flip 10 7], (7, 10)⟩
      path3 := ⟨(3, 15), [.row 3 15 10], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 12], (1, 12)⟩
      path1 := ⟨(8, 9), [.row 8 9 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(6, 12), [.row 6 12 9], (6, 9)⟩
      path3 := ⟨(1, 13), [.flip 1 13,
                          .row 13 1 6,
                          .flip 13 6], (6, 13)⟩ } },
  { hits := [(5, 3), (5, 8), (7, 3), (7, 11),
      (8, 5), (8, 12), (9, 12), (9, 13),
      (11, 5), (11, 8), (12, 9), (12, 13),
      (13, 9), (13, 11)]
    forwardChoices := [{ center := 5, support := {3, 8} },
        { center := 7, support := {3, 11} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {5, 8} },
        { center := 12, support := {9, 13} },
        { center := 13, support := {9, 11} }]
    reverseChoices := [{ center := 3, support := {5, 7} },
        { center := 4, support := {3, 7} },
        { center := 5, support := {8, 11} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 11} },
        { center := 9, support := {5, 13} },
        { center := 11, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨8, 11, 12, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(8, 11), [.flip 8 11,
                          .row 11 8 5,
                          .flip 11 5], (5, 11)⟩
      path1 := ⟨(12, 13), [.row 12 13 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 11,
                          .flip 13 11], (11, 13)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 8,
                          .flip 5 8,
                          .row 8 5 12], (8, 12)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 8,
                          .flip 11 8,
                          .row 8 11 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(3, 4), [.flip 3 4,
                          .row 4 3 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 5], (3, 5)⟩
      path3 := ⟨(5, 8), [.row 5 8 11], (5, 11)⟩ } },
  { hits := [(6, 7), (6, 9), (7, 6), (7, 11),
      (9, 8), (9, 13), (10, 6), (10, 7),
      (11, 8), (11, 15), (13, 9), (13, 15),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 7, support := {6, 11} },
        { center := 9, support := {8, 13} },
        { center := 10, support := {6, 7} },
        { center := 11, support := {8, 15} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 7} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {9, 10} },
        { center := 7, support := {3, 8} },
        { center := 9, support := {5, 10} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9,
                          .row 9 8 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 8,
                          .flip 11 8], (8, 11)⟩
      path1 := ⟨(6, 10), [.flip 6 10,
                          .row 10 6 7,
                          .flip 10 7], (7, 10)⟩
      path2 := ⟨(8, 10), [], (8, 10)⟩
      path3 := ⟨(7, 11), [.row 7 11 6,
                          .flip 7 6,
                          .row 6 7 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(7, 9), [], (7, 9)⟩
      path1 := ⟨(6, 10), [.row 6 10 9], (6, 9)⟩
      path2 := ⟨(7, 8), [.row 7 8 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 8], (5, 8)⟩
      path3 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 10,
                          .flip 9 10,
                          .row 10 9 7,
                          .flip 10 7], (7, 10)⟩ } },
  { hits := [(8, 7), (8, 12), (9, 12), (9, 13),
      (10, 7), (10, 15), (12, 9), (12, 10),
      (13, 9), (13, 15), (15, 0), (15, 13),
      (16, 0), (16, 10)]
    forwardChoices := [{ center := 8, support := {7, 12} },
        { center := 9, support := {12, 13} },
        { center := 10, support := {7, 15} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {0, 10} }]
    reverseChoices := [{ center := 0, support := {6, 16} },
        { center := 1, support := {3, 16} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {6, 7} },
        { center := 6, support := {1, 9} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 9} }]
    forwardData := {
      firstQuad := ⟨7, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8,
                          .row 8 7 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 0,
                          .flip 15 0], (0, 15)⟩
      path2 := ⟨(10, 15), [.row 10 15 7,
                          .flip 10 7], (7, 10)⟩
      path3 := ⟨(0, 16), [.flip 0 16,
                          .row 16 0 10,
                          .flip 16 10], (10, 16)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 16], (1, 16)⟩
      path1 := ⟨(8, 9), [.row 8 9 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(1, 6), [.flip 1 6,
                          .row 6 1 9], (6, 9)⟩
      path3 := ⟨(0, 16), [.row 0 16 6], (0, 6)⟩ } },
  { hits := [(5, 3), (5, 8), (6, 9), (6, 12),
      (7, 3), (7, 11), (8, 5), (8, 12),
      (9, 8), (9, 13), (11, 5), (11, 15),
      (13, 9), (13, 15), (15, 11), (15, 13)]
    forwardChoices := [{ center := 5, support := {3, 8} },
        { center := 6, support := {9, 12} },
        { center := 7, support := {3, 11} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {8, 13} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 7} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 8} },
        { center := 8, support := {4, 11} },
        { center := 9, support := {5, 13} },
        { center := 10, support := {4, 7} },
        { center := 11, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 9), [.flip 8 9,
                          .row 9 8 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path1 := ⟨(6, 12), [.row 6 12 9], (6, 9)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 8,
                          .flip 5 8,
                          .row 8 5 12], (8, 12)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 8,
                          .flip 11 8,
                          .row 8 11 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path3 := ⟨(4, 10), [.flip 4 10,
                          .row 10 4 7,
                          .flip 10 7], (7, 10)⟩ } },
  { hits := [(5, 3), (5, 10), (7, 3), (7, 11),
      (8, 5), (8, 12), (9, 12), (9, 13),
      (11, 5), (11, 15), (12, 9), (12, 10),
      (13, 9), (13, 15), (15, 11), (15, 13)]
    forwardChoices := [{ center := 5, support := {3, 10} },
        { center := 7, support := {3, 11} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {5, 15} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {6, 7} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {4, 11} },
        { center := 9, support := {5, 13} },
        { center := 11, support := {6, 13} }]
    forwardData := {
      firstQuad := ⟨5, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 8), [.flip 5 8,
                          .row 8 5 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12,
                          .row 12 10 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 10], (5, 10)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 6,
                          .flip 11 6], (6, 11)⟩
      path2 := ⟨(4, 6), [.row 4 6 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path3 := ⟨(8, 11), [.row 8 11 4,
                          .flip 8 4], (4, 8)⟩ } },
  { hits := [(5, 3), (5, 7), (6, 7), (6, 12),
      (7, 3), (7, 5), (7, 11), (9, 12),
      (9, 13), (11, 5), (11, 15), (12, 3),
      (12, 9), (13, 9), (13, 15), (15, 11),
      (15, 13)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 6, support := {7, 12} },
        { center := 7, support := {3, 5, 11} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {5, 15} },
        { center := 12, support := {3, 9} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {7, 13} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 4} },
        { center := 9, support := {5, 11, 13} },
        { center := 10, support := {4, 9} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨3, 6, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 7), [.row 6 7 12], (6, 12)⟩
      path1 := ⟨(3, 12), [.flip 3 12,
                          .row 12 3 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 3,
                          .flip 7 3], (3, 7)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 13], (9, 13)⟩
      path2 := ⟨(9, 10), [.flip 9 10,
                          .row 10 9 4,
                          .flip 10 4], (4, 10)⟩
      path3 := ⟨(4, 13), [.row 4 13 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩ } },
  { hits := [(5, 3), (5, 8), (7, 3), (7, 11),
      (8, 5), (8, 12), (9, 8), (9, 12),
      (9, 13), (11, 5), (11, 15), (12, 9),
      (12, 13), (13, 9), (13, 15), (15, 11),
      (15, 13)]
    forwardChoices := [{ center := 5, support := {3, 8} },
        { center := 7, support := {3, 11} },
        { center := 8, support := {5, 12} },
        { center := 9, support := {8, 12, 13} },
        { center := 11, support := {5, 15} },
        { center := 12, support := {9, 13} },
        { center := 13, support := {9, 15} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 3, support := {1, 7} },
        { center := 4, support := {3, 7} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 4, 8} },
        { center := 8, support := {4, 11} },
        { center := 9, support := {5, 13} },
        { center := 11, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨8, 9, 12, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 9), [.flip 8 9,
                          .row 9 8 13], (9, 13)⟩
      path1 := ⟨(12, 13), [.row 12 13 9,
                          .flip 12 9,
                          .row 9 12 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 8,
                          .flip 5 8,
                          .row 8 5 12], (8, 12)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 8,
                          .flip 11 8,
                          .row 8 11 4,
                          .flip 8 4], (4, 8)⟩
      path2 := ⟨(3, 4), [.flip 3 4,
                          .row 4 3 7,
                          .flip 4 7,
                          .row 7 4 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path3 := ⟨(7, 8), [.row 7 8 3,
                          .flip 7 3], (3, 7)⟩ } },
  { hits := [(5, 3), (5, 7), (6, 7), (6, 9),
      (7, 3), (7, 5), (7, 6), (7, 11),
      (9, 8), (9, 13), (11, 5), (11, 15),
      (13, 9), (13, 15), (14, 6), (14, 8),
      (15, 11), (15, 13)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {3, 5, 6, 11} },
        { center := 9, support := {8, 13} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {9, 15} },
        { center := 14, support := {6, 8} },
        { center := 15, support := {11, 13} }]
    reverseChoices := [{ center := 1, support := {3, 5} },
        { center := 2, support := {8, 10} },
        { center := 3, support := {1, 7} },
        { center := 5, support := {1, 11} },
        { center := 7, support := {3, 8} },
        { center := 9, support := {5, 10, 11, 13} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(8, 9), [.flip 8 9,
                          .row 9 8 13,
                          .flip 9 13,
                          .row 13 9 15,
                          .flip 13 15,
                          .row 15 13 11,
                          .flip 15 11,
                          .row 11 15 5,
                          .flip 11 5], (5, 11)⟩
      path1 := ⟨(6, 14), [.flip 6 14,
                          .row 14 6 8,
                          .flip 14 8], (8, 14)⟩
      path2 := ⟨(3, 5), [.flip 3 5,
                          .row 5 3 7,
                          .flip 5 7,
                          .row 7 5 6,
                          .flip 7 6,
                          .row 6 7 9], (6, 9)⟩
      path3 := ⟨(7, 11), [.row 7 11 3,
                          .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 9), [.flip 5 9,
                          .row 9 5 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 9,
                          .flip 11 9,
                          .row 9 11 10,
                          .flip 9 10,
                          .row 10 9 7,
                          .flip 10 7], (7, 10)⟩
      path2 := ⟨(7, 8), [.row 7 8 3,
                          .flip 7 3,
                          .row 3 7 1,
                          .flip 3 1,
                          .row 1 3 5,
                          .flip 1 5,
                          .row 5 1 11], (5, 11)⟩
      path3 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩ } }
]

theorem currentRootTwoKalmansonOccurrences_length :
    currentRootTwoKalmansonOccurrences.length = 54 := by
  decide

theorem currentRootTwoKalmansonOccurrences_all_check :
    currentRootTwoKalmansonOccurrences.all CancellationOccurrence.check = true := by
  decide

/-- Four guarded clauses for each of the fifty-four checked occurrences. -/
def currentRootTwoKalmansonClauses : Std.Sat.CNF Atom :=
  currentRootTwoKalmansonOccurrences.flatMap fun occurrence =>
    occurrenceClauses occurrence.hits

theorem currentRootTwoKalmansonClauses_length :
    currentRootTwoKalmansonClauses.length = 216 := by
  simp [currentRootTwoKalmansonClauses, occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    namedOrders, directions, currentRootTwoKalmansonOccurrences_length]

/-- Every source realization satisfies all 216 new occurrence clauses. -/
theorem sourceAssign_currentRootTwoKalmansonClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ currentRootTwoKalmansonClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [currentRootTwoKalmansonClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occurrence, hoccurrence, hclause⟩
  have hcheck := List.all_eq_true.mp currentRootTwoKalmansonOccurrences_all_check
    occurrence hoccurrence
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occurrence hcheck order direction

/-- The current cumulative exact-seventeen root with the new occurrence bank. -/
def extendedCurrentRootTwoKalmansonCnf : Std.Sat.CNF Atom :=
  extendedTwoTripleRowCnf ++ currentRootTwoKalmansonClauses

theorem extendedCurrentRootTwoKalmansonCnf_length :
    extendedCurrentRootTwoKalmansonCnf.length = 7037176 := by
  simp only [extendedCurrentRootTwoKalmansonCnf, List.length_append,
    extendedTwoTripleRowCnf_length, currentRootTwoKalmansonClauses_length]

/-- Every source realization satisfies the complete cumulative formula. -/
theorem sourceAssign_extendedCurrentRootTwoKalmansonCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCurrentRootTwoKalmansonCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCurrentRootTwoKalmansonCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwoTripleRowCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_currentRootTwoKalmansonClauses source clause hsuffix

/-- Conditional terminal adapter for an independently certified UNSAT result. -/
theorem false_of_sourceRealization_of_extendedCurrentRootTwoKalmansonCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedCurrentRootTwoKalmansonCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCurrentRootTwoKalmansonCnf source⟩

#print axioms sourceAssign_currentRootTwoKalmansonClauses
#print axioms sourceAssign_extendedCurrentRootTwoKalmansonCnf
#print axioms false_of_sourceRealization_of_extendedCurrentRootTwoKalmansonCnf_unsat

end ATailBlockerVExactSeventeenCurrentRootTwoKalmansonRefinements
end Problem97
