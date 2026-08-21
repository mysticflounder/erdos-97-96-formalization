/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisector
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Canary two-Kalmanson bank after the exact-17 six-hit bisector root

The authenticated terminal canary exposes eight subset-minimal occurrences of
the existing generic two-Kalmanson cancellation theorem. Each record retains
separately checked forward and reflected certificate data. Their complete
named-order and orientation orbits contribute 32 source-valid clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisector

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- Eight authenticated, source-valid canary occurrences. -/
def canaryCancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 4), (0, 6), (1, 4), (1, 14), (4, 2), (4, 14), (14, 2), (14, 6)]
    forwardChoices := [{ center := 0, support := {4, 6} },
        { center := 1, support := {4, 14} },
        { center := 4, support := {2, 14} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 12, support := {2, 14} },
        { center := 15, support := {2, 12} },
        { center := 16, support := {10, 12} }]
    forwardData := {
      firstQuad := ⟨0, 4, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 4), [.row 0 4 6], (0, 6)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩
      path3 := ⟨(1, 14), [.row 1 14 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨2, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 10, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(2, 10), [.row 2 10 14], (2, 14)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(2, 1), (2, 10), (5, 1), (5, 7), (7, 10), (7, 16), (10, 7), (10, 16)]
    forwardChoices := [{ center := 2, support := {1, 10} },
        { center := 5, support := {1, 7} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 16} }]
    reverseChoices := [{ center := 6, support := {0, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {9, 15} },
        { center := 14, support := {6, 15} }]
    forwardData := {
      firstQuad := ⟨2, 7, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 5, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(2, 7), [], (2, 7)⟩
      path1 := ⟨(10, 16), [.row 10 16 7, .flip 10 7, .row 7 10 16], (7, 16)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 10], (2, 10)⟩
      path3 := ⟨(5, 7), [.row 5 7 1, .flip 5 1], (1, 5)⟩ }
    reverseData := {
      firstQuad := ⟨6, 11, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(14, 15), [.row 14 15 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 15], (11, 15)⟩ } },
  { hits := [(2, 5), (2, 10), (7, 10), (7, 16), (10, 7), (10, 16), (11, 5), (11, 7)]
    forwardChoices := [{ center := 2, support := {5, 10} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 16} },
        { center := 11, support := {5, 7} }]
    reverseChoices := [{ center := 5, support := {9, 11} },
        { center := 6, support := {0, 9} },
        { center := 9, support := {0, 6} },
        { center := 14, support := {6, 11} }]
    forwardData := {
      firstQuad := ⟨2, 7, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 7, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(2, 7), [], (2, 7)⟩
      path1 := ⟨(10, 16), [.row 10 16 7, .flip 10 7, .row 7 10 16], (7, 16)⟩
      path2 := ⟨(2, 5), [.row 2 5 10], (2, 10)⟩
      path3 := ⟨(7, 11), [.flip 7 11, .row 11 7 5, .flip 11 5], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 5, 9, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 11, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(5, 9), [.row 5 9 11], (5, 11)⟩
      path1 := ⟨(0, 11), [], (0, 11)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path3 := ⟨(11, 14), [.flip 11 14, .row 14 11 6, .flip 14 6], (6, 14)⟩ } },
  { hits := [(5, 7), (5, 11), (7, 10), (7, 16), (10, 7), (10, 16), (12, 10), (12, 11)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 7, support := {10, 16} },
        { center := 10, support := {7, 16} },
        { center := 12, support := {10, 11} }]
    reverseChoices := [{ center := 4, support := {5, 6} },
        { center := 6, support := {0, 9} },
        { center := 9, support := {0, 6} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨5, 7, 11, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 11, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(5, 7), [.row 5 7 11], (5, 11)⟩
      path1 := ⟨(11, 16), [], (11, 16)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 10, .flip 12 10], (10, 12)⟩
      path3 := ⟨(10, 16), [.row 10 16 7, .flip 10 7, .row 7 10 16], (7, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 5, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 5, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 5), [.row 4 5 6], (4, 6)⟩
      path1 := ⟨(0, 6), [.flip 0 6, .row 6 0 9, .flip 6 9, .row 9 6 0, .flip 9 0], (0, 9)⟩
      path2 := ⟨(0, 5), [], (0, 5)⟩
      path3 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5], (5, 11)⟩ } },
  { hits := [(5, 7), (5, 11), (8, 3), (8, 11), (9, 3), (9, 5), (11, 5), (11, 7)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 8, support := {3, 11} },
        { center := 9, support := {3, 5} },
        { center := 11, support := {5, 7} }]
    reverseChoices := [{ center := 5, support := {9, 11} },
        { center := 7, support := {11, 13} },
        { center := 8, support := {5, 13} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨3, 5, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(5, 8), [], (5, 8)⟩
      path1 := ⟨(3, 9), [.flip 3 9, .row 9 3 5, .flip 9 5], (5, 9)⟩
      path2 := ⟨(5, 7), [.row 5 7 11, .flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩
      path3 := ⟨(8, 11), [.row 8 11 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5, .row 5 11 9], (5, 9)⟩
      path1 := ⟨(7, 13), [.row 7 13 11], (7, 11)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 13], (8, 13)⟩
      path3 := ⟨(9, 13), [], (9, 13)⟩ } },
  { hits := [(4, 13), (4, 14), (7, 10), (7, 13), (10, 7), (10, 14), (11, 2), (11, 7), (14, 2), (14, 10)]
    forwardChoices := [{ center := 4, support := {13, 14} },
        { center := 7, support := {10, 13} },
        { center := 10, support := {7, 14} },
        { center := 11, support := {2, 7} },
        { center := 14, support := {2, 10} }]
    reverseChoices := [{ center := 2, support := {6, 14} },
        { center := 5, support := {9, 14} },
        { center := 6, support := {2, 9} },
        { center := 9, support := {3, 6} },
        { center := 12, support := {2, 3} }]
    forwardData := {
      firstQuad := ⟨2, 4, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(4, 13), [.row 4 13 14], (4, 14)⟩
      path1 := ⟨(2, 14), [.flip 2 14, .row 14 2 10, .flip 14 10, .row 10 14 7, .flip 10 7, .row 7 10 13], (7, 13)⟩
      path2 := ⟨(7, 11), [.flip 7 11, .row 11 7 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(2, 13), [], (2, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 12, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 9), [.row 5 9 14], (5, 14)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2], (2, 12)⟩
      path3 := ⟨(2, 14), [.row 2 14 6, .flip 2 6, .row 6 2 9, .flip 6 9, .row 9 6 3, .flip 9 3], (3, 9)⟩ } },
  { hits := [(5, 7), (5, 11), (7, 3), (7, 10), (9, 3), (9, 5), (11, 5), (11, 7), (12, 10), (12, 11)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 7, support := {3, 10} },
        { center := 9, support := {3, 5} },
        { center := 11, support := {5, 7} },
        { center := 12, support := {10, 11} }]
    reverseChoices := [{ center := 4, support := {5, 6} },
        { center := 5, support := {9, 11} },
        { center := 7, support := {11, 13} },
        { center := 9, support := {6, 13} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨7, 10, 11, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 10), [.row 7 10 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(11, 12), [.flip 11 12, .row 12 11 10, .flip 12 10], (10, 12)⟩
      path2 := ⟨(5, 7), [.row 5 7 11, .flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 5, .flip 9 5], (5, 9)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 6, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5, .row 5 11 9], (5, 9)⟩
      path1 := ⟨(7, 13), [.row 7 13 11], (7, 11)⟩
      path2 := ⟨(4, 5), [.row 4 5 6], (4, 6)⟩
      path3 := ⟨(6, 9), [.flip 6 9, .row 9 6 13], (9, 13)⟩ } },
  { hits := [(5, 7), (5, 11), (7, 3), (7, 10), (8, 11), (8, 14), (9, 3), (9, 5), (10, 7), (10, 14), (11, 2), (11, 5), (14, 2), (14, 10)]
    forwardChoices := [{ center := 5, support := {7, 11} },
        { center := 7, support := {3, 10} },
        { center := 8, support := {11, 14} },
        { center := 9, support := {3, 5} },
        { center := 10, support := {7, 14} },
        { center := 11, support := {2, 5} },
        { center := 14, support := {2, 10} }]
    reverseChoices := [{ center := 2, support := {6, 14} },
        { center := 5, support := {11, 14} },
        { center := 6, support := {2, 9} },
        { center := 7, support := {11, 13} },
        { center := 8, support := {2, 5} },
        { center := 9, support := {6, 13} },
        { center := 11, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨2, 8, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(8, 11), [.row 8 11 14], (8, 14)⟩
      path1 := ⟨(2, 14), [.flip 2 14, .row 14 2 10, .flip 14 10, .row 10 14 7, .flip 10 7, .row 7 10 3, .flip 7 3], (3, 7)⟩
      path2 := ⟨(5, 7), [.row 5 7 11, .flip 5 11, .row 11 5 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 5, .flip 9 5], (5, 9)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(9, 11), [.flip 9 11, .row 11 9 5, .flip 11 5, .row 5 11 14], (5, 14)⟩
      path1 := ⟨(7, 13), [.row 7 13 11], (7, 11)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 2, .flip 8 2], (2, 8)⟩
      path3 := ⟨(2, 14), [.row 2 14 6, .flip 2 6, .row 6 2 9, .flip 6 9, .row 9 6 13], (9, 13)⟩ } }
]

theorem canaryCancellationOccurrences_length :
    canaryCancellationOccurrences.length = 8 := by
  native_decide

/-- Lean replays both projected cancellation records for every occurrence. -/
theorem canaryCancellationOccurrences_all_check :
    canaryCancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- Complete named-order and orientation orbit of the canary occurrences. -/
def canaryTwoKalmansonClauses : Std.Sat.CNF Atom :=
  canaryCancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem canaryTwoKalmansonClauses_length :
    canaryTwoKalmansonClauses.length = 32 := by
  native_decide

theorem sourceAssign_canaryTwoKalmansonClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ canaryTwoKalmansonClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [canaryTwoKalmansonClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck :=
    List.all_eq_true.mp canaryCancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

/--
Exact order-zero forward DIMACS clauses falsified by the authenticated canary.
The occurrence order matches the authenticated candidate ledger.
-/
theorem orderZeroForwardCanaryClauses_dimacs :
    canaryCancellationOccurrences.map (fun occ =>
      (occurrenceClause occ.hits 0 .forward).map litToDimacs) =
      [[-307, -11, -13, -113, -104, -179, -172, -26, -30],
        [-307, -143, -153, -160, -161, -136, -134, -280, -287],
        [-307, -146, -153, -136, -134, -280, -287, -61, -59],
        [-307, -161, -157, -136, -134, -280, -287, -85, -72],
        [-307, -161, -157, -46, -38, -267, -265, -61, -59],
        [-307, -176, -172, -136, -125, -280, -274, -60, -59, -26, -34],
        [-307, -161, -157, -131, -136, -267, -265, -61, -59, -85, -72],
        [-307, -161, -157, -131, -136, -38, -36, -267, -265,
          -280, -274, -60, -61, -26, -34]] := by
  native_decide

/-- Lean-owned successor of the exact-17 six-hit bisector root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf :
    Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf ++
    canaryTwoKalmansonClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf.length =
      7409297 := by
  simp only [
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf,
    List.length_append,
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf_length,
    canaryTwoKalmansonClauses_length]

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf =
        true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [
    extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_canaryTwoKalmansonClauses source clause hsuffix

/-- Conditional finite-UNSAT landing contract for the canary successor. -/
theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf =
          true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf
      source horder⟩

#print axioms canaryCancellationOccurrences_all_check
#print axioms sourceAssign_canaryTwoKalmansonClauses
#print axioms orderZeroForwardCanaryClauses_dimacs
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf
#print axioms
  false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf_unsat

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson
end Problem97
