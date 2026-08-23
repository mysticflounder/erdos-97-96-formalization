/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the V8 two-Kalmanson successor

The 7,409,839-clause V8 source root is restricted to every source-total
next-center and physical-multiplicity cell in the existing 76-cell partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements

/-- The V8 source root restricted to one source-valid physical-slice cell. -/
def canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
      center category).length = 7409845 := by
  cases category <;>
    simp [canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- Every matching order-zero source realizes its exact V8 physical cell. -/
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf
    source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- UNSAT for all 76 V8 physical cells excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf
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
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf
#print axioms canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCoverage
end Problem97
