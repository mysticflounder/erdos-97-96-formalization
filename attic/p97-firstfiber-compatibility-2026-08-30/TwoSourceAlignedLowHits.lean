/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

/- Source excerpt from base HEAD beb71db498ad47cca5c343a76a359423ff47f9e2.
   Historical span: live TwoSourceAlignedLowHits.lean:94-247. -/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceRetainedMinimalCore
import Erdos9796Proof.P97.ATail.SecondRadiusMutualCrossMembership

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
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 = {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 = {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²)
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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

/- The following five declarations are the archived compatibility island. -/
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
          S.capInteriorByIndex S.oppIndex1 = {source.1})
    (haligned : FirstCapMultiPointRadiiRetained
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
          S.capInteriorByIndex S.oppIndex1 = {source.1})
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ))
    (haligned : FirstCapMultiPointRadiiRetained
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
    (haligned : FirstCapMultiPointRadiiRetained
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
  by_cases haligned : FirstCapMultiPointRadiiRetained
      (S := S) (radius := radius) (ρ := ρ)
  · exact false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii
        P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
        T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
        hcapSource ⟨Q⟩ haligned
  · change ¬ ∀ r : ℝ,
      2 ≤ (SelectedClass D.A S.oppApex1 r ∩
        S.capInteriorByIndex S.oppIndex1).card → r = radius ∨ r = ρ at haligned
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
  let Bswap : FrontierBiApexRobustResidual Rρ := ⟨B.secondApex_robust⟩
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

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
