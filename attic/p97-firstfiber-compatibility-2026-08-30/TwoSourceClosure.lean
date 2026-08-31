/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

/- Source excerpt from base HEAD beb71db498ad47cca5c343a76a359423ff47f9e2.
   Historical span: live TwoSourceClosure.lean:2044-2186. -/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair
import Erdos9796Proof.P97.U3EscapingAuditCycle
import Erdos9796Proof.P97.U3ToU5MixedExtraction
import Erdos9796Proof.P97.U3ToU5Terminal

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

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation. -/
theorem false_of_twoCapSources_oneSidedDeletionSurvival_frame
    (frame : TwoSourceCollisionFrame P Pρ)
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
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      ⟨hsource.1, source, source', hsourcesNe, hsource, hsource'⟩
      ⟨Q⟩

/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation.
This is a compatibility wrapper over
`false_of_twoCapSources_oneSidedDeletionSurvival_frame`, which takes the
same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
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
    False :=
  false_of_twoCapSources_oneSidedDeletionSurvival_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    Q source source' hsourcesNe hsourceRadius hsourceRadius' hsource hsource' hsurvival

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
    · exact false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame
        P Pρ T
        ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
          hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
        source source' hsourcesNe hsourceRadius hsourceRadius'
        hmutual hblockersEq
  · exact false_of_twoCapSources_oneSidedDeletionSurvival_frame
      P Pρ T
      ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
        hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource' hsurvival

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
