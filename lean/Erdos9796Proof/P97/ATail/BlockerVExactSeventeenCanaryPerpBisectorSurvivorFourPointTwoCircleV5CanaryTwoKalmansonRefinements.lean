/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements

/-!
Source-valid v5 two-Kalmanson refinement bank over the v4-combined FourPoint root.

The eight cancellation occurrences come from the authenticated v5 candidate ledger
(`bded5653d14e36347d01a92bf17e989f654e76bde2838d31a3830c51cbb5e4a6`).  Their
complete order/orientation orbit has 32 clauses.  The
production suffix is the audited 20-clause strict-new subset, whose canonical DIMACS
set has SHA-256 `015b639c3f329e03f100403aa80875300a58b4f144670df299dcfc29393965ce`.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def v5CanaryCancellationOccurrence0 : CancellationOccurrence :=
  { hits := [(6, 8), (6, 14), (7, 6), (7, 13), (8, 9), (8, 13), (9, 8), (9, 14),
        (13, 6), (13, 9)]
    forwardChoices := [{ center := 6, support := {8, 14} },
        { center := 7, support := {6, 13} }, { center := 8, support := {9, 13} },
        { center := 9, support := {8, 14} }, { center := 13, support := {6, 9} }]
    reverseChoices := [{ center := 3, support := {7, 10} },
        { center := 7, support := {2, 8} }, { center := 8, support := {3, 7} },
        { center := 9, support := {3, 10} }, { center := 10, support := {2, 8} }]
    forwardData := {
      firstQuad := ⟨6, 7, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 13], (7, 13)⟩
      path1 := ⟨(8, 13), [.row 8 13 9, .flip 8 9, .row 9 8 14], (9, 14)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 8], (6, 8)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 8, .flip 10 8], (8, 10)⟩
      path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 7, .flip 8 7, .row 7 8 2,
        .flip 7 2], (2, 7)⟩
      path3 := ⟨(9, 10), [.row 9 10 3, .flip 9 3], (3, 9)⟩ } }

def v5CanaryCancellationOccurrence1 : CancellationOccurrence :=
  { hits := [(0, 2), (0, 3), (2, 10), (2, 15), (13, 2), (13, 15), (15, 3), (15, 10)]
    forwardChoices := [{ center := 0, support := {2, 3} },
        { center := 2, support := {10, 15} }, { center := 13, support := {2, 15} },
        { center := 15, support := {3, 10} }]
    reverseChoices := [{ center := 1, support := {6, 13} },
        { center := 3, support := {1, 14} }, { center := 14, support := {1, 6} },
        { center := 16, support := {13, 14} }]
    forwardData := {
      firstQuad := ⟨2, 10, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 3, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 10), [.row 2 10 15], (2, 15)⟩
      path1 := ⟨(13, 15), [.row 13 15 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(0, 2), [.row 0 2 3], (0, 3)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 10, .flip 15 10], (10, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 3), [.flip 1 3, .row 3 1 14], (3, 14)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(1, 13), [.row 1 13 6], (1, 6)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 13, .flip 16 13], (13, 16)⟩ } }

def v5CanaryCancellationOccurrence2 : CancellationOccurrence :=
  { hits := [(1, 4), (1, 11), (4, 2), (4, 11), (11, 2), (11, 5), (12, 4), (12, 5)]
    forwardChoices := [{ center := 1, support := {4, 11} },
        { center := 4, support := {2, 11} }, { center := 11, support := {2, 5} },
        { center := 12, support := {4, 5} }]
    reverseChoices := [{ center := 4, support := {11, 12} },
        { center := 5, support := {11, 14} }, { center := 12, support := {5, 14} },
        { center := 15, support := {5, 12} }]
    forwardData := {
      firstQuad := ⟨4, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 2, .flip 11 2], (2, 11)⟩
      path1 := ⟨(4, 12), [.flip 4 12, .row 12 4 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩
      path3 := ⟨(1, 11), [.row 1 11 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨5, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩
      path1 := ⟨(5, 15), [.flip 5 15, .row 15 5 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(5, 11), [.row 5 11 14], (5, 14)⟩
      path3 := ⟨(4, 12), [.row 4 12 11], (4, 11)⟩ } }

def v5CanaryCancellationOccurrence3 : CancellationOccurrence :=
  { hits := [(0, 1), (0, 13), (1, 0), (1, 6), (5, 1), (5, 9), (8, 9), (8, 13),
        (9, 6), (9, 8), (11, 0), (11, 8)]
    forwardChoices := [{ center := 0, support := {1, 13} },
        { center := 1, support := {0, 6} }, { center := 5, support := {1, 9} },
        { center := 8, support := {9, 13} }, { center := 9, support := {6, 8} },
        { center := 11, support := {0, 8} }]
    reverseChoices := [{ center := 5, support := {8, 16} },
        { center := 7, support := {8, 10} }, { center := 8, support := {3, 7} },
        { center := 11, support := {7, 15} }, { center := 15, support := {10, 16} },
        { center := 16, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 6, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 9], (5, 9)⟩
      path1 := ⟨(6, 9), [.flip 6 9, .row 9 6 8, .flip 9 8, .row 8 9 13], (8, 13)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 13), [.row 0 13 1, .flip 0 1, .row 1 0 6], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 10, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 8), [.row 5 8 16], (5, 16)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 15, .flip 16 15,
        .row 15 16 10, .flip 15 10], (10, 15)⟩
      path2 := ⟨(7, 10), [.row 7 10 8, .flip 7 8, .row 8 7 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(11, 15), [.row 11 15 7, .flip 11 7], (7, 11)⟩ } }

def v5CanaryCancellationOccurrence4 : CancellationOccurrence :=
  { hits := [(5, 9), (5, 12), (6, 12), (6, 14), (9, 6), (9, 14), (13, 6), (13, 9)]
    forwardChoices := [{ center := 5, support := {9, 12} },
        { center := 6, support := {12, 14} }, { center := 9, support := {6, 14} },
        { center := 13, support := {6, 9} }]
    reverseChoices := [{ center := 3, support := {7, 10} },
        { center := 7, support := {2, 10} }, { center := 10, support := {2, 4} },
        { center := 11, support := {4, 7} }]
    forwardData := {
      firstQuad := ⟨5, 6, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 9), [.flip 6 9, .row 9 6 14], (9, 14)⟩
      path1 := ⟨(5, 12), [.row 5 12 9], (5, 9)⟩
      path2 := ⟨(9, 13), [.flip 9 13, .row 13 9 6, .flip 13 6], (6, 13)⟩
      path3 := ⟨(6, 14), [.row 6 14 12], (6, 12)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 7, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 7), [.row 3 7 10], (3, 10)⟩
      path1 := ⟨(2, 10), [.flip 2 10, .row 10 2 4, .flip 10 4], (4, 10)⟩
      path2 := ⟨(7, 10), [.row 7 10 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(4, 11), [.flip 4 11, .row 11 4 7, .flip 11 7], (7, 11)⟩ } }

def v5CanaryCancellationOccurrence5 : CancellationOccurrence :=
  { hits := [(2, 10), (2, 15), (11, 0), (11, 2), (13, 2), (13, 15), (15, 0), (15, 10)]
    forwardChoices := [{ center := 2, support := {10, 15} },
        { center := 11, support := {0, 2} }, { center := 13, support := {2, 15} },
        { center := 15, support := {0, 10} }]
    reverseChoices := [{ center := 1, support := {6, 16} },
        { center := 3, support := {1, 14} }, { center := 5, support := {14, 16} },
        { center := 14, support := {1, 6} }]
    forwardData := {
      firstQuad := ⟨2, 10, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 10), [.row 2 10 15], (2, 15)⟩
      path1 := ⟨(13, 15), [.row 13 15 2, .flip 13 2], (2, 13)⟩
      path2 := ⟨(2, 11), [.flip 2 11, .row 11 2 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 10, .flip 15 10], (10, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 6, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 14, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 3), [.flip 1 3, .row 3 1 14], (3, 14)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 1, .flip 14 1], (1, 14)⟩
      path2 := ⟨(5, 14), [.row 5 14 16], (5, 16)⟩
      path3 := ⟨(1, 16), [.row 1 16 6], (1, 6)⟩ } }

def v5CanaryCancellationOccurrence6 : CancellationOccurrence :=
  { hits := [(0, 2), (0, 13), (1, 0), (1, 11), (8, 11), (8, 13), (11, 0), (11, 2)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 1, support := {0, 11} }, { center := 8, support := {11, 13} },
        { center := 11, support := {0, 2} }]
    reverseChoices := [{ center := 5, support := {14, 16} },
        { center := 8, support := {3, 5} }, { center := 15, support := {5, 16} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 11], (1, 11)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 0, .flip 11 0], (0, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 14, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(5, 14), [.row 5 14 16], (5, 16)⟩
      path3 := ⟨(15, 16), [.row 15 16 5, .flip 15 5], (5, 15)⟩ } }

def v5CanaryCancellationOccurrence7 : CancellationOccurrence :=
  { hits := [(0, 1), (0, 13), (1, 0), (1, 11), (8, 11), (8, 13), (11, 0), (11, 5),
        (12, 1), (12, 5)]
    forwardChoices := [{ center := 0, support := {1, 13} },
        { center := 1, support := {0, 11} }, { center := 8, support := {11, 13} },
        { center := 11, support := {0, 5} }, { center := 12, support := {1, 5} }]
    reverseChoices := [{ center := 4, support := {11, 15} },
        { center := 5, support := {11, 16} }, { center := 8, support := {3, 5} },
        { center := 15, support := {5, 16} }, { center := 16, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨1, 5, 11, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(5, 11), [.flip 5 11, .row 11 5 0, .flip 11 0], (0, 11)⟩
      path1 := ⟨(1, 12), [.flip 1 12, .row 12 1 5, .flip 12 5], (5, 12)⟩
      path2 := ⟨(8, 11), [.row 8 11 13], (8, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 1, .flip 0 1, .row 1 0 11], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 8, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(5, 8), [.flip 5 8, .row 8 5 3, .flip 8 3], (3, 8)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 15, .flip 16 15,
        .row 15 16 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(5, 11), [.row 5 11 16], (5, 16)⟩
      path3 := ⟨(4, 15), [.row 4 15 11], (4, 11)⟩ } }

def v5CanaryCancellationOccurrences : List CancellationOccurrence :=
  [v5CanaryCancellationOccurrence0, v5CanaryCancellationOccurrence1,
    v5CanaryCancellationOccurrence2, v5CanaryCancellationOccurrence3,
    v5CanaryCancellationOccurrence4, v5CanaryCancellationOccurrence5,
    v5CanaryCancellationOccurrence6, v5CanaryCancellationOccurrence7]

theorem v5CanaryCancellationOccurrences_length :
    v5CanaryCancellationOccurrences.length = 8 := by
  native_decide

theorem v5CanaryCancellationOccurrences_all_check :
    v5CanaryCancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v5CanaryTwoKalmansonOrbitClauses : Std.Sat.CNF Atom :=
  v5CanaryCancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v5CanaryTwoKalmansonOrbitClauses_length :
    v5CanaryTwoKalmansonOrbitClauses.length = 32 := by
  native_decide

theorem v5CanaryTwoKalmansonOrbitClauses_nodup :
    v5CanaryTwoKalmansonOrbitClauses.Nodup := by
  native_decide

theorem sourceAssign_v5CanaryTwoKalmansonOrbitClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v5CanaryTwoKalmansonOrbitClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v5CanaryTwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v5CanaryCancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def v5CanaryTwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  [ occurrenceClause v5CanaryCancellationOccurrence0.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence1.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence1.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence2.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence2.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence2.hits 1 .reverse,
    occurrenceClause v5CanaryCancellationOccurrence3.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence3.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence3.hits 1 .reverse,
    occurrenceClause v5CanaryCancellationOccurrence4.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence4.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence5.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence5.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence6.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence6.hits 0 .reverse,
    occurrenceClause v5CanaryCancellationOccurrence6.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence6.hits 1 .reverse,
    occurrenceClause v5CanaryCancellationOccurrence7.hits 0 .forward,
    occurrenceClause v5CanaryCancellationOccurrence7.hits 1 .forward,
    occurrenceClause v5CanaryCancellationOccurrence7.hits 1 .reverse ]

theorem v5CanaryTwoKalmansonRefinementClauses_length :
    v5CanaryTwoKalmansonRefinementClauses.length = 20 := by
  native_decide

theorem v5CanaryTwoKalmansonRefinementClauses_nodup :
    v5CanaryTwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem v5CanaryTwoKalmansonRefinementClauses_subset_orbit :
    ∀ clause ∈ v5CanaryTwoKalmansonRefinementClauses,
      clause ∈ v5CanaryTwoKalmansonOrbitClauses := by
  native_decide

theorem sourceAssign_v5CanaryTwoKalmansonRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ v5CanaryTwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v5CanaryTwoKalmansonOrbitClauses source clause
    (v5CanaryTwoKalmansonRefinementClauses_subset_orbit clause hclause)

def canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf ++
    v5CanaryTwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf.length =
      7409780 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf_length,
    v5CanaryTwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v5CanaryTwoKalmansonRefinementClauses source clause hsuffix

#print axioms v5CanaryCancellationOccurrences_all_check
#print axioms sourceAssign_v5CanaryTwoKalmansonOrbitClauses
#print axioms v5CanaryTwoKalmansonRefinementClauses_subset_orbit
#print axioms sourceAssign_v5CanaryTwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements
end Problem97
