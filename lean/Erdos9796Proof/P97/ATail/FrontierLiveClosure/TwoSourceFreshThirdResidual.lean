/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdPinnedFanPacket
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceTripleShellEscape
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdRetainedProducer
import Erdos9796Proof.P97.ATail.FirstApexInteriorPairGeometry
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.SelectedFourGeometry
import Erdos9796Proof.P97.ATail.TwoTripleRowSixPointEuclideanObstruction
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailGlobalMinimalDeletion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

open scoped BigOperators

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

private def transportFreshThirdSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportFreshThirdSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportFreshThirdSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP -- [shard-prologue-state]

/- The two exact four-supports exposed by a positive FreshThird cross-row
interaction.  Keeping this seed separate from the older three-shell seed is
important: the exact overlap theorem below makes this a six-point object,
so the global-minimality continuation has only the named points of the two
rows as possible pinned centers. -/
noncomputable def freshThirdCrossRowTwoShellSeed
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Finset ℝ² :=
  (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.support ∪
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.support

/-- The two points of the fresh row not already present in the canonical
source row.  In the equal-center arm the source row is the named four-source
row, so this difference is the anonymous part of the six-point seed. -/
noncomputable def freshThirdCrossRowFreshRemainder
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Finset ℝ² :=
  (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.support \
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both rows in the FreshThird two-shell seed are rows on the carrier. -/
theorem freshThirdCrossRowTwoShellSeed_subset_carrier
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    freshThirdCrossRowTwoShellSeed P Pρ C Q ⊆ D.A := by
  intro z hz
  simp only [freshThirdCrossRowTwoShellSeed, Finset.mem_union] at hz
  rcases hz with hz | hz
  · exact
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support_subset_A hz
  · exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support_subset_A hz

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- An exact positive cross-row interaction exposes a six-point seed: two
four-supports whose intersection is exactly the fresh source pair. -/
theorem freshThirdCrossRowTwoShellSeed_card_eq_six
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    (freshThirdCrossRowTwoShellSeed P Pρ C Q).card = 6 := by
  classical
  let KC :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell
  have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hpairCard : ({Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 2 := by
    simpa using Finset.card_pair hsourcesNe
  change (KC.support ∪ KQ.support).card = 6
  rw [Finset.card_union, KC.support_card, KQ.support_card, overlap_eq,
    hpairCard]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Exact overlap of the two four-rows leaves exactly two fresh-row points
outside the canonical source row. -/
theorem freshThirdCrossRowFreshRemainder_card_eq_two
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    (freshThirdCrossRowFreshRemainder P Pρ C Q).card = 2 := by
  classical
  let KC :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell
  have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hinterCard : (KQ.support ∩ KC.support).card = 2 := by
    rw [Finset.inter_comm, overlap_eq]
    simpa using Finset.card_pair hsourcesNe
  have hsplit := Finset.card_sdiff_add_card_inter KQ.support KC.support
  change (KQ.support \ KC.support).card = 2
  rw [KQ.support_card, hinterCard] at hsplit
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-cross-row-center arm, the canonical source support has no
anonymous point: it is exactly the two canonical sources together with the
two fresh-fiber sources.  This turns membership in the first half of the
two-shell seed into a finite four-way named case split. -/
theorem freshThird_equalCrossRowCenter_sourceSupport_eq_four
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (centers_ne :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support) :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} := by
  classical
  let K₂ : SelectedFourClass D.A
      (H.centerAt C.firstSource.1 C.firstSource.2) :=
    transportFreshThirdSelectedFourClass
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toSelectedFourClass hcenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support := by
    exact transportFreshThirdSelectedFourClass_support _ _
  have hsupports :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support = K₂.support :=
        (H.selectedFourClass_support_eq_shell
          C.firstSource.1 C.firstSource.2 K₂).symm
      _ = _ := hK₂Support
  have hsecondMem :
      C.secondSource.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.q_mem_support
  have hnamedSubset :
      ({C.firstSource.1, C.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support
    · exact hsecondMem
    · exact source₁_mem
    · exact source₂_mem
  have hnamedCard :
      ({C.firstSource.1, C.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 4 := by
    have hqNe : Q.source₁.1 ≠ Q.source₂.1 := by
      intro h
      exact Q.sources_ne (Subtype.ext h)
    have hc₁q₁ : C.firstSource.1 ≠ Q.source₁.1 := by
      intro h
      apply centers_ne
      exact congrArg (fun q => H.centerAt q.1 q.2) (Subtype.ext h)
    have hQcenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 := by
      simpa [CriticalShellSystem.blockerVertex] using
        congrArg Subtype.val Q.blockers_eq
    have hc₁q₂ : C.firstSource.1 ≠ Q.source₂.1 := by
      intro h
      apply centers_ne
      exact
        (congrArg (fun q => H.centerAt q.1 q.2)
          (Subtype.ext h)).trans hQcenters.symm
    have hc₂q₁ : C.secondSource.1 ≠ Q.source₁.1 := by
      intro h
      apply centers_ne
      exact hcenters.trans
        (congrArg (fun q => H.centerAt q.1 q.2) (Subtype.ext h))
    have hc₂q₂ : C.secondSource.1 ≠ Q.source₂.1 := by
      intro h
      apply centers_ne
      exact hcenters.trans
        ((congrArg (fun q => H.centerAt q.1 q.2)
          (Subtype.ext h)).trans hQcenters.symm)
    simp [C.sources_ne, hqNe, hc₁q₁, hc₁q₂,
      hc₂q₁, hc₂q₂]
  exact
    (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [hnamedCard,
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_card])).symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global minimality enters the locally satisfiable FreshThird incidence
packet through its exact six-point two-shell seed.  It pins a named seed
center at which every ambient selected four-row has a witness outside both
cross rows.  This is strictly stronger than choosing one favorable escape
row and is the producer consumed by the remaining finite source case split. -/
theorem exists_freshThirdCrossRow_pinnedCenter_allRows_escape_twoShellSeed
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ center : ℝ²,
      ∃ _hcenterSeed :
          center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q,
        ∃ _hcenterA : center ∈ D.A,
          ∀ K : SelectedFourClass D.A center,
            ∃ z : ℝ²,
              z ∈ K.support ∧
                z ∉ freshThirdCrossRowTwoShellSeed P Pρ C Q := by
  have hseedSub :
      freshThirdCrossRowTwoShellSeed P Pρ C Q ⊆ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier P Pρ C Q
  have hseedNonempty :
      (freshThirdCrossRowTwoShellSeed P Pρ C Q).Nonempty := by
    refine ⟨C.firstSource.1, ?_⟩
    exact Finset.mem_union_left _
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
  have hseedCard :
      (freshThirdCrossRowTwoShellSeed P Pρ C Q).card = 6 :=
    freshThirdCrossRowTwoShellSeed_card_eq_six P Pρ C Q overlap_eq
  have hseedProper : freshThirdCrossRowTwoShellSeed P Pρ C Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card = 6 := by
      simpa [hseedEq] using hseedCard
    have hAge : 15 ≤ D.A.card :=
      ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
        S (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six
    omega
  rcases
      exists_center_all_selectedFourClass_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenterSeed, hEveryRowEscapes⟩
  exact
    ⟨center, hcenterSeed, hseedSub hcenterSeed, hEveryRowEscapes⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Pinned-multiplicity form of the FreshThird two-shell escape producer.

At one of the six seed points, every positive physical radius class contains
at most three seed points.  Unlike an existential selected-row statement,
this quantifier order is stable under every later choice of a selected
four-row and is therefore suitable as a finite-ingress contract. -/
theorem exists_freshThirdCrossRow_pinnedCenter_selectedClass_seed_card_le_three
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ center : ℝ²,
      ∃ _hcenterSeed :
          center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q,
        ∀ shellRadius : ℝ,
          0 < shellRadius →
            ((SelectedClass D.A center shellRadius) ∩
                freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3 := by
  have hseedSub :
      freshThirdCrossRowTwoShellSeed P Pρ C Q ⊆ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier P Pρ C Q
  have hseedNonempty :
      (freshThirdCrossRowTwoShellSeed P Pρ C Q).Nonempty := by
    refine ⟨C.firstSource.1, ?_⟩
    exact Finset.mem_union_left _
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
  have hseedCard :
      (freshThirdCrossRowTwoShellSeed P Pρ C Q).card = 6 :=
    freshThirdCrossRowTwoShellSeed_card_eq_six P Pρ C Q overlap_eq
  have hseedProper : freshThirdCrossRowTwoShellSeed P Pρ C Q ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card = 6 := by
      simpa [hseedEq] using hseedCard
    have hAge : 15 ≤ D.A.card :=
      ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
        S (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six
    omega
  exact
    Problem97.exists_center_selectedClass_inter_card_le_three_of_proper_subset
      R.minimal hseedNonempty hseedSub hseedProper

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The FreshThird pinned low-multiplicity center is distinct from the
centers of both exposed four-shells.  Either equality would put a complete
positive-radius four-class inside the seed, contradicting the pinned
three-point bound. -/
theorem exists_freshThirdCrossRow_pinnedCenter_ne_exposedCenters
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ center : ℝ²,
      ∃ _hcenterSeed :
          center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q,
        center ≠ H.centerAt C.firstSource.1 C.firstSource.2 ∧
          center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
            ∀ shellRadius : ℝ,
              0 < shellRadius →
                ((SelectedClass D.A center shellRadius) ∩
                    freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3 := by
  rcases
      exists_freshThirdCrossRow_pinnedCenter_selectedClass_seed_card_le_three
        (P := P) (Pρ := Pρ) (T := T) C Q overlap_eq with
    ⟨center, hcenterSeed, hmult⟩
  refine ⟨center, hcenterSeed, ?_, ?_, hmult⟩
  · intro hcenter
    let KC :=
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell
    have hrowSub :
        KC.support ⊆
          SelectedClass D.A center KC.radius ∩
            freshThirdCrossRowTwoShellSeed P Pρ C Q := by
      intro z hz
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · rw [mem_selectedClass]
        exact ⟨KC.support_subset_A hz, by
          simpa [hcenter] using KC.support_eq_radius z hz⟩
      · exact Finset.mem_union_left _ hz
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult KC.radius KC.radius_pos
    rw [KC.support_card] at hfour
    omega
  · intro hcenter
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell
    have hrowSub :
        KQ.support ⊆
          SelectedClass D.A center KQ.radius ∩
            freshThirdCrossRowTwoShellSeed P Pρ C Q := by
      intro z hz
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · rw [mem_selectedClass]
        exact ⟨KQ.support_subset_A hz, by
          simpa [hcenter] using KQ.support_eq_radius z hz⟩
      · exact Finset.mem_union_right _ hz
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult KQ.radius KQ.radius_pos
    rw [KQ.support_card] at hfour
    omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Uniform source-faithful dichotomy at the FreshThird pinned center.

The center is chosen once.  Every selected four-row there, and every point
of that row outside the exact two-shell seed, either has the pinned center as
its canonical blocker (forcing equality of the two full supports and failure
of deletion robustness) or has a distinct canonical blocker whose critical
support meets the selected row in at most two points. -/
theorem exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ center : ℝ²,
      ∃ hcenterSeed :
          center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q,
        center ≠ H.centerAt C.firstSource.1 C.firstSource.2 ∧
          center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
            (∀ shellRadius : ℝ,
              0 < shellRadius →
                ((SelectedClass D.A center shellRadius) ∩
                    freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3) ∧
              ∀ K : SelectedFourClass D.A center,
                ∀ z : ℝ²,
                  ∀ hzK : z ∈ K.support,
                    z ∉ freshThirdCrossRowTwoShellSeed P Pρ C Q →
                      ((center = H.centerAt z (K.support_subset_A hzK) ∧
                          K.support =
                            (H.selectedAt z
                              (K.support_subset_A hzK)).toCriticalFourShell.support ∧
                          ¬ FullyDeletionRobustAt D center) ∨
                        (center ≠ H.centerAt z (K.support_subset_A hzK) ∧
                          (K.support ∩
                            (H.selectedAt z
                              (K.support_subset_A hzK)).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      exists_freshThirdCrossRow_pinnedCenter_ne_exposedCenters
        (P := P) (Pρ := Pρ) (T := T) C Q overlap_eq with
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh, hmult⟩
  refine
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh, hmult,
      fun K z hzK _hzOutside ↦ ?_⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  by_cases heq : center = H.centerAt z hzA
  · subst center
    left
    refine ⟨rfl, H.selectedFourClass_support_eq_shell z hzA K, ?_⟩
    intro hrobust
    exact H.no_qfree_at z hzA (hrobust.survives z hzA)
  · right
    exact ⟨heq, SelectedFourClass.inter_card_le_two K
      (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass heq⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A consumer-ready selected-row form of the FreshThird pinned-center producer.

The center supplied by global minimality lies in the exact six-point seed.  Global
K4 supplies a selected four-row at that same center, and the pinned multiplicity-
three bound forces an actual row point outside the seed.  The point retains the
full canonical-blocker dichotomy, so no later argument has to identify the pinned
center with a separately chosen endpoint row. -/
theorem exists_freshThirdCrossRow_pinnedCenter_selectedRow_escape_dichotomy
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ (center : ℝ²)
        (hcenterSeed : center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q),
      center ≠ H.centerAt C.firstSource.1 C.firstSource.2 ∧
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
      ∃ (K : SelectedFourClass D.A center) (z : ℝ²)
          (hzK : z ∈ K.support),
        z ∉ freshThirdCrossRowTwoShellSeed P Pρ C Q ∧
        ((center = H.centerAt z (K.support_subset_A hzK) ∧
            K.support =
              (H.selectedAt z
                (K.support_subset_A hzK)).toCriticalFourShell.support ∧
            ¬ FullyDeletionRobustAt D center) ∨
          (center ≠ H.centerAt z (K.support_subset_A hzK) ∧
            (K.support ∩
              (H.selectedAt z
                (K.support_subset_A hzK)).toCriticalFourShell.support).card ≤ 2)) := by
  classical
  rcases
      exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy
        (P := P) (Pρ := Pρ) (T := T) C Q overlap_eq with
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh,
      hmult, hglobalEscape⟩
  have hcenterA : center ∈ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier P Pρ C Q hcenterSeed
  rcases exists_selectedFourClass_of_globalK4 D.K4 hcenterA with ⟨K⟩
  have hnotSub :
      ¬ K.support ⊆ freshThirdCrossRowTwoShellSeed P Pρ C Q := by
    intro hsub
    have hrowSub :
        K.support ⊆
          SelectedClass D.A center K.radius ∩
            freshThirdCrossRowTwoShellSeed P Pρ C Q := by
      intro x hx
      exact Finset.mem_inter.mpr
        ⟨mem_selectedClass.mpr
            ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩,
          hsub hx⟩
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult K.radius K.radius_pos
    rw [K.support_card] at hfour
    omega
  rcases Finset.not_subset.mp hnotSub with ⟨z, hzK, hzOutside⟩
  exact
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh,
      K, z, hzK, hzOutside, hglobalEscape K z hzK hzOutside⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A seed point in the equal-center arm is either one of the four named
source points or one of the two anonymous points contributed by the fresh
row. -/
theorem freshThirdEqualCenter_seed_mem_named_or_freshRemainder
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C Q)
    {center : ℝ²}
    (hcenterSeed : center ∈ freshThirdCrossRowTwoShellSeed P Pρ C Q) :
    center ∈
        ({C.firstSource.1, C.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
      center ∈ freshThirdCrossRowFreshRemainder P Pρ C Q := by
  rw [freshThirdCrossRowTwoShellSeed, Finset.mem_union] at hcenterSeed
  rcases hcenterSeed with hsource | hfresh
  · left
    rwa [hexact.first_support_eq] at hsource
  · by_cases hsource :
        center ∈
          (H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support
    · left
      rwa [hexact.first_support_eq] at hsource
    · right
      exact Finset.mem_sdiff.mpr ⟨hfresh, hsource⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-level finite ingress for the equal-center FreshThird arm.

Global minimality pins one center among six possibilities: four named source
points plus an anonymous fresh remainder of cardinality two.  The same center
retains the universal positive-radius multiplicity bound and the full
selected-row escape dichotomy, so a finite checker need not choose a favorable
row existentially. -/
theorem exists_freshThirdEqualCenter_pinnedCenter_sixWayIngress
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (overlap_eq :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ center : ℝ²,
      (center ∈
          ({C.firstSource.1, C.secondSource.1,
            Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
        center ∈ freshThirdCrossRowFreshRemainder P Pρ C Q) ∧
      ({C.firstSource.1, C.secondSource.1,
        Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 4 ∧
      (freshThirdCrossRowFreshRemainder P Pρ C Q).card = 2 ∧
      Disjoint
        ({C.firstSource.1, C.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²)
        (freshThirdCrossRowFreshRemainder P Pρ C Q) ∧
      center ≠ H.centerAt C.firstSource.1 C.firstSource.2 ∧
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
      (∀ shellRadius : ℝ,
        0 < shellRadius →
          ((SelectedClass D.A center shellRadius) ∩
              freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3) ∧
      ∀ K : SelectedFourClass D.A center,
        ∀ z : ℝ²,
          ∀ hzK : z ∈ K.support,
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C Q →
              ((center = H.centerAt z (K.support_subset_A hzK) ∧
                  K.support =
                    (H.selectedAt z
                      (K.support_subset_A hzK)).toCriticalFourShell.support ∧
                  ¬ FullyDeletionRobustAt D center) ∨
                (center ≠ H.centerAt z (K.support_subset_A hzK) ∧
                  (K.support ∩
                    (H.selectedAt z
                      (K.support_subset_A hzK)).toCriticalFourShell.support).card ≤ 2)) := by
  have hexact : FreshThirdEqualCenterExactFourRow P Pρ C Q :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hremainderCard :
      (freshThirdCrossRowFreshRemainder P Pρ C Q).card = 2 :=
    freshThirdCrossRowFreshRemainder_card_eq_two P Pρ C Q overlap_eq
  have hnamedCard :
      ({C.firstSource.1, C.secondSource.1,
        Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 4 := by
    rw [← hexact.first_support_eq]
    exact
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support_card
  have hnamedDisjointRemainder :
      Disjoint
        ({C.firstSource.1, C.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²)
        (freshThirdCrossRowFreshRemainder P Pρ C Q) := by
    rw [freshThirdCrossRowFreshRemainder, ← hexact.first_support_eq]
    exact Finset.disjoint_sdiff
  rcases
      exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy
        (P := P) (Pρ := Pρ) (T := T) C Q overlap_eq with
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh, hmult, hescape⟩
  exact
    ⟨center,
      freshThirdEqualCenter_seed_mem_named_or_freshRemainder
        P Pρ C Q hexact hcenterSeed,
      hnamedCard, hremainderCard, hnamedDisjointRemainder,
      hcenterNeSource, hcenterNeFresh, hmult, hescape⟩

namespace FreshThirdTwoCapSourceObstruction

/-- The normalized two-source packet contains two distinct new centers on the
fresh pair's perpendicular bisector.  The stronger equal-blocker/all-endpoint-
omission constructor intentionally does not erase into this generic case. -/
def HasDistinctCrossRows :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowHit P Pρ C.firstSource Q ∧
        FreshThirdCrossRowHit P Pρ C.secondSource Q ∧
        H.centerAt C.firstSource.1 C.firstSource.2 ≠
          H.centerAt C.secondSource.1 C.secondSource.2
  | .sameBlockerAllEndpointOmission .. => False

/-- Positive residual interface left after the checked three-center arm.  The
all-endpoint-omission constructor keeps all of its stronger fields in
`obstruction`; the proposition merely marks that it is already a residual
constructor rather than a generic normalized packet. -/
def IsResidual :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ =>
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
  | .sameBlockerAllEndpointOmission .. => True

/-- Constructor-level positive residual packet consumed by the load-bearing
leaf.  Unlike `IsResidual`, the normalized arm has already converted failed
cross-row hits into equal-blocker or source-row-omission data. -/
def ResidualCase :
    FreshThirdTwoCapSourceObstruction P Pρ → Prop
  | .normalized C Q _ _ => FreshThirdNormalizedResidualCase P Pρ C Q
  | .sameBlockerAllEndpointOmission .. => True

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Convert the negative guard used by the coordinator into the explicit
three-arm residual normal form. -/
theorem isResidual_of_not_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : ¬ obstruction.HasDistinctCrossRows) :
    obstruction.IsResidual := by
  cases obstruction with
  | normalized C Q _ _ =>
      by_cases hfirst :
          FreshThirdCrossRowHit P Pρ C.firstSource Q
      · by_cases hsecond :
            FreshThirdCrossRowHit P Pρ C.secondSource Q
        · by_cases hcenters :
              H.centerAt C.firstSource.1 C.firstSource.2 =
                H.centerAt C.secondSource.1 C.secondSource.2
          · exact Or.inr (Or.inr hcenters)
          · exact (hrows ⟨hfirst, hsecond, hcenters⟩).elim
        · exact Or.inr (Or.inl hsecond)
      · exact Or.inl hfirst
  | sameBlockerAllEndpointOmission => trivial

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Expose the strict residual as constructor-specific positive data before it
reaches the single load-bearing leaf. -/
theorem residualCase_of_isResidual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.IsResidual) :
    obstruction.ResidualCase := by
  cases obstruction with
  | normalized C Q firstInteraction secondInteraction =>
      exact freshThirdNormalizedResidualCase_of_crossRowResidual
        (P := P) (Pρ := Pρ) C Q firstInteraction secondInteraction hresidual
  | sameBlockerAllEndpointOmission => trivial

/-! This is the narrowed frontier left after consuming the canonical
equal-center/`oppIndex1` interaction.  The positive equal-center packet now
stores only distinct-cap or noncanonical same-cap interactions; the original
same-blocker and source-row-omission constructors are eliminated by the hit
hypotheses before this packet is built. -/
inductive FreshThirdNormalizedResidualRemainingCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
  | secondNonHit
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)
      (firstInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdNonCanonicalInteraction P Pρ C.secondSource Q)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Refine the broad residual packet to the remaining-case interface.  The
same-blocker, source-omission, and canonical-cap arms are discharged here;
the two genuinely noncanonical interaction shapes are retained. -/
private theorem freshThirdNormalizedResidualRemainingCase_of_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    FreshThirdNormalizedResidualRemainingCase P Pρ C Q := by
  have false_of_omission :
      ∀ (source : CriticalShellSystem.CarrierVertex D.A)
        (h : FreshThirdCrossRowHit P Pρ source Q)
        (deleted : CriticalShellSystem.CarrierVertex D.A)
        (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
        (deleted_not_mem :
          deleted.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support),
        False := by
    intro source h deleted deleted_eq deleted_not_mem
    rcases deleted_eq with rfl | rfl
    · exact deleted_not_mem h.2.1
    · exact deleted_not_mem h.2.2
  cases hresidual with
  | firstNonHit data => exact .firstNonHit data secondInteraction
  | secondNonHit data => exact .secondNonHit firstInteraction data
  | equalCrossRowCenters hfirst hsecond hcenters =>
      have closeCanonicalFirst :
          ∀ {capIndex : Fin 3},
            H.centerAt C.firstSource.1 C.firstSource.2 ∈
              S.capInteriorByIndex capIndex →
            (Q.source₁.1 ∈ S.capByIndex capIndex ∨
              Q.source₂.1 ∈ S.capByIndex capIndex) →
            capIndex = S.oppIndex1 → False := by
        intro capIndex sourceCenter_mem fiberSource_mem_cap hcapIndex
        exact
          false_of_freshThirdEqualCenter_sameCapOppIndex
            (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
            hfirst.2.1 hfirst.2.2 capIndex sourceCenter_mem
            fiberSource_mem_cap hcapIndex
      cases firstInteraction with
      | sameBlocker center_eq _ => exact False.elim (hfirst.1 center_eq)
      | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
          exact False.elim (false_of_omission C.firstSource hfirst deleted
            deleted_eq deleted_not_mem)
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          let firstNonCanonical :=
            FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
              centers_ne source₁_mem source₂_mem overlap_eq sourceCap freshCap
              sourceCenter_mem freshCenter_mem caps_ne
          cases secondInteraction with
          | sameBlocker center_eq _ => exact False.elim (hsecond.1 center_eq)
          | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
              exact False.elim (false_of_omission C.secondSource hsecond deleted
                deleted_eq deleted_not_mem)
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              exact .equalCrossRowCenters hfirst hsecond hcenters
                firstNonCanonical
                (.distinctBlockersDifferentCaps centers_ne' source₁_mem'
                  source₂_mem' overlap_eq' sourceCap' freshCap'
                  sourceCenter_mem' freshCenter_mem' caps_ne')
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' =>
              by_cases hcapIndex' : capIndex' = S.oppIndex1
              · exact False.elim <| closeCanonicalFirst
                  (by simpa [hcenters] using sourceCenter_mem')
                  fiberSource_mem_cap' hcapIndex'
              · exact .equalCrossRowCenters hfirst hsecond hcenters
                  firstNonCanonical
                  (.sameCapWithInternalFiberSource centers_ne' source₁_mem'
                    source₂_mem' overlap_eq' capIndex' sourceCenter_mem'
                    freshCenter_mem' fiberSource_mem_cap' hcapIndex')
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap =>
          by_cases hcapIndex : capIndex = S.oppIndex1
          · exact False.elim <| closeCanonicalFirst sourceCenter_mem
              fiberSource_mem_cap hcapIndex
          · let firstNonCanonical :=
              FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                centers_ne source₁_mem source₂_mem overlap_eq capIndex
                sourceCenter_mem freshCenter_mem fiberSource_mem_cap hcapIndex
            cases secondInteraction with
            | sameBlocker center_eq _ => exact False.elim (hsecond.1 center_eq)
            | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
                exact False.elim (false_of_omission C.secondSource hsecond deleted
                  deleted_eq deleted_not_mem)
            | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
                overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                caps_ne' =>
                have hsrc : capIndex = sourceCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : capIndex = freshCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact False.elim (caps_ne' (hsrc.symm.trans hfr))
            | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
                overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
                fiberSource_mem_cap' =>
                by_cases hcapIndex' : capIndex' = S.oppIndex1
                · exact False.elim <| closeCanonicalFirst
                    (by simpa [hcenters] using sourceCenter_mem')
                    fiberSource_mem_cap' hcapIndex'
                · exact .equalCrossRowCenters hfirst hsecond hcenters
                    firstNonCanonical
                    (.sameCapWithInternalFiberSource centers_ne' source₁_mem'
                      source₂_mem' overlap_eq' capIndex' sourceCenter_mem'
                      freshCenter_mem' fiberSource_mem_cap' hcapIndex')

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The positive three-center subcase of the obstruction is source-clean. -/
theorem false_of_hasDistinctCrossRows
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hrows : obstruction.HasDistinctCrossRows) :
    False := by
  cases obstruction with
  | normalized C Q _ _ =>
      exact
        false_of_two_freshThirdCrossRowHits_distinctCenters
          (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource
          hrows.1 hrows.2.1 hrows.2.2
  | sameBlockerAllEndpointOmission => exact hrows

end FreshThirdTwoCapSourceObstruction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The triple-shell escape is paired with the canonical global cover at the
escaped point.  This is a source-clean intermediate FreshThird packet: global
K4 supplies the escaping row, the critical-shell system supplies the
source-faithful cover and deletion obstruction, and distinct centers give the
exact two-circle overlap bound.  It is not yet a consumer-ready producer: the
existential seed membership does not identify which named source shell
supplies `center`, and the packet does not prove the corresponding source
endpoints lie in `K.support`.  Named seed-label transport, endpoint-support
facts, and ingress to a terminal consumer remain missing in addition to any
strict cyclic-order or cardinality argument that such a consumer may need. -/
theorem exists_freshThird_escape_with_sourceFaithful_cover
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈
        freshThirdCriticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            ∃ hzA : z ∈ D.A,
              z ∈ K.support ∧
                z ∉ freshThirdCriticalTripleShellSeed P Pρ source ∧
                ∃ i : Fin 3,
                  H.centerAt z hzA ∈ S.capInteriorByIndex i ∧
                  ¬ HasNEquidistantPointsAt 4
                    (D.A.erase z) (H.centerAt z hzA) ∧
                  ((center = H.centerAt z hzA ∧
                      K.support =
                        (H.selectedAt z hzA).toCriticalFourShell.support) ∨
                    (center ≠ H.centerAt z hzA ∧
                      (K.support ∩
                        (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      exists_freshThird_selectedRow_escape_tripleShellSeed
        (P := P) (Pρ := Pρ) (hlarge := L) source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) ⟨z, hzA⟩ with ⟨i, hi⟩
  have hzBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase z) (H.centerAt z hzA) :=
    H.no_qfree_at z hzA
  by_cases hcenters : center = H.centerAt z hzA
  · subst center
    refine ⟨H.centerAt z hzA, hcenter, K, z, hzA, hzK, hzOutside,
      i, hi, hzBlocked, ?_⟩
    exact Or.inl ⟨rfl, H.selectedFourClass_support_eq_shell z hzA K⟩
  · refine ⟨center, hcenter, K, z, hzA, hzK, hzOutside,
      i, hi, hzBlocked, Or.inr ⟨hcenters, ?_⟩⟩
    simpa [CriticalFourShell.toSelectedFourClass] using
      (SelectedFourClass.inter_card_le_two K
        (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass
        hcenters)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean multiplicity ingress for the two-collision producer.

The older three-hit theorem consumed the geometric residual immediately,
which made its apparent producer transitively depend on the FreshThird
contradiction it was supposed to feed.  This boundary stops before any
terminal: it exposes either a named cross-row hit, or the geometric residual
together with the independent cap-eight/global split.  Any later consumer can
now be audited against this proposition without importing a circular closer.
-/
theorem collisionRows_sourceCleanMultiplicityIngress
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    CollisionCrossHit P Pρ ∨
      (GeometricMultiplicityResidual P Pρ ∧
        TwoCollisionGlobalSplit P Pρ) := by
  classical
  have hglobalCapSplit : TwoCollisionGlobalSplit P Pρ :=
    hcapEightOrCross.imp
      (fun hcap =>
        exists_capSource_thirdCanonicalRow_omits_each_collisionPair
          P Pρ B.secondApex_robust hpairsDisjoint hcap)
      id
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  let a₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have homitted₁ : ∀ x, H.blockerVertex x ≠ apex₁ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H x apex₁.2
  have homitted₂ : ∀ x, H.blockerVertex x ≠ apex₂ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H x apex₂.2
  have homitted₃ : ∀ x, H.blockerVertex x ≠ apex₃ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H x apex₃.2
  have hapex₁₂ : apex₁ ≠ apex₂ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
        (by simpa [apex₁, apex₂] using congrArg Subtype.val h)
  have hapex₁₃ : apex₁ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1).symm
        (by simpa [apex₁, apex₃] using congrArg Subtype.val h)
  have hapex₂₃ : apex₂ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2).symm
        (by simpa [apex₂, apex₃] using congrArg Subtype.val h)
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  have hvalues : H.blockerVertex a₁ ≠ H.blockerVertex b₁ := by
    intro h
    apply hblockersNe
    exact congrArg Subtype.val h.symm
  have hblockerMultiplicity :=
    third_fiber_or_larger_known_fiber_of_three_omissions
      H.blockerVertex homitted₁ homitted₂ homitted₃
      hapex₁₂ hapex₁₃ hapex₂₃ hfa hfb hvalues
  rcases collisionCrossHit_or_geometricMultiplicity
      P Pρ hblockerMultiplicity with hcross | hresidual
  · exact Or.inl hcross
  · exact Or.inr ⟨hresidual, hglobalCapSplit⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- Four omitted blocker values turn the three named collision fibers
`P`, `Pρ`, and `Q` into a finite-map multiplicity alternative.

The fourth omitted value comes from a fully deletion-robust carrier center.
Its separation from the three robust apices is the only conditional geometric
ingress.  The conclusion does not claim a contradiction: it exposes either a
genuinely new blocker fiber or a third source in one of the three named
fibers. -/
theorem freshThird_fourOmissionBlockerMultiplicityIngress
    (Q : FreshThirdBlockerFiber P Pρ)
    {center : ℝ²}
    (hcenterA : center ∈ D.A)
    (hrobust : FullyDeletionRobustAt D center)
    (hcenterNeOpp₁ : center ≠ S.oppApex1)
    (hcenterNeOpp₂ : center ≠ S.oppApex2)
    (hcenterNeSurplus : center ≠ S.surplusApex) :
    (∃ x y, x ≠ y ∧
        H.blockerVertex x = H.blockerVertex y ∧
        H.blockerVertex x ≠
          H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠
          H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠ H.blockerVertex Q.source₁) ∨
      (∃ x, x ≠ ⟨P.source₁, P.source₁_mem_A⟩ ∧
        x ≠ ⟨P.source₂, P.source₂_mem_A⟩ ∧
        H.blockerVertex x =
          H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩) ∨
      (∃ x, x ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        x ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩ ∧
        H.blockerVertex x =
          H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) ∨
      ∃ x, x ≠ Q.source₁ ∧ x ≠ Q.source₂ ∧
        H.blockerVertex x = H.blockerVertex Q.source₁ := by
  classical
  let apex₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let apex₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, by
      simpa using S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let apex₃ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.surplusApex, by
      simpa using S.oppositeVertexByIndex_mem S.surplusIdx⟩
  let centerVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨center, hcenterA⟩
  let a₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have homitted₁ : ∀ x, H.blockerVertex x ≠ apex₁ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
      H x apex₁.2
  have homitted₂ : ∀ x, H.blockerVertex x ≠ apex₂ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      H x apex₂.2
  have homitted₃ : ∀ x, H.blockerVertex x ≠ apex₃ := by
    intro x
    exact FullyDeletionRobustAt.blockerVertex_ne
      (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
      H x apex₃.2
  have homitted₄ : ∀ x, H.blockerVertex x ≠ centerVertex := by
    intro x
    exact hrobust.blockerVertex_ne H x hcenterA
  have hapex₁₂ : apex₁ ≠ apex₂ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
        (by simpa [apex₁, apex₂] using congrArg Subtype.val h)
  have hapex₁₃ : apex₁ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1).symm
        (by simpa [apex₁, apex₃] using congrArg Subtype.val h)
  have hapex₂₃ : apex₂ ≠ apex₃ := by
    intro h
    exact
      (S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2).symm
        (by simpa [apex₂, apex₃] using congrArg Subtype.val h)
  have hapex₁₄ : apex₁ ≠ centerVertex := by
    intro h
    exact hcenterNeOpp₁
      (by simpa [apex₁, centerVertex] using congrArg Subtype.val h.symm)
  have hapex₂₄ : apex₂ ≠ centerVertex := by
    intro h
    exact hcenterNeOpp₂
      (by simpa [apex₂, centerVertex] using congrArg Subtype.val h.symm)
  have hapex₃₄ : apex₃ ≠ centerVertex := by
    intro h
    exact hcenterNeSurplus
      (by simpa [apex₃, centerVertex] using congrArg Subtype.val h.symm)
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  have hfc : H.blockerVertex Q.source₁ = H.blockerVertex Q.source₂ :=
    Q.blockers_eq
  have hvaluesAB : H.blockerVertex a₁ ≠ H.blockerVertex b₁ := by
    intro h
    apply hblockersNe
    exact congrArg Subtype.val h.symm
  have hvaluesAC : H.blockerVertex a₁ ≠ H.blockerVertex Q.source₁ :=
    Ne.symm Q.blocker_ne_first
  have hvaluesBC : H.blockerVertex b₁ ≠ H.blockerVertex Q.source₁ :=
    Ne.symm Q.blocker_ne_second
  simpa [a₁, a₂, b₁, b₂] using
    (fourth_fiber_or_larger_known_fiber_of_four_omissions
      H.blockerVertex homitted₁ homitted₂ homitted₃ homitted₄
      hapex₁₂ hapex₁₃ hapex₁₄ hapex₂₃ hapex₂₄ hapex₃₄
      hfa hfb hfc hvaluesAB hvaluesAC hvaluesBC)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A cap-wide alignment producer immediately kills a first-source non-hit.
This adapter is intentionally source-clean: it consumes only the positive
alignment packet and the non-hit constructor, leaving the cap-wide producer
itself as the single mathematical bridge still required by the residual. -/
theorem false_of_freshThird_firstNonHit_of_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Symmetric cap-wide alignment adapter for a second-source non-hit. -/
theorem false_of_freshThird_secondNonHit_of_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A non-hit constructor completely classifies its named source row relative
to the canonical Q row: their blocker centers agree, or the centers are
distinct and the exact-four supports overlap in at most two points.  Thus a
three-overlap witness for the first-non-hit residual must come from a newly
produced row rather than from the non-hit row itself. -/
theorem freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) :
    H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∨
      (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2) := by
  cases data with
  | sameBlocker center_eq _ => exact Or.inl center_eq
  | sourceRowOmission deleted deleted_eq _ deletion_survives =>
      have hne :
          H.centerAt source.1 source.2 ≠
            H.centerAt Q.source₁.1 Q.source₁.2 := by
        rcases deleted_eq with rfl | rfl
        · have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₁.2 deletion_survives
          intro h
          exact hblockerNe h.symm
        · have hQCenters :
              H.centerAt Q.source₁.1 Q.source₁.2 =
                H.centerAt Q.source₂.1 Q.source₂.2 :=
            congrArg Subtype.val Q.blockers_eq
          have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₂.2 deletion_survives
          intro h
          exact hblockerNe (hQCenters.symm.trans h.symm)
      exact Or.inr ⟨hne, SelectedFourClass.inter_card_le_two
        (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass hne⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every positive cap-source interaction has the same local boundary as a
non-hit row: it is the canonical Q blocker row, or its distinct-center
exact-four support meets the Q support in at most two points.  The geometric
interaction constructors in fact record the exact two-point intersection. -/
theorem freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction : FreshThirdCapSourceInteraction P Pρ source Q) :
    H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∨
      (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2) := by
  cases interaction with
  | sameBlocker center_eq _ => exact Or.inl center_eq
  | sourceRowOmission deleted deleted_eq _ deletion_survives =>
      have hne :
          H.centerAt source.1 source.2 ≠
            H.centerAt Q.source₁.1 Q.source₁.2 := by
        rcases deleted_eq with rfl | rfl
        · have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₁.2 deletion_survives
          intro h
          exact hblockerNe h.symm
        · have hQCenters :
              H.centerAt Q.source₁.1 Q.source₁.2 =
                H.centerAt Q.source₂.1 Q.source₂.2 :=
            congrArg Subtype.val Q.blockers_eq
          have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₂.2 deletion_survives
          intro h
          exact hblockerNe (hQCenters.symm.trans h.symm)
      exact Or.inr ⟨hne, SelectedFourClass.inter_card_le_two
        (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass hne⟩
  | distinctBlockersDifferentCaps centers_ne _ _ overlap_eq _ _ _ _ _ =>
      refine Or.inr ⟨centers_ne, ?_⟩
      rw [overlap_eq]
      have hvals : Q.source₁.1 ≠ Q.source₂.1 := by
        intro h
        exact Q.sources_ne (Subtype.ext h)
      simp [hvals]
  | sameCapWithInternalFiberSource centers_ne _ _ overlap_eq _ _ _ _ =>
      refine Or.inr ⟨centers_ne, ?_⟩
      rw [overlap_eq]
      have hvals : Q.source₁.1 ≠ Q.source₂.1 := by
        intro h
        exact Q.sources_ne (Subtype.ext h)
      simp [hvals]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every carrier source lying in the canonical `Q` row either has the same
actual blocker as `Q`, or omits another point of that row and therefore
survives that point's deletion at its own blocker.

This is the cardinality-independent row-relocation step behind the
FirstNonHit search.  Iterating it can only stop at the canonical blocker
fiber; any closure of that terminal fiber needs additional global geometry. -/
theorem freshThird_qRow_member_sameBlocker_or_omissionSuccessor
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceQ :
      source.1 ∈
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support) :
    H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∨
      ∃ w ∈
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support,
        w ≠ source.1 ∧
          HasNEquidistantPointsAt 4 (D.A.erase w)
            (H.centerAt source.1 source.2) := by
  by_cases hcenter :
      H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2
  · exact Or.inl hcenter
  · right
    let Ksource :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    have hinter : (Ksource.support ∩ KQ.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two Ksource KQ hcenter
    have hexists : ∃ w ∈ KQ.support, w ∉ Ksource.support := by
      by_contra hnone
      push_neg at hnone
      have hsubset : KQ.support ⊆ Ksource.support := by
        intro w hw
        exact hnone w hw
      have hinterEq : Ksource.support ∩ KQ.support = KQ.support :=
        Finset.inter_eq_right.mpr hsubset
      rw [hinterEq, KQ.support_card] at hinter
      omega
    rcases hexists with ⟨w, hwQ, hwSource⟩
    refine ⟨w, hwQ, ?_, ?_⟩
    · intro hws
      subst w
      exact hwSource
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support
    · exact
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mpr hwSource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A row at a blocker distinct from the canonical `Q` blocker omits at least
two points of the exact `Q` row.  Each omitted point is a genuine deletion
successor at the new blocker.

This is the sharp source-clean relocation bound: two distinct circles meet in
at most two carrier points, so two of the four `Q`-row points remain available
for the next deletion step. -/
theorem freshThird_qRow_distinctBlocker_has_two_omissionSuccessors
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenter :
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2) :
    2 ≤
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support \
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support).card ∧
      ∀ w ∈
          (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support \
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support,
        w ≠ source.1 ∧
          HasNEquidistantPointsAt 4 (D.A.erase w)
            (H.centerAt source.1 source.2) := by
  let Ksource :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hinter : (Ksource.support ∩ KQ.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Ksource KQ hcenter
  have hinter' : (KQ.support ∩ Ksource.support).card ≤ 2 := by
    simpa [Finset.inter_comm] using hinter
  have hsplit := Finset.card_sdiff_add_card_inter KQ.support Ksource.support
  have htwo : 2 ≤ (KQ.support \ Ksource.support).card := by
    rw [KQ.support_card] at hsplit
    omega
  constructor
  · exact htwo
  · intro w hw
    have hw' := Finset.mem_sdiff.mp hw
    constructor
    · intro hws
      subst w
      exact hw'.2
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support
    · exact
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mpr hw'.2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The common-radius four-source packet has the opposite incidence polarity
omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem firstNonHit_exists_repeated_mem_of_card_lt_sum
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (W : Finset α) (Q : Finset β) (O : α → Finset β)
    (hsub : ∀ z ∈ W, O z ⊆ Q)
    (hcard : Q.card < ∑ z ∈ W, (O z).card) :
    ∃ w ∈ Q, ∃ z₁ ∈ W, ∃ z₂ ∈ W,
      z₁ ≠ z₂ ∧ w ∈ O z₁ ∧ w ∈ O z₂ := by
  let I : Finset (Σ _ : α, β) := W.sigma O
  have hIcard : Q.card < I.card := by
    simpa only [I, Finset.card_sigma] using hcard
  have hmap : Set.MapsTo (fun x : Σ _ : α, β => x.2) I Q := by
    intro x hx
    have hx' := Finset.mem_sigma.mp hx
    exact hsub x.1 hx'.1 hx'.2
  obtain ⟨x, hxI, y, hyI, hxy, hproj⟩ :=
    Finset.exists_ne_map_eq_of_card_lt_of_maps_to
      (s := I) (t := Q) (f := fun x : Σ _ : α, β => x.2)
      hIcard hmap
  have hx := Finset.mem_sigma.mp hxI
  have hy := Finset.mem_sigma.mp hyI
  have hfirst : x.1 ≠ y.1 := by
    intro hfirst
    apply hxy
    cases x
    cases y
    simp only at hfirst hproj ⊢
    subst hfirst
    subst hproj
    rfl
  exact
    ⟨x.2, hsub x.1 hx.1 hx.2, x.1, hx.1, y.1, hy.1,
      hfirst, hx.2, hproj ▸ hy.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem exists_two_repeated_mem_of_four_two
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (W : Finset α) (Q : Finset β) (O : α → Finset β)
    (hW : W.card = 4) (hQ : Q.card = 4)
    (hsub : ∀ z ∈ W, O z ⊆ Q)
    (hcard : ∀ z ∈ W, 2 ≤ (O z).card) :
    ∃ w₁ ∈ Q, ∃ w₂ ∈ Q, w₁ ≠ w₂ ∧
      (∃ z₁ ∈ W, ∃ z₂ ∈ W,
        z₁ ≠ z₂ ∧ w₁ ∈ O z₁ ∧ w₁ ∈ O z₂) ∧
      (∃ z₁ ∈ W, ∃ z₂ ∈ W,
        z₁ ≠ z₂ ∧ w₂ ∈ O z₁ ∧ w₂ ∈ O z₂) := by
  have hsum : W.card * 2 ≤ ∑ z ∈ W, (O z).card := by
    simpa only [Finset.sum_const, smul_eq_mul] using
      Finset.sum_le_sum (fun z hz => hcard z hz)
  have hlt : Q.card < ∑ z ∈ W, (O z).card := by omega
  obtain ⟨w₁, hw₁Q, z₁, hz₁W, z₂, hz₂W, hzNe, hw₁z₁, hw₁z₂⟩ :=
    firstNonHit_exists_repeated_mem_of_card_lt_sum W Q O hsub hlt
  let O' : α → Finset β := fun z => (O z).erase w₁
  have hsub' : ∀ z ∈ W, O' z ⊆ Q.erase w₁ := by
    intro z hz x hx
    have hx' := Finset.mem_erase.mp hx
    exact Finset.mem_erase.mpr ⟨hx'.1, hsub z hz hx'.2⟩
  have hcard' : ∀ z ∈ W, 1 ≤ (O' z).card := by
    intro z hz
    have hzCard := hcard z hz
    by_cases hw₁ : w₁ ∈ O z
    · simp only [O', Finset.card_erase_of_mem hw₁]
      omega
    · simp only [O', Finset.erase_eq_self.mpr hw₁]
      omega
  have hsum' : W.card ≤ ∑ z ∈ W, (O' z).card := by
    simpa only [Finset.sum_const, smul_eq_mul, mul_one] using
      Finset.sum_le_sum (fun z hz => hcard' z hz)
  have hQerase : (Q.erase w₁).card = 3 := by
    rw [Finset.card_erase_of_mem hw₁Q, hQ]
  have hlt' : (Q.erase w₁).card < ∑ z ∈ W, (O' z).card := by omega
  obtain ⟨w₂, hw₂Q, z₃, hz₃W, z₄, hz₄W, hz34Ne, hw₂z₃, hw₂z₄⟩ :=
    firstNonHit_exists_repeated_mem_of_card_lt_sum W (Q.erase w₁) O' hsub' hlt'
  have hw₂Q' := Finset.mem_erase.mp hw₂Q
  exact
    ⟨w₁, hw₁Q, w₂, hw₂Q'.2, hw₂Q'.1.symm,
      ⟨z₁, hz₁W, z₂, hz₂W, hzNe, hw₁z₁, hw₁z₂⟩,
      ⟨z₃, hz₃W, z₄, hz₄W, hz34Ne,
        (Finset.mem_erase.mp hw₂z₃).2,
        (Finset.mem_erase.mp hw₂z₄).2⟩⟩

from the three-point-overlap terminal.  Every strict-cap source in the packet
lies off the `Q` row, survives deletion at the `Q` blocker, and has an actual
row omitting at least two `Q`-row points.  Those omitted points in turn survive
deletion at the source's actual blocker.

Thus none of the four packet sources can itself be the distinct-center row
meeting the `Q` row in at least three points.  Any such terminal producer must
introduce another center or use additional global synchronization beyond the
present `W4` ingress. -/
theorem
    freshThird_commonRadius_sameBlocker_exists_four_sources_with_two_qRow_omissions
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
    ∃ W : Finset ℝ²,
      W.card = 4 ∧
      ∀ z ∈ W,
        z ∈ S.capInteriorByIndex S.oppIndex1 ∧
        z ∉ (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∧
        ∃ hzA : z ∈ D.A,
          H.centerAt z hzA ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
          ((H.selectedAt z hzA).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card ≤ 2 ∧
          HasNEquidistantPointsAt 4 (D.A.erase z)
            (H.centerAt Q.source₁.1 Q.source₁.2) ∧
          2 ≤
            ((H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support \
              (H.selectedAt z hzA).toCriticalFourShell.support).card ∧
          ∀ w ∈
              (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.support \
                (H.selectedAt z hzA).toCriticalFourShell.support,
            w ≠ z ∧
              HasNEquidistantPointsAt 4 (D.A.erase w)
                (H.centerAt z hzA) := by
  rcases
      freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell_with_deletion_survivals
        (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
        (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport with
    ⟨W, hWcard, hW⟩
  refine ⟨W, hWcard, ?_⟩
  intro z hzW
  rcases hW z hzW with
    ⟨hzCap, hzOutside, hzA, hzCenter, hzSurvives⟩
  have hoverlap :
      ((H.selectedAt z hzA).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two
      (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass hzCenter
  have hrelocation :=
    freshThird_qRow_distinctBlocker_has_two_omissionSuccessors
      (P := P) (Pρ := Pρ) (H := H) Q ⟨z, hzA⟩ hzCenter
  exact
    ⟨hzCap, hzOutside, hzA, hzCenter, hoverlap, hzSurvives,
      hrelocation.1, hrelocation.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact finite blocker boundary for a `Q` row: either its actual
omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Among the four strict-cap sources supplied by the common-radius
same-blocker packet, two distinct points of the exact `Q` row are each omitted
by the actual rows of two distinct sources.  Each omission is accompanied by
the corresponding deletion-survival fact at that source's actual blocker.

This is the first cardinality-independent synchronization consequence of the
`W4` packet.  It is not yet the three-incidence terminal: its polarity is still
omission/survival rather than membership/blocking. -/
theorem
    freshThird_commonRadius_sameBlocker_exists_two_repeated_qRow_omissionSuccessors
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
    ∃ w₁ ∈ (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support,
      ∃ w₂ ∈ (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support,
        w₁ ≠ w₂ ∧
          (∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
            source₁.1 ≠ source₂.1 ∧
            source₁.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
            source₂.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
            H.centerAt source₁.1 source₁.2 ≠
              H.centerAt Q.source₁.1 Q.source₁.2 ∧
            H.centerAt source₂.1 source₂.2 ≠
              H.centerAt Q.source₁.1 Q.source₁.2 ∧
            w₁ ∉ (H.selectedAt source₁.1
              source₁.2).toCriticalFourShell.support ∧
            w₁ ∉ (H.selectedAt source₂.1
              source₂.2).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase w₁)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase w₁)
              (H.centerAt source₂.1 source₂.2)) ∧
          (∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
            source₁.1 ≠ source₂.1 ∧
            source₁.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
            source₂.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
            H.centerAt source₁.1 source₁.2 ≠
              H.centerAt Q.source₁.1 Q.source₁.2 ∧
            H.centerAt source₂.1 source₂.2 ≠
              H.centerAt Q.source₁.1 Q.source₁.2 ∧
            w₂ ∉ (H.selectedAt source₁.1
              source₁.2).toCriticalFourShell.support ∧
            w₂ ∉ (H.selectedAt source₂.1
              source₂.2).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase w₂)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase w₂)
              (H.centerAt source₂.1 source₂.2)) := by
  classical
  rcases
      freshThird_commonRadius_sameBlocker_exists_four_sources_with_two_qRow_omissions
        (D := D) (S := S) (H := H) (P := P) (Pρ := Pρ)
        (T := T) (C := C) (Q := Q) hfirstSupport hsecondSupport with
    ⟨W, hWcard, hW⟩
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.support
  let source : ↥W → CriticalShellSystem.CarrierVertex D.A := fun z =>
    ⟨z.1, Classical.choose ((hW z.1 z.2).2.2)⟩
  let O : ↥W → Finset ℝ² := fun z =>
    KQ \ (H.selectedAt (source z).1
      (source z).2).toCriticalFourShell.support
  have hsourceData (z : ↥W) :
      H.centerAt (source z).1 (source z).2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt (source z).1
            (source z).2).toCriticalFourShell.support ∩ KQ).card ≤ 2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1)
          (H.centerAt Q.source₁.1 Q.source₁.2) ∧
        2 ≤ (O z).card ∧
        ∀ w ∈ O z,
          w ≠ z.1 ∧
            HasNEquidistantPointsAt 4 (D.A.erase w)
              (H.centerAt (source z).1 (source z).2) := by
    simpa only [source, O, KQ] using
      Classical.choose_spec ((hW z.1 z.2).2.2)
  have hUnivCard : (Finset.univ : Finset ↥W).card = 4 := by
    simpa using hWcard
  have hKQcard : KQ.card = 4 := by
    simpa only [KQ] using
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support_card
  have hsub : ∀ z ∈ (Finset.univ : Finset ↥W), O z ⊆ KQ := by
    intro z _
    exact Finset.sdiff_subset
  have hOcard : ∀ z ∈ (Finset.univ : Finset ↥W), 2 ≤ (O z).card := by
    intro z _
    exact (hsourceData z).2.2.2.1
  obtain
      ⟨w₁, hw₁KQ, w₂, hw₂KQ, hwNe,
        ⟨z₁, _, z₂, _, hzNe, hw₁z₁, hw₁z₂⟩,
        ⟨z₃, _, z₄, _, hz34Ne, hw₂z₃, hw₂z₄⟩⟩ :=
    exists_two_repeated_mem_of_four_two
      (Finset.univ : Finset ↥W) KQ O hUnivCard hKQcard hsub hOcard
  have packageRepeated
      (w : ℝ²) {x y : ↥W} (hxy : x ≠ y)
      (hwx : w ∈ O x) (hwy : w ∈ O y) :
      ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
        source₁.1 ≠ source₂.1 ∧
        source₁.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
        source₂.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
        H.centerAt source₁.1 source₁.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        H.centerAt source₂.1 source₂.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        w ∉ (H.selectedAt source₁.1
          source₁.2).toCriticalFourShell.support ∧
        w ∉ (H.selectedAt source₂.1
          source₂.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source₂.1 source₂.2) := by
    have hvalues : x.1 ≠ y.1 := by
      intro hEq
      exact hxy (Subtype.ext hEq)
    have hxCap := (hW x.1 x.2).1
    have hyCap := (hW y.1 y.2).1
    have hwx' := Finset.mem_sdiff.mp hwx
    have hwy' := Finset.mem_sdiff.mp hwy
    exact
      ⟨source x, source y, hvalues, hxCap, hyCap,
        (hsourceData x).1, (hsourceData y).1,
        hwx'.2, hwy'.2,
        ((hsourceData x).2.2.2.2 w hwx).2,
        ((hsourceData y).2.2.2.2 w hwy).2⟩
  exact
    ⟨w₁, by simpa only [KQ] using hw₁KQ,
      w₂, by simpa only [KQ] using hw₂KQ, hwNe,
      packageRepeated w₁ hzNe hw₁z₁ hw₁z₂,
      packageRepeated w₂ hz34Ne hw₂z₃ hw₂z₄⟩

blocker fiber has the maximal four sources and therefore has exactly the
selected `Q` support as carrier image, or one support point is sourced at a
distinct blocker and supplies the two deletion successors above.

This is a cardinality-independent boundary theorem, not a closure theorem.
It keeps the missing source identity explicit instead of identifying an
anonymous support point with a named `Q` source. -/
theorem freshThird_qRow_exact_blocker_boundary
    (Q : FreshThirdBlockerFiber P Pρ) :
    ((ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 4 ∧
        (ATailSurvivalCover.actualBlockerFiber H Q.source₁).image
            (fun source => source.1) =
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support) ∨
      ∃ source : CriticalShellSystem.CarrierVertex D.A,
        source.1 ∈
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support ∧
          H.centerAt source.1 source.2 ≠
            H.centerAt Q.source₁.1 Q.source₁.2 ∧
          2 ≤
            ((H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support \
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support).card ∧
          ∀ w ∈
              (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.support \
                (H.selectedAt source.1
                  source.2).toCriticalFourShell.support,
            w ≠ source.1 ∧
              HasNEquidistantPointsAt 4 (D.A.erase w)
                (H.centerAt source.1 source.2) := by
  classical
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell
  let fiber := ATailSurvivalCover.actualBlockerFiber H Q.source₁
  by_cases hcard : fiber.card = 4
  · exact Or.inl ⟨hcard, by
      exact
        ATailSurvivalCover.actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
          H Q.source₁ hcard⟩
  · right
    have hfiberle : fiber.card ≤ 4 := by
      exact ATailSurvivalCover.actualBlockerFiber_card_le_four H Q.source₁
    have hfiberlt : fiber.card < 4 := by omega
    have himage_subset :
        fiber.image (fun source => source.1) ⊆ KQ.support := by
      intro z hz
      rcases Finset.mem_image.mp hz with ⟨source, hsource, rfl⟩
      have hblocker := (Finset.mem_filter.mp hsource).2
      have hcenter :
          H.centerAt source.1 source.2 =
            H.centerAt Q.source₁.1 Q.source₁.2 :=
        congrArg Subtype.val hblocker
      have hsupport :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          H source.2 Q.source₁.2 hcenter
      rw [← hsupport]
      exact
        (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
    have hex :
        ∃ z ∈ KQ.support,
          z ∉ fiber.image (fun source => source.1) := by
      by_contra hno
      have hsup :
          KQ.support ⊆ fiber.image (fun source => source.1) := by
        intro z hz
        by_contra hz'
        exact hno ⟨z, hz, hz'⟩
      have heq :
          KQ.support = fiber.image (fun source => source.1) :=
        Finset.Subset.antisymm hsup himage_subset
      have himage_card :
          (fiber.image (fun source => source.1)).card = fiber.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      have hcard_eq : KQ.support.card = fiber.card := by
        rw [heq]
        exact himage_card
      rw [KQ.support_card] at hcard_eq
      omega
    rcases hex with ⟨z, hzKQ, hzImage⟩
    let source : CriticalShellSystem.CarrierVertex D.A :=
      ⟨z, KQ.support_subset_A hzKQ⟩
    have hcenter :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 := by
      intro hEq
      have hsourceFiber : source ∈ fiber := by
        apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_univ source, ?_⟩
        exact Subtype.ext hEq
      have hzImage' :
          z ∈ fiber.image (fun source => source.1) := by
        exact Finset.mem_image.mpr ⟨source, hsourceFiber, rfl⟩
      exact hzImage hzImage'
    have hsuccessors :=
      freshThird_qRow_distinctBlocker_has_two_omissionSuccessors
        (P := P) (Pρ := Pρ) Q source hcenter
    exact ⟨source, hzKQ, hcenter, hsuccessors.1, hsuccessors.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the actual-blocker fiber saturates a selected Q row, deleting any
point of that row destroys K4 at the common Q blocker center.

This is the strongest immediate source-clean consequence of the saturated
arm of `freshThird_qRow_exact_blocker_boundary`.  It deliberately retains
the common-center conclusion: obtaining a blocker center distinct from the Q
center is the remaining geometric relocation step. -/
theorem freshThird_qRow_saturated_deletions_blocked_at_qCenter
    (Q : FreshThirdBlockerFiber P Pρ)
    (himage :
      (ATailSurvivalCover.actualBlockerFiber H Q.source₁).image
          (fun source => source.1) =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support) :
    ∀ w ∈
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt Q.source₁.1 Q.source₁.2) := by
  classical
  intro w hw
  have hwImage :
      w ∈
        (ATailSurvivalCover.actualBlockerFiber H Q.source₁).image
          (fun source => source.1) := by
    rw [himage]
    exact hw
  rcases Finset.mem_image.mp hwImage with
    ⟨source, hsourceFiber, hsourceVal⟩
  have hblockerVertex := (Finset.mem_filter.mp hsourceFiber).2
  have hcenter :
      H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 :=
    congrArg Subtype.val hblockerVertex
  subst w
  intro hK4
  apply H.no_qfree_at source.1 source.2
  rw [hcenter]
  exact hK4

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the two canonical cap sources share the fresh Q blocker and the four
named carrier vertices are distinct, then they exhaust that blocker fiber and
their carrier points are exactly the Q selected support.

The cardinality premise is intentionally explicit: the FreshThird packets do
not exclude a canonical source from being one of the two Q sources.  In those
aliasing cases the named set has cardinality two or three, so saturation cannot
be claimed. -/
theorem freshThird_sameBlocker_namedSources_saturate_of_card_eq_four
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hsecond :
      H.centerAt C.secondSource.1 C.secondSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hcard :
      ({C.firstSource, C.secondSource, Q.source₁, Q.source₂} :
        Finset (CriticalShellSystem.CarrierVertex D.A)).card = 4) :
    ATailSurvivalCover.actualBlockerFiber H Q.source₁ =
        {C.firstSource, C.secondSource, Q.source₁, Q.source₂} ∧
      ({C.firstSource, C.secondSource, Q.source₁, Q.source₂} :
          Finset (CriticalShellSystem.CarrierVertex D.A)).image
          (fun source => source.1) =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support := by
  classical
  let V : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    {C.firstSource, C.secondSource, Q.source₁, Q.source₂}
  have hQcenters :
      H.centerAt Q.source₂.1 Q.source₂.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 :=
    (congrArg Subtype.val Q.blockers_eq).symm
  have hsubset :
      V ⊆ ATailSurvivalCover.actualBlockerFiber H Q.source₁ := by
    intro source hsource
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, Subtype.ext ?_⟩
    simp only [V, Finset.mem_insert, Finset.mem_singleton] at hsource
    rcases hsource with rfl | rfl | rfl | rfl
    · exact hfirst
    · exact hsecond
    · rfl
    · exact hQcenters
  have hfiberLe :
      (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card ≤ 4 :=
    ATailSurvivalCover.actualBlockerFiber_card_le_four H Q.source₁
  have hVcard : V.card = 4 := by simpa [V] using hcard
  have hfiberCard :
      (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 4 := by
    have hVle := Finset.card_le_card hsubset
    omega
  have hVeq :
      V = ATailSurvivalCover.actualBlockerFiber H Q.source₁ :=
    Finset.eq_of_subset_of_card_le hsubset (by omega)
  constructor
  · simpa [V] using hVeq.symm
  · change V.image (fun source => source.1) = _
    rw [hVeq]
    exact
      ATailSurvivalCover.actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
        H Q.source₁ hfiberCard

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If both canonical cap-source rows are the canonical Q row, then that row
contains two distinct points of the strict first cap.  Unlike the blocker-fiber
saturation theorem above, this conclusion does not require excluding aliases
between a canonical source and a Q source. -/
theorem freshThird_sameBlocker_qRow_capInterior_card_ge_two
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support) :
    2 ≤
      ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
        S.capInteriorByIndex S.oppIndex1).card := by
  classical
  let V : Finset ℝ² := {C.firstSource.1, C.secondSource.1}
  have hVcard : V.card = 2 := by
    simp [V, C.sources_ne]
  have hsubset :
      V ⊆
        (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro x hx
    simp only [V, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · apply Finset.mem_inter.mpr
      constructor
      · rw [← hfirstSupport]
        exact
          (H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.q_mem_support
      · exact C.firstSource_data.2.1
    · apply Finset.mem_inter.mpr
      constructor
      · rw [← hsecondSupport]
        exact
          (H.selectedAt C.secondSource.1
            C.secondSource.2).toCriticalFourShell.q_mem_support
      · exact C.secondSource_data.2.1
  have hcardLe := Finset.card_le_card hsubset
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Apply global minimal deletion to the canonical Q row.  This is the exact
cardinality-independent finite ingress: `V` is a nonempty subset of four
named row points, deleting all of `V` blocks K4 at a carrier center outside
the Q row, and restoring any one member restores K4.

The conclusion intentionally says nothing about the four-class selected at
`center`; that identification would be a stronger, currently unavailable
producer. -/
theorem exists_freshThird_qRow_cardMinimalBlockingSubdeletion
    (Q : FreshThirdBlockerFiber P Pρ) :
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ KQ.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ (V.erase s)) center := by
  dsimp only
  apply exists_global_cardMinimal_blocking_subdeletion_of_selectedFourClass
    R.minimal
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hcenterA :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.center_mem).2
  have hinsertSubset :
      insert (H.centerAt Q.source₁.1 Q.source₁.2) KQ.support ⊆ D.A := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact hcenterA
    · exact KQ.support_subset_A hz
  have hinsertCard :
      (insert (H.centerAt Q.source₁.1 Q.source₁.2) KQ.support).card = 5 := by
    rw [Finset.card_insert_of_notMem KQ.center_not_mem,
      KQ.support_card]
  have hfive : 5 ≤ D.A.card := by
    rw [← hinsertCard]
    exact Finset.card_le_card hinsertSubset
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The generic deletion-core dichotomy specialized to the canonical Q row.
The fresh center remains outside the exact Q support; the output is either a
co-radial pair in the minimal deletion set or a pairwise-disjoint minimal
deletion core at that same center. -/
theorem exists_freshThird_qRow_sharedRadiusPair_or_minimalDeletionCore
    (Q : FreshThirdBlockerFiber P Pρ) :
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ KQ.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center)) := by
  dsimp only
  let KQ : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hcenterA :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.center_mem).2
  have hremaining : (D.A \ KQ.support).Nonempty := by
    refine ⟨H.centerAt Q.source₁.1 Q.source₁.2, ?_⟩
    exact Finset.mem_sdiff.mpr ⟨hcenterA, KQ.center_not_mem⟩
  simpa [KQ] using
    (exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      (D := D) (hmin := R.minimal) (U := KQ.support)
      KQ.support_subset_A KQ.support_nonempty hremaining)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A cardinality-independent finite abstraction ingress for the canonical Q
row.  The blocking set has at most four points because it lies in the exact
four-point Q support.  In the deletion-core arm, the core itself supplies one
exact four-point shell for each of those at most four labels.

This is a projection of every live carrier into bounded named data, not an
induced subcarrier: anonymous K4 witnesses outside the packet are deliberately
forgotten. -/
theorem exists_freshThird_qRow_boundedSharedRadiusPair_or_minimalDeletionCore
    (Q : FreshThirdBlockerFiber P Pρ) :
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ KQ.support ∧
      V.card ≤ 4 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center)) := by
  dsimp only
  let KQ : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  change ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
    V.Nonempty ∧ V ⊆ KQ.support ∧ V.card ≤ 4 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center))
  have hbase :=
    exists_freshThird_qRow_sharedRadiusPair_or_minimalDeletionCore
      (P := P) (Pρ := Pρ) (R := R) (H := H) Q
  change ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
    V.Nonempty ∧ V ⊆ KQ.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center)) at hbase
  rcases hbase with
    ⟨center, hcenter, V, hVne, hVsub, hblocked, hcases⟩
  have hVcard : V.card ≤ 4 := by
    calc
      V.card ≤ KQ.support.card := Finset.card_le_card hVsub
      _ = 4 := KQ.support_card
  exact
    ⟨center, hcenter, V, hVne, hVsub, hVcard, hblocked, hcases⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A member restored from a deletion-minimal blocker leaves exactly three
points on its radius after the whole blocker is deleted. -/
theorem selectedClass_card_eq_three_of_minimalBlockingSubdeletion_member
    {A U : Finset ℝ²} {center s : ℝ²}
    (hUsub : U ⊆ A)
    (hsU : s ∈ U)
    (hrestore :
      HasNEquidistantPointsAt 4 (A \ (U.erase s)) center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ U) center) :
    (SelectedClass (A \ U) center (dist center s)).card = 3 := by
  classical
  have hEraseEq :
      (A \ (U.erase s)).erase s = A \ U := by
    ext x
    by_cases hxs : x = s
    · subst x
      simp [hsU]
    · simp [hxs]
  have hblockedErase :
      ¬ HasNEquidistantPointsAt 4
        ((A \ (U.erase s)).erase s) center := by
    rw [hEraseEq]
    exact hblocked
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hrestore with
    ⟨radius, hradius, hcard⟩
  have hsClass :
      s ∈ SelectedClass (A \ (U.erase s)) center radius := by
    by_contra hsNot
    apply hblockedErase
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A \ (U.erase s)) (x := s) (s := center) (d := radius)
      hsNot
    refine ⟨radius, hradius, ?_⟩
    have hcardErased :
        4 ≤
          (SelectedClass ((A \ (U.erase s)).erase s)
            center radius).card := by
      rw [hsameCard]
      exact hcard
    simpa [SelectedClass] using hcardErased
  have hsDist : dist center s = radius :=
    (mem_selectedClass.mp hsClass).2
  have hsClass' :
      s ∈ SelectedClass (A \ (U.erase s)) center (dist center s) := by
    simpa [hsDist] using hsClass
  have hclassEq :
      SelectedClass (A \ U) center (dist center s) =
        (SelectedClass (A \ (U.erase s)) center (dist center s)).erase s := by
    rw [← hEraseEq]
    exact selectedClass_erase_eq (A \ (U.erase s)) s center (dist center s)
  have hlower :
      3 ≤ (SelectedClass (A \ U) center (dist center s)).card := by
    rw [hclassEq, Finset.card_erase_of_mem hsClass']
    have hcard' :
        4 ≤ (SelectedClass (A \ (U.erase s)) center (dist center s)).card := by
      simpa [hsDist] using hcard
    omega
  have hupper :
      ¬ 4 ≤ (SelectedClass (A \ U) center (dist center s)).card := by
    intro hfour
    apply hblocked
    refine ⟨dist center s, ?_, ?_⟩
    · simpa [hsDist] using hradius
    · simpa [SelectedClass] using hfour
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The shared-radius arm of a Q-row minimal blocker feeds the ambient
five-point selected-class consumer. -/
theorem qRow_five_le_selectedClass_of_cardMinimalBlockingSubdeletion_sharedRadius
    (Q : FreshThirdBlockerFiber P Pρ)
    {center : ℝ²} {V : Finset ℝ²} {s t : ℝ²}
    (hVsub :
      V ⊆
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hsV : s ∈ V)
    (htV : t ∈ V)
    (hst : s ≠ t)
    (hrestore :
      HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hsame : dist center s = dist center t) :
    5 ≤ (SelectedClass D.A center (dist center s)).card := by
  apply five_le_selectedClass_of_restoration_and_sharedRadius
    (hUsub := hVsub.trans
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support_subset_A)
    (hsU := hsV) (htU := htV) (hst := hst)
    (hrestore := hrestore) (hblocked := hblocked) (hsame := hsame)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Refine the Q-row minimal blocker by eliminating the co-radial branch as
an actual-blocker candidate.  If two members of the minimal deletion set have
the same radius, restoration gives a five-point ambient class, so the fresh
center is fully deletion robust.  Otherwise the distinct radii assemble into
a pairwise-disjoint minimal deletion core at the same center.

The robust arm cannot equal `H.centerAt source` for any carrier source by
`FullyDeletionRobustAt.centerAt_ne`; hence only the deletion-core arm can
possibly produce the anonymous selected row needed by FirstNonHit. -/
theorem exists_freshThird_qRow_robustCenter_or_minimalDeletionCore
    (Q : FreshThirdBlockerFiber P Pρ) :
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ KQ.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      (FullyDeletionRobustAt D center ∨
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A V center)) := by
  dsimp only
  rcases exists_freshThird_qRow_cardMinimalBlockingSubdeletion
      (P := P) (Pρ := Pρ) (R := R) (H := H) Q with
    ⟨center, hcenterRemaining, V, hVne, hVsub, hblocked, hminimal⟩
  refine
    ⟨center, hcenterRemaining, V, hVne, hVsub, hblocked, ?_⟩
  by_cases hcollision :
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t
  · rcases hcollision with ⟨s, hsV, t, htV, hst, hsame⟩
    left
    apply fullyDeletionRobustAt_of_large_class
    · have hcenterNeS : center ≠ s := by
        intro hcenterS
        exact
          (Finset.mem_sdiff.mp hcenterRemaining).2
            (hcenterS.symm ▸ hVsub hsV)
      exact (dist_pos : 0 < dist center s ↔ center ≠ s).2 hcenterNeS
    · exact
        qRow_five_le_selectedClass_of_cardMinimalBlockingSubdeletion_sharedRadius
          (P := P) (Pρ := Pρ) (R := R) (H := H) Q hVsub hsV htV hst
          (hminimal s hsV) hblocked hsame
  · right
    apply ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
      (hVsub.trans
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_subset_A)
      (Finset.mem_sdiff.mp hcenterRemaining).1
    · intro s hsV t htV hst hsame
      exact hcollision ⟨s, hsV, t, htV, hst, hsame⟩
    · exact hblocked
    · exact hminimal

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If a minimal blocking set restores K4 after restoring `s`, then deleting a
different member `w` alone still preserves K4.  Consequently, when the
blocking center is an actual selected-row center, `w` is omitted from that
row.  This is the sharp direction of the minimal-subdeletion ingress: sets of
cardinality at least two produce omissions, not the three positive incidences
needed by the FirstNonHit terminal. -/
theorem cardMinimalBlockingSubdeletion_not_mem_actualRow_of_restores_other
    (source : CriticalShellSystem.CarrierVertex D.A)
    {center : ℝ²} {V : Finset ℝ²} {s w : ℝ²}
    (hsV : s ∈ V)
    (hwV : w ∈ V)
    (hsw : s ≠ w)
    (hrestore :
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center)
    (hcenter : center = H.centerAt source.1 source.2) :
    w ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  have hwErase : w ∈ V.erase s :=
    Finset.mem_erase.mpr ⟨Ne.symm hsw, hwV⟩
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w) center := by
    apply hasNEquidistantPointsAt_mono
      (T := D.A.erase w) (p := center) _ hrestore
    intro z hz
    have hzParts := Finset.mem_sdiff.mp hz
    apply Finset.mem_erase.mpr
    refine ⟨?_, hzParts.1⟩
    intro hzw
    subst z
    exact hzParts.2 hwErase
  have hsurvivesAtSource :
      HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2) := by
    simpa [hcenter] using hsurvives
  exact
    (cross_deletion_survives_iff_not_mem_selected_support
      H source.2).mp hsurvivesAtSource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A minimal blocking set with at least two members is disjoint from every
actual selected row centered at its blocking center. -/
theorem cardMinimalBlockingSubdeletion_disjoint_actualRow_of_center_eq
    (source : CriticalShellSystem.CarrierVertex D.A)
    {center : ℝ²} {V : Finset ℝ²}
    (hcard : 2 ≤ V.card)
    (hminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center)
    (hcenter : center = H.centerAt source.1 source.2) :
    Disjoint V
      (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  have hone : 1 < V.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨a, haV, b, hbV, hab⟩
  rw [Finset.disjoint_left]
  intro w hwV hwRow
  by_cases hwa : w = a
  · have hbneW : b ≠ w := by simpa [hwa] using hab.symm
    exact
      cardMinimalBlockingSubdeletion_not_mem_actualRow_of_restores_other
        source hbV hwV hbneW (hminimal b hbV) hcenter hwRow
  · have haneW : a ≠ w := fun haw => hwa haw.symm
    exact
      cardMinimalBlockingSubdeletion_not_mem_actualRow_of_restores_other
        source haV hwV haneW (hminimal a haV) hcenter hwRow

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A nonempty deletion-minimal blocking set centered at an actual blocker is
a singleton.  Indeed, if it had two members, the preceding theorem would make
it disjoint from the exact four-point selected row at that blocker, so that
row would survive deletion of the whole blocking set. -/
theorem cardMinimalBlockingSubdeletion_card_eq_one_of_center_eq
    (source : CriticalShellSystem.CarrierVertex D.A)
    {center : ℝ²} {V : Finset ℝ²}
    (hVne : V.Nonempty)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center)
    (hcenter : center = H.centerAt source.1 source.2) :
    V.card = 1 := by
  have hcardPos : 0 < V.card := Finset.card_pos.mpr hVne
  by_contra hcardNe
  have hcard : 2 ≤ V.card := by omega
  have hdisjoint :
      Disjoint V
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support :=
    cardMinimalBlockingSubdeletion_disjoint_actualRow_of_center_eq
      source hcard hminimal hcenter
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  have hsupport :
      K.support ⊆ SelectedClass (D.A \ V) center K.radius := by
    intro z hz
    rw [mem_selectedClass]
    refine ⟨Finset.mem_sdiff.mpr ⟨K.support_subset_A hz, ?_⟩, ?_⟩
    · intro hzV
      exact (Finset.disjoint_left.mp hdisjoint) hzV hz
    · simpa [hcenter] using K.support_eq_radius z hz
  apply hblocked
  refine ⟨K.radius, K.radius_pos, ?_⟩
  have hcardSelected :
      4 ≤ (SelectedClass (D.A \ V) center K.radius).card := by
    rw [← K.support_card]
    exact Finset.card_le_card hsupport
  simpa [SelectedClass] using hcardSelected

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A deletion-minimal blocking set with at least two members cannot be
centered at any actual blocker.  Thus a multi-point minimal core is an ambient
center obstruction, not an actual selected-row producer. -/
theorem cardMinimalBlockingSubdeletion_center_ne_actualRow_of_two_le_card
    (source : CriticalShellSystem.CarrierVertex D.A)
    {center : ℝ²} {V : Finset ℝ²}
    (hcard : 2 ≤ V.card)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center) :
    center ≠ H.centerAt source.1 source.2 := by
  intro hcenter
  have hVne : V.Nonempty :=
    Finset.card_pos.mp (by omega)
  have hone :=
    cardMinimalBlockingSubdeletion_card_eq_one_of_center_eq
      source hVne hblocked hminimal hcenter
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The Q-row minimal-blocking ingress has only two honest outcomes: its
blocking set is a singleton, or its center is outside the image of every
actual blocker.  In particular, the multi-point arm cannot itself furnish the
actual selected row required by the FirstNonHit three-overlap terminal. -/
theorem exists_freshThird_qRow_minimalBlocker_singleton_or_nonactualCenter
    (Q : FreshThirdBlockerFiber P Pρ) :
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ KQ.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ KQ.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ (V.erase s)) center) ∧
      (V.card = 1 ∨
        ∀ source : CriticalShellSystem.CarrierVertex D.A,
          center ≠ H.centerAt source.1 source.2) := by
  dsimp only
  rcases exists_freshThird_qRow_cardMinimalBlockingSubdeletion
      (P := P) (Pρ := Pρ) (R := R) (H := H) Q with
    ⟨center, hcenterRemaining, V, hVne, hVsub, hblocked, hminimal⟩
  refine
    ⟨center, hcenterRemaining, V, hVne, hVsub, hblocked, hminimal, ?_⟩
  by_cases hone : V.card = 1
  · exact Or.inl hone
  · right
    intro source
    apply cardMinimalBlockingSubdeletion_center_ne_actualRow_of_two_le_card
      source (hblocked := hblocked) (hminimal := hminimal)
    have hcardPos : 0 < V.card := Finset.card_pos.mpr hVne
    omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the Q-center arm of the minimal-deletion ingress, the minimal blocking
set is a singleton.  If two Q-row points remained in `V`, restoring one would
give K4 on a subset of the carrier with the other deleted, contradicting the
source-criticality characterization of Q's exact selected row. -/
theorem qRow_cardMinimalBlockingSubdeletion_card_eq_one_of_center_eq
    (Q : FreshThirdBlockerFiber P Pρ)
    {center : ℝ²} {V : Finset ℝ²}
    (hVne : V.Nonempty)
    (hVsub :
      V ⊆
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hVminimal : ∀ s ∈ V,
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center)
    (hcenter : center = H.centerAt Q.source₁.1 Q.source₁.2) :
    V.card = 1 := by
  have hcardLe : V.card ≤ 1 := by
    rw [Finset.card_le_one]
    intro s hs t ht
    by_contra hst
    have htErase : t ∈ V.erase s :=
      Finset.mem_erase.mpr ⟨Ne.symm hst, ht⟩
    have hrestore := hVminimal s hs
    have hsurvives :
        HasNEquidistantPointsAt 4 (D.A.erase t) center := by
      apply hasNEquidistantPointsAt_mono
        (T := D.A.erase t) (p := center) _ hrestore
      intro z hz
      have hzParts := Finset.mem_sdiff.mp hz
      apply Finset.mem_erase.mpr
      refine ⟨?_, hzParts.1⟩
      intro hzt
      subst z
      exact hzParts.2 htErase
    have hsurvivesQ :
        HasNEquidistantPointsAt 4 (D.A.erase t)
          (H.centerAt Q.source₁.1 Q.source₁.2) := by
      simpa [hcenter] using hsurvives
    have htNot :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H Q.source₁.2).mp hsurvivesQ
    exact htNot (hVsub ht)
  have hcardPos : 0 < V.card := Finset.card_pos.mpr hVne
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Three blocked deletions drawn from one exact selected row force those
points into a second selected row.  This is the cardinality-independent
landing contract for a global FirstNonHit incidence producer: the hard input
is the shared blocking center, not the final finite-set count. -/
theorem selectedRow_inter_card_ge_three_of_blocked_deletions
    (source target : CriticalShellSystem.CarrierVertex D.A)
    (blocked : Finset (EuclideanSpace ℝ (Fin 2)))
    (hcard : 3 ≤ blocked.card)
    (hsubset :
      blocked ⊆
        (H.selectedAt target.1 target.2).toCriticalFourShell.support)
    (hblocked : ∀ w ∈ blocked,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)) :
    3 ≤
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt target.1 target.2).toCriticalFourShell.support).card := by
  apply hcard.trans
  apply Finset.card_le_card
  intro w hw
  simp only [Finset.mem_inter]
  exact ⟨
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source.1 source.2) (hblocked w hw),
    hsubset hw⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consumer-ready form of
`selectedRow_inter_card_ge_three_of_blocked_deletions`.  A solver or geometric
producer may land here by certifying three target-row deletions blocked at one
distinct actual center; no cap-wide alignment is assumed. -/
theorem exists_selectedRow_overlap_card_ge_three_of_blocked_deletions
    (source target : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2)
    (blocked : Finset (EuclideanSpace ℝ (Fin 2)))
    (hcard : 3 ≤ blocked.card)
    (hsubset :
      blocked ⊆
        (H.selectedAt target.1 target.2).toCriticalFourShell.support)
    (hblocked : ∀ w ∈ blocked,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)) :
    ∃ witness : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt witness.1 witness.2 ≠
          H.centerAt target.1 target.2 ∧
        3 ≤
          ((H.selectedAt witness.1 witness.2).toCriticalFourShell.support ∩
            (H.selectedAt target.1
              target.2).toCriticalFourShell.support).card := by
  refine ⟨source, hcenters, ?_⟩
  exact selectedRow_inter_card_ge_three_of_blocked_deletions
    source target blocked hcard hsubset hblocked

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Exact landing contract for FirstNonHit theorem discovery.  Three deletions
from the target row blocked at one distinct actual center are equivalent to the
three-point selected-row overlap consumed by the terminal theorem.  Thus a
finite or geometric producer must establish the blocked-deletion packet; this
equivalence itself does not add a new incidence assumption. -/
theorem exists_blockedDeletionTriple_iff_exists_selectedRow_overlap_card_ge_three
    (target : CriticalShellSystem.CarrierVertex D.A) :
    (∃ source : CriticalShellSystem.CarrierVertex D.A,
        H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2 ∧
        ∃ blocked : Finset (EuclideanSpace ℝ (Fin 2)),
          blocked ⊆
              (H.selectedAt target.1 target.2).toCriticalFourShell.support ∧
            blocked.card = 3 ∧
            ∀ w ∈ blocked,
              ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
                (H.centerAt source.1 source.2)) ↔
      ∃ source : CriticalShellSystem.CarrierVertex D.A,
        H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2 ∧
          3 ≤
            ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
              (H.selectedAt target.1
                target.2).toCriticalFourShell.support).card := by
  constructor
  · rintro ⟨source, hcenters, blocked, hsubset, hcard, hblocked⟩
    refine ⟨source, hcenters, ?_⟩
    exact selectedRow_inter_card_ge_three_of_blocked_deletions
      source target blocked (by omega) hsubset hblocked
  · rintro ⟨source, hcenters, hthree⟩
    obtain ⟨blocked, hsubset, hcard⟩ := Finset.exists_subset_card_eq hthree
    refine ⟨source, hcenters, blocked, ?_, hcard, ?_⟩
    · intro w hw
      exact (Finset.mem_inter.mp (hsubset hw)).2
    · intro w hw hsurvives
      have hnotMem :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsurvives
      exact hnotMem (Finset.mem_inter.mp (hsubset hw)).1

include hfrontierFour hfrontierInteriorEq T in
/-- The fully robust retained first-apex row supplies a mutual-deletion pair,
and the exact cap census classifies that pair into the only four possible
geometric locations.

This is a source-clean finite producer.  It does not assert a contradiction:
the remaining FreshThird work is to connect one of these location arms to the
canonical `Q` row. -/
theorem exists_retainedFirstApex_mutualDeletionPair_locationCases :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        w.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        z ≠ w ∧
        HasNEquidistantPointsAt 4 (D.A.erase w.1)
          (H.centerAt z.1 z.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1)
          (H.centerAt w.1 w.2) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 ∧
        ((z.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
            w.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²)) ∨
          (z.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
            (w.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
              w.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1)) ∨
          ((z.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
              z.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∧
            w.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²)) ∨
          ((z.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
              w.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
            (z.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
              w.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1))) := by
  classical
  let K : SelectedFourClass D.A S.oppApex1 :=
    SelectedFourClass.ofSelectedClass F.radius_pos hfrontierFour
  have G : TriApexAllLargeContext D S :=
    triApexAllLargeContext_of_residuals (H := H) L N T
  have hfan : SourceFaithfulSelectedFourDeletionFan D S H K :=
    sourceFaithfulDeletionFan_of_triApexAllLargeContext G K
  rcases
      nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan
        K hfan with
    hnonrobust | ⟨z, w, hzK, hwK, hzw, hzwSurvives, hwzSurvives,
      hcenters⟩
  · exact (hnonrobust
      (fullyDeletionRobustAt_of_apexRichClassStructure
        T.oppApex1_rich)).elim
  · have hzClass : z.1 ∈ SelectedClass D.A S.oppApex1 radius := by
      simpa [K, SelectedFourClass.ofSelectedClass] using hzK
    have hwClass : w.1 ∈ SelectedClass D.A S.oppApex1 radius := by
      simpa [K, SelectedFourClass.ofSelectedClass] using hwK
    have hzwVal : z.1 ≠ w.1 := by
      intro h
      exact hzw (Subtype.ext h)
    have outside_mem_adjacent : ∀ {x : ℝ²},
        x ∈ SelectedClass D.A S.oppApex1 radius →
        x ∉ S.capInteriorByIndex S.oppIndex1 →
        x ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
          x ∈ S.rightAdjacentCapByIndex S.oppIndex1 := by
      intro x hxClass hxOutside
      have hxClass' :
          x ∈ SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) radius := by
        simpa using hxClass
      rcases Finset.mem_union.mp
          (S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
            S.oppIndex1 F.radius_pos
            (Finset.mem_sdiff.mpr ⟨hxClass', hxOutside⟩)) with hx | hx
      · exact Or.inl (Finset.mem_inter.mp hx).2
      · exact Or.inr (Finset.mem_inter.mp hx).2
    refine ⟨z, w, hzClass, hwClass, hzw, hzwSurvives, hwzSurvives,
      hcenters, ?_⟩
    by_cases hzInterior : z.1 ∈ S.capInteriorByIndex S.oppIndex1
    · have hzRetained :
          z.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
        rw [← hfrontierInteriorEq]
        exact Finset.mem_inter.mpr ⟨hzClass, hzInterior⟩
      by_cases hwInterior : w.1 ∈ S.capInteriorByIndex S.oppIndex1
      · left
        refine ⟨hzRetained, ?_⟩
        rw [← hfrontierInteriorEq]
        exact Finset.mem_inter.mpr ⟨hwClass, hwInterior⟩
      · exact Or.inr (Or.inl
          ⟨hzRetained, outside_mem_adjacent hwClass hwInterior⟩)
    · have hzAdjacent := outside_mem_adjacent hzClass hzInterior
      by_cases hwInterior : w.1 ∈ S.capInteriorByIndex S.oppIndex1
      · exact Or.inr (Or.inr (Or.inl
          ⟨hzAdjacent, by
            rw [← hfrontierInteriorEq]
            exact Finset.mem_inter.mpr ⟨hwClass, hwInterior⟩⟩))
      · have hwAdjacent := outside_mem_adjacent hwClass hwInterior
        rcases hzAdjacent with hzLeft | hzRight <;>
          rcases hwAdjacent with hwLeft | hwRight
        · have hle :
              (SelectedClass D.A S.oppApex1 radius ∩
                S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
              simpa using
                S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
                  D.convex S.oppIndex1 radius
          have hlt :
              1 < (SelectedClass D.A S.oppApex1 radius ∩
                S.leftAdjacentCapByIndex S.oppIndex1).card :=
            Finset.one_lt_card.mpr
              ⟨z.1, Finset.mem_inter.mpr ⟨hzClass, hzLeft⟩, w.1,
                Finset.mem_inter.mpr ⟨hwClass, hwLeft⟩, hzwVal⟩
          omega
        · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨hzLeft, hwRight⟩)))
        · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨hzRight, hwLeft⟩)))
        · have hle :
              (SelectedClass D.A S.oppApex1 radius ∩
                S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
              simpa using
                S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
                  D.convex S.oppIndex1 radius
          have hlt :
              1 < (SelectedClass D.A S.oppApex1 radius ∩
                S.rightAdjacentCapByIndex S.oppIndex1).card :=
            Finset.one_lt_card.mpr
              ⟨z.1, Finset.mem_inter.mpr ⟨hzClass, hzRight⟩, w.1,
                Finset.mem_inter.mpr ⟨hwClass, hwRight⟩, hzwVal⟩
          omega

include hfrontierFour hfrontierInteriorEq T in
/-- The mutual-deletion pair cannot consist of the two retained interior
sources: those sources have the same blocker center, whereas the deletion-fan
pair has distinct centers.  Hence only the two mixed orientations or the
opposite-adjacent placement remain. -/
theorem exists_retainedFirstApex_mutualDeletionPair_threeLocationCases :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        w.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        z ≠ w ∧
        HasNEquidistantPointsAt 4 (D.A.erase w.1)
          (H.centerAt z.1 z.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1)
          (H.centerAt w.1 w.2) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 ∧
        ((z.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
            (w.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
              w.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1)) ∨
          ((z.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
              z.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∧
            w.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²)) ∨
          ((z.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
              w.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
            (z.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
              w.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1))) := by
  classical
  rcases exists_retainedFirstApex_mutualDeletionPair_locationCases
      (D := D) (S := S) (H := H) (P := P) (F := F) (L := L) (N := N)
      (Pρ := Pρ) (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour) (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq) (T := T)
      (hpairsDisjoint := hpairsDisjoint) (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP) with
    ⟨z, w, hzClass, hwClass, hzw, hzwSurvives, hwzSurvives,
      hcenters, hlocation⟩
  refine ⟨z, w, hzClass, hwClass, hzw, hzwSurvives, hwzSurvives,
    hcenters, ?_⟩
  rcases hlocation with hboth | hmixed | hmixed | hopposite
  · have hz : z.1 = P.source₁ ∨ z.1 = P.source₂ := by
      simpa using hboth.1
    have hw : w.1 = P.source₁ ∨ w.1 = P.source₂ := by
      simpa using hboth.2
    rcases hz with hz | hz <;> rcases hw with hw | hw
    · exact (hzw (Subtype.ext (hz.trans hw.symm))).elim
    · exact (hcenters (by simpa [hz, hw] using P.blockers_eq)).elim
    · exact (hcenters (by simpa [hz, hw] using P.blockers_eq.symm)).elim
    · exact (hzw (Subtype.ext (hz.trans hw.symm))).elim
  · exact Or.inl hmixed
  · exact Or.inr (Or.inl hmixed)
  · exact Or.inr (Or.inr hopposite)

include hfrontierFour hfrontierInteriorEq in
/-- If the two points outside the retained first-apex interior occupy opposite
adjacent caps, they are exactly the two remaining points of the radius class.

This converts the geometric placement arm into an exact four-point support,
which is the form expected by the row-incidence and cyclic-order consumers. -/
theorem retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzClass : z.1 ∈ SelectedClass D.A S.oppApex1 radius)
    (hwClass : w.1 ∈ SelectedClass D.A S.oppApex1 radius)
    (hopposite :
      (z.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
          w.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) ∨
        (z.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
          w.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1)) :
    SelectedClass D.A S.oppApex1 radius =
      ({P.source₁, P.source₂, z.1, w.1} : Finset ℝ²) := by
  classical
  have hinteriorCard :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 := by
    rw [hfrontierInteriorEq]
    simp [P.sources_ne]
  have hfrontierFour' :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 := by
    simpa using hfrontierFour
  have hinteriorCard' :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2 := by
    simpa using hinteriorCard
  have hadjacent :
      (SelectedClass D.A S.oppApex1 radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1).card = 1 ∧
        (SelectedClass D.A S.oppApex1 radius ∩
            S.rightAdjacentCapByIndex S.oppIndex1).card = 1 := by
    simpa using
      S.selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two
        D.convex S.oppIndex1 F.radius_pos hfrontierFour' hinteriorCard'
  have exactSupport
      (leftPoint rightPoint : CriticalShellSystem.CarrierVertex D.A)
      (hleftClass :
        leftPoint.1 ∈ SelectedClass D.A S.oppApex1 radius)
      (hrightClass :
        rightPoint.1 ∈ SelectedClass D.A S.oppApex1 radius)
      (hleft : leftPoint.1 ∈ S.leftAdjacentCapByIndex S.oppIndex1)
      (hright : rightPoint.1 ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
      SelectedClass D.A S.oppApex1 radius =
        ({P.source₁, P.source₂, leftPoint.1, rightPoint.1} : Finset ℝ²) := by
    have hleftEq :
        SelectedClass D.A S.oppApex1 radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1 = {leftPoint.1} := by
      obtain ⟨x, hx⟩ := Finset.card_eq_one.mp hadjacent.1
      have hpointx : leftPoint.1 = x := by
        have : leftPoint.1 ∈ ({x} : Finset ℝ²) := by
          rw [← hx]
          exact Finset.mem_inter.mpr ⟨hleftClass, hleft⟩
        simpa using this
      simpa [hpointx] using hx
    have hrightEq :
        SelectedClass D.A S.oppApex1 radius ∩
            S.rightAdjacentCapByIndex S.oppIndex1 = {rightPoint.1} := by
      obtain ⟨x, hx⟩ := Finset.card_eq_one.mp hadjacent.2
      have hpointx : rightPoint.1 = x := by
        have : rightPoint.1 ∈ ({x} : Finset ℝ²) := by
          rw [← hx]
          exact Finset.mem_inter.mpr ⟨hrightClass, hright⟩
        simpa using this
      simpa [hpointx] using hx
    ext x
    constructor
    · intro hxClass
      by_cases hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1
      · have hxRetained :
            x ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
          rw [← hfrontierInteriorEq]
          exact Finset.mem_inter.mpr ⟨hxClass, hxInterior⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hxRetained ⊢
        aesop
      · have hxClass' :
            x ∈ SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) radius := by
          simpa using hxClass
        have hxCover :=
          S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
            S.oppIndex1 F.radius_pos
            (Finset.mem_sdiff.mpr ⟨hxClass', hxInterior⟩)
        rcases Finset.mem_union.mp hxCover with hxLeft | hxRight
        · have : x = leftPoint.1 := by
            have : x ∈ ({leftPoint.1} : Finset ℝ²) := by
              rw [← hleftEq]
              simpa using hxLeft
            simpa using this
          simp [this]
        · have : x = rightPoint.1 := by
            have : x ∈ ({rightPoint.1} : Finset ℝ²) := by
              rw [← hrightEq]
              simpa using hxRight
            simpa using this
          simp [this]
    · intro hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with hx | hx | hx | hx
      · subst x
        exact (Finset.mem_inter.mp (by
          rw [hfrontierInteriorEq]
          simp)).1
      · subst x
        exact (Finset.mem_inter.mp (by
          rw [hfrontierInteriorEq]
          simp)).1
      · simpa [hx] using hleftClass
      · simpa [hx] using hrightClass
  rcases hopposite with ⟨hzLeft, hwRight⟩ | ⟨hzRight, hwLeft⟩
  · exact exactSupport z w hzClass hwClass hzLeft hwRight
  · exact (exactSupport w z hwClass hzClass hwLeft hzRight).trans (by
        ext x
        simp [and_left_comm, and_comm, and_assoc, or_left_comm, or_comm,
          or_assoc])

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Direct source-level residual for the first-source non-hit branch.

The local named-row alternatives do not produce a third row: each named row
either has the canonical Q-row center or has overlap at most two with the Q
row.  Closing this theorem therefore requires genuinely carrier-wide
incidence, cap-order, or metric information. -/
theorem false_of_freshThird_firstNonHit
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility form of `false_of_freshThird_firstNonHit` for consumers that
expect a distinct-center selected row with three-point overlap.  The
existential is itself contradictory by the two-circle terminal, so it is not a
weaker producer and is intentionally derived only after the direct residual is
closed. -/
theorem exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
      3 ≤
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card := by
  exact False.elim <|
    false_of_freshThird_firstNonHit
      (P := P) (Pρ := Pρ)
      (hρne := hρne)
      (hfrontierFour := hfrontierFour) (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      (C := C) (Q := Q)
      (hingress := hingress) (data := data)
      (secondInteraction := secondInteraction)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Direct source-level residual for the second-source non-hit branch.
This is the reflected companion of `false_of_freshThird_firstNonHit`; it keeps
the full first interaction and acyclic ingress while avoiding the same
impossible-alignment interface. -/
theorem false_of_freshThird_secondNonHit
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q) :
    False := by
  let Cswap : TwoCapSourceThirdCanonicalRowSurface P Pρ :=
    { cap_card_ge_eight := C.cap_card_ge_eight
      firstSource := C.secondSource
      secondSource := C.firstSource
      sources_ne := C.sources_ne.symm
      firstSource_data := C.secondSource_data
      secondSource_data := C.firstSource_data }
  have hingressSwap :
      FreshThirdAcyclicCanonicalConsumerPacket
        (P := P) (Pρ := Pρ) Cswap :=
    freshThird_acyclic_canonical_consumerPacket
      (P := P) (Pρ := Pρ)
      (hρne := hρne)
      (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T)
      (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP) Cswap
  exact
    false_of_freshThird_firstNonHit
      (P := P) (Pρ := Pρ)
      (hρne := hρne)
      (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T)
      (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Cswap Q hingressSwap
      (by simpa [Cswap] using data)
      (by simpa [Cswap] using firstInteraction)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both noncanonical positive interaction constructors retain the exact
two-point overlap needed by the finite-ingress producer. -/
private theorem freshThirdNonCanonicalInteraction_overlap_eq
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction :
      FreshThirdNonCanonicalInteraction P Pρ C.firstSource Q) :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support =
      {Q.source₁.1, Q.source₂.1} := by
  cases interaction with
  | distinctBlockersDifferentCaps _ _ _ overlap_eq _ _ _ _ _ =>
      exact overlap_eq
  | sameCapWithInternalFiberSource _ _ _ overlap_eq _ _ _ _ _ =>
      exact overlap_eq

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Direct residual for the equal-cross-row-center branch.

The canonical shared pair is cyclically separated, so a same-arc pair is not
a source-produced positive packet.  Keep the complete acyclic ingress and both
noncanonical interactions and state the actual required result: their joint
impossibility.  The mixed cap-interaction products close below; the two
coherent products remain the mathematical branches of this single residual. -/
theorem false_of_freshThirdEqualCenter_noncanonicalInteractions
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (firstInteraction :
      FreshThirdNonCanonicalInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdNonCanonicalInteraction P Pρ C.secondSource Q) :
    False := by
  have hoverlap :=
    freshThirdNonCanonicalInteraction_overlap_eq P Pρ C Q firstInteraction
  have _hsixWayIngress :=
    exists_freshThirdEqualCenter_pinnedCenter_sixWayIngress
      (P := P) (Pρ := Pρ) (T := T)
      C Q hfirst hsecond hcenters hoverlap
  cases firstInteraction with
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
      cases secondInteraction with
      | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
          overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
          caps_ne' =>
          sorry
      | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
          overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
          fiberSource_mem_cap' hcapIndex' =>
          have hsrc : sourceCap = capIndex' := by
            by_contra hne
            exact
              (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                (by simpa [hcenters] using sourceCenter_mem') hne) rfl
          have hfr : freshCap = capIndex' := by
            by_contra hne
            exact
              (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                freshCenter_mem' hne) rfl
          exact False.elim (caps_ne (hsrc.trans hfr.symm))
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap
      hcapIndex =>
      cases secondInteraction with
      | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
          overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
          caps_ne' =>
          have hsrc : capIndex = sourceCap' := by
            by_contra hne
            exact
              (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                (by simpa [hcenters] using sourceCenter_mem') hne) rfl
          have hfr : capIndex = freshCap' := by
            by_contra hne
            exact
              (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                freshCenter_mem' hne) rfl
          exact False.elim (caps_ne' (hsrc.symm.trans hfr))
      | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
          overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
          fiberSource_mem_cap' hcapIndex' =>
          sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unresolved residual leaf after the canonical equal-center/`oppIndex1`
arm has been removed.  Its interface retains the complete acyclic
retained/common-radius producer packet, so the aligned singleton slices and
minimal-deletion core are no longer erased before the surviving-row step. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) :
    False := by
  cases hremaining with
  | firstNonHit data secondInteraction =>
      exact
        false_of_freshThird_firstNonHit
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q hingress data secondInteraction
  | secondNonHit firstInteraction data =>
      exact
        false_of_freshThird_secondNonHit
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q hingress firstInteraction data
  | equalCrossRowCenters hfirst hsecond hcenters firstInteraction secondInteraction =>
      exact
          false_of_freshThirdEqualCenter_noncanonicalInteractions
            (P := P) (Pρ := Pρ)
            (hρne := hρne) (hfrontierFour := hfrontierFour)
            (hρfour := hρfour)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq)
            (T := T) (hpairsDisjoint := hpairsDisjoint)
            (hblockersNe := hblockersNe)
            (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
            (LP := LP) (hLP := hLP) (MP := MP)
            C Q hingress hfirst hsecond hcenters
            firstInteraction secondInteraction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every order-selected surviving endpoint row has at least two witnesses
outside the exact fresh critical shell.

This is the source-valid incidence statement furnished by the surviving-row
packet.  The endpoint-row center and fresh-shell center are distinct by the
strict boundary order, so two exact four-classes at those centers intersect in
at most two points.  Since the endpoint row has exactly four points, at least
two remain outside the fresh shell. -/
theorem freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_freshShell
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (qOutside qBetween sourceCenter canonicalSource : Fin B.n)
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween sourceCenter canonicalSource) :
    ∃ (id : Fin B.n) (DRow : SelectedFourClass D.A (B.boundary id))
        (rowCap : Fin 3),
      (id = qOutside ∨ id = qBetween) ∧
      B.boundary id ∈ S.capByIndex rowCap ∧
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2 ∧
      2 ≤ (DRow.support \ S.capByIndex rowCap).card ∧
      B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ≠ id ∧
        2 ≤
          (DRow.support \
          (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card ∧
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween sourceCenter canonicalSource id DRow rowCap := by
  classical
  let freshLabel : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let freshIndex : Fin B.n := B.indexOf freshLabel
  let freshRow : SelectedFourClass D.A freshLabel.1 :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have two_outside
      {id : Fin B.n} (hindex : freshIndex ≠ id)
      (DRow : SelectedFourClass D.A (B.boundary id)) :
      2 ≤ (DRow.support \ freshRow.support).card := by
    have hcentersNe : B.boundary id ≠ freshLabel.1 := by
      intro heq
      apply hindex
      apply B.boundary_injective
      calc
        B.boundary freshIndex = freshLabel.1 := by
          simpa [freshIndex] using B.point_eq freshLabel
        _ = B.boundary id := heq.symm
    have hinter : (DRow.support ∩ freshRow.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two DRow freshRow hcentersNe
    have hsplit :=
      Finset.card_sdiff_add_card_inter DRow.support freshRow.support
    rw [DRow.support_card] at hsplit
    omega
  rcases hrow with h | h | h | h
  · rcases h with ⟨houtsideFresh, hfreshBetween, hbetweenSource,
      hsourceCanonical, hcapRow⟩
    have hindex : freshIndex ≠ qBetween := by
      simpa [freshIndex, freshLabel] using ne_of_lt hfreshBetween
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · refine ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inl ⟨houtsideFresh, hfreshBetween, hbetweenSource,
        hsourceCanonical, rfl,
        ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩
    · refine ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inl ⟨houtsideFresh, hfreshBetween, hbetweenSource,
        hsourceCanonical, rfl,
        ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩
  · rcases h with ⟨houtsideFresh, hfreshBetween, hbetweenCanonical,
      hcanonicalSource, hcapRow⟩
    have hindex : freshIndex ≠ qOutside := by
      simpa [freshIndex, freshLabel] using ne_of_gt houtsideFresh
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · refine ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inl ⟨houtsideFresh, hfreshBetween,
        hbetweenCanonical, hcanonicalSource, rfl,
        ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩)
    · refine ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inl ⟨houtsideFresh, hfreshBetween,
        hbetweenCanonical, hcanonicalSource, rfl,
        ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩)
  · rcases h with ⟨hcanonSource, hsourceBetween, hbetweenFresh,
      hfreshOutside, hcapRow⟩
    have hindex : freshIndex ≠ qBetween := by
      simpa [freshIndex, freshLabel] using ne_of_gt hbetweenFresh
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · refine ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inr (Or.inl ⟨hcanonSource, hsourceBetween,
        hbetweenFresh, hfreshOutside, rfl,
        ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))
    · refine ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inr (Or.inl ⟨hcanonSource, hsourceBetween,
        hbetweenFresh, hfreshOutside, rfl,
        ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))
  · rcases h with ⟨hsourceCanonical, hcanonicalBetween, hbetweenFresh,
      hfreshOutside, hcapRow⟩
    have hindex : freshIndex ≠ qOutside := by
      simpa [freshIndex, freshLabel] using ne_of_lt hfreshOutside
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · refine ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inr (Or.inr ⟨hsourceCanonical, hcanonicalBetween,
        hbetweenFresh, hfreshOutside, rfl,
        ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))
    · refine ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hindex,
        by simpa [freshRow] using two_outside hindex DRow, ?_⟩
      exact Or.inr (Or.inr (Or.inr ⟨hsourceCanonical, hcanonicalBetween,
        hbetweenFresh, hfreshOutside, rfl,
        ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- One exact order-selected endpoint row has at least two witnesses outside
each of the fresh and source critical shells.

Both estimates concern the same row.  Thus, if its four-point support is
covered by the two shells, the only remaining local incidence pattern is an
exact two-and-two split (and no row point can lie in the shell intersection). -/
theorem freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_bothShells
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)) :
    ∃ (id : Fin B.n) (DRow : SelectedFourClass D.A (B.boundary id))
        (rowCap : Fin 3),
      (id = qOutside ∨ id = qBetween) ∧
      B.boundary id ∈ S.capByIndex rowCap ∧
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2 ∧
      2 ≤ (DRow.support \ S.capByIndex rowCap).card ∧
      B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ≠ id ∧
      B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩ ≠ id ∧
        2 ≤
          (DRow.support \
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card ∧
        2 ≤
          (DRow.support \
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.support).card ∧
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)
        id DRow rowCap := by
  classical
  let sourceLabel : CarrierLabel D.A :=
    ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let sourceIndex : Fin B.n := B.indexOf sourceLabel
  let sourceRow : SelectedFourClass D.A sourceLabel.1 :=
    (H.selectedAt C.surface.firstSource.1
      C.surface.firstSource.2).toCriticalFourShell.toSelectedFourClass
  let freshLabel : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let freshIndex : Fin B.n := B.indexOf freshLabel
  let freshRow : SelectedFourClass D.A freshLabel.1 :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have two_outside
      (label : CarrierLabel D.A)
      (shellRow : SelectedFourClass D.A label.1)
      {id : Fin B.n} (hindex : B.indexOf label ≠ id)
      (DRow : SelectedFourClass D.A (B.boundary id)) :
      2 ≤ (DRow.support \ shellRow.support).card := by
    have hcentersNe : B.boundary id ≠ label.1 := by
      intro heq
      apply hindex
      apply B.boundary_injective
      calc
        B.boundary (B.indexOf label) = label.1 := B.point_eq label
        _ = B.boundary id := heq.symm
    have hinter : (DRow.support ∩ shellRow.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two DRow shellRow hcentersNe
    have hsplit :=
      Finset.card_sdiff_add_card_inter DRow.support shellRow.support
    rw [DRow.support_card] at hsplit
    omega
  rcases hrow with h | h | h | h
  · rcases h with ⟨houtsideFresh, hfreshBetween, hbetweenSource,
      hsourceCanonical, hcapRow⟩
    have hsourceIndex : sourceIndex ≠ qBetween := by
      simpa [sourceIndex, sourceLabel] using ne_of_gt hbetweenSource
    have hfreshIndex : freshIndex ≠ qBetween := by
      simpa [freshIndex, freshLabel] using ne_of_lt hfreshBetween
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · exact ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inl ⟨houtsideFresh, hfreshBetween, hbetweenSource,
          hsourceCanonical, rfl,
          ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩⟩
    · exact ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inl ⟨houtsideFresh, hfreshBetween, hbetweenSource,
          hsourceCanonical, rfl,
          ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩⟩
  · rcases h with ⟨houtsideFresh, hfreshBetween, hbetweenCanonical,
      hcanonicalSource, hcapRow⟩
    have houtsideSource : qOutside < sourceIndex := by
      simpa [sourceIndex, sourceLabel] using
        houtsideFresh.trans (hfreshBetween.trans
          (hbetweenCanonical.trans hcanonicalSource))
    have hsourceIndex : sourceIndex ≠ qOutside := ne_of_gt houtsideSource
    have hfreshIndex : freshIndex ≠ qOutside := by
      simpa [freshIndex, freshLabel] using ne_of_gt houtsideFresh
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · exact ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inl ⟨houtsideFresh, hfreshBetween,
          hbetweenCanonical, hcanonicalSource, rfl,
          ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩)⟩
    · exact ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inl ⟨houtsideFresh, hfreshBetween,
          hbetweenCanonical, hcanonicalSource, rfl,
          ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩)⟩
  · rcases h with ⟨hcanonicalSource, hsourceBetween, hbetweenFresh,
      hfreshOutside, hcapRow⟩
    have hsourceIndex : sourceIndex ≠ qBetween := by
      simpa [sourceIndex, sourceLabel] using ne_of_lt hsourceBetween
    have hfreshIndex : freshIndex ≠ qBetween := by
      simpa [freshIndex, freshLabel] using ne_of_gt hbetweenFresh
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · exact ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inr (Or.inl ⟨hcanonicalSource,
          hsourceBetween, hbetweenFresh, hfreshOutside, rfl,
          ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))⟩
    · exact ⟨qBetween, DRow, rowCap, Or.inr rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inr (Or.inl ⟨hcanonicalSource,
          hsourceBetween, hbetweenFresh, hfreshOutside, rfl,
          ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))⟩
  · rcases h with ⟨hsourceCanonical, hcanonicalBetween, hbetweenFresh,
      hfreshOutside, hcapRow⟩
    have hsourceOutside : sourceIndex < qOutside := by
      simpa [sourceIndex, sourceLabel] using
        hsourceCanonical.trans (hcanonicalBetween.trans
          (hbetweenFresh.trans hfreshOutside))
    have hsourceIndex : sourceIndex ≠ qOutside := ne_of_lt hsourceOutside
    have hfreshIndex : freshIndex ≠ qOutside := by
      simpa [freshIndex, freshLabel] using ne_of_lt hfreshOutside
    rcases hcapRow with
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩ |
      ⟨DRow, rowCap, havoid, hcenterCap, hcapInside, hcapOutside⟩
    · exact ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inr (Or.inr ⟨hsourceCanonical,
          hcanonicalBetween, hbetweenFresh, hfreshOutside, rfl,
          ⟨Or.inl havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))⟩
    · exact ⟨qOutside, DRow, rowCap, Or.inl rfl,
        hcenterCap, hcapInside, hcapOutside,
        by simpa [freshIndex, freshLabel] using hfreshIndex,
        by simpa [sourceIndex, sourceLabel] using hsourceIndex,
        by simpa [freshRow] using two_outside freshLabel freshRow hfreshIndex DRow,
        by simpa [sourceRow] using two_outside sourceLabel sourceRow hsourceIndex DRow,
        by exact Or.inr (Or.inr (Or.inr ⟨hsourceCanonical,
          hcanonicalBetween, hbetweenFresh, hfreshOutside, rfl,
          ⟨Or.inr havoid, hcenterCap, hcapInside, hcapOutside⟩⟩))⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem fourPointSupport_twoShellCover_exactSplit
    {α : Type*} [DecidableEq α] (R K L : Finset α)
    (hR : R.card = 4)
    (houtsideK : 2 ≤ (R \ K).card)
    (houtsideL : 2 ≤ (R \ L).card)
    (hcover : R ⊆ K ∪ L) :
    (R ∩ K).card = 2 ∧
      (R ∩ L).card = 2 ∧
      Disjoint (R ∩ K) (R ∩ L) := by
  have hsplitK := Finset.card_sdiff_add_card_inter R K
  have hsplitL := Finset.card_sdiff_add_card_inter R L
  have hinterK : (R ∩ K).card ≤ 2 := by omega
  have hinterL : (R ∩ L).card ≤ 2 := by omega
  have hunion : (R ∩ K) ∪ (R ∩ L) = R := by
    ext z
    simp only [Finset.mem_union, Finset.mem_inter]
    constructor
    · rintro (hz | hz)
      · exact hz.1
      · exact hz.1
    · intro hzR
      rcases Finset.mem_union.mp (hcover hzR) with hzK | hzL
      · exact Or.inl ⟨hzR, hzK⟩
      · exact Or.inr ⟨hzR, hzL⟩
  have hUnionCard : ((R ∩ K) ∪ (R ∩ L)).card = 4 := by
    rw [hunion, hR]
  have hUnionLe := Finset.card_union_le (R ∩ K) (R ∩ L)
  have hinterKEq : (R ∩ K).card = 2 := by omega
  have hinterLEq : (R ∩ L).card = 2 := by omega
  refine ⟨hinterKEq, hinterLEq, ?_⟩
  apply Finset.card_union_eq_card_add_card.mp
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-level two-shell dichotomy for the surviving endpoint row.

Either the checked row has a point outside the union of the source and fresh
shells, or its four points split exactly two-and-two between the shells.  In
the latter arm the two row intersections are disjoint, so the row avoids the
source/fresh shell intersection. -/
theorem freshThird_orderSelectedEndpointCapSplitSurvivingRow_escape_or_exactTwoTwo
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)) :
    ∃ (id : Fin B.n) (DRow : SelectedFourClass D.A (B.boundary id))
        (rowCap : Fin 3),
      (id = qOutside ∨ id = qBetween) ∧
      B.boundary id ∈ S.capByIndex rowCap ∧
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2 ∧
      2 ≤ (DRow.support \ S.capByIndex rowCap).card ∧
      ((∃ z ∈ DRow.support,
          z ∉
            (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support ∪
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support) ∨
        DRow.support ⊆
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support ∪
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support ∧
        (DRow.support ∩
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card = 2 ∧
          (DRow.support ∩
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support).card = 2 ∧
          Disjoint
            (DRow.support ∩
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support)
            (DRow.support ∩
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support)) ∧
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)
        id DRow rowCap := by
  classical
  rcases
    freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_bothShells
        (P := P) (Pρ := Pρ) C Q B qOutside qBetween hrow with
    ⟨id, DRow, rowCap, hendpoint, hcenterCap, hcapInside, hcapOutside,
      _, _, houtsideFresh, houtsideSource, hAt⟩
  refine ⟨id, DRow, rowCap, hendpoint, hcenterCap, hcapInside, hcapOutside, ?_, hAt⟩
  by_cases hcover :
      DRow.support ⊆
        (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∪
          (H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.support
  · exact Or.inr
      ⟨hcover,
        fourPointSupport_twoShellCover_exactSplit
          DRow.support
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support
          (H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.support
          DRow.support_card houtsideFresh houtsideSource hcover⟩
  · rcases Finset.not_subset.mp hcover with ⟨z, hzRow, hzOutside⟩
    exact Or.inl ⟨z, hzRow, hzOutside⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact `2+2` alternative has no anonymous incidence freedom.

The endpoint row avoids the two-point overlap of the source and fresh shells.
Its source-shell half is therefore exactly the two canonical sources, while
its fresh-shell half is exactly the two-point fresh remainder. -/
theorem freshThird_orderSelectedEndpointCapSplitSurvivingRow_escape_or_exactSupport
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)) :
    ∃ (id : Fin B.n) (DRow : SelectedFourClass D.A (B.boundary id))
        (rowCap : Fin 3),
      (id = qOutside ∨ id = qBetween) ∧
      B.boundary id ∈ S.capByIndex rowCap ∧
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2 ∧
      2 ≤ (DRow.support \ S.capByIndex rowCap).card ∧
      ((∃ z ∈ DRow.support,
          z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∨
        DRow.support =
          {C.surface.firstSource.1, C.surface.secondSource.1} ∪
            freshThirdCrossRowFreshRemainder P Pρ C.surface Q) ∧
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)
        id DRow rowCap := by
  classical
  rcases
    freshThird_orderSelectedEndpointCapSplitSurvivingRow_escape_or_exactTwoTwo
        (P := P) (Pρ := Pρ) C Q B qOutside qBetween hrow with
    ⟨id, DRow, rowCap, hendpoint, hcenterCap, hcapInside, hcapOutside,
      hlocal, hAt⟩
  refine ⟨id, DRow, rowCap, hendpoint, hcenterCap, hcapInside, hcapOutside, ?_, hAt⟩
  rcases hlocal with hescape | htwoTwo
  · left
    rcases hescape with ⟨z, hzRow, hzOutside⟩
    refine ⟨z, hzRow, ?_⟩
    rw [freshThirdCrossRowTwoShellSeed]
    simp only [Finset.mem_union, not_or] at hzOutside ⊢
    exact ⟨hzOutside.2, hzOutside.1⟩
  · right
    let KC :=
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
    let KQ :=
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
    let canonicalPair : Finset ℝ² :=
      {C.surface.firstSource.1, C.surface.secondSource.1}
    have hcanonicalPairCard : canonicalPair.card = 2 := by
      simpa [canonicalPair] using
        Finset.card_pair C.surface.sources_ne
    have hremainderCard :
        (freshThirdCrossRowFreshRemainder P Pρ C.surface Q).card = 2 :=
      freshThirdCrossRowFreshRemainder_card_eq_two P Pρ C.surface Q overlap_eq
    have hsourceSub : DRow.support ∩ KC ⊆ canonicalPair := by
      intro z hz
      have hzData := Finset.mem_inter.mp hz
      have hzNamed : z ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1,
            Q.source₁.1, Q.source₂.1} : Finset ℝ²) := by
        simpa [KC, hexact.first_support_eq] using hzData.2
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzNamed
      rcases hzNamed with hzFirst | hzSecond | hzQ₁ | hzQ₂
      · simpa [canonicalPair, hzFirst]
      · simpa [canonicalPair, hzSecond]
      · exfalso
        apply Finset.disjoint_left.mp htwoTwo.2.2.2
          (Finset.mem_inter.mpr ⟨hzData.1, ?_⟩) hz
        have : Q.source₁.1 ∈ KC ∩ KQ := by
          rw [show KC ∩ KQ = {Q.source₁.1, Q.source₂.1} by
            simpa [KC, KQ] using overlap_eq]
          simp
        simpa [hzQ₁] using (Finset.mem_inter.mp this).2
      · exfalso
        apply Finset.disjoint_left.mp htwoTwo.2.2.2
          (Finset.mem_inter.mpr ⟨hzData.1, ?_⟩) hz
        have : Q.source₂.1 ∈ KC ∩ KQ := by
          rw [show KC ∩ KQ = {Q.source₁.1, Q.source₂.1} by
            simpa [KC, KQ] using overlap_eq]
          simp
        simpa [hzQ₂] using (Finset.mem_inter.mp this).2
    have hsourceEq : DRow.support ∩ KC = canonicalPair := by
      apply Finset.eq_of_subset_of_card_le hsourceSub
      rw [hcanonicalPairCard]
      exact le_of_eq (by simpa [KC] using htwoTwo.2.2.1.symm)
    have hfreshSub :
        DRow.support ∩ KQ ⊆
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
      intro z hz
      have hzData := Finset.mem_inter.mp hz
      rw [freshThirdCrossRowFreshRemainder]
      exact Finset.mem_sdiff.mpr ⟨hzData.2, fun hzKC ↦
        Finset.disjoint_left.mp htwoTwo.2.2.2 hz
          (Finset.mem_inter.mpr ⟨hzData.1, hzKC⟩)⟩
    have hfreshEq :
        DRow.support ∩ KQ =
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
      apply Finset.eq_of_subset_of_card_le hfreshSub
      rw [hremainderCard]
      exact le_of_eq (by simpa [KQ] using htwoTwo.2.1.symm)
    have hrowUnion :
        (DRow.support ∩ KQ) ∪ (DRow.support ∩ KC) = DRow.support := by
      ext z
      simp only [Finset.mem_union, Finset.mem_inter]
      constructor
      · rintro (hz | hz)
        · exact hz.1
        · exact hz.1
      · intro hzRow
        rcases Finset.mem_union.mp (htwoTwo.1 hzRow) with hzKQ | hzKC
        · exact Or.inl ⟨hzRow, hzKQ⟩
        · exact Or.inr ⟨hzRow, hzKC⟩
    calc
      DRow.support =
          (DRow.support ∩ KQ) ∪ (DRow.support ∩ KC) := hrowUnion.symm
      _ = freshThirdCrossRowFreshRemainder P Pρ C.surface Q ∪
          canonicalPair := by rw [hfreshEq, hsourceEq]
      _ = canonicalPair ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q := Finset.union_comm _ _
      _ = _ := by rfl

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- An endpoint row with the exact two-shell support can only be centered at
the first opposite apex.

Indeed, its exact support contains the two common-radius canonical sources.
Every other carrier point equidistant from that strict-interior pair lies in
the first opposite cap interior, whereas both possible endpoint centers are
excluded from the corresponding closed cap. -/
theorem freshThird_exactSupport_endpointRow_center_eq_firstApex
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenterEndpoint :
      B.boundary id = Q.source₁.1 ∨
        B.boundary id = Q.source₂.1)
    (hsupport :
      DRow.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q)
    (hsource₁Off : Q.source₁.1 ∉ S.capByIndex S.oppIndex1)
    (hsource₂Off : Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    B.boundary id = S.oppApex1 := by
  classical
  by_contra hcenterNeApex
  have hfirstRow : C.surface.firstSource.1 ∈ DRow.support := by
    rw [hsupport]
    simp
  have hsecondRow : C.surface.secondSource.1 ∈ DRow.support := by
    rw [hsupport]
    simp
  have hfirstCommon :
      C.surface.firstSource.1 ∈
        SelectedClass D.A S.oppApex1 C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩
  have hsecondCommon :
      C.surface.secondSource.1 ∈
        SelectedClass D.A S.oppApex1 C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩
  have hcenterA : B.boundary id ∈ D.A := by
    have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
    simpa only [B.boundary_image] using hmem
  have hequidistant :
      dist (B.boundary id) C.surface.firstSource.1 =
        dist (B.boundary id) C.surface.secondSource.1 :=
    (DRow.support_eq_radius _ hfirstRow).trans
      (DRow.support_eq_radius _ hsecondRow).symm
  have hcenterInterior :
      B.boundary id ∈ S.capInteriorByIndex S.oppIndex1 :=
    FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
      hfirstCommon hsecondCommon C.surface.sources_ne hcenterA
      hcenterNeApex hequidistant
  have hcenterCap : B.boundary id ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterInterior
  rcases hcenterEndpoint with hcenter | hcenter
  · exact hsource₁Off (hcenter ▸ hcenterCap)
  · exact hsource₂Off (hcenter ▸ hcenterCap)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Once the exact endpoint row is known to be centered at the first apex,
its radius is not anonymous: either canonical source in its support identifies
it with the common radius carried by `C`. -/
theorem freshThird_exactSupport_endpointRow_radius_eq_commonRadius
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenter : B.boundary id = S.oppApex1)
    (hsupport :
      DRow.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q) :
    DRow.radius = C.commonRadius := by
  have hfirstRow : C.surface.firstSource.1 ∈ DRow.support := by
    rw [hsupport]
    simp
  calc
    DRow.radius = dist (B.boundary id) C.surface.firstSource.1 :=
      (DRow.support_eq_radius _ hfirstRow).symm
    _ = dist S.oppApex1 C.surface.firstSource.1 := by rw [hcenter]
    _ = C.commonRadius := (mem_selectedClass.mp C.firstSource_mem).2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact-support endpoint alternative therefore upgrades the common
radius from a two-point cap-interior class to a genuine ambient K4 radius at
the first apex.  This is the source-level multiplicity clause needed by the
remaining global incidence consumer. -/
theorem freshThird_exactSupport_commonRadius_card_ge_four
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenter : B.boundary id = S.oppApex1)
    (hsupport :
      DRow.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q) :
    4 ≤ (SelectedClass D.A S.oppApex1 C.commonRadius).card := by
  have hradius :=
    freshThird_exactSupport_endpointRow_radius_eq_commonRadius
      (P := P) (Pρ := Pρ) C Q B id DRow hcenter hsupport
  have hrowSub :
      DRow.support ⊆
        SelectedClass D.A (B.boundary id) DRow.radius := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨DRow.support_subset_A hx, DRow.support_eq_radius x hx⟩
  have hfour :
      4 ≤ (SelectedClass D.A (B.boundary id) DRow.radius).card := by
    calc
      4 = DRow.support.card := DRow.support_card.symm
      _ ≤ (SelectedClass D.A (B.boundary id) DRow.radius).card :=
        Finset.card_le_card hrowSub
  simpa [hcenter, hradius] using hfour

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consumer-ready global producer for the surviving FreshThird endpoint row.

Minimality chooses one pinned center in the exact two-shell seed.  If that
center is not the center of the order-selected endpoint row, the producer
records this genuine off-endpoint alternative.  If the centers agree, the
local exact `2+2` cover is impossible: the endpoint row would put four points
of one positive-radius class inside the seed, contradicting the pinned
multiplicity-three bound.  Hence the agreeing-center arm supplies an actual
row point outside the seed together with the full source-faithful blocker
dichotomy. -/
theorem freshThird_pinnedEndpointRow_escape_or_offEndpoint
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)) :
    ∃ (center : ℝ²) (id : Fin B.n)
        (DRow : SelectedFourClass D.A (B.boundary id)) (rowCap : Fin 3),
      center ∈ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
      center ≠
          H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∧
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
      (∀ shellRadius : ℝ, 0 < shellRadius →
        ((SelectedClass D.A center shellRadius) ∩
          freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card ≤ 3) ∧
      (id = qOutside ∨ id = qBetween) ∧
      B.boundary id ∈ S.capByIndex rowCap ∧
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2 ∧
      2 ≤ (DRow.support \ S.capByIndex rowCap).card ∧
      ((center ≠ B.boundary id ∧
          ((∃ z ∈ DRow.support,
              z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∨
            DRow.support =
              {C.surface.firstSource.1, C.surface.secondSource.1} ∪
                freshThirdCrossRowFreshRemainder P Pρ C.surface Q) ∧
          ∃ (K : SelectedFourClass D.A center) (z : ℝ²)
              (hz : z ∈ K.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ((center = H.centerAt z (K.support_subset_A hz) ∧
                K.support =
                  (H.selectedAt z
                    (K.support_subset_A hz)).toCriticalFourShell.support ∧
                ¬ FullyDeletionRobustAt D center) ∨
              (center ≠ H.centerAt z (K.support_subset_A hz) ∧
                (K.support ∩
                  (H.selectedAt z
                    (K.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2))) ∨
        center = B.boundary id ∧
          ∃ (z : ℝ²) (hz : z ∈ DRow.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ((center = H.centerAt z (DRow.support_subset_A hz) ∧
                DRow.support =
                  (H.selectedAt z
                    (DRow.support_subset_A hz)).toCriticalFourShell.support ∧
                ¬ FullyDeletionRobustAt D center) ∨
              (center ≠ H.centerAt z (DRow.support_subset_A hz) ∧
                (DRow.support ∩
                  (H.selectedAt z
                    (DRow.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2))) ∧
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)
        id DRow rowCap := by
  classical
  rcases
      exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy
        (P := P) (Pρ := Pρ) (T := T) C.surface Q overlap_eq with
    ⟨center, hcenterSeed, hcenterNeSource, hcenterNeFresh,
      hmult, hglobalEscape⟩
  rcases
      freshThird_orderSelectedEndpointCapSplitSurvivingRow_escape_or_exactSupport
        (P := P) (Pρ := Pρ) C Q hexact overlap_eq B qOutside qBetween hrow with
    ⟨id, DRow, rowCap, hendpoint, hcenterCap, hcapInside, hcapOutside,
      hlocal, hAt⟩
  have hcenterA : center ∈ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier
      P Pρ C.surface Q hcenterSeed
  rcases exists_selectedFourClass_of_globalK4 D.K4 hcenterA with ⟨K⟩
  have hnotSub :
      ¬ K.support ⊆ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
    intro hsub
    have hrowSub :
        K.support ⊆
          SelectedClass D.A center K.radius ∩
            freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
      intro x hx
      exact Finset.mem_inter.mpr
        ⟨mem_selectedClass.mpr
            ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩,
          hsub hx⟩
    have hfour := Finset.card_le_card hrowSub
    have hthree := hmult K.radius K.radius_pos
    rw [K.support_card] at hfour
    omega
  rcases Finset.not_subset.mp hnotSub with ⟨z, hzK, hzOutside⟩
  have hglobal := hglobalEscape K z hzK hzOutside
  refine
    ⟨center, id, DRow, rowCap, hcenterSeed, hcenterNeSource, hcenterNeFresh,
      hmult, hendpoint, hcenterCap, hcapInside, hcapOutside, ?_, hAt⟩
  by_cases hcenter : center = B.boundary id
  · subst center
    rcases hlocal with hescape | hsupport
    · right
      rcases hescape with ⟨z, hzRow, hzOutside⟩
      have hzSeed :
          z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
        exact hzOutside
      exact
        ⟨rfl, z, hzRow, hzSeed,
          hglobalEscape DRow z hzRow hzSeed⟩
    · have hrowSub :
          DRow.support ⊆
            SelectedClass D.A (B.boundary id) DRow.radius ∩
              freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
        intro z hzRow
        refine Finset.mem_inter.mpr ⟨?_, ?_⟩
        · rw [mem_selectedClass]
          exact
            ⟨DRow.support_subset_A hzRow,
              DRow.support_eq_radius z hzRow⟩
        · rw [hsupport] at hzRow
          rw [freshThirdCrossRowTwoShellSeed]
          rcases Finset.mem_union.mp hzRow with hcanonical | hremainder
          · exact Finset.mem_union.mpr (Or.inl (by
              rw [hexact.first_support_eq]
              simp only [Finset.mem_insert, Finset.mem_singleton]
              simp only [Finset.mem_insert, Finset.mem_singleton] at hcanonical
              exact hcanonical.elim Or.inl (fun h ↦ Or.inr (Or.inl h))))
          · exact Finset.mem_union.mpr
              (Or.inr (Finset.mem_sdiff.mp hremainder).1)
      have hfour := Finset.card_le_card hrowSub
      have hthree := hmult DRow.radius DRow.radius_pos
      rw [DRow.support_card] at hfour
      omega
  · exact Or.inl ⟨hcenter, hlocal, K, z, hzK, hzOutside, hglobal⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem freshThird_pinnedCenter_ne_of_support_subset_seed
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (center shellCenter : ℝ²)
    (K : SelectedFourClass D.A shellCenter)
    (hsub : K.support ⊆ freshThirdCrossRowTwoShellSeed P Pρ C Q)
    (hmult : ∀ shellRadius : ℝ, 0 < shellRadius →
      ((SelectedClass D.A center shellRadius) ∩
        freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3) :
    center ≠ shellCenter := by
  intro hcenter
  have hrowSub :
      K.support ⊆
        SelectedClass D.A center K.radius ∩
          freshThirdCrossRowTwoShellSeed P Pρ C Q := by
    intro z hz
    refine Finset.mem_inter.mpr ⟨?_, hsub hz⟩
    rw [mem_selectedClass]
    refine ⟨K.support_subset_A hz, ?_⟩
    rw [hcenter]
    exact K.support_eq_radius z hz
  have hfour := Finset.card_le_card hrowSub
  have hthree := hmult K.radius K.radius_pos
  rw [K.support_card] at hfour
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The multiplicity-three pinning bound rules out the four named blocker
centers.  In the equal-center packet these collapse to the two inequalities
already exposed by the producer; this lemma records the full four-source
form without confusing blocker centers with source points. -/
theorem freshThird_pinnedCenter_ne_namedBlockers
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C Q)
    (center : ℝ²)
    (hmult : ∀ shellRadius : ℝ, 0 < shellRadius →
      ((SelectedClass D.A center shellRadius) ∩
        freshThirdCrossRowTwoShellSeed P Pρ C Q).card ≤ 3) :
    center ≠ H.centerAt C.firstSource.1 C.firstSource.2 ∧
      center ≠ H.centerAt C.secondSource.1 C.secondSource.2 ∧
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
      center ≠ H.centerAt Q.source₂.1 Q.source₂.2 := by
  classical
  have hneFirst :
      center ≠ H.centerAt C.firstSource.1 C.firstSource.2 :=
    freshThird_pinnedCenter_ne_of_support_subset_seed
      (P := P) (Pρ := Pρ) C Q center
      (H.centerAt C.firstSource.1 C.firstSource.2)
      (H.selectedAt C.firstSource.1 C.firstSource.2).toSelectedFourClass
      (by
        intro z hz
        rw [freshThirdCrossRowTwoShellSeed]
        exact Finset.mem_union.mpr (Or.inl hz))
      hmult
  have hneSecond :
      center ≠ H.centerAt C.secondSource.1 C.secondSource.2 :=
    freshThird_pinnedCenter_ne_of_support_subset_seed
      (P := P) (Pρ := Pρ) C Q center
      (H.centerAt C.secondSource.1 C.secondSource.2)
      (H.selectedAt C.secondSource.1 C.secondSource.2).toSelectedFourClass
      (by
        intro z hz
        rw [freshThirdCrossRowTwoShellSeed]
        apply Finset.mem_union.mpr
        left
        rw [hexact.first_support_eq, ← hexact.second_support_eq]
        exact hz)
      hmult
  have hneFreshFirst :
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2 :=
    freshThird_pinnedCenter_ne_of_support_subset_seed
      (P := P) (Pρ := Pρ) C Q center
      (H.centerAt Q.source₁.1 Q.source₁.2)
      (H.selectedAt Q.source₁.1 Q.source₁.2).toSelectedFourClass
      (by
        intro z hz
        rw [freshThirdCrossRowTwoShellSeed]
        exact Finset.mem_union.mpr (Or.inr hz))
      hmult
  have hQCenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.blockers_eq
  let K₂ : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    transportFreshThirdSelectedFourClass
      (H.selectedAt Q.source₂.1 Q.source₂.2).toSelectedFourClass
      hQCenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt Q.source₂.1
          Q.source₂.2).toCriticalFourShell.support := by
    exact transportFreshThirdSelectedFourClass_support _ _
  have hQSupports :
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₂.1
          Q.source₂.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support = K₂.support :=
        (H.selectedFourClass_support_eq_shell
          Q.source₁.1 Q.source₁.2 K₂).symm
      _ = _ := hK₂Support
  have hneFreshSecond :
      center ≠ H.centerAt Q.source₂.1 Q.source₂.2 :=
    freshThird_pinnedCenter_ne_of_support_subset_seed
      (P := P) (Pρ := Pρ) C Q center
      (H.centerAt Q.source₂.1 Q.source₂.2)
      (H.selectedAt Q.source₂.1 Q.source₂.2).toSelectedFourClass
      (by
        intro z hz
        rw [freshThirdCrossRowTwoShellSeed]
        apply Finset.mem_union.mpr
        right
        rw [hQSupports]
        exact hz)
      hmult
  exact ⟨hneFirst, hneSecond, hneFreshFirst, hneFreshSecond⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Cyclic separation of a shared pair by two row centers, expressed on one
fixed boundary indexing. -/
private def SharedPairCyclicSeparation
    (B : BoundaryIndexing D.A)
    (firstCenter secondCenter firstPoint secondPoint : CarrierLabel D.A) :
    Prop :=
  SurplusCOMPGBank.btw
      (B.indexOf firstCenter) (B.indexOf secondCenter) (B.indexOf firstPoint) ↔
    ¬ SurplusCOMPGBank.btw
      (B.indexOf firstCenter) (B.indexOf secondCenter) (B.indexOf secondPoint)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem SharedPairCyclicSeparation.swap
    {B : BoundaryIndexing D.A}
    {firstCenter secondCenter firstPoint secondPoint : CarrierLabel D.A}
    (h : SharedPairCyclicSeparation B firstCenter secondCenter
      firstPoint secondPoint) :
    SharedPairCyclicSeparation B firstCenter secondCenter
      secondPoint firstPoint := by
  change
    SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter)
          (B.indexOf firstPoint) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter)
          (B.indexOf secondPoint) at h
  change
    SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter)
          (B.indexOf secondPoint) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter)
          (B.indexOf firstPoint)
  constructor
  · intro hsecond hfirst
    exact h.mp hfirst hsecond
  · intro hnotFirst
    by_contra hnotSecond
    exact hnotFirst (h.mpr hnotSecond)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The three FreshThird shared-pair separations already contain a direct
six-point Euclidean obstruction.  After cyclically cutting at `sharedPoint`,
the source/fresh separation puts the endpoint center between the two row
centers.  One canonical point then lies between the source and endpoint, and
one remainder point lies between the fresh and endpoint.  These are exactly
the two triple rows consumed by
`false_of_six_ccw_two_triple_row_equalities`.

This theorem deliberately does not assume that all eight named roles are
distinct.  The two points selected by strict betweenness are automatically
distinct from the six vertices used in the obstruction. -/
private theorem false_of_threeRowCyclicSeparationTriangle_at_sharedPointZero
    (B : BoundaryIndexing D.A)
    {sourceCenter freshCenter endpointCenter sharedPoint
      canonical₁ canonical₂ remainder₁ remainder₂ : CarrierLabel D.A}
    (hsharedZero : (B.indexOf sharedPoint).val = 0)
    (Ksource : SelectedFourClass D.A sourceCenter.1)
    (Kfresh : SelectedFourClass D.A freshCenter.1)
    (hsharedSource : sharedPoint.1 ∈ Ksource.support)
    (hcanonical₁Source : canonical₁.1 ∈ Ksource.support)
    (hcanonical₂Source : canonical₂.1 ∈ Ksource.support)
    (hendpointSource : endpointCenter.1 ∈ Ksource.support)
    (hsharedFresh : sharedPoint.1 ∈ Kfresh.support)
    (hendpointFresh : endpointCenter.1 ∈ Kfresh.support)
    (hremainder₁Fresh : remainder₁.1 ∈ Kfresh.support)
    (hremainder₂Fresh : remainder₂.1 ∈ Kfresh.support)
    (hsourceFresh :
      SharedPairCyclicSeparation B sourceCenter freshCenter
        endpointCenter sharedPoint)
    (hsourceEndpoint :
      SharedPairCyclicSeparation B sourceCenter endpointCenter
        canonical₁ canonical₂)
    (hfreshEndpoint :
      SharedPairCyclicSeparation B freshCenter endpointCenter
        remainder₁ remainder₂) :
    False := by
  letI : NeZero B.n :=
    ⟨Nat.ne_of_gt (Nat.zero_lt_of_lt (B.indexOf sharedPoint).isLt)⟩
  have hsharedSourceIndex :
      B.indexOf sharedPoint ≠ B.indexOf sourceCenter := by
    intro hindex
    have hlabels : sharedPoint = sourceCenter := B.index_injective hindex
    exact Ksource.center_not_mem (by simpa [hlabels] using hsharedSource)
  have hsharedFreshIndex :
      B.indexOf sharedPoint ≠ B.indexOf freshCenter := by
    intro hindex
    have hlabels : sharedPoint = freshCenter := B.index_injective hindex
    exact Kfresh.center_not_mem (by simpa [hlabels] using hsharedFresh)
  have hsourceValNe : (B.indexOf sourceCenter).val ≠ 0 := by
    intro hzero
    apply hsharedSourceIndex
    apply Fin.ext
    omega
  have hfreshValNe : (B.indexOf freshCenter).val ≠ 0 := by
    intro hzero
    apply hsharedFreshIndex
    apply Fin.ext
    omega
  have hsourcePositive : 0 < B.indexOf sourceCenter := by
    change 0 < (B.indexOf sourceCenter).val
    omega
  have hfreshPositive : 0 < B.indexOf freshCenter := by
    change 0 < (B.indexOf freshCenter).val
    omega
  have hsharedNotBetween :
      ¬ SurplusCOMPGBank.btw
        (B.indexOf sourceCenter) (B.indexOf freshCenter)
          (B.indexOf sharedPoint) := by
    simp only [SurplusCOMPGBank.btw]
    omega
  have hendpointBetween :
      SurplusCOMPGBank.btw
        (B.indexOf sourceCenter) (B.indexOf freshCenter)
          (B.indexOf endpointCenter) :=
    hsourceFresh.mpr hsharedNotBetween
  have hcanonicalBetween :
      SurplusCOMPGBank.btw
          (B.indexOf sourceCenter) (B.indexOf endpointCenter)
            (B.indexOf canonical₁) ∨
        SurplusCOMPGBank.btw
          (B.indexOf sourceCenter) (B.indexOf endpointCenter)
            (B.indexOf canonical₂) := by
    by_cases hfirst :
        SurplusCOMPGBank.btw
          (B.indexOf sourceCenter) (B.indexOf endpointCenter)
            (B.indexOf canonical₁)
    · exact Or.inl hfirst
    · right
      by_contra hsecond
      exact hfirst (hsourceEndpoint.mpr hsecond)
  have hremainderBetween :
      SurplusCOMPGBank.btw
          (B.indexOf freshCenter) (B.indexOf endpointCenter)
            (B.indexOf remainder₁) ∨
        SurplusCOMPGBank.btw
          (B.indexOf freshCenter) (B.indexOf endpointCenter)
            (B.indexOf remainder₂) := by
    by_cases hfirst :
        SurplusCOMPGBank.btw
          (B.indexOf freshCenter) (B.indexOf endpointCenter)
            (B.indexOf remainder₁)
    · exact Or.inl hfirst
    · right
      by_contra hsecond
      exact hfirst (hfreshEndpoint.mpr hsecond)
  have between_forward {i j k : Fin B.n} (hij : i < j)
      (hbetween : SurplusCOMPGBank.btw i j k) : i < k ∧ k < j := by
    rcases hbetween with hbetween | hbetween
    · exact hbetween
    · omega
  have between_reverse {i j k : Fin B.n} (hji : j < i)
      (hbetween : SurplusCOMPGBank.btw i j k) : j < k ∧ k < i := by
    rcases hbetween with hbetween | hbetween
    · omega
    · exact hbetween
  have source_eq {p q : CarrierLabel D.A}
      (hp : p.1 ∈ Ksource.support) (hq : q.1 ∈ Ksource.support) :
      dist sourceCenter.1 p.1 = dist sourceCenter.1 q.1 :=
    (Ksource.support_eq_radius _ hp).trans
      (Ksource.support_eq_radius _ hq).symm
  have fresh_eq {p q : CarrierLabel D.A}
      (hp : p.1 ∈ Kfresh.support) (hq : q.1 ∈ Kfresh.support) :
      dist freshCenter.1 p.1 = dist freshCenter.1 q.1 :=
    (Kfresh.support_eq_radius _ hp).trans
      (Kfresh.support_eq_radius _ hq).symm
  have hboundaryZero : B.boundary 0 = sharedPoint.1 := by
    have hindexZero : B.indexOf sharedPoint = 0 := Fin.ext hsharedZero
    rw [← hindexZero]
    exact B.point_eq sharedPoint
  rcases hendpointBetween with hsourceEndpointOrder | hfreshEndpointOrder
  · rcases hcanonicalBetween with hcanonical₁Between | hcanonical₂Between <;>
      rcases hremainderBetween with hremainder₁Between | hremainder₂Between
    · have hcanonicalOrder :=
        between_forward hsourceEndpointOrder.1 hcanonical₁Between
      have hremainderOrder :=
        between_reverse hsourceEndpointOrder.2 hremainder₁Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hcanonicalOrder.1 hcanonicalOrder.2
          hremainderOrder.1 hremainderOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₁Source)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₁Fresh)
    · have hcanonicalOrder :=
        between_forward hsourceEndpointOrder.1 hcanonical₁Between
      have hremainderOrder :=
        between_reverse hsourceEndpointOrder.2 hremainder₂Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hcanonicalOrder.1 hcanonicalOrder.2
          hremainderOrder.1 hremainderOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₁Source)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₂Fresh)
    · have hcanonicalOrder :=
        between_forward hsourceEndpointOrder.1 hcanonical₂Between
      have hremainderOrder :=
        between_reverse hsourceEndpointOrder.2 hremainder₁Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hcanonicalOrder.1 hcanonicalOrder.2
          hremainderOrder.1 hremainderOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₂Source)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₁Fresh)
    · have hcanonicalOrder :=
        between_forward hsourceEndpointOrder.1 hcanonical₂Between
      have hremainderOrder :=
        between_reverse hsourceEndpointOrder.2 hremainder₂Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hcanonicalOrder.1 hcanonicalOrder.2
          hremainderOrder.1 hremainderOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₂Source)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₂Fresh)
  · rcases hcanonicalBetween with hcanonical₁Between | hcanonical₂Between <;>
      rcases hremainderBetween with hremainder₁Between | hremainder₂Between
    · have hcanonicalOrder :=
        between_reverse hfreshEndpointOrder.2 hcanonical₁Between
      have hremainderOrder :=
        between_forward hfreshEndpointOrder.1 hremainder₁Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hremainderOrder.1 hremainderOrder.2
          hcanonicalOrder.1 hcanonicalOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₁Fresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₁Source)
    · have hcanonicalOrder :=
        between_reverse hfreshEndpointOrder.2 hcanonical₁Between
      have hremainderOrder :=
        between_forward hfreshEndpointOrder.1 hremainder₂Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hremainderOrder.1 hremainderOrder.2
          hcanonicalOrder.1 hcanonicalOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₂Fresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₁Source)
    · have hcanonicalOrder :=
        between_reverse hfreshEndpointOrder.2 hcanonical₂Between
      have hremainderOrder :=
        between_forward hfreshEndpointOrder.1 hremainder₁Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hremainderOrder.1 hremainderOrder.2
          hcanonicalOrder.1 hcanonicalOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₁Fresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₂Source)
    · have hcanonicalOrder :=
        between_reverse hfreshEndpointOrder.2 hcanonical₂Between
      have hremainderOrder :=
        between_forward hfreshEndpointOrder.1 hremainder₂Between
      exact
        TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities
          B.boundary_injective B.boundary_ccw
          (by omega) hremainderOrder.1 hremainderOrder.2
          hcanonicalOrder.1 hcanonicalOrder.2
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hremainder₂Fresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            fresh_eq hsharedFresh hendpointFresh)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hendpointSource)
          (by simpa only [hboundaryZero, B.point_eq] using
            source_eq hsharedSource hcanonical₂Source)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Two faithfully selected four-point rows sharing two distinct carrier
points separate that pair in cyclic order.  This is the boundary-indexed
adapter used below for each edge of the FreshThird three-row triangle. -/
theorem selectedFourClass_sharedPairCyclicSeparation_atBoundary
    {firstCenter secondCenter firstPoint secondPoint : ℝ²}
    (B : BoundaryIndexing D.A)
    (hfirstCenter : firstCenter ∈ D.A)
    (hsecondCenter : secondCenter ∈ D.A)
    (hfirstPoint : firstPoint ∈ D.A)
    (hsecondPoint : secondPoint ∈ D.A)
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (Kfirst : SelectedFourClass D.A firstCenter)
    (Ksecond : SelectedFourClass D.A secondCenter)
    (hfirstPoint_first : firstPoint ∈ Kfirst.support)
    (hsecondPoint_first : secondPoint ∈ Kfirst.support)
    (hfirstPoint_second : firstPoint ∈ Ksecond.support)
    (hsecondPoint_second : secondPoint ∈ Ksecond.support) :
    (SurplusCOMPGBank.btw
        (B.indexOf ⟨firstCenter, hfirstCenter⟩)
        (B.indexOf ⟨secondCenter, hsecondCenter⟩)
        (B.indexOf ⟨firstPoint, hfirstPoint⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨firstCenter, hfirstCenter⟩)
        (B.indexOf ⟨secondCenter, hsecondCenter⟩)
        (B.indexOf ⟨secondPoint, hsecondPoint⟩)) := by
  classical
  let firstCenterLabel : CarrierLabel D.A := ⟨firstCenter, hfirstCenter⟩
  let secondCenterLabel : CarrierLabel D.A := ⟨secondCenter, hsecondCenter⟩
  let firstPointLabel : CarrierLabel D.A := ⟨firstPoint, hfirstPoint⟩
  let secondPointLabel : CarrierLabel D.A := ⟨secondPoint, hsecondPoint⟩
  have hcentersLabel : firstCenterLabel ≠ secondCenterLabel := by
    intro h
    exact hcenters (congrArg Subtype.val h)
  have hpointsLabel : firstPointLabel ≠ secondPointLabel := by
    intro h
    exact hpoints (congrArg Subtype.val h)
  rcases exists_faithfulCarrierPattern_with_two_classes D.K4
      hfirstCenter hsecondCenter hcenters Kfirst Ksecond with
    ⟨Frows, hFfirst, hFsecond⟩
  let rowAt : (center : CarrierLabel D.A) →
      SelectedFourClass D.A center.1 :=
    fun center ↦ Frows.classAt center.1 center.2
  have hfirstPoint_rowAtFirst :
      firstPointLabel.1 ∈ (rowAt firstCenterLabel).support := by
    rw [show (rowAt firstCenterLabel).support = Kfirst.support by
      simpa [rowAt, firstCenterLabel] using hFfirst]
    exact hfirstPoint_first
  have hsecondPoint_rowAtFirst :
      secondPointLabel.1 ∈ (rowAt firstCenterLabel).support := by
    rw [show (rowAt firstCenterLabel).support = Kfirst.support by
      simpa [rowAt, firstCenterLabel] using hFfirst]
    exact hsecondPoint_first
  have hfirstPoint_rowAtSecond :
      firstPointLabel.1 ∈ (rowAt secondCenterLabel).support := by
    rw [show (rowAt secondCenterLabel).support = Ksecond.support by
      simpa [rowAt, secondCenterLabel] using hFsecond]
    exact hfirstPoint_second
  have hsecondPoint_rowAtSecond :
      secondPointLabel.1 ∈ (rowAt secondCenterLabel).support := by
    rw [show (rowAt secondCenterLabel).support = Ksecond.support by
      simpa [rowAt, secondCenterLabel] using hFsecond]
    exact hsecondPoint_second
  exact selectedFourClass_shared_pair_separated rowAt B.boundary B.indexOf
    B.boundary_ccw B.boundary_injective B.index_injective B.point_eq
    hcentersLabel hpointsLabel hfirstPoint_rowAtFirst
    hsecondPoint_rowAtFirst hfirstPoint_rowAtSecond hsecondPoint_rowAtSecond

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- An exact-support endpoint row turns the source row, fresh row, and endpoint
row into a cyclic-separation triangle.  The three shared pairs are respectively
the two FreshThird sources, the two canonical sources, and the two anonymous
fresh-remainder points. -/
theorem freshThird_exactSupport_threeRowCyclicSeparations
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hrowCenter :
      B.boundary id = Q.source₁.1 ∨ B.boundary id = Q.source₂.1)
    (hsupport :
      DRow.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q) :
    let sourceCenter : CarrierLabel D.A :=
      ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
        (Finset.mem_erase.mp
          (H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
    let freshCenter : CarrierLabel D.A :=
      ⟨H.centerAt Q.source₁.1 Q.source₁.2,
        (Finset.mem_erase.mp
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.center_mem).2⟩
    let endpointCenter : CarrierLabel D.A :=
      ⟨B.boundary id, by
        have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
          Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
        simpa only [B.boundary_image] using hmem⟩
    ∃ remainder₁ remainder₂ : CarrierLabel D.A,
      freshThirdCrossRowFreshRemainder P Pρ C.surface Q =
          {remainder₁.1, remainder₂.1} ∧
        remainder₁ ≠ remainder₂ ∧
        SharedPairCyclicSeparation B sourceCenter freshCenter
          Q.source₁ Q.source₂ ∧
        SharedPairCyclicSeparation B sourceCenter endpointCenter
          C.surface.firstSource C.surface.secondSource ∧
        SharedPairCyclicSeparation B freshCenter endpointCenter
          remainder₁ remainder₂ := by
  classical
  let Ksource : SelectedFourClass D.A
      (H.centerAt C.surface.firstSource.1 C.surface.firstSource.2) :=
    (H.selectedAt C.surface.firstSource.1
      C.surface.firstSource.2).toSelectedFourClass
  let Kfresh : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toSelectedFourClass
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  have hendpointA : B.boundary id ∈ D.A := by
    have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
    simpa only [B.boundary_image] using hmem
  let endpointCenter : CarrierLabel D.A := ⟨B.boundary id, hendpointA⟩
  change ∃ remainder₁ remainder₂ : CarrierLabel D.A,
    freshThirdCrossRowFreshRemainder P Pρ C.surface Q =
        {remainder₁.1, remainder₂.1} ∧
      remainder₁ ≠ remainder₂ ∧
      SharedPairCyclicSeparation B sourceCenter freshCenter
        Q.source₁ Q.source₂ ∧
      SharedPairCyclicSeparation B sourceCenter endpointCenter
        C.surface.firstSource C.surface.secondSource ∧
      SharedPairCyclicSeparation B freshCenter endpointCenter
        remainder₁ remainder₂
  have hremainderCard :
      (freshThirdCrossRowFreshRemainder P Pρ C.surface Q).card = 2 :=
    freshThirdCrossRowFreshRemainder_card_eq_two
      P Pρ C.surface Q overlap_eq
  rcases Finset.card_eq_two.mp hremainderCard with
    ⟨remainder₁, remainder₂, hremainderNe, hremainderEq⟩
  have hremainder₁Mem :
      remainder₁ ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
    rw [hremainderEq]
    simp
  have hremainder₂Mem :
      remainder₂ ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
    rw [hremainderEq]
    simp
  have hremainder₁Fresh : remainder₁ ∈ Kfresh.support := by
    exact (Finset.mem_sdiff.mp hremainder₁Mem).1
  have hremainder₂Fresh : remainder₂ ∈ Kfresh.support := by
    exact (Finset.mem_sdiff.mp hremainder₂Mem).1
  let remainder₁Label : CarrierLabel D.A :=
    ⟨remainder₁, Kfresh.support_subset_A hremainder₁Fresh⟩
  let remainder₂Label : CarrierLabel D.A :=
    ⟨remainder₂, Kfresh.support_subset_A hremainder₂Fresh⟩
  have hsourceEndpoint : sourceCenter.1 ≠ endpointCenter.1 := by
    have hendpointMem : endpointCenter.1 ∈ Ksource.support := by
      rcases hrowCenter with hrowCenter | hrowCenter
      · simpa [endpointCenter, Ksource, hrowCenter] using source₁_mem
      · simpa [endpointCenter, Ksource, hrowCenter] using source₂_mem
    exact (ne_of_mem_of_not_mem hendpointMem Ksource.center_not_mem).symm
  have hfreshEndpoint : freshCenter.1 ≠ endpointCenter.1 := by
    have hendpointMem : endpointCenter.1 ∈ Kfresh.support := by
      rcases hrowCenter with hrowCenter | hrowCenter
      · simpa [endpointCenter, Kfresh, hrowCenter] using
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support
      · simpa [endpointCenter, Kfresh, hrowCenter] using
          Q.source₂_mem_source₁_shell
    exact (ne_of_mem_of_not_mem hendpointMem Kfresh.center_not_mem).symm
  have hfirstCanonicalSource :
      C.surface.firstSource.1 ∈ Ksource.support := by
    change C.surface.firstSource.1 ∈
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hsecondCanonicalSource :
      C.surface.secondSource.1 ∈ Ksource.support := by
    change C.surface.secondSource.1 ∈
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hfirstCanonicalEndpoint :
      C.surface.firstSource.1 ∈ DRow.support := by
    rw [hsupport]
    simp
  have hsecondCanonicalEndpoint :
      C.surface.secondSource.1 ∈ DRow.support := by
    rw [hsupport]
    simp
  have hremainder₁Endpoint : remainder₁ ∈ DRow.support := by
    rw [hsupport]
    exact Finset.mem_union.mpr (Or.inr hremainder₁Mem)
  have hremainder₂Endpoint : remainder₂ ∈ DRow.support := by
    rw [hsupport]
    exact Finset.mem_union.mpr (Or.inr hremainder₂Mem)
  have hsourceFreshSeparation :
      SharedPairCyclicSeparation B sourceCenter freshCenter
        Q.source₁ Q.source₂ := by
    simpa [SharedPairCyclicSeparation, sourceCenter, freshCenter] using
      selectedFourClass_sharedPairCyclicSeparation_atBoundary
        B sourceCenter.2 freshCenter.2
        Q.source₁.2 Q.source₂.2 centers_ne
        (fun h ↦ Q.sources_ne (Subtype.ext h)) Ksource Kfresh
        source₁_mem source₂_mem
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
        Q.source₂_mem_source₁_shell
  have hsourceEndpointSeparation :
      SharedPairCyclicSeparation B sourceCenter endpointCenter
        C.surface.firstSource C.surface.secondSource := by
    simpa [SharedPairCyclicSeparation, sourceCenter, endpointCenter] using
      selectedFourClass_sharedPairCyclicSeparation_atBoundary
        B sourceCenter.2 endpointCenter.2
        C.surface.firstSource.2 C.surface.secondSource.2
        hsourceEndpoint C.surface.sources_ne Ksource DRow
        hfirstCanonicalSource hsecondCanonicalSource
        hfirstCanonicalEndpoint hsecondCanonicalEndpoint
  have hfreshEndpointSeparation :
      SharedPairCyclicSeparation B freshCenter endpointCenter
        remainder₁Label remainder₂Label := by
    simpa [SharedPairCyclicSeparation, freshCenter, endpointCenter,
      remainder₁Label, remainder₂Label] using
      selectedFourClass_sharedPairCyclicSeparation_atBoundary
        B freshCenter.2 endpointCenter.2
        remainder₁Label.2 remainder₂Label.2 hfreshEndpoint
        hremainderNe Kfresh DRow hremainder₁Fresh hremainder₂Fresh
        hremainder₁Endpoint hremainder₂Endpoint
  refine ⟨remainder₁Label, remainder₂Label, ?_, ?_,
    hsourceFreshSeparation, hsourceEndpointSeparation,
    hfreshEndpointSeparation⟩
  · simpa [remainder₁Label, remainder₂Label] using hremainderEq
  · intro h
    exact hremainderNe (congrArg Subtype.val h)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact-support arm of the pinned FreshThird residual is impossible.
Cut the retained boundary at the source point not used as the endpoint.  The
three source-produced shared-pair separations then reduce directly to the
six-point two-triple-row Euclidean obstruction above. -/
private theorem false_of_freshThird_exactSupport_cyclicTriangle
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hrowCenter :
      B.boundary id = Q.source₁.1 ∨ B.boundary id = Q.source₂.1)
    (hsupport :
      DRow.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q) :
    False := by
  classical
  let Ksource : SelectedFourClass D.A
      (H.centerAt C.surface.firstSource.1 C.surface.firstSource.2) :=
    (H.selectedAt C.surface.firstSource.1
      C.surface.firstSource.2).toSelectedFourClass
  let Kfresh : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toSelectedFourClass
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  have hendpointA : B.boundary id ∈ D.A := by
    have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
    simpa only [B.boundary_image] using hmem
  let endpointLabel : CarrierLabel D.A := ⟨B.boundary id, hendpointA⟩
  let sharedPoint : CarrierLabel D.A :=
    if B.boundary id = Q.source₁.1 then Q.source₂ else Q.source₁
  have hn : 0 < B.n := Nat.zero_lt_of_lt id.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
  let cut : Fin B.n := B.indexOf sharedPoint
  let boundary : Fin B.n → ℝ² := fun point ↦ B.boundary (point + cut)
  have hboundaryInjective : Function.Injective boundary := by
    simpa only [boundary] using injective_cyclicShift B.boundary_injective cut
  have hboundaryImage : Finset.univ.image boundary = D.A := by
    calc
      Finset.univ.image boundary = Finset.univ.image B.boundary := by
        simpa only [boundary] using image_univ_cyclicShift B.boundary cut
      _ = D.A := B.boundary_image
  have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
    simpa only [boundary] using
      isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw cut
  let Bshift : BoundaryIndexing D.A :=
    Census554.ZeroCutBoundaryIndexing.boundaryIndexingOfBoundary
      boundary hboundaryInjective hboundaryImage hboundaryCcw
  letI : NeZero Bshift.n := ⟨by
    change B.n ≠ 0
    exact Nat.ne_of_gt hn⟩
  have hshiftZero : Bshift.boundary (0 : Fin Bshift.n) = sharedPoint.1 := by
    change B.boundary ((0 : Fin B.n) + cut) = sharedPoint.1
    simpa [cut] using B.point_eq sharedPoint
  let idShift : Fin Bshift.n := Bshift.indexOf endpointLabel
  have hcenterShift : B.boundary id = Bshift.boundary idShift := by
    symm
    exact Bshift.point_eq endpointLabel
  let DRowShift : SelectedFourClass D.A (Bshift.boundary idShift) :=
    transportFreshThirdSelectedFourClass DRow hcenterShift
  have hrowCenterShift :
      Bshift.boundary idShift = Q.source₁.1 ∨
        Bshift.boundary idShift = Q.source₂.1 := by
    rw [Bshift.point_eq]
    exact hrowCenter
  have hsupportShift :
      DRowShift.support =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∪
          freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
    simpa [DRowShift] using hsupport
  have hcyclic :=
    freshThird_exactSupport_threeRowCyclicSeparations
      (P := P) (Pρ := Pρ) C Q hexact centers_ne source₁_mem source₂_mem
      overlap_eq Bshift idShift DRowShift hrowCenterShift hsupportShift
  have hendpointShiftA : Bshift.boundary idShift ∈ D.A := by
    have hmem : Bshift.boundary idShift ∈
        Finset.univ.image Bshift.boundary :=
      Finset.mem_image.mpr ⟨idShift, Finset.mem_univ _, rfl⟩
    simpa only [Bshift.boundary_image] using hmem
  let endpointCenter : CarrierLabel D.A :=
    ⟨Bshift.boundary idShift, hendpointShiftA⟩
  change ∃ remainder₁ remainder₂ : CarrierLabel D.A,
      freshThirdCrossRowFreshRemainder P Pρ C.surface Q =
          {remainder₁.1, remainder₂.1} ∧
        remainder₁ ≠ remainder₂ ∧
        SharedPairCyclicSeparation Bshift sourceCenter freshCenter
          Q.source₁ Q.source₂ ∧
        SharedPairCyclicSeparation Bshift sourceCenter endpointCenter
          C.surface.firstSource C.surface.secondSource ∧
        SharedPairCyclicSeparation Bshift freshCenter endpointCenter
          remainder₁ remainder₂ at hcyclic
  rcases hcyclic with
    ⟨remainder₁, remainder₂, hremainderEq, _hremainderNe,
      hsourceFresh, hsourceEndpoint, hfreshEndpoint⟩
  have hendpointEq : endpointCenter = endpointLabel := by
    apply Subtype.ext
    exact Bshift.point_eq endpointLabel
  have hsharedSource : sharedPoint.1 ∈ Ksource.support := by
    by_cases hfirst : B.boundary id = Q.source₁.1
    · simpa [sharedPoint, hfirst, Ksource] using source₂_mem
    · simpa [sharedPoint, hfirst, Ksource] using source₁_mem
  have hsharedFresh : sharedPoint.1 ∈ Kfresh.support := by
    by_cases hfirst : B.boundary id = Q.source₁.1
    · simpa [sharedPoint, hfirst, Kfresh] using
        Q.source₂_mem_source₁_shell
    · simpa [sharedPoint, hfirst, Kfresh] using
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
  have hendpointSource : endpointCenter.1 ∈ Ksource.support := by
    rw [hendpointEq]
    rcases hrowCenter with hfirst | hsecond
    · simpa [endpointLabel, hfirst, Ksource] using source₁_mem
    · simpa [endpointLabel, hsecond, Ksource] using source₂_mem
  have hendpointFresh : endpointCenter.1 ∈ Kfresh.support := by
    rw [hendpointEq]
    rcases hrowCenter with hfirst | hsecond
    · simpa [endpointLabel, hfirst, Kfresh] using
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
    · simpa [endpointLabel, hsecond, Kfresh] using
        Q.source₂_mem_source₁_shell
  have hcanonical₁Source : C.surface.firstSource.1 ∈ Ksource.support := by
    change C.surface.firstSource.1 ∈
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hcanonical₂Source : C.surface.secondSource.1 ∈ Ksource.support := by
    change C.surface.secondSource.1 ∈
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hremainder₁Fresh : remainder₁.1 ∈ Kfresh.support := by
    have hmem : remainder₁.1 ∈
        freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
      rw [hremainderEq]
      simp
    exact (Finset.mem_sdiff.mp hmem).1
  have hremainder₂Fresh : remainder₂.1 ∈ Kfresh.support := by
    have hmem : remainder₂.1 ∈
        freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
      rw [hremainderEq]
      simp
    exact (Finset.mem_sdiff.mp hmem).1
  have hsourceFresh' :
      SharedPairCyclicSeparation Bshift sourceCenter freshCenter
        endpointCenter sharedPoint := by
    by_cases hfirst : B.boundary id = Q.source₁.1
    · have hendpoint : endpointCenter = Q.source₁ := by
        apply Subtype.ext
        simpa [hendpointEq, endpointLabel] using hfirst
      have hshared : sharedPoint = Q.source₂ := by
        simp [sharedPoint, hfirst]
      simpa [hendpoint, hshared] using hsourceFresh
    · have hsecond : B.boundary id = Q.source₂.1 :=
        hrowCenter.resolve_left hfirst
      have hendpoint : endpointCenter = Q.source₂ := by
        apply Subtype.ext
        simpa [hendpointEq, endpointLabel] using hsecond
      have hshared : sharedPoint = Q.source₁ := by
        simp [sharedPoint, hfirst]
      simpa [hendpoint, hshared] using hsourceFresh.swap
  have hsharedIndexZero : (Bshift.indexOf sharedPoint).val = 0 := by
    have hindex : Bshift.indexOf sharedPoint = 0 := by
      apply Bshift.boundary_injective
      rw [Bshift.point_eq, hshiftZero]
      rfl
    simpa using congrArg Fin.val hindex
  exact false_of_threeRowCyclicSeparationTriangle_at_sharedPointZero
    (D := D) Bshift hsharedIndexZero Ksource Kfresh
    hsharedSource hcanonical₁Source hcanonical₂Source hendpointSource
    hsharedFresh hendpointFresh hremainder₁Fresh hremainder₂Fresh
    hsourceFresh' hsourceEndpoint hfreshEndpoint

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-faithful cap ingress for an escaping FreshThird row point.

The canonical blocker of the escaping point lies in the strict interior of
one indexed cap.  The same witness also retains the exact equal-blocker versus
distinct-blocker alternative.  This is the cap label needed by the remaining
ordered-cap consumer; the previous residual discarded it immediately after
constructing the blocker. -/
theorem freshThird_outsideSeed_blocker_capInterior
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (center : ℝ²) (K : SelectedFourClass D.A center)
    (z : ℝ²) (hzK : z ∈ K.support)
    (_hzOutside :
      z ∉ freshThirdCrossRowTwoShellSeed P Pρ C Q) :
    ∃ blockerCap : Fin 3,
      H.centerAt z (K.support_subset_A hzK) ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase z)
          (H.centerAt z (K.support_subset_A hzK)) ∧
        ((center = H.centerAt z (K.support_subset_A hzK) ∧
            K.support =
              (H.selectedAt z
                (K.support_subset_A hzK)).toCriticalFourShell.support ∧
            ¬ FullyDeletionRobustAt D center) ∨
          (center ≠ H.centerAt z (K.support_subset_A hzK) ∧
            (K.support ∩
              (H.selectedAt z
                (K.support_subset_A hzK)).toCriticalFourShell.support).card ≤ 2)) := by
  have G : TriApexAllLargeContext D S :=
    triApexAllLargeContext_of_residuals (H := H) L N T
  exact
    sourceFaithfulDeletionFan_of_triApexAllLargeContext G K z hzK

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Row-valued normalization of the cap-synchronized deletion-fan outcome.

The generic fan theorem produces a surviving `HasNEquidistantPointsAt 4`
statement in either cross-deletion direction.  For the FreshThird consumer we
retain the exact selected four-row witnessing that survival, including the
fact that it avoids the opposite source.  This is the source-faithful ingress
needed by finite row-pattern and weighted-Kalmanson certificates. -/
theorem
    nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletionRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          ∃ blockerCap : Fin 3,
            H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
              H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
              (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
                (∃ K : SelectedFourClass D.A (H.centerAt z.1 z.2),
                  w.1 ∉ K.support) ∨
                ∃ K : SelectedFourClass D.A (H.centerAt w.1 w.2),
                  z.1 ∉ K.support) := by
  rcases
      nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
        hcenterA Row hfan with
    hnonrobust | ⟨z, w, hzRow, hwRow, hzw, blockerCap,
      hzCap, hwCap, hblockers | hzwSurvives | hwzSurvives⟩
  · exact Or.inl hnonrobust
  · exact Or.inr
      ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCap, hwCap,
        Or.inl hblockers⟩
  · exact Or.inr
      ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCap, hwCap,
        Or.inr (Or.inl
          (exists_selectedFourClass_avoiding_of_deletion_survives
            hzwSurvives))⟩
  · exact Or.inr
      ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCap, hwCap,
        Or.inr (Or.inr
          (exists_selectedFourClass_avoiding_of_deletion_survives
            hwzSurvives))⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Row-valued normalization of the mutual cross-deletion fan outcome.

Away from the nonrobust-center arm, the four-row fan supplies two distinct
row sources whose blocker centers are distinct and whose deletions survive in
both directions.  This formulation retains exact ambient selected four-rows
for both survivals, with the opposite source absent from the corresponding
support.  It also retains the equivalent omissions from the two actual
critical rows.  Thus a finite consumer may use the complete two-way incidence
pattern without treating a `HasNEquidistantPointsAt` witness as an anonymous
Boolean atom or guessing which selected row witnesses survival. -/
theorem nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          w.1 ∉ (H.selectedAt z.1 z.2).toCriticalFourShell.support ∧
          z.1 ∉ (H.selectedAt w.1 w.2).toCriticalFourShell.support ∧
          (∃ Kz : SelectedFourClass D.A (H.centerAt z.1 z.2),
            w.1 ∉ Kz.support) ∧
          (∃ Kw : SelectedFourClass D.A (H.centerAt w.1 w.2),
            z.1 ∉ Kw.support) ∧
          H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  rcases
      nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan
        Row hfan with
    hnonrobust | ⟨z, w, hzRow, hwRow, hzw, hzwSurvives, hwzSurvives,
      hblockersNe⟩
  · exact Or.inl hnonrobust
  · have hwNotMem :
        w.1 ∉ (H.selectedAt z.1 z.2).toCriticalFourShell.support :=
      (cross_deletion_survives_iff_not_mem_selected_support H z.2).mp
        hzwSurvives
    have hzNotMem :
        z.1 ∉ (H.selectedAt w.1 w.2).toCriticalFourShell.support :=
      (cross_deletion_survives_iff_not_mem_selected_support H w.2).mp
        hwzSurvives
    exact Or.inr
      ⟨z, w, hzRow, hwRow, hzw, hwNotMem, hzNotMem,
        exists_selectedFourClass_avoiding_of_deletion_survives hzwSurvives,
        exists_selectedFourClass_avoiding_of_deletion_survives hwzSurvives,
        hblockersNe⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Canonical-row finite image of the no-center arm of a source-faithful fan.

The primitive fan normalization retains deletion-survival propositions.  This
packet rewrites each one as omission from the corresponding canonical exact
four-row.  It introduces no arbitrary row witnesses and no bound on the
ambient carrier. -/
structure SourceFaithfulFanNoCenterBlockerRowWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) : Prop where
  center_ne_actualBlocker : ∀ i : Fin 4, center ≠ F.blockerCenter i
  repeatedCapPair :
    ∃ i j : Fin 4, i ≠ j ∧
        ∃ blockerCap : Fin 3,
          F.blockerCenter i ∈ S.capInteriorByIndex blockerCap ∧
            F.blockerCenter j ∈ S.capInteriorByIndex blockerCap ∧
            (F.blockerCenter i = F.blockerCenter j ∨
              (F.source j).1 ∉
                (F.blockerRow i).toCriticalFourShell.support ∨
              (F.source i).1 ∉
                (F.blockerRow j).toCriticalFourShell.support)
  mutualCrossRows :
    ∃ i j : Fin 4, i ≠ j ∧
        (F.source j).1 ∉ (F.blockerRow i).toCriticalFourShell.support ∧
        (F.source i).1 ∉ (F.blockerRow j).toCriticalFourShell.support ∧
        F.blockerCenter i ≠ F.blockerCenter j

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Convert the primitive no-center witness to its canonical-row finite
image. -/
theorem sourceFaithfulFan_noCenterBlockerRowWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (W : IndexedSourceFaithfulSelectedFourFan.NoCenterBlockerWitness F) :
    SourceFaithfulFanNoCenterBlockerRowWitness F := by
  refine
    { center_ne_actualBlocker := W.center_ne_actualBlocker
      repeatedCapPair := ?_
      mutualCrossRows := ?_ }
  · rcases W.repeatedCapPair with
      ⟨i, j, hij, blockerCap, hiCap, hjCap,
        hblockers | hzwSurvives | hwzSurvives⟩
    · exact
        ⟨i, j, hij, blockerCap, hiCap, hjCap,
          Or.inl hblockers⟩
    · exact
        ⟨i, j, hij, blockerCap, hiCap, hjCap,
          Or.inr (Or.inl
            (by
              simpa [IndexedSourceFaithfulSelectedFourFan.blockerRow] using
                ((cross_deletion_survives_iff_not_mem_selected_support H
                    (F.source i).2).mp hzwSurvives)))⟩
    · exact
        ⟨i, j, hij, blockerCap, hiCap, hjCap,
          Or.inr (Or.inr
            (by
              simpa [IndexedSourceFaithfulSelectedFourFan.blockerRow] using
                ((cross_deletion_survives_iff_not_mem_selected_support H
                    (F.source j).2).mp hwzSurvives)))⟩
  · rcases W.mutualCrossRows with
      ⟨i, j, hij, hijSurvives, hjiSurvives, hblockersNe⟩
    have hwNotMem :
        (F.source j).1 ∉
          (F.blockerRow i).toCriticalFourShell.support := by
      simpa [IndexedSourceFaithfulSelectedFourFan.blockerRow] using
        ((cross_deletion_survives_iff_not_mem_selected_support H
            (F.source i).2).mp hijSurvives)
    have hzNotMem :
        (F.source i).1 ∉
          (F.blockerRow j).toCriticalFourShell.support := by
      simpa [IndexedSourceFaithfulSelectedFourFan.blockerRow] using
        ((cross_deletion_survives_iff_not_mem_selected_support H
            (F.source j).2).mp hjiSurvives)
    exact
      ⟨i, j, hij, hwNotMem, hzNotMem, hblockersNe⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Exact source-clean fan split used by the pinned-endpoint bounded query.

The first arm retains the actual source responsible for nonrobustness.  The
second arm simultaneously retains the same-cap and mutual-deletion row
packets, rather than choosing one coarse consequence and forgetting the
other. -/
theorem centerBlocker_or_sourceFaithfulFanNoCenterBlockerRowWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) :
    Nonempty (IndexedSourceFaithfulSelectedFourFan.CenterBlockerWitness F) ∨
      SourceFaithfulFanNoCenterBlockerRowWitness F := by
  rcases F.centerBlocker_or_noCenterBlockerWitness with hcenter | hnoCenter
  · exact Or.inl hcenter
  · exact Or.inr (sourceFaithfulFan_noCenterBlockerRowWitness F hnoCenter)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Equal actual blockers turn two sources of one selected row into a shared
pair with the canonical blocker row.  Consequently the two sources must lie
on opposite boundary arcs between the row center and their common blocker.

This is the source adapter for the collision arm of the pinned-endpoint fan:
all metric work is discharged here.  A remaining consumer only has to produce
the opposite, nonalternating boundary placement from the retained endpoint
and cap packet. -/
theorem selectedFourClass_actualBlockerCollision_pair_separated
    (B : BoundaryIndexing D.A)
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) (hwRow : w.1 ∈ Row.support)
    (hzw : z ≠ w)
    (hcenterNe : center ≠ H.centerAt z.1 z.2)
    (hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2) :
    (SurplusCOMPGBank.btw
        (B.indexOf ⟨center, hcenterA⟩)
        (B.indexOf (H.blockerVertex z))
        (B.indexOf z) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨center, hcenterA⟩)
        (B.indexOf (H.blockerVertex z))
        (B.indexOf w)) := by
  classical
  let BlockerRow : SelectedFourClass D.A (H.centerAt z.1 z.2) :=
    (H.selectedAt z.1 z.2).toCriticalFourShell.toSelectedFourClass
  have hzBlocker : z.1 ∈ BlockerRow.support := by
    simpa [BlockerRow, CriticalFourShell.toSelectedFourClass] using
      (H.selectedAt z.1 z.2).toCriticalFourShell.q_mem_support
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq H z.2 w.2 hblockers
  have hwBlocker : w.1 ∈ BlockerRow.support := by
    change w.1 ∈
      (H.selectedAt z.1 z.2).toCriticalFourShell.support
    rw [hsupports]
    exact (H.selectedAt w.1 w.2).toCriticalFourShell.q_mem_support
  have hzwVal : z.1 ≠ w.1 := by
    intro h
    exact hzw (Subtype.ext h)
  simpa [CriticalShellSystem.blockerVertex] using
    (selectedFourClass_sharedPairCyclicSeparation_atBoundary
      (D := D) B hcenterA (H.blockerVertex z).2 z.2 w.2
      hcenterNe hzwVal Row BlockerRow hzRow hwRow hzBlocker hwBlocker)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A robust source-faithful row cannot be centered at the actual blocker of
any one of its sources.  The two branches of the pointwise fan rule both
exclude that equality: the equal-center branch records nonrobustness, while
the distinct-center branch records the inequality directly. -/
theorem selectedFourClass_center_ne_actualBlocker_of_fan_robust
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hrobust : FullyDeletionRobustAt D center)
    (z : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) :
    center ≠ H.centerAt z.1 z.2 := by
  rcases hfan z.1 hzRow with ⟨_, _, _, hsame | hdistinct⟩
  · intro hcenter
    exact hsame.2.2 hrobust
  · exact hdistinct.1

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Certificate-facing contradiction for the collision arm.  Once a producer
places the equal-blocker source pair on the same boundary arc between the row
center and common blocker, the checked shared-pair separation theorem closes
the arm at arbitrary carrier cardinality. -/
theorem false_of_selectedFourClass_actualBlockerCollision_nonalternating
    (B : BoundaryIndexing D.A)
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) (hwRow : w.1 ∈ Row.support)
    (hzw : z ≠ w)
    (hcenterNe : center ≠ H.centerAt z.1 z.2)
    (hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2)
    (hsame :
      SurplusCOMPGBank.btw
          (B.indexOf ⟨center, hcenterA⟩)
          (B.indexOf (H.blockerVertex z))
          (B.indexOf z) ↔
        SurplusCOMPGBank.btw
          (B.indexOf ⟨center, hcenterA⟩)
          (B.indexOf (H.blockerVertex z))
          (B.indexOf w)) :
    False := by
  have hseparated :=
    selectedFourClass_actualBlockerCollision_pair_separated
      (D := D) (H := H) B hcenterA Row z w hzRow hwRow hzw
        hcenterNe hblockers
  by_cases hzArc :
      SurplusCOMPGBank.btw
        (B.indexOf ⟨center, hcenterA⟩)
        (B.indexOf (H.blockerVertex z))
        (B.indexOf z)
  · exact (hseparated.mp hzArc) (hsame.mp hzArc)
  · have hwArcNot :
        ¬ SurplusCOMPGBank.btw
          (B.indexOf ⟨center, hcenterA⟩)
          (B.indexOf (H.blockerVertex z))
          (B.indexOf w) := by
      intro hwArc
      exact hzArc (hsame.mpr hwArc)
    exact hzArc (hseparated.mpr hwArcNot)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Fan-facing form of the equal-blocker collision consumer.  Robustness
supplies the only additional fact needed by the shared-pair adapter: the row
center differs from the common actual blocker. -/
theorem false_of_sourceFaithfulFan_blockerCollision_nonalternating
    (B : BoundaryIndexing D.A)
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hrobust : FullyDeletionRobustAt D center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) (hwRow : w.1 ∈ Row.support)
    (hzw : z ≠ w)
    (hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2)
    (hsame :
      SurplusCOMPGBank.btw
          (B.indexOf ⟨center, hcenterA⟩)
          (B.indexOf (H.blockerVertex z))
          (B.indexOf z) ↔
        SurplusCOMPGBank.btw
          (B.indexOf ⟨center, hcenterA⟩)
          (B.indexOf (H.blockerVertex z))
          (B.indexOf w)) :
    False := by
  exact false_of_selectedFourClass_actualBlockerCollision_nonalternating
    (D := D) (H := H) B hcenterA Row z w hzRow hwRow hzw
      (selectedFourClass_center_ne_actualBlocker_of_fan_robust
        (D := D) (S := S) (H := H) Row hfan hrobust z hzRow)
      hblockers hsame

/-- The complete source image consumed by the pinned-endpoint fan query.

This packet deliberately keeps the FreshThird source objects in its type.  In
particular, the six-point seed, endpoint naming, boundary order, cap placement,
and exact fan are transported together; an exporter cannot replace them by an
unrelated finite incidence pattern.  The ambient carrier remains arbitrary. -/
structure FreshThirdPinnedEndpointOutsideSeedQueryPacket
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (center : ℝ²) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (freshCap rowCap : Fin 3) where
  exactRow : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q
  seedOverlap :
    (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support =
      {Q.source₁.1, Q.source₂.1}
  endpointNames :
    (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
        qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
      (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
        qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩)
  orderedRow :
    FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
      B.boundary qOutside
      (B.indexOf
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
      qBetween
      (B.indexOf
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
      (B.indexOf ⟨C.surface.firstSource.1,
        C.surface.firstSource.2⟩)
  center_mem_seed :
    center ∈ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q
  center_location :
    center ∈
        ({C.surface.firstSource.1, C.surface.secondSource.1,
          Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
      center ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q
  center_ne_source :
    center ≠ H.centerAt C.surface.firstSource.1 C.surface.firstSource.2
  center_ne_fresh :
    center ≠ H.centerAt Q.source₁.1 Q.source₁.2
  seed_multiplicity : ∀ shellRadius : ℝ, 0 < shellRadius →
    ((SelectedClass D.A center shellRadius) ∩
      freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card ≤ 3
  endpoint_center :
    B.boundary id = Q.source₁.1 ∨ B.boundary id = Q.source₂.1
  source_center_first_cap :
    H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
      S.capInteriorByIndex S.oppIndex1
  fresh_cap_ne_first : freshCap ≠ S.oppIndex1
  fresh_center_cap :
    H.centerAt Q.source₁.1 Q.source₁.2 ∈
      S.capInteriorByIndex freshCap
  endpoints_outside_first :
    Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
      Q.source₂.1 ∉ S.capByIndex S.oppIndex1
  orderedRowAt : FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
    B.boundary
    qOutside
    (B.indexOf
      ⟨H.centerAt Q.source₁.1 Q.source₁.2,
        (Finset.mem_erase.mp
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
    qBetween
    (B.indexOf
      ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
        (Finset.mem_erase.mp
          (H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
    (B.indexOf ⟨C.surface.firstSource.1,
      C.surface.firstSource.2⟩)
    id DRow rowCap
  row_center_cap : B.boundary id ∈ S.capByIndex rowCap
  row_cap_ne_first : rowCap ≠ S.oppIndex1
  row_cap_inside : (DRow.support ∩ S.capByIndex rowCap).card ≤ 2
  row_cap_outside : 2 ≤ (DRow.support \ S.capByIndex rowCap).card
  seed_card :
    (freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card = 6
  fan : IndexedPinnedEndpointOutsideSeedFan D S H
    (freshThirdCrossRowTwoShellSeed P Pρ C.surface Q)
    center (B.boundary id) DRow

/-- Arbitrary-cardinality extraction of the complete query packet from the
live residual hypotheses.  Only the exact four-row supports are indexed; no
upper bound is imposed on `D.A`. -/
noncomputable def FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hnames :
      (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩))
    (hrow : FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
      B.boundary qOutside
      (B.indexOf
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
      qBetween
      (B.indexOf
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
      (B.indexOf ⟨C.surface.firstSource.1,
        C.surface.firstSource.2⟩))
    (center : ℝ²) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenterSeed :
      center ∈ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q)
    (hcenterLocation :
      center ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1,
            Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
        center ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q)
    (hcenterNeSource :
      center ≠ H.centerAt C.surface.firstSource.1 C.surface.firstSource.2)
    (hcenterNeFresh :
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (hmult : ∀ shellRadius : ℝ, 0 < shellRadius →
      ((SelectedClass D.A center shellRadius) ∩
        freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card ≤ 3)
    (hrowCenter :
      B.boundary id = Q.source₁.1 ∨ B.boundary id = Q.source₂.1)
    (hsourceCenterFirst :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (freshCap : Fin 3) (hfreshCapNeFirst : freshCap ≠ S.oppIndex1)
    (hfreshCenterCap :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hsource₁OutsideFirst : Q.source₁.1 ∉ S.capByIndex S.oppIndex1)
    (hsource₂OutsideFirst : Q.source₂.1 ∉ S.capByIndex S.oppIndex1)
    (rowCap : Fin 3)
    (hrowAt : FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
      B.boundary
      qOutside
      (B.indexOf
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
      qBetween
      (B.indexOf
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
      (B.indexOf ⟨C.surface.firstSource.1,
        C.surface.firstSource.2⟩)
      id DRow rowCap)
    (hrowCenterCap : B.boundary id ∈ S.capByIndex rowCap)
    (hrowCapNeFirst : rowCap ≠ S.oppIndex1)
    (hrowCapInside : (DRow.support ∩ S.capByIndex rowCap).card ≤ 2)
    (hrowCapOutside : 2 ≤ (DRow.support \ S.capByIndex rowCap).card)
    (hterminal :
      (center ≠ B.boundary id ∧
          (∃ z ∈ DRow.support,
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
          ∃ K : SelectedFourClass D.A center,
            (∃ z ∈ K.support,
              z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
            SourceFaithfulSelectedFourDeletionFan D S H K) ∨
        center = B.boundary id ∧
          (∃ z ∈ DRow.support,
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
          SourceFaithfulSelectedFourDeletionFan D S H DRow) :
    FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap := by
  have hcenterA : center ∈ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier
      (P := P) (Pρ := Pρ) C.surface Q hcenterSeed
  exact
    { exactRow := hexact
      seedOverlap := overlap_eq
      endpointNames := hnames
      orderedRow := hrow
      center_mem_seed := hcenterSeed
      center_location := hcenterLocation
      center_ne_source := hcenterNeSource
      center_ne_fresh := hcenterNeFresh
      seed_multiplicity := hmult
      endpoint_center := hrowCenter
      source_center_first_cap := hsourceCenterFirst
      fresh_cap_ne_first := hfreshCapNeFirst
      fresh_center_cap := hfreshCenterCap
      endpoints_outside_first :=
        ⟨hsource₁OutsideFirst, hsource₂OutsideFirst⟩
      orderedRowAt := hrowAt
      row_center_cap := hrowCenterCap
      row_cap_ne_first := hrowCapNeFirst
      row_cap_inside := hrowCapInside
      row_cap_outside := hrowCapOutside
      seed_card :=
        freshThirdCrossRowTwoShellSeed_card_eq_six
          P Pρ C.surface Q overlap_eq
      fan := IndexedPinnedEndpointOutsideSeedFan.ofEndpointSplit
        hcenterA DRow hterminal }

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the endpoint row contributes two witnesses to the distinguished first
cap, then its pinned endpoint center and those witnesses form a genuine
Dumitrescu cap-witness packet.

This is the exact source-to-literature adapter.  It deliberately retains the
cardinality premise: the current pinned-fan source packet does not prove that
two row witnesses lie in the first cap. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.firstCapWitnessPacket
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (htwo :
      2 ≤ (DRow.support ∩ S.capByIndex S.oppIndex1).card) :
    Nonempty (SelectedFourCapWitnessPacket D.A
      (S.capByIndex S.oppIndex1) (B.boundary id) DRow) := by
  have hcenterA : B.boundary id ∈ D.A := by
    have hcenterImage :
        B.boundary id ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
    simpa only [B.boundary_image] using hcenterImage
  have hcenterOutside : B.boundary id ∉ S.capByIndex S.oppIndex1 := by
    rcases Packet.endpoint_center with hcenter | hcenter
    · rw [hcenter]
      exact Packet.endpoints_outside_first.1
    · rw [hcenter]
      exact Packet.endpoints_outside_first.2
  exact DRow.nonempty_capWitnessPacket_of_two_mem
    hcenterA hcenterOutside htwo

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Exhaustive first-cap reduction for the endpoint row.  Either the literature
cap-witness consumer receives a genuine source-produced pair, or the remaining
source problem has the strictly sharper incidence constraint that the endpoint
row meets the first cap in at most one witness. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.firstCapWitnessPacket_or_card_le_one
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    Nonempty (SelectedFourCapWitnessPacket D.A
        (S.capByIndex S.oppIndex1) (B.boundary id) DRow) ∨
      (DRow.support ∩ S.capByIndex S.oppIndex1).card ≤ 1 := by
  by_cases htwo : 2 ≤ (DRow.support ∩ S.capByIndex S.oppIndex1).card
  · exact Or.inl
      (FreshThirdPinnedEndpointOutsideSeedQueryPacket.firstCapWitnessPacket
        (P := P) (Pρ := Pρ) (C := C) (Q := Q) (B := B)
        (qOutside := qOutside) (qBetween := qBetween) (center := center)
        (id := id) (DRow := DRow) (freshCap := freshCap)
        (rowCap := rowCap) Packet htwo)
  · exact Or.inr (by omega)

/-- Source-proved robustness data for a pinned center distinct from all three
rich apices.  Keeping this as a separate packet prevents the robust branch of
the normalization from forgetting the hypotheses needed to choose deletion
successors at the same center. -/
structure FreshThirdPinnedRobustCenterSeparation (center : ℝ²) : Prop where
  robust : FullyDeletionRobustAt D center
  center_ne_oppApex1 : center ≠ S.oppApex1
  center_ne_oppApex2 : center ≠ S.oppApex2
  center_ne_surplusApex : center ≠ S.surplusApex

/-- The synchronized finite image available when the pinned fan center is a
fourth fully robust omitted blocker value, distinct from the three rich
apices.  It retains the robustness/separation data, the canonical-row fan
outcome, and the global four-omission multiplicity outcome; no projection is
discarded. -/
structure FreshThirdPinnedRobustSeparatedOutcome
    (Q : FreshThirdBlockerFiber P Pρ)
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  centerData : FreshThirdPinnedRobustCenterSeparation (S := S) center
  noCenterRows : SourceFaithfulFanNoCenterBlockerRowWitness Packet.fan.fan
  blockerMultiplicity :
    (∃ x y, x ≠ y ∧
        H.blockerVertex x = H.blockerVertex y ∧
        H.blockerVertex x ≠
          H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠
          H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        H.blockerVertex x ≠ H.blockerVertex Q.source₁) ∨
      (∃ x, x ≠ ⟨P.source₁, P.source₁_mem_A⟩ ∧
        x ≠ ⟨P.source₂, P.source₂_mem_A⟩ ∧
        H.blockerVertex x =
          H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩) ∨
      (∃ x, x ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
        x ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩ ∧
        H.blockerVertex x =
          H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) ∨
      ∃ x, x ≠ Q.source₁ ∧ x ≠ Q.source₂ ∧
        H.blockerVertex x = H.blockerVertex Q.source₁

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Geometric normalization of the robust-separated multiplicity packet.

The new-fiber and the two `P`/`Pρ` enlargement arms already fit the existing
source-clean geometric multiplicity API.  Only enlargement of the current
FreshThird `Q` fiber is genuinely new.  This theorem retains that final arm
verbatim and does not invoke any FreshThird contradiction. -/
theorem FreshThirdPinnedRobustSeparatedOutcome.geometricMultiplicity_or_qFiberThirdSource
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (Outcome : FreshThirdPinnedRobustSeparatedOutcome P Pρ Q Packet) :
    CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ ∨
      ∃ x, x ≠ Q.source₁ ∧ x ≠ Q.source₂ ∧
        H.blockerVertex x = H.blockerVertex Q.source₁ := by
  rcases Outcome.blockerMultiplicity with hnew | hfirst | hsecond | hq
  · rcases hnew with ⟨x, y, hxy, hblockers, hneFirst, hneSecond, _⟩
    rcases collisionCrossHit_or_geometricMultiplicity P Pρ
        (Or.inl ⟨x, y, hxy, hblockers, hneFirst, hneSecond⟩) with
      hcross | hgeometric
    · exact Or.inl hcross
    · exact Or.inr (Or.inl hgeometric)
  · rcases collisionCrossHit_or_geometricMultiplicity P Pρ
        (Or.inr (Or.inl hfirst)) with hcross | hgeometric
    · exact Or.inl hcross
    · exact Or.inr (Or.inl hgeometric)
  · rcases collisionCrossHit_or_geometricMultiplicity P Pρ
        (Or.inr (Or.inr hsecond)) with hcross | hgeometric
    · exact Or.inl hcross
    · exact Or.inr (Or.inl hgeometric)
  · exact Or.inr (Or.inr hq)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A genuinely new third source in the `Q` blocker fiber turns the raw
existential multiplicity arm into the finite, source-faithful statement that
the actual blocker fiber has cardinality at least three. -/
theorem qFiber_card_ge_three_of_thirdSource
    (Q : FreshThirdBlockerFiber P Pρ)
    {x : CriticalShellSystem.CarrierVertex D.A}
    (hx₁ : x ≠ Q.source₁)
    (hx₂ : x ≠ Q.source₂)
    (hblocker : H.blockerVertex x = H.blockerVertex Q.source₁) :
    3 ≤ (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card := by
  classical
  let fiber := ATailSurvivalCover.actualBlockerFiber H Q.source₁
  have hsource₁ : Q.source₁ ∈ fiber := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, rfl⟩
  have hsource₂ : Q.source₂ ∈ fiber := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, Q.blockers_eq.symm⟩
  have hx : x ∈ fiber := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hblocker⟩
  have hthree : 2 < fiber.card := by
    rw [Finset.two_lt_card]
    exact
      ⟨Q.source₁, hsource₁, Q.source₂, hsource₂, x, hx,
        Q.sources_ne, hx₁.symm, hx₂.symm⟩
  have hthree' : 3 ≤ fiber.card := by omega
  simpa [fiber] using hthree'

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact-three arm of the `Q` blocker boundary.  Besides recording the
fiber cardinality, it retains the source-clean distinct-center row and the two
deletion successors forced by the missing fourth source. -/
structure FreshThirdQFiberThreeBoundary
    (Q : FreshThirdBlockerFiber P Pρ) where
  card_eq :
    (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 3
  source : CriticalShellSystem.CarrierVertex D.A
  source_mem :
    source.1 ∈
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
  centers_ne :
    H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2
  two_le_difference :
    2 ≤
      ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support \
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support).card
  deletion_successors :
    ∀ w ∈
        (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support \
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support,
      w ≠ source.1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source.1 source.2)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The saturated exact-four arm of the `Q` blocker boundary.  The actual
fiber images onto the complete selected support, so every support deletion is
blocked at the source-proved common `Q` center. -/
structure FreshThirdQFiberFourBoundary
    (Q : FreshThirdBlockerFiber P Pρ) where
  card_eq :
    (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 4
  image_eq :
    (ATailSurvivalCover.actualBlockerFiber H Q.source₁).image
        (fun source => source.1) =
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
  deletions_blocked :
    ∀ w ∈
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt Q.source₁.1 Q.source₁.2)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consumer-facing exact boundary for a `Q` blocker fiber already known to
have cardinality three or four. -/
theorem freshThird_qFiber_three_or_fourBoundary
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcard :
      (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 3 ∨
        (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 4) :
    Nonempty (FreshThirdQFiberThreeBoundary P Pρ Q) ∨
      Nonempty (FreshThirdQFiberFourBoundary P Pρ Q) := by
  rcases hcard with hthree | hfour
  · rcases freshThird_qRow_exact_blocker_boundary (P := P) (Pρ := Pρ) Q with
      ⟨hfour', _⟩ | ⟨source, hsource, hcenters, htwo, hsuccessors⟩
    · omega
    · exact Or.inl ⟨⟨hthree, source, hsource, hcenters, htwo, hsuccessors⟩⟩
  · have himage :=
      ATailSurvivalCover.actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
        H Q.source₁ hfour
    exact Or.inr ⟨⟨hfour, himage,
      freshThird_qRow_saturated_deletions_blocked_at_qCenter
        (P := P) (Pρ := Pρ) Q himage⟩⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Finite-cardinality landing of the robust-separated multiplicity packet.

The only genuinely new geometric arm is now an exact `3`-or-`4` statement
for the actual `Q` blocker fiber: the lower bound comes from the third source,
and the upper bound is the general critical-shell fiber bound.  This remains a
normalization theorem, not a contradiction or a finite-query coverage claim. -/
theorem FreshThirdPinnedRobustSeparatedOutcome.geometricMultiplicity_or_qFiberCard
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (Outcome : FreshThirdPinnedRobustSeparatedOutcome P Pρ Q Packet) :
    CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ ∨
      (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 3 ∨
        (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card = 4 := by
  rcases Outcome.geometricMultiplicity_or_qFiberThirdSource with
    hcross | hgeometric | ⟨x, hx₁, hx₂, hblocker⟩
  · exact Or.inl hcross
  · exact Or.inr (Or.inl hgeometric)
  · have hge :
        3 ≤ (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card :=
      qFiber_card_ge_three_of_thirdSource (P := P) (Pρ := Pρ) Q hx₁ hx₂ hblocker
    have hle :
        (ATailSurvivalCover.actualBlockerFiber H Q.source₁).card ≤ 4 :=
      ATailSurvivalCover.actualBlockerFiber_card_le_four H Q.source₁
    omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Strongest current source-clean normalization of the robust pinned packet:
known multiplicity geometry, an exact-three distinct-center Q-row escape, or
an exact-four saturated Q row whose support deletions are all blocked at the
common Q center. -/
theorem FreshThirdPinnedRobustSeparatedOutcome.geometricMultiplicity_or_qBoundary
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (Outcome : FreshThirdPinnedRobustSeparatedOutcome P Pρ Q Packet) :
    CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ ∨
      Nonempty (FreshThirdQFiberThreeBoundary P Pρ Q) ∨
        Nonempty (FreshThirdQFiberFourBoundary P Pρ Q) := by
  rcases Outcome.geometricMultiplicity_or_qFiberCard with
    hcross | hgeometric | hthree | hfour
  · exact Or.inl hcross
  · exact Or.inr (Or.inl hgeometric)
  · rcases freshThird_qFiber_three_or_fourBoundary (P := P) (Pρ := Pρ) Q
        (Or.inl hthree) with hthreeBoundary | hfourBoundary
    · exact Or.inr (Or.inr (Or.inl hthreeBoundary))
    · exact Or.inr (Or.inr (Or.inr hfourBoundary))
  · rcases freshThird_qFiber_three_or_fourBoundary (P := P) (Pρ := Pρ) Q
        (Or.inr hfour) with hthreeBoundary | hfourBoundary
    · exact Or.inr (Or.inr (Or.inl hthreeBoundary))
    · exact Or.inr (Or.inr (Or.inr hfourBoundary))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
include T hblockersNe in
/-- A robust pinned center away from the three rich apices simultaneously
supplies the canonical-row fan packet and the four-omission multiplicity
packet.  This is the source synchronization needed before any named-role
finite query; it imposes no bound on the ambient carrier. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.robustSeparatedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (hrobust : FullyDeletionRobustAt D center)
    (hcenterNeOpp₁ : center ≠ S.oppApex1)
    (hcenterNeOpp₂ : center ≠ S.oppApex2)
    (hcenterNeSurplus : center ≠ S.surplusApex) :
    FreshThirdPinnedRobustSeparatedOutcome P Pρ Q Packet := by
  have hcenterA : center ∈ D.A :=
    freshThirdCrossRowTwoShellSeed_subset_carrier
      (P := P) (Pρ := Pρ) C.surface Q Packet.center_mem_seed
  have hnoCenter :
      SourceFaithfulFanNoCenterBlockerRowWitness Packet.fan.fan := by
    rcases
        centerBlocker_or_sourceFaithfulFanNoCenterBlockerRowWitness
          Packet.fan.fan with hcenterBlocker | hnoCenter
    · exact (hcenterBlocker.some.nonrobust hrobust).elim
    · exact hnoCenter
  exact
    { centerData :=
        { robust := hrobust
          center_ne_oppApex1 := hcenterNeOpp₁
          center_ne_oppApex2 := hcenterNeOpp₂
          center_ne_surplusApex := hcenterNeSurplus }
      noCenterRows := hnoCenter
      blockerMultiplicity :=
        freshThird_fourOmissionBlockerMultiplicityIngress
          (P := P) (Pρ := Pρ) (T := T) (hblockersNe := hblockersNe)
            Q hcenterA hrobust hcenterNeOpp₁
            hcenterNeOpp₂ hcenterNeSurplus }

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
include T hblockersNe in
/-- Exhaustive source-level split for the pinned center.  The only branches
not covered by the synchronized robust packet are genuine nonrobustness or
equality with one of the three rich apices. -/
theorem
    FreshThirdPinnedEndpointOutsideSeedQueryPacket.nonrobust_or_richApexCenter_or_robustSeparatedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    ¬ FullyDeletionRobustAt D center ∨
      center = S.oppApex1 ∨ center = S.oppApex2 ∨
      center = S.surplusApex ∨
      FreshThirdPinnedRobustSeparatedOutcome P Pρ Q Packet := by
  by_cases hrobust : FullyDeletionRobustAt D center
  · by_cases hcenterOpp₁ : center = S.oppApex1
    · exact Or.inr (Or.inl hcenterOpp₁)
    · by_cases hcenterOpp₂ : center = S.oppApex2
      · exact Or.inr (Or.inr (Or.inl hcenterOpp₂))
      · by_cases hcenterSurplus : center = S.surplusApex
        · exact Or.inr (Or.inr (Or.inr (Or.inl hcenterSurplus)))
        · exact Or.inr (Or.inr (Or.inr (Or.inr
            (FreshThirdPinnedEndpointOutsideSeedQueryPacket.robustSeparatedOutcome
              (P := P) (Pρ := Pρ) (T := T)
              (hblockersNe := hblockersNe) Packet hrobust hcenterOpp₁
                hcenterOpp₂ hcenterSurplus))))
  · exact Or.inl hrobust

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exhaustive center/multiplicity status retained after the selected-four
fan has been normalized to its no-center-blocker arm.  The exact-three and
exact-four constructors deliberately keep their source-clean `Q`-boundary
witnesses; they do not assert any unsupported relocation of blocked deletions
to another center. -/
inductive FreshThirdPinnedNoCenterStatus
    (Q : FreshThirdBlockerFiber P Pρ) (center : ℝ²) : Prop where
  | nonrobust
      (h : ¬ FullyDeletionRobustAt D center)
      (center_ne_oppApex1 : center ≠ S.oppApex1)
      (center_ne_oppApex2 : center ≠ S.oppApex2)
      (center_ne_surplusApex : center ≠ S.surplusApex)
  | firstApex
      (h : center = S.oppApex1)
      (robust : FullyDeletionRobustAt D center)
  | secondApex
      (h : center = S.oppApex2)
      (robust : FullyDeletionRobustAt D center)
  | surplusApex
      (h : center = S.surplusApex)
      (robust : FullyDeletionRobustAt D center)
  | collisionCrossHit
      (centerData : FreshThirdPinnedRobustCenterSeparation (S := S) center)
      (h : CollisionCrossHit P Pρ)
  | geometricMultiplicity
      (centerData : FreshThirdPinnedRobustCenterSeparation (S := S) center)
      (h : GeometricMultiplicityResidual P Pρ)
  | qFiberThree
      (centerData : FreshThirdPinnedRobustCenterSeparation (S := S) center)
      (boundary : Nonempty (FreshThirdQFiberThreeBoundary P Pρ Q))
  | qFiberFour
      (centerData : FreshThirdPinnedRobustCenterSeparation (S := S) center)
      (boundary : Nonempty (FreshThirdQFiberFourBoundary P Pρ Q))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Information-preserving no-center arm of the pinned-endpoint packet.  It
keeps both finite fan consequences together with the exact center or
`Q`-fiber status. -/
structure FreshThirdPinnedNoCenterNormalizedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  noCenterRows :
    SourceFaithfulFanNoCenterBlockerRowWitness Packet.fan.fan
  status : FreshThirdPinnedNoCenterStatus P Pρ Q center

/-- Endpoint-synchronized outside pair selected from the actual fan row.

The two dependent deletion packets and the row-cap label stay attached to the
selected points.  The final disjunction deliberately distinguishes blocker
escape from the two one-sided cross-deletion survivals; it does not identify
the blocker cap with `rowCap`. -/
structure FreshThirdPinnedEndpointOutsidePairFanOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  exists_pair :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Packet.fan.Row.support \ S.capByIndex rowCap,
        ∃ hw : w.1 ∈ Packet.fan.Row.support \ S.capByIndex rowCap,
          z ≠ w ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Packet.fan.Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Packet.fan.Row w.1
              (Finset.mem_sdiff.mp hw).1 ∧
            (H.centerAt z.1 z.2 ∉ S.capByIndex rowCap ∨
              H.centerAt w.1 w.2 ∉ S.capByIndex rowCap ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2))

/-- The exact cap-local consequence of the pinned fan's endpoint split.

In the off-endpoint arm there is no source entitlement placing the fan center
in `rowCap`, so the boundary-row escape is retained verbatim.  In the endpoint
arm the fan row and boundary row have the same support, allowing the generic
outside-pair producer to run without any guessed alignment. -/
inductive FreshThirdPinnedEndpointFanCapOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  | offEndpoint
      (center_ne_boundary : center ≠ B.boundary id)
      (boundaryEscape :
        ∃ z ∈ DRow.support,
          z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q)
  | endpoint
      (center_eq_boundary : center = B.boundary id)
      (support_eq : Packet.fan.Row.support = DRow.support)
      (outsidePair : FreshThirdPinnedEndpointOutsidePairFanOutcome P Pρ Packet)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean endpoint/cap synchronization of the no-center fan arm. -/
theorem FreshThirdPinnedNoCenterNormalizedOutcome.endpointFanCapOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (Outcome : FreshThirdPinnedNoCenterNormalizedOutcome P Pρ Packet) :
    FreshThirdPinnedEndpointFanCapOutcome P Pρ Packet := by
  rcases Packet.fan.endpointSplit with hoff | hendpoint
  · exact .offEndpoint hoff.1 hoff.2
  · rcases hendpoint with ⟨hcenter, hsupport⟩
    have hcenterCap : center ∈ S.capByIndex rowCap := by
      rw [hcenter]
      exact Packet.row_center_cap
    have houtside :
        2 ≤ (Packet.fan.Row.support \ S.capByIndex rowCap).card := by
      simpa only [hsupport] using Packet.row_cap_outside
    rcases Packet.fan.fan.exists_distinct_outsideCap_escape_or_crossDeletion
        Outcome.noCenterRows.center_ne_actualBlocker rowCap hcenterCap houtside with
      ⟨z, w, hz, hw, hzw, hzPacket, hwPacket, hcases⟩
    exact .endpoint hcenter hsupport
      { exists_pair :=
          ⟨z, w, hz, hw, hzw, hzPacket, hwPacket, hcases⟩ }

/-- A source in the pinned fan whose actual blocker is the pinned center.

The witness itself proves that this center is deletion-nonrobust.  Since the
three named apices carry source-proved rich structures, it follows that the
center is distinct from each apex.  This is the strongest unconditional
separation available in the center-blocker branch; it uses apex robustness
only after the witness has identified the center as a genuine blocker. -/
structure FreshThirdPinnedCenterBlockerSeparatedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  witness : Nonempty
    (IndexedSourceFaithfulSelectedFourFan.CenterBlockerWitness Packet.fan.fan)
  center_ne_oppApex1 : center ≠ S.oppApex1
  center_ne_oppApex2 : center ≠ S.oppApex2
  center_ne_surplusApex : center ≠ S.surplusApex

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
include T in
/-- Enrich a center-blocker witness with its source-entitled separation from
the three rich apices. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.centerBlockerSeparatedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (W : IndexedSourceFaithfulSelectedFourFan.CenterBlockerWitness
      Packet.fan.fan) :
    FreshThirdPinnedCenterBlockerSeparatedOutcome P Pρ Packet := by
  have hne₁ : center ≠ S.oppApex1 := by
    intro hcenter
    apply W.nonrobust
    simpa only [hcenter] using
      fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hne₂ : center ≠ S.oppApex2 := by
    intro hcenter
    apply W.nonrobust
    simpa only [hcenter] using
      fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hne₃ : center ≠ S.surplusApex := by
    intro hcenter
    apply W.nonrobust
    simpa only [hcenter] using
      fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  exact
    { witness := ⟨W⟩
      center_ne_oppApex1 := hne₁
      center_ne_oppApex2 := hne₂
      center_ne_surplusApex := hne₃ }

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Three actual common points between the first FreshThird `Q` row and the
pinned selected-four fan row contradict the already-proved distinct-center
two-circle bound.

The full packet already supplies the required center inequality, so this
consumer applies in every normalized fan arm.  No center-blocker witness or
cardinality bound is needed. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_qRow_overlap_card_ge_three
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (hthree :
      3 ≤
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∩
          Packet.fan.Row.support).card) :
    False := by
  exact false_of_centerAt_selectedFourClass_inter_card_ge_three
    H Q.source₁.1 Q.source₁.2 Packet.fan.Row
      Packet.center_ne_fresh.symm hthree

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Three individually blocked deletions from the first FreshThird `Q` row
close a nonrobust pinned-center arm.

The one-point deletion hypotheses are essential: collective blocking after
deleting the whole set, followed by memberwise restoration, does not satisfy
this interface. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_nonrobust_qRow_blocked_deletions
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (hnonrobust : ¬ FullyDeletionRobustAt D center)
    (blocked : Finset ℝ²)
    (hcard : 3 ≤ blocked.card)
    (hsubset :
      blocked ⊆
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hblocked : ∀ x ∈ blocked,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) center) :
    False := by
  apply Packet.false_of_qRow_overlap_card_ge_three
  exact hcard.trans
    (_root_.Problem97.ATailMinimalUniqueFourCover.card_le_inter_selectedFourClass_of_blocked_deletions
      Packet.fan.fan.center_mem Packet.fan.Row
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support
      blocked hsubset hnonrobust hblocked)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility form retaining the normalized center-blocker witness in the
interface.  The contradiction itself is the packet-level theorem above. -/
theorem FreshThirdPinnedCenterBlockerSeparatedOutcome.false_of_qRow_overlap_card_ge_three
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (_Outcome : FreshThirdPinnedCenterBlockerSeparatedOutcome P Pρ Packet)
    (hthree :
      3 ≤
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∩
          Packet.fan.Row.support).card) :
    False :=
  FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_qRow_overlap_card_ge_three
    P Pρ Packet hthree

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Full source-clean normalization boundary for the pinned-endpoint
outside-seed packet.  Either it retains the actual fan source whose blocker is
the pinned center, or it retains both no-center fan packets and the strongest
currently derivable center/`Q` status.  This is cardinality-independent and is
the finite-query ingress contract; the original packet remains available to
every consumer through the parameter. -/
inductive FreshThirdPinnedEndpointOutsideSeedNormalizedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  | centerBlocker
      (outcome : FreshThirdPinnedCenterBlockerSeparatedOutcome P Pρ Packet)
  | noCenter
      (outcome : FreshThirdPinnedNoCenterNormalizedOutcome P Pρ Packet)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
include T hblockersNe in
/-- Produce the full normalized outcome without adding assumptions or losing
either finite fan packet. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.normalizedOutcome
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    FreshThirdPinnedEndpointOutsideSeedNormalizedOutcome P Pρ Packet := by
  rcases
      centerBlocker_or_sourceFaithfulFanNoCenterBlockerRowWitness
        Packet.fan.fan with hcenterBlocker | hnoCenter
  · rcases hcenterBlocker with ⟨W⟩
    exact .centerBlocker
      (FreshThirdPinnedEndpointOutsideSeedQueryPacket.centerBlockerSeparatedOutcome
        (P := P) (Pρ := Pρ) (T := T) Packet W)
  · refine .noCenter { noCenterRows := hnoCenter, status := ?_ }
    rcases Packet.nonrobust_or_richApexCenter_or_robustSeparatedOutcome
        (T := T) (hblockersNe := hblockersNe) with
      hnonrobust | hfirst | hsecond | hsurplus | hseparated
    · refine .nonrobust hnonrobust ?_ ?_ ?_
      · intro hcenter
        apply hnonrobust
        simpa only [hcenter] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
      · intro hcenter
        apply hnonrobust
        simpa only [hcenter] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
      · intro hcenter
        apply hnonrobust
        simpa only [hcenter] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
    · exact .firstApex hfirst (by
        simpa only [hfirst] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich)
    · exact .secondApex hsecond (by
        simpa only [hsecond] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
    · exact .surplusApex hsurplus (by
        simpa only [hsurplus] using
          fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
    · rcases hseparated.geometricMultiplicity_or_qBoundary with
        hcross | hgeometric | hthree | hfour
      · exact .collisionCrossHit hseparated.centerData hcross
      · exact .geometricMultiplicity hseparated.centerData hgeometric
      · exact .qFiberThree hseparated.centerData hthree
      · exact .qFiberFour hseparated.centerData hfour

/-- Exact consumer contract for the normalized pinned-endpoint fan packet.

The two fields are universal over the *actual* witnesses produced by the
source-faithful fan.  In particular, this interface does not identify the
repeated-cap pair with the mutual-cross pair or with the endpoint outside
pair, and it does not add a cyclic placement for any arbitrary fan source.
Those synchronizations must be proved by a source theorem or checked by a
certificate for the complete `Packet`.

This structure is a certificate-facing contract, not a closure result.  Its
purpose is to freeze the weakest exact target whose two fields, together with
`normalizedOutcome`, are sufficient for the live residual. -/
structure FreshThirdPinnedEndpointOutsideSeedIncompatibilityContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) : Prop where
  centerBlocker :
    ∀ outcome : FreshThirdPinnedCenterBlockerSeparatedOutcome P Pρ Packet,
      False
  noCenter :
    ∀ outcome : FreshThirdPinnedNoCenterNormalizedOutcome P Pρ Packet,
      False

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
include T hblockersNe in
/-- The exact normalized fan packet reduces the pinned residual to the two
fields of `FreshThirdPinnedEndpointOutsideSeedIncompatibilityContract`.

This theorem performs only source-clean normalization.  It neither constructs
the contract nor hides an unproved synchronization premise. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_incompatibilityContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (Contract :
      FreshThirdPinnedEndpointOutsideSeedIncompatibilityContract P Pρ Packet) :
    False := by
  rcases
      FreshThirdPinnedEndpointOutsideSeedQueryPacket.normalizedOutcome
        (P := P) (Pρ := Pρ) (T := T) (hblockersNe := hblockersNe) Packet with
    hcenterBlocker | hnoCenter
  · exact Contract.centerBlocker hcenterBlocker
  · exact Contract.noCenter hnoCenter

/-- The finite point names needed by a source-faithful pinned-endpoint query.

The constructors are *roles*, not distinct carrier vertices.  Their actual
aliasing is recovered from `FreshThirdPinnedEndpointOutsideSeedFiniteView.point`
below.  In particular, the query may not assume that two different
constructors denote different points.

Each canonical blocker row receives four support slots.  A blocker center is
not a point of its positive-radius selected row, so representing the center
plus only three anonymous row points (as the former synthetic Python fixture
did) is not source-faithful. -/
inductive FreshThirdPinnedEndpointOutsideSeedPointRole where
  | freshRemainder (i : Fin 2)
  | fanSource (i : Fin 4)
  | boundarySource (i : Fin 4)
  | blockerCenter (i : Fin 4)
  | blockerRowSource (i j : Fin 4)
  | pinnedCenter
  | boundaryCenter
  | canonicalSource
  | canonicalSecondSource
  | freshSourceOne
  | freshSourceTwo
  | sourceCenter
  | freshCenter
deriving DecidableEq, Fintype

/-- The exact selected rows visible to the finite query. -/
inductive FreshThirdPinnedEndpointOutsideSeedRowRole where
  | source
  | fresh
  | boundary
  | fan
  | blocker (i : Fin 4)
deriving DecidableEq, Fintype

/-- The exact six roles comprising the union of the source and fresh rows.

The packet proves that these roles denote six distinct carrier points; the
constructors themselves remain only names until interpreted by a finite view. -/
def freshThirdPinnedEndpointOutsideSeedSeedRole :
    Fin 6 → FreshThirdPinnedEndpointOutsideSeedPointRole :=
  ![.canonicalSource, .canonicalSecondSource,
    .freshSourceOne, .freshSourceTwo,
    .freshRemainder 0, .freshRemainder 1]

/-- The four exact support slots attached to each row role.

The source row is already the named four-source row.  The fresh row consists
of its two named sources plus the exact two-point fresh remainder.  The other
rows use their intrinsic `Fin 4` indexings. -/
def freshThirdPinnedEndpointOutsideSeedRowSlot :
    FreshThirdPinnedEndpointOutsideSeedRowRole → Fin 4 →
      FreshThirdPinnedEndpointOutsideSeedPointRole
  | .source =>
      ![.canonicalSource, .canonicalSecondSource,
        .freshSourceOne, .freshSourceTwo]
  | .fresh =>
      ![.freshSourceOne, .freshSourceTwo,
        .freshRemainder 0, .freshRemainder 1]
  | .boundary => fun i ↦ .boundarySource i
  | .fan => fun i ↦ .fanSource i
  | .blocker j => fun i ↦ .blockerRowSource j i

/-- The actual center role attached to each exact selected-row role. -/
def freshThirdPinnedEndpointOutsideSeedRowCenter :
    FreshThirdPinnedEndpointOutsideSeedRowRole →
      FreshThirdPinnedEndpointOutsideSeedPointRole
  | .source => .sourceCenter
  | .fresh => .freshCenter
  | .boundary => .boundaryCenter
  | .fan => .pinnedCenter
  | .blocker i => .blockerCenter i

/-- Intrinsic finite naming of every support used by the pinned-endpoint fan
query.

Only the exact two-point fresh remainder and exact four-point rows are
indexed.  The ambient carrier itself is not enumerated, so this view applies
unchanged at every carrier cardinality.  The full `Packet` remains in the type
and `normalized` retains the exact center-blocker/no-center witness graph;
this structure is therefore an ingress view, not a weakened Boolean
projection. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) where
  freshRemainderIndex :
    freshThirdCrossRowFreshRemainder P Pρ C.surface Q ≃ Fin 2
  boundaryIndex : DRow.support ≃ Fin 4
  blockerRowIndex : ∀ i : Fin 4,
    (Packet.fan.fan.blockerRow i).toCriticalFourShell.support ≃ Fin 4
  normalized :
    FreshThirdPinnedEndpointOutsideSeedNormalizedOutcome P Pρ Packet

namespace FreshThirdPinnedEndpointOutsideSeedFiniteView

/-- Interpret a finite point role as its actual plane point. -/
noncomputable def point
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedPointRole → ℝ²
  | .freshRemainder i => (View.freshRemainderIndex.symm i).1
  | .fanSource i => (Packet.fan.fan.source i).1
  | .boundarySource i => (View.boundaryIndex.symm i).1
  | .blockerCenter i => Packet.fan.fan.blockerCenter i
  | .blockerRowSource i j => ((View.blockerRowIndex i).symm j).1
  | .pinnedCenter => center
  | .boundaryCenter => B.boundary id
  | .canonicalSource => C.surface.firstSource.1
  | .canonicalSecondSource => C.surface.secondSource.1
  | .freshSourceOne => Q.source₁.1
  | .freshSourceTwo => Q.source₂.1
  | .sourceCenter =>
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2
  | .freshCenter => H.centerAt Q.source₁.1 Q.source₁.2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every finite role denotes a genuine point of the arbitrary carrier. -/
theorem point_mem_carrier
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole) :
    point P Pρ View role ∈ D.A := by
  cases role with
  | freshRemainder i =>
      exact
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_subset_A
          (Finset.mem_sdiff.mp (View.freshRemainderIndex.symm i).2).1
  | fanSource i => exact (Packet.fan.fan.source i).2
  | boundarySource i =>
      exact DRow.support_subset_A (View.boundaryIndex.symm i).2
  | blockerCenter i =>
      exact (Finset.mem_erase.mp
        (Packet.fan.fan.blockerRow i).toCriticalFourShell.center_mem).2
  | blockerRowSource i j =>
      exact (Packet.fan.fan.blockerRow i).toCriticalFourShell.support_subset_A
        ((View.blockerRowIndex i).symm j).2
  | pinnedCenter =>
      exact freshThirdCrossRowTwoShellSeed_subset_carrier
        (P := P) (Pρ := Pρ) C.surface Q Packet.center_mem_seed
  | boundaryCenter =>
      change B.boundary id ∈ D.A
      rcases Packet.endpoint_center with hcenter | hcenter
      · simpa only [hcenter] using Q.source₁.2
      · simpa only [hcenter] using Q.source₂.2
  | canonicalSource => exact C.surface.firstSource.2
  | canonicalSecondSource => exact C.surface.secondSource.2
  | freshSourceOne => exact Q.source₁.2
  | freshSourceTwo => exact Q.source₂.2
  | sourceCenter =>
      exact (Finset.mem_erase.mp
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.center_mem).2
  | freshCenter =>
      exact (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.center_mem).2

/-- Boundary position of an interpreted role.  Only these finitely many
positions are queried; `B.n` itself remains arbitrary. -/
noncomputable def boundaryPosition
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole) : Fin B.n :=
  B.indexOf
    ⟨point P Pρ View role, point_mem_carrier P Pρ View role⟩

/-- Actual equality of role interpretations.  This, rather than constructor
equality, is the alias relation consumed by a finite certificate. -/
def SamePoint
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Prop :=
  point P Pρ View left = point P Pρ View right

/-- The Lean-owned alias setoid for the finite role quotient. -/
noncomputable def pointSetoid
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    Setoid FreshThirdPinnedEndpointOutsideSeedPointRole where
  r := SamePoint P Pρ View
  iseqv := ⟨fun _ ↦ rfl, fun h ↦ h.symm, fun h₁ h₂ ↦ h₁.trans h₂⟩

/-- Support selected by a finite row role. -/
noncomputable def rowSupport
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (_View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedRowRole → Finset ℝ²
  | .source =>
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support
  | .fresh =>
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support
  | .boundary => DRow.support
  | .fan => Packet.fan.Row.support
  | .blocker i =>
      (Packet.fan.fan.blockerRow i).toCriticalFourShell.support

/-- The selected four-class underlying each finite row role.

Unlike the Boolean assignment, this definition remains in the exact packet
and therefore records the genuine row center, radius, and positive-radius
support theorem for every role. -/
noncomputable def rowClass
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) →
      SelectedFourClass D.A
        (point P Pρ View (freshThirdPinnedEndpointOutsideSeedRowCenter row))
  | .source =>
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.toSelectedFourClass
  | .fresh =>
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  | .boundary => DRow
  | .fan => Packet.fan.Row
  | .blocker i =>
      (Packet.fan.fan.blockerRow i).toCriticalFourShell.toSelectedFourClass

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem rowClass_support_eq_rowSupport
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    (rowClass P Pρ View row).support = rowSupport P Pρ View row := by
  cases row <;> rfl

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every visible row is an exact four-point selected class. -/
theorem rowSupport_card_eq_four
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    (rowSupport P Pρ View row).card = 4 := by
  cases row with
  | source => exact
      (H.selectedAt C.surface.firstSource.1
        C.surface.firstSource.2).toCriticalFourShell.support_card
  | fresh => exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support_card
  | boundary => exact DRow.support_card
  | fan => exact Packet.fan.Row.support_card
  | blocker i => exact
      (Packet.fan.fan.blockerRow i).toCriticalFourShell.support_card

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The fresh row is exactly its two named sources together with the indexed
two-point remainder.  This is a consequence of the packet's exact overlap;
it does not assert that the finite roles exhaust the ambient carrier. -/
theorem freshRow_support_eq_pair_union_remainder
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (_View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    rowSupport P Pρ _View .fresh =
      {Q.source₁.1, Q.source₂.1} ∪
        freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
  classical
  ext x
  simp only [rowSupport, Finset.mem_union]
  constructor
  · intro hx
    by_cases hsource :
        x ∈ (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support
    · left
      have hinter :
          x ∈
            (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support ∩
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support :=
        Finset.mem_inter.mpr ⟨hsource, hx⟩
      rwa [Packet.seedOverlap] at hinter
    · right
      exact Finset.mem_sdiff.mpr ⟨hx, hsource⟩
  · intro hx
    rcases hx with hpair | hremainder
    · have hinter :
          x ∈
            (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.support ∩
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support := by
        rw [Packet.seedOverlap]
        exact hpair
      exact (Finset.mem_inter.mp hinter).2
    · exact (Finset.mem_sdiff.mp hremainder).1

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem finset_eq_univ_image_equiv
    {α : Type} [DecidableEq α] (support : Finset α)
    (index : support ≃ Fin 4) :
    support = Finset.univ.image (fun i : Fin 4 ↦ (index.symm i).1) := by
  ext x
  constructor
  · intro hx
    refine Finset.mem_image.mpr
      ⟨index ⟨x, hx⟩, Finset.mem_univ _, ?_⟩
    simp
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, _, rfl⟩
    exact (index.symm i).2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every row visible to the finite query has exactly the four support slots
declared by `freshThirdPinnedEndpointOutsideSeedRowSlot`.

The right-hand side is an image, not a claim that role constructors are
globally distinct: aliases between roles remain represented by `SamePoint`. -/
theorem rowSupport_eq_slot_image
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    rowSupport P Pρ View row =
      Finset.univ.image (fun i : Fin 4 ↦
        point P Pρ View (freshThirdPinnedEndpointOutsideSeedRowSlot row i)) := by
  classical
  cases row with
  | source =>
      rw [rowSupport, Packet.exactRow.first_support_eq]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_image,
        Finset.mem_univ, true_and]
      constructor
      · rintro (rfl | rfl | rfl | rfl)
        · exact ⟨0, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
        · exact ⟨1, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
        · exact ⟨2, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
        · exact ⟨3, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
      · rintro ⟨i, hi⟩
        fin_cases i
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inl hi.symm
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inr (Or.inl hi.symm)
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inr (Or.inr (Or.inl hi.symm))
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inr (Or.inr (Or.inr hi.symm))
  | fresh =>
      rw [freshRow_support_eq_pair_union_remainder P Pρ View]
      ext x
      simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
        Finset.mem_image, Finset.mem_univ, true_and]
      constructor
      · rintro ((rfl | rfl) | hremainder)
        · exact ⟨0, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
        · exact ⟨1, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point]⟩
        · let y : freshThirdCrossRowFreshRemainder P Pρ C.surface Q :=
            ⟨x, hremainder⟩
          let k : Fin 2 := View.freshRemainderIndex y
          have hrecover : (View.freshRemainderIndex.symm k).1 = x := by
            simpa [k, y] using
              congrArg Subtype.val
                (View.freshRemainderIndex.symm_apply_apply y)
          have hk : k = 0 ∨ k = 1 := by omega
          rcases hk with hk | hk
          · exact ⟨2, by
              simpa [freshThirdPinnedEndpointOutsideSeedRowSlot, point, hk] using
                hrecover⟩
          · exact ⟨3, by
              simpa [freshThirdPinnedEndpointOutsideSeedRowSlot, point, hk] using
                hrecover⟩
      · rintro ⟨i, hi⟩
        fin_cases i
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inl (Or.inl hi.symm)
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inl (Or.inr hi.symm)
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inr (by
            rw [← hi]
            exact (View.freshRemainderIndex.symm 0).2)
        · simp [freshThirdPinnedEndpointOutsideSeedRowSlot, point] at hi
          exact Or.inr (by
            rw [← hi]
            exact (View.freshRemainderIndex.symm 1).2)
  | boundary =>
      simpa [rowSupport, freshThirdPinnedEndpointOutsideSeedRowSlot, point] using
        (finset_eq_univ_image_equiv
          (support := DRow.support) (index := View.boundaryIndex))
  | fan =>
      simpa [rowSupport, freshThirdPinnedEndpointOutsideSeedRowSlot, point] using
        Packet.fan.fan.support_eq_source_image
  | blocker i =>
      simpa [rowSupport, freshThirdPinnedEndpointOutsideSeedRowSlot, point] using
        (finset_eq_univ_image_equiv
          (support :=
            (Packet.fan.fan.blockerRow i).toCriticalFourShell.support)
          (index := View.blockerRowIndex i))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The four intrinsic slots of every visible row name four distinct semantic
points.  This is the cardinality bridge used to turn slot-filter counts into
actual support intersection counts. -/
theorem rowSlot_point_injective
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) :
    Function.Injective (fun i : Fin 4 ↦
      point P Pρ View
        (freshThirdPinnedEndpointOutsideSeedRowSlot row i)) := by
  classical
  let slotPoint : Fin 4 → ℝ² := fun i ↦
    point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
  have hcardImage :
      (Finset.univ.image slotPoint).card =
        (Finset.univ : Finset (Fin 4)).card := by
    rw [← rowSupport_eq_slot_image (P := P) (Pρ := Pρ) View row,
      rowSupport_card_eq_four (P := P) (Pρ := Pρ) View row]
    simp
  have hinj : Set.InjOn slotPoint (Finset.univ : Finset (Fin 4)) :=
    Finset.card_image_iff.mp hcardImage
  intro i j hij
  exact hinj (Finset.mem_univ i) (Finset.mem_univ j) hij

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The six intrinsic seed roles are exactly the semantic two-row seed.

This is the cardinality-independent bridge needed by the multiplicity
constraint: it enumerates the exact six-point seed, not the ambient carrier. -/
theorem seed_eq_role_image
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    freshThirdCrossRowTwoShellSeed P Pρ C.surface Q =
      Finset.univ.image (fun i : Fin 6 ↦
        point P Pρ View (freshThirdPinnedEndpointOutsideSeedSeedRole i)) := by
  classical
  change rowSupport P Pρ View .source ∪ rowSupport P Pρ View .fresh = _
  rw [rowSupport_eq_slot_image (P := P) (Pρ := Pρ) View
      FreshThirdPinnedEndpointOutsideSeedRowRole.source,
    rowSupport_eq_slot_image (P := P) (Pρ := Pρ) View
      FreshThirdPinnedEndpointOutsideSeedRowRole.fresh]
  ext x
  simp only [Finset.mem_union, Finset.mem_image, Finset.mem_univ, true_and]
  constructor
  · rintro (⟨i, rfl⟩ | ⟨i, rfl⟩)
    · fin_cases i
      · exact ⟨0, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨1, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨2, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨3, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · fin_cases i
      · exact ⟨2, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨3, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨4, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
      · exact ⟨5, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
          freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
  · rintro ⟨i, rfl⟩
    fin_cases i
    · exact Or.inl ⟨0, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · exact Or.inl ⟨1, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · exact Or.inl ⟨2, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · exact Or.inl ⟨3, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · exact Or.inr ⟨2, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩
    · exact Or.inr ⟨3, by simp [freshThirdPinnedEndpointOutsideSeedRowSlot,
        freshThirdPinnedEndpointOutsideSeedSeedRole]⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Interpreting the six intrinsic seed roles is injective. -/
theorem seedRole_point_injective
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    Function.Injective (fun i : Fin 6 ↦
      point P Pρ View (freshThirdPinnedEndpointOutsideSeedSeedRole i)) := by
  classical
  let seedPoint : Fin 6 → ℝ² := fun i ↦
    point P Pρ View (freshThirdPinnedEndpointOutsideSeedSeedRole i)
  have hcardImage :
      (Finset.univ.image seedPoint).card =
        (Finset.univ : Finset (Fin 6)).card := by
    rw [← seed_eq_role_image (P := P) (Pρ := Pρ) View, Packet.seed_card]
    simp
  have hinj : Set.InjOn seedPoint (Finset.univ : Finset (Fin 6)) :=
    Finset.card_image_iff.mp hcardImage
  intro i j hij
  exact hinj (Finset.mem_univ i) (Finset.mem_univ j) hij

/-- Exact row-incidence atom over the Lean-owned role quotient. -/
def Incident
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) : Prop :=
  point P Pρ View role ∈ rowSupport P Pρ View row

/-- Exact cap-membership atom. -/
def InCap
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : FreshThirdPinnedEndpointOutsideSeedPointRole) (cap : Fin 3) : Prop :=
  point P Pρ View role ∈ S.capByIndex cap

/-- Exact cyclic-boundary order atom. -/
noncomputable def Before
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Prop :=
  boundaryPosition P Pρ View left < boundaryPosition P Pρ View right

/-- Exact metric-equality atom used by geometric learned cuts. -/
noncomputable def SameDistanceFrom
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (centerRole left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Prop :=
  dist (point P Pρ View centerRole) (point P Pρ View left) =
    dist (point P Pρ View centerRole) (point P Pρ View right)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The packet's at-most-three seed multiplicity forbids four distinct seed
roles at one positive radius from the pinned center.

Positivity is derived intrinsically from the premise that none of the four
chosen seed roles aliases the pinned center. -/
theorem no_four_seed_roles_same_distance
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (e : Fin 4 ↪ Fin 6)
    (hne : ∀ i : Fin 4,
      point P Pρ View .pinnedCenter ≠
        point P Pρ View
          (freshThirdPinnedEndpointOutsideSeedSeedRole (e i))) :
    ¬ ∀ i : Fin 4,
      SameDistanceFrom P Pρ View .pinnedCenter
        (freshThirdPinnedEndpointOutsideSeedSeedRole (e 0))
        (freshThirdPinnedEndpointOutsideSeedSeedRole (e i)) := by
  classical
  intro hsame
  let seedPoint : Fin 6 → ℝ² := fun i ↦
    point P Pρ View (freshThirdPinnedEndpointOutsideSeedSeedRole i)
  let shellRadius : ℝ := dist center (seedPoint (e 0))
  let chosen : Finset ℝ² :=
    Finset.univ.image (fun i : Fin 4 ↦ seedPoint (e i))
  have hpositive : 0 < shellRadius := by
    exact dist_pos.mpr (by
      simpa [point] using hne 0)
  have hchosenCard : chosen.card = 4 := by
    have hinj : Function.Injective (fun i : Fin 4 ↦ seedPoint (e i)) :=
      (seedRole_point_injective (P := P) (Pρ := Pρ) View).comp e.injective
    simp [chosen, Finset.card_image_of_injective _ hinj]
  have hchosenSubset :
      chosen ⊆
        (SelectedClass D.A center shellRadius) ∩
          freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _, rfl⟩
    apply Finset.mem_inter.mpr
    constructor
    · apply mem_selectedClass.mpr
      constructor
      · exact point_mem_carrier P Pρ View _
      · change dist center (seedPoint (e i)) = shellRadius
        have hi := hsame i
        simpa [SameDistanceFrom, seedPoint, shellRadius, point] using hi.symm
    · rw [seed_eq_role_image (P := P) (Pρ := Pρ) View]
      exact Finset.mem_image.mpr ⟨e i, Finset.mem_univ _, rfl⟩
  have hbound := Packet.seed_multiplicity shellRadius hpositive
  have hle := Finset.card_le_card hchosenSubset
  rw [hchosenCard] at hle
  omega

/-- Construct the complete finite ingress view from any live packet.  This is
the intrinsic arbitrary-cardinality lift: it indexes only exact local
supports and keeps every other ambient point semantically possible. -/
noncomputable def ofPacket
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet where
  freshRemainderIndex := Finset.equivFinOfCardEq
    (freshThirdCrossRowFreshRemainder_card_eq_two
      P Pρ C.surface Q Packet.seedOverlap)
  boundaryIndex := Finset.equivFinOfCardEq DRow.support_card
  blockerRowIndex := fun i ↦
    Finset.equivFinOfCardEq
      (Packet.fan.fan.blockerRow i).toCriticalFourShell.support_card
  normalized := Packet.normalizedOutcome
    (T := T) (hblockersNe := hblockersNe)

end FreshThirdPinnedEndpointOutsideSeedFiniteView

/-- Fixed Boolean vocabulary exported by the finite pinned-endpoint query.

All domains are intrinsic finite role types.  In particular there is no
ambient-cardinality variable and no assertion that the named roles exhaust
`D.A`.  `hasFourAfterDeleting deleted atCenter` records the exact semantic
predicate used by cross-deletion fan witnesses. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteAssignment where
  samePoint : FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedPointRole → Bool
  incident : FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedRowRole → Bool
  inCap : FreshThirdPinnedEndpointOutsideSeedPointRole → Fin 3 → Bool
  inCapInterior : FreshThirdPinnedEndpointOutsideSeedPointRole → Fin 3 → Bool
  before : FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedPointRole → Bool
  sameDistanceFrom : FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedPointRole → Bool
  hasFourAfterDeleting : FreshThirdPinnedEndpointOutsideSeedPointRole →
    FreshThirdPinnedEndpointOutsideSeedPointRole → Bool
  nonrobust : FreshThirdPinnedEndpointOutsideSeedPointRole → Bool
deriving DecidableEq

namespace FreshThirdPinnedEndpointOutsideSeedFiniteAssignment

abbrev PointRole := FreshThirdPinnedEndpointOutsideSeedPointRole
abbrev RowRole := FreshThirdPinnedEndpointOutsideSeedRowRole

def Same (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (left right : PointRole) : Prop :=
  A.samePoint left right = true

def Incident (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (row : RowRole) : Prop :=
  A.incident point row = true

def InCap (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Prop :=
  A.inCap point cap = true

def InCapInterior (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Prop :=
  A.inCapInterior point cap = true

def Before (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (left right : PointRole) : Prop :=
  A.before left right = true

def SameDistanceFrom
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (center left right : PointRole) : Prop :=
  A.sameDistanceFrom center left right = true

def HasFourAfterDeleting
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (deleted atCenter : PointRole) : Prop :=
  A.hasFourAfterDeleting deleted atCenter = true

def Nonrobust (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (center : PointRole) : Prop :=
  A.nonrobust center = true

instance decidableSame (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (left right : PointRole) : Decidable (A.Same left right) := by
  unfold Same
  infer_instance

instance decidableIncident (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (row : RowRole) : Decidable (A.Incident point row) := by
  unfold Incident
  infer_instance

instance decidableInCap (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Decidable (A.InCap point cap) := by
  unfold InCap
  infer_instance

instance decidableInCapInterior
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (point : PointRole) (cap : Fin 3) : Decidable (A.InCapInterior point cap) := by
  unfold InCapInterior
  infer_instance

instance decidableBefore (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (left right : PointRole) : Decidable (A.Before left right) := by
  unfold Before
  infer_instance

instance decidableSameDistanceFrom
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (center left right : PointRole) : Decidable (A.SameDistanceFrom center left right) := by
  unfold SameDistanceFrom
  infer_instance

instance decidableHasFourAfterDeleting
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (deleted atCenter : PointRole) : Decidable (A.HasFourAfterDeleting deleted atCenter) := by
  unfold HasFourAfterDeleting
  infer_instance

instance decidableNonrobust
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (center : PointRole) : Decidable (A.Nonrobust center) := by
  unfold Nonrobust
  infer_instance

/-- Evaluate the fixed Boolean vocabulary on one exact Lean-owned view. -/
noncomputable def ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment where
  samePoint := fun left right ↦
    decide (FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint
      P Pρ View left right)
  incident := fun point row ↦
    decide (FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident
      P Pρ View point row)
  inCap := fun point cap ↦
    decide (FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap
      P Pρ View point cap)
  inCapInterior := fun point cap ↦
    decide
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View point ∈
        S.capInteriorByIndex cap)
  before := fun left right ↦
    decide (FreshThirdPinnedEndpointOutsideSeedFiniteView.Before
      P Pρ View left right)
  sameDistanceFrom := fun centerRole left right ↦
    decide (FreshThirdPinnedEndpointOutsideSeedFiniteView.SameDistanceFrom
      P Pρ View centerRole left right)
  hasFourAfterDeleting := fun deleted atCenter ↦
    decide
      (HasNEquidistantPointsAt 4
        (D.A.erase
          (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
            P Pρ View deleted))
        (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
          P Pρ View atCenter))
  nonrobust := fun centerRole ↦
    decide
      (¬ FullyDeletionRobustAt D
        (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
          P Pρ View centerRole))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem same_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (left right : PointRole) :
    Same (ofView P Pρ View) left right ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint
        P Pρ View left right := by
  simp [Same, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem incident_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (point : PointRole) (row : RowRole) :
    Incident (ofView P Pρ View) point row ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident
        P Pρ View point row := by
  simp [Incident, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem inCap_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (point : PointRole) (cap : Fin 3) :
    InCap (ofView P Pρ View) point cap ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap
        P Pρ View point cap := by
  simp [InCap, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem inCapInterior_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (point : PointRole) (cap : Fin 3) :
    InCapInterior (ofView P Pρ View) point cap ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View point ∈
        S.capInteriorByIndex cap := by
  simp [InCapInterior, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem before_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (left right : PointRole) :
    Before (ofView P Pρ View) left right ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.Before
        P Pρ View left right := by
  simp [Before, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem sameDistanceFrom_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (centerRole left right : PointRole) :
    SameDistanceFrom (ofView P Pρ View) centerRole left right ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.SameDistanceFrom
        P Pρ View centerRole left right := by
  simp [SameDistanceFrom, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem hasFourAfterDeleting_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (deleted atCenter : PointRole) :
    HasFourAfterDeleting (ofView P Pρ View) deleted atCenter ↔
      HasNEquidistantPointsAt 4
        (D.A.erase
          (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
            P Pρ View deleted))
        (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
          P Pρ View atCenter) := by
  simp [HasFourAfterDeleting, ofView]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
@[simp] theorem nonrobust_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (centerRole : PointRole) :
    Nonrobust (ofView P Pρ View) centerRole ↔
      ¬ FullyDeletionRobustAt D
        (FreshThirdPinnedEndpointOutsideSeedFiniteView.point
          P Pρ View centerRole) := by
  simp [Nonrobust, ofView]

end FreshThirdPinnedEndpointOutsideSeedFiniteAssignment

/-- Packet-independent equality and exact-row semantics for a finite
pinned-endpoint assignment.

This is the first certificate-facing source-theory layer.  It says that
`Same` is an equivalence relation on interpreted roles and that each visible
selected row contains exactly the aliases of its four declared support slots.
It does not identify role constructors: all permitted collisions continue to
flow through the Boolean `Same` relation. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment) : Prop where
  same_refl : ∀ point,
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A point point
  same_symm : ∀ {left right},
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A left right →
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A right left
  same_trans : ∀ {left middle right},
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A left middle →
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A middle right →
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A left right
  slot_same_iff_eq : ∀ row i j,
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A
        (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
        (freshThirdPinnedEndpointOutsideSeedRowSlot row j) ↔
      i = j
  incident_iff_slot : ∀ point row,
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Incident A point row ↔
      ∃ i : Fin 4,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same A point
          (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
  row_center_not_incident : ∀ row,
    ¬ FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Incident A
      (freshThirdPinnedEndpointOutsideSeedRowCenter row) row
  row_slots_same_distance : ∀ row i j,
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.SameDistanceFrom A
      (freshThirdPinnedEndpointOutsideSeedRowCenter row)
      (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
      (freshThirdPinnedEndpointOutsideSeedRowSlot row j)

namespace FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every exact Lean-owned finite view satisfies the packet-independent row
theory.  This is the semantic bridge a future finite certificate must use;
the theorem quantifies over the arbitrary ambient carrier and enumerates only
the exact local supports. -/
theorem ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View) := by
  refine
    { same_refl := ?_
      same_symm := ?_
      same_trans := ?_
      slot_same_iff_eq := ?_
      incident_iff_slot := ?_
      row_center_not_incident := ?_
      row_slots_same_distance := ?_ }
  · intro point
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View point point).2 rfl
  · intro left right hsame
    apply
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View right left).2
    exact
      ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View left right).1 hsame).symm
  · intro left middle right hleft hright
    apply
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View left right).2
    exact
      ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View left middle).1 hleft).trans
      ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View middle right).1 hright)
  · intro row i j
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ)]
    constructor
    · intro hsame
      let slotPoint : Fin 4 → ℝ² := fun k ↦
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
          (freshThirdPinnedEndpointOutsideSeedRowSlot row k)
      have hcardImage :
          (Finset.univ.image slotPoint).card = (Finset.univ : Finset (Fin 4)).card := by
        rw [← FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
          (P := P) (Pρ := Pρ) View row]
        rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_card_eq_four
          (P := P) (Pρ := Pρ) View row]
        simp
      have hinj : Set.InjOn slotPoint (Finset.univ : Finset (Fin 4)) :=
        Finset.card_image_iff.mp hcardImage
      exact hinj (Finset.mem_univ i) (Finset.mem_univ j) hsame
    · rintro rfl
      rfl
  · intro point row
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp only [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image]
    simp only [Finset.mem_image, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨i, hpoint⟩
      exact ⟨i,
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View point
            (freshThirdPinnedEndpointOutsideSeedRowSlot row i)).2 hpoint.symm⟩
    · rintro ⟨i, hsame⟩
      exact ⟨i,
        ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View point
            (freshThirdPinnedEndpointOutsideSeedRowSlot row i)).1 hsame).symm⟩
  · intro row hincident
    have hmem :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
            (freshThirdPinnedEndpointOutsideSeedRowCenter row) ∈
          FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View row :=
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).1 hincident
    rw [← FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport
      (P := P) (Pρ := Pρ) View row] at hmem
    exact (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
      P Pρ View row).center_not_mem hmem
  · intro row i j
    apply
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
        (P := P) (Pρ := Pρ) View _ _ _).2
    let K := FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass P Pρ View row
    have hi :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
            (freshThirdPinnedEndpointOutsideSeedRowSlot row i) ∈ K.support := by
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
    have hj :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
            (freshThirdPinnedEndpointOutsideSeedRowSlot row j) ∈ K.support := by
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image]
      exact Finset.mem_image.mpr ⟨j, Finset.mem_univ j, rfl⟩
    exact (K.support_eq_radius _ hi).trans (K.support_eq_radius _ hj).symm

end FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory

/-- Packet-independent finite data passed to a replayed FreshThird query.

The three distinguished cap labels and the four blocker-cap labels are finite
Skolem data.  No field bounds or enumerates the ambient carrier. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration where
  assignment : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment
  firstCap : Fin 3
  freshCap : Fin 3
  rowCap : Fin 3
  blockerCap : Fin 4 → Fin 3
deriving DecidableEq

namespace FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration

abbrev PointRole := FreshThirdPinnedEndpointOutsideSeedPointRole
abbrev RowRole := FreshThirdPinnedEndpointOutsideSeedRowRole

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Choose the source-produced cap label attached to an indexed fan source. -/
noncomputable def blockerCapOfView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (_View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (i : Fin 4) : Fin 3 :=
  Classical.choose (Packet.fan.fan.deletionPacket i)

/-- Evaluate the packet-independent query configuration on an exact packet
view. -/
noncomputable def ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration where
  assignment :=
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View
  firstCap := S.oppIndex1
  freshCap := freshCap
  rowCap := rowCap
  blockerCap := blockerCapOfView P Pρ View

end FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration

/-- Congruence and exact-row laws shared by every source-faithful finite
configuration.  These laws prevent a Boolean solver from assigning different
incidence, cap, order, metric, deletion, or robustness values to two roles
that denote the same carrier point. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory
    (Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration) : Prop where
  rowTheory : FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory Config.assignment
  inCap_congr : ∀ {left right cap},
    Config.assignment.Same left right →
      (Config.assignment.InCap left cap ↔ Config.assignment.InCap right cap)
  inCapInterior_congr : ∀ {left right cap},
    Config.assignment.Same left right →
      (Config.assignment.InCapInterior left cap ↔
        Config.assignment.InCapInterior right cap)
  interior_in_cap : ∀ {point cap},
    Config.assignment.InCapInterior point cap →
      Config.assignment.InCap point cap
  interior_not_in_other_cap : ∀ {point firstCap secondCap},
    Config.assignment.InCapInterior point firstCap →
      firstCap ≠ secondCap →
        ¬ Config.assignment.InCap point secondCap
  before_congr : ∀ {left left' right right'},
    Config.assignment.Same left left' →
      Config.assignment.Same right right' →
      (Config.assignment.Before left right ↔
        Config.assignment.Before left' right')
  before_irrefl : ∀ point,
    ¬ Config.assignment.Before point point
  before_trans : ∀ {left middle right},
    Config.assignment.Before left middle →
      Config.assignment.Before middle right →
        Config.assignment.Before left right
  before_or_same_or_after : ∀ left right,
    Config.assignment.Before left right ∨
      Config.assignment.Same left right ∨
        Config.assignment.Before right left
  sameDistanceFrom_congr : ∀ {center center' left left' right right'},
    Config.assignment.Same center center' →
      Config.assignment.Same left left' →
      Config.assignment.Same right right' →
      (Config.assignment.SameDistanceFrom center left right ↔
        Config.assignment.SameDistanceFrom center' left' right')
  sameDistanceFrom_refl : ∀ center point,
    Config.assignment.SameDistanceFrom center point point
  sameDistanceFrom_symm : ∀ center left right,
    Config.assignment.SameDistanceFrom center left right ↔
      Config.assignment.SameDistanceFrom center right left
  hasFourAfterDeleting_congr : ∀ {deleted deleted' center center'},
    Config.assignment.Same deleted deleted' →
      Config.assignment.Same center center' →
      (Config.assignment.HasFourAfterDeleting deleted center ↔
        Config.assignment.HasFourAfterDeleting deleted' center')
  blocked_deletion_nonrobust : ∀ deleted center,
    ¬ Config.assignment.HasFourAfterDeleting deleted center →
      Config.assignment.Nonrobust center
  nonrobust_congr : ∀ {left right},
    Config.assignment.Same left right →
      (Config.assignment.Nonrobust left ↔ Config.assignment.Nonrobust right)

namespace FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Exact packet views satisfy all packet-independent congruence laws. -/
theorem ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  let Config :=
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
  let A := Config.assignment
  have hsame {left right : FreshThirdPinnedEndpointOutsideSeedPointRole}
      (h : A.Same left right) :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View left =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View right := by
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View left right).1 h
  refine
    { rowTheory :=
        FreshThirdPinnedEndpointOutsideSeedFiniteRowTheory.ofView
          (P := P) (Pρ := Pρ) View
      inCap_congr := ?_
      inCapInterior_congr := ?_
      interior_in_cap := ?_
      interior_not_in_other_cap := ?_
      before_congr := ?_
      before_irrefl := ?_
      before_trans := ?_
      before_or_same_or_after := ?_
      sameDistanceFrom_congr := ?_
      sameDistanceFrom_refl := ?_
      sameDistanceFrom_symm := ?_
      hasFourAfterDeleting_congr := ?_
      blocked_deletion_nonrobust := ?_
      nonrobust_congr := ?_ }
  · intro left right cap h
    change A.Same left right at h
    change A.InCap left cap ↔ A.InCap right cap
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] at h ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
      (P := P) (Pρ := Pρ)]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap, hsame h]
  · intro left right cap h
    change A.Same left right at h
    change A.InCapInterior left cap ↔ A.InCapInterior right cap
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] at h ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
      (P := P) (Pρ := Pρ)]
    simpa [hsame h]
  · intro point cap h
    change A.InCapInterior point cap at h
    change A.InCap point cap
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] at h ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
      (P := P) (Pρ := Pρ)] at h
    exact S.capInteriorByIndex_subset_capByIndex cap h
  · intro point firstCap secondCap hInterior hne hCap
    change A.InCapInterior point firstCap at hInterior
    change A.InCap point secondCap at hCap
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      at hInterior hCap ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
      (P := P) (Pρ := Pρ)] at hInterior
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
      (P := P) (Pρ := Pρ)] at hCap
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hInterior hne hCap
  · intro left left' right right' hleft hright
    change A.Same left left' at hleft
    change A.Same right right' at hright
    change A.Before left right ↔ A.Before left' right'
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] at hleft hright ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp [FreshThirdPinnedEndpointOutsideSeedFiniteView.Before,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
      hsame hleft, hsame hright]
  · intro point
    change ¬ A.Before point point
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp [FreshThirdPinnedEndpointOutsideSeedFiniteView.Before]
  · intro left middle right hleft hright
    change A.Before left middle at hleft
    change A.Before middle right at hright
    change A.Before left right
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      at hleft hright ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
      (P := P) (Pρ := Pρ)] at hleft hright ⊢
    exact lt_trans hleft hright
  · intro left right
    let leftPosition :=
      FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition
        P Pρ View left
    let rightPosition :=
      FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition
        P Pρ View right
    rcases lt_trichotomy leftPosition rightPosition with hlt | heq | hgt
    · left
      change A.Before left right
      dsimp [A, Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
        (P := P) (Pρ := Pρ)]
      exact hlt
    · right
      left
      change A.Same left right
      dsimp [A, Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ)]
      change
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View left =
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View right
      calc
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View left =
            B.boundary leftPosition := by
              simpa [leftPosition,
                FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition] using
                (B.point_eq
                  ⟨FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View left,
                    FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
                      (P := P) (Pρ := Pρ) View left⟩).symm
        _ = B.boundary rightPosition := congrArg B.boundary heq
        _ = FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View right := by
              simpa [rightPosition,
                FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition] using
                B.point_eq
                  ⟨FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View right,
                    FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
                      (P := P) (Pρ := Pρ) View right⟩
    · right
      right
      change A.Before right left
      dsimp [A, Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
        (P := P) (Pρ := Pρ)]
      exact hgt
  · intro centerRole centerRole' left left' right right' hcenter hleft hright
    change A.Same centerRole centerRole' at hcenter
    change A.Same left left' at hleft
    change A.Same right right' at hright
    change
      A.SameDistanceFrom centerRole left right ↔
        A.SameDistanceFrom centerRole' left' right'
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      at hcenter hleft hright ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp [FreshThirdPinnedEndpointOutsideSeedFiniteView.SameDistanceFrom,
      hsame hcenter, hsame hleft, hsame hright]
  · intro centerRole point
    change A.SameDistanceFrom centerRole point point
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
      (P := P) (Pρ := Pρ)]
    rfl
  · intro centerRole left right
    change
      A.SameDistanceFrom centerRole left right ↔
        A.SameDistanceFrom centerRole right left
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
      (P := P) (Pρ := Pρ)]
    exact eq_comm
  · intro deleted deleted' centerRole centerRole' hdeleted hcenter
    change A.Same deleted deleted' at hdeleted
    change A.Same centerRole centerRole' at hcenter
    change
      A.HasFourAfterDeleting deleted centerRole ↔
        A.HasFourAfterDeleting deleted' centerRole'
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      at hdeleted hcenter ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp [hsame hdeleted, hsame hcenter]
  · intro deleted centerRole hblocked
    change ¬ A.HasFourAfterDeleting deleted centerRole at hblocked
    change A.Nonrobust centerRole
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView]
      at hblocked ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff
      (P := P) (Pρ := Pρ)]
    intro hrobust
    apply hblocked
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ)]
    exact hrobust.survives _
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View deleted)
  · intro left right h
    change A.Same left right at h
    change A.Nonrobust left ↔ A.Nonrobust right
    dsimp [A, Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] at h ⊢
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff
      (P := P) (Pρ := Pρ)]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff
      (P := P) (Pρ := Pρ)]
    simp [hsame h]

end FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory

namespace FreshThirdPinnedEndpointOutsideSeedFiniteConstraint

abbrev PointRole := FreshThirdPinnedEndpointOutsideSeedPointRole
abbrev RowRole := FreshThirdPinnedEndpointOutsideSeedRowRole
abbrev Assignment := FreshThirdPinnedEndpointOutsideSeedFiniteAssignment
abbrev Configuration := FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration

/-- One exact four-slot row support is contained in another.  Under the
source theory's slot-injectivity law both rows have cardinality four, so this
is equivalent to support equality without introducing an ambient point
universe. -/
def RowSupportEq (A : Assignment) (left right : RowRole) : Prop :=
  ∀ i : Fin 4, ∃ j : Fin 4,
    A.Same
      (freshThirdPinnedEndpointOutsideSeedRowSlot left i)
      (freshThirdPinnedEndpointOutsideSeedRowSlot right j)

section ComputableCounts

attribute [-instance] Classical.propDecidable

/-- Number of slots of `left` whose actual point occurs in `right`.
Slot injectivity makes this the cardinality of the semantic support
intersection. -/
def RowOverlapCount (A : Assignment) (left right : RowRole) : ℕ :=
  (Finset.univ.filter fun i : Fin 4 ↦
    ∃ j : Fin 4,
      A.Same
        (freshThirdPinnedEndpointOutsideSeedRowSlot left i)
        (freshThirdPinnedEndpointOutsideSeedRowSlot right j)).card

/-- Number of exact row slots lying in a named cap. -/
def RowCapInsideCount
    (A : Assignment) (row : RowRole) (cap : Fin 3) : ℕ :=
  (Finset.univ.filter fun i : Fin 4 ↦
    A.InCap (freshThirdPinnedEndpointOutsideSeedRowSlot row i) cap).card

/-- Number of exact row slots lying outside a named cap. -/
def RowCapOutsideCount
    (A : Assignment) (row : RowRole) (cap : Fin 3) : ℕ :=
  (Finset.univ.filter fun i : Fin 4 ↦
    ¬ A.InCap (freshThirdPinnedEndpointOutsideSeedRowSlot row i) cap).card

end ComputableCounts

/-- A named point is outside the exact six-point two-shell seed. -/
def OutsideSeed (A : Assignment) (point : PointRole) : Prop :=
  ∀ i : Fin 6,
    ¬ A.Same point (freshThirdPinnedEndpointOutsideSeedSeedRole i)

/-- Finite, explicit-row version of the source predicate
`EndpointDeletionPairCapSplitSurvivingRowAt`. -/
def EndpointCapSplitAt (Config : Configuration)
    (firstDeleted secondDeleted : PointRole) : Prop :=
  let A := Config.assignment
  (¬ A.Incident firstDeleted .boundary ∨
      ¬ A.Incident secondDeleted .boundary) ∧
    A.InCap .boundaryCenter Config.rowCap ∧
    RowCapInsideCount A .boundary Config.rowCap ≤ 2 ∧
    2 ≤ RowCapOutsideCount A .boundary Config.rowCap

/-- One orientation of the exact four-arm cyclic-order/boundary-row packet.
The separate orientation disjunction in `FiniteSourceTheory` identifies
`qOutside` and `qBetween` with the two FreshThird endpoints. -/
def OrderedRowAtWith (Config : Configuration)
    (qOutside qBetween : PointRole) : Prop :=
  let A := Config.assignment
  (A.Before qOutside .freshCenter ∧
      A.Before .freshCenter qBetween ∧
      A.Before qBetween .sourceCenter ∧
      A.Before .sourceCenter .canonicalSource ∧
      A.Same .boundaryCenter qBetween ∧
      EndpointCapSplitAt Config .canonicalSource qOutside) ∨
    (A.Before qOutside .freshCenter ∧
      A.Before .freshCenter qBetween ∧
      A.Before qBetween .canonicalSource ∧
      A.Before .canonicalSource .sourceCenter ∧
      A.Same .boundaryCenter qOutside ∧
      EndpointCapSplitAt Config .canonicalSource qBetween) ∨
    (A.Before .canonicalSource .sourceCenter ∧
      A.Before .sourceCenter qBetween ∧
      A.Before qBetween .freshCenter ∧
      A.Before .freshCenter qOutside ∧
      A.Same .boundaryCenter qBetween ∧
      EndpointCapSplitAt Config .canonicalSource qOutside) ∨
    (A.Before .sourceCenter .canonicalSource ∧
      A.Before .canonicalSource qBetween ∧
      A.Before qBetween .freshCenter ∧
      A.Before .freshCenter qOutside ∧
      A.Same .boundaryCenter qOutside ∧
      EndpointCapSplitAt Config .canonicalSource qBetween)

/-- The exact center-blocker data visible in the named-role vocabulary. -/
def CenterBlockerOutcome (Config : Configuration) : Prop :=
  let A := Config.assignment
  ∃ i : Fin 4, ∃ cap : Fin 3,
    A.Same .pinnedCenter (.blockerCenter i) ∧
      A.InCapInterior (.blockerCenter i) cap ∧
      ¬ A.HasFourAfterDeleting (.fanSource i) (.blockerCenter i) ∧
      RowSupportEq A .fan (.blocker i) ∧
      A.Nonrobust .pinnedCenter

/-- The complete repeated-cap and mutual-cross-deletion witness graph in the
no-center arm. -/
def NoCenterOutcome (Config : Configuration) : Prop :=
  let A := Config.assignment
  (∀ i : Fin 4, ¬ A.Same .pinnedCenter (.blockerCenter i)) ∧
    (∃ i j : Fin 4, i ≠ j ∧
      ∃ cap : Fin 3,
        A.InCapInterior (.blockerCenter i) cap ∧
        A.InCapInterior (.blockerCenter j) cap ∧
        (A.Same (.blockerCenter i) (.blockerCenter j) ∨
          A.HasFourAfterDeleting (.fanSource j) (.blockerCenter i) ∨
          A.HasFourAfterDeleting (.fanSource i) (.blockerCenter j))) ∧
    (∃ i j : Fin 4, i ≠ j ∧
      A.HasFourAfterDeleting (.fanSource j) (.blockerCenter i) ∧
      A.HasFourAfterDeleting (.fanSource i) (.blockerCenter j) ∧
      ¬ A.Same (.blockerCenter i) (.blockerCenter j))

/-- Source-faithful finite normalization of the selected-four deletion fan. -/
def NormalizedFanOutcome (Config : Configuration) : Prop :=
  CenterBlockerOutcome Config ∨ NoCenterOutcome Config

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- On a semantic view, the finite inside-cap slot count is exactly the
cardinality of the actual row-support/cap intersection. -/
theorem rowCapInsideCount_ofView_eq
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : RowRole) (cap : Fin 3) :
    RowCapInsideCount
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        row cap =
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View row ∩
        S.capByIndex cap).card := by
  classical
  let slotPoint : Fin 4 → ℝ² := fun i ↦
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
  have hinj : Function.Injective slotPoint := by
    simpa [slotPoint] using
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSlot_point_injective
        (P := P) (Pρ := Pρ) View row)
  calc
    RowCapInsideCount
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
          row cap =
        (Finset.univ.filter fun i : Fin 4 ↦ slotPoint i ∈ S.capByIndex cap).card := by
          apply congrArg Finset.card
          ext i
          simp [RowCapInsideCount, slotPoint,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap]
    _ = ((Finset.univ.filter fun i : Fin 4 ↦
          slotPoint i ∈ S.capByIndex cap).image slotPoint).card := by
          symm
          exact Finset.card_image_of_injective _ hinj
    _ = (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View row ∩
          S.capByIndex cap).card := by
          apply congrArg Finset.card
          rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
            (P := P) (Pρ := Pρ) View row]
          ext x
          simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ,
            true_and, Finset.mem_inter]
          constructor
          · rintro ⟨i, hi, hix⟩
            exact ⟨⟨i, hix⟩, by simpa [hix] using hi⟩
          · rintro ⟨⟨i, hix⟩, hx⟩
            refine ⟨i, ?_, hix⟩
            change
              FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
                  (freshThirdPinnedEndpointOutsideSeedRowSlot row i) ∈
                S.capByIndex cap
            exact hix.symm ▸ hx

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- On a semantic view, the finite outside-cap slot count is exactly the
cardinality of the actual row support minus that cap. -/
theorem rowCapOutsideCount_ofView_eq
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (row : RowRole) (cap : Fin 3) :
    RowCapOutsideCount
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        row cap =
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View row \
        S.capByIndex cap).card := by
  classical
  let slotPoint : Fin 4 → ℝ² := fun i ↦
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot row i)
  have hinj : Function.Injective slotPoint := by
    simpa [slotPoint] using
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSlot_point_injective
        (P := P) (Pρ := Pρ) View row)
  calc
    RowCapOutsideCount
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
          row cap =
        (Finset.univ.filter fun i : Fin 4 ↦ slotPoint i ∉ S.capByIndex cap).card := by
          apply congrArg Finset.card
          ext i
          simp [RowCapOutsideCount, slotPoint,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap]
    _ = ((Finset.univ.filter fun i : Fin 4 ↦
          slotPoint i ∉ S.capByIndex cap).image slotPoint).card := by
          symm
          exact Finset.card_image_of_injective _ hinj
    _ = (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View row \
          S.capByIndex cap).card := by
          apply congrArg Finset.card
          rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
            (P := P) (Pρ := Pρ) View row]
          ext x
          simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ,
            true_and, Finset.mem_sdiff]
          constructor
          · rintro ⟨i, hi, hix⟩
            exact ⟨⟨i, hix⟩, by simpa [hix] using hi⟩
          · rintro ⟨⟨i, hix⟩, hx⟩
            refine ⟨i, ?_, hix⟩
            change
              FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
                  (freshThirdPinnedEndpointOutsideSeedRowSlot row i) ∉
                S.capByIndex cap
            exact hix.symm ▸ hx

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- On a semantic view, overlap of finite row slots is exactly semantic
support intersection cardinality. -/
theorem rowOverlapCount_ofView_eq
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (left right : RowRole) :
    RowOverlapCount
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        left right =
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View left ∩
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right).card := by
  classical
  let leftPoint : Fin 4 → ℝ² := fun i ↦
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot left i)
  have hinj : Function.Injective leftPoint := by
    simpa [leftPoint] using
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSlot_point_injective
        (P := P) (Pρ := Pρ) View left)
  have hpred :
      (Finset.univ.filter fun i : Fin 4 ↦
        ∃ j : Fin 4,
          FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same
            (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
            (freshThirdPinnedEndpointOutsideSeedRowSlot left i)
            (freshThirdPinnedEndpointOutsideSeedRowSlot right j)) =
      Finset.univ.filter fun i : Fin 4 ↦
        leftPoint i ∈
          FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right := by
    ext i
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
      (P := P) (Pρ := Pρ) View right]
    simp only [Finset.mem_image, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨j, hsame⟩
      exact ⟨j, by
        simpa [leftPoint,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint] using
          ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
            (P := P) (Pρ := Pρ) View _ _).1 hsame).symm⟩
    · rintro ⟨j, heq⟩
      exact ⟨j,
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).2 (by
            simpa [leftPoint,
              FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint] using heq.symm)⟩
  calc
    RowOverlapCount
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
          left right =
        (Finset.univ.filter fun i : Fin 4 ↦
          leftPoint i ∈
            FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right).card := by
          rw [RowOverlapCount, hpred]
    _ = ((Finset.univ.filter fun i : Fin 4 ↦
          leftPoint i ∈
            FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right).image
          leftPoint).card := by
          symm
          exact Finset.card_image_of_injective _ hinj
    _ = (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View left ∩
          FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right).card := by
          apply congrArg Finset.card
          rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
            (P := P) (Pρ := Pρ) View left]
          ext x
          simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ,
            true_and, Finset.mem_inter]
          constructor
          · rintro ⟨i, hi, hix⟩
            exact ⟨⟨i, hix⟩, by simpa [hix] using hi⟩
          · rintro ⟨⟨i, hix⟩, hx⟩
            refine ⟨i, ?_, hix⟩
            change
              FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
                  (freshThirdPinnedEndpointOutsideSeedRowSlot left i) ∈
                FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport
                  P Pρ View right
            exact hix.symm ▸ hx

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Actual equality of two exact row supports yields the finite slot-level
support equality predicate. -/
theorem rowSupportEq_ofView_of_eq
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    {left right : RowRole}
    (hsupport :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View left =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View right) :
    RowSupportEq
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
      left right := by
  classical
  intro i
  have hmem :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
          (freshThirdPinnedEndpointOutsideSeedRowSlot left i) ∈
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View left := by
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
      (P := P) (Pρ := Pρ) View left]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  rw [hsupport,
    FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
      (P := P) (Pρ := Pρ) View right] at hmem
  rcases Finset.mem_image.mp hmem with ⟨j, _, hji⟩
  exact ⟨j,
    (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ) View _ _).2 (by
        simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint] using
          hji.symm)⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The finite outside-seed predicate is exactly nonmembership of the named
semantic point in the six-point source seed. -/
theorem outsideSeed_ofView_iff
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (role : PointRole) :
    OutsideSeed
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        role ↔
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View role ∉
        freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
  classical
  rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.seed_eq_role_image
    (P := P) (Pρ := Pρ) View]
  constructor
  · intro hout hmem
    rcases Finset.mem_image.mp hmem with ⟨i, _, hi⟩
    exact hout i
      ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 (by
          simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint] using
            hi.symm))
  · intro hnot i hsame
    apply hnot
    apply Finset.mem_image.mpr
    refine ⟨i, Finset.mem_univ _, ?_⟩
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint] using
      ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).1 hsame).symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Translate the source boundary-row cap split into its finite named-role
form.  The three cardinality/cap conjuncts come from the packet itself; the
caller supplies only the endpoint-specific deletion disjunction. -/
theorem endpointCapSplitAt_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    {firstDeleted secondDeleted : PointRole}
    (hdelete :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View firstDeleted ∉
          DRow.support ∨
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View secondDeleted ∉
          DRow.support) :
    EndpointCapSplitAt
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View)
      firstDeleted secondDeleted := by
  change
    (¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Incident
          firstDeleted .boundary ∨
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Incident
          secondDeleted .boundary) ∧
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).InCap
        .boundaryCenter rowCap ∧
      RowCapInsideCount
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
          .boundary rowCap ≤ 2 ∧
      2 ≤ RowCapOutsideCount
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        .boundary rowCap
  refine ⟨?_, ?_, ?_, ?_⟩
  · rcases hdelete with hfirst | hsecond
    · exact Or.inl (by
        rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
          (P := P) (Pρ := Pρ)]
        simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using hfirst)
    · exact Or.inr (by
        rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
          (P := P) (Pρ := Pρ)]
        simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using hsecond)
  · rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
      (P := P) (Pρ := Pρ)]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.InCap,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
        Packet.row_center_cap
  · rw [rowCapInsideCount_ofView_eq (P := P) (Pρ := Pρ) View .boundary rowCap]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
      Packet.row_cap_inside
  · rw [rowCapOutsideCount_ofView_eq (P := P) (Pρ := Pρ) View .boundary rowCap]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
      Packet.row_cap_outside

end FreshThirdPinnedEndpointOutsideSeedFiniteConstraint

/-- Packet-independent finite source theory for the pinned-endpoint query.

Every field is interpreted on intrinsic row/seed indices.  The ambient
carrier is neither enumerated nor cardinality-bounded.  The no-center status
from the larger packet is deliberately not assumed: rejecting this weaker
fan theory is sufficient for a sound universal contradiction. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory
    (Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration) : Prop where
  relational :
    FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory Config
  seed_same_iff_eq : ∀ i j : Fin 6,
    Config.assignment.Same
      (freshThirdPinnedEndpointOutsideSeedSeedRole i)
      (freshThirdPinnedEndpointOutsideSeedSeedRole j) ↔ i = j
  pinned_in_seed : ∃ i : Fin 6,
    Config.assignment.Same .pinnedCenter
      (freshThirdPinnedEndpointOutsideSeedSeedRole i)
  pinned_ne_sourceCenter :
    ¬ Config.assignment.Same .pinnedCenter .sourceCenter
  pinned_ne_freshCenter :
    ¬ Config.assignment.Same .pinnedCenter .freshCenter
  seed_multiplicity : ∀ e : Fin 4 ↪ Fin 6,
    (∀ i : Fin 4,
      ¬ Config.assignment.Same .pinnedCenter
        (freshThirdPinnedEndpointOutsideSeedSeedRole (e i))) →
    ¬ ∀ i : Fin 4,
      Config.assignment.SameDistanceFrom .pinnedCenter
        (freshThirdPinnedEndpointOutsideSeedSeedRole (e 0))
        (freshThirdPinnedEndpointOutsideSeedSeedRole (e i))
  source_center_first_cap :
    Config.assignment.InCapInterior .sourceCenter Config.firstCap
  canonical_sources_first_cap :
    Config.assignment.InCapInterior .canonicalSource Config.firstCap ∧
      Config.assignment.InCapInterior .canonicalSecondSource Config.firstCap
  source_fresh_overlap_two :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
      Config.assignment .source .fresh = 2
  fresh_cap_ne_first : Config.freshCap ≠ Config.firstCap
  fresh_center_cap :
    Config.assignment.InCapInterior .freshCenter Config.freshCap
  endpoints_outside_first :
    ¬ Config.assignment.InCap .freshSourceOne Config.firstCap ∧
      ¬ Config.assignment.InCap .freshSourceTwo Config.firstCap
  point_in_some_cap : ∀ point,
    ∃ cap : Fin 3, Config.assignment.InCap point cap
  ordered_boundary_row :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
        Config .freshSourceOne .freshSourceTwo ∨
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
        Config .freshSourceTwo .freshSourceOne
  fan_source_outside_seed : ∃ i : Fin 4,
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OutsideSeed
      Config.assignment (.fanSource i)
  endpoint_split :
    (¬ Config.assignment.Same .pinnedCenter .boundaryCenter ∧
        ∃ i : Fin 4,
          FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OutsideSeed
            Config.assignment (.boundarySource i)) ∨
      (Config.assignment.Same .pinnedCenter .boundaryCenter ∧
        FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowSupportEq
          Config.assignment .fan .boundary)
  sourceFaithfulFan : ∀ i : Fin 4,
    Config.assignment.InCapInterior
        (.blockerCenter i) (Config.blockerCap i) ∧
      ¬ Config.assignment.HasFourAfterDeleting
        (.fanSource i) (.blockerCenter i) ∧
      ((Config.assignment.Same .pinnedCenter (.blockerCenter i) ∧
          FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowSupportEq
            Config.assignment .fan (.blocker i) ∧
          Config.assignment.Nonrobust .pinnedCenter) ∨
        (¬ Config.assignment.Same .pinnedCenter (.blockerCenter i) ∧
          FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
            Config.assignment .fan (.blocker i) ≤ 2))
  blocker_source_incident : ∀ i : Fin 4,
    Config.assignment.Incident (.fanSource i) (.blocker i)
  pinned_deletion_survives_iff_robust_or_not_incident : ∀ point,
    (Config.assignment.HasFourAfterDeleting point .pinnedCenter ↔
      ¬ Config.assignment.Nonrobust .pinnedCenter ∨
        ¬ Config.assignment.Incident point .fan)
  blocker_deletion_survives_iff_not_incident : ∀ i : Fin 4, ∀ point,
    (Config.assignment.HasFourAfterDeleting point (.blockerCenter i) ↔
      ¬ Config.assignment.Incident point (.blocker i))
  blocker_row_all_deletions_blocked : ∀ i j : Fin 4,
    ¬ Config.assignment.HasFourAfterDeleting
      (.blockerRowSource i j) (.blockerCenter i)
  normalizedFan :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.NormalizedFanOutcome Config

namespace FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every blocker center in the normalized selected-four fan is nonrobust.

This is the first consumer-ready consequence of the source-faithful fan and
the relational deletion law: each fan packet explicitly records one failed
deletion at its blocker center, and any such failed deletion contradicts full
deletion robustness at that center. -/
theorem blockerCenter_nonrobust
    {Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration}
    (Theory : FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config)
    (i : Fin 4) :
    Config.assignment.Nonrobust (.blockerCenter i) :=
  Theory.relational.blocked_deletion_nonrobust
    (.fanSource i) (.blockerCenter i) (Theory.sourceFaithfulFan i).2.1

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Under the pinned-center nonrobust status, the exact deletion law reduces
to the complement of incidence in the actual selected fan row. -/
theorem pinned_deletion_survives_iff_not_incident_of_nonrobust
    {Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration}
    (Theory : FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config)
    (hnonrobust : Config.assignment.Nonrobust .pinnedCenter)
    (point : FreshThirdPinnedEndpointOutsideSeedPointRole) :
    (Config.assignment.HasFourAfterDeleting point .pinnedCenter ↔
      ¬ Config.assignment.Incident point .fan) := by
  simpa [hnonrobust] using
    Theory.pinned_deletion_survives_iff_robust_or_not_incident point

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the pinned center is robust, every named deletion in the finite view
retains a four-point witness there. -/
theorem pinned_deletion_survives_of_not_nonrobust
    {Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration}
    (Theory : FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config)
    (hrobust : ¬ Config.assignment.Nonrobust .pinnedCenter)
    (point : FreshThirdPinnedEndpointOutsideSeedPointRole) :
    Config.assignment.HasFourAfterDeleting point .pinnedCenter :=
  (Theory.pinned_deletion_survives_iff_robust_or_not_incident point).2
    (Or.inl hrobust)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the finite named-role view, pinned-center nonrobustness therefore blocks
deletion of each of the four actual fan sources at the pinned center. -/
theorem fanSource_deletion_blocked_at_pinned_of_nonrobust
    {Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration}
    (Theory : FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config)
    (hnonrobust : Config.assignment.Nonrobust .pinnedCenter)
    (i : Fin 4) :
    ¬ Config.assignment.HasFourAfterDeleting (.fanSource i) .pinnedCenter := by
  have hincident : Config.assignment.Incident (.fanSource i) .fan :=
    (Theory.relational.rowTheory.incident_iff_slot (.fanSource i) .fan).2
      ⟨i, Theory.relational.rowTheory.same_refl (.fanSource i)⟩
  rw [Theory.pinned_deletion_survives_iff_robust_or_not_incident]
  simp only [hnonrobust, not_true_eq_false, false_or, hincident,
    not_true_eq_false, not_false_eq_true]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The universal source-faithful deletion fan transports exactly to the
finite named-role vocabulary.  The blocker-cap labels are the witnesses
chosen by `FiniteConfiguration.blockerCapOfView`; no cap alignment is added. -/
theorem sourceFaithfulFan_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    ∀ i : Fin 4,
      let Config :=
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
      Config.assignment.InCapInterior
          (.blockerCenter i) (Config.blockerCap i) ∧
        ¬ Config.assignment.HasFourAfterDeleting
          (.fanSource i) (.blockerCenter i) ∧
        ((Config.assignment.Same .pinnedCenter (.blockerCenter i) ∧
            FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowSupportEq
              Config.assignment .fan (.blocker i) ∧
            Config.assignment.Nonrobust .pinnedCenter) ∨
          (¬ Config.assignment.Same .pinnedCenter (.blockerCenter i) ∧
            FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
              Config.assignment .fan (.blocker i) ≤ 2)) := by
  classical
  intro i
  have hpacket := Classical.choose_spec (Packet.fan.fan.deletionPacket i)
  rcases hpacket with ⟨hcap, hblocked, hcenter | hseparate⟩
  · refine ⟨?_, ?_, Or.inl ⟨?_, ?_, ?_⟩⟩
    · change
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).InCapInterior
          (.blockerCenter i)
          ((FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView
            P Pρ View).blockerCap i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.blockerCapOfView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hcap
    · change
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).HasFourAfterDeleting
          (.fanSource i) (.blockerCenter i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hblocked
    · change
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Same
          .pinnedCenter (.blockerCenter i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hcenter.1
    · apply FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowSupportEq_ofView_of_eq
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using hcenter.2.1
    · change
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Nonrobust
          .pinnedCenter
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hcenter.2.2
  · refine ⟨?_, ?_, Or.inr ⟨?_, ?_⟩⟩
    · change
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).InCapInterior
          (.blockerCenter i)
          ((FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView
            P Pρ View).blockerCap i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.blockerCapOfView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hcap
    · change
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).HasFourAfterDeleting
          (.fanSource i) (.blockerCenter i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hblocked
    · change
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Same
          .pinnedCenter (.blockerCenter i)
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hseparate.1
    · change
        FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
            (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
            .fan (.blocker i) ≤ 2
      rw [FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowOverlapCount_ofView_eq
        (P := P) (Pρ := Pρ)]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using hseparate.2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The intrinsic fan normalization transports to the finite vocabulary
without retaining the ambient carrier or choosing a bounded cardinality.

The two branches retain exactly the source theorem's data: an actual
center-blocker/nonrobust witness, or the universal center inequality together
with the repeated-cap and mutual-cross-deletion pairs. -/
theorem normalizedFan_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.NormalizedFanOutcome
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  classical
  let Config :=
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
  rcases
      IndexedSourceFaithfulSelectedFourFan.centerBlocker_or_noCenterBlockerWitness
        Packet.fan.fan with hcenter | hnoCenter
  · rcases hcenter with ⟨W⟩
    refine Or.inl ⟨W.sourceIndex, W.blockerCap, ?_, ?_, ?_, ?_, ?_⟩
    · simpa [Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using W.center_eq
    · simpa [Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using W.blocker_mem_cap
    · simpa [Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using W.deletion_blocked
    · apply
        FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowSupportEq_ofView_of_eq
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using W.support_eq
    · simpa [Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using W.nonrobust
  · refine Or.inr ⟨?_, ?_, ?_⟩
    · intro i
      simpa [Config,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
          hnoCenter.center_ne_actualBlocker i
    · rcases hnoCenter.repeatedCapPair with
        ⟨i, j, hij, cap, hiCap, hjCap, hsame | hijFour | hjiFour⟩
      refine ⟨i, j, hij, cap, ?_, ?_, ?_⟩
      · simpa [Config,
          FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hiCap
      · simpa [Config,
          FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hjCap
      · exact Or.inl (by
          simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hsame)
      · refine ⟨i, j, hij, cap, ?_, ?_, Or.inr (Or.inl ?_)⟩
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hiCap
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hjCap
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hijFour
      · refine ⟨i, j, hij, cap, ?_, ?_, Or.inr (Or.inr ?_)⟩
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hiCap
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hjCap
        · simpa [Config,
            FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
            FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hjiFour
    · rcases hnoCenter.mutualCrossRows with
        ⟨i, j, hij, hijFour, hjiFour, hne⟩
      refine ⟨i, j, hij, ?_, ?_, ?_⟩
      · simpa [Config,
          FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hijFour
      · simpa [Config,
          FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hjiFour
      · simpa [Config,
          FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hne

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Transport the four explicit cyclic-order arms once the two endpoint roles
are identified with the source packet's `qOutside` and `qBetween` positions. -/
theorem orderedRowAtWith_of_positions
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    {outside between : FreshThirdPinnedEndpointOutsideSeedPointRole}
    (houtside :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View outside =
        qOutside)
    (hbetween :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View between =
        qBetween) :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View)
      outside between := by
  classical
  let Config :=
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
  have hbefore
      {left right : FreshThirdPinnedEndpointOutsideSeedPointRole}
      (hlt :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View left <
          FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View right) :
      Config.assignment.Before left right := by
    have hview :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.Before P Pρ View left right := by
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Before] using hlt
    have hassignment :=
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff
        (P := P) (Pρ := Pρ) View left right).2 hview
    simpa [Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] using hassignment
  have hboundaryPoint
      {role : FreshThirdPinnedEndpointOutsideSeedPointRole} {q : Fin B.n}
      (hposition :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View role = q) :
      B.boundary q =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View role := by
    rw [← hposition]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition] using
      B.point_eq
        ⟨FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View role,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
            (P := P) (Pρ := Pρ) View role⟩
  have hboundarySame
      {role : FreshThirdPinnedEndpointOutsideSeedPointRole}
      (hid : id =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View role) :
      Config.assignment.Same .boundaryCenter role := by
    have hview :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint
          P Pρ View .boundaryCenter role := by
      change B.boundary id =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View role
      calc
        B.boundary id =
            B.boundary
              (FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition
                P Pρ View role) := congrArg B.boundary hid
        _ = FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View role :=
          hboundaryPoint rfl
    have hassignment :=
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View .boundaryCenter role).2 hview
    simpa [Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] using hassignment
  have hcanonicalPoint :
      B.boundary
          (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩) =
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point
          P Pρ View .canonicalSource := by
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
      B.point_eq ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩
  have hendpointSplit
      {other : FreshThirdPinnedEndpointOutsideSeedPointRole} {q : Fin B.n}
      (hposition :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition P Pρ View other = q)
      (hsplit :
        EndpointDeletionPairCapSplitSurvivingRowAt S (B.boundary id)
          (B.boundary
            (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩))
          (B.boundary q) DRow rowCap) :
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.EndpointCapSplitAt
        Config .canonicalSource other := by
    have hdelete :
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point
              P Pρ View .canonicalSource ∉ DRow.support ∨
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point
              P Pρ View other ∉ DRow.support := by
      rw [← hcanonicalPoint, ← hboundaryPoint hposition]
      exact hsplit.1
    have hfinite :=
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.endpointCapSplitAt_ofView
        (P := P) (Pρ := Pρ) View hdelete
    simpa [Config] using hfinite
  rcases Packet.orderedRowAt with h | h | h | h
  · refine Or.inl ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · apply hbefore
      rw [houtside]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.1
    · apply hbefore
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.2.1
    · apply hboundarySame
      exact h.2.2.2.2.1.trans hbetween.symm
    · exact hendpointSplit houtside h.2.2.2.2.2
  · refine Or.inr (Or.inl ⟨?_, ?_, ?_, ?_, ?_, ?_⟩)
    · apply hbefore
      rw [houtside]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.1
    · apply hbefore
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.2.1
    · apply hboundarySame
      exact h.2.2.2.2.1.trans houtside.symm
    · exact hendpointSplit hbetween h.2.2.2.2.2
  · refine Or.inr (Or.inr (Or.inl ⟨?_, ?_, ?_, ?_, ?_, ?_⟩))
    · apply hbefore
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.1
    · apply hbefore
      rw [houtside]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.2.1
    · apply hboundarySame
      exact h.2.2.2.2.1.trans hbetween.symm
    · exact hendpointSplit houtside h.2.2.2.2.2
  · refine Or.inr (Or.inr (Or.inr ⟨?_, ?_, ?_, ?_, ?_, ?_⟩))
    · apply hbefore
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.1
    · apply hbefore
      rw [hbetween]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.1
    · apply hbefore
      rw [houtside]
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using h.2.2.2.1
    · apply hboundarySame
      exact h.2.2.2.2.1.trans houtside.symm
    · exact hendpointSplit hbetween h.2.2.2.2.2

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The packet's endpoint naming disjunction yields the packet-independent
ordered-row disjunction without choosing a preferred endpoint orientation. -/
theorem ordered_boundary_row_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
        (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View)
        .freshSourceOne .freshSourceTwo ∨
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
        (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View)
        .freshSourceTwo .freshSourceOne := by
  rcases Packet.endpointNames with hnames | hnames
  · apply Or.inl
    apply orderedRowAtWith_of_positions (P := P) (Pρ := Pρ) View
    · simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hnames.1.symm
    · simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hnames.2.symm
  · apply Or.inr
    apply orderedRowAtWith_of_positions (P := P) (Pρ := Pρ) View
    · simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hnames.1.symm
    · simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hnames.2.symm

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every exact arbitrary-carrier packet satisfies the complete
packet-independent finite source theory.  This theorem is the formal ingress
contract required before a finite incompatibility result can be promoted. -/
theorem ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  classical
  let Config :=
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
  have hsame_iff
      (left right : FreshThirdPinnedEndpointOutsideSeedPointRole) :
      Config.assignment.Same left right ↔
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View left =
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View right := by
    change
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
          left right ↔
        FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint P Pρ View left right
    exact FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
      (P := P) (Pρ := Pρ) View left right
  refine
    { relational := by
        simpa [Config] using
          (FreshThirdPinnedEndpointOutsideSeedFiniteRelationalTheory.ofView
            (P := P) (Pρ := Pρ) View)
      seed_same_iff_eq := ?_
      pinned_in_seed := ?_
      pinned_ne_sourceCenter := ?_
      pinned_ne_freshCenter := ?_
      seed_multiplicity := ?_
      source_center_first_cap := ?_
      canonical_sources_first_cap := ?_
      source_fresh_overlap_two := ?_
      fresh_cap_ne_first := ?_
      fresh_center_cap := ?_
      endpoints_outside_first := ?_
      point_in_some_cap := ?_
      ordered_boundary_row := ?_
      fan_source_outside_seed := ?_
      endpoint_split := ?_
      sourceFaithfulFan := ?_
      blocker_source_incident := ?_
      pinned_deletion_survives_iff_robust_or_not_incident := ?_
      blocker_deletion_survives_iff_not_incident := ?_
      blocker_row_all_deletions_blocked := ?_
      normalizedFan := ?_ }
  · intro i j
    constructor
    · intro hij
      exact FreshThirdPinnedEndpointOutsideSeedFiniteView.seedRole_point_injective
        (P := P) (Pρ := Pρ) View ((hsame_iff _ _).1 hij)
    · intro hij
      subst j
      exact (hsame_iff _ _).2 rfl
  · have hcenter := Packet.center_mem_seed
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.seed_eq_role_image
      (P := P) (Pρ := Pρ) View] at hcenter
    rcases Finset.mem_image.mp hcenter with ⟨i, _, hi⟩
    refine ⟨i, (hsame_iff _ _).2 ?_⟩
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hi.symm
  · intro hsame
    apply Packet.center_ne_source
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
      (hsame_iff _ _).1 hsame
  · intro hsame
    apply Packet.center_ne_fresh
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
      (hsame_iff _ _).1 hsame
  · intro e hne hsame
    apply FreshThirdPinnedEndpointOutsideSeedFiniteView.no_four_seed_roles_same_distance
      (P := P) (Pρ := Pρ) View e
    · intro i heq
      exact hne i ((hsame_iff _ _).2 heq)
    · intro i
      exact
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff
          (P := P) (Pρ := Pρ) View _ _ _).1 (hsame i)
  · exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 (by
          simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
            Packet.source_center_first_cap)
  · constructor
    · exact
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).2 (by
            simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
              C.surface.firstSource_data.2.1)
    · exact
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).2 (by
            simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
              C.surface.secondSource_data.2.1)
  · change
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
        (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
        .source .fresh = 2
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowOverlapCount_ofView_eq
      (P := P) (Pρ := Pρ) View .source .fresh]
    change
      ((H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card = 2
    rw [Packet.seedOverlap]
    have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
      intro h
      exact Q.sources_ne (Subtype.ext h)
    simpa using Finset.card_pair hsourcesNe
  · simpa [Config,
      FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView] using
      Packet.fresh_cap_ne_first
  · exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 (by
          simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
            Packet.fresh_center_cap)
  · constructor
    · intro hcap
      exact Packet.endpoints_outside_first.1
        ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).1 hcap)
    · intro hcap
      exact Packet.endpoints_outside_first.2
        ((FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).1 hcap)
  · intro point
    rcases S.exists_mem_capByIndex_of_mem
        (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
          (P := P) (Pρ := Pρ) View point) with ⟨cap, hcap⟩
    exact ⟨cap,
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff
        (P := P) (Pρ := Pρ) View point cap).2 hcap⟩
  · simpa [Config] using ordered_boundary_row_ofView
      (P := P) (Pρ := Pρ) View
  · rcases Packet.fan.rowEscape with ⟨z, hz, hzOutside⟩
    let i : Fin 4 := Packet.fan.fan.index ⟨z, hz⟩
    refine ⟨i, (FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.outsideSeed_ofView_iff
      (P := P) (Pρ := Pρ) View _).2 ?_⟩
    have hsource := Packet.fan.fan.source_index_support
      ⟨z, Packet.fan.Row.support_subset_A hz⟩ hz
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point, i, hsource] using
      hzOutside
  · rcases Packet.fan.endpointSplit with hoff | hendpoint
    · apply Or.inl
      refine ⟨?_, ?_⟩
      · intro hsame
        exact hoff.1 (by
          simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
            (hsame_iff _ _).1 hsame)
      · rcases hoff.2 with ⟨z, hz, hzOutside⟩
        let i : Fin 4 := View.boundaryIndex ⟨z, hz⟩
        refine ⟨i,
          (FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.outsideSeed_ofView_iff
            (P := P) (Pρ := Pρ) View _).2 ?_⟩
        simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point, i] using
          hzOutside
    · apply Or.inr
      refine ⟨(hsame_iff _ _).2 ?_, ?_⟩
      · simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
          hendpoint.1
      · apply FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowSupportEq_ofView_of_eq
          (P := P) (Pρ := Pρ) View
        simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
          hendpoint.2
  · simpa [Config] using sourceFaithfulFan_ofView
      (P := P) (Pρ := Pρ) View
  · intro i
    apply
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
        (Packet.fan.fan.blockerRow i).toCriticalFourShell.q_mem_support
  · intro point
    change
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).HasFourAfterDeleting
          point .pinnedCenter ↔
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Nonrobust
            .pinnedCenter ∨
          ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Incident
            point .fan
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ),
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff
        (P := P) (Pρ := Pρ),
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ)]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
        (selectedFourClass_survives_erase_iff_robust_or_not_mem
          Packet.fan.fan.center_mem Packet.fan.Row
          (x := FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View point))
  · intro i point
    change
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).HasFourAfterDeleting
          point (.blockerCenter i) ↔
        ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).Incident
          point (.blocker i)
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ),
      FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ)]
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.Incident,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
        (cross_deletion_survives_iff_not_mem_selected_support
          H (Packet.fan.fan.source i).2
          (w := FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View point))
  · intro i j
    change
      ¬ (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View).HasFourAfterDeleting
        (.blockerRowSource i j) (.blockerCenter i)
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff
      (P := P) (Pρ := Pρ)]
    apply Packet.fan.fan.blockerRow_support_deletion_blocked i
    exact (View.blockerRowIndex i).symm j |>.2
  · simpa [Config] using normalizedFan_ofView
      (P := P) (Pρ := Pρ) View

/- The exact finite survivor and compiler-trusted regression checks live in
`TwoSourceFreshThirdResidualDiagnostics`, so production consumers can build
without elaborating the diagnostic model. -/

end FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory

/-- Packet-independent certificate contract for the finite role theory.

A promoted certificate must reject every finite configuration satisfying the
source theory.  It cannot inspect an ambient packet, assume a bounded carrier,
or select one convenient indexing/alias presentation. -/
structure FreshThirdPinnedEndpointOutsideSeedFiniteQueryContract : Prop where
  reject : ∀ Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration,
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config → False

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
include T hblockersNe in
/-- Any replayed finite-query contract closes the original arbitrary-carrier
packet by applying it to the intrinsic finite view. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_finiteQueryContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (Contract : FreshThirdPinnedEndpointOutsideSeedFiniteQueryContract) :
    False := by
  let View := FreshThirdPinnedEndpointOutsideSeedFiniteView.ofPacket
    (P := P) (Pρ := Pρ) (T := T) (hblockersNe := hblockersNe) Packet
  exact Contract.reject
    (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View)
    (FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.ofView
      (P := P) (Pρ := Pρ) View)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The remaining pinned-endpoint FreshThird obligation after eliminating the
exact-support cyclic triangle.  Its two arms both expose a genuine row point
outside the six-point two-shell seed together with that point's canonical
blocker-cap packet.  The duplicated dual-cap witnesses have been normalized
to the source center in the first cap and the fresh center in one non-first
cap. -/
theorem false_of_freshThird_pinnedEndpoint_outsideSeedResidual
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hnames :
      (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩))
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩))
    (center : ℝ²) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenterSeed :
      center ∈ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q)
    (hcenterLocation :
      center ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1,
            Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
        center ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q)
    (hcenterNeSource :
      center ≠ H.centerAt C.surface.firstSource.1 C.surface.firstSource.2)
    (hcenterNeFresh :
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (hmult : ∀ shellRadius : ℝ, 0 < shellRadius →
      ((SelectedClass D.A center shellRadius) ∩
        freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card ≤ 3)
    (hrowCenter :
      B.boundary id = Q.source₁.1 ∨ B.boundary id = Q.source₂.1)
    (hsourceCenterFirst :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (freshCap : Fin 3)
    (hfreshCapNeFirst : freshCap ≠ S.oppIndex1)
    (hfreshCenterCap :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hsource₁OutsideFirst : Q.source₁.1 ∉ S.capByIndex S.oppIndex1)
    (hsource₂OutsideFirst : Q.source₂.1 ∉ S.capByIndex S.oppIndex1)
    (rowCap : Fin 3)
    (hrowAt : FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
      B.boundary
      qOutside
      (B.indexOf
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
      qBetween
      (B.indexOf
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
      (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩)
      id DRow rowCap)
    (hrowCenterCap : B.boundary id ∈ S.capByIndex rowCap)
    (hrowCapNeFirst : rowCap ≠ S.oppIndex1)
    (hrowCapInside :
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2)
    (hrowCapOutside :
      2 ≤ (DRow.support \ S.capByIndex rowCap).card)
    (hterminal :
      (center ≠ B.boundary id ∧
          (∃ z ∈ DRow.support,
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
          ∃ K : SelectedFourClass D.A center,
            (∃ z ∈ K.support,
              z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
            SourceFaithfulSelectedFourDeletionFan D S H K) ∨
        center = B.boundary id ∧
          (∃ z ∈ DRow.support,
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∧
          SourceFaithfulSelectedFourDeletionFan D S H DRow) :
    False := by
  classical
  let Packet :=
    FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource
      P Pρ C Q hexact overlap_eq B qOutside qBetween hnames hrow center id
      DRow hcenterSeed hcenterLocation hcenterNeSource hcenterNeFresh hmult
      hrowCenter hsourceCenterFirst freshCap hfreshCapNeFirst hfreshCenterCap
      hsource₁OutsideFirst hsource₂OutsideFirst rowCap hrowAt hrowCenterCap
      hrowCapNeFirst hrowCapInside hrowCapOutside hterminal
  have hpacketOutcome :=
    FreshThirdPinnedEndpointOutsideSeedQueryPacket.nonrobust_or_richApexCenter_or_robustSeparatedOutcome
      (P := P) (Pρ := Pρ) (T := T) (hblockersNe := hblockersNe) Packet
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global consumer for the fully source-produced pinned-endpoint packet.

This is the single mathematical obligation left by the checked FreshThird
reduction.  Unlike the former unnamed incidence placeholder, its hypotheses
retain both complete noncanonical interactions, the dual-cap identities, the
actual order-selected endpoint row, the six-point localization of the pinned
center, and the blocker dichotomy attached to a genuine point outside that
seed.  The exact-support arm additionally records that its endpoint is the
first apex and that its row radius is the common radius, now a K4 radius.  It
also carries the source-produced cyclic-separation triangle for the source,
fresh, and endpoint rows, so the remaining consumer no longer has to recover
any of the three shared-pair order constraints.

The theorem is intentionally universal in the source-produced center and row:
a finite computation can consume it only after a cardinality-independent
bounded-obstruction lift for precisely these alternatives. -/
theorem false_of_freshThird_pinnedEndpoint_globalResidual
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (sourceCap freshCap sourceCap' freshCap' : Fin 3)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (centers_ne' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem' :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem' :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (overlap_eq' :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCenter_mem' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap')
    (freshCenter_mem' :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap')
    (caps_ne' : sourceCap' ≠ freshCap')
    (hdual :
      sourceCap = S.oppIndex1 ∧
        freshCap ≠ S.oppIndex1 ∧
        sourceCap' = S.oppIndex1 ∧
        freshCap' ≠ S.oppIndex1 ∧
        sourceCap = sourceCap' ∧
        freshCap = freshCap' ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hnames :
      (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩))
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩))
    (center : ℝ²) (id : Fin B.n)
    (DRow : SelectedFourClass D.A (B.boundary id))
    (hcenterSeed :
      center ∈ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q)
    (hcenterLocation :
      center ∈
          ({C.surface.firstSource.1, C.surface.secondSource.1,
            Q.source₁.1, Q.source₂.1} : Finset ℝ²) ∨
        center ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q)
    (hcenterNeSource :
      center ≠
        H.centerAt C.surface.firstSource.1 C.surface.firstSource.2)
    (hcenterNeFresh :
      center ≠ H.centerAt Q.source₁.1 Q.source₁.2)
    (hmult : ∀ shellRadius : ℝ, 0 < shellRadius →
      ((SelectedClass D.A center shellRadius) ∩
        freshThirdCrossRowTwoShellSeed P Pρ C.surface Q).card ≤ 3)
    (hrowCenter :
      B.boundary id = Q.source₁.1 ∨
        B.boundary id = Q.source₂.1)
    (rowCap : Fin 3)
    (hrowAt : FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt S
      B.boundary
      qOutside
      (B.indexOf
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
      qBetween
      (B.indexOf
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
      (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩)
      id DRow rowCap)
    (hrowCenterCap : B.boundary id ∈ S.capByIndex rowCap)
    (hrowCapNeFirst : rowCap ≠ S.oppIndex1)
    (hrowCapInside :
      (DRow.support ∩ S.capByIndex rowCap).card ≤ 2)
    (hrowCapOutside :
      2 ≤ (DRow.support \ S.capByIndex rowCap).card)
    (hterminal :
      (center ≠ B.boundary id ∧
          ((∃ z ∈ DRow.support,
              z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∨
            (B.boundary id = S.oppApex1 ∧
              DRow.radius = C.commonRadius ∧
              4 ≤
                (SelectedClass D.A S.oppApex1 C.commonRadius).card ∧
              DRow.support =
                {C.surface.firstSource.1, C.surface.secondSource.1} ∪
                  freshThirdCrossRowFreshRemainder P Pρ C.surface Q ∧
              (let sourceCenter : CarrierLabel D.A :=
                  ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
                    (Finset.mem_erase.mp
                      (H.selectedAt C.surface.firstSource.1
                        C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
                let freshCenter : CarrierLabel D.A :=
                  ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                    (Finset.mem_erase.mp
                      (H.selectedAt Q.source₁.1
                        Q.source₁.2).toCriticalFourShell.center_mem).2⟩
                let endpointCenter : CarrierLabel D.A :=
                  ⟨B.boundary id, by
                    have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
                      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
                    simpa only [B.boundary_image] using hmem⟩
                ∃ remainder₁ remainder₂ : CarrierLabel D.A,
                  freshThirdCrossRowFreshRemainder P Pρ C.surface Q =
                      {remainder₁.1, remainder₂.1} ∧
                    remainder₁ ≠ remainder₂ ∧
                    SharedPairCyclicSeparation B sourceCenter freshCenter
                      Q.source₁ Q.source₂ ∧
                    SharedPairCyclicSeparation B sourceCenter endpointCenter
                      C.surface.firstSource C.surface.secondSource ∧
                    SharedPairCyclicSeparation B freshCenter endpointCenter
                      remainder₁ remainder₂))) ∧
          ∃ (K : SelectedFourClass D.A center) (z : ℝ²)
              (hz : z ∈ K.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ∃ blockerCap : Fin 3,
              H.centerAt z (K.support_subset_A hz) ∈
                  S.capInteriorByIndex blockerCap ∧
                ¬ HasNEquidistantPointsAt 4 (D.A.erase z)
                  (H.centerAt z (K.support_subset_A hz)) ∧
                ((center = H.centerAt z (K.support_subset_A hz) ∧
                    K.support =
                      (H.selectedAt z
                        (K.support_subset_A hz)).toCriticalFourShell.support ∧
                    ¬ FullyDeletionRobustAt D center) ∨
                  (center ≠ H.centerAt z (K.support_subset_A hz) ∧
                    (K.support ∩
                      (H.selectedAt z
                        (K.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2))) ∨
        center = B.boundary id ∧
          ∃ (z : ℝ²) (hz : z ∈ DRow.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ∃ blockerCap : Fin 3,
              H.centerAt z (DRow.support_subset_A hz) ∈
                  S.capInteriorByIndex blockerCap ∧
                ¬ HasNEquidistantPointsAt 4 (D.A.erase z)
                  (H.centerAt z (DRow.support_subset_A hz)) ∧
                ((center = H.centerAt z (DRow.support_subset_A hz) ∧
                    DRow.support =
                      (H.selectedAt z
                        (DRow.support_subset_A hz)).toCriticalFourShell.support ∧
                    ¬ FullyDeletionRobustAt D center) ∨
                  (center ≠ H.centerAt z (DRow.support_subset_A hz) ∧
                    (DRow.support ∩
                      (H.selectedAt z
                        (DRow.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2))) :
    False := by
  classical
  have hfirst :
      FreshThirdCrossRowHit P Pρ C.surface.firstSource Q :=
    ⟨centers_ne, source₁_mem, source₂_mem⟩
  have hsecond :
      FreshThirdCrossRowHit P Pρ C.surface.secondSource Q :=
    ⟨centers_ne', source₁_mem', source₂_mem'⟩
  have hexact : FreshThirdEqualCenterExactFourRow P Pρ C.surface Q :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C.surface Q hfirst hsecond hcenters
  have hsourceCenterFirst :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1 := by
    simpa [hdual.1] using sourceCenter_mem
  apply false_of_freshThird_pinnedEndpoint_outsideSeedResidual
    (P := P) (Pρ := Pρ)
    (hρne := hρne) (hfrontierFour := hfrontierFour)
    (hρfour := hρfour)
    (hfrontierInteriorEq := hfrontierInteriorEq)
    (hρInteriorEq := hρInteriorEq)
    (T := T) (hpairsDisjoint := hpairsDisjoint)
    (hblockersNe := hblockersNe)
    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
    (LP := LP) (hLP := hLP) (MP := MP)
    C Q hexact overlap_eq B qOutside qBetween hnames hrow center id DRow
    hcenterSeed hcenterLocation hcenterNeSource hcenterNeFresh hmult
    hrowCenter hsourceCenterFirst freshCap hdual.2.1 freshCenter_mem
    hdual.2.2.2.2.2.2.1 hdual.2.2.2.2.2.2.2 rowCap hrowAt hrowCenterCap
    hrowCapNeFirst hrowCapInside hrowCapOutside
  have G : TriApexAllLargeContext D S :=
    triApexAllLargeContext_of_residuals (H := H) L N T
  rcases hterminal with hoffEndpoint | hatEndpoint
  · rcases hoffEndpoint with ⟨hcenterNeEndpoint, hrowAlternative,
      hblocker⟩
    rcases hblocker with ⟨K, z, hz, hzOutside, _⟩
    have hfan : SourceFaithfulSelectedFourDeletionFan D S H K :=
      sourceFaithfulDeletionFan_of_triApexAllLargeContext G K
    rcases hrowAlternative with hrowEscape | hexactSupport
    · exact
        Or.inl
          ⟨hcenterNeEndpoint, hrowEscape, K, ⟨z, hz, hzOutside⟩, hfan⟩
    · rcases hexactSupport with
        ⟨_endpoint, _hradius, _hfour, hsupport, _hcyclic⟩
      exact (false_of_freshThird_exactSupport_cyclicTriangle
        (P := P) (Pρ := Pρ) C Q hexact centers_ne source₁_mem
        source₂_mem overlap_eq B id DRow hrowCenter hsupport).elim
  · rcases hatEndpoint with ⟨hcenterEq, z, hz, hzOutside, _⟩
    have hfan : SourceFaithfulSelectedFourDeletionFan D S H DRow :=
      sourceFaithfulDeletionFan_of_triApexAllLargeContext G DRow
    exact Or.inr ⟨hcenterEq, ⟨z, hz, hzOutside⟩, hfan⟩

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Direct source-level residual after the checked common-radius dual-cap
reduction and endpoint-deletion split.

The survivor packet fixes the boundary indexing and exact endpoint row.  The
proved complement lemma above shows that this row has at least two points
outside, rather than inside, the exact fresh shell.  The remaining obligation
therefore keeps the full dual-cap and order data and asks directly for the
global contradiction; it does not assume the unsupported positive-incidence
pair that an earlier interface tried to expose. -/
theorem false_of_freshThird_commonRadius_distinctCaps_survivingRow
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap freshCap sourceCap' freshCap' : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (centers_ne' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem' :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem' :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (overlap_eq' :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCenter_mem' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap')
    (freshCenter_mem' :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap')
    (caps_ne' : sourceCap' ≠ freshCap')
    (hdual :
      sourceCap = S.oppIndex1 ∧
        freshCap ≠ S.oppIndex1 ∧
        sourceCap' = S.oppIndex1 ∧
        freshCap' ≠ S.oppIndex1 ∧
        sourceCap = sourceCap' ∧
        freshCap = freshCap' ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1)
    (B : BoundaryIndexing D.A) (qOutside qBetween : Fin B.n)
    (hnames :
      (qOutside = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩) ∨
        (qOutside = B.indexOf ⟨Q.source₂.1, Q.source₂.2⟩ ∧
          qBetween = B.indexOf ⟨Q.source₁.1, Q.source₁.2⟩))
    (hrow :
      FreshThirdOrderSelectedEndpointCapSplitSurvivingRow S
        B.boundary qOutside
        (B.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        qBetween
        (B.indexOf
          ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.surface.firstSource.1
                C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩)
        (B.indexOf ⟨C.surface.firstSource.1,
          C.surface.firstSource.2⟩)) : False := by
  classical
  have hfirst :
      FreshThirdCrossRowHit P Pρ C.surface.firstSource Q :=
    ⟨centers_ne, source₁_mem, source₂_mem⟩
  have hsecond :
      FreshThirdCrossRowHit P Pρ C.surface.secondSource Q :=
    ⟨centers_ne', source₁_mem', source₂_mem'⟩
  have hexact :
      FreshThirdEqualCenterExactFourRow P Pρ C.surface Q :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C.surface Q hfirst hsecond hcenters
  rcases
      freshThird_pinnedEndpointRow_escape_or_offEndpoint
        (P := P) (Pρ := Pρ) (T := T)
        C Q hexact overlap_eq B qOutside qBetween hrow with
    ⟨center, id, DRow, rowCap, hcenterSeed, hcenterNeSource, hcenterNeFresh,
      hmult, hendpoint, hrowCenterCap, hrowCapInside, hrowCapOutside,
      hterminal, hAt⟩
  have hrowCenter :
      B.boundary id = Q.source₁.1 ∨
        B.boundary id = Q.source₂.1 := by
    rcases hendpoint with rfl | rfl
    · rcases hnames with ⟨houtside, _⟩ | ⟨houtside, _⟩
      · left
        rw [houtside]
        exact B.point_eq _
      · right
        rw [houtside]
        exact B.point_eq _
    · rcases hnames with ⟨_, hbetween⟩ | ⟨_, hbetween⟩
      · right
        rw [hbetween]
        exact B.point_eq _
      · left
        rw [hbetween]
        exact B.point_eq _
  have hrowCapNeFirst : rowCap ≠ S.oppIndex1 := by
    intro hcap
    subst rowCap
    rcases hrowCenter with hq₁ | hq₂
    · exact hdual.2.2.2.2.2.2.1 (by
        simpa only [hq₁] using hrowCenterCap)
    · exact hdual.2.2.2.2.2.2.2 (by
        simpa only [hq₂] using hrowCenterCap)
  have hcenterLocation :=
    freshThirdEqualCenter_seed_mem_named_or_freshRemainder
      P Pρ C.surface Q hexact hcenterSeed
  have hterminal' :
      (center ≠ B.boundary id ∧
          ((∃ z ∈ DRow.support,
              z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q) ∨
            (B.boundary id = S.oppApex1 ∧
              DRow.radius = C.commonRadius ∧
              4 ≤
                (SelectedClass D.A S.oppApex1 C.commonRadius).card ∧
              DRow.support =
                {C.surface.firstSource.1, C.surface.secondSource.1} ∪
                  freshThirdCrossRowFreshRemainder P Pρ C.surface Q ∧
              (let sourceCenter : CarrierLabel D.A :=
                  ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
                    (Finset.mem_erase.mp
                      (H.selectedAt C.surface.firstSource.1
                        C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
                let freshCenter : CarrierLabel D.A :=
                  ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                    (Finset.mem_erase.mp
                      (H.selectedAt Q.source₁.1
                        Q.source₁.2).toCriticalFourShell.center_mem).2⟩
                let endpointCenter : CarrierLabel D.A :=
                  ⟨B.boundary id, by
                    have hmem : B.boundary id ∈ Finset.univ.image B.boundary :=
                      Finset.mem_image.mpr ⟨id, Finset.mem_univ _, rfl⟩
                    simpa only [B.boundary_image] using hmem⟩
                ∃ remainder₁ remainder₂ : CarrierLabel D.A,
                  freshThirdCrossRowFreshRemainder P Pρ C.surface Q =
                      {remainder₁.1, remainder₂.1} ∧
                    remainder₁ ≠ remainder₂ ∧
                    SharedPairCyclicSeparation B sourceCenter freshCenter
                      Q.source₁ Q.source₂ ∧
                    SharedPairCyclicSeparation B sourceCenter endpointCenter
                      C.surface.firstSource C.surface.secondSource ∧
                    SharedPairCyclicSeparation B freshCenter endpointCenter
                      remainder₁ remainder₂))) ∧
          ∃ (K : SelectedFourClass D.A center) (z : ℝ²)
              (hz : z ∈ K.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ∃ blockerCap : Fin 3,
              H.centerAt z (K.support_subset_A hz) ∈
                  S.capInteriorByIndex blockerCap ∧
                ¬ HasNEquidistantPointsAt 4 (D.A.erase z)
                  (H.centerAt z (K.support_subset_A hz)) ∧
                ((center = H.centerAt z (K.support_subset_A hz) ∧
                    K.support =
                      (H.selectedAt z
                        (K.support_subset_A hz)).toCriticalFourShell.support ∧
                    ¬ FullyDeletionRobustAt D center) ∨
                  (center ≠ H.centerAt z (K.support_subset_A hz) ∧
                    (K.support ∩
                      (H.selectedAt z
                        (K.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2))) ∨
        center = B.boundary id ∧
          ∃ (z : ℝ²) (hz : z ∈ DRow.support),
            z ∉ freshThirdCrossRowTwoShellSeed P Pρ C.surface Q ∧
            ∃ blockerCap : Fin 3,
              H.centerAt z (DRow.support_subset_A hz) ∈
                  S.capInteriorByIndex blockerCap ∧
                ¬ HasNEquidistantPointsAt 4 (D.A.erase z)
                  (H.centerAt z (DRow.support_subset_A hz)) ∧
                ((center = H.centerAt z (DRow.support_subset_A hz) ∧
                    DRow.support =
                      (H.selectedAt z
                        (DRow.support_subset_A hz)).toCriticalFourShell.support ∧
                    ¬ FullyDeletionRobustAt D center) ∨
                  (center ≠ H.centerAt z (DRow.support_subset_A hz) ∧
                    (DRow.support ∩
                      (H.selectedAt z
                        (DRow.support_subset_A hz)).toCriticalFourShell.support).card ≤ 2)) := by
    rcases hterminal with hoff | hagree
    · left
      rcases hoff.2.2 with ⟨K, z, hz, hzOutside, _hblocker⟩
      refine ⟨hoff.1, ?_, K, z, hz, hzOutside, ?_⟩
      rcases hoff.2.1 with hescape | hsupport
      · exact Or.inl hescape
      · have hcenter :=
          freshThird_exactSupport_endpointRow_center_eq_firstApex
            (P := P) (Pρ := Pρ) C Q B id DRow hrowCenter hsupport
            hdual.2.2.2.2.2.2.1 hdual.2.2.2.2.2.2.2
        have hradius :=
          freshThird_exactSupport_endpointRow_radius_eq_commonRadius
            (P := P) (Pρ := Pρ) C Q B id DRow hcenter hsupport
        have hfour :=
          freshThird_exactSupport_commonRadius_card_ge_four
            (P := P) (Pρ := Pρ) C Q B id DRow hcenter hsupport
        have hcyclic :=
          freshThird_exactSupport_threeRowCyclicSeparations
            (P := P) (Pρ := Pρ) C Q hexact centers_ne
            source₁_mem source₂_mem overlap_eq B id DRow hrowCenter hsupport
        exact Or.inr ⟨hcenter, hradius, hfour, hsupport, hcyclic⟩
      · exact
          freshThird_outsideSeed_blocker_capInterior
            (P := P) (Pρ := Pρ) (T := T)
            C.surface Q center K z hz hzOutside
    · rcases hagree with ⟨hcenterEq, z, hz, hzOutside, _hblocker⟩
      subst center
      right
      refine ⟨rfl, z, hz, hzOutside, ?_⟩
      exact
        freshThird_outsideSeed_blocker_capInterior
          (P := P) (Pρ := Pρ) (T := T)
          C.surface Q (B.boundary id) DRow z hz hzOutside
  exact
    false_of_freshThird_pinnedEndpoint_globalResidual
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      C Q hcenters
      sourceCap freshCap sourceCap' freshCap'
      centers_ne source₁_mem source₂_mem overlap_eq
      sourceCenter_mem freshCenter_mem caps_ne
      centers_ne' source₁_mem' source₂_mem' overlap_eq'
      sourceCenter_mem' freshCenter_mem' caps_ne' hdual
      B qOutside qBetween hnames hrow center id DRow hcenterSeed
      hcenterLocation hcenterNeSource hcenterNeFresh hmult hrowCenter
      rowCap hAt hrowCenterCap hrowCapNeFirst hrowCapInside hrowCapOutside
      hterminal'

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility interface for the former positive-incidence route.

The exact survivor-row analysis has the opposite direct consequence: the row
contains at least two points *outside* the fresh critical shell.  The live
obligation is therefore
`false_of_freshThird_commonRadius_distinctCaps_survivingRow`; once that direct
contradiction is proved, this older one-arc packet follows by elimination and
continues to serve callers without presenting a second proof obligation. -/
theorem exists_freshThird_commonRadius_distinctCaps_survivingRow_oneArcSharedPairObstruction
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (centers_ne' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem' :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem' :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support)
    (overlap_eq' :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap' freshCap' : Fin 3)
    (sourceCenter_mem' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap')
    (freshCenter_mem' :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap')
    (caps_ne' : sourceCap' ≠ freshCap') :
    ∃ (B : BoundaryIndexing D.A) (ic id : Fin B.n) (rowRadius : ℝ)
        (DRow : SelectedFourClass D.A (B.boundary id)),
      ic ≠ id ∧
      0 < rowRadius ∧
      4 ≤ (SelectedClass D.A (B.boundary ic) rowRadius).card ∧
      (2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) rowRadius ∧
            B.boundary i ∈ DRow.support ∧
            SurplusCOMPGBank.btw ic id i).card ∨
        2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) rowRadius ∧
            B.boundary i ∈ DRow.support ∧
            ¬ SurplusCOMPGBank.btw ic id i).card) := by
  have hdualPacket :=
    freshThird_commonRadius_distinctCaps_dual_packet
      (P := P) (Pρ := Pρ) (T := T) C Q hcenters centers_ne
      source₁_mem source₂_mem overlap_eq sourceCap freshCap
      sourceCenter_mem freshCenter_mem caps_ne centers_ne'
      source₁_mem' source₂_mem' overlap_eq' sourceCap' freshCap'
      sourceCenter_mem' freshCenter_mem' caps_ne'
  have hdualComponents := hdualPacket
  rcases hdualComponents with
    ⟨hsourceCanonical, hfreshNe, _hsourceCanonical', _hfreshNe',
      _hsourceCapsEq, _hfreshCapsEq, hq1Off, hq2Off⟩
  have hsurvivingRow :=
    freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow
      (P := P) (Pρ := Pρ) C.surface Q centers_ne
      source₁_mem source₂_mem sourceCap freshCap
      sourceCenter_mem freshCenter_mem
      ⟨hsourceCanonical, hfreshNe, hq1Off, hq2Off⟩
  rcases hsurvivingRow with ⟨B, qOutside, qBetween, hnames, hrow⟩
  have hpairObstruction :
      ∃ (id ix iy : Fin B.n)
          (DRow : SelectedFourClass D.A (B.boundary id)),
        B.indexOf
            ⟨H.centerAt Q.source₁.1 Q.source₁.2,
              (Finset.mem_erase.mp
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.center_mem).2⟩ ≠ id ∧
        ix ≠ iy ∧
        B.boundary ix ∈
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support ∧
        B.boundary iy ∈
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support ∧
        B.boundary ix ∈ DRow.support ∧
        B.boundary iy ∈ DRow.support ∧
        ((SurplusCOMPGBank.btw
              (B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
              id ix ∧
            SurplusCOMPGBank.btw
              (B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
              id iy) ∨
          (¬ SurplusCOMPGBank.btw
              (B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
              id ix ∧
            ¬ SurplusCOMPGBank.btw
              (B.indexOf
                ⟨H.centerAt Q.source₁.1 Q.source₁.2,
                  (Finset.mem_erase.mp
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
              id iy)) :=
    (false_of_freshThird_commonRadius_distinctCaps_survivingRow
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        C Q hcenters centers_ne source₁_mem source₂_mem overlap_eq
        sourceCap freshCap sourceCap' freshCap'
        sourceCenter_mem freshCenter_mem caps_ne
        centers_ne' source₁_mem' source₂_mem' overlap_eq'
        sourceCenter_mem' freshCenter_mem' caps_ne' hdualPacket
        B qOutside qBetween hnames hrow).elim
  rcases hpairObstruction with
    ⟨id, ix, iy, DRow, hicd, hxiy, hxFresh, hyFresh,
      hxD, hyD, hsameSide⟩
  let freshRow :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp freshRow.center_mem).2⟩
  let ic : Fin B.n := B.indexOf freshCenter
  have hcenter : B.boundary ic =
      H.centerAt Q.source₁.1 Q.source₁.2 := by
    exact B.point_eq freshCenter
  have hshellSubset :
      freshRow.support ⊆
        SelectedClass D.A (B.boundary ic) freshRow.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨freshRow.support_subset_A hz,
        by simpa [hcenter] using freshRow.support_eq_radius z hz⟩
  have hcard :
      4 ≤ (SelectedClass D.A (B.boundary ic) freshRow.radius).card := by
    calc
      4 = freshRow.support.card := freshRow.support_card.symm
      _ ≤ (SelectedClass D.A (B.boundary ic) freshRow.radius).card :=
        Finset.card_le_card hshellSubset
  have hxClass :
      B.boundary ix ∈
        SelectedClass D.A (B.boundary ic) freshRow.radius :=
    hshellSubset (by simpa [freshRow] using hxFresh)
  have hyClass :
      B.boundary iy ∈
        SelectedClass D.A (B.boundary ic) freshRow.radius :=
    hshellSubset (by simpa [freshRow] using hyFresh)
  have htwo :
      2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            SurplusCOMPGBank.btw ic id i).card ∨
        2 ≤ (Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            ¬ SurplusCOMPGBank.btw ic id i).card := by
    rcases hsameSide with hinside | houtside
    · left
      have hxMem : ix ∈ Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            SurplusCOMPGBank.btw ic id i := by
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact ⟨hxClass, hxD, by simpa [ic, freshCenter] using hinside.1⟩
      have hyMem : iy ∈ Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            SurplusCOMPGBank.btw ic id i := by
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact ⟨hyClass, hyD, by simpa [ic, freshCenter] using hinside.2⟩
      have hpair : ({ix, iy} : Finset (Fin B.n)) ⊆
          Finset.univ.filter fun i : Fin B.n ↦
            B.boundary i ∈
                SelectedClass D.A (B.boundary ic) freshRow.radius ∧
              B.boundary i ∈ DRow.support ∧
              SurplusCOMPGBank.btw ic id i := by
        simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
          using ⟨hxMem, hyMem⟩
      simpa [Finset.card_pair hxiy] using Finset.card_le_card hpair
    · right
      have hxMem : ix ∈ Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            ¬ SurplusCOMPGBank.btw ic id i := by
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact ⟨hxClass, hxD, by simpa [ic, freshCenter] using houtside.1⟩
      have hyMem : iy ∈ Finset.univ.filter fun i : Fin B.n ↦
          B.boundary i ∈
              SelectedClass D.A (B.boundary ic) freshRow.radius ∧
            B.boundary i ∈ DRow.support ∧
            ¬ SurplusCOMPGBank.btw ic id i := by
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact ⟨hyClass, hyD, by simpa [ic, freshCenter] using houtside.2⟩
      have hpair : ({ix, iy} : Finset (Fin B.n)) ⊆
          Finset.univ.filter fun i : Fin B.n ↦
            B.boundary i ∈
                SelectedClass D.A (B.boundary ic) freshRow.radius ∧
              B.boundary i ∈ DRow.support ∧
              ¬ SurplusCOMPGBank.btw ic id i := by
        simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
          using ⟨hxMem, hyMem⟩
      simpa [Finset.card_pair hxiy] using Finset.card_le_card hpair
  exact ⟨B, ic, id, freshRow.radius, DRow,
    by simpa [ic, freshCenter] using hicd,
    freshRow.radius_pos, hcard, htwo⟩

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consume the common-radius packet in the equal-center residual.  The
packet is useful precisely when either positive interaction is a
noncanonical same-cap interaction: its source-center witness is then enough
for the common-radius shell consumer.  The remaining constructor arms still
use the original residual leaf, so this helper is an ingress refinement, not
an independent closure claim. -/
private theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C.surface Q) :
    False := by
  cases hremaining with
  | firstNonHit data secondInteraction =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          (hingress := Or.inr ⟨C⟩)
          C.surface Q (.firstNonHit data secondInteraction)
  | secondNonHit firstInteraction data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          (hingress := Or.inr ⟨C⟩)
          C.surface Q (.secondNonHit firstInteraction data)
  | equalCrossRowCenters hfirst hsecond hcenters firstInteraction secondInteraction =>
      cases firstInteraction with
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          cases secondInteraction with
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              rcases
                  exists_freshThird_commonRadius_distinctCaps_survivingRow_oneArcSharedPairObstruction
                    (P := P) (Pρ := Pρ)
                    (hρne := hρne) (hfrontierFour := hfrontierFour)
                    (hρfour := hρfour)
                    (hfrontierInteriorEq := hfrontierInteriorEq)
                    (hρInteriorEq := hρInteriorEq)
                    (T := T) (hpairsDisjoint := hpairsDisjoint)
                    (hblockersNe := hblockersNe)
                    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                    (LP := LP) (hLP := hLP) (MP := MP)
                    C Q hcenters centers_ne source₁_mem source₂_mem
                    overlap_eq sourceCap freshCap sourceCenter_mem
                    freshCenter_mem caps_ne centers_ne' source₁_mem'
                    source₂_mem' overlap_eq' sourceCap' freshCap'
                    sourceCenter_mem' freshCenter_mem' caps_ne' with
                ⟨B, ic, id, rowRadius, DRow, hicd, hradius, hcard, htwo⟩
              exact
                false_of_selectedClass_and_row_two_shared_on_one_arc
                  B ic id hicd hradius hcard DRow htwo
              /-
              · have hsourceCap :
                    H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
                      S.capByIndex S.oppIndex1 :=
                  S.capInteriorByIndex_subset_capByIndex _ hgeometry.1
                have hfreshCap :
                    H.centerAt Q.source₁.1 Q.source₁.2 ∈
                      S.capByIndex S.oppIndex1 := by
                  rw [← hfreshCanonical]
                  exact
                    S.capInteriorByIndex_subset_capByIndex _ freshCenter_mem
                have hq1Off : Q.source₁.1 ∉ S.capByIndex S.oppIndex1 := by
                  intro hqCap
                  have hqInter :
                      Q.source₁.1 ∈
                        (H.selectedAt C.surface.firstSource.1
                          C.surface.firstSource.2).toCriticalFourShell.support ∩
                          S.capByIndex S.oppIndex1 :=
                    Finset.mem_inter.mpr ⟨source₁_mem, hqCap⟩
                  rw [hgeometry.2] at hqInter
                  have hqCases :
                      Q.source₁.1 = C.surface.firstSource.1 ∨
                        Q.source₁.1 = C.surface.secondSource.1 := by
                    simpa [Finset.mem_insert, Finset.mem_singleton] using hqInter
                  rcases hqCases with hq | hq
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans
                      (hcenters.symm.trans hcenters)
                have hq2Off : Q.source₂.1 ∉ S.capByIndex S.oppIndex1 := by
                  intro hqCap
                  have hqInter :
                      Q.source₂.1 ∈
                        (H.selectedAt C.surface.firstSource.1
                          C.surface.firstSource.2).toCriticalFourShell.support ∩
                          S.capByIndex S.oppIndex1 :=
                    Finset.mem_inter.mpr ⟨source₂_mem, hqCap⟩
                  rw [hgeometry.2] at hqInter
                  have hqCases :
                      Q.source₂.1 = C.surface.firstSource.1 ∨
                        Q.source₂.1 = C.surface.secondSource.1 := by
                    simpa [Finset.mem_insert, Finset.mem_singleton] using hqInter
                  have hQCenters :
                      H.centerAt Q.source₂.1 Q.source₂.2 =
                        H.centerAt Q.source₁.1 Q.source₁.2 :=
                    congrArg Subtype.val Q.blockers_eq
                  rcases hqCases with hq | hq
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans hQCenters
                  · apply centers_ne
                    exact
                      (congrArg
                        (fun z : CriticalShellSystem.CarrierVertex D.A =>
                          H.centerAt z.1 z.2)
                        (Subtype.ext hq)).symm.trans
                      (hcenters.symm.trans hcenters).trans hQCenters
                exact
                  false_of_freshThird_sameCapCrossRowAlignment
                    (P := P) (Pρ := Pρ) Q C.surface.firstSource
                    ⟨S.oppIndex1, hfreshCap, hsourceCap, centers_ne,
                      hq1Off, hq2Off, source₁_mem, source₂_mem⟩
              · exact
                  false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                    (P := P) (Pρ := Pρ)
                    (hρne := hρne) (hfrontierFour := hfrontierFour)
                    (hρfour := hρfour)
                    (hfrontierInteriorEq := hfrontierInteriorEq)
                    (hρInteriorEq := hρInteriorEq)
                    (T := T) (hpairsDisjoint := hpairsDisjoint)
                    (hblockersNe := hblockersNe)
                    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                    (LP := LP) (hLP := hLP) (MP := MP)
                    (hingress := Or.inr ⟨C⟩)
                    C.surface Q
                    (.equalCrossRowCenters hfirst hsecond hcenters
                      (.distinctBlockersDifferentCaps centers_ne source₁_mem
                        source₂_mem overlap_eq sourceCap freshCap sourceCenter_mem
                        freshCenter_mem caps_ne)
                      (.distinctBlockersDifferentCaps centers_ne' source₁_mem'
                        source₂_mem' overlap_eq' sourceCap' freshCap'
                        sourceCenter_mem' freshCenter_mem' caps_ne'))
              -/
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' hcapIndex' =>
              have sourceCenter_mem_first :
                  H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
                    S.capInteriorByIndex capIndex' := by
                simpa [hcenters] using sourceCenter_mem'
              exact
                false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
                  (P := P) (Pρ := Pρ) C T.oppApex1_rich
                  sourceCenter_mem_first hcapIndex' hcenters
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap
          hcapIndex =>
          exact
            false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
              (P := P) (Pρ := Pρ) C T.oppApex1_rich
              sourceCenter_mem hcapIndex hcenters

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Common-radius version of the normalized core.  It keeps the producer's
provenance through residual construction, allowing the packet-aware terminal
to consume same-cap/equal-center branches before falling back to the existing
residual leaf. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.secondSource Q) :
    False := by
  let obstruction :=
    FreshThirdTwoCapSourceObstruction.normalized
      (P := P) (Pρ := Pρ) C.surface Q firstInteraction secondInteraction
  by_cases hrows : obstruction.HasDistinctCrossRows
  · exact
      FreshThirdTwoCapSourceObstruction.false_of_hasDistinctCrossRows
        (P := P) (Pρ := Pρ) obstruction hrows
  · exact
      let hresidual :=
        FreshThirdTwoCapSourceObstruction.residualCase_of_isResidual
          (P := P) (Pρ := Pρ) obstruction
          (FreshThirdTwoCapSourceObstruction.isResidual_of_not_hasDistinctCrossRows
            (P := P) (Pρ := Pρ) obstruction hrows)
      have hremaining :=
        FreshThirdTwoCapSourceObstruction.freshThirdNormalizedResidualRemainingCase_of_residual
          (P := P) (Pρ := Pρ) C.surface Q firstInteraction secondInteraction
          hresidual
      false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        C Q hremaining

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor-specific terminal for the normalized fresh-third packet after
the checked distinct-three-center arm has been removed. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    False := by
  have hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C :=
    freshThird_acyclic_canonical_consumerPacket
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq) (T := T)
      (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP) C
  have false_of_omission :
      ∀ (source : CriticalShellSystem.CarrierVertex D.A)
        (h : FreshThirdCrossRowHit P Pρ source Q)
        (deleted : CriticalShellSystem.CarrierVertex D.A)
        (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
        (deleted_not_mem :
          deleted.1 ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support),
        False := by
    intro source h deleted deleted_eq deleted_not_mem
    rcases deleted_eq with rfl | rfl
    · exact deleted_not_mem h.2.1
    · exact deleted_not_mem h.2.2
  cases hresidual with
  | firstNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          (hingress := hingress)
          C Q
          (.firstNonHit data secondInteraction)
  | secondNonHit data =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          (hingress := hingress)
          C Q
          (.secondNonHit firstInteraction data)
  | equalCrossRowCenters hfirst hsecond hcenters =>
      have closeCanonicalFirst :
          ∀ {capIndex : Fin 3},
            H.centerAt C.firstSource.1 C.firstSource.2 ∈
              S.capInteriorByIndex capIndex →
            (Q.source₁.1 ∈ S.capByIndex capIndex ∨
              Q.source₂.1 ∈ S.capByIndex capIndex) →
            capIndex = S.oppIndex1 → False := by
        intro capIndex sourceCenter_mem fiberSource_mem_cap hcapIndex
        exact
          false_of_freshThirdEqualCenter_sameCapOppIndex
            (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
            hfirst.2.1 hfirst.2.2 capIndex sourceCenter_mem
            fiberSource_mem_cap hcapIndex
      cases firstInteraction with
      | sameBlocker center_eq _ =>
          exact hfirst.1 center_eq
      | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
          exact false_of_omission C.firstSource hfirst deleted deleted_eq
            deleted_not_mem
      | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
          overlap_eq sourceCap freshCap sourceCenter_mem freshCenter_mem caps_ne =>
          let firstNonCanonical :=
            FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
              centers_ne source₁_mem source₂_mem overlap_eq sourceCap freshCap
              sourceCenter_mem freshCenter_mem caps_ne
          cases secondInteraction with
          | sameBlocker center_eq _ =>
              exact hsecond.1 center_eq
          | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
              exact false_of_omission C.secondSource hsecond deleted deleted_eq
                deleted_not_mem
          | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
              overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
              caps_ne' =>
              exact
                false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                  (P := P) (Pρ := Pρ)
                  (hρne := hρne) (hfrontierFour := hfrontierFour)
                  (hρfour := hρfour)
                  (hfrontierInteriorEq := hfrontierInteriorEq)
                  (hρInteriorEq := hρInteriorEq)
                  (T := T) (hpairsDisjoint := hpairsDisjoint)
                  (hblockersNe := hblockersNe)
                  (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                  (LP := LP) (hLP := hLP) (MP := MP)
                  (hingress := hingress)
                  C Q
                  (.equalCrossRowCenters hfirst hsecond hcenters
                    firstNonCanonical
                    (FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps
                      centers_ne' source₁_mem' source₂_mem' overlap_eq'
                      sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                      caps_ne'))
          | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
              overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
              fiberSource_mem_cap' =>
              by_cases hcapIndex' : capIndex' = S.oppIndex1
              · have sourceCenter_mem_first :
                    H.centerAt C.firstSource.1 C.firstSource.2 ∈
                      S.capInteriorByIndex capIndex' := by
                  simpa [hcenters] using sourceCenter_mem'
                exact closeCanonicalFirst sourceCenter_mem_first
                  fiberSource_mem_cap' hcapIndex'
              · have hsrc : sourceCap = capIndex' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : freshCap = capIndex' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact caps_ne (hsrc.trans hfr.symm)
      | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
          overlap_eq capIndex sourceCenter_mem freshCenter_mem fiberSource_mem_cap =>
          by_cases hcapIndex : capIndex = S.oppIndex1
          · exact closeCanonicalFirst sourceCenter_mem fiberSource_mem_cap hcapIndex
          · let firstNonCanonical :=
              FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                centers_ne source₁_mem source₂_mem overlap_eq capIndex
                sourceCenter_mem freshCenter_mem fiberSource_mem_cap hcapIndex
            cases secondInteraction with
            | sameBlocker center_eq _ =>
                exact hsecond.1 center_eq
            | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
                exact false_of_omission C.secondSource hsecond deleted deleted_eq
                  deleted_not_mem
            | distinctBlockersDifferentCaps centers_ne' source₁_mem' source₂_mem'
                overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
                caps_ne' =>
                have hsrc : capIndex = sourceCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
                      (by simpa [hcenters] using sourceCenter_mem') hne) rfl
                have hfr : capIndex = freshCap' := by
                  by_contra hne
                  exact
                    (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
                      freshCenter_mem' hne) rfl
                exact caps_ne' (hsrc.symm.trans hfr)
            | sameCapWithInternalFiberSource centers_ne' source₁_mem' source₂_mem'
                overlap_eq' capIndex' sourceCenter_mem' freshCenter_mem'
                fiberSource_mem_cap' =>
                by_cases hcapIndex' : capIndex' = S.oppIndex1
                · have sourceCenter_mem_first :
                      H.centerAt C.firstSource.1 C.firstSource.2 ∈
                        S.capInteriorByIndex capIndex' := by
                    simpa [hcenters] using sourceCenter_mem'
                  exact closeCanonicalFirst sourceCenter_mem_first
                    fiberSource_mem_cap' hcapIndex'
                · exact
                    false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
                      (P := P) (Pρ := Pρ)
                      (hρne := hρne) (hfrontierFour := hfrontierFour)
                      (hρfour := hρfour)
                      (hfrontierInteriorEq := hfrontierInteriorEq)
                      (hρInteriorEq := hρInteriorEq)
                      (T := T) (hpairsDisjoint := hpairsDisjoint)
                      (hblockersNe := hblockersNe)
                      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
                      (LP := LP) (hLP := hLP) (MP := MP)
                      (hingress := hingress)
                      C Q
                      (.equalCrossRowCenters hfirst hsecond hcenters
                        firstNonCanonical
                        (FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource
                          centers_ne' source₁_mem' source₂_mem' overlap_eq'
                          capIndex' sourceCenter_mem' freshCenter_mem'
                          fiberSource_mem_cap' hcapIndex'))


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
