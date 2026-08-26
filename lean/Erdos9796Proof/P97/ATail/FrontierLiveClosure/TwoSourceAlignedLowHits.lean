/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceRetainedMinimalCore

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

/-- Compatibility form of the former aligned/nonbisector residual.

The universal critical-row escape supplies a canonical row outside the two
collision rows and the cap-source row.  Overriding a second point of that row
with the same selected four-class creates a fresh third blocker fiber while
preserving every retained collision packet and cap-source deletion view.
The contradiction is therefore delegated to
`false_of_capSource_freshThirdBlockerFiber`; the enlarged-fiber,
singleton-radius, alignment, and nonbisector arguments remain in the
signature only for downstream compatibility. -/
theorem false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsingleton :
      SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
          S.capInteriorByIndex S.oppIndex1 =
        {source.1})
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      (twoCapSourceThirdCanonicalRowSurface_of_capEight
        P Pρ
        (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
        hpairsDisjoint hsource.1)
      ⟨Q⟩

/-- Compatibility form of the former singleton-radius aligned residual.

Its named source supplies the common cap-source surface and its enlarged fiber
supplies the blocker-multiplicity residual.  The extra radius fields are
preserved only for callers. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsingleton :
      SelectedClass D.A S.oppApex1 (dist S.oppApex1 source.1) ∩
          S.capInteriorByIndex S.oppIndex1 =
        {source.1})
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ))
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  exact
    false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source hsource hsingleton haligned
      (secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
        P Pρ hblockersNe Q)

/-- Compatibility coordinator for the former aligned-radii split.

The radius provenance remains checked, but no longer defines a live
obligation independently of the common cap-source/blocker-multiplicity
packet. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ))
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    False := by
  rcases hcapSource with
    ⟨hcap, source, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  have hsource : FirstFiberCapSourceWitness P Pρ source :=
    ⟨hcap, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  have hsingleton :=
    firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned
      P Pρ hfrontierInteriorEq hρInteriorEq source hsource haligned
  exact
    false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      source hsource hsingleton hfirst haligned

/-- Compatibility coordinator for the former enlarged first-fiber route.

Its radius split and two-source extraction remain available, but the live
coordinator consumes `hcapSource` before this split. -/
theorem false_of_capSource_freshOutsideFirstBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  by_cases haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)
  · exact
      false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
        hcapSource ⟨Q⟩ haligned
  · change
      ¬ ∀ r : ℝ,
          2 ≤
              (SelectedClass D.A S.oppApex1 r ∩
                S.capInteriorByIndex S.oppIndex1).card →
            r = radius ∨ r = ρ at haligned
    push_neg at haligned
    rcases haligned with
      ⟨commonRadius, hcommonCard, hcommonNeRadius, hcommonNeρ⟩
    rcases exists_two_firstFiberCapSourceWitness_of_commonRadius
        P Pρ T hcapSource.1 commonRadius hcommonCard
        hcommonNeRadius hcommonNeρ with
      ⟨source, source', hsourcesNe, hsourceRadius, hsourceRadius',
        hsource, hsource'⟩
    exact false_of_twoCapSources_firstFiber
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
      hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource'

/-- Compatibility transport for the former enlarged second-fiber route. -/
theorem false_of_capSource_freshOutsideSecondBlockerFiber
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
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
  exact false_of_capSource_freshOutsideFirstBlockerFiber
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (capSourceThirdCanonicalRowSurface_swap P Pρ hcapSource)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

omit D S radius ρ H F R P Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two-collision global split is contradictory under the geometric
multiplicity residual.

The split offers a cap-source third canonical row surface or a cross-blocker
coincidence.  Under the geometric multiplicity residual the first arm is
closed by the cap-source surface eliminator and the second by the
cross-blocker coincidence leaf, so no arm survives.  This theorem isolates
that two-arm elimination from the positive producer above it: it is the sole
consumer of the cap-source surface eliminator and of the cross-blocker
coincidence leaf, which is the eliminator role a cluster factorization for
`P97-TS-CROSSBLOCKER` needs, and the collision-row coordinator below now
delegates its whole residual branch here. -/
theorem false_of_twoCollisionGlobalSplit
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
    (hsplit : TwoCollisionGlobalSplit P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ) :
    False := by
  rcases hsplit with hcapSource | hcoincidence
  · exact
      TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface
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
        hcapSource hresidual
  · exact
      TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence
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
        hcoincidence hresidual

omit D S radius ρ H F R P Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-exact collision rows force either the desired three-hit shell or
one concrete cross-row incidence.

This is the remaining positive planar/MEC terminal.  Compared with the
collision-row coordinator below, both first-apex radius classes have already
been normalized all the way to their named two-point strict-cap parts.  The
conclusion exposes the least cross-incidence alternative: any one of its four
arms is immediately eliminated by the checked cross-omission rectangle.

Coordinator-interface frontier: before this theorem, the coordinator has two
exact-four/exact-two collision rows and must still identify their strict-cap
parts.  After the checked finite and geometric normalizations, the named
cross-hit arm closes directly.  The other four semantic arms feed three
load-bearing declarations above: one four-constructor equality leaf, one
fresh-third-fiber leaf covering two swapped orientations, and one
first-fiber collision-five-center leaf. -/
theorem exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
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
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    (∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card) ∨
      (Pρ.source₁ ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∨
        Pρ.source₂ ∈
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∨
          P.source₁ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∨
            P.source₂ ∈
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  classical
  have hproducer :=
    collisionRows_sourceCleanMultiplicityIngress
      (P := P) (Pρ := Pρ) (B := B) (L := L) (N := N)
      T hpairsDisjoint hblockersNe hcapEightOrCross
  rcases hproducer with
    hcross | ⟨hresidual, hglobalCapSplit⟩
  · exact Or.inr hcross
  · exact False.elim
      (false_of_twoCollisionGlobalSplit
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
          hglobalCapSplit hresidual)


omit D S radius ρ H F R P Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The retained two-cycle and tri-apex normal form forces a three-hit
canonical shell at one of the three rich Moser apices.

This is the load-bearing global planar/MEC producer after the checked
exact-two normalization.  Its hypotheses expose two distinct exact-four
first-apex radii with exactly two strict-cap points each, four disjoint
strict-cap sources, distinct actual blocker centres, the complete
cross-omission rectangle, two oppositely oriented localized common-deletion
cycles, and the last finite incidence split.

A purely local common-outside-pair argument is unavailable: the checked
ordered-cap theorem `selectedFourClass_outside_overlap_card_le_one` only gives
an upper bound on that overlap, while none of the hypotheses supplies a
positive shared outside point.  Closure must therefore use the retained
global cap, minimality, and tri-apex data rather than assuming the missing
overlap. -/
theorem exists_three_hit_of_two_collisionRows_capCross_normalForm
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
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
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
    (hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card := by
  classical
  have hfrontierPairSubset :
      ({P.source₁, P.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂} :=
    (Finset.eq_of_subset_of_card_le hfrontierPairSubset (by
      simpa [P.sources_ne] using hfrontierInteriorTwo.le)).symm
  have hρPairSubset :
      ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂} :=
    (Finset.eq_of_subset_of_card_le hρPairSubset (by
      simpa [Pρ.sources_ne] using hρInteriorTwo.le)).symm
  rcases
      exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
          T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
            hcapEightOrCross with
    hthree | hcross
  · exact hthree
  · rcases hcross with hcross | hcross | hcross | hcross
    · exact False.elim (hcrossOmissions.1 hcross)
    · exact False.elim (hcrossOmissions.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.1 hcross)
    · exact False.elim (hcrossOmissions.2.2.2.1 hcross)

omit D S radius ρ H F R P Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Two source-exact equal-blocker rows on distinct first-apex radii force a
three-hit canonical shell at one of the three rich Moser apices.

This is the positive geometric producer isolated by the symmetric collision
reduction.  Its conclusion is deliberately independent of the ambient
`hlow` negation: it must manufacture the offending shell, apex, and radius.
The hypotheses retain both exact-four/exact-two radius classes, both concrete
collision packets, all-large-cap data, and tri-apex richness.  The canonical
unique-four cover is reconstructed from `H` where the checked proof uses it.

Narrowing measure: the producer starts only after two distinct first-apex
radii have each been normalized to an exact four-point class whose strict-cap
part is exactly its equal-blocker source pair.  It is the sole load-bearing
child of the symmetric collision coordinator and has no constructor fan-out. -/
theorem exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
        3 ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
  classical
  have hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
          uniqueFourClass D.A (H.centerAt x hx) =
            (H.selectedAt x hx).toCriticalFourShell.support := by
    intro x hx
    exact ⟨centerAt_ne_source H x hx,
      isUniqueFourCenter_centerAt H x hx,
      uniqueFourClass_centerAt_eq_selectedAt_support H x hx⟩
  have hPρ₁ :
      Pρ.source₁ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₁_mem_radius, Pρ.source₁_mem_capInterior⟩
  have hPρ₂ :
      Pρ.source₂ ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨Pρ.source₂_mem_radius, Pρ.source₂_mem_capInterior⟩
  have hP₁ :
      P.source₁ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩
  have hP₂ :
      P.source₂ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩
  have hρ₁ne₁ : Pρ.source₁ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₁ne₂ : Pρ.source₁ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₁ :=
        (mem_selectedClass.mp Pρ.source₁_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hρ₂ne₁ : Pρ.source₂ ≠ P.source₁ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₁ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₁_mem_radius).2
  have hρ₂ne₂ : Pρ.source₂ ≠ P.source₂ := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 Pρ.source₂ :=
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
      _ = dist S.oppApex1 P.source₂ := by rw [h]
      _ = radius := (mem_selectedClass.mp P.source₂_mem_radius).2
  have hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂} := by
    apply Finset.disjoint_left.mpr
    intro z hzP hzPρ
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzP hzPρ
    rcases hzP with rfl | rfl
    · rcases hzPρ with h | h
      · exact hρ₁ne₁ h.symm
      · exact hρ₂ne₁ h.symm
    · rcases hzPρ with h | h
      · exact hρ₁ne₂ h.symm
      · exact hρ₂ne₂ h.symm
  have hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A :=
    secondRadiusInterior_blocker_ne_collisionBlocker
      P hρne Pρ.source₁_mem_A hPρ₁
  have hPBlockerNe₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₁ :=
    (hcriticalShellUniqueFourCover P.source₁ P.source₁_mem_A).1
  have hPBlockerNe₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ P.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover P.source₂ P.source₂_mem_A).1
    exact P.blockers_eq.symm.trans h
  have hPρBlockerNe₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₁ :=
    (hcriticalShellUniqueFourCover Pρ.source₁ Pρ.source₁_mem_A).1
  have hPρBlockerNe₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ Pρ.source₂ := by
    intro h
    apply (hcriticalShellUniqueFourCover Pρ.source₂ Pρ.source₂_mem_A).1
    exact Pρ.blockers_eq.symm.trans h
  have hcrossOmissions :
      Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∧
          P.source₁ ∉
              (H.selectedAt Pρ.source₁
                Pρ.source₁_mem_A).toCriticalFourShell.support ∧
            P.source₂ ∉
                (H.selectedAt Pρ.source₁
                  Pρ.source₁_mem_A).toCriticalFourShell.support ∧
              ((H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 ∧
                ((H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support \
                  S.capByIndex S.oppIndex1).card = 2 :=
    exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
      P.sources_ne Pρ.sources_ne hpairsDisjoint
  rcases exists_secondRadiusInterior_localizedCycle P hρne hPρ₁ with
    ⟨LPρ, hLPρ, ⟨MPρ⟩⟩
  rcases exists_secondRadiusInterior_localizedCycle Pρ hρne.symm hP₁ with
    ⟨LP, hLP, ⟨MP⟩⟩
  have hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ := by
    rcases
        six_interior_or_cross_blocker_coincidence
          (S.capInteriorByIndex S.oppIndex1)
          P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
          (H.centerAt P.source₁ P.source₁_mem_A)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          P.sources_ne Pρ.sources_ne hpairsDisjoint hblockersNe.symm
          hPBlockerNe₁ hPBlockerNe₂ hPρBlockerNe₁ hPρBlockerNe₂
          P.source₁_mem_capInterior P.source₂_mem_capInterior
          Pρ.source₁_mem_capInterior Pρ.source₂_mem_capInterior
          P.blocker_mem_capInterior Pρ.blocker_mem_capInterior with
      hlargeInterior | hcross
    · left
      have hcapInterior :=
        ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
          S S.oppIndex1
      omega
    · exact Or.inr hcross
  exact
    exists_three_hit_of_two_collisionRows_capCross_normalForm
      P Pρ hρne hfrontierFour hρfour hfrontierInteriorTwo hρInteriorTwo
        T hpairsDisjoint hblockersNe hcrossOmissions
          LPρ hLPρ MPρ LP hLP MP hcapEightOrCross

omit D S radius ρ H F R P Fρ Rρ Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq B L N T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The symmetric two-radius collision normal form.

Both distinct first-apex radii have cardinality exactly four, exactly two
members of each radius lie in the strict first opposite cap, and the selected
pair on each radius has a common actual blocker.  Every weaker second-radius
outcome is already consumed by
`false_of_retainedInteriorDirectedOmission_and_all_low_hits`: distinct
blockers give a directed omission immediately, while a fifth class member or
a third strict-cap member gives one through the checked collision reductions.

Narrowing measure: before this split the second radius carried only a
four-point lower bound and two selected strict-cap points.  This leaf adds a
source-faithful common-deletion parent, an equal-blocker collision, exact class
cardinality four, and exact strict-cap cardinality two at that radius.  The
checked body delegates to the sole positive three-hit producer above and
contradicts the live low-hit bound. -/
theorem false_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions_and_all_low_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (Fρ : CriticalPairFrontier D S ρ H)
    (Rρ : FrontierCommonDeletionParentResidual Fρ)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorTwo :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (hρInteriorTwo :
      (SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1).card = 2)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hlow :
      ∀ i : Fin 3, ∀ x : ℝ², ∀ hx : x ∈ D.A, ∀ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) →
          ((H.selectedAt x hx).toCriticalFourShell.support ∩
            (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
              S.capInteriorByIndex i)).card ≤ 2 := by
    intro i x hx r hrich
    exact criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
      S i H x hx hrich r
  obtain ⟨i, x, hx, r, hrich, hthree⟩ :=
    exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
      F R P Fρ Rρ Pρ hρne hfrontierFour hρfour
        hfrontierInteriorTwo hρInteriorTwo B L N T
  exact (not_le_of_gt hthree) (hlow i x hx r hrich)


end

end TwoSourceExactCollisionRowsTerminal


end ATailFrontierLiveClosure
end Problem97
