import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-! Direct reindexing proof for the remaining first-growth row trace. -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable
set_option maxHeartbeats 800000

/-- Reindex the rigid `2+2+1` packet along the new `u`/`xv` mutual-omission
pair.  In the remaining incidence branch the `xv` row has physical trace
exactly `{xv, deleted}`, so the old `v` is the new unique joint deletion.
The global deletion witness is unchanged, while the source blocker is now
literally the new opposite source. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_deletedXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hdeletedClass : P.jointDeletion.deleted.1 ∈ C := by
    simpa [C] using P.jointDeletion.deleted_mem_class
  have hdeletedNeXv :
      P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    rw [h]
    exact (Finset.mem_inter.mp hxvInter).1
  have hpairSub :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hdeletedXvRow, hdeletedClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
    simp [hdeletedNeXv.symm]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.jointDeletion.deleted.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hvNotXvRow :
      P.v.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hv
    have hvC : P.v.1 ∈ C := by simpa [C] using P.hvClass
    have hvPair : P.v.1 ∈
        ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hv, hvC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvPair
    rcases hvPair with hvxv | hvd
    · exact packet.xv_ne_v hvxv.symm
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext (by simpa using hvd.symm))
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.v P.hvClass P.hvOmitted
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have huNeDeleted :
      P.u.1 ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_ne_u
    exact Subtype.ext h.symm
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeDeleted :
      packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.jointDeletion.deleted.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [Ne.symm hdeletedNeXv]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact huNeDeleted h
      · exact hxuNeXv h
      · exact hxuNeDeleted h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        simpa only [_W.other_point_eq_xv] using
          P.context.other_not_mem_source_row
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

/-- Reindex the rigid `2+2+1` packet when the `xv` row contains the old
opposite source `v`.  The physical trace is then exactly `{xv, v}`, the old
joint deletion remains the unique deleted point, and `xv` becomes the new
opposite source.  Thus the source blocker is literally the new opposite
source, which is the earlier blocker-`v` terminal. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission_vXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hvClass : P.v.1 ∈ C := by
    simpa [C] using P.hvClass
  have hvNeXv : P.v.1 ≠ packet.xv :=
    packet.xv_ne_v.symm
  have hpairSub :
      ({packet.xv, P.v.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hvXvRow, hvClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.v.1} : Finset ℝ²).card = 2 := by
    simp [packet.xv_ne_v]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.v.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hd
    have hdC : P.jointDeletion.deleted.1 ∈ C := by
      simpa [C] using P.jointDeletion.deleted_mem_class
    have hdPair :
        P.jointDeletion.deleted.1 ∈
          ({packet.xv, P.v.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hd, hdC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdPair
    rcases hdPair with hdxv | hdv
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact (Finset.mem_inter.mp hxvInter).1
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext hdv)
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class
          P.jointDeletion.deleted_not_mem_uRow
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.v.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [packet.xv_ne_v]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact P.huNeV (Subtype.ext h)
      · exact hxuNeXv h
      · exact hxuNeV h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        simpa only [_W.other_point_eq_xv] using
          P.context.other_not_mem_source_row
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

end ATailFrontierLiveClosure
end Problem97
