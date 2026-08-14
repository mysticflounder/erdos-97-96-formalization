import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

/-!
# Exact strict-cap support in the cap-eight branch

This scratch module isolates a cardinality-independent finite ingress for the
FreshThird FirstNonHit residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

/-- Repackage a retained strict-interior collision as the older retained-radius
collision interface used by cap-localization consumers. -/
def retainedRadiusCollisionOfInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    RetainedRadiusCollision (R := R) := by
  let source₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let source₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  apply RetainedRadiusCollision.ofSources source₁ source₂
  · exact P.source₁_mem_radius
  · exact P.source₂_mem_radius
  · intro h
    exact P.sources_ne (congrArg Subtype.val h)
  · apply Subtype.ext
    exact P.blockers_eq

theorem retainedInteriorCollision_commonBlocker_mem_firstCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    H.centerAt P.source₁ P.source₁_mem_A ∈
      S.capInteriorByIndex S.oppIndex1 := by
  let Q := retainedRadiusCollisionOfInterior P
  have h := commonBlocker_mem_firstCapInterior_of_sources_mem
    Q P.source₁_mem_capInterior P.source₂_mem_capInterior
  simpa [Q, retainedRadiusCollisionOfInterior] using h

theorem retainedInteriorCollision_commonBlocker_not_mem_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    H.centerAt P.source₁ P.source₁_mem_A ∉
      ({P.source₁, P.source₂} : Finset ℝ²) := by
  have hsource₁ :
      P.source₁ ∈
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      H P.source₂_mem_A P.source₁_mem_A P.blockers_eq.symm
  have hsource₂ :
      P.source₂ ∈
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    have hsource₂Own :=
      (H.selectedAt P.source₂ P.source₂_mem_A).toCriticalFourShell.q_mem_support
    rwa [hsupports] at hsource₂Own
  intro hcenter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcenter
  rcases hcenter with hcenter | hcenter
  · exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter] using hsource₁)
  · exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter] using hsource₂)

theorem retainedInteriorCollision_commonBlocker_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁ =
      dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₂ := by
  let Q := retainedRadiusCollisionOfInterior P
  simpa [Q, retainedRadiusCollisionOfInterior] using Q.commonBlocker_equidistant

/-- In the sharp cap-eight branch, the strict canonical cap consists exactly
of the two retained pairs and the two canonical third-row sources.  This is
cardinality-independent in the ambient carrier: only the designated cap is
assumed to have size eight. -/
theorem capInterior_eq_retainedPairs_union_canonicalSources_of_cap_card_eq_eight
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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hcap : (S.capByIndex S.oppIndex1).card = 8) :
    S.capInteriorByIndex S.oppIndex1 =
      ((({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∪
        {C.firstSource.1, C.secondSource.1}) := by
  classical
  let retained : Finset ℝ² :=
    ({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂}
  let canonical : Finset ℝ² :=
    {C.firstSource.1, C.secondSource.1}
  have hretainedCard : retained.card = 4 := by
    dsimp [retained]
    rw [Finset.card_union_of_disjoint hpairsDisjoint]
    simp [P.sources_ne, Pρ.sources_ne]
  have hcanonicalCard : canonical.card = 2 := by
    simp [canonical, C.sources_ne]
  have hdisjoint : Disjoint retained canonical := by
    rw [Finset.disjoint_left]
    intro z hzRetained hzCanonical
    simp only [canonical, Finset.mem_insert, Finset.mem_singleton] at hzCanonical
    rcases hzCanonical with rfl | rfl
    · exact C.firstSource_data.2.2.1 hzRetained
    · exact C.secondSource_data.2.2.1 hzRetained
  have hnamedCard : (retained ∪ canonical).card = 6 := by
    rw [Finset.card_union_of_disjoint hdisjoint, hretainedCard, hcanonicalCard]
  have hsubset :
      retained ∪ canonical ⊆ S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    rcases Finset.mem_union.mp hz with hzRetained | hzCanonical
    · rcases Finset.mem_union.mp hzRetained with hzP | hzPρ
      · simp only [Finset.mem_insert, Finset.mem_singleton] at hzP
        rcases hzP with rfl | rfl
        · exact P.source₁_mem_capInterior
        · exact P.source₂_mem_capInterior
      · simp only [Finset.mem_insert, Finset.mem_singleton] at hzPρ
        rcases hzPρ with rfl | rfl
        · exact Pρ.source₁_mem_capInterior
        · exact Pρ.source₂_mem_capInterior
    · simp only [canonical, Finset.mem_insert, Finset.mem_singleton] at hzCanonical
      rcases hzCanonical with rfl | rfl
      · exact C.firstSource_data.2.1
      · exact C.secondSource_data.2.1
  have hinteriorCard : (S.capInteriorByIndex S.oppIndex1).card = 6 := by
    have hcard :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex1
    omega
  have hnamedEq :
      retained ∪ canonical = S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.eq_of_subset_of_card_le hsubset
    rw [hinteriorCard, hnamedCard]
  simpa [retained, canonical] using hnamedEq.symm

/-- Once the exact cap-eight union is known, any cap-interior point outside a
set containing the two canonical sources must be one of the four retained
sources. -/
theorem mem_retainedPairs_of_cap_card_eq_eight_of_mem_interior_of_canonical_mem
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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hcap : (S.capByIndex S.oppIndex1).card = 8)
    {K : Finset ℝ²} {center : ℝ²}
    (hcenterInterior : center ∈ S.capInteriorByIndex S.oppIndex1)
    (hfirstK : C.firstSource.1 ∈ K)
    (hsecondK : C.secondSource.1 ∈ K)
    (hcenterK : center ∉ K) :
    center ∈
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) := by
  have hcapUnion :=
    capInterior_eq_retainedPairs_union_canonicalSources_of_cap_card_eq_eight
      P Pρ hpairsDisjoint C hcap
  rw [hcapUnion] at hcenterInterior
  rcases Finset.mem_union.mp hcenterInterior with hretained | hcanonical
  · exact hretained
  · simp only [Finset.mem_insert, Finset.mem_singleton] at hcanonical
    rcases hcanonical with rfl | rfl
    · exact False.elim (hcenterK hfirstK)
    · exact False.elim (hcenterK hsecondK)

theorem retained_commonBlockers_mem_otherPairs_of_cap_card_eq_eight
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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hcap : (S.capByIndex S.oppIndex1).card = 8) :
    H.centerAt P.source₁ P.source₁_mem_A ∈
        (({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∪
          {C.firstSource.1, C.secondSource.1}) ∧
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {C.firstSource.1, C.secondSource.1}) := by
  have hcapUnion :=
    capInterior_eq_retainedPairs_union_canonicalSources_of_cap_card_eq_eight
      P Pρ hpairsDisjoint C hcap
  have hPInterior := retainedInteriorCollision_commonBlocker_mem_firstCapInterior P
  have hPρInterior := retainedInteriorCollision_commonBlocker_mem_firstCapInterior Pρ
  rw [hcapUnion] at hPInterior hPρInterior
  have hPNotOwn := retainedInteriorCollision_commonBlocker_not_mem_sources P
  have hPρNotOwn := retainedInteriorCollision_commonBlocker_not_mem_sources Pρ
  constructor
  · rcases Finset.mem_union.mp hPInterior with hPRetained | hPCanonical
    · rcases Finset.mem_union.mp hPRetained with hPOwn | hPOther
      · exact False.elim (hPNotOwn hPOwn)
      · exact Finset.mem_union.mpr (Or.inl hPOther)
    · exact Finset.mem_union.mpr (Or.inr hPCanonical)
  · rcases Finset.mem_union.mp hPρInterior with hPρRetained | hPρCanonical
    · rcases Finset.mem_union.mp hPρRetained with hPρOther | hPρOwn
      · exact Finset.mem_union.mpr (Or.inl hPρOther)
      · exact False.elim (hPρNotOwn hPρOwn)
    · exact Finset.mem_union.mpr (Or.inr hPρCanonical)

/-- In the common-radius same-blocker branch with a sharp cap of size eight,
the common fresh blocker center must itself be one of the four retained source
vertices. -/
theorem freshThird_commonRadius_sameBlocker_freshCenter_mem_retainedPairs_of_cap_card_eq_eight
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
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hcap : (S.capByIndex S.oppIndex1).card = 8) :
    H.centerAt Q.source₁.1 Q.source₁.2 ∈
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) := by
  let K :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support
  have hcenterInterior :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex S.oppIndex1 :=
    freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap
      (T := T) P Pρ C Q hfirstSupport hsecondSupport
  have hfirstK : C.surface.firstSource.1 ∈ K := by
    dsimp [K]
    rw [← hfirstSupport]
    exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecondK : C.surface.secondSource.1 ∈ K := by
    dsimp [K]
    rw [← hsecondSupport]
    exact
      (H.selectedAt C.surface.secondSource.1
        C.surface.secondSource.2).toCriticalFourShell.q_mem_support
  have hcenterK : H.centerAt Q.source₁.1 Q.source₁.2 ∉ K := by
    exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.center_not_mem_support
  exact
    mem_retainedPairs_of_cap_card_eq_eight_of_mem_interior_of_canonical_mem
      P Pρ hpairsDisjoint C.surface hcap hcenterInterior hfirstK hsecondK hcenterK

theorem freshThird_commonRadius_sameBlocker_freshCenter_equidistant_canonicalSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    dist (H.centerAt Q.source₁.1 Q.source₁.2) C.surface.firstSource.1 =
      dist (H.centerAt Q.source₁.1 Q.source₁.2) C.surface.secondSource.1 := by
  let K := (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell
  have hfirst : C.surface.firstSource.1 ∈ K.support := by
    dsimp [K]
    rw [← hfirstSupport]
    exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecond : C.surface.secondSource.1 ∈ K.support := by
    dsimp [K]
    rw [← hsecondSupport]
    exact
      (H.selectedAt C.surface.secondSource.1
        C.surface.secondSource.2).toCriticalFourShell.q_mem_support
  exact
    (K.support_eq_radius _ hfirst).trans
      (K.support_eq_radius _ hsecond).symm

/-- Complete finite alias ingress for the sharp common-radius same-blocker
branch.  The three pair blockers are distinct strict-cap vertices, and each is
forced into one of the other named pairs. -/
theorem freshThird_commonRadius_sameBlocker_threeCenters_aliases_of_cap_card_eq_eight
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
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hcap : (S.capByIndex S.oppIndex1).card = 8) :
    (H.centerAt P.source₁ P.source₁_mem_A ∈
        (({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∪
          {C.surface.firstSource.1, C.surface.secondSource.1})) ∧
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {C.surface.firstSource.1, C.surface.secondSource.1})) ∧
      (H.centerAt Q.source₁.1 Q.source₁.2 ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})) ∧
      H.centerAt P.source₁ P.source₁_mem_A ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
  have hretained :=
    retained_commonBlockers_mem_otherPairs_of_cap_card_eq_eight
      P Pρ hpairsDisjoint C.surface hcap
  have hfresh :=
    freshThird_commonRadius_sameBlocker_freshCenter_mem_retainedPairs_of_cap_card_eq_eight
      P Pρ T hpairsDisjoint C Q hfirstSupport hsecondSupport hcap
  have hfreshNeFirst :
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    apply Q.blocker_ne_first
    apply Subtype.ext
    exact h
  have hfreshNeSecond :
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro h
    apply Q.blocker_ne_second
    apply Subtype.ext
    exact h
  exact
    ⟨hretained.1, hretained.2, hfresh, hblockersNe.symm,
      hfreshNeFirst, hfreshNeSecond⟩

/-- A finite aliasing trichotomy for the three named pair roles.

The first three arms are the possible two-cycles between pair roles; the last
two arms are the two orientations of a three-cycle.  This is purely finite
set combinatorics, so it is independent of the geometric source of the three
membership hypotheses. -/
theorem alias_memberships_two_cycle_or_three_cycle
    {a b c : ℝ²} {A B C : Finset ℝ²}
    (ha : a ∈ B ∪ C)
    (hb : b ∈ A ∪ C)
    (hc : c ∈ A ∪ B) :
    (a ∈ B ∧ b ∈ A) ∨
      (a ∈ C ∧ c ∈ A) ∨
      (b ∈ C ∧ c ∈ B) ∨
      (a ∈ B ∧ b ∈ C ∧ c ∈ A) ∨
      (a ∈ C ∧ b ∈ A ∧ c ∈ B) := by
  rcases Finset.mem_union.mp ha with haB | haC
  · rcases Finset.mem_union.mp hb with hbA | hbC
    · exact Or.inl ⟨haB, hbA⟩
    · rcases Finset.mem_union.mp hc with hcA | hcB
      · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨haB, hbC, hcA⟩)))
      · exact Or.inr (Or.inr (Or.inl ⟨hbC, hcB⟩))
  · rcases Finset.mem_union.mp hb with hbA | hbC
    · rcases Finset.mem_union.mp hc with hcA | hcB
      · exact Or.inr (Or.inl ⟨haC, hcA⟩)
      · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨haC, hbA, hcB⟩)))
    · rcases Finset.mem_union.mp hc with hcA | hcB
      · exact Or.inr (Or.inl ⟨haC, hcA⟩)
      · exact Or.inr (Or.inr (Or.inl ⟨hbC, hcB⟩))

/-- The sharp common-radius same-blocker ingress therefore lands in one of the
finite two-cycle or three-cycle alias patterns. -/
theorem freshThird_commonRadius_sameBlocker_alias_cycle_split_of_cap_card_eq_eight
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
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hcap : (S.capByIndex S.oppIndex1).card = 8) :
    (H.centerAt P.source₁ P.source₁_mem_A ∈
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        ({P.source₁, P.source₂} : Finset ℝ²)) ∨
      (H.centerAt P.source₁ P.source₁_mem_A ∈
        ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        ({P.source₁, P.source₂} : Finset ℝ²)) ∨
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²)) ∨
      (H.centerAt P.source₁ P.source₁_mem_A ∈
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        ({P.source₁, P.source₂} : Finset ℝ²)) ∨
      (H.centerAt P.source₁ P.source₁_mem_A ∈
        ({C.surface.firstSource.1, C.surface.secondSource.1} : Finset ℝ²) ∧
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        ({P.source₁, P.source₂} : Finset ℝ²) ∧
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        ({Pρ.source₁, Pρ.source₂} : Finset ℝ²)) := by
  have h :=
    freshThird_commonRadius_sameBlocker_threeCenters_aliases_of_cap_card_eq_eight
      P Pρ T hpairsDisjoint hblockersNe C Q hfirstSupport hsecondSupport hcap
  exact alias_memberships_two_cycle_or_three_cycle h.1 h.2.1 h.2.2.1

theorem freshThird_commonRadius_sameBlocker_exact_trace_packet
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
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capInteriorByIndex S.oppIndex1 ∧
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 = {P.source₁, P.source₂} ∧
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capInteriorByIndex S.oppIndex1 ∧
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂} ∧
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {C.surface.firstSource.1, C.surface.secondSource.1} := by
  have hP₁ : P.source₁ ∈
      SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
      S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.mem_inter.mpr
    exact ⟨by simpa using P.source₁_mem_radius, P.source₁_mem_capInterior⟩
  have hP₂ : P.source₂ ∈
      SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.mem_inter.mpr
    exact ⟨by simpa using P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hPρ₁ : Pρ.source₁ ∈
      SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
        S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.mem_inter.mpr
    exact ⟨by simpa using Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
  have hPρ₂ : Pρ.source₂ ∈
      SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
        S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.mem_inter.mpr
    exact ⟨by simpa using Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hP := equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    P.source₁_mem_A P.source₂_mem_A hP₁ hP₂ P.sources_ne
    P.blockers_eq
    (by
      simpa only [ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex1]
        using T.oppApex1_rich)
    (ATailMinimalUniqueFourCover.isUniqueFourCenter_centerAt
      H P.source₁ P.source₁_mem_A)
  have hPρ := equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    Pρ.source₁_mem_A Pρ.source₂_mem_A hPρ₁ hPρ₂ Pρ.sources_ne
    Pρ.blockers_eq
    (by
      simpa only [ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex1]
        using T.oppApex1_rich)
    (ATailMinimalUniqueFourCover.isUniqueFourCenter_centerAt
      H Pρ.source₁ Pρ.source₁_mem_A)
  have hC :=
    freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources
      P Pρ T C Q hfirstSupport hsecondSupport
  exact ⟨hP.1, hP.2, hPρ.1, hPρ.2, hC⟩

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
