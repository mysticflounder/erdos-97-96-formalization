/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalOmissionCycleParentResidual
import ReverseOutsidePairProducer

/-!
# Scratch: parent-coupled period-four and period-five omission-cycle reductions

This file keeps the production exact-five parent residual intact while locating
its two origin-tagged continuation sources on the normalized physical omission
cycle.  Period five exhausts the physical strict-cap vertex set.  Period four
leaves at most one physical vertex off the cycle, so at least one of the two
distinct continuation sources occurs on the cycle.

No equality between the reconstructed first-apex frontier and the physical
second-apex cycle is asserted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFivePeriodFourFiveParentRouteScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailPhysicalOmissionCycleParentResidual
open ATailExactFiveReverseOutsidePairProducerScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The underlying points of the canonical normalized cycle. -/
def cycleSourcePoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : Finset ℝ² :=
  Finset.univ.image (fun i : Fin K.period ↦ (K.source i).1)

/-- The canonical cycle has exactly `period` distinct underlying sources. -/
theorem cycleSourcePoints_card_eq_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    (cycleSourcePoints K).card = K.period := by
  unfold cycleSourcePoints
  rw [Finset.card_image_of_injective]
  · simp
  · intro i j hij
    exact K.source_injective (Subtype.ext hij)

/-- Every canonical cycle source belongs to the physical strict-cap set. -/
theorem cycleSourcePoints_subset_physicalVertices
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    cycleSourcePoints K ⊆ physicalVertices profile := by
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
  exact (K.source i).2

/-- The physical strict-cap vertex set has cardinality at most five. -/
theorem physicalVertices_card_le_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    (physicalVertices profile).card ≤ 5 := by
  calc
    (physicalVertices profile).card ≤
        (SelectedClass D.A S.oppApex2 profile.radius).card :=
      Finset.card_le_card Finset.inter_subset_left
    _ = 5 := profile.class_card_eq_five

/-- A period-four cycle omits at most one physical strict-cap vertex. -/
theorem physicalVertices_sdiff_cycleSourcePoints_card_le_one_of_period_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 4) :
    (physicalVertices profile \ cycleSourcePoints K).card ≤ 1 := by
  have hsplit := Finset.card_sdiff_add_card_eq_card
    (cycleSourcePoints_subset_physicalVertices K)
  rw [cycleSourcePoints_card_eq_period K, hperiod] at hsplit
  have hfive := physicalVertices_card_le_five profile
  omega

/-- A period-five cycle exhausts the physical strict-cap vertex set. -/
theorem cycleSourcePoints_eq_physicalVertices_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 5) :
    cycleSourcePoints K = physicalVertices profile := by
  apply Finset.eq_of_subset_of_card_le
    (cycleSourcePoints_subset_physicalVertices K)
  rw [cycleSourcePoints_card_eq_period K, hperiod]
  exact physicalVertices_card_le_five profile

/-- Every physical strict-cap vertex occurs on a period-five cycle. -/
theorem exists_cycleSource_eq_of_mem_physicalVertices_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 5) {x : ℝ²}
    (hx : x ∈ physicalVertices profile) :
    ∃ i : Fin K.period, (K.source i).1 = x := by
  have hxCycle : x ∈ cycleSourcePoints K := by
    rw [cycleSourcePoints_eq_physicalVertices_of_period_eq_five K hperiod]
    exact hx
  rcases Finset.mem_image.mp hxCycle with ⟨i, _hi, hi⟩
  exact ⟨i, hi⟩

/-- In period five, the first origin-tagged parent continuation source occurs
on the normalized cycle. -/
theorem exists_firstContinuation_cycleIndex_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hperiod : R.exactFive.cycle.period = 5) :
    ∃ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 = R.exactFive.continuation.first := by
  apply exists_cycleSource_eq_of_mem_physicalVertices_of_period_eq_five
    R.exactFive.cycle hperiod
  exact R.exactFive.continuation.first_mem_physicalInterior

/-- In period five, the second origin-tagged parent continuation source also
occurs on the normalized cycle. -/
theorem exists_secondContinuation_cycleIndex_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hperiod : R.exactFive.cycle.period = 5) :
    ∃ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 = R.exactFive.continuation.second := by
  apply exists_cycleSource_eq_of_mem_physicalVertices_of_period_eq_five
    R.exactFive.cycle hperiod
  exact R.exactFive.continuation.second_mem_physicalInterior

/-- The two parent continuation sources occur at distinct cycle indices in
period five. -/
theorem exists_distinct_continuation_cycleIndices_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hperiod : R.exactFive.cycle.period = 5) :
    ∃ i j : Fin R.exactFive.cycle.period,
      i ≠ j ∧
      (R.exactFive.cycle.source i).1 = R.exactFive.continuation.first ∧
      (R.exactFive.cycle.source j).1 = R.exactFive.continuation.second := by
  rcases exists_firstContinuation_cycleIndex_of_period_eq_five R hperiod with ⟨i, hi⟩
  rcases exists_secondContinuation_cycleIndex_of_period_eq_five R hperiod with ⟨j, hj⟩
  refine ⟨i, j, ?_, hi, hj⟩
  intro hij
  apply R.exactFive.continuation.first_ne_second
  calc
    R.exactFive.continuation.first = (R.exactFive.cycle.source i).1 := hi.symm
    _ = (R.exactFive.cycle.source j).1 := by rw [hij]
    _ = R.exactFive.continuation.second := hj

/-- In period four, at least one of the two distinct parent continuation
sources occurs on the normalized cycle. -/
theorem firstContinuation_occurs_or_secondContinuation_occurs_of_period_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hperiod : R.exactFive.cycle.period = 4) :
    (∃ i : Fin R.exactFive.cycle.period,
        (R.exactFive.cycle.source i).1 = R.exactFive.continuation.first) ∨
      (∃ i : Fin R.exactFive.cycle.period,
        (R.exactFive.cycle.source i).1 = R.exactFive.continuation.second) := by
  classical
  by_contra hnone
  push_neg at hnone
  have hfirstNot : R.exactFive.continuation.first ∉
      cycleSourcePoints R.exactFive.cycle := by
    intro hfirst
    rcases Finset.mem_image.mp hfirst with ⟨i, _hi, hi⟩
    exact hnone.1 i hi
  have hsecondNot : R.exactFive.continuation.second ∉
      cycleSourcePoints R.exactFive.cycle := by
    intro hsecond
    rcases Finset.mem_image.mp hsecond with ⟨i, _hi, hi⟩
    exact hnone.2 i hi
  have hfirstSdiff : R.exactFive.continuation.first ∈
      physicalVertices R.exactFive.profile \
        cycleSourcePoints R.exactFive.cycle :=
    Finset.mem_sdiff.mpr
      ⟨R.exactFive.continuation.first_mem_physicalInterior, hfirstNot⟩
  have hsecondSdiff : R.exactFive.continuation.second ∈
      physicalVertices R.exactFive.profile \
        cycleSourcePoints R.exactFive.cycle :=
    Finset.mem_sdiff.mpr
      ⟨R.exactFive.continuation.second_mem_physicalInterior, hsecondNot⟩
  have htwo : 1 <
      (physicalVertices R.exactFive.profile \
        cycleSourcePoints R.exactFive.cycle).card := by
    rw [Finset.one_lt_card]
    exact ⟨R.exactFive.continuation.first, hfirstSdiff,
      R.exactFive.continuation.second, hsecondSdiff,
      R.exactFive.continuation.first_ne_second⟩
  have hone :=
    physicalVertices_sdiff_cycleSourcePoints_card_le_one_of_period_eq_four
      R.exactFive.cycle hperiod
  omega

/-- Period-five parent occurrence plus the all-reverse hypothesis gives the
exact positive/negative cross-row incidence at the first continuation source. -/
theorem exists_firstContinuation_parentCrossRowOccurrence_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (hperiod : R.exactFive.cycle.period = 5) :
    ∃ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 = R.exactFive.continuation.first ∧
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support ∧
      (R.exactFive.cycle.source i).1 ∉
        (H.selectedAt R.exactFive.continuation.unusedRow.unused.point
          R.exactFive.continuation.unusedRow.source_mem_A).toCriticalFourShell.support := by
  rcases exists_firstContinuation_cycleIndex_of_period_eq_five R hperiod with ⟨i, hi⟩
  exact ⟨i, hi, hreverse i, hi ▸ R.exactFive.continuation.first_not_mem_actualCriticalSupport⟩

/-- The second continuation source has the same exact period-five
positive/negative cross-row occurrence. -/
theorem exists_secondContinuation_parentCrossRowOccurrence_of_period_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (hperiod : R.exactFive.cycle.period = 5) :
    ∃ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 = R.exactFive.continuation.second ∧
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support ∧
      (R.exactFive.cycle.source i).1 ∉
        (H.selectedAt R.exactFive.continuation.unusedRow.unused.point
          R.exactFive.continuation.unusedRow.source_mem_A).toCriticalFourShell.support := by
  rcases exists_secondContinuation_cycleIndex_of_period_eq_five R hperiod with ⟨i, hi⟩
  exact ⟨i, hi, hreverse i,
    hi ▸ R.exactFive.continuation.second_not_mem_actualCriticalSupport⟩

/-- In period four, the occurring continuation source is positive in its
reverse successor row and negative in the retained unused-source row. -/
theorem exists_parentCrossRowOccurrence_of_period_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (hperiod : R.exactFive.cycle.period = 4) :
    ∃ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support ∧
      (((R.exactFive.cycle.source i).1 = R.exactFive.continuation.first ∧
          (R.exactFive.cycle.source i).1 ∉
            (H.selectedAt R.exactFive.continuation.unusedRow.unused.point
              R.exactFive.continuation.unusedRow.source_mem_A).toCriticalFourShell.support) ∨
        ((R.exactFive.cycle.source i).1 = R.exactFive.continuation.second ∧
          (R.exactFive.cycle.source i).1 ∉
            (H.selectedAt R.exactFive.continuation.unusedRow.unused.point
              R.exactFive.continuation.unusedRow.source_mem_A).toCriticalFourShell.support)) := by
  rcases firstContinuation_occurs_or_secondContinuation_occurs_of_period_eq_four
      R hperiod with ⟨i, hi⟩ | ⟨i, hi⟩
  · exact ⟨i, hreverse i, Or.inl
      ⟨hi, hi ▸ R.exactFive.continuation.first_not_mem_actualCriticalSupport⟩⟩
  · exact ⟨i, hreverse i, Or.inr
      ⟨hi, hi ▸ R.exactFive.continuation.second_not_mem_actualCriticalSupport⟩⟩

/-- With eleven ambient points and at least eight points in the cap, the
all-reverse period-four and period-five branches exceed the available
outside-pair capacity. -/
theorem false_of_allReverse_of_card_eleven_of_cap_card_ge_eight_of_period_four_or_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hcard : D.A.card = 11)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex2).card)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (hperiod : R.exactFive.cycle.period = 4 ∨
      R.exactFive.cycle.period = 5) :
    False := by
  have hcomplementCard :
      (D.A \ S.capByIndex S.oppIndex2).card ≤ 3 := by
    have hdecomposition := Finset.card_sdiff_add_card_eq_card
      (S.capByIndex_subset S.oppIndex2)
    omega
  have hperiodCapacity := period_le_choose_capComplement_two
    R.exactFive.cycle hreverse
  have hchooseCapacity :
      Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2 ≤ 3 := by
    calc
      Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2 ≤
          Nat.choose 3 2 := Nat.choose_le_choose 2 hcomplementCard
      _ = 3 := by norm_num [Nat.choose]
  omega

#print axioms cycleSourcePoints_card_eq_period
#print axioms physicalVertices_sdiff_cycleSourcePoints_card_le_one_of_period_eq_four
#print axioms cycleSourcePoints_eq_physicalVertices_of_period_eq_five
#print axioms exists_firstContinuation_cycleIndex_of_period_eq_five
#print axioms exists_secondContinuation_cycleIndex_of_period_eq_five
#print axioms exists_distinct_continuation_cycleIndices_of_period_eq_five
#print axioms firstContinuation_occurs_or_secondContinuation_occurs_of_period_eq_four
#print axioms exists_firstContinuation_parentCrossRowOccurrence_of_period_eq_five
#print axioms exists_secondContinuation_parentCrossRowOccurrence_of_period_eq_five
#print axioms exists_parentCrossRowOccurrence_of_period_eq_four
#print axioms false_of_allReverse_of_card_eleven_of_cap_card_ge_eight_of_period_four_or_five

end

end ATailExactFivePeriodFourFiveParentRouteScratch
end Problem97
