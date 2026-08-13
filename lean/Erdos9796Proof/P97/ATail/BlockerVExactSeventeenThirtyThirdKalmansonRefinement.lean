/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Paired child-33 two-Kalmanson occurrence

This is the source-valid paired occurrence selected from the child-33 model.
The base hits are the deduplicated union of the forward record and the
`Fin.rev` transport of its reverse record.  The occurrence checker validates
both equality-closure records; the inherited occurrence theorem then proves
the complete two-order, two-orientation clause orbit for every
`SourceRealization`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyThirdKalmansonRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def pairedKalmansonHits : List Hit :=
  [(0, 2), (0, 8), (10, 2), (10, 3), (9, 3), (9, 8),
    (16, 15), (16, 14), (14, 11), (14, 9), (9, 14),
    (5, 16), (5, 9), (3, 16), (3, 15), (15, 11), (15, 3)]

theorem pairedKalmansonHits_length : pairedKalmansonHits.length = 17 := by
  native_decide

theorem pairedKalmansonHits_nodup : pairedKalmansonHits.Nodup := by
  native_decide

def pairedKalmansonOccurrence : CancellationOccurrence :=
  { hits := pairedKalmansonHits
    forwardChoices := [{ center := 0, support := {2, 8} },
      { center := 10, support := {2, 3} },
      { center := 9, support := {3, 8} }]
    reverseChoices := [{ center := 0, support := {1, 2} },
      { center := 2, support := {5, 7} },
      { center := 7, support := {2, 13} },
      { center := 11, support := {0, 7} },
      { center := 13, support := {0, 1} },
      { center := 1, support := {5, 13} }]
    forwardData := {
      firstQuad := ⟨0, 2, 3, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 8], (0, 8)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(0, 3), [], (0, 3)⟩
      path3 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 2, 5⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 7, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 2], (0, 2)⟩
      path1 := ⟨(2, 5), [.row 2 5 7, .flip 2 7, .row 7 2 13], (7, 13)⟩
      path2 := ⟨(7, 11), [.flip 7 11, .row 11 7 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1,
        .row 1 13 5], (1, 5)⟩ } }

theorem pairedKalmansonOccurrence_check :
    pairedKalmansonOccurrence.check = true := by
  native_decide

def pairedKalmansonClauses : Std.Sat.CNF Atom :=
  occurrenceClauses pairedKalmansonHits

theorem pairedKalmansonClauses_length : pairedKalmansonClauses.length = 4 := by
  native_decide

theorem sourceAssign_pairedKalmansonClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ pairedKalmansonClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  change ∀ clause ∈
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses
      pairedKalmansonHits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true
  intro clause hclause
  simp only [ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, hclauseEq⟩ := hclause
  rw [← hclauseEq]
  exact sourceAssign_cancellationOccurrenceClause source pairedKalmansonOccurrence
    pairedKalmansonOccurrence_check order direction

#print axioms pairedKalmansonOccurrence_check
#print axioms pairedKalmansonHits_length
#print axioms pairedKalmansonHits_nodup
#print axioms pairedKalmansonClauses_length
#print axioms sourceAssign_pairedKalmansonClauses

end ATailBlockerVExactSeventeenThirtyThirdKalmansonRefinement
end Problem97
