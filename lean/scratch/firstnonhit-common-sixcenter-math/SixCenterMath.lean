/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-! # Common-radius six-center FirstNonHit audit -/

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

/-- The endpoint-omission exact trace, restated in this isolated scratch lane. -/
theorem collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted_sixCenterLane
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

/-- Common-radius mutual incidence installs all six faithful selected rows. -/
theorem commonRadius_mutualCrossMembership_sixCenterFaithfulResidual_sixCenterLane
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
  have hrows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ C.surface.firstSource S.oppApex2 S.surplusApex :=
    collisionFiveCenterExactRows_of_deletionResidual
      (P := P) (Pρ := Pρ) C.surface.firstSource
      (collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted_sixCenterLane
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        C.surface.firstSource C.surface.secondSource homits)
  exact
    collisionFiveCenterFaithful_to_sixCenterFaithfulResidual
      (P := P) (Pρ := Pρ) C.surface.firstSource
      (collisionFiveCenterExactRows_to_faithfulCarrierResidual
        (P := P) (Pρ := Pρ) (T := T)
        C.surface.firstSource C.surface.firstSource_data hgeometry.1 hrows)

omit T LPρ hLPρ MPρ in
/-- With equal common-radius blocker centers, a first non-hit transports across
the identical selected support and forces the second interaction to be another
non-hit.  In particular, the live packet supplies no positive Q cross-row. -/
theorem commonRadius_mutual_firstNonHit_forces_secondNonHit
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        C.surface.firstSource C.surface.secondSource)
    (data : FreshThirdCapSourceNonHit P Pρ C.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.secondSource Q) :
    FreshThirdCapSourceNonHit P Pρ C.surface.secondSource Q := by
  have hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 :=
    blocker_centers_eq_of_secondRadius_mutual_cross_membership
      R C.surface.firstSource.2 C.surface.secondSource.2 C.surface.sources_ne
      C.firstSource_mem C.secondSource_mem hmutual.1 hmutual.2
  have hsupports :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H C.surface.firstSource.2 C.surface.secondSource.2 hcenters
  have hnotSecond :
      ¬ FreshThirdCrossRowHit P Pρ C.surface.secondSource Q := by
    intro hhit
    cases data with
    | sameBlocker center_eq _ =>
        exact hhit.1 (hcenters.symm.trans center_eq)
    | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
        apply deleted_not_mem
        rcases deleted_eq with rfl | rfl
        · rw [hsupports]
          exact hhit.2.1
        · rw [hsupports]
          exact hhit.2.2
  exact
    FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
      (P := P) (Pρ := Pρ) C.surface.secondSource Q secondInteraction hnotSecond

omit T LPρ hLPρ MPρ in
/-- Minimal center separation carried by one fresh-fiber deletion survival. -/
theorem freshThird_sourceRowOmission_center_ne_sixCenterLane
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

omit T LPρ hLPρ MPρ in
/-- Exact compatible constructor patterns after transporting the first non-hit
across the common-radius mutual pair.  Either all three named blockers and
supports agree, or both cap rows carry explicit Q-endpoint deletion survivals. -/
abbrev CommonRadiusMutualFirstNonHitCompatibility
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ((H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) ∧
    (H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)) ∨
    ∃ deleted : CriticalShellSystem.CarrierVertex D.A,
      (deleted = Q.source₁ ∨ deleted = Q.source₂) ∧
      deleted.1 ∉
        (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
        (H.centerAt C.surface.firstSource.1 C.surface.firstSource.2) ∧
      ∃ deleted' : CriticalShellSystem.CarrierVertex D.A,
        (deleted' = Q.source₁ ∨ deleted' = Q.source₂) ∧
        deleted'.1 ∉
          (H.selectedAt C.surface.secondSource.1
            C.surface.secondSource.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted'.1)
          (H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)

omit T LPρ hLPρ MPρ in
/-- No mixed constructor survives: common-radius mutual incidence reduces the
live first-non-hit arm to shared-Q-blocker or double-omission data exactly. -/
theorem commonRadius_mutual_firstNonHit_compatibility
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        C.surface.firstSource C.surface.secondSource)
    (data : FreshThirdCapSourceNonHit P Pρ C.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.secondSource Q) :
    CommonRadiusMutualFirstNonHitCompatibility P Pρ C Q := by
  have hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 :=
    blocker_centers_eq_of_secondRadius_mutual_cross_membership
      R C.surface.firstSource.2 C.surface.secondSource.2 C.surface.sources_ne
      C.firstSource_mem C.secondSource_mem hmutual.1 hmutual.2
  have secondData :
      FreshThirdCapSourceNonHit P Pρ C.surface.secondSource Q :=
    commonRadius_mutual_firstNonHit_forces_secondNonHit
      (P := P) (Pρ := Pρ) C Q hmutual data secondInteraction
  cases data with
  | sameBlocker center_eq support_eq =>
      cases secondData with
      | sameBlocker center_eq' support_eq' =>
          exact Or.inl ⟨⟨center_eq, support_eq⟩, center_eq', support_eq'⟩
      | sourceRowOmission deleted deleted_eq _ deletion_survives =>
          have hne :=
            freshThird_sourceRowOmission_center_ne_sixCenterLane
              (P := P) (Pρ := Pρ) C.surface.secondSource Q deleted
              deleted_eq deletion_survives
          exact (hne (hcenters.symm.trans center_eq)).elim
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      cases secondData with
      | sameBlocker center_eq _ =>
          have hne :=
            freshThird_sourceRowOmission_center_ne_sixCenterLane
              (P := P) (Pρ := Pρ) C.surface.firstSource Q deleted
              deleted_eq deletion_survives
          exact (hne (hcenters.trans center_eq)).elim
      | sourceRowOmission deleted' deleted_eq' deleted_not_mem' deletion_survives' =>
          exact Or.inr
            ⟨deleted, deleted_eq, deleted_not_mem, deletion_survives,
              deleted', deleted_eq', deleted_not_mem', deletion_survives'⟩

/-- Strongest source-clean packet obtained from the common-radius mutual arm:
the six installed faithful rows coexist with non-hits at both named cap rows. -/
theorem commonRadius_mutual_firstNonHit_sixCenterFaithful_doubleNonHit
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        C.surface.firstSource C.surface.secondSource)
    (data : FreshThirdCapSourceNonHit P Pρ C.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.surface.secondSource Q) :
    FirstFiberCollisionSixCenterFaithfulResidual
        P Pρ C.surface.firstSource S.oppApex2 S.surplusApex ∧
      FreshThirdCapSourceNonHit P Pρ C.surface.firstSource Q ∧
      FreshThirdCapSourceNonHit P Pρ C.surface.secondSource Q := by
  exact
    ⟨commonRadius_mutualCrossMembership_sixCenterFaithfulResidual_sixCenterLane
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        C T.oppApex1_rich hmutual,
      data,
      commonRadius_mutual_firstNonHit_forces_secondNonHit
        (P := P) (Pρ := Pρ) C Q hmutual data secondInteraction⟩

#print axioms commonRadius_mutualCrossMembership_sixCenterFaithfulResidual_sixCenterLane
#print axioms commonRadius_mutual_firstNonHit_forces_secondNonHit
#print axioms freshThird_sourceRowOmission_center_ne_sixCenterLane
#print axioms commonRadius_mutual_firstNonHit_compatibility
#print axioms commonRadius_mutual_firstNonHit_sixCenterFaithful_doubleNonHit

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
