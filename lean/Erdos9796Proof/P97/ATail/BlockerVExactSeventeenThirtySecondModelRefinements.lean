/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySecondTwoCircleRefinement
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySecondKalmansonRefinement

/-!
# Source-valid refinements mined from exact-seventeen child 32

The independently replayed child-32 model contains two new source-valid
four-clause families: a two-circle bisector-order obstruction and a checked
two-Kalmanson cancellation occurrence.  The equality-only convex-five
candidate is deliberately excluded because its two induced determinant signs
are opposite, so the existing convex-five consumer does not apply.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySecondModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtyFirstModelRefinements
open ATailBlockerVExactSeventeenThirtySecondTwoCircleRefinement
open ATailBlockerVExactSeventeenThirtySecondKalmansonRefinement

def thirtySecondModelRefinementClauses : Std.Sat.CNF Atom :=
  child32TwoCircleClauses ++ canonicalClauses

theorem thirtySecondModelRefinementClauses_length :
    thirtySecondModelRefinementClauses.length = 8 := by
  simp only [thirtySecondModelRefinementClauses, List.length_append,
    child32TwoCircleClauses_length, canonicalClauses_length]

theorem sourceAssign_thirtySecondModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtySecondModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirtySecondModelRefinementClauses, List.mem_append] at hclause
  rcases hclause with htwoCircle | hkalmanson
  · exact sourceAssign_child32TwoCircleClauses source clause htwoCircle
  · exact sourceAssign_canonicalClauses source clause hkalmanson

def extendedThirtySecondModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyFirstModelRefinementsCnf ++ thirtySecondModelRefinementClauses

theorem extendedThirtySecondModelRefinementsCnf_length :
    extendedThirtySecondModelRefinementsCnf.length = 5847248 := by
  simp only [extendedThirtySecondModelRefinementsCnf, List.length_append,
    extendedThirtyFirstModelRefinementsCnf_length,
    thirtySecondModelRefinementClauses_length]

theorem sourceAssign_extendedThirtySecondModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtySecondModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtySecondModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyFirstModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtySecondModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtySecondModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtySecondModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtySecondModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtySecondModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtySecondModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtySecondModelRefinements
end Problem97
