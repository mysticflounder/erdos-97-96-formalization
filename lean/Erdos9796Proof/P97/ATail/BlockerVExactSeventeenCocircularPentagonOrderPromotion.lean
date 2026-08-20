/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion

/-!
# Exact-seventeen cocircular-pentagon order promotion

The geometric source bridge rules out the second named order.  This module
promotes that result as one Lean-owned unit clause on top of the current
exact-seventeen cumulative root.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderPromotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Promotion

/-- The source-proved unit selecting the first named boundary order. -/
def cocircularPentagonOrderClauses : Std.Sat.CNF Atom :=
  [[pos (.namedOrder 0)]]

theorem cocircularPentagonOrderClauses_length :
    cocircularPentagonOrderClauses.length = 1 := by
  rfl

/-- A source realization whose geometry has selected order zero satisfies the
new unit clause. -/
theorem sourceAssign_cocircularPentagonOrderClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    ∀ clause ∈ cocircularPentagonOrderClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [cocircularPentagonOrderClauses, List.mem_cons,
    List.not_mem_nil, or_false] at hclause
  subst clause
  simp [Std.Sat.CNF.Clause.eval, sourceAssign, pos, horder]

/-- Current exact-seventeen root extended by the source-proved order unit. -/
def extendedCocircularPentagonOrderCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV9FourSize8PromotionCnf ++
    cocircularPentagonOrderClauses

theorem extendedCocircularPentagonOrderCnf_length :
    extendedCocircularPentagonOrderCnf.length = 7198853 := by
  simp only [extendedCocircularPentagonOrderCnf, List.length_append,
    extendedFortyNinthWaveV9FourSize8PromotionCnf_length,
    cocircularPentagonOrderClauses_length]

/-- Gate B for the cumulative root after the cocircular-pentagon order cut. -/
theorem sourceAssign_extendedCocircularPentagonOrderCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularPentagonOrderCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularPentagonOrderCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedFortyNinthWaveV9FourSize8PromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_cocircularPentagonOrderClauses
      source horder clause hsuffix

/-- Terminal adapter for an authenticated source packet carrying the geometric
order conclusion. -/
theorem false_of_sourceRealization_of_extendedCocircularPentagonOrderCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedCocircularPentagonOrderCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularPentagonOrderCnf source horder⟩

#print axioms sourceAssign_cocircularPentagonOrderClauses
#print axioms sourceAssign_extendedCocircularPentagonOrderCnf
#print axioms false_of_sourceRealization_of_extendedCocircularPentagonOrderCnf_unsat

end ATailBlockerVExactSeventeenCocircularPentagonOrderPromotion
end Problem97
