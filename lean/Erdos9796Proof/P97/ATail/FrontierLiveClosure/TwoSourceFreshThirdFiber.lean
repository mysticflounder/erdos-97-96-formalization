/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

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

/-- Load-bearing first enlarged-fiber residual for the two-source packet.  It
includes the one-sided-deletion branch that must no longer recurse through the
global cap-source root. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  sorry

/-- Swap-compatible second enlarged-fiber residual for the two-source packet. -/
theorem false_of_twoCapSources_freshOutsideSecondBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hsecond : Nonempty (FreshOutsideSecondBlockerFiber P Pρ)) :
    False := by
  let Bswap : FrontierBiApexRobustResidual Rρ :=
    ⟨B.secondApex_robust⟩
  let Lswap : FrontierLargeOppositeCapsBiApexRobustResidual Bswap :=
    ⟨L.firstOppCap_card_ge_six, L.secondOppCap_card_ge_six⟩
  let Nswap : FrontierAllLargeCapsBiApexRobustResidual Lswap :=
    ⟨N.surplusCap_card_ge_six⟩
  let Tswap : FrontierAllLargeCapsTriApexRobustResidual Nswap :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  exact false_of_twoCapSources_freshOutsideFirstBlockerFiber
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (twoCapSourceThirdCanonicalRowSurface_swap P Pρ C)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

/-- Concrete positive incidence/localization packet for the cap-source row
and a fresh third blocker fiber.  It fixes the actual cap-source witness:
the two distinct blockers lie in one indexed cap while both fiber sources
lie outside that cap and on the cap-source row. -/
abbrev FreshThirdSameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ∈ S.capByIndex capIndex ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      Q.source₁.1 ∉ S.capByIndex capIndex ∧
      Q.source₂.1 ∉ S.capByIndex capIndex ∧
      Q.source₁.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source₂.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The positive same-cap cross-row alignment is impossible by ordered-cap
uniqueness: two distinct cap centers cannot bisect the same outside pair. -/
theorem false_of_freshThird_sameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  rcases halign with
    ⟨capIndex, hcommonCap, hsourceCap, hcentersNe,
      hsource₁Off, hsource₂Off, hsource₁Row, hsource₂Row⟩
  let Kcommon :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  let Ksource :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell.toSelectedFourClass
  have hoverlap :=
    selectedFourClass_outside_overlap_card_le_one
      S capIndex hcommonCap hsourceCap hcentersNe.symm Kcommon Ksource
  have hsource₁Common : Q.source₁.1 ∈ Kcommon.support := by
    exact
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Common : Q.source₂.1 ∈ Kcommon.support := by
    exact Q.source₂_mem_source₁_shell
  have hsource₁Overlap :
      Q.source₁.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₁Common, hsource₁Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₁Row, hsource₁Off⟩⟩
  have hsource₂Overlap :
      Q.source₂.1 ∈
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)) := by
    exact
      Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hsource₂Common, hsource₂Off⟩,
          Finset.mem_sdiff.mpr ⟨hsource₂Row, hsource₂Off⟩⟩
  have hsourcesPointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have htwo :
      1 <
        ((Kcommon.support \ S.capByIndex capIndex) ∩
          (Ksource.support \ S.capByIndex capIndex)).card :=
    Finset.one_lt_card.mpr
      ⟨Q.source₁.1, hsource₁Overlap,
        Q.source₂.1, hsource₂Overlap, hsourcesPointsNe⟩
  omega

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
  CapSourceThirdCanonicalRowWitness P Pρ source

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiberCapSourceWitness_of_crossPairSurvivals
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source) :
    FirstFiberCapSourceWitness P Pρ source := by
  rcases hsource with
    ⟨hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hfirstView, hsecondView⟩
  exact
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support,
      (H.selectedAt source.1
        source.2).toCriticalFourShell.support_card,
      ⟨hfirstView⟩, ⟨hsecondView⟩⟩

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
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Lift two strict first-cap points on one fresh first-apex radius while
retaining the common-radius membership needed by blocker rigidity. -/
theorem exists_two_firstFiberCapSourceWitness_of_commonRadius
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        FirstFiberCapSourceWitness P Pρ source ∧
        FirstFiberCapSourceWitness P Pρ source' := by
  obtain
      ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
        hsource, hsource'⟩ :=
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius
      P Pρ
      (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
      commonRadius hcommonCard hcommonNeRadius hcommonNeρ
  exact
    ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source hsource,
      firstFiberCapSourceWitness_of_crossPairSurvivals
        P Pρ hcap source' hsource'⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Assemble the common-radius producer's output into the public two-source
packet.  This is the concrete ingress contract for the noncanonical
same-cap consumer below: the computation supplies `commonRadius`, while this
adapter retains both source rows and their source-exact deletion views. -/
theorem exists_two_capSourceThirdCanonicalRowSurface_of_commonRadius
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ C : TwoCapSourceThirdCanonicalRowSurface P Pρ,
      C.firstSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        C.secondSource.1 ∈ SelectedClass D.A S.oppApex1 commonRadius := by
  rcases exists_two_firstFiberCapSourceWitness_of_commonRadius
      P Pρ T hcap commonRadius hcommonCard
      hcommonNeRadius hcommonNeρ with
    ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
      hsource, hsource'⟩
  refine ⟨
    { cap_card_ge_eight := hcap
      firstSource := source
      secondSource := source'
      sources_ne := hsourcesNe
      firstSource_data := hsource
      secondSource_data := hsource' },
    hsourceRadius, hsourceRadius'⟩

/-- In the aligned residual, every first-apex radius carrying at least two
strict first-cap points is one of the two retained collision radii. -/
abbrev FirstCapMultiPointRadiiRetained : Prop :=
  ∀ r : ℝ,
    2 ≤
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1).card →
      r = radius ∨ r = ρ

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The source-level producer extracted from failure of the aligned-radii
invariant.  This is the concrete reverse-selected-class ingress for the
FreshThird route: a radius with two strict-cap points yields the complete
two-source canonical-row packet, together with the common-radius facts that
the equal-center shell consumer requires. -/
theorem exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hnotRetained :
      ¬ FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ commonRadius : ℝ,
      2 ≤
          (SelectedClass D.A S.oppApex1 commonRadius ∩
            S.capInteriorByIndex S.oppIndex1).card ∧
      commonRadius ≠ radius ∧
      commonRadius ≠ ρ ∧
      ∃ C : TwoCapSourceThirdCanonicalRowSurface P Pρ,
        C.firstSource.1 ∈
            SelectedClass D.A S.oppApex1 commonRadius ∧
          C.secondSource.1 ∈
            SelectedClass D.A S.oppApex1 commonRadius := by
  change
    ¬ ∀ r : ℝ,
        2 ≤
            (SelectedClass D.A S.oppApex1 r ∩
              S.capInteriorByIndex S.oppIndex1).card →
          r = radius ∨ r = ρ at hnotRetained
  push_neg at hnotRetained
  rcases hnotRetained with
    ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ⟩
  rcases exists_two_capSourceThirdCanonicalRowSurface_of_commonRadius
      (P := P) (Pρ := Pρ) (T := T) hcap commonRadius hcommonCard
      hcommonNeRadius hcommonNeρ with
    ⟨C, hfirstRadius, hsecondRadius⟩
  exact ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ,
    C, hfirstRadius, hsecondRadius⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Structured form of the reverse-selected-class producer.  Downstream
normalization should use this form so the common radius cannot be silently
dropped when the source rows are repackaged. -/
theorem exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hnotRetained :
      ¬ FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) := by
  rcases exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained
      (P := P) (Pρ := Pρ) (T := T) hcap hnotRetained with
    ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ,
      surface, hfirstRadius, hsecondRadius⟩
  exact ⟨
    { commonRadius := commonRadius
      cap_card_ge_eight := surface.cap_card_ge_eight
      commonRadius_card := hcommonCard
      commonRadius_ne_radius := hcommonNeRadius
      commonRadius_ne_ρ := hcommonNeρ
      surface := surface
      firstSource_mem := hfirstRadius
      secondSource_mem := hsecondRadius }⟩

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
/-- One retained collision endpoint omitted by both cap-source rows. -/
abbrev CommonCollisionEndpointOmission
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ z : ℝ²,
    z ∈
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
      z ∉
          (H.selectedAt source'.1
            source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Both equal-blocker source rows omit every collision endpoint.  The exact
two-point cap intersection is stronger than the earlier existential common
omission because all four collision endpoints lie in the indexed cap while
both cap sources lie outside the two collision pairs. -/
abbrev AllCollisionEndpointsOmitted
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    : Prop :=
  ∀ z ∈
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}),
    z ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support ∧
      z ∉
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The exact common-blocker shell intersection upgrades the earlier
existential common omission to simultaneous omission of all four collision
endpoints by both equal-blocker rows. -/
theorem allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (blockers_eq : H.blockerVertex source = H.blockerVertex source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1}) :
    AllCollisionEndpointsOmitted P Pρ source source' := by
  classical
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val blockers_eq
  have hshellsEq :
      (H.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H source.1 source.2,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H source'.1 source'.2,
      hcentersEq]
  intro z hzEndpoints
  have hzCap : z ∈ S.capByIndex S.oppIndex1 := by
    have hzCases := hzEndpoints
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at hzCases
    rcases hzCases with (rfl | rfl) | (rfl | rfl)
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior
  have hzNeSource : z ≠ source.1 := by
    intro hz
    subst z
    exact source_witness.2.2.1 hzEndpoints
  have hzNeSource' : z ≠ source'.1 := by
    intro hz
    subst z
    exact source'_witness.2.2.1 hzEndpoints
  have hzNotFirst :
      z ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support := by
    intro hzSupport
    have hzPair : z ∈ ({source.1, source'.1} : Finset ℝ²) := by
      rw [← shell_inter_cap_eq]
      exact Finset.mem_inter.mpr ⟨hzSupport, hzCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    exact hzPair.elim hzNeSource hzNeSource'
  exact ⟨hzNotFirst, by simpa only [← hshellsEq] using hzNotFirst⟩

/-- The two cross-pair omission views have a finite exact alternative.  Either
one collision endpoint is absent from both selected supports, or the two
supports make complementary choices from each collision pair. -/
theorem commonCollisionEndpointOmission_or_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    CommonCollisionEndpointOmission P Pρ source source' ∨
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
/-- Equal actual blockers turn the complementary choices for both collision
pairs into all four endpoints on one support.  Together with the two distinct
mutually incident cap sources this would put six distinct points on a support
of cardinality four. -/
theorem false_of_equalBlockers_complementaryMembership
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersEq :
      H.blockerVertex source = H.blockerVertex source')
    (hcomplementary :
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
                source'.2).toCriticalFourShell.support)))) :
    False := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
  change
    (((P.source₁ ∈ K ∧ P.source₂ ∈ K') ∨
        (P.source₂ ∈ K ∧ P.source₁ ∈ K')) ∧
      ((Pρ.source₁ ∈ K ∧ Pρ.source₂ ∈ K') ∨
        (Pρ.source₂ ∈ K ∧ Pρ.source₁ ∈ K'))) at hcomplementary
  have hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val hblockersEq
  have hsupportsEq : K = K' := by
    exact
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 source'.2 hcentersEq
  rcases hsource with
    ⟨_, _, hsourceOutside, _, _, _, _, hsourceMem, hsupportCard, _, _⟩
  rcases hsource' with
    ⟨_, _, hsourceOutside', _, _, _, _, _, _, _, _⟩
  change source.1 ∈ K at hsourceMem
  change K.card = 4 at hsupportCard
  have hsource'Mem : source'.1 ∈ K := hmutual.1
  have hP₁Mem : P.source₁ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hP₂Mem : P.source₂ ∈ K := by
    rcases hcomplementary.1 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hPρ₁Mem : Pρ.source₁ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · exact hfirst.1
    · rw [hsupportsEq]
      exact hsecond.2
  have hPρ₂Mem : Pρ.source₂ ∈ K := by
    rcases hcomplementary.2 with hfirst | hsecond
    · rw [hsupportsEq]
      exact hfirst.2
    · exact hsecond.1
  have hsourceNeP₁ : source.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNeP₂ : source.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₁ : source.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsourceNePρ₂ : source.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside
    simp [h]
  have hsource'NeP₁ : source'.1 ≠ P.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NeP₂ : source'.1 ≠ P.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₁ : source'.1 ≠ Pρ.source₁ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hsource'NePρ₂ : source'.1 ≠ Pρ.source₂ := by
    intro h
    apply hsourceOutside'
    simp [h]
  have hP₁NotPairρ :
      P.source₁ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₂NotPairρ :
      P.source₂ ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) :=
    Finset.disjoint_left.mp hpairsDisjoint (by simp)
  have hP₁NePρ₁ : P.source₁ ≠ Pρ.source₁ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₁NePρ₂ : P.source₁ ≠ Pρ.source₂ := by
    intro h
    exact hP₁NotPairρ (by simp [h])
  have hP₂NePρ₁ : P.source₂ ≠ Pρ.source₁ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  have hP₂NePρ₂ : P.source₂ ≠ Pρ.source₂ := by
    intro h
    exact hP₂NotPairρ (by simp [h])
  let six : Finset ℝ² :=
    {source.1, source'.1,
      P.source₁, P.source₂, Pρ.source₁, Pρ.source₂}
  have hsixSubset : six ⊆ K := by
    intro x hx
    simp only [six, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl
    · exact hsourceMem
    · exact hsource'Mem
    · exact hP₁Mem
    · exact hP₂Mem
    · exact hPρ₁Mem
    · exact hPρ₂Mem
  have hsixCard : six.card = 6 := by
    simp [six, hsourcesNe,
      hsourceNeP₁, hsourceNeP₂, hsourceNePρ₁, hsourceNePρ₂,
      hsource'NeP₁, hsource'NeP₂, hsource'NePρ₁, hsource'NePρ₂,
      P.sources_ne, Pρ.sources_ne,
      hP₁NePρ₁, hP₁NePρ₂, hP₂NePρ₁, hP₂NePρ₂]
  have hcardLe : six.card ≤ K.card :=
    Finset.card_le_card hsixSubset
  rw [hsixCard, hsupportCard] at hcardLe
  omega

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
      H.centerAt source.1 source.2 ≠ S.oppApex2 := by
    intro h
    apply hblockerNe₂
    apply Subtype.ext
    simpa [apex₂] using h
  have hcenterNe₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex := by
    intro h
    apply hblockerNe₃
    apply Subtype.ext
    simpa [apex₃] using h
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      (H.blockerVertex source).2 with htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim (hcenterNe₃ (by simpa using hsurplus))
    · exact False.elim (hcenterNe₁ (by simpa using hfirst))
    · exact False.elim (hcenterNe₂ (by simpa using hsecond))
  · exact hcap

/-! The former negative fresh-third leaf hid four positive geometric cases
behind the single residual `¬ FreshThirdSameCapCrossRowAlignment`.  The
following packet records the checked alternatives explicitly: equal blocker
centers, a surviving one-point deletion, distinct blocker caps, or a same-cap
fiber source. -/
inductive FreshThirdCapSourceInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Type where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)

/-- A cap-source row supplies a genuinely new perpendicular-bisector center
for the fresh blocker pair. -/
abbrev FreshThirdCrossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
    Q.source₁.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    Q.source₂.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support

/-- Positive normal form for the complement of two distinct cross-row
centers. It exposes the three mathematical residual arms without splitting
the load-bearing obligation into constructor-product leaves. -/
abbrev FreshThirdCrossRowResidual
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ¬ FreshThirdCrossRowHit P Pρ firstSource Q ∨
    ¬ FreshThirdCrossRowHit P Pρ secondSource Q ∨
    H.centerAt firstSource.1 firstSource.2 =
      H.centerAt secondSource.1 secondSource.2

/-- Positive data hidden by the failure of one cap-source cross-row hit. -/
inductive FreshThirdCapSourceNonHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))

/-- A surviving source-row omission separates the source-row center from the
actual blocker center of the omitted fresh source.  This is the first
source-clean part of the FreshThird producer: it turns the deletion packet
into a center inequality without assuming a cap placement or a finite bound.
-/
theorem freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deletion_survives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
        (H.centerAt source.1 source.2)) :
    H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 := by
  rcases deleted_eq with rfl | rfl
  · have hne :=
      _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.source₁.2 deletion_survives
    intro h
    exact hne h.symm
  · have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hne :=
      _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H Q.source₂.2 deletion_survives
    intro h
    exact hne (hQCenters.symm.trans h.symm)

/-- Once the cap-wide producer has aligned the same fresh endpoint at two
source rows, the existing common-deletion packet constructor can consume the
survival facts directly.  This is intentionally an adapter with no new
geometric content: the missing producer is the theorem that supplies
`q_is_fresh`, both survivals, and center separation. -/
theorem nonempty_freshThird_fixedQ_commonDeletionPacket_of_alignedSurvivals
    (Q : FreshThirdBlockerFiber P Pρ)
    (q : ℝ²)
    (q_is_fresh : q = Q.source₁.1 ∨ q = Q.source₂.1)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (centers_ne :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2)
    (survives_source :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source.1 source.2))
    (survives_source' :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source'.1 source'.2)) :
    Nonempty
      (CommonDeletionTwoCenterPacket D H q
        (H.centerAt source.1 source.2)
        (H.centerAt source'.1 source'.2)) := by
  have hqA : q ∈ D.A := by
    rcases q_is_fresh with rfl | rfl
    · exact Q.source₁.2
    · exact Q.source₂.2
  have hcenter_sourceA :
      H.centerAt source.1 source.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have hcenter_source'A :
      H.centerAt source'.1 source'.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.center_mem).2
  exact
    ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hqA hcenter_sourceA hcenter_source'A centers_ne
        survives_source survives_source'

namespace FreshThirdCapSourceInteraction

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor normalization for a failed cross-row hit.  The two geometric
interaction constructors are themselves cross-row hits, so only equal blocker
or source-row omission can survive. -/
theorem nonHit_of_not_crossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction : FreshThirdCapSourceInteraction P Pρ source Q)
    (hnot : ¬ FreshThirdCrossRowHit P Pρ source Q) :
    FreshThirdCapSourceNonHit P Pρ source Q := by
  cases interaction with
  | sameBlocker center_eq support_eq =>
      exact .sameBlocker center_eq support_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      exact .sourceRowOmission deleted deleted_eq deleted_not_mem
        deletion_survives
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      _ _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim

end FreshThirdCapSourceInteraction

/-- Three positive normalized cases left after removing two distinct
cross-row centers.  This is deliberately a data packet, not three new proof
obligations. -/
inductive FreshThirdNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | firstNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
  | secondNonHit
      (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
  | equalCrossRowCenters
      (firstHit : FreshThirdCrossRowHit P Pρ C.firstSource Q)
      (secondHit : FreshThirdCrossRowHit P Pρ C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)

/-! The canonical-cap equal-center terminal consumes exactly one positive
interaction shape.  Keep the other positive shapes explicit so the
load-bearing residual leaf cannot silently widen back to the original
constructor product. -/
inductive FreshThirdNonCanonicalInteraction
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | distinctBlockersDifferentCaps
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (sourceCap freshCap : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex freshCap)
      (caps_ne : sourceCap ≠ freshCap)
  | sameCapWithInternalFiberSource
      (centers_ne :
        H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2)
      (source₁_mem :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (source₂_mem :
        Q.source₂.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (overlap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          {Q.source₁.1, Q.source₂.1})
      (capIndex : Fin 3)
      (sourceCenter_mem :
        H.centerAt source.1 source.2 ∈ S.capInteriorByIndex capIndex)
      (freshCenter_mem :
        H.centerAt Q.source₁.1 Q.source₁.2 ∈
          S.capInteriorByIndex capIndex)
      (fiberSource_mem_cap :
        Q.source₁.1 ∈ S.capByIndex capIndex ∨
          Q.source₂.1 ∈ S.capByIndex capIndex)
      (hcapIndex : capIndex ≠ S.oppIndex1)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Turn the explicit logical complement into constructor-specific positive
data while retaining both original interaction packets at the caller. -/
theorem freshThirdNormalizedResidualCase_of_crossRowResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual :
      FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q) :
    FreshThirdNormalizedResidualCase P Pρ C Q := by
  by_cases hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q
  · by_cases hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q
    · rcases hresidual with hfirst' | hsecond' | hcenters
      · exact (hfirst' hfirst).elim
      · exact (hsecond' hsecond).elim
      · exact .equalCrossRowCenters hfirst hsecond hcenters
    · exact .secondNonHit
        (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
          (P := P) (Pρ := Pρ) C.secondSource Q secondInteraction hsecond)
  · exact .firstNonHit
      (FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
        (P := P) (Pρ := Pρ) C.firstSource Q firstInteraction hfirst)

/-- The rigid positive packet in the equal-center residual: both cap-source
rows are the same exact four-point row, containing precisely the two cap
sources and the two fresh sources. -/
structure FreshThirdEqualCenterExactFourRow
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  centers_eq :
    H.centerAt C.firstSource.1 C.firstSource.2 =
      H.centerAt C.secondSource.1 C.secondSource.2
  capCenter_ne_freshCenter :
    H.centerAt C.firstSource.1 C.firstSource.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2
  first_support_eq :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}
  second_support_eq :
    (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Equal cap-source centers in the both-hit arm force the selected row to be
the named four-source row. -/
theorem freshThirdEqualCenterExactFourRow_of_hits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    FreshThirdEqualCenterExactFourRow P Pρ C Q := by
  have hQCenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 :=
    congrArg Subtype.val Q.blockers_eq
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hradii :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.radius =
          dist (H.centerAt C.firstSource.1 C.firstSource.2) Q.source₁.1 :=
        ((H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₁.1 hfirst.2.1).symm
      _ = dist (H.centerAt C.secondSource.1 C.secondSource.2)
          Q.source₁.1 := by rw [hcenters]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.radius :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq_radius
            Q.source₁.1 hsecond.2.1
  have hcenterDistances (z : ℝ²) :
      dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
        dist (H.centerAt C.secondSource.1 C.secondSource.2) z :=
    congrArg (fun center ↦ dist center z) hcenters
  have hsupports :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
          D.A.filter (fun z ↦
            dist (H.centerAt C.firstSource.1 C.firstSource.2) z =
              (H.selectedAt C.firstSource.1
                C.firstSource.2).toCriticalFourShell.radius) :=
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_eq
      _ = D.A.filter (fun z ↦
            dist (H.centerAt C.secondSource.1 C.secondSource.2) z =
              (H.selectedAt C.secondSource.1
                C.secondSource.2).toCriticalFourShell.radius) := by
        apply Finset.filter_congr
        intro z _
        rw [hcenterDistances z, hradii]
      _ = (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support :=
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support_eq.symm
  have hsecond_mem_first :
      C.secondSource.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.q_mem_support
  have hnamedSubset :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²) ⊆
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support
    · exact hsecond_mem_first
    · exact hfirst.2.1
    · exact hfirst.2.2
  have hnamedCard :
      ({C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :
          Finset ℝ²).card = 4 := by
    simp [C.sources_ne, hfirstQ₁, hfirstQ₂, hsecondQ₁, hsecondQ₂,
      Q.sources_ne]
  have hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} :=
    (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [(H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support_card, hnamedCard])).symm
  refine ⟨hcenters, hfirst.1, hfirstSupport, ?_⟩
  exact hsupports.symm.trans hfirstSupport

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The equal-center exact-row packet is impossible when a same-cap
interaction places the common cap-source center in the canonical opposite cap.
The two cap sources and one internal fresh source then give three points in a
selected four-class intersected with that cap, contradicting the ordered-cap
two-point bound. -/
theorem false_of_freshThirdEqualCenter_sameCapOppIndex
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support)
    (capIndex : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex capIndex)
    (fiberSource_mem_cap :
      Q.source₁.1 ∈ S.capByIndex capIndex ∨
        Q.source₂.1 ∈ S.capByIndex capIndex)
    (hcapIndex : capIndex = S.oppIndex1) :
    False := by
  subst capIndex
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  let K :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.toSelectedFourClass
  have hfirst_mem_K : C.firstSource.1 ∈ K.support := by
    exact
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
  have hsecond_mem_K : C.secondSource.1 ∈ K.support := by
    change C.secondSource.1 ∈
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support
    rw [hexact.first_support_eq]
    simp
  have hfirst_cap : C.firstSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.firstSource_data.2.1
  have hsecond_cap : C.secondSource.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 C.secondSource_data.2.1
  have hcenter_cap :
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 sourceCenter_mem
  have hfirstQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hfirst.1
    have hcarrier : C.firstSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hsecondQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro heq
    apply hsecond.1
    have hcarrier : C.secondSource = Q.source₁ := Subtype.ext heq
    simp [hcarrier]
  have hfirstQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hfirst.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.firstSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hsecondQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro heq
    apply hsecond.1
    have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hcarrier : C.secondSource = Q.source₂ := Subtype.ext heq
    simpa [hcarrier] using hQCenters.symm
  have hle :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex1 K hcenter_cap
  rcases fiberSource_mem_cap with hq₁ | hq₂
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₁_mem, hq₁⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₁, hsecondQ₁]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₁.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega
  · have hsubset :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²) ⊆
          K.support ∩ S.capByIndex S.oppIndex1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirst_mem_K, hfirst_cap⟩
      · exact Finset.mem_inter.mpr ⟨hsecond_mem_K, hsecond_cap⟩
      · exact Finset.mem_inter.mpr ⟨source₂_mem, hq₂⟩
    have hcard :
        ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card = 3 := by
      simp [C.sources_ne, hfirstQ₂, hsecondQ₂]
    have hge : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex1).card := by
      calc
        3 = ({C.firstSource.1, C.secondSource.1, Q.source₂.1} : Finset ℝ²).card :=
          hcard.symm
        _ ≤ (K.support ∩ S.capByIndex S.oppIndex1).card :=
          Finset.card_le_card hsubset
    omega

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, the existing finite endpoint split
eliminates complementary membership.  Thus a collision endpoint is omitted
by the common cap-source row. -/
theorem commonCollisionEndpointOmission_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    CommonCollisionEndpointOmission P Pρ C.firstSource C.secondSource := by
  rcases commonCollisionEndpointOmission_or_complementaryMembership
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      C.firstSource C.secondSource
      C.firstSource_data C.secondSource_data with hcommon | hcomplementary
  · exact hcommon
  · have hexact :=
      freshThirdEqualCenterExactFourRow_of_hits
        (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
    have hmutual :
        TwoCapSourcesMutualCrossMembership
          (H := H) C.firstSource C.secondSource := by
      constructor
      · rw [hexact.first_support_eq]
        simp
      · rw [hexact.second_support_eq]
        simp
    have hblockersEq :
        H.blockerVertex C.firstSource = H.blockerVertex C.secondSource := by
      apply Subtype.ext
      exact hcenters
    exact
      (false_of_equalBlockers_complementaryMembership
        (P := P) (Pρ := Pρ) hpairsDisjoint
        C.firstSource C.secondSource C.sources_ne
        C.firstSource_data C.secondSource_data hmutual hblockersEq
        hcomplementary).elim

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center exact-row arm, every endpoint of the two retained
collision pairs is omitted by both cap-source rows.  The exact four-point
support packet supplies the common row names; freshness of the third blocker
supplies their disjointness from the collision endpoints. -/
theorem allCollisionEndpointsOmitted_of_equalCenterHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource := by
  classical
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hQ₁Outside :
      Q.source₁.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₁_ne_first₁ (Subtype.ext h),
          fun h => Q.source₁_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₁_ne_second₁ (Subtype.ext h),
        fun h => Q.source₁_ne_second₂ (Subtype.ext h)⟩
  have hQ₂Outside :
      Q.source₂.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₂_ne_first₁ (Subtype.ext h),
          fun h => Q.source₂_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₂_ne_second₁ (Subtype.ext h),
        fun h => Q.source₂_ne_second₂ (Subtype.ext h)⟩
  intro z hz
  have hzNeFirst : z ≠ C.firstSource.1 := by
    intro h
    subst z
    exact C.firstSource_data.2.2.1 hz
  have hzNeSecond : z ≠ C.secondSource.1 := by
    intro h
    subst z
    exact C.secondSource_data.2.2.1 hz
  have hzNeQ₁ : z ≠ Q.source₁.1 := by
    intro h
    subst z
    exact hQ₁Outside hz
  have hzNeQ₂ : z ≠ Q.source₂.1 := by
    intro h
    subst z
    exact hQ₂Outside hz
  constructor
  · rw [hexact.first_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))
  · rw [hexact.second_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct cap-source cross-row centers, together with the fresh common
blocker, would give three carrier points on the perpendicular bisector of the
two fresh sources, contradicting the convex-carrier two-center bound. -/
theorem false_of_two_freshThirdCrossRowHits_distinctCenters
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstSource secondSource : CriticalShellSystem.CarrierVertex D.A)
    (hfirst : FreshThirdCrossRowHit P Pρ firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ secondSource Q)
    (hcentersNe :
      H.centerAt firstSource.1 firstSource.2 ≠
        H.centerAt secondSource.1 secondSource.2) :
    False := by
  let commonCenter := H.centerAt Q.source₁.1 Q.source₁.2
  let firstCenter := H.centerAt firstSource.1 firstSource.2
  let secondCenter := H.centerAt secondSource.1 secondSource.2
  have hcommonA : commonCenter ∈ D.A := by
    simpa [commonCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex Q.source₁).2
  have hfirstA : firstCenter ∈ D.A := by
    simpa [firstCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex firstSource).2
  have hsecondA : secondCenter ∈ D.A := by
    simpa [secondCenter, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex secondSource).2
  have hcommonEq :
      dist commonCenter Q.source₁.1 =
        dist commonCenter Q.source₂.1 := by
    exact
      (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 Q.source₂_mem_source₁_shell).symm
  have hfirstEq :
      dist firstCenter Q.source₁.1 =
        dist firstCenter Q.source₂.1 := by
    exact
      (H.selectedAt firstSource.1
          firstSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hfirst.2.1
      |>.trans
        ((H.selectedAt firstSource.1
            firstSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hfirst.2.2).symm
  have hsecondEq :
      dist secondCenter Q.source₁.1 =
        dist secondCenter Q.source₂.1 := by
    exact
      (H.selectedAt secondSource.1
          secondSource.2).toCriticalFourShell.support_eq_radius
        Q.source₁.1 hsecond.2.1
      |>.trans
        ((H.selectedAt secondSource.1
            secondSource.2).toCriticalFourShell.support_eq_radius
          Q.source₂.1 hsecond.2.2).symm
  have hsourcesNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hbound :=
    Dumitrescu.perpBisector_apex_bound D.convex
      Q.source₁.2 Q.source₂.2 hsourcesNe
  have hcommonFilter :
      commonCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hcommonA, hcommonEq⟩
  have hfirstFilter :
      firstCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hfirstA, hfirstEq⟩
  have hsecondFilter :
      secondCenter ∈ D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1) :=
    Finset.mem_filter.mpr ⟨hsecondA, hsecondEq⟩
  have hthree :
      2 < (D.A.filter
        (fun center ↦ dist center Q.source₁.1 =
          dist center Q.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨commonCenter, hcommonFilter,
      firstCenter, hfirstFilter, secondCenter, hsecondFilter,
      hfirst.1.symm, hsecond.1.symm, hcentersNe⟩
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/- Normalize a cap-source/fresh-fiber pair into the four positive
interaction cases. The only excluded case is the already checked impossible
same-cap alignment with both fiber sources outside the common cap. -/
theorem nonempty_freshThirdCapSourceInteraction_of_noAlignment
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    Nonempty (FreshThirdCapSourceInteraction P Pρ source Q) := by
  by_cases hcentersEq :
      H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2
  · have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H source.2 Q.source₁.2 hcentersEq
    exact ⟨.sameBlocker hcentersEq hsupports⟩
  · by_cases hsource₁ :
        Q.source₁.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support
    · by_cases hsource₂ :
          Q.source₂.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · let Ksource :=
          (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        let Kfresh :=
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
        have hq₁Fresh : Q.source₁.1 ∈ Kfresh.support := by
          exact
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.q_mem_support
        have hq₂Fresh : Q.source₂.1 ∈ Kfresh.support := by
          exact Q.source₂_mem_source₁_shell
        have hsourcePointsNe : Q.source₁.1 ≠ Q.source₂.1 := by
          intro h
          exact Q.sources_ne (Subtype.ext h)
        have hoverlapLe :
            (Ksource.support ∩ Kfresh.support).card ≤ 2 :=
          SelectedFourClass.inter_card_le_two Ksource Kfresh hcentersEq
        have hpairSubset :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) ⊆
              Ksource.support ∩ Kfresh.support := by
          intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hsource₁, hq₁Fresh⟩
          · exact Finset.mem_inter.mpr ⟨hsource₂, hq₂Fresh⟩
        have hpairCard :
            ({Q.source₁.1, Q.source₂.1} : Finset ℝ²).card = 2 := by
          simp [hsourcePointsNe]
        have hoverlapEq :
            Ksource.support ∩ Kfresh.support =
              {Q.source₁.1, Q.source₂.1} := by
          exact
            (Finset.eq_of_subset_of_card_le hpairSubset (by omega)).symm
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) source with ⟨sourceCap, hsourceCap⟩
        rcases exists_blockerCenter_mem_capInteriorByIndex
            (T := T) Q.source₁ with ⟨freshCap, hfreshCap⟩
        by_cases hcapsEq : sourceCap = freshCap
        · subst freshCap
          by_cases hq₁Cap : Q.source₁.1 ∈ S.capByIndex sourceCap
          · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
              hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
              (Or.inl hq₁Cap)⟩
          · by_cases hq₂Cap : Q.source₂.1 ∈ S.capByIndex sourceCap
            · exact ⟨.sameCapWithInternalFiberSource hcentersEq hsource₁
                hsource₂ hoverlapEq sourceCap hsourceCap hfreshCap
                (Or.inr hq₂Cap)⟩
            · exact False.elim <|
                hnoAlignment
                  ⟨sourceCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hfreshCap,
                    S.capInteriorByIndex_subset_capByIndex sourceCap hsourceCap,
                    hcentersEq, hq₁Cap, hq₂Cap, hsource₁, hsource₂⟩
        · exact ⟨.distinctBlockersDifferentCaps hcentersEq hsource₁
            hsource₂ hoverlapEq sourceCap freshCap hsourceCap hfreshCap
            hcapsEq⟩
      · exact ⟨.sourceRowOmission Q.source₂ (Or.inr rfl) hsource₂
          ((cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsource₂)⟩
    · exact ⟨.sourceRowOmission Q.source₁ (Or.inl rfl) hsource₁
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hsource₁)⟩

/-- The load-bearing fresh-third interface keeps the generic two-source
normal form separate from the stronger equal-blocker first-fiber producer.
The latter retains its common radius, complete cap-source witnesses, mutual
row incidence, actual-blocker equality, simultaneous four-endpoint omission, and the
checked two-point cap intersection of the common shell instead of erasing
them before the geometric core. -/
inductive FreshThirdTwoCapSourceObstruction : Type where
  | normalized
      (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
      (Q : FreshThirdBlockerFiber P Pρ)
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
      FreshThirdTwoCapSourceObstruction
  | sameBlockerAllEndpointOmission
      {commonRadius : ℝ}
      (Q : FreshOutsideFirstBlockerFiber P Pρ)
      (source source' : CriticalShellSystem.CarrierVertex D.A)
      (sources_ne : source.1 ≠ source'.1)
      (source_mem_radius :
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source'_mem_radius :
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
      (source_witness : FirstFiberCapSourceWitness P Pρ source)
      (source'_witness : FirstFiberCapSourceWitness P Pρ source')
      (cross_membership :
        TwoCapSourcesMutualCrossMembership (H := H) source source')
      (blockers_eq : H.blockerVertex source = H.blockerVertex source')
      (all_endpoint_omission :
        AllCollisionEndpointsOmitted P Pρ source source')
      (blocker_mem_capInterior :
        H.centerAt source.1 source.2 ∈
          S.capInteriorByIndex S.oppIndex1)
      (shell_inter_cap_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {source.1, source'.1}) :
      FreshThirdTwoCapSourceObstruction


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
