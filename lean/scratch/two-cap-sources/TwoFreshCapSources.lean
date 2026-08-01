import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Two fresh strict-cap sources

Scratch extraction of the cardinal margin retained by the cap-eight producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoFreshCapSources

open ATAILStageOnePrescribedApexDichotomy
open ATailApexRichClassStructure
open ATailBlockerMultiplicityGeometry
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open ATailFrontierLiveClosure
open ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

attribute [local instance] Classical.propDecidable

private theorem interior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private noncomputable def collisionRelocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (P : RetainedInteriorBlockerCollision R) :
    SurvivorPairRelocationPacket D S radius H := by
  have hqMarginal :
      P.source₁ ∈
        (D.A.filter fun x => dist x S.oppApex1 = radius) \
          S.surplusCap := by
    refine Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr ⟨P.source₁_mem_A, ?_⟩, ?_⟩
    · simpa only [dist_comm] using
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · exact interior_not_mem_surplusCap S P.source₁_mem_capInterior
  have hwMarginal :
      P.source₂ ∈
        (D.A.filter fun x => dist x S.oppApex1 = radius) \
          S.surplusCap := by
    refine Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr ⟨P.source₂_mem_A, ?_⟩, ?_⟩
    · simpa only [dist_comm] using
        (mem_selectedClass.mp P.source₂_mem_radius).2
    · exact interior_not_mem_surplusCap S P.source₂_mem_capInterior
  have hqSurvives :=
    secondApexRobust.survives P.source₁ P.source₁_mem_A
  have hwSurvives :=
    secondApexRobust.survives P.source₂ P.source₂_mem_A
  exact {
    q := P.source₁
    w := P.source₂
    q_mem_A := P.source₁_mem_A
    w_mem_A := P.source₂_mem_A
    q_mem_marginal := hqMarginal
    w_mem_marginal := hwMarginal
    q_ne_w := P.sources_ne
    q_survives := hqSurvives
    w_survives := hwSurvives
    q_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives
        H P.source₁_mem_A hqSurvives
    w_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives
        H P.source₂_mem_A hwSurvives }

private theorem source_mem_other_shell_of_blockers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source target : CriticalShellSystem.CarrierVertex A)
    (hblockers :
      H.blockerVertex source = H.blockerVertex target) :
    source.1 ∈
      (H.selectedAt target.1 target.2).toCriticalFourShell.support := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      source.2 target.2 (congrArg Subtype.val hblockers)
  rw [← hsupports]
  exact
    (H.selectedAt source.1
      source.2).toCriticalFourShell.q_mem_support

private abbrev canonicalSupport
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) : Finset ℝ² :=
  (H.selectedAt source.1 source.2).toCriticalFourShell.support

private abbrev commonlyOmittedBy
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source₁ source₂ : CriticalShellSystem.CarrierVertex A)
    (q : ℝ²) : Prop :=
  q ∉ canonicalSupport H source₁ ∧
    q ∉ canonicalSupport H source₂

/-- Two rows that each omit one endpoint of a pair either share an omitted
endpoint or contain complementary endpoints. -/
private theorem common_omission_or_complementary_membership
    {α : Type*} [DecidableEq α] (U V : Finset α) (x y : α)
    (hU : x ∉ U ∨ y ∉ U)
    (hV : x ∉ V ∨ y ∉ V) :
    ((x ∉ U ∧ x ∉ V) ∨ (y ∉ U ∧ y ∉ V)) ∨
      ((x ∈ U ∧ y ∈ V) ∨ (y ∈ U ∧ x ∈ V)) := by
  rcases hU with hxU | hyU <;> rcases hV with hxV | hyV
  · exact Or.inl (Or.inl ⟨hxU, hxV⟩)
  · by_cases hyU' : y ∈ U
    · by_cases hxV' : x ∈ V
      · exact Or.inr (Or.inr ⟨hyU', hxV'⟩)
      · exact Or.inl (Or.inl ⟨hxU, hxV'⟩)
    · exact Or.inl (Or.inr ⟨hyU', hyV⟩)
  · by_cases hxU' : x ∈ U
    · by_cases hyV' : y ∈ V
      · exact Or.inr (Or.inl ⟨hxU', hyV'⟩)
      · exact Or.inl (Or.inr ⟨hyU, hyV'⟩)
    · exact Or.inl (Or.inl ⟨hxU', hxV⟩)
  · exact Or.inl (Or.inr ⟨hyU, hyV⟩)

/-- A fresh cap-source row that also contains one source from each disjoint
collision pair cannot have its blocker in the same indexed cap. -/
private theorem blocker_not_mem_firstCap_of_cross_pair_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceOutside :
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}))
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hxSupport :
      x ∈ (H.selectedAt source.1
        source.2).toCriticalFourShell.support)
    (hySupport :
      y ∈ (H.selectedAt source.1
        source.2).toCriticalFourShell.support) :
    H.centerAt source.1 source.2 ∉
      S.capByIndex S.oppIndex1 := by
  classical
  have hsourceCap :
      source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior
  have hxCap : x ∈ S.capByIndex S.oppIndex1 := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
    rcases hxPair with rfl | rfl
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior
  have hyCap : y ∈ S.capByIndex S.oppIndex1 := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hyPair
    rcases hyPair with rfl | rfl
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior
  have hsourceNeX : source.1 ≠ x := by
    intro h
    apply hsourceOutside
    rw [h]
    exact Finset.mem_union_left _ hxPair
  have hsourceNeY : source.1 ≠ y := by
    intro h
    apply hsourceOutside
    rw [h]
    exact Finset.mem_union_right _ hyPair
  have hxy : x ≠ y := by
    intro h
    subst y
    exact (Finset.disjoint_left.mp hpairsDisjoint) hxPair hyPair
  intro hcenterCap
  have htripleSubset :
      ({source.1, x, y} : Finset ℝ²) ⊆
        (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support, hsourceCap⟩
    · exact Finset.mem_inter.mpr ⟨hxSupport, hxCap⟩
    · exact Finset.mem_inter.mpr ⟨hySupport, hyCap⟩
  have hcapTwo :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass
        hcenterCap
  have htripleCard : ({source.1, x, y} : Finset ℝ²).card = 3 := by
    simp [hsourceNeX, hsourceNeY, hxy]
  have hthree :=
    Finset.card_le_card htripleSubset
  rw [htripleCard] at hthree
  omega

/-- A cap of cardinality at least eight leaves a second strict-cap source
outside two disjoint collision pairs, distinct from any already chosen fresh
source. -/
theorem exists_second_fresh_capInterior_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ q : ℝ²,
      q ∈ S.capInteriorByIndex S.oppIndex1 ∧
        q ∉
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂}) ∧
        q ≠ source.1 := by
  classical
  let pairSources : Finset ℝ² :=
    ({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂}
  let freshSources : Finset ℝ² :=
    S.capInteriorByIndex S.oppIndex1 \ pairSources
  have hpairCard : pairSources.card = 4 := by
    dsimp [pairSources]
    rw [Finset.card_union_of_disjoint hpairsDisjoint]
    simp [P.sources_ne, Pρ.sources_ne]
  have hpairSubset :
      pairSources ⊆ S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact P.source₁_mem_capInterior
      · exact P.source₂_mem_capInterior
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Pρ.source₁_mem_capInterior
      · exact Pρ.source₂_mem_capInterior
  have hcapInterior :
      6 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    omega
  have hsplit := Finset.card_sdiff_add_card_inter
    (S.capInteriorByIndex S.oppIndex1) pairSources
  have hinter :
      S.capInteriorByIndex S.oppIndex1 ∩ pairSources = pairSources :=
    Finset.inter_eq_right.mpr hpairSubset
  rw [hinter, hpairCard] at hsplit
  have hfreshCard : 1 < freshSources.card := by
    dsimp [freshSources]
    omega
  obtain ⟨q, hqFresh, hqNe⟩ :=
    Finset.exists_mem_ne hfreshCard source.1
  have hqParts : q ∈ S.capInteriorByIndex S.oppIndex1 ∧
      q ∉ pairSources := by
    simpa [freshSources] using Finset.mem_sdiff.mp hqFresh
  exact ⟨q, hqParts.1, hqParts.2, hqNe⟩

/-- Every selected second fresh strict-cap source carries the same canonical
row data as the source retained by the production cap-eight packet. -/
theorem exists_second_capSource_witness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (source₀ : CriticalShellSystem.CarrierVertex D.A) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      source ≠ source₀ ∧ FirstFiberCapSourceWitness P Pρ source := by
  classical
  obtain ⟨q, hqInterior, hqNotPairs, hqNe⟩ :=
    exists_second_fresh_capInterior_source P Pρ hpairsDisjoint hcap source₀
  have hqCap : q ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hqInterior
  have hqA : q ∈ D.A := S.capByIndex_subset S.oppIndex1 hqCap
  let source : CriticalShellSystem.CarrierVertex D.A := ⟨q, hqA⟩
  have hsourceNe : source ≠ source₀ := by
    intro h
    apply hqNe
    exact congrArg Subtype.val h
  have hcenterNe :
      H.centerAt q hqA ≠
        H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H hqA P.source₁_mem_A hcenter
    have hqShell :
        q ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support := by
      have hown :=
        (H.selectedAt q hqA).toCriticalFourShell.q_mem_support
      rw [hsupportEq] at hown
      exact hown
    apply hqNotPairs
    apply Finset.mem_union_left
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hqShell, hqCap⟩
  have hcenterNeρ :
      H.centerAt q hqA ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H hqA Pρ.source₁_mem_A hcenter
    have hqShell :
        q ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have hown :=
        (H.selectedAt q hqA).toCriticalFourShell.q_mem_support
      rw [hsupportEq] at hown
      exact hown
    apply hqNotPairs
    apply Finset.mem_union_right
    rw [← Pρ.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hqShell, hqCap⟩
  let Q := collisionRelocation
    (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich) P
  let Qρ := collisionRelocation
    (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich) Pρ
  have hQSupport :
      Q.w ∈
        (H.selectedAt Q.q Q.q_mem_A).toCriticalFourShell.support := by
    simpa [Q, collisionRelocation] using P.source₂_mem_source₁_shell
  have hQρSupport :
      Qρ.w ∈
        (H.selectedAt Qρ.q Qρ.q_mem_A).toCriticalFourShell.support := by
    simpa [Qρ, collisionRelocation] using Pρ.source₂_mem_source₁_shell
  have hQFirst :
      H.centerAt Q.q Q.q_mem_A ≠ S.oppApex1 := by
    simpa [Q, collisionRelocation] using
      R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
  have hQρFirst :
      H.centerAt Qρ.q Qρ.q_mem_A ≠ S.oppApex1 := by
    simpa [Qρ, collisionRelocation] using
      Rρ.actualBlocker_ne_firstApex Pρ.source₁ Pρ.source₁_mem_A
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt q hqA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt q hqA) := by
    rcases
        ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Q hQSupport hQFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Q, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Q, collisionRelocation] using hw)
    · exact False.elim
        ((R.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNe (by simpa [Q, collisionRelocation] using hknown))
  have hsurvivesρ :
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
          (H.centerAt q hqA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
          (H.centerAt q hqA) := by
    rcases
        ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Qρ hQρSupport hQρFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Qρ, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Qρ, collisionRelocation] using hw)
    · exact False.elim
        ((Rρ.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNeρ (by simpa [Qρ, collisionRelocation] using hknown))
  exact
    ⟨source, hsourceNe, hcap, hqInterior, hqNotPairs,
      hcenterNe, hcenterNeρ,
      R.actualBlocker_ne_firstApex q hqA,
      (fullyDeletionRobustAt_of_apexRichClassStructure
        T.oppApex2_rich).centerAt_ne H q hqA,
      (H.selectedAt q hqA).toCriticalFourShell.q_mem_support,
      (H.selectedAt q hqA).toCriticalFourShell.support_card,
      ⟨hsurvives⟩, ⟨hsurvivesρ⟩⟩

/-- Two fresh cap-source rows either have a collision source omitted by both,
or both actual blockers lie outside the first indexed cap. -/
theorem two_capSource_rows_common_omission_or_blockers_outside_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hsource₁ : FirstFiberCapSourceWitness P Pρ source₁)
    (hsource₂ : FirstFiberCapSourceWitness P Pρ source₂) :
    ((commonlyOmittedBy H source₁ source₂ P.source₁ ∨
        commonlyOmittedBy H source₁ source₂ P.source₂) ∨
      (commonlyOmittedBy H source₁ source₂ Pρ.source₁ ∨
        commonlyOmittedBy H source₁ source₂ Pρ.source₂)) ∨
      (H.centerAt source₁.1 source₁.2 ∉
          S.capByIndex S.oppIndex1 ∧
        H.centerAt source₂.1 source₂.2 ∉
          S.capByIndex S.oppIndex1) := by
  classical
  rcases hsource₁ with
    ⟨_, hsource₁Interior, hsource₁Outside,
      _, _, _, _, _, _, hP₁, hPρ₁⟩
  rcases hsource₂ with
    ⟨_, hsource₂Interior, hsource₂Outside,
      _, _, _, _, _, _, hP₂, hPρ₂⟩
  have hP :=
    common_omission_or_complementary_membership
      (canonicalSupport H source₁) (canonicalSupport H source₂)
      P.source₁ P.source₂ hP₁.omits hP₂.omits
  rcases hP with hPCommon | hPComplementary
  · exact Or.inl (Or.inl hPCommon)
  have hPρ :=
    common_omission_or_complementary_membership
      (canonicalSupport H source₁) (canonicalSupport H source₂)
      Pρ.source₁ Pρ.source₂ hPρ₁.omits hPρ₂.omits
  rcases hPρ with hPρCommon | hPρComplementary
  · exact Or.inl (Or.inr hPρCommon)
  rcases hPComplementary with hP12 | hP21 <;>
    rcases hPρComplementary with hPρ12 | hPρ21
  · refine Or.inr ⟨?_, ?_⟩
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₁ hsource₁Interior hsource₁Outside
        (x := P.source₁) (y := Pρ.source₁)
        (by simp) (by simp) hP12.1 hPρ12.1
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₂ hsource₂Interior hsource₂Outside
        (x := P.source₂) (y := Pρ.source₂)
        (by simp) (by simp) hP12.2 hPρ12.2
  · refine Or.inr ⟨?_, ?_⟩
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₁ hsource₁Interior hsource₁Outside
        (x := P.source₁) (y := Pρ.source₂)
        (by simp) (by simp) hP12.1 hPρ21.1
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₂ hsource₂Interior hsource₂Outside
        (x := P.source₂) (y := Pρ.source₁)
        (by simp) (by simp) hP12.2 hPρ21.2
  · refine Or.inr ⟨?_, ?_⟩
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₁ hsource₁Interior hsource₁Outside
        (x := P.source₂) (y := Pρ.source₁)
        (by simp) (by simp) hP21.1 hPρ12.1
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₂ hsource₂Interior hsource₂Outside
        (x := P.source₁) (y := Pρ.source₂)
        (by simp) (by simp) hP21.2 hPρ12.2
  · refine Or.inr ⟨?_, ?_⟩
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₁ hsource₁Interior hsource₁Outside
        (x := P.source₂) (y := Pρ.source₂)
        (by simp) (by simp) hP21.1 hPρ21.1
    · exact blocker_not_mem_firstCap_of_cross_pair_hits
        P Pρ hpairsDisjoint source₂ hsource₂Interior hsource₂Outside
        (x := P.source₁) (y := Pρ.source₁)
        (by simp) (by simp) hP21.2 hPρ21.2

/-- Comparing the retained cap source with a second fresh cap source either
produces the existing fresh-third-fiber packet or gives two distinct fresh
canonical rows with distinct blockers. -/
theorem freshThirdBlockerFiber_or_two_distinct_capSource_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    Nonempty (FreshThirdBlockerFiber P Pρ) ∨
      ∃ source₂ : CriticalShellSystem.CarrierVertex D.A,
        source₂ ≠ source ∧
          FirstFiberCapSourceWitness P Pρ source₂ ∧
          H.blockerVertex source ≠ H.blockerVertex source₂ := by
  classical
  rcases hsource with
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirst, hcenterNeSecond,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  have hsourcePacket : FirstFiberCapSourceWitness P Pρ source :=
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirst, hcenterNeSecond,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  obtain ⟨source₂, hsource₂Ne, hsource₂⟩ :=
    exists_second_capSource_witness P Pρ T hpairsDisjoint hcap source
  have hsource₂Outside :
      source₂.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) :=
    hsource₂.2.2.1
  by_cases hblockers :
      H.blockerVertex source = H.blockerVertex source₂
  · left
    refine ⟨{
      source₁ := source
      source₂ := source₂
      sources_ne := hsource₂Ne.symm
      blockers_eq := hblockers
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
      source₁_mem_source₂_shell :=
        source_mem_other_shell_of_blockers_eq H source source₂ hblockers
      source₂_mem_source₁_shell :=
        source_mem_other_shell_of_blockers_eq H source₂ source hblockers.symm
    }⟩
    · intro h
      exact hcenterNeFirst (congrArg Subtype.val h)
    · intro h
      exact hcenterNeSecond (congrArg Subtype.val h)
    · intro h
      apply hsourceOutside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsourceOutside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsourceOutside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsourceOutside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsource₂Outside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsource₂Outside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsource₂Outside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
    · intro h
      apply hsource₂Outside
      have hv := congrArg Subtype.val h
      simp only at hv
      simp [hv]
  · exact Or.inr ⟨source₂, hsource₂Ne, hsource₂, hblockers⟩

end ATailTwoFreshCapSources
end Problem97
