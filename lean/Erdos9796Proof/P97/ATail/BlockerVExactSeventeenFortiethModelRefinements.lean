/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard3
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard4
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard5
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard6
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard7
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard8
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard9
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard10
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortiethModelRefinementsShard11

/-! # Child41 source-checked cancellation refinements

The authenticated Child40 SAT model exposes 84 subset-minimal occurrences of
the generic two-Kalmanson cancellation theorem. Their 336 order/orientation
nogoods extend the immutable Child40 root for the next exact-seventeen query.
-/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortiethModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtyNinthModelRefinements

def fortiethModelRefinementClauses : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenFortiethModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard3.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard4.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard5.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard6.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard7.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard8.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard9.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard10.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard11.refinementClauses

theorem fortiethModelRefinementClauses_length :
    fortiethModelRefinementClauses.length = 336 := by
  simp only [fortiethModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard3.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard4.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard5.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard6.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard7.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard8.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard9.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard10.refinementClauses_length,
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard11.refinementClauses_length]

theorem sourceAssign_fortiethModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortiethModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ ATailBlockerVExactSeventeenFortiethModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard3.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard4.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard5.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard6.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard7.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard8.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard9.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard10.refinementClauses ++
    ATailBlockerVExactSeventeenFortiethModelRefinementsShard11.refinementClauses at hclause
  rcases List.mem_append.mp hclause with h0to10 | h11
  · rcases List.mem_append.mp h0to10 with h0to9 | h10
    · rcases List.mem_append.mp h0to9 with h0to8 | h9
      · rcases List.mem_append.mp h0to8 with h0to7 | h8
        · rcases List.mem_append.mp h0to7 with h0to6 | h7
          · rcases List.mem_append.mp h0to6 with h0to5 | h6
            · rcases List.mem_append.mp h0to5 with h0to4 | h5
              · rcases List.mem_append.mp h0to4 with h0to3 | h4
                · rcases List.mem_append.mp h0to3 with h0to2 | h3
                  · rcases List.mem_append.mp h0to2 with h0to1 | h2
                    · rcases List.mem_append.mp h0to1 with h0 | h1
                      · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
                      · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
                    · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
                  · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard3.sourceAssign_refinementClauses source clause h3
                · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard4.sourceAssign_refinementClauses source clause h4
              · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard5.sourceAssign_refinementClauses source clause h5
            · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard6.sourceAssign_refinementClauses source clause h6
          · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard7.sourceAssign_refinementClauses source clause h7
        · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard8.sourceAssign_refinementClauses source clause h8
      · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard9.sourceAssign_refinementClauses source clause h9
    · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard10.sourceAssign_refinementClauses source clause h10
  · exact ATailBlockerVExactSeventeenFortiethModelRefinementsShard11.sourceAssign_refinementClauses source clause h11

def extendedFortiethModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyNinthModelRefinementsCnf ++ fortiethModelRefinementClauses

theorem extendedFortiethModelRefinementsCnf_length :
    extendedFortiethModelRefinementsCnf.length = 5847920 := by
  simp only [extendedFortiethModelRefinementsCnf, List.length_append,
    extendedThirtyNinthModelRefinementsCnf_length,
    fortiethModelRefinementClauses_length]

theorem sourceAssign_extendedFortiethModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortiethModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortiethModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyNinthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortiethModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortiethModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortiethModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedFortiethModelRefinementsCnf source⟩

#print axioms sourceAssign_fortiethModelRefinementClauses
#print axioms sourceAssign_extendedFortiethModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortiethModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortiethModelRefinements
end Problem97
