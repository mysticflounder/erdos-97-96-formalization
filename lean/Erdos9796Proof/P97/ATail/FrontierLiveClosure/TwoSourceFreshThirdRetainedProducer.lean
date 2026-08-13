/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson

/-!
# Acyclic FreshThird retained-radii producer

This module exposes the source-level retained-radii packet needed by the
FreshThird residual.  It deliberately imports only the canonical FreshThird
fiber layer, so residual consumers can depend on it without an import cycle.
The packet is a producer, not a contradiction: its retained branch still
requires a downstream cap-wide consumer.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
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

attribute [local instance] Classical.propDecidable

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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP -- [shard-prologue-state]

omit T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two retained exact-four first-apex radii form a disjoint two-by-two
grid across the adjacent caps.  This is the source-level geometric input that
is absent from the incidence-only FreshThird packet. -/
theorem freshThird_retainedExactFourTwoRadiusAdjacentCapGrid :
    S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ := by
  have hfrontierInteriorCard :
      (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1).card = 2 := by
    simpa [P.sources_ne] using congrArg Finset.card hfrontierInteriorEq
  have hρInteriorCard :
      (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) ρ ∩
          S.capInteriorByIndex S.oppIndex1).card = 2 := by
    simpa [Pρ.sources_ne] using congrArg Finset.card hρInteriorEq
  exact
    S.exactFourTwoRadiusAdjacentCapGrid
      D.convex S.oppIndex1
      F.radius_pos Fρ.radius_pos
      (fun h => hρne h.symm)
      (by simpa using hfrontierFour)
      (by simpa using hρfour)
      hfrontierInteriorCard hρInteriorCard

omit T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The retained exact-four radii produce four concrete adjacent-cap hits
whose two same-radius chords satisfy the strict cross-distance inequality.
This is the source-level metric cut consumed by the FreshThird hard residual;
it is not by itself a contradiction. -/
theorem freshThird_exists_fourHits_strict_cross_distance :
    ∃ (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ)
      (H : ExactFourAdjacentGridKalmanson.FourHits G),
      dist H.radiusLeft H.radiusRight + dist H.rhoLeft H.rhoRight <
        dist H.radiusLeft H.rhoRight + dist H.rhoLeft H.radiusRight := by
  let G := freshThird_retainedExactFourTwoRadiusAdjacentCapGrid
    (P := P) (Pρ := Pρ)
    hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  rcases
      ExactFourAdjacentGridKalmanson.exists_fourHits_strict_cross_distance_oppIndex1
        D S G F.radius_pos Fρ.radius_pos
          (Ne.symm hρne) with
    ⟨H, hstrict⟩
  exact ⟨G, H, hstrict⟩

#print axioms freshThird_exists_fourHits_strict_cross_distance

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, every first-apex K4 radius is one of the two retained
collision radii.  This is the global form needed when a deletion produces an
otherwise unnamed four-point class at the first apex. -/
private theorem freshThird_acyclic_firstApex_K4Radius_eq_retained_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {r : ℝ} (hr : 0 < r)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 r).card) :
    r = radius ∨ r = ρ := by
  apply haligned r
  have hfour' :
      4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) r).card := by
    simpa using hfour
  simpa using
    S.selectedClass_capInteriorByIndex_card_ge_two
      D.convex S.oppIndex1 hr hfour'

omit P Pρ hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, every selected four-class at the first Moser apex is
exactly one of the two retained exact-four classes.  This is the row-equality
cut needed when a deletion packet supplies an otherwise unnamed exact row at
that apex. -/
theorem firstApex_selectedFourClass_support_eq_retained_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    (K : SelectedFourClass D.A S.oppApex1) :
    K.support = SelectedClass D.A S.oppApex1 radius ∨
      K.support = SelectedClass D.A S.oppApex1 ρ := by
  have hsupportSubset :
      K.support ⊆ SelectedClass D.A S.oppApex1 K.radius := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex1 K.radius).card := by
    calc
      4 = K.support.card := K.support_card.symm
      _ ≤ (SelectedClass D.A S.oppApex1 K.radius).card :=
        Finset.card_le_card hsupportSubset
  rcases
      freshThird_acyclic_firstApex_K4Radius_eq_retained_of_aligned
        haligned K.radius_pos hfour with hradius | hρ
  · left
    have hsub :
        K.support ⊆ SelectedClass D.A S.oppApex1 radius := by
      simpa [hradius] using hsupportSubset
    apply Finset.eq_of_subset_of_card_le hsub
    rw [hfrontierFour, K.support_card]
  · right
    have hsub :
        K.support ⊆ SelectedClass D.A S.oppApex1 ρ := by
      simpa [hρ] using hsupportSubset
    apply Finset.eq_of_subset_of_card_le hsub
    rw [hρfour, K.support_card]

#print axioms firstApex_selectedFourClass_support_eq_retained_of_aligned

omit hρne hfrontierFour hρfour
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under the aligned-radii hypothesis, a canonical cap source is the unique
strict first-cap point on its first-apex radius.  This theorem lives in the
acyclic producer layer so the FreshThird residual can consume the multiplicity
constraint directly. -/
theorem firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
        S.capInteriorByIndex S.oppIndex1 =
      {source.1} := by
  classical
  rcases hsource with
    ⟨_hcap, hsourceInterior, hsourceOutside,
      _hcenterNeFirstBlocker, _hcenterNeSecondBlocker,
      _hcenterNeFirstApex, _hcenterNeSecondApex,
      _hsourceMem, _hsourceCard, _hfirstView, _hsecondView⟩
  let C :=
    SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
      S.capInteriorByIndex S.oppIndex1
  have hsourceClass :
      source.1 ∈
        SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) :=
    mem_selectedClass.mpr ⟨source.2, rfl⟩
  have hsourceC : source.1 ∈ C :=
    Finset.mem_inter.mpr ⟨hsourceClass, hsourceInterior⟩
  have hCsub : C ⊆ {source.1} := by
    intro y hy
    simp only [Finset.mem_singleton]
    by_contra hyNe
    have htwo : 2 ≤ C.card := by
      have hone : 1 < C.card := by
        rw [Finset.one_lt_card]
        exact ⟨source.1, hsourceC, y, hy, Ne.symm hyNe⟩
      omega
    rcases haligned (dist S.oppApex1 source.1) htwo with
      hradius | hρ
    · have hsourcePair :
          source.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
        have := hsourceC
        change
          source.1 ∈
            SelectedClass D.A S.oppApex1
                (dist S.oppApex1 source.1) ∩
              S.capInteriorByIndex S.oppIndex1 at this
        rw [hradius, hfrontierInteriorEq] at this
        exact this
      exact hsourceOutside
        (Finset.mem_union_left _ hsourcePair)
    · have hsourcePair :
          source.1 ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
        have := hsourceC
        change
          source.1 ∈
            SelectedClass D.A S.oppApex1
                (dist S.oppApex1 source.1) ∩
              S.capInteriorByIndex S.oppIndex1 at this
        rw [hρ, hρInteriorEq] at this
        exact this
      exact hsourceOutside
        (Finset.mem_union_right _ hsourcePair)
  apply Finset.Subset.antisymm hCsub
  intro y hy
  simp only [Finset.mem_singleton] at hy
  subst y
  exact hsourceC

omit hρne hfrontierFour hρfour T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, a canonical first-fiber cap source is absent from every
first-apex radius whose strict first-cap slice contains at least two points. -/
theorem firstFiberCapSource_not_mem_firstApex_multiPointRadius_of_aligned
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {r : ℝ}
    (htwo :
      2 ≤
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1).card) :
    source.1 ∉ SelectedClass D.A S.oppApex1 r := by
  intro hsourceClass
  have hradius : dist S.oppApex1 source.1 = r :=
    (mem_selectedClass.mp hsourceClass).2
  rw [← hradius,
    firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
      (P := P) (Pρ := Pρ)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      source hsource haligned,
    Finset.card_singleton] at htwo
  omega

#print axioms firstFiberCapSource_not_mem_firstApex_multiPointRadius_of_aligned

omit hρne hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Once every first-cap radius carrying two strict-cap points is retained,
the rich first-apex packet cannot use its six-point arm, and its two K4 radii
are exactly the two retained collision radii, up to order. -/
theorem oppApex1_rich_exactRetainedRadii_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ r₁ r₂ : ℝ,
      0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₁).card ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₂).card ∧
      ((r₁ = radius ∧ r₂ = ρ) ∨ (r₁ = ρ ∧ r₂ = radius)) := by
  rcases T.oppApex1_rich with
      ⟨r, hr, hsix⟩ |
      ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂⟩
  · have hinter :
        (SelectedClass D.A S.oppApex1 r).card - 2 ≤
          (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
          D.convex S.oppIndex1 hr
    have hmulti :
        2 ≤
          (SelectedClass D.A S.oppApex1 r ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      omega
    rcases haligned r hmulti with hradius | hρ
    · subst r
      rw [hfrontierInteriorEq] at hinter
      simp [P.sources_ne] at hinter
      omega
    · subst r
      rw [hρInteriorEq] at hinter
      simp [Pρ.sources_ne] at hinter
      omega
  · have hinter₁ :
        2 ≤
          (SelectedClass D.A S.oppApex1 r₁ ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      have hfour₁' :
          4 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) r₁).card := by
        simpa using hfour₁
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_two
          D.convex S.oppIndex1 hr₁ hfour₁'
    have hinter₂ :
        2 ≤
          (SelectedClass D.A S.oppApex1 r₂ ∩
            S.capInteriorByIndex S.oppIndex1).card := by
      have hfour₂' :
          4 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) r₂).card := by
        simpa using hfour₂
      simpa using
        S.selectedClass_capInteriorByIndex_card_ge_two
          D.convex S.oppIndex1 hr₂ hfour₂'
    rcases haligned r₁ hinter₁ with hr₁radius | hr₁ρ
    · rcases haligned r₂ hinter₂ with hr₂radius | hr₂ρ
      · exact (hradiiNe (hr₁radius.trans hr₂radius.symm)).elim
      · exact
          ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂,
            Or.inl ⟨hr₁radius, hr₂ρ⟩⟩
    · rcases haligned r₂ hinter₂ with hr₂radius | hr₂ρ
      · exact
          ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂,
            Or.inr ⟨hr₁ρ, hr₂radius⟩⟩
      · exact (hradiiNe (hr₁ρ.trans hr₂ρ.symm)).elim

#print axioms oppApex1_rich_exactRetainedRadii_of_aligned

omit hρne hfrontierFour hρfour T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the retained-radii arm, the two canonical FreshThird sources have
distinct first-apex radii.  Otherwise their two strict first-cap points would
form a third multi-point radius, while neither source belongs to either
retained collision pair. -/
theorem freshThird_acyclic_canonical_sources_firstApex_radii_ne_of_aligned
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    dist S.oppApex1 C.firstSource.1 ≠
      dist S.oppApex1 C.secondSource.1 := by
  intro hradii
  have hsecondClass :
      C.secondSource.1 ∈
        SelectedClass D.A S.oppApex1
          (dist S.oppApex1 C.firstSource.1) := by
    exact mem_selectedClass.mpr ⟨C.secondSource.2, hradii.symm⟩
  have hsecondInter :
      C.secondSource.1 ∈
        SelectedClass D.A S.oppApex1
            (dist S.oppApex1 C.firstSource.1) ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr ⟨hsecondClass, C.secondSource_data.2.1⟩
  rw [firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
        (P := P) (Pρ := Pρ)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        C.firstSource C.firstSource_data haligned] at hsecondInter
  exact C.sources_ne (Finset.mem_singleton.mp hsecondInter).symm

omit hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Deleting one point from each retained exact-four class destroys every K4
at the first apex.  Alignment is essential here: it rules out an unnamed
radius appearing after the deletion. -/
private theorem freshThird_acyclic_crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {x y : ℝ²}
    (hx : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hy : y ∈ SelectedClass D.A S.oppApex1 ρ) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y) S.oppApex1 := by
  intro hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      hsurvives with
    ⟨r, hr, hfourErase⟩
  have hfourFull :
      4 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzErase), hzdist⟩
  rcases
      freshThird_acyclic_firstApex_K4Radius_eq_retained_of_aligned
        haligned hr hfourFull with
    hradius | hρ
  · rw [hradius, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hle :
        (((SelectedClass D.A S.oppApex1 radius).erase x).erase y).card ≤
          ((SelectedClass D.A S.oppApex1 radius).erase x).card :=
      Finset.card_le_card (Finset.erase_subset _ _)
    rw [Finset.card_erase_of_mem hx, hfrontierFour] at hle
    omega
  · rw [hρ, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hsub :
        ((SelectedClass D.A S.oppApex1 ρ).erase x).erase y ⊆
          (SelectedClass D.A S.oppApex1 ρ).erase y := by
      intro z hz
      simp only [Finset.mem_erase] at hz ⊢
      exact ⟨hz.1, hz.2.2⟩
    have hle := Finset.card_le_card hsub
    rw [Finset.card_erase_of_mem hy, hρfour] at hle
    omega

omit hρne T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The cap-source row omits one endpoint from each retained collision pair.
Deleting those two omitted endpoints therefore preserves the source row, while
alignment makes the same deletion fatal at the first apex. -/
theorem freshThird_acyclic_exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ x y : ℝ²,
      x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
      y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      x ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      y ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 := by
  classical
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirstView, hsecondView⟩
  have hfirstOmitted :
      ∃ x : ℝ²,
        x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
        x ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hfirstView.omits with hx | hx
    · exact ⟨P.source₁, by simp, hx⟩
    · exact ⟨P.source₂, by simp, hx⟩
  have hsecondOmitted :
      ∃ y : ℝ²,
        y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
        y ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hsecondView.omits with hy | hy
    · exact ⟨Pρ.source₁, by simp, hy⟩
    · exact ⟨Pρ.source₂, by simp, hy⟩
  rcases hfirstOmitted with ⟨x, hxPair, hxOmitted⟩
  rcases hsecondOmitted with ⟨y, hyPair, hyOmitted⟩
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius := by
    have hxIntersection :
        x ∈
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hfrontierInteriorEq]
      exact hxPair
    exact (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ := by
    have hyIntersection :
        y ∈
          SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hρInteriorEq]
      exact hyPair
    exact (Finset.mem_inter.mp hyIntersection).1
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  have hclassEq :
      SelectedClass D.A (H.centerAt source.1 source.2) K.radius =
        K.support := by
    simpa [SelectedClass, K] using K.support_eq.symm
  have hsourceSurvives :
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) := by
    have hxOmittedK : x ∉ K.support := by
      simpa [K] using hxOmitted
    have hyOmittedK : y ∉ K.support := by
      simpa [K] using hyOmitted
    refine ⟨K.radius, K.radius_pos, ?_⟩
    change
      4 ≤
        (SelectedClass ((D.A.erase x).erase y)
          (H.centerAt source.1 source.2) K.radius).card
    rw [selectedClass_erase_eq, selectedClass_erase_eq, hclassEq]
    rw [Finset.erase_eq_of_notMem hxOmittedK,
      Finset.erase_eq_of_notMem hyOmittedK]
    exact K.support_card.ge
  exact
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted, hsourceSurvives,
      freshThird_acyclic_crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        haligned hxSelected hySelected⟩


omit hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One deletion from each retained first-apex row is a genuine two-source
minimal deletion core at the first apex.  The double deletion is blocking,
while tri-apex richness restores a K4 after either source is put back. -/
theorem freshThird_acyclic_firstApex_minimalDeletionCore_of_crossRetainedEndpoints
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hblocked :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1) :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1) := by
  classical
  have hxIntersection :
      x ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hfrontierInteriorEq]
    exact hxPair
  have hyIntersection :
      y ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hρInteriorEq]
    exact hyPair
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ :=
    (Finset.mem_inter.mp hyIntersection).1
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxSelected).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hySelected).1
  have hxDist : dist S.oppApex1 x = radius :=
    (mem_selectedClass.mp hxSelected).2
  have hyDist : dist S.oppApex1 y = ρ :=
    (mem_selectedClass.mp hySelected).2
  have hxy : x ≠ y := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 y := hyDist.symm
      _ = dist S.oppApex1 x := by rw [h]
      _ = radius := hxDist
  apply ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxA
    · exact hyA
  · simpa using S.oppositeVertexByIndex_mem S.oppIndex1
  · intro s hs t ht hst
    simp only [Finset.mem_insert, Finset.mem_singleton] at hs ht
    rcases hs with rfl | rfl <;> rcases ht with rfl | rfl
    · exact (hst rfl).elim
    · simpa [hxDist, hyDist] using hρne.symm
    · simpa [hxDist, hyDist] using hρne
    · exact (hst rfl).elim
  · have hsdiff :
        D.A \ ({x, y} : Finset ℝ²) = (D.A.erase x).erase y := by
      ext w
      simp [and_assoc, and_left_comm, and_comm]
    simpa [hsdiff] using hblocked
  · intro s hs
    have hrobust :
        FullyDeletionRobustAt D S.oppApex1 :=
      fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
    rcases Finset.mem_insert.mp hs with rfl | hs
    · simpa [Finset.sdiff_singleton_eq_erase, hxy] using
        hrobust.survives y hyA
    · have hsEq : s = y := Finset.mem_singleton.mp hs
      subst s
      have herase :
          ({x, y} : Finset ℝ²).erase y = {x} := by
        ext w
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton]
        constructor
        · rintro ⟨hwy, hwx | hwy'⟩
          · exact hwx
          · exact (hwy hwy').elim
        · intro hwx
          subst w
          exact ⟨hxy, Or.inl rfl⟩
      rw [herase, Finset.sdiff_singleton_eq_erase]
      exact hrobust.survives x hxA

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Complete deletion-core data for a fixed pair of retained endpoints and
one aligned cap source.  The first-apex failure is retained explicitly:
`MinimalDeletionCore` remembers the restored exact rows, but deliberately does
not itself store the failure of the fully deleted carrier. -/
abbrev FreshThirdAlignedFixedDeletionCorePacket
    (source : CriticalShellSystem.CarrierVertex D.A) (x y : ℝ²) : Prop :=
  x ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    y ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y) (H.centerAt source.1 source.2) ∧
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y) S.oppApex1 ∧
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1)

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Any source-row omissions chosen from the two retained collision pairs
produce the complete fixed deletion-core packet.  Unlike the existential
selector, this form preserves a common omitted endpoint shared by two source
rows. -/
theorem freshThird_acyclic_fixedDeletionCorePacket_of_omitted
    (source : CriticalShellSystem.CarrierVertex D.A)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hxOmitted :
      x ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (hyOmitted :
      y ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source x y := by
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius := by
    have hxIntersection :
        x ∈
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hfrontierInteriorEq]
      exact hxPair
    exact (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ := by
    have hyIntersection :
        y ∈
          SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hρInteriorEq]
      exact hyPair
    exact (Finset.mem_inter.mp hyIntersection).1
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  have hclassEq :
      SelectedClass D.A (H.centerAt source.1 source.2) K.radius =
        K.support := by
    simpa [SelectedClass, K] using K.support_eq.symm
  have hsourceSurvives :
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) := by
    have hxOmittedK : x ∉ K.support := by
      simpa [K] using hxOmitted
    have hyOmittedK : y ∉ K.support := by
      simpa [K] using hyOmitted
    refine ⟨K.radius, K.radius_pos, ?_⟩
    change
      4 ≤
        (SelectedClass ((D.A.erase x).erase y)
          (H.centerAt source.1 source.2) K.radius).card
    rw [selectedClass_erase_eq, selectedClass_erase_eq, hclassEq]
    rw [Finset.erase_eq_of_notMem hxOmittedK,
      Finset.erase_eq_of_notMem hyOmittedK]
    exact K.support_card.ge
  have hblocked :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 :=
    freshThird_acyclic_crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
      (hfrontierFour := hfrontierFour) (hρfour := hρfour)
      haligned hxSelected hySelected
  exact
    ⟨hxOmitted, hyOmitted, hsourceSurvives, hblocked,
      freshThird_acyclic_firstApex_minimalDeletionCore_of_crossRetainedEndpoints
        (P := P) (Pρ := Pρ) (hρne := hρne)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq) (T := T)
        hxPair hyPair hblocked⟩

/-- Complete deletion-core data produced for one aligned cap source. -/
abbrev FreshThirdAlignedSourceDeletionCorePacket
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ x y : ℝ²,
    x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
    y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
    FreshThirdAlignedFixedDeletionCorePacket (S := S) (H := H) source x y

/-- The two aligned source rows share one omitted collision endpoint, and
each row retains a complete deletion core obtained by pairing that endpoint
with an omitted endpoint from the other collision pair. -/
abbrev FreshThirdAlignedCommonDeletionCorePairPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  ∃ z : ℝ²,
    z ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      ((z ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
          ∃ y y' : ℝ²,
            y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
            y' ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
            FreshThirdAlignedFixedDeletionCorePacket
              (S := S) (H := H) C.firstSource z y ∧
            FreshThirdAlignedFixedDeletionCorePacket
              (S := S) (H := H) C.secondSource z y') ∨
        (z ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
          ∃ x x' : ℝ²,
            x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
            x' ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
            FreshThirdAlignedFixedDeletionCorePacket
              (S := S) (H := H) C.firstSource x z ∧
            FreshThirdAlignedFixedDeletionCorePacket
              (S := S) (H := H) C.secondSource x' z))

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Preserve a common omitted endpoint through the aligned deletion-core
producer.  The other deleted endpoint may differ between the two source rows;
no favorable coincidence is assumed. -/
theorem freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    (hcommon :
      CommonCollisionEndpointOmission
        (H := H) P Pρ C.firstSource C.secondSource) :
    FreshThirdAlignedCommonDeletionCorePairPacket
      (S := S) (H := H) P Pρ C := by
  classical
  have firstPairOmission
      (source : CriticalShellSystem.CarrierVertex D.A)
      (hsource : FirstFiberCapSourceWitness P Pρ source) :
      ∃ x : ℝ²,
        x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
        x ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hsource with
      ⟨_, _, _, _, _, _, _, _, _, hfirstView, _⟩
    rcases hfirstView.omits with hx | hx
    · exact ⟨P.source₁, by simp, hx⟩
    · exact ⟨P.source₂, by simp, hx⟩
  have secondPairOmission
      (source : CriticalShellSystem.CarrierVertex D.A)
      (hsource : FirstFiberCapSourceWitness P Pρ source) :
      ∃ y : ℝ²,
        y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
        y ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hsource with
      ⟨_, _, _, _, _, _, _, _, _, _, hsecondView⟩
    rcases hsecondView.omits with hy | hy
    · exact ⟨Pρ.source₁, by simp, hy⟩
    · exact ⟨Pρ.source₂, by simp, hy⟩
  rcases hcommon with ⟨z, hzEndpoints, hzFirst, hzSecond⟩
  rcases Finset.mem_union.mp hzEndpoints with hzP | hzPρ
  · rcases secondPairOmission C.firstSource C.firstSource_data with
      ⟨y, hyPair, hyOmitted⟩
    rcases secondPairOmission C.secondSource C.secondSource_data with
      ⟨y', hyPair', hyOmitted'⟩
    exact ⟨z, Finset.mem_union.mpr (Or.inl hzP), Or.inl
      ⟨hzP, y, y', hyPair, hyPair',
        freshThird_acyclic_fixedDeletionCorePacket_of_omitted
          (P := P) (Pρ := Pρ) (hρne := hρne)
          (hfrontierFour := hfrontierFour) (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq) (T := T)
          C.firstSource haligned hzP hyPair hzFirst hyOmitted,
        freshThird_acyclic_fixedDeletionCorePacket_of_omitted
          (P := P) (Pρ := Pρ) (hρne := hρne)
          (hfrontierFour := hfrontierFour) (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq) (T := T)
          C.secondSource haligned hzP hyPair' hzSecond hyOmitted'⟩⟩
  · rcases firstPairOmission C.firstSource C.firstSource_data with
      ⟨x, hxPair, hxOmitted⟩
    rcases firstPairOmission C.secondSource C.secondSource_data with
      ⟨x', hxPair', hxOmitted'⟩
    exact ⟨z, Finset.mem_union.mpr (Or.inr hzPρ), Or.inr
      ⟨hzPρ, x, x', hxPair, hxPair',
        freshThird_acyclic_fixedDeletionCorePacket_of_omitted
          (P := P) (Pρ := Pρ) (hρne := hρne)
          (hfrontierFour := hfrontierFour) (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq) (T := T)
          C.firstSource haligned hxPair hzPρ hxOmitted hzFirst,
        freshThird_acyclic_fixedDeletionCorePacket_of_omitted
          (P := P) (Pρ := Pρ) (hρne := hρne)
          (hfrontierFour := hfrontierFour) (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq) (T := T)
          C.secondSource haligned hxPair' hzPρ hxOmitted' hzSecond⟩⟩

/-- The source-level finite ingress: every existential endpoint choice belongs
to one of four fixed, source-faithful deletion-core arms. -/
abbrev FreshThirdAlignedSourceDeletionCoreCases
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source P.source₁ Pρ.source₁ ∨
    FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source P.source₁ Pρ.source₂ ∨
    FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source P.source₂ Pρ.source₁ ∨
    FreshThirdAlignedFixedDeletionCorePacket
      (S := S) (H := H) source P.source₂ Pρ.source₂

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Canonicalize the two binary endpoint memberships into the four fixed
deletion-core arms used by finite search. -/
theorem freshThird_alignedSourceDeletionCorePacket_cases
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hpacket : FreshThirdAlignedSourceDeletionCorePacket
      (P := P) (Pρ := Pρ) source) :
    FreshThirdAlignedSourceDeletionCoreCases
      (S := S) (H := H) P Pρ source := by
  rcases hpacket with ⟨x, y, hx, hy, hfixed⟩
  rcases Finset.mem_insert.mp hx with rfl | hx
  · rcases Finset.mem_insert.mp hy with rfl | hy
    · exact Or.inl hfixed
    · have hy' : y = Pρ.source₂ := Finset.mem_singleton.mp hy
      subst y
      exact Or.inr (Or.inl hfixed)
  · have hx' : x = P.source₂ := Finset.mem_singleton.mp hx
    subst x
    rcases Finset.mem_insert.mp hy with rfl | hy
    · exact Or.inr (Or.inr (Or.inl hfixed))
    · have hy' : y = Pρ.source₂ := Finset.mem_singleton.mp hy
      subst y
      exact Or.inr (Or.inr (Or.inr hfixed))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The retained-radii data that must remain available at the normalized
FreshThird residual.  Both cap sources carry their own checked double-deletion
packet; keeping only the first source would erase a source-produced symmetry
needed by a faithful finite obstruction or universal consumer. -/
abbrev FreshThirdAlignedRetainedConsumerPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  dist S.oppApex1 C.firstSource.1 ≠
      dist S.oppApex1 C.secondSource.1 ∧
    SelectedClass D.A S.oppApex1
          (dist S.oppApex1 C.firstSource.1) ∩
        S.capInteriorByIndex S.oppIndex1 = {C.firstSource.1} ∧
    SelectedClass D.A S.oppApex1
          (dist S.oppApex1 C.secondSource.1) ∩
        S.capInteriorByIndex S.oppIndex1 = {C.secondSource.1} ∧
    FreshThirdAlignedSourceDeletionCorePacket
      (P := P) (Pρ := Pρ) C.firstSource ∧
    FreshThirdAlignedSourceDeletionCorePacket
      (P := P) (Pρ := Pρ) C.secondSource ∧
    FirstCapMultiPointRadiiRetained
      (S := S) (radius := radius) (ρ := ρ)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Swapping the two collision rows preserves the aligned retained packet,
with the two canonical sources and the two deleted endpoints exchanged. -/
theorem freshThird_alignedRetainedConsumerPacket_swap
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    FreshThirdAlignedRetainedConsumerPacket
      (P := Pρ) (Pρ := P)
      (twoCapSourceThirdCanonicalRowSurface_swap P Pρ C) := by
  rcases hretained with
    ⟨hradiiNe, hfirstSingleton, hsecondSingleton,
      hfirstPacket, hsecondPacket, haligned⟩
  have swapSourcePacket
      (source : CriticalShellSystem.CarrierVertex D.A)
      (hpacket : FreshThirdAlignedSourceDeletionCorePacket
        (P := P) (Pρ := Pρ) source) :
      FreshThirdAlignedSourceDeletionCorePacket
        (P := Pρ) (Pρ := P) source := by
    rcases hpacket with ⟨x, y, hx, hy, hfixed⟩
    rcases hfixed with
      ⟨hxOmitted, hyOmitted, hsourceSurvives, hblocked, hcore⟩
    refine ⟨y, x, hy, hx, hyOmitted, hxOmitted, ?_, ?_, ?_⟩
    · simpa only [Finset.erase_right_comm] using hsourceSurvives
    · simpa only [Finset.erase_right_comm] using hblocked
    · simpa only [Finset.pair_comm] using hcore
  refine ⟨hradiiNe.symm, hsecondSingleton, hfirstSingleton, ?_, ?_, ?_⟩
  · exact swapSourcePacket C.secondSource hsecondPacket
  · exact swapSourcePacket C.firstSource hfirstPacket
  · intro r hmulti
    rcases haligned r hmulti with hradius | hρ
    · exact Or.inr hradius
    · exact Or.inl hρ

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The aligned retained packet excludes both canonical sources from every
first-apex radius whose strict first-cap slice contains at least two points. -/
theorem freshThird_alignedRetainedConsumerPacket_sources_not_mem_firstApex_multiPointRadius
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C)
    {r : ℝ}
    (htwo :
      2 ≤
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1).card) :
    C.firstSource.1 ∉ SelectedClass D.A S.oppApex1 r ∧
      C.secondSource.1 ∉ SelectedClass D.A S.oppApex1 r := by
  constructor
  · intro hfirstClass
    have hradius : dist S.oppApex1 C.firstSource.1 = r :=
      (mem_selectedClass.mp hfirstClass).2
    rw [← hradius, hretained.2.1, Finset.card_singleton] at htwo
    omega
  · intro hsecondClass
    have hradius : dist S.oppApex1 C.secondSource.1 = r :=
      (mem_selectedClass.mp hsecondClass).2
    rw [← hradius, hretained.2.2.1, Finset.card_singleton] at htwo
    omega

#print axioms
  freshThird_alignedRetainedConsumerPacket_sources_not_mem_firstApex_multiPointRadius

omit hρne hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The aligned retained consumer packet exposes the two rich first-apex radii
as the retained pair, together with the absence of both canonical cap sources
from each rich class. -/
theorem freshThird_alignedRetainedConsumerPacket_oppApex1_rich_exactRetainedRadii
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    ∃ r₁ r₂ : ℝ,
      0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₁).card ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r₂).card ∧
      ((r₁ = radius ∧ r₂ = ρ) ∨ (r₁ = ρ ∧ r₂ = radius)) ∧
      (C.firstSource.1 ∉ SelectedClass D.A S.oppApex1 r₁ ∧
        C.secondSource.1 ∉ SelectedClass D.A S.oppApex1 r₁) ∧
      (C.firstSource.1 ∉ SelectedClass D.A S.oppApex1 r₂ ∧
        C.secondSource.1 ∉ SelectedClass D.A S.oppApex1 r₂) := by
  rcases
      oppApex1_rich_exactRetainedRadii_of_aligned
        (P := P) (Pρ := Pρ)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq) (T := T)
        hretained.2.2.2.2.2 with
    ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂, hradii⟩
  have hinter₁ :
      2 ≤
        (SelectedClass D.A S.oppApex1 r₁ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    have hfour₁' :
        4 ≤
          (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) r₁).card := by
      simpa using hfour₁
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex1 hr₁ hfour₁'
  have hinter₂ :
      2 ≤
        (SelectedClass D.A S.oppApex1 r₂ ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    have hfour₂' :
        4 ≤
          (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) r₂).card := by
      simpa using hfour₂
    simpa using
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex S.oppIndex1 hr₂ hfour₂'
  have hsources₁ :=
    freshThird_alignedRetainedConsumerPacket_sources_not_mem_firstApex_multiPointRadius
      P Pρ C hretained hinter₁
  have hsources₂ :=
    freshThird_alignedRetainedConsumerPacket_sources_not_mem_firstApex_multiPointRadius
      P Pρ C hretained hinter₂
  exact
    ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂, hradii,
      hsources₁, hsources₂⟩

#print axioms
  freshThird_alignedRetainedConsumerPacket_oppApex1_rich_exactRetainedRadii

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Both aligned cap sources admit an explicit four-arm endpoint
canonicalization.  This is the finite coverage theorem for the retained
branch; no bounded-cardinality assumption is introduced. -/
theorem freshThird_alignedRetainedConsumerPacket_sourceDeletionCoreCases
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    FreshThirdAlignedSourceDeletionCoreCases
        (S := S) (H := H) P Pρ C.firstSource ∧
      FreshThirdAlignedSourceDeletionCoreCases
        (S := S) (H := H) P Pρ C.secondSource := by
  exact
    ⟨freshThird_alignedSourceDeletionCorePacket_cases
        P Pρ C.firstSource hretained.2.2.2.1,
      freshThird_alignedSourceDeletionCorePacket_cases
        P Pρ C.secondSource hretained.2.2.2.2.1⟩

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Every aligned cap source carries the complete double-deletion packet. -/
theorem freshThird_acyclic_alignedSourceDeletionCorePacket
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    FreshThirdAlignedSourceDeletionCorePacket
      (P := P) (Pρ := Pρ) source := by
  rcases
      freshThird_acyclic_exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
        (P := P) (Pρ := Pρ)
        (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        source hsource haligned with
    ⟨x, y, hx, hy, hxo, hyo, hsurv, hblocked⟩
  exact
    ⟨x, y, hx, hy, hxo, hyo, hsurv, hblocked,
      freshThird_acyclic_firstApex_minimalDeletionCore_of_crossRetainedEndpoints
        (P := P) (Pρ := Pρ) (hρne := hρne)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq) (T := T) hx hy hblocked⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two canonical cap sources cannot be either outside point of a
`FreshOutsideFirstBlockerFiber`: the former lie in the first cap interior,
whereas both latter points lie outside the closed first cap.

This is an ingress invariant for finite encoders, not a contradiction. -/
theorem canonicalSources_ne_freshOutsideFirstBlockerFiber_outsidePoints
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (C.firstSource.1 ≠ Q.source.1 ∧
      C.secondSource.1 ≠ Q.source.1) ∧
    (C.firstSource.1 ≠ Q.otherOutsidePoint ∧
      C.secondSource.1 ≠ Q.otherOutsidePoint) := by
  constructor
  · constructor
    · exact ne_of_mem_of_not_mem
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          C.firstSource_data.2.1)
        Q.source_not_mem_firstCap
    · exact ne_of_mem_of_not_mem
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          C.secondSource_data.2.1)
        Q.source_not_mem_firstCap
  · constructor
    · exact ne_of_mem_of_not_mem
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          C.firstSource_data.2.1)
        Q.otherOutsidePoint_not_mem_firstCap
    · exact ne_of_mem_of_not_mem
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          C.secondSource_data.2.1)
        Q.otherOutsidePoint_not_mem_firstCap

#print axioms canonicalSources_ne_freshOutsideFirstBlockerFiber_outsidePoints

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both outside points of a `FreshOutsideFirstBlockerFiber` are distinct from
the two fixed endpoints of the closed first cap.

This is a source-clean finite-encoder cut, not a contradiction. -/
theorem freshOutsideFirstBlockerFiber_outsidePoints_ne_firstCapEndpoints
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (Q.source.1 ≠ S.oppApex2 ∧
      Q.source.1 ≠ S.surplusApex) ∧
    (Q.otherOutsidePoint ≠ S.oppApex2 ∧
      Q.otherOutsidePoint ≠ S.surplusApex) := by
  have hoppApex2 :
      S.oppApex2 ∈ S.capByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppApex2,
        SurplusCapPacket.rightOuterVertexByIndex,
        SurplusCapPacket.oppIndex1, hi] using
        S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
  have hsurplusApex :
      S.surplusApex ∈ S.capByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.surplusApex,
        SurplusCapPacket.leftOuterVertexByIndex,
        SurplusCapPacket.oppIndex1, hi] using
        S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex1
  exact
    ⟨⟨(ne_of_mem_of_not_mem hoppApex2 Q.source_not_mem_firstCap).symm,
        (ne_of_mem_of_not_mem hsurplusApex Q.source_not_mem_firstCap).symm⟩,
      ⟨(ne_of_mem_of_not_mem hoppApex2 Q.otherOutsidePoint_not_mem_firstCap).symm,
        (ne_of_mem_of_not_mem hsurplusApex
          Q.otherOutsidePoint_not_mem_firstCap).symm⟩⟩

#print axioms freshOutsideFirstBlockerFiber_outsidePoints_ne_firstCapEndpoints

/-- The complete acyclic retained/common-radius ingress contract. -/
abbrev FreshThirdAcyclicCanonicalConsumerPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C ∨
    Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)

/-- The acyclic producer's top-level retained/common-radius dichotomy. -/
theorem freshThird_acyclic_canonical_consumerPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C := by
  by_cases haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)
  · exact Or.inl
      (by
        refine ⟨
          freshThird_acyclic_canonical_sources_firstApex_radii_ne_of_aligned
            (P := P) (Pρ := Pρ)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq) C haligned,
          firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
            (P := P) (Pρ := Pρ)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq)
            C.firstSource C.firstSource_data haligned,
          firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
            (P := P) (Pρ := Pρ)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq)
            C.secondSource C.secondSource_data haligned,
          freshThird_acyclic_alignedSourceDeletionCorePacket
            (P := P) (Pρ := Pρ) (hρne := hρne)
            (hfrontierFour := hfrontierFour) (hρfour := hρfour)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq) (T := T)
            C.firstSource C.firstSource_data haligned,
          freshThird_acyclic_alignedSourceDeletionCorePacket
            (P := P) (Pρ := Pρ) (hρne := hρne)
            (hfrontierFour := hfrontierFour) (hρfour := hρfour)
            (hfrontierInteriorEq := hfrontierInteriorEq)
            (hρInteriorEq := hρInteriorEq) (T := T)
            C.secondSource C.secondSource_data haligned,
          haligned⟩)
  · exact Or.inr
      (exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained
        (P := P) (Pρ := Pρ) (T := T)
        C.cap_card_ge_eight haligned)

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
