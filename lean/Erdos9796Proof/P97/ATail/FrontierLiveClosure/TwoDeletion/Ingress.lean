/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore

/-!
# The two-deletion ingress record

`TwoDeletionIngress` packages the sixteen hypotheses under which two distinct
exact-four mutual-omission joint deletions are available over one physical
second-apex radius class.  Every field repeats, verbatim, one hypothesis of the
loose argument list the two-deletion consumers already carry, so the record
introduces no mathematical content of its own and carries no proof obligation.

Field names repeat the loose hypothesis names exactly, so
`obtain ⟨R, hcard, …⟩ := I` reintroduces the same local names a proof body
already uses.  `TwoDeletionIngress.ofBundle` builds the record from that loose
list, and the generated projections `I.R`, `I.hcard`, … recover the fields.

The field list is the one of `B1GlobalTransportContext` without its final
`hblockersEq` field: from an ingress record and the hypothesis that the two
deleted sources have the same actual blocker one obtains a value of that
context.
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

/-- The complete ingress of the two-deletion residue: the sixteen hypotheses
under which two distinct exact-four mutual-omission joint deletions are
available over one physical second-apex radius class, packaged once.  Every
field repeats, verbatim, one hypothesis of the loose argument list, so the
record carries no proof obligation of its own. -/
structure TwoDeletionIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H} :
    Type where
  R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F
  hcard : 12 ≤ D.A.card
  surface : ExactFourPostCardElevenRobustSurface R
  rho : ℝ
  hrho : 0 < rho
  hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card
  u : CarrierVertex D.A
  v : CarrierVertex D.A
  huNeV : u ≠ v
  huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support
  huOmitted :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
  first : ExactFourMutualOmissionJointDeletion R rho u v
  second : ExactFourMutualOmissionJointDeletion R rho u v
  hdeletedNe : first.deleted ≠ second.deleted

namespace TwoDeletionIngress

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}

/-- Package the loose sixteen-argument list into an ingress record. -/
def ofBundle
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted) :
    TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H) (F := F) :=
  { R := R, hcard := hcard, surface := surface, rho := rho, hrho := hrho
    hfive := hfive, u := u, v := v, huNeV := huNeV, huClass := huClass
    hvClass := hvClass, hvOmitted := hvOmitted, huOmitted := huOmitted
    first := first, second := second, hdeletedNe := hdeletedNe }

end TwoDeletionIngress

end ATailFrontierLiveClosure
end Problem97
