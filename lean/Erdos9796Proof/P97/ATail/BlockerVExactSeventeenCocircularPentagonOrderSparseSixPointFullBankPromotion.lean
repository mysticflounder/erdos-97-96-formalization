/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderCyclicConvexFiveFullBankPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFullBank

/-! Lean-owned promotion of the complete sparse six-point exact-17 bank. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenCocircularPentagonOrderCyclicConvexFiveFullBankPromotion
open ATailBlockerVExactSeventeenSparseSixPointFullBank

def extendedCocircularOrderSparseSixPointFullBankCnf : Std.Sat.CNF Atom :=
  extendedCocircularOrderCyclicConvexFiveFullBankCnf ++
    sparseSixPointFullBankClauses

theorem extendedCocircularOrderSparseSixPointFullBankCnf_length :
    extendedCocircularOrderSparseSixPointFullBankCnf.length = 7409253 := by
  simp only [extendedCocircularOrderSparseSixPointFullBankCnf,
    List.length_append,
    extendedCocircularOrderCyclicConvexFiveFullBankCnf_length,
    sparseSixPointFullBankClauses_length]

theorem sourceAssign_extendedCocircularOrderSparseSixPointFullBankCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFullBankCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderSparseSixPointFullBankCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderCyclicConvexFiveFullBankCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_sparseSixPointFullBankClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFullBankCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFullBankCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFullBankCnf
      source horder⟩

#print axioms sourceAssign_extendedCocircularOrderSparseSixPointFullBankCnf
#print axioms false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFullBankCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion
end Problem97
