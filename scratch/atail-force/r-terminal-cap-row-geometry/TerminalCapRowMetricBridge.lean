/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DangerousRowCoupling
import TerminalThreePointResidual

/-!
# Metric bridge for the terminal three-point cap-row residual

The retained source row is an exact critical shell.  Therefore one additional
distance equality is enough to turn the unique second-apex-row terminal hit
into a common point of both retained rows, contradicting the checked terminal
normal form.

This is a conditional consumer, not a producer of the distance equality.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalCapRowGeometryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRFrontierProgressAuditScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTerminalThreePointResidualScratch
open ATailSubcarrierTerminalInvariantScratch

/-- The smallest source-circle metric bridge for the terminal residual.

The point is already a terminal marginal member of the retained second-apex
row.  The sole new geometric content is that it lies at the exact source-row
radius about `R.firstCenter`. -/
theorem false_of_secondApexMarginal_hit_on_sourceCircle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hmetric : ∃ z : ℝ²,
      z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
      z ∈ R.secondApexRow.support ∧
      dist R.firstCenter z = R.sourceRow.radius) :
    False := by
  rcases hmetric with ⟨z, hzMarginal, hzSecond, hzDistance⟩
  have hzCarrier :
      z ∈ T.carrier :=
    (mem_selectedClass.mp (Finset.mem_sdiff.mp hzMarginal).1).1
  have hzSource : z ∈ R.sourceRow.support :=
    R.sourceRow.off_row_named_label_forbidden
      (T.carrier_subset hzCarrier) hzDistance
  exact false_of_common_terminalMarginal_rowPoint C
    ⟨z, hzMarginal, hzSource, hzSecond⟩

/-- Parent-aligned form of the same missing incidence.

Once the coherent blocker is the live center `p`, the exact source row is the
dangerous base.  Hence placing the unique second-apex-row terminal hit in that
base closes the residual immediately. -/
theorem false_of_aligned_secondApexMarginal_hit_in_dangerousBase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hcenter : R.firstCenter = p)
    (hhit : ∃ z : ℝ²,
      z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
      z ∈ R.secondApexRow.support ∧
      z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    False := by
  rcases hhit with ⟨z, hzMarginal, hzSecond, hzBase⟩
  have hrow :=
    W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter
  have hzSource : z ∈ R.sourceRow.support := by
    rw [hrow]
    exact hzBase
  exact false_of_common_terminalMarginal_rowPoint C
    ⟨z, hzMarginal, hzSource, hzSecond⟩

#print axioms false_of_secondApexMarginal_hit_on_sourceCircle
#print axioms false_of_aligned_secondApexMarginal_hit_in_dangerousBase

end ATailRTerminalCapRowGeometryScratch
end Problem97
