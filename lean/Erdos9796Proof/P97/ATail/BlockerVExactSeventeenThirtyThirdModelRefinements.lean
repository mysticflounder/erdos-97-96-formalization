/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySecondModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyThirdKalmansonRefinement
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyThirdPerpendicularBisectorRefinement

/-!
# Source-valid refinements mined from exact-seventeen child 33

The independently replayed child-33 model contains two new source-valid
four-clause families: a checked paired two-Kalmanson cancellation occurrence
and a checked perpendicular-bisector occurrence.  The apparent two-circle and
convex-five patterns are deliberately excluded: in each case the two required
determinant signs are opposite, so the existing same-side consumers do not
apply.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyThirdModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtySecondModelRefinements
open ATailBlockerVExactSeventeenThirtyThirdKalmansonRefinement
open ATailBlockerVExactSeventeenThirtyThirdPerpendicularBisectorRefinement

def thirtyThirdModelRefinementClauses : Std.Sat.CNF Atom :=
  pairedKalmansonClauses ++ child33PerpBisectorClauses

theorem thirtyThirdModelRefinementClauses_length :
    thirtyThirdModelRefinementClauses.length = 8 := by
  simp only [thirtyThirdModelRefinementClauses, List.length_append,
    pairedKalmansonClauses_length, child33PerpBisectorClauses_length]

theorem sourceAssign_thirtyThirdModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyThirdModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirtyThirdModelRefinementClauses, List.mem_append] at hclause
  rcases hclause with hpaired | hperp
  · exact sourceAssign_pairedKalmansonClauses source clause hpaired
  · exact sourceAssign_child33PerpBisectorClauses source clause hperp

def extendedThirtyThirdModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtySecondModelRefinementsCnf ++ thirtyThirdModelRefinementClauses

theorem extendedThirtyThirdModelRefinementsCnf_length :
    extendedThirtyThirdModelRefinementsCnf.length = 5847256 := by
  simp only [extendedThirtyThirdModelRefinementsCnf, List.length_append,
    extendedThirtySecondModelRefinementsCnf_length,
    thirtyThirdModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyThirdModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtyThirdModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyThirdModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtySecondModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyThirdModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyThirdModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyThirdModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyThirdModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyThirdModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyThirdModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtyThirdModelRefinements
end Problem97
