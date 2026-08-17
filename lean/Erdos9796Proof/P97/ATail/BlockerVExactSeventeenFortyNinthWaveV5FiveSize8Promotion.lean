/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

/-! Lean-owned promotion of the V49 five-support size-eight successor. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

def fortyNinthWaveV5FiveSize8PromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV5FiveSize8SchemaClauses

theorem fortyNinthWaveV5FiveSize8PromotionClauses_length :
    fortyNinthWaveV5FiveSize8PromotionClauses.length = 20 := by
  simpa [fortyNinthWaveV5FiveSize8PromotionClauses] using
    fortyNinthWaveV5FiveSize8SchemaClauses_length

theorem sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV5FiveSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV5FiveSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses source

def extendedFortyNinthWaveV5FiveSize8PromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf ++
    fortyNinthWaveV5FiveSize8PromotionClauses

theorem extendedFortyNinthWaveV5FiveSize8PromotionCnf_length :
    extendedFortyNinthWaveV5FiveSize8PromotionCnf.length = 7198740 := by
  simp only [extendedFortyNinthWaveV5FiveSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf_length,
    fortyNinthWaveV5FiveSize8PromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV5FiveSize8PromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV5FiveSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV5FiveSize8PromotionCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV5FiveSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV5FiveSize8PromotionCnf_unsat
end ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
end Problem97
