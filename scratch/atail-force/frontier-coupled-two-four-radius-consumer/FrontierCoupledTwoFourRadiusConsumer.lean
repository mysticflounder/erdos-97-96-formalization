/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OrientedLargePhysicalRadiusIngress
import FixedRadiusOrbitEntryIntegration
import FixedSingleRadiusCommonDeletionIntegration
import SpentEntryTerminalMutualHitConsumer

/-!
# Consumer for the frontier-coupled exact-two-four-radii residual

The physical second-apex two-radius marginal is not itself contradictory.
The retained first-apex `CriticalPairFrontier`, however, has an exhaustive
terminal descent: its unique-radius arm is exactly the protected original
FA-UNIQ4/5 input, while every non-unique arm supplies a common deletion at
the physical second apex.

The older terminal-descent scratch chain packaged the common deletion in its
local packet type.  This module transports the two survival facts into the
production `ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierCoupledTwoFourRadiusConsumerScratch

open ATailCommonDeletionTwoCenter
open ATailOrientedLargePhysicalRadiusIngressScratch
open ATailRFullParentEntryScratch

attribute [local instance] Classical.propDecidable

/-- The two terminal first-apex continuations which already have protected
downstream consumers.  The input is deliberately the full frontier-coupled
physical residual, rather than the satisfiable bare two-row marginal. -/
inductive FrontierCoupledTwoFourRadiusConsumedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    Type
  | originalUnique
      (arm : OriginalFrontierUniqueRadiusArm R.frontier)
  | commonDeletion
      (deleted center : ℝ²)
      (packet : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2)

private theorem production_commonDeletion_of_scratch
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {deleted center : ℝ²}
    (packet :
      ATailContinuationBankMatchScratch.CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2) :
    Nonempty (ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2) := by
  exact nonempty_commonDeletionTwoCenterPacket H
    packet.q_mem_A packet.center₁_mem_A packet.center₂_mem_A
    packet.centers_ne packet.survives₁ packet.survives₂

/-- Branch-complete consumer for the final oriented-ingress residual.

The proof visibly consumes the retained global first-apex frontier and the
same concrete critical-shell system `H`.  The exact-two-four-radii physical
packet remains part of `R`, but no claim is made that its bare row marginal
is contradictory. -/
theorem nonempty_consumedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    Nonempty (FrontierCoupledTwoFourRadiusConsumedOutcome R) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.firstApexUnique_or_commonDeletion_or_spent
        R.frontier R.frontierRadius_pos
          R.frontierRadius_class_card_ge_four with
    hunique | hcoherent | hspent
  · exact ⟨FrontierCoupledTwoFourRadiusConsumedOutcome.originalUnique
      hunique⟩
  · rcases hcoherent with
      ⟨_terminal, _pair, _source_eq, deleted, center, ⟨packet⟩⟩
    rcases production_commonDeletion_of_scratch packet with
      ⟨productionPacket⟩
    exact ⟨FrontierCoupledTwoFourRadiusConsumedOutcome.commonDeletion
      deleted center productionPacket⟩
  · rcases hspent with ⟨entry⟩
    rcases entry.exists_commonDeletion with
      ⟨deleted, center, ⟨packet⟩⟩
    rcases production_commonDeletion_of_scratch packet with
      ⟨productionPacket⟩
    exact ⟨FrontierCoupledTwoFourRadiusConsumedOutcome.commonDeletion
      deleted center productionPacket⟩

/-- Proposition-valued parent adapter, matching the closure-plan target
without requiring downstream code to eliminate the local outcome type. -/
theorem protectedOriginal_or_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    OriginalFrontierUniqueRadiusArm R.frontier ∨
      ∃ deleted center : ℝ²,
        Nonempty (ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
          D H deleted center S.oppApex2) := by
  rcases nonempty_consumedOutcome R with ⟨outcome⟩
  cases outcome with
  | originalUnique arm => exact Or.inl arm
  | commonDeletion deleted center packet =>
      exact Or.inr ⟨deleted, center, ⟨packet⟩⟩

#print axioms nonempty_consumedOutcome
#print axioms protectedOriginal_or_commonDeletion

end ATailFrontierCoupledTwoFourRadiusConsumerScratch
end Problem97
