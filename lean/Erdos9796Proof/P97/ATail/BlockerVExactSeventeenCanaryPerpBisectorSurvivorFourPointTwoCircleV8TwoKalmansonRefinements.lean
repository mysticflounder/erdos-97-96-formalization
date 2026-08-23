/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

/-!
Source-valid V8 two-Kalmanson bank over the V7 two-Kalmanson root.

The authenticated ledger `0dcede614cf088697139f475381ede6c813d7875d6bd69e4cb416af61054e725` supplies eleven checked cancellation
occurrences and a 44-clause order/orientation orbit (`0a2fb96358182260a5e9a881f7af25930e0d589abf97e60a0dabcfe4afd57ded`).
Three additional formalized-core records are authenticated by the generator but
emit no clauses because their clauses are already covered by the V7 parent.  The
production suffix contains exactly the 29 clauses still new against that parent
(`43c3f4a7452404a67cd179a18966edf9fd58a11a8b1077b86eb312daba710f75`).
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def v8CancellationOccurrence0 : CancellationOccurrence :=
  { hits := [(5, 7), (5, 10), (7, 3), (7, 4), (8, 3), (8, 10), (10, 4), (10, 7)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {3, 4} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {4, 7} }]
    reverseChoices := [{ center := 6, support := {9, 12} },
        { center := 8, support := {6, 13} },
        { center := 9, support := {12, 13} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨3, 7, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 7), [.flip 3 7, .row 7 3 4, .flip 7 4], (4, 7)⟩
      path1 := ⟨(8, 10), [.row 8 10 3, .flip 8 3], (3, 8)⟩
      path2 := ⟨(5, 7), [.row 5 7 10], (5, 10)⟩
      path3 := ⟨(4, 10), [.flip 4 10, .row 10 4 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 8, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 8), [.flip 6 8, .row 8 6 13], (8, 13)⟩
      path1 := ⟨(9, 13), [.row 9 13 12], (9, 12)⟩
      path2 := ⟨(9, 11), [.flip 9 11, .row 11 9 6, .flip 11 6], (6, 11)⟩
      path3 := ⟨(6, 12), [.row 6 12 9], (6, 9)⟩ } }

def v8CancellationOccurrence1 : CancellationOccurrence :=
  { hits := [(8, 3), (8, 12), (9, 3), (9, 16), (12, 9), (12, 16), (15, 9), (15, 12)]
    forwardChoices := [{ center := 8, support := {3, 12} },
        { center := 9, support := {3, 16} },
        { center := 12, support := {9, 16} },
        { center := 15, support := {9, 12} }]
    reverseChoices := [{ center := 1, support := {4, 7} },
        { center := 4, support := {0, 7} },
        { center := 7, support := {0, 13} },
        { center := 8, support := {4, 13} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 12, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path1 := ⟨(9, 12), [.flip 9 12, .row 12 9 16], (12, 16)⟩
      path2 := ⟨(12, 15), [.flip 12 15, .row 15 12 9, .flip 15 9], (9, 15)⟩
      path3 := ⟨(9, 16), [.row 9 16 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 4, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 4), [.row 1 4 7], (1, 7)⟩
      path1 := ⟨(0, 7), [.flip 0 7, .row 7 0 13], (7, 13)⟩
      path2 := ⟨(4, 7), [.row 4 7 0, .flip 4 0], (0, 4)⟩
      path3 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩ } }

def v8CancellationOccurrence2 : CancellationOccurrence :=
  { hits := [(1, 0), (1, 6), (2, 1), (2, 16), (13, 0), (13, 16), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {0, 6} },
        { center := 2, support := {1, 16} },
        { center := 13, support := {0, 16} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 3, support := {0, 16} },
        { center := 14, support := {0, 15} },
        { center := 15, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 16], (2, 16)⟩
      path1 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1], (1, 16)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 6], (1, 6)⟩
      path3 := ⟨(13, 16), [.row 13 16 0, .flip 13 0], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 16], (3, 16)⟩
      path1 := ⟨(15, 16), [.row 15 16 10, .flip 15 10], (10, 15)⟩
      path2 := ⟨(0, 10), [.row 0 10 15], (0, 15)⟩
      path3 := ⟨(14, 15), [.row 14 15 0, .flip 14 0], (0, 14)⟩ } }

def v8CancellationOccurrence3 : CancellationOccurrence :=
  { hits := [(8, 3), (8, 12), (9, 3), (9, 16), (11, 8), (11, 13), (13, 12), (13, 16), (16, 8), (16, 13)]
    forwardChoices := [{ center := 8, support := {3, 12} },
        { center := 9, support := {3, 16} },
        { center := 11, support := {8, 13} },
        { center := 13, support := {12, 16} },
        { center := 16, support := {8, 13} }]
    reverseChoices := [{ center := 0, support := {3, 8} },
        { center := 3, support := {0, 4} },
        { center := 5, support := {3, 8} },
        { center := 7, support := {0, 13} },
        { center := 8, support := {4, 13} }]
    forwardData := {
      firstQuad := ⟨3, 8, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 11, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 12], (8, 12)⟩
      path1 := ⟨(9, 16), [.row 9 16 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 13], (11, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 16, .flip 13 16, .row 16 13 8, .flip 16 8], (8, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 7), [.flip 0 7, .row 7 0 13], (7, 13)⟩
      path1 := ⟨(8, 13), [.row 8 13 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(3, 4), [.row 3 4 0, .flip 3 0, .row 0 3 8], (0, 8)⟩
      path3 := ⟨(5, 8), [.row 5 8 3, .flip 5 3], (3, 5)⟩ } }

def v8CancellationOccurrence4 : CancellationOccurrence :=
  { hits := [(0, 6), (0, 11), (1, 0), (1, 2), (2, 1), (2, 11), (3, 2), (3, 14), (11, 0), (11, 14), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {6, 11} },
        { center := 1, support := {0, 2} },
        { center := 2, support := {1, 11} },
        { center := 3, support := {2, 14} },
        { center := 11, support := {0, 14} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 5, support := {2, 16} },
        { center := 13, support := {2, 14} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {14, 16} },
        { center := 16, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 14], (3, 14)⟩
      path1 := ⟨(11, 14), [.row 11 14 0, .flip 11 0, .row 0 11 6], (0, 6)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 11], (2, 11)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 5), [.flip 2 5, .row 5 2 16, .flip 5 16, .row 16 5 10, .flip 16 10], (10, 16)⟩
      path1 := ⟨(13, 14), [.row 13 14 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(0, 10), [.row 0 10 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14, .flip 15 14, .row 14 15 5, .flip 14 5], (5, 14)⟩ } }

def v8CancellationOccurrence5 : CancellationOccurrence :=
  { hits := [(0, 6), (0, 14), (1, 2), (1, 6), (2, 1), (2, 5), (3, 2), (3, 14), (14, 1), (14, 5)]
    forwardChoices := [{ center := 0, support := {6, 14} },
        { center := 1, support := {2, 6} },
        { center := 2, support := {1, 5} },
        { center := 3, support := {2, 14} },
        { center := 14, support := {1, 5} }]
    reverseChoices := [{ center := 2, support := {11, 15} },
        { center := 13, support := {2, 14} },
        { center := 14, support := {11, 15} },
        { center := 15, support := {10, 14} },
        { center := 16, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 14], (3, 14)⟩
      path1 := ⟨(5, 14), [.flip 5 14, .row 14 5 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 6), [.row 1 6 2, .flip 1 2, .row 2 1 5], (2, 5)⟩
      path3 := ⟨(0, 14), [.row 0 14 6], (0, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 11, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 10, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 11), [.row 2 11 15], (2, 15)⟩
      path1 := ⟨(13, 14), [.row 13 14 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(10, 15), [.flip 10 15, .row 15 10 14, .flip 15 14, .row 14 15 11, .flip 14 11], (11, 14)⟩
      path3 := ⟨(2, 16), [.flip 2 16, .row 16 2 10, .flip 16 10], (10, 16)⟩ } }

def v8CancellationOccurrence6 : CancellationOccurrence :=
  { hits := [(1, 0), (1, 2), (2, 1), (2, 5), (3, 2), (3, 14), (11, 0), (11, 14), (14, 1), (14, 5)]
    forwardChoices := [{ center := 1, support := {0, 2} },
        { center := 2, support := {1, 5} },
        { center := 3, support := {2, 14} },
        { center := 11, support := {0, 14} },
        { center := 14, support := {1, 5} }]
    reverseChoices := [{ center := 2, support := {11, 15} },
        { center := 5, support := {2, 16} },
        { center := 13, support := {2, 14} },
        { center := 14, support := {11, 15} },
        { center := 15, support := {14, 16} }]
    forwardData := {
      firstQuad := ⟨2, 3, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 14], (3, 14)⟩
      path1 := ⟨(5, 14), [.flip 5 14, .row 14 5 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 5], (2, 5)⟩
      path3 := ⟨(11, 14), [.row 11 14 0, .flip 11 0], (0, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 11, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 11), [.row 2 11 15], (2, 15)⟩
      path1 := ⟨(13, 14), [.row 13 14 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(2, 5), [.flip 2 5, .row 5 2 16], (5, 16)⟩
      path3 := ⟨(15, 16), [.row 15 16 14, .flip 15 14, .row 14 15 11, .flip 14 11], (11, 14)⟩ } }

def v8CancellationOccurrence7 : CancellationOccurrence :=
  { hits := [(0, 6), (0, 11), (1, 0), (1, 2), (2, 1), (2, 11), (4, 2), (4, 13), (11, 0), (11, 13), (16, 1), (16, 6)]
    forwardChoices := [{ center := 0, support := {6, 11} },
        { center := 1, support := {0, 2} },
        { center := 2, support := {1, 11} },
        { center := 4, support := {2, 13} },
        { center := 11, support := {0, 13} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 5, support := {3, 16} },
        { center := 12, support := {3, 14} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {14, 16} },
        { center := 16, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 13], (4, 13)⟩
      path1 := ⟨(11, 13), [.row 11 13 0, .flip 11 0, .row 0 11 6], (0, 6)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 11], (2, 11)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 16, .flip 5 16, .row 16 5 10, .flip 16 10], (10, 16)⟩
      path1 := ⟨(12, 14), [.row 12 14 3, .flip 12 3], (3, 12)⟩
      path2 := ⟨(0, 10), [.row 0 10 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 14, .flip 15 14, .row 14 15 5, .flip 14 5], (5, 14)⟩ } }

def v8CancellationOccurrence8 : CancellationOccurrence :=
  { hits := [(0, 6), (0, 11), (6, 0), (6, 11), (11, 0), (11, 8), (16, 6), (16, 8)]
    forwardChoices := [{ center := 0, support := {6, 11} },
        { center := 6, support := {0, 11} },
        { center := 11, support := {0, 8} },
        { center := 16, support := {6, 8} }]
    reverseChoices := [{ center := 0, support := {8, 10} },
        { center := 5, support := {8, 16} },
        { center := 10, support := {5, 16} },
        { center := 16, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨6, 8, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 15), [], (8, 15)⟩
      path1 := ⟨(6, 16), [.flip 6 16, .row 16 6 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0, .row 0 11 6, .flip 0 6, .row 6 0 11], (6, 11)⟩
      path3 := ⟨(6, 15), [], (6, 15)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 8), [.row 5 8 16, .flip 5 16, .row 16 5 10, .flip 16 10, .row 10 16 5, .flip 10 5], (5, 10)⟩
      path1 := ⟨(3, 10), [], (3, 10)⟩
      path2 := ⟨(3, 8), [], (3, 8)⟩
      path3 := ⟨(0, 10), [.row 0 10 8], (0, 8)⟩ } }

def v8CancellationOccurrence9 : CancellationOccurrence :=
  { hits := [(1, 0), (1, 6), (5, 1), (5, 7), (6, 0), (6, 7), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {0, 6} },
        { center := 5, support := {1, 7} },
        { center := 6, support := {0, 7} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 10, support := {9, 16} },
        { center := 11, support := {9, 15} },
        { center := 15, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨1, 5, 6, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 7], (5, 7)⟩
      path1 := ⟨(6, 7), [.row 6 7 0, .flip 6 0], (0, 6)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 6], (1, 6)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨9, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 16], (10, 16)⟩
      path1 := ⟨(11, 15), [.row 11 15 9, .flip 11 9], (9, 11)⟩
      path2 := ⟨(0, 10), [.row 0 10 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 10, .flip 15 10], (10, 15)⟩ } }

def v8CancellationOccurrence10 : CancellationOccurrence :=
  { hits := [(1, 0), (1, 6), (2, 1), (2, 11), (6, 0), (6, 11), (16, 1), (16, 6)]
    forwardChoices := [{ center := 1, support := {0, 6} },
        { center := 2, support := {1, 11} },
        { center := 6, support := {0, 11} },
        { center := 16, support := {1, 6} }]
    reverseChoices := [{ center := 0, support := {10, 15} },
        { center := 10, support := {5, 16} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {10, 16} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(6, 11), [.row 6 11 0, .flip 6 0], (0, 6)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 6], (1, 6)⟩
      path3 := ⟨(6, 16), [.flip 6 16, .row 16 6 1, .flip 16 1], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 16], (10, 16)⟩
      path1 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path2 := ⟨(0, 10), [.row 0 10 15], (0, 15)⟩
      path3 := ⟨(15, 16), [.row 15 16 10, .flip 15 10], (10, 15)⟩ } }

def v8CancellationOccurrences : List CancellationOccurrence :=
  [v8CancellationOccurrence0, v8CancellationOccurrence1, v8CancellationOccurrence2, v8CancellationOccurrence3, v8CancellationOccurrence4, v8CancellationOccurrence5, v8CancellationOccurrence6, v8CancellationOccurrence7, v8CancellationOccurrence8, v8CancellationOccurrence9, v8CancellationOccurrence10]

theorem v8CancellationOccurrences_length :
    v8CancellationOccurrences.length = 11 := by
  native_decide

theorem v8CancellationOccurrences_all_check :
    v8CancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v8TwoKalmansonOrbitClauses : Std.Sat.CNF Atom :=
  v8CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v8TwoKalmansonOrbitClauses_length :
    v8TwoKalmansonOrbitClauses.length = 44 := by
  native_decide

theorem v8TwoKalmansonOrbitClauses_nodup :
    v8TwoKalmansonOrbitClauses.Nodup := by
  native_decide

theorem sourceAssign_v8TwoKalmansonOrbitClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v8TwoKalmansonOrbitClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v8TwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v8CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def v8TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  [ occurrenceClause v8CancellationOccurrence0.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence0.hits 0 .reverse,
    occurrenceClause v8CancellationOccurrence0.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence0.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence1.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence1.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence2.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence2.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence3.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence3.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence4.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence4.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence4.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence5.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence5.hits 0 .reverse,
    occurrenceClause v8CancellationOccurrence5.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence6.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence6.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence7.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence7.hits 1 .forward,
    occurrenceClause v8CancellationOccurrence7.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence8.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence8.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence9.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence9.hits 0 .reverse,
    occurrenceClause v8CancellationOccurrence9.hits 1 .reverse,
    occurrenceClause v8CancellationOccurrence10.hits 0 .forward,
    occurrenceClause v8CancellationOccurrence10.hits 0 .reverse,
    occurrenceClause v8CancellationOccurrence10.hits 1 .reverse ]

theorem v8TwoKalmansonRefinementClauses_length :
    v8TwoKalmansonRefinementClauses.length = 29 := by
  native_decide

theorem v8TwoKalmansonRefinementClauses_nodup :
    v8TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem v8TwoKalmansonRefinementClauses_subset_orbit :
    ∀ clause ∈ v8TwoKalmansonRefinementClauses,
      clause ∈ v8TwoKalmansonOrbitClauses := by
  native_decide

theorem sourceAssign_v8TwoKalmansonRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v8TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v8TwoKalmansonOrbitClauses source clause
    (v8TwoKalmansonRefinementClauses_subset_orbit clause hclause)

def canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf ++
    v8TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf.length =
      7409839 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf_length,
    v8TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v8TwoKalmansonRefinementClauses source clause hsuffix

#print axioms v8CancellationOccurrences_all_check
#print axioms v8TwoKalmansonOrbitClauses_nodup
#print axioms sourceAssign_v8TwoKalmansonOrbitClauses
#print axioms v8TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v8TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements
end Problem97
