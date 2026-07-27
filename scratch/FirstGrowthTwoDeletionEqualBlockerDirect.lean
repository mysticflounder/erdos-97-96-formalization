/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# First-growth two-deletion equal-blocker arm

Trust-clean direct closure of the equal-blocker arm in the specialized
first-growth two-deletion packet.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the first-growth specialization, the two prescribed deleted sources
`v` and the original rigid deletion cannot have the same actual blocker.

Indeed, equal actual blockers make their complete canonical selected supports
equal.  The rigid deletion belongs to its own selected support, hence it would
belong to the row at `v`, contradicting the original joint-deletion packet.
This closes the equal-blocker arm without the generic
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
terminal. -/
theorem
    exactFourRigid221_firstGrowth_v_originalDeleted_actualBlockers_ne_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠
      (lateFirstApexSystem R).centerAt
        P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 := by
  intro hcenters
  have hsupports :
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem R) P.v.2 P.jointDeletion.deleted.2 hcenters
  apply P.jointDeletion.deleted_not_mem_vRow
  rw [hsupports]
  exact
    ((lateFirstApexSystem R).selectedAt
      P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support

#print axioms
  exactFourRigid221_firstGrowth_v_originalDeleted_actualBlockers_ne_direct
#print axioms false_of_twoDistinctExactFourMutualOmissionJointDeletions

end ATailFrontierLiveClosure
end Problem97
