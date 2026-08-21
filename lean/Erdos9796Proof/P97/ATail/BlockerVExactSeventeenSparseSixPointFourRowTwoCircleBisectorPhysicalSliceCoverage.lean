/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Exact-17 four-row bisector physical-slice coverage

This module partitions the Lean-owned sparse-six four-row bisector root by the
source-valid next-center and physical-class slice choices. It contains no solver
claim: a checked coordinator must provide one UNSAT theorem for every cell.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-- The four-row bisector root restricted to one source-valid physical-slice cell. -/
def sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf center category).length =
      7409263 := by
  cases category <;>
    simp [sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf,
      extendedCocircularOrderSparseSixPointFourRowBisectorCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf center category) = true := by
  rw [sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/--
Checked UNSAT for every one of the 76 refined cells excludes every order-zero
source realization.
-/
theorem false_of_all_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf
              center category) = true)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0) :
    False := by
  rcases hsource with ⟨source, horder⟩
  have hcenter : source.model.nextCenter ∈ legalNextCenterLabels :=
    SourceModel.nextCenter_mem_legalNextCenterLabels source.model
  obtain ⟨category, hcategory, hmatch⟩ :=
    SourceModel.exists_physicalSliceCategory source.model
  exact hcell source.model.nextCenter hcenter category hcategory
    ⟨sourceAssign source.model,
      sourceAssign_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellCnf_length
#print axioms sourceAssign_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCell
#print axioms false_of_all_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCells

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorPhysicalSliceCoverage
end Problem97
