/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderSatRefinementSchemas

/-! Lean-owned promotion of the first source-valid cut mined from the
cocircular-order SAT child. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenCocircularPentagonOrderPromotion
open ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementSchemas

def extendedCocircularOrderSatRefinementCnf : Std.Sat.CNF Atom :=
  extendedCocircularPentagonOrderCnf ++ cocircularOrderSatRefinementClauses

theorem extendedCocircularOrderSatRefinementCnf_length :
    extendedCocircularOrderSatRefinementCnf.length = 7198857 := by
  simp only [extendedCocircularOrderSatRefinementCnf, List.length_append,
    extendedCocircularPentagonOrderCnf_length,
    cocircularOrderSatRefinementClauses_length]

theorem sourceAssign_extendedCocircularOrderSatRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSatRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderSatRefinementCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedCocircularPentagonOrderCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_cocircularOrderSatRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedCocircularOrderSatRefinementCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedCocircularOrderSatRefinementCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSatRefinementCnf source horder⟩

#print axioms sourceAssign_extendedCocircularOrderSatRefinementCnf
#print axioms false_of_sourceRealization_of_extendedCocircularOrderSatRefinementCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderSatRefinementPromotion
end Problem97
