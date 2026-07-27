/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFivePlacementXuPeerU

/-!
# The `xu/u` placement when the regenerated deletion is the old deletion

This file isolates the first branch of the three-way deletion localization.
It records all immediate row, blocker, strict-cap, and deletion-survival
consequences.  They do not contradict one another: the remaining
closure-equivalent proposition is the reverse cross-deletion incidence saying
that the old deleted point lies in the regenerated `xu` row.

The final theorem gives a small exact finite model of the resulting
row/class/cap and blocker-distinctness profile.  It is deliberately only a
model of that incidence profile, not a `CounterexampleData` model.
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

/-- In the old-deletion branch, the old point is omitted from all three
relevant rows.  The strict cap contains `u`, `xu`, and the blocker `xv`;
the regenerated row has one of three exact strict-cap traces; and deletion
of the old point preserves K4 at the four available centers. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u_oldDeletion_consequences
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
    (hpeerU : Q.omittedPeer.1 = P.u.1)
    (K : ExactFourMutualOmissionJointDeletion
      R P.rho goodSource Q.omittedPeer)
    (hKold : K.deleted = P.jointDeletion.deleted) :
    let Hlate := lateFirstApexSystem R
    let C := SelectedClass D.A S.oppApex2 P.rho
    let J := S.capInteriorByIndex S.oppIndex2
    let Kg :=
      (Hlate.selectedAt
        goodSource.1 goodSource.2).toCriticalFourShell.support
    let Ku :=
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support
    let Kv :=
      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support
    P.jointDeletion.deleted.1 ∉ Kg ∧
      P.jointDeletion.deleted.1 ∉ Ku ∧
      P.jointDeletion.deleted.1 ∉ Kv ∧
      Ku ∩ C = {P.u.1, xu} ∧
      Kv ∩ C = {P.v.1, xv} ∧
      ({P.u.1, xu} : Finset ℝ²) ∩ J = {P.u.1, xu} ∧
      Ku ∩ (C ∩ J) = {P.u.1, xu} ∧
      ({P.u.1, xu, xv} : Finset ℝ²) ⊆ J ∧
      3 ≤ J.card ∧
      (Kg ∩ (C ∩ J) = {xu} ∨
        Kg ∩ (C ∩ J) = {xu, P.v.1} ∨
        Kg ∩ (C ∩ J) = {xu, xv}) ∧
      Hlate.centerAt goodSource.1 goodSource.2 ≠ xv ∧
      Hlate.centerAt goodSource.1 goodSource.2 ≠ S.oppApex2 ∧
      xv ≠ S.oppApex2 ∧
      xv ≠ Hlate.centerAt P.v.1 P.v.2 ∧
      Hlate.centerAt P.v.1 P.v.2 ≠ S.oppApex2 ∧
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠
        Hlate.centerAt goodSource.1 goodSource.2 ∧
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠ xv ∧
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠
        Hlate.centerAt P.v.1 P.v.2 ∧
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠ S.oppApex2 ∧
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1)
        (Hlate.centerAt goodSource.1 goodSource.2) ∧
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1) xv ∧
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1)
        (Hlate.centerAt P.v.1 P.v.2) ∧
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1) S.oppApex2 := by
  classical
  dsimp only
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let J := S.capInteriorByIndex S.oppIndex2
  let Kg :=
    (Hlate.selectedAt
      goodSource.1 goodSource.2).toCriticalFourShell.support
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support
  let Kv :=
    (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support
  have hpeerCarrier : Q.omittedPeer = P.u := by
    apply Subtype.ext
    exact hpeerU
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hxuKu : xu ∈ Ku := by
    have hmem :
        xu ∈
          (Hlate.selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa only [Hlate, C] using
        (show
          xu ∈
            ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [terminal.named_rows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp (by simpa only [Ku] using hmem)).1
  have huKu : P.u.1 ∈ Ku := by
    exact (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuJ : xu ∈ J := by
    simpa only [hgoodXu, J] using Q.good_mem_interior
  have huJ : P.u.1 ∈ J := by
    simpa only [hpeerCarrier, J] using Q.omittedPeer_mem_interior
  have hxvJ : xv ∈ J := by
    rcases terminal.source_row_interior with hcenter | hsingleton
    · change Hlate.centerAt P.u.1 P.u.2 ∈ J at hcenter
      rw [hblockerEqU] at hcenter
      exact hcenter
    · exfalso
      have hxuInter :
          xu ∈ Ku ∩ (C ∩ J) := by
        exact Finset.mem_inter.mpr
          ⟨hxuKu, Finset.mem_inter.mpr
            ⟨by
              change xu ∈ SelectedClass D.A S.oppApex2 P.rho
              rw [terminal.named_rows.physical_class]
              simp,
            hxuJ⟩⟩
      have hxuEqU : xu = P.u.1 := by
        rw [show Ku ∩ (C ∩ J) = {P.u.1} by
          simpa only [Ku, C, J, Hlate, P.huSource] using hsingleton] at hxuInter
        simpa using hxuInter
      exact terminal.named_rows.xu_ne_u hxuEqU
  have hxvNeU : xv ≠ P.u.1 := by
    intro h
    have hxvMem : xv ∈ Ku := by
      simpa only [h] using huKu
    have hcenterMem :
        Hlate.centerAt P.u.1 P.u.2 ∈ Ku := by
      simpa only [hblockerEqU] using hxvMem
    apply
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
    exact hcenterMem
  have hxvNeXu : xv ≠ xu := by
    intro h
    have hxvMem : xv ∈ Ku := by
      simpa only [h] using hxuKu
    have hcenterMem :
        Hlate.centerAt P.u.1 P.u.2 ∈ Ku := by
      simpa only [hblockerEqU] using hxvMem
    apply
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
    exact hcenterMem
  have hcapTriple : ({P.u.1, xu, xv} : Finset ℝ²) ⊆ J := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact huJ
    · exact hxuJ
    · exact hxvJ
  have hpairInterior :
      ({P.u.1, xu} : Finset ℝ²) ∩ J = {P.u.1, xu} := by
    apply Finset.inter_eq_left.mpr
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact huJ
    · exact hxuJ
  have huRowTrace : Ku ∩ C = {P.u.1, xu} := by
    simpa only [Ku, C, Hlate] using terminal.named_rows.u_row_trace
  have hvRowTrace : Kv ∩ C = {P.v.1, xv} := by
    simpa only [Kv, C, Hlate] using terminal.named_rows.v_row_trace
  have huStrictCapTrace :
      Ku ∩ (C ∩ J) = {P.u.1, xu} := by
    calc
      Ku ∩ (C ∩ J) = (Ku ∩ C) ∩ J := by
        ext z
        simp
      _ = ({P.u.1, xu} : Finset ℝ²) ∩ J := by rw [huRowTrace]
      _ = {P.u.1, xu} := hpairInterior
  have hcapCard : 3 ≤ J.card := by
    have hthree :
        ({P.u.1, xu, xv} : Finset ℝ²).card = 3 := by
      simp [Ne.symm terminal.named_rows.xu_ne_u,
        Ne.symm hxvNeU, Ne.symm hxvNeXu]
    have hle := Finset.card_le_card hcapTriple
    omega
  have holdNotKg : P.jointDeletion.deleted.1 ∉ Kg := by
    simpa only [Kg, Hlate, hKold] using K.deleted_not_mem_uRow
  have holdNotKu : P.jointDeletion.deleted.1 ∉ Ku := by
    simpa only [Ku, Hlate] using P.jointDeletion.deleted_not_mem_uRow
  have holdNotKv : P.jointDeletion.deleted.1 ∉ Kv := by
    simpa only [Kv, Hlate] using P.jointDeletion.deleted_not_mem_vRow
  have huNotKg : P.u.1 ∉ Kg := by
    simpa only [Kg, Hlate, hpeerCarrier] using
      Q.omittedPeer_not_mem_good_row
  have hxuKg : xu ∈ Kg := by
    simpa only [Kg, Hlate, hgoodXu] using
      (Hlate.selectedAt
        goodSource.1 goodSource.2).toCriticalFourShell.q_mem_support
  have hxuInter : xu ∈ Kg ∩ (C ∩ J) := by
    exact Finset.mem_inter.mpr
      ⟨hxuKg, Finset.mem_inter.mpr
        ⟨by
          change xu ∈ SelectedClass D.A S.oppApex2 P.rho
          rw [terminal.named_rows.physical_class]
          simp,
        hxuJ⟩⟩
  have hrowCardLe : (Kg ∩ (C ∩ J)).card ≤ 2 := by
    simpa only [Kg, C, J, Hlate] using Q.good_cross_card_le_two
  have htrace :
      Kg ∩ (C ∩ J) = {xu} ∨
        Kg ∩ (C ∩ J) = {xu, P.v.1} ∨
        Kg ∩ (C ∩ J) = {xu, xv} := by
    by_cases hvInter : P.v.1 ∈ Kg ∩ (C ∩ J)
    · have hvNeXu : P.v.1 ≠ xu := by
        intro h
        apply P.hvOmitted
        simpa only [h] using hxuKu
      have hxvNotInter : xv ∉ Kg ∩ (C ∩ J) :=
        placement_third_not_mem_of_card_le_two hrowCardLe
          hxuInter hvInter hvNeXu.symm hxvNeXu.symm
          terminal.named_rows.xv_ne_v.symm
      exact Or.inr (Or.inl (by
        apply Finset.Subset.antisymm
        · intro z hz
          have hzKg := (Finset.mem_inter.mp hz).1
          have hzC := (Finset.mem_inter.mp
            (Finset.mem_inter.mp hz).2).1
          change z ∈ SelectedClass D.A S.oppApex2 P.rho at hzC
          rw [terminal.named_rows.physical_class] at hzC
          simp only [Finset.mem_insert, Finset.mem_union,
            Finset.mem_singleton] at hzC
          rcases hzC with hold | (hu | hxu) | hv | hxv
          · exact False.elim (holdNotKg (by simpa only [hold] using hzKg))
          · exact False.elim (huNotKg (by simpa only [hu] using hzKg))
          · simp [hxu]
          · simp [hv]
          · exact False.elim (hxvNotInter (by simpa only [hxv] using hz))
        · intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact hxuInter
          · exact hvInter))
    · by_cases hxvInter : xv ∈ Kg ∩ (C ∩ J)
      · exact Or.inr (Or.inr (by
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp
              (Finset.mem_inter.mp hz).2).1
            change z ∈ SelectedClass D.A S.oppApex2 P.rho at hzC
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim
                (holdNotKg (by simpa only [hold] using hzKg))
            · exact False.elim
                (huNotKg (by simpa only [hu] using hzKg))
            · simp [hxu]
            · exact False.elim (hvInter (by simpa only [hv] using hz))
            · simp [hxv]
          · intro z hz
            simp only [Finset.mem_insert, Finset.mem_singleton] at hz
            rcases hz with rfl | rfl
            · exact hxuInter
            · exact hxvInter))
      · exact Or.inl (by
          apply Finset.Subset.antisymm
          · intro z hz
            have hzKg := (Finset.mem_inter.mp hz).1
            have hzC := (Finset.mem_inter.mp
              (Finset.mem_inter.mp hz).2).1
            change z ∈ SelectedClass D.A S.oppApex2 P.rho at hzC
            rw [terminal.named_rows.physical_class] at hzC
            simp only [Finset.mem_insert, Finset.mem_union,
              Finset.mem_singleton] at hzC
            rcases hzC with hold | (hu | hxu) | hv | hxv
            · exact False.elim
                (holdNotKg (by simpa only [hold] using hzKg))
            · exact False.elim
                (huNotKg (by simpa only [hu] using hzKg))
            · simp [hxu]
            · exact False.elim (hvInter (by simpa only [hv] using hz))
            · exact False.elim (hxvInter (by simpa only [hxv] using hz))
          · intro z hz
            have hzXu : z = xu := by simpa using hz
            simpa only [hzXu] using hxuInter)
  have hgoodNeXv :
      Hlate.centerAt goodSource.1 goodSource.2 ≠ xv := by
    intro h
    apply Q.good_peer_blockers_ne
    rw [hpeerCarrier, hblockerEqU, h]
  have hgoodNeApex :
      Hlate.centerAt goodSource.1 goodSource.2 ≠ S.oppApex2 := by
    simpa only [hKold] using K.uPacket.centers_ne
  have hxvNeApex : xv ≠ S.oppApex2 := by
    rw [← hblockerEqU]
    simpa only [hpeerCarrier] using K.vPacket.centers_ne
  have hxvNeBlockerV :
      xv ≠ Hlate.centerAt P.v.1 P.v.2 := by
    rw [← hblockerEqU]
    exact P.jointDeletion.blockers_ne
  have hblockerVNeApex :
      Hlate.centerAt P.v.1 P.v.2 ≠ S.oppApex2 :=
    P.jointDeletion.vPacket.centers_ne
  have holdBlockerNeGood :
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠
        Hlate.centerAt goodSource.1 goodSource.2 := by
    simpa only [hKold] using K.uPacket.actual_blocker_ne_center₁
  have holdBlockerNeXv :
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠ xv := by
    rw [← hblockerEqU]
    simpa only [hpeerCarrier, hKold] using
      K.vPacket.actual_blocker_ne_center₁
  have holdBlockerNeV :
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠
        Hlate.centerAt P.v.1 P.v.2 :=
    P.jointDeletion.vPacket.actual_blocker_ne_center₁
  have holdBlockerNeApex :
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ≠ S.oppApex2 :=
    P.jointDeletion.uPacket.actual_blocker_ne_center₂
  have hsurviveGood :
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1)
        (Hlate.centerAt goodSource.1 goodSource.2) := by
    simpa only [hKold] using K.uPacket.survives₁
  have hsurviveXv :
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1) xv := by
    rw [← hblockerEqU]
    simpa only [hpeerCarrier, hKold] using K.vPacket.survives₁
  have hsurviveV :
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1)
        (Hlate.centerAt P.v.1 P.v.2) :=
    P.jointDeletion.vPacket.survives₁
  have hsurviveApex :
      HasNEquidistantPointsAt 4
        (D.A.erase P.jointDeletion.deleted.1) S.oppApex2 :=
    P.jointDeletion.uPacket.survives₂
  exact
    ⟨holdNotKg, holdNotKu, holdNotKv, huRowTrace, hvRowTrace,
      hpairInterior, huStrictCapTrace, hcapTriple, hcapCard, htrace,
      hgoodNeXv, hgoodNeApex, hxvNeApex, hxvNeBlockerV,
      hblockerVNeApex, holdBlockerNeGood, holdBlockerNeXv,
      holdBlockerNeV, holdBlockerNeApex, hsurviveGood,
      hsurviveXv, hsurviveV, hsurviveApex⟩

/-- The only direct incidence direction that closes the localized branch is
the reverse cross-deletion statement.  Under the checked old-deletion data it
is exactly equivalent to `False`; the available packets prove its negation,
not the incidence itself. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u_oldDeletion_mem_goodRow_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (K : ExactFourMutualOmissionJointDeletion
      R P.rho goodSource Q.omittedPeer)
    (hKold : K.deleted = P.jointDeletion.deleted) :
    P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ↔
      False := by
  constructor
  · intro hmem
    exact K.deleted_not_mem_uRow (by simpa only [hKold] using hmem)
  · exact False.elim

namespace OldDeletionIncidenceModel

abbrev Point := Fin 10

def old : Point := 0
def u : Point := 1
def xu : Point := 2
def v : Point := 3
def xv : Point := 4
def goodBlocker : Point := 5
def vBlocker : Point := 6
def apex : Point := 7
def oldBlocker : Point := 8
def outside : Point := 9

def physicalClass : Finset Point := {old, u, xu, v, xv}
def uRow : Finset Point := {u, xu, goodBlocker, outside}
def vRow : Finset Point := {v, xv, goodBlocker, outside}
def goodRow : Finset Point := {xu, v, vBlocker, outside}
def strictCap : Finset Point := {u, xu, xv}

/-- Exact finite consistency check for the row/class/cap and blocker profile.
In particular, the old point is absent from the regenerated good row. -/
theorem row_cap_blocker_profile_consistent :
    uRow ∩ physicalClass = {u, xu} ∧
      vRow ∩ physicalClass = {v, xv} ∧
      goodRow ∩ (physicalClass ∩ strictCap) = {xu} ∧
      old ∉ uRow ∧ old ∉ vRow ∧ old ∉ goodRow ∧
      ({u, xu, xv} : Finset Point) ⊆ strictCap ∧
      goodBlocker ≠ xv ∧ goodBlocker ≠ apex ∧
      xv ≠ apex ∧ xv ≠ vBlocker ∧ vBlocker ≠ apex ∧
      oldBlocker ≠ goodBlocker ∧ oldBlocker ≠ xv ∧
      oldBlocker ≠ vBlocker ∧ oldBlocker ≠ apex := by
  decide

end OldDeletionIncidenceModel

#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u_oldDeletion_consequences
#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u_oldDeletion_mem_goodRow_iff_false
#print axioms OldDeletionIncidenceModel.row_cap_blocker_profile_consistent

end ATailFrontierLiveClosure
end Problem97
