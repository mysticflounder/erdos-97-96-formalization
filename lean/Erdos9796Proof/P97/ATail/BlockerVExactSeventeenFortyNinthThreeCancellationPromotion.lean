/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthNextZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthThreeCancellationSchemas
import Erdos9796Proof.P97.ListCNF

/-! Lean-owned promotion of two distinct eight-hit V49 cancellation supports. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthNextZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthThreeCancellationSchemas

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion def. -/
def fortyNinthThreeCancellationPromotionClauses : ListCNF Atom :=
  fortyNinthThreeCancellationSchemaClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion theorem. -/
theorem fortyNinthThreeCancellationPromotionClauses_length :
    fortyNinthThreeCancellationPromotionClauses.length = 8 := by
  simpa [fortyNinthThreeCancellationPromotionClauses] using
    fortyNinthThreeCancellationSchemaClauses_length

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion theorem. -/
theorem sourceAssign_fortyNinthThreeCancellationPromotionClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthThreeCancellationPromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthThreeCancellationPromotionClauses] using
    sourceAssign_fortyNinthThreeCancellationSchemaClauses source

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion def. -/
def extendedFortyNinthThreeCancellationPromotionCnf : ListCNF Atom :=
  extendedFortyNinthNextZeroAtomPromotionCnf ++ fortyNinthThreeCancellationPromotionClauses

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion theorem. -/
theorem extendedFortyNinthThreeCancellationPromotionCnf_length :
    extendedFortyNinthThreeCancellationPromotionCnf.length = 7198700 := by
  simp only [extendedFortyNinthThreeCancellationPromotionCnf, List.length_append,
    extendedFortyNinthNextZeroAtomPromotionCnf_length,
    fortyNinthThreeCancellationPromotionClauses_length]

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion theorem. -/
theorem sourceAssign_extendedFortyNinthThreeCancellationPromotionCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedFortyNinthThreeCancellationPromotionCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthThreeCancellationPromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hnext
  · have h := sourceAssign_extendedFortyNinthNextZeroAtomPromotionCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthThreeCancellationPromotionClauses source clause hnext

/-- P97 ATail BlockerVExactSeventeenFortyNinthThreeCancellationPromotion theorem. -/
theorem false_of_sourceRealization_of_extendedFortyNinthThreeCancellationPromotionCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment extendedFortyNinthThreeCancellationPromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthThreeCancellationPromotionCnf source⟩

#print axioms sourceAssign_fortyNinthThreeCancellationPromotionClauses
#print axioms sourceAssign_extendedFortyNinthThreeCancellationPromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthThreeCancellationPromotionCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion
end Problem97
