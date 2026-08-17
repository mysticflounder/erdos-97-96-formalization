/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Schemas

/-! Lean-owned V8 promotion of the seventeen new size-eight records. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Schemas

def fortyNinthWaveV8SeventeenSize8PromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV8SeventeenSize8SchemaClauses

theorem fortyNinthWaveV8SeventeenSize8PromotionClauses_length :
    fortyNinthWaveV8SeventeenSize8PromotionClauses.length = 68 := by
  simpa [fortyNinthWaveV8SeventeenSize8PromotionClauses] using
    fortyNinthWaveV8SeventeenSize8SchemaClauses_length

theorem sourceAssign_fortyNinthWaveV8SeventeenSize8PromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV8SeventeenSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV8SeventeenSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV8SeventeenSize8SchemaClauses source

def extendedFortyNinthWaveV8SeventeenSize8PromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV7TwoSize8PromotionCnf ++
    fortyNinthWaveV8SeventeenSize8PromotionClauses

theorem extendedFortyNinthWaveV8SeventeenSize8PromotionCnf_length :
    extendedFortyNinthWaveV8SeventeenSize8PromotionCnf.length = 7198836 := by
  simp only [extendedFortyNinthWaveV8SeventeenSize8PromotionCnf,
    List.length_append,
    extendedFortyNinthWaveV7TwoSize8PromotionCnf_length,
    fortyNinthWaveV8SeventeenSize8PromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV8SeventeenSize8PromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV8SeventeenSize8PromotionCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV7TwoSize8PromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV8SeventeenSize8PromotionClauses
      source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedFortyNinthWaveV8SeventeenSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV8SeventeenSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV8SeventeenSize8PromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion
end Problem97
