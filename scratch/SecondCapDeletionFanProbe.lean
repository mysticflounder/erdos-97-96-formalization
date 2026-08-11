/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-!
# Second-cap deletion fan probe

Scratch-only assembly of the second-cap deletion fan from the pentagon
off-class producer lemmas.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The points of the physical second cap outside the selected `xv` row form
a four-point fan of deletions surviving at both the row blocker and the
physical second apex. -/
theorem pentagonOffClass_secondCap_deletionFan_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    let Kxv :=
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    4 ≤ T.card ∧
      ∀ q ∈ T,
        Nonempty
          (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) q
            ((lateFirstApexSystem R).centerAt packet.xv hxvA)
            S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  change 4 ≤ T.card ∧
    ∀ q ∈ T,
      Nonempty
        (CommonDeletionTwoCenterPacket D Hlate q
          (Hlate.centerAt packet.xv hxvA) S.oppApex2)
  have hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2 :=
    exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior P packet
  have hblockerInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 := by
    have hxvInter :
        packet.xv ∈
          (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.opposite_row_trace]
      simp
    have hxvClass :
        packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
      (Finset.mem_inter.mp hxvInter).2
    let Ku :=
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
    have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
      simpa [Hlate, P.huSource] using packet.blocker_eq_xv
    have hxvNotURow : packet.xv ∉ Ku.support := by
      intro h
      rw [← hcenterU] at h
      exact Ku.center_not_mem_support h
    have huNeXv : P.u.1 ≠ packet.xv := by
      intro h
      apply hxvNotURow
      simpa only [← h] using Ku.q_mem_support
    have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
      have hmem :
          P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
        rw [packet.source_pair_interior]
        simp
      exact (Finset.mem_inter.mp hmem).2
    have hblockerA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
      Finset.mem_of_mem_erase Kxv.center_mem
    have hblockerNeApex :
        Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
    have hblockerEq :
        dist (Hlate.centerAt packet.xv hxvA) packet.xv =
          dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
      (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
        (Kxv.support_eq_radius _ huXvRow).symm
    have hphysicalEq :
        dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
      (mem_selectedClass.mp hxvClass).2.trans
        (mem_selectedClass.mp P.huClass).2.symm
    exact commonPhysicalPair_center_mem_secondCapInterior hblockerA
      hblockerNeApex hxvInterior huInterior huNeXv.symm hblockerEq hphysicalEq
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  have hcapCard : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    simpa only [hcapEq] using hsecond
  have hblockerCap :
      Hlate.centerAt packet.xv hxvA ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hinterLe :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [Kxv] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass hblockerCap
  have hsplit :
      T.card + (Kxv.support ∩ S.capByIndex S.oppIndex2).card =
        (S.capByIndex S.oppIndex2).card := by
    simpa [T, Finset.inter_comm] using
      Finset.card_sdiff_add_card_inter
        (S.capByIndex S.oppIndex2) Kxv.support
  refine ⟨by omega, ?_⟩
  intro q hqT
  have hqCap : q ∈ S.capByIndex S.oppIndex2 :=
    (Finset.mem_sdiff.mp hqT).1
  have hqNotRow : q ∉ Kxv.support :=
    (Finset.mem_sdiff.mp hqT).2
  have hqA : q ∈ D.A := S.capByIndex_subset S.oppIndex2 hqCap
  have hblockerA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
    Finset.mem_of_mem_erase Kxv.center_mem
  have hapexA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcenters :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  exact nonempty_commonDeletionTwoCenterPacket Hlate hqA hblockerA hapexA
    hcenters
    (selectedFourClass_survives_erase_of_not_mem
      Kxv.toSelectedFourClass hqNotRow)
    (P.surface.secondApex_robust.survives q hqA)

#print axioms pentagonOffClass_secondCap_deletionFan_probe

end ATailFrontierLiveClosure
end Problem97
