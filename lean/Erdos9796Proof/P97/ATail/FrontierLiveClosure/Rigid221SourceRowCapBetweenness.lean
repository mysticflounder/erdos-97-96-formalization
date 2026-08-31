/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-!
# Source-row cap betweenness

This module extracts the ordered-cap consequence of the source-row-heavy
blocker-`v` branch of the rigid `2+2+1` placement.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the source-row-heavy blocker-`v` branch, the rigid source row has a
second physical point in the strict second-cap interior.  In any ordered-cap
presentation of that cap, the blocker index lies strictly between the source
index and this partner index. -/
theorem exists_sourceRow_partner_with_blocker_index_strictly_between
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    ∃ partner : ℝ²,
      partner ≠ P.source.1 ∧
      partner ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      partner ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      (∀ z,
        z ∈
            ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support →
          z ∈ SelectedClass D.A S.oppApex2 P.rho →
          z ≠ P.source.1 → z = partner) ∧
      P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      partner ∈ S.capInteriorByIndex S.oppIndex2 ∧
      dist P.v.1 P.source.1 = dist P.v.1 partner ∧
      ∃ B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2),
        ∃ sourceIndex blockerIndex partnerIndex : Fin B.m,
          B.L.points sourceIndex = P.source.1 ∧
          B.L.points blockerIndex = P.v.1 ∧
          B.L.points partnerIndex = partner ∧
          ((sourceIndex < blockerIndex ∧ blockerIndex < partnerIndex) ∨
            (partnerIndex < blockerIndex ∧ blockerIndex < sourceIndex)) := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := K.support ∩ C
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = P.v.1 := by
    simpa only [P.huSource] using hblocker
  have hICard : I.card = 2 := by
    rcases P.globalDeletion.rigid with
      ⟨hIuCard, _hIvCard, _hdisjoint, _hcover⟩
    simpa [I, K, C] using hIuCard
  have hIInteriorCard :
      (I ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      I, K, C] using hsourceRowHeavy
  have hIInteriorEq :
      I ∩ S.capInteriorByIndex S.oppIndex2 = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    omega
  have hsourceI : P.source.1 ∈ I := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · simpa [K, P.huSource] using K.q_mem_support
    · simpa [C, P.huSource] using P.huClass
  obtain ⟨partner, hpartnerI, hpartnerNeSource⟩ :=
    Finset.exists_mem_ne (by omega : 1 < I.card) P.source.1
  have hpairEqI : ({P.source.1, partner} : Finset ℝ²) = I := by
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hsourceI
      · exact hpartnerI
    · rw [Finset.card_pair hpartnerNeSource.symm]
      omega
  have hpartnerUnique :
      ∀ z, z ∈ K.support → z ∈ C → z ≠ P.source.1 → z = partner := by
    intro z hzSupport hzClass hzNeSource
    have hzI : z ∈ I := Finset.mem_inter.mpr ⟨hzSupport, hzClass⟩
    rw [← hpairEqI] at hzI
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzI
    rcases hzI with hzSource | hzPartner
    · exact False.elim (hzNeSource hzSource)
    · exact hzPartner
  have hsourceInterior :
      P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    have : P.source.1 ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
      rw [hIInteriorEq]
      exact hsourceI
    exact (Finset.mem_inter.mp this).2
  have hpartnerInterior :
      partner ∈ S.capInteriorByIndex S.oppIndex2 := by
    have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
      rw [hIInteriorEq]
      exact hpartnerI
    exact (Finset.mem_inter.mp this).2
  have hpartnerData := Finset.mem_inter.mp hpartnerI
  have hsourceSupport : P.source.1 ∈ K.support :=
    (Finset.mem_inter.mp hsourceI).1
  have hequidistant :
      dist P.v.1 P.source.1 = dist P.v.1 partner := by
    simpa [K, hblockerU] using
      (K.support_eq_radius P.source.1 hsourceSupport).trans
        (K.support_eq_radius partner hpartnerData.1).symm
  obtain ⟨B⟩ := S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2
  have hsourceCap : P.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hsourceInterior
  have hblockerInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    blockerV_sourceRowHeavy_v_mem_secondCapInterior P hblocker hsourceRowHeavy
  have hblockerCap : P.v.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hpartnerCap : partner ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hpartnerInterior
  have hsourceImage : P.source.1 ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hsourceCap
  have hblockerImage : P.v.1 ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hblockerCap
  have hpartnerImage : partner ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hpartnerCap
  rcases Finset.mem_image.mp hsourceImage with ⟨sourceIndex, _, hsourceIndex⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨blockerIndex, _, hblockerIndex⟩
  rcases Finset.mem_image.mp hpartnerImage with ⟨partnerIndex, _, hpartnerIndex⟩
  have hblockerNeSource : P.v.1 ≠ P.source.1 := by
    intro h
    apply ATailMinimalUniqueFourCover.centerAt_ne_source
      (lateFirstApexSystem R) P.source.1 P.source.2
    rw [hblocker, h]
  have hblockerNePartner : P.v.1 ≠ partner := by
    intro h
    have hcenterEqPartner :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = partner :=
      hblockerU.trans h
    exact K.center_not_mem_support (hcenterEqPartner ▸ hpartnerData.1)
  have hsourceIndexNeBlocker : sourceIndex ≠ blockerIndex := by
    intro h
    apply hblockerNeSource
    rw [← hblockerIndex, ← hsourceIndex, h]
  have hblockerIndexNeSource : blockerIndex ≠ sourceIndex :=
    hsourceIndexNeBlocker.symm
  have hblockerIndexNePartner : blockerIndex ≠ partnerIndex := by
    intro h
    apply hblockerNePartner
    rw [← hblockerIndex, ← hpartnerIndex, h]
  have hsourceIndexNePartner : sourceIndex ≠ partnerIndex := by
    intro h
    apply hpartnerNeSource
    rw [← hpartnerIndex, ← hsourceIndex, h]
  have hindexEquidistant :
      dist (B.L.points blockerIndex) (B.L.points sourceIndex) =
        dist (B.L.points blockerIndex) (B.L.points partnerIndex) := by
    simpa only [hblockerIndex, hsourceIndex, hpartnerIndex] using hequidistant
  refine ⟨partner, hpartnerNeSource, hpartnerData.1, hpartnerData.2, hpartnerUnique,
    hsourceInterior, hpartnerInterior, hequidistant, B,
    sourceIndex, blockerIndex, partnerIndex,
    hsourceIndex, hblockerIndex, hpartnerIndex, ?_⟩
  rcases lt_or_gt_of_ne hsourceIndexNePartner with hlt | hgt
  · exact Or.inl <|
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hlt hblockerIndexNeSource
          hblockerIndexNePartner hindexEquidistant
  · exact Or.inr <|
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hgt hblockerIndexNePartner
          hblockerIndexNeSource hindexEquidistant.symm

end ATailFrontierLiveClosure
end Problem97
