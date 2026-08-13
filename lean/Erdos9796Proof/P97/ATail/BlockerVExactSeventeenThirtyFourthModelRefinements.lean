/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyThirdModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFourthPerpendicularBisectorRefinement

/-!
# Source-valid refinement mined from exact-seventeen child 34

The independently replayed child-34 model contains a new three-witness
perpendicular-bisector occurrence with foci `3,13` and witnesses `1,4,12`.
Its checked SourceRealization bridge supplies the four named-order/orientation
clauses added here.  The other child-34 diagnostics remain excluded until they
receive their own source bridges.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFourthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtyThirdModelRefinements
open ATailBlockerVExactSeventeenThirtyFourthPerpendicularBisectorRefinement

def thirtyFourthModelRefinementClauses : Std.Sat.CNF Atom :=
  child34PerpBisectorClauses

theorem thirtyFourthModelRefinementClauses_length :
    thirtyFourthModelRefinementClauses.length = 4 := by
  simpa only [thirtyFourthModelRefinementClauses] using child34PerpBisectorClauses_length

theorem sourceAssign_thirtyFourthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyFourthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_child34PerpBisectorClauses source clause hclause

def extendedThirtyFourthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyThirdModelRefinementsCnf ++ thirtyFourthModelRefinementClauses

theorem extendedThirtyFourthModelRefinementsCnf_length :
    extendedThirtyFourthModelRefinementsCnf.length = 5847260 := by
  simp only [extendedThirtyFourthModelRefinementsCnf, List.length_append,
    extendedThirtyThirdModelRefinementsCnf_length,
    thirtyFourthModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyFourthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtyFourthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyFourthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyThirdModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyFourthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyFourthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyFourthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyFourthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyFourthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyFourthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtyFourthModelRefinements
end Problem97
