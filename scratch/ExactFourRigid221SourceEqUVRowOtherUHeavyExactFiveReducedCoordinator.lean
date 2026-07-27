/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveCoordinator

/-!
# Exact-five `u`-heavy reduced source coordinator

The source coordinator can expose two distinct joint deletions for the
regenerated mutually omitted pair.  That alternative is already impossible
by the production two-deletion theorem.  Consuming it here leaves only first
opposite-cap growth and the two precise placements of the original deleted
source relative to the regenerated rows.
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

/-- The source coordinator after eliminating its impossible two-deletion
branch.  Both surviving regenerated-source cases retain the complete restart
packet and the exact relation between the old and new deleted sources. -/
inductive ExactFourRigid221UHeavyExactFiveReducedCoordinatorAlternative
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

/-- Exact-five source coordination with the impossible second-deletion arm
discharged immediately. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_reducedCoordinator
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
    ExactFourRigid221UHeavyExactFiveReducedCoordinatorAlternative P := by
  rcases
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceCoordinator
        P xu xv terminal blocker_eq pair_interior blocker_interior with
    hgrowth | ⟨goodSource, Q, hrow, hne⟩ |
      ⟨goodSource, Q, second, hsecondNe⟩ |
      ⟨goodSource, Q, heq, hnotU, hnotV⟩
  · exact .firstOppCapGrowth hgrowth
  · exact .oldDeletedInRegeneratedRow goodSource Q hrow hne
  · exact False.elim
      (false_of_twoDistinctExactFourMutualOmissionJointDeletions
        R P.hcard P.surface P.rho P.hrho P.hfive
        Q.mutualU Q.mutualV Q.mutual_ne
        Q.mutualU_mem_class Q.mutualV_mem_class
        Q.mutualV_not_mem_u_row Q.mutualU_not_mem_v_row
        Q.jointDeletion second hsecondNe.symm)
  · exact .commonOldDeletion goodSource Q heq hnotU hnotV

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_reducedCoordinator

end ATailFrontierLiveClosure
end Problem97
