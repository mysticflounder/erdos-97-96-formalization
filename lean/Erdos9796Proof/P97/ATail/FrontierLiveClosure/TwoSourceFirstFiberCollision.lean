/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshCanonicalOverride

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

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe in
/-- Simultaneous omission of all four collision endpoints removes the sole
non-deletion arm of the retained first-fiber descent.  Consequently one of
the four collision-source deletions preserves K4 at the cap-source blocker,
the first apex, the opposite collision blocker, and the other two robust
Moser apices. -/
theorem collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source') :
    ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  have hP₁omit :=
    (all_endpoint_omission P.source₁ (by simp)).1
  have hPρ₁omit :=
    (all_endpoint_omission Pρ.source₁ (by simp)).1
  have hdescent :=
    ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion
        P Pρ Q source source_witness.2.2.2.1
        (Or.inl hP₁omit) (Or.inl hPρ₁omit)
        LPρ hLPρ MPρ LP hLP MP
        (fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich)
        (fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich)
  rcases hdescent with hcycle | hdeletion
  · exact False.elim (hP₁omit hcycle.1)
  · exact hdeletion

/-- Exact-row form of the four first-fiber deletion arms.  Each arm records
five q-free cardinal-four rows and the deleted source's distinct actual
blocker, where the same deletion is blocked. -/
abbrev FirstFiberCollisionFiveCenterExactRowsResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃)

/-- Consumer-facing form of the four first-fiber deletion arms.  Each arm
installs its five exact deleted rows at five distinct carrier centers in one
faithful carrier pattern.  This is a strict ingress strengthening of
`FirstFiberCollisionFiveCenterExactRowsResidual`; it contains no
contradiction field. -/
abbrev FirstFiberCollisionFiveCenterFaithfulResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃)

/-- The four deletion arms with the omitted opposite collision-blocker row
restored.  Each arm now carries all six distinct centers in one faithful
pattern: the five exact deleted rows plus the canonical selected row at the
other collision blocker. -/
abbrev FirstFiberCollisionSixCenterFaithfulResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
        D H Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A))

/-- Canonical-row omission forced by each exact five-center arm.  Besides the
common source row, the deleted endpoint is absent from the selected row at the
opposite collision blocker. -/
abbrev FirstFiberCollisionDeletedEndpointOmissionResidual
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  (P.source₁ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      P.source₁ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Pρ.source₁ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Pρ.source₁ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) ∨
    (P.source₂ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      P.source₂ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Pρ.source₂ ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Pρ.source₂ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)

/-- The two canonical rows centered in the first cap either share an omitted
outside endpoint, so deleting it preserves K4 at both rows and all three rich
apices, or realize one of the two crossed outside-pair membership patterns. -/
abbrev FirstFiberOutsidePairFiveCenterOrCrossedResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D Q.source.1
      (H.centerAt source.1 source.2)
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex ∨
    ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D
      Q.otherOutsidePoint
      (H.centerAt source.1 source.2)
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex ∨
    (Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Q.otherOutsidePoint ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)

/-- Exact-row normalization of the outside-pair split.  The two deletion arms
carry five q-free theorem-bank rows; the crossed arms retain both positive
memberships and both complementary cross-omissions. -/
abbrev FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.source.1 Q.source.2
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.otherOutsidePoint Q.otherOutsidePoint_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    (Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
    (Q.otherOutsidePoint ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      Q.source.1 ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Any canonical row whose center lies in the first ordered cap and differs
from the first collision blocker omits at least one of the first row's two
named outside points. -/
theorem capCenter_omits_firstFiber_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (center : CriticalShellSystem.CarrierVertex D.A)
    (hcenterCap :
      H.centerAt center.1 center.2 ∈ S.capByIndex S.oppIndex1)
    (hcenterNe :
      H.centerAt center.1 center.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    Q.source.1 ∉
        (H.selectedAt center.1 center.2).toCriticalFourShell.support ∨
      Q.otherOutsidePoint ∉
        (H.selectedAt center.1 center.2).toCriticalFourShell.support := by
  by_cases hsource :
      Q.source.1 ∈
        (H.selectedAt center.1 center.2).toCriticalFourShell.support
  · right
    intro hother
    exact ATailFirstFiberOverlapDescent.false_of_firstFiber_twoOutsideHits_of_capCenter
      P Pρ Q center hcenterCap hcenterNe hsource hother
  · exact Or.inl hsource

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- The blocker from the opposite collision pair omits at least one of the
two named off-cap points in the first blocker row.  If it contained both, the
two distinct blocker centers in the same ordered cap would bisect the same
outside pair. -/
theorem oppositeBlocker_omits_firstFiber_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    Q.source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∨
      Q.otherOutsidePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
  exact capCenter_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) Q ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior)
    hblockersNe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- Checked outside-pair split used by the finite terminal.  A common omitted
endpoint gives a five-center deletion; otherwise the omissions are disjoint
and force one of the two crossed positive-incidence patterns. -/
theorem firstFiberOutsidePair_fiveCenter_or_crossed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceCenterCap :
      H.centerAt source.1 source.2 ∈ S.capByIndex S.oppIndex1)
    (hsourceCenterNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    FirstFiberOutsidePairFiveCenterOrCrossedResidual P Pρ Q source := by
  have hsourceOmit := capCenter_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) Q source hsourceCenterCap hsourceCenterNe
  have hoppositeOmit := oppositeBlocker_omits_firstFiber_outsidePair
    (P := P) (Pρ := Pρ) (hblockersNe := hblockersNe) Q
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  by_cases hsourceQ :
      Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · have hsourceOther :
        Q.otherOutsidePoint ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support :=
      hsourceOmit.resolve_left (not_not.mpr hsourceQ)
    by_cases hoppositeOther :
        Q.otherOutsidePoint ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support
    · have hoppositeQ :
          Q.source.1 ∉
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support :=
        hoppositeOmit.resolve_right (not_not.mpr hoppositeOther)
      exact Or.inr (Or.inr (Or.inl
        ⟨hsourceQ, hsourceOther, hoppositeOther, hoppositeQ⟩))
    · exact Or.inr (Or.inl
        ⟨(cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsourceOther,
          (cross_deletion_survives_iff_not_mem_selected_support
            H Pρ.source₁_mem_A).2 hoppositeOther,
          hrobust₁.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
          hrobust₂.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
          hrobust₃.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A⟩)
  · by_cases hoppositeQ :
        Q.source.1 ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support
    · have hoppositeOther :
          Q.otherOutsidePoint ∉
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support :=
        hoppositeOmit.resolve_left (not_not.mpr hoppositeQ)
      by_cases hsourceOther :
          Q.otherOutsidePoint ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · exact Or.inr (Or.inr (Or.inr
          ⟨hsourceOther, hsourceQ, hoppositeQ, hoppositeOther⟩))
      · exact Or.inr (Or.inl
          ⟨(cross_deletion_survives_iff_not_mem_selected_support
              H source.2).2 hsourceOther,
            (cross_deletion_survives_iff_not_mem_selected_support
              H Pρ.source₁_mem_A).2 hoppositeOther,
            hrobust₁.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
            hrobust₂.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A,
            hrobust₃.survives Q.otherOutsidePoint Q.otherOutsidePoint_mem_A⟩)
    · exact Or.inl
        ⟨(cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hsourceQ,
          (cross_deletion_survives_iff_not_mem_selected_support
            H Pρ.source₁_mem_A).2 hoppositeQ,
          hrobust₁.survives Q.source.1 Q.source.2,
          hrobust₂.survives Q.source.1 Q.source.2,
          hrobust₃.survives Q.source.1 Q.source.2⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Trim either common outside-point deletion to five exact q-free rows while
leaving the two crossed canonical-membership arms unchanged. -/
theorem firstFiberOutsidePair_exactRows_or_crossed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hresidual :
      FirstFiberOutsidePairFiveCenterOrCrossedResidual P Pρ Q source) :
    FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
      P Pρ Q source := by
  rcases hresidual with hsource | hother | hcross | hcross
  · exact Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Q.source.2 hsource)
  · exact Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Q.otherOutsidePoint_mem_A hother))
  · exact Or.inr (Or.inr (Or.inl hcross))
  · exact Or.inr (Or.inr (Or.inr hcross))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- Positive deletion form of
`oppositeBlocker_omits_firstFiber_outsidePair`. -/
theorem oppositeBlocker_outsideDeletionSurvival
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    HasNEquidistantPointsAt 4 (D.A.erase Q.source.1)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) ∨
      HasNEquidistantPointsAt 4 (D.A.erase Q.otherOutsidePoint)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
  rcases oppositeBlocker_omits_firstFiber_outsidePair
      (P := P) (Pρ := Pρ) (hblockersNe := hblockersNe) Q with
    hsource | hother
  · exact Or.inl
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Pρ.source₁_mem_A).2 hsource)
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support
        H Pρ.source₁_mem_A).2 hother)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Project the exact rows to their two named endpoint omissions in each arm. -/
theorem collisionFiveCenterExactRows_projects_to_omissions
    (source : CriticalShellSystem.CarrierVertex D.A)
    {a₂ a₃ : ℝ²}
    (hexact :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source a₂ a₃) :
    FirstFiberCollisionDeletedEndpointOmissionResidual P Pρ source := by
  rcases hexact with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨E⟩
    refine Or.inl ⟨?_, ?_⟩
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          Pρ.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hPρ₁ with ⟨E⟩
    refine Or.inr (Or.inl ⟨?_, ?_⟩)
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          P.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hP₂ with ⟨E⟩
    refine Or.inr (Or.inr (Or.inl ⟨?_, ?_⟩))
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          Pρ.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem
  · rcases hPρ₂ with ⟨E⟩
    refine Or.inr (Or.inr (Or.inr ⟨?_, ?_⟩))
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          source.2 E.K₀ E.B₀_card]
      exact E.K₀.q_not_mem
    · rw [← ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
          P.source₁_mem_A E.K₂ E.B₂_card]
      exact E.K₂.q_not_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Trim every arm of the retained five-center deletion residual to the exact
row interface consumed by the U5 theorem bank. -/
theorem collisionFiveCenterExactRows_of_deletionResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    {a₂ a₃ : ℝ²}
    (hdeletion :
      ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source a₂ a₃) :
    FirstFiberCollisionFiveCenterExactRowsResidual P Pρ source a₂ a₃ := by
  rcases hdeletion with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · exact Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₁_mem_A hP₁)
  · exact Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₁_mem_A hPρ₁))
  · exact Or.inr (Or.inr (Or.inl
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H P.source₂_mem_A hP₂)))
  · exact Or.inr (Or.inr (Or.inr
      (ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
        H Pρ.source₂_mem_A hPρ₂)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A cardinal-four support containing three distinct named points has one
remaining point.  This is the small finite-set normalization used below to
turn crossed canonical-row memberships into fixed-role exact supports. -/
private theorem exists_fourth_of_support_card_eq_four
    {α : Type*} [DecidableEq α]
    (K : Finset α) (a b c : α)
    (hcard : K.card = 4)
    (ha : a ∈ K) (hb : b ∈ K) (hc : c ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ d, d ∉ ({a, b, c} : Finset α) ∧ K = {a, b, c, d} := by
  let named : Finset α := {a, b, c}
  have hnamedCard : named.card = 3 := by
    simp [named, hab, hac, hbc]
  have hnamedSubset : named ⊆ K := by
    intro x hx
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact ha
    · exact hb
    · exact hc
  have hremainingCard : (K \ named).card = 1 := by
    rw [Finset.card_sdiff_of_subset hnamedSubset, hcard, hnamedCard]
  obtain ⟨d, hd⟩ := Finset.card_eq_one.mp hremainingCard
  refine ⟨d, ?_, ?_⟩
  · have hdmem : d ∈ K \ named := by simp [hd]
    exact (Finset.mem_sdiff.mp hdmem).2
  · have hsplit : K = (K \ named) ∪ named := by
      exact (Finset.sdiff_union_of_subset hnamedSubset).symm
    rw [hsplit, hd]
    ext x
    simp [named]

/-- Fixed-role support packet for either crossed outside-pair constructor.
The first collision row is already fully named.  The other two rows each have
three named members, so their remaining members are exposed explicitly and
proved to lie outside the first cap. -/
structure FirstFiberCrossedThreeRowExactSupports
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²) : Type where
  commonFourth : ℝ²
  oppositeFourth : ℝ²
  commonFourth_not_mem_named :
    commonFourth ∉ ({source.1, source'.1, commonOutside} : Finset ℝ²)
  oppositeFourth_not_mem_named :
    oppositeFourth ∉
      ({Pρ.source₁, Pρ.source₂, oppositeOutside} : Finset ℝ²)
  firstRow_support_eq :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint}
  commonRow_support_eq :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support =
      {source.1, source'.1, commonOutside, commonFourth}
  oppositeRow_support_eq :
    (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support =
      {Pρ.source₁, Pρ.source₂, oppositeOutside, oppositeFourth}
  oppositeOutside_not_mem_commonRow :
    oppositeOutside ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
  commonOutside_not_mem_oppositeRow :
    commonOutside ∉
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
  commonFourth_mem_A : commonFourth ∈ D.A
  oppositeFourth_mem_A : oppositeFourth ∈ D.A
  commonFourth_not_mem_firstCap :
    commonFourth ∉ S.capByIndex S.oppIndex1
  oppositeFourth_not_mem_firstCap :
    oppositeFourth ∉ S.capByIndex S.oppIndex1

/-- The ten named carrier roles occurring in the three crossed exact rows.
The two outside points occur twice among the three row descriptions, so this
is sharper than the generic twelve-point triple-shell bound. -/
noncomputable def FirstFiberCrossedThreeRowExactSupports.namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) : Finset ℝ² :=
  {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint,
    source.1, source'.1, E.commonFourth,
    Pρ.source₁, Pρ.source₂, E.oppositeFourth}

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The first collision row is contained in the crossed named seed. -/
theorem FirstFiberCrossedThreeRowExactSupports.firstRow_support_subset_namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support ⊆
      FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
  rw [E.firstRow_support_eq]
  intro z hz
  simp only [Finset.mem_insert, Finset.mem_singleton] at hz
  rcases hz with rfl | rfl | rfl | rfl <;>
    simp [FirstFiberCrossedThreeRowExactSupports.namedSeed]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The common crossed row is contained in the crossed named seed. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonRow_support_subset_namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support ⊆
      FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
  rw [E.commonRow_support_eq]
  intro z hz
  rcases outside_orientation with h | h
  · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
      h.1, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    aesop
  · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
      h.1, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    aesop

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The opposite collision row is contained in the crossed named seed. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeRow_support_subset_namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support ⊆
      FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
  rw [E.oppositeRow_support_eq]
  intro z hz
  rcases outside_orientation with h | h
  · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
      h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    aesop
  · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
      h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    aesop

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The generic triple-shell seed is exactly the ten named crossed-row roles.
This is the missing label transport needed before a finite consumer may split
on the center selected by the global minimality producer. -/
theorem FirstFiberCrossedThreeRowExactSupports.tripleShellSeed_eq_namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    freshThirdCriticalTripleShellSeed P Pρ source =
      FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
  rw [freshThirdCriticalTripleShellSeed, E.firstRow_support_eq,
    E.oppositeRow_support_eq, E.commonRow_support_eq]
  rcases outside_orientation with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
    ext z <;> simp [FirstFiberCrossedThreeRowExactSupports.namedSeed] <;> tauto

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Neither non-first indexed apex occurs among the ten crossed-row roles.
This converts cap placement into the two center exclusions needed by the
six-center faithful boundary. -/
theorem FirstFiberCrossedThreeRowExactSupports.fixedApexes_not_mem_namedSeed
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    S.oppApex2 ∉ FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E ∧
      S.surplusApex ∉ FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
  have hA2NotInterior :
      S.oppApex2 ∉ S.capInteriorByIndex S.oppIndex1 := by
    intro hx
    exact
      (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
        (i := S.oppIndex1) (j := S.oppIndex2) hx) (by simp)
  have hA3NotInterior :
      S.surplusApex ∉ S.capInteriorByIndex S.oppIndex1 := by
    intro hx
    exact
      (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
        (i := S.oppIndex1) (j := S.surplusIdx) hx) (by simp)
  have hA2Cap : S.oppApex2 ∈ S.capByIndex S.oppIndex1 := by
    have h := S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
    rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2] at h
    simpa using h
  have hA3Cap : S.surplusApex ∈ S.capByIndex S.oppIndex1 := by
    have h := S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex1
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx] at h
    simpa using h
  have houtside :=
    freshOutsideFirstBlockerFiber_outsidePoints_ne_firstCapEndpoints
      (P := P) (Pρ := Pρ) Q
  have hA2 :
      P.source₁ ≠ S.oppApex2 ∧ P.source₂ ≠ S.oppApex2 ∧
      Q.source.1 ≠ S.oppApex2 ∧ Q.otherOutsidePoint ≠ S.oppApex2 ∧
      source.1 ≠ S.oppApex2 ∧ source'.1 ≠ S.oppApex2 ∧
      E.commonFourth ≠ S.oppApex2 ∧
      Pρ.source₁ ≠ S.oppApex2 ∧ Pρ.source₂ ≠ S.oppApex2 ∧
      E.oppositeFourth ≠ S.oppApex2 := by
    exact ⟨ne_of_mem_of_not_mem P.source₁_mem_capInterior hA2NotInterior,
      ne_of_mem_of_not_mem P.source₂_mem_capInterior hA2NotInterior,
      houtside.1.1, houtside.2.1,
      ne_of_mem_of_not_mem source_witness.2.1 hA2NotInterior,
      ne_of_mem_of_not_mem source'_witness.2.1 hA2NotInterior,
      (ne_of_mem_of_not_mem hA2Cap E.commonFourth_not_mem_firstCap).symm,
      ne_of_mem_of_not_mem Pρ.source₁_mem_capInterior hA2NotInterior,
      ne_of_mem_of_not_mem Pρ.source₂_mem_capInterior hA2NotInterior,
      (ne_of_mem_of_not_mem hA2Cap E.oppositeFourth_not_mem_firstCap).symm⟩
  have hA3 :
      P.source₁ ≠ S.surplusApex ∧ P.source₂ ≠ S.surplusApex ∧
      Q.source.1 ≠ S.surplusApex ∧ Q.otherOutsidePoint ≠ S.surplusApex ∧
      source.1 ≠ S.surplusApex ∧ source'.1 ≠ S.surplusApex ∧
      E.commonFourth ≠ S.surplusApex ∧
      Pρ.source₁ ≠ S.surplusApex ∧ Pρ.source₂ ≠ S.surplusApex ∧
      E.oppositeFourth ≠ S.surplusApex := by
    exact ⟨ne_of_mem_of_not_mem P.source₁_mem_capInterior hA3NotInterior,
      ne_of_mem_of_not_mem P.source₂_mem_capInterior hA3NotInterior,
      houtside.1.2, houtside.2.2,
      ne_of_mem_of_not_mem source_witness.2.1 hA3NotInterior,
      ne_of_mem_of_not_mem source'_witness.2.1 hA3NotInterior,
      (ne_of_mem_of_not_mem hA3Cap E.commonFourth_not_mem_firstCap).symm,
      ne_of_mem_of_not_mem Pρ.source₁_mem_capInterior hA3NotInterior,
      ne_of_mem_of_not_mem Pρ.source₂_mem_capInterior hA3NotInterior,
      (ne_of_mem_of_not_mem hA3Cap E.oppositeFourth_not_mem_firstCap).symm⟩
  constructor
  · simpa [FirstFiberCrossedThreeRowExactSupports.namedSeed] using
      And.intro hA2.1.symm
        ⟨hA2.2.1.symm, hA2.2.2.1.symm, hA2.2.2.2.1.symm,
          hA2.2.2.2.2.1.symm, hA2.2.2.2.2.2.1.symm,
          hA2.2.2.2.2.2.2.1.symm, hA2.2.2.2.2.2.2.2.1.symm,
          hA2.2.2.2.2.2.2.2.2.1.symm,
          hA2.2.2.2.2.2.2.2.2.2.symm⟩
  · simpa [FirstFiberCrossedThreeRowExactSupports.namedSeed] using
      And.intro hA3.1.symm
        ⟨hA3.2.1.symm, hA3.2.2.1.symm, hA3.2.2.2.1.symm,
          hA3.2.2.2.2.1.symm, hA3.2.2.2.2.2.1.symm,
          hA3.2.2.2.2.2.2.1.symm, hA3.2.2.2.2.2.2.2.1.symm,
          hA3.2.2.2.2.2.2.2.2.1.symm,
          hA3.2.2.2.2.2.2.2.2.2.symm⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The minimality-selected center in the crossed three-row seed can be made
fully finite and avoids all three centers of the rows forming that seed.

This is a source-clean producer, not a contradiction.  Its last field remains
universal over every selected four-class at the pinned center, allowing a
later consumer to choose the physical row suited to its incidence arm. -/
theorem exists_freshThird_crossed_pinnedCenter_allRows_escape_namedSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    ∃ center : ℝ²,
      center ∈ FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E ∧
      center ∈ D.A ∧
      center ≠ H.centerAt P.source₁ P.source₁_mem_A ∧
      center ≠ H.centerAt source.1 source.2 ∧
      center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
      ∀ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ FirstFiberCrossedThreeRowExactSupports.namedSeed
              (P := P) (Pρ := Pρ) Q source source'
              commonOutside oppositeOutside E := by
  rcases
      exists_freshThird_pinnedCenter_allRows_escape_tripleShellSeed
        (P := P) (Pρ := Pρ) (hlarge := hlarge) source with
    ⟨center, hcenterSeed, hcenterA, hEveryRowEscapes⟩
  have hseedEq :=
    FirstFiberCrossedThreeRowExactSupports.tripleShellSeed_eq_namedSeed
      (P := P) (Pρ := Pρ) Q source source'
      commonOutside oppositeOutside outside_orientation E
  have hcenterNamed :
      center ∈ FirstFiberCrossedThreeRowExactSupports.namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E := by
    rw [← hseedEq]
    exact hcenterSeed
  have havoid_of_support_subset
      (c : ℝ²) (K : SelectedFourClass D.A c)
      (hKsub : K.support ⊆ freshThirdCriticalTripleShellSeed P Pρ source) :
      center ≠ c := by
    intro hcenterEq
    subst center
    rcases hEveryRowEscapes K with ⟨z, hzK, hzOutside⟩
    exact hzOutside (hKsub hzK)
  let Kfirst :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
  let Kcommon :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  let Kopposite :=
    (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell
  have hfirstSub :
      Kfirst.toSelectedFourClass.support ⊆
        freshThirdCriticalTripleShellSeed P Pρ source := by
    intro z hz
    exact Finset.mem_union_left _ (Finset.mem_union_left _ hz)
  have hcommonSub :
      Kcommon.toSelectedFourClass.support ⊆
        freshThirdCriticalTripleShellSeed P Pρ source := by
    intro z hz
    exact Finset.mem_union_right _ hz
  have hoppositeSub :
      Kopposite.toSelectedFourClass.support ⊆
        freshThirdCriticalTripleShellSeed P Pρ source := by
    intro z hz
    exact Finset.mem_union_left _ (Finset.mem_union_right _ hz)
  refine ⟨center, hcenterNamed, hcenterA,
    havoid_of_support_subset _ Kfirst.toSelectedFourClass hfirstSub,
    havoid_of_support_subset _ Kcommon.toSelectedFourClass hcommonSub,
    havoid_of_support_subset _ Kopposite.toSelectedFourClass hoppositeSub, ?_⟩
  intro K
  rcases hEveryRowEscapes K with ⟨z, hzK, hzOutside⟩
  exact ⟨z, hzK, by simpa only [← hseedEq] using hzOutside⟩

/-- A bounded finite ingress extracted from the crossed three-row residual.
The center is one of the ten named seed roles, while `row` is an exact
four-point class at that center with a witnessed support point outside the
seed.  No distinctness among the ten role labels is assumed here. -/
structure FirstFiberCrossedPinnedEscapeRow
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) : Type where
  center : ℝ²
  center_mem_namedSeed :
    center ∈ FirstFiberCrossedThreeRowExactSupports.namedSeed
      (P := P) (Pρ := Pρ) Q source source'
      commonOutside oppositeOutside E
  center_mem_A : center ∈ D.A
  center_ne_firstRowCenter :
    center ≠ H.centerAt P.source₁ P.source₁_mem_A
  center_ne_commonRowCenter : center ≠ H.centerAt source.1 source.2
  center_ne_oppositeRowCenter :
    center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A
  row : SelectedFourClass D.A center
  escapePoint : ℝ²
  escapePoint_mem_row : escapePoint ∈ row.support
  escapePoint_not_mem_namedSeed :
    escapePoint ∉ FirstFiberCrossedThreeRowExactSupports.namedSeed
      (P := P) (Pρ := Pρ) Q source source'
      commonOutside oppositeOutside E

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global K4 chooses one exact row from the universal escaping-row producer.
This theorem is finite ingress only: it neither supplies a contradiction nor
identifies `row` with an actual-blocker-selected row. -/
theorem exists_freshThird_crossed_pinnedEscapeRow
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    Nonempty (FirstFiberCrossedPinnedEscapeRow
      P Pρ Q source source' commonOutside oppositeOutside E) := by
  rcases
      exists_freshThird_crossed_pinnedCenter_allRows_escape_namedSeed
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E with
    ⟨center, hcenterSeed, hcenterA, hcenterNeFirst,
      hcenterNeCommon, hcenterNeOpposite, hEveryRowEscapes⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4 hcenterA with ⟨K⟩
  rcases hEveryRowEscapes K with ⟨z, hzK, hzOutside⟩
  exact ⟨{
    center := center
    center_mem_namedSeed := hcenterSeed
    center_mem_A := hcenterA
    center_ne_firstRowCenter := hcenterNeFirst
    center_ne_commonRowCenter := hcenterNeCommon
    center_ne_oppositeRowCenter := hcenterNeOpposite
    row := K
    escapePoint := z
    escapePoint_mem_row := hzK
    escapePoint_not_mem_namedSeed := hzOutside }⟩

/-- The faithful-pattern version of the crossed escaping-row ingress.

Unlike `FirstFiberCrossedPinnedEscapeRow`, the row here is not chosen
independently by global K4: it is exactly the class already selected by the
given carrier-wide faithful pattern.  This is still a producer only. -/
structure FirstFiberCrossedFaithfulPatternEscape
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A) : Type where
  center : ℝ²
  center_mem_namedSeed :
    center ∈ FirstFiberCrossedThreeRowExactSupports.namedSeed
      (P := P) (Pρ := Pρ) Q source source'
      commonOutside oppositeOutside E
  center_mem_A : center ∈ D.A
  center_ne_firstRowCenter :
    center ≠ H.centerAt P.source₁ P.source₁_mem_A
  center_ne_commonRowCenter : center ≠ H.centerAt source.1 source.2
  center_ne_oppositeRowCenter :
    center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A
  escapePoint : ℝ²
  escapePoint_mem_classAt :
    escapePoint ∈
      (carrierPattern.classAt center center_mem_A).support
  escapePoint_not_mem_namedSeed :
    escapePoint ∉ FirstFiberCrossedThreeRowExactSupports.namedSeed
      (P := P) (Pρ := Pρ) Q source source'
      commonOutside oppositeOutside E

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Instantiate the universal crossed escape producer with the class chosen by
an existing carrier-wide faithful pattern. -/
theorem exists_freshThird_crossed_faithfulPatternEscape
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A) :
    Nonempty (FirstFiberCrossedFaithfulPatternEscape
      P Pρ Q source source' commonOutside oppositeOutside E
      carrierPattern) := by
  rcases
      exists_freshThird_crossed_pinnedCenter_allRows_escape_namedSeed
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E with
    ⟨center, hcenterSeed, hcenterA, hcenterNeFirst,
      hcenterNeCommon, hcenterNeOpposite, hEveryRowEscapes⟩
  rcases hEveryRowEscapes
      (carrierPattern.classAt center hcenterA) with
    ⟨z, hzClass, hzOutside⟩
  exact ⟨{
    center := center
    center_mem_namedSeed := hcenterSeed
    center_mem_A := hcenterA
    center_ne_firstRowCenter := hcenterNeFirst
    center_ne_commonRowCenter := hcenterNeCommon
    center_ne_oppositeRowCenter := hcenterNeOpposite
    escapePoint := z
    escapePoint_mem_classAt := hzClass
    escapePoint_not_mem_namedSeed := hzOutside }⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The point escaping the ten named crossed-row roles is still a carrier
point, because it belongs to a class of the faithful carrier pattern. -/
theorem FirstFiberCrossedFaithfulPatternEscape.escapePoint_mem_A
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (X : FirstFiberCrossedFaithfulPatternEscape
      P Pρ Q source source' commonOutside oppositeOutside E
      carrierPattern) :
    X.escapePoint ∈ D.A :=
  (carrierPattern.classAt X.center X.center_mem_A).support_subset_A
    X.escapePoint_mem_classAt

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Escaping the crossed named seed omits the two retained collision rows and
the selected row at the chosen cap source. -/
theorem FirstFiberCrossedFaithfulPatternEscape.escapePoint_not_mem_sourceRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (X : FirstFiberCrossedFaithfulPatternEscape
      P Pρ Q source source' commonOutside oppositeOutside E
      carrierPattern) :
    X.escapePoint ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      X.escapePoint ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      X.escapePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  refine ⟨?_, ?_, ?_⟩
  · exact fun hz ↦ X.escapePoint_not_mem_namedSeed
      (E.firstRow_support_subset_namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside hz)
  · exact fun hz ↦ X.escapePoint_not_mem_namedSeed
      (E.oppositeRow_support_subset_namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside outside_orientation hz)
  · exact fun hz ↦ X.escapePoint_not_mem_namedSeed
      (E.commonRow_support_subset_namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside outside_orientation hz)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The actual blocker of the faithful-pattern escape point is a genuinely
seventh center: it is distinct from the three crossed-row centers and from
all three deletion-robust indexed apices. -/
theorem FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (X : FirstFiberCrossedFaithfulPatternEscape
      P Pρ Q source source' commonOutside oppositeOutside E
      carrierPattern) :
    H.centerAt X.escapePoint X.escapePoint_mem_A ≠
        H.centerAt source.1 source.2 ∧
      H.centerAt X.escapePoint X.escapePoint_mem_A ≠ S.oppApex1 ∧
      H.centerAt X.escapePoint X.escapePoint_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A ∧
      H.centerAt X.escapePoint X.escapePoint_mem_A ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
      H.centerAt X.escapePoint X.escapePoint_mem_A ≠ S.oppApex2 ∧
      H.centerAt X.escapePoint X.escapePoint_mem_A ≠ S.surplusApex := by
  have hzA : X.escapePoint ∈ D.A := X.escapePoint_mem_A
  have hneOfSupportSubset
      (c : CriticalShellSystem.CarrierVertex D.A)
      (hsubset :
        (H.selectedAt c.1 c.2).toCriticalFourShell.support ⊆
          FirstFiberCrossedThreeRowExactSupports.namedSeed
            (P := P) (Pρ := Pρ) Q source source'
            commonOutside oppositeOutside E) :
      H.centerAt X.escapePoint hzA ≠ H.centerAt c.1 c.2 := by
    intro hcenter
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
        hzA c.2 hcenter
    apply X.escapePoint_not_mem_namedSeed
    apply hsubset
    rw [← hsupports]
    exact (H.selectedAt X.escapePoint hzA).toCriticalFourShell.q_mem_support
  have hcommonSubset :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ⊆
        FirstFiberCrossedThreeRowExactSupports.namedSeed
          (P := P) (Pρ := Pρ) Q source source'
          commonOutside oppositeOutside E := by
    rw [E.commonRow_support_eq]
    intro z hz
    rcases outside_orientation with h | h
    · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
        h.1, h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      aesop
    · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
        h.1, h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      aesop
  have hfirstSubset :
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support ⊆
        FirstFiberCrossedThreeRowExactSupports.namedSeed
          (P := P) (Pρ := Pρ) Q source source'
          commonOutside oppositeOutside E := by
    rw [E.firstRow_support_eq]
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl <;>
      simp [FirstFiberCrossedThreeRowExactSupports.namedSeed]
  have hoppositeSubset :
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support ⊆
        FirstFiberCrossedThreeRowExactSupports.namedSeed
          (P := P) (Pρ := Pρ) Q source source'
          commonOutside oppositeOutside E := by
    rw [E.oppositeRow_support_eq]
    intro z hz
    rcases outside_orientation with h | h
    · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
        h.1, h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      aesop
    · simp only [FirstFiberCrossedThreeRowExactSupports.namedSeed,
        h.1, h.2, Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      aesop
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  exact ⟨hneOfSupportSubset source hcommonSubset,
    hrobust₁.centerAt_ne H X.escapePoint hzA,
    hneOfSupportSubset ⟨P.source₁, P.source₁_mem_A⟩ hfirstSubset,
    hneOfSupportSubset ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ hoppositeSubset,
    hrobust₂.centerAt_ne H X.escapePoint hzA,
    hrobust₃.centerAt_ne H X.escapePoint hzA⟩

/-- Six installed exact rows together with the crossed-row escape and its
actual blocker outside all six installed centers.  The escape and boundary
share one faithful carrier pattern, so no row-selection compatibility is lost.
This is a consumer-facing residual, not a contradiction. -/
structure FirstFiberCrossedSeventhBlockerBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (q : ℝ²) (hq : q ∈ D.A) (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Type where
  boundary :
    ATailFiveCenterDeletionBoundary.SixCenterFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄ c₅
  escape : FirstFiberCrossedFaithfulPatternEscape
    P Pρ Q source source' commonOutside oppositeOutside E
    boundary.carrierPattern
  escapePoint_mem_A : escape.escapePoint ∈ D.A
  actualBlocker_not_mem_centers :
    H.centerAt escape.escapePoint escapePoint_mem_A ∉
      ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The faithful carrier pattern's row at the escaping point's actual blocker
is the canonical selected shell, so it contains the escaping point itself. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.escapePoint_mem_actualBlockerClass
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅) :
    B₇.escape.escapePoint ∈
      (B₇.boundary.carrierPattern.classAt
        (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
        (Census554.GeneralCarrierBridge.blockerLabel H
          B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support := by
  let z : Census554.GeneralCarrierBridge.CarrierLabel D.A :=
    ⟨B₇.escape.escapePoint, B₇.escapePoint_mem_A⟩
  have hz := Census554.GeneralCarrierBridge.source_mem_blocker_row
    B₇.boundary.carrierPattern H z
  exact (Census554.GeneralCarrierBridge.mem_rowPattern_iff
    B₇.boundary.carrierPattern
    (Census554.GeneralCarrierBridge.blockerLabel H z.1 z.2) z).mp hz

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The escaping faithful row and the canonical row at its actual blocker
either have the same center, or meet in exactly the source-entitled range of
one or two points.  This is the normalized positive-incidence ingress for
generic equality-core consumers. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.escapeRow_actualBlockerRow_dichotomy
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅) :
    B₇.escape.center =
        H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A ∨
      (1 ≤
          ((B₇.boundary.carrierPattern.classAt
              B₇.escape.center B₇.escape.center_mem_A).support ∩
            (B₇.boundary.carrierPattern.classAt
              (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
              (Census554.GeneralCarrierBridge.blockerLabel H
                B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support).card ∧
        ((B₇.boundary.carrierPattern.classAt
              B₇.escape.center B₇.escape.center_mem_A).support ∩
            (B₇.boundary.carrierPattern.classAt
              (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
              (Census554.GeneralCarrierBridge.blockerLabel H
                B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support).card ≤ 2) := by
  classical
  by_cases hcenter : B₇.escape.center =
      H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A
  · exact Or.inl hcenter
  · right
    let K := B₇.boundary.carrierPattern.classAt
      B₇.escape.center B₇.escape.center_mem_A
    let L := B₇.boundary.carrierPattern.classAt
      (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
      (Census554.GeneralCarrierBridge.blockerLabel H
        B₇.escape.escapePoint B₇.escapePoint_mem_A).2
    have hzK : B₇.escape.escapePoint ∈ K.support :=
      B₇.escape.escapePoint_mem_classAt
    have hzL : B₇.escape.escapePoint ∈ L.support := by
      exact B₇.escapePoint_mem_actualBlockerClass
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside E
    have hinterNonempty : (K.support ∩ L.support).Nonempty :=
      ⟨B₇.escape.escapePoint, Finset.mem_inter.mpr ⟨hzK, hzL⟩⟩
    have hinterPos : 0 < (K.support ∩ L.support).card :=
      Finset.card_pos.mpr hinterNonempty
    have hinterLe : (K.support ∩ L.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two K L hcenter
    simpa [K, L] using And.intro hinterPos hinterLe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In the equal-center arm of the escaping-row dichotomy, the faithful
escaping row is exactly the canonical row at the escaping point's actual
blocker.  Equality transports the complete support, rather than only the
known escaping point. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.escapeRow_support_eq_actualBlockerRow_of_center_eq
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅)
    (hcenter : B₇.escape.center =
      H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A) :
    (B₇.boundary.carrierPattern.classAt
        B₇.escape.center B₇.escape.center_mem_A).support =
      (B₇.boundary.carrierPattern.classAt
        (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
        (Census554.GeneralCarrierBridge.blockerLabel H
          B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support := by
  exact FaithfulCarrierPattern.classAt_support_congr
    B₇.boundary.carrierPattern
    B₇.escape.center_mem_A
    (Census554.GeneralCarrierBridge.blockerLabel H
      B₇.escape.escapePoint B₇.escapePoint_mem_A).2
    hcenter

/-- Upstream theorem-facing packet for adjoining one q-deleted row to a
five-survivor boundary.  The downstream U3 module can forget this wrapper into
its `SixSurvivorExactRowsBoundary`; keeping the packet here avoids an import
cycle through `TwoSourceClosure`. -/
structure SeventhBlockerQDeletedSixthRowBoundary
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Type where
  firstFive :
    ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄
  B₅ : Finset ℝ²
  K₅ : U5QDeletedK4Class D deleted.1 c₅ B₅
  B₅_card : B₅.card = 4
  actualBlocker_ne₅ : H.centerAt deleted.1 deleted.2 ≠ c₅
  centers_card : ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The seventh canonical row either contains the point deleted by the
six-center boundary, or it is a genuine sixth surviving q-deleted row.

The second arm is the exact ingress expected by the existing U3 reduction.
The equality identifying the sixth old center with the deleted point's actual
blocker is explicit because `SixCenterFaithfulCarrierBoundary` deliberately
keeps its extra class generic. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_sixSurvivor
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅)
    (hblockerEq : H.centerAt q hq = c₅) :
    q ∈
        (B₇.boundary.carrierPattern.classAt
          (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
          (Census554.GeneralCarrierBridge.blockerLabel H
            B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support ∨
      Nonempty
        (SeventhBlockerQDeletedSixthRowBoundary (D := D) (H := H) ⟨q, hq⟩
          c₀ c₁ c₂ c₃ c₄
          (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)) := by
  classical
  let L := B₇.boundary.carrierPattern.classAt
    (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
    (Census554.GeneralCarrierBridge.blockerLabel H
      B₇.escape.escapePoint B₇.escapePoint_mem_A).2
  by_cases hqL : q ∈ L.support
  · exact Or.inl hqL
  · right
    let K₅ : U5QDeletedK4Class D q
        (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
        L.support := {
      subset := by
        intro y hy
        have hy_ne_center :
            y ≠ H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A :=
          fun hy_center => L.center_not_mem (hy_center ▸ hy)
        have hy_ne_q : y ≠ q := by
          intro hyq
          subst y
          exact hqL hy
        exact Finset.mem_erase.mpr
          ⟨hy_ne_center, Finset.mem_erase.mpr ⟨hy_ne_q, L.support_subset_A hy⟩⟩
      card_four := le_of_eq L.support_card.symm
      q_not_mem := hqL
      radius := L.radius
      radius_pos := L.radius_pos
      same_radius := L.support_eq_radius
    }
    have hbaseCard :
        ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5 := by
      have hfullLe :
          ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card ≤
            ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card + 1 := by
        calc
          ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card =
              (insert c₅ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²)).card := by
                apply congrArg Finset.card
                ext x
                simp only [Finset.mem_insert, Finset.mem_singleton]
                aesop
          _ ≤ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card + 1 :=
            Finset.card_insert_le c₅ _
      have h₀ := Finset.card_insert_le c₀ ({c₁, c₂, c₃, c₄} : Finset ℝ²)
      have h₁ := Finset.card_insert_le c₁ ({c₂, c₃, c₄} : Finset ℝ²)
      have h₂ := Finset.card_insert_le c₂ ({c₃, c₄} : Finset ℝ²)
      have h₃ := Finset.card_insert_le c₃ ({c₄} : Finset ℝ²)
      have hupper :
          ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card ≤ 5 := by
        have hsingleton : ({c₄} : Finset ℝ²).card = 1 := Finset.card_singleton c₄
        omega
      have hfullCard := B₇.boundary.centers_card
      omega
    have hnewNotBase :
        H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A ∉
          ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²) := by
      intro hmem
      apply B₇.actualBlocker_not_mem_centers
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem ⊢
      aesop
    have hcenters :
        ({c₀, c₁, c₂, c₃, c₄,
            H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A} :
            Finset ℝ²).card = 6 := by
      have hreorder :
          ({c₀, c₁, c₂, c₃, c₄,
              H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A} :
              Finset ℝ²) =
            insert (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
              ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²) := by
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        aesop
      rw [hreorder, Finset.card_insert_of_notMem hnewNotBase, hbaseCard]
    have hactualBlockerNe :
        H.centerAt q hq ≠
          H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A := by
      rw [hblockerEq]
      intro hEq
      exact B₇.actualBlocker_not_mem_centers (by
        simpa [← hEq])
    exact ⟨{
      firstFive := B₇.boundary.rows
      B₅ := L.support
      K₅ := K₅
      B₅_card := L.support_card
      actualBlocker_ne₅ := hactualBlockerNe
      centers_card := hcenters
    }⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global minimality and the all-large tri-apex context give the canonical
seventh blocker row a source-faithful deletion fan.  This is the
cardinality-independent producer behind the remaining positive-incidence
search; it is not itself a contradiction. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.actualBlockerClass_deletionFan
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅) :
    SourceFaithfulSelectedFourDeletionFan D S H
      (B₇.boundary.carrierPattern.classAt
        (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
        (Census554.GeneralCarrierBridge.blockerLabel H
          B₇.escape.escapePoint B₇.escapePoint_mem_A).2) := by
  let G : TriApexAllLargeContext D S :=
    triApexAllLargeContext_of_residuals L N T
  exact sourceFaithfulDeletionFan_of_triApexAllLargeContext G _

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global minimality also gives a source-faithful deletion fan on the
escaping faithful class itself.  This is distinct from the fan on the
escaping point's canonical actual-blocker row above: the two row centers may
coincide, but the current source interface does not force that equality. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.escapeClass_deletionFan
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅) :
    SourceFaithfulSelectedFourDeletionFan D S H
      (B₇.boundary.carrierPattern.classAt
        B₇.escape.center B₇.escape.center_mem_A) := by
  let G : TriApexAllLargeContext D S :=
    triApexAllLargeContext_of_residuals L N T
  exact sourceFaithfulDeletionFan_of_triApexAllLargeContext G _

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the escaping faithful class is centered at the first indexed apex,
the source-faithful fan cannot take its nonrobust-center arm.  First-apex
richness therefore produces two row points with distinct actual blockers and
source-entitled cross-deletion rows in both directions. -/
theorem
    FirstFiberCrossedSeventhBlockerBoundary.exists_mutualCrossDeletionRows_of_escapeCenter_eq_oppApex1
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅)
    (hcenter : B₇.escape.center = S.oppApex1) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ (B₇.boundary.carrierPattern.classAt
          B₇.escape.center B₇.escape.center_mem_A).support ∧
      w.1 ∈ (B₇.boundary.carrierPattern.classAt
          B₇.escape.center B₇.escape.center_mem_A).support ∧
      z ≠ w ∧
        w.1 ∉ (H.selectedAt z.1 z.2).toCriticalFourShell.support ∧
        z.1 ∉ (H.selectedAt w.1 w.2).toCriticalFourShell.support ∧
        (∃ Kz : SelectedFourClass D.A (H.centerAt z.1 z.2),
          w.1 ∉ Kz.support) ∧
        (∃ Kw : SelectedFourClass D.A (H.centerAt w.1 w.2),
          z.1 ∉ Kw.support) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  let Row := B₇.boundary.carrierPattern.classAt
    B₇.escape.center B₇.escape.center_mem_A
  have hfan : SourceFaithfulSelectedFourDeletionFan D S H Row :=
    B₇.escapeClass_deletionFan
      (P := P) (Pρ := Pρ) (T := T) Q source source'
      commonOutside oppositeOutside E
  rcases
      nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan
        Row hfan with
    hnotRobust | hrows
  · have hrobust : FullyDeletionRobustAt D B₇.escape.center := by
      rw [hcenter]
      exact fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
    exact (hnotRobust hrobust).elim
  · simpa [Row] using hrows

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct points of the canonical seventh row have actual blockers in
one strict indexed cap, with the complete source-faithful five-arm outcome.
This packages the strongest existing carrier-wide consequence of the new
seventh blocker without adding a finite-cardinality assumption. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.exists_repeatedBlockerCap_pair_outcome
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ (B₇.boundary.carrierPattern.classAt
          (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
          (Census554.GeneralCarrierBridge.blockerLabel H
            B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support ∧
      w.1 ∈ (B₇.boundary.carrierPattern.classAt
          (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
          (Census554.GeneralCarrierBridge.blockerLabel H
            B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support ∧
      z ≠ w ∧
        ∃ blockerCap : Fin 3,
          H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
          H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
            (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
              z.1 ∈ S.capByIndex blockerCap ∨
              w.1 ∈ S.capByIndex blockerCap ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  exact ATailFrontierLiveClosure.exists_repeatedBlockerCap_pair_outcome _
    (B₇.actualBlockerClass_deletionFan
      (P := P) (Pρ := Pρ) (T := T) Q source source'
      commonOutside oppositeOutside E)

/-- The four deletion arms after adjoining the source-clean seventh-blocker
escape packet to their six exact faithful rows. -/
abbrev FirstFiberCollisionCrossedSeventhBlockerResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) : Prop :=
  Nonempty
      (FirstFiberCrossedSeventhBlockerBoundary
        P Pρ Q source source' commonOutside oppositeOutside E
        P.source₁ P.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (FirstFiberCrossedSeventhBlockerBoundary
        P Pρ Q source source' commonOutside oppositeOutside E
        Pρ.source₁ Pρ.source₁_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)) ∨
    Nonempty
      (FirstFiberCrossedSeventhBlockerBoundary
        P Pρ Q source source' commonOutside oppositeOutside E
        P.source₂ P.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex
        (H.centerAt P.source₁ P.source₁_mem_A)) ∨
    Nonempty
      (FirstFiberCrossedSeventhBlockerBoundary
        P Pρ Q source source' commonOutside oppositeOutside E
        Pρ.source₂ Pρ.source₂_mem_A
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The faithful-pattern escape center is either the first indexed apex or is
distinct from every center occurring in any arm of the six-center boundary. -/
theorem FirstFiberCrossedFaithfulPatternEscape.center_eq_oppApex1_or_ne_sixCenters
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (X : FirstFiberCrossedFaithfulPatternEscape
      P Pρ Q source source' commonOutside oppositeOutside E
      carrierPattern) :
    X.center = S.oppApex1 ∨
      (X.center ≠ H.centerAt source.1 source.2 ∧
        X.center ≠ S.oppApex1 ∧
        X.center ≠ H.centerAt P.source₁ P.source₁_mem_A ∧
        X.center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
        X.center ≠ S.oppApex2 ∧ X.center ≠ S.surplusApex) := by
  by_cases hfirstApex : X.center = S.oppApex1
  · exact Or.inl hfirstApex
  · right
    have hfixed :=
      FirstFiberCrossedThreeRowExactSupports.fixedApexes_not_mem_namedSeed
        (P := P) (Pρ := Pρ) Q source source'
        source_witness source'_witness commonOutside oppositeOutside E
    have hneApex2 : X.center ≠ S.oppApex2 := by
      intro h
      exact hfixed.1 (h ▸ X.center_mem_namedSeed)
    have hneSurplus : X.center ≠ S.surplusApex := by
      intro h
      exact hfixed.2 (h ▸ X.center_mem_namedSeed)
    exact ⟨X.center_ne_commonRowCenter, hfirstApex,
      X.center_ne_firstRowCenter, X.center_ne_oppositeRowCenter,
      hneApex2, hneSurplus⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Any off-cap carrier point other than the two named points in the enlarged
first-blocker row has actual blocker distinct from the first collision
blocker.  This is the row-locking fact behind both crossed fourth-point
specializations below. -/
theorem offCapPoint_blocker_ne_first_of_ne_outsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {z : ℝ²}
    (hzA : z ∈ D.A)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1)
    (hzNeSource : z ≠ Q.source.1)
    (hzNeOther : z ≠ Q.otherOutsidePoint) :
    H.blockerVertex ⟨z, hzA⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  intro hblockers
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      hzA P.source₁_mem_A (congrArg Subtype.val hblockers)
  have hzFirstRow :
      z ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hsupports]
    exact (H.selectedAt z hzA).toCriticalFourShell.q_mem_support
  have hzPair :
      z ∈ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
    rw [← Q.outside_eq_pair]
    exact Finset.mem_sdiff.mpr ⟨hzFirstRow, hzOutside⟩
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
  rcases hzPair with hz | hz
  · exact hzNeSource hz
  · exact hzNeOther hz

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unnamed point of the common crossed row is not in the first actual
blocker fiber. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonFourth_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  have hmem :
      E.commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  have hneCommon : E.commonFourth ≠ commonOutside := by
    intro h
    apply E.commonFourth_not_mem_named
    simp [h]
  have hneOpposite : E.commonFourth ≠ oppositeOutside := by
    intro h
    apply E.oppositeOutside_not_mem_commonRow
    rw [← h]
    exact hmem
  rcases outside_orientation with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.commonFourth_mem_A
      E.commonFourth_not_mem_firstCap hneCommon hneOpposite
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.commonFourth_mem_A
      E.commonFourth_not_mem_firstCap hneOpposite hneCommon

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The unnamed point of the opposite crossed row is not in the first actual
blocker fiber. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeFourth_blocker_ne_first
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ := by
  have hmem :
      E.oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hneCommon : E.oppositeFourth ≠ commonOutside := by
    intro h
    apply E.commonOutside_not_mem_oppositeRow
    rw [← h]
    exact hmem
  have hneOpposite : E.oppositeFourth ≠ oppositeOutside := by
    intro h
    apply E.oppositeFourth_not_mem_named
    simp [h]
  rcases outside_orientation with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.oppositeFourth_mem_A
      E.oppositeFourth_not_mem_firstCap hneCommon hneOpposite
  · exact offCapPoint_blocker_ne_first_of_ne_outsidePair
      (P := P) (Pρ := Pρ) Q E.oppositeFourth_mem_A
      E.oppositeFourth_not_mem_firstCap hneOpposite hneCommon

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the unnamed point of the opposite row has the common source blocker,
support locking forces it to be the unnamed point of the common row.  Thus
the only common-blocker arm is exactly the shared-fourth occurrence needed by
the three-row Kalmanson consumer. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeFourth_eq_commonFourth_of_blocker_eq
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (hblocker :
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
        H.blockerVertex source) :
    E.oppositeFourth = E.commonFourth := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      E.oppositeFourth_mem_A source.2 (congrArg Subtype.val hblocker)
  have hmemCommon :
      E.oppositeFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [← hsupports]
    exact
      (H.selectedAt E.oppositeFourth
        E.oppositeFourth_mem_A).toCriticalFourShell.q_mem_support
  have hmemOpposite :
      E.oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  rw [E.commonRow_support_eq] at hmemCommon
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmemCommon
  rcases hmemCommon with hsource | hsource' | houtside | hfourth
  · exfalso
    apply E.oppositeFourth_not_mem_firstCap
    rw [hsource]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      source_witness.2.1
  · exfalso
    apply E.oppositeFourth_not_mem_firstCap
    rw [hsource']
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      source'_witness.2.1
  · exfalso
    apply E.commonOutside_not_mem_oppositeRow
    rw [← houtside]
    exact hmemOpposite
  · exact hfourth

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Symmetrically, if the unnamed point of the common row has the opposite
collision blocker, support locking forces the same shared-fourth occurrence. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonFourth_eq_oppositeFourth_of_blocker_eq
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (hblocker :
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) :
    E.commonFourth = E.oppositeFourth := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
      E.commonFourth_mem_A Pρ.source₁_mem_A
      (congrArg Subtype.val hblocker)
  have hmemOpposite :
      E.commonFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hsupports]
    exact
      (H.selectedAt E.commonFourth
        E.commonFourth_mem_A).toCriticalFourShell.q_mem_support
  have hmemCommon :
      E.commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  rw [E.oppositeRow_support_eq] at hmemOpposite
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmemOpposite
  rcases hmemOpposite with hsource₁ | hsource₂ | houtside | hfourth
  · exfalso
    apply E.commonFourth_not_mem_firstCap
    rw [hsource₁]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  · exfalso
    apply E.commonFourth_not_mem_firstCap
    rw [hsource₂]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  · exfalso
    apply E.oppositeOutside_not_mem_commonRow
    rw [← houtside]
    exact hmemCommon
  · exact hfourth

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The opposite unnamed point either supplies the shared fourth occurrence,
or its actual blocker is genuinely new relative to the common crossed row.
This isolates the exact complement that a blocker-map saturation argument must
eliminate. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_oppositeFourth_blocker_ne_common
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.oppositeFourth = E.commonFourth ∨
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
        H.blockerVertex source := by
  by_cases hblocker :
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
        H.blockerVertex source
  · exact Or.inl
      (FirstFiberCrossedThreeRowExactSupports.oppositeFourth_eq_commonFourth_of_blocker_eq
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (source_witness := source_witness)
        (source'_witness := source'_witness) (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) hblocker)
  · exact Or.inr hblocker

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Symmetrically, the common unnamed point either supplies the shared fourth
occurrence, or its actual blocker is genuinely new relative to the opposite
collision row. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_commonFourth_blocker_ne_opposite
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ := by
  by_cases hblocker :
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
        H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  · exact Or.inl
      (FirstFiberCrossedThreeRowExactSupports.commonFourth_eq_oppositeFourth_of_blocker_eq
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) hblocker)
  · exact Or.inr hblocker

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Canonical blocker-map frontier for a crossed exact-support packet.  Either
the two unnamed support points coincide, or each of their actual blockers
avoids the two already named row blockers that support locking can exclude.
The latter conjunction is the finite saturation residual still requiring a
positive producer. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_crossBlockers_avoid_namedRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      ((H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
            H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
          H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
            H.blockerVertex source) ∧
        (H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
            H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
          H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
            H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)) := by
  rcases
      FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_oppositeFourth_blocker_ne_common
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (source_witness := source_witness)
        (source'_witness := source'_witness) (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) with
    hshared | hoppositeCommon
  · exact Or.inl hshared.symm
  rcases
      FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_commonFourth_blocker_ne_opposite
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) with
    hshared | hcommonOpposite
  · exact Or.inl hshared
  · exact Or.inr
      ⟨⟨FirstFiberCrossedThreeRowExactSupports.oppositeFourth_blocker_ne_first
          (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
          (source' := source') (commonOutside := commonOutside)
          (oppositeOutside := oppositeOutside)
          (outside_orientation := outside_orientation) (E := E),
        hoppositeCommon⟩,
       ⟨FirstFiberCrossedThreeRowExactSupports.commonFourth_blocker_ne_first
          (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
          (source' := source') (commonOutside := commonOutside)
          (oppositeOutside := oppositeOutside)
          (outside_orientation := outside_orientation) (E := E),
        hcommonOpposite⟩⟩

/-- The complementary omission in the common row is a strict metric
non-equality, not merely absence from a selected four-subset. -/
theorem FirstFiberCrossedThreeRowExactSupports.commonRow_cross_dist_ne
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    dist (H.centerAt source.1 source.2) oppositeOutside ≠
      dist (H.centerAt source.1 source.2) commonOutside := by
  let K := (H.selectedAt source.1 source.2).toCriticalFourShell
  have hoppositeSupport :
      oppositeOutside ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hoppositeA : oppositeOutside ∈ D.A :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
        hoppositeSupport
  have hoppositeOff :
      dist (H.centerAt source.1 source.2) oppositeOutside ≠ K.radius :=
    K.dist_ne_radius_of_mem_A_not_mem_support hoppositeA
      E.oppositeOutside_not_mem_commonRow
  have hcommonSupport : commonOutside ∈ K.support := by
    rw [E.commonRow_support_eq]
    simp
  have hcommonRadius :
      dist (H.centerAt source.1 source.2) commonOutside = K.radius :=
    K.support_eq_radius commonOutside hcommonSupport
  intro hcross
  exact hoppositeOff (hcross.trans hcommonRadius)

/-- The complementary omission in the opposite row likewise gives a strict
metric non-equality against the named outside point on that row. -/
theorem FirstFiberCrossedThreeRowExactSupports.oppositeRow_cross_dist_ne
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) commonOutside ≠
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) oppositeOutside := by
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  have hcommonSupport :
      commonOutside ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [E.commonRow_support_eq]
    simp
  have hcommonA : commonOutside ∈ D.A :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support_subset_A
      hcommonSupport
  have hcommonOff :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) commonOutside ≠ K.radius :=
    K.dist_ne_radius_of_mem_A_not_mem_support hcommonA
      E.commonOutside_not_mem_oppositeRow
  have hoppositeSupport : oppositeOutside ∈ K.support := by
    rw [E.oppositeRow_support_eq]
    simp
  have hoppositeRadius :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) oppositeOutside = K.radius :=
    K.support_eq_radius oppositeOutside hoppositeSupport
  intro hcross
  exact hcommonOff (hcross.trans hoppositeRadius)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Normalize a crossed pair of positive memberships and complementary
cross-omissions to the fixed-role three-row packet.  This is source-clean
finite-set bookkeeping; the eventual contradiction still has to use the
metric equalities carried by these rows and the exact five-center deletion
packet. -/
private theorem nonempty_firstFiberCrossedThreeRowExactSupports
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (commonOutside oppositeOutside : ℝ²)
    (commonOutside_not_mem_firstCap :
      commonOutside ∉ S.capByIndex S.oppIndex1)
    (oppositeOutside_not_mem_firstCap :
      oppositeOutside ∉ S.capByIndex S.oppIndex1)
    (source'_mem_commonRow :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (commonOutside_mem :
      commonOutside ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (oppositeOutside_not_mem_commonRow :
      oppositeOutside ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (oppositeOutside_mem :
      oppositeOutside ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (commonOutside_not_mem_oppositeRow :
      commonOutside ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) :
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside) := by
  classical
  have hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 source_witness.2.1
  have hsource'Cap : source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 source'_witness.2.1
  have hsource_ne_commonOutside : source.1 ≠ commonOutside := by
    intro h
    exact commonOutside_not_mem_firstCap (h ▸ hsourceCap)
  have hsource'_ne_commonOutside : source'.1 ≠ commonOutside := by
    intro h
    exact commonOutside_not_mem_firstCap (h ▸ hsource'Cap)
  have hPρ₁Cap : Pρ.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  have hPρ₂Cap : Pρ.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  have hPρ₁_ne_oppositeOutside : Pρ.source₁ ≠ oppositeOutside := by
    intro h
    exact oppositeOutside_not_mem_firstCap (h ▸ hPρ₁Cap)
  have hPρ₂_ne_oppositeOutside : Pρ.source₂ ≠ oppositeOutside := by
    intro h
    exact oppositeOutside_not_mem_firstCap (h ▸ hPρ₂Cap)
  rcases exists_fourth_of_support_card_eq_four
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
      source.1 source'.1 commonOutside
      (H.selectedAt source.1 source.2).toCriticalFourShell.support_card
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
      source'_mem_commonRow
      commonOutside_mem sources_ne hsource_ne_commonOutside
      hsource'_ne_commonOutside with
    ⟨commonFourth, hcommonFourthFresh, hcommonSupport⟩
  rcases exists_fourth_of_support_card_eq_four
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
      Pρ.source₁ Pρ.source₂ oppositeOutside
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_card
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
      Pρ.source₂_mem_source₁_shell oppositeOutside_mem Pρ.sources_ne
      hPρ₁_ne_oppositeOutside hPρ₂_ne_oppositeOutside with
    ⟨oppositeFourth, hoppositeFourthFresh, hoppositeSupport⟩
  have hcommonFourthSupport :
      commonFourth ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rw [hcommonSupport]
    simp
  have hoppositeFourthSupport :
      oppositeFourth ∈
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [hoppositeSupport]
    simp
  have hcommonFourthOutside :
      commonFourth ∉ S.capByIndex S.oppIndex1 := by
    intro hcap
    have hinter :
        commonFourth ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hcommonFourthSupport, hcap⟩
    rw [shell_inter_cap_eq] at hinter
    apply hcommonFourthFresh
    rcases (by simpa using hinter) with h | h
    · simp [h]
    · simp [h]
  have hoppositeFourthOutside :
      oppositeFourth ∉ S.capByIndex S.oppIndex1 := by
    intro hcap
    have hinter :
        oppositeFourth ∈
          (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hoppositeFourthSupport, hcap⟩
    rw [Pρ.shell_inter_cap_eq_sources] at hinter
    apply hoppositeFourthFresh
    rcases (by simpa using hinter) with h | h
    · simp [h]
    · simp [h]
  exact ⟨{
    commonFourth := commonFourth
    oppositeFourth := oppositeFourth
    commonFourth_not_mem_named := hcommonFourthFresh
    oppositeFourth_not_mem_named := hoppositeFourthFresh
    firstRow_support_eq := firstFiber_shell_eq_explicitFour P Pρ Q
    commonRow_support_eq := hcommonSupport
    oppositeRow_support_eq := hoppositeSupport
    oppositeOutside_not_mem_commonRow := oppositeOutside_not_mem_commonRow
    commonOutside_not_mem_oppositeRow := commonOutside_not_mem_oppositeRow
    commonFourth_mem_A :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.support_subset_A
        hcommonFourthSupport
    oppositeFourth_mem_A :=
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A
        hoppositeFourthSupport
    commonFourth_not_mem_firstCap := hcommonFourthOutside
    oppositeFourth_not_mem_firstCap := hoppositeFourthOutside }⟩

/-- Fully normalized outside-pair constructor.  Its two deletion arms retain
the five exact q-free rows, while each crossed arm carries exact supports for
all three named canonical rows together with the complementary cross-omissions. -/
abbrev FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.source.1 Q.source.2
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H Q.otherOutsidePoint Q.otherOutsidePoint_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' Q.source.1 Q.otherOutsidePoint) ∨
    Nonempty
      (FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' Q.otherOutsidePoint Q.source.1)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean promotion from the raw crossed-membership split to exact
fixed-role supports.  The constructor fan-out remains two deletion arms plus
two crossed arms. -/
theorem firstFiberOutsidePair_exactRows_or_crossedThreeRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (shell_inter_cap_eq :
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (hresidual :
      FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
        P Pρ Q source) :
    FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
      P Pρ Q source source' := by
  rcases hresidual with hsource | hother | hsourceAtCommon | hotherAtCommon
  · exact Or.inl hsource
  · exact Or.inr (Or.inl hother)
  · exact Or.inr (Or.inr (Or.inl
      (nonempty_firstFiberCrossedThreeRowExactSupports
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness shell_inter_cap_eq
        Q.source.1 Q.otherOutsidePoint
        Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
        cross_membership.1 hsourceAtCommon.1 hsourceAtCommon.2.1
        hsourceAtCommon.2.2.1 hsourceAtCommon.2.2.2)))
  · exact Or.inr (Or.inr (Or.inr
      (nonempty_firstFiberCrossedThreeRowExactSupports
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness shell_inter_cap_eq
        Q.otherOutsidePoint Q.source.1
        Q.otherOutsidePoint_not_mem_firstCap Q.source_not_mem_firstCap
        cross_membership.1 hotherAtCommon.1 hotherAtCommon.2.1
        hotherAtCommon.2.2.1 hotherAtCommon.2.2.2)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiber_oppApex1_mem_A : S.oppApex1 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiber_oppApex2_mem_A : S.oppApex2 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
private theorem firstFiber_surplusApex_mem_A : S.surplusApex ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Install every exact five-center deletion arm in a faithful carrier
pattern.  Robustness separates each selected-row center from the three Moser
apices; the cap-source witness separates its blocker from either collision
blocker. -/
theorem collisionFiveCenterExactRows_to_faithfulCarrierResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (blocker_mem_capInterior :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (hexact :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    FirstFiberCollisionFiveCenterFaithfulResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  classical
  rcases source_witness with
    ⟨_, _, _, hsourceNeP, hsourceNePρ, _, _, _, _, _, _⟩
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hsourceNeApex₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source.1 source.2
  have hsourceNeApex₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source.1 source.2
  have hsourceNeApex₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source.1 source.2
  have hPNeApex₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₃ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPρNeApex₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₃ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hApex₁NeApex₂ : S.oppApex1 ≠ S.oppApex2 := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have hApex₁NeApex₃ : S.oppApex1 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1.symm
  have hApex₂NeApex₃ : S.oppApex2 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2.symm
  have hsourceBlockerMem : H.centerAt source.1 source.2 ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 blocker_mem_capInterior
  have hPBlockerMem : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 P.blocker_mem_capInterior
  have hPρBlockerMem : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ D.A :=
    S.capInteriorByIndex_subset S.oppIndex1 Pρ.blocker_mem_capInterior
  have hApex₁Mem : S.oppApex1 ∈ D.A :=
    firstFiber_oppApex1_mem_A (S := S)
  have hApex₂Mem : S.oppApex2 ∈ D.A :=
    firstFiber_oppApex2_mem_A (S := S)
  have hApex₃Mem : S.surplusApex ∈ D.A :=
    firstFiber_surplusApex_mem_A (S := S)
  have hcentersP :
      ({H.centerAt source.1 source.2, S.oppApex1,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5 := by
    simp [hsourceNeP, hsourceNeApex₁, hsourceNeApex₂,
      hsourceNeApex₃, hPNeApex₁.symm, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃]
  have hcentersPρ :
      ({H.centerAt source.1 source.2, S.oppApex1,
          H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5 := by
    simp [hsourceNePρ, hsourceNeApex₁, hsourceNeApex₂,
      hsourceNeApex₃, hPρNeApex₁.symm, hPρNeApex₂, hPρNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃]
  rcases hexact with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨E⟩
    exact Or.inl
      (E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPρBlockerMem hApex₂Mem hApex₃Mem hcentersPρ)
  · rcases hPρ₁ with ⟨E⟩
    exact Or.inr (Or.inl
      (E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPBlockerMem hApex₂Mem hApex₃Mem hcentersP))
  · rcases hP₂ with ⟨E⟩
    exact Or.inr (Or.inr (Or.inl
      (E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPρBlockerMem hApex₂Mem hApex₃Mem hcentersPρ)))
  · rcases hPρ₂ with ⟨E⟩
    exact Or.inr (Or.inr (Or.inr
      (E.toFaithfulCarrierBoundary hsourceBlockerMem hApex₁Mem
        hPBlockerMem hApex₂Mem hApex₃Mem hcentersP)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Restore the omitted collision-blocker row in every faithful five-center
deletion arm.  The deleted endpoint's actual blocker is already proved
distinct from the five surviving centers, so all six selected rows can be
installed in one faithful carrier pattern without an additional hypothesis.
This is a producer, not a contradiction. -/
theorem collisionFiveCenterFaithful_to_sixCenterFaithfulResidual
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hfaithful :
      FirstFiberCollisionFiveCenterFaithfulResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    FirstFiberCollisionSixCenterFaithfulResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  rcases hfaithful with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨B⟩
    exact Or.inl B.toActualBlockerSixCenterBoundary
  · rcases hPρ₁ with ⟨B⟩
    exact Or.inr (Or.inl B.toActualBlockerSixCenterBoundary)
  · rcases hP₂ with ⟨B⟩
    exact Or.inr (Or.inr (Or.inl (by
      simpa only [P.blockers_eq] using
        B.toActualBlockerSixCenterBoundary)))
  · rcases hPρ₂ with ⟨B⟩
    exact Or.inr (Or.inr (Or.inr (by
      simpa only [Pρ.blockers_eq] using
        B.toActualBlockerSixCenterBoundary)))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Adjoin the crossed-row escape to each six-center faithful boundary.  The
escape is chosen from that boundary's own faithful carrier pattern, and its
actual blocker is outside the six installed centers.  This is a producer for
the strictly narrower seventh-blocker residual, not a contradiction. -/
theorem collisionSixCenterFaithful_to_crossedSeventhBlockerResidual
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (hsix : FirstFiberCollisionSixCenterFaithfulResidual
      P Pρ source S.oppApex2 S.surplusApex) :
    FirstFiberCollisionCrossedSeventhBlockerResidual
      P Pρ Q source source' commonOutside oppositeOutside E := by
  rcases hsix with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨B₆⟩
    rcases exists_freshThird_crossed_faithfulPatternEscape
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E
        B₆.carrierPattern with ⟨X⟩
    have hzA : X.escapePoint ∈ D.A := X.escapePoint_mem_A
    rcases FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters
        (T := T) (Q := Q) (source := source) (source' := source')
        (commonOutside := commonOutside) (oppositeOutside := oppositeOutside)
        (outside_orientation := outside_orientation) (E := E)
        (carrierPattern := B₆.carrierPattern) (X := X) with
      ⟨hcommon, hapex₁, hP, hPρ, hapex₂, hapex₃⟩
    exact Or.inl ⟨{
      boundary := B₆
      escape := X
      escapePoint_mem_A := hzA
      actualBlocker_not_mem_centers := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        exact ⟨hcommon, hapex₁, hPρ, hapex₂, hapex₃, hP⟩ }⟩
  · rcases hPρ₁ with ⟨B₆⟩
    rcases exists_freshThird_crossed_faithfulPatternEscape
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E
        B₆.carrierPattern with ⟨X⟩
    have hzA : X.escapePoint ∈ D.A := X.escapePoint_mem_A
    rcases FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters
        (T := T) (Q := Q) (source := source) (source' := source')
        (commonOutside := commonOutside) (oppositeOutside := oppositeOutside)
        (outside_orientation := outside_orientation) (E := E)
        (carrierPattern := B₆.carrierPattern) (X := X) with
      ⟨hcommon, hapex₁, hP, hPρ, hapex₂, hapex₃⟩
    exact Or.inr (Or.inl ⟨{
      boundary := B₆
      escape := X
      escapePoint_mem_A := hzA
      actualBlocker_not_mem_centers := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        exact ⟨hcommon, hapex₁, hP, hapex₂, hapex₃, hPρ⟩ }⟩)
  · rcases hP₂ with ⟨B₆⟩
    rcases exists_freshThird_crossed_faithfulPatternEscape
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E
        B₆.carrierPattern with ⟨X⟩
    have hzA : X.escapePoint ∈ D.A := X.escapePoint_mem_A
    rcases FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters
        (T := T) (Q := Q) (source := source) (source' := source')
        (commonOutside := commonOutside) (oppositeOutside := oppositeOutside)
        (outside_orientation := outside_orientation) (E := E)
        (carrierPattern := B₆.carrierPattern) (X := X) with
      ⟨hcommon, hapex₁, hP, hPρ, hapex₂, hapex₃⟩
    exact Or.inr (Or.inr (Or.inl ⟨{
      boundary := B₆
      escape := X
      escapePoint_mem_A := hzA
      actualBlocker_not_mem_centers := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        exact ⟨hcommon, hapex₁, hPρ, hapex₂, hapex₃, hP⟩ }⟩))
  · rcases hPρ₂ with ⟨B₆⟩
    rcases exists_freshThird_crossed_faithfulPatternEscape
        (P := P) (Pρ := Pρ) hlarge Q source source'
        commonOutside oppositeOutside outside_orientation E
        B₆.carrierPattern with ⟨X⟩
    have hzA : X.escapePoint ∈ D.A := X.escapePoint_mem_A
    rcases FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters
        (T := T) (Q := Q) (source := source) (source' := source')
        (commonOutside := commonOutside) (oppositeOutside := oppositeOutside)
        (outside_orientation := outside_orientation) (E := E)
        (carrierPattern := B₆.carrierPattern) (X := X) with
      ⟨hcommon, hapex₁, hP, hPρ, hapex₂, hapex₃⟩
    exact Or.inr (Or.inr (Or.inr ⟨{
      boundary := B₆
      escape := X
      escapePoint_mem_A := hzA
      actualBlocker_not_mem_centers := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        exact ⟨hcommon, hapex₁, hP, hapex₂, hapex₃, hPρ⟩ }⟩))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct first-fiber cap sources sharing a row alternate, in cyclic
boundary order, between the first apex and their common blocker.  This is the
source-clean geometric cut consumed by the crossed-arm finite search. -/
theorem firstFiber_capSources_alternate_between_firstApex_and_commonBlocker
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_mem_radius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source'_mem_radius :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (cross_membership :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩)
        (B.indexOf (H.blockerVertex source))
        (B.indexOf source) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩)
        (B.indexOf (H.blockerVertex source))
        (B.indexOf source') := by
  let O : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, firstFiber_oppApex1_mem_A (S := S)⟩
  let A : CriticalShellSystem.CarrierVertex D.A := H.blockerVertex source
  rcases source_witness with
    ⟨_, _, _, _, _, hA_ne_firstApex, _, _, _, _, _⟩
  have hA_ne_O : A ≠ O := by
    intro h
    exact hA_ne_firstApex (congrArg Subtype.val h)
  have hfirstApexEq :
      dist S.oppApex1 source.1 = dist S.oppApex1 source'.1 :=
    (mem_selectedClass.mp source_mem_radius).2.trans
      (mem_selectedClass.mp source'_mem_radius).2.symm
  have hsource'_ne_O : source' ≠ O := by
    intro h
    have hpoint : source'.1 = S.oppApex1 := congrArg Subtype.val h
    have hzero : dist S.oppApex1 source.1 = 0 := by
      simpa [hpoint] using hfirstApexEq
    have hsourceEq : S.oppApex1 = source.1 := dist_eq_zero.mp hzero
    exact sources_ne (hsourceEq.symm.trans hpoint.symm)
  have hsource'_ne_A : source' ≠ A := by
    intro h
    have hpoint : source'.1 = A.1 := congrArg Subtype.val h
    apply (H.selectedAt source.1 source.2).toCriticalFourShell.center_not_mem_support
    change A.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
    rw [← hpoint]
    exact cross_membership.1
  have hcommonBlockerEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1 source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support_eq_radius
        source'.1 cross_membership.1).symm
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hA_ne_O.symm
  · exact B.index_injective.ne hsource'_ne_O
  · exact B.index_injective.ne hsource'_ne_A
  · simpa only [B.point_eq, pointOf, dist_comm, O] using hfirstApexEq
  · simpa only [B.point_eq, pointOf, dist_comm, A,
      CriticalShellSystem.blockerVertex] using hcommonBlockerEq
  · exact B.boundary_injective.ne
      (B.index_injective.ne (fun h ↦ sources_ne (congrArg Subtype.val h)))

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Deletion constructor of the normalized outside-pair packet.  The deleted
point is retained with its exact orientation in the first blocker row, while
the independent collision-endpoint deletion packet remains available.  This
is one of the two immediate constructor leaves below. -/
theorem false_of_capSource_firstFiber_outsidePairDeletionExactRows
    {commonRadius : ℝ}
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
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
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
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  sorry

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The escaping point in every crossed seventh-blocker constructor is a fresh
canonical row outside both retained collision rows and the chosen cap-source
row, so the fresh-canonical override terminal closes the branch directly. -/
theorem false_of_capSource_firstFiber_crossedSeventhBlockerFaithfulResidual
    {commonRadius : ℝ}
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
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (crossedRows :
      FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside)
    (hseventh :
      FirstFiberCollisionCrossedSeventhBlockerResidual
        P Pρ Q source source' commonOutside oppositeOutside crossedRows) :
    False := by
  have false_of_boundary
      {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
      (B₇ : FirstFiberCrossedSeventhBlockerBoundary
        P Pρ Q source source' commonOutside oppositeOutside crossedRows
        q hq c₀ c₁ c₂ c₃ c₄ c₅) :
      False := by
    rcases B₇.escape.escapePoint_not_mem_sourceRows
        (P := P) (Pρ := Pρ) Q source source'
        commonOutside oppositeOutside outside_orientation with
      ⟨hqFirst, hqSecond, hqSource⟩
    exact false_of_freshCanonicalRowOverride
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      source ⟨B₇.escape.escapePoint, B₇.escapePoint_mem_A⟩
      source_witness hqFirst hqSecond hqSource
  rcases hseventh with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · exact false_of_boundary hP₁.some
  · exact false_of_boundary hPρ₁.some
  · exact false_of_boundary hP₂.some
  · exact false_of_boundary hPρ₂.some

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Crossed constructor of the normalized outside-pair packet.  The
orientation records which named off-cap point occurs in the common row and
which occurs in the opposite collision row.  The broad constructor is reduced
source-cleanly to the seventh-blocker faithful residual above. -/
theorem false_of_capSource_firstFiber_crossedThreeRowExactSupports
    {commonRadius : ℝ}
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
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (commonOutside oppositeOutside : ℝ²)
    (outside_orientation :
      (commonOutside = Q.source.1 ∧
          oppositeOutside = Q.otherOutsidePoint) ∨
        (commonOutside = Q.otherOutsidePoint ∧
          oppositeOutside = Q.source.1))
    (crossedRows :
      FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside)
    (hfaithfulRows :
      FirstFiberCollisionFiveCenterFaithfulResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  have hsix : FirstFiberCollisionSixCenterFaithfulResidual
      P Pρ source S.oppApex2 S.surplusApex :=
    collisionFiveCenterFaithful_to_sixCenterFaithfulResidual
      (P := P) (Pρ := Pρ) source hfaithfulRows
  have hseventh :
      FirstFiberCollisionCrossedSeventhBlockerResidual
        P Pρ Q source source' commonOutside oppositeOutside crossedRows :=
    collisionSixCenterFaithful_to_crossedSeventhBlockerResidual
      (P := P) (Pρ := Pρ) (T := T) L Q source source'
      commonOutside oppositeOutside outside_orientation crossedRows hsix
  exact false_of_capSource_firstFiber_crossedSeventhBlockerFaithfulResidual
    (P := P) (Pρ := Pρ)
    (hρne := hρne) (hfrontierFour := hfrontierFour)
    (hρfour := hρfour)
    (hfrontierInteriorEq := hfrontierInteriorEq)
    (hρInteriorEq := hρInteriorEq)
    (T := T) (hpairsDisjoint := hpairsDisjoint)
    (hblockersNe := hblockersNe)
    (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
    (LP := LP) (hLP := hLP) (MP := MP)
    Q source source' sources_ne
    source_mem_radius source'_mem_radius source_witness source'_witness
    cross_membership blockers_eq all_endpoint_omission
    blocker_mem_capInterior shell_inter_cap_eq commonOutside oppositeOutside
    outside_orientation crossedRows hseventh

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Positive-incidence terminal exposed by the equal-blocker/all-omission arm.
The parent proves `hdeletion` with
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted`; making that
four-way survival packet explicit is a strict narrowing.  The mixed terminal
is now a checked two-constructor coordinator: one leaf receives an exact
outside-point deletion row packet and the other receives an oriented crossed
three-row packet. -/
theorem false_of_capSource_firstFiber_collisionFiveCenterDeletion
    {commonRadius : ℝ}
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
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1})
    (houtsidePair :
      FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
        P Pρ Q source source')
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False := by
  have hfaithfulRows :=
    collisionFiveCenterExactRows_to_faithfulCarrierResidual
      (P := P) (Pρ := Pρ) (T := T)
      source source_witness blocker_mem_capInterior hexactRows
  rcases houtsidePair with hsource | hother | hsourceAtCommon | hotherAtCommon
  · rcases hsource with ⟨E⟩
    exact false_of_capSource_firstFiber_outsidePairDeletionExactRows
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.source.1 Q.source.2 (Or.inl rfl) E hexactRows
  · rcases hother with ⟨E⟩
    exact false_of_capSource_firstFiber_outsidePairDeletionExactRows
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_A (Or.inr rfl) E hexactRows
  · rcases hsourceAtCommon with ⟨E⟩
    exact false_of_capSource_firstFiber_crossedThreeRowExactSupports
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.source.1 Q.otherOutsidePoint (Or.inl ⟨rfl, rfl⟩) E hfaithfulRows
  · rcases hotherAtCommon with ⟨E⟩
    exact false_of_capSource_firstFiber_crossedThreeRowExactSupports
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission
      blocker_mem_capInterior shell_inter_cap_eq
      Q.otherOutsidePoint Q.source.1 (Or.inr ⟨rfl, rfl⟩) E hfaithfulRows

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Constructor-specific terminal for the stronger first-fiber descent packet.
It retains the shared radius, both complete source witnesses, mutual row
incidence, the common blocker, all four collision endpoints omitted by both
rows, and the exact intersection of that common shell with the first cap. -/
theorem false_of_twoCapSources_sameBlockerAllEndpointOmission
    {commonRadius : ℝ}
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
          S.capByIndex S.oppIndex1 =
        {source.1, source'.1}) :
    False := by
  apply false_of_capSource_firstFiber_collisionFiveCenterDeletion
      (P := P) (Pρ := Pρ)
      (hρne := hρne) (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq)
      (hρInteriorEq := hρInteriorEq)
      (T := T) (hpairsDisjoint := hpairsDisjoint)
      (hblockersNe := hblockersNe)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' sources_ne source_mem_radius source'_mem_radius
      source_witness source'_witness cross_membership blockers_eq
      all_endpoint_omission blocker_mem_capInterior shell_inter_cap_eq
      (firstFiberOutsidePair_exactRows_or_crossedThreeRows
        (P := P) (Pρ := Pρ) Q source source' sources_ne
        source_witness source'_witness cross_membership shell_inter_cap_eq
        (firstFiberOutsidePair_exactRows_or_crossed
          (P := P) (Pρ := Pρ) Q source
          (firstFiberOutsidePair_fiveCenter_or_crossed
            (P := P) (Pρ := Pρ) (T := T)
            (hblockersNe := hblockersNe) Q source
            (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
              blocker_mem_capInterior)
            source_witness.2.2.2.1)))
  exact collisionFiveCenterExactRows_of_deletionResidual
    (P := P) (Pρ := Pρ) source
    (collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted
      (P := P) (Pρ := Pρ) (T := T)
      (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
      (LP := LP) (hLP := hLP) (MP := MP)
      Q source source' source_witness all_endpoint_omission)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Strict residual coordinator after removing the checked
distinct-three-center arm.  Its constructor split is source-clean; the two
load-bearing leaves retain disjoint, branch-specific positive data. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_residual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.ResidualCase) :
    False := by
  cases obstruction with
  | normalized C Q firstInteraction secondInteraction =>
      exact
        false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q firstInteraction secondInteraction hresidual
  | sameBlockerAllEndpointOmission Q source source' sources_ne
      source_mem_radius source'_mem_radius source_witness source'_witness
      cross_membership blockers_eq all_endpoint_omission blocker_mem_capInterior
      shell_inter_cap_eq =>
      exact
        false_of_twoCapSources_sameBlockerAllEndpointOmission
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          Q source source' sources_ne source_mem_radius source'_mem_radius
          source_witness source'_witness cross_membership blockers_eq
          all_endpoint_omission blocker_mem_capInterior shell_inter_cap_eq

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The fresh-third cap-source core retains either both cap-eight sources and
their independently normalized positive interactions with the fresh blocker
fiber, or the stronger equal-blocker/all-endpoint-omission packet produced by
the first-fiber descent. It removes the source-clean three-center arm before
entering the strict residual. -/
theorem false_of_twoCapSources_freshThirdBlockerFiber_core
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ) :
    False := by
  by_cases hrows : obstruction.HasDistinctCrossRows
  · exact
      FreshThirdTwoCapSourceObstruction.false_of_hasDistinctCrossRows
        (P := P) (Pρ := Pρ) obstruction hrows
  · exact
      false_of_twoCapSources_freshThirdBlockerFiber_residual
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        obstruction
        (FreshThirdTwoCapSourceObstruction.residualCase_of_isResidual
          (P := P) (Pρ := Pρ) obstruction
          (FreshThirdTwoCapSourceObstruction.isResidual_of_not_hasDistinctCrossRows
            (P := P) (Pρ := Pρ) obstruction hrows))


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
