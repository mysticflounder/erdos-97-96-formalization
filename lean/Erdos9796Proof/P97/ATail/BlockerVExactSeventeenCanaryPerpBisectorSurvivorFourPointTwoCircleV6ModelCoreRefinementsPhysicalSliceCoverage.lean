/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage after the V6 model-core successor

The 7,409,788-clause V6 root is restricted to the inherited 76 source-total
physical cells.  The V7 preparer uses this module as its exact immediate-parent
prefix witness; V6 itself is not a production solver campaign.

The bounded reuse preflight at source revision `f8b3b1ce` found only the V4 and
V5 physical coordinators and no root-parametric theorem.  This module therefore
transports the committed V6 source theorem to the same partition.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

def canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf
      center category).length = 7409794 := by
  cases category <;>
    simp [canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf,
      canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf
    source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

#print axioms canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCellCnf_length
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementPhysicalSliceCell

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementsPhysicalSliceCoverage
end Problem97
