/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourSingletonSuccessor

/-!
# Successor-refined exact-four two-radius normal form

The singleton common-deletion constructor of the raw two-radius normal form
admits a checked source-faithful successor whenever the physical second apex
is deletion-robust.  This module records that advance without asserting the
still-missing nonreturn or terminal contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustLargeRadiusContinuationScratch

open ATailRobustTwoRadiusCenterLocalizationScratch
open ATailCommonDeletionUniformConsumerScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SecondApexRadiusTransportScratch
open ATailRTwoOffLiveHandlerScratch

/-- The physical second apex is one of the three MEC vertices. -/
private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Robustness at the physical second apex eliminates the critical arm of the
generic common-deletion continuation. -/
private theorem nonempty_secondRowSuccessor_of_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) :
    Nonempty (SecondRowCommonDeletionSuccessor C) := by
  let Rscratch := rtwoScratchRobust_of_production R
  rcases secondRowSuccessor_or_secondCenterCritical C with
    hsuccessor | ⟨source, ⟨P⟩⟩
  · exact hsuccessor
  · exact False.elim
      (P.blocks
        (Rscratch.survives source P.shell.toCriticalFourShell.q_mem_A))

/-- Regard a selected four-row avoiding the deleted source as the exact
q-deleted row with unchanged support and radius. -/
private def qDeletedK4Class_of_selectedFourClass
    {D : CounterexampleData} {q center : ℝ²}
    (K : SelectedFourClass D.A center)
    (hq : q ∉ K.support) :
    U5QDeletedK4Class D q center K.support where
  subset := by
    intro y hy
    apply Finset.mem_erase.mpr
    refine ⟨?_, ?_⟩
    · intro hycenter
      exact K.center_not_mem (hycenter ▸ hy)
    · apply Finset.mem_erase.mpr
      refine ⟨?_, K.support_subset_A hy⟩
      intro hyq
      exact hq (hyq ▸ hy)
  card_four := by rw [K.support_card]
  q_not_mem := hq
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- Replace the anonymous second-center witness of a common-deletion packet
by a prescribed selected row which survives the deletion.  This preserves the
fresh-center witness while making the physical row identity source-exact. -/
private def alignCommonDeletionPacketPhysicalRow
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (physicalRow : SelectedFourClass D.A center₂)
    (hdeleted : deleted ∉ physicalRow.support) :
    CommonDeletionTwoCenterPacket D H deleted center₁ center₂ where
  q_mem_A := C.q_mem_A
  center₁_mem_A := C.center₁_mem_A
  center₂_mem_A := C.center₂_mem_A
  centers_ne := C.centers_ne
  survives₁ := C.survives₁
  survives₂ :=
    selectedFourClass_survives_erase_of_not_mem physicalRow hdeleted
  actual_blocker_ne_center₁ := C.actual_blocker_ne_center₁
  actual_blocker_ne_center₂ := C.actual_blocker_ne_center₂
  B₁ := C.B₁
  B₂ := physicalRow.support
  row₁ := C.row₁
  row₂ := qDeletedK4Class_of_selectedFourClass physicalRow hdeleted
  B₁_card := C.B₁_card
  B₂_card := physicalRow.support_card
  overlap_le_two :=
    U5QDeletedK4Class.inter_card_le_two C.row₁
      (qDeletedK4Class_of_selectedFourClass physicalRow hdeleted)
      C.centers_ne

/-- Both sources of a collision interval give genuine common deletions at the
fresh center and the physical second apex, and robustness continues both
packets through their second rows. -/
structure ExactFourCollisionIntervalContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (endpoint : StrictPairCollisionIntervalEndpoint D S firstRow) : Type where
  physicalRow : SelectedFourClass D.A S.oppApex2
  rows_disjoint : Disjoint firstRow.support physicalRow.support
  sourcePacket :
    CommonDeletionTwoCenterPacket
      D H endpoint.source endpoint.center S.oppApex2
  sourcePacket_physicalSupport :
    sourcePacket.B₂ = physicalRow.support
  sourcePacket_physicalRadius :
    sourcePacket.row₂.radius = physicalRow.radius
  sourceSuccessor :
    SecondRowCommonDeletionSuccessor sourcePacket
  partnerPacket :
    CommonDeletionTwoCenterPacket
      D H endpoint.partner endpoint.center S.oppApex2
  partnerPacket_physicalSupport :
    partnerPacket.B₂ = physicalRow.support
  partnerPacket_physicalRadius :
    partnerPacket.row₂.radius = physicalRow.radius
  partnerSuccessor :
    SecondRowCommonDeletionSuccessor partnerPacket

/-- Construct the two source-faithful successors retained by a collision
interval endpoint. -/
theorem nonempty_collisionIntervalContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (secondRow : SelectedFourClass D.A S.oppApex2)
    (hrows : Disjoint firstRow.support secondRow.support)
    (endpoint : StrictPairCollisionIntervalEndpoint D S firstRow) :
    Nonempty (ExactFourCollisionIntervalContinuation H endpoint) := by
  have hcenterSource :
      HasNEquidistantPointsAt 4 (D.A.erase endpoint.source)
        endpoint.center := by
    have hrestored :=
      endpoint.restored_after_each_deletion
        endpoint.partner endpoint.partner_mem_deleted
    have herase :
        endpoint.deleted.erase endpoint.partner = {endpoint.source} := by
      rw [endpoint.deleted_eq_sources]
      ext x
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨_, rfl | rfl⟩
        · rfl
        · contradiction
      · rintro rfl
        exact ⟨endpoint.source_ne_partner, Or.inl rfl⟩
    rw [herase, Finset.sdiff_singleton_eq_erase] at hrestored
    exact hrestored
  have hcenterPartner :
      HasNEquidistantPointsAt 4 (D.A.erase endpoint.partner)
        endpoint.center := by
    have hrestored :=
      endpoint.restored_after_each_deletion
        endpoint.source endpoint.source_mem_deleted
    have herase :
        endpoint.deleted.erase endpoint.source = {endpoint.partner} := by
      rw [endpoint.deleted_eq_sources]
      ext x
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨_, rfl | rfl⟩
        · contradiction
        · rfl
      · rintro rfl
        exact ⟨Ne.symm endpoint.source_ne_partner, Or.inr rfl⟩
    rw [herase, Finset.sdiff_singleton_eq_erase] at hrestored
    exact hrestored
  rcases nonempty_commonDeletionTwoCenterPacket H
      (endpoint.deleted_subset_A endpoint.source_mem_deleted)
      endpoint.center_mem_A (oppApex2_mem_A S)
      endpoint.center_ne_secondApex hcenterSource
      endpoint.secondApex_survives_source_deletion with
    ⟨sourcePacket₀⟩
  have hsourceNotSecond : endpoint.source ∉ secondRow.support := by
    intro hsourceSecond
    exact Finset.disjoint_left.mp hrows endpoint.source_mem_row hsourceSecond
  let sourcePacket :=
    alignCommonDeletionPacketPhysicalRow
      sourcePacket₀ secondRow hsourceNotSecond
  rcases nonempty_secondRowSuccessor_of_robust R sourcePacket with
    ⟨sourceSuccessor⟩
  rcases nonempty_commonDeletionTwoCenterPacket H
      (endpoint.deleted_subset_A endpoint.partner_mem_deleted)
      endpoint.center_mem_A (oppApex2_mem_A S)
      endpoint.center_ne_secondApex hcenterPartner
      endpoint.secondApex_survives_partner_deletion with
    ⟨partnerPacket₀⟩
  have hpartnerNotSecond : endpoint.partner ∉ secondRow.support := by
    intro hpartnerSecond
    exact Finset.disjoint_left.mp hrows endpoint.partner_mem_row hpartnerSecond
  let partnerPacket :=
    alignCommonDeletionPacketPhysicalRow
      partnerPacket₀ secondRow hpartnerNotSecond
  rcases nonempty_secondRowSuccessor_of_robust R partnerPacket with
    ⟨partnerSuccessor⟩
  exact ⟨{
    physicalRow := secondRow
    rows_disjoint := hrows
    sourcePacket := sourcePacket
    sourcePacket_physicalSupport := rfl
    sourcePacket_physicalRadius := rfl
    sourceSuccessor := sourceSuccessor
    partnerPacket := partnerPacket
    partnerPacket_physicalSupport := rfl
    partnerPacket_physicalRadius := rfl
    partnerSuccessor := partnerSuccessor }⟩

/-- The other source's critical shell in a two-source unequal-radius core
survives deletion of the prescribed source. -/
private theorem unequalCore_freshCenter_survives_delete
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (endpoint : StrictPairUnequalCoreEndpoint D S firstRow)
    {source partner : ℝ²}
    (hsource : source ∈ endpoint.deleted)
    (hpartner : partner ∈ endpoint.deleted)
    (hne : source ≠ partner) :
    HasNEquidistantPointsAt 4 (D.A.erase source) endpoint.center := by
  let partnerIndex : {x : ℝ² // x ∈ endpoint.deleted} :=
    ⟨partner, hpartner⟩
  let partnerRow :=
    (endpoint.core.shellAt partnerIndex).toCriticalFourShell.toSelectedFourClass
  apply
    ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem
      partnerRow
  intro hsourceSupport
  have hsourceRadius :
      dist endpoint.center source = partnerRow.radius :=
    partnerRow.support_eq_radius source hsourceSupport
  have hpartnerRadius :
      partnerRow.radius = dist endpoint.center partner := by
    simpa [partnerRow, partnerIndex] using
      endpoint.core.shellAt_radius_eq partnerIndex
  exact
    endpoint.source_radii_injective
      source hsource partner hpartner hne
      (hsourceRadius.trans hpartnerRadius)

/-- The two distinct sources of an unequal-radius minimal core each give a
common deletion at the fresh center and physical second apex. -/
structure ExactFourUnequalCoreContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (endpoint : StrictPairUnequalCoreEndpoint D S firstRow) : Type where
  physicalRow : SelectedFourClass D.A S.oppApex2
  rows_disjoint : Disjoint firstRow.support physicalRow.support
  source : ℝ²
  partner : ℝ²
  source_mem_deleted : source ∈ endpoint.deleted
  partner_mem_deleted : partner ∈ endpoint.deleted
  source_ne_partner : source ≠ partner
  deleted_eq_sources : endpoint.deleted = {source, partner}
  sourcePacket :
    CommonDeletionTwoCenterPacket
      D H source endpoint.center S.oppApex2
  sourcePacket_physicalSupport :
    sourcePacket.B₂ = physicalRow.support
  sourcePacket_physicalRadius :
    sourcePacket.row₂.radius = physicalRow.radius
  sourceSuccessor :
    SecondRowCommonDeletionSuccessor sourcePacket
  partnerPacket :
    CommonDeletionTwoCenterPacket
      D H partner endpoint.center S.oppApex2
  partnerPacket_physicalSupport :
    partnerPacket.B₂ = physicalRow.support
  partnerPacket_physicalRadius :
    partnerPacket.row₂.radius = physicalRow.radius
  partnerSuccessor :
    SecondRowCommonDeletionSuccessor partnerPacket

/-- Construct the two source-faithful successors retained by a two-source
unequal-radius minimal core. -/
theorem nonempty_unequalCoreContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (secondRow : SelectedFourClass D.A S.oppApex2)
    (hrows : Disjoint firstRow.support secondRow.support)
    (endpoint : StrictPairUnequalCoreEndpoint D S firstRow) :
    Nonempty (ExactFourUnequalCoreContinuation H endpoint) := by
  rcases Finset.card_eq_two.mp endpoint.deleted_card_eq_two with
    ⟨source, partner, hne, hdeleted⟩
  have hsource : source ∈ endpoint.deleted := by
    rw [hdeleted]
    exact Finset.mem_insert_self _ _
  have hpartner : partner ∈ endpoint.deleted := by
    rw [hdeleted]
    exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
  have hsourceA : source ∈ D.A :=
    firstRow.support_subset_A (endpoint.deleted_subset_row hsource)
  have hpartnerA : partner ∈ D.A :=
    firstRow.support_subset_A (endpoint.deleted_subset_row hpartner)
  have hsourceFresh :
      HasNEquidistantPointsAt 4 (D.A.erase source) endpoint.center :=
    unequalCore_freshCenter_survives_delete
      endpoint hsource hpartner hne
  have hpartnerFresh :
      HasNEquidistantPointsAt 4 (D.A.erase partner) endpoint.center :=
    unequalCore_freshCenter_survives_delete
      endpoint hpartner hsource (Ne.symm hne)
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA endpoint.center_mem_A (oppApex2_mem_A S)
      endpoint.center_ne_secondApex hsourceFresh
      (endpoint.secondApex_survives_source_deletion source hsource) with
    ⟨sourcePacket₀⟩
  have hsourceNotSecond : source ∉ secondRow.support := by
    intro hsourceSecond
    exact Finset.disjoint_left.mp hrows
      (endpoint.deleted_subset_row hsource) hsourceSecond
  let sourcePacket :=
    alignCommonDeletionPacketPhysicalRow
      sourcePacket₀ secondRow hsourceNotSecond
  rcases nonempty_secondRowSuccessor_of_robust R sourcePacket with
    ⟨sourceSuccessor⟩
  rcases nonempty_commonDeletionTwoCenterPacket H
      hpartnerA endpoint.center_mem_A (oppApex2_mem_A S)
      endpoint.center_ne_secondApex hpartnerFresh
      (endpoint.secondApex_survives_source_deletion partner hpartner) with
    ⟨partnerPacket₀⟩
  have hpartnerNotSecond : partner ∉ secondRow.support := by
    intro hpartnerSecond
    exact Finset.disjoint_left.mp hrows
      (endpoint.deleted_subset_row hpartner) hpartnerSecond
  let partnerPacket :=
    alignCommonDeletionPacketPhysicalRow
      partnerPacket₀ secondRow hpartnerNotSecond
  rcases nonempty_secondRowSuccessor_of_robust R partnerPacket with
    ⟨partnerSuccessor⟩
  exact ⟨{
    physicalRow := secondRow
    rows_disjoint := hrows
    source
    partner
    source_mem_deleted := hsource
    partner_mem_deleted := hpartner
    source_ne_partner := hne
    deleted_eq_sources := hdeleted
    sourcePacket
    sourcePacket_physicalSupport := rfl
    sourcePacket_physicalRadius := rfl
    sourceSuccessor
    partnerPacket
    partnerPacket_physicalSupport := rfl
    partnerPacket_physicalRadius := rfl
    partnerSuccessor }⟩

/-- The exact two-radius normal form after consuming the critical alternative
of the singleton common-deletion branch. -/
inductive ExactFourTwoRadiusSuccessorNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2) : Type
  | collisionInterval
      (endpoint : StrictPairCollisionIntervalEndpoint D S firstRow)
      (continuation : ExactFourCollisionIntervalContinuation H endpoint)
  | singletonSuccessor
      (endpoint : StrictPairSingletonCommonDeletionEndpoint D S H)
      (successor : SecondRowCommonDeletionSuccessor endpoint.packet)
  | unequalCore
      (endpoint : StrictPairUnequalCoreEndpoint D S firstRow)
      (continuation : ExactFourUnequalCoreContinuation H endpoint)

/-- Refine the raw normal form by forcing a successor in its singleton
common-deletion constructor. -/
theorem nonempty_exactFourTwoRadiusSuccessorNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (secondRow : SelectedFourClass D.A S.oppApex2)
    (hrows : Disjoint firstRow.support secondRow.support)
    (normalForm : ExactFourTwoRadiusNormalForm H firstRow) :
    Nonempty (ExactFourTwoRadiusSuccessorNormalForm H firstRow) := by
  cases normalForm with
  | collisionInterval endpoint =>
      rcases nonempty_collisionIntervalContinuation
          R secondRow hrows endpoint with
        ⟨continuation⟩
      exact ⟨.collisionInterval endpoint continuation⟩
  | singletonCommonDeletion endpoint =>
      rcases
          nonempty_secondRowCommonDeletionSuccessor_of_singletonEndpoint
            R endpoint with
        ⟨successor⟩
      exact ⟨.singletonSuccessor endpoint successor⟩
  | unequalCore endpoint =>
      rcases nonempty_unequalCoreContinuation
          R secondRow hrows endpoint with
        ⟨continuation⟩
      exact ⟨.unequalCore endpoint continuation⟩

/-- A q-deleted selected row is contained in its complete ambient radius
class. -/
private theorem qDeleted_support_subset_ambientSelectedClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    B ⊆ SelectedClass D.A center K.radius := by
  intro z hz
  have hzSkeleton : z ∈ D.skeleton q :=
    (Finset.mem_erase.mp (K.subset hz)).2
  have hzA : z ∈ D.A := (Finset.mem_erase.mp hzSkeleton).2
  exact mem_selectedClass.mpr ⟨hzA, K.same_radius z hz⟩

/-- Once the singleton packet is aligned with the two original physical
rows, its alternate-radius successor either returns exactly to the original
second row or supplies a third physical radius disjoint from that row. -/
inductive ExactFourSingletonAlternateRadiusOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (endpoint : StrictPairSingletonCommonDeletionEndpoint D S H)
    (successor : SecondRowCommonDeletionSuccessor endpoint.packet) : Type
  | returnsToSecondRow
      (radius_eq :
        successor.packet.row₂.radius = endpoint.secondRow.radius)
      (support_eq :
        successor.packet.B₂ = endpoint.secondRow.support)
  | thirdRadius
      (radius_ne :
        successor.packet.row₂.radius ≠ endpoint.secondRow.radius)
      (supports_disjoint :
        Disjoint endpoint.secondRow.support successor.packet.B₂)

/-- Once a collision- or unequal-core packet is aligned to the original
physical second row, its successor either returns exactly to the original
first row or supplies a third radius disjoint from that first row. -/
inductive ExactFourAlternatingSuccessorOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (firstRow : SelectedFourClass D.A S.oppApex2)
    {deleted center : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2}
    (successor : SecondRowCommonDeletionSuccessor C) : Type
  | returnsToFirstRow
      (radius_eq :
        successor.packet.row₂.radius = firstRow.radius)
      (support_eq :
        successor.packet.B₂ = firstRow.support)
  | thirdRadius
      (radius_ne :
        successor.packet.row₂.radius ≠ firstRow.radius)
      (supports_disjoint :
        Disjoint firstRow.support successor.packet.B₂)

/-- Source and radius data retained by a successor whose old physical row is
caller-controlled.  Together with `outcome`, this is an explicit alternating
two-row transition or a third-radius escape. -/
structure ExactFourAlternatingSuccessorClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (firstRow physicalRow : SelectedFourClass D.A S.oppApex2)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2)
    (successor : SecondRowCommonDeletionSuccessor C) : Type where
  source_mem_physicalRow :
    successor.source ∈ physicalRow.support
  source_not_mem_firstRow :
    successor.source ∉ firstRow.support
  successor_radius_ne_physicalRow :
    successor.packet.row₂.radius ≠ physicalRow.radius
  successor_support_disjoint_physicalRow :
    Disjoint physicalRow.support successor.packet.B₂
  outcome :
    ExactFourAlternatingSuccessorOutcome firstRow successor

/-- Classify a successor from a prescribed physical row when every positive
radius class at the second apex has cardinality below five. -/
theorem nonempty_alternatingSuccessorClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hnoFive :
      ∀ candidateRadius : ℝ, 0 < candidateRadius →
        (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (firstRow physicalRow : SelectedFourClass D.A S.oppApex2)
    (hrows : Disjoint firstRow.support physicalRow.support)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2)
    (hphysicalSupport : C.B₂ = physicalRow.support)
    (hphysicalRadius : C.row₂.radius = physicalRow.radius)
    (successor : SecondRowCommonDeletionSuccessor C) :
    Nonempty
      (ExactFourAlternatingSuccessorClassification
        firstRow physicalRow C successor) := by
  cases successor.secondCenterShape with
  | sameRadiusOverflow _radiusEq hfive =>
      have hlt :=
        hnoFive successor.packet.row₂.radius
          successor.packet.row₂.radius_pos
      omega
  | alternateRadius hradius hdisjoint =>
      have hsourcePhysical :
          successor.source ∈ physicalRow.support := by
        rw [← hphysicalSupport]
        exact successor.source_mem_secondRow
      have hsourceFirst :
          successor.source ∉ firstRow.support := by
        intro hsourceFirst
        exact Finset.disjoint_left.mp hrows
          hsourceFirst hsourcePhysical
      have hradiusPhysical :
          successor.packet.row₂.radius ≠ physicalRow.radius := by
        intro heq
        exact hradius (heq.trans hphysicalRadius.symm)
      have hdisjointPhysical :
          Disjoint physicalRow.support successor.packet.B₂ := by
        rw [← hphysicalSupport]
        exact hdisjoint
      have houtcome :
          ExactFourAlternatingSuccessorOutcome firstRow successor := by
        by_cases hreturn :
            successor.packet.row₂.radius = firstRow.radius
        · have hsuccessorSub :
              successor.packet.B₂ ⊆
                SelectedClass D.A S.oppApex2 firstRow.radius := by
            simpa [hreturn] using
              qDeleted_support_subset_ambientSelectedClass
                successor.packet.row₂
          have hfirstSub :
              firstRow.support ⊆
                SelectedClass D.A S.oppApex2 firstRow.radius := by
            intro z hz
            exact mem_selectedClass.mpr
              ⟨firstRow.support_subset_A hz,
                firstRow.support_eq_radius z hz⟩
          have hclassCardLe :
              (SelectedClass D.A S.oppApex2
                firstRow.radius).card ≤ 4 := by
            have hlt :=
              hnoFive firstRow.radius firstRow.radius_pos
            omega
          have hsuccessorEq :
              successor.packet.B₂ =
                SelectedClass D.A S.oppApex2 firstRow.radius := by
            apply Finset.eq_of_subset_of_card_le hsuccessorSub
            simpa [successor.packet.B₂_card] using hclassCardLe
          have hfirstEq :
              firstRow.support =
                SelectedClass D.A S.oppApex2 firstRow.radius := by
            apply Finset.eq_of_subset_of_card_le hfirstSub
            simpa [firstRow.support_card] using hclassCardLe
          exact .returnsToFirstRow hreturn
            (hsuccessorEq.trans hfirstEq.symm)
        · let newSecond :=
            ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
              successor.packet
          have hradii :
              firstRow.radius ≠ newSecond.radius := by
            intro heq
            exact hreturn
              (by simpa [newSecond] using heq.symm)
          have hfirstDisjoint :
              Disjoint firstRow.support newSecond.support :=
            (sameCenter_radius_eq_or_support_disjoint
              firstRow newSecond).resolve_left hradii
          exact .thirdRadius hreturn
            (by simpa [newSecond] using hfirstDisjoint)
      exact ⟨{
        source_mem_physicalRow := hsourcePhysical
        source_not_mem_firstRow := hsourceFirst
        successor_radius_ne_physicalRow := hradiusPhysical
        successor_support_disjoint_physicalRow := hdisjointPhysical
        outcome := houtcome }⟩

/-- The two-radius normal form after using the global absence of five-point
positive-radius classes to eliminate the singleton successor's equal-radius
overflow arm. -/
inductive ExactFourTwoRadiusNoFiveNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2) : Type
  | collisionInterval
      (endpoint : StrictPairCollisionIntervalEndpoint D S firstRow)
      (continuation : ExactFourCollisionIntervalContinuation H endpoint)
      (sourceClassification :
        ExactFourAlternatingSuccessorClassification
          firstRow continuation.physicalRow continuation.sourcePacket
            continuation.sourceSuccessor)
      (partnerClassification :
        ExactFourAlternatingSuccessorClassification
          firstRow continuation.physicalRow continuation.partnerPacket
            continuation.partnerSuccessor)
  | singletonAlternateRadius
      (endpoint : StrictPairSingletonCommonDeletionEndpoint D S H)
      (successor : SecondRowCommonDeletionSuccessor endpoint.packet)
      (radius_ne :
        successor.packet.row₂.radius ≠ endpoint.packet.row₂.radius)
      (supports_disjoint :
        Disjoint endpoint.packet.B₂ successor.packet.B₂)
      (successor_source_mem_firstRow :
        successor.source ∈ endpoint.firstRow.support)
      (successor_support_disjoint_from_firstRow :
        Disjoint endpoint.firstRow.support successor.packet.B₂)
      (outcome :
        ExactFourSingletonAlternateRadiusOutcome endpoint successor)
  | unequalCore
      (endpoint : StrictPairUnequalCoreEndpoint D S firstRow)
      (continuation : ExactFourUnequalCoreContinuation H endpoint)
      (sourceClassification :
        ExactFourAlternatingSuccessorClassification
          firstRow continuation.physicalRow continuation.sourcePacket
            continuation.sourceSuccessor)
      (partnerClassification :
        ExactFourAlternatingSuccessorClassification
          firstRow continuation.physicalRow continuation.partnerPacket
            continuation.partnerSuccessor)

/-- In the no-five branch, a singleton common-deletion successor necessarily
uses an alternate second-apex radius with disjoint selected supports. -/
theorem nonempty_exactFourTwoRadiusNoFiveNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (hnoFive :
      ∀ candidateRadius : ℝ, 0 < candidateRadius →
        (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (normalForm : ExactFourTwoRadiusSuccessorNormalForm H firstRow) :
    Nonempty (ExactFourTwoRadiusNoFiveNormalForm H firstRow) := by
  cases normalForm with
  | collisionInterval endpoint continuation =>
      rcases nonempty_alternatingSuccessorClassification
          hnoFive firstRow continuation.physicalRow
          continuation.rows_disjoint continuation.sourcePacket
          continuation.sourcePacket_physicalSupport
          continuation.sourcePacket_physicalRadius
          continuation.sourceSuccessor with
        ⟨sourceClassification⟩
      rcases nonempty_alternatingSuccessorClassification
          hnoFive firstRow continuation.physicalRow
          continuation.rows_disjoint continuation.partnerPacket
          continuation.partnerPacket_physicalSupport
          continuation.partnerPacket_physicalRadius
          continuation.partnerSuccessor with
        ⟨partnerClassification⟩
      exact ⟨.collisionInterval endpoint continuation
        sourceClassification partnerClassification⟩
  | singletonSuccessor endpoint successor =>
      cases successor.secondCenterShape with
      | sameRadiusOverflow _radiusEq hfive =>
          have hlt :=
            hnoFive successor.packet.row₂.radius
              successor.packet.row₂.radius_pos
          omega
      | alternateRadius hradius hdisjoint =>
          have hsourceFirst :
              successor.source ∈ endpoint.firstRow.support := by
            rw [← endpoint.packet_physicalRow_eq_firstRow]
            exact successor.source_mem_secondRow
          have hdisjointFirst :
              Disjoint endpoint.firstRow.support successor.packet.B₂ := by
            rw [← endpoint.packet_physicalRow_eq_firstRow]
            exact hdisjoint
          have houtcome :
              ExactFourSingletonAlternateRadiusOutcome endpoint successor := by
            by_cases hreturn :
                successor.packet.row₂.radius = endpoint.secondRow.radius
            · have hsuccessorSub :
                  successor.packet.B₂ ⊆
                    SelectedClass D.A S.oppApex2
                      endpoint.secondRow.radius := by
                simpa [hreturn] using
                  qDeleted_support_subset_ambientSelectedClass
                    successor.packet.row₂
              have hsecondSub :
                  endpoint.secondRow.support ⊆
                    SelectedClass D.A S.oppApex2
                      endpoint.secondRow.radius := by
                intro z hz
                exact mem_selectedClass.mpr
                  ⟨endpoint.secondRow.support_subset_A hz,
                    endpoint.secondRow.support_eq_radius z hz⟩
              have hclassCardLe :
                  (SelectedClass D.A S.oppApex2
                    endpoint.secondRow.radius).card ≤ 4 := by
                have hlt :=
                  hnoFive endpoint.secondRow.radius
                    endpoint.secondRow.radius_pos
                omega
              have hsuccessorEq :
                  successor.packet.B₂ =
                    SelectedClass D.A S.oppApex2
                      endpoint.secondRow.radius := by
                apply Finset.eq_of_subset_of_card_le hsuccessorSub
                simpa [successor.packet.B₂_card] using hclassCardLe
              have hsecondEq :
                  endpoint.secondRow.support =
                    SelectedClass D.A S.oppApex2
                      endpoint.secondRow.radius := by
                apply Finset.eq_of_subset_of_card_le hsecondSub
                simpa [endpoint.secondRow.support_card] using hclassCardLe
              exact .returnsToSecondRow hreturn
                (hsuccessorEq.trans hsecondEq.symm)
            · let oldSecond := endpoint.secondRow
              let newSecond :=
                ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
                  successor.packet
              have hradii :
                  oldSecond.radius ≠ newSecond.radius := by
                intro heq
                exact hreturn
                  (by simpa [oldSecond, newSecond] using heq.symm)
              have hsecondDisjoint :
                  Disjoint oldSecond.support newSecond.support :=
                (sameCenter_radius_eq_or_support_disjoint
                  oldSecond newSecond).resolve_left hradii
              exact .thirdRadius hreturn
                (by simpa [oldSecond, newSecond] using hsecondDisjoint)
          exact ⟨.singletonAlternateRadius
            endpoint successor hradius hdisjoint hsourceFirst
              hdisjointFirst houtcome⟩
  | unequalCore endpoint continuation =>
      rcases nonempty_alternatingSuccessorClassification
          hnoFive firstRow continuation.physicalRow
          continuation.rows_disjoint continuation.sourcePacket
          continuation.sourcePacket_physicalSupport
          continuation.sourcePacket_physicalRadius
          continuation.sourceSuccessor with
        ⟨sourceClassification⟩
      rcases nonempty_alternatingSuccessorClassification
          hnoFive firstRow continuation.physicalRow
          continuation.rows_disjoint continuation.partnerPacket
          continuation.partnerPacket_physicalSupport
          continuation.partnerPacket_physicalRadius
          continuation.partnerSuccessor with
        ⟨partnerClassification⟩
      exact ⟨.unequalCore endpoint continuation
        sourceClassification partnerClassification⟩

#print axioms ExactFourTwoRadiusSuccessorNormalForm
#print axioms nonempty_exactFourTwoRadiusSuccessorNormalForm
#print axioms ExactFourCollisionIntervalContinuation
#print axioms nonempty_collisionIntervalContinuation
#print axioms ExactFourUnequalCoreContinuation
#print axioms nonempty_unequalCoreContinuation
#print axioms ExactFourSingletonAlternateRadiusOutcome
#print axioms ExactFourAlternatingSuccessorOutcome
#print axioms ExactFourAlternatingSuccessorClassification
#print axioms nonempty_alternatingSuccessorClassification
#print axioms ExactFourTwoRadiusNoFiveNormalForm
#print axioms nonempty_exactFourTwoRadiusNoFiveNormalForm

end ATailUniqueFourRobustLargeRadiusContinuationScratch
end Problem97
