/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DistinctReducedUnionDispatcherDraft
import DirectReducedUnionSemanticBridge
import MirrorReducedUnionSemanticBridge
import ExactFiveCard13SameRadiusDispatcher

/-!
# Unconditional exact-five card-thirteen closure

This module joins the kernel-checked direct and mirror reduced-union
certificates to the source-faithful distinct-radius dispatcher, and then
combines that branch with the already-closed same-radius branch.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13SameRadiusDispatcherScratch
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

noncomputable section

/-- The direct and mirror checked reduced-union endpoints close the complete
distinct-radius exact-five card-thirteen branch. -/
theorem false_of_exactFive_card13_distinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius) :
    False := by
  apply false_of_exactFive_card13_distinctRadius_of_reducedUnionCallbacks
    Q profile first hcard hdistinct
  · intro star hall
    exact false_of_exactFive_card13_allRowsOneHit
      Q profile star hall hcard
  · intro M N P star T C hroles
    exact false_of_directReducedUnion
      P T C hroles hcard hdistinct
  · intro M N P star T C hroles
    exact false_of_mirrorReducedUnion
      P T C hroles hcard hdistinct

/-- The exact-five card-thirteen parent is impossible, independently of the
relation between the retained and double-deletion first-apex radii. -/
theorem false_of_exactFive_card13
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13) :
    False := by
  by_cases hsame : first.doubleRadius = radius
  · exact false_of_exactFive_card13_sameRadius
      Q profile first hcard hsame
  · exact false_of_exactFive_card13_distinctRadius
      Q profile first hcard hsame

#print axioms false_of_exactFive_card13_distinctRadius
#print axioms false_of_exactFive_card13

end
end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97
