/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape
import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface

/-!
# Parent boundary for the card-≥14 survival cover

The source-faithful parent boundary has one explicit exceptional arm: the
frontier first-apex class may still have exactly four points.  Away from that
arm, the existing directed blocker split now has a concrete production
consumer.  Cross survival yields the retained companion common-deletion
packet; cross membership feeds the card-≥14 survival cover and hence the
physical-second-apex robust/critical split.

This is a reduction interface, not a contradiction theorem.  The full parent
packet remains in the hypotheses, and the exact-card-four arm is not hidden in
an overstrong premise.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSurvivalCoverParentBoundary

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailSurvivalCover
open ATailFrontierCommonDeletionEscape

attribute [local instance] Classical.propDecidable

/-- At the cap-strengthened parent boundary, either the frontier radius is
the exact-card-four exception, cross survival supplies a source-faithful
companion packet, or cross membership reaches the card-≥14 physical
second-apex consumer. -/
theorem exactFour_or_companionCommonDeletion_or_physicalSecondApexEndpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      Nonempty (CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) ∨
      (Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
        Nonempty (PhysicalSecondApexCriticalResidual D S)) := by
  by_cases hcard : (SelectedClass D.A S.oppApex1 radius).card = 4
  · exact Or.inl hcard
  · rcases nonempty_parentFrontierDirectedBlockerOutcome R with
      ⟨outcome⟩
    cases outcome with
    | companionCommonDeletion packet =>
        exact Or.inr (Or.inl ⟨packet⟩)
    | crossMembership hwSupport _hblockerNotSurplus =>
        exact Or.inr (Or.inr
          (sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer
            F.pair hcard hwSupport L.carrier_card_ge_fourteen))

#print axioms exactFour_or_companionCommonDeletion_or_physicalSecondApexEndpoint

end ATailSurvivalCoverParentBoundary
end Problem97
