/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage

/-!
# Physical-slice coverage for the exact-17 canary two-Kalmanson successor

The Lean-owned root is partitioned by every source-valid next-center and
physical-class category. A checked coordinator must provide one UNSAT theorem
for each of the 76 cells.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson

/-- The canary successor restricted to one source-valid physical-slice cell. -/
def sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
    (center : Label) (category : PhysicalSliceCategory) : Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf ++
    sparseSixPointNextCenterUnitCnf center ++
    physicalSliceUnitCnf center category

theorem sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf_length
    (center : Label) (category : PhysicalSliceCategory) :
    (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
      center category).length = 7409292 := by
  cases category <;>
    simp [
      sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf,
      extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf_length,
      sparseSixPointNextCenterUnitCnf, physicalSliceUnitCnf, physicalList]

/-- An order-zero source realization satisfies its matching refined cell. -/
theorem sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (horder : source.model.order = 0)
    {center : Label} (hcenter : source.model.nextCenter = center)
    {category : PhysicalSliceCategory}
    (hmatch : category.Matches source.model center) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
        center category) = true := by
  rw [
    sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf,
    Std.Sat.CNF.eval_append, Std.Sat.CNF.eval_append]
  rw [
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonCnf
      source horder]
  rw [sourceAssign_sparseSixPointNextCenterUnit source.model hcenter]
  simp [sourceAssign_physicalSliceUnitCnf source.model center category hmatch]

/-- Checked UNSAT for every refined cell excludes every order-zero source. -/
theorem false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ∀ category, category ∈ physicalSliceCategories center →
        ¬ ∃ assignment,
          Std.Sat.CNF.eval assignment
            (sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf
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
      sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCell
        source horder rfl hmatch⟩

#print axioms
  sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellCnf_length
#print axioms
  sourceAssign_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCell
#print axioms
  false_of_all_sparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCells

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorEightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage
end Problem97
