/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap

/-!
# Exact-five distinct blockers: physical-second-apex split

The directed cross-deletion survival retained by the exact-five distinct-
blocker residual has an immediate global consumer.  In either orientation,
the same deletion preserves K4 at an actual blocker and at the physical
second apex.  This gives a `CommonDeletionTwoCenterPacket`, which the
production physical-second-apex theorem splits into full deletion robustness
or a critical shell.  The critical shell is consumed immediately by the
production non-surplus swap and becomes a protected exact-four frontier.

Thus the distinct-blocker leaf has only two honest descendants: a bi-apex
robust exact-five residual, or the already identified swapped exact-four
frontier.  No selected row is treated as the whole carrier, and the concrete
critical system is unchanged.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFiveDistinctHybridScratch

open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailUniqueArmRouteAuditScratch
open ATailUniqueRowProducerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- The exact-five class already forces the first physical opposite cap to
have at least five points. -/
theorem firstOppCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F) :
    5 ≤ S.oppCap1.card := by
  have hinterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    firstApex_cardFive_interior_card_ge_three D S
      (frontier_radius_pos R.base.interior.frontier)
      R.base.class_card_eq_five
  have hinteriorCap : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hinterior.trans (Finset.card_le_card (Finset.inter_subset_right))
  have hcap := capInteriorByIndex_card_add_two S S.oppIndex1
  have hcapByIndex : 5 ≤ (S.capByIndex S.oppIndex1).card := by omega
  simpa only [capByIndex_oppIndex1_eq_oppCap1] using hcapByIndex

/-- The genuinely unresolved descendant of the distinct-blocker leaf.  It
retains the complete exact-five parent while recording full robustness at
both physical apices and the resulting three large-cap/cardinality bounds. -/
structure OriginalUniqueFiveDistinctBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F) : Prop where
  secondApex_fullyDeletionRobust : FullyDeletionRobustAt D S.oppApex2
  firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card
  secondOppCap_card_ge_five : 5 ≤ S.oppCap2.card
  carrier_card_ge_twelve : 12 ≤ D.A.card

private theorem biApexRobustResidual_of_secondApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2) :
    OriginalUniqueFiveDistinctBiApexRobustResidual R := by
  have hfirstCap : 5 ≤ S.oppCap1.card := firstOppCap_card_ge_five R
  have hsecondCap : 5 ≤ S.oppCap2.card :=
    second_oppCap_card_ge_five hsecond
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hcarrier : 12 ≤ D.A.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    all_goals
      simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirstCap hsecondCap
      omega
  exact {
    secondApex_fullyDeletionRobust := hsecond
    firstOppCap_card_ge_five := firstOppCap_card_ge_five R
    secondOppCap_card_ge_five := hsecondCap
    carrier_card_ge_twelve := hcarrier }

/-- Exact source-level descendants after the directed survival fact is fed
through the physical-second-apex consumer. -/
inductive OriginalUniqueFiveDistinctPhysicalSecondOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F) : Prop
  | biApexRobust
      (residual : OriginalUniqueFiveDistinctBiApexRobustResidual R)
  | swappedUniqueFour
      (frontier : SwappedFirstApexUniqueFourFrontier D S H)

private theorem outcome_of_commonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    OriginalUniqueFiveDistinctPhysicalSecondOutcome R := by
  rcases physicalSecondApex_commonDeletion_robust_or_critical C with
    hrobust | hcritical
  · exact .biApexRobust
      (biApexRobustResidual_of_secondApexRobust R hrobust.some)
  · rcases physicalSecondCritical_reorients_to_swappedUniqueFour
        hcritical.some.shell hcritical.some.deletion_blocked with ⟨U⟩
    exact .swappedUniqueFour U

/-- The directed distinct-blocker survival is immediately consumed.  The
only resulting branches are the full-parent bi-apex robust residual and a
swapped protected exact-four frontier. -/
theorem physicalSecondApex_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F) :
    OriginalUniqueFiveDistinctPhysicalSecondOutcome R := by
  let P := R.base.interior.frontier.pair
  rcases R.directed_cross_deletion_survival with hdeleteW | hdeleteQ
  · have hcenterA : H.centerAt P.q P.q_mem_A ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.center_mem).2
    rcases nonempty_commonDeletionTwoCenterPacket H
        P.w_mem_A hcenterA (oppApex2_mem_A S)
        P.q_blocker_ne_oppApex2 hdeleteW P.w_survives with ⟨C⟩
    exact outcome_of_commonDeletionPacket R C
  · have hcenterA : H.centerAt P.w P.w_mem_A ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.center_mem).2
    rcases nonempty_commonDeletionTwoCenterPacket H
        P.q_mem_A hcenterA (oppApex2_mem_A S)
        P.w_blocker_ne_oppApex2 hdeleteQ P.q_survives with ⟨C⟩
    exact outcome_of_commonDeletionPacket R C

#print axioms firstOppCap_card_ge_five
#print axioms physicalSecondApex_split

end ATailUniqueFiveDistinctHybridScratch
end Problem97
