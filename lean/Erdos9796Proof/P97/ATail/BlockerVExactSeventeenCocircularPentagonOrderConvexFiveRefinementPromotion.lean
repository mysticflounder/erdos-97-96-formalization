/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderSatRefinementPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementSchemas

/-! Lean-owned promotion of the seven-hit convex-five cut mined from the
second cocircular-order SAT child. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementPromotion
open ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementSchemas

def extendedCocircularOrderConvexFiveRefinementCnf : Std.Sat.CNF Atom :=
  extendedCocircularOrderSatRefinementCnf ++
    cocircularOrderConvexFiveRefinementClauses

theorem extendedCocircularOrderConvexFiveRefinementCnf_length :
    extendedCocircularOrderConvexFiveRefinementCnf.length = 7198861 := by
  simp only [extendedCocircularOrderConvexFiveRefinementCnf,
    List.length_append, extendedCocircularOrderSatRefinementCnf_length,
    cocircularOrderConvexFiveRefinementClauses_length]

theorem sourceAssign_extendedCocircularOrderConvexFiveRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderConvexFiveRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderConvexFiveRefinementCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedCocircularOrderSatRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_cocircularOrderConvexFiveRefinementClauses source clause
      hsuffix

theorem false_of_sourceRealization_of_extendedCocircularOrderConvexFiveRefinementCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderConvexFiveRefinementCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderConvexFiveRefinementCnf source horder⟩

#print axioms sourceAssign_extendedCocircularOrderConvexFiveRefinementCnf
#print axioms false_of_sourceRealization_of_extendedCocircularOrderConvexFiveRefinementCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementPromotion
end Problem97
