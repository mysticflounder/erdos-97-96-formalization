/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Complete new minimal cancellation family from exact-seventeen child 29

The child-29 model has 115 checked two-Kalmanson cancellation certificates.
Projecting them to the positive selected-row incidences actually consumed and
removing supersets leaves 50 supports, none subsumed by the child-28 bank.
Each record below contains separately checked forward and reflected
certificates. Their 200 order/orientation nogoods form the child-30 suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyNinthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 3), (0, 5), (10, 3), (10, 6), (13, 5), (13, 6)]
    forwardChoices := [{ center := 0, support := {3, 5} },
        { center := 10, support := {3, 6} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 6, support := {10, 13} },
        { center := 16, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 10), [], (5, 10)⟩
      path2 := ⟨(6, 10), [.flip 6 10, .row 10 6 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨6, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(6, 10), [.row 6 10 13], (6, 13)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(0, 3), (0, 5), (12, 3), (12, 4), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {3, 5} },
        { center := 12, support := {3, 4} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 4, support := {12, 13} },
        { center := 16, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(3, 13), [], (3, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 11, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 12, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(4, 12), [.row 4 12 13], (4, 13)⟩
      path3 := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 5), (0, 10), (11, 5), (11, 9), (14, 9), (14, 10)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 11, support := {5, 9} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 5, support := {7, 11} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 5), [.row 0 5 10], (0, 10)⟩
      path1 := ⟨(10, 14), [.flip 10 14, .row 14 10 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 14), [], (5, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 7, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 7], (2, 7)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path3 := ⟨(11, 16), [.flip 11 16, .row 16 11 6, .flip 16 6], (6, 16)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (15, 8), (15, 11)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 10, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 8, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 5), [.row 1 5 8], (1, 8)⟩
      path1 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(5, 15), [], (5, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (14, 9), (14, 10), (15, 8), (15, 9)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 14, support := {9, 10} },
        { center := 15, support := {8, 9} }]
    reverseChoices := [{ center := 1, support := {7, 8} },
        { center := 2, support := {6, 7} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 8), [.row 1 8 10], (1, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(10, 14), [.flip 10 14, .row 14 10 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(9, 15), [.flip 9 15, .row 15 9 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 7], (2, 7)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(1, 7), [.row 1 7 8], (1, 8)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 8), (1, 12), (15, 8), (15, 11), (16, 11), (16, 12)]
    forwardChoices := [{ center := 1, support := {8, 12} },
        { center := 15, support := {8, 11} },
        { center := 16, support := {11, 12} }]
    reverseChoices := [{ center := 0, support := {4, 5} },
        { center := 1, support := {5, 8} },
        { center := 15, support := {4, 8} }]
    forwardData := {
      firstQuad := ⟨1, 11, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 11), [], (1, 11)⟩
      path1 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(1, 8), [.row 1 8 12], (1, 12)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 5, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 8, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path1 := ⟨(5, 15), [], (5, 15)⟩
      path2 := ⟨(1, 5), [.row 1 5 8], (1, 8)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(1, 10), (1, 12), (2, 9), (2, 12), (14, 9), (14, 10)]
    forwardChoices := [{ center := 1, support := {10, 12} },
        { center := 2, support := {9, 12} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 14, support := {4, 7} },
        { center := 15, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 9, 10, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(1, 12), [.row 1 12 10], (1, 10)⟩
      path2 := ⟨(2, 9), [.row 2 9 12], (2, 12)⟩
      path3 := ⟨(10, 14), [.flip 10 14, .row 14 10 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 7], (2, 7)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(7, 14), [.flip 7 14, .row 14 7 4, .flip 14 4], (4, 14)⟩
      path3 := ⟨(4, 15), [.flip 4 15, .row 15 4 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 10), (4, 11), (8, 11), (8, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {10, 11} },
        { center := 8, support := {11, 13} }]
    reverseChoices := [{ center := 8, support := {3, 5} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path1 := ⟨(1, 11), [], (1, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 12), [], (3, 12)⟩ } },
  { hits := [(1, 10), (1, 13), (6, 13), (6, 14), (9, 10), (9, 14)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 6, support := {13, 14} },
        { center := 9, support := {10, 14} }]
    reverseChoices := [{ center := 7, support := {2, 6} },
        { center := 10, support := {2, 3} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨6, 9, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(6, 14), [.row 6 14 13], (6, 13)⟩
      path2 := ⟨(6, 10), [], (6, 10)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (7, 9), (7, 13), (14, 9), (14, 10)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 7, support := {9, 13} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 9, support := {3, 7} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 7, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 10, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 10), [], (7, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(10, 14), [.flip 10 14, .row 14 10 9, .flip 14 9], (9, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 7], (2, 7)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 12), (1, 13), (2, 9), (2, 12), (7, 9), (7, 13)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 2, support := {9, 12} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 14, support := {4, 7} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨1, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(2, 12), [.row 2 12 9], (2, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 7, .flip 14 7], (7, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 14), [], (3, 14)⟩ } },
  { hits := [(1, 12), (1, 13), (7, 13), (7, 15), (10, 12), (10, 15)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 7, support := {13, 15} },
        { center := 10, support := {12, 15} }]
    reverseChoices := [{ center := 6, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨7, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(10, 12), [.row 10 12 15], (10, 15)⟩
      path1 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩
      path2 := ⟨(7, 12), [], (7, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 6, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 6, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(1, 12), (1, 13), (8, 11), (8, 13), (16, 11), (16, 12)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 8, support := {11, 13} },
        { center := 16, support := {11, 12} }]
    reverseChoices := [{ center := 0, support := {4, 5} },
        { center := 8, support := {3, 5} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨1, 8, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path1 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩
      path2 := ⟨(1, 11), [], (1, 11)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 5, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path1 := ⟨(5, 15), [], (5, 15)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(2, 1), (2, 9), (6, 1), (6, 13), (7, 9), (7, 13)]
    forwardChoices := [{ center := 2, support := {1, 9} },
        { center := 6, support := {1, 13} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 10, support := {3, 15} },
        { center := 14, support := {7, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 9], (2, 9)⟩
      path1 := ⟨(6, 9), [], (6, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(6, 13), [.row 6 13 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 15], (10, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 7, .flip 14 7], (7, 14)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 14), [], (3, 14)⟩ } },
  { hits := [(2, 6), (2, 9), (4, 6), (4, 10), (14, 9), (14, 10)]
    forwardChoices := [{ center := 2, support := {6, 9} },
        { center := 4, support := {6, 10} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨4, 9, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(10, 14), [.flip 10 14, .row 14 10 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path3 := ⟨(2, 9), [.row 2 9 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 6), [.row 2 6 7], (2, 7)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(7, 14), [.flip 7 14, .row 14 7 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(2, 6), (2, 9), (4, 6), (4, 11), (15, 9), (15, 11)]
    forwardChoices := [{ center := 2, support := {6, 9} },
        { center := 4, support := {6, 11} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 12, support := {5, 10} },
        { center := 14, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨4, 9, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 6, 9⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(2, 9), [.row 2 9 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 10, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(7, 14), [.flip 7 14, .row 14 7 10, .flip 14 10], (10, 14)⟩ } },
  { hits := [(2, 6), (2, 9), (11, 5), (11, 9), (13, 5), (13, 6)]
    forwardChoices := [{ center := 2, support := {6, 9} },
        { center := 11, support := {5, 9} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 5, support := {7, 11} },
        { center := 14, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨2, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 9], (2, 9)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 10, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 10), [], (5, 10)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path3 := ⟨(10, 14), [.flip 10 14, .row 14 10 7, .flip 14 7], (7, 14)⟩ } },
  { hits := [(2, 9), (2, 12), (15, 9), (15, 11), (16, 11), (16, 12)]
    forwardChoices := [{ center := 2, support := {9, 12} },
        { center := 15, support := {9, 11} },
        { center := 16, support := {11, 12} }]
    reverseChoices := [{ center := 0, support := {4, 5} },
        { center := 1, support := {5, 7} },
        { center := 14, support := {4, 7} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(2, 11), [], (2, 11)⟩
      path1 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(2, 9), [.row 2 9 12], (2, 12)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 7, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path1 := ⟨(5, 14), [], (5, 14)⟩
      path2 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path3 := ⟨(7, 14), [.flip 7 14, .row 14 7 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(4, 6), (4, 10), (9, 3), (9, 10), (10, 3), (10, 6)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 9, support := {3, 10} },
        { center := 10, support := {3, 6} }]
    reverseChoices := [{ center := 6, support := {10, 13} },
        { center := 7, support := {6, 13} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨3, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 6, .flip 10 6], (6, 10)⟩
      path2 := ⟨(3, 6), [], (3, 6)⟩
      path3 := ⟨(9, 10), [.row 9 10 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 10, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 13], (7, 13)⟩
      path1 := ⟨(10, 13), [], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(6, 13), [.row 6 13 10], (6, 10)⟩ } },
  { hits := [(5, 0), (5, 16), (12, 0), (12, 4), (13, 4), (13, 16)]
    forwardChoices := [{ center := 5, support := {0, 16} },
        { center := 12, support := {0, 4} },
        { center := 13, support := {4, 16} }]
    reverseChoices := [{ center := 3, support := {0, 12} },
        { center := 4, support := {12, 16} },
        { center := 11, support := {0, 16} }]
    forwardData := {
      firstQuad := ⟨0, 5, 12, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 12, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 5), [.flip 0 5, .row 5 0 16], (5, 16)⟩
      path1 := ⟨(12, 16), [], (12, 16)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(13, 16), [.row 13 16 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 12], (3, 12)⟩
      path1 := ⟨(4, 12), [.row 4 12 16], (4, 16)⟩
      path2 := ⟨(0, 4), [], (0, 4)⟩
      path3 := ⟨(11, 16), [.row 11 16 0, .flip 11 0], (0, 11)⟩ } },
  { hits := [(7, 4), (7, 15), (10, 3), (10, 15), (12, 3), (12, 4)]
    forwardChoices := [{ center := 7, support := {4, 15} },
        { center := 10, support := {3, 15} },
        { center := 12, support := {3, 4} }]
    reverseChoices := [{ center := 4, support := {12, 13} },
        { center := 6, support := {1, 13} },
        { center := 9, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(4, 13), [.row 4 13 12], (4, 12)⟩ } },
  { hits := [(8, 5), (8, 11), (11, 5), (11, 9), (15, 9), (15, 11)]
    forwardChoices := [{ center := 8, support := {5, 11} },
        { center := 11, support := {5, 9} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 5, support := {7, 11} },
        { center := 8, support := {5, 11} }]
    forwardData := {
      firstQuad := ⟨5, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 11], (8, 11)⟩
      path1 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(5, 9), [], (5, 9)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path3 := ⟨(8, 11), [.row 8 11 5, .flip 8 5], (5, 8)⟩ } },
  { hits := [(9, 3), (9, 8), (12, 3), (12, 4), (15, 4), (15, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 12, support := {3, 4} },
        { center := 15, support := {4, 8} }]
    reverseChoices := [{ center := 1, support := {8, 12} },
        { center := 4, support := {12, 13} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 4, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 9), [], (4, 9)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(4, 15), [.flip 4 15, .row 15 4 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(4, 13), [.row 4 13 12], (4, 12)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(1, 12), [.row 1 12 8], (1, 8)⟩ } },
  { hits := [(9, 3), (9, 14), (10, 3), (10, 15), (11, 14), (11, 15)]
    forwardChoices := [{ center := 9, support := {3, 14} },
        { center := 10, support := {3, 15} },
        { center := 11, support := {14, 15} }]
    reverseChoices := [{ center := 5, support := {1, 2} },
        { center := 6, support := {1, 13} },
        { center := 7, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨3, 9, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 14], (9, 14)⟩
      path1 := ⟨(10, 14), [], (10, 14)⟩
      path2 := ⟨(11, 14), [.row 11 14 15], (11, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 7⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 13), [.row 7 13 2, .flip 7 2], (2, 7)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(1, 7), [], (1, 7)⟩ } },
  { hits := [(9, 10), (9, 14), (11, 9), (11, 14), (14, 9), (14, 10)]
    forwardChoices := [{ center := 9, support := {10, 14} },
        { center := 11, support := {9, 14} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 5, support := {2, 7} },
        { center := 7, support := {2, 6} }]
    forwardData := {
      firstQuad := ⟨0, 9, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 10, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 10, .flip 14 10], (10, 14)⟩
      path1 := ⟨(0, 11), [], (0, 11)⟩
      path2 := ⟨(0, 10), [], (0, 10)⟩
      path3 := ⟨(11, 14), [.row 11 14 9, .flip 11 9], (9, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 5, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(2, 5), [.flip 2 5, .row 5 2 7], (5, 7)⟩
      path1 := ⟨(0, 6), [], (0, 6)⟩
      path2 := ⟨(0, 5), [], (0, 5)⟩
      path3 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 6], (2, 6)⟩ } },
  { hits := [(10, 3), (10, 6), (12, 3), (12, 4), (13, 4), (13, 6)]
    forwardChoices := [{ center := 10, support := {3, 6} },
        { center := 12, support := {3, 4} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 4, support := {12, 13} },
        { center := 6, support := {10, 13} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 12), [.flip 3 12, .row 12 3 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(6, 10), [.flip 6 10, .row 10 6 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(6, 10), [.row 6 10 13], (6, 13)⟩
      path1 := ⟨(4, 13), [.row 4 13 12], (4, 12)⟩
      path2 := ⟨(4, 10), [], (4, 10)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(10, 6), (10, 15), (11, 5), (11, 15), (13, 5), (13, 6)]
    forwardChoices := [{ center := 10, support := {6, 15} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 5, support := {1, 11} },
        { center := 6, support := {1, 10} }]
    forwardData := {
      firstQuad := ⟨5, 6, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 10), [.flip 6 10, .row 10 6 15], (10, 15)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(5, 10), [], (5, 10)⟩
      path3 := ⟨(11, 15), [.row 11 15 5, .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 11], (5, 11)⟩
      path1 := ⟨(6, 11), [], (6, 11)⟩
      path2 := ⟨(6, 10), [.row 6 10 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(11, 5), (11, 9), (13, 4), (13, 5), (15, 4), (15, 9)]
    forwardChoices := [{ center := 11, support := {5, 9} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {4, 9} }]
    reverseChoices := [{ center := 1, support := {7, 12} },
        { center := 3, support := {11, 12} },
        { center := 5, support := {7, 11} }]
    forwardData := {
      firstQuad := ⟨4, 9, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(4, 15), [.flip 4 15, .row 15 4 9, .flip 15 9], (9, 15)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(1, 11), [], (1, 11)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(1, 12), [.row 1 12 7], (1, 7)⟩ } },
  { hits := [(11, 5), (11, 9), (13, 5), (13, 16), (14, 9), (14, 16)]
    forwardChoices := [{ center := 11, support := {5, 9} },
        { center := 13, support := {5, 16} },
        { center := 14, support := {9, 16} }]
    reverseChoices := [{ center := 2, support := {0, 7} },
        { center := 3, support := {0, 11} },
        { center := 5, support := {7, 11} }]
    forwardData := {
      firstQuad := ⟨5, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 13), [.flip 5 13, .row 13 5 16], (13, 16)⟩
      path1 := ⟨(14, 16), [.row 14 16 9, .flip 14 9], (9, 14)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 14), [], (5, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 7], (2, 7)⟩
      path1 := ⟨(3, 7), [], (3, 7)⟩
      path2 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 0, .flip 3 0], (0, 3)⟩ } },
  { hits := [(12, 0), (12, 4), (15, 4), (15, 11), (16, 0), (16, 11)]
    forwardChoices := [{ center := 12, support := {0, 4} },
        { center := 15, support := {4, 11} },
        { center := 16, support := {0, 11} }]
    reverseChoices := [{ center := 0, support := {5, 16} },
        { center := 1, support := {5, 12} },
        { center := 4, support := {12, 16} }]
    forwardData := {
      firstQuad := ⟨0, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(11, 15), [.flip 11 15, .row 15 11 4, .flip 15 4], (4, 15)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 0, .flip 12 0], (0, 12)⟩
      path3 := ⟨(0, 15), [], (0, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 5, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 5), [.row 1 5 12], (1, 12)⟩
      path1 := ⟨(0, 12), [], (0, 12)⟩
      path2 := ⟨(4, 12), [.row 4 12 16], (4, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 5], (0, 5)⟩ } },
  { hits := [(14, 1), (14, 9), (15, 9), (15, 11), (16, 1), (16, 11)]
    forwardChoices := [{ center := 14, support := {1, 9} },
        { center := 15, support := {9, 11} },
        { center := 16, support := {1, 11} }]
    reverseChoices := [{ center := 0, support := {5, 15} },
        { center := 1, support := {5, 7} },
        { center := 2, support := {7, 15} }]
    forwardData := {
      firstQuad := ⟨1, 11, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 9, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(9, 14), [.flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(1, 15), [], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 5, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(0, 7), [], (0, 7)⟩
      path2 := ⟨(2, 7), [.row 2 7 15], (2, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 5], (0, 5)⟩ } },
  { hits := [(0, 3), (0, 10), (3, 2), (3, 15), (4, 2), (4, 10), (10, 3), (10, 15)]
    forwardChoices := [{ center := 0, support := {3, 10} },
        { center := 3, support := {2, 15} },
        { center := 4, support := {2, 10} },
        { center := 10, support := {3, 15} }]
    reverseChoices := [{ center := 6, support := {1, 13} },
        { center := 12, support := {6, 14} },
        { center := 13, support := {1, 14} },
        { center := 16, support := {6, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 3), [.row 0 3 10], (0, 10)⟩
      path1 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(4, 10), [.row 4 10 2, .flip 4 2], (2, 4)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 12), [.flip 6 12, .row 12 6 14], (12, 14)⟩
      path1 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path3 := ⟨(13, 16), [.flip 13 16, .row 16 13 6, .flip 16 6], (6, 16)⟩ } },
  { hits := [(1, 8), (1, 12), (5, 8), (5, 16), (14, 1), (14, 16), (16, 1), (16, 12)]
    forwardChoices := [{ center := 1, support := {8, 12} },
        { center := 5, support := {8, 16} },
        { center := 14, support := {1, 16} },
        { center := 16, support := {1, 12} }]
    reverseChoices := [{ center := 0, support := {4, 15} },
        { center := 2, support := {0, 15} },
        { center := 11, support := {0, 8} },
        { center := 15, support := {4, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 8), [.row 5 8 16], (5, 16)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(1, 12), [.row 1 12 8], (1, 8)⟩
      path3 := ⟨(14, 16), [.row 14 16 1, .flip 14 1], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 2), [.flip 0 2, .row 2 0 15], (2, 15)⟩
      path1 := ⟨(4, 15), [.flip 4 15, .row 15 4 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 15), [.row 0 15 4], (0, 4)⟩ } },
  { hits := [(4, 6), (4, 11), (7, 4), (7, 13), (8, 11), (8, 13), (13, 4), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 7, support := {4, 13} },
        { center := 8, support := {11, 13} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 8, support := {3, 5} },
        { center := 9, support := {3, 12} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨4, 8, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(7, 13), [.row 7 13 4, .flip 7 4], (4, 7)⟩ }
    reverseData := {
      firstQuad := ⟨3, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 12], (9, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(4, 10), (4, 11), (9, 10), (9, 14), (11, 9), (11, 14), (15, 9), (15, 11)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 14} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 5, support := {2, 7} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨9, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(11, 14), [.row 11 14 9, .flip 11 9], (9, 11)⟩
      path1 := ⟨(9, 15), [.flip 9 15, .row 15 9 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 7], (5, 7)⟩
      path3 := ⟨(1, 7), [.row 1 7 5], (1, 5)⟩ } },
  { hits := [(7, 9), (7, 15), (9, 8), (9, 14), (11, 14), (11, 15), (15, 8), (15, 9)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 15, support := {8, 9} }]
    reverseChoices := [{ center := 1, support := {7, 8} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨9, 11, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(11, 14), [.row 11 14 15], (11, 15)⟩
      path1 := ⟨(9, 15), [.flip 9 15, .row 15 9 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path3 := ⟨(7, 15), [.row 7 15 9], (7, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 5, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 7, .flip 9 7], (7, 9)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(1, 7), [.row 1 7 8], (1, 8)⟩ } },
  { hits := [(7, 13), (7, 15), (8, 11), (8, 13), (11, 9), (11, 15), (15, 9), (15, 11)]
    forwardChoices := [{ center := 7, support := {13, 15} },
        { center := 8, support := {11, 13} },
        { center := 11, support := {9, 15} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 5, support := {1, 7} },
        { center := 8, support := {3, 5} },
        { center := 9, support := {1, 3} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 15, .flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩
      path1 := ⟨(8, 13), [.row 8 13 11], (8, 11)⟩
      path2 := ⟨(9, 13), [], (9, 13)⟩
      path3 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 7), [], (3, 7)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(5, 7), [.row 5 7 1, .flip 5 1, .row 1 5 7], (1, 7)⟩
      path3 := ⟨(3, 8), [.flip 3 8, .row 8 3 5, .flip 8 5], (5, 8)⟩ } },
  { hits := [(8, 5), (8, 11), (9, 8), (9, 14), (11, 5), (11, 14), (15, 8), (15, 11)]
    forwardChoices := [{ center := 8, support := {5, 11} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {5, 14} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 5, support := {2, 11} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {5, 11} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(11, 14), [.row 11 14 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 11], (8, 11)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(1, 5), [.row 1 5 8], (1, 8)⟩
      path1 := ⟨(8, 11), [.row 8 11 5, .flip 8 5], (5, 8)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 11], (5, 11)⟩
      path3 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(0, 5), (0, 10), (1, 8), (1, 10), (5, 0), (5, 8), (8, 5), (8, 7), (12, 0), (12, 7)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {8, 10} },
        { center := 5, support := {0, 8} },
        { center := 8, support := {5, 7} },
        { center := 12, support := {0, 7} }]
    reverseChoices := [{ center := 4, support := {9, 16} },
        { center := 8, support := {9, 11} },
        { center := 11, support := {8, 16} },
        { center := 15, support := {6, 8} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5, .row 5 8 0, .flip 5 0, .row 0 5 10], (0, 10)⟩
      path3 := ⟨(1, 12), [], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 11, .flip 8 11, .row 11 8 16, .flip 11 16, .row 16 11 6, .flip 16 6], (6, 16)⟩
      path1 := ⟨(4, 15), [], (4, 15)⟩
      path2 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(4, 16), [.row 4 16 9], (4, 9)⟩ } },
  { hits := [(1, 12), (1, 13), (6, 7), (6, 13), (10, 6), (10, 12), (12, 4), (12, 7), (13, 4), (13, 6)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 6, support := {7, 13} },
        { center := 10, support := {6, 12} },
        { center := 12, support := {4, 7} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 4, support := {9, 12} },
        { center := 6, support := {4, 10} },
        { center := 10, support := {3, 9} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨6, 7, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 7), [.row 6 7 13, .flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(10, 12), [.row 10 12 6, .flip 10 6], (6, 10)⟩
      path2 := ⟨(4, 12), [.flip 4 12, .row 12 4 7, .flip 12 7], (7, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 12), [.row 4 12 9], (4, 9)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 10], (6, 10)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 3, .flip 10 3, .row 3 10 12], (3, 12)⟩ } },
  { hits := [(2, 6), (2, 9), (9, 10), (9, 14), (10, 6), (10, 15), (11, 14), (11, 15), (14, 9), (14, 10)]
    forwardChoices := [{ center := 2, support := {6, 9} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {6, 15} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 10} }]
    reverseChoices := [{ center := 2, support := {6, 7} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {1, 10} },
        { center := 7, support := {2, 6} },
        { center := 14, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨2, 6, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 11, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(2, 6), [.row 2 6 9], (2, 9)⟩
      path1 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(11, 14), [.row 11 14 15], (11, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 6, .flip 10 6], (6, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 6⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 6], (2, 6)⟩
      path1 := ⟨(10, 14), [.flip 10 14, .row 14 10 7, .flip 14 7], (7, 14)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1], (1, 5)⟩
      path3 := ⟨(1, 6), [.flip 1 6, .row 6 1 10], (6, 10)⟩ } },
  { hits := [(4, 6), (4, 11), (6, 13), (6, 14), (8, 11), (8, 13), (11, 5), (11, 14), (13, 5), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 11} },
        { center := 6, support := {13, 14} },
        { center := 8, support := {11, 13} },
        { center := 11, support := {5, 14} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 5, support := {2, 11} },
        { center := 8, support := {3, 5} },
        { center := 10, support := {2, 3} },
        { center := 12, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨5, 8, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path1 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6, .row 6 13 14], (6, 14)⟩
      path2 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path3 := ⟨(11, 14), [.row 11 14 5, .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 11), [.row 3 11 10, .flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 11], (5, 11)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ } },
  { hits := [(4, 10), (4, 11), (9, 10), (9, 14), (11, 9), (11, 14), (14, 1), (14, 9), (16, 1), (16, 11)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 9, support := {10, 14} },
        { center := 11, support := {9, 14} },
        { center := 14, support := {1, 9} },
        { center := 16, support := {1, 11} }]
    reverseChoices := [{ center := 0, support := {5, 15} },
        { center := 2, support := {7, 15} },
        { center := 5, support := {2, 7} },
        { center := 7, support := {2, 6} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 9, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(11, 14), [.row 11 14 9, .flip 11 9], (9, 11)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 7, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 5, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 15], (2, 15)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 7], (5, 7)⟩
      path3 := ⟨(0, 15), [.row 0 15 5], (0, 5)⟩ } },
  { hits := [(5, 8), (5, 14), (7, 9), (7, 13), (8, 5), (8, 13), (9, 8), (9, 14), (11, 5), (11, 9)]
    forwardChoices := [{ center := 5, support := {8, 14} },
        { center := 7, support := {9, 13} },
        { center := 8, support := {5, 13} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {5, 9} }]
    reverseChoices := [{ center := 5, support := {7, 11} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {3, 11} },
        { center := 9, support := {3, 7} },
        { center := 11, support := {2, 8} }]
    forwardData := {
      firstQuad := ⟨7, 8, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(7, 13), [.row 7 13 9], (7, 9)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 14), [.row 5 14 8, .flip 5 8, .row 8 5 13], (8, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 8, .flip 11 8, .row 8 11 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 7, .flip 9 7], (7, 9)⟩ } },
  { hits := [(7, 13), (7, 15), (8, 11), (8, 13), (9, 8), (9, 14), (11, 14), (11, 15), (15, 8), (15, 11)]
    forwardChoices := [{ center := 7, support := {13, 15} },
        { center := 8, support := {11, 13} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {3, 5} },
        { center := 9, support := {1, 3} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14], (9, 14)⟩
      path1 := ⟨(11, 14), [.row 11 14 15, .flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 13), [.row 8 13 11], (8, 11)⟩
      path3 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 5, .flip 8 5], (5, 8)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1, .row 1 5 8], (1, 8)⟩
      path3 := ⟨(7, 8), [.row 7 8 2, .flip 7 2], (2, 7)⟩ } },
  { hits := [(7, 13), (7, 15), (8, 11), (8, 13), (11, 5), (11, 15), (13, 4), (13, 5), (15, 4), (15, 11)]
    forwardChoices := [{ center := 7, support := {13, 15} },
        { center := 8, support := {11, 13} },
        { center := 11, support := {5, 15} },
        { center := 13, support := {4, 5} },
        { center := 15, support := {4, 11} }]
    reverseChoices := [{ center := 1, support := {5, 12} },
        { center := 3, support := {11, 12} },
        { center := 5, support := {1, 11} },
        { center := 8, support := {3, 5} },
        { center := 9, support := {1, 3} }]
    forwardData := {
      firstQuad := ⟨4, 7, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(4, 15), [.flip 4 15, .row 15 4 11, .flip 15 11, .row 11 15 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 12), [.row 1 12 5, .flip 1 5, .row 5 1 11], (5, 11)⟩ } },
  { hits := [(0, 5), (0, 10), (1, 8), (1, 10), (5, 0), (5, 8), (6, 1), (6, 13), (8, 5), (8, 13), (16, 0), (16, 1)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 1, support := {8, 10} },
        { center := 5, support := {0, 8} },
        { center := 6, support := {1, 13} },
        { center := 8, support := {5, 13} },
        { center := 16, support := {0, 1} }]
    reverseChoices := [{ center := 0, support := {15, 16} },
        { center := 8, support := {3, 11} },
        { center := 10, support := {3, 15} },
        { center := 11, support := {8, 16} },
        { center := 15, support := {6, 8} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 10), [.row 1 10 8], (1, 8)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 1, .flip 16 1], (1, 16)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path3 := ⟨(8, 13), [.row 8 13 5, .flip 8 5, .row 5 8 0, .flip 5 0, .row 0 5 10], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 11, .flip 8 11, .row 11 8 16, .flip 11 16, .row 16 11 6, .flip 16 6], (6, 16)⟩
      path1 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(6, 15), [.flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path3 := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ } },
  { hits := [(0, 5), (0, 10), (4, 10), (4, 11), (5, 0), (5, 8), (8, 5), (8, 11), (12, 0), (12, 4), (15, 4), (15, 8)]
    forwardChoices := [{ center := 0, support := {5, 10} },
        { center := 4, support := {10, 11} },
        { center := 5, support := {0, 8} },
        { center := 8, support := {5, 11} },
        { center := 12, support := {0, 4} },
        { center := 15, support := {4, 8} }]
    reverseChoices := [{ center := 1, support := {8, 12} },
        { center := 4, support := {12, 16} },
        { center := 8, support := {5, 11} },
        { center := 11, support := {8, 16} },
        { center := 12, support := {5, 6} },
        { center := 16, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨0, 4, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(8, 11), [.row 8 11 5, .flip 8 5, .row 5 8 0, .flip 5 0, .row 0 5 10], (0, 10)⟩
      path3 := ⟨(4, 15), [.flip 4 15, .row 15 4 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 11, .flip 8 11, .row 11 8 16, .flip 11 16, .row 16 11 6, .flip 16 6], (6, 16)⟩
      path1 := ⟨(1, 12), [.row 1 12 8], (1, 8)⟩
      path2 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩
      path3 := ⟨(4, 16), [.row 4 16 12], (4, 12)⟩ } },
  { hits := [(4, 10), (4, 11), (7, 9), (7, 15), (9, 8), (9, 14), (11, 14), (11, 15), (14, 9), (14, 10), (15, 8), (15, 11)]
    forwardChoices := [{ center := 4, support := {10, 11} },
        { center := 7, support := {9, 15} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 10} },
        { center := 15, support := {8, 11} }]
    reverseChoices := [{ center := 1, support := {5, 8} },
        { center := 2, support := {6, 7} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {1, 7} },
        { center := 12, support := {5, 6} }]
    forwardData := {
      firstQuad := ⟨4, 10, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩
      path1 := ⟨(11, 14), [.row 11 14 15, .flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 10, .flip 14 10], (10, 14)⟩
      path3 := ⟨(7, 15), [.row 7 15 9], (7, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 6, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 6], (2, 6)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 7, .flip 9 7], (7, 9)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1, .row 1 5 8], (1, 8)⟩
      path3 := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩ } },
  { hits := [(7, 9), (7, 15), (9, 8), (9, 14), (11, 14), (11, 15), (14, 1), (14, 9), (15, 8), (15, 11), (16, 1), (16, 11)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {1, 9} },
        { center := 15, support := {8, 11} },
        { center := 16, support := {1, 11} }]
    reverseChoices := [{ center := 0, support := {5, 15} },
        { center := 1, support := {5, 8} },
        { center := 2, support := {7, 15} },
        { center := 5, support := {1, 2} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨1, 11, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(11, 14), [.row 11 14 15, .flip 11 15, .row 15 11 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 11, .flip 16 11], (11, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 1, .flip 14 1], (1, 14)⟩
      path3 := ⟨(7, 15), [.row 7 15 9], (7, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 5, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 15], (2, 15)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 7, .flip 9 7], (7, 9)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 1, .flip 5 1, .row 1 5 8], (1, 8)⟩
      path3 := ⟨(0, 15), [.row 0 15 5], (0, 5)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 50 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def twentyNinthModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem twentyNinthModelRefinementClauses_length :
    twentyNinthModelRefinementClauses.length = 200 := by
  native_decide

theorem sourceAssign_twentyNinthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyNinthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyNinthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def extendedTwentyNinthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentyEighthModelRefinementsCnf ++
    twentyNinthModelRefinementClauses

theorem extendedTwentyNinthModelRefinementsCnf_length :
    extendedTwentyNinthModelRefinementsCnf.length = 5846744 := by
  native_decide

theorem sourceAssign_extendedTwentyNinthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyNinthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyNinthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentyEighthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyNinthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyNinthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyNinthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyNinthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyNinthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyNinthModelRefinements
end Problem97
