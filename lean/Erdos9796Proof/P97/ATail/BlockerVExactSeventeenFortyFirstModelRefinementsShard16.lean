/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinements

/-! Child42 two-Kalmanson cancellation bank, source-checked shard 16. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(3, 4), (3, 16), (5, 3), (5, 15), (10, 2), (10, 3), (11, 14), (11, 15), (13, 4), (13, 5), (14, 11), (14, 16), (15, 5), (15, 11), (16, 2), (16, 14)]
    forwardChoices := [{ center := 3, support := {4, 16} },
        { center := 5, support := {3, 15} },
        { center := 10, support := {2, 3} },
        { center := 11, support := {14, 15} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {2, 14} }]
    reverseChoices := [{ center := 0, support := {2, 14} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {0, 5} },
        { center := 3, support := {11, 12} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {13, 14} },
        { center := 11, support := {1, 13} },
        { center := 13, support := {0, 12} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14, .row 14 16 11, .flip 14 11, .row 11 14 15, .flip 11 15, .row 15 11 5, .flip 15 5, .row 5 15 3, .flip 5 3], (3, 5)⟩
      path2 := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 11, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(0, 14), [.row 0 14 2, .flip 0 2, .row 2 0 5, .flip 2 5, .row 5 2 1, .flip 5 1, .row 1 5 11, .flip 1 11, .row 11 1 13], (11, 13)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(5, 8), (5, 15), (8, 3), (8, 9), (9, 8), (9, 14), (10, 2), (10, 3), (11, 14), (11, 15), (14, 9), (14, 11), (15, 5), (15, 11), (16, 2), (16, 5)]
    forwardChoices := [{ center := 5, support := {8, 15} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 10, support := {2, 3} },
        { center := 11, support := {14, 15} },
        { center := 14, support := {9, 11} },
        { center := 15, support := {5, 11} },
        { center := 16, support := {2, 5} }]
    reverseChoices := [{ center := 0, support := {11, 14} },
        { center := 1, support := {5, 11} },
        { center := 2, support := {5, 7} },
        { center := 5, support := {1, 2} },
        { center := 6, support := {13, 14} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 11, support := {1, 8} }]
    forwardData := {
      firstQuad := ⟨2, 3, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 5, .flip 16 5], (5, 16)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 9, .flip 14 9, .row 9 14 8, .flip 9 8, .row 8 9 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 16), [], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 6, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(6, 11), [], (6, 11)⟩
      path1 := ⟨(0, 14), [.row 0 14 11], (0, 11)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 7, .flip 2 7, .row 7 2 8, .flip 7 8, .row 8 7 13], (8, 13)⟩
      path3 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩ } },
  { hits := [(0, 3), (0, 12), (0, 16), (3, 4), (3, 15), (8, 3), (8, 12), (11, 14), (11, 15), (12, 0), (12, 4), (14, 11), (14, 16), (15, 11), (15, 12), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {3, 12, 16} },
        { center := 3, support := {4, 15} },
        { center := 8, support := {3, 12} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 4} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {11, 12} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {4, 5} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {12, 16} },
        { center := 5, support := {1, 2} },
        { center := 8, support := {4, 13} },
        { center := 13, support := {1, 12} },
        { center := 16, support := {0, 4, 13} }]
    forwardData := {
      firstQuad := ⟨0, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 3), [.row 0 3 12], (0, 12)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 4, .flip 12 4], (4, 12)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 8, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(1, 4), [.row 1 4 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 12], (4, 12)⟩
      path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 4, .flip 16 4], (4, 16)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (1, 4), (1, 13), (2, 12), (2, 13), (3, 4), (3, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {4, 13} },
        { center := 2, support := {12, 13} },
        { center := 3, support := {4, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 13, support := {1, 12} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 12} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 3, 4, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 12, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩ } },
  { hits := [(0, 12), (0, 16), (1, 8), (1, 13), (2, 12), (2, 13), (5, 8), (5, 15), (11, 14), (11, 15), (12, 0), (12, 1), (14, 11), (14, 16), (15, 1), (15, 11), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {8, 13} },
        { center := 2, support := {12, 13} },
        { center := 5, support := {8, 15} },
        { center := 11, support := {14, 15} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 15, support := {1, 11} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 1, support := {5, 15} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {1, 2} },
        { center := 11, support := {1, 8} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 5, 8, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(5, 8), [.row 5 8 15], (5, 15)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1], (1, 11)⟩
      path3 := ⟨(1, 15), [.row 1 15 5, .flip 1 5, .row 5 1 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩ } },
  { hits := [(0, 12), (0, 16), (1, 8), (1, 13), (2, 12), (2, 13), (8, 3), (8, 9), (9, 8), (9, 14), (10, 1), (10, 3), (12, 0), (12, 1), (14, 9), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {8, 13} },
        { center := 2, support := {12, 13} },
        { center := 8, support := {3, 9} },
        { center := 9, support := {8, 14} },
        { center := 10, support := {1, 3} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {9, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 7} },
        { center := 4, support := {15, 16} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {2, 8} },
        { center := 8, support := {7, 13} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 8} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨1, 3, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 9, .flip 8 9, .row 9 8 14, .flip 9 14, .row 14 9 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path1 := ⟨(1, 10), [.flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 8], (1, 8)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 8, .flip 15 8], (8, 15)⟩
      path2 := ⟨(8, 13), [.row 8 13 7, .flip 8 7, .row 7 8 2, .flip 7 2, .row 2 7 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(6, 15), [.row 6 15 13], (6, 13)⟩ } },
  { hits := [(0, 12), (0, 16), (1, 10), (1, 13), (2, 12), (2, 13), (4, 2), (4, 11), (10, 1), (10, 2), (11, 10), (11, 14), (12, 0), (12, 1), (14, 11), (14, 16), (16, 0), (16, 14)]
    forwardChoices := [{ center := 0, support := {12, 16} },
        { center := 1, support := {10, 13} },
        { center := 2, support := {12, 13} },
        { center := 4, support := {2, 11} },
        { center := 10, support := {1, 2} },
        { center := 11, support := {10, 14} },
        { center := 12, support := {0, 1} },
        { center := 14, support := {11, 16} },
        { center := 16, support := {0, 14} }]
    reverseChoices := [{ center := 0, support := {2, 16} },
        { center := 2, support := {0, 5} },
        { center := 4, support := {15, 16} },
        { center := 5, support := {2, 6} },
        { center := 6, support := {14, 15} },
        { center := 12, support := {5, 14} },
        { center := 14, support := {3, 4} },
        { center := 15, support := {3, 6} },
        { center := 16, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨2, 4, 10, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩
      path1 := ⟨(10, 11), [.flip 10 11, .row 11 10 14, .flip 11 14, .row 14 11 16, .flip 14 16, .row 16 14 0, .flip 16 0, .row 0 16 12, .flip 0 12, .row 12 0 1, .flip 12 1], (1, 12)⟩
      path2 := ⟨(2, 12), [.row 2 12 13], (2, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10, .flip 1 10, .row 10 1 2, .flip 10 2], (2, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 14), [.flip 4 14, .row 14 4 3, .flip 14 3], (3, 14)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6, .row 6 15 14], (6, 14)⟩
      path2 := ⟨(5, 6), [.row 5 6 2, .flip 5 2, .row 2 5 0, .flip 2 0, .row 0 2 16, .flip 0 16, .row 16 0 4, .flip 16 4, .row 4 16 15], (4, 15)⟩
      path3 := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩ } }
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 7 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 28 := by
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
end ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16
end Problem97
