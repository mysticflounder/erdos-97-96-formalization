/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard3
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard4
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard5
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinementsShard6

/-!
# Child40 source-valid two-Kalmanson cancellation bank

The authenticated Child39 model contributes 49 new subset-minimal
occurrences. The seven shards contain their complete four-clause
order/orientation orbits, extending the Child39 root by 196 clauses.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyNinthModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenThirtyEighthModelRefinements

def thirtyNinthModelRefinementClauses : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard3.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard6.refinementClauses

theorem thirtyNinthModelRefinementClauses_length :
    thirtyNinthModelRefinementClauses.length = 196 := by
  simp only [thirtyNinthModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard3.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard6.refinementClauses_length]

theorem sourceAssign_thirtyNinthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ thirtyNinthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    (((((ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0.refinementClauses ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1.refinementClauses) ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard2.refinementClauses) ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard3.refinementClauses) ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4.refinementClauses) ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5.refinementClauses) ++
      ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard6.refinementClauses at hclause
  have hsplit6 := List.mem_append.mp hclause
  rcases hsplit6 with hleft | h6
  · have hsplit5 := List.mem_append.mp hleft
    rcases hsplit5 with hleft | h5
    · have hsplit4 := List.mem_append.mp hleft
      rcases hsplit4 with hleft | h4
      · have hsplit3 := List.mem_append.mp hleft
        rcases hsplit3 with hleft | h3
        · have hsplit2 := List.mem_append.mp hleft
          rcases hsplit2 with hleft | h2
          · have hsplit1 := List.mem_append.mp hleft
            rcases hsplit1 with h0 | h1
            · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
            · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
          · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
        · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard3.sourceAssign_refinementClauses source clause h3
      · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard4.sourceAssign_refinementClauses source clause h4
    · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard5.sourceAssign_refinementClauses source clause h5
  · exact ATailBlockerVExactSeventeenThirtyNinthModelRefinementsShard6.sourceAssign_refinementClauses source clause h6

def extendedThirtyNinthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyEighthModelRefinementsCnf ++ thirtyNinthModelRefinementClauses

theorem extendedThirtyNinthModelRefinementsCnf_length :
    extendedThirtyNinthModelRefinementsCnf.length = 5847584 := by
  simp only [extendedThirtyNinthModelRefinementsCnf, List.length_append,
    extendedThirtyEighthModelRefinementsCnf_length,
    thirtyNinthModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyNinthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model) extendedThirtyNinthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyNinthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyEighthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyNinthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyNinthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyNinthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model, sourceAssign_extendedThirtyNinthModelRefinementsCnf source⟩

#print axioms sourceAssign_thirtyNinthModelRefinementClauses
#print axioms sourceAssign_extendedThirtyNinthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyNinthModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenThirtyNinthModelRefinements
end Problem97
