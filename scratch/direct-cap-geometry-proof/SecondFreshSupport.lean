import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Direct cap-geometry extraction for the open first-fiber leaf

The cap-source witness carries an exact-four selected support and one
cross-pair deletion view for each of the two collision pairs.  Each view omits
at least one endpoint of its pair.  Hence at most two of the four collision
sources can occur in the exact-four support, leaving at least two support
points outside their union.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace DirectCapGeometryProofScratch

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailDeletionRobustness
open ATailFrontierLiveClosure
open ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
open ATailFirstFiberOverlapDescent
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer

attribute [local instance] Classical.propDecidable

/-- A cap-source exact-four row has at least two support points outside the
union of the two collision pairs. -/
theorem capSourceWitness_support_sdiff_collisionSources_card_ge_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    2 ≤
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support \
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})).card := by
  classical
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, hsupportCard, hview, hviewρ⟩
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let pair := ({P.source₁, P.source₂} : Finset ℝ²)
  let pairρ := ({Pρ.source₁, Pρ.source₂} : Finset ℝ²)
  have homit : P.source₁ ∉ K ∨ P.source₂ ∉ K := hview.omits
  have homitρ : Pρ.source₁ ∉ K ∨ Pρ.source₂ ∉ K := hviewρ.omits
  have pair_card_le_one
      {a b : ℝ²} (h : a ∉ K ∨ b ∉ K) :
      (K ∩ ({a, b} : Finset ℝ²)).card ≤ 1 := by
    rcases h with ha | hb
    · have hsub : K ∩ ({a, b} : Finset ℝ²) ⊆ {b} := by
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzK, hzPair⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
        rcases hzPair with rfl | rfl
        · exact False.elim (ha hzK)
        · rfl
      exact le_trans (Finset.card_le_card hsub) (by simp)
    · have hsub : K ∩ ({a, b} : Finset ℝ²) ⊆ {a} := by
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzK, hzPair⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
        rcases hzPair with rfl | rfl
        · rfl
        · exact False.elim (hb hzK)
      exact le_trans (Finset.card_le_card hsub) (by simp)
  have hpair : (K ∩ pair).card ≤ 1 := by
    simpa [pair] using pair_card_le_one homit
  have hpairρ : (K ∩ pairρ).card ≤ 1 := by
    simpa [pairρ] using pair_card_le_one homitρ
  have hinter :
      (K ∩ (pair ∪ pairρ)).card ≤ 2 := by
    have hdistrib :
        K ∩ (pair ∪ pairρ) = (K ∩ pair) ∪ (K ∩ pairρ) := by
      ext z
      simp only [Finset.mem_inter, Finset.mem_union]
      tauto
    rw [hdistrib]
    exact
      (Finset.card_union_le (K ∩ pair) (K ∩ pairρ)).trans (by omega)
  have hsplit := Finset.card_sdiff_add_card_inter K (pair ∪ pairρ)
  change 2 ≤ (K \ (pair ∪ pairρ)).card
  change K.card = 4 at hsupportCard
  omega

/-- In particular, besides the named cap source itself there is a second
support point outside all four collision sources. -/
theorem capSourceWitness_exists_second_support_outside_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    ∃ z : ℝ²,
      z ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        z ≠ source.1 ∧
        z ∉
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂}) := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let U :=
    (({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂})
  have hcard : 2 ≤ (K \ U).card := by
    simpa [K, U] using
      capSourceWitness_support_sdiff_collisionSources_card_ge_two
        P Pρ source hsource
  have hsourceSdiff : source.1 ∈ K \ U := by
    exact Finset.mem_sdiff.mpr ⟨hsource.2.2.2.2.2.2.2.1, hsource.2.2.1⟩
  have heraseCard : 0 < ((K \ U).erase source.1).card := by
    rw [Finset.card_erase_of_mem hsourceSdiff]
    omega
  obtain ⟨z, hzErase⟩ := Finset.card_pos.mp heraseCard
  have hz := Finset.mem_erase.mp hzErase
  exact
    ⟨z, (Finset.mem_sdiff.mp hz.2).1, hz.1,
      (Finset.mem_sdiff.mp hz.2).2⟩

/-- Metric form of the extraction: the cap source has a distinct carrier
partner on its blocker circle which is none of the four collision sources. -/
theorem capSourceWitness_exists_collisionFresh_coradial_partner
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    ∃ z : ℝ²,
      z ∈ D.A ∧
        z ≠ source.1 ∧
        z ≠ H.centerAt source.1 source.2 ∧
        z ∉
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂}) ∧
        dist (H.centerAt source.1 source.2) z =
          dist (H.centerAt source.1 source.2) source.1 := by
  classical
  obtain ⟨z, hzSupport, hzNe, hzOutside⟩ :=
    capSourceWitness_exists_second_support_outside_collisionSources
      P Pρ source hsource
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  have hzA : z ∈ D.A := K.support_subset_A hzSupport
  have hzCenter : z ≠ H.centerAt source.1 source.2 := by
    intro hzEq
    subst z
    exact K.center_not_mem_support hzSupport
  have hzDist :
      dist (H.centerAt source.1 source.2) z =
        dist (H.centerAt source.1 source.2) source.1 :=
    (K.support_eq_radius z hzSupport).trans
      (K.support_eq_radius source.1 K.q_mem_support).symm
  exact ⟨z, hzA, hzNe, hzCenter, hzOutside, hzDist⟩

/-- The second collision-fresh support point lies either off the first closed
cap, in its strict interior, or at one of its two Moser endpoints.  This is
the exact geometric case split left by the current witness interface. -/
theorem capSourceWitness_second_support_location
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    ∃ z : ℝ²,
      z ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        z ≠ source.1 ∧
        z ∉
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂}) ∧
        (z ∉ S.capByIndex S.oppIndex1 ∨
          z ∈ S.capInteriorByIndex S.oppIndex1 ∨
          z = S.leftOuterVertexByIndex S.oppIndex1 ∨
          z = S.rightOuterVertexByIndex S.oppIndex1) := by
  classical
  obtain ⟨z, hzSupport, hzNe, hzOutside⟩ :=
    capSourceWitness_exists_second_support_outside_collisionSources
      P Pρ source hsource
  refine ⟨z, hzSupport, hzNe, hzOutside, ?_⟩
  by_cases hzCap : z ∈ S.capByIndex S.oppIndex1
  · by_cases hzLeft : z = S.leftOuterVertexByIndex S.oppIndex1
    · exact Or.inr (Or.inr (Or.inl hzLeft))
    by_cases hzRight : z = S.rightOuterVertexByIndex S.oppIndex1
    · exact Or.inr (Or.inr (Or.inr hzRight))
    exact Or.inr (Or.inl
      (S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
        S.oppIndex1 hzCap hzRight hzLeft))
  · exact Or.inl hzCap

/-- Repackage the source-exact first-fiber witness into the existential
cap-source surface consumed by the existing fresh-third terminal. -/
theorem capSourceThirdCanonicalRowSurface_of_firstFiberCapSourceWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  rcases hsource with
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirst, hcenterNeSecond, hcenterNeFirstApex,
      hcenterNeSecondApex, hsourceMem, hsourceCard,
      hfirstView, hsecondView⟩
  exact
    ⟨hcap, source, hsourceInterior, hsourceOutside,
      hcenterNeFirst, hcenterNeSecond, hcenterNeFirstApex,
      hcenterNeSecondApex, hsourceMem, hsourceCard,
      hfirstView, hsecondView⟩

/-- If the collision-fresh second support point chooses the same blocker as
the cap source, the two points form the already named fresh third blocker
fiber. -/
theorem freshThirdBlockerFiber_of_secondSupport_center_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    {z : ℝ²} (hzA : z ∈ D.A) (hzNe : z ≠ source.1)
    (hzOutside :
      z ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}))
    (hcenter :
      H.centerAt z hzA = H.centerAt source.1 source.2) :
    Nonempty (FreshThirdBlockerFiber P Pρ) := by
  rcases hsource with
    ⟨_, _, hsourceOutside, hsourceNeFirst, hsourceNeSecond, _, _, _, _, _, _⟩
  refine ⟨{
    source₁ := source
    source₂ := ⟨z, hzA⟩
    sources_ne := ?_
    blockers_eq := ?_
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
    source₁_mem_source₂_shell := ?_
    source₂_mem_source₁_shell := ?_
  }⟩
  · intro h
    exact hzNe (congrArg Subtype.val h).symm
  · apply Subtype.ext
    exact hcenter.symm
  · intro h
    exact hsourceNeFirst (congrArg Subtype.val h)
  · intro h
    exact hsourceNeSecond (congrArg Subtype.val h)
  · intro h
    apply hsourceOutside
    rw [show source.1 = P.source₁ from congrArg Subtype.val h]
    simp
  · intro h
    apply hsourceOutside
    rw [show source.1 = P.source₂ from congrArg Subtype.val h]
    simp
  · intro h
    apply hsourceOutside
    rw [show source.1 = Pρ.source₁ from congrArg Subtype.val h]
    simp
  · intro h
    apply hsourceOutside
    rw [show source.1 = Pρ.source₂ from congrArg Subtype.val h]
    simp
  · intro h
    apply hzOutside
    rw [show z = P.source₁ from congrArg Subtype.val h]
    simp
  · intro h
    apply hzOutside
    rw [show z = P.source₂ from congrArg Subtype.val h]
    simp
  · intro h
    apply hzOutside
    rw [show z = Pρ.source₁ from congrArg Subtype.val h]
    simp
  · intro h
    apply hzOutside
    rw [show z = Pρ.source₂ from congrArg Subtype.val h]
    simp
  · have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq
        H source.2 hzA hcenter.symm
    rw [← hsupports]
    exact
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support
  · have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq
        H source.2 hzA hcenter.symm
    rw [hsupports]
    exact
      (H.selectedAt z hzA).toCriticalFourShell.q_mem_support

/-- One arm of the exact second-support refinement of the five-center
deletion residual.  The deleted collision source either hits the fresh
point's selected row, or its omission upgrades the original five surviving
centers by one more selected-row center.  The three robust Moser apices are
excluded from that fresh center, and all remaining blocker coincidences are
reported explicitly. -/
structure SecondSupportCollisionDeletionArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (deleted oppositeBlocker : ℝ²) : Type where
  z : ℝ²
  z_mem_A : z ∈ D.A
  z_mem_source_support :
    z ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
  z_ne_source : z ≠ source.1
  z_outside_collision_sources :
    z ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂})
  five_survives :
    FiveCenterDeletionSurvival D deleted
      (H.centerAt source.1 source.2) S.oppApex1 oppositeBlocker
      S.oppApex2 S.surplusApex
  deleted_hit_or_sixth_survives :
    deleted ∈
        (H.selectedAt z z_mem_A).toCriticalFourShell.support ∨
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (H.centerAt z z_mem_A)
  exact_fresh_center_split :
    deleted ∈
        (H.selectedAt z z_mem_A).toCriticalFourShell.support ∨
      (H.centerAt z z_mem_A = H.centerAt source.1 source.2 ∧
        Nonempty (FreshThirdBlockerFiber P Pρ)) ∨
        H.centerAt z z_mem_A = oppositeBlocker ∨
          (HasNEquidistantPointsAt 4 (D.A.erase deleted)
              (H.centerAt z z_mem_A) ∧
            H.centerAt z z_mem_A ≠ H.centerAt source.1 source.2 ∧
            H.centerAt z z_mem_A ≠ S.oppApex1 ∧
            H.centerAt z z_mem_A ≠ oppositeBlocker ∧
            H.centerAt z z_mem_A ≠ S.oppApex2 ∧
            H.centerAt z z_mem_A ≠ S.surplusApex)
  center_ne_firstApex :
    H.centerAt z z_mem_A ≠ S.oppApex1
  center_ne_secondApex :
    H.centerAt z z_mem_A ≠ S.oppApex2
  center_ne_surplusApex :
    H.centerAt z z_mem_A ≠ S.surplusApex
  center_vs_selected_blockers :
    H.centerAt z z_mem_A = H.centerAt source.1 source.2 ∨
      H.centerAt z z_mem_A =
          H.centerAt P.source₁ P.source₁_mem_A ∨
        H.centerAt z z_mem_A =
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∨
          (H.centerAt z z_mem_A ≠
              H.centerAt source.1 source.2 ∧
            H.centerAt z z_mem_A ≠
              H.centerAt P.source₁ P.source₁_mem_A ∧
            H.centerAt z z_mem_A ≠
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
  center_eq_source_yields_freshThird :
    H.centerAt z z_mem_A = H.centerAt source.1 source.2 →
      Nonempty (FreshThirdBlockerFiber P Pρ)

/-- The four deletion arms retain their original ordering while each is
refined by a collision-fresh second support point. -/
abbrev SecondSupportCollisionDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (SecondSupportCollisionDeletionArm P Pρ source P.source₁
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)) ∨
    Nonempty
        (SecondSupportCollisionDeletionArm P Pρ source Pρ.source₁
          (H.centerAt P.source₁ P.source₁_mem_A)) ∨
      Nonempty
          (SecondSupportCollisionDeletionArm P Pρ source P.source₂
            (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)) ∨
        Nonempty
          (SecondSupportCollisionDeletionArm P Pρ source Pρ.source₂
            (H.centerAt P.source₁ P.source₁_mem_A))

/-- Kernel-checked exhaustive second-support dichotomy for the live
five-center residual.  No finite-bank or geometric terminal is assumed:
the positive branch is the literal deleted-source incidence at the fresh
row, while the negative branch is a genuine sixth deletion survival unless
the fresh center coincides with the cap-source or included blocker center. -/
theorem collisionFiveCenterDeletion_refines_to_secondSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (R₂ : FullyDeletionRobustAt D S.oppApex2)
    (R₃ : FullyDeletionRobustAt D S.surplusApex)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hdeletion :
      FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    SecondSupportCollisionDeletionResidual P Pρ source := by
  classical
  obtain ⟨z, hzSupport, hzNe, hzOutside⟩ :=
    capSourceWitness_exists_second_support_outside_collisionSources
      P Pρ source hsource
  have hzA : z ∈ D.A :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support_subset_A hzSupport
  have hcenterNeFirstApex :
      H.centerAt z hzA ≠ S.oppApex1 :=
    R.firstApexFullyDeletionRobust.centerAt_ne H z hzA
  have hcenterNeSecondApex :
      H.centerAt z hzA ≠ S.oppApex2 :=
    R₂.centerAt_ne H z hzA
  have hcenterNeSurplusApex :
      H.centerAt z hzA ≠ S.surplusApex :=
    R₃.centerAt_ne H z hzA
  have hcenterCases :
      H.centerAt z hzA = H.centerAt source.1 source.2 ∨
        H.centerAt z hzA =
            H.centerAt P.source₁ P.source₁_mem_A ∨
          H.centerAt z hzA =
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∨
            (H.centerAt z hzA ≠ H.centerAt source.1 source.2 ∧
              H.centerAt z hzA ≠
                H.centerAt P.source₁ P.source₁_mem_A ∧
              H.centerAt z hzA ≠
                H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
    by_cases hsourceCenter :
        H.centerAt z hzA = H.centerAt source.1 source.2
    · exact Or.inl hsourceCenter
    by_cases hfirstCenter :
        H.centerAt z hzA =
          H.centerAt P.source₁ P.source₁_mem_A
    · exact Or.inr (Or.inl hfirstCenter)
    by_cases hsecondCenter :
        H.centerAt z hzA =
          H.centerAt Pρ.source₁ Pρ.source₁_mem_A
    · exact Or.inr (Or.inr (Or.inl hsecondCenter))
    · exact Or.inr (Or.inr (Or.inr
        ⟨hsourceCenter, hfirstCenter, hsecondCenter⟩))
  have hcenterEqSource :
      H.centerAt z hzA = H.centerAt source.1 source.2 →
        Nonempty (FreshThirdBlockerFiber P Pρ) :=
    freshThirdBlockerFiber_of_secondSupport_center_eq
      P Pρ source hsource hzA hzNe hzOutside
  have buildArm
      (deleted oppositeBlocker : ℝ²)
      (hfive :
        FiveCenterDeletionSurvival D deleted
          (H.centerAt source.1 source.2) S.oppApex1 oppositeBlocker
          S.oppApex2 S.surplusApex) :
      SecondSupportCollisionDeletionArm
        P Pρ source deleted oppositeBlocker := by
    refine {
      z := z
      z_mem_A := hzA
      z_mem_source_support := hzSupport
      z_ne_source := hzNe
      z_outside_collision_sources := hzOutside
      five_survives := hfive
      deleted_hit_or_sixth_survives := ?_
      exact_fresh_center_split := ?_
      center_ne_firstApex := hcenterNeFirstApex
      center_ne_secondApex := hcenterNeSecondApex
      center_ne_surplusApex := hcenterNeSurplusApex
      center_vs_selected_blockers := hcenterCases
      center_eq_source_yields_freshThird := hcenterEqSource
    }
    by_cases hhit :
        deleted ∈
          (H.selectedAt z hzA).toCriticalFourShell.support
    · exact Or.inl hhit
    · exact Or.inr
        ((cross_deletion_survives_iff_not_mem_selected_support
          H hzA).2 hhit)
    by_cases hhit :
        deleted ∈
          (H.selectedAt z hzA).toCriticalFourShell.support
    · exact Or.inl hhit
    have hsurvives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (H.centerAt z hzA) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H hzA).2 hhit
    by_cases hsourceCenter :
        H.centerAt z hzA = H.centerAt source.1 source.2
    · exact Or.inr (Or.inl
        ⟨hsourceCenter, hcenterEqSource hsourceCenter⟩)
    by_cases hoppositeCenter :
        H.centerAt z hzA = oppositeBlocker
    · exact Or.inr (Or.inr (Or.inl hoppositeCenter))
    · exact Or.inr (Or.inr (Or.inr
        ⟨hsurvives, hsourceCenter, hcenterNeFirstApex,
          hoppositeCenter, hcenterNeSecondApex,
          hcenterNeSurplusApex⟩))
  rcases hdeletion with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · exact Or.inl
      ⟨buildArm P.source₁
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) hP₁⟩
  · exact Or.inr (Or.inl
      ⟨buildArm Pρ.source₁
        (H.centerAt P.source₁ P.source₁_mem_A) hPρ₁⟩)
  · exact Or.inr (Or.inr (Or.inl
      ⟨buildArm P.source₂
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) hP₂⟩))
  · exact Or.inr (Or.inr (Or.inr
      ⟨buildArm Pρ.source₂
        (H.centerAt P.source₁ P.source₁_mem_A) hPρ₂⟩))

#print axioms capSourceWitness_support_sdiff_collisionSources_card_ge_two
#print axioms capSourceWitness_exists_second_support_outside_collisionSources
#print axioms capSourceWitness_exists_collisionFresh_coradial_partner
#print axioms capSourceWitness_second_support_location
#print axioms capSourceThirdCanonicalRowSurface_of_firstFiberCapSourceWitness
#print axioms freshThirdBlockerFiber_of_secondSupport_center_eq
#print axioms collisionFiveCenterDeletion_refines_to_secondSupport

end DirectCapGeometryProofScratch
end Problem97
