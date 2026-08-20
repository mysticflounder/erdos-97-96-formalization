/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenDirectConvexFiveFullBank

/-! Lean-owned promotion of every direct positional convex-five clause at
exact seventeen. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveFullBankPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementPromotion
open ATailBlockerVExactSeventeenDirectConvexFiveFullBank

def extendedCocircularOrderConvexFiveFullBankCnf : Std.Sat.CNF Atom :=
  extendedCocircularOrderConvexFiveRefinementCnf ++
    directConvexFiveFullBankClauses

theorem extendedCocircularOrderConvexFiveFullBankCnf_length :
    extendedCocircularOrderConvexFiveFullBankCnf.length = 7211237 := by
  simp only [extendedCocircularOrderConvexFiveFullBankCnf,
    List.length_append,
    extendedCocircularOrderConvexFiveRefinementCnf_length,
    directConvexFiveFullBankClauses_length]

theorem sourceAssign_extendedCocircularOrderConvexFiveFullBankCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderConvexFiveFullBankCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderConvexFiveFullBankCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderConvexFiveRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_directConvexFiveFullBankClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedCocircularOrderConvexFiveFullBankCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderConvexFiveFullBankCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderConvexFiveFullBankCnf source horder⟩

#print axioms sourceAssign_extendedCocircularOrderConvexFiveFullBankCnf
#print axioms false_of_sourceRealization_of_extendedCocircularOrderConvexFiveFullBankCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveFullBankPromotion
end Problem97
