/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFourthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement
import Erdos9796Proof.P97.ListCNF

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

/-- Finite V-exact-seventeen model-refinement def. -/
def thirtyFifthModelRefinementClauses : ListCNF Atom :=
  child35CanonicalPerpBisectorClauses

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem thirtyFifthModelRefinementClauses_length :
    thirtyFifthModelRefinementClauses.length = 4 := by
  simpa only [thirtyFifthModelRefinementClauses] using
    child35CanonicalPerpBisectorClauses_length

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem sourceAssign_thirtyFifthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyFifthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_child35CanonicalPerpBisectorClauses source clause hclause

/-- Finite V-exact-seventeen model-refinement def. -/
def extendedThirtyFifthModelRefinementsCnf : ListCNF Atom :=
  extendedThirtyFourthModelRefinementsCnf ++ thirtyFifthModelRefinementClauses

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem extendedThirtyFifthModelRefinementsCnf_length :
    extendedThirtyFifthModelRefinementsCnf.length = 5847264 := by
  simp only [extendedThirtyFifthModelRefinementsCnf, List.length_append,
    extendedThirtyFourthModelRefinementsCnf_length,
    thirtyFifthModelRefinementClauses_length]

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem sourceAssign_extendedThirtyFifthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedThirtyFifthModelRefinementsCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyFifthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyFourthModelRefinementsCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyFifthModelRefinementClauses source clause hsuffix

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem false_of_sourceRealization_of_extendedThirtyFifthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment extendedThirtyFifthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyFifthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyFifthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyFifthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtyFifthModelRefinements
end Problem97
