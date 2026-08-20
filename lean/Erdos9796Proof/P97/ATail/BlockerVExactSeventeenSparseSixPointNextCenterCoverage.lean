/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion

/-!
# Exact-17 sparse-six next-center coverage

This module partitions the Lean-owned sparse-six exact-17 root by the thirteen
source-valid choices for the next selected-row center.  It contains no solver
claim: a later checked coordinator must provide one UNSAT theorem for every
legal cell.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion

/-- The singleton clause fixing one legal next selected-row center. -/
def sparseSixPointNextCenterUnitCnf (center : Label) : Std.Sat.CNF Atom :=
  [[pos (.nextCenter center)]]

/-- The complete sparse-six exact-17 root restricted to one center cell. -/
def sparseSixPointNextCenterCellCnf (center : Label) : Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFullBankCnf ++
    sparseSixPointNextCenterUnitCnf center

theorem sparseSixPointNextCenterCellCnf_length (center : Label) :
    (sparseSixPointNextCenterCellCnf center).length = 7409254 := by
  simp [sparseSixPointNextCenterCellCnf, sparseSixPointNextCenterUnitCnf,
    extendedCocircularOrderSparseSixPointFullBankCnf_length]

/-- The cell unit for `center` has DIMACS identifier `290 + center`. -/
theorem litToDimacs_pos_nextCenter (center : Label) :
    litToDimacs (pos (.nextCenter center)) =
      Int.ofNat (290 + center.val) := by
  simp [pos, litToDimacs, atomVar, nextCenterVar]

/-- A source assignment satisfies the unit naming its actual next center. -/
theorem sourceAssign_sparseSixPointNextCenterUnit
    (model : SourceModel) {center : Label}
    (hcenter : model.nextCenter = center) :
    Std.Sat.CNF.eval (sourceAssign model)
      (sparseSixPointNextCenterUnitCnf center) = true := by
  simp [sparseSixPointNextCenterUnitCnf, Std.Sat.CNF.eval,
    Std.Sat.CNF.Clause.eval, sourceAssign, pos, hcenter]

/-- An order-zero source realization satisfies its matching sparse-six cell. -/
theorem sourceAssign_sparseSixPointNextCenterCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (sparseSixPointNextCenterCellCnf center) = true := by
  rw [sparseSixPointNextCenterCellCnf, Std.Sat.CNF.eval_append]
  rw [sourceAssign_extendedCocircularOrderSparseSixPointFullBankCnf source horder]
  simp [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]

/--
Thirteen checked cell contradictions exclude every order-zero source
realization because its next center belongs to `legalNextCenterLabels`.
-/
theorem false_of_all_sparseSixPointNextCenterCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ¬ ∃ assignment,
        Std.Sat.CNF.eval assignment
          (sparseSixPointNextCenterCellCnf center) = true)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  rcases hsource with ⟨source, horder⟩
  have hmem : source.model.nextCenter ∈ legalNextCenterLabels :=
    SourceModel.nextCenter_mem_legalNextCenterLabels source.model
  exact hcell source.model.nextCenter hmem ⟨sourceAssign source.model,
    sourceAssign_sparseSixPointNextCenterCell source horder rfl⟩

#print axioms sparseSixPointNextCenterCellCnf_length
#print axioms litToDimacs_pos_nextCenter
#print axioms sourceAssign_sparseSixPointNextCenterUnit
#print axioms sourceAssign_sparseSixPointNextCenterCell
#print axioms false_of_all_sparseSixPointNextCenterCells

end ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
end Problem97
