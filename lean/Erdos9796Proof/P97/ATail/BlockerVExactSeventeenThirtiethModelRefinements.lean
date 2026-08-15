/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyNinthModelRefinements

/-!
# Complete new minimal cancellation family from exact-seventeen child 30

The child-30 model has 80 checked two-Kalmanson cancellation certificates.
Projecting them to the positive selected-row incidences actually consumed and
removing supersets leaves 40 supports, none subsumed by the child-29 bank.
Each record below contains separately checked forward and reflected
certificates. Their 160 order/orientation nogoods form the child-31 suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtiethModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailBlockerVExactSeventeenTwentyNinthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 5), (0, 9), (5, 9), (5, 16), (13, 5), (13, 16)]
    forwardChoices := [{ center := 0, support := {5, 9} },
        { center := 5, support := {9, 16} },
        { center := 13, support := {5, 16} }]
    reverseChoices := [{ center := 3, support := {0, 11} },
        { center := 11, support := {0, 7} },
        { center := 16, support := {7, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 5), [.row 0 5 9], (0, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(5, 9), [.row 5 9 16], (5, 16)⟩
      path3 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(7, 11), [.flip 7 11, .row 11 7 0, .flip 11 0], (0, 11)⟩
      path2 := ⟨(0, 7), [], (0, 7)⟩
      path3 := ⟨(11, 16), [.flip 11 16, .row 16 11 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 5), (0, 10), (11, 7), (11, 10), (12, 5), (12, 7)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 11, support := {7, 10} },
        { center := 12, support := {5, 7} }]
    reverseChoices := [{ center := 4, support := {9, 11} },
        { center := 5, support := {6, 9} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 5), [.row 0 5 10], (0, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 7, .flip 11 7], (7, 11)⟩
      path3 := ⟨(7, 12), [.flip 7 12, .row 12 7 5, .flip 12 5], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 9], (5, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(4, 9), [.row 4 9 11], (4, 11)⟩
      path3 := ⟨(11, 16), [.flip 11 16, .row 16 11 6, .flip 16 6], (6, 16)⟩ } },
  { hits := [(0, 9), (0, 10), (1, 10), (1, 13), (7, 9), (7, 13)]
    forwardChoices := [{ center := 0, support := {9, 10} },
        { center := 1, support := {10, 13} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {6, 7} }]
    forwardData := {
      firstQuad := ⟨1, 7, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 10), [], (7, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(0, 10), [.row 0 10 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 9), [], (6, 9)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 9), (0, 10), (4, 10), (4, 11), (5, 9), (5, 11)]
    forwardChoices := [{ center := 0, support := {9, 10} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {9, 11} }]
    reverseChoices := [{ center := 11, support := {5, 7} },
        { center := 12, support := {5, 6} },
        { center := 16, support := {6, 7} }]
    forwardData := {
      firstQuad := ⟨4, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩
      path2 := ⟨(5, 9), [.row 5 9 11], (5, 11)⟩
      path3 := ⟨(0, 10), [.row 0 10 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(7, 11), [.flip 7 11, .row 11 7 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 9), (0, 10), (6, 7), (6, 9), (11, 7), (11, 10)]
    forwardChoices := [{ center := 0, support := {9, 10} },
        { center := 6, support := {7, 9} },
        { center := 11, support := {7, 10} }]
    reverseChoices := [{ center := 5, support := {6, 9} },
        { center := 10, support := {7, 9} },
        { center := 16, support := {6, 7} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 9, 10, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path1 := ⟨(9, 11), [], (9, 11)⟩
      path2 := ⟨(0, 9), [.row 0 9 10], (0, 10)⟩
      path3 := ⟨(10, 11), [.flip 10 11, .row 11 10 7, .flip 11 7], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 9, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 6), [.row 5 6 9], (5, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(7, 16), [.flip 7 16, .row 16 7 6, .flip 16 6], (6, 16)⟩ } },
  { hits := [(1, 0), (1, 10), (8, 0), (8, 14), (9, 10), (9, 14)]
    forwardChoices := [{ center := 1, support := {0, 10} },
        { center := 8, support := {0, 14} },
        { center := 9, support := {10, 14} }]
    reverseChoices := [{ center := 7, support := {2, 6} },
        { center := 8, support := {2, 16} },
        { center := 15, support := {6, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 9, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 10], (1, 10)⟩
      path1 := ⟨(8, 10), [], (8, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(8, 14), [.row 8 14 0, .flip 8 0], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨2, 8, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(2, 8), [.flip 2 8, .row 8 2 16], (8, 16)⟩
      path1 := ⟨(15, 16), [.row 15 16 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 15), [], (2, 15)⟩ } },
  { hits := [(1, 0), (1, 13), (2, 12), (2, 13), (11, 0), (11, 12)]
    forwardChoices := [{ center := 1, support := {0, 13} },
        { center := 2, support := {12, 13} },
        { center := 11, support := {0, 12} }]
    reverseChoices := [{ center := 5, support := {4, 16} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 11, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 13], (1, 13)⟩
      path1 := ⟨(11, 13), [], (11, 13)⟩
      path2 := ⟨(11, 12), [.row 11 12 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 16], (5, 16)⟩
      path1 := ⟨(14, 16), [], (14, 16)⟩
      path2 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 3, .flip 15 3], (3, 15)⟩ } },
  { hits := [(1, 0), (1, 13), (7, 13), (7, 15), (8, 0), (8, 15)]
    forwardChoices := [{ center := 1, support := {0, 13} },
        { center := 7, support := {13, 15} },
        { center := 8, support := {0, 15} }]
    reverseChoices := [{ center := 8, support := {1, 16} },
        { center := 9, support := {1, 3} },
        { center := 15, support := {3, 16} }]
    forwardData := {
      firstQuad := ⟨0, 1, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 13], (1, 13)⟩
      path1 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path2 := ⟨(0, 7), [], (0, 7)⟩
      path3 := ⟨(8, 15), [.row 8 15 0, .flip 8 0], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨1, 8, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 8), [.flip 1 8, .row 8 1 16], (8, 16)⟩
      path1 := ⟨(15, 16), [.row 15 16 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 15), [], (1, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (5, 8), (5, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {8, 11} }]
    reverseChoices := [{ center := 11, support := {5, 8} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨4, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩
      path2 := ⟨(5, 8), [.row 5 8 11], (5, 11)⟩
      path3 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (11, 7), (11, 10), (12, 7), (12, 8)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 11, support := {7, 10} },
        { center := 12, support := {7, 8} }]
    reverseChoices := [{ center := 4, support := {8, 9} },
        { center := 5, support := {6, 9} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(10, 11), [.flip 10 11, .row 11 10 7, .flip 11 7], (7, 11)⟩
      path3 := ⟨(7, 12), [.flip 7 12, .row 12 7 8, .flip 12 8], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 6), [.row 5 6 9], (5, 9)⟩
      path1 := ⟨(4, 9), [.row 4 9 8], (4, 8)⟩
      path2 := ⟨(4, 6), [], (4, 6)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 1), (2, 13), (12, 1), (12, 8)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 2, support := {1, 13} },
        { center := 12, support := {1, 8} }]
    reverseChoices := [{ center := 4, support := {8, 15} },
        { center := 14, support := {3, 15} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 12), [.flip 8 12, .row 12 8 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(4, 14), [], (4, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(4, 8), [.row 4 8 15], (4, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 8), (5, 9), (7, 9), (7, 13)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {8, 9} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 11, support := {7, 8} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(5, 8), [.row 5 8 9], (5, 9)⟩
      path1 := ⟨(1, 9), [], (1, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 11), [.flip 8 11, .row 11 8 7, .flip 11 7], (7, 11)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 11), [], (3, 11)⟩ } },
  { hits := [(2, 12), (2, 13), (7, 13), (7, 15), (10, 12), (10, 15)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 7, support := {13, 15} },
        { center := 10, support := {12, 15} }]
    reverseChoices := [{ center := 6, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨7, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(10, 12), [.row 10 12 15], (10, 15)⟩
      path1 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩
      path2 := ⟨(7, 12), [], (7, 12)⟩
      path3 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 6, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(4, 10), (4, 11), (9, 10), (9, 14), (15, 11), (15, 14)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 9, support := {10, 14} },
        { center := 15, support := {11, 14} }]
    reverseChoices := [{ center := 1, support := {2, 5} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨9, 11, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(9, 11), [], (9, 11)⟩
      path1 := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 12), [], (2, 12)⟩ } },
  { hits := [(5, 8), (5, 9), (6, 7), (6, 9), (12, 7), (12, 8)]
    forwardChoices := [{ center := 5, support := {8, 9} },
        { center := 6, support := {7, 9} },
        { center := 12, support := {7, 8} }]
    reverseChoices := [{ center := 4, support := {8, 9} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {7, 8} }]
    forwardData := {
      firstQuad := ⟨5, 6, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path1 := ⟨(5, 9), [.row 5 9 8], (5, 8)⟩
      path2 := ⟨(5, 7), [], (5, 7)⟩
      path3 := ⟨(8, 12), [.flip 8 12, .row 12 8 7, .flip 12 7], (7, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 8), [.row 4 8 9], (4, 9)⟩
      path1 := ⟨(9, 11), [], (9, 11)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(7, 11), [.flip 7 11, .row 11 7 8, .flip 11 8], (8, 11)⟩ } },
  { hits := [(5, 9), (5, 11), (6, 9), (6, 14), (15, 11), (15, 14)]
    forwardChoices := [{ center := 5, support := {9, 11} },
        { center := 6, support := {9, 14} },
        { center := 15, support := {11, 14} }]
    reverseChoices := [{ center := 1, support := {2, 5} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨6, 11, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(5, 11), [.row 5 11 9], (5, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩
      path1 := ⟨(5, 10), [], (5, 10)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩ } },
  { hits := [(5, 9), (5, 11), (7, 9), (7, 13), (16, 11), (16, 13)]
    forwardChoices := [{ center := 5, support := {9, 11} },
        { center := 7, support := {9, 13} },
        { center := 16, support := {11, 13} }]
    reverseChoices := [{ center := 0, support := {3, 5} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {5, 7} }]
    forwardData := {
      firstQuad := ⟨7, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(5, 11), [.row 5 11 9], (5, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 11), [], (3, 11)⟩ } },
  { hits := [(5, 11), (5, 16), (13, 4), (13, 16), (16, 4), (16, 11)]
    forwardChoices := [{ center := 5, support := {11, 16} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 11} }]
    reverseChoices := [{ center := 0, support := {5, 12} },
        { center := 3, support := {0, 12} },
        { center := 11, support := {0, 5} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 11, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(4, 11), [], (4, 11)⟩
      path3 := ⟨(13, 16), [.row 13 16 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 12], (3, 12)⟩
      path1 := ⟨(5, 12), [], (5, 12)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 12), [.row 0 12 5], (0, 5)⟩ } },
  { hits := [(7, 4), (7, 15), (10, 3), (10, 15), (14, 3), (14, 4)]
    forwardChoices := [{ center := 7, support := {4, 15} },
        { center := 10, support := {3, 15} },
        { center := 14, support := {3, 4} }]
    reverseChoices := [{ center := 2, support := {12, 13} },
        { center := 6, support := {1, 13} },
        { center := 9, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩ } },
  { hits := [(8, 0), (8, 15), (10, 12), (10, 15), (11, 0), (11, 12)]
    forwardChoices := [{ center := 8, support := {0, 15} },
        { center := 10, support := {12, 15} },
        { center := 11, support := {0, 12} }]
    reverseChoices := [{ center := 5, support := {4, 16} },
        { center := 6, support := {1, 4} },
        { center := 8, support := {1, 16} }]
    forwardData := {
      firstQuad := ⟨0, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 8), [.flip 0 8, .row 8 0 15], (8, 15)⟩
      path1 := ⟨(10, 15), [.row 10 15 12], (10, 12)⟩
      path2 := ⟨(0, 10), [], (0, 10)⟩
      path3 := ⟨(11, 12), [.row 11 12 0, .flip 11 0], (0, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 16], (5, 16)⟩
      path1 := ⟨(6, 16), [], (6, 16)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 4, .flip 6 4], (4, 6)⟩
      path3 := ⟨(8, 16), [.row 8 16 1, .flip 8 1], (1, 8)⟩ } },
  { hits := [(8, 6), (8, 15), (10, 5), (10, 15), (13, 5), (13, 6)]
    forwardChoices := [{ center := 8, support := {6, 15} },
        { center := 10, support := {5, 15} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 6, support := {1, 11} },
        { center := 8, support := {1, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(6, 8), [.flip 6 8, .row 8 6 15], (8, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 11], (6, 11)⟩
      path1 := ⟨(8, 11), [], (8, 11)⟩
      path2 := ⟨(8, 10), [.row 8 10 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 3), (10, 5), (12, 5), (12, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {3, 5} },
        { center := 12, support := {5, 8} }]
    reverseChoices := [{ center := 4, support := {8, 11} },
        { center := 6, support := {11, 13} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 5, .flip 10 5], (5, 10)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 8, .flip 12 8], (8, 12)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(6, 13), [.row 6 13 11], (6, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(4, 11), [.row 4 11 8], (4, 8)⟩ } },
  { hits := [(10, 3), (10, 5), (13, 4), (13, 5), (14, 3), (14, 4)]
    forwardChoices := [{ center := 10, support := {3, 5} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {3, 4} }]
    reverseChoices := [{ center := 2, support := {12, 13} },
        { center := 3, support := {11, 12} },
        { center := 6, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 12), [], (6, 12)⟩
      path1 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩
      path2 := ⟨(6, 11), [.row 6 11 13], (6, 13)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(12, 1), (12, 5), (13, 4), (13, 5), (16, 1), (16, 4)]
    forwardChoices := [{ center := 12, support := {1, 5} },
        { center := 13, support := {4, 5} },
        { center := 16, support := {1, 4} }]
    reverseChoices := [{ center := 0, support := {12, 15} },
        { center := 3, support := {11, 12} },
        { center := 4, support := {11, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 12), [], (4, 12)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 12), [], (4, 12)⟩
      path1 := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩
      path2 := ⟨(4, 11), [.row 4 11 15], (4, 15)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(13, 4), (13, 16), (14, 3), (14, 4), (15, 3), (15, 16)]
    forwardChoices := [{ center := 13, support := {4, 16} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 16} }]
    reverseChoices := [{ center := 1, support := {0, 13} },
        { center := 2, support := {12, 13} },
        { center := 3, support := {0, 12} }]
    forwardData := {
      firstQuad := ⟨4, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 13), [.flip 4 13, .row 13 4 16], (13, 16)⟩
      path1 := ⟨(14, 16), [], (14, 16)⟩
      path2 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path3 := ⟨(15, 16), [.row 15 16 3, .flip 15 3], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 13], (1, 13)⟩
      path1 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(3, 12), [.row 3 12 0, .flip 3 0], (0, 3)⟩ } },
  { hits := [(0, 5), (0, 10), (1, 0), (1, 10), (10, 5), (10, 12), (11, 0), (11, 12)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {0, 10} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {0, 12} }]
    reverseChoices := [{ center := 5, support := {4, 16} },
        { center := 6, support := {4, 11} },
        { center := 15, support := {6, 16} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 10], (1, 10)⟩
      path1 := ⟨(5, 10), [.flip 5 10, .row 10 5 12], (10, 12)⟩
      path2 := ⟨(0, 10), [.row 0 10 5], (0, 5)⟩
      path3 := ⟨(11, 12), [.row 11 12 0, .flip 11 0], (0, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 16], (5, 16)⟩
      path1 := ⟨(6, 16), [.flip 6 16, .row 16 6 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(6, 11), [.row 6 11 4, .flip 6 4], (4, 6)⟩
      path3 := ⟨(15, 16), [.row 15 16 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 0), (1, 8), (2, 1), (2, 12), (11, 0), (11, 12), (12, 1), (12, 8)]
    forwardChoices := [{ center := 1, support := {0, 8} },
        { center := 2, support := {1, 12} },
        { center := 11, support := {0, 12} },
        { center := 12, support := {1, 8} }]
    reverseChoices := [{ center := 4, support := {8, 15} },
        { center := 5, support := {4, 16} },
        { center := 14, support := {4, 15} },
        { center := 15, support := {8, 16} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(8, 12), [.flip 8 12, .row 12 8 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(11, 12), [.row 11 12 0, .flip 11 0], (0, 11)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 5), [.flip 4 5, .row 5 4 16], (5, 16)⟩
      path1 := ⟨(15, 16), [.row 15 16 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(4, 8), [.row 4 8 15], (4, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(1, 0), (1, 8), (6, 1), (6, 14), (8, 0), (8, 14), (12, 1), (12, 8)]
    forwardChoices := [{ center := 1, support := {0, 8} },
        { center := 6, support := {1, 14} },
        { center := 8, support := {0, 14} },
        { center := 12, support := {1, 8} }]
    reverseChoices := [{ center := 4, support := {8, 15} },
        { center := 8, support := {2, 16} },
        { center := 10, support := {2, 15} },
        { center := 15, support := {8, 16} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 14], (6, 14)⟩
      path1 := ⟨(8, 14), [.row 8 14 0, .flip 8 0], (0, 8)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 8], (1, 8)⟩
      path3 := ⟨(8, 12), [.flip 8 12, .row 12 8 1, .flip 12 1], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 8), [.row 4 8 15], (4, 15)⟩
      path1 := ⟨(15, 16), [.row 15 16 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(2, 8), [.flip 2 8, .row 8 2 16], (8, 16)⟩
      path3 := ⟨(10, 15), [.row 10 15 2, .flip 10 2], (2, 10)⟩ } },
  { hits := [(1, 8), (1, 10), (2, 1), (2, 12), (12, 1), (12, 8), (14, 10), (14, 12)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 2, support := {1, 12} },
        { center := 12, support := {1, 8} },
        { center := 14, support := {10, 12} }]
    reverseChoices := [{ center := 2, support := {4, 6} },
        { center := 4, support := {8, 15} },
        { center := 14, support := {4, 15} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 10, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(8, 12), [.flip 8 12, .row 12 8 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩
      path3 := ⟨(12, 14), [.flip 12 14, .row 14 12 10, .flip 14 10], (10, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 6, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 4), [.row 2 4 6], (2, 6)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(4, 8), [.row 4 8 15], (4, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 8), (5, 16), (13, 4), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {8, 16} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 12} },
        { center := 11, support := {0, 8} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨4, 5, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 13), [], (5, 13)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(5, 8), [.row 5 8 16], (5, 16)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 11), [], (3, 11)⟩
      path1 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 12], (3, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩ } },
  { hits := [(3, 2), (3, 16), (4, 2), (4, 11), (13, 4), (13, 16), (16, 4), (16, 11)]
    forwardChoices := [{ center := 3, support := {2, 16} },
        { center := 4, support := {2, 11} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 11} }]
    reverseChoices := [{ center := 0, support := {5, 12} },
        { center := 3, support := {0, 12} },
        { center := 12, support := {5, 14} },
        { center := 13, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 11, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(4, 11), [.row 4 11 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(13, 16), [.row 13 16 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 12], (3, 12)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 14], (12, 14)⟩
      path2 := ⟨(0, 12), [.row 0 12 5], (0, 5)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(5, 11), (5, 16), (12, 1), (12, 5), (13, 5), (13, 16), (16, 1), (16, 11)]
    forwardChoices := [{ center := 5, support := {11, 16} },
        { center := 12, support := {1, 5} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {1, 11} }]
    reverseChoices := [{ center := 0, support := {5, 15} },
        { center := 3, support := {0, 11} },
        { center := 4, support := {11, 15} },
        { center := 11, support := {0, 5} }]
    forwardData := {
      firstQuad := ⟨5, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path2 := ⟨(4, 11), [.row 4 11 15], (4, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 5], (0, 5)⟩ } },
  { hits := [(10, 5), (10, 12), (11, 7), (11, 10), (12, 5), (12, 7), (14, 10), (14, 12)]
    forwardChoices := [{ center := 10, support := {5, 12} },
        { center := 11, support := {7, 10} },
        { center := 12, support := {5, 7} },
        { center := 14, support := {10, 12} }]
    reverseChoices := [{ center := 2, support := {4, 6} },
        { center := 4, support := {9, 11} },
        { center := 5, support := {6, 9} },
        { center := 6, support := {4, 11} }]
    forwardData := {
      firstQuad := ⟨7, 10, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(10, 11), [.flip 10 11, .row 11 10 7, .flip 11 7], (7, 11)⟩
      path1 := ⟨(7, 12), [.flip 7 12, .row 12 7 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 12], (10, 12)⟩
      path3 := ⟨(12, 14), [.flip 12 14, .row 14 12 10, .flip 14 10], (10, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 6, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 6), [.row 5 6 9], (5, 9)⟩
      path1 := ⟨(4, 9), [.row 4 9 11], (4, 11)⟩
      path2 := ⟨(2, 4), [.row 2 4 6], (2, 6)⟩
      path3 := ⟨(6, 11), [.row 6 11 4, .flip 6 4], (4, 6)⟩ } },
  { hits := [(1, 8), (1, 13), (5, 8), (5, 16), (12, 1), (12, 5), (13, 5), (13, 16), (16, 1), (16, 13)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 5, support := {8, 16} },
        { center := 12, support := {1, 5} },
        { center := 13, support := {5, 16} },
        { center := 16, support := {1, 13} }]
    reverseChoices := [{ center := 0, support := {3, 15} },
        { center := 3, support := {0, 11} },
        { center := 4, support := {11, 15} },
        { center := 11, support := {0, 8} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 8), [.row 5 8 16], (5, 16)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(5, 12), [.flip 5 12, .row 12 5 1, .flip 12 1], (1, 12)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 11), [.row 4 11 15], (4, 15)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 15), [.row 0 15 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(1, 10), (1, 13), (3, 2), (3, 16), (4, 2), (4, 10), (13, 4), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 3, support := {2, 16} },
        { center := 4, support := {2, 10} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 12} },
        { center := 12, support := {6, 14} },
        { center := 13, support := {0, 14} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(4, 10), [.row 4 10 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 12), [.flip 6 12, .row 12 6 14], (12, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 12], (3, 12)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 10), (4, 11), (5, 11), (5, 16), (13, 4), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {11, 16} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 12} },
        { center := 11, support := {0, 5} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 12], (3, 12)⟩ } },
  { hits := [(2, 6), (2, 13), (3, 2), (3, 16), (4, 2), (4, 6), (13, 4), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 2, support := {6, 13} },
        { center := 3, support := {2, 16} },
        { center := 4, support := {2, 6} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 12} },
        { center := 12, support := {10, 14} },
        { center := 13, support := {0, 14} },
        { center := 14, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(2, 13), [.row 2 13 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 14], (12, 14)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 12], (3, 12)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(2, 6), (2, 13), (4, 6), (4, 11), (5, 11), (5, 16), (13, 4), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 2, support := {6, 13} },
        { center := 4, support := {6, 11} },
        { center := 5, support := {11, 16} },
        { center := 13, support := {4, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 12} },
        { center := 11, support := {0, 5} },
        { center := 12, support := {5, 10} },
        { center := 14, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(2, 13), [.row 2 13 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 12], (3, 12)⟩ } },
  { hits := [(3, 2), (3, 16), (4, 2), (4, 6), (7, 4), (7, 13), (13, 6), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 3, support := {2, 16} },
        { center := 4, support := {2, 6} },
        { center := 7, support := {4, 13} },
        { center := 13, support := {6, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 10} },
        { center := 9, support := {3, 12} },
        { center := 12, support := {10, 14} },
        { center := 13, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨2, 3, 4, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 7, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 2, .flip 4 2], (2, 4)⟩
      path3 := ⟨(7, 13), [.row 7 13 4, .flip 7 4], (4, 7)⟩ }
    reverseData := {
      firstQuad := ⟨3, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 12], (9, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 14], (12, 14)⟩
      path2 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 10], (3, 10)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(4, 6), (4, 11), (5, 11), (5, 16), (7, 4), (7, 13), (13, 6), (13, 16), (16, 4), (16, 13)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 5, support := {11, 16} },
        { center := 7, support := {4, 13} },
        { center := 13, support := {6, 16} },
        { center := 16, support := {4, 13} }]
    reverseChoices := [{ center := 0, support := {3, 12} },
        { center := 3, support := {0, 10} },
        { center := 9, support := {3, 12} },
        { center := 11, support := {0, 5} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path1 := ⟨(4, 16), [.flip 4 16, .row 16 4 13, .flip 16 13, .row 13 16 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(7, 13), [.row 7 13 4, .flip 7 4], (4, 7)⟩ }
    reverseData := {
      firstQuad := ⟨3, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 12], (9, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 12), [.row 0 12 3, .flip 0 3, .row 3 0 10], (3, 10)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 40 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def thirtiethModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem thirtiethModelRefinementClauses_length :
    thirtiethModelRefinementClauses.length = 160 := by
  native_decide

theorem sourceAssign_thirtiethModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtiethModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirtiethModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def extendedThirtiethModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentyNinthModelRefinementsCnf ++
    thirtiethModelRefinementClauses

theorem extendedThirtiethModelRefinementsCnf_length :
    extendedThirtiethModelRefinementsCnf.length = 5846904 := by
  native_decide

theorem sourceAssign_extendedThirtiethModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtiethModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtiethModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentyNinthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtiethModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtiethModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtiethModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtiethModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtiethModelRefinementsCnf

end ATailBlockerVExactSeventeenThirtiethModelRefinements
end Problem97
