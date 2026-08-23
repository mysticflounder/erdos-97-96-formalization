/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements

/-!
# Combined source-valid exact-seventeen v4 refinement successor

The production suffix is the duplicate-free union of the 236 two-Kalmanson
clauses and the eight other-core clauses.  The separately banked eight
FourPoint-core clauses are already contained in the two-Kalmanson family.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements

def fourPointTwoCircleV4CombinedRefinementClauses : Std.Sat.CNF Atom :=
  v4TwoKalmansonRefinementClauses ++
    fourPointTwoCircleV4OtherCoreRefinementClauses

theorem fourPointTwoCircleV4CombinedRefinementClauses_length :
    fourPointTwoCircleV4CombinedRefinementClauses.length = 244 := by
  simp [fourPointTwoCircleV4CombinedRefinementClauses,
    v4TwoKalmansonRefinementClauses_length,
    fourPointTwoCircleV4OtherCoreRefinementClauses_length]

theorem fourPointTwoCircleV4CombinedRefinementClauses_nodup :
    fourPointTwoCircleV4CombinedRefinementClauses.Nodup := by
  native_decide

theorem fourPointTwoCircleV4CoreRefinementClauses_subset_combined :
    ∀ clause ∈ fourPointTwoCircleV4CoreRefinementClauses,
      clause ∈ fourPointTwoCircleV4CombinedRefinementClauses := by
  native_decide

theorem sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleV4CombinedRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with htwoK | hother
  · exact sourceAssign_v4TwoKalmansonRefinementClauses source clause htwoK
  · exact sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses
      source clause hother

def canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    fourPointTwoCircleV4CombinedRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf.length =
      7409760 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    fourPointTwoCircleV4CombinedRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
      source clause hsuffix

#print axioms fourPointTwoCircleV4CombinedRefinementClauses_nodup
#print axioms fourPointTwoCircleV4CoreRefinementClauses_subset_combined
#print axioms sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements
end Problem97
