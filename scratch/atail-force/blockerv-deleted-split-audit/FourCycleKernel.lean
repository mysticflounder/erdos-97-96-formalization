import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

namespace Problem97.ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailTwoCenterCapLocalization
open ATailLargeOppositeCapsBiApexSurface
open ATailLargeCapUniqueFive
open ATailUniqueFourLateChoiceTerminalScratch
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover

/-- Scratch-only validation of the four-edge ordered-cap consumer needed by
the `deletedRowBlocker = xu` arm of the proposed split. -/
theorem scratch_false_of_orderedCap_four_equidistant_betweenness_cycle
    {A : Finset (EuclideanSpace ℝ (Fin 2))} {m : ℕ}
    {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {iu ix iy iv iz : Fin m}
    (hiu_ix : iu ≠ ix)
    (hiy_iu : iy ≠ iu) (hiy_ix : iy ≠ ix)
    (hiv_iy : iv ≠ iy) (hiv_iu : iv ≠ iu)
    (hiz_iv : iz ≠ iv) (hiz_iy : iz ≠ iy)
    (hix_iz : ix ≠ iz) (hix_iv : ix ≠ iv)
    (hY : dist (L.points iy) (L.points iu) =
      dist (L.points iy) (L.points ix))
    (hV : dist (L.points iv) (L.points iy) =
      dist (L.points iv) (L.points iu))
    (hZ : dist (L.points iz) (L.points iv) =
      dist (L.points iz) (L.points iy))
    (hX : dist (L.points ix) (L.points iz) =
      dist (L.points ix) (L.points iv)) :
    False := by
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hYbetween := between_of_equidistant hiu_ix hiy_iu hiy_ix hY
  have hVbetween := between_of_equidistant hiy_iu hiv_iy hiv_iu hV
  have hZbetween := between_of_equidistant hiv_iy hiz_iv hiz_iy hZ
  have hXbetween := between_of_equidistant hiz_iv hix_iz hix_iv hX
  rcases hYbetween with hYbetween | hYbetween <;>
    rcases hVbetween with hVbetween | hVbetween <;>
    rcases hZbetween with hZbetween | hZbetween <;>
    rcases hXbetween with hXbetween | hXbetween <;> omega

theorem scratch_false_of_orderedCap_three_equidistant_betweenness_cycle
    {A : Finset (EuclideanSpace ℝ (Fin 2))} {m : ℕ}
    {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {iu ix iy iv : Fin m}
    (hiu_ix : iu ≠ ix)
    (hiy_iu : iy ≠ iu) (hiy_ix : iy ≠ ix)
    (hiv_iy : iv ≠ iy) (hiv_iu : iv ≠ iu)
    (hix_iv : ix ≠ iv)
    (hY : dist (L.points iy) (L.points iu) =
      dist (L.points iy) (L.points ix))
    (hV : dist (L.points iv) (L.points iy) =
      dist (L.points iv) (L.points iu))
    (hX : dist (L.points ix) (L.points iv) =
      dist (L.points ix) (L.points iy)) : False := by
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hYbetween := between_of_equidistant hiu_ix hiy_iu hiy_ix hY
  have hVbetween := between_of_equidistant hiy_iu hiv_iy hiv_iu hV
  have hXbetween := between_of_equidistant hiv_iy hix_iv hiy_ix.symm hX
  rcases hYbetween with hYbetween | hYbetween <;>
    rcases hVbetween with hVbetween | hVbetween <;>
    rcases hXbetween with hXbetween | hXbetween <;> omega

/-- Scratch proof that every on-class blocker of the deleted-point row is
impossible in the live `BlockerV / vRowBlockerDeleted` residual. -/
theorem scratch_false_of_blockerV_vRowBlockerDeleted_deletedRowBlockerClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        SelectedClass D.A S.oppApex2 P.rho) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  have hxuInter :
      packet.xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hdelNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    apply Q.huNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset _) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset _) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← Q.hblockerEqV]
    exact Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    simpa only [Hlate, hcenterV] using hCraw
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hdeletedInterior :
      P.jointDeletion.deleted.1 ∈
        S.capInteriorByIndex S.oppIndex2 := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      hvInterior Q.hxvInterior hvNeXv hCraw hphysicalVXv
    simpa only [Hlate, hcenterV] using h
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact
      (Ku.support_eq_radius _ Ku.q_mem_support).trans
        (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact
      (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
        (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hX :
      dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.jointDeletion.deleted.1 =
        dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.v.1 :=
    (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
      (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hphysicalDeletedV :
      dist S.oppApex2 P.jointDeletion.deleted.1 =
        dist S.oppApex2 P.v.1 :=
    (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2.trans
      (mem_selectedClass.mp P.hvClass).2.symm
  have _hcenterDeletedInterior :
      Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kdel.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate
        P.jointDeletion.deleted.1 P.jointDeletion.deleted.2)
      hdeletedInterior hvInterior hdelNeV hX hphysicalDeletedV
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  have hdelImage :
      P.jointDeletion.deleted.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hdeletedInterior
  have hvImage : P.v.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hvInterior
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ix, _hixMem, hix⟩
  rcases Finset.mem_image.mp hdelImage with ⟨iz, _hizMem, hiz⟩
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hivMem, hiv⟩
  rcases Finset.mem_image.mp hxvImage with ⟨iy, _hiyMem, hiy⟩
  have hiu_ix : iu ≠ ix := by
    intro h; apply huNeXu; rw [← hiu, ← hix, h]
  have hiy_iu : iy ≠ iu := by
    intro h; apply huNeXv; rw [← hiu, ← hiy, h]
  have hiy_ix : iy ≠ ix := by
    intro h; apply hxuNeXv; rw [← hix, ← hiy, h]
  have hiv_iy : iv ≠ iy := by
    intro h; apply hvNeXv; rw [← hiv, ← hiy, h]
  have hiv_iu : iv ≠ iu := by
    intro h; apply huNeV; rw [← hiu, ← hiv, h]
  have hiz_iv : iz ≠ iv := by
    intro h; apply hdelNeV; rw [← hiz, ← hiv, h]
  have hiz_iy : iz ≠ iy := by
    intro h; apply hdelNeXv; rw [← hiz, ← hiy, h]
  have hix_iz : ix ≠ iz := by
    intro h; apply hdelNeXu; rw [← hiz, ← hix, h]
  have hix_iv : ix ≠ iv := by
    intro h; apply hxuNeV; rw [← hix, ← hiv, h]
  have hiu_iz : iu ≠ iz := by
    intro h; apply hdelNeU; rw [← hiz, ← hiu, h]
  rcases Q.hclassFive _ hcenterDeletedClass with
      hcenterU' | hcenterXu | hcenterDeleted | hcenterV' | hcenterXv
  · have hA : dist P.u.1 P.jointDeletion.deleted.1 =
        dist P.u.1 P.v.1 := by simpa only [Hlate, hcenterU'] using hX
    apply scratch_false_of_orderedCap_three_equidistant_betweenness_cycle
      Packet Hside Hord hiy_iu hiv_iy hiv_iu hiz_iv hiz_iy hiu_iz
    · simpa only [hiy, hiu, hiv] using hD
    · simpa only [hiy, hiv, hiz] using hC
    · simpa only [hiu, hiz, hiv] using hA
  · have hB : dist packet.xu P.jointDeletion.deleted.1 =
        dist packet.xu P.v.1 := by simpa only [Hlate, hcenterXu] using hX
    apply scratch_false_of_orderedCap_four_equidistant_betweenness_cycle
      Packet Hside Hord hiu_ix hiy_iu hiy_ix hiv_iy hiv_iu
      hiz_iv hiz_iy hix_iz hix_iv
    · simpa only [hiu, hix, hiy] using hE
    · simpa only [hiu, hiv, hiy] using hD
    · simpa only [hiv, hiy, hiz] using hC
    · simpa only [hix, hiv, hiz] using hB
  · exact (centerAt_ne_source Hlate _ _ (by simpa only [Hlate] using hcenterDeleted)).elim
  · apply Kdel.center_not_mem_support
    simpa only [Kdel, Hlate, hcenterV'] using Q.hvDeletedRow
  · have hE' : dist packet.xv P.jointDeletion.deleted.1 =
        dist packet.xv P.v.1 := by simpa only [Hlate, hcenterXv] using hX
    have hCbetween :
        (iv < iz ∧ iz < iy) ∨ (iy < iz ∧ iz < iv) := by
      rcases lt_or_gt_of_ne hiv_iy with h | h
      · exact Or.inl (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iv hiz_iy (by
            simpa only [hiv, hiy, hiz] using hC))
      · exact Or.inr (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iy hiz_iv (by
            simpa only [hiv, hiy, hiz] using hC.symm))
    have hEbetween :
        (iz < iy ∧ iy < iv) ∨ (iv < iy ∧ iy < iz) := by
      rcases lt_or_gt_of_ne hiz_iv with h | h
      · exact Or.inl (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iy.symm hiv_iy.symm (by
            simpa only [hiv, hiy, hiz] using hE'))
      · exact Or.inr (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiv_iy.symm hiz_iy.symm (by
            simpa only [hiv, hiy, hiz] using hE'.symm))
    rcases hCbetween with hCbetween | hCbetween <;>
      rcases hEbetween with hEbetween | hEbetween <;> omega

end Problem97.ATailFrontierLiveClosure

#print axioms Problem97.ATailFrontierLiveClosure.scratch_false_of_orderedCap_four_equidistant_betweenness_cycle
#print axioms Problem97.ATailFrontierLiveClosure.scratch_false_of_blockerV_vRowBlockerDeleted_deletedRowBlockerClass
