/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustSecondApexGeometry

/-!
# Scratch: criticality at a deletion-robust physical apex

This file separates the two proposed physical-apex producers from the actual
remaining theorem.  `HasCriticalDeletionAt D center` is exactly the negation
of `FullyDeletionRobustAt D center`.  Moreover, if a retained critical system
maps any source to `center`, its defining no-free-deletion field already
produces `HasCriticalDeletionAt D center`.

Consequently neither a critical deletion nor a critical-map preimage can be
derived while retaining a proof of full deletion robustness, unless the
derivation itself is the missing contradiction.  On the card-at-least-fourteen
surface, robustness also rules out the swapped unique-four output and forces
the exact source-faithful successor arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalApexCriticalityScratch

open ATailCommonDeletionUniformConsumerScratch
open ATailCriticalPairFrontier
open ATailRobustSecondApexGeometryScratch
open ATailRTwoOffLiveHandlerScratch
open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- A critical deletion is exactly the classical negation of surviving every
single carrier deletion at the same center. -/
theorem hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt
    {D : CounterexampleData} {center : ℝ²} :
    HasCriticalDeletionAt D center ↔
      ¬ FullyDeletionRobustAt D center := by
  constructor
  · rintro ⟨z, hzA, hblocked⟩ R
    exact hblocked (R.survives z hzA)
  · intro hnotRobust
    by_contra hnotCritical
    apply hnotRobust
    refine ⟨?_⟩
    intro z hzA
    by_contra hblocked
    exact hnotCritical ⟨z, hzA, hblocked⟩

/-- A source mapped to a prescribed center by a legal critical system already
supplies a critical deletion at that center. -/
theorem hasCriticalDeletionAt_of_centerAt_eq
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source center : ℝ²} (hsource : source ∈ D.A)
    (hcenter : H.centerAt source hsource = center) :
    HasCriticalDeletionAt D center := by
  refine ⟨source, hsource, ?_⟩
  intro hsurvives
  apply H.no_qfree_at source hsource
  rw [hcenter]
  exact hsurvives

/-- Under deletion robustness, the proposed critical-deletion producer and
the proposed critical-map-preimage producer are simultaneously impossible. -/
theorem fullyDeletionRobustAt_excludes_physicalApexCriticalityProducers
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {center : ℝ²} (R : FullyDeletionRobustAt D center) :
    ¬ HasCriticalDeletionAt D center ∧
      ¬ (∃ source : ℝ², ∃ hsource : source ∈ D.A,
        H.centerAt source hsource = center) := by
  constructor
  · intro hcritical
    exact (hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt.mp hcritical) R
  · rintro ⟨source, hsource, hcenter⟩
    exact (hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt.mp
      (hasCriticalDeletionAt_of_centerAt_eq hsource hcenter)) R

/-- The exact card-at-least-fourteen fixed point left after assuming the
physical second apex is fully deletion-robust.  The swapped unique-four arm
is contradictory, so the source-faithful successor is forced. -/
structure SourceFaithfulCardFourteenRobustSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Type where
  reduction : SourceFaithfulCardFourteenSecondApexReduction P
  successor : SecondRowCommonDeletionSuccessor reduction.packet

/-- Construct the source-faithful successor fixed point from the full
card-at-least-fourteen surface and physical-apex robustness. -/
theorem nonempty_sourceFaithfulCardFourteenRobustSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card)
    (R : FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (SourceFaithfulCardFourteenRobustSuccessor P) := by
  rcases nonempty_sourceFaithfulCardFourteenSecondApexReduction
      P hnotFour hwSupport hcard with ⟨reduction⟩
  rcases reduction.outcome with hsuccessor | hswapped
  · rcases hsuccessor with ⟨successor⟩
    exact ⟨⟨reduction, successor⟩⟩
  · rcases hswapped with ⟨swapped⟩
    exact False.elim
      (false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour
        R swapped)

/-- The successor source remains a carrier point and its retained critical
blocker is necessarily different from the physical second apex. -/
theorem SourceFaithfulCardFourteenRobustSuccessor.successor_source_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (R : FullyDeletionRobustAt D S.oppApex2)
    (K : SourceFaithfulCardFourteenRobustSuccessor P) :
    ∃ hsource : K.successor.source ∈ D.A,
      H.centerAt K.successor.source hsource ≠ S.oppApex2 := by
  have hsource : K.successor.source ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp
        (K.reduction.packet.row₂.subset
          K.successor.source_mem_secondRow)).2).2
  exact ⟨hsource, R.centerAt_ne H K.successor.source hsource⟩

#print axioms hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt
#print axioms hasCriticalDeletionAt_of_centerAt_eq
#print axioms fullyDeletionRobustAt_excludes_physicalApexCriticalityProducers
#print axioms nonempty_sourceFaithfulCardFourteenRobustSuccessor
#print axioms
  SourceFaithfulCardFourteenRobustSuccessor.successor_source_profile

end ATailPhysicalApexCriticalityScratch
end Problem97
