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
points in the strict cap, and the two-center localization theorem then puts
their second bisector center `v` there as well. -/
theorem blockerV_sourceRowHeavy_v_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
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
  have hsourceSupport : P.source.1 ∈ K.support :=
    (Finset.mem_inter.mp hsourceI).1
  obtain ⟨x, y, hxy, hIEq⟩ := Finset.card_eq_two.mp hICard
  have hsourceCases : P.source.1 = x ∨ P.source.1 = y := by
    rw [hIEq] at hsourceI
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hsourceI
  rcases hsourceCases with hsourceEq | hsourceEq
  · let partner := y
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm
  · let partner := x
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy.symm
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm

/-- Source-row-heavy blocker-`v` arm.  This is a strict child of the former
monolithic blocker-`v` obligation: the source row contributes both members of
its rigid two-point physical block to the strict second cap, and the checked
normalization above places `v` in that cap as well. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (_hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (_hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    False := by
  sorry

/-- Generic opposite-row-heavy arm when the actual source blocker lies in the
rigid `v` row.  Both the blocker-`v` and blocker-other coordinators produce the
same membership hypothesis, so the blocker identity is not part of the stable
terminal interface.

Coordinator-interface frontier: before this consolidation the two
blocker-identity coordinators each had a separate opposite-row-heavy child.
After it they share this one stronger child, with the row membership derived
by the equality coordinator and carried directly by the inequality
coordinator. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceRowNotHeavy : P.sourceRowInteriorCount ≠ 2)
    (_hoppositeRowHeavy : P.oppositeRowInteriorCount = 2) :
    False := by
  sorry

/-- Generic sparse-row arm when the actual source blocker lies in the rigid
`v` row, after excluding both row-heavy cap shapes.  The rigid five-point
physical-class cover and the three-interior-point bound further normalize
this branch to the exceptional `1+1+1` pattern.

Together with the generic opposite-row-heavy arm above, this replaces four
blocker-identity-specific terminals by two membership-based terminals.  The
source-row-heavy terminals remain separate because the non-`v` branch has an
additional exact-five/growth decomposition. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceRowNotHeavy : P.sourceRowInteriorCount ≠ 2)
    (_hoppositeRowNotHeavy : P.oppositeRowInteriorCount ≠ 2) :
    False := by
  sorry

/-- Exact source-equals-`u` leaf where the actual source blocker is `v`
itself.  The two row-interior counts give an exhaustive, checked three-way
cap-shape split into the strictly narrower terminals above. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    False := by
  have hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [hblocker]
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.q_mem_support,
