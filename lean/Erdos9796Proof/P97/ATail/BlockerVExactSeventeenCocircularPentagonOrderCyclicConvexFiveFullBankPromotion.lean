/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderConvexFiveFullBankPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCyclicConvexFiveFullBank

/-! Lean-owned promotion of the missing cyclic cuts of the exact-seventeen
convex-five bank. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderCyclicConvexFiveFullBankPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveFullBankPromotion
open ATailBlockerVExactSeventeenCyclicConvexFiveFullBank

def extendedCocircularOrderCyclicConvexFiveFullBankCnf : Std.Sat.CNF Atom :=
  extendedCocircularOrderConvexFiveFullBankCnf ++
    cyclicConvexFiveMissingClauses

theorem extendedCocircularOrderCyclicConvexFiveFullBankCnf_length :
    extendedCocircularOrderCyclicConvexFiveFullBankCnf.length = 7260741 := by
  simp only [extendedCocircularOrderCyclicConvexFiveFullBankCnf,
    List.length_append,
    extendedCocircularOrderConvexFiveFullBankCnf_length,
    cyclicConvexFiveMissingClauses_length]

theorem sourceAssign_extendedCocircularOrderCyclicConvexFiveFullBankCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderCyclicConvexFiveFullBankCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderCyclicConvexFiveFullBankCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderConvexFiveFullBankCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_cyclicConvexFiveMissingClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedCocircularOrderCyclicConvexFiveFullBankCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderCyclicConvexFiveFullBankCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderCyclicConvexFiveFullBankCnf source horder⟩

#print axioms sourceAssign_extendedCocircularOrderCyclicConvexFiveFullBankCnf
#print axioms false_of_sourceRealization_of_extendedCocircularOrderCyclicConvexFiveFullBankCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderCyclicConvexFiveFullBankPromotion
end Problem97
