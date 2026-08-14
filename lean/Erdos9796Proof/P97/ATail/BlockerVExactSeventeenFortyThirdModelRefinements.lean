/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard3
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard4
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinementsShard5

/-! Child44 source-checked two-Kalmanson suffix (57 supports, 228 clauses). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyThirdModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortySecondModelRefinements

def fortyThirdModelRefinementClauses : Std.Sat.CNF Atom :=
  (((((ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard4.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5.refinementClauses)

theorem fortyThirdModelRefinementClauses_length :
    fortyThirdModelRefinementClauses.length = 228 := by
  simp only [fortyThirdModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard4.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5.refinementClauses_length]

theorem sourceAssign_fortyThirdModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyThirdModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ (((((ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard4.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5.refinementClauses) at hclause
  rcases List.mem_append.mp hclause with h0to4 | h5
  · rcases List.mem_append.mp h0to4 with h0to3 | h4
    · rcases List.mem_append.mp h0to3 with h0to2 | h3
      · rcases List.mem_append.mp h0to2 with h0to1 | h2
        · rcases List.mem_append.mp h0to1 with h0 | h1
          · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
          · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
        · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
      · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard3.sourceAssign_refinementClauses source clause h3
    · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard4.sourceAssign_refinementClauses source clause h4
  · exact ATailBlockerVExactSeventeenFortyThirdModelRefinementsShard5.sourceAssign_refinementClauses source clause h5

def extendedFortyThirdModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortySecondModelRefinementsCnf ++ fortyThirdModelRefinementClauses

theorem extendedFortyThirdModelRefinementsCnf_length :
    extendedFortyThirdModelRefinementsCnf.length = 5848820 := by
  simp only [extendedFortyThirdModelRefinementsCnf, List.length_append,
    extendedFortySecondModelRefinementsCnf_length,
    fortyThirdModelRefinementClauses_length]

theorem sourceAssign_extendedFortyThirdModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyThirdModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyThirdModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortySecondModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyThirdModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyThirdModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyThirdModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyThirdModelRefinementsCnf source⟩

#print axioms sourceAssign_fortyThirdModelRefinementClauses
#print axioms sourceAssign_extendedFortyThirdModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyThirdModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortyThirdModelRefinements
end Problem97
