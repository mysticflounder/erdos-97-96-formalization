/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthZeroAtomSchemas

/-! Lean-owned promotion of the four V49 zero-atom source adapters. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthZeroAtomPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthModelRefinements
open ATailBlockerVExactSeventeenFortyNinthZeroAtomSchemas

def fortyNinthZeroAtomPromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthZeroAtomSchemaClauses

theorem fortyNinthZeroAtomPromotionClauses_length :
    fortyNinthZeroAtomPromotionClauses.length = 16 := by
  simpa [fortyNinthZeroAtomPromotionClauses] using
    fortyNinthZeroAtomSchemaClauses_length

theorem sourceAssign_fortyNinthZeroAtomPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthZeroAtomPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthZeroAtomPromotionClauses] using
    sourceAssign_fortyNinthZeroAtomSchemaClauses source

def extendedFortyNinthZeroAtomPromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthModelRefinementsCnf ++ fortyNinthZeroAtomPromotionClauses

theorem extendedFortyNinthZeroAtomPromotionCnf_length :
    extendedFortyNinthZeroAtomPromotionCnf.length = 7198684 := by
  simp only [extendedFortyNinthZeroAtomPromotionCnf, List.length_append,
    extendedFortyNinthModelRefinementsCnf_length,
    fortyNinthZeroAtomPromotionClauses_length]

theorem sourceAssign_extendedFortyNinthZeroAtomPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthZeroAtomPromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthZeroAtomPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hzero
  · have h := sourceAssign_extendedFortyNinthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthZeroAtomPromotionClauses source clause hzero

theorem false_of_sourceRealization_of_extendedFortyNinthZeroAtomPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthZeroAtomPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthZeroAtomPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthZeroAtomPromotionClauses
#print axioms sourceAssign_extendedFortyNinthZeroAtomPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthZeroAtomPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthZeroAtomPromotion
end Problem97
