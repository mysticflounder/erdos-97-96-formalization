/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation
import Erdos9796Proof.P97.ATail.RetainedMatchingSourceReturnRadiusSplit
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# Strict-interior retained-parent normal form

Select the two guaranteed strict-first-cap retained sources before inspecting
their actual blockers. The equal-blocker arm is localized to that cap. The
three distinct strict-cap roles first yield a fresh common deletion and then a
source-exact mutual-omission cycle unconditionally. The distinct-blocker arm
is normalized to a source-tagged two-step common-deletion walk. Its endpoint
fiber chooses a genuinely fourth row source and splits into a cross hit or a
fresh common deletion; its three-distinct path splits into a closing cross hit
or a source-exact three-cycle. Its source-return arm is refined to either a
joint deletion at three concrete centers or an exact four-point radius
partition, with concrete U5 row ingress in both cases.
-/

namespace Problem97
namespace ATailRetainedStrictInteriorParentNormalForm

open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingSourceReturnRadiusSplit
open ATailRetainedStrictInteriorPairSelector

/-- Exact normal form for the retained common-deletion parent. -/
inductive RetainedStrictInteriorParentNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | localizedCollision
      (data : RetainedInteriorBlockerCollision R)
      (commonDeletion : LocalizedCollisionCommonDeletion data)
  | matchingCycle (data : RetainedMatchingCommonDeletionCycleNormalForm R)

/-- The full retained parent reaches either the cap-localized collision's
fresh common deletion or the source-tagged matching cycle normal form. -/
theorem nonempty_retainedStrictInteriorParentNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedStrictInteriorParentNormalForm R) := by
  rcases nonempty_strictInteriorParentOutcome R with ⟨outcome⟩
  cases outcome with
  | localizedCollision data =>
      rcases data.nonempty_commonDeletion with ⟨commonDeletion⟩
      exact ⟨RetainedStrictInteriorParentNormalForm.localizedCollision
        data commonDeletion⟩
  | consumedDistinctBlockers data =>
      rcases
          nonempty_matchingCommonDeletionCycleNormalForm_of_largeCapOutcome data with
        ⟨cycle⟩
      exact ⟨RetainedStrictInteriorParentNormalForm.matchingCycle cycle⟩

/-- Flat four-way terminal surface exposed to the direct parent assembler. -/
inductive RetainedStrictInteriorTerminalSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | localizedCollisionMutualOmission
      (collision : RetainedInteriorBlockerCollision R)
      (commonDeletion : LocalizedCollisionCommonDeletion collision)
      (cycle : LocalizedCollisionMutualOmissionCycle collision commonDeletion)
  | matchingSourceReturn
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (outcome : RetainedSourceReturnU5Outcome walk)
  | matchingEndpointCriticalFiber
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (fiber : RetainedMatchingEndpointCriticalFiber walk)
      (freshSource : EndpointFreshFirstApexRowSource fiber)
      (continuation : EndpointFreshCrossOrCommonDeletion freshSource)
  | matchingThreeDistinctBlockers
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (path : RetainedMatchingThreeDistinctBlockerPath walk)
      (continuation : ThreeDistinctEndpointCrossOrCycle path)

/-- Flatten the nested retained-parent normal form without discarding any
source, blocker, cap, row, or deletion provenance. -/
theorem nonempty_retainedStrictInteriorTerminalSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedStrictInteriorTerminalSurface R) := by
  rcases nonempty_retainedStrictInteriorParentNormalForm R with ⟨normal⟩
  cases normal with
  | localizedCollision collision commonDeletion =>
      rcases nonempty_localizedCollisionMutualOmissionCycle
          collision commonDeletion with
        ⟨cycle⟩
      exact ⟨RetainedStrictInteriorTerminalSurface.localizedCollisionMutualOmission
        collision commonDeletion cycle⟩
  | matchingCycle data =>
      cases data.endpoint with
      | sourceReturn next_eq_first =>
          rcases nonempty_sourceReturnU5Outcome data.walk next_eq_first with
            ⟨outcome⟩
          exact ⟨RetainedStrictInteriorTerminalSurface.matchingSourceReturn
            data.walk outcome⟩
      | endpointCriticalFiber fiber =>
          rcases nonempty_endpointFreshFirstApexRowSource fiber with
            ⟨freshSource⟩
          rcases nonempty_endpointFreshCrossOrCommonDeletion freshSource with
            ⟨continuation⟩
          exact ⟨RetainedStrictInteriorTerminalSurface.matchingEndpointCriticalFiber
            data.walk fiber freshSource continuation⟩
      | threeDistinctBlockers path =>
          rcases nonempty_threeDistinctEndpointCrossOrCycle path with
            ⟨continuation⟩
          exact ⟨RetainedStrictInteriorTerminalSurface.matchingThreeDistinctBlockers
            data.walk path continuation⟩

end ATailRetainedStrictInteriorParentNormalForm
end Problem97
