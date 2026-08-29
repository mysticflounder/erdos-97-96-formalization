/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-! # Common-radius exact-trace mathematical audit -/

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
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)

include T LPρ hLPρ MPρ

/-- Simultaneous endpoint omission already supplies a five-center deletion arm;
no enlarged first known blocker fiber is needed for this reduction. -/
theorem collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted_direct
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source') :
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  have hP₁omit := (all_endpoint_omission P.source₁ (by simp)).1
  have hP₂omit := (all_endpoint_omission P.source₂ (by simp)).1
  let R₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  let R₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  rcases MPρ.collisionSource_eq with hMPρ₁ | hMPρ₂
  · left
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt source.1 source.2) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hP₁omit
    have hapex1Survives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) S.oppApex1 := by
      simpa only [hMPρ₁] using MPρ.collisionSourcePacket.survives₁
    have hsecondBlockerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
      simpa only [hMPρ₁, hLPρ] using MPρ.collisionSourcePacket.survives₂
    exact
      ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
        R₂.survives P.source₁ P.source₁_mem_A,
        R₃.survives P.source₁ P.source₁_mem_A⟩
  · right
    right
    left
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt source.1 source.2) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hP₂omit
    have hapex1Survives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂) S.oppApex1 := by
      simpa only [hMPρ₂] using MPρ.collisionSourcePacket.survives₁
    have hsecondBlockerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
      simpa only [hMPρ₂, hLPρ] using MPρ.collisionSourcePacket.survives₂
    exact
      ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
        R₂.survives P.source₂ P.source₂_mem_A,
        R₃.survives P.source₂ P.source₂_mem_A⟩

/-- The direct deletion arm canonically exposes all five exact selected rows. -/
theorem commonRadius_exactTrace_collisionFiveCenterExactRows
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ
        C.surface.firstSource C.surface.secondSource) :
    FirstFiberCollisionFiveCenterExactRowsResidual
      P Pρ C.surface.firstSource S.oppApex2 S.surplusApex :=
  collisionFiveCenterExactRows_of_deletionResidual
    (P := P) (Pρ := Pρ) C.surface.firstSource
    (collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted_direct
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      C.surface.firstSource C.surface.secondSource all_endpoint_omission)

/-- The exact trace reaches the existing six-center faithful boundary without an
enlarged known-blocker fiber.  The next checked producer in that chain requires
the missing outside-fiber/crossed-row packet. -/
theorem commonRadius_exactTrace_collisionSixCenterFaithfulResidual
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (blocker_mem_capInterior :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex S.oppIndex1)
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ
        C.surface.firstSource C.surface.secondSource) :
    FirstFiberCollisionSixCenterFaithfulResidual
      P Pρ C.surface.firstSource S.oppApex2 S.surplusApex :=
  collisionFiveCenterFaithful_to_sixCenterFaithfulResidual
    (P := P) (Pρ := Pρ) C.surface.firstSource
    (collisionFiveCenterExactRows_to_faithfulCarrierResidual
      (P := P) (Pρ := Pρ) (T := T)
      C.surface.firstSource C.surface.firstSource_data blocker_mem_capInterior
      (commonRadius_exactTrace_collisionFiveCenterExactRows
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        C all_endpoint_omission))

/-- The mutual-incidence exact-trace arm reaches the six-center faithful boundary
directly.  This is the strongest existing clean deletion/minimality consumer found
before the missing outside-fiber/crossed-row interface. -/
theorem commonRadius_surface_mutualCrossMembership_sixCenterFaithfulResidual
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        C.surface.firstSource C.surface.secondSource) :
    FirstFiberCollisionSixCenterFaithfulResidual
      P Pρ C.surface.firstSource S.oppApex2 S.surplusApex := by
  have hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 :=
    blocker_centers_eq_of_secondRadius_mutual_cross_membership
      R C.surface.firstSource.2 C.surface.secondSource.2 C.surface.sources_ne
      C.firstSource_mem C.secondSource_mem hmutual.1 hmutual.2
  have hblockers :
      H.blockerVertex C.surface.firstSource =
        H.blockerVertex C.surface.secondSource := by
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
  exact
    commonRadius_exactTrace_collisionSixCenterFaithfulResidual
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      C hgeometry.1 homits

#print axioms collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted_direct
#print axioms commonRadius_exactTrace_collisionFiveCenterExactRows
#print axioms commonRadius_exactTrace_collisionSixCenterFaithfulResidual
#print axioms commonRadius_surface_mutualCrossMembership_sixCenterFaithfulResidual
#print axioms collisionSixCenterFaithful_to_crossedSeventhBlockerResidual
#print axioms false_of_capSource_firstFiber_outsidePairDeletionExactRows
#print axioms false_of_twoCapSources_sameBlockerAllEndpointOmission
#print axioms false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
#print axioms freshThird_commonRadius_sameBlocker_exists_centerCollision_or_commonDeletion
#print axioms false_of_freshThird_commonRadius_distinctCaps_survivingRow
#print axioms false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
#print axioms false_of_freshThird_firstNonHit

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
