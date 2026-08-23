/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the V7 two-Kalmanson successor

The 7,409,810-clause V7 source root is restricted to every source-total
next-center and physical-multiplicity cell in the existing 76-cell partition.

The bounded theorem-bank reuse preflight at source revision `f8b3b1ce` found
only the V4 and V5 physical coordinators.  Neither is root-parametric, so this
module transports the committed V7 source theorem to the same partition.  Its
immediate consumer is the V7 certificate-ingress coordinator generated after
the 76 exported cells have certified UNSAT proofs; no finite cell theorem is
assumed here.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinements

/-- The V7 source root restricted to one source-valid physical-slice cell. -/
def canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf
      center category).length = 7409816 := by
  cases category <;>
    simp [canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- Every matching order-zero source realizes its exact V7 physical cell. -/
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
    source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- UNSAT for all 76 V7 physical cells excludes every order-zero source. -/
theorem false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf
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
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementCnf
#print axioms canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCell
#print axioms false_of_all_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmansonRefinementsPhysicalSliceCoverage
end Problem97
