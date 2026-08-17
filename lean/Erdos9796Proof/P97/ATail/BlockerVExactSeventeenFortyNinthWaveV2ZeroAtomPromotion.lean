/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthThreeCancellationPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV2ZeroAtomSchemas

/-! Lean-owned promotion of the direct atom-3108 V49 wave-v2 subset. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion
open ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomSchemas

def fortyNinthWaveV2ZeroAtomPromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV2ZeroAtomSchemaClauses

theorem fortyNinthWaveV2ZeroAtomPromotionClauses_length :
    fortyNinthWaveV2ZeroAtomPromotionClauses.length = 4 := by
  simpa [fortyNinthWaveV2ZeroAtomPromotionClauses] using
    fortyNinthWaveV2ZeroAtomSchemaClauses_length

theorem sourceAssign_fortyNinthWaveV2ZeroAtomPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV2ZeroAtomPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV2ZeroAtomPromotionClauses] using
    sourceAssign_fortyNinthWaveV2ZeroAtomSchemaClauses source

def extendedFortyNinthWaveV2ZeroAtomPromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthThreeCancellationPromotionCnf ++
    fortyNinthWaveV2ZeroAtomPromotionClauses

theorem extendedFortyNinthWaveV2ZeroAtomPromotionCnf_length :
    extendedFortyNinthWaveV2ZeroAtomPromotionCnf.length = 7198704 := by
  simp only [extendedFortyNinthWaveV2ZeroAtomPromotionCnf, List.length_append,
    extendedFortyNinthThreeCancellationPromotionCnf_length,
    fortyNinthWaveV2ZeroAtomPromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV2ZeroAtomPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV2ZeroAtomPromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV2ZeroAtomPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsubset
  · have h := sourceAssign_extendedFortyNinthThreeCancellationPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV2ZeroAtomPromotionClauses source clause hsubset

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV2ZeroAtomPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV2ZeroAtomPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV2ZeroAtomPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV2ZeroAtomPromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV2ZeroAtomPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV2ZeroAtomPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotion
end Problem97
