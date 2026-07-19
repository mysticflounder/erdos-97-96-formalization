/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle

/-!
# Source-valid continuation of the retained-matching endpoint split

The endpoint collision already carries a source-faithful critical fiber and a
first-apex row hit.  This file chooses a genuinely fourth source from that row:
it is different from both fiber endpoints and from the middle source of the
two-step walk.  Its actual row either contains the opposite fiber endpoint, or
its omission produces a new common-deletion packet.

The three-distinct-blocker endpoint has a complementary exact split.  The
closing endpoint-to-first cross incidence either occurs, or its omission
produces the third packet of a source-exact three-cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMatchingEndpointPathTerminalScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem exists_support_point_ne_three
    {A : Finset ℝ²} {center a b c : ℝ²}
    (row : SelectedFourClass A center) :
    ∃ J ∈ row.support, J ≠ a ∧ J ≠ b ∧ J ≠ c := by
  by_contra hnone
  push_neg at hnone
  have hsub : row.support ⊆ ({a, b, c} : Finset ℝ²) := by
    intro J hJ
    by_cases hJa : J = a
    · simp [hJa]
    by_cases hJb : J = b
    · simp [hJb]
    have hJc : J = c := hnone J hJ hJa hJb
    simp [hJc]
  have hcard := Finset.card_le_card hsub
  have habc : ({a, b, c} : Finset ℝ²).card ≤ ({b, c} : Finset ℝ²).card + 1 :=
    Finset.card_insert_le a {b, c}
  have hbc : ({b, c} : Finset ℝ²).card ≤ ({c} : Finset ℝ²).card + 1 :=
    Finset.card_insert_le b {c}
  have hc : ({c} : Finset ℝ²).card = 1 := Finset.card_singleton c
  rw [row.support_card] at hcard
  omega

/-- A genuinely new first-apex row source attached to the endpoint collision.
It avoids both fiber endpoints and the middle source of the two-step walk. -/
structure EndpointFreshFirstApexRowSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation E.fiber C K
  row : SelectedFourClass D.A S.oppApex1
  C_mem_row : C ∈ row.support
  J : ℝ²
  J_mem_row : J ∈ row.support
  J_ne_C : J ≠ C
  J_ne_K : J ≠ K
  J_ne_middle : J ≠ W.second
  J_mem_A : J ∈ D.A

/-- The endpoint collision always supplies a fourth, source-valid row source.
The construction uses the already-forced `RowHit`; no new incidence is
assumed. -/
theorem nonempty_endpointFreshFirstApexRowSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (E : RetainedMatchingEndpointCriticalFiber W) :
    Nonempty (EndpointFreshFirstApexRowSource E) := by
  have hsource₁NeMiddle : E.fiber.source₁.1 ≠ W.second := by
    rw [E.fiber_source₁_eq_first]
    exact W.first_ne_second
  have hsource₂NeMiddle : E.fiber.source₂.1 ≠ W.second := by
    rw [E.fiber_source₂_eq_next]
    exact W.second_ne_next.symm
  rcases exists_support_point_ne_three
      (a := E.fiber.source₁.1) (b := E.fiber.source₂.1)
      (c := W.second) E.rowHit.row with
    ⟨J, hJ, hJSource₁, hJSource₂, hJMiddle⟩
  rcases E.rowHit.hitSource_is_fiber_source with hhit | hhit
  · exact ⟨{
      C := E.fiber.source₁.1
      K := E.fiber.source₂.1
      fiber_orientation := Or.inl ⟨rfl, rfl⟩
      row := E.rowHit.row
      C_mem_row := by simpa only [← hhit] using E.rowHit.hitSource_mem_row
      J := J
      J_mem_row := hJ
      J_ne_C := hJSource₁
      J_ne_K := hJSource₂
      J_ne_middle := hJMiddle
      J_mem_A := E.rowHit.row.support_subset_A hJ }⟩
  · exact ⟨{
      C := E.fiber.source₂.1
      K := E.fiber.source₁.1
      fiber_orientation := Or.inr ⟨rfl, rfl⟩
      row := E.rowHit.row
      C_mem_row := by simpa only [← hhit] using E.rowHit.hitSource_mem_row
      J := J
      J_mem_row := hJ
      J_ne_C := hJSource₂
      J_ne_K := hJSource₁
      J_ne_middle := hJMiddle
      J_mem_A := E.rowHit.row.support_subset_A hJ }⟩

/-- Exact continuation after choosing the fresh endpoint-row source.  The
positive arm is precisely the actual cross incidence needed by a
different-pair Kalmanson consumer.  Its complement is not inert: it produces
a new common deletion whose source is different from all three walk sources. -/
inductive EndpointFreshCrossOrCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E) : Type
  | crossHit
      (K_mem_J_shell :
        P.K ∈ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support)
  | freshCommonDeletion
      (K_not_mem_J_shell :
        P.K ∉ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support)
      (packet : CommonDeletionTwoCenterPacket D H P.K S.oppApex1
        (H.centerAt P.J P.J_mem_A))

/-- The fresh endpoint source reaches either the desired cross hit or a new
source-exact common-deletion edge. -/
theorem nonempty_endpointFreshCrossOrCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E) :
    Nonempty (EndpointFreshCrossOrCommonDeletion P) := by
  by_cases hcross :
      P.K ∈ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support
  · exact ⟨EndpointFreshCrossOrCommonDeletion.crossHit hcross⟩
  · have hsurvivesBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase P.K)
          (H.centerAt P.J P.J_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support H P.J_mem_A).mpr
        hcross
    have hsurvivesFirst :
        HasNEquidistantPointsAt 4 (D.A.erase P.K) S.oppApex1 :=
      R.firstApexFullyDeletionRobust.survives P.K
        P.fiber_orientation.right_mem_A
    have hblockerA : H.centerAt P.J P.J_mem_A ∈ D.A := by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨P.J, P.J_mem_A⟩).2
    rcases nonempty_commonDeletionTwoCenterPacket H
        P.fiber_orientation.right_mem_A (oppApex1_mem_A S) hblockerA
        (R.actualBlocker_ne_firstApex P.J P.J_mem_A).symm
        hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
    exact ⟨EndpointFreshCrossOrCommonDeletion.freshCommonDeletion
      hcross packet⟩

/-- The middle source of the original walk is not the missing cross-hit
producer: its actual critical row omits the endpoint by construction. -/
theorem endpoint_next_not_mem_middle_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (_E : RetainedMatchingEndpointCriticalFiber W) :
    W.next ∉
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support :=
  W.next_not_mem_second_shell

/-- At a three-distinct-blocker endpoint, the final cross relation either
hits or supplies the third packet closing the source-exact deletion cycle. -/
inductive ThreeDistinctEndpointCrossOrCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (_P : RetainedMatchingThreeDistinctBlockerPath W) : Type
  | crossHit
      (first_mem_next_shell :
        W.first ∈
          (H.selectedAt W.next W.next_mem_A).toCriticalFourShell.support)
  | threeStepCycle
      (first_not_mem_next_shell :
        W.first ∉
          (H.selectedAt W.next W.next_mem_A).toCriticalFourShell.support)
      (thirdPacket : CommonDeletionTwoCenterPacket D H W.first S.oppApex1
        (H.centerAt W.next W.next_mem_A))

/-- Exact source-valid continuation of the three-distinct-blocker path. -/
theorem nonempty_threeDistinctEndpointCrossOrCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedMatchingThreeDistinctBlockerPath W) :
    Nonempty (ThreeDistinctEndpointCrossOrCycle P) := by
  by_cases hcross :
      W.first ∈
        (H.selectedAt W.next W.next_mem_A).toCriticalFourShell.support
  · exact ⟨ThreeDistinctEndpointCrossOrCycle.crossHit hcross⟩
  · have hsurvivesBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase W.first)
          (H.centerAt W.next W.next_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support H W.next_mem_A).mpr
        hcross
    have hsurvivesFirst :
        HasNEquidistantPointsAt 4 (D.A.erase W.first) S.oppApex1 :=
      R.firstApexFullyDeletionRobust.survives W.first W.first_mem_A
    have hblockerA : H.centerAt W.next W.next_mem_A ∈ D.A := by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨W.next, W.next_mem_A⟩).2
    rcases nonempty_commonDeletionTwoCenterPacket H W.first_mem_A
        (oppApex1_mem_A S) hblockerA
        (R.actualBlocker_ne_firstApex W.next W.next_mem_A).symm
        hsurvivesFirst hsurvivesBlocker with ⟨thirdPacket⟩
    exact ⟨ThreeDistinctEndpointCrossOrCycle.threeStepCycle
      hcross thirdPacket⟩

#print axioms nonempty_endpointFreshFirstApexRowSource
#print axioms nonempty_endpointFreshCrossOrCommonDeletion
#print axioms endpoint_next_not_mem_middle_shell
#print axioms nonempty_threeDistinctEndpointCrossOrCycle

end ATailMatchingEndpointPathTerminalScratch
end Problem97
