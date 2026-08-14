/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinementsShard3
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySecondModelRefinementsShard4

/-! Child43 source-checked two-Kalmanson suffix (35 supports, 140 clauses). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortySecondModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyFirstModelRefinements

def fortySecondModelRefinementClauses : Std.Sat.CNF Atom :=
  ((((ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4.refinementClauses)

theorem fortySecondModelRefinementClauses_length :
    fortySecondModelRefinementClauses.length = 140 := by
  simp only [fortySecondModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3.refinementClauses_length,
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4.refinementClauses_length]

theorem sourceAssign_fortySecondModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortySecondModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ ((((ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4.refinementClauses) at hclause
  rcases List.mem_append.mp hclause with h0to3 | h4
  · rcases List.mem_append.mp h0to3 with h0to2 | h3
    · rcases List.mem_append.mp h0to2 with h0to1 | h2
      · rcases List.mem_append.mp h0to1 with h0 | h1
        · exact ATailBlockerVExactSeventeenFortySecondModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
        · exact ATailBlockerVExactSeventeenFortySecondModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
      · exact ATailBlockerVExactSeventeenFortySecondModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
    · exact ATailBlockerVExactSeventeenFortySecondModelRefinementsShard3.sourceAssign_refinementClauses source clause h3
  · exact ATailBlockerVExactSeventeenFortySecondModelRefinementsShard4.sourceAssign_refinementClauses source clause h4

def extendedFortySecondModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyFirstModelRefinementsCnf ++ fortySecondModelRefinementClauses

theorem extendedFortySecondModelRefinementsCnf_length :
    extendedFortySecondModelRefinementsCnf.length = 5848592 := by
  simp only [extendedFortySecondModelRefinementsCnf, List.length_append,
    extendedFortyFirstModelRefinementsCnf_length,
    fortySecondModelRefinementClauses_length]

theorem sourceAssign_extendedFortySecondModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortySecondModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortySecondModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyFirstModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortySecondModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortySecondModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortySecondModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortySecondModelRefinementsCnf source⟩

#print axioms sourceAssign_fortySecondModelRefinementClauses
#print axioms sourceAssign_extendedFortySecondModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortySecondModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortySecondModelRefinements
end Problem97
