/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherExceptionalExclusion

/-!
# Exact-four source-equals-u exceptional arm: direct leaf frontier

This file flattens the checked exceptional exclusion residual into its five
honest constructor-facing leaves.  In the first placement/orientation branch,
the already-checked Kalmanson argument removes the equality case and records
the two remaining strict metric orientations separately.

No closer hypothesis is introduced.  Each constructor below is therefore a
genuine residual obligation rather than a conditional contradiction wrapper.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

/-- The five direct leaves of the exceptional
`sourceEqU_blockerVRowOther` arm.

The first two constructors are the strict metric split of the
`other = deleted`, `v ∈ J`, `xv ∉ J` branch.  The remaining three constructors
are the other checked placement/orientation branches. -/
inductive ExactFourRigid221SourceEqUVRowOtherExceptionalDirectLeaves
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) : Prop
  | otherDeletedVInteriorCloserToDeleted
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_deleted : P.other = P.jointDeletion.deleted)
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_mem_interior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_mem_interior : xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1})
      (distance_lt :
        dist xv P.jointDeletion.deleted.1 < dist xv P.v.1)
  | otherDeletedVInteriorCloserToV
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_deleted : P.other = P.jointDeletion.deleted)
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_mem_interior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_mem_interior : xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1})
      (distance_lt :
        dist xv P.v.1 < dist xv P.jointDeletion.deleted.1)
  | otherDeletedXvInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_deleted : P.other = P.jointDeletion.deleted)
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_not_mem_interior : P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_mem_interior : xv ∈ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {xv})
  | otherVInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_eq_v : P.other = P.v)
      (v_mem_interior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_mem_interior : xv ∉ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {P.v.1})
  | otherXvInterior
      (cap_profile : ExactFourRigid221SourceEqUVRowOtherCapProfile S)
      (other_point_eq_xv : P.other.1 = xv)
      (v_not_mem_interior : P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_mem_interior : xv ∈ S.capInteriorByIndex S.oppIndex2)
      (v_pair_trace :
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {xv})

/-- Checked production-facing coordinator for the five exceptional leaves. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_directLeaves
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) :
    ExactFourRigid221SourceEqUVRowOtherExceptionalDirectLeaves
      P xu xv terminal blocker_eq packet := by
  rcases
      exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_exclusion_residual
        P xu xv terminal blocker_eq packet with
    ⟨capProfile, otherEqDeleted, deletedMem, vMem, xvNotMem, pairTrace⟩ |
    ⟨capProfile, otherEqDeleted, deletedMem, vNotMem, xvMem, pairTrace⟩ |
    ⟨capProfile, otherEqV, vMem, xvNotMem, pairTrace⟩ |
    ⟨capProfile, otherPointEqXv, vNotMem, xvMem, pairTrace⟩
  · let branch :
        ExactFourRigid221SourceEqUVRowOtherDeletedVInteriorData
          P xu xv terminal blocker_eq packet :=
      { cap_profile := capProfile
        other_eq_deleted := otherEqDeleted
        deleted_mem_interior := deletedMem
        v_mem_interior := vMem
        xv_not_mem_interior := xvNotMem
        v_pair_trace := pairTrace }
    rcases
        exactFourRigid221_sourceEqU_blockerVRowOther_otherDeletedVInterior_metricResidual
          P xu xv terminal blocker_eq packet branch with
      hlt | hlt
    · exact .otherDeletedVInteriorCloserToDeleted
        capProfile otherEqDeleted deletedMem vMem xvNotMem pairTrace hlt
    · exact .otherDeletedVInteriorCloserToV
        capProfile otherEqDeleted deletedMem vMem xvNotMem pairTrace hlt
  · exact .otherDeletedXvInterior
      capProfile otherEqDeleted deletedMem vNotMem xvMem pairTrace
  · exact .otherVInterior
      capProfile otherEqV vMem xvNotMem pairTrace
  · exact .otherXvInterior
      capProfile otherPointEqXv vNotMem xvMem pairTrace

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_directLeaves

end ATailFrontierLiveClosure
end Problem97
