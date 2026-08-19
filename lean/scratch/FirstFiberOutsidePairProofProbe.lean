import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

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
      SelectedClass D.A S.oppApex1 radius ∩ S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩ S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
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
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-! Diagnostic only: the final coordinator below calls the live target back.
This file records ingress normalization, not a promoted closure proof. -/
theorem firstFiberOutsidePairDeletionExactRows_circularProbe {commonRadius : ℝ}
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
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 = {source.1, source'.1})
    (deleted : ℝ²) (deleted_mem_A : deleted ∈ D.A)
    (deleted_eq_outsidePoint :
      deleted = Q.source.1 ∨ deleted = Q.otherOutsidePoint)
    (outsideExactRows :
      ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H deleted deleted_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex)
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) : False := by
  have hsourceCenterCap :
      H.centerAt source.1 source.2 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 blocker_mem_capInterior
  have hsourceCenterNe :
      H.centerAt source.1 source.2 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    apply source_witness.2.2.2.1
    exact h
  have houtsideResidual :
      FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual P Pρ Q source := by
    rcases deleted_eq_outsidePoint with hsource | hother
    · exact Or.inl ⟨by simpa [hsource] using outsideExactRows⟩
    · exact Or.inr (Or.inl ⟨by simpa [hother] using outsideExactRows⟩)
  have houtsidePair :
    FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
        P Pρ Q source source' :=
    firstFiberOutsidePair_exactRows_or_crossedThreeRows
      (P := P) (Pρ := Pρ) Q source source' sources_ne source_witness source'_witness
      cross_membership shell_inter_cap_eq houtsideResidual
  exact false_of_capSource_firstFiber_collisionFiveCenterDeletion
    (P := P) (Pρ := Pρ)
    (hρne := hρne) (hfrontierFour := hfrontierFour)
    (hρfour := hρfour) (hfrontierInteriorEq := hfrontierInteriorEq)
    (hρInteriorEq := hρInteriorEq) (T := T)
    (hpairsDisjoint := hpairsDisjoint) (hblockersNe := hblockersNe)
    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
    (LP := LP) (hLP := hLP) (MP := MP)
    Q source source' sources_ne source_mem_radius source'_mem_radius
    source_witness source'_witness cross_membership blockers_eq
    all_endpoint_omission blocker_mem_capInterior shell_inter_cap_eq
    houtsidePair hexactRows

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.firstFiberOutsidePairDeletionExactRows_circularProbe
#print axioms
  Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_collisionFiveCenterDeletion
