/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthNextZeroAtomSchemas

/-! Lean-owned promotion of the next two V49 direct zero-atom adapters. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthNextZeroAtomPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthNextZeroAtomSchemas

def fortyNinthNextZeroAtomPromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthNextZeroAtomSchemaClauses

theorem fortyNinthNextZeroAtomPromotionClauses_length :
    fortyNinthNextZeroAtomPromotionClauses.length = 8 := by
  simpa [fortyNinthNextZeroAtomPromotionClauses] using
    fortyNinthNextZeroAtomSchemaClauses_length

theorem sourceAssign_fortyNinthNextZeroAtomPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthNextZeroAtomPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthNextZeroAtomPromotionClauses] using
    sourceAssign_fortyNinthNextZeroAtomSchemaClauses source

def extendedFortyNinthNextZeroAtomPromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthZeroAtomPromotionCnf ++ fortyNinthNextZeroAtomPromotionClauses

theorem extendedFortyNinthNextZeroAtomPromotionCnf_length :
    extendedFortyNinthNextZeroAtomPromotionCnf.length = 7198692 := by
  simp only [extendedFortyNinthNextZeroAtomPromotionCnf, List.length_append,
    extendedFortyNinthZeroAtomPromotionCnf_length,
    fortyNinthNextZeroAtomPromotionClauses_length]

theorem sourceAssign_extendedFortyNinthNextZeroAtomPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthNextZeroAtomPromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthNextZeroAtomPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hnext
  · have h := sourceAssign_extendedFortyNinthZeroAtomPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthNextZeroAtomPromotionClauses source clause hnext

theorem false_of_sourceRealization_of_extendedFortyNinthNextZeroAtomPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthNextZeroAtomPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthNextZeroAtomPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthNextZeroAtomPromotionClauses
#print axioms sourceAssign_extendedFortyNinthNextZeroAtomPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthNextZeroAtomPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthNextZeroAtomPromotion
end Problem97
