/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinement
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the canary perpendicular-bisector refinement

The source-valid perpendicular-bisector clause is combined with every
next-center and physical-multiplicity cell in the existing 76-cell partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement

/-- The perpendicular-bisector successor restricted to one source-valid
physical-slice cell. -/
def canaryPerpBisectorPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorPhysicalSliceCellCnf center category).length = 7409302 := by
  cases category <;>
    simp [canaryPerpBisectorPhysicalSliceCellCnf,
      canaryPerpBisectorRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_canaryPerpBisectorPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorPhysicalSliceCellCnf center category) = true := by
  rw [canaryPerpBisectorPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorRefinementCnf source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- Checked UNSAT for every refined cell excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (canaryPerpBisectorPhysicalSliceCellCnf center category) = true)
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
      sourceAssign_canaryPerpBisectorPhysicalSliceCell source horder rfl hmatch⟩

#print axioms canaryPerpBisectorPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementPhysicalSliceCoverage
end Problem97
