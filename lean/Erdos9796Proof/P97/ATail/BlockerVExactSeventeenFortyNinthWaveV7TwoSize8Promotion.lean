/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV7TwoSize8Schemas

/-! Lean-owned V7 promotion of the two new size-eight records. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Schemas

def fortyNinthWaveV7TwoSize8PromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV7TwoSize8SchemaClauses

theorem fortyNinthWaveV7TwoSize8PromotionClauses_length :
    fortyNinthWaveV7TwoSize8PromotionClauses.length = 8 := by
  simpa [fortyNinthWaveV7TwoSize8PromotionClauses] using
    fortyNinthWaveV7TwoSize8SchemaClauses_length

theorem sourceAssign_fortyNinthWaveV7TwoSize8PromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV7TwoSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV7TwoSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV7TwoSize8SchemaClauses source

def extendedFortyNinthWaveV7TwoSize8PromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV6FiveSize8PromotionCnf ++
    fortyNinthWaveV7TwoSize8PromotionClauses

theorem extendedFortyNinthWaveV7TwoSize8PromotionCnf_length :
    extendedFortyNinthWaveV7TwoSize8PromotionCnf.length = 7198768 := by
  simp only [extendedFortyNinthWaveV7TwoSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV6FiveSize8PromotionCnf_length,
    fortyNinthWaveV7TwoSize8PromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV7TwoSize8PromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV7TwoSize8PromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV7TwoSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV7TwoSize8PromotionClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV7TwoSize8PromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV7TwoSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV7TwoSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV7TwoSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV7TwoSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV7TwoSize8PromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion
end Problem97
