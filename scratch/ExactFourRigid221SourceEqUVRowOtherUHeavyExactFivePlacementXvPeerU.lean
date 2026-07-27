/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveKalmanson

/-!
# Exact-five `u`-heavy placement `goodSource = xv`, `omittedPeer = u`

This placement forms a concrete two-cycle of row omission: the regenerated
`xv` row omits `u`, while the original `u` row omits its own blocker `xv`.
The resulting prescribed joint deletion is forced to be either the old
deleted point or `v`; the other three points of the physical five-class are
excluded by the two endpoint conditions and the original `u` row.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem selectedAt_support_congr
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x y : ℝ²} (hxy : x = y) (hx : x ∈ A) (hy : y ∈ A) :
    (H.selectedAt x hx).toCriticalFourShell.support =
      (H.selectedAt y hy).toCriticalFourShell.support := by
  cases hxy
  rfl

private theorem placement_third_not_mem_of_card_le_two
    {A : Finset ℝ²} {x y z : ℝ²}
    (hcard : A.card ≤ 2)
    (hx : x ∈ A) (hy : y ∈ A)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    z ∉ A := by
  intro hz
  have hsub : ({x, y, z} : Finset ℝ²) ⊆ A := by
    intro w hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl
    · exact hx
    · exact hy
    · exact hz
  have hthree : ({x, y, z} : Finset ℝ²).card = 3 := by
    simp [hxy, hxz, hyz]
  have := Finset.card_le_card hsub
  omega

/-- The `xv/u` regenerated placement yields a mutually omitted pair with a
strict Kalmanson inequality and a joint deletion in the explicit two-point
set consisting of the old deletion and `v`.  This is a strict narrowing, not
yet a contradiction. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
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
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXv : goodSource.1 = xv)
    (hpeerU : Q.omittedPeer.1 = P.u.1) :
    Q.omittedPeer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∧
      goodSource.1 ∉
        ((lateFirstApexSystem R).selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt
          Q.omittedPeer.1 Q.omittedPeer.2 = goodSource.1 ∧
      dist Q.omittedPeer.1 goodSource.1 <
        dist Q.omittedPeer.1 xu ∧
      ∃ K : ExactFourMutualOmissionJointDeletion
          R P.rho goodSource Q.omittedPeer,
        K.deleted = P.jointDeletion.deleted ∨ K.deleted = P.v := by
  classical
  let Hlate := lateFirstApexSystem R
  have hpeerCarrier : Q.omittedPeer = P.u := by
    apply Subtype.ext
    exact hpeerU
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hpeerRowEqURow :
      (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support =
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    selectedAt_support_congr Hlate hpeerU
      Q.omittedPeer.2 P.u.2
  have hgoodNotPeerRow :
      goodSource.1 ∉
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support := by
    intro hmem
    have hxvMem :
        xv ∈
          (Hlate.selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support := by
      rw [← hpeerRowEqURow]
      simpa only [hgoodXv] using hmem
    apply
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
    simpa only [hblockerEqU] using hxvMem
  have hpeerBlockerEqGood :
      Hlate.centerAt Q.omittedPeer.1 Q.omittedPeer.2 = goodSource.1 := by
    rw [hpeerCarrier, hgoodXv]
    exact hblockerEqU
  have hkalmanson :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three
  have hotherEqXv :
      P.other.1 = xv :=
    (exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three).trans blocker_eq
  have hstrict :
      dist Q.omittedPeer.1 goodSource.1 <
        dist Q.omittedPeer.1 xu := by
    simpa only [hpeerCarrier, hgoodXv, P.huSource, hotherEqXv] using
      hkalmanson.1
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R P.surface P.rho P.hfive goodSource Q.omittedPeer
          Q.good_peer_blockers_ne with
    ⟨K⟩
  have hxuPeerRow :
      xu ∈
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support := by
    have hxuInter :
        xu ∈
          (Hlate.selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [terminal.named_rows.u_row_trace]
      simp
    rw [hpeerRowEqURow]
    exact (Finset.mem_inter.mp hxuInter).1
  have hdeletedBinary :
      K.deleted = P.jointDeletion.deleted ∨ K.deleted = P.v := by
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
      apply K.deleted_not_mem_vRow
      simpa only [hxu] using hxuPeerRow
    · exact Or.inr (Subtype.ext hv)
    · exfalso
      apply K.deleted_ne_u
      apply Subtype.ext
      exact hxv.trans hgoodXv.symm
  exact
    ⟨Q.omittedPeer_not_mem_good_row, hgoodNotPeerRow,
      hpeerBlockerEqGood, hstrict, K, hdeletedBinary⟩

private theorem placement_jointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v w : CarrierVertex D.A)
    (hwClass : w.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hwNotU :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hwNotV :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
      K.deleted = w := by
  have hwNeU : w ≠ u := by
    intro hwu
    apply hwNotU
    simpa [hwu] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hwNeV : w ≠ v := by
    intro hwv
    apply hwNotV
    simpa [hwv] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huBlockerA :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex v).2
  have hsecondApexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have huBlockerNeApex :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) u.1 u.2
  have hvBlockerNeApex :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) v.1 v.2
  have huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hwNotU
  have hvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr hwNotV
  have hsecondApexSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1) S.oppApex2 :=
    surface.secondApex_robust.survives w.1 w.2
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 huBlockerA hsecondApexA
      huBlockerNeApex huSurvives hsecondApexSurvives with
    ⟨uPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 hvBlockerA hsecondApexA
      hvBlockerNeApex hvSurvives hsecondApexSurvives with
    ⟨vPacket⟩
  exact
    ⟨{
      deleted := w
      deleted_mem_class := hwClass
      deleted_ne_u := hwNeU
      deleted_ne_v := hwNeV
      deleted_not_mem_uRow := hwNotU
      deleted_not_mem_vRow := hwNotV
      blockers_ne := hblockersNe
      uPacket := uPacket
      vPacket := vPacket
    }, rfl⟩

/-- The two possible deletion placements have only three concrete row
outcomes.  If exactly one of the old deletion and `v` is available, the other
point is forced into the regenerated `xv` row and its physical trace is the
corresponding pair.  Otherwise both prescribed deletions exist and the trace
is the singleton `xv` or the pair `{xv, xu}`. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_cases
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
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXv : goodSource.1 = xv)
    (hpeerU : Q.omittedPeer.1 = P.u.1) :
    ∃ K : ExactFourMutualOmissionJointDeletion
        R P.rho goodSource Q.omittedPeer,
      (K.deleted = P.jointDeletion.deleted ∧
        ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho =
          {xv, P.v.1}) ∨
      (K.deleted = P.v ∧
        ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho =
          {xv, P.jointDeletion.deleted.1}) ∨
      (((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho = {xv} ∨
        ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho = {xv, xu}) ∧
        ∃ Jold Jv : ExactFourMutualOmissionJointDeletion
            R P.rho goodSource Q.omittedPeer,
          Jold.deleted = P.jointDeletion.deleted ∧
          Jv.deleted = P.v ∧ Jold.deleted ≠ Jv.deleted := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Kg :=
    (Hlate.selectedAt
      goodSource.1 goodSource.2).toCriticalFourShell
  have hplacement :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three goodSource Q hgoodXv hpeerU
  rcases hplacement.2.2.2.2 with ⟨K, hK⟩
  have huNotKg : P.u.1 ∉ Kg.support := by
    simpa only [Kg, Hlate, hpeerU] using
      Q.omittedPeer_not_mem_good_row
  have hxvKg : xv ∈ Kg.support := by
    simpa only [Kg, Hlate, hgoodXv] using Kg.q_mem_support
  have hxvC : xv ∈ C := by
    simpa only [C, hgoodXv] using Q.good_mem_class
  have hxvInter : xv ∈ Kg.support ∩ C :=
    Finset.mem_inter.mpr ⟨hxvKg, hxvC⟩
  have hrowCardLe : (Kg.support ∩ C).card ≤ 2 := by
    simpa only [Kg, C, Hlate] using
      criticalFourShell_inter_selectedClass_card_le_two Kg
        (P.surface.secondApex_robust.centerAt_ne
          Hlate goodSource.1 goodSource.2)
  have hxuURow :
      xu ∈
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    have hmem :
        xu ∈
          (Hlate.selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa only [C] using
        (show
          xu ∈
            (Hlate.selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [terminal.named_rows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp hmem).1
  have hxvVRow :
      xv ∈
        (Hlate.selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support := by
    have hmem :
        xv ∈
          (Hlate.selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
      simpa only [C] using
        (show
          xv ∈
            (Hlate.selectedAt
                P.v.1 P.v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [terminal.named_rows.v_row_trace]
          simp)
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotURow :
      xv ∉
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    have hblockerEqU :
        Hlate.centerAt P.u.1 P.u.2 = xv := by
      simpa only [Hlate, P.huSource] using blocker_eq
    simpa only [hblockerEqU] using
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
  have hxvNeXu : xv ≠ xu := by
    intro h
    apply hxvNotURow
    simpa only [h] using hxuURow
  have hvNeXu : P.v.1 ≠ xu := by
    intro h
    apply P.hvOmitted
    simpa only [h] using hxuURow
  have holdNeXu : P.jointDeletion.deleted.1 ≠ xu := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [h] using hxuURow
  have holdNeXv : P.jointDeletion.deleted.1 ≠ xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    simpa only [h] using hxvVRow
  have hpeerRowEqURow :
      (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support =
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    selectedAt_support_congr Hlate hpeerU
      Q.omittedPeer.2 P.u.2
  have holdNotPeerRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support := by
    rw [hpeerRowEqURow]
    exact P.jointDeletion.deleted_not_mem_uRow
  have hvNotPeerRow :
      P.v.1 ∉
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support := by
    rw [hpeerRowEqURow]
    exact P.hvOmitted
  have prescribedOld
      (holdNotKg : P.jointDeletion.deleted.1 ∉ Kg.support) :
      ∃ Jold : ExactFourMutualOmissionJointDeletion
          R P.rho goodSource Q.omittedPeer,
        Jold.deleted = P.jointDeletion.deleted := by
    exact
      placement_jointDeletion_of_prescribed
        R P.surface P.rho goodSource Q.omittedPeer
          P.jointDeletion.deleted P.jointDeletion.deleted_mem_class
          (by simpa only [Kg, Hlate] using holdNotKg)
          holdNotPeerRow Q.good_peer_blockers_ne
  have prescribedV
      (hvNotKg : P.v.1 ∉ Kg.support) :
      ∃ Jv : ExactFourMutualOmissionJointDeletion
          R P.rho goodSource Q.omittedPeer,
        Jv.deleted = P.v := by
    exact
      placement_jointDeletion_of_prescribed
        R P.surface P.rho goodSource Q.omittedPeer P.v P.hvClass
          (by simpa only [Kg, Hlate] using hvNotKg)
          hvNotPeerRow Q.good_peer_blockers_ne
  rcases hK with hKold | hKv
  · by_cases hvKg : P.v.1 ∈ Kg.support
    · refine ⟨K, Or.inl ⟨hKold, ?_⟩⟩
      have hvInter : P.v.1 ∈ Kg.support ∩ C :=
        Finset.mem_inter.mpr
          ⟨hvKg, by simpa only [C] using P.hvClass⟩
      have hxuNotInter : xu ∉ Kg.support ∩ C :=
        placement_third_not_mem_of_card_le_two hrowCardLe hxvInter hvInter
          terminal.named_rows.xv_ne_v hxvNeXu hvNeXu
      have holdNotKg : P.jointDeletion.deleted.1 ∉ Kg.support := by
        simpa only [hKold] using K.deleted_not_mem_uRow
      apply Finset.Subset.antisymm
      · intro z hz
        have hzKg := (Finset.mem_inter.mp hz).1
        have hzC := (Finset.mem_inter.mp hz).2
        rw [terminal.named_rows.physical_class] at hzC
        simp only [Finset.mem_insert, Finset.mem_union,
          Finset.mem_singleton] at hzC
        rcases hzC with hold | (hu | hxu) | hv | hxv
        · exact False.elim (holdNotKg (by simpa only [hold] using hzKg))
        · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
        · exact False.elim (hxuNotInter (by simpa only [hxu] using hz))
        · simp [hv]
        · simp [hxv]
      · intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact hxvInter
        · exact hvInter
    · rcases prescribedV (by simpa only [Kg, Hlate] using hvKg) with
        ⟨Jv, hJv⟩
      rcases prescribedOld
          (by simpa only [Kg, Hlate, hKold] using K.deleted_not_mem_uRow) with
        ⟨Jold, hJold⟩
      refine ⟨K, Or.inr (Or.inr ⟨?_, Jold, Jv, hJold, hJv, ?_⟩)⟩
      · by_cases hxuKg : xu ∈ Kg.support
        · right
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp hz).2
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim
                (K.deleted_not_mem_uRow
                  (by simpa only [hKold, hold] using hzKg))
            · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
            · simp [hxu]
            · exact False.elim (hvKg (by simpa only [hv] using hzKg))
            · simp [hxv]
          · intro z hz
            simp only [Finset.mem_insert, Finset.mem_singleton] at hz
            rcases hz with rfl | rfl
            · exact hxvInter
            · exact Finset.mem_inter.mpr
                ⟨hxuKg, by
                  rw [terminal.named_rows.physical_class]
                  simp⟩
        · left
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp hz).2
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim
                (K.deleted_not_mem_uRow
                  (by simpa only [hKold, hold] using hzKg))
            · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
            · exact False.elim (hxuKg (by simpa only [hxu] using hzKg))
            · exact False.elim (hvKg (by simpa only [hv] using hzKg))
            · simp [hxv]
          · intro z hz
            have hzXv : z = xv := by simpa using hz
            simpa only [hzXv] using hxvInter
      · intro hEq
        apply P.jointDeletion.deleted_ne_v
        rw [← hJold, ← hJv]
        exact hEq
  · by_cases holdKg : P.jointDeletion.deleted.1 ∈ Kg.support
    · refine ⟨K, Or.inr (Or.inl ⟨hKv, ?_⟩)⟩
      have holdInter :
          P.jointDeletion.deleted.1 ∈ Kg.support ∩ C :=
        Finset.mem_inter.mpr
          ⟨holdKg, by
            simpa only [C] using
              P.jointDeletion.deleted_mem_class⟩
      have hxuNotInter : xu ∉ Kg.support ∩ C :=
        placement_third_not_mem_of_card_le_two hrowCardLe hxvInter holdInter
          holdNeXv.symm hxvNeXu holdNeXu
      have hvNotKg : P.v.1 ∉ Kg.support := by
        simpa only [hKv] using K.deleted_not_mem_uRow
      apply Finset.Subset.antisymm
      · intro z hz
        have hzKg := (Finset.mem_inter.mp hz).1
        have hzC := (Finset.mem_inter.mp hz).2
        rw [terminal.named_rows.physical_class] at hzC
        simp only [Finset.mem_insert, Finset.mem_union,
          Finset.mem_singleton] at hzC
        rcases hzC with hold | (hu | hxu) | hv | hxv
        · simp [hold]
        · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
        · exact False.elim (hxuNotInter (by simpa only [hxu] using hz))
        · exact False.elim (hvNotKg (by simpa only [hv] using hzKg))
        · simp [hxv]
      · intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact hxvInter
        · exact holdInter
    · rcases prescribedOld (by simpa only [Kg, Hlate] using holdKg) with
        ⟨Jold, hJold⟩
      rcases prescribedV
          (by simpa only [Kg, Hlate, hKv] using K.deleted_not_mem_uRow) with
        ⟨Jv, hJv⟩
      refine ⟨K, Or.inr (Or.inr ⟨?_, Jold, Jv, hJold, hJv, ?_⟩)⟩
      · by_cases hxuKg : xu ∈ Kg.support
        · right
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp hz).2
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim (holdKg (by simpa only [hold] using hzKg))
            · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
            · simp [hxu]
            · exact False.elim
                (K.deleted_not_mem_uRow
                  (by simpa only [hKv, hv] using hzKg))
            · simp [hxv]
          · intro z hz
            simp only [Finset.mem_insert, Finset.mem_singleton] at hz
            rcases hz with rfl | rfl
            · exact hxvInter
            · exact Finset.mem_inter.mpr
                ⟨hxuKg, by
                  rw [terminal.named_rows.physical_class]
                  simp⟩
        · left
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp hz).2
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim (holdKg (by simpa only [hold] using hzKg))
            · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
            · exact False.elim (hxuKg (by simpa only [hxu] using hzKg))
            · exact False.elim
                (K.deleted_not_mem_uRow
                  (by simpa only [hKv, hv] using hzKg))
            · simp [hxv]
          · intro z hz
            have hzXv : z = xv := by simpa using hz
            simpa only [hzXv] using hxvInter
      · intro hEq
        apply P.jointDeletion.deleted_ne_v
        rw [← hJold, ← hJv]
        exact hEq

/-- In the residual arm where both the old deletion and `v` can be prescribed,
the first row of every resulting packet is not new data: it is the canonical
selected row at `xv` or `u`.  Thus the two deletion witnesses have identical
first-row geometry.  The remaining information is exactly the two physical
row traces together with the strict Kalmanson comparison. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_bothDeletions_residual
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
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXv : goodSource.1 = xv)
    (hpeerU : Q.omittedPeer.1 = P.u.1)
    (Jold Jv : ExactFourMutualOmissionJointDeletion
      R P.rho goodSource Q.omittedPeer)
    (hJold : Jold.deleted = P.jointDeletion.deleted)
    (hJv : Jv.deleted = P.v)
    (htrace :
      ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {xv} ∨
      ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {xv, xu}) :
    (Jold.deleted = P.jointDeletion.deleted ∧
        Jv.deleted = P.v ∧ Jold.deleted ≠ Jv.deleted) ∧
      (Jold.uPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∧
        Jold.vPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support ∧
        Jv.uPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∧
        Jv.vPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support) ∧
      ((lateFirstApexSystem R).selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {P.u.1, xu} ∧
      (((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho = {xv} ∨
        ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho = {xv, xu}) ∧
      dist Q.omittedPeer.1 goodSource.1 <
        dist Q.omittedPeer.1 xu := by
  classical
  let Hlate := lateFirstApexSystem R
  have hJne : Jold.deleted ≠ Jv.deleted := by
    intro hEq
    apply P.jointDeletion.deleted_ne_v
    rw [← hJold, ← hJv]
    exact hEq
  have hJoldGood :
      Jold.uPacket.B₁ =
        (Hlate.selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support :=
    qDeletedRow_at_actualBlocker_eq_canonicalSupport
      goodSource.2 Jold.uPacket.row₁ Jold.uPacket.B₁_card
  have hJoldPeer :
      Jold.vPacket.B₁ =
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support :=
    qDeletedRow_at_actualBlocker_eq_canonicalSupport
      Q.omittedPeer.2 Jold.vPacket.row₁ Jold.vPacket.B₁_card
  have hJvGood :
      Jv.uPacket.B₁ =
        (Hlate.selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support :=
    qDeletedRow_at_actualBlocker_eq_canonicalSupport
      goodSource.2 Jv.uPacket.row₁ Jv.uPacket.B₁_card
  have hJvPeer :
      Jv.vPacket.B₁ =
        (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support :=
    qDeletedRow_at_actualBlocker_eq_canonicalSupport
      Q.omittedPeer.2 Jv.vPacket.row₁ Jv.vPacket.B₁_card
  have hpeerRowEqURow :
      (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support =
        (Hlate.selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    selectedAt_support_congr Hlate hpeerU
      Q.omittedPeer.2 P.u.2
  have hpeerTrace :
      (Hlate.selectedAt
          Q.omittedPeer.1 Q.omittedPeer.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {P.u.1, xu} := by
    rw [hpeerRowEqURow]
    exact terminal.named_rows.u_row_trace
  have hplacement :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three goodSource Q hgoodXv hpeerU
  exact
    ⟨⟨hJold, hJv, hJne⟩,
      ⟨by simpa only [Hlate] using hJoldGood,
        by simpa only [Hlate] using hJoldPeer,
        by simpa only [Hlate] using hJvGood,
        by simpa only [Hlate] using hJvPeer⟩,
      by simpa only [Hlate] using hpeerTrace,
      htrace,
      hplacement.2.2.2.1⟩

/-- The exact remaining metric input in the double-deletion arm.  The
Kalmanson comparison already gives the reverse strict inequality, so this
single weak reverse comparison closes the branch. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_bothDeletions_false_of_reverse_metric
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
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXv : goodSource.1 = xv)
    (hpeerU : Q.omittedPeer.1 = P.u.1)
    (Jold Jv : ExactFourMutualOmissionJointDeletion
      R P.rho goodSource Q.omittedPeer)
    (hJold : Jold.deleted = P.jointDeletion.deleted)
    (hJv : Jv.deleted = P.v)
    (htrace :
      ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {xv} ∨
      ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {xv, xu})
    (hreverse :
      dist Q.omittedPeer.1 xu ≤
        dist Q.omittedPeer.1 goodSource.1) :
    False := by
  have hresidual :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_bothDeletions_residual
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three goodSource Q hgoodXv hpeerU
        Jold Jv hJold hJv htrace
  exact (not_lt_of_ge hreverse) hresidual.2.2.2.2

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_cases
#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_bothDeletions_residual
#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u_bothDeletions_false_of_reverse_metric
#print axioms qDeletedRow_at_actualBlocker_eq_canonicalSupport

end ATailFrontierLiveClosure
end Problem97
