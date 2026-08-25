/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Coordinator
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision

/-!
# Loose-argument entry point for the two-deletion residue

`false_of_twoDistinctExactFourMutualOmissionJointDeletions` takes the sixteen
hypotheses of the two-deletion residue one at a time.  Its statement repeats,
byte for byte, the one its call sites already use; the proof packages the
arguments into a `TwoDeletionIngress` record and hands that record to
`false_of_twoDeletionIngress`.

`Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision` is imported
here as well, so every name that the former entry point's importers reached
through that module stays in scope for the importers of this one.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The two-deletion exact-four residue is exhaustively narrowed according to
whether the deleted sources have equal actual blockers.  In the collision arm
their equal canonical rows have an exact two-point intersection with the
physical class; otherwise the two deleted sources furnish two fresh blockers
outside the original blocker pair and the physical apex.

The statement repeats, byte for byte, the one that previously stood in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision`, so the
call sites that pass the hypotheses one at a time need no change.  The proof
now runs through `false_of_twoDeletionIngress`. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted) :
    False :=
  false_of_twoDeletionIngress
    (TwoDeletionIngress.ofBundle R hcard surface rho hrho hfive u v huNeV
      huClass hvClass hvOmitted huOmitted first second hdeletedNe)

end ATailFrontierLiveClosure
end Problem97
