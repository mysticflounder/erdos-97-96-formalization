/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard0
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard1
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard3
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard4
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard5
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard6
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard7
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard8
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard9
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard10
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard11
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard12
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard13
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard14
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard15
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard16
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard17
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFirstModelRefinementsShard18

/-! Child42 source-checked two-Kalmanson suffix (133 supports, 532 clauses). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFirstModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortiethModelRefinements

def fortyFirstModelRefinementClauses : Std.Sat.CNF Atom :=
  ((((((((((((((((((ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard5.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard9.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard11.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard13.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard18.refinementClauses)

theorem fortyFirstModelRefinementClauses_length :
    fortyFirstModelRefinementClauses.length = 532 := by
  simp only [fortyFirstModelRefinementClauses, List.length_append,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard5.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard9.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard11.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard13.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17.refinementClauses_length,
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard18.refinementClauses_length]

theorem sourceAssign_fortyFirstModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyFirstModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈ ((((((((((((((((((ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard5.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard9.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard11.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard13.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17.refinementClauses) ++
    ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard18.refinementClauses) at hclause
  rcases List.mem_append.mp hclause with h0to17 | h18
  · rcases List.mem_append.mp h0to17 with h0to16 | h17
    · rcases List.mem_append.mp h0to16 with h0to15 | h16
      · rcases List.mem_append.mp h0to15 with h0to14 | h15
        · rcases List.mem_append.mp h0to14 with h0to13 | h14
          · rcases List.mem_append.mp h0to13 with h0to12 | h13
            · rcases List.mem_append.mp h0to12 with h0to11 | h12
              · rcases List.mem_append.mp h0to11 with h0to10 | h11
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
                                    · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
                                    · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
                                  · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
                                · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard3.sourceAssign_refinementClauses source clause h3
                              · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard4.sourceAssign_refinementClauses source clause h4
                            · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard5.sourceAssign_refinementClauses source clause h5
                          · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard6.sourceAssign_refinementClauses source clause h6
                        · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard7.sourceAssign_refinementClauses source clause h7
                      · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard8.sourceAssign_refinementClauses source clause h8
                    · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard9.sourceAssign_refinementClauses source clause h9
                  · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard10.sourceAssign_refinementClauses source clause h10
                · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard11.sourceAssign_refinementClauses source clause h11
              · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard12.sourceAssign_refinementClauses source clause h12
            · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard13.sourceAssign_refinementClauses source clause h13
          · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard14.sourceAssign_refinementClauses source clause h14
        · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard15.sourceAssign_refinementClauses source clause h15
      · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard16.sourceAssign_refinementClauses source clause h16
    · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard17.sourceAssign_refinementClauses source clause h17
  · exact ATailBlockerVExactSeventeenFortyFirstModelRefinementsShard18.sourceAssign_refinementClauses source clause h18

def extendedFortyFirstModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortiethModelRefinementsCnf ++ fortyFirstModelRefinementClauses

theorem extendedFortyFirstModelRefinementsCnf_length :
    extendedFortyFirstModelRefinementsCnf.length = 5848452 := by
  simp only [extendedFortyFirstModelRefinementsCnf, List.length_append,
    extendedFortiethModelRefinementsCnf_length,
    fortyFirstModelRefinementClauses_length]

theorem sourceAssign_extendedFortyFirstModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyFirstModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyFirstModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortiethModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyFirstModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyFirstModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyFirstModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyFirstModelRefinementsCnf source⟩

#print axioms sourceAssign_fortyFirstModelRefinementClauses
#print axioms sourceAssign_extendedFortyFirstModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyFirstModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortyFirstModelRefinements
end Problem97
