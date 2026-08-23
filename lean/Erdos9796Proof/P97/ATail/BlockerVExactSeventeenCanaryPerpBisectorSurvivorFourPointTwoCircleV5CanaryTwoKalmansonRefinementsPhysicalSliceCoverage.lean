/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the v5 canary two-Kalmanson successor

The 7,409,780-clause v5 canary root is restricted to every source-total
next-center and physical-multiplicity cell in the 76-cell partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements

/-- The v5 canary root restricted to one source-valid physical-slice cell. -/
def canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf
      center category).length = 7409786 := by
  cases category <;>
    simp [canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- Every matching order-zero source realizes its exact v5 canary cell. -/
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf
    source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- UNSAT for all 76 v5 canary cells excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf
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
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf
#print axioms canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementsPhysicalSliceCoverage
end Problem97
