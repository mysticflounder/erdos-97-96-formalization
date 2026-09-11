/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas
import Erdos9796Proof.P97.ListCNF

/-! Cumulative Lean-owned V49 V6 five-support promotion over V5. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion def. -/
def fortyNinthWaveV6FiveSize8PromotionClauses : ListCNF Atom :=
  fortyNinthWaveV6FiveSize8SchemaClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion theorem. -/
theorem fortyNinthWaveV6FiveSize8PromotionClauses_length :
    fortyNinthWaveV6FiveSize8PromotionClauses.length = 20 := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    fortyNinthWaveV6FiveSize8SchemaClauses_length

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion theorem. -/
theorem sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses source

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion def. -/
def extendedFortyNinthWaveV6FiveSize8PromotionCnf : ListCNF Atom :=
  extendedFortyNinthWaveV5FiveSize8PromotionCnf ++
    fortyNinthWaveV6FiveSize8PromotionClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion theorem. -/
theorem extendedFortyNinthWaveV6FiveSize8PromotionCnf_length :
    extendedFortyNinthWaveV6FiveSize8PromotionCnf.length = 7198760 := by
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV5FiveSize8PromotionCnf_length,
    fortyNinthWaveV6FiveSize8PromotionClauses_length]

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion theorem. -/
theorem sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV6FiveSize8PromotionCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses source clause hsuffix

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion theorem. -/
theorem false_of_sourceRealization_of_extendedFortyNinthWaveV6FiveSize8PromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment extendedFortyNinthWaveV6FiveSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV6FiveSize8PromotionCnf_unsat
end ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion
end Problem97
