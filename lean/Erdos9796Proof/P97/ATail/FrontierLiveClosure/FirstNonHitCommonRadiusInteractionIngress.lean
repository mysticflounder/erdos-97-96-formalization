/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstFiberAcyclicFaithfulIngress

/-!
# Source-clean interaction ingress for the FirstNonHit common-radius arm

The live FirstNonHit common-radius branch receives a surface independent of
the named canonical surface carrying the original non-hit.  This module
classifies that independent surface against the fresh blocker fiber without
assuming either interaction and before entering the residual coordinator.

The result is deliberately positive data, not a contradiction: it exposes
both exact interaction packets and the three-arm normalized residual.  Its
immediate consumer is the branch-specific common-radius reduction; the first
missing antecedent after this theorem is a consumer for the resulting non-hit
or equal-cross-row-center arm.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourRobustCapExpansion
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

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
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)

/-- Exact source trace in the mutual-incidence arm of the independent
common-radius surface.  The mutual packet is retained because it is the
antecedent used by the subsequent non-hit transport. -/
abbrev FreshThirdCommonRadiusMutualExactTrace
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  TwoCapSourcesMutualCrossMembership (H := H)
      G.surface.firstSource G.surface.secondSource ∧
    H.blockerVertex G.surface.firstSource =
      H.blockerVertex G.surface.secondSource ∧
    H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 ∈
      S.capInteriorByIndex S.oppIndex1 ∧
    (H.selectedAt G.surface.firstSource.1
        G.surface.firstSource.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {G.surface.firstSource.1, G.surface.secondSource.1} ∧
    AllCollisionEndpointsOmitted P Pρ
      G.surface.firstSource G.surface.secondSource

/-- Mutual incidence of the two same-radius strict-cap sources determines
their common blocker row and all four retained-endpoint omissions. -/
theorem freshThird_commonRadius_mutualExactTrace
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H)
        G.surface.firstSource G.surface.secondSource) :
    FreshThirdCommonRadiusMutualExactTrace P Pρ G := by
  have hcenters :
      H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
        H.centerAt G.surface.secondSource.1 G.surface.secondSource.2 :=
    blocker_centers_eq_of_secondRadius_mutual_cross_membership
      R G.surface.firstSource.2 G.surface.secondSource.2 G.surface.sources_ne
      G.firstSource_mem G.secondSource_mem hmutual.1 hmutual.2
  have hblockers :
      H.blockerVertex G.surface.firstSource =
        H.blockerVertex G.surface.secondSource := by
    apply Subtype.ext
    exact hcenters
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hfirstIndexed :
      G.surface.firstSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) G.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [← hcenter] using
      Finset.mem_inter.mpr
        ⟨G.firstSource_mem, G.surface.firstSource_data.2.1⟩
  have hsecondIndexed :
      G.surface.secondSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) G.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [← hcenter] using
      Finset.mem_inter.mpr
        ⟨G.secondSource_mem, G.surface.secondSource_data.2.1⟩
  have hgeometry :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      G.surface.firstSource.2 G.surface.secondSource.2
      hfirstIndexed hsecondIndexed G.surface.sources_ne hcenters
      (by simpa only [← hcenter] using hrich)
      (isUniqueFourCenter_centerAt
        H G.surface.firstSource.1 G.surface.firstSource.2)
  have homits :
      AllCollisionEndpointsOmitted P Pρ
        G.surface.firstSource G.surface.secondSource :=
    allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
      (P := P) (Pρ := Pρ)
      G.surface.firstSource G.surface.secondSource
      G.surface.firstSource_data G.surface.secondSource_data
      hblockers hgeometry.2
  exact
    ⟨hmutual, hblockers, hgeometry.1, hgeometry.2, homits⟩

/-- Exhaustive source-pair split for the independent common-radius surface:
mutual incidence has the full exact trace above; otherwise one named source
row survives deletion of the other source. -/
theorem freshThird_commonRadius_mutualExactTrace_or_oneSidedDeletion
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1) :
    FreshThirdCommonRadiusMutualExactTrace P Pρ G ∨
      TwoCapSourcesOneSidedDeletionSurvival (H := H)
        G.surface.firstSource G.surface.secondSource := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      G.surface.firstSource G.surface.secondSource with
    hmutual | hsurvival
  · exact Or.inl <|
      freshThird_commonRadius_mutualExactTrace P Pρ G hrich hmutual
  · exact Or.inr hsurvival

/-- Transport a cap-source non-hit across equal actual blocker centers and
equal selected supports.  The target interaction is retained so the result
does not reconstruct or assume a geometric interaction constructor. -/
theorem freshThirdCapSourceNonHit_of_equalSelectedSupports
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcenters :
      H.centerAt source.1 source.2 =
        H.centerAt source'.1 source'.2)
    (hsupports :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support =
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support)
    (data : FreshThirdCapSourceNonHit P Pρ source Q)
    (interaction' : FreshThirdCapSourceInteraction P Pρ source' Q) :
    FreshThirdCapSourceNonHit P Pρ source' Q := by
  have hnotTarget :
      ¬ FreshThirdCrossRowHit P Pρ source' Q := by
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
      (P := P) (Pρ := Pρ) source' Q interaction' hnotTarget

/-- The mutual exact trace transports a first-source non-hit to the second
common-radius source. -/
theorem freshThird_commonRadius_mutual_firstNonHit_forces_secondNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.secondSource Q) :
    FreshThirdCapSourceNonHit P Pρ G.surface.secondSource Q := by
  have hcenters :
      H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
        H.centerAt G.surface.secondSource.1 G.surface.secondSource.2 :=
    congrArg Subtype.val htrace.2.1
  have hsupports :
      (H.selectedAt G.surface.firstSource.1
          G.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt G.surface.secondSource.1
          G.surface.secondSource.2).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H G.surface.firstSource.2 G.surface.secondSource.2 hcenters
  exact
    freshThirdCapSourceNonHit_of_equalSelectedSupports
      (P := P) (Pρ := Pρ)
      G.surface.firstSource G.surface.secondSource Q
      hcenters hsupports data secondInteraction

/-- Symmetric transport of a second-source non-hit to the first
common-radius source. -/
theorem freshThird_commonRadius_mutual_secondNonHit_forces_firstNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.firstSource Q)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.secondSource Q) :
    FreshThirdCapSourceNonHit P Pρ G.surface.firstSource Q := by
  have hcenters :
      H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
        H.centerAt G.surface.secondSource.1 G.surface.secondSource.2 :=
    congrArg Subtype.val htrace.2.1
  have hsupports :
      (H.selectedAt G.surface.firstSource.1
          G.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt G.surface.secondSource.1
          G.surface.secondSource.2).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H G.surface.firstSource.2 G.surface.secondSource.2 hcenters
  exact
    freshThirdCapSourceNonHit_of_equalSelectedSupports
      (P := P) (Pρ := Pρ)
      G.surface.secondSource G.surface.firstSource Q
      hcenters.symm hsupports.symm data firstInteraction

include T LPρ hLPρ MPρ in
/-- The four retained-endpoint omissions in the mutual exact trace eliminate
the aligned-hit arm of the first-fiber descent.  One retained endpoint can
therefore be deleted while preserving the common-radius source row and the
four source-produced apex/blocker rows. -/
theorem freshThird_commonRadius_mutual_fiveCenterDeletion
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G) :
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ G.surface.firstSource S.oppApex2 S.surplusApex := by
  have hP₁omit := (htrace.2.2.2.2 P.source₁ (by simp)).1
  have hP₂omit := (htrace.2.2.2.2 P.source₂ (by simp)).1
  let R₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  let R₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  rcases MPρ.collisionSource_eq with hMPρ₁ | hMPρ₂
  · left
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt G.surface.firstSource.1
            G.surface.firstSource.2) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H G.surface.firstSource.2).2 hP₁omit
    have hapex1Survives :
        HasNEquidistantPointsAt 4
          (D.A.erase P.source₁) S.oppApex1 := by
      simpa only [hMPρ₁] using MPρ.collisionSourcePacket.survives₁
    have hsecondBlockerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
      simpa only [hMPρ₁, hLPρ] using
        MPρ.collisionSourcePacket.survives₂
    exact
      ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
        R₂.survives P.source₁ P.source₁_mem_A,
        R₃.survives P.source₁ P.source₁_mem_A⟩
  · right
    right
    left
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt G.surface.firstSource.1
            G.surface.firstSource.2) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H G.surface.firstSource.2).2 hP₂omit
    have hapex1Survives :
        HasNEquidistantPointsAt 4
          (D.A.erase P.source₂) S.oppApex1 := by
      simpa only [hMPρ₂] using MPρ.collisionSourcePacket.survives₁
    have hsecondBlockerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
      simpa only [hMPρ₂, hLPρ] using
        MPρ.collisionSourcePacket.survives₂
    exact
      ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
        R₂.survives P.source₂ P.source₂_mem_A,
        R₃.survives P.source₂ P.source₂_mem_A⟩

/-- Early acyclic packet for a non-hit arm of the common-radius mutual trace.
It retains the exact trace, one source row plus the five surviving deletion
centers, and non-hit data for both common-radius sources. -/
abbrev FreshThirdCommonRadiusMutualFiveCenterDoubleNonHitIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  FreshThirdCommonRadiusMutualExactTrace P Pρ G ∧
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ G.surface.firstSource S.oppApex2 S.surplusApex ∧
    FreshThirdCapSourceNonHit P Pρ G.surface.firstSource Q ∧
    FreshThirdCapSourceNonHit P Pρ G.surface.secondSource Q

include T LPρ hLPρ MPρ in
/-- Build the complete early double-non-hit packet from a first-source
non-hit and the independently classified second interaction. -/
theorem freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_firstNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.secondSource Q) :
    FreshThirdCommonRadiusMutualFiveCenterDoubleNonHitIngress P Pρ G Q := by
  exact
    ⟨htrace,
      freshThird_commonRadius_mutual_fiveCenterDeletion
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ) G htrace,
      data,
      freshThird_commonRadius_mutual_firstNonHit_forces_secondNonHit
        (P := P) (Pρ := Pρ) G Q htrace data secondInteraction⟩

include T LPρ hLPρ MPρ in
/-- Symmetric construction from a second-source non-hit. -/
theorem freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_secondNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.firstSource Q)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.secondSource Q) :
    FreshThirdCommonRadiusMutualFiveCenterDoubleNonHitIngress P Pρ G Q := by
  exact
    ⟨htrace,
      freshThird_commonRadius_mutual_fiveCenterDeletion
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ) G htrace,
      freshThird_commonRadius_mutual_secondNonHit_forces_firstNonHit
        (P := P) (Pρ := Pρ) G Q htrace firstInteraction data,
      data⟩

/-- Strongest source-clean form of the mutual non-hit arm.  In addition to
the exact trace and both non-hits, it installs the raw deletion packet as six
distinct faithful carrier centers without importing the live residual. -/
abbrev FreshThirdCommonRadiusMutualSixCenterDoubleNonHitIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  FreshThirdCommonRadiusMutualFiveCenterDoubleNonHitIngress P Pρ G Q ∧
    FirstFiberCollisionSixCenterAcyclicFaithfulResidual
      P Pρ G.surface.firstSource S.oppApex2 S.surplusApex

include T LPρ hLPρ MPρ in
/-- Build the faithful six-center double-non-hit packet from a first-source
non-hit. -/
theorem freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_firstNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.secondSource Q) :
    FreshThirdCommonRadiusMutualSixCenterDoubleNonHitIngress P Pρ G Q := by
  let packet :=
    freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_firstNonHit
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      G Q htrace data secondInteraction
  refine ⟨packet, ?_⟩
  exact
    collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.firstSource G.surface.firstSource_data
      htrace.2.2.1 packet.2.1

include T LPρ hLPρ MPρ in
/-- Symmetric faithful construction from a second-source non-hit. -/
theorem freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_secondNonHit
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ G.surface.firstSource Q)
    (data : FreshThirdCapSourceNonHit P Pρ G.surface.secondSource Q) :
    FreshThirdCommonRadiusMutualSixCenterDoubleNonHitIngress P Pρ G Q := by
  let packet :=
    freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_secondNonHit
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      G Q htrace firstInteraction data
  refine ⟨packet, ?_⟩
  exact
    collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.firstSource G.surface.firstSource_data
      htrace.2.2.1 packet.2.1

/-- Positive source packet obtained by classifying the independent
common-radius surface against the fresh blocker fiber. -/
abbrev FreshThirdCommonRadiusQInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.firstSource Q) ∧
    Nonempty
      (FreshThirdCapSourceInteraction
        P Pρ G.surface.secondSource Q) ∧
    FreshThirdNormalizedResidualCase P Pρ G.surface Q

include T in
/-- Classify both rows of an independently produced common-radius surface
against the fresh blocker fiber.

Same-cap alignment is eliminated by the ordered-cap theorem.  The remaining
four-way interaction classification is source-clean.  If both source rows hit
the fresh pair, their blocker centers must agree, since otherwise those two
centers and the fresh blocker center would be three carrier points on one
perpendicular bisector. -/
theorem freshThird_commonRadius_qInteractionIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQInteractionIngress P Pρ G Q := by
  have hfirstNoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment
        P Pρ Q G.surface.firstSource := by
    intro halign
    exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q G.surface.firstSource halign
  have hsecondNoAlignment :
      ¬ FreshThirdSameCapCrossRowAlignment
        P Pρ Q G.surface.secondSource := by
    intro halign
    exact
      false_of_freshThird_sameCapCrossRowAlignment
        (P := P) (Pρ := Pρ) Q G.surface.secondSource halign
  obtain ⟨firstInteraction⟩ :=
    nonempty_freshThirdCapSourceInteraction_of_noAlignment
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.firstSource G.surface.firstSource_data Q hfirstNoAlignment
  obtain ⟨secondInteraction⟩ :=
    nonempty_freshThirdCapSourceInteraction_of_noAlignment
      (P := P) (Pρ := Pρ) (T := T)
      G.surface.secondSource G.surface.secondSource_data Q hsecondNoAlignment
  have hresidual :
      FreshThirdCrossRowResidual P Pρ
        G.surface.firstSource G.surface.secondSource Q := by
    by_cases hfirst :
        FreshThirdCrossRowHit P Pρ G.surface.firstSource Q
    · by_cases hsecond :
          FreshThirdCrossRowHit P Pρ G.surface.secondSource Q
      · by_cases hcenters :
            H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
              H.centerAt G.surface.secondSource.1 G.surface.secondSource.2
        · exact Or.inr (Or.inr hcenters)
        · exact False.elim <|
            false_of_two_freshThirdCrossRowHits_distinctCenters
              (P := P) (Pρ := Pρ) Q
              G.surface.firstSource G.surface.secondSource
              hfirst hsecond hcenters
      · exact Or.inr (Or.inl hsecond)
    · exact Or.inl hfirst
  exact
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩,
      freshThirdNormalizedResidualCase_of_crossRowResidual
        (P := P) (Pρ := Pρ) G.surface Q
        firstInteraction secondInteraction hresidual⟩

/-- Consumer-shaped product of the complete source-pair split and the
independently reconstructed `G`–`Q` interactions. -/
abbrev FreshThirdCommonRadiusQResidualExactTraceOrOneSided
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  (FreshThirdCommonRadiusMutualExactTrace P Pρ G ∧
      FreshThirdCommonRadiusQInteractionIngress P Pρ G Q) ∨
    (TwoCapSourcesOneSidedDeletionSurvival (H := H)
        G.surface.firstSource G.surface.secondSource ∧
      FreshThirdCommonRadiusQInteractionIngress P Pρ G Q)

include T in
/-- Exact acyclic ingress for the common-radius FirstNonHit reduction.
The theorem assumes neither `G`–`Q` interaction and does not identify `G`
with the named canonical surface carrying the original non-hit. -/
theorem freshThird_commonRadius_qResidual_exactTrace_or_oneSided
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQResidualExactTraceOrOneSided P Pρ G Q := by
  have hqIngress :
      FreshThirdCommonRadiusQInteractionIngress P Pρ G Q :=
    freshThird_commonRadius_qInteractionIngress
      (P := P) (Pρ := Pρ) (T := T) G Q
  rcases
      freshThird_commonRadius_mutualExactTrace_or_oneSidedDeletion
        P Pρ G T.oppApex1_rich with htrace | hsurvival
  · exact Or.inl ⟨htrace, hqIngress⟩
  · exact Or.inr ⟨hsurvival, hqIngress⟩

/-- Strict mutual-incidence reduction after both `G`–`Q` interactions have
been reconstructed.  Either one non-hit transports across the common blocker
row and produces the faithful six-center double-non-hit packet, or both rows
hit the fresh pair and their blocker centers agree. -/
inductive FreshThirdCommonRadiusMutualQReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop where
  | doubleNonHit
      (packet :
        FreshThirdCommonRadiusMutualSixCenterDoubleNonHitIngress
          P Pρ G Q)
  | equalCrossRowCenters
      (firstHit :
        FreshThirdCrossRowHit P Pρ G.surface.firstSource Q)
      (secondHit :
        FreshThirdCrossRowHit P Pρ G.surface.secondSource Q)
      (centers_eq :
        H.centerAt G.surface.firstSource.1 G.surface.firstSource.2 =
          H.centerAt G.surface.secondSource.1 G.surface.secondSource.2)
      (firstInteraction :
        FreshThirdCapSourceInteraction P Pρ G.surface.firstSource Q)
      (secondInteraction :
        FreshThirdCapSourceInteraction P Pρ G.surface.secondSource Q)

include T LPρ hLPρ MPρ in
/-- Consume the normalized residual in the mutual exact-trace arm, merging
both directional non-hit cases into one packet. -/
theorem freshThird_commonRadius_mutual_qReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (htrace : FreshThirdCommonRadiusMutualExactTrace P Pρ G)
    (hqIngress : FreshThirdCommonRadiusQInteractionIngress P Pρ G Q) :
    FreshThirdCommonRadiusMutualQReducedIngress P Pρ G Q := by
  rcases hqIngress with
    ⟨⟨firstInteraction⟩, ⟨secondInteraction⟩, hresidual⟩
  cases hresidual with
  | firstNonHit data =>
      exact .doubleNonHit <|
        freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_firstNonHit
          (P := P) (Pρ := Pρ) (T := T)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          G Q htrace data secondInteraction
  | secondNonHit data =>
      exact .doubleNonHit <|
        freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_secondNonHit
          (P := P) (Pρ := Pρ) (T := T)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          G Q htrace firstInteraction data
  | equalCrossRowCenters firstHit secondHit centers_eq =>
      exact .equalCrossRowCenters
        firstHit secondHit centers_eq firstInteraction secondInteraction

/-- Final acyclic source ingress for the common-radius branch.  The former
unclassified witness is reduced to exactly three consumer shapes:
faithful six-center double non-hit, equal-center double hit, or one-sided deletion
survival with the complete interaction packet retained. -/
abbrev FreshThirdCommonRadiusQReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  FreshThirdCommonRadiusMutualQReducedIngress P Pρ G Q ∨
    (TwoCapSourcesOneSidedDeletionSurvival (H := H)
        G.surface.firstSource G.surface.secondSource ∧
      FreshThirdCommonRadiusQInteractionIngress P Pρ G Q)

include T LPρ hLPρ MPρ in
/-- Produce the final three-shape common-radius ingress directly from the
independent source witness and fresh blocker fiber. -/
theorem freshThird_commonRadius_qReducedIngress
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    FreshThirdCommonRadiusQReducedIngress P Pρ G Q := by
  rcases
      freshThird_commonRadius_qResidual_exactTrace_or_oneSided
        (P := P) (Pρ := Pρ) (T := T) G Q with
    hmutual | honeSided
  · exact Or.inl <|
      freshThird_commonRadius_mutual_qReducedIngress
        (P := P) (Pρ := Pρ) (T := T)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        G Q hmutual.1 hmutual.2
  · exact Or.inr honeSided

#print axioms freshThird_commonRadius_mutualExactTrace
#print axioms freshThird_commonRadius_mutualExactTrace_or_oneSidedDeletion
#print axioms freshThirdCapSourceNonHit_of_equalSelectedSupports
#print axioms freshThird_commonRadius_mutual_firstNonHit_forces_secondNonHit
#print axioms freshThird_commonRadius_mutual_secondNonHit_forces_firstNonHit
#print axioms freshThird_commonRadius_mutual_fiveCenterDeletion
#print axioms freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_firstNonHit
#print axioms freshThird_commonRadius_mutual_fiveCenterDoubleNonHit_of_secondNonHit
#print axioms freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_firstNonHit
#print axioms freshThird_commonRadius_mutual_sixCenterDoubleNonHit_of_secondNonHit
#print axioms freshThird_commonRadius_qInteractionIngress
#print axioms freshThird_commonRadius_qResidual_exactTrace_or_oneSided
#print axioms freshThird_commonRadius_mutual_qReducedIngress
#print axioms freshThird_commonRadius_qReducedIngress

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
