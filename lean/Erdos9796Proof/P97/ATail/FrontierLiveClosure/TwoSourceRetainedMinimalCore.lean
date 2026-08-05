/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

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

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Retained radii produce a concrete first-apex minimal-deletion core.

This is the retained-branch ingress for the FreshThird producer.  It keeps
the two omitted endpoints, their source-row survival, and the first-apex
blocking core together; no finite-cardinality assumption or unresolved
terminal is used.  The remaining missing step is a cap-wide consumer for
this core, not another search for the packet itself. -/
theorem exists_freshThird_retained_minimalDeletionCoreProducer
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ x y : ℝ²,
      x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
      y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      x ∉
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
      y ∉
        (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y)
        (H.centerAt C.firstSource.1 C.firstSource.2) ∧
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A {x, y} S.oppApex1) := by
  rcases
      exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
        (P := P) (Pρ := Pρ)
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        C.firstSource C.firstSource_data haligned with
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted, hsurvives, hblocked⟩
  refine ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted, hsurvives, ?_⟩
  exact
    firstApex_minimalDeletionCore_of_crossRetainedEndpoints
      (P := P) (Pρ := Pρ) (hρne := hρne)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq) (T := T)
      hxPair hyPair hblocked

/- The retained branch of the producer is deliberately kept in the same
   contract as the reverse-selected-class branch below.  This is a packet,
   not a contradiction: the retained packet still needs a cap-wide consumer. -/
abbrev FreshThirdRetainedDeletionCorePacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
    y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
    x ∉
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
    y ∉
      (H.selectedAt C.firstSource.1 C.firstSource.2).toCriticalFourShell.support ∧
    HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y)
      (H.centerAt C.firstSource.1 C.firstSource.2) ∧
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1)

omit hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/- A single source-level producer for the two possible aligned-radii
   outcomes.  The parent can now consume this dichotomy directly; no fixed-n
   census or theorem-bank lookup is involved. -/
theorem freshThird_canonical_consumerPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    FreshThirdRetainedDeletionCorePacket (P := P) (Pρ := Pρ) C ∨
      Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) := by
  by_cases haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)
  · exact Or.inl
      (exists_freshThird_retained_minimalDeletionCoreProducer
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq) (T := T) C haligned)
  · exact Or.inr
      (exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained
        (P := P) (Pρ := Pρ) (T := T)
        C.cap_card_ge_eight haligned)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem false_of_twoCapSources_freshThirdBlockerFiber_on_surface
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  rcases hthird with ⟨Q⟩
  by_cases hfirstAlign :
      FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource
  · exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q C.firstSource hfirstAlign
  · by_cases hsecondAlign :
        FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource
    · exact
        false_of_freshThird_sameCapCrossRowAlignment
          (P := P) (Pρ := Pρ) Q C.secondSource hsecondAlign
    · obtain ⟨firstInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.firstSource) (hsource := C.firstSource_data)
          (Q := Q) (hnoAlignment := hfirstAlign)
      obtain ⟨secondInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.secondSource) (hsource := C.secondSource_data)
          (Q := Q) (hnoAlignment := hsecondAlign)
      exact false_of_twoCapSources_freshThirdBlockerFiber_core
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        (.normalized C Q firstInteraction secondInteraction)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem false_of_twoCapSources_freshThirdBlockerFiber_on_commonRadius_surface
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  rcases hthird with ⟨Q⟩
  by_cases hfirstAlign :
      FreshThirdSameCapCrossRowAlignment P Pρ Q C.surface.firstSource
  · exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q C.surface.firstSource hfirstAlign
  · by_cases hsecondAlign :
        FreshThirdSameCapCrossRowAlignment P Pρ Q C.surface.secondSource
    · exact
        false_of_freshThird_sameCapCrossRowAlignment
          (P := P) (Pρ := Pρ) Q C.surface.secondSource hsecondAlign
    · obtain ⟨firstInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.surface.firstSource)
          (hsource := C.surface.firstSource_data)
          (Q := Q) (hnoAlignment := hfirstAlign)
      obtain ⟨secondInteraction⟩ :=
        nonempty_freshThirdCapSourceInteraction_of_noAlignment
          (P := P) (Pρ := Pρ) (T := T)
          (source := C.surface.secondSource)
          (hsource := C.surface.secondSource_data)
          (Q := Q) (hnoAlignment := hsecondAlign)
      exact false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        C Q firstInteraction secondInteraction

/-- The two-source fresh-third coordinator uses the source-level producer to
select the retained or common-radius route.  The retained packet is currently
only a branch witness: the existing retained-surface consumer does not yet
accept its minimal-deletion fields. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  rcases freshThird_canonical_consumerPacket
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq) (T := T) C with
    _hretainedPacket | ⟨⟨Ccommon⟩⟩
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber_on_surface
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        C hthird
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber_on_commonRadius_surface
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        Ccommon hthird

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility adapter for the former single-source coordinator.  It
recovers the checked two-source cap-eight packet before entering the
load-bearing fresh-third theorem. -/
theorem false_of_capSource_freshThirdBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hthird : Nonempty (FreshThirdBlockerFiber P Pρ)) :
    False := by
  exact
    false_of_twoCapSources_freshThirdBlockerFiber
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      (C :=
        twoCapSourceThirdCanonicalRowSurface_of_capSource
          (P := P) (Pρ := Pρ)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          hcapSource)
      (hthird := hthird)

/-- Compatibility form of the former negative fresh-third leaf.  The
failed-alignment guard is now subsumed by the checked positive normal form
used by `false_of_capSource_freshThirdBlockerFiber`; retaining this declaration
keeps source-level callers on their previous interface. -/
theorem false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    (_hnoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment P Pρ Q source) :
    False := by
  exact
    false_of_capSource_freshThirdBlockerFiber
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      ⟨hsource.1, source, hsource.2⟩ ⟨Q⟩

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Fundamental cap-eight cap-source/blocker-multiplicity obstruction.

This is the common load-bearing packet behind the former fresh-third negative
leaf and the two-cap-source one-sided-deletion leaf.  Both callers already
produce the cap-source surface and one arm of the geometric blocker-fiber
residual, while the ambient tri-apex, collision, localized-deletion, and
mutual-omission data remain available here through the section interface. -/
theorem false_of_capSourceThirdCanonicalRowSurface
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  have C :=
    twoCapSourceThirdCanonicalRowSurface_of_capSource
      (P := P) (Pρ := Pρ) (T := T)
      (hpairsDisjoint := hpairsDisjoint) hcapSource
  rcases hresidual with hthird | hfirst | hsecond
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hthird
  · exact
      false_of_twoCapSources_freshOutsideFirstBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hfirst
  · exact
      false_of_twoCapSources_freshOutsideSecondBlockerFiber
        P Pρ hρne hfrontierFour hρfour
        hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe
        LPρ hLPρ MPρ LP hLP MP C hsecond

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A genuinely new off-cap point of the second collision row cannot have the
first collision blocker: equal actual blockers identify the two exact support
rows, whose first-row off-cap part is already the named pair in `Q`. -/
private theorem secondRowOutsidePoint_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {z : ℝ²}
    (hzSecondRow :
      z ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hzNeSource : z ≠ Q.source.1)
    (hzNeOther : z ≠ Q.otherOutsidePoint) :
    H.blockerVertex
        ⟨z,
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
              hzSecondRow⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  exact offCapPoint_blocker_ne_first_of_ne_outsidePair
    (P := P) (Pρ := Pρ) Q
    ((H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hzSecondRow)
    hzOutside hzNeSource hzNeOther

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the new off-cap point of the second collision row has the second
collision blocker, the exact two-point off-cap census upgrades it to the full
second enlarged-fiber packet. -/
private theorem freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint
    {z : ℝ²}
    (hzSecondRow :
      z ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hblockers :
      H.blockerVertex
          ⟨z,
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
                hzSecondRow⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) :
    Nonempty (FreshOutsideSecondBlockerFiber P Pρ) := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have hKcard : K.card = 2 := by
    simpa [K] using collisionShell_sdiff_firstCap_card_eq_two Pρ
  have hKone : 1 < K.card := by omega
  rcases Finset.one_lt_card.mp hKone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_sdiff.mp hu with ⟨huShell, huOutside⟩
  rcases Finset.mem_sdiff.mp hv with ⟨hvShell, hvOutside⟩
  obtain ⟨y, hyShell, hyOutside, hyz⟩ :
      ∃ y ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support,
        y ∉ S.capByIndex S.oppIndex1 ∧ y ≠ z := by
    by_cases huz : u = z
    · refine ⟨v, hvShell, hvOutside, ?_⟩
      intro hvz
      exact huv (huz.trans hvz.symm)
    · exact ⟨u, huShell, huOutside, huz⟩
  have hzA : z ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hzSecondRow
  have hyA : y ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hyShell
  have hzNeP₁ : z ≠ P.source₁ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior)
  have hzNeP₂ : z ≠ P.source₂ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior)
  have hzNePρ₁ : z ≠ Pρ.source₁ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₁_mem_capInterior)
  have hzNePρ₂ : z ≠ Pρ.source₂ := by
    intro hz
    subst z
    exact hzOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        Pρ.source₂_mem_capInterior)
  have hyNeP₁ : y ≠ P.source₁ := by
    intro hy
    subst y
    exact hyOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₁_mem_capInterior)
  have hyNeP₂ : y ≠ P.source₂ := by
    intro hy
    subst y
    exact hyOutside
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        P.source₂_mem_capInterior)
  have houtsideEq :
      (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 =
        {z, y} := by
    have hsubset :
        ({z, y} : Finset ℝ²) ⊆
          (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1 := by
      intro w hw
      simp only [Finset.mem_insert, Finset.mem_singleton] at hw
      rcases hw with rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨hzSecondRow, hzOutside⟩
      · exact Finset.mem_sdiff.mpr ⟨hyShell, hyOutside⟩
    exact
      (Finset.eq_of_subset_of_card_le hsubset (by
        rw [collisionShell_sdiff_firstCap_card_eq_two Pρ]
        simp [Ne.symm hyz])).symm
  exact ⟨{
    source := ⟨z, hzA⟩
    source_ne_first₁ := by
      intro h
      exact hzNeP₁ (congrArg Subtype.val h)
    source_ne_first₂ := by
      intro h
      exact hzNeP₂ (congrArg Subtype.val h)
    source_ne_second₁ := by
      intro h
      exact hzNePρ₁ (congrArg Subtype.val h)
    source_ne_second₂ := by
      intro h
      exact hzNePρ₂ (congrArg Subtype.val h)
    blockers_eq := hblockers
    source_mem_shell := hzSecondRow
    source_not_mem_firstCap := hzOutside
    otherOutsidePoint := y
    otherOutsidePoint_mem_A := hyA
    otherOutsidePoint_ne_source := hyz
    otherOutsidePoint_ne_first₁ := hyNeP₁
    otherOutsidePoint_ne_first₂ := hyNeP₂
    otherOutsidePoint_mem_shell := hyShell
    otherOutsidePoint_not_mem_firstCap := hyOutside
    outside_eq_pair := houtsideEq
  }⟩

/-- The carrier portion already exposed by the two collision rows and the
named cap-source row.  Each constituent is a critical four-shell, so this
seed has cardinality at most twelve. -/
private noncomputable def criticalTripleShellSeed
    (source : CriticalShellSystem.CarrierVertex D.A) : Finset ℝ² :=
  ((H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support ∪
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support) ∪
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Minimality turns the three known critical shells into a strict
continuation: some selected K4 row centered in their union contains a new
carrier point outside all three shells.

This is the all-center step absent from the purely local blocker split.  Its
strict measure is support growth beyond a seed of cardinality at most twelve,
using the live branch's carrier lower bound `14 ≤ |A|`. -/
theorem exists_selectedRow_escape_criticalTripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ criticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ criticalTripleShellSeed P Pρ source := by
  let K₁ :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell
  let K₂ :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  let K₃ :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell
  have hseedSub :
      criticalTripleShellSeed P Pρ source ⊆ D.A := by
    intro z hz
    simp only [criticalTripleShellSeed, Finset.mem_union] at hz
    rcases hz with (hz | hz) | hz
    · exact K₁.support_subset_A hz
    · exact K₂.support_subset_A hz
    · exact K₃.support_subset_A hz
  have hseedNonempty :
      (criticalTripleShellSeed P Pρ source).Nonempty := by
    refine ⟨source.1, ?_⟩
    exact Finset.mem_union_right _
      (K₃.q_mem_support)
  have hseedCard :
      (criticalTripleShellSeed P Pρ source).card ≤ 12 := by
    calc
      (criticalTripleShellSeed P Pρ source).card
          ≤ (K₁.support ∪ K₂.support).card + K₃.support.card := by
            exact
              Finset.card_union_le (K₁.support ∪ K₂.support) K₃.support
      _ ≤ (K₁.support.card + K₂.support.card) + K₃.support.card := by
            exact
              Nat.add_le_add_right
                (Finset.card_union_le K₁.support K₂.support)
                K₃.support.card
      _ = 12 := by
            rw [K₁.support_card, K₂.support_card, K₃.support_card]
  have hseedProper :
      criticalTripleShellSeed P Pρ source ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 12 := by
      simpa [hseedEq] using hseedCard
    have hAge : 14 ≤ D.A.card :=
      FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen hlarge
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 source.2 with ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The anonymous all-center escape can be made source-faithful unless its
center is fully deletion robust.

In the non-robust branch, the escaping point itself is a critical deletion
source.  Indeed, non-robustness makes the center a unique-four center; since
the escaping point lies in a selected four-row there, deleting that point
destroys the center's only K4 radius.  Thus the continuation retains both the
new point and the exact critical row that it deletes. -/
theorem exists_criticalRow_escape_or_fullyDeletionRobust_criticalTripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ criticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ criticalTripleShellSeed P Pρ source ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center) := by
  rcases
      exists_selectedRow_escape_criticalTripleShellSeed
        P Pρ hlarge source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, hcenter, K, z, hzK, hzOutside, ?_⟩
  by_cases hrobust : FullyDeletionRobustAt D center
  · exact Or.inl hrobust
  · right
    have hcenterA : center ∈ D.A := by
      simp only [criticalTripleShellSeed, Finset.mem_union] at hcenter
      rcases hcenter with (hcenter | hcenter) | hcenter
      · exact
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_subset_A hcenter
      · exact
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hcenter
      · exact
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support_subset_A hcenter
    have hunique : IsUniqueFourCenter D.A center :=
      isUniqueFourCenter_of_not_fullyDeletionRobust hcenterA hrobust
    have hzA : z ∈ D.A := K.support_subset_A hzK
    have hcenterNeZ : center ≠ z := by
      intro hcenterZ
      exact K.center_not_mem (hcenterZ ▸ hzK)
    have hblocked :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center := by
      intro hsurvives
      rcases hunique with
        ⟨_, radius₀, hradius₀, hcard₀, hradiusUnique⟩
      rcases hsurvives with ⟨radius₁, hradius₁, hcard₁⟩
      have hselectedErase :
          SelectedClass (D.A.erase z) center radius₁ =
            (SelectedClass D.A center radius₁).erase z :=
        selectedClass_erase_eq D.A z center radius₁
      have hcardErase :
          4 ≤ ((SelectedClass D.A center radius₁).erase z).card := by
        rw [← hselectedErase]
        simpa [SelectedClass] using hcard₁
      have hcardFull :
          4 ≤ (SelectedClass D.A center radius₁).card :=
        hcardErase.trans Finset.card_erase_le
      have hradius₁Eq :
          radius₁ = radius₀ :=
        hradiusUnique radius₁ hradius₁ hcardFull
      have hKcard :
          4 ≤ (SelectedClass D.A center K.radius).card := by
        calc
          4 = K.support.card := K.support_card.symm
          _ ≤ (SelectedClass D.A center K.radius).card := by
            apply Finset.card_le_card
            intro w hw
            exact mem_selectedClass.mpr
              ⟨K.support_subset_A hw, K.support_eq_radius w hw⟩
      have hKRadiusEq :
          K.radius = radius₀ :=
        hradiusUnique K.radius K.radius_pos hKcard
      have hzRadius₀ :
          z ∈ SelectedClass D.A center radius₀ := by
        apply mem_selectedClass.mpr
        refine ⟨hzA, ?_⟩
        rw [← hKRadiusEq]
        exact K.support_eq_radius z hzK
      rw [hradius₁Eq, Finset.card_erase_of_mem hzRadius₀, hcard₀] at hcardErase
      omega
    rcases
      ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
        D.K4 hcenterA hcenterNeZ hblocked with
      ⟨C⟩
    exact ⟨C, hblocked⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Source-faithful ingress for the finite `q`-projection.

At every named carrier point `q`, global K4 supplies an arbitrary selected
four-row centered at `q`.  Independently, the critical-shell system supplies
the exact unique-four cover row through `q`, together with its deletion
obstruction.  Tri-apex deletion robustness excludes each rich apex as that
cover row's center, and localizes the center to a strict indexed cap. -/
theorem exists_globalK4Row_and_sourceFaithfulCriticalCover
    (q : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty (SelectedFourClass D.A q.1) ∧
      Nonempty (CriticalSelectedFourClass D.A q.1
        (H.centerAt q.1 q.2)) ∧
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase q.1) (H.centerAt q.1 q.2) ∧
      H.centerAt q.1 q.2 ≠ S.oppApex1 ∧
      H.centerAt q.1 q.2 ≠ S.oppApex2 ∧
      H.centerAt q.1 q.2 ≠ S.surplusApex ∧
      ∃ i : Fin 3,
        H.centerAt q.1 q.2 ∈ S.capInteriorByIndex i := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 q.2 with ⟨Kq⟩
  have hcoverUnique :
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) :=
    isUniqueFourCenter_centerAt H q.1 q.2
  have hcoverNe₁ :
      H.centerAt q.1 q.2 ≠ S.oppApex1 := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.oppApex1_rich)
        (hcenter ▸ hcoverUnique)
  have hcoverNe₂ :
      H.centerAt q.1 q.2 ≠ S.oppApex2 := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.oppApex2_rich)
        (hcenter ▸ hcoverUnique)
  have hcoverNe₃ :
      H.centerAt q.1 q.2 ≠ S.surplusApex := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure
            T.surplusApex_rich)
        (hcenter ▸ hcoverUnique)
  exact
    ⟨⟨Kq⟩, ⟨H.selectedAt q.1 q.2⟩, hcoverUnique,
      H.no_qfree_at q.1 q.2, hcoverNe₁, hcoverNe₂, hcoverNe₃,
      exists_blockerCenter_mem_capInteriorByIndex (T := T) q⟩

omit Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq
  hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The escape row can be fed directly into the source-faithful critical
cover.  In particular, its escaping point has a canonical blocker localized
to one indexed cap.  The selected escape row and that canonical cover either
have the same center, or meet in at most two support points.  This is the
global incidence cut available without imposing the disproved same-side
placement of `C` and `J`. -/
theorem endpointFresh_escape_with_sourceFaithful_cover_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T' : FrontierAllLargeCapsTriApexRobustResidual N)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            ∃ hzA : z ∈ D.A,
              z ∈ K.support ∧
                z ∉ endpointFreshTwoShellSeed E Q ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                      K.support = C.toCriticalFourShell.support) ∧
                Nonempty (CriticalSelectedFourClass D.A z
                  (H.centerAt z hzA)) ∧
                ∃ i : Fin 3,
                  H.centerAt z hzA ∈ S.capInteriorByIndex i ∧
                ((center = H.centerAt z hzA ∧
                    K.support =
                      (H.selectedAt z hzA).toCriticalFourShell.support ∧
                    ∃ C : CriticalSelectedFourClass D.A z center,
                      ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                        K.support = C.toCriticalFourShell.support) ∨
                  (center ≠ H.centerAt z hzA ∧
                    (K.support ∩
                      (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      endpointFresh_exists_criticalRow_escape_or_fullyDeletionRobust_twoShellSeed
        R O C E Q with
    ⟨center, hcenter, K, z, hzK, hzOutside, hmode⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  rcases
      exists_globalK4Row_and_sourceFaithfulCriticalCover
        (B := B) (L := L) (N := N) (T := T')
        (D := D) (S := S) (H := H) ⟨z, hzA⟩ with
    ⟨_, hcover, _, _, _, _, _, ⟨i, hi⟩⟩
  have hcenterOrOverlap :
      (center = H.centerAt z hzA ∧
          K.support =
            (H.selectedAt z hzA).toCriticalFourShell.support ∧
          ∃ C : CriticalSelectedFourClass D.A z center,
            ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
              K.support = C.toCriticalFourShell.support) ∨
        (center ≠ H.centerAt z hzA ∧
          (K.support ∩
            (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2) := by
    by_cases heq : center = H.centerAt z hzA
    · left
      have hsupport :
          K.support =
            (H.selectedAt z hzA).toCriticalFourShell.support := by
        subst center
        exact H.selectedFourClass_support_eq_shell z hzA K
      have hcritical :
          ∃ C : CriticalSelectedFourClass D.A z center,
            ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
              K.support = C.toCriticalFourShell.support := by
        rcases hmode with hrobust | hcritical
        · exact False.elim
            (H.no_qfree_at z hzA (heq ▸ hrobust.survives z hzA))
        · exact hcritical
      exact ⟨heq, hsupport, hcritical⟩
    · right
      exact ⟨heq, SelectedFourClass.inter_card_le_two K
        (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass heq⟩
  exact
    ⟨center, hcenter, K, z, hzA, hzK, hzOutside, hmode, hcover, i, hi,
      hcenterOrOverlap⟩

/- Endpoint ingress with the source-level all-large context.  This is the
   form available to the live endpoint leaves; it avoids reconstructing the
   obsolete B/L/N/T' residual wrapper solely for cover localization. -/
theorem endpointFresh_escape_with_context_sourceFaithful_cover_twoShellSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : TriApexAllLargeContext D S)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E) :
    ∃ center : ℝ²,
      ∃ hcenter : center ∈ endpointFreshTwoShellSeed E Q,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            ∃ hzA : z ∈ D.A,
              z ∈ K.support ∧
                z ∉ endpointFreshTwoShellSeed E Q ∧
                (FullyDeletionRobustAt D center ∨
                  ∃ C : CriticalSelectedFourClass D.A z center,
                    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                      K.support = C.toCriticalFourShell.support) ∧
                Nonempty (CriticalSelectedFourClass D.A z
                  (H.centerAt z hzA)) ∧
                ∃ i : Fin 3,
                  H.centerAt z hzA ∈ S.capInteriorByIndex i ∧
                ((center = H.centerAt z hzA ∧
                    K.support =
                      (H.selectedAt z hzA).toCriticalFourShell.support ∧
                    ∃ C : CriticalSelectedFourClass D.A z center,
                      ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
                        K.support = C.toCriticalFourShell.support) ∨
                  (center ≠ H.centerAt z hzA ∧
                    (K.support ∩
                      (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2)) := by
  rcases
      endpointFresh_exists_criticalRow_escape_or_fullyDeletionRobust_twoShellSeed
        R O C E Q with
    ⟨center, hcenter, K, z, hzK, hzOutside, hmode⟩
  have hzA : z ∈ D.A := K.support_subset_A hzK
  rcases
      exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
        G ⟨z, hzA⟩ with
    ⟨_, hcover, _, _, _, _, _, ⟨i, hi⟩⟩
  have hcenterOrOverlap :
      (center = H.centerAt z hzA ∧
          K.support =
            (H.selectedAt z hzA).toCriticalFourShell.support ∧
          ∃ C : CriticalSelectedFourClass D.A z center,
            ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
              K.support = C.toCriticalFourShell.support) ∨
        (center ≠ H.centerAt z hzA ∧
          (K.support ∩
            (H.selectedAt z hzA).toCriticalFourShell.support).card ≤ 2) := by
    by_cases heq : center = H.centerAt z hzA
    · left
      have hsupport :
          K.support =
            (H.selectedAt z hzA).toCriticalFourShell.support := by
        subst center
        exact H.selectedFourClass_support_eq_shell z hzA K
      have hcritical :
          ∃ C : CriticalSelectedFourClass D.A z center,
            ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center ∧
              K.support = C.toCriticalFourShell.support := by
        rcases hmode with hrobust | hcritical
        · exact False.elim
            (H.no_qfree_at z hzA (heq ▸ hrobust.survives z hzA))
        · exact hcritical
      exact ⟨heq, hsupport, hcritical⟩
    · right
      exact ⟨heq, SelectedFourClass.inter_card_le_two K
        (H.selectedAt z hzA).toCriticalFourShell.toSelectedFourClass heq⟩
  exact
    ⟨center, hcenter, K, z, hzA, hzK, hzOutside, hmode, hcover, i, hi,
      hcenterOrOverlap⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The source-faithful critical cover at the enlarged first-fiber point is
not a new anonymous row: its center is the first collision row's actual
blocker, and its support is exactly the already exposed first shell.

This is the source equality hidden by a finite projection that gives the
`q`-cover center a fresh role.  It also transports indexed-cap localization
from the `q` cover to the named first blocker. -/
theorem firstFiber_sourceFaithfulCriticalCover_eq_firstShell
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    H.centerAt Q.source.1 Q.source.2 =
        H.centerAt P.source₁ P.source₁_mem_A ∧
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} ∧
      ∃ i : Fin 3,
        H.centerAt P.source₁ P.source₁_mem_A ∈
          S.capInteriorByIndex i := by
  have hcenter :
      H.centerAt Q.source.1 Q.source.2 =
        H.centerAt P.source₁ P.source₁_mem_A := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.blockers_eq
  have hsupport :
      (H.selectedAt Q.source.1
          Q.source.2).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H Q.source.2 P.source₁_mem_A hcenter
  rcases
      exists_blockerCenter_mem_capInteriorByIndex
        (T := T) Q.source with
    ⟨i, hi⟩
  exact
    ⟨hcenter, hsupport,
      hsupport.trans (firstFiber_shell_eq_explicitFour P Pρ Q),
      i, hcenter ▸ hi⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The global K4 row centered at an enlarged-fiber source meets the
source-faithful first-blocker shell in at most two points.

The two circle centers are distinct: the enlarged-fiber source lies on the
blocker shell, while that shell cannot contain its own center.  This is the
first genuinely global incidence constraint missing from the local
two-selected-row order model. -/
theorem firstFiber_globalRow_inter_firstShell_card_le_two
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    (Kq.support ∩
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 := by
  have hcentersNe :
      Q.source.1 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenters
    apply
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass.center_not_mem
    simpa [hcenters] using Q.source_mem_shell
  exact
    SelectedFourClass.inter_card_le_two Kq
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
      hcentersNe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- At least two points of the global K4 row centered at an enlarged-fiber
source lie outside the source-faithful first-blocker shell.

This is the positive form of
`firstFiber_globalRow_inter_firstShell_card_le_two`: the global row has
exactly four points, while distinct circle centers permit at most two common
points. -/
theorem firstFiber_globalRow_sdiff_firstShell_card_ge_two
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    2 ≤
      (Kq.support \
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card := by
  have hinter :
      (Kq.support ∩
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 :=
    firstFiber_globalRow_inter_firstShell_card_le_two
      P Pρ Q Kq
  have hdecomp :=
    Finset.card_sdiff_add_card_inter Kq.support
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
  rw [Kq.support_card] at hdecomp
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct named points of the global K4 row lie outside the
source-faithful first-blocker shell. -/
theorem exists_two_firstFiber_globalRow_points_outside_firstShell
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    ∃ u ∈
        Kq.support \
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support,
      ∃ v ∈
          Kq.support \
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support,
        u ≠ v := by
  apply Finset.one_lt_card.mp
  have htwo :=
    firstFiber_globalRow_sdiff_firstShell_card_ge_two
      P Pρ Q Kq
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem exists_second_outside_two_pairs
    {α : Type*} [DecidableEq α]
    (K : Finset α) (q a b c d : α)
    (hKcard : K.card = 4)
    (hqOutside : q ∉ ({a, b, c, d} : Finset α))
    (hfirst : ¬ (a ∈ K ∧ b ∈ K))
    (hsecond : ¬ (c ∈ K ∧ d ∈ K)) :
    ∃ v ∈ K, v ≠ q ∧ v ∉ ({a, b, c, d} : Finset α) := by
  let E : Finset α := ({a, b, c, d} : Finset α)
  have hfirstCard : (K ∩ ({a, b} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hfirst ⟨hx.1, hy.1⟩)
    · exact False.elim (hfirst ⟨hy.1, hx.1⟩)
    · rfl
  have hsecondCard : (K ∩ ({c, d} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hsecond ⟨hx.1, hy.1⟩)
    · exact False.elim (hsecond ⟨hy.1, hx.1⟩)
    · rfl
  have hinterEq :
      K ∩ E =
        (K ∩ ({a, b} : Finset α)) ∪
          (K ∩ ({c, d} : Finset α)) := by
    ext x
    simp only [E, Finset.mem_inter, Finset.mem_union,
      Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hinterCard : (K ∩ E).card ≤ 2 := by
    rw [hinterEq]
    calc
      ((K ∩ {a, b}) ∪ (K ∩ {c, d})).card
          ≤ (K ∩ {a, b}).card + (K ∩ {c, d}).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := Nat.add_le_add hfirstCard hsecondCard
      _ = 2 := rfl
  have hsplit := Finset.card_sdiff_add_card_inter K E
  have houtsideCard : 2 ≤ (K \ E).card := by
    rw [hKcard] at hsplit
    omega
  rcases Finset.exists_mem_ne (by omega : 1 < (K \ E).card) q with
    ⟨v, hv, hvq⟩
  exact ⟨v, (Finset.mem_sdiff.mp hv).1, hvq,
    by simpa [E] using (Finset.mem_sdiff.mp hv).2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem overrideAt_selectedSupport_eq_of_ne
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center z : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hz : z ∈ A) (hzq : z ≠ q) :
    ((H.overrideAt C hblocked).selectedAt z hz).toCriticalFourShell.support =
      (H.selectedAt z hz).toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_neg hzq]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem overrideAt_selectedSupport_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hq : q ∈ A) :
    ((H.overrideAt C hblocked).selectedAt q hq).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

private def rebaseCrossPairDeletionView
    {D : CounterexampleData} {H H' : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²)
    (view : CrossPairDeletionView (H := H) source x y)
    (hsupport :
      (H'.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    CrossPairDeletionView (H := H') source x y where
  survives :=
    (crossPairDeletionSurvival_iff_selectedSupportOmission
      (H := H') source x y).mpr (by
        have homits := view.omits
        simpa [CrossPairSelectedSupportOmission, hsupport] using homits)

private def rebaseRetainedInteriorBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (hcenter₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcenter₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A) :
    RetainedInteriorBlockerCollision R' where
  source₁ := P.source₁
  source₂ := P.source₂
  source₁_mem_A := P.source₁_mem_A
  source₂_mem_A := P.source₂_mem_A
  sources_ne := P.sources_ne
  source₁_mem_radius := P.source₁_mem_radius
  source₂_mem_radius := P.source₂_mem_radius
  source₁_mem_capInterior := P.source₁_mem_capInterior
  source₂_mem_capInterior := P.source₂_mem_capInterior
  blockers_eq := hcenter₁.trans (P.blockers_eq.trans hcenter₂.symm)

private def rebaseLocalizedCollisionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hcenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsupport :
      (H'.selectedAt P'.source₁
          P'.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionCommonDeletion P' where
  fresh := LP.fresh
  fresh_mem_capInterior := LP.fresh_mem_capInterior
  fresh_ne_source₁ := by simpa [hsource₁] using LP.fresh_ne_source₁
  fresh_ne_source₂ := by simpa [hsource₂] using LP.fresh_ne_source₂
  fresh_not_mem_shell := by simpa [hsupport] using LP.fresh_not_mem_shell
  packet := by
    simpa [hcenter] using rebaseCommonDeletionSystem LP.packet H'

private def rebaseLocalizedCollisionMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    (MP : LocalizedCollisionMutualOmissionCycle P LP)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (LP' : LocalizedCollisionCommonDeletion P')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hfresh : LP'.fresh = LP.fresh)
    (hcollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A)
    (hfreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A)
    (hcommonCenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support)
    (hfreshSupport :
      (H'.selectedAt LP'.fresh
          LP'.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionMutualOmissionCycle P' LP' where
  collisionSource := MP.collisionSource
  collisionSource_mem_A := MP.collisionSource_mem_A
  collisionSource_mem_capInterior := MP.collisionSource_mem_capInterior
  collisionSource_eq := by
    rcases MP.collisionSource_eq with h | h
    · exact Or.inl (h.trans hsource₁.symm)
    · exact Or.inr (h.trans hsource₂.symm)
  collisionSource_ne_fresh := by
    simpa [hfresh] using MP.collisionSource_ne_fresh
  collisionSource_blocker_eq_commonBlocker :=
    hcollisionCenter.trans
      (MP.collisionSource_blocker_eq_commonBlocker.trans hcommonCenter.symm)
  fresh_not_mem_collisionSource_shell := by
    simpa [hfresh, hcollisionSupport] using
      MP.fresh_not_mem_collisionSource_shell
  collisionSource_not_mem_fresh_shell := by
    simpa [hfresh, hfreshSupport] using
      MP.collisionSource_not_mem_fresh_shell
  blockers_ne := by
    simpa [hfresh, hcollisionCenter, hfreshCenter] using MP.blockers_ne
  freshPacket := by
    simpa [hfresh, hcollisionCenter] using
      rebaseCommonDeletionSystem MP.freshPacket H'
  collisionSourcePacket := by
    simpa [hfresh, hfreshCenter] using
      rebaseCommonDeletionSystem MP.collisionSourcePacket H'

/-- Compatibility-only reduction from a fresh canonical row outside the two
retained collision rows and the cap-source row.

A second point of the fresh row is installed by `CriticalShellSystem.overrideAt`.
All retained frontier, collision, omission, and cap-source packets are rebased
to the overridden system before invoking the cap-source terminal through the
legacy fresh-third interface.  The live coordinator no longer uses this
construction: the original cap-source surface already feeds the common global
obligation directly. -/
theorem false_of_freshCanonicalRowOverride
    (source q : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hqFirst :
      q.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)
    (hqSecond :
      q.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hqSource :
      q.1 ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    False := by
  let K :=
    (H.selectedAt q.1 q.2).toCriticalFourShell
  let center := H.centerAt q.1 q.2
  have hcenterNeFirst :
      center ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 P.source₁_mem_A hcenter
    apply hqFirst
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSecond :
      center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 Pρ.source₁_mem_A hcenter
    apply hqSecond
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSource :
      center ≠ H.centerAt source.1 source.2 := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H q.2 source.2 hcenter
    apply hqSource
    rw [← hsupportEq]
    exact K.q_mem_support
  let QP : RetainedRadiusCollision (R := R) :=
    retainedRadiusCollisionOfInteriorCollision P
  let QPρ : RetainedRadiusCollision (R := Rρ) :=
    retainedRadiusCollisionOfInteriorCollision Pρ
  have hnotFirst :
      ¬ (P.source₁ ∈ K.support ∧ P.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QP q.2 hcenterNeFirst h₁ h₂
  have hnotSecond :
      ¬ (Pρ.source₁ ∈ K.support ∧ Pρ.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QPρ q.2 hcenterNeSecond h₁ h₂
  have hqNeFirst₁ : q.1 ≠ P.source₁ := by
    intro h
    apply hqFirst
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeFirst₂ : q.1 ≠ P.source₂ := by
    intro h
    apply hqFirst
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hqNeSecond₁ : q.1 ≠ Pρ.source₁ := by
    intro h
    apply hqSecond
    rw [h]
    exact
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeSecond₂ : q.1 ≠ Pρ.source₂ := by
    intro h
    apply hqSecond
    rw [h]
    exact Pρ.source₂_mem_source₁_shell
  have hqOutside :
      q.1 ∉
        ({P.source₁, P.source₂, Pρ.source₁, Pρ.source₂} :
          Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hqNeFirst₁, hqNeFirst₂, hqNeSecond₁, hqNeSecond₂⟩
  rcases
      exists_second_outside_two_pairs K.support q.1
        P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
        K.support_card hqOutside hnotFirst hnotSecond with
    ⟨v, hvK, hvq, hvOutside⟩
  have hvA : v ∈ D.A := K.support_subset_A hvK
  have hvNeFirst₁ : v ≠ P.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeFirst₂ : v ≠ P.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₁ : v ≠ Pρ.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₂ : v ≠ Pρ.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  let Kv : CriticalFourShell D.A v center := {
    center_mem := Finset.mem_erase.mpr
      ⟨by
        intro h
        subst v
        exact K.center_not_mem_support hvK,
       (Finset.mem_erase.mp K.center_mem).2⟩
    radius := K.radius
    radius_pos := K.radius_pos
    support := K.support
    support_eq := K.support_eq
    support_card := K.support_card
    q_mem_support := hvK }
  rcases CriticalSelectedFourClass.exists_of_shell Kv with
    ⟨Cv, hCv⟩
  have hvUnique :
      v ∈ uniqueFourClass D.A center := by
    rw [uniqueFourClass_centerAt_eq_selectedAt_support H q.1 q.2]
    exact hvK
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase v) center :=
    not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
      (isUniqueFourCenter_centerAt H q.1 q.2) hvUnique
  let H' : CriticalShellSystem D.A := H.overrideAt Cv hblocked
  have hcenterPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        H'.centerAt z hz = H.centerAt z hz := by
    intro z hz hzv
    exact H.overrideAt_centerAt_of_ne Cv hblocked hz hzv
  have hsupportPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        (H'.selectedAt z hz).toCriticalFourShell.support =
          (H.selectedAt z hz).toCriticalFourShell.support := by
    intro z hz hzv
    exact overrideAt_selectedSupport_eq_of_ne H Cv hblocked hz hzv
  have hcenterQ : H'.centerAt q.1 q.2 = center :=
    hcenterPreserved q.1 q.2 hvq.symm
  have hcenterV : H'.centerAt v hvA = center :=
    H.overrideAt_centerAt Cv hblocked hvA
  have hsupportQ :
      (H'.selectedAt q.1 q.2).toCriticalFourShell.support =
        K.support :=
    hsupportPreserved q.1 q.2 hvq.symm
  have hsupportV :
      (H'.selectedAt v hvA).toCriticalFourShell.support =
        K.support := by
    rw [overrideAt_selectedSupport_eq H Cv hblocked hvA, hCv]
  have hcenterFirst₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A :=
    hcenterPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hcenterFirst₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A :=
    hcenterPreserved P.source₂ P.source₂_mem_A hvNeFirst₂.symm
  have hcenterSecond₁ :
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A =
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A :=
    hcenterPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  have hcenterSecond₂ :
      H'.centerAt Pρ.source₂ Pρ.source₂_mem_A =
        H.centerAt Pρ.source₂ Pρ.source₂_mem_A :=
    hcenterPreserved Pρ.source₂ Pρ.source₂_mem_A hvNeSecond₂.symm
  have hsupportFirst₁ :
      (H'.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hsupportSecond₁ :
      (H'.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  let F' : CriticalPairFrontier D S radius H' :=
    rebaseCriticalPairFrontierSystem F H'
  let R' : FrontierCommonDeletionParentResidual F' :=
    rebaseFrontierCommonDeletionParentResidual R H'
  let Fρ' : CriticalPairFrontier D S ρ H' :=
    rebaseCriticalPairFrontierSystem Fρ H'
  let Rρ' : FrontierCommonDeletionParentResidual Fρ' :=
    rebaseFrontierCommonDeletionParentResidual Rρ H'
  let P' : RetainedInteriorBlockerCollision R' :=
    rebaseRetainedInteriorBlockerCollision P
      hcenterFirst₁ hcenterFirst₂
  let Pρ' : RetainedInteriorBlockerCollision Rρ' :=
    rebaseRetainedInteriorBlockerCollision Pρ
      hcenterSecond₁ hcenterSecond₂
  let B' : FrontierBiApexRobustResidual R' :=
    rebaseFrontierBiApexRobustResidual B H'
  let L' : FrontierLargeOppositeCapsBiApexRobustResidual B' :=
    rebaseFrontierLargeOppositeCapsBiApexRobustResidual L H'
  let N' : FrontierAllLargeCapsBiApexRobustResidual L' :=
    ⟨N.surplusCap_card_ge_six⟩
  let T' : FrontierAllLargeCapsTriApexRobustResidual N' :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  let LPρ' : LocalizedCollisionCommonDeletion P' :=
    rebaseLocalizedCollisionCommonDeletion P LPρ P'
      rfl rfl hcenterFirst₁ hsupportFirst₁
  let LP' : LocalizedCollisionCommonDeletion Pρ' :=
    rebaseLocalizedCollisionCommonDeletion Pρ LP Pρ'
      rfl rfl hcenterSecond₁ hsupportSecond₁
  have hLPρFreshNeV : LPρ.fresh ≠ v := by
    intro h
    exact hvNeSecond₁ (h.symm.trans hLPρ)
  have hLPFreshNeV : LP.fresh ≠ v := by
    intro h
    exact hvNeFirst₁ (h.symm.trans hLP)
  have hMPρCollisionNeV : MPρ.collisionSource ≠ v := by
    intro h
    rcases MPρ.collisionSource_eq with hs | hs
    · exact hvNeFirst₁ (h.symm.trans hs)
    · exact hvNeFirst₂ (h.symm.trans hs)
  have hMPCollisionNeV : MP.collisionSource ≠ v := by
    intro h
    rcases MP.collisionSource_eq with hs | hs
    · exact hvNeSecond₁ (h.symm.trans hs)
    · exact hvNeSecond₂ (h.symm.trans hs)
  have hMPρCollisionCenter :
      H'.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A =
        H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A :=
    hcenterPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A :=
    hcenterPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshCenter :
      H'.centerAt LPρ.fresh LPρ.packet.q_mem_A =
        H.centerAt LPρ.fresh LPρ.packet.q_mem_A :=
    hcenterPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A :=
    hcenterPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  have hMPρCollisionSupport :
      (H'.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshSupport :
      (H'.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshSupport :
      (H'.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  let MPρ' : LocalizedCollisionMutualOmissionCycle P' LPρ' :=
    rebaseLocalizedCollisionMutualOmissionCycle P LPρ MPρ P' LPρ'
      rfl rfl rfl hMPρCollisionCenter hLPρFreshCenter
      hcenterFirst₁ hMPρCollisionSupport hLPρFreshSupport
  let MP' : LocalizedCollisionMutualOmissionCycle Pρ' LP' :=
    rebaseLocalizedCollisionMutualOmissionCycle Pρ LP MP Pρ' LP'
      rfl rfl rfl hMPCollisionCenter hLPFreshCenter
      hcenterSecond₁ hMPCollisionSupport hLPFreshSupport
  have hLPρ' : LPρ'.fresh = Pρ'.source₁ := by
    simpa [LPρ', Pρ', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLPρ
  have hLP' : LP'.fresh = P'.source₁ := by
    simpa [LP', P', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLP
  have hblockersNe' :
      H'.centerAt Pρ'.source₁ Pρ'.source₁_mem_A ≠
        H'.centerAt P'.source₁ P'.source₁_mem_A := by
    change
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H'.centerAt P.source₁ P.source₁_mem_A
    rw [hcenterSecond₁, hcenterFirst₁]
    exact hblockersNe
  let third : FreshThirdBlockerFiber P' Pρ' := {
    source₁ := q
    source₂ := ⟨v, hvA⟩
    sources_ne := by
      intro h
      exact hvq (congrArg Subtype.val h).symm
    blockers_eq := by
      apply Subtype.ext
      exact hcenterQ.trans hcenterV.symm
    blocker_ne_first := by
      intro h
      apply hcenterNeFirst
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt P.source₁ P.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterFirst₁)
    blocker_ne_second := by
      intro h
      apply hcenterNeSecond
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterSecond₁)
    source₁_ne_first₁ := by
      intro h
      exact hqNeFirst₁ (congrArg Subtype.val h)
    source₁_ne_first₂ := by
      intro h
      exact hqNeFirst₂ (congrArg Subtype.val h)
    source₁_ne_second₁ := by
      intro h
      exact hqNeSecond₁ (congrArg Subtype.val h)
    source₁_ne_second₂ := by
      intro h
      exact hqNeSecond₂ (congrArg Subtype.val h)
    source₂_ne_first₁ := by
      intro h
      exact hvNeFirst₁ (congrArg Subtype.val h)
    source₂_ne_first₂ := by
      intro h
      exact hvNeFirst₂ (congrArg Subtype.val h)
    source₂_ne_second₁ := by
      intro h
      exact hvNeSecond₁ (congrArg Subtype.val h)
    source₂_ne_second₂ := by
      intro h
      exact hvNeSecond₂ (congrArg Subtype.val h)
    source₁_mem_source₂_shell := by
      rw [hsupportV]
      exact K.q_mem_support
    source₂_mem_source₁_shell := by
      rw [hsupportQ]
      exact hvK }
  rcases hsource with
    ⟨hcapEight, hsourceInterior, hsourceOutside,
      hsourceCenterNeFirst, hsourceCenterNeSecond,
      hsourceCenterNeFirstApex, hsourceCenterNeSecondApex,
      hsourceMem, hsourceCard, hsourceFirstView, hsourceSecondView⟩
  have hsourceOutside' :
      source.1 ∉
        (({P'.source₁, P'.source₂} : Finset ℝ²) ∪
          {Pρ'.source₁, Pρ'.source₂}) := by
    change
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})
    exact hsourceOutside
  have hcapSource' : CapSourceThirdCanonicalRowSurface P' Pρ' := by
    by_cases hvSource : v = source.1
    · subst v
      have hcenterSource' :
          H'.centerAt source.1 source.2 = center := by
        exact hcenterV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            K.support := by
        exact hsupportV
      have hsourceMemK : source.1 ∈ K.support := by
        exact hvK
      have homitFirstK :
          P.source₁ ∉ K.support ∨ P.source₂ ∉ K.support := by
        by_cases hmem : P.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotFirst ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have homitSecondK :
          Pρ.source₁ ∉ K.support ∨ Pρ.source₂ ∉ K.support := by
        by_cases hmem : Pρ.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotSecond ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source P'.source₁ P'.source₂).mpr
        change
          P.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            P.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitFirstK
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source Pρ'.source₁ Pρ'.source₂).mpr
        change
          Pρ.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            Pρ.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitSecondK
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hcenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hcenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · exact
          R'.firstApexFullyDeletionRobust.centerAt_ne
            H' source.1 source.2
      · exact B'.secondApex_robust.centerAt_ne H' source.1 source.2
      · rw [hsupportSource']
        exact hsourceMemK
      · rw [hsupportSource']
        exact K.support_card
    · have hsourceNeV : source.1 ≠ v := by
        intro h
        exact hvSource h.symm
      have hcenterSource' :
          H'.centerAt source.1 source.2 =
            H.centerAt source.1 source.2 :=
        hcenterPreserved source.1 source.2 hsourceNeV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support :=
        hsupportPreserved source.1 source.2 hsourceNeV
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            P.source₁ P.source₂
        exact
          rebaseCrossPairDeletionView source P.source₁ P.source₂
            hsourceFirstView hsupportSource'
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            Pρ.source₁ Pρ.source₂
        exact
          rebaseCrossPairDeletionView source Pρ.source₁ Pρ.source₂
            hsourceSecondView hsupportSource'
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hsourceCenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hsourceCenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · intro h
        exact hsourceCenterNeFirstApex
          (hcenterSource'.symm.trans h)
      · intro h
        exact hsourceCenterNeSecondApex
          (hcenterSource'.symm.trans h)
      · rw [hsupportSource']
        exact hsourceMem
      · rw [hsupportSource']
        exact hsourceCard
  have hfrontierInteriorEq' :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P'.source₁, P'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂}
    exact hfrontierInteriorEq
  have hρInteriorEq' :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}
    exact hρInteriorEq
  have hpairsDisjoint' :
      Disjoint
        ({P'.source₁, P'.source₂} : Finset ℝ²)
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}
    exact hpairsDisjoint
  exact
    false_of_capSource_freshThirdBlockerFiber
      (P := P') (Pρ := Pρ')
      (hρne := hρne)
      (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq')
      (hρInteriorEq := hρInteriorEq')
      (T := T')
      (hpairsDisjoint := hpairsDisjoint')
      (hblockersNe := hblockersNe')
      (LPρ := LPρ') (hLPρ := hLPρ') (MPρ := MPρ')
      (LP := LP') (hLP := hLP') (MP := MP')
      hcapSource' ⟨third⟩


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
