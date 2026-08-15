/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFirstModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFirstModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFirstModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFirstModelRefinementsShard3

/-!
# Complete new minimal cancellation family from exact-seventeen child 31

The authenticated child-31 model has 237 checked two-Kalmanson cancellation
certificates. Their 135 distinct positive-incidence supports have 84
subset-minimal members, none subsumed by the child-30 bank. The four imported
shards prove all 84 occurrences and their 336 order/orientation nogoods.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFirstModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtiethModelRefinements

def thirtyFirstModelRefinementClauses : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.refinementClauses

theorem thirtyFirstModelRefinementClauses_length :
    thirtyFirstModelRefinementClauses.length = 336 := by
  simp only [thirtyFirstModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.refinementClauses_length]

theorem sourceAssign_thirtyFirstModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyFirstModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.refinementClauses at hclause
  rcases List.mem_append.mp hclause with h012 | h3
  · rcases List.mem_append.mp h012 with h01 | h2
    · rcases List.mem_append.mp h01 with h0 | h1
      · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
      · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
    · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
  · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.sourceAssign_refinementClauses source clause h3

def extendedThirtyFirstModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtiethModelRefinementsCnf ++ thirtyFirstModelRefinementClauses

theorem extendedThirtyFirstModelRefinementsCnf_length :
    extendedThirtyFirstModelRefinementsCnf.length = 5847240 := by
  simp only [extendedThirtyFirstModelRefinementsCnf, List.length_append,
    extendedThirtiethModelRefinementsCnf_length,
    thirtyFirstModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyFirstModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtyFirstModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyFirstModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtiethModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyFirstModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyFirstModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyFirstModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyFirstModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyFirstModelRefinementsCnf

end ATailBlockerVExactSeventeenThirtyFirstModelRefinements
end Problem97
