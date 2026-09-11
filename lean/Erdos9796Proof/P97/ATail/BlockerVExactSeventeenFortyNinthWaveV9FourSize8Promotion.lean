/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV9FourSize8Schemas
import Erdos9796Proof.P97.ListCNF

/-! Lean-owned V9 promotion of four new size-eight records. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Schemas

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion def. -/
def fortyNinthWaveV9FourSize8PromotionClauses : ListCNF Atom :=
  fortyNinthWaveV9FourSize8SchemaClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion theorem. -/
theorem fortyNinthWaveV9FourSize8PromotionClauses_length :
    fortyNinthWaveV9FourSize8PromotionClauses.length = 16 := by
  simpa [fortyNinthWaveV9FourSize8PromotionClauses] using
    fortyNinthWaveV9FourSize8SchemaClauses_length

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion theorem. -/
theorem sourceAssign_fortyNinthWaveV9FourSize8PromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV9FourSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV9FourSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV9FourSize8SchemaClauses source

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion def. -/
def extendedFortyNinthWaveV9FourSize8PromotionCnf : ListCNF Atom :=
  extendedFortyNinthWaveV8SeventeenSize8PromotionCnf ++
    fortyNinthWaveV9FourSize8PromotionClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion theorem. -/
theorem extendedFortyNinthWaveV9FourSize8PromotionCnf_length :
    extendedFortyNinthWaveV9FourSize8PromotionCnf.length = 7198852 := by
  simp only [extendedFortyNinthWaveV9FourSize8PromotionCnf,
    List.length_append,
    extendedFortyNinthWaveV8SeventeenSize8PromotionCnf_length,
    fortyNinthWaveV9FourSize8PromotionClauses_length]

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion theorem. -/
theorem sourceAssign_extendedFortyNinthWaveV9FourSize8PromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV9FourSize8PromotionCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV9FourSize8PromotionCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV9FourSize8PromotionClauses
      source clause hsuffix

/-- P97 ATail BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion theorem. -/
theorem false_of_sourceRealization_of_extendedFortyNinthWaveV9FourSize8PromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment
        extendedFortyNinthWaveV9FourSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV9FourSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV9FourSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV9FourSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV9FourSize8PromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion
end Problem97
