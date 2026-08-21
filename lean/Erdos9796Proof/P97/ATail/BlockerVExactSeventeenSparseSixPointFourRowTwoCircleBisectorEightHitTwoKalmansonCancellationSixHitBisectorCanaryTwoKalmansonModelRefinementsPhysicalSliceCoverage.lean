/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage for the exact-17 canary two-Kalmanson model refinement

The Lean-owned model-refinement root is partitioned by every source-valid
next-center and physical-class category. A checked coordinator must provide
one UNSAT theorem for each of the 76 cells.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinementsPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements

/-- The model-refinement successor restricted to one source-valid physical-slice cell. -/
def sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf
      center category).length = 7409301 := by
  cases category <;>
    simp [
      sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf,
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf
        center category) = true := by
  rw [
    sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementCnf
      source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- Checked UNSAT for every refined cell excludes every order-zero source. -/
theorem false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf
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
      sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms
  sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCellCnf_length
#print axioms
  sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCell
#print axioms
  false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCells

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinementsPhysicalSliceCoverage
end Problem97
