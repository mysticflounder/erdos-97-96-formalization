/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
import Erdos9796Proof.P97.ListCNF

/-!
# Physical-slice coverage after the canary perpendicular-bisector model refinement

The Lean-owned model-refinement root is combined with every next-center and
physical-multiplicity cell in the existing 76-cell partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements

/-- The model-refinement successor restricted to one source-valid physical-slice cell. -/
def canaryPerpBisectorModelRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : ListCNF Atom :=
  canaryPerpBisectorModelRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCoverage theorem. -/
theorem canaryPerpBisectorModelRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorModelRefinementPhysicalSliceCellCnf center category).length =
      7409307 := by
  cases category <;>
    simp [canaryPerpBisectorModelRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorModelRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_canaryPerpBisectorModelRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    ListCNF.eval (sourceAssign source.model)
      (canaryPerpBisectorModelRefinementPhysicalSliceCellCnf center category) = true := by
  rw [canaryPerpBisectorModelRefinementPhysicalSliceCellCnf,
    ListCNF.eval_append, ListCNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorModelRefinementCnf source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- Checked UNSAT for every refined cell excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorModelRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          ListCNF.eval assignment
            (canaryPerpBisectorModelRefinementPhysicalSliceCellCnf center category) = true)
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
      sourceAssign_canaryPerpBisectorModelRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms canaryPerpBisectorModelRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorModelRefinementPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorModelRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCoverage
end Problem97
