/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomSchemas

/-! Lean-owned promotion of the three direct-zero V49 wave-v4 records. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomSchemas

def fortyNinthWaveV4ThreeZeroAtomPromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV4ThreeZeroAtomSchemaClauses

theorem fortyNinthWaveV4ThreeZeroAtomPromotionClauses_length :
    fortyNinthWaveV4ThreeZeroAtomPromotionClauses.length = 12 := by
  simpa [fortyNinthWaveV4ThreeZeroAtomPromotionClauses] using
    fortyNinthWaveV4ThreeZeroAtomSchemaClauses_length

theorem sourceAssign_fortyNinthWaveV4ThreeZeroAtomPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV4ThreeZeroAtomPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV4ThreeZeroAtomPromotionClauses] using
    sourceAssign_fortyNinthWaveV4ThreeZeroAtomSchemaClauses source

def extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV3ZeroAtomPromotionCnf ++
    fortyNinthWaveV4ThreeZeroAtomPromotionClauses

theorem extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf_length :
    extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf.length = 7198720 := by
  simp only [extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf, List.length_append,
    extendedFortyNinthWaveV3ZeroAtomPromotionCnf_length,
    fortyNinthWaveV4ThreeZeroAtomPromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsubset
  · have h := sourceAssign_extendedFortyNinthWaveV3ZeroAtomPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV4ThreeZeroAtomPromotionClauses source clause hsubset

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV4ThreeZeroAtomPromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion
end Problem97
