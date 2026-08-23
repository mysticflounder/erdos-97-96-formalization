/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

/-!
Source-valid V7 two-Kalmanson bank over the V6 model-core root.

The authenticated ledger `ed2abfe2b9606875749bacd85d88dfd953c783ac51d6b8ce20df3cbe5a96ee9d` supplies nine checked cancellation
occurrences and a 36-clause order/orientation orbit (`5dfc3a4c54cc91def718b97ba79c0bc9bf7170b446a9cf9d74cea8e4cd053361`).
The production suffix contains exactly the 22 clauses still new against the
immediate V6 parent (`3b490543c3dc09319128ef749cdd48cc981bcf86d3afb8560319745c655a0765`).
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def v7CancellationOccurrence0 : CancellationOccurrence :=
  { hits := [(1, 6), (1, 10), (6, 8), (6, 13), (8, 6), (8, 13), (15, 8), (15, 10)]
    forwardChoices := [{ center := 1, support := {6, 10} },
        { center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} },
        { center := 15, support := {8, 10} }]
    reverseChoices := [{ center := 1, support := {6, 8} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} },
        { center := 15, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨6, 8, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13], (6, 13)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(1, 6), [.row 1 6 10], (1, 10)⟩
      path3 := ⟨(10, 15), [.flip 10 15, .row 15 10 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3, .flip 10 3], (3, 10)⟩
      path1 := ⟨(1, 10), [], (1, 10)⟩
      path2 := ⟨(1, 6), [.row 1 6 8], (1, 8)⟩
      path3 := ⟨(10, 15), [.flip 10 15, .row 15 10 6, .flip 15 6], (6, 15)⟩ } }

def v7CancellationOccurrence1 : CancellationOccurrence :=
  { hits := [(5, 7), (5, 9), (7, 9), (7, 16), (9, 6), (9, 16), (10, 6), (10, 7)]
    forwardChoices := [{ center := 5, support := {7, 9} },
        { center := 7, support := {9, 16} },
        { center := 9, support := {6, 16} },
        { center := 10, support := {6, 7} }]
    reverseChoices := [{ center := 6, support := {9, 10} },
        { center := 7, support := {0, 10} },
        { center := 9, support := {0, 7} },
        { center := 11, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 9, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 7), [.row 5 7 9], (5, 9)⟩
      path1 := ⟨(9, 16), [.row 9 16 6, .flip 9 6], (6, 9)⟩
      path2 := ⟨(7, 9), [.row 7 9 16], (7, 16)⟩
      path3 := ⟨(6, 10), [.flip 6 10, .row 10 6 7, .flip 10 7], (7, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 9, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 0, .flip 9 0], (0, 9)⟩
      path1 := ⟨(6, 10), [.row 6 10 9], (6, 9)⟩
      path2 := ⟨(0, 7), [.flip 0 7, .row 7 0 10], (7, 10)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 7, .flip 11 7], (7, 11)⟩ } }

def v7CancellationOccurrence2 : CancellationOccurrence :=
  { hits := [(2, 5), (2, 10), (4, 2), (4, 11), (7, 10), (7, 11), (10, 2), (10, 7), (12, 5), (12, 7)]
    forwardChoices := [{ center := 2, support := {5, 10} },
        { center := 4, support := {2, 11} },
        { center := 7, support := {10, 11} },
        { center := 10, support := {2, 7} },
        { center := 12, support := {5, 7} }]
    reverseChoices := [{ center := 4, support := {9, 11} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {5, 6} },
        { center := 12, support := {5, 14} },
        { center := 14, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩
      path1 := ⟨(5, 12), [.flip 5 12, .row 12 5 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(7, 11), [.row 7 11 10, .flip 7 10, .row 10 7 2, .flip 10 2, .row 2 10 5], (2, 5)⟩
      path3 := ⟨(4, 12), [], (4, 12)⟩ }
    reverseData := {
      firstQuad := ⟨5, 11, 12, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(5, 11), [], (5, 11)⟩
      path1 := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(5, 9), [.flip 5 9, .row 9 5 6, .flip 9 6, .row 6 9 14, .flip 6 14, .row 14 6 11, .flip 14 11], (11, 14)⟩
      path3 := ⟨(4, 11), [.row 4 11 9], (4, 9)⟩ } }

def v7CancellationOccurrence3 : CancellationOccurrence :=
  { hits := [(1, 4), (1, 10), (4, 2), (4, 11), (7, 10), (7, 11), (10, 2), (10, 7), (12, 4), (12, 7)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 4, support := {2, 11} },
        { center := 7, support := {10, 11} },
        { center := 10, support := {2, 7} },
        { center := 12, support := {4, 7} }]
    reverseChoices := [{ center := 4, support := {9, 12} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {5, 6} },
        { center := 12, support := {5, 14} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩
      path1 := ⟨(1, 10), [.row 1 10 4], (1, 4)⟩
      path2 := ⟨(7, 11), [.row 7 11 10, .flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(4, 12), [.flip 4 12, .row 12 4 7, .flip 12 7], (7, 12)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(5, 9), [.flip 5 9, .row 9 5 6, .flip 9 6, .row 6 9 14], (6, 14)⟩
      path3 := ⟨(4, 12), [.row 4 12 9], (4, 9)⟩ } }

def v7CancellationOccurrence4 : CancellationOccurrence :=
  { hits := [(6, 8), (6, 13), (8, 6), (8, 13), (13, 0), (13, 6), (15, 0), (15, 8)]
    forwardChoices := [{ center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} },
        { center := 13, support := {0, 6} },
        { center := 15, support := {0, 8} }]
    reverseChoices := [{ center := 1, support := {8, 16} },
        { center := 3, support := {10, 16} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨7, 8, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13, .flip 6 13, .row 13 6 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(7, 13), [], (7, 13)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 8, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3, .flip 10 3, .row 3 10 16], (3, 16)⟩
      path1 := ⟨(2, 16), [], (2, 16)⟩
      path2 := ⟨(2, 8), [], (2, 8)⟩
      path3 := ⟨(1, 16), [.row 1 16 8], (1, 8)⟩ } }

def v7CancellationOccurrence5 : CancellationOccurrence :=
  { hits := [(0, 1), (0, 2), (6, 8), (6, 13), (8, 6), (8, 13), (13, 1), (13, 6), (15, 2), (15, 8)]
    forwardChoices := [{ center := 0, support := {1, 2} },
        { center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} },
        { center := 13, support := {1, 6} },
        { center := 15, support := {2, 8} }]
    reverseChoices := [{ center := 1, support := {8, 14} },
        { center := 3, support := {10, 15} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} },
        { center := 16, support := {14, 15} }]
    forwardData := {
      firstQuad := ⟨2, 8, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 2, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13, .flip 6 13, .row 13 6 1, .flip 13 1], (1, 13)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(0, 1), [.row 0 1 2], (0, 2)⟩
      path3 := ⟨(2, 13), [], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3, .flip 10 3, .row 3 10 15], (3, 15)⟩
      path1 := ⟨(1, 15), [], (1, 15)⟩
      path2 := ⟨(1, 14), [.row 1 14 8], (1, 8)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 14, .flip 16 14], (14, 16)⟩ } }

def v7CancellationOccurrence6 : CancellationOccurrence :=
  { hits := [(0, 2), (0, 14), (2, 1), (2, 15), (13, 0), (13, 1), (15, 0), (15, 2), (16, 14), (16, 15)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 15} },
        { center := 13, support := {0, 1} },
        { center := 15, support := {0, 2} },
        { center := 16, support := {14, 15} }]
    reverseChoices := [{ center := 0, support := {1, 2} },
        { center := 1, support := {14, 16} },
        { center := 3, support := {15, 16} },
        { center := 14, support := {1, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 15, .flip 2 15, .row 15 2 0, .flip 15 0], (0, 15)⟩
      path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(0, 14), [.row 0 14 2], (0, 2)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 14, .flip 16 14], (14, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 1), [.row 0 1 2], (0, 2)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 1, .flip 14 1, .row 1 14 16], (1, 16)⟩
      path3 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩ } }

def v7CancellationOccurrence7 : CancellationOccurrence :=
  { hits := [(6, 8), (6, 13), (8, 6), (8, 13), (11, 8), (11, 9), (13, 6), (13, 9)]
    forwardChoices := [{ center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} },
        { center := 11, support := {8, 9} },
        { center := 13, support := {6, 9} }]
    reverseChoices := [{ center := 3, support := {7, 10} },
        { center := 5, support := {7, 8} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 8, .flip 11 8], (8, 11)⟩
      path1 := ⟨(8, 12), [], (8, 12)⟩
      path2 := ⟨(9, 12), [], (9, 12)⟩
      path3 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13, .flip 6 13, .row 13 6 9, .flip 13 9], (9, 13)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 7), [.row 5 7 8], (5, 8)⟩
      path1 := ⟨(4, 8), [], (4, 8)⟩
      path2 := ⟨(4, 7), [], (4, 7)⟩
      path3 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3, .flip 10 3, .row 3 10 7], (3, 7)⟩ } }

def v7CancellationOccurrence8 : CancellationOccurrence :=
  { hits := [(6, 8), (6, 13), (8, 6), (8, 13), (10, 2), (10, 6), (15, 2), (15, 8)]
    forwardChoices := [{ center := 6, support := {8, 13} },
        { center := 8, support := {6, 13} },
        { center := 10, support := {2, 6} },
        { center := 15, support := {2, 8} }]
    reverseChoices := [{ center := 1, support := {8, 14} },
        { center := 6, support := {10, 14} },
        { center := 8, support := {3, 10} },
        { center := 10, support := {3, 8} }]
    forwardData := {
      firstQuad := ⟨6, 8, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 13), [.row 8 13 6, .flip 8 6, .row 6 8 13], (6, 13)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(6, 10), [.flip 6 10, .row 10 6 2, .flip 10 2], (2, 10)⟩
      path3 := ⟨(2, 15), [.flip 2 15, .row 15 2 8, .flip 15 8], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(6, 10), [.row 6 10 14], (6, 14)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10, .row 10 8 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(1, 14), [.row 1 14 8], (1, 8)⟩ } }

def v7CancellationOccurrences : List CancellationOccurrence :=
  [v7CancellationOccurrence0, v7CancellationOccurrence1, v7CancellationOccurrence2, v7CancellationOccurrence3, v7CancellationOccurrence4, v7CancellationOccurrence5, v7CancellationOccurrence6, v7CancellationOccurrence7, v7CancellationOccurrence8]

theorem v7CancellationOccurrences_length :
    v7CancellationOccurrences.length = 9 := by
  native_decide

theorem v7CancellationOccurrences_all_check :
    v7CancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v7TwoKalmansonOrbitClauses : Std.Sat.CNF Atom :=
  v7CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v7TwoKalmansonOrbitClauses_length :
    v7TwoKalmansonOrbitClauses.length = 36 := by
  native_decide

theorem v7TwoKalmansonOrbitClauses_nodup :
    v7TwoKalmansonOrbitClauses.Nodup := by
  native_decide

theorem sourceAssign_v7TwoKalmansonOrbitClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v7TwoKalmansonOrbitClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v7TwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v7CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def v7TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  [ occurrenceClause v7CancellationOccurrence0.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence0.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence0.hits 1 .reverse,
    occurrenceClause v7CancellationOccurrence1.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence1.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence1.hits 1 .forward,
    occurrenceClause v7CancellationOccurrence1.hits 1 .reverse,
    occurrenceClause v7CancellationOccurrence2.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence2.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence3.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence3.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence3.hits 1 .forward,
    occurrenceClause v7CancellationOccurrence5.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence5.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence5.hits 1 .reverse,
    occurrenceClause v7CancellationOccurrence6.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence6.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence6.hits 1 .forward,
    occurrenceClause v7CancellationOccurrence6.hits 1 .reverse,
    occurrenceClause v7CancellationOccurrence8.hits 0 .forward,
    occurrenceClause v7CancellationOccurrence8.hits 0 .reverse,
    occurrenceClause v7CancellationOccurrence8.hits 1 .reverse ]

theorem v7TwoKalmansonRefinementClauses_length :
    v7TwoKalmansonRefinementClauses.length = 22 := by
  native_decide

theorem v7TwoKalmansonRefinementClauses_nodup :
    v7TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem v7TwoKalmansonRefinementClauses_subset_orbit :
    ∀ clause ∈ v7TwoKalmansonRefinementClauses,
      clause ∈ v7TwoKalmansonOrbitClauses := by
  native_decide

theorem sourceAssign_v7TwoKalmansonRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v7TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v7TwoKalmansonOrbitClauses source clause
    (v7TwoKalmansonRefinementClauses_subset_orbit clause hclause)

def canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf ++
    v7TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf.length =
      7409810 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf_length,
    v7TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v7TwoKalmansonRefinementClauses source clause hsuffix

#print axioms v7CancellationOccurrences_all_check
#print axioms v7TwoKalmansonOrbitClauses_nodup
#print axioms sourceAssign_v7TwoKalmansonOrbitClauses
#print axioms v7TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v7TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements
end Problem97
