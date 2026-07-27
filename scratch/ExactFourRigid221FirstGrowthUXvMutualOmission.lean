import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# First-growth `u`/`xv` mutual-omission audit

This scratch module independently checks the incidence coordinator and prints
the axiom frontier of every branch it consumes.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

/--
Scratch-only acyclic coordinator for the first-growth `u`/`xv`
mutual-omission residual.  It invokes only the four branch theorems declared
before the production coordinator.
-/
theorem scratch_false_of_exactFourRigid221_firstGrowth_uXvMutualOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  by_cases hxuXvRow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_xuXvRow
        P packet W hxvA huNotXvRow hxuXvRow
  by_cases hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_vXvRow_direct
        P packet W hxvA huNotXvRow hxuXvRow hvXvRow
  by_cases hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_deletedXvRow_direct
        P packet W hxvA huNotXvRow hxuXvRow hdeletedXvRow
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_twoDeletions
      P packet W hxvA huNotXvRow hvXvRow hdeletedXvRow

#print axioms scratch_false_of_exactFourRigid221_firstGrowth_uXvMutualOmission
#print axioms
  false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_xuXvRow
#print axioms
  false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_vXvRow_direct
#print axioms
  false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_deletedXvRow_direct
#print axioms
  false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_twoDeletions
#print axioms
  false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
#print axioms
  false_of_twoDistinctExactFourMutualOmissionJointDeletions
#print axioms
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
#print axioms
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters
#print axioms
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
#print axioms
  false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
#print axioms
  false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare

end ATailFrontierLiveClosure
end Problem97
