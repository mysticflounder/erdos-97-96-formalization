/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_interior_survivor_pair

/-!
# Pentagon off-class producer probe

Source-clean local consequences of the live rigid `2+2+1` pentagon off-class context.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open scoped Matrix

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- A minimal deletion contained in one exact five-point radius class has
exactly two members.  One member cannot block the four surviving co-radial
points.  With three or more members, restoring one point must use another
radius, and that witness survives deletion of the whole co-radial set. -/
theorem exactFive_coradial_minimalDeletion_card_eq_two_probe
    {A U : Finset ℝ²} {center : ℝ²} {rho : ℝ}
    (hrho : 0 < rho)
    (hfive : (SelectedClass A center rho).card = 5)
    (hUne : U.Nonempty)
    (hUsub : U ⊆ SelectedClass A center rho)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ U) center)
    (hrestores :
      ∀ s ∈ U, HasNEquidistantPointsAt 4 (A \ U.erase s) center) :
    U.card = 2 := by
  classical
  have htwo : 2 ≤ U.card := by
    by_contra hnot
    have hone : U.card = 1 := by
      have hpos : 0 < U.card := Finset.card_pos.mpr hUne
      omega
    apply hblocked
    refine ⟨rho, hrho, ?_⟩
    have hclassEq :
        SelectedClass (A \ U) center rho =
          SelectedClass A center rho \ U := by
      ext x
      simp [SelectedClass, and_assoc, and_comm]
    change 4 ≤ (SelectedClass (A \ U) center rho).card
    rw [hclassEq, Finset.card_sdiff_of_subset hUsub, hfive, hone]
  have hle : U.card ≤ 2 := by
    by_contra hnot
    have hthree : 3 ≤ U.card := by omega
    obtain ⟨s, hsU⟩ := hUne
    rcases hrestores s hsU with ⟨radius, hradius, hfour⟩
    have hradiusNe : radius ≠ rho := by
      intro hradiusEq
      subst radius
      have hclassEq :
          SelectedClass (A \ U.erase s) center rho =
            SelectedClass A center rho \ U.erase s := by
        ext x
        simp [SelectedClass, and_assoc, and_comm]
      have hEraseSub : U.erase s ⊆ SelectedClass A center rho := by
        exact fun x hx ↦ hUsub (Finset.mem_of_mem_erase hx)
      have hEraseCard : (U.erase s).card = U.card - 1 := by
        rw [Finset.card_erase_of_mem hsU]
      change 4 ≤ (SelectedClass (A \ U.erase s) center rho).card at hfour
      rw [hclassEq, Finset.card_sdiff_of_subset hEraseSub, hfive,
        hEraseCard] at hfour
      omega
    apply hblocked
    refine ⟨radius, hradius, le_trans hfour (Finset.card_le_card ?_)⟩
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxRestored, hxRadius⟩
    have hxA : x ∈ A := (Finset.mem_sdiff.mp hxRestored).1
    have hxNotErase : x ∉ U.erase s := (Finset.mem_sdiff.mp hxRestored).2
    apply mem_selectedClass.mpr
    refine ⟨Finset.mem_sdiff.mpr ⟨hxA, ?_⟩, hxRadius⟩
    intro hxU
    have hxEq : x = s := by
      by_contra hxNe
      exact hxNotErase (Finset.mem_erase.mpr ⟨hxNe, hxU⟩)
    have hsClass := hUsub hsU
    have hsRho : dist center s = rho := (mem_selectedClass.mp hsClass).2
    have hsRadius : dist center s = radius := by simpa [hxEq] using hxRadius
    exact hradiusNe (hsRadius.symm.trans hsRho)
  omega

/-- The globally minimal deletion retained by every physical-apex rigid
`2+2+1` context is therefore an exact pair. -/
theorem rigid221_globalDeletion_card_eq_two_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.globalDeletion.deleted.card = 2 := by
  apply exactFive_coradial_minimalDeletion_card_eq_two_probe
      (center := P.globalDeletion.center) (rho := P.rho)
  · exact P.hrho
  · simpa only [P.hcenter] using P.hclassFive
  · exact P.globalDeletion.deleted_nonempty
  · simpa only [P.hcenter] using P.globalDeletion.deleted_subset_class
  · exact P.globalDeletion.blocked
  · exact P.globalDeletion.restores

/-- Once the physical radius class is exhausted by the directed pentagon,
the global minimal deletion is one of its ten unordered pairs. -/
theorem rigid221_globalDeletion_named_pair_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = packet.xv) :
    P.globalDeletion.deleted = {P.u.1, packet.xu} ∨
      P.globalDeletion.deleted = {P.u.1, P.jointDeletion.deleted.1} ∨
      P.globalDeletion.deleted = {P.u.1, P.v.1} ∨
      P.globalDeletion.deleted = {P.u.1, packet.xv} ∨
      P.globalDeletion.deleted = {packet.xu, P.jointDeletion.deleted.1} ∨
      P.globalDeletion.deleted = {packet.xu, P.v.1} ∨
      P.globalDeletion.deleted = {packet.xu, packet.xv} ∨
      P.globalDeletion.deleted = {P.jointDeletion.deleted.1, P.v.1} ∨
      P.globalDeletion.deleted = {P.jointDeletion.deleted.1, packet.xv} ∨
      P.globalDeletion.deleted = {P.v.1, packet.xv} := by
  classical
  obtain ⟨a, b, hab, hdeleted⟩ :=
    Finset.card_eq_two.mp (rigid221_globalDeletion_card_eq_two_probe P)
  have haDeleted : a ∈ P.globalDeletion.deleted := by
    rw [hdeleted]
    simp
  have hbDeleted : b ∈ P.globalDeletion.deleted := by
    rw [hdeleted]
    simp
  have haClass : a ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [P.hcenter] using P.globalDeletion.deleted_subset_class haDeleted
  have hbClass : b ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [P.hcenter] using P.globalDeletion.deleted_subset_class hbDeleted
  rcases hclassFive a haClass with rfl | rfl | rfl | rfl | rfl <;>
    rcases hclassFive b hbClass with rfl | rfl | rfl | rfl | rfl <;>
    simp_all [Finset.pair_comm]

private theorem pentagonOffClass_u_ne_xv_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    P.u.1 ≠ packet.xv := by
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hcenter :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  intro huEqXv
  have hxvKu : packet.xv ∈ Ku.support := by
    simpa [Ku, huEqXv] using Ku.q_mem_support
  have hmemEq :
      ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
        (packet.xv ∈ Ku.support) :=
    congrArg (fun z : ℝ² ↦ z ∈ Ku.support) hcenter
  exact Ku.center_not_mem_support (hmemEq.mpr hxvKu)

private theorem pentagonOffClass_u_mem_secondCapInterior_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
  have huPair :
      P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
    rw [packet.source_pair_interior]
    simp
  exact (Finset.mem_inter.mp huPair).2

private theorem pentagonOffClass_xu_ne_xv_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xu ≠ packet.xv := by
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hxuKu : packet.xu ∈ Ku.support := by
    have hxuTrace :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simp [Ku, packet.source_row_trace]
    exact (Finset.mem_inter.mp hxuTrace).1
  have hcenter :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  intro hxuEqXv
  have hxvKu : packet.xv ∈ Ku.support := by
    simpa [hxuEqXv] using hxuKu
  have hmemEq :
      ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
        (packet.xv ∈ Ku.support) :=
    congrArg (fun z : ℝ² ↦ z ∈ Ku.support) hcenter
  exact Ku.center_not_mem_support (hmemEq.mpr hxvKu)

private theorem pentagonOffClass_xu_mem_secondCapInterior_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
  have hxuPair :
      packet.xu ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
    rw [packet.source_pair_interior]
    simp
  exact (Finset.mem_inter.mp hxuPair).2

/-- In the live pentagon off-class context, the only carrier bisectors of
the edge `{xv, u}` are the actual `xv`-row blocker and the physical apex. -/
theorem pentagonOffClass_xv_u_bisector_eq_pair_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1) =
      ({(lateFirstApexSystem R).centerAt packet.xv hxvA,
          S.oppApex2} : Finset ℝ²) := by
  classical
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv hxvA).toCriticalFourShell
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClass_u_ne_xv_probe P packet
  have hcNeO :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) packet.xv hxvA
  have hcA :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcBisects :
      dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) packet.xv =
        dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) P.u.1 := by
    exact (Kxv.support_eq_radius packet.xv Kxv.q_mem_support).trans
      (Kxv.support_eq_radius P.u.1 huXvRow).symm
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hOBisects :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    ((mem_selectedClass.mp hxvClass).2).trans
      ((mem_selectedClass.mp P.huClass).2).symm
  have hbound :
      (D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1)).card ≤ 2 :=
    Dumitrescu.perpBisector_apex_bound D.convex hxvA P.u.2 huNeXv.symm
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
    · rw [Finset.mem_singleton] at hz
      exact hz ▸ Finset.mem_filter.mpr ⟨hOA, hOBisects⟩
  · rw [Finset.card_pair hcNeO]
    exact hbound

private theorem pentagonOffClass_mem_xvRow_of_same_actualBlocker_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (source : CarrierVertex D.A)
    (hsameBlocker :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
        (lateFirstApexSystem R).centerAt packet.xv hxvA) :
    source.1 ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support := by
  let Hlate := lateFirstApexSystem R
  let Ksource := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
  have hsupports := selectedSupports_eq_of_actualBlockers_eq
    Hlate source.2 hxvA hsameBlocker
  rw [← hsupports]
  exact Ksource.q_mem_support

/-- Every selected row whose source lies outside the distinguished `xv` row
survives at least one of the two endpoint deletions.  Otherwise its row would
contain both endpoints, so its actual blocker would be one of the two saturated
bisector centers.  Robustness excludes the physical apex, while equality with
the distinguished blocker would identify the two selected supports and put the
source back in the distinguished row. -/
theorem pentagonOffClass_u_or_xv_deletion_survives_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (source : CarrierVertex D.A)
    (hsourceOutside :
      source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source.1 source.2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ksource := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  by_cases huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt source.1 source.2)
  · exact Or.inl huSurvives
  by_cases hxvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        (Hlate.centerAt source.1 source.2)
  · exact Or.inr hxvSurvives
  have huSource : P.u.1 ∈ Ksource.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt source.1 source.2) huSurvives
  have hxvSource : packet.xv ∈ Ksource.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt source.1 source.2) hxvSurvives
  have hsourceCenterA : Hlate.centerAt source.1 source.2 ∈ D.A :=
    (Finset.mem_erase.mp Ksource.center_mem).2
  have hsourceBisects :
      dist (Hlate.centerAt source.1 source.2) packet.xv =
        dist (Hlate.centerAt source.1 source.2) P.u.1 :=
    (Ksource.support_eq_radius packet.xv hxvSource).trans
      (Ksource.support_eq_radius P.u.1 huSource).symm
  have hsourceInBisector :
      Hlate.centerAt source.1 source.2 ∈
        D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1) :=
    Finset.mem_filter.mpr ⟨hsourceCenterA, hsourceBisects⟩
  rw [pentagonOffClass_xv_u_bisector_eq_pair_probe
    P packet hxvA huXvRow] at hsourceInBisector
  simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceInBisector
  rcases hsourceInBisector with hsameBlocker | hphysicalApex
  · exact (hsourceOutside
      (pentagonOffClass_mem_xvRow_of_same_actualBlocker_probe
        P packet hxvA source hsameBlocker)).elim
  · exact (P.surface.secondApex_robust.centerAt_ne
      Hlate source.1 source.2 hphysicalApex).elim

/-- The selected row at `xv` has exactly the two known points `{u, xv}`
on the physical second cap. -/
theorem pentagonOffClass_xvRow_secondCap_eq_pair_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 =
        ({P.u.1, packet.xv} : Finset ℝ²) := by
  classical
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv hxvA).toCriticalFourShell
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_u_mem_secondCapInterior_probe P packet
  have hpairSubset :
      ({P.u.1, packet.xv} : Finset ℝ²) ⊆
        Kxv.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨huXvRow,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨Kxv.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxvInterior⟩
  have hblockerCap :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hcapTwo :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [Kxv] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass hblockerCap
  exact
    (Finset.eq_of_subset_of_card_le hpairSubset
      (by
        simpa [pentagonOffClass_u_ne_xv_probe P packet] using hcapTwo)).symm

/-- The four known strict-interior points have one forced order in either
orientation of the ordered physical second cap. -/
theorem pentagonOffClass_forced_secondCap_order_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    ∃ m, ∃ L : CGN.OrderedCap m,
      ∃ Packet : CGN.MecCapPacket D.A L,
      ∃ _ : CGN.MinorCapSideHypotheses Packet,
      ∃ _ : CGN.StrictCapOrder D.A L,
      ∃ iu ic ixv ixu : Fin m,
        Finset.univ.image L.points = S.capByIndex S.oppIndex2 ∧
        L.points iu = P.u.1 ∧
        L.points ic =
          (lateFirstApexSystem R).centerAt packet.xv hxvA ∧
        L.points ixv = packet.xv ∧
        L.points ixu = packet.xu ∧
        ((iu < ic ∧ ic < ixv ∧ ixv < ixu) ∨
          (ixu < ixv ∧ ixv < ic ∧ ic < iu)) := by
  classical
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv hxvA).toCriticalFourShell
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_u_mem_secondCapInterior_probe P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_xu_mem_secondCapInterior_probe P packet
  have huCap : P.u.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hxuCap : packet.xu ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  have hxvCap : packet.xv ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxvInterior
  have hcCap :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact huCap
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hxuCap
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hxvCap
  have hcImage :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  rcases Finset.mem_image.mp huImage with ⟨iu, _, hiu⟩
  rcases Finset.mem_image.mp hcImage with ⟨ic, _, hic⟩
  rcases Finset.mem_image.mp hxvImage with ⟨ixv, _, hixv⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ixu, _, hixu⟩
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClass_u_ne_xv_probe P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClass_xu_ne_xv_probe P packet
  have hcNeU :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ≠ P.u.1 := by
    intro hcEqU
    have hmemEq :
        ((lateFirstApexSystem R).centerAt packet.xv hxvA ∈ Kxv.support) =
          (P.u.1 ∈ Kxv.support) :=
      congrArg (fun z : ℝ² ↦ z ∈ Kxv.support) hcEqU
    exact Kxv.center_not_mem_support (hmemEq.mpr huXvRow)
  have hcNeXv :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ≠ packet.xv := by
    intro hcEqXv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt packet.xv hxvA ∈ Kxv.support) =
          (packet.xv ∈ Kxv.support) :=
      congrArg (fun z : ℝ² ↦ z ∈ Kxv.support) hcEqXv
    exact Kxv.center_not_mem_support (hmemEq.mpr Kxv.q_mem_support)
  have hxvBisects :
      dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    have hcenter :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
      simpa only [P.huSource] using packet.blocker_eq_xv
    have huKu : P.u.1 ∈ Ku.support := Ku.q_mem_support
    have hxuKu : packet.xu ∈ Ku.support := by
      have hxuTrace :
          packet.xu ∈ Ku.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
        simp [Ku, packet.source_row_trace]
      exact (Finset.mem_inter.mp hxuTrace).1
    have hEq :
        dist ((lateFirstApexSystem R).centerAt P.u.1 P.u.2) P.u.1 =
          dist ((lateFirstApexSystem R).centerAt P.u.1 P.u.2) packet.xu :=
      (Ku.support_eq_radius P.u.1 huKu).trans
        (Ku.support_eq_radius packet.xu hxuKu).symm
    simpa [hcenter] using hEq
  have hcBisects :
      dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) P.u.1 =
        dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) packet.xv :=
    (Kxv.support_eq_radius P.u.1 huXvRow).trans
      (Kxv.support_eq_radius packet.xv Kxv.q_mem_support).symm
  have index_ne_of_points_ne :
      ∀ {a b : Fin m} {x y : ℝ²},
        L.points a = x → L.points b = y → x ≠ y → a ≠ b := by
    intro a b x y ha hb hxy hab
    apply hxy
    calc
      x = L.points a := ha.symm
      _ = L.points b := congrArg L.points hab
      _ = y := hb
  have hiuNeIxu : iu ≠ ixu :=
    index_ne_of_points_ne hiu hixu packet.xu_ne_u.symm
  have hixvNeIu : ixv ≠ iu :=
    index_ne_of_points_ne hixv hiu huNeXv.symm
  have hixvNeIxu : ixv ≠ ixu :=
    index_ne_of_points_ne hixv hixu hxuNeXv.symm
  have hicNeIu : ic ≠ iu :=
    index_ne_of_points_ne hic hiu hcNeU
  have hicNeIxv : ic ≠ ixv :=
    index_ne_of_points_ne hic hixv hcNeXv
  have hxvIndexEq :
      dist (L.points ixv) (L.points iu) =
        dist (L.points ixv) (L.points ixu) := by
    simpa [hixv, hiu, hixu] using hxvBisects
  have hcIndexEq :
      dist (L.points ic) (L.points iu) =
        dist (L.points ic) (L.points ixv) := by
    simpa [hic, hiu, hixv] using hcBisects
  refine ⟨m, L, Packet, Hside, Hord, iu, ic, ixv, ixu,
    hcap, hiu, hic, hixv, hixu, ?_⟩
  rcases lt_or_gt_of_ne hiuNeIxu with hiuLtIxu | hixuLtIu
  · have hxvBetween :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hiuLtIxu hixvNeIu hixvNeIxu hxvIndexEq
    have hcBetween :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hxvBetween.1 hicNeIu hicNeIxv hcIndexEq
    exact Or.inl ⟨hcBetween.1, hcBetween.2, hxvBetween.2⟩
  · have hxvBetween :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hixuLtIu hixvNeIxu hixvNeIu hxvIndexEq.symm
    have hcBetween :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord
        hxvBetween.2 hicNeIxv hicNeIu hcIndexEq.symm
    exact Or.inr ⟨hxvBetween.1, hcBetween.1, hcBetween.2⟩

/-- The off-class blocker's selected row cannot destroy both deletions of the
source-valid first-apex interior pair.  Otherwise its center would lie in both
strict opposite-cap interiors. -/
theorem pentagonOffClass_blockerRow_survives_interior_q_or_w_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
        ((lateFirstApexSystem R).centerAt packet.xv hxvA) ∨
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
        ((lateFirstApexSystem R).centerAt packet.xv hxvA) := by
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  by_contra hnone
  push_neg at hnone
  have hqSupport : R.interior_q ∈ Kxv.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt packet.xv hxvA) hnone.1
  have hwSupport : R.interior_w ∈ Kxv.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt packet.xv hxvA) hnone.2
  have hcA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hcNeFirst :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex1 := by
    simpa using
      S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
        hblockerInterior (j := S.oppIndex1)
  have hcEq :
      dist (Hlate.centerAt packet.xv hxvA) R.interior_q =
        dist (Hlate.centerAt packet.xv hxvA) R.interior_w :=
    (Kxv.support_eq_radius R.interior_q hqSupport).trans
      (Kxv.support_eq_radius R.interior_w hwSupport).symm
  have hcFirst :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex1 :=
    R.bisector_center_mem_interior
      (Hlate.centerAt packet.xv hxvA) hcA hcNeFirst hcEq
  have hcNotSecond :
      Hlate.centerAt packet.xv hxvA ∉ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hcFirst S.oppIndex1_ne_oppIndex2
  exact hcNotSecond
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior)

/-- Two pivotal rows cover at most eight of the at least twelve carrier
points.  In the exact pentagon branch, after avoiding the remaining named
physical-class point `v`, one obtains a carrier point outside both rows and
outside the physical radius class. -/
theorem pentagonOffClass_exists_offclass_commonOmission_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = packet.xv) :
    ∃ q ∈ D.A,
      q ∉ ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support ∧
      q ∉ ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support ∧
      q ∉ SelectedClass D.A S.oppApex2 P.rho := by
  classical
  let Kxu :=
    ((lateFirstApexSystem R).selectedAt
      packet.xu hxuA).toCriticalFourShell
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv hxvA).toCriticalFourShell
  let outside := D.A \ (Kxu.support ∪ Kxv.support)
  have hsub : Kxu.support ∪ Kxv.support ⊆ D.A :=
    Finset.union_subset Kxu.support_subset_A Kxv.support_subset_A
  have hunion : (Kxu.support ∪ Kxv.support).card ≤ 8 := by
    calc
      (Kxu.support ∪ Kxv.support).card
          ≤ Kxu.support.card + Kxv.support.card :=
        Finset.card_union_le _ _
      _ = 8 := by rw [Kxu.support_card, Kxv.support_card]
  have houtside : 4 ≤ outside.card := by
    dsimp only [outside]
    rw [Finset.card_sdiff_of_subset hsub]
    apply Nat.le_sub_of_add_le
    have hcard := P.hcard
    omega
  rcases Finset.exists_mem_ne (lt_of_lt_of_le (by decide : 1 < 4) houtside)
      P.v.1 with ⟨q, hqOutside, hqNeV⟩
  have hqA : q ∈ D.A := (Finset.mem_sdiff.mp hqOutside).1
  have hqNotUnion : q ∉ Kxu.support ∪ Kxv.support :=
    (Finset.mem_sdiff.mp hqOutside).2
  have hqNotXu : q ∉ Kxu.support := by
    intro hq
    exact hqNotUnion (Finset.mem_union_left _ hq)
  have hqNotXv : q ∉ Kxv.support := by
    intro hq
    exact hqNotUnion (Finset.mem_union_right _ hq)
  have hqNotClass : q ∉ SelectedClass D.A S.oppApex2 P.rho := by
    intro hqClass
    rcases hclassFive q hqClass with
      hqu | hqxu | hqdeleted | hqv | hqxv
    · exact hqNotXv (hqu ▸ huXvRow)
    · exact hqNotXu (hqxu ▸ Kxu.q_mem_support)
    · exact hqNotXu (hqdeleted ▸ hdeletedXuRow)
    · exact hqNeV hqv
    · exact hqNotXv (hqxv ▸ Kxv.q_mem_support)
  exact ⟨q, hqA, hqNotXu, hqNotXv, hqNotClass⟩

/-- The source row `Kᵤ` and the `xv` row leave at least two distinct
off-class carrier sources unused.  Erasing either source preserves their
two canonical K4 rows, whose distinct centers are `xv` and the off-class
blocker `centerAt xv`. -/
theorem pentagonOffClass_exists_two_offclass_commonDeletionPackets_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = packet.xv) :
    ∃ q r : ℝ²,
      q ≠ r ∧
      q ∉ SelectedClass D.A S.oppApex2 P.rho ∧
      r ∉ SelectedClass D.A S.oppApex2 P.rho ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) q
        ((lateFirstApexSystem R).centerAt packet.xv hxvA) packet.xv) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) r
        ((lateFirstApexSystem R).centerAt packet.xv hxvA) packet.xv) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let outside := D.A \ (Ku.support ∪ Kxv.support)
  let clean := outside \ {P.jointDeletion.deleted.1, P.v.1}
  have hsub : Ku.support ∪ Kxv.support ⊆ D.A :=
    Finset.union_subset Ku.support_subset_A Kxv.support_subset_A
  have hunion : (Ku.support ∪ Kxv.support).card ≤ 8 := by
    calc
      (Ku.support ∪ Kxv.support).card
          ≤ Ku.support.card + Kxv.support.card :=
        Finset.card_union_le _ _
      _ = 8 := by rw [Ku.support_card, Kxv.support_card]
  have houtside : 4 ≤ outside.card := by
    dsimp only [outside]
    rw [Finset.card_sdiff_of_subset hsub]
    apply Nat.le_sub_of_add_le
    have hcard := P.hcard
    omega
  have hpairCard :
      ({P.jointDeletion.deleted.1, P.v.1} : Finset ℝ²).card ≤ 2 := by
    exact le_trans (Finset.card_insert_le _ _) (by simp)
  have hinterCard :
      (outside ∩ {P.jointDeletion.deleted.1, P.v.1}).card ≤ 2 := by
    exact le_trans (Finset.card_le_card Finset.inter_subset_right) hpairCard
  have hcleanCard : 2 ≤ clean.card := by
    have hsplit := Finset.card_sdiff_add_card_inter outside
      {P.jointDeletion.deleted.1, P.v.1}
    dsimp only [clean]
    omega
  obtain ⟨q, hqClean⟩ := Finset.card_pos.mp (by omega : 0 < clean.card)
  obtain ⟨r, hrClean, hrNeQ⟩ :=
    Finset.exists_mem_ne (by omega : 1 < clean.card) q
  have clean_spec : ∀ z ∈ clean,
      z ∈ D.A ∧ z ∉ Ku.support ∧ z ∉ Kxv.support ∧
        z ≠ P.jointDeletion.deleted.1 ∧ z ≠ P.v.1 := by
    intro z hz
    have hzClean := Finset.mem_sdiff.mp hz
    have hzOutside := Finset.mem_sdiff.mp hzClean.1
    have hzNotUnion := hzOutside.2
    have hzNotPair := hzClean.2
    exact ⟨hzOutside.1,
      fun hzKu ↦ hzNotUnion (Finset.mem_union_left _ hzKu),
      fun hzKxv ↦ hzNotUnion (Finset.mem_union_right _ hzKxv),
      by simpa using fun h ↦ hzNotPair (by simp [h]),
      by simpa using fun h ↦ hzNotPair (by simp [h])⟩
  have offclass : ∀ z ∈ clean,
      z ∉ SelectedClass D.A S.oppApex2 P.rho := by
    intro z hz hclass
    rcases clean_spec z hz with
      ⟨_hzA, hzNotKu, hzNotKxv, hzNeDeleted, hzNeV⟩
    rcases hclassFive z hclass with
      hzu | hzxu | hzdeleted | hzv | hzxv
    · exact hzNotKxv (hzu ▸ huXvRow)
    · have hxuKu : packet.xu ∈ Ku.support := by
        have hxuTrace :
            packet.xu ∈ Ku.support ∩
              SelectedClass D.A S.oppApex2 P.rho := by
          dsimp only [Ku]
          rw [packet.source_row_trace]
          simp
        exact (Finset.mem_inter.mp hxuTrace).1
      exact hzNotKu (hzxu ▸ hxuKu)
    · exact hzNeDeleted hzdeleted
    · exact hzNeV hzv
    · exact hzNotKxv (hzxv ▸ Kxv.q_mem_support)
  have hcenterKu : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hcA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hcNeXv : Hlate.centerAt packet.xv hxvA ≠ packet.xv := by
    intro hEq
    apply Kxv.center_not_mem_support
    have hmemEq := congrArg (fun z : ℝ² ↦ z ∈ Kxv.support) hEq
    exact hmemEq.mpr Kxv.q_mem_support
  have packet_of_clean : ∀ z ∈ clean,
      Nonempty (CommonDeletionTwoCenterPacket D Hlate z
        (Hlate.centerAt packet.xv hxvA) packet.xv) := by
    intro z hz
    rcases clean_spec z hz with ⟨hzA, hzNotKu, hzNotKxv, _⟩
    apply nonempty_commonDeletionTwoCenterPacket Hlate hzA hcA hxvA hcNeXv
    · exact selectedFourClass_survives_erase_of_not_mem
        Kxv.toSelectedFourClass hzNotKxv
    · have hsurvives := selectedFourClass_survives_erase_of_not_mem
          Ku.toSelectedFourClass hzNotKu
      simpa only [hcenterKu] using hsurvives
  exact ⟨q, r, hrNeQ.symm, offclass q hqClean, offclass r hrClean,
    packet_of_clean q hqClean, packet_of_clean r hrClean⟩

private theorem capByIndex_oppIndex2_eq_oppCap2_probe
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The portion of the large physical second cap omitted by the `xv` row is
a four-source deletion fan.  Erasing any member preserves both the `xv` row
at its off-class blocker and the exact-five row at the physical apex. -/
theorem pentagonOffClass_secondCap_commonDeletionFan_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    let T := S.capByIndex S.oppIndex2 \
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support
    4 ≤ T.card ∧
      ∀ q ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D (lateFirstApexSystem R) q
          ((lateFirstApexSystem R).centerAt packet.xv hxvA)
          S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  have hrowCap :
      Kxv.support ∩ S.capByIndex S.oppIndex2 =
        ({P.u.1, packet.xv} : Finset ℝ²) := by
    simpa only [Hlate, Kxv] using
      pentagonOffClass_xvRow_secondCap_eq_pair_probe
        P packet hxvA huXvRow hxvInterior hblockerInterior
  have hinterCard :
      (S.capByIndex S.oppIndex2 ∩ Kxv.support).card = 2 := by
    rw [Finset.inter_comm, hrowCap]
    simp [pentagonOffClass_u_ne_xv_probe P packet]
  have hcapCard : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2_probe] using hsecond
  have hTCard : 4 ≤ T.card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      (S.capByIndex S.oppIndex2) Kxv.support
    dsimp only [T]
    omega
  refine ⟨hTCard, ?_⟩
  intro q hqT
  have hqParts := Finset.mem_sdiff.mp hqT
  have hqA : q ∈ D.A :=
    S.capByIndex_subset S.oppIndex2 hqParts.1
  have hcA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcNeO : Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  apply nonempty_commonDeletionTwoCenterPacket Hlate hqA hcA hOA hcNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kxv.toSelectedFourClass hqParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := q) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- The four-source second-cap fan cannot be a single actual-blocker fiber.
If every source outside the `xv` row had the same blocker as the blocker of
`centerAt xv`, equality of selected supports would propagate around three
consecutive edges of the physical pentagon and put three physical-class
points into one late row. -/
theorem pentagonOffClass_secondCap_fan_actualBlocker_not_constant_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    ∃ q : CarrierVertex D.A,
      q.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt c hcA := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  let c := Hlate.centerAt packet.xv hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  change ∃ q : CarrierVertex D.A,
    q.1 ∈ T ∧ Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt c hcA
  have hfan := pentagonOffClass_secondCap_commonDeletionFan_probe
    P packet hsecond hxvA huXvRow hxvInterior hblockerInterior
  have hTCard : 4 ≤ T.card := by
    simpa only [Hlate, Kxv, T] using hfan.1
  have hcT : c ∈ T := by
    exact Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior,
        Kxv.center_not_mem_support⟩
  by_contra hnonconstant
  have hconstant : ∀ q : CarrierVertex D.A,
      q.1 ∈ T → Hlate.centerAt q.1 q.2 = Hlate.centerAt c hcA := by
    intro q hqT
    by_contra hne
    exact hnonconstant ⟨q, hqT, hne⟩
  have hTsub : T ⊆ Kc.support := by
    intro q hqT
    have hqA : q ∈ D.A :=
      S.capByIndex_subset S.oppIndex2 (Finset.mem_sdiff.mp hqT).1
    have hcenters : Hlate.centerAt q hqA = Hlate.centerAt c hcA :=
      hconstant ⟨q, hqA⟩ hqT
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq Hlate hqA hcA hcenters
    rw [← hsupports]
    exact (Hlate.selectedAt q hqA).toCriticalFourShell.q_mem_support
  have hTeq : T = Kc.support :=
    Finset.eq_of_subset_of_card_le hTsub (by
      rw [Kc.support_card]
      exact hTCard)
  have hxuInter :
      packet.xu ∈
        ((Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho) := by
    simpa only [Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow :
      packet.xu ∈ (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hpair :
        packet.xu ∈
          ({P.u.1, packet.xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp hpair).2
  have hxuNotKxv : packet.xu ∉ Kxv.support := by
    intro hxuKxv
    have hrowCap := pentagonOffClass_xvRow_secondCap_eq_pair_probe
      P packet hxvA huXvRow hxvInterior hblockerInterior
    have hmem : packet.xu ∈ ({P.u.1, packet.xv} : Finset ℝ²) := by
      rw [← hrowCap]
      exact Finset.mem_inter.mpr
        ⟨hxuKxv,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with hxuEqU | hxuEqXv
    · exact packet.xu_ne_u hxuEqU
    · apply Kxv.center_not_mem_support
      have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
        simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
      have hxvNotURow : packet.xv ∉
          (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
        rw [← hcenterU]
        exact (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
      exact (hxvNotURow (hxuEqXv ▸ hxuURow)).elim
  have hxuT : packet.xu ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior,
        hxuNotKxv⟩
  have hcenterXu : Hlate.centerAt packet.xu hxuA = Hlate.centerAt c hcA :=
    hconstant ⟨packet.xu, hxuA⟩ hxuT
  have hsupportXu :
      (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell.support =
        Kc.support :=
    selectedSupports_eq_of_actualBlockers_eq Hlate hxuA hcA hcenterXu
  have hdeletedKc : P.jointDeletion.deleted.1 ∈ Kc.support := by
    rw [← hsupportXu]
    exact hdeletedXuRow
  have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
    rw [hTeq]
    exact hdeletedKc
  have hcenterDeleted :
      Hlate.centerAt P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 =
        Hlate.centerAt c hcA :=
    hconstant P.jointDeletion.deleted hdeletedT
  have hsupportDeleted :
      (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support =
        Kc.support :=
    selectedSupports_eq_of_actualBlockers_eq Hlate
      P.jointDeletion.deleted.2 hcA hcenterDeleted
  have hvKc : P.v.1 ∈ Kc.support := by
    rw [← hsupportDeleted]
    exact hvDeletedRow
  have hcardKc :
      (Kc.support ∩ SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 := by
    simpa only [Hlate, c, hcA, Kc] using
      actualLateRow_secondClass_card_le_two
        (rho := P.rho) R P.surface (⟨c, hcA⟩ : CarrierVertex D.A)
  have hxuKc : packet.xu ∈ Kc.support := by
    rw [← hTeq]
    exact hxuT
  have hxuNeDeleted : packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [← h] using hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  exact
    (third_not_mem_of_card_le_two hcardKc
      (Finset.mem_inter.mpr ⟨hxuKc, hxuClass⟩)
      (Finset.mem_inter.mpr
        ⟨hdeletedKc, P.jointDeletion.deleted_mem_class⟩)
      hxuNeDeleted hxuNeV hdeletedNeV)
      (Finset.mem_inter.mpr ⟨hvKc, P.hvClass⟩)

/-- The second-cap fan contains two sources whose actual blockers are distinct
and avoid both fixed common-deletion centers.  This is the strongest
blocker-diversity statement available from the fan without additionally
localizing the blockers to the ordered cap. -/
theorem pentagonOffClass_secondCap_fan_two_offCenter_blockers_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv hxvA
    ∃ q r : CarrierVertex D.A,
      q.1 ∈ T ∧ r.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt r.1 r.2 ∧
        Hlate.centerAt q.1 q.2 ≠ c ∧
        Hlate.centerAt q.1 q.2 ≠ S.oppApex2 ∧
        Hlate.centerAt r.1 r.2 ≠ c ∧
        Hlate.centerAt r.1 r.2 ≠ S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  let c := Hlate.centerAt packet.xv hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  obtain ⟨q, hqT, hqNe⟩ :=
    pentagonOffClass_secondCap_fan_actualBlocker_not_constant_probe
      P packet hsecond hxuA hxvA huXvRow hdeletedXuRow hvDeletedRow
        hxvInterior hblockerInterior
  have hqA : q.1 ∈ D.A :=
    S.capByIndex_subset S.oppIndex2 (Finset.mem_sdiff.mp hqT).1
  have hcT : c ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior,
        Kxv.center_not_mem_support⟩
  have hqBlockerNeC : Hlate.centerAt q.1 q.2 ≠ c := by
    intro hqCenter
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq Hlate hqA hxvA
        (hqCenter.trans rfl)
    exact (Finset.mem_sdiff.mp hqT).2 (hsupports ▸
      (Hlate.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support)
  have hcBlockerNeC : Hlate.centerAt c hcA ≠ c := by
    exact ATailMinimalUniqueFourCover.centerAt_ne_source Hlate c hcA
  refine ⟨q, ⟨c, hcA⟩, hqT, hcT, ?_, hqBlockerNeC, ?_,
    hcBlockerNeC, ?_⟩
  · simpa only [Hlate, Kxv, T, c] using hqNe
  · exact P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  · exact P.surface.secondApex_robust.centerAt_ne Hlate c hcA

/-- The two off-center sources in the second-cap fan admit an exhaustive
endpoint-deletion split.  If the same endpoint deletion works for both
sources, it already yields a two-center common-deletion packet.  Otherwise
the two surviving deletions are crossed. -/
theorem pentagonOffClass_secondCap_crossedEndpointDeletion_split_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv hxvA
    ∃ q r : CarrierVertex D.A,
      q.1 ∈ T ∧ r.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt r.1 r.2 ∧
        Hlate.centerAt q.1 q.2 ≠ c ∧
        Hlate.centerAt q.1 q.2 ≠ S.oppApex2 ∧
        Hlate.centerAt r.1 r.2 ≠ c ∧
        Hlate.centerAt r.1 r.2 ≠ S.oppApex2 ∧
        ((∃ deleted : ℝ²,
            (deleted = P.u.1 ∨ deleted = packet.xv) ∧
              Nonempty (CommonDeletionTwoCenterPacket D Hlate deleted
                (Hlate.centerAt q.1 q.2)
                (Hlate.centerAt r.1 r.2))) ∨
          (HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
                (Hlate.centerAt q.1 q.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
                (Hlate.centerAt r.1 r.2)) ∨
          (HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
                (Hlate.centerAt q.1 q.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
                (Hlate.centerAt r.1 r.2))) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  let c := Hlate.centerAt packet.xv hxvA
  obtain ⟨q, r, hqT, hrT, hqr, hqNeC, hqNeO, hrNeC, hrNeO⟩ :=
    pentagonOffClass_secondCap_fan_two_offCenter_blockers_probe
      P packet hsecond hxuA hxvA huXvRow hdeletedXuRow hvDeletedRow
        hxvInterior hblockerInterior
  have hqSplit := pentagonOffClass_u_or_xv_deletion_survives_probe
    P packet hxvA huXvRow q (Finset.mem_sdiff.mp hqT).2
  have hrSplit := pentagonOffClass_u_or_xv_deletion_survives_probe
    P packet hxvA huXvRow r (Finset.mem_sdiff.mp hrT).2
  have hqBlockerA : Hlate.centerAt q.1 q.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt q.1 q.2).toCriticalFourShell.center_mem).2
  have hrBlockerA : Hlate.centerAt r.1 r.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt r.1 r.2).toCriticalFourShell.center_mem).2
  refine ⟨q, r, hqT, hrT, hqr, hqNeC, hqNeO, hrNeC, hrNeO, ?_⟩
  rcases hqSplit with hqU | hqXv <;>
    rcases hrSplit with hrU | hrXv
  · left
    refine ⟨P.u.1, Or.inl rfl, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket Hlate
      P.u.2 hqBlockerA hrBlockerA hqr hqU hrU
  · exact Or.inr (Or.inl ⟨hqU, hrXv⟩)
  · exact Or.inr (Or.inr ⟨hqXv, hrU⟩)
  · left
    refine ⟨packet.xv, Or.inr rfl, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket Hlate
      hxvA hqBlockerA hrBlockerA hqr hqXv hrXv

/-- The physical exact-five class also supplies a three-source deletion fan
for the next canonical row, centered at the actual blocker of the off-class
point `centerAt xv`. -/
theorem pentagonOffClass_physicalClass_commonDeletionFan_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A) :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt packet.xv hxvA
    let hcA : c ∈ D.A :=
      (Finset.mem_erase.mp
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let T := SelectedClass D.A S.oppApex2 P.rho \ Kc.support
    3 ≤ T.card ∧
      ∀ q ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate q (Hlate.centerAt c hcA) S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt packet.xv hxvA
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let T := SelectedClass D.A S.oppApex2 P.rho \ Kc.support
  have hinter :
      (SelectedClass D.A S.oppApex2 P.rho ∩ Kc.support).card ≤ 2 := by
    have hrow := actualLateRow_secondClass_card_le_two
      (rho := P.rho) R P.surface (⟨c, hcA⟩ : CarrierVertex D.A)
    change (SelectedClass D.A S.oppApex2 P.rho ∩ Kc.support).card ≤ 2
    rw [Finset.inter_comm]
    exact hrow
  have hTCard : 3 ≤ T.card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      (SelectedClass D.A S.oppApex2 P.rho) Kc.support
    dsimp only [T]
    rw [P.hclassFive] at hsplit
    omega
  refine ⟨hTCard, ?_⟩
  intro q hqT
  have hqParts := Finset.mem_sdiff.mp hqT
  have hqA : q ∈ D.A := (mem_selectedClass.mp hqParts.1).1
  have hdA : Hlate.centerAt c hcA ∈ D.A :=
    (Finset.mem_erase.mp Kc.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hdNeO : Hlate.centerAt c hcA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  apply nonempty_commonDeletionTwoCenterPacket Hlate hqA hdA hOA hdNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kc.toSelectedFourClass hqParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := q) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- A second cap with at least six points contains a carrier source outside
the exact physical five-class. -/
theorem pentagonOffClass_exists_unusedSecondCapSource_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond : 6 ≤ S.oppCap2.card) :
    ∃ q : CarrierVertex D.A,
      q.1 ∈ S.capByIndex S.oppIndex2 ∧
        q.1 ∉ SelectedClass D.A S.oppApex2 P.rho := by
  classical
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  by_contra hnone
  push_neg at hnone
  have hsub :
      S.capByIndex S.oppIndex2 ⊆
        SelectedClass D.A S.oppApex2 P.rho := by
    intro x hxCap
    exact hnone ⟨x, S.capByIndex_subset S.oppIndex2 hxCap⟩ hxCap
  have hcardLe := Finset.card_le_card hsub
  rw [P.hclassFive] at hcardLe
  rw [hcapEq] at hcardLe
  omega

/-- An unused source in the second cap cannot have two distinct physical
exact-five points from the strict second-cap interior in its actual selected
row.  The two physical hits localize the row center into the same cap; the
source itself is then a third cap point in a selected four-class row. -/
theorem pentagonOffClass_false_of_unusedSecondCapSource_twoPhysicalInteriorHits_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (q : CarrierVertex D.A)
    (hqCap : q.1 ∈ S.capByIndex S.oppIndex2)
    (hqNotClass : q.1 ∉ SelectedClass D.A S.oppApex2 P.rho)
    {x y : ℝ²}
    (hxy : x ≠ y)
    (hxPhysicalInterior :
      x ∈ SelectedClass D.A S.oppApex2 P.rho ∩
        S.capInteriorByIndex S.oppIndex2)
    (hyPhysicalInterior :
      y ∈ SelectedClass D.A S.oppApex2 P.rho ∩
        S.capInteriorByIndex S.oppIndex2)
    (hxRow :
      x ∈ ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell.support)
    (hyRow :
      y ∈ ((lateFirstApexSystem R).selectedAt
        q.1 q.2).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
  have hxParts := Finset.mem_inter.mp hxPhysicalInterior
  have hyParts := Finset.mem_inter.mp hyPhysicalInterior
  have hbA : Hlate.centerAt q.1 q.2 ∈ D.A :=
    (Finset.mem_erase.mp Kq.center_mem).2
  have hbNeO : Hlate.centerAt q.1 q.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  have hbEq :
      dist (Hlate.centerAt q.1 q.2) x =
        dist (Hlate.centerAt q.1 q.2) y :=
    (Kq.support_eq_radius x hxRow).trans
      (Kq.support_eq_radius y hyRow).symm
  have hOEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (mem_selectedClass.mp hxParts.1).2.trans
      (mem_selectedClass.mp hyParts.1).2.symm
  have hbInterior :
      Hlate.centerAt q.1 q.2 ∈
        S.capInteriorByIndex S.oppIndex2 :=
    ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior
      hbA hbNeO hxParts.2 hyParts.2 hxy hbEq hOEq
  have hbCap :
      Hlate.centerAt q.1 q.2 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hbInterior
  have hrowCapCard :
      (Kq.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kq.toSelectedFourClass hbCap
  have hqInter : q.1 ∈ Kq.support ∩ S.capByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr ⟨Kq.q_mem_support, hqCap⟩
  have hxInter : x ∈ Kq.support ∩ S.capByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr
      ⟨hxRow, S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxParts.2⟩
  have hyInter : y ∈ Kq.support ∩ S.capByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr
      ⟨hyRow, S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hyParts.2⟩
  have hqNeX : q.1 ≠ x := by
    intro h
    apply hqNotClass
    simpa only [h] using hxParts.1
  have hqNeY : q.1 ≠ y := by
    intro h
    apply hqNotClass
    simpa only [h] using hyParts.1
  exact
    third_not_mem_of_card_le_two hrowCapCard hqInter hxInter
      hqNeX hqNeY hxy hyInter

/-- The constructive complement of the two-hit contradiction.  For any
off-class source in the second cap, at least two members of the physical
exact-five strict-interior class avoid its actual critical row.  Deleting
either such member preserves K4 at both the row's actual blocker and the
physical apex. -/
theorem pentagonOffClass_unusedSource_physicalInterior_commonDeletionFan_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (q : CarrierVertex D.A)
    (hqCap : q.1 ∈ S.capByIndex S.oppIndex2)
    (hqNotClass : q.1 ∉ SelectedClass D.A S.oppApex2 P.rho) :
    let Hlate := lateFirstApexSystem R
    let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
    let T :=
      (SelectedClass D.A S.oppApex2 P.rho ∩
          S.capInteriorByIndex S.oppIndex2) \ Kq.support
    2 ≤ T.card ∧
      ∀ x ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate x (Hlate.centerAt q.1 q.2) S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
  let I := SelectedClass D.A S.oppApex2 P.rho ∩
    S.capInteriorByIndex S.oppIndex2
  let T := I \ Kq.support
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex2, hi]
  have hfiveAtIndex :
      (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho).card = 5 := by
    simpa only [← hcenter] using P.hclassFive
  have hIthree : 3 ≤ I.card := by
    simpa only [I, ← hcenter] using
      ATailUniqueRowProducerScratch.selectedClass_capInteriorByIndex_card_ge_three_of_card_five
        S D.convex S.oppIndex2 P.hrho hfiveAtIndex
  have hinterOne : (I ∩ Kq.support).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    have hxParts := Finset.mem_inter.mp hx
    have hyParts := Finset.mem_inter.mp hy
    by_contra hxy
    exact pentagonOffClass_false_of_unusedSecondCapSource_twoPhysicalInteriorHits_probe
      P q hqCap hqNotClass hxy
        (by simpa only [I] using hxParts.1)
        (by simpa only [I] using hyParts.1)
        (by simpa only [Kq] using hxParts.2)
        (by simpa only [Kq] using hyParts.2)
  have hTtwo : 2 ≤ T.card := by
    have hsplit := Finset.card_sdiff_add_card_inter I Kq.support
    dsimp only [T]
    omega
  refine ⟨hTtwo, ?_⟩
  intro x hxT
  have hxParts := Finset.mem_sdiff.mp hxT
  have hxI :
      x ∈ SelectedClass D.A S.oppApex2 P.rho ∩
        S.capInteriorByIndex S.oppIndex2 := by
    simpa only [I] using hxParts.1
  have hxA : x ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hxI).1).1
  have hbA : Hlate.centerAt q.1 q.2 ∈ D.A :=
    (Finset.mem_erase.mp Kq.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hbNeO : Hlate.centerAt q.1 q.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  apply nonempty_commonDeletionTwoCenterPacket Hlate hxA hbA hOA hbNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kq.toSelectedFourClass hxParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := x) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- Every actual late row meets the exact physical five-class in at most two
points.  The actual blocker differs from the fully deletion-robust physical
apex, so the two corresponding circles cannot share three carrier points. -/
theorem pentagonOffClass_actualRow_physicalClass_card_le_two_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (q : CarrierVertex D.A) :
    let Hlate := lateFirstApexSystem R
    let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
    let C := SelectedClass D.A S.oppApex2 P.rho
    (Kq.support ∩ C).card ≤ 2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hCnotSub : ¬ C ⊆ Kq.support := by
    intro hsub
    have hcard := Finset.card_le_card hsub
    dsimp only [C] at hcard
    rw [P.hclassFive, Kq.support_card] at hcard
    omega
  obtain ⟨x, hxC, hxNotKq⟩ := Finset.not_subset.mp hCnotSub
  let CO : SelectedFourClass D.A S.oppApex2 :=
    { support := C.erase x
      support_subset_A := by
        intro z hz
        exact (mem_selectedClass.mp
          (Finset.mem_erase.mp hz).2).1
      support_card := by
        rw [Finset.card_erase_of_mem hxC]
        dsimp only [C]
        rw [P.hclassFive]
      radius := P.rho
      radius_pos := P.hrho
      support_eq_radius := by
        intro z hz
        exact (mem_selectedClass.mp
          (Finset.mem_erase.mp hz).2).2
      center_not_mem := by
        intro hO
        have hOrho := (mem_selectedClass.mp
          (Finset.mem_erase.mp hO).2).2
        rw [dist_self] at hOrho
        exact P.hrho.ne' hOrho.symm }
  have hbNeO : Hlate.centerAt q.1 q.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  have hinter :
      (Kq.support ∩ CO.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two
      Kq.toSelectedFourClass CO hbNeO
  have heq : Kq.support ∩ C = Kq.support ∩ C.erase x := by
    ext z
    simp only [Finset.mem_inter, Finset.mem_erase]
    constructor
    · rintro ⟨hzKq, hzC⟩
      refine ⟨hzKq, ?_, hzC⟩
      intro hzx
      apply hxNotKq
      simpa only [hzx] using hzKq
    · rintro ⟨hzKq, _, hzC⟩
      exact ⟨hzKq, hzC⟩
  dsimp only [Hlate, Kq, C]
  rw [heq]
  simpa only [CO] using hinter

/-- Reselect at the off-class blocker `c = centerAt xv`.  Its new actual row
can contain at most one of the three known physical points `u`, `xu`, and
`xv` in the strict second-cap interior.  Two such points would localize the
new row center back into that cap; together with the source `c`, the row
would then have three points in one indexed cap. -/
theorem pentagonOffClass_reselectedRow_strictPhysicalTriple_card_le_one_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (hblockerNotClass :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt packet.xv hxvA
    let Kc := (Hlate.selectedAt c (by
      exact (Finset.mem_erase.mp
        ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.center_mem)).2
      )).toCriticalFourShell
    (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card ≤ 1 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv hxvA
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_u_mem_secondCapInterior_probe P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_xu_mem_secondCapInterior_probe P packet
  have hnamedClass :
      ∀ z ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²),
        z ∈ SelectedClass D.A S.oppApex2 P.rho := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact P.huClass
    · rw [packet.physical_class]
      simp
    · rw [packet.physical_class]
      simp
  have hnamedInterior :
      ∀ z ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²),
        z ∈ S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact huInterior
    · exact hxuInterior
    · exact hxvInterior
  apply Finset.card_le_one.mpr
  intro x hx y hy
  have hxParts := Finset.mem_inter.mp hx
  have hyParts := Finset.mem_inter.mp hy
  by_contra hxy
  have hxClass := hnamedClass x hxParts.2
  have hyClass := hnamedClass y hyParts.2
  have hxInterior := hnamedInterior x hxParts.2
  have hyInterior := hnamedInterior y hyParts.2
  let d := Hlate.centerAt c hcA
  have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
  have hdNeO : d ≠ S.oppApex2 := by
    simpa [d, Hlate, c] using
      P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  have hdEq : dist d x = dist d y :=
    (Kc.support_eq_radius x hxParts.1).trans
      (Kc.support_eq_radius y hyParts.1).symm
  have hphysicalEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (mem_selectedClass.mp hxClass).2.trans
      (mem_selectedClass.mp hyClass).2.symm
  have hdInterior : d ∈ S.capInteriorByIndex S.oppIndex2 :=
    ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior
      hdA hdNeO hxInterior hyInterior hxy hdEq hphysicalEq
  have hcCap : c ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hxCap : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxInterior
  have hyCap : y ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hyInterior
  have hdCap : d ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hdInterior
  have hcapTwo :
      (Kc.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kc.toSelectedFourClass hdCap
  have hcNeX : c ≠ x := by
    intro hcx
    apply hblockerNotClass
    simpa [c, Hlate, hcx] using hxClass
  have hcNeY : c ≠ y := by
    intro hcy
    apply hblockerNotClass
    simpa [c, Hlate, hcy] using hyClass
  have hthreeSubset :
      ({c, x, y} : Finset ℝ²) ⊆
        Kc.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨Kc.q_mem_support, hcCap⟩
    · exact Finset.mem_inter.mpr ⟨hxParts.1, hxCap⟩
    · exact Finset.mem_inter.mpr ⟨hyParts.1, hyCap⟩
  have hthreeCard : ({c, x, y} : Finset ℝ²).card = 3 := by
    simp [hcNeX, hcNeY, hxy]
  have hthree :
      3 ≤ (Kc.support ∩ S.capByIndex S.oppIndex2).card := by
    rw [← hthreeCard]
    exact Finset.card_le_card hthreeSubset
  omega

/-- Consequently every actual row has at least three available deletions from
the exact physical five-class, and each deletion preserves K4 at both the
row's actual blocker and the physical apex. -/
theorem pentagonOffClass_physicalClass_commonDeletionTriple_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (q : CarrierVertex D.A) :
    let Hlate := lateFirstApexSystem R
    let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
    let T := SelectedClass D.A S.oppApex2 P.rho \ Kq.support
    3 ≤ T.card ∧
      ∀ x ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate x (Hlate.centerAt q.1 q.2) S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kq := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let T := C \ Kq.support
  have hinter : (Kq.support ∩ C).card ≤ 2 := by
    simpa only [Hlate, Kq, C] using
      pentagonOffClass_actualRow_physicalClass_card_le_two_probe P q
  have hTthree : 3 ≤ T.card := by
    have hsplit : T.card + (Kq.support ∩ C).card = C.card := by
      dsimp only [T]
      rw [Finset.inter_comm]
      exact Finset.card_sdiff_add_card_inter C Kq.support
    dsimp only [C] at hsplit
    rw [P.hclassFive] at hsplit
    dsimp only [C] at hinter
    omega
  refine ⟨hTthree, ?_⟩
  intro x hxT
  have hxParts := Finset.mem_sdiff.mp hxT
  have hxC : x ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [C] using hxParts.1
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxC).1
  have hbA : Hlate.centerAt q.1 q.2 ∈ D.A :=
    (Finset.mem_erase.mp Kq.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hbNeO : Hlate.centerAt q.1 q.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  apply nonempty_commonDeletionTwoCenterPacket Hlate hxA hbA hOA hbNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kq.toSelectedFourClass hxParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := x) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- Reselecting at the off-class blocker produces two distinct deletions from
the strict physical triple.  Both deletions preserve K4 at the reselected
row's actual blocker and at the physical second apex. -/
theorem pentagonOffClass_exists_two_strictPhysical_commonDeletions_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (hblockerNotClass :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt packet.xv hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.center_mem)).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    ∃ q w : ℝ²,
      q ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ∧
      w ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ∧
      q ≠ w ∧ q ∉ Kc.support ∧ w ∉ Kc.support ∧
      Nonempty (CommonDeletionTwoCenterPacket D Hlate q d S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket D Hlate w d S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let U : Finset ℝ² :=
    ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) \ Kc.support
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClass_u_ne_xv_probe P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClass_xu_ne_xv_probe P packet
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinter :
      (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card ≤ 1 := by
    simpa only [Hlate, c, hcA, Kc] using
      pentagonOffClass_reselectedRow_strictPhysicalTriple_card_le_one_probe
        P packet hxvA hxvInterior hblockerInterior hblockerNotClass
  have hsplit :
      U.card + (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card = 3 := by
    dsimp only [U]
    rw [Finset.inter_comm]
    simpa only [htripleCard] using
      Finset.card_sdiff_add_card_inter
        ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) Kc.support
  have hUtwo : 2 ≤ U.card := by omega
  rcases Finset.one_lt_card.mp (show 1 < U.card by omega) with
    ⟨q, hqU, w, hwU, hqw⟩
  have hqParts := Finset.mem_sdiff.mp hqU
  have hwParts := Finset.mem_sdiff.mp hwU
  have hcommon :=
    pentagonOffClass_physicalClass_commonDeletionTriple_probe
      P (⟨c, hcA⟩ : CarrierVertex D.A)
  have hqClass : q ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hqParts
    rcases hqParts.1 with rfl | rfl | rfl
    · exact P.huClass
    · rw [packet.physical_class]
      simp
    · rw [packet.physical_class]
      simp
  have hwClass : w ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hwParts
    rcases hwParts.1 with rfl | rfl | rfl
    · exact P.huClass
    · rw [packet.physical_class]
      simp
    · rw [packet.physical_class]
      simp
  have hqPacket := hcommon.2 q (Finset.mem_sdiff.mpr ⟨hqClass, hqParts.2⟩)
  have hwPacket := hcommon.2 w (Finset.mem_sdiff.mpr ⟨hwClass, hwParts.2⟩)
  exact ⟨q, w, hqParts.1, hwParts.1, hqw, hqParts.2, hwParts.2,
    hqPacket, hwPacket⟩

/-- Away from the `xv` row, every actual blocker preserves at least one of
the two deletions `u` and `xv`.  If both deletions failed, the blocker would
bisect `{xv,u}`; the exact bisector pair then makes it either the `xv`-row
blocker (forcing equality of supports) or the fully robust physical apex. -/
theorem pentagonOffClass_pairDeletion_survival_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (t : ℝ²) (htA : t ∈ D.A)
    (htNotXvRow :
      t ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt t htA) ∨
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt t htA) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kt := (Hlate.selectedAt t htA).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  by_cases huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt t htA)
  · exact Or.inl huSurvives
  by_cases hxvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        (Hlate.centerAt t htA)
  · exact Or.inr hxvSurvives
  have huKt : P.u.1 ∈ Kt.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt t htA) huSurvives
  have hxvKt : packet.xv ∈ Kt.support :=
    source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt t htA) hxvSurvives
  have htBisector :
      Hlate.centerAt t htA ∈
        D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1) := by
    apply Finset.mem_filter.mpr
    refine ⟨(Finset.mem_erase.mp Kt.center_mem).2, ?_⟩
    exact (Kt.support_eq_radius packet.xv hxvKt).trans
      (Kt.support_eq_radius P.u.1 huKt).symm
  have hpair :=
    pentagonOffClass_xv_u_bisector_eq_pair_probe
      P packet hxvA huXvRow
  have htCenters :
      Hlate.centerAt t htA = Hlate.centerAt packet.xv hxvA ∨
        Hlate.centerAt t htA = S.oppApex2 := by
    rw [hpair] at htBisector
    simpa only [Finset.mem_insert, Finset.mem_singleton] using htBisector
  rcases htCenters with htCenterXv | htCenterO
  · have hsupports : Kt.support = Kxv.support := by
      let K : SelectedFourClass D.A (Hlate.centerAt t htA) :=
        { support := Kxv.support
          support_subset_A := Kxv.support_subset_A
          support_card := Kxv.support_card
          radius := Kxv.radius
          radius_pos := Kxv.radius_pos
          support_eq_radius := by
            intro z hz
            rw [htCenterXv]
            exact Kxv.support_eq_radius z hz
          center_not_mem := by
            intro hmem
            apply Kxv.center_not_mem_support
            have hmem' : Hlate.centerAt t htA ∈ Kxv.support := hmem
            rw [htCenterXv] at hmem'
            exact hmem' }
      exact (Hlate.selectedFourClass_support_eq_shell t htA K).symm
    have htOwn : t ∈ Kt.support := Kt.q_mem_support
    rw [hsupports] at htOwn
    exact (htNotXvRow htOwn).elim
  · exact
      (P.surface.secondApex_robust.centerAt_ne Hlate t htA htCenterO).elim

/-- Outside the `xv` row, color each source by which one of the two deletions
`u` and `xv` survives at its actual blocker.  Unless the whole carrier has
exactly twelve points, at least nine sources lie outside the four-point row,
so one color has five members.  The four-source bound on an actual-blocker
fiber then gives two distinct actual blockers for one deletion; together with
the physical apex, that deletion survives at three pairwise distinct centers.

The exact-card-twelve alternative is intentionally retained as a finite
residue rather than being hidden behind a bounded search assumption. -/
theorem pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    D.A.card = 12 ∨
      ∃ deleted : ℝ²,
        (deleted = P.u.1 ∨ deleted = packet.xv) ∧
        ∃ source₁ source₂ : CarrierVertex D.A,
          source₁.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          source₂.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              S.oppApex2 ∧
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠
              S.oppApex2 ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let inside : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦ source.1 ∈ Kxv.support
  let outside : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦ source.1 ∉ Kxv.support
  have hinsideImage :
      inside.image (fun source ↦ source.1) = Kxv.support := by
    ext z
    simp only [inside, Finset.mem_image, Finset.mem_filter,
      Finset.mem_univ, true_and]
    constructor
    · rintro ⟨source, hsource, rfl⟩
      exact hsource
    · intro hz
      exact ⟨⟨z, Kxv.support_subset_A hz⟩, hz, rfl⟩
  have hinsideCard : inside.card = 4 := by
    have himageCard :=
      Finset.card_image_of_injective inside Subtype.val_injective
    rw [hinsideImage, Kxv.support_card] at himageCard
    omega
  have hinsideOutside := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset (CarrierVertex D.A)))
    (fun source ↦ source.1 ∈ Kxv.support)
  change inside.card + outside.card =
      (Finset.univ : Finset (CarrierVertex D.A)).card at hinsideOutside
  have htotal : Fintype.card (CarrierVertex D.A) = D.A.card := by
    simp [Fintype.card_coe]
  rw [Finset.card_univ, htotal, hinsideCard] at hinsideOutside
  by_cases hcardTwelve : D.A.card = 12
  · exact Or.inl hcardTwelve
  right
  have houtsideNine : 9 ≤ outside.card := by
    have hcard := P.hcard
    omega
  let uColor := outside.filter fun source ↦
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  let xvColor := outside.filter fun source ↦
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  have hcolors := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source ↦
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt source.1 source.2))
  change uColor.card + xvColor.card = outside.card at hcolors
  by_cases huFive : 5 ≤ uColor.card
  · rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate uColor huFive with
      ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
    have hsource₁Data := Finset.mem_filter.mp hsource₁
    have hsource₂Data := Finset.mem_filter.mp hsource₂
    have hsource₁Outside : source₁.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₁Data.1).2
    have hsource₂Outside : source₂.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₂Data.1).2
    have hcenter₁NeO : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₁.1 source₁.2
    have hcenter₂NeO : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₂.1 source₂.2
    have hOSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2 := by
      refine ⟨P.rho, P.hrho, ?_⟩
      have hfour := selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := P.u.1) (s := S.oppApex2)
        (d := P.rho) (n := 4) P.hfive
      simpa [SelectedClass] using hfour
    exact ⟨P.u.1, Or.inl rfl, source₁, source₂,
      hsource₁Outside, hsource₂Outside, hcenters,
      hcenter₁NeO, hcenter₂NeO,
      hsource₁Data.2, hsource₂Data.2, hOSurvives⟩
  · have hxvFive : 5 ≤ xvColor.card := by omega
    rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate xvColor hxvFive with
      ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
    have hsource₁Data := Finset.mem_filter.mp hsource₁
    have hsource₂Data := Finset.mem_filter.mp hsource₂
    have hsource₁Outside : source₁.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₁Data.1).2
    have hsource₂Outside : source₂.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₂Data.1).2
    have hsurvives₁ :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
          (Hlate.centerAt source₁.1 source₁.2) :=
      (pentagonOffClass_pairDeletion_survival_probe
        P packet hxvA huXvRow source₁.1 source₁.2
        hsource₁Outside).resolve_left hsource₁Data.2
    have hsurvives₂ :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
          (Hlate.centerAt source₂.1 source₂.2) :=
      (pentagonOffClass_pairDeletion_survival_probe
        P packet hxvA huXvRow source₂.1 source₂.2
        hsource₂Outside).resolve_left hsource₂Data.2
    have hcenter₁NeO : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₁.1 source₁.2
    have hcenter₂NeO : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₂.1 source₂.2
    have hOSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv) S.oppApex2 := by
      refine ⟨P.rho, P.hrho, ?_⟩
      have hfour := selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := packet.xv) (s := S.oppApex2)
        (d := P.rho) (n := 4) P.hfive
      simpa [SelectedClass] using hfour
    exact ⟨packet.xv, Or.inr rfl, source₁, source₂,
      hsource₁Outside, hsource₂Outside, hcenters,
      hcenter₁NeO, hcenter₂NeO, hsurvives₁, hsurvives₂,
      hOSurvives⟩

/-- At the exact-card-twelve residue, the three cap budgets are forced to
`(5,4,6)`.  Moreover the strict interior of the six-point second opposite cap
is exhausted by the source pair, the opposite companion, and its off-class
actual blocker.  This is the geometric boundary condition that an exact-12
finite search must encode; the incidence-only model does not see it. -/
theorem pentagonOffClass_card_twelve_exact_cap_profile_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxvA : packet.xv ∈ D.A)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (hblockerNotClass :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcardTwelve : D.A.card = 12) :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧
      S.oppCap2.card = 6 ∧
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv hxvA,
          packet.xv, packet.xu} ∧
      ExactFourSecondOppositeCapGrowth S := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt packet.xv hxvA
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  have hsurplusEq : S.surplusCap.card = 5 := by
    omega
  have hfirstEq : S.oppCap1.card = 4 := by
    omega
  have hsecondEq : S.oppCap2.card = 6 := by
    omega
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 :=
    capByIndex_oppIndex2_eq_oppCap2_probe S
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hinteriorCardFour :
      (S.capInteriorByIndex S.oppIndex2).card = 4 := by
    rw [hcapEq, hsecondEq] at hinteriorCard
    omega
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_u_mem_secondCapInterior_probe P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClass_xu_mem_secondCapInterior_probe P packet
  have huClass : P.u.1 ∈ SelectedClass D.A S.oppApex2 P.rho :=
    P.huClass
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have huNeC : P.u.1 ≠ c := by
    intro huEqC
    apply hblockerNotClass
    simpa [c, huEqC] using huClass
  have hcNeXv : c ≠ packet.xv := by
    intro hcEqXv
    apply hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXv]
    exact hxvClass
  have hcNeXu : c ≠ packet.xu := by
    intro hcEqXu
    apply hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXu]
    exact hxuClass
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClass_u_ne_xv_probe P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClass_xu_ne_xv_probe P packet
  have hnamedCard :
      ({P.u.1, c, packet.xv, packet.xu} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨P.u.1, c, packet.xv, packet.xu,
      huNeC, huNeXv, packet.xu_ne_u.symm,
      hcNeXv, hcNeXu, hxuNeXv.symm, rfl⟩
  have hnamedSubset :
      ({P.u.1, c, packet.xv, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact huInterior
    · exact hblockerInterior
    · exact hxvInterior
    · exact hxuInterior
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, c, packet.xv, packet.xu} := by
    exact (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [hnamedCard, hinteriorCardFour])).symm
  refine ⟨hsurplusEq, hfirstEq, hsecondEq, ?_, ?_⟩
  · simpa [c] using hinteriorEq
  · exact
      { surplusCap_card_eq_five := hsurplusEq
        firstOppCap_card_eq_four := hfirstEq
        secondOppCap_card_ge_six := hsecond
        secondOppCap_card_add_six_eq_carrier := by omega }

/-- The live off-class blocker leaf already pins the traces of all five
physical-class rows to the five edges of the named cycle.  This is stronger
than the two trace bounds exposed by the coordinator: the source and opposite
traces come from the rigid packet, while the deleted-row trace follows from
the exact physical class and the three named omissions. -/
theorem pentagonOffClass_exact_physical_cycle_traces_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxuNotDeletedRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxvNotDeletedRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = packet.xu ∨
          q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = packet.xv)
    (htraceBound :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = packet.xv ∨ x = P.u.1)
    (htraceBoundXu :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = packet.xu ∨ x = P.jointDeletion.deleted.1) :
    let Hlate := lateFirstApexSystem R
    let C := SelectedClass D.A S.oppApex2 P.rho
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C =
        {P.u.1, packet.xu} ∧
      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C =
        {P.v.1, packet.xv} ∧
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.u.1} ∧
      (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell.support ∩ C =
        {packet.xu, P.jointDeletion.deleted.1} ∧
      (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support ∩ C =
        {P.jointDeletion.deleted.1, P.v.1} := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have huClass : P.u.1 ∈ C := by simpa [C] using P.huClass
  have hvClass : P.v.1 ∈ C := by simpa [C] using P.hvClass
  have hxuClass : packet.xu ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  have hdeletedClass : P.jointDeletion.deleted.1 ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  refine ⟨by simpa [Hlate, C] using packet.source_row_trace,
    by simpa [Hlate, C] using packet.opposite_row_trace, ?_, ?_, ?_⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      exact htraceBound x (by simpa only [Hlate] using hxRow)
        (by simpa only [C] using hxClass)
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
      · exact ⟨by simpa only [Hlate] using huXvRow, huClass⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      exact htraceBoundXu x (by simpa only [Hlate] using hxRow)
        (by simpa only [C] using hxClass)
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell.q_mem_support,
          hxuClass⟩
      · exact ⟨by simpa only [Hlate] using hdeletedXuRow, hdeletedClass⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      rcases hclassFive x (by simpa only [C] using hxClass) with
        rfl | rfl | rfl | rfl | rfl
      · exact (huNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
      · exact (hxuNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
      · exact Or.inl rfl
      · exact Or.inr rfl
      · exact (hxvNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support,
          hdeletedClass⟩
      · exact ⟨by simpa only [Hlate] using hvDeletedRow, hvClass⟩

private theorem five_cycle_edgeMap_injective_probe
    {α : Type} [DecidableEq α] {a b c d e : α}
    (hcard : ({a, b, c, d, e} : Finset α).card = 5) :
    Function.Injective
      (fun i : Fin 5 => ![
        ({a, b} : Finset α), {b, c}, {c, d}, {d, e}, {e, a}] i) := by
  have hnodup : [a, b, c, d, e].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcard
  have hne :
      (a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ a ≠ e) ∧
      (b ≠ c ∧ b ≠ d ∧ b ≠ e) ∧
      (c ≠ d ∧ c ≠ e) ∧ d ≠ e := by
    simpa [List.nodup_cons, not_or] using hnodup
  rcases hne with
    ⟨⟨hab, hac, had, hae⟩, ⟨hbc, hbd, hbe⟩, ⟨hcd, hce⟩, hde⟩
  have h01 : ({a, b} : Finset α) ≠ {b, c} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hab, hac] using hx
  have h02 : ({a, b} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hac, had] using hx
  have h03 : ({a, b} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [had, hae] using hx
  have h04 : ({a, b} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h12 : ({b, c} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbc, hbd] using hx
  have h13 : ({b, c} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbd, hbe] using hx
  have h14 : ({b, c} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h23 : ({c, d} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hcd, hce] using hx
  have h24 : ({c, d} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hac, hce, Ne.symm hac, Ne.symm hce] using hx
  have h34 : ({d, e} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => d ∈ s) h
    simpa [had, hde, Ne.symm had, Ne.symm hde] using hx
  intro i j hij
  fin_cases i <;> fin_cases j <;> simp at hij ⊢
  all_goals
    first
    | exact h01 hij
    | exact h01 hij.symm
    | exact h02 hij
    | exact h02 hij.symm
    | exact h03 hij
    | exact h03 hij.symm
    | exact h04 hij
    | exact h04 hij.symm
    | exact h12 hij
    | exact h12 hij.symm
    | exact h13 hij
    | exact h13 hij.symm
    | exact h14 hij
    | exact h14 hij.symm
    | exact h23 hij
    | exact h23 hij.symm
    | exact h24 hij
    | exact h24 hij.symm
    | exact h34 hij
    | exact h34 hij.symm

/-- Exact five-cycle traces force five distinct actual blocker centers.  This
is the labeled blocker-map fact needed by any faithful exact-cardinality-12
encoding of the live leaf. -/
theorem pentagonOffClass_physical_cycle_actualBlockers_injective_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (htraces :
      let Hlate := lateFirstApexSystem R
      let C := SelectedClass D.A S.oppApex2 P.rho
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C =
          {P.u.1, packet.xu} ∧
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C =
          {P.v.1, packet.xv} ∧
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
          {packet.xv, P.u.1} ∧
        (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell.support ∩ C =
          {packet.xu, P.jointDeletion.deleted.1} ∧
        (Hlate.selectedAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support ∩ C =
          {P.jointDeletion.deleted.1, P.v.1}) :
    let Hlate := lateFirstApexSystem R
    let sources : Fin 5 → CarrierVertex D.A := fun i => ![
      P.u, ⟨packet.xu, hxuA⟩, P.jointDeletion.deleted,
      P.v, ⟨packet.xv, hxvA⟩] i
    Function.Injective fun i =>
      Hlate.centerAt (sources i).1 (sources i).2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let sources : Fin 5 → CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu, hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv, hxvA⟩] i
  let edges : Fin 5 → Finset ℝ² := fun i => ![
    ({P.u.1, packet.xu} : Finset ℝ²),
    {packet.xu, P.jointDeletion.deleted.1},
    {P.jointDeletion.deleted.1, P.v.1},
    {P.v.1, packet.xv},
    {packet.xv, P.u.1}] i
  have hnamedCard :
      ({P.u.1, packet.xu, P.jointDeletion.deleted.1,
          P.v.1, packet.xv} : Finset ℝ²).card = 5 := by
    have hsetEq :
        ({P.u.1, packet.xu, P.jointDeletion.deleted.1,
            P.v.1, packet.xv} : Finset ℝ²) =
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.physical_class]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton,
        Finset.mem_union]
      tauto
    rw [hsetEq]
    exact P.hclassFive
  have hedgeInjective : Function.Injective edges := by
    simpa only [edges] using
      (five_cycle_edgeMap_injective_probe hnamedCard)
  rcases htraces with ⟨huTrace, hvTrace, hxvTrace, hxuTrace, hdTrace⟩
  have htraceAt : ∀ i,
      (Hlate.selectedAt (sources i).1
          (sources i).2).toCriticalFourShell.support ∩ C = edges i := by
    intro i
    fin_cases i
    · simpa only [Hlate, C, sources, edges] using huTrace
    · simpa only [Hlate, C, sources, edges] using hxuTrace
    · simpa only [Hlate, C, sources, edges] using hdTrace
    · simpa only [Hlate, C, sources, edges] using hvTrace
    · simpa only [Hlate, C, sources, edges] using hxvTrace
  change Function.Injective fun i =>
    Hlate.centerAt (sources i).1 (sources i).2
  intro i j hcenters
  apply hedgeInjective
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq Hlate
      (sources i).2 (sources j).2 hcenters
  rw [← htraceAt i, ← htraceAt j, hsupports]

/-- Among the at least six sources in the second opposite cap, two have
distinct actual blockers.  Each of their selected rows omits at least three
points of the exact physical five-class, so the two omitted sets overlap.
The shared omitted point therefore survives deletion at both actual blockers
and at the deletion-robust physical apex. -/
theorem pentagonOffClass_exists_physicalDeletion_threeDistinctCenters_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsecond : 6 ≤ S.oppCap2.card) :
    ∃ deleted : ℝ²,
      deleted ∈ SelectedClass D.A S.oppApex2 P.rho ∧
        ∃ source₁ source₂ : CarrierVertex D.A,
          source₁.1 ∈ S.capByIndex S.oppIndex2 ∧
          source₂.1 ∈ S.capByIndex S.oppIndex2 ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              S.oppApex2 ∧
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠
              S.oppApex2 ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let T : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦
      source.1 ∈ S.capByIndex S.oppIndex2
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  have hTImage : T.image (fun source ↦ source.1) =
      S.capByIndex S.oppIndex2 := by
    ext x
    simp only [T, Finset.mem_image, Finset.mem_filter,
      Finset.mem_univ, true_and]
    constructor
    · rintro ⟨source, hsource, rfl⟩
      exact hsource
    · intro hx
      exact ⟨⟨x, S.capByIndex_subset S.oppIndex2 hx⟩, hx, rfl⟩
  have hTCard : 5 ≤ T.card := by
    have himageCard :=
      Finset.card_image_of_injective T Subtype.val_injective
    rw [hTImage, hcapEq] at himageCard
    omega
  rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate T hTCard with
    ⟨source₁, hsource₁T, source₂, hsource₂T, hcenters⟩
  have hsource₁Cap : source₁.1 ∈ S.capByIndex S.oppIndex2 :=
    (Finset.mem_filter.mp hsource₁T).2
  have hsource₂Cap : source₂.1 ∈ S.capByIndex S.oppIndex2 :=
    (Finset.mem_filter.mp hsource₂T).2
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let U₁ := C \ K₁.support
  let U₂ := C \ K₂.support
  have hU₁Card : 3 ≤ U₁.card := by
    have hhit :=
      pentagonOffClass_actualRow_physicalClass_card_le_two_probe P source₁
    have hsplit :
        U₁.card + (C ∩ K₁.support).card = C.card := by
      simpa [U₁, Finset.inter_comm] using
        Finset.card_sdiff_add_card_inter C K₁.support
    have hCcard : C.card = 5 := by simpa [C] using P.hclassFive
    have hhit' : (C ∩ K₁.support).card ≤ 2 := by
      simpa [C, K₁, Hlate, Finset.inter_comm] using hhit
    omega
  have hU₂Card : 3 ≤ U₂.card := by
    have hhit :=
      pentagonOffClass_actualRow_physicalClass_card_le_two_probe P source₂
    have hsplit :
        U₂.card + (C ∩ K₂.support).card = C.card := by
      simpa [U₂, Finset.inter_comm] using
        Finset.card_sdiff_add_card_inter C K₂.support
    have hCcard : C.card = 5 := by simpa [C] using P.hclassFive
    have hhit' : (C ∩ K₂.support).card ≤ 2 := by
      simpa [C, K₂, Hlate, Finset.inter_comm] using hhit
    omega
  have hunionSubset : U₁ ∪ U₂ ⊆ C :=
    Finset.union_subset Finset.sdiff_subset Finset.sdiff_subset
  have hunionCard : (U₁ ∪ U₂).card ≤ 5 := by
    have := Finset.card_le_card hunionSubset
    have hCcard : C.card = 5 := by simpa [C] using P.hclassFive
    omega
  have hinterCard := Finset.card_union_add_card_inter U₁ U₂
  have hinterPos : 0 < (U₁ ∩ U₂).card := by omega
  obtain ⟨deleted, hdeleted⟩ := Finset.card_pos.mp hinterPos
  have hdeletedU₁ := (Finset.mem_inter.mp hdeleted).1
  have hdeletedU₂ := (Finset.mem_inter.mp hdeleted).2
  have hdeletedC : deleted ∈ C :=
    Finset.sdiff_subset hdeletedU₁
  have hcenter₁NeO : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate source₁.1 source₁.2
  have hcenter₂NeO : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate source₂.1 source₂.2
  have hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (Hlate.centerAt source₁.1 source₁.2) :=
    selectedFourClass_survives_erase_of_not_mem
      K₁.toSelectedFourClass (Finset.mem_sdiff.mp hdeletedU₁).2
  have hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (Hlate.centerAt source₂.1 source₂.2) :=
    selectedFourClass_survives_erase_of_not_mem
      K₂.toSelectedFourClass (Finset.mem_sdiff.mp hdeletedU₂).2
  have hsurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
    refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := deleted) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour
  exact ⟨deleted, hdeletedC, source₁, source₂,
    hsource₁Cap, hsource₂Cap, hcenters, hcenter₁NeO,
    hcenter₂NeO, hsurvives₁, hsurvives₂, hsurvivesO⟩

#print axioms pentagonOffClass_xv_u_bisector_eq_pair_probe
#print axioms pentagonOffClass_mem_xvRow_of_same_actualBlocker_probe
#print axioms pentagonOffClass_u_or_xv_deletion_survives_probe
#print axioms pentagonOffClass_xvRow_secondCap_eq_pair_probe
#print axioms pentagonOffClass_forced_secondCap_order_probe
#print axioms pentagonOffClass_blockerRow_survives_interior_q_or_w_probe
#print axioms exactFive_coradial_minimalDeletion_card_eq_two_probe
#print axioms rigid221_globalDeletion_card_eq_two_probe
#print axioms rigid221_globalDeletion_named_pair_probe
#print axioms pentagonOffClass_exists_offclass_commonOmission_probe
#print axioms pentagonOffClass_exists_two_offclass_commonDeletionPackets_probe
#print axioms pentagonOffClass_secondCap_commonDeletionFan_probe
#print axioms pentagonOffClass_secondCap_fan_actualBlocker_not_constant_probe
#print axioms pentagonOffClass_secondCap_fan_two_offCenter_blockers_probe
#print axioms pentagonOffClass_secondCap_crossedEndpointDeletion_split_probe
#print axioms pentagonOffClass_physicalClass_commonDeletionFan_probe
#print axioms pentagonOffClass_pairDeletion_survival_probe
#print axioms pentagonOffClass_exists_unusedSecondCapSource_probe
#print axioms pentagonOffClass_false_of_unusedSecondCapSource_twoPhysicalInteriorHits_probe
#print axioms pentagonOffClass_unusedSource_physicalInterior_commonDeletionFan_probe
#print axioms pentagonOffClass_actualRow_physicalClass_card_le_two_probe
#print axioms pentagonOffClass_reselectedRow_strictPhysicalTriple_card_le_one_probe
#print axioms pentagonOffClass_physicalClass_commonDeletionTriple_probe
#print axioms pentagonOffClass_exists_two_strictPhysical_commonDeletions_probe
#print axioms pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe
#print axioms pentagonOffClass_card_twelve_exact_cap_profile_probe
#print axioms pentagonOffClass_exact_physical_cycle_traces_probe
#print axioms pentagonOffClass_physical_cycle_actualBlockers_injective_probe
#print axioms pentagonOffClass_exists_physicalDeletion_threeDistinctCenters_probe
#print axioms exists_pair_distinct_actualBlockers_of_five_le_card
#print axioms actualBlockerFiber_card_le_four
#print axioms SurplusCapPacket.capByIndex_subset
#print axioms selectedFourClass_survives_erase_of_not_mem
#print axioms selectedClass_erase_card_ge_of_succ_le
#print axioms FullyDeletionRobustAt.centerAt_ne
#print axioms actualLateRow_secondClass_card_le_two
#print axioms SelectedFourClass.inter_card_le_two
#print axioms two_circle_common_point_eq_endpoint

end ATailFrontierLiveClosure
end Problem97
