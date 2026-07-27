/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveFirstHitBadClosure

/-!
# Exact-five `u`-heavy source coordinator

The two named strict-interior companions either yield a genuinely new
good-source restart or include an interior-pair bad source.  In the latter
case the bad source forces the first opposite cap to grow.  In the former
case the checked old/new deletion comparison gives three explicit,
context-complete residuals.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Exhaustive, source-clean frontier after coordinating the named
strict-interior sources in the exact-five `u`-heavy branch. -/
inductive ExactFourRigid221UHeavyExactFiveSourceCoordinatorAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop
  | firstOppCapGrowth
      (firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card)
  | oldDeletedInRegeneratedRow
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (old_deleted_mem_row :
        P.jointDeletion.deleted.1 ∈
            ((lateFirstApexSystem R).selectedAt
              Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∨
          P.jointDeletion.deleted.1 ∈
            ((lateFirstApexSystem R).selectedAt
              Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support)
      (new_deleted_ne_old :
        Q.jointDeletion.deleted ≠ P.jointDeletion.deleted)
  | secondJointDeletion
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (second :
        ExactFourMutualOmissionJointDeletion
          R P.rho Q.mutualU Q.mutualV)
      (second_ne_first :
        second.deleted ≠ Q.jointDeletion.deleted)
  | commonOldDeletion
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (new_deleted_eq_old :
        Q.jointDeletion.deleted = P.jointDeletion.deleted)
      (old_deleted_not_mem_u_row :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support)
      (old_deleted_not_mem_v_row :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support)

private theorem exactFourRigid221_uHeavy_exactFive_goodSource_coordinator
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource) :
    ExactFourRigid221UHeavyExactFiveSourceCoordinatorAlternative P := by
  rcases
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_oldDeleted_split
        P goodSource Q with hrow | hsecond | hcommon
  · exact .oldDeletedInRegeneratedRow
      goodSource Q hrow.1 hrow.2
  · obtain ⟨second, hsecondNe⟩ := hsecond
    exact .secondJointDeletion goodSource Q second hsecondNe
  · exact .commonOldDeletion
      goodSource Q hcommon.1 hcommon.2.1 hcommon.2.2

/-- The checked exact-five source coordinator.  The four-way named-source
dichotomy is consumed immediately: either a good source is regenerated and
classified by its old/new deletion relation, or a bad source supplies strict
first-opposite-cap growth. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceCoordinator
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2) :
    ExactFourRigid221UHeavyExactFiveSourceCoordinatorAlternative P := by
  obtain
    ⟨xuSource, xvSource, _, _, hxuNeSource, hxvNeSource, _,
      hxuClass, hxvClass, hxuInterior, hxvInterior, hcases⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceDichotomy
      P xu xv terminal blocker_eq pair_interior blocker_interior
  rcases hcases with hxuGood | hxvGood | hxuFirstXvBad | hxvFirstXuBad
  · obtain ⟨Q⟩ :=
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_restart
        P xuSource hxuNeSource hxuClass hxuInterior hxuGood
    exact exactFourRigid221_uHeavy_exactFive_goodSource_coordinator
      P xuSource Q
  · obtain ⟨Q⟩ :=
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_restart
        P xvSource hxvNeSource hxvClass hxvInterior hxvGood
    exact exactFourRigid221_uHeavy_exactFive_goodSource_coordinator
      P xvSource Q
  · exact .firstOppCapGrowth
      (firstOppCap_card_ge_five_of_interiorPairBadOutsideSource
        hxuFirstXvBad.2)
  · exact .firstOppCapGrowth
      (firstOppCap_card_ge_five_of_interiorPairBadOutsideSource
        hxvFirstXuBad.2)

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceCoordinator

end ATailFrontierLiveClosure
end Problem97
