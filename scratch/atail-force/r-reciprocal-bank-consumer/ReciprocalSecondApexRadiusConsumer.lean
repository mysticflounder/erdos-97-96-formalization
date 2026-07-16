/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReciprocalDirectedCrossGlobalBoundary

/-!
# Scratch: sharp radius consumer for the reciprocal second-apex branch

The critical arm of
`ReciprocalDirectedCrossResidual.exists_fresh_commonDeletion_or_secondApexCritical`
already says that deleting the fresh point blocks `K4` at the second apex.
Consequently every positive radius carrying four ambient points there is
forced to be the radius of the prescribed critical shell.

This file records that exact consumer directly on the reciprocal packet
surface.  It does not close the alternative common-deletion arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRReciprocalBankConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Prescribed deletion criticality makes the critical-shell radius the
unique positive radius carrying four ambient points at that center. -/
theorem criticalRadius_unique_of_blocked
    {A : Finset ℝ²} {z center : ℝ²}
    (C : CriticalSelectedFourClass A z center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase z) center)
    {tau : ℝ} (htau : 0 < tau)
    (hfour : 4 ≤ (SelectedClass A center tau).card) :
    tau = C.toCriticalFourShell.radius := by
  have hzClass : z ∈ SelectedClass A center tau := by
    by_contra hzClass
    apply hblocked
    refine ⟨tau, htau, ?_⟩
    change 4 ≤ (SelectedClass (A.erase z) center tau).card
    rw [selectedClass_erase_card_eq_of_not_mem hzClass]
    exact hfour
  calc
    tau = dist center z :=
      (mem_selectedClass.mp hzClass).2.symm
    _ = C.toCriticalFourShell.radius :=
      C.toCriticalFourShell.support_eq_radius
        z C.toCriticalFourShell.q_mem_support

/-- In the reciprocal critical arm, the retained second-apex row is the
unique positive four-capable ambient radius.  Thus a genuinely distinct
four-capable radius is the exact missing antecedent for a contradiction. -/
theorem false_of_secondApexCritical_and_distinctFourCapableRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {z : ℝ²}
    (C : CriticalSelectedFourClass D.A z S.oppApex2)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase z) S.oppApex2)
    {tau : ℝ} (htau : 0 < tau)
    (hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 tau).card)
    (hne : tau ≠ R.secondApexRow.radius) :
    False := by
  have htauCritical :
      tau = C.toCriticalFourShell.radius :=
    criticalRadius_unique_of_blocked C hblocked htau hfour
  have hcriticalParent :
      C.toCriticalFourShell.radius =
        R.secondApexRow.radius := by
    have hsupport :=
      secondApexRow_eq_criticalSupport_of_blocked
        (R := R) hblocked C
    calc
      C.toCriticalFourShell.radius =
          dist S.oppApex2 z :=
        (C.toCriticalFourShell.support_eq_radius
          z C.toCriticalFourShell.q_mem_support).symm
      _ = R.secondApexRow.radius :=
        R.secondApexRow.support_eq_radius z (by
          rw [← hsupport]
          exact C.toCriticalFourShell.q_mem_support)
  exact hne (htauCritical.trans hcriticalParent)

#print axioms criticalRadius_unique_of_blocked
#print axioms false_of_secondApexCritical_and_distinctFourCapableRadius

end ATailRReciprocalBankConsumerScratch
end Problem97
