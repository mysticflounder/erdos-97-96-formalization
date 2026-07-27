/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherVHeavyDirect

/-!
# Exact-four source-equals-u cross-row branch: exact-five deletion residual

The direct `vHeavy` packet fixes the three interior points, the two adjacent
points, and their common-boundary order when the physical second cap has five
points.  This file also consumes global deletion minimality.  The deleted set
is a genuine pair, and both of its points belong to the five explicitly named
points of the physical radius class.

This does not assert a false geometric exclusion: the equal-distance-collision
alternative in the global deletion geometry is compatible with this five-point
shell.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Source-clean exact-five residual for the `vHeavy` branch.

In addition to the synchronized boundary conclusion of the direct theorem,
global deletion minimality identifies the deletion as a two-element subset of
the five named points in the physical radius class. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_exactFiveDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.v.1, xv})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.v.1, xv}) :
    S.oppCap2.card = 5 →
      ∃ a b : ℝ²,
        a ≠ b ∧
        P.globalDeletion.deleted = {a, b} ∧
        a ∈ insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
        b ∈ insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
        (SelectedClass D.A S.oppApex2 P.rho \
            P.globalDeletion.deleted).card = 3 ∧
        S.capInteriorByIndex S.oppIndex2 =
          {P.u.1, P.v.1, xv} ∧
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∧
        (P.other = P.v ∨ P.other.1 = xv) ∧
        ((xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
              P.jointDeletion.deleted.1 ∈
                S.rightAdjacentCapByIndex S.oppIndex2) ∨
          (P.jointDeletion.deleted.1 ∈
              S.leftAdjacentCapByIndex S.oppIndex2 ∧
            xu ∈ S.rightAdjacentCapByIndex S.oppIndex2)) ∧
        ∃ (card_pos : 0 < D.A.card)
            (boundary : Fin D.A.card → ℝ²)
            (source_index xu_index v_index xv_index : Fin D.A.card),
          Function.Injective boundary ∧
          Finset.univ.image boundary = D.A ∧
          EuclideanGeometry.IsCcwConvexPolygon boundary ∧
          boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
          boundary source_index = P.u.1 ∧
          boundary xu_index = xu ∧
          boundary v_index = P.v.1 ∧
          boundary xv_index = xv ∧
          ((v_index < source_index ∧
              source_index < xv_index ∧
              xv_index < xu_index) ∨
            (xu_index < xv_index ∧
              xv_index < source_index ∧
              source_index < v_index)) := by
  classical
  intro hfive
  have hdirect :=
    exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_direct
      P hblockerVRow hblockerNeV xu xv terminal blocker_eq
        pair_interior blocker_interior row_cap_trace
  rcases hdirect with
    ⟨_, _, _, _, _, _, _, _, _, hexactFive⟩
  have hpacket := hexactFive hfive
  have hdeletedCard : P.globalDeletion.deleted.card = 2 :=
    exactFourRigid221_physicalApex_deleted_card_eq_two
      P.hrho P.hclassFive P.globalDeletion P.hcenter
  obtain ⟨a, b, hab, hdeleted⟩ :=
    Finset.card_eq_two.mp hdeletedCard
  have haDeleted : a ∈ P.globalDeletion.deleted := by
    rw [hdeleted]
    simp
  have hbDeleted : b ∈ P.globalDeletion.deleted := by
    rw [hdeleted]
    simp
  have haClass :=
    P.globalDeletion.deleted_subset_class haDeleted
  have hbClass :=
    P.globalDeletion.deleted_subset_class hbDeleted
  rw [terminal.named_rows.physical_class] at haClass hbClass
  have hremainingCard :
      (SelectedClass D.A S.oppApex2 P.rho \
        P.globalDeletion.deleted).card = 3 := by
    rw [Finset.card_sdiff_of_subset
      P.globalDeletion.deleted_subset_class, P.hclassFive, hdeletedCard]
  exact
    ⟨a, b, hab, hdeleted, haClass, hbClass, hremainingCard, hpacket⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_exactFiveDeletion

end ATailFrontierLiveClosure
end Problem97
