/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalOmissionCycleParentResidual
import FirstApexShellRoleExtractor
import ReverseCycleSharedCapOrderProducer

/-!
# Parent-coupled interface for the period-three all-reverse leaf

This scratch coordinator keeps the original first-apex frontier and its
common-deletion residual independent of the exact-five physical cycle.  The
only coupling is the shared `D`, `S`, and concrete critical-shell system `H`.
In particular, no equality between the original frontier and a separately
reconstructed exact-five frontier is assumed.

Both auxiliary packets are derived from their actual sources.  The remaining
mathematical proposition is therefore stated directly on `E.cycle`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailParentCoupledPeriodThreeInterfaceScratch

open ATailCriticalPairFrontier
open ATailExactFiveReverseMembershipClosureScratch
open ATailFirstApexShellRoleAuditScratch
open ATailFirstApexShellRoleExtractorScratch
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPeriodThreeCommonOrderProducerScratch
open ATailPeriodThreeSharedOrderPacketScratch
open ATailPhysicalOmissionCycleParentResidual
open ATailRobustLargeRadius
open ATailThreeRowSharedBoundaryProducerScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The fully assembled data available on the source-faithful period-three
all-reverse leaf.  Its first-apex packet belongs to the original `F0, R`,
while its common cap order belongs to the actual cycle `E.cycle`. -/
structure ParentCoupledPeriodThreePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    {F : RobustLargeRadiusParentSurface D S}
    (E : ExactFivePhysicalCycleParentResidual H F) : Type where
  firstApex : FirstApexShellRolePacket F0 R
  sharedCapOrder : ReverseCycleSharedCapOrder E.cycle
  period_eq_three : E.cycle.period = 3
  allReverse : AllReverseMembership E.cycle

/-- The packet is constructible from exactly the two branch hypotheses.  No
frontier equality or independent shared-order hypothesis is used. -/
theorem nonempty_parentCoupledPeriodThreePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    {F : RobustLargeRadiusParentSurface D S}
    (E : ExactFivePhysicalCycleParentResidual H F)
    (hperiod : E.cycle.period = 3)
    (hreverse : AllReverseMembership E.cycle) :
    Nonempty (ParentCoupledPeriodThreePacket F0 R E) := by
  rcases nonempty_firstApexShellRolePacket F0 R with ⟨P⟩
  rcases nonempty_reverseCycleSharedCapOrder E.cycle hreverse with ⟨Q⟩
  exact ⟨{
    firstApex := P
    sharedCapOrder := Q
    period_eq_three := hperiod
    allReverse := hreverse }⟩

/-- The exact remaining mathematical leaf on the actual parent cycle.  This
is a proposition boundary, not a claimed proof. -/
abbrev FalseOfParentCoupledPeriodThreeAllReverse
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (_R : FrontierCommonDeletionParentResidual F0)
    {F : RobustLargeRadiusParentSurface D S}
    (E : ExactFivePhysicalCycleParentResidual H F) : Prop :=
  E.cycle.period = 3 → AllReverseMembership E.cycle → False

/-- The raw leaf is equivalent to a contradiction consumer for the assembled
packet, so the first-apex and shared-order packets are not extra assumptions. -/
theorem falseOfParentCoupledPeriodThreeAllReverse_iff_packetConsumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    {F : RobustLargeRadiusParentSurface D S}
    (E : ExactFivePhysicalCycleParentResidual H F) :
    FalseOfParentCoupledPeriodThreeAllReverse F0 R E ↔
      (ParentCoupledPeriodThreePacket F0 R E → False) := by
  constructor
  · intro h P
    exact h P.period_eq_three P.allReverse
  · intro h hperiod hreverse
    rcases nonempty_parentCoupledPeriodThreePacket
        F0 R E hperiod hreverse with ⟨P⟩
    exact h P

/-- The earlier generic first-apex-row consumer specializes definitionally
to the actual cycle stored by `E`. -/
theorem falseOfParentCoupledPeriodThreeAllReverse_of_firstApexRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    {F : RobustLargeRadiusParentSurface D S}
    (E : ExactFivePhysicalCycleParentResidual H F)
    (closeRows : FalseOfPeriodThreeAllReverseFirstApexRows F0 R) :
    FalseOfParentCoupledPeriodThreeAllReverse F0 R E := by
  intro hperiod hreverse
  rcases nonempty_firstApexShellRolePacket F0 R with ⟨P⟩
  exact closeRows P E.profile E.cycle hperiod hreverse

#print axioms nonempty_parentCoupledPeriodThreePacket
#print axioms falseOfParentCoupledPeriodThreeAllReverse_iff_packetConsumer
#print axioms falseOfParentCoupledPeriodThreeAllReverse_of_firstApexRows

end

end ATailParentCoupledPeriodThreeInterfaceScratch
end Problem97
