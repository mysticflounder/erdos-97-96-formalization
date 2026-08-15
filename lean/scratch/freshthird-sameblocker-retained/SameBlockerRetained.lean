import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

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

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

/-- Scratch check: two `sameBlocker` arms force a common omitted collision
endpoint.  This is the maximal local conclusion before retained deletion-core
production. -/
theorem commonCollisionEndpointOmission_of_sameBlockerPair_scratch
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstCenter :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hsecondCenter :
      H.centerAt C.secondSource.1 C.secondSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hsecondSupport :
      (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support) :
    CommonCollisionEndpointOmission
      (H := H) P Pρ C.firstSource C.secondSource := by
  have hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2 :=
    hfirstCenter.trans hsecondCenter.symm
  have hsupports :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support :=
    hfirstSupport.trans hsecondSupport.symm
  have hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource := by
    constructor
    · rw [hsupports]
      exact
        (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.q_mem_support
    · rw [← hsupports]
      exact
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.q_mem_support
  rcases commonCollisionEndpointOmission_or_complementaryMembership
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      C.firstSource C.secondSource
      C.firstSource_data C.secondSource_data with hcommon | hcomplementary
  · exact hcommon
  · have hblockersEq :
        H.blockerVertex C.firstSource = H.blockerVertex C.secondSource := by
      apply Subtype.ext
      exact hcenters
    exact
      (false_of_equalBlockers_complementaryMembership
        (P := P) (Pρ := Pρ) hpairsDisjoint
        C.firstSource C.secondSource C.sources_ne
        C.firstSource_data C.secondSource_data hmutual hblockersEq
        hcomplementary).elim

/-- Scratch check: retained ingress turns the forced common omission into the
existing aligned pair of deletion cores. -/
theorem alignedCommonDeletionCorePairPacket_of_sameBlockerPair_scratch
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C)
    (hfirstCenter :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hfirstSupport :
      (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hsecondCenter :
      H.centerAt C.secondSource.1 C.secondSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hsecondSupport :
      (H.selectedAt C.secondSource.1
          C.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support) :
    FreshThirdAlignedCommonDeletionCorePairPacket
      (S := S) (H := H) P Pρ C := by
  apply freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission
      (P := P) (Pρ := Pρ)
      (hρne := hρne)
      (hfrontierFour := hfrontierFour) (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq) (T := T)
      C hretained.2.2.2.2.2
  exact commonCollisionEndpointOmission_of_sameBlockerPair_scratch
    (P := P) (Pρ := Pρ)
    hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
    T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP C Q
    hfirstCenter hfirstSupport hsecondCenter hsecondSupport

#print axioms commonCollisionEndpointOmission_of_sameBlockerPair_scratch
#print axioms alignedCommonDeletionCorePairPacket_of_sameBlockerPair_scratch

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
