/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the combined v4 FourPoint successor

The 7,409,760-clause combined root is restricted to every source-total
next-center and physical-multiplicity cell in the 76-cell partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements

/-- The combined root restricted to one source-valid physical-slice cell. -/
def canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf
      center category).length = 7409766 := by
  cases category <;>
    simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- Every matching order-zero source realizes its exact combined-root cell. -/
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf
    source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- UNSAT for all 76 combined-root cells excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf
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
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf
#print axioms canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementsPhysicalSliceCoverage
end Problem97
