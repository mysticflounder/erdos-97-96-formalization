/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Scratch: global-field boundary on the exact-five all-reverse arm

This file records the exact source-faithful facts contributed by the retained
`noM44` hypothesis and the unused-source critical row.  They are deliberately
stated at the full-parent boundary: the current surplus packet is already
non-`IsM44`, while the unused row is centered at neither physical apex and
omits both continuation sources.

Thus the unused row cannot silently be used as the missing first-apex row, and
`noM44` can add new force only through a genuinely different support triangle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAllReverseNoM44DirectCloserScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- Exact boundary supplied by the global fields already retained in a full
exact-five all-reverse parent.

The negative row incidences are not a proposed producer.  They record that
the actual unused-source row has the wrong polarity for the known two-hit and
first-apex occurrence terminals. -/
structure FullParentAllReverseGlobalFieldBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (_A : FullParentExactFiveAllReverseData L profile continuation) : Prop where
  currentPacket_not_isM44 : ¬ S.IsM44
  unusedBlocker_ne_firstApex :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠ S.oppApex1
  unusedBlocker_ne_secondApex :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠ S.oppApex2
  first_not_mem_unusedRow :
    continuation.first ∉
      (H.selectedAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  second_not_mem_unusedRow :
    continuation.second ∉
      (H.selectedAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  unusedSource_deletion_blocked_at_unusedBlocker :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase continuation.unusedRow.unused.point)
      (H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A)
  unusedSource_deletion_survives_at_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase continuation.unusedRow.unused.point) S.oppApex2

/-- The full parent supplies the boundary above without any new choice of
critical system or support triangle. -/
theorem fullParentAllReverseGlobalFieldBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    FullParentAllReverseGlobalFieldBoundary A := by
  refine {
    currentPacket_not_isM44 := ?_
    unusedBlocker_ne_firstApex := ?_
    unusedBlocker_ne_secondApex :=
      continuation.unusedRow.blocker_ne_physicalApex
    first_not_mem_unusedRow :=
      continuation.first_not_mem_actualCriticalSupport
    second_not_mem_unusedRow :=
      continuation.second_not_mem_actualCriticalSupport
    unusedSource_deletion_blocked_at_unusedBlocker :=
      continuation.unusedRow.source_deletion_blocked_at_blocker
    unusedSource_deletion_survives_at_secondApex :=
      continuation.unusedRow.physicalApex_survives_source_deletion }
  · intro hM44
    rcases hM44 with ⟨hfirst, _hsecond⟩
    have hlarge := L.firstOppCap_card_ge_six
    omega
  · exact R.actualBlocker_ne_firstApex
      continuation.unusedRow.unused.point
      continuation.unusedRow.source_mem_A

/-- In particular the actual unused-source row cannot be either retained
first-apex shell role: its center is provably different from the first apex.
This is the smallest source-level obstruction to treating the continuation
row as the missing occurrence producer. -/
theorem unusedCriticalRow_center_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠ S.oppApex1 :=
  (fullParentAllReverseGlobalFieldBoundary A).unusedBlocker_ne_firstApex

/-- The two continuation sources cannot instantiate the already-contradictory
two-hit packet at the unused critical row: the construction selects them from
the complementary low-hit set. -/
theorem continuationPair_not_contained_in_unusedCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    ¬ (continuation.first ∈
          (H.selectedAt continuation.unusedRow.unused.point
            continuation.unusedRow.source_mem_A).toCriticalFourShell.support ∧
        continuation.second ∈
          (H.selectedAt continuation.unusedRow.unused.point
            continuation.unusedRow.source_mem_A).toCriticalFourShell.support) := by
  rintro ⟨hfirst, _hsecond⟩
  exact (fullParentAllReverseGlobalFieldBoundary A).first_not_mem_unusedRow hfirst

/-- The origin-tagged continuation sources are physical-cap points, whereas
every transition reverse residual is outside that cap.  Thus the pair omitted
by the unused row is not itself a candidate reverse outside pair. -/
theorem continuationSources_not_mem_transitionReverseOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    ∀ q : PhysicalVertex profile,
      continuation.first ∉ transitionReverseOutsidePair A.transition q ∧
        continuation.second ∉ transitionReverseOutsidePair A.transition q := by
  intro q
  have hfirstCap : continuation.first ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp continuation.first_mem_physicalInterior).2
  have hsecondCap : continuation.second ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (Finset.mem_inter.mp continuation.second_mem_physicalInterior).2
  constructor
  · intro hfirst
    exact (Finset.mem_sdiff.mp
      (transitionReverseOutsidePair_subset_complement A.transition q hfirst)).2
        hfirstCap
  · intro hsecond
    exact (Finset.mem_sdiff.mp
      (transitionReverseOutsidePair_subset_complement A.transition q hsecond)).2
        hsecondCap

#print axioms fullParentAllReverseGlobalFieldBoundary
#print axioms unusedCriticalRow_center_ne_firstApex
#print axioms continuationPair_not_contained_in_unusedCriticalRow
#print axioms continuationSources_not_mem_transitionReverseOutsidePair

end ATailAllReverseNoM44DirectCloserScratch
end Problem97
