/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure

/-!
# Rigid221 entry point for the tri-apex cluster

`Problem97.ATailFrontierLiveClosure.Legacy.false_of_originalFrontierUniqueRadiusArm`
restates, binder for binder, the theorem of the same name in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`, and is proved by
that theorem.  It is the one Rigid221 declaration the tri-apex cluster consumes,
so `Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission`
reaches it through this module instead of importing `Rigid221Closure` directly.

The import closure of the tri-apex module is unchanged: this module imports
`Rigid221Closure` itself, so every name that module supplies stays available to
the importers of this one.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Legacy

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

/-- The protected exact-four-or-five first-apex radius alternative, with the
live minimality and no-M44 context retained, restated for the tri-apex
consumers.  The proof is the `Rigid221Closure` theorem of the same name. -/
theorem false_of_originalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False :=
  ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm
    F hmin hNoM44 hcard hunique

end Legacy
end ATailFrontierLiveClosure
end Problem97
