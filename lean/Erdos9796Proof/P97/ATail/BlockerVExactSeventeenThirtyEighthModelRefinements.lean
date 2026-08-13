/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinementsShard3

/-! # Child38 authenticated subset-minimal six-hit cancellation bank

The four shards contain 28 source-checked occurrences and 112 complete
order/orientation clauses, extending the Lean-owned Child37 root.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyEighthModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenThirtySeventhModelRefinements

def thirtyEighthModelRefinementClauses : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.refinementClauses

theorem thirtyEighthModelRefinementClauses_length :
    thirtyEighthModelRefinementClauses.length = 112 := by
  simp only [thirtyEighthModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.refinementClauses_length]

theorem sourceAssign_thirtyEighthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ thirtyEighthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.refinementClauses at hclause
  rcases List.mem_append.mp hclause with h012 | h3
  · rcases List.mem_append.mp h012 with h01 | h2
    · rcases List.mem_append.mp h01 with h0 | h1
      · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
      · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
    · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
  · exact ATailBlockerVExactSeventeenThirtyEighthModelRefinementsShard3.sourceAssign_refinementClauses source clause h3

def extendedThirtyEighthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtySeventhModelRefinementsCnf ++ thirtyEighthModelRefinementClauses

theorem extendedThirtyEighthModelRefinementsCnf_length :
    extendedThirtyEighthModelRefinementsCnf.length = 5847388 := by
  simp only [extendedThirtyEighthModelRefinementsCnf, List.length_append,
    extendedThirtySeventhModelRefinementsCnf_length,
    thirtyEighthModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyEighthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model) extendedThirtyEighthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyEighthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtySeventhModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyEighthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyEighthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyEighthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model, sourceAssign_extendedThirtyEighthModelRefinementsCnf source⟩

#print axioms sourceAssign_thirtyEighthModelRefinementClauses
#print axioms sourceAssign_extendedThirtyEighthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtyEighthModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenThirtyEighthModelRefinements
end Problem97
