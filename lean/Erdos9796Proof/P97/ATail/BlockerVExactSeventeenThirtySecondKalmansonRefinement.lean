/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Canonical child-32 two-Kalmanson occurrence

This is the six-hit support selected by the source-faithful child-32 replay.
The two records below are the first checked forward/reverse producer records
for named order 0, projected to their positive row incidences.  The extra
five-point/three-selected-row diagnostic family is intentionally not included:
it has a different consumer and is not a two-Kalmanson occurrence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySecondKalmansonRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def canonicalHits : List Hit :=
  [(0, 13), (0, 16), (3, 15), (3, 16), (7, 13), (7, 15)]

def canonicalOccurrence : CancellationOccurrence :=
  { hits := canonicalHits
    forwardChoices := [{ center := 0, support := {13, 16} },
      { center := 3, support := {15, 16} },
      { center := 7, support := {13, 15} }]
    reverseChoices := [{ center := 9, support := {1, 3} },
      { center := 13, support := {0, 1} },
      { center := 16, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨0, 3, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(3, 13), [], (3, 13)⟩
      path1 := ⟨(0, 16), [.row 0 16 13], (0, 13)⟩
      path2 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path3 := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 13), [], (3, 13)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ } }

theorem canonicalOccurrence_check :
    canonicalOccurrence.check = true := by
  native_decide

def canonicalClauses : Std.Sat.CNF Atom :=
  occurrenceClauses canonicalHits

theorem canonicalClauses_length : canonicalClauses.length = 4 := by
  native_decide

theorem sourceAssign_canonicalClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ canonicalClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  change ∀ clause ∈
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses
      canonicalHits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true
  intro clause hclause
  simp only [ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, hclauseEq⟩ := hclause
  rw [← hclauseEq]
  exact sourceAssign_cancellationOccurrenceClause source canonicalOccurrence
    canonicalOccurrence_check order direction

#print axioms canonicalOccurrence_check
#print axioms sourceAssign_canonicalClauses

end ATailBlockerVExactSeventeenThirtySecondKalmansonRefinement
end Problem97
