/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-! # Common-radius direct-ingress scratch audit -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

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

/-- Packet-only exact trace in the mutual-incidence branch.

This deliberately concludes positive structure rather than `False`: the trace identifies the
first premise absent from every currently import-reachable contradiction consumer. -/
theorem commonRadius_surface_mutualCrossMembership_exactTrace
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        C.surface.firstSource C.surface.secondSource) :
    H.blockerVertex C.surface.firstSource = H.blockerVertex C.surface.secondSource ∧
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1 ∧
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {C.surface.firstSource.1, C.surface.secondSource.1} ∧
      AllCollisionEndpointsOmitted P Pρ
        C.surface.firstSource C.surface.secondSource := by
  have hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 :=
    blocker_centers_eq_of_secondRadius_mutual_cross_membership
      R C.surface.firstSource.2 C.surface.secondSource.2 C.surface.sources_ne
      C.firstSource_mem C.secondSource_mem hmutual.1 hmutual.2
  have hblockers :
      H.blockerVertex C.surface.firstSource = H.blockerVertex C.surface.secondSource := by
    apply Subtype.ext
    exact hcenters
  have hcenter : S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hfirstIndexed :
      C.surface.firstSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [← hcenter] using
      Finset.mem_inter.mpr ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩
  have hsecondIndexed :
      C.surface.secondSource.1 ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [← hcenter] using
      Finset.mem_inter.mpr ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩
  have hgeometry :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      C.surface.firstSource.2 C.surface.secondSource.2 hfirstIndexed hsecondIndexed
      C.surface.sources_ne hcenters
      (by simpa only [← hcenter] using hrich)
      (isUniqueFourCenter_centerAt H C.surface.firstSource.1 C.surface.firstSource.2)
  have homits :
      AllCollisionEndpointsOmitted P Pρ
        C.surface.firstSource C.surface.secondSource :=
    allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
      (P := P) (Pρ := Pρ) C.surface.firstSource C.surface.secondSource
      C.surface.firstSource_data C.surface.secondSource_data hblockers hgeometry.2
  exact ⟨hblockers, hgeometry.1, hgeometry.2, homits⟩

/-- Exhaustive packet-only reduction of the two common-radius source rows. -/
theorem commonRadius_surface_exactTrace_or_oneSidedDeletionSurvival
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1) :
    (H.blockerVertex C.surface.firstSource = H.blockerVertex C.surface.secondSource ∧
        H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
          S.capInteriorByIndex S.oppIndex1 ∧
        (H.selectedAt C.surface.firstSource.1
            C.surface.firstSource.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {C.surface.firstSource.1, C.surface.secondSource.1} ∧
        AllCollisionEndpointsOmitted P Pρ
          C.surface.firstSource C.surface.secondSource) ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H)
        C.surface.firstSource C.surface.secondSource := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      C.surface.firstSource C.surface.secondSource with hmutual | hsurvival
  · exact Or.inl <|
      commonRadius_surface_mutualCrossMembership_exactTrace
        P Pρ C hrich hmutual
  · exact Or.inr hsurvival

#print axioms commonRadius_surface_mutualCrossMembership_exactTrace
#print axioms commonRadius_surface_exactTrace_or_oneSidedDeletionSurvival
#print axioms false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
#print axioms false_of_freshThird_sameCapCrossRowAlignment
#print axioms false_of_two_freshThirdCrossRowHits_distinctCenters
#print axioms freshThird_commonRadius_sameBlocker_exists_centerCollision_or_commonDeletion
#print axioms false_of_selectedClass_and_row_two_shared_on_one_arc
#print axioms false_of_freshThird_commonRadius_distinctCaps_survivingRow
#print axioms false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
#print axioms false_of_freshThird_firstNonHit

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
