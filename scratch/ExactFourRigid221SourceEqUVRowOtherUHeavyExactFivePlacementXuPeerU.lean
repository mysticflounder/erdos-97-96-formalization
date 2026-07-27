/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveKalmanson

/-!
# Exact-five `u`-heavy placement `goodSource = xu`, `omittedPeer = u`

In this placement the original `u` row contains the regenerated source `xu`,
whereas the regenerated `xu` row omits `u`.  Deleting `u` therefore preserves
K4 simultaneously at the regenerated blocker and at the physical second
apex.  The regenerated joint deletion is one of the three remaining named
points: the old deletion, `v`, or `xv`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The concrete `xu/u` placement supplies an asymmetric selected-row edge,
a common deletion at `u` for the regenerated blocker and the physical apex,
and a three-point localization of every regenerated joint deletion. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u
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
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXu : goodSource.1 = xu)
    (hpeerU : Q.omittedPeer.1 = P.u.1) :
    goodSource.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt
          goodSource.1 goodSource.2 ≠ xv ∧
      Nonempty
        (CommonDeletionTwoCenterPacket
          D (lateFirstApexSystem R) P.u.1
          ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2)
          S.oppApex2) ∧
      ∃ K : ExactFourMutualOmissionJointDeletion
          R P.rho goodSource Q.omittedPeer,
        K.deleted = P.jointDeletion.deleted ∨
          K.deleted = P.v ∨ K.deleted.1 = xv := by
  classical
  let Hlate := lateFirstApexSystem R
  have hpeerCarrier : Q.omittedPeer = P.u := by
    apply Subtype.ext
    exact hpeerU
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hgoodMemURow :
      goodSource.1 ∈
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    have hxuInter :
        xu ∈
          (Hlate.selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [terminal.named_rows.u_row_trace]
      simp
    simpa only [hgoodXu] using (Finset.mem_inter.mp hxuInter).1
  have huNotGoodRow :
      P.u.1 ∉
        (Hlate.selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support := by
    simpa only [hpeerCarrier] using Q.omittedPeer_not_mem_good_row
  have hgoodBlockerNeXv :
      Hlate.centerAt goodSource.1 goodSource.2 ≠ xv := by
    intro hgoodBlocker
    apply Q.good_peer_blockers_ne
    rw [hpeerCarrier, hblockerEqU]
    exact hgoodBlocker
  have hgoodBlockerA :
      Hlate.centerAt goodSource.1 goodSource.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (Hlate.blockerVertex goodSource).2
  have happ2A : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hgoodBlockerNeApex :
      Hlate.centerAt goodSource.1 goodSource.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      Hlate goodSource.1 goodSource.2
  have hgoodSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt goodSource.1 goodSource.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      Hlate goodSource.2).mpr huNotGoodRow
  have happ2SurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2 :=
    P.surface.secondApex_robust.survives P.u.1 P.u.2
  rcases
      nonempty_commonDeletionTwoCenterPacket
        Hlate P.u.2 hgoodBlockerA happ2A hgoodBlockerNeApex
          hgoodSurvivesDeleteU happ2SurvivesDeleteU with
    ⟨commonPacket⟩
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R P.surface P.rho P.hfive goodSource Q.omittedPeer
          Q.good_peer_blockers_ne with
    ⟨K⟩
  have hdeletedTernary :
      K.deleted = P.jointDeletion.deleted ∨
        K.deleted = P.v ∨ K.deleted.1 = xv := by
    have hmem := K.deleted_mem_class
    rw [terminal.named_rows.physical_class] at hmem
    simp only [Finset.mem_insert, Finset.mem_union,
      Finset.mem_singleton] at hmem
    rcases hmem with hold | (hu | hxu) | hv | hxv
    · exact Or.inl (Subtype.ext hold)
    · exfalso
      apply K.deleted_ne_v
      apply Subtype.ext
      exact hu.trans hpeerU.symm
    · exfalso
      apply K.deleted_ne_u
      apply Subtype.ext
      exact hxu.trans hgoodXu.symm
    · exact Or.inr (Or.inl (Subtype.ext hv))
    · exact Or.inr (Or.inr hxv)
  exact
    ⟨hgoodMemURow, huNotGoodRow, hgoodBlockerNeXv,
      ⟨commonPacket⟩, K, hdeletedTernary⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u

end ATailFrontierLiveClosure
end Problem97
