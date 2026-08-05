/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision

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

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two distinct blockers of a mutually incident cap-source pair can
occupy the same indexed strict cap only when it is the source cap. -/
theorem exists_mutualBlockerCapIndices_same_only_first
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        (i = j → i = S.oppIndex1) := by
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source with ⟨i, hi⟩
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source' with ⟨j, hj⟩
  refine ⟨i, j, hi, hj, ?_⟩
  intro hij
  subst j
  by_contra hifirst
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hsourceOff :
      source.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource.2.1 (Ne.symm hifirst)
  have hsourceOff' :
      source'.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource'.2.1 (Ne.symm hifirst)
  have hcenterEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source'.1 hmutual.1).symm
  have hcenterEq' :
      dist (H.centerAt source'.1 source'.2) source.1 =
        dist (H.centerAt source'.1 source'.2) source'.1 :=
    ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source.1 hmutual.2).trans
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source'.1
      (H.selectedAt source'.1
        source'.2).toCriticalFourShell.q_mem_support).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S i
      (S.capInteriorByIndex_subset_capByIndex i hi)
      (S.capInteriorByIndex_subset_capByIndex i hj)
      hcentersNe source.2 source'.2 hsourcesNe
      hsourceOff hsourceOff' hcenterEq hcenterEq'

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem false_of_three_firstCap_hits_at_firstCap_blocker
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (z : ℝ²)
    (hsourcesNe : source.1 ≠ source'.1)
    (hzNeSource : z ≠ source.1)
    (hzNeSource' : z ≠ source'.1)
    (hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1)
    (hsourceCap' : source'.1 ∈ S.capByIndex S.oppIndex1)
    (hzCap : z ∈ S.capByIndex S.oppIndex1)
    (hsource'Mem :
      source'.1 ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hzMem :
      z ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hcenterCap :
      H.centerAt source.1 source.2 ∈
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  have htriple :
      ({source.1, source'.1, z} : Finset ℝ²) ⊆
        (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support,
          hsourceCap⟩
    · exact Finset.mem_inter.mpr ⟨hsource'Mem, hsourceCap'⟩
    · exact Finset.mem_inter.mpr ⟨hzMem, hzCap⟩
  have hthree :
      3 ≤
        ((H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card := by
    have hle := Finset.card_le_card htriple
    simpa [hsourcesNe, Ne.symm hzNeSource,
      Ne.symm hzNeSource'] using hle
  have htwo :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass
        hcenterCap
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, neither cap-source
blocker can lie in the source cap.  A blocker in that cap would see the two
mutually incident sources and one collision endpoint, contradicting the
two-hit bound for a selected row centered in its own indexed cap. -/
theorem false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hcomplementary :
      (P.source₁ ∈
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
              source'.2).toCriticalFourShell.support))
    (hcenterFirst :
      H.centerAt source.1 source.2 ∈
          S.capByIndex S.oppIndex1 ∨
        H.centerAt source'.1 source'.2 ∈
          S.capByIndex S.oppIndex1) :
    False := by
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, _, _, _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsourceCap :
      source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior
  have hsourceCap' :
      source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior'
  have hP₁Cap :
      P.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hP₂Cap :
      P.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  have hP₁NeSource : P.source₁ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₁NeSource' : P.source₁ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  have hP₂NeSource : P.source₂ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₂NeSource' : P.source₂ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  rcases hcenterFirst with hcenterFirst | hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₁ hsourcesNe
        hP₁NeSource hP₁NeSource' hsourceCap hsourceCap'
        hP₁Cap hmutual.1 hfirst.1 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₂ hsourcesNe
        hP₂NeSource hP₂NeSource' hsourceCap hsourceCap'
        hP₂Cap hmutual.1 hsecond.1 hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₂ hsourcesNe.symm
        hP₂NeSource' hP₂NeSource hsourceCap' hsourceCap
        hP₂Cap hmutual.2 hfirst.2 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₁ hsourcesNe.symm
        hP₁NeSource' hP₁NeSource hsourceCap' hsourceCap
        hP₁Cap hmutual.2 hsecond.2 hcenterFirst

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, the two blockers lie in
the two distinct cap interiors other than the source cap. -/
theorem exists_mutualBlockerCapIndices_distinct_otherCaps
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
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
              source'.2).toCriticalFourShell.support)) :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        i ≠ S.oppIndex1 ∧
        j ≠ S.oppIndex1 ∧
        i ≠ j := by
  rcases exists_mutualBlockerCapIndices_same_only_first
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' with
    ⟨i, j, hi, hj, hsameOnlyFirst⟩
  have hiNe : i ≠ S.oppIndex1 := by
    intro hiFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    left
    rw [hiFirst] at hi
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hi
  have hjNe : j ≠ S.oppIndex1 := by
    intro hjFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    right
    rw [hjFirst] at hj
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hj
  have hijNe : i ≠ j := by
    intro hij
    exact hiNe (hsameOnlyFirst hij)
  exact ⟨i, j, hi, hj, hiNe, hjNe, hijNe⟩

omit D S radius ρ H F R P Fρ Rρ Pρ hρne
  hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct carrier points outside an ordered cap cannot both bisect one
of its chords.  The CGN side dichotomy puts one bisector point back on the
open subchain, contradicting that it is outside the cap. -/
private theorem false_of_two_offCap_bisectors
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    (Hord : CGN.StrictCapOrder A L)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A) (hab : a ≠ b)
    (har : a ≠ L.points r) (has : a ≠ L.points s)
    (hbr : b ≠ L.points r) (hbs : b ≠ L.points s)
    (haeq : dist a (L.points r) = dist a (L.points s))
    (hbeq : dist b (L.points r) = dist b (L.points s))
    (haOff : a ∉ Finset.univ.image L.points)
    (hbOff : b ∉ Finset.univ.image L.points) :
    False := by
  classical
  rcases CGN.CGN6e3_exists_subchain_side_apex
      hconv hmem hrs haA hbA hab har has hbr hbs haeq hbeq with
    haPos | hbPos
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs haA).mp haPos
    exact haOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs hbA).mp hbPos
    exact hbOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct blocker centers outside the source cap cannot both bisect
the chord joining two distinct source-cap points. -/
private theorem false_of_twoCapSources_of_blockers_off_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceCap :
      source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceCap' :
      source'.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1)
    (hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap'
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Complementary choices from the first collision pair are impossible for
two mutually incident cap-source rows with distinct blockers.  The blockers
would be two distinct off-cap bisectors of the chord joining the sources. -/
theorem false_of_twoCapSources_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
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
              source'.2).toCriticalFourShell.support)) :
    False := by
  classical
  rcases exists_mutualBlockerCapIndices_distinct_otherCaps
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' hcomplementary with
    ⟨i, j, hi, hj, hiNe, hjNe, _hijNe⟩
  have haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hi hiNe
  have hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hj hjNe
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource.2.1
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource'.2.1
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

/-- Mutual cross-membership with distinct blocker values is the remaining
geometric arm of the two-cap-source split. -/
theorem false_of_twoCapSources_mutualCrossMembership_distinctBlockers
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    False := by
  apply hblockersNe'
  apply Subtype.ext
  exact blocker_centers_eq_of_secondRadius_mutual_cross_membership
    R source.2 source'.2 hsourcesNe hsourceRadius hsourceRadius'
    hmutual.1 hmutual.2

/-- Six pairwise distinct centers whose exact-four rows survive one common
deletion.  The first five centers are the two collision blockers and the
three robust Moser apices; the last center is the surviving cap-source
blocker. -/
abbrev SixCenterDeletionSurvivalPacket
    (deleted c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival
      D deleted c₀ c₁ c₂ c₃ c₄ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₅ ∧
    ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- A one-sided cap-source deletion synchronizes the surviving source row
with the two collision-blocker rows and the three robust apex rows.  The six
named centers are pairwise distinct, recorded by the cardinality of their
finite packet. -/
theorem sixCenterDeletionSurvivalPacket_of_oneSided
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    SixCenterDeletionSurvivalPacket (D := D) source'.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) ∨
      SixCenterDeletionSurvivalPacket (D := D) source.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) := by
  classical
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, hsourceNeP, hsourceNePρ,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', hsourceNeP', hsourceNePρ',
      _, _, _, _, _, _⟩
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hPρNeApex₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₃ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPNeApex₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₃ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H P.source₁ P.source₁_mem_A
  have hsourceNeApex₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source.1 source.2
  have hsourceNeApex₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source.1 source.2
  have hsourceNeApex₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source.1 source.2
  have hsourceNeApex₁' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₂' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₃' :
      H.centerAt source'.1 source'.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source'.1 source'.2
  have hApex₁NeApex₂ : S.oppApex1 ≠ S.oppApex2 := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have hApex₁NeApex₃ : S.oppApex1 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1.symm
  have hApex₂NeApex₃ : S.oppApex2 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2.symm
  have hsourceNotP :
      source.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source hsourceInterior hsourceOutside
  have hsourceNotPρ :
      source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source hsourceInterior
        (by simpa [Finset.union_comm] using hsourceOutside)
  have hsourceNotP' :
      source'.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source' hsourceInterior' hsourceOutside'
  have hsourceNotPρ' :
      source'.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source' hsourceInterior'
        (by simpa [Finset.union_comm] using hsourceOutside')
  have hcentersCard :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source.1 source.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP.symm, hsourceNePρ.symm,
      hsourceNeApex₁.symm, hsourceNeApex₂.symm,
      hsourceNeApex₃.symm]
  have hcentersCard' :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source'.1 source'.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP'.symm, hsourceNePρ'.symm,
      hsourceNeApex₁'.symm, hsourceNeApex₂'.symm,
      hsourceNeApex₃'.symm]
  rcases hsurvival with hsurvival | hsurvival
  · exact Or.inl
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ',
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP',
        hrobust₁.survives source'.1 source'.2,
        hrobust₂.survives source'.1 source'.2,
        hrobust₃.survives source'.1 source'.2⟩,
        hsurvival, hcentersCard⟩
  · exact Or.inr
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ,
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP,
        hrobust₁.survives source.1 source.2,
        hrobust₂.survives source.1 source.2,
        hrobust₃.survives source.1 source.2⟩,
        hsurvival, hcentersCard'⟩

/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation. -/
theorem false_of_twoCapSources_oneSidedDeletionSurvival
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    False := by
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      ⟨hsource.1, source, source', hsourcesNe, hsource, hsource'⟩
      ⟨Q⟩

/-- Compatibility coordinator for the former two-source first-fiber split.

Its detailed mutual-cross-membership/deletion analysis remains checked, but
all branches now ultimately depend on the common cap-source obstruction. -/
theorem false_of_twoCapSources_firstFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    False := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      source source' with hmutual | hsurvival
  · by_cases hblockersEq :
      H.blockerVertex source = H.blockerVertex source'
    · exact false_of_twoCapSources_freshThirdBlockerFiber_core
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        (by
          have hcenter :
              S.oppApex1 =
                S.oppositeVertexByIndex S.oppIndex1 := by
            rcases hi : S.surplusIdx with ⟨i, hi3⟩
            interval_cases i <;>
              simp [SurplusCapPacket.oppApex1,
                SurplusCapPacket.oppositeVertexByIndex,
                SurplusCapPacket.oppIndex1, hi]
          have hsourceIndexed :
              source.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius, hsource.2.1⟩
          have hsource'Indexed :
              source'.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius', hsource'.2.1⟩
          have hcentersEq :
              H.centerAt source.1 source.2 =
                H.centerAt source'.1 source'.2 := by
            simpa [CriticalShellSystem.blockerVertex] using
              congrArg Subtype.val hblockersEq
          have hgeometry :=
            equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
              source.2 source'.2 hsourceIndexed hsource'Indexed hsourcesNe
              hcentersEq
              (by simpa only [← hcenter] using T.oppApex1_rich)
              (isUniqueFourCenter_centerAt H source.1 source.2)
          have hallEndpointOmission :=
            allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
              (P := P) (Pρ := Pρ) source source' hsource hsource'
              hblockersEq hgeometry.2
          exact .sameBlockerAllEndpointOmission Q source source' hsourcesNe
            hsourceRadius hsourceRadius' hsource hsource' hmutual
            hblockersEq hallEndpointOmission hgeometry.1 hgeometry.2)
    · exact false_of_twoCapSources_mutualCrossMembership_distinctBlockers
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
        source source' hsourcesNe hsourceRadius hsourceRadius'
        hmutual hblockersEq
  · exact false_of_twoCapSources_oneSidedDeletionSurvival
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource' hsurvival

omit hρne hfrontierFour hρfour
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under the aligned-radii hypothesis, the named cap source retained by the
cap-eight producer is the unique strict first-cap point on its first-apex
radius.  Otherwise that radius would be one of the two retained collision
radii, contradicting the source's exclusion from both collision pairs. -/
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

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, every first-apex K4 radius is one of the two retained
collision radii.  This is the global form needed when a deletion produces an
otherwise unnamed four-point class at the first apex. -/
private theorem firstApex_K4Radius_eq_retained_of_aligned
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

omit hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Deleting one point from each retained exact-four class destroys every K4
at the first apex.  Alignment is essential here: it rules out an unnamed
radius appearing after the deletion. -/
private theorem crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
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
      firstApex_K4Radius_eq_retained_of_aligned
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
theorem exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
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
      crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        haligned hxSelected hySelected⟩

/-- Once every first-cap radius carrying two strict-cap points is retained,
the rich first-apex packet cannot use its six-point arm, and its two K4 radii
are exactly the two retained collision radii, up to order. -/
private theorem oppApex1_rich_exactRetainedRadii_of_aligned
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

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The second collision row has two points outside the first cap.  Since its
center cannot bisect the two named outside points of the first collision row,
at least one of its outside points is genuinely new. -/
private theorem exists_secondRowOutsidePoint_ne_firstOutsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    ∃ z : ℝ²,
      z ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support ∧
        z ∉ S.capByIndex S.oppIndex1 ∧
        z ≠ Q.source.1 ∧
        z ≠ Q.otherOutsidePoint := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have houtsideCard : K.card = 2 := by
    rcases
        exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_card
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_card
          P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
          P.sources_ne Pρ.sources_ne hpairsDisjoint with
      ⟨_, _, _, _, _, hcard⟩
    exact hcard
  by_cases hsub :
      K ⊆ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²)
  · have hK :
        K = ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
      apply Finset.eq_of_subset_of_card_le hsub
      rw [houtsideCard]
      exact Finset.card_le_two
    have hsourceMem :
        Q.source.1 ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.source.1 ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    have hotherMem :
        Q.otherOutsidePoint ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.otherOutsidePoint ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    exact
      (hsecondNe
        (((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.source.1 hsourceMem).trans
          ((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.otherOutsidePoint hotherMem).symm)).elim
  · rw [Finset.not_subset] at hsub
    rcases hsub with ⟨z, hzK, hzPair⟩
    have hz := Finset.mem_sdiff.mp hzK
    refine ⟨z, hz.1, hz.2, ?_, ?_⟩
    · intro h
      subst z
      exact hzPair (by simp)
    · intro h
      subst z
      exact hzPair (by simp)

omit hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One deletion from each retained first-apex row is a genuine two-source
minimal deletion core at the first apex.  The double deletion is blocking,
while tri-apex richness restores a K4 after either source is put back. -/
theorem firstApex_minimalDeletionCore_of_crossRetainedEndpoints
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


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
