/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionParentConsumer
import MutualGlobalCapConsumer
import ReverseOutsidePairProducer

/-!
# Exact-five physical-cycle edge normal form

Every production exact-five physical omission cycle contains either a
mutual-omission edge, which is immediately expanded to its checked
criss-cross normal form, or has reverse membership along every edge of that
specific cycle.

The all-reverse constructor is deliberately cycle-local.  It does not claim
the corresponding relation for physical vertices outside the chosen cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustLargeRadiusContinuationScratch

open ATailExactFiveMutualOmissionClosureScratch
open ATailExactFiveMutualGlobalCapConsumerScratch
open ATailExactFiveReverseMembershipClosureScratch
open ATailExactFiveReverseOutsidePairProducerScratch
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailPhysicalOmissionCycleParentResidual
open ATailRobustLargeRadius

/-- Parent-free capacity packet for the all-reverse arm of an exact-five
physical omission cycle.  Every field follows from the cycle and reverse
membership alone; in particular, no six-point cap or unused source is
required. -/
structure ExactFiveBareReverseOutsidePairCapacity
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    (cycle : PhysicalActualCriticalOmissionCycle H profile) : Prop where
  all_reverseMembership : ∀ i : Fin cycle.period,
    (cycle.source i).1 ∈
      (H.selectedAt
        (cycle.source (cycle.successorIndex i)).1
        (PhysicalVertex.mem_A
          (cycle.source
            (cycle.successorIndex i)))).toCriticalFourShell.support
  period_ge_three : 3 ≤ cycle.period
  period_le_five : cycle.period ≤ 5
  centers_injective : Function.Injective (reverseRowCenter cycle)
  outsidePairs_card_two : ∀ i : Fin cycle.period,
    (reverseOutsidePair cycle i).card = 2
  outsidePairs_injective : Function.Injective (reverseOutsidePair cycle)
  pair_capacity :
    cycle.period ≤
      Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2

/-- Parent-free edge normalization for an exact-five physical omission cycle.
At ambient cardinality at least ten, the mutual arm reaches either a checked
same-cap common-deletion packet or the exact equal-blocker shell residual.
The all-reverse arm remains cap-bound-independent. -/
inductive ExactFiveBareCycleEdgeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    (cycle : PhysicalActualCriticalOmissionCycle H profile) : Type
  | mutualSameCapCommonDeletion
      (edge : PhysicalActualCriticalMutualOmissionEdge cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (residual : CycleSameCapCommonDeletionResidual cycle edge)
  | mutualEqualBlockerShell
      (edge : PhysicalActualCriticalMutualOmissionEdge cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (residual : CycleEqualBlockerShellResidual cycle edge)
  | allReverseCapacity
      (capacity : ExactFiveBareReverseOutsidePairCapacity cycle)
      (straddles :
        ∀ i : Fin cycle.period,
          Nonempty (ReverseRowCapStraddle cycle i))

/-- At ambient cardinality at least ten, every exact-five profile reaches the
same-cap mutual residual split or the bare all-reverse capacity arm. -/
theorem nonempty_exactFiveBareCycleEdgeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    (hcard : 10 ≤ D.A.card)
    (cycle : PhysicalActualCriticalOmissionCycle H profile) :
    Nonempty (ExactFiveBareCycleEdgeNormalForm cycle) := by
  rcases nonempty_mutualOmissionEdge_or_all_reverseMembership cycle with
      hmutual | allReverse
  · rcases hmutual with ⟨edge⟩
    rcases nonempty_mutualOmissionCrissCrossNormalForm edge with ⟨crissCross⟩
    rcases cycleSameCapCommonDeletion_or_equalBlockerShellResidual_of_card_ge_ten
        hcard edge with hcommon | hequal
    · rcases hcommon with ⟨residual⟩
      exact ⟨.mutualSameCapCommonDeletion edge crissCross residual⟩
    · rcases hequal with ⟨residual⟩
      exact ⟨.mutualEqualBlockerShell edge crissCross residual⟩
  · let capacity : ExactFiveBareReverseOutsidePairCapacity cycle := {
      all_reverseMembership := allReverse
      period_ge_three :=
        three_le_period_of_all_reverseMembership cycle allReverse
      period_le_five := cycle.period_le_five
      centers_injective := reverseRowCenter_injective cycle allReverse
      outsidePairs_card_two :=
        reverseOutsidePair_card_eq_two cycle allReverse
      outsidePairs_injective :=
        reverseOutsidePair_injective cycle allReverse
      pair_capacity :=
        period_le_choose_capComplement_two cycle allReverse }
    exact ⟨.allReverseCapacity capacity (fun i =>
      nonempty_reverseRowCapStraddle cycle allReverse i)⟩

/-- Branch-complete edge normalization for a production frontier-coupled
exact-five physical omission cycle. -/
inductive ExactFiveCycleEdgeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {parent : RobustLargeRadiusParentSurface D S}
    (residual :
      FrontierCoupledExactFivePhysicalCycleParentResidual H parent) : Type
  | mutualSameCapCommonDeletion
      (edge :
        PhysicalActualCriticalMutualOmissionEdge residual.exactFive.cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (sameCapCommonDeletion : SameCapCommonDeletionResidual residual edge)
  | mutualEqualBlockerShell
      (edge :
        PhysicalActualCriticalMutualOmissionEdge residual.exactFive.cycle)
      (crissCross : MutualOmissionCrissCrossNormalForm edge)
      (equalBlockerShell : EqualBlockerShellResidual residual edge)
  | allReverseCapacity
      (capacity : FrontierCoupledReverseOutsidePairCapacity residual)
      (straddles :
        ∀ i : Fin residual.exactFive.cycle.period,
          Nonempty (ReverseRowCapStraddle residual.exactFive.cycle i))

/-- The production cycle split and the mutual-omission criss-cross theorem
construct the normal form without any additional geometric premise. -/
theorem nonempty_exactFiveCycleEdgeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {parent : RobustLargeRadiusParentSurface D S}
    (residual :
      FrontierCoupledExactFivePhysicalCycleParentResidual H parent) :
    Nonempty (ExactFiveCycleEdgeNormalForm residual) := by
  rcases nonempty_mutualOmissionEdge_or_all_reverseMembership
      residual.exactFive.cycle with hmutual | allReverse
  · rcases hmutual with ⟨edge⟩
    rcases nonempty_mutualOmissionCrissCrossNormalForm edge with ⟨crissCross⟩
    rcases sameCapCommonDeletion_or_equalBlockerShellResidual
        residual edge with hcommon | hequal
    · rcases hcommon with ⟨sameCapCommonDeletion⟩
      exact ⟨.mutualSameCapCommonDeletion
        edge crissCross sameCapCommonDeletion⟩
    · rcases hequal with ⟨equalBlockerShell⟩
      exact ⟨.mutualEqualBlockerShell edge crissCross equalBlockerShell⟩
  · rcases nonempty_frontierCoupledReverseOutsidePairCapacity
        residual allReverse with ⟨capacity⟩
    exact ⟨.allReverseCapacity capacity (fun i =>
      nonempty_reverseRowCapStraddle
        residual.exactFive.cycle allReverse i)⟩

#print axioms ExactFiveCycleEdgeNormalForm
#print axioms ExactFiveBareReverseOutsidePairCapacity
#print axioms ExactFiveBareCycleEdgeNormalForm
#print axioms nonempty_exactFiveBareCycleEdgeNormalForm
#print axioms nonempty_exactFiveCycleEdgeNormalForm

end ATailUniqueFourRobustLargeRadiusContinuationScratch
end Problem97
