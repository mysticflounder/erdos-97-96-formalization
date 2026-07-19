import GlobalMutualPairCloser
import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Canonical rows on the arbitrary mutual-pair distinct-blocker arm

This file starts from the kernel-checked
`FullParentMutualFourCenterDeletion` reduction.  Its two q-deleted rows at
the actual blockers are not arbitrary: deletion criticality identifies them
with the two complete critical supports selected by the retained
`CriticalShellSystem`.  Exact-five uniqueness similarly identifies the
physical-second-apex row with the complete physical class after erasing the
chosen deleted vertex.

The normalization below keeps the complete parent packet and exposes the
remaining terminal boundary without adding another deletion adapter.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMutualDistinctBlockerTerminalScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveCommonDeletionNormalForm
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem qDeleted_support_eq_actualCriticalSupport
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {deleted source : ℝ²}
    (hsource : source ∈ D.A)
    (hdeletedNotSupport :
      deleted ∉
        (H.selectedAt source hsource).toCriticalFourShell.support)
    {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted
      (H.centerAt source hsource) B)
    (hBcard : B.card = 4) :
    B = (H.selectedAt source hsource).toCriticalFourShell.support := by
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (H.centerAt source hsource) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hsource).mpr
      hdeletedNotSupport
  have hnormal :=
    cross_survival_unique_radius_and_exact_support H hsource hsurvives
  have hradius :
      K.radius =
        (H.selectedAt source hsource).toCriticalFourShell.radius := by
    apply hnormal.2 K.radius K.radius_pos
    exact K.card_four.trans <|
      Finset.card_le_card (qDeleted_support_subset_selectedClass K)
  have hsub := qDeleted_support_subset_selectedClass K
  rw [hradius, hnormal.1] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  rw [(H.selectedAt source hsource).toCriticalFourShell.support_card,
    hBcard]

private theorem qDeleted_physicalSupport_eq_exactFiveErase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {deleted : ℝ²}
    (hdeletedClass :
      deleted ∈ SelectedClass D.A S.oppApex2 profile.radius)
    {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted S.oppApex2 B)
    (hBcard : B.card = 4) :
    B = (SelectedClass D.A S.oppApex2 profile.radius).erase deleted := by
  have hradius : K.radius = profile.radius := by
    apply profile.unique_K4_radius K.radius K.radius_pos
    exact K.card_four.trans <|
      Finset.card_le_card (qDeleted_support_subset_ambientSelectedClass K)
  have hsub := qDeleted_support_subset_selectedClass K
  rw [hradius, selectedClass_erase_eq] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Finset.card_erase_of_mem hdeletedClass,
    profile.class_card_eq_five, hBcard]

/-- Canonical row content of the two source-faithful packet rows produced by
the distinct-blocker reduction. -/
structure FullParentMutualFourCenterCanonicalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualFourCenterDeletion M}
    (P : FullParentMutualFourCenterPacketPair Q) : Prop where
  continuationBlockerSupport :
    P.blockerPacket.B₁ =
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  partnerBlockerSupport :
    P.blockerPacket.B₂ =
      (H.selectedAt Q.chosen.partner.1
        (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.support
  physicalSecondApexSupport :
    P.apexPacket.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase Q.chosen.deleted.1

/-- The full-parent four-center reduction has a packet pair whose three
relevant rows are the canonical complete rows described above. -/
theorem nonempty_fullParentMutualFourCenterCanonicalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) :
    ∃ P : FullParentMutualFourCenterPacketPair Q,
      FullParentMutualFourCenterCanonicalRows P := by
  rcases nonempty_fullParentMutualFourCenterPacketPair Q with ⟨P⟩
  refine ⟨P, ?_⟩
  constructor
  · exact qDeleted_support_eq_actualCriticalSupport H
      M.continuation.unusedRow.source_mem_A
      Q.chosen.deleted_not_mem_continuationSupport
      P.blockerPacket.row₁ P.blockerPacket.B₁_card
  · exact qDeleted_support_eq_actualCriticalSupport H
      (PhysicalVertex.mem_A Q.chosen.partner)
      Q.chosen.deleted_not_mem_partnerSupport
      P.blockerPacket.row₂ P.blockerPacket.B₂_card
  · exact qDeleted_physicalSupport_eq_exactFiveErase
      (Finset.mem_inter.mp Q.chosen.deleted.2).1 P.apexPacket.row₂
      P.apexPacket.B₂_card

/-- The partner is a concrete member of the canonical physical-apex row and
of its own canonical critical row.  The chosen deleted point is absent from
both blocker rows.  These are the strongest named incidences available
without a new cross-row producer. -/
theorem canonical_named_memberships
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualFourCenterDeletion M}
    (P : FullParentMutualFourCenterPacketPair Q)
    (N : FullParentMutualFourCenterCanonicalRows P) :
    Q.chosen.partner.1 ∈ P.apexPacket.B₂ ∧
      Q.chosen.partner.1 ∈ P.blockerPacket.B₂ ∧
      Q.chosen.deleted.1 ∉ P.blockerPacket.B₁ ∧
      Q.chosen.deleted.1 ∉ P.blockerPacket.B₂ := by
  constructor
  · rw [N.physicalSecondApexSupport]
    have hpartner_ne_deleted :
        Q.chosen.partner.1 ≠ Q.chosen.deleted.1 := by
      intro h
      apply Q.chosen.deleted_ne_partner
      exact Subtype.ext h.symm
    exact Finset.mem_erase.mpr ⟨hpartner_ne_deleted,
      PhysicalVertex.mem_radiusClass Q.chosen.partner⟩
  · constructor
    · rw [N.partnerBlockerSupport]
      exact (H.selectedAt Q.chosen.partner.1
        (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.q_mem_support
    · constructor
      · rw [N.continuationBlockerSupport]
        exact Q.chosen.deleted_not_mem_continuationSupport
      · rw [N.partnerBlockerSupport]
        exact Q.chosen.deleted_not_mem_partnerSupport

/-- Smallest source-faithful positive same-cap terminal found in the current
consumer bank.  The two actual blockers lie in one ordered cap, the two row
sources lie outside it, and the two critical rows contain the sources
reciprocally.  Own-source membership supplies the other two incidences.

None of these six positive placement/incidence fields follows from the
four-center deletion packet. -/
structure FullParentMutualSourcePairSameCapCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualFourCenterDeletion M) : Type where
  capIndex : Fin 3
  continuationBlocker_mem_cap :
    H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A ∈
      S.capByIndex capIndex
  partnerBlocker_mem_cap :
    H.centerAt Q.chosen.partner.1
        (PhysicalVertex.mem_A Q.chosen.partner) ∈
      S.capByIndex capIndex
  unusedSource_not_mem_cap :
    M.continuation.unusedRow.unused.point ∉ S.capByIndex capIndex
  partnerSource_not_mem_cap :
    Q.chosen.partner.1 ∉ S.capByIndex capIndex
  partner_mem_continuationRow :
    Q.chosen.partner.1 ∈
      (H.selectedAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  unused_mem_partnerRow :
    M.continuation.unusedRow.unused.point ∈
      (H.selectedAt Q.chosen.partner.1
        (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.support

/-- The source-pair same-cap terminal is immediately contradictory by the
ordered-cap uniqueness theorem. -/
theorem FullParentMutualSourcePairSameCapCollision.false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    {Q : FullParentMutualFourCenterDeletion M}
    (C : FullParentMutualSourcePairSameCapCollision Q) : False := by
  let unused := M.continuation.unusedRow.unused.point
  let partner := Q.chosen.partner.1
  let continuationBlocker :=
    H.centerAt unused M.continuation.unusedRow.source_mem_A
  let partnerBlocker :=
    H.centerAt partner (PhysicalVertex.mem_A Q.chosen.partner)
  have hunused_ne_partner : unused ≠ partner := by
    intro h
    apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
    change unused ∈ SelectedClass D.A S.oppApex2 profile.radius
    rw [h]
    exact PhysicalVertex.mem_radiusClass Q.chosen.partner
  have hcontinuationEq :
      dist continuationBlocker unused = dist continuationBlocker partner := by
    exact
      (H.selectedAt unused
          M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support_eq_radius
          unused
          (H.selectedAt unused
            M.continuation.unusedRow.source_mem_A).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt unused
          M.continuation.unusedRow.source_mem_A).toCriticalFourShell.support_eq_radius
            partner (by simpa [unused, partner] using C.partner_mem_continuationRow)).symm
  have hpartnerEq :
      dist partnerBlocker unused = dist partnerBlocker partner := by
    exact
      (H.selectedAt partner
          (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.support_eq_radius
          unused (by simpa [unused, partner] using C.unused_mem_partnerRow)
      |>.trans
        ((H.selectedAt partner
          (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.support_eq_radius
            partner
            (H.selectedAt partner
              (PhysicalVertex.mem_A Q.chosen.partner)).toCriticalFourShell.q_mem_support).symm
  rcases S.capByIndex_cgn4g_capData D.convex C.capIndex with
    ⟨m, order, packet, _sameSide, hordered, hcap⟩
  have hcontinuationImage :
      continuationBlocker ∈ Finset.univ.image order.points := by
    rw [hcap]
    simpa [continuationBlocker, unused] using C.continuationBlocker_mem_cap
  have hpartnerImage :
      partnerBlocker ∈ Finset.univ.image order.points := by
    rw [hcap]
    simpa [partnerBlocker, partner] using C.partnerBlocker_mem_cap
  rcases Finset.mem_image.mp hcontinuationImage with
    ⟨i, _hi, hi⟩
  rcases Finset.mem_image.mp hpartnerImage with ⟨j, _hj, hj⟩
  have hij : i ≠ j := by
    intro h
    apply Q.blockers_ne
    calc
      H.centerAt M.continuation.unusedRow.unused.point
          M.continuation.unusedRow.source_mem_A = continuationBlocker := rfl
      _ = order.points i := hi.symm
      _ = order.points j := by rw [h]
      _ = partnerBlocker := hj
      _ = H.centerAt Q.chosen.partner.1
          (PhysicalVertex.mem_A Q.chosen.partner) := rfl
  have hunusedOutside : unused ∉ Finset.univ.image order.points := by
    rw [hcap]
    simpa [unused] using C.unusedSource_not_mem_cap
  have hpartnerOutside : partner ∉ Finset.univ.image order.points := by
    rw [hcap]
    simpa [partner] using C.partnerSource_not_mem_cap
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hordered packet.mem_A hij
      M.continuation.unusedRow.source_mem_A
      (PhysicalVertex.mem_A Q.chosen.partner)
      hunusedOutside hpartnerOutside hunused_ne_partner
      (by simpa [continuationBlocker, unused, partner, hi] using hcontinuationEq)
      (by simpa [partnerBlocker, unused, partner, hj] using hpartnerEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hordered packet.mem_A hji
      M.continuation.unusedRow.source_mem_A
      (PhysicalVertex.mem_A Q.chosen.partner)
      hunusedOutside hpartnerOutside hunused_ne_partner
      (by simpa [partnerBlocker, unused, partner, hj] using hpartnerEq)
      (by simpa [continuationBlocker, unused, partner, hi] using hcontinuationEq)

#print axioms nonempty_fullParentMutualFourCenterCanonicalRows
#print axioms canonical_named_memberships
#print axioms FullParentMutualSourcePairSameCapCollision.false

end

end ATailGlobalMutualDistinctBlockerTerminalScratch
end Problem97
