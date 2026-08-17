/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomSchemas

/-! Lean-owned promotion of the direct atom-1105 V49 wave-v3 subset. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomSchemas

def fortyNinthWaveV3ZeroAtomPromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV3ZeroAtomSchemaClauses

theorem fortyNinthWaveV3ZeroAtomPromotionClauses_length :
    fortyNinthWaveV3ZeroAtomPromotionClauses.length = 4 := by
  simpa [fortyNinthWaveV3ZeroAtomPromotionClauses] using
    fortyNinthWaveV3ZeroAtomSchemaClauses_length

theorem sourceAssign_fortyNinthWaveV3ZeroAtomPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV3ZeroAtomPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV3ZeroAtomPromotionClauses] using
    sourceAssign_fortyNinthWaveV3ZeroAtomSchemaClauses source

def extendedFortyNinthWaveV3ZeroAtomPromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV2ZeroAtomPromotionCnf ++
    fortyNinthWaveV3ZeroAtomPromotionClauses

theorem extendedFortyNinthWaveV3ZeroAtomPromotionCnf_length :
    extendedFortyNinthWaveV3ZeroAtomPromotionCnf.length = 7198708 := by
  simp only [extendedFortyNinthWaveV3ZeroAtomPromotionCnf, List.length_append,
    extendedFortyNinthWaveV2ZeroAtomPromotionCnf_length,
    fortyNinthWaveV3ZeroAtomPromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV3ZeroAtomPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV3ZeroAtomPromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV3ZeroAtomPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsubset
  · have h := sourceAssign_extendedFortyNinthWaveV2ZeroAtomPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV3ZeroAtomPromotionClauses source clause hsubset

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV3ZeroAtomPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV3ZeroAtomPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV3ZeroAtomPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV3ZeroAtomPromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV3ZeroAtomPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV3ZeroAtomPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion
end Problem97
