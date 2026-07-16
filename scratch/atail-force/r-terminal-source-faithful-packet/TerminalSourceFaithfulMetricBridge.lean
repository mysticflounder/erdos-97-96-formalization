/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TerminalSourceFaithfulPacket
import TerminalCapRowMetricBridge

/-!
# Named metric bridge for the source-faithful terminal packet

The source-faithful constructor names the unique marginal hit of the original
double-erased second-apex row.  Closure of the terminal residual is therefore
reduced to one scalar equality for that exact point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalSourceFaithfulPacketScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailRFrontierProgressAuditScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTerminalCapRowGeometryScratch
open ATailRTerminalThreePointResidualScratch
open ATailSubcarrierTerminalInvariantScratch

namespace SourceFaithfulTerminalCommonDeletionPacket

/-- The final generic terminal producer is one distance equality for the
named hit of the original double-erased second-apex row. -/
theorem false_of_terminalSecondRowHit_on_sourceCircle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hmetric :
      dist W.coherent.firstCenter (W.terminalSecondRowHit C) =
        W.coherent.sourceRow.radius) :
    False := by
  apply false_of_secondApexMarginal_hit_on_sourceCircle C
  refine ⟨W.terminalSecondRowHit C,
    W.terminalSecondRowHit_mem_selectedMarginal C, ?_, hmetric⟩
  rw [W.secondApexRow_support_eq]
  exact W.terminalSecondRowHit_mem_terminalSecondApexRow C

/-- In the aligned dangerous-retaining parent, it is enough to place the
same named hit in the dangerous base. -/
theorem false_of_aligned_terminalSecondRowHit_in_dangerousBase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {Wlive : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (W : SourceFaithfulTerminalCommonDeletionPacket T P Wlive.H)
    {A : AnchoredSourceCriticalTransition W.coherent}
    (C : TerminalThreePointTwoRowCoverResidual A)
    (hcenter : W.coherent.firstCenter = p)
    (hhit :
      W.terminalSecondRowHit C ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    False := by
  apply false_of_aligned_secondApexMarginal_hit_in_dangerousBase
    C hcenter
  refine ⟨W.terminalSecondRowHit C,
    W.terminalSecondRowHit_mem_selectedMarginal C, ?_, hhit⟩
  rw [W.secondApexRow_support_eq]
  exact W.terminalSecondRowHit_mem_terminalSecondApexRow C

#print axioms false_of_terminalSecondRowHit_on_sourceCircle
#print axioms false_of_aligned_terminalSecondRowHit_in_dangerousBase

end SourceFaithfulTerminalCommonDeletionPacket

end ATailRTerminalSourceFaithfulPacketScratch
end Problem97
