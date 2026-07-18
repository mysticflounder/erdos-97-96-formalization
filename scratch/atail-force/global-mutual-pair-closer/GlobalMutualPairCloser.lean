import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore

/-!
# Full-parent arbitrary mutual-pair reduction

This scratch module treats the arbitrary
`PhysicalActualCriticalMutualOmissionPair` returned by the production global
split.  It does not identify that pair with an edge of a separately chosen
omission cycle.

The retained exact-five continuation chooses one endpoint whose deletion
survives at the continuation blocker.  Mutual omission supplies survival at
the other endpoint's actual blocker, while the bi-apex parent supplies
survival at both physical apices.  The only collision among those four named
centers that is not already ruled out is equality of the two actual blockers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMutualPairCloserScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFirstApexCriticalFiber
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem mutualPair_source_ne_target
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : PhysicalActualCriticalMutualOmissionPair H profile) :
    P.source ≠ P.target := by
  intro h
  apply P.target_not_mem_sourceSupport
  simpa [h] using
    (H.selectedAt P.source.1
      (PhysicalVertex.mem_A P.source)).toCriticalFourShell.q_mem_support

/-- Choose one orientation of the arbitrary mutual pair so that the deleted
endpoint is also omitted by the retained continuation's unused-source row. -/
structure FullParentMutualChosenDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Type where
  deleted : PhysicalVertex profile
  partner : PhysicalVertex profile
  deleted_ne_partner : deleted ≠ partner
  deleted_not_mem_partnerSupport :
    deleted.1 ∉
      (H.selectedAt partner.1
        (PhysicalVertex.mem_A partner)).toCriticalFourShell.support
  deleted_not_mem_continuationSupport :
    deleted.1 ∉
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support

/-- The continuation row has at most one physical hit, so two distinct
physical endpoints cannot both lie in it. -/
theorem nonempty_fullParentMutualChosenDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) :
    Nonempty (FullParentMutualChosenDeletion M) := by
  classical
  let U :=
    (H.selectedAt M.continuation.unusedRow.unused.point
      M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  have hpairNe : M.pair.source ≠ M.pair.target :=
    mutualPair_source_ne_target M.pair
  have hle :=
    actualUnusedRow_physicalInterior_inter_card_le_one
      M.continuation.unusedRow
  rw [Finset.card_le_one] at hle
  by_cases hsource : M.pair.source.1 ∉ U
  · exact ⟨{
      deleted := M.pair.source
      partner := M.pair.target
      deleted_ne_partner := hpairNe
      deleted_not_mem_partnerSupport :=
        M.pair.source_not_mem_targetSupport
      deleted_not_mem_continuationSupport := hsource }⟩
  · have hsourceMem : M.pair.source.1 ∈ U := by
      simpa only [not_not] using hsource
    have htarget : M.pair.target.1 ∉ U := by
      intro htargetMem
      have hsourceInter :
          M.pair.source.1 ∈
            (SelectedClass D.A S.oppApex2 profile.radius ∩
              S.capInteriorByIndex S.oppIndex2) ∩ U :=
        Finset.mem_inter.mpr ⟨by
          have hphysical := M.pair.source.2
          change M.pair.source.1 ∈
            SelectedClass D.A S.oppApex2 profile.radius ∩
              S.capInteriorByIndex S.oppIndex2 at hphysical
          exact hphysical, hsourceMem⟩
      have htargetInter :
          M.pair.target.1 ∈
            (SelectedClass D.A S.oppApex2 profile.radius ∩
              S.capInteriorByIndex S.oppIndex2) ∩ U :=
        Finset.mem_inter.mpr ⟨by
          have hphysical := M.pair.target.2
          change M.pair.target.1 ∈
            SelectedClass D.A S.oppApex2 profile.radius ∩
              S.capInteriorByIndex S.oppIndex2 at hphysical
          exact hphysical, htargetMem⟩
      apply hpairNe
      apply Subtype.ext
      exact hle M.pair.source.1 hsourceInter M.pair.target.1 htargetInter
    exact ⟨{
      deleted := M.pair.target
      partner := M.pair.source
      deleted_ne_partner := hpairNe.symm
      deleted_not_mem_partnerSupport :=
        M.pair.target_not_mem_sourceSupport
      deleted_not_mem_continuationSupport := htarget }⟩

private theorem selectedSupport_eq_of_centerAt_eq
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ D.A) (hsource₂ : source₂ ∈ D.A)
    (hcenter :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let K₁ := (H.selectedAt source₁ hsource₁).toCriticalFourShell
  let K₂ := (H.selectedAt source₂ hsource₂).toCriticalFourShell
  have hsource₁K₂ : source₁ ∈ K₂.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source₂ hsource₂) (by
        intro hsurvives
        apply H.no_qfree_at source₁ hsource₁
        simpa only [hcenter] using hsurvives)
  have hradii : K₁.radius = K₂.radius := by
    calc
      K₁.radius = dist (H.centerAt source₁ hsource₁) source₁ :=
        (K₁.support_eq_radius source₁ K₁.q_mem_support).symm
      _ = dist (H.centerAt source₂ hsource₂) source₁ :=
        congrArg (fun center ↦ dist center source₁) hcenter
      _ = K₂.radius := K₂.support_eq_radius source₁ hsource₁K₂
  ext x
  constructor
  · intro hx
    apply K₂.off_row_named_label_forbidden (K₁.support_subset_A hx)
    calc
      dist (H.centerAt source₂ hsource₂) x =
          dist (H.centerAt source₁ hsource₁) x :=
        (congrArg (fun center ↦ dist center x) hcenter).symm
      _ = K₁.radius := K₁.support_eq_radius x hx
      _ = K₂.radius := hradii
  · intro hx
    apply K₁.off_row_named_label_forbidden (K₂.support_subset_A hx)
    calc
      dist (H.centerAt source₁ hsource₁) x =
          dist (H.centerAt source₂ hsource₂) x :=
        congrArg (fun center ↦ dist center x) hcenter
      _ = K₂.radius := K₂.support_eq_radius x hx
      _ = K₁.radius := hradii.symm

/-- If the two actual blockers are distinct, one chosen mutual endpoint can
be deleted while K4 survives at four pairwise distinct named carrier centers:
both physical apices, the continuation blocker, and the partner blocker. -/
structure FullParentMutualFourCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Type where
  chosen : FullParentMutualChosenDeletion M
  blockers_ne :
    H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A ≠
      H.centerAt chosen.partner.1 (PhysicalVertex.mem_A chosen.partner)
  firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1) S.oppApex1
  secondApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1) S.oppApex2
  continuationBlocker_survives :
    HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1)
      (H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A)
  partnerBlocker_survives :
    HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1)
      (H.centerAt chosen.partner.1 (PhysicalVertex.mem_A chosen.partner))
  continuationBlocker_ne_firstApex :
    H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A ≠ S.oppApex1
  continuationBlocker_ne_secondApex :
    H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A ≠ S.oppApex2
  partnerBlocker_ne_firstApex :
    H.centerAt chosen.partner.1 (PhysicalVertex.mem_A chosen.partner) ≠
      S.oppApex1
  partnerBlocker_ne_secondApex :
    H.centerAt chosen.partner.1 (PhysicalVertex.mem_A chosen.partner) ≠
      S.oppApex2

/-- In the only blocker-collision arm, the continuation row and the partner
row are one exact support.  It contains the partner and the unused source,
omits the deleted endpoint, and forces the partner to be fresh from both
origin-tagged continuation sources. -/
structure FullParentMutualEqualBlockerShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Type where
  chosen : FullParentMutualChosenDeletion M
  blockers_eq :
    H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A =
      H.centerAt chosen.partner.1 (PhysicalVertex.mem_A chosen.partner)
  supports_eq :
    (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support =
      (H.selectedAt chosen.partner.1
        (PhysicalVertex.mem_A chosen.partner)).toCriticalFourShell.support
  partner_mem_commonSupport :
    chosen.partner.1 ∈
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  unusedSource_mem_commonSupport :
    M.continuation.unusedRow.unused.point ∈
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  deleted_not_mem_commonSupport :
    chosen.deleted.1 ∉
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  partner_ne_continuationFirst :
    chosen.partner.1 ≠ M.continuation.first
  partner_ne_continuationSecond :
    chosen.partner.1 ≠ M.continuation.second
  criticalFiber : FrontierCommonDeletionCriticalFiber R
  criticalFiber_source₁ :
    criticalFiber.source₁.1 = M.continuation.unusedRow.unused.point
  criticalFiber_source₂ : criticalFiber.source₂.1 = chosen.partner.1

/-- Exhaustive full-parent normal form for the arbitrary mutual-pair sibling. -/
inductive FullParentMutualBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Type
  | fourCenter (data : FullParentMutualFourCenterDeletion M)
  | equalBlocker (data : FullParentMutualEqualBlockerShell M)

theorem nonempty_fullParentMutualBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) :
    Nonempty (FullParentMutualBlockerOutcome M) := by
  classical
  rcases nonempty_fullParentMutualChosenDeletion M with ⟨chosen⟩
  let unusedSource := M.continuation.unusedRow.unused.point
  let hunusedA := M.continuation.unusedRow.source_mem_A
  let partnerSource := chosen.partner.1
  let hpartnerA := PhysicalVertex.mem_A chosen.partner
  let unusedBlocker := H.centerAt unusedSource hunusedA
  let partnerBlocker := H.centerAt partnerSource hpartnerA
  have hfirst := B.firstApex_robust.survives chosen.deleted.1
    (PhysicalVertex.mem_A chosen.deleted)
  have hsecond := B.secondApex_robust.survives chosen.deleted.1
    (PhysicalVertex.mem_A chosen.deleted)
  have hunused :
      HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1) unusedBlocker := by
    simpa [unusedBlocker, unusedSource, hunusedA] using
      (cross_deletion_survives_iff_not_mem_selected_support H hunusedA).mpr
        chosen.deleted_not_mem_continuationSupport
  have hpartner :
      HasNEquidistantPointsAt 4 (D.A.erase chosen.deleted.1) partnerBlocker := by
    simpa [partnerBlocker, partnerSource, hpartnerA] using
      (cross_deletion_survives_iff_not_mem_selected_support H hpartnerA).mpr
        chosen.deleted_not_mem_partnerSupport
  have hunusedNeFirst : unusedBlocker ≠ S.oppApex1 := by
    simpa [unusedBlocker, unusedSource, hunusedA] using
      B.firstApex_robust.centerAt_ne H unusedSource hunusedA
  have hunusedNeSecond : unusedBlocker ≠ S.oppApex2 := by
    simpa [unusedBlocker, unusedSource, hunusedA] using
      B.secondApex_robust.centerAt_ne H unusedSource hunusedA
  have hpartnerNeFirst : partnerBlocker ≠ S.oppApex1 := by
    simpa [partnerBlocker, partnerSource, hpartnerA] using
      B.firstApex_robust.centerAt_ne H partnerSource hpartnerA
  have hpartnerNeSecond : partnerBlocker ≠ S.oppApex2 := by
    simpa [partnerBlocker, partnerSource, hpartnerA] using
      B.secondApex_robust.centerAt_ne H partnerSource hpartnerA
  by_cases hblockers : unusedBlocker = partnerBlocker
  · have hsupports :
        (H.selectedAt unusedSource hunusedA).toCriticalFourShell.support =
          (H.selectedAt partnerSource hpartnerA).toCriticalFourShell.support :=
      selectedSupport_eq_of_centerAt_eq H hunusedA hpartnerA (by
        simpa [unusedBlocker, partnerBlocker] using hblockers)
    have hpartnerMem :
        partnerSource ∈
          (H.selectedAt unusedSource hunusedA).toCriticalFourShell.support := by
      rw [hsupports]
      exact (H.selectedAt partnerSource hpartnerA).toCriticalFourShell.q_mem_support
    have hunusedMem :
        unusedSource ∈
          (H.selectedAt unusedSource hunusedA).toCriticalFourShell.support :=
      (H.selectedAt unusedSource hunusedA).toCriticalFourShell.q_mem_support
    have hpartnerNeFirst : partnerSource ≠ M.continuation.first := by
      intro h
      apply M.continuation.first_not_mem_actualCriticalSupport
      simpa [partnerSource, h] using hpartnerMem
    have hpartnerNeSecond : partnerSource ≠ M.continuation.second := by
      intro h
      apply M.continuation.second_not_mem_actualCriticalSupport
      simpa [partnerSource, h] using hpartnerMem
    have hunusedNePartner : unusedSource ≠ partnerSource := by
      intro h
      apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
      have hpoint :
          M.continuation.unusedRow.unused.point = chosen.partner.1 := by
        simpa [unusedSource, partnerSource] using h
      rw [hpoint]
      exact PhysicalVertex.mem_radiusClass chosen.partner
    let source₁ : CriticalShellSystem.CarrierVertex D.A :=
      ⟨unusedSource, hunusedA⟩
    let source₂ : CriticalShellSystem.CarrierVertex D.A :=
      ⟨partnerSource, hpartnerA⟩
    have hsourcesNe : source₁ ≠ source₂ := by
      intro h
      apply hunusedNePartner
      exact congrArg Subtype.val h
    have hblockerVertices :
        H.blockerVertex source₁ = H.blockerVertex source₂ := by
      apply Subtype.ext
      change unusedBlocker = partnerBlocker
      exact hblockers
    have hradii :
        (H.selectedAt unusedSource hunusedA).toCriticalFourShell.radius =
          (H.selectedAt partnerSource hpartnerA).toCriticalFourShell.radius := by
      let K₁ := (H.selectedAt unusedSource hunusedA).toCriticalFourShell
      let K₂ := (H.selectedAt partnerSource hpartnerA).toCriticalFourShell
      calc
        K₁.radius = dist unusedBlocker unusedSource :=
          (K₁.support_eq_radius unusedSource K₁.q_mem_support).symm
        _ = dist partnerBlocker unusedSource :=
          congrArg (fun center ↦ dist center unusedSource) hblockers
        _ = K₂.radius := K₂.support_eq_radius unusedSource (by
          rw [← hsupports]
          exact K₁.q_mem_support)
    let fiber : FrontierCommonDeletionCriticalFiber R := {
      firstApex_robust := B.firstApex_robust
      source₁ := source₁
      source₂ := source₂
      sources_ne := hsourcesNe
      source_points_ne := hunusedNePartner
      blockers_eq := hblockerVertices
      commonBlocker_ne_firstApex := by
        simpa [source₁, unusedBlocker] using hunusedNeFirst
      commonBlocker_mem_A := by
        simpa [source₁, unusedSource, hunusedA] using
          M.continuation.unusedRow.blocker_mem_A
      supports_eq := by
        simpa [source₁, source₂] using hsupports
      radii_eq := by
        simpa [source₁, source₂] using hradii
      source₁_mem_commonSupport := by
        rw [← hsupports]
        exact (H.selectedAt unusedSource hunusedA).toCriticalFourShell.q_mem_support
      source₂_mem_commonSupport := hpartnerMem
      commonSupport_card_eq_four :=
        (H.selectedAt unusedSource hunusedA).toCriticalFourShell.support_card
      source₁_deletion_critical := H.no_qfree_at unusedSource hunusedA
      source₂_deletion_critical := by
        change ¬ HasNEquidistantPointsAt 4 (D.A.erase partnerSource) unusedBlocker
        intro hsurvives
        apply H.no_qfree_at partnerSource hpartnerA
        change HasNEquidistantPointsAt 4 (D.A.erase partnerSource) partnerBlocker
        rw [← hblockers]
        exact hsurvives }
    exact ⟨FullParentMutualBlockerOutcome.equalBlocker {
      chosen := chosen
      blockers_eq := by
        simpa [unusedBlocker, partnerBlocker, unusedSource, partnerSource,
          hunusedA, hpartnerA] using hblockers
      supports_eq := by
        simpa [unusedSource, partnerSource, hunusedA, hpartnerA] using hsupports
      partner_mem_commonSupport := by
        simpa [unusedSource, partnerSource, hunusedA, hpartnerA] using hpartnerMem
      unusedSource_mem_commonSupport := by
        simpa [unusedSource, hunusedA] using hunusedMem
      deleted_not_mem_commonSupport :=
        chosen.deleted_not_mem_continuationSupport
      partner_ne_continuationFirst := by
        simpa [partnerSource] using hpartnerNeFirst
      partner_ne_continuationSecond := by
        simpa [partnerSource] using hpartnerNeSecond
      criticalFiber := fiber
      criticalFiber_source₁ := rfl
      criticalFiber_source₂ := rfl }⟩
  · exact ⟨FullParentMutualBlockerOutcome.fourCenter {
      chosen := chosen
      blockers_ne := by
        simpa [unusedBlocker, partnerBlocker, unusedSource, partnerSource,
          hunusedA, hpartnerA] using hblockers
      firstApex_survives := hfirst
      secondApex_survives := hsecond
      continuationBlocker_survives := by
        simpa [unusedBlocker, unusedSource, hunusedA] using hunused
      partnerBlocker_survives := by
        simpa [partnerBlocker, partnerSource, hpartnerA] using hpartner
      continuationBlocker_ne_firstApex := by
        simpa [unusedBlocker, unusedSource, hunusedA] using hunusedNeFirst
      continuationBlocker_ne_secondApex := by
        simpa [unusedBlocker, unusedSource, hunusedA] using hunusedNeSecond
      partnerBlocker_ne_firstApex := by
        simpa [partnerBlocker, partnerSource, hpartnerA] using hpartnerNeFirst
      partnerBlocker_ne_secondApex := by
        simpa [partnerBlocker, partnerSource, hpartnerA] using hpartnerNeSecond }⟩

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- The distinct-blocker outcome reaches two concrete common-deletion
packets for the same deleted source: one on the physical-apex pair and one on
the two actual blockers.  Existing two-center consumers still require a
positive shared outside pair or a compatible ordered-row incidence. -/
structure FullParentMutualFourCenterPacketPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) : Type where
  apexPacket : CommonDeletionTwoCenterPacket D H Q.chosen.deleted.1
    S.oppApex1 S.oppApex2
  blockerPacket : CommonDeletionTwoCenterPacket D H Q.chosen.deleted.1
    (H.centerAt M.continuation.unusedRow.unused.point
      M.continuation.unusedRow.source_mem_A)
    (H.centerAt Q.chosen.partner.1
      (PhysicalVertex.mem_A Q.chosen.partner))

theorem nonempty_fullParentMutualFourCenterPacketPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    Nonempty (FullParentMutualFourCenterPacketPair Q) := by
  rcases nonempty_commonDeletionTwoCenterPacket H
      (PhysicalVertex.mem_A Q.chosen.deleted)
      (oppApex1_mem_A S) (oppApex2_mem_A S)
      (oppApex1_ne_oppApex2 S)
      Q.firstApex_survives Q.secondApex_survives with ⟨apexPacket⟩
  have hunusedBlockerA :
      H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A ∈ D.A :=
    M.continuation.unusedRow.blocker_mem_A
  have hpartnerBlockerA :
      H.centerAt Q.chosen.partner.1
          (PhysicalVertex.mem_A Q.chosen.partner) ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt Q.chosen.partner.1
        (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.center_mem).2
  rcases nonempty_commonDeletionTwoCenterPacket H
      (PhysicalVertex.mem_A Q.chosen.deleted)
      hunusedBlockerA hpartnerBlockerA Q.blockers_ne
      Q.continuationBlocker_survives Q.partnerBlocker_survives with
    ⟨blockerPacket⟩
  exact ⟨{ apexPacket := apexPacket, blockerPacket := blockerPacket }⟩

#print axioms nonempty_fullParentMutualChosenDeletion
#print axioms nonempty_fullParentMutualBlockerOutcome
#print axioms nonempty_fullParentMutualFourCenterPacketPair

end

end ATailGlobalMutualPairCloserScratch
end Problem97
