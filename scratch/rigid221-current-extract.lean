        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let Iv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩ C
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv)) :
    Nonempty
      (ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  have hCsub : C ⊆ D.A := fun _ hx => (mem_selectedClass.mp hx).1
  have hCne : C.Nonempty :=
    Finset.card_pos.mp (by dsimp [C]; omega)
  have happApexMem : S.oppApex2 ∈ D.A :=
    jointDeletion.uPacket.center₂_mem_A
  have happApexNotC : S.oppApex2 ∉ C := by
    intro hx
    have hdist := (mem_selectedClass.mp hx).2
    rw [dist_self] at hdist
    linarith
  have hremaining : (D.A \ C).Nonempty :=
    ⟨S.oppApex2,
      Finset.mem_sdiff.mpr ⟨happApexMem, happApexNotC⟩⟩
  rcases
      ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion
        R.minimal hCsub hCne hremaining with
    ⟨center, hcenter, deleted, hdeleted, hsubset,
      hblocked, hrestores⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenter).1
  have hdeletedSubA : deleted ⊆ D.A := hsubset.trans hCsub
  have hgeometry :
      (∃ s ∈ deleted, ∃ t ∈ deleted,
        s ≠ t ∧ dist center s = dist center t) ∨
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A deleted center) := by
    by_cases hcollision :
        ∃ s ∈ deleted, ∃ t ∈ deleted,
          s ≠ t ∧ dist center s = dist center t
    · exact Or.inl hcollision
    · refine Or.inr
        (ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
          hdeletedSubA hcenterA ?_ hblocked hrestores)
      intro s hs t ht hst heq
      exact hcollision ⟨s, hs, t, ht, hst, heq⟩
  refine ⟨{
    rigid := hrigid
    center := center
    deleted := deleted
    center_mem_remaining := by simpa [C] using hcenter
    deleted_nonempty := hdeleted
    deleted_subset_class := by simpa [C] using hsubset
    deleted_card_le_five := ?_
    blocked := hblocked
    restores := hrestores
    geometry := hgeometry
  }⟩
  have hle : deleted.card ≤ C.card := Finset.card_le_card hsubset
  dsimp [C] at hle
  omega

/-- In the genuinely third-row arm `u ≠ source`, the two-point `u` block is
exactly `{source,u}`.  The source row meets that block only at `source`, and
the three actual blockers belonging to `source`, `u`, and `v` are pairwise
distinct. -/
theorem exactFourRigid221_context_u_ne_source_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Ks :=
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2
  have huPointNeSource : u.1 ≠ source.1 := by
    intro hpoint
    apply huNeSource
    exact Subtype.ext hpoint
  have huNotSourceRow : u.1 ∉ Ks := by
    rcases context.u_eq_source_or_not_mem_source_row with hEq | hNot
    · exact (huNeSource hEq).elim
    · simpa [Ks] using hNot
  have hIuCard : Iu.card = 2 := by
    simpa [C, Ku, Iu] using G.rigid.1
  have hsourceIu : source.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨by simpa [Ku] using context.source_mem_u_row,
        context.source_mem_class⟩
  have huIu : u.1 ∈ Iu :=
    Finset.mem_inter.mpr
      ⟨by
          simpa [Ku] using
            ((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.q_mem_support,
        huClass⟩
  have hpairSub : ({source.1, u.1} : Finset ℝ²) ⊆ Iu := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hsourceIu
    · exact huIu
  have hpairCard : ({source.1, u.1} : Finset ℝ²).card = 2 := by
    simpa [huPointNeSource] using
      (Finset.card_pair (Ne.symm huPointNeSource))
  have hIuEq : Iu = {source.1, u.1} := by
    symm
    exact Finset.eq_of_subset_of_card_le hpairSub
      (by rw [hIuCard, hpairCard])
  have hsourceKs : source.1 ∈ Ks := by
    simpa [Ks] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have hKsInter : Ks ∩ Iu = {source.1} := by
    rw [hIuEq]
    ext z
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton]
    constructor
    · rintro ⟨hzKs, hzSource | hzU⟩
      · exact hzSource
      · subst z
        exact (huNotSourceRow hzKs).elim
    · intro hz
      subst z
      exact ⟨hsourceKs, Or.inl rfl⟩
  have hsourceIJ : source.1 ∈ Iu ∩ J :=
    Finset.mem_inter.mpr
      ⟨hsourceIu, by simpa [J] using context.source_mem_interior⟩
  have hsourceBlockerNeU :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 u.2 hcenters
    apply huNotSourceRow
    simpa only [Ks, hsupports] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hsourceBlockerNeV :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 v.2 hcenters
    apply context.v_not_mem_source_row
    simpa only [hsupports] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  exact
    ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
      hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
      hblockersUVNe⟩

/-- The retained source context gives an auditable two-arm coordinator:
either the distinguished `u`-row is the source row, or the genuinely
third-row arm has the source-sensitive normal form above. -/
theorem exactFourRigid221_context_sourceOrThirdRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion) :
    u = source ∨
      (let C := SelectedClass D.A S.oppApex2 rho
       let Ks :=
         ((lateFirstApexSystem R).selectedAt
           source.1 source.2).toCriticalFourShell.support
       let Ku :=
         ((lateFirstApexSystem R).selectedAt
           u.1 u.2).toCriticalFourShell.support
       let Iu := Ku ∩ C
       let J := S.capInteriorByIndex S.oppIndex2
       u.1 ≠ source.1 ∧
         u.1 ∉ Ks ∧
         Iu = {source.1, u.1} ∧
         Ks ∩ Iu = {source.1} ∧
         source.1 ∈ Iu ∩ J ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt u.1 u.2 ∧
         (lateFirstApexSystem R).centerAt source.1 source.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2 ∧
         (lateFirstApexSystem R).centerAt u.1 u.2 ≠
           (lateFirstApexSystem R).centerAt v.1 v.2) := by
  classical
  by_cases huEq : u = source
  · exact Or.inl huEq
  · exact Or.inr
      (exactFourRigid221_context_u_ne_source_normalForm
        huClass context hblockersUVNe G huEq)

/-- In the third-row arm, the retained omitted peer has only three possible
placements in the rigid five-class: it is `u`, it belongs to the disjoint
`v`-block, or it is the singleton point outside the two blocks. -/
theorem exactFourRigid221_context_u_ne_source_otherPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (huNeSource : u ≠ source) :
    let C := SelectedClass D.A S.oppApex2 rho
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iv := Kv ∩ C
    other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  change other = u ∨ other.1 ∈ Iv ∨ other = jointDeletion.deleted
  have hnormal :=
    exactFourRigid221_context_u_ne_source_normalForm
      huClass context hblockersUVNe G huNeSource
  change
    u.1 ≠ source.1 ∧
      u.1 ∉ Ks ∧
      Iu = {source.1, u.1} ∧
      Ks ∩ Iu = {source.1} ∧
      source.1 ∈ Iu ∩ J ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 at hnormal
  have hIuEq : Iu = {source.1, u.1} := hnormal.2.2.1
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    have hrigid := G.rigid
    simpa [C, Ku, Kv, Iu, Iv] using hrigid.2.2.2
  have hotherC : other.1 ∈ C := by
    simpa [C] using context.other_mem_class
  rw [hcover] at hotherC
  simp only [Finset.mem_insert, Finset.mem_union] at hotherC
  rcases hotherC with hdeleted | hIu | hIv
  · exact Or.inr (Or.inr (Subtype.ext hdeleted))
  · rw [hIuEq] at hIu
    simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
    rcases hIu with hsource | hu
    · have hotherEqSource : other = source := Subtype.ext hsource
      exact (context.other_ne_source hotherEqSource).elim
    · exact Or.inl (Subtype.ext hu)
  · exact Or.inr (Or.inl hIv)

/-- If the contextual source's actual blocker lies outside the physical
five-class, deleting just that source gives an explicit singleton global
minimal core.  This is the checked outside-class arm of the physical-apex
split; no first-apex exact-five theorem is used. -/
theorem exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (rigidWitness :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenterOutside :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∉
        SelectedClass D.A S.oppApex2 rho) :
    let c := (lateFirstApexSystem R).centerAt source.1 source.2
    ∃ globalDeletion :
        ExactFourMutualOmissionRigid221GlobalDeletion
          R rho u v jointDeletion,
      globalDeletion.center = c ∧
        globalDeletion.deleted = {source.1} ∧
        globalDeletion.center ≠ S.oppApex2 ∧
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A globalDeletion.deleted globalDeletion.center) := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt source.1 source.2
  let U : Finset ℝ² := {source.1}
  have hcA : c ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        (Hlate.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have hcOutside :
      c ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [c, Hlate] using hcenterOutside
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ U) c := by
    simpa [U, c, Hlate, Finset.sdiff_singleton_eq_erase] using
      Hlate.no_qfree_at source.1 source.2
  have hrestores :
      ∀ s ∈ U,
        HasNEquidistantPointsAt 4 (D.A \ U.erase s) c := by
    intro s hs
    have hsEq : s = source.1 := by
      simpa [U] using hs
    subst s
    simpa [U] using D.K4 c hcA
  let core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c :=
    { shellAt := fun s => by
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        simpa [c, Hlate, hsEq] using
          Hlate.selectedAt source.1 source.2
      supports_pairwise_disjoint := by
        intro s t hst
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        have htEq : t.1 = source.1 := by
          have htMem := t.2
          change t.1 ∈ ({source.1} : Finset ℝ²) at htMem
          exact Finset.mem_singleton.mp htMem
        exact False.elim
          (hst (Subtype.ext (hsEq.trans htEq.symm))) }
  let globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion :=
    { rigid := rigidWitness.rigid
      center := c
      deleted := U
      center_mem_remaining :=
        Finset.mem_sdiff.mpr ⟨hcA, hcOutside⟩
      deleted_nonempty := by simp [U]
      deleted_subset_class := by
        simpa [U] using context.source_mem_class
      deleted_card_le_five := by simp [U]
      blocked := hblocked
      restores := hrestores
      geometry := Or.inr ⟨core⟩ }
  have hcenterNe : c ≠ S.oppApex2 := by
    simpa [c, Hlate] using
      surface.secondApex_robust.centerAt_ne
        Hlate source.1 source.2
  have hcore :
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A globalDeletion.deleted globalDeletion.center) := by
    simpa [globalDeletion] using
      (show Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c)
        from ⟨core⟩)
  exact ⟨globalDeletion, rfl, rfl, hcenterNe, hcore⟩

/-- Pairwise-distinct-radius minimal-core leaf of the contextual rigid
`2+2+1` terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_minimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (_core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A globalDeletion.deleted globalDeletion.center) :
    False := by
  sorry

/-- Once the contextual source's actual blocker is in the physical
five-class, the rigid `2+2+1` cover and the source row leave only two finite
placement arms.  If `u` is the source, its blocker is the distinguished
deletion or lies in the disjoint `v` block.  In the genuine third-row arm it
may additionally be `u` itself. -/
theorem exactFourRigid221_sourceBlockerInClass_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other u v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v}
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (G :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    (u = source ∧
      ((lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) ∨
    (u ≠ source ∧
      ((lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  have hblockerNotSourceRow : blocker ∉ Ks := by
    simpa [blocker, Ks] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.center_not_mem_support
  have hcover :
      C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Ku, Kv, Iu, Iv] using G.rigid.2.2.2
  have hlocation :
      blocker = jointDeletion.deleted.1 ∨
        blocker ∈ Iu ∨ blocker ∈ Iv := by
    have hblockerC : blocker ∈ C := by
      simpa [blocker, C] using hsourceBlockerClass
    rw [hcover] at hblockerC
    simpa only [Finset.mem_insert, Finset.mem_union] using hblockerC
  by_cases huSource : u = source
  · subst u
    left
    refine ⟨rfl, ?_⟩
    rcases hlocation with hdeleted | hIu | hIv
    · exact Or.inl hdeleted
    · have hblockerKu : blocker ∈ Ku :=
        (Finset.mem_inter.mp hIu).1
      have hblockerKs : blocker ∈ Ks := by
        simpa [Ks, Ku] using hblockerKu
      exact (hblockerNotSourceRow hblockerKs).elim
    · exact Or.inr (by simpa [blocker, Iv, Kv, C] using hIv)
  · right
    refine ⟨huSource, ?_⟩
    rcases hlocation with hdeleted | hIu | hIv
    · exact Or.inl hdeleted
    · have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          huClass context jointDeletion.blockers_ne G huSource
      change
        u.1 ≠ source.1 ∧
          u.1 ∉ Ks ∧
          Iu = {source.1, u.1} ∧
          Ks ∩ Iu = {source.1} ∧
          source.1 ∈
            Iu ∩ S.capInteriorByIndex S.oppIndex2 ∧
          blocker ≠
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          blocker ≠
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          (lateFirstApexSystem R).centerAt u.1 u.2 ≠
            (lateFirstApexSystem R).centerAt v.1 v.2
          at hnormal
      rw [hnormal.2.2.1] at hIu
      simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
      rcases hIu with hsource | hu
      · have hsourceKs : source.1 ∈ Ks := by
          simpa [Ks] using
            ((lateFirstApexSystem R).selectedAt
              source.1 source.2).toCriticalFourShell.q_mem_support
        exact
          (hblockerNotSourceRow
            (hsource.symm ▸ hsourceKs)).elim
      · exact Or.inr (Or.inl hu)
    · exact Or.inr (Or.inr
        (by simpa [blocker, Iv, Kv, C] using hIv))

/-- Full contextual packet for the physical-apex branch in which `u` is the
retained source and the actual source blocker lies in the rigid physical
five-class.  Packaging the common hypotheses keeps the three exact blocker
leaves below readable without discarding any parent data. -/
structure ExactFourRigid221PhysicalApexSourceEqUContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    Type where
  hcard : 12 ≤ D.A.card
  surface : ExactFourPostCardElevenRobustSurface R
  rho : ℝ
  source : CarrierVertex D.A
  other : CarrierVertex D.A
  hrho : 0 < rho
  hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card
  u : CarrierVertex D.A
  v : CarrierVertex D.A
  huNeV : u ≠ v
  huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  huOmitted :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
  context :
    ExactFourMutualOmissionSourceContext
      R rho source other u v
  jointDeletion :
    ExactFourMutualOmissionJointDeletion R rho u v
  hclassFive :
    (SelectedClass D.A S.oppApex2 rho).card = 5
  globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion
  hcenter : globalDeletion.center = S.oppApex2
  hsourceBlockerClass :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
      SelectedClass D.A S.oppApex2 rho
  huSource : u = source

/-- Exact source-equals-`u` leaf where the actual source blocker is the
distinguished point omitted from both rigid rows. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
        P.jointDeletion.deleted.1) :
    False := by
  sorry

/-- Number of points of the rigid source row that lie in the strict interior
of the physical second cap.  The rigid `2+2+1` packet bounds this count by
two; equality is the source-row-heavy cap shape. -/
noncomputable def
    ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : ℕ :=
  ((((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho) ∩
    S.capInteriorByIndex S.oppIndex2).card

/-- Number of points of the rigid opposite row that lie in the strict
interior of the physical second cap.  Equality with two is the
opposite-row-heavy cap shape. -/
noncomputable def
    ExactFourRigid221PhysicalApexSourceEqUContext.oppositeRowInteriorCount
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : ℕ :=
    ((((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho) ∩
    S.capInteriorByIndex S.oppIndex2).card

/-- In the source-row-heavy blocker-`v` branch, the blocker itself is forced
into the strict physical second-cap interior.  The rigid packet supplies the
second source-row point in the physical radius class; heaviness puts both
