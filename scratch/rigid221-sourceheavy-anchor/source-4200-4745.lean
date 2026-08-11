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
    apply false_of_orderedCap_three_equidistant_betweenness_cycle
      Packet Hside Hord hiy_iu hiv_iy hiv_iu hiz_iv hiz_iy hiu_iz
    · simpa only [hiy, hiu, hiv] using hD
    · simpa only [hiy, hiv, hiz] using hC
    · simpa only [hiu, hiz, hiv] using hA
  · have hB : dist packet.xu P.jointDeletion.deleted.1 =
        dist packet.xu P.v.1 := by simpa only [Hlate, hcenterXu] using hX
    apply false_of_orderedCap_four_equidistant_betweenness_cycle
      Packet Hside Hord hiu_ix hiy_iu hiy_ix hiv_iy hiv_iu
      hiz_iv hiz_iy hix_iz hix_iv
    · simpa only [hiu, hix, hiy] using hE
    · simpa only [hiu, hiv, hiy] using hD
    · simpa only [hiv, hiy, hiz] using hC
    · simpa only [hix, hiv, hiz] using hB
  · exact
      (centerAt_ne_source Hlate _ _
        (by simpa only [Hlate] using hcenterDeleted)).elim
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

/-- The seven source-named points forced into the second strict cap by the
off-class `BlockerV` residual. -/
noncomputable def blockerVSecondCapNamedSeven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet) : Finset ℝ² :=
  insert
    ((lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (insert
      ((lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2)
      (SelectedClass D.A S.oppApex2 P.rho))

/-- The off-class `BlockerV` packet supplies seven distinct named points in
the strict interior of the second opposite cap. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    blockerVSecondCapNamedSeven Q ⊆
        S.capInteriorByIndex S.oppIndex2 ∧
      (blockerVSecondCapNamedSeven Q).card = 7 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
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
  have hvInterior : P.v.1 ∈ I := by
    simpa only [I, ← Q.hblockerEqV] using Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp (show
        packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho by
          simpa only [C] using hxvClass)).2.symm
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      (by simpa only [I] using hvInterior)
      Q.hxvInterior packet.xv_ne_v.symm hCraw hphysicalVXv
    simpa only [I, Hlate, hcenterV] using h
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset _) ⊆ I := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset _) ∩ I := by
      simpa only [I, packet.source_pair_interior] using hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ I := hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ I := hpairSubset (by simp)
  have hE :
      dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD :
      dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    simpa only [Hlate, hcenterV] using hCraw
  have hB :
      dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hphysicalXuDeleted :
      dist S.oppApex2 packet.xu =
        dist S.oppApex2 P.jointDeletion.deleted.1 :=
    (mem_selectedClass.mp (show
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho by
        simpa only [C] using hxuClass)).2.trans
      (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2.symm
  have heInterior : e ∈ I := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kxu.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate packet.xu Q.hxuA)
      (by simpa only [I] using hxuInterior)
      (by simpa only [I] using hdeletedInterior)
      hdelNeXu.symm hB hphysicalXuDeleted
    simpa only [e, I] using h
  have hclassSubset : C ⊆ I := by
    intro z hz
    have hz' :
        z = P.u.1 ∨ z = packet.xu ∨
          z = P.jointDeletion.deleted.1 ∨
          z = P.v.1 ∨ z = packet.xv :=
      Q.hclassFive z (by simpa only [C] using hz)
    rcases hz' with h | h | h | h | h
    · simpa only [h] using huInterior
    · simpa only [h] using hxuInterior
    · simpa only [h] using hdeletedInterior
    · simpa only [h] using hvInterior
    · simpa only [I, h] using Q.hxvInterior
  have hcInterior : c ∈ I := by
    simpa only [c, I, Hlate] using hcenterDeletedInterior
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have heOff : e ∉ C := by
    intro heClass
    rcases Q.hclassFive _ (by simpa only [C] using heClass) with
        heU | heXu | heDeleted | heV | heXv
    · have hA :
          dist P.u.1 packet.xu =
            dist P.u.1 P.jointDeletion.deleted.1 := by
        simpa only [heU] using hB
      exact false_of_capInterior_four_equidistant_hook_cycle
        (by simpa only [I] using huInterior)
        (by simpa only [I] using hxuInterior)
        (by simpa only [I] using hvInterior)
        (by simpa only [I] using Q.hxvInterior)
        (by simpa only [I] using hdeletedInterior)
        huNeXu huNeXv.symm hxuNeXv.symm hvNeXv huNeV.symm
        hdelNeV hdelNeXv hdelNeU.symm hdelNeXu.symm hE hD hC hA
    · exact (centerAt_ne_source Hlate packet.xu Q.hxuA
        (by simpa only [e] using heXu)).elim
    · apply Kxu.center_not_mem_support
      simpa only [Kxu, e, heDeleted] using Q.hdeletedXuRow
    · have hcenters :
          Hlate.centerAt packet.xv Q.hxvA =
            Hlate.centerAt packet.xu Q.hxuA := by
        calc
          _ = P.v.1 := Q.hblockerEqV
          _ = e := heV.symm
          _ = _ := by rfl
      have hsupports : Kxv.support = Kxu.support := by
        simpa only [Kxv, Kxu] using
          selectedSupports_eq_of_actualBlockers_eq
            Hlate Q.hxvA Q.hxuA hcenters
      apply Q.huNotXuRow
      rw [← hsupports]
      exact Q.huXvRow
    · have hcenters :
          Hlate.centerAt P.u.1 P.u.2 =
            Hlate.centerAt packet.xu Q.hxuA := by
        calc
          _ = packet.xv := hcenterU
          _ = e := heXv.symm
          _ = _ := by rfl
      have hsupports : Ku.support = Kxu.support := by
        simpa only [Ku, Kxu] using
          selectedSupports_eq_of_actualBlockers_eq
            Hlate P.u.2 Q.hxuA hcenters
      apply Q.huNotXuRow
      rw [← hsupports]
      exact Ku.q_mem_support
  have heNeC : e ≠ c := by
    intro hec
    have hcXuDeleted :
        dist c packet.xu =
          dist c P.jointDeletion.deleted.1 := by
      simpa only [hec] using hB
    have hcDeletedV :
        dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
      simpa only [c, Kdel] using
        (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
          (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
    have hcNeXu : c ≠ packet.xu := by
      intro h
      apply hcOff
      simpa only [h] using hxuClass
    have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
      simpa only [c, Hlate] using
        centerAt_ne_source Hlate P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2
    have hcNeV : c ≠ P.v.1 := by
      intro h
      apply hcOff
      simpa only [h] using P.hvClass
    exact false_of_capInterior_center_equidistant_three_points
      (by simpa only [I] using hcInterior)
      (by simpa only [I] using hxuInterior)
      (by simpa only [I] using hdeletedInterior)
      (by simpa only [I] using hvInterior)
      hdelNeXu.symm hxuNeV hdelNeV hcNeXu hcNeDeleted hcNeV
      hcXuDeleted (hcXuDeleted.trans hcDeletedV)
  have hinsertSubset : insert e (insert c C) ⊆ I := by
    intro z hz
    rcases Finset.mem_insert.mp hz with h | hz
    · simpa only [h] using heInterior
    · rcases Finset.mem_insert.mp hz with h | hz
      · simpa only [h] using hcInterior
      · exact hclassSubset hz
  have heNotInsert : e ∉ insert c C := by
    intro h
    rcases Finset.mem_insert.mp h with h | h
    · exact heNeC h
    · exact heOff h
  have hcardInsert : (insert e (insert c C)).card = 7 := by
    rw [Finset.card_insert_of_notMem heNotInsert]
    rw [Finset.card_insert_of_notMem hcOff]
    simpa only [C, P.hclassFive]
  simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using
    And.intro hinsertSubset hcardInsert

/-- The seven-point strict-cap packet forces the ambient carrier to have at
least fifteen points. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    15 ≤ D.A.card := by
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
    have hle := Finset.card_le_card hnamed.1
    omega
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
  have hsecond : 9 ≤ S.oppCap2.card := by omega
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  omega

/-- At cardinality fifteen the off-class `BlockerV` residual has the exact cap
profile `(5,4,9)`, and its seven named points exhaust the second strict cap. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_exact_fifteen_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 15) :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧
      S.oppCap2.card = 9 ∧
      blockerVSecondCapNamedSeven Q =
        S.capInteriorByIndex S.oppIndex2 := by
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  have hsecond : 9 ≤ S.oppCap2.card := by
    have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
      have hle := Finset.card_le_card hnamed.1
      omega
    omega
  have hprofile :
      S.surplusCap.card = 5 ∧
        S.oppCap1.card = 4 ∧ S.oppCap2.card = 9 := by
    omega
  refine ⟨hprofile.1, hprofile.2.1, hprofile.2.2, ?_⟩
  apply Finset.eq_of_subset_of_card_le hnamed.1
  have hIcardEq : (S.capInteriorByIndex S.oppIndex2).card = 7 := by
    omega
  omega

/-- Banked small-cardinality consequence of the off-class `BlockerV`
residual: no such packet exists on a carrier of cardinality at most fourteen. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_le_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card ≤ 14) :
    False := by
  have hge :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_fifteen
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  omega

private theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_nextRow_physical_hits_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    let Hlate := lateFirstApexSystem R
