/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFourthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement

/-!
# Source-valid refinement mined from exact-seventeen child 35

This child appends the correctly canonicalized four-clause orbit of the
perpendicular-bisector occurrence found in the authenticated child-35 model.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFifthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtyFourthModelRefinements
open ATailBlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement

def thirtyFifthModelRefinementClauses : Std.Sat.CNF Atom :=
  child35CanonicalPerpBisectorClauses

theorem thirtyFifthModelRefinementClauses_length :
    thirtyFifthModelRefinementClauses.length = 4 := by
  simpa only [thirtyFifthModelRefinementClauses] using
    child35CanonicalPerpBisectorClauses_length

theorem sourceAssign_thirtyFifthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyFifthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_child35CanonicalPerpBisectorClauses source clause hclause

def extendedThirtyFifthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyFourthModelRefinementsCnf ++ thirtyFifthModelRefinementClauses

theorem extendedThirtyFifthModelRefinementsCnf_length :
    extendedThirtyFifthModelRefinementsCnf.length = 5847264 := by
  simp only [extendedThirtyFifthModelRefinementsCnf, List.length_append,
    extendedThirtyFourthModelRefinementsCnf_length,
    thirtyFifthModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyFifthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtyFifthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyFifthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyFourthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyFifthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyFifthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyFifthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyFifthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyFifthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyFifthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtyFifthModelRefinements
end Problem97
