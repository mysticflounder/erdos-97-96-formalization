/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtiethModelRefinements

/-!
# Child-31 cancellation refinements, shard 3

This shard contains 21 of the 84 subset-minimal checked cancellation
occurrences extracted exhaustively from the authenticated child-31 model.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 9), (0, 16), (9, 8), (9, 14), (11, 0), (11, 8), (13, 6), (13, 16), (14, 6), (14, 9), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {9, 16} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {0, 8} },
        { center := 13, support := {6, 16} },
        { center := 14, support := {6, 9} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {7, 10} },
        { center := 3, support := {0, 10} },
        { center := 5, support := {8, 16} },
        { center := 7, support := {2, 8} },
        { center := 16, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨0, 8, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 6, .flip 14 6], (6, 14)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(6, 13), [.flip 6 13, .row 13 6 16], (13, 16)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 10], (2, 10)⟩
      path1 := ⟨(5, 16), [.row 5 16 8], (5, 8)⟩
      path2 := ⟨(0, 2), [.row 0 2 16, .flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path3 := ⟨(3, 10), [.row 3 10 0, .flip 3 0], (0, 3)⟩ } },
  { hits := [(1, 4), (1, 10), (6, 1), (6, 14), (9, 10), (9, 14), (10, 1), (10, 3), (13, 4), (13, 6), (14, 3), (14, 6)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 3} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {3, 6} }]
    reverseChoices := [{ center := 2, support := {10, 13} },
        { center := 3, support := {10, 12} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 15} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨3, 9, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 13], (6, 13)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 13), [.row 2 13 10, .flip 2 10, .row 10 2 15], (10, 15)⟩ } },
  { hits := [(1, 8), (1, 10), (4, 10), (4, 11), (6, 1), (6, 14), (8, 11), (8, 14), (10, 1), (10, 7), (11, 7), (11, 8)]
    forwardChoices := [{ center := 1, support := {8, 10} },
        { center := 4, support := {10, 11} },
        { center := 6, support := {1, 14} },
        { center := 8, support := {11, 14} },
        { center := 10, support := {1, 7} },
        { center := 11, support := {7, 8} }]
    reverseChoices := [{ center := 5, support := {8, 9} },
        { center := 6, support := {9, 15} },
        { center := 8, support := {2, 5} },
        { center := 10, support := {2, 15} },
        { center := 12, support := {5, 6} },
        { center := 15, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨4, 7, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 8, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(7, 10), [.flip 7 10, .row 10 7 1, .flip 10 1, .row 1 10 8], (1, 8)⟩
      path1 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 14], (6, 14)⟩
      path3 := ⟨(8, 14), [.row 8 14 11, .flip 8 11, .row 11 8 7, .flip 11 7], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 9), [.row 6 9 15, .flip 6 15, .row 15 6 8, .flip 15 8], (8, 15)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(2, 8), [.flip 2 8, .row 8 2 5, .flip 8 5, .row 5 8 9], (5, 9)⟩
      path3 := ⟨(10, 15), [.row 10 15 2, .flip 10 2], (2, 10)⟩ } },
  { hits := [(1, 10), (1, 13), (2, 6), (2, 13), (6, 1), (6, 14), (9, 10), (9, 14), (10, 1), (10, 3), (14, 3), (14, 6)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 2, support := {6, 13} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 3} },
        { center := 14, support := {3, 6} }]
    reverseChoices := [{ center := 2, support := {10, 13} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {3, 10} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨3, 9, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 7, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 13], (6, 13)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 13), [.row 2 13 10, .flip 2 10, .row 10 2 15], (10, 15)⟩ } },
  { hits := [(3, 15), (3, 16), (5, 8), (5, 15), (8, 7), (8, 16), (9, 3), (9, 8), (11, 5), (11, 7), (15, 3), (15, 5)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 8, support := {7, 16} },
        { center := 9, support := {3, 8} },
        { center := 11, support := {5, 7} },
        { center := 15, support := {3, 5} }]
    reverseChoices := [{ center := 1, support := {11, 13} },
        { center := 5, support := {9, 11} },
        { center := 7, support := {8, 13} },
        { center := 8, support := {0, 9} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(3, 16), [.row 3 16 15, .flip 3 15, .row 15 3 5, .flip 15 5, .row 5 15 8], (5, 8)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 16], (8, 16)⟩
      path3 := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1, .row 1 13 11, .flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(8, 9), [.row 8 9 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(5, 11), [.row 5 11 9], (5, 9)⟩ } },
  { hits := [(3, 15), (3, 16), (7, 13), (7, 15), (10, 2), (10, 3), (13, 5), (13, 16), (15, 3), (15, 5), (16, 2), (16, 13)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {13, 15} },
        { center := 10, support := {2, 3} },
        { center := 13, support := {5, 16} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {2, 13} }]
    reverseChoices := [{ center := 0, support := {3, 14} },
        { center := 1, support := {11, 13} },
        { center := 3, support := {0, 11} },
        { center := 6, support := {13, 14} },
        { center := 9, support := {1, 3} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨5, 7, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(5, 15), [.flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(1, 11), [.row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(3, 15), (3, 16), (7, 13), (7, 15), (13, 5), (13, 16), (14, 0), (14, 3), (15, 3), (15, 5), (16, 0), (16, 13)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {13, 15} },
        { center := 13, support := {5, 16} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 1, support := {11, 13} },
        { center := 2, support := {13, 16} },
        { center := 3, support := {0, 11} },
        { center := 9, support := {1, 3} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨5, 7, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(5, 15), [.flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path2 := ⟨(3, 14), [.flip 3 14, .row 14 3 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path1 := ⟨(1, 11), [.row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path2 := ⟨(2, 13), [.row 2 13 16], (2, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(4, 6), (4, 10), (6, 1), (6, 7), (6, 9), (6, 14), (9, 10), (9, 14), (10, 1), (10, 7), (14, 6), (14, 9)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 14, support := {6, 9} }]
    reverseChoices := [{ center := 2, support := {7, 10} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 9], (6, 9)⟩
      path2 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path3 := ⟨(1, 10), [.flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 15), [.row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 15], (10, 15)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(5, 8), (5, 12), (5, 15), (8, 11), (8, 14), (11, 5), (11, 8), (12, 14), (12, 15), (15, 5), (15, 11), (15, 12)]
    forwardChoices := [{ center := 5, support := {8, 12, 15} },
        { center := 8, support := {11, 14} },
        { center := 11, support := {5, 8} },
        { center := 12, support := {14, 15} },
        { center := 15, support := {5, 11, 12} }]
    reverseChoices := [{ center := 1, support := {4, 5, 11} },
        { center := 4, support := {1, 2} },
        { center := 5, support := {8, 11} },
        { center := 8, support := {2, 5} },
        { center := 11, support := {1, 4, 8} }]
    forwardData := {
      firstQuad := ⟨5, 8, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11], (11, 15)⟩
      path1 := ⟨(12, 14), [.row 12 14 15, .flip 12 15, .row 15 12 5, .flip 15 5, .row 5 15 12], (5, 12)⟩
      path2 := ⟨(5, 11), [.flip 5 11, .row 11 5 8, .flip 11 8, .row 8 11 14], (8, 14)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 5, .flip 15 5, .row 5 15 12], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1, .row 1 4 5], (1, 5)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(1, 4), [.row 1 4 11, .flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(5, 11), [.row 5 11 8, .flip 5 8, .row 8 5 2, .flip 8 2], (2, 8)⟩ } },
  { hits := [(5, 12), (5, 15), (6, 9), (6, 14), (12, 14), (12, 15), (13, 5), (13, 6), (14, 6), (14, 9), (15, 5), (15, 12)]
    forwardChoices := [{ center := 5, support := {12, 15} },
        { center := 6, support := {9, 14} },
        { center := 12, support := {14, 15} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {6, 9} },
        { center := 15, support := {5, 12} }]
    reverseChoices := [{ center := 1, support := {4, 11} },
        { center := 2, support := {7, 10} },
        { center := 3, support := {10, 11} },
        { center := 4, support := {1, 2} },
        { center := 10, support := {2, 7} },
        { center := 11, support := {1, 4} }]
    forwardData := {
      firstQuad := ⟨5, 9, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(12, 14), [.row 12 14 15, .flip 12 15, .row 15 12 5, .flip 15 5, .row 5 15 12], (5, 12)⟩
      path2 := ⟨(6, 9), [.row 6 9 14, .flip 6 14, .row 14 6 9, .flip 14 9], (9, 14)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 7, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1, .row 1 4 11, .flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2, .row 2 10 7], (2, 7)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(6, 7), (6, 14), (7, 4), (7, 9), (9, 3), (9, 14), (10, 3), (10, 7), (13, 4), (13, 6), (14, 6), (14, 9)]
    forwardChoices := [{ center := 6, support := {7, 14} },
        { center := 7, support := {4, 9} },
        { center := 9, support := {3, 14} },
        { center := 10, support := {3, 7} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {6, 9} }]
    reverseChoices := [{ center := 2, support := {7, 10} },
        { center := 3, support := {10, 12} },
        { center := 6, support := {9, 13} },
        { center := 7, support := {2, 13} },
        { center := 9, support := {7, 12} },
        { center := 10, support := {2, 9} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 4, .flip 7 4], (4, 7)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(6, 7), [.row 6 7 14, .flip 6 14, .row 14 6 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 9, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 12], (9, 12)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(0, 9), (0, 16), (2, 6), (2, 12), (3, 15), (3, 16), (9, 3), (9, 14), (12, 14), (12, 15), (14, 6), (14, 9), (15, 3), (15, 12)]
    forwardChoices := [{ center := 0, support := {9, 16} },
        { center := 2, support := {6, 12} },
        { center := 3, support := {15, 16} },
        { center := 9, support := {3, 14} },
        { center := 12, support := {14, 15} },
        { center := 14, support := {6, 9} },
        { center := 15, support := {3, 12} }]
    reverseChoices := [{ center := 1, support := {4, 13} },
        { center := 2, support := {7, 10} },
        { center := 4, support := {1, 2} },
        { center := 7, support := {2, 13} },
        { center := 13, support := {0, 1} },
        { center := 14, support := {4, 10} },
        { center := 16, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨0, 3, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 14, .flip 9 14, .row 14 9 6, .flip 14 6], (6, 14)⟩
      path1 := ⟨(0, 16), [.row 0 16 9], (0, 9)⟩
      path2 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path3 := ⟨(12, 14), [.row 12 14 15, .flip 12 15, .row 15 12 3, .flip 15 3, .row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 4, 10, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 13), [.row 7 13 2, .flip 7 2, .row 2 7 10], (2, 10)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1, .row 1 4 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(1, 4), (1, 10), (6, 1), (6, 7), (6, 9), (6, 14), (9, 10), (9, 14), (10, 1), (10, 7), (13, 4), (13, 6), (14, 6), (14, 9)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {6, 9} }]
    reverseChoices := [{ center := 2, support := {7, 10} },
        { center := 3, support := {10, 12} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 9], (6, 9)⟩
      path2 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 7, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 15], (10, 15)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(1, 8), (1, 13), (3, 15), (3, 16), (5, 8), (5, 15), (10, 2), (10, 3), (13, 5), (13, 16), (15, 3), (15, 5), (16, 2), (16, 13)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 10, support := {2, 3} },
        { center := 13, support := {5, 16} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {2, 13} }]
    reverseChoices := [{ center := 0, support := {3, 14} },
        { center := 1, support := {11, 13} },
        { center := 3, support := {0, 11} },
        { center := 6, support := {13, 14} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(1, 8), (1, 13), (3, 15), (3, 16), (5, 8), (5, 15), (13, 5), (13, 16), (14, 0), (14, 3), (15, 3), (15, 5), (16, 0), (16, 13)]
    forwardChoices := [{ center := 1, support := {8, 13} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {8, 15} },
        { center := 13, support := {5, 16} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 1, support := {11, 13} },
        { center := 2, support := {13, 16} },
        { center := 3, support := {0, 11} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {0, 1} },
        { center := 15, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(3, 14), [.flip 3 14, .row 14 3 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(2, 13), [.row 2 13 16], (2, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(1, 10), (1, 13), (2, 6), (2, 13), (6, 1), (6, 7), (6, 9), (6, 14), (9, 10), (9, 14), (10, 1), (10, 7), (14, 6), (14, 9)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 2, support := {6, 13} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 9, support := {10, 14} },
        { center := 10, support := {1, 7} },
        { center := 14, support := {6, 9} }]
    reverseChoices := [{ center := 2, support := {7, 10} },
        { center := 6, support := {9, 15} },
        { center := 7, support := {2, 6} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 14, support := {3, 10} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(9, 10), [.row 9 10 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 9], (6, 9)⟩
      path2 := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 9], (6, 9)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 15], (10, 15)⟩
      path3 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(2, 12), (2, 13), (3, 15), (3, 16), (5, 12), (5, 15), (10, 2), (10, 3), (13, 5), (13, 16), (15, 3), (15, 5), (16, 2), (16, 13)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {12, 15} },
        { center := 10, support := {2, 3} },
        { center := 13, support := {5, 16} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {2, 13} }]
    reverseChoices := [{ center := 0, support := {3, 14} },
        { center := 1, support := {11, 13} },
        { center := 3, support := {0, 11} },
        { center := 6, support := {13, 14} },
        { center := 11, support := {1, 4} },
        { center := 13, support := {0, 1} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨2, 5, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 12), [.row 5 12 15, .flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path1 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 11), [.flip 4 11, .row 11 4 1, .flip 11 1, .row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path3 := ⟨(0, 14), [.row 0 14 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(2, 12), (2, 13), (3, 15), (3, 16), (5, 12), (5, 15), (13, 5), (13, 16), (14, 0), (14, 3), (15, 3), (15, 5), (16, 0), (16, 13)]
    forwardChoices := [{ center := 2, support := {12, 13} },
        { center := 3, support := {15, 16} },
        { center := 5, support := {12, 15} },
        { center := 13, support := {5, 16} },
        { center := 14, support := {0, 3} },
        { center := 15, support := {3, 5} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 1, support := {11, 13} },
        { center := 2, support := {13, 16} },
        { center := 3, support := {0, 11} },
        { center := 11, support := {1, 4} },
        { center := 13, support := {0, 1} },
        { center := 14, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨2, 5, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 12), [.row 5 12 15, .flip 5 15, .row 15 5 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path1 := ⟨(2, 13), [.row 2 13 12], (2, 12)⟩
      path2 := ⟨(3, 14), [.flip 3 14, .row 14 3 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 13, .flip 16 13, .row 13 16 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 11), [.flip 4 11, .row 11 4 1, .flip 11 1, .row 1 11 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(2, 13), [.row 2 13 16], (2, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 3, .flip 0 3, .row 3 0 11], (3, 11)⟩ } },
  { hits := [(0, 9), (0, 16), (2, 1), (2, 13), (6, 1), (6, 14), (9, 3), (9, 14), (13, 6), (13, 16), (14, 0), (14, 3), (14, 6), (14, 9), (16, 0), (16, 13)]
    forwardChoices := [{ center := 0, support := {9, 16} },
        { center := 2, support := {1, 13} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {3, 14} },
        { center := 13, support := {6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10} },
        { center := 7, support := {2, 13} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨0, 3, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 16, .flip 13 16, .row 16 13 0, .flip 16 0, .row 0 16 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 13), [.row 7 13 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩
      path2 := ⟨(3, 10), [.row 3 10 0, .flip 3 0, .row 0 3 16, .flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(0, 9), (0, 16), (2, 1), (2, 13), (6, 1), (6, 14), (9, 8), (9, 14), (11, 0), (11, 8), (13, 6), (13, 16), (14, 6), (14, 9), (16, 0), (16, 13)]
    forwardChoices := [{ center := 0, support := {9, 16} },
        { center := 2, support := {1, 13} },
        { center := 6, support := {1, 14} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {0, 8} },
        { center := 13, support := {6, 16} },
        { center := 14, support := {6, 9} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 2, support := {7, 10} },
        { center := 3, support := {0, 10} },
        { center := 5, support := {8, 16} },
        { center := 7, support := {2, 8} },
        { center := 10, support := {2, 15} },
        { center := 14, support := {3, 15} },
        { center := 16, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨0, 8, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 16, .flip 13 16, .row 16 13 0, .flip 16 0, .row 0 16 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 15], (10, 15)⟩
      path1 := ⟨(5, 16), [.row 5 16 8], (5, 8)⟩
      path2 := ⟨(3, 10), [.row 3 10 0, .flip 3 0, .row 0 3 16, .flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path3 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ } },
  { hits := [(0, 9), (0, 16), (6, 9), (6, 14), (7, 9), (7, 13), (9, 8), (9, 14), (11, 0), (11, 8), (13, 6), (13, 16), (14, 6), (14, 9), (16, 0), (16, 13)]
    forwardChoices := [{ center := 0, support := {9, 16} },
        { center := 6, support := {9, 14} },
        { center := 7, support := {9, 13} },
        { center := 9, support := {8, 14} },
        { center := 11, support := {0, 8} },
        { center := 13, support := {6, 16} },
        { center := 14, support := {6, 9} },
        { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} },
        { center := 2, support := {7, 10} },
        { center := 3, support := {0, 10} },
        { center := 5, support := {8, 16} },
        { center := 7, support := {2, 8} },
        { center := 9, support := {3, 7} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {0, 7} }]
    forwardData := {
      firstQuad := ⟨0, 8, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 9), [.flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 6, .flip 14 6, .row 6 14 9], (6, 9)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 16, .flip 13 16, .row 16 13 0, .flip 16 0, .row 0 16 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(7, 8), [.row 7 8 2, .flip 7 2, .row 2 7 10, .flip 2 10, .row 10 2 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(5, 16), [.row 5 16 8], (5, 8)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.row 3 10 0, .flip 3 0, .row 0 3 16, .flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 21 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 84 := by
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

end ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3
end Problem97
