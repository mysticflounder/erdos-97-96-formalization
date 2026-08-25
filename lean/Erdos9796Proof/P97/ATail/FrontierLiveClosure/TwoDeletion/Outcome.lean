/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Ingress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SharedFrontierHelpers

/-!
# The typed outcome of the two-deletion residue

`FourCenterCommonDeletionPacket` bundles the twenty-four hypotheses shared by
the two four-center common-deletion terminal arms: the sixteen ingress
hypotheses, the seven inequalities separating the two actual blockers of the
deleted sources from each other, from the two selected centers and from the
physical apex, and the common-deletion two-center packet at the first deleted
source.  The record is flat, so each of its fields repeats, verbatim, one
binder of those two terminal statements; `toIngress` recovers the ingress part.

`TwoDeletionOutcome` names the three open terminals of the two-deletion case
split and nothing else: the equal-actual-blockers arm, blocker coincidence at
the common deleted source, and the bidirectional deletion-survival square.  The
remaining branches of the split are discharged before an outcome is produced,
so they get no constructor.

`TwoDeletionOutcome` lives in `Prop` because a producer obtains it by
eliminating disjunctions, which a `Type`-valued motive does not admit.
`FourCenterCommonDeletionPacket` and `B1GlobalTransportContext` stay in `Type`,
so a consumer that eliminates an outcome into `False` still has their
projections available.
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

/-- The shared hypothesis bundle of the two four-center common-deletion
terminal arms.  Its twenty-four fields are, verbatim, the twenty-four explicit
binders those two arms share; the record carries no proof obligation of its
own. -/
structure FourCenterCommonDeletionPacket
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
  huClass :
    u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass :
    v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  huOmitted :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
  first :
    ExactFourMutualOmissionJointDeletion R rho u v
  second :
    ExactFourMutualOmissionJointDeletion R rho u v
  hdeletedNe : first.deleted ≠ second.deleted
  hdeletedBlockersNe :
    (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2 ≠
      (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2
  hfirstBlockerNeU :
    (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2 ≠
      (lateFirstApexSystem R).centerAt u.1 u.2
  hfirstBlockerNeV :
    (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  hfirstBlockerNeApex :
    (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2 ≠ S.oppApex2
  hsecondBlockerNeU :
    (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2 ≠
      (lateFirstApexSystem R).centerAt u.1 u.2
  hsecondBlockerNeV :
    (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  hsecondBlockerNeApex :
    (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2 ≠ S.oppApex2
  crossPacket :
    CommonDeletionTwoCenterPacket
      D (lateFirstApexSystem R) first.deleted.1
      ((lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2)
      S.oppApex2

namespace FourCenterCommonDeletionPacket

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}

/-- The ingress record carried by a four-center common-deletion packet. -/
def toIngress
    (P : FourCenterCommonDeletionPacket (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H) (F := F) :=
  { R := P.R, hcard := P.hcard, surface := P.surface, rho := P.rho
    hrho := P.hrho, hfive := P.hfive, u := P.u, v := P.v, huNeV := P.huNeV
    huClass := P.huClass, hvClass := P.hvClass, hvOmitted := P.hvOmitted
    huOmitted := P.huOmitted, first := P.first, second := P.second
    hdeletedNe := P.hdeletedNe }

end FourCenterCommonDeletionPacket

/-- The typed residue of the two-deletion case split: exactly the three open
branches that the checked narrowing does not close.  Every other branch is
discharged before an outcome is produced, so this type names the open frontier
and nothing else. -/
inductive TwoDeletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H} : Prop where
  /-- The two deleted sources have the same actual blocker: the global
  transport arm. -/
  | globalTransport
      (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
        (H := H) (F := F)) :
      TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H) (F := F)
  /-- The common deleted source is itself one of the three nonphysical carrier
  centers. -/
  | blockerCoincidence
      (P : FourCenterCommonDeletionPacket (D := D) (S := S) (radius := radius)
        (H := H) (F := F))
      (hcollision :
        P.first.deleted.1 =
            (lateFirstApexSystem P.R).centerAt P.u.1 P.u.2 ∨
          P.first.deleted.1 =
            (lateFirstApexSystem P.R).centerAt P.v.1 P.v.2 ∨
          P.first.deleted.1 =
            (lateFirstApexSystem P.R).centerAt
              P.second.deleted.1 P.second.deleted.2) :
      TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H) (F := F)
  /-- One of the four surviving centers and the common deleted source form a
  bidirectional deletion-survival square. -/
  | survivalSquare
      (P : FourCenterCommonDeletionPacket (D := D) (S := S) (radius := radius)
        (H := H) (F := F))
      (hsquare :
        (HasNEquidistantPointsAt 4
            (D.A.erase P.first.deleted.1) S.oppApex2 ∧
          HasNEquidistantPointsAt 4
            (D.A.erase S.oppApex2)
            ((lateFirstApexSystem P.R).centerAt
              P.first.deleted.1 P.first.deleted.2)) ∨
        (HasNEquidistantPointsAt 4
            (D.A.erase P.first.deleted.1)
            ((lateFirstApexSystem P.R).centerAt P.u.1 P.u.2) ∧
          HasNEquidistantPointsAt 4
            (D.A.erase
              ((lateFirstApexSystem P.R).centerAt P.u.1 P.u.2))
            ((lateFirstApexSystem P.R).centerAt
              P.first.deleted.1 P.first.deleted.2)) ∨
        (HasNEquidistantPointsAt 4
            (D.A.erase P.first.deleted.1)
            ((lateFirstApexSystem P.R).centerAt P.v.1 P.v.2) ∧
          HasNEquidistantPointsAt 4
            (D.A.erase
              ((lateFirstApexSystem P.R).centerAt P.v.1 P.v.2))
            ((lateFirstApexSystem P.R).centerAt
              P.first.deleted.1 P.first.deleted.2)) ∨
        (HasNEquidistantPointsAt 4
            (D.A.erase P.first.deleted.1)
            ((lateFirstApexSystem P.R).centerAt
              P.second.deleted.1 P.second.deleted.2) ∧
          HasNEquidistantPointsAt 4
            (D.A.erase
              ((lateFirstApexSystem P.R).centerAt
                P.second.deleted.1 P.second.deleted.2))
            ((lateFirstApexSystem P.R).centerAt
              P.first.deleted.1 P.first.deleted.2))) :
      TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H) (F := F)

end ATailFrontierLiveClosure
end Problem97
