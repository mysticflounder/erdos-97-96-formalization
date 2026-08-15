/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtiethModelRefinements

/-!
# Child-31 cancellation refinements, shard 0

This shard contains 21 of the 84 subset-minimal checked cancellation
occurrences extracted exhaustively from the authenticated child-31 model.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 1), (0, 8), (9, 3), (9, 8), (10, 1), (10, 3)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 8], (0, 8)⟩
      path1 := ⟨(8, 10), [], (8, 10)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 8, .flip 16 8], (8, 16)⟩ } },
  { hits := [(0, 1), (0, 8), (10, 1), (10, 7), (11, 7), (11, 8)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 7, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 7, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 7), [], (0, 7)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(0, 1), [.row 0 1 8], (0, 8)⟩
      path3 := ⟨(7, 10), [.flip 7 10, .row 10 7 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 8), [.row 5 8 9], (5, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(6, 9), [.row 6 9 15], (6, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 8, .flip 16 8], (8, 16)⟩ } },
  { hits := [(0, 1), (0, 9), (10, 1), (10, 3), (14, 3), (14, 9)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 9, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 9], (0, 9)⟩
      path1 := ⟨(9, 14), [.flip 9 14, .row 14 9 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 7), [.row 2 7 13], (2, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 7, .flip 16 7], (7, 16)⟩ } },
  { hits := [(0, 8), (0, 9), (6, 7), (6, 9), (11, 7), (11, 8)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 7, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 7, 9⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 7), [], (0, 7)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path3 := ⟨(0, 9), [.row 0 9 8], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 9, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 8), [.row 5 8 9], (5, 9)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(7, 16), [.flip 7 16, .row 16 7 8, .flip 16 8], (8, 16)⟩ } },
  { hits := [(0, 8), (0, 16), (1, 4), (1, 8), (3, 4), (3, 16)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 3, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 4, 8⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(0, 16), [.row 0 16 8], (0, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(1, 8), [.row 1 8 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 12, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(8, 13), [], (8, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩
      path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(0, 8), (0, 16), (3, 15), (3, 16), (5, 8), (5, 15)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 3, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(0, 16), [.row 0 16 8], (0, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 15], (5, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 8, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 13), [], (8, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 8), (0, 16), (8, 7), (8, 16), (11, 7), (11, 8)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 7, 8, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 11, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 16], (8, 16)⟩
      path1 := ⟨(0, 11), [], (0, 11)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 7, .flip 11 7], (7, 11)⟩
      path3 := ⟨(0, 16), [.row 0 16 8], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 9, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 8), [.row 5 8 9], (5, 9)⟩
      path1 := ⟨(0, 9), [], (0, 9)⟩
      path2 := ⟨(8, 9), [.row 8 9 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 8, .flip 16 8], (8, 16)⟩ } },
  { hits := [(0, 9), (0, 16), (3, 15), (3, 16), (7, 9), (7, 15)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 3, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 9), [], (3, 9)⟩
      path1 := ⟨(0, 16), [.row 0 16 9], (0, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(7, 13), [], (7, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(0, 9), (0, 16), (6, 9), (6, 14), (8, 14), (8, 16)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨0, 6, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path1 := ⟨(0, 14), [], (0, 14)⟩
      path2 := ⟨(8, 14), [.row 8 14 16], (8, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 9], (0, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 7, .flip 16 7], (7, 16)⟩
      path2 := ⟨(2, 8), [.flip 2 8, .row 8 2 0, .flip 8 0], (0, 8)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ } },
  { hits := [(1, 4), (1, 8), (11, 5), (11, 8), (13, 4), (13, 5)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨1, 4, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 8, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(5, 8), [.row 5 8 11], (5, 11)⟩
      path3 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩ } },
  { hits := [(1, 8), (1, 13), (2, 12), (2, 13), (5, 8), (5, 12)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 8, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 8), [], (2, 8)⟩
      path1 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩
      path2 := ⟨(5, 8), [.row 5 8 12], (5, 12)⟩
      path3 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 4, .flip 11 4], (4, 11)⟩
      path3 := ⟨(4, 15), [], (4, 15)⟩ } },
  { hits := [(1, 10), (1, 13), (9, 10), (9, 14), (16, 13), (16, 14)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨9, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 9, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(9, 13), [], (9, 13)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 13, .flip 16 13], (13, 16)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 3], (0, 3)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 15), [], (2, 15)⟩ } },
  { hits := [(2, 1), (2, 13), (10, 1), (10, 2), (16, 2), (16, 13)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 10, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(2, 10), [.flip 2 10, .row 10 2 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(0, 6), [], (0, 6)⟩
      path1 := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩
      path2 := ⟨(0, 3), [.row 0 3 14], (0, 14)⟩
      path3 := ⟨(6, 14), [.row 6 14 15], (6, 15)⟩ } },
  { hits := [(4, 6), (4, 11), (12, 9), (12, 11), (14, 6), (14, 9)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨4, 6, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩
      path1 := ⟨(11, 14), [], (11, 14)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(9, 14), [.flip 9 14, .row 14 9 6, .flip 14 6], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 7, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 5), [.row 4 5 7], (4, 7)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(2, 7), [.row 2 7 10], (2, 10)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ } },
  { hits := [(4, 10), (4, 11), (8, 11), (8, 14), (9, 10), (9, 14)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨4, 8, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩
      path2 := ⟨(9, 10), [.row 9 10 14], (9, 14)⟩
      path3 := ⟨(8, 14), [.row 8 14 11], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 7), [], (5, 7)⟩
      path1 := ⟨(2, 8), [.flip 2 8, .row 8 2 5, .flip 8 5], (5, 8)⟩
      path2 := ⟨(6, 7), [.flip 6 7, .row 7 6 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩ } },
  { hits := [(5, 12), (5, 15), (12, 11), (12, 15), (15, 11), (15, 12)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨10, 11, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 10, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(11, 12), [.flip 11 12, .row 12 11 15, .flip 12 15, .row 15 12 11, .flip 15 11], (11, 15)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(10, 12), [], (10, 12)⟩
      path3 := ⟨(5, 15), [.row 5 15 12], (5, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 5, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 5, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(3, 5), [], (3, 5)⟩
      path1 := ⟨(1, 11), [.flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(4, 5), [.row 4 5 1, .flip 4 1, .row 1 4 5], (1, 5)⟩
      path3 := ⟨(3, 11), [], (3, 11)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 3), (9, 14), (14, 3), (14, 9)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨3, 6, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(3, 14), [.flip 3 14, .row 14 3 9, .flip 14 9, .row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩
      path3 := ⟨(3, 10), [], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(6, 10), [], (6, 10)⟩
      path1 := ⟨(2, 13), [.row 2 13 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(6, 13), [], (6, 13)⟩ } },
  { hits := [(8, 7), (8, 14), (9, 3), (9, 14), (10, 3), (10, 7)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(9, 14), [.row 9 14 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 14], (8, 14)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 8, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 7), [.flip 2 7, .row 7 2 13], (7, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 9), [.row 8 9 2, .flip 8 2], (2, 8)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(8, 7), (8, 16), (11, 5), (11, 7), (13, 5), (13, 16)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨5, 8, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 8), [], (5, 8)⟩
      path1 := ⟨(13, 16), [.row 13 16 5, .flip 13 5], (5, 13)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 16], (8, 16)⟩
      path3 := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 5, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 5, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 11], (3, 11)⟩
      path1 := ⟨(5, 11), [.row 5 11 9], (5, 9)⟩
      path2 := ⟨(0, 5), [], (0, 5)⟩
      path3 := ⟨(8, 9), [.row 8 9 0, .flip 8 0], (0, 8)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 3), (10, 7), (11, 7), (11, 8)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 9), [], (7, 9)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(7, 11), [.flip 7 11, .row 11 7 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(5, 9), [.row 5 9 8], (5, 8)⟩
      path2 := ⟨(7, 9), [], (7, 9)⟩
      path3 := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ } },
  { hits := [(9, 3), (9, 8), (11, 5), (11, 8), (15, 3), (15, 5)]
    forwardChoices := [{ center := 0, support := {1, 8, 9, 16} },
        { center := 1, support := {4, 8, 10, 13} },
        { center := 2, support := {1, 6, 12, 13} },
        { center := 3, support := {2, 4, 15, 16} },
        { center := 4, support := {2, 6, 10, 11} },
        { center := 5, support := {3, 8, 12, 15} },
        { center := 6, support := {1, 7, 9, 14} },
        { center := 7, support := {4, 9, 13, 15} },
        { center := 8, support := {7, 11, 14, 16} },
        { center := 9, support := {3, 8, 10, 14} },
        { center := 10, support := {1, 2, 3, 7} },
        { center := 11, support := {0, 5, 7, 8} },
        { center := 12, support := {9, 11, 14, 15} },
        { center := 13, support := {4, 5, 6, 16} },
        { center := 14, support := {0, 3, 6, 9} },
        { center := 15, support := {3, 5, 11, 12} },
        { center := 16, support := {0, 2, 13, 14} }]
    reverseChoices := [{ center := 0, support := {2, 3, 14, 16} },
        { center := 1, support := {4, 5, 11, 13} },
        { center := 2, support := {7, 10, 13, 16} },
        { center := 3, support := {0, 10, 11, 12} },
        { center := 4, support := {1, 2, 5, 7} },
        { center := 5, support := {8, 9, 11, 16} },
        { center := 6, support := {9, 13, 14, 15} },
        { center := 7, support := {2, 6, 8, 13} },
        { center := 8, support := {0, 2, 5, 9} },
        { center := 9, support := {1, 3, 7, 12} },
        { center := 10, support := {2, 7, 9, 15} },
        { center := 11, support := {1, 4, 8, 13} },
        { center := 12, support := {5, 6, 10, 14} },
        { center := 13, support := {0, 1, 12, 14} },
        { center := 14, support := {3, 4, 10, 15} },
        { center := 15, support := {3, 6, 8, 12} },
        { center := 16, support := {0, 7, 8, 15} }]
    forwardData := {
      firstQuad := ⟨3, 5, 9, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(5, 11), [.flip 5 11, .row 11 5 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 7, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(1, 13), [.row 1 13 11], (1, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(5, 11), [.row 5 11 8], (5, 8)⟩ } }]


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

end ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0
end Problem97
