    B = (H.selectedAt source hsource).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell source hsource
    (qDeletedK4ClassToSelectedFourClass K hcard)

namespace TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP

/-- Global exclusion still required for the four cross-blocker equalities.

The equalities themselves point away from the requested cross hits, so this
leaf must use the retained minimality, no-M44, tri-apex, and two-cycle data.
Its immediate constructor fan-out is four equality arms. -/
theorem false_of_crossBlockerCoincidence
    (hcoincidence : CrossBlockerCoincidence P Pρ) :
    False := by
  sorry

/-- Positive cap-eight alignment required for a fresh third blocker fiber.

The cap source row and fresh fiber currently have no positive incidence,
center, or rich-slice relation.  This leaf is strictly narrower than the
parent because both checked producer packets are explicit hypotheses. -/
theorem false_of_capSource_freshThirdBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  sorry

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The first collision row is exactly its two strict-cap sources together
with the two named off-cap points carried by the enlarged first blocker
fiber. -/
theorem firstFiber_shell_eq_explicitFour
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
  exact
    ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour P Pρ Q

/-- Source-exact witness carried by the cap-eight third-row surface, with the
existential source exposed so that the first-fiber descent can retain it. -/
abbrev FirstFiberCapSourceWitness
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  8 ≤ (S.capByIndex S.oppIndex1).card ∧
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    source.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support.card = 4 ∧
    CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
    CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The cap-eight margin produces two distinct strict-cap sources carrying the
complete first-fiber source witness.  This is the checked strengthening used
by the live first-fiber terminal. -/
private theorem exists_two_firstFiberCapSourceWitness
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain ⟨source, source', hsourcesNe, hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      hpairsDisjoint hcap
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  rcases hsource' with
    ⟨hsourceInterior', hsourceOutside',
      hcenterNeFirstBlocker', hcenterNeSecondBlocker',
      hcenterNeFirstApex', hcenterNeSecondApex',
      hfirstView', hsecondView'⟩
  refine ⟨source, source', hsourcesNe, ?_, ?_⟩
  · exact
      ⟨hcap, hsourceInterior, hsourceOutside,
        hcenterNeFirstBlocker, hcenterNeSecondBlocker,
        hcenterNeFirstApex, hcenterNeSecondApex,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support_card,
        ⟨hfirstView⟩, ⟨hsecondView⟩⟩
  · exact
      ⟨hcap, hsourceInterior', hsourceOutside',
        hcenterNeFirstBlocker', hcenterNeSecondBlocker',
        hcenterNeFirstApex', hcenterNeSecondApex',
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support,
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_card,
        ⟨hfirstView'⟩, ⟨hsecondView'⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- The second collision blocker cannot bisect the two explicit points outside
the first cap.  The distinct first collision blocker already bisects them, so
ordered-cap uniqueness forces the inequality without using the cap-source or
five-center deletion data. -/
theorem secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        Q.otherOutsidePoint := by
  intro hsecondEq
  have hsecondCenterCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex1 hsecondCenterCap hfirstCenterCap hblockersNe
      Q.source.2 Q.otherOutsidePoint_mem_A
      Q.otherOutsidePoint_ne_source.symm
      Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
      hsecondEq hfirstEq

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two cap-source rows contain one another's sources. -/
abbrev TwoCapSourcesMutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  source'.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    source.1 ∈
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem common_omission_or_complementary_membership
    {α : Type*}
    (K K' : Finset α) (a b : α)
    (hK : a ∉ K ∨ b ∉ K)
    (hK' : a ∉ K' ∨ b ∉ K') :
    ((a ∉ K ∧ a ∉ K') ∨ (b ∉ K ∧ b ∉ K')) ∨
      ((a ∈ K ∧ b ∈ K') ∨ (b ∈ K ∧ a ∈ K')) := by
  classical
  by_cases haCommon : a ∉ K ∧ a ∉ K'
  · exact Or.inl (Or.inl haCommon)
  by_cases hbCommon : b ∉ K ∧ b ∉ K'
  · exact Or.inl (Or.inr hbCommon)
  right
  rcases hK with haK | hbK
  · rcases hK' with haK' | hbK'
    · exact False.elim (haCommon ⟨haK, haK'⟩)
    · refine Or.inr ⟨?_, ?_⟩
      · by_contra hbK
        exact hbCommon ⟨hbK, hbK'⟩
      · by_contra haK'
        exact haCommon ⟨haK, haK'⟩
  · rcases hK' with haK' | hbK'
    · refine Or.inl ⟨?_, ?_⟩
      · by_contra haK
        exact haCommon ⟨haK, haK'⟩
      · by_contra hbK'
        exact hbCommon ⟨hbK, hbK'⟩
    · exact False.elim (hbCommon ⟨hbK, hbK'⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two cross-pair omission views have a finite exact alternative.  Either
one collision endpoint is absent from both selected supports, or the two
supports make complementary choices from each collision pair. -/
theorem commonCollisionEndpointOmission_or_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    (∃ z : ℝ²,
        z ∈
            (({P.source₁, P.source₂} : Finset ℝ²) ∪
              {Pρ.source₁, Pρ.source₂}) ∧
          z ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
          z ∉
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
      (((P.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            P.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support)) ∧
        ((Pρ.source₁ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₂ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support) ∨
          (Pρ.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∧
            Pρ.source₁ ∈
              (H.selectedAt source'.1
                source'.2).toCriticalFourShell.support))) := by
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirst, hsecond⟩
  rcases hsource' with
    ⟨_, _, _, _, _, _, _, _, _, hfirst', hsecond'⟩
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  have hfirstSplit :=
    common_omission_or_complementary_membership
      K K' P.source₁ P.source₂ hfirst.omits hfirst'.omits
  have hsecondSplit :=
    common_omission_or_complementary_membership
      K K' Pρ.source₁ Pρ.source₂ hsecond.omits hsecond'.omits
  rcases hfirstSplit with hfirstCommon | hfirstComplementary
  · rcases hfirstCommon with hcommon | hcommon
    · exact Or.inl ⟨P.source₁, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inl ⟨P.source₂, by simp, hcommon.1, hcommon.2⟩
  · rcases hsecondSplit with hsecondCommon | hsecondComplementary
    · rcases hsecondCommon with hcommon | hcommon
      · exact Or.inl ⟨Pρ.source₁, by simp, hcommon.1, hcommon.2⟩
      · exact Or.inl ⟨Pρ.source₂, by simp, hcommon.1, hcommon.2⟩
    · exact Or.inr ⟨hfirstComplementary, hsecondComplementary⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At least one cap-source row survives deletion of the other source. -/
abbrev TwoCapSourcesOneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase source'.1)
      (H.centerAt source.1 source.2) ∨
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
      (H.centerAt source'.1 source'.2)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The exact selected supports give an exhaustive two-source split: either
both cross-incidences occur, or one source can be deleted while preserving
the other source's exact-four row. -/
theorem mutualCrossMembership_or_oneSidedDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) :
    TwoCapSourcesMutualCrossMembership (H := H) source source' ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source' := by
  by_cases hforward :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · by_cases hbackward :
        source.1 ∈
          (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
    · exact Or.inl ⟨hforward, hbackward⟩
    · exact Or.inr <| Or.inr <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H source'.2).2 hbackward
  · exact Or.inr <| Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hforward

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- A retained cap-source witness is a source-exposed instance of the original
cap-source surface. -/
private theorem capSourceSurface_of_firstFiberWitness
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  exact ⟨hsource.1, source, hsource.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Mutual cross-membership at one fresh blocker value is exactly a fresh
third blocker fiber. -/
private theorem freshThirdBlockerFiber_of_mutualCrossMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hblockersEq : H.blockerVertex source = H.blockerVertex source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source') :
    Nonempty (FreshThirdBlockerFiber P Pρ) := by
  rcases hsource with
    ⟨_, _, hsourceOutside, hcenterNeFirst, hcenterNeSecond,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsFirst₁ : source.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₂ : source.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₁ : source.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsSecond₂ : source.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside
    simp [heq]
  have hsFirst₁' : source'.1 ≠ P.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsFirst₂' : source'.1 ≠ P.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₁' : source'.1 ≠ Pρ.source₁ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  have hsSecond₂' : source'.1 ≠ Pρ.source₂ := by
    intro heq
    apply hsourceOutside'
    simp [heq]
  refine ⟨{
    source₁ := source
    source₂ := source'
    sources_ne := ?_
    blockers_eq := hblockersEq
    blocker_ne_first := ?_
    blocker_ne_second := ?_
    source₁_ne_first₁ := ?_
    source₁_ne_first₂ := ?_
    source₁_ne_second₁ := ?_
    source₁_ne_second₂ := ?_
    source₂_ne_first₁ := ?_
    source₂_ne_first₂ := ?_
    source₂_ne_second₁ := ?_
    source₂_ne_second₂ := ?_
    source₁_mem_source₂_shell := hmutual.2
    source₂_mem_source₁_shell := hmutual.1 }⟩
  · intro heq
    exact hsourcesNe (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeFirst (congrArg Subtype.val heq)
  · intro heq
    exact hcenterNeSecond (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁ (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂ (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsFirst₂' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₁' (congrArg Subtype.val heq)
  · intro heq
    exact hsSecond₂' (congrArg Subtype.val heq)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two mutually incident selected exact-four rows with distinct blocker
values overlap at exactly their two source points. -/
theorem selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support =
      {source.1, source'.1} := by
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  let K' := (H.selectedAt source'.1 source'.2).toCriticalFourShell
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hinterLe : (K.support ∩ K'.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two
      K.toSelectedFourClass K'.toSelectedFourClass hcentersNe
  have hpairSubset :
      ({source.1, source'.1} : Finset _) ⊆ K.support ∩ K'.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨K.q_mem_support, hmutual.2⟩
    · exact Finset.mem_inter.mpr
        ⟨hmutual.1, K'.q_mem_support⟩
  have hpairEq :
      ({source.1, source'.1} : Finset _) = K.support ∩ K'.support :=
    Finset.eq_of_subset_of_card_le hpairSubset (by
      simpa [hsourcesNe] using hinterLe)
  exact hpairEq.symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Once two distinct actual blockers both bisect a source pair, every other
actual blocker whose selected row contains that pair is one of the two. -/
theorem blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support)
    (huSource' :
      source'.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support) :
    H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  let c := H.centerAt source.1 source.2
  let c' := H.centerAt source'.1 source'.2
  let cu := H.centerAt u.1 u.2
  have hcA : c ∈ D.A := by
    simpa [c, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source).2
  have hcA' : c' ∈ D.A := by
    simpa [c', CriticalShellSystem.blockerVertex] using
      (H.blockerVertex source').2
  have hcuA : cu ∈ D.A := by
    simpa [cu, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex u).2
  have hcc' : c ≠ c' := by
    intro h
    apply hblockersNe'
    apply Subtype.ext
    exact h
  have hcEq :
      dist c source.1 = dist c source'.1 := by
    exact
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
          source.1
          (H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
            source'.1 hmutual.1).symm
  have hcEq' :
      dist c' source.1 = dist c' source'.1 := by
    exact
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
          source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
            source'.1
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.q_mem_support).symm
  have hcuEq :
      dist cu source.1 = dist cu source'.1 := by
    exact
      ((H.selectedAt u.1 u.2).toCriticalFourShell.support_eq_radius
          source.1 huSource).trans
        ((H.selectedAt u.1
          u.2).toCriticalFourShell.support_eq_radius
            source'.1 huSource').symm
  by_cases hcuEqC : cu = c
  · exact Or.inl (by
      apply Subtype.ext
      exact hcuEqC)
  by_cases hcuEqC' : cu = c'
  · exact Or.inr (by
      apply Subtype.ext
      exact hcuEqC')
  have hbound :=
    Dumitrescu.perpBisector_apex_bound
      D.convex source.2 source'.2 hsourcesNe
  have hcFilter :
      c ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA, hcEq⟩
  have hcFilter' :
      c' ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcA', hcEq'⟩
  have hcuFilter :
      cu ∈ D.A.filter
        (fun z => dist z source.1 = dist z source'.1) :=
    Finset.mem_filter.mpr ⟨hcuA, hcuEq⟩
  have hthree :
      2 <
        (D.A.filter
          (fun z => dist z source.1 = dist z source'.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨c, hcFilter, c', hcFilter', cu, hcuFilter,
        hcc', Ne.symm hcuEqC, Ne.symm hcuEqC'⟩
  exact False.elim ((not_lt_of_ge hbound) hthree)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At every actual blocker, one source deletion preserves the selected
exact-four row unless that blocker is one of the two saturated pair centers. -/
theorem sourceDeletionSurvival_or_blockerVertex_eq_mutualPair
    (source source' u : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    HasNEquidistantPointsAt 4 (D.A.erase source.1)
        (H.centerAt u.1 u.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase source'.1)
        (H.centerAt u.1 u.2) ∨
      H.blockerVertex u = H.blockerVertex source ∨
      H.blockerVertex u = H.blockerVertex source' := by
  by_cases huSource :
      source.1 ∈
        (H.selectedAt u.1 u.2).toCriticalFourShell.support
  · by_cases huSource' :
        source'.1 ∈
          (H.selectedAt u.1 u.2).toCriticalFourShell.support
    · rcases
        blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
          source source' u hsourcesNe hmutual hblockersNe'
          huSource huSource' with hblocker | hblocker
      · exact Or.inr (Or.inr (Or.inl hblocker))
      · exact Or.inr (Or.inr (Or.inr hblocker))
    · exact Or.inr (Or.inl <|
        (cross_deletion_survives_iff_not_mem_selected_support
          H u.2).2 huSource')
  · exact Or.inl <|
      (cross_deletion_survives_iff_not_mem_selected_support
        H u.2).2 huSource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Every actual blocker avoids the three robust Moser apices and therefore
belongs to the strict interior of one indexed cap. -/
theorem exists_blockerCenter_mem_capInteriorByIndex
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ i : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i := by
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  have hblockerNe₁ : H.blockerVertex source ≠ apex₁ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H source apex₁.2
  have hblockerNe₂ : H.blockerVertex source ≠ apex₂ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H source apex₂.2
  have hblockerNe₃ : H.blockerVertex source ≠ apex₃ :=
    FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H source apex₃.2
  have hcenterNe₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 := by
    intro h
    apply hblockerNe₁
    apply Subtype.ext
    simpa [apex₁] using h
  have hcenterNe₂ :
