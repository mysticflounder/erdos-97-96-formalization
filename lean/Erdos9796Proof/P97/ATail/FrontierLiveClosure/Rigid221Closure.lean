/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteUnsat
import Erdos9796Proof.P97.ATail.ExactFiveCommonAdaptiveReselection
import Erdos9796Proof.P97.ATail.ExactFiveRetainedDoubleDeletion
import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterContinuation
import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterTightCover
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveTwoFamilyUnsat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveTwoFamilyReplayIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.RobustApexFourIncidenceCyclicReduction
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctThreeFanCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctOpposedTurnHardSource

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
open ExactFiveDistinctThreeCenterContinuation
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Physical-apex finite terminal with a genuine third source row.  Its
blocker is explicitly confined to the distinguished deletion, `u`, or the
disjoint two-point `v` block. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    False := by
  sorry

/-- Two-arm eliminator for the checked source-blocker placement of the
physical-apex rigid `2+2+1` frame.  The arm in which `u` is the contextual
source goes to the source-row-heavy chain below, and the genuine third
source-row arm goes to the open `sourceNeU` leaf.  Once the
`sourceBlockerInClass` coordinator below delegates its whole placement split
here, this theorem is the sole consumer of that leaf. -/
theorem false_of_exactFourRigid221_sourceBlockerInClass_placementSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (hplacementCases :
      (u = source ∧
        ((lateFirstApexSystem R).centerAt source.1 source.2 =
            jointDeletion.deleted.1 ∨
          (lateFirstApexSystem R).centerAt source.1 source.2 ∈
            ((lateFirstApexSystem R).selectedAt
                v.1 v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho)) ∨
      (u ≠ source ∧
        ((lateFirstApexSystem R).centerAt source.1 source.2 =
            jointDeletion.deleted.1 ∨
          (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
          (lateFirstApexSystem R).centerAt source.1 source.2 ∈
            ((lateFirstApexSystem R).selectedAt
                v.1 v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 rho))) :
    False := by
  rcases hplacementCases with
    ⟨huSource, hplacement⟩ | ⟨huNeSource, hplacement⟩
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
          huSource hplacement
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
          huNeSource hplacement

/-- Strictly narrower physical-apex coordinator: the source's actual blocker
has been localized into the physical five-class and then into the two
source-row placements above.  The outside-class arm is discharged into the
explicit singleton minimal-core leaf by the parent physical-apex split. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  exact
    false_of_exactFourRigid221_sourceBlockerInClass_placementSplit
      R hcard surface rho source other hrho hfive u v huNeV
        huClass hvClass hvOmitted huOmitted context jointDeletion
        hclassFive globalDeletion hcenter hsourceBlockerClass
        (exactFourRigid221_sourceBlockerInClass_placement
          huClass context globalDeletion hsourceBlockerClass)

/-- Strictly narrower physical-apex coordinator: the source's actual blocker
has been localized into the physical five-class and then into the two
source-row placements above.  The outside-class arm is discharged into the
explicit singleton minimal-core leaf by the parent physical-apex split.
This is a compatibility wrapper over
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho) :
    False :=
  false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass_frame R
    ⟨hcard, surface⟩
    rho source other hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted context
    jointDeletion hclassFive globalDeletion hcenter hsourceBlockerClass

/-- Physical-apex leaf of the contextual rigid `2+2+1` terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  by_cases hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceBlockerInClass_frame
        R ⟨hcard, surface⟩ rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter hsourceBlockerClass
  · obtain
        ⟨sourceDeletion, _hsourceCenter, _hsourceDeleted,
          hsourceCenterNe, ⟨sourceCore⟩⟩ :=
        exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
          R surface source other u v context jointDeletion
            globalDeletion hsourceBlockerClass
    exact
      false_of_exactFourMutualOmissionRigid221_minimalCore
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive sourceDeletion hsourceCenterNe sourceCore

/-- Physical-apex leaf of the contextual rigid `2+2+1` terminal.
This is a compatibility wrapper over
`false_of_exactFourMutualOmissionRigid221_physicalApex_frame`, which takes
the same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2) :
    False :=
  false_of_exactFourMutualOmissionRigid221_physicalApex_frame R
    ⟨hcard, surface⟩
    rho source other hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted context
    jointDeletion hclassFive globalDeletion hcenter

/-- Nonphysical equal-radius collision leaf of the contextual rigid `2+2+1`
terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_nonphysicalCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (_hcollision :
      ∃ s ∈ globalDeletion.deleted, ∃ t ∈ globalDeletion.deleted,
        s ≠ t ∧
          dist globalDeletion.center s =
            dist globalDeletion.center t) :
    False := by
  sorry

/-- The exact-five rigid residue after retaining a globally minimal blocking
subdeletion of the physical class.  The source-row context is preserved and
the global geometry is split exhaustively into three strictly narrower
terminal leaves. -/
theorem false_of_exactFourMutualOmissionRigid221_globalDeletion_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  by_cases hcenter : globalDeletion.center = S.oppApex2
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_frame
        R ⟨hcard, surface⟩ rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive globalDeletion hcenter
  · rcases globalDeletion.geometry with hcollision | hcore
    · exact
        false_of_exactFourMutualOmissionRigid221_nonphysicalCollision
          R hcard surface rho source other hrho hfive u v huNeV
            huClass hvClass hvOmitted huOmitted context jointDeletion
            hclassFive globalDeletion hcenter hcollision
    · rcases hcore with ⟨core⟩
      exact
        false_of_exactFourMutualOmissionRigid221_minimalCore
          R hcard surface rho source other hrho hfive u v huNeV
            huClass hvClass hvOmitted huOmitted context jointDeletion
            hclassFive globalDeletion hcenter core

/-- The exact-five rigid residue after retaining a globally minimal blocking
subdeletion of the physical class.  The source-row context is preserved and
the global geometry is split exhaustively into three strictly narrower
terminal leaves.
This is a compatibility wrapper over
`false_of_exactFourMutualOmissionRigid221_globalDeletion_frame`, which
takes the same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmissionRigid221_globalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) :
    False :=
  false_of_exactFourMutualOmissionRigid221_globalDeletion_frame R
    ⟨hcard, surface⟩
    rho source other hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted context
    jointDeletion hclassFive globalDeletion

/-- The local rigid partition is strengthened, by global minimality, with a
card-minimal blocking subdeletion before entering the remaining terminal. -/
theorem false_of_exactFourMutualOmissionRigid221_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (hrigid :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let Iv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩ C
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv)) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  rcases
      exactFourMutualOmissionRigid221_globalDeletion
        R rho hrho u v jointDeletion hclassFive hrigid with
    ⟨globalDeletion⟩
  exact
    false_of_exactFourMutualOmissionRigid221_globalDeletion_frame
      R ⟨hcard, surface⟩ rho source other hrho hfive u v huNeV
      huClass hvClass hvOmitted huOmitted context jointDeletion
      hclassFive globalDeletion

/-- The local rigid partition is strengthened, by global minimality, with a
card-minimal blocking subdeletion before entering the remaining terminal.
This is a compatibility wrapper over
`false_of_exactFourMutualOmissionRigid221_frame`, which takes the same
hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmissionRigid221
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
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
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (hrigid :
      let C := SelectedClass D.A S.oppApex2 rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩ C
      let Iv :=
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∩ C
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv)) :
    False :=
  false_of_exactFourMutualOmissionRigid221_frame R
    ⟨hcard, surface⟩
    rho source other hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted context
    jointDeletion hclassFive hrigid

/-- The direct exact-four terminal after the mutually omitted pair is
exhaustively coordinated by class cardinality.  Exact class size five either
produces a second deletion or the rigid `2+2+1` partition; every larger class
produces two distinct deletions. -/
theorem false_of_exactFourMutualOmissionJointDeletion_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v) :
    False := by
  obtain ⟨_hcard, surface⟩ := frame
  classical
  by_cases hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5
  · rcases
      exactFourMutualOmissionJointDeletion_exactFive_strongSplit
        R surface rho hclassFive u v jointDeletion with
      hsecond | hrigid
    · rcases hsecond with ⟨second, hdeletedNe⟩
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R _hcard surface rho _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          second jointDeletion hdeletedNe
    · exact
        false_of_exactFourMutualOmissionRigid221_frame
          R ⟨_hcard, surface⟩ rho source other _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          context jointDeletion hclassFive hrigid
  · have hsix :
        6 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
      omega
    obtain ⟨first, second, hdeletedNe⟩ :=
      exists_two_exactFourMutualOmissionJointDeletions
        R surface rho hsix u v jointDeletion.blockers_ne
    exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted
        first second hdeletedNe

/-- The direct exact-four terminal after the mutually omitted pair is
exhaustively coordinated by class cardinality.  Exact class size five either
produces a second deletion or the rigid `2+2+1` partition; every larger class
produces two distinct deletions.
This is a compatibility wrapper over
`false_of_exactFourMutualOmissionJointDeletion_frame`, which takes the
same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmissionJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v) :
    False :=
  false_of_exactFourMutualOmissionJointDeletion_frame R
    ⟨_hcard, surface⟩
    rho source other _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted
    context jointDeletion

/-- The mutually omitted-pair residue of the five-point-radius branch.  It
retains the preceding strict-cap omitted peer and, in addition, two physical
second-apex class sources absent from one another's actual late rows.  Both
cross deletions therefore preserve K4, and the actual blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (_hotherNe : other ≠ source)
    (_hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_hsourceMemURow :
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_hvOmittedSourceRow :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_huEqSourceOrOmitted :
      u = source ∨
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support)
    (_hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2))
    (_hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2)) :
    False := by
  obtain ⟨_hcard, surface⟩ := frame
  let context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v := {
    source_mem_class := _hsourceClass
    source_mem_interior := _hsourceInterior
    source_mem_outside := _hsourceOutside
    source_cross_card_le_two := _hlateCross
    other_ne_source := _hotherNe
    other_mem_class := _hotherClass
    other_mem_interior := _hotherInterior
    other_not_mem_source_row := _hotherOmitted
    source_other_blockers_ne := _hblockersNe
    source_survives_q_or_w := _hsurvives
    source_mem_u_row := _hsourceMemURow
    v_not_mem_source_row := _hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := _huEqSourceOrOmitted
  }
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R surface rho _hfive u v _hblockersUVNe with
    ⟨jointDeletion⟩
  exact
    false_of_exactFourMutualOmissionJointDeletion_frame
      R ⟨_hcard, surface⟩ rho source other _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted context jointDeletion

/-- The mutually omitted-pair residue of the five-point-radius branch.  It
retains the preceding strict-cap omitted peer and, in addition, two physical
second-apex class sources absent from one another's actual late rows.  Both
cross deletions therefore preserve K4, and the actual blockers are distinct.
This is a compatibility wrapper over
`false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (_hotherNe : other ≠ source)
    (_hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_hsourceMemURow :
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_hvOmittedSourceRow :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_huEqSourceOrOmitted :
      u = source ∨
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support)
    (_hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2))
    (_hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2)) :
    False :=
  false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch_frame R
    ⟨_hcard, surface⟩
    rho source _hrho _hfive _hsourceClass _hsourceInterior _hsourceOutside _hlateCross
    other _hotherNe _hotherClass _hotherInterior _hotherOmitted _hblockersNe _hsurvives
    u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _hsourceMemURow
    _hvOmittedSourceRow _huEqSourceOrOmitted _hblockersUVNe _huSurvivesDeleteV
    _hvSurvivesDeleteU

/-- The asymmetric strict-cap omitted peer forces a stronger whole-class
normal form: among the five physical second-apex class sources, two are
mutually omitted.  This checked wrapper is the one-child narrowing from the
former omitted-peer obligation to the mutual-omission obligation above. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (hotherNe : other ≠ source)
    (hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  rcases
      exists_mutuallyOmittedSecondClassPair
        R surface source hfive hsourceClass with
    ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted,
      hsourceMemURow, hvOmittedSourceRow, huEqSourceOrOmitted⟩
  have hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hvOmitted
  have hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr huOmitted
  exact
    false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch_frame
      R ⟨hcard, surface⟩ rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives u v huNeV huClass hvClass
        hvOmitted huOmitted hsourceMemURow hvOmittedSourceRow
        huEqSourceOrOmitted hblockersUVNe huSurvivesDeleteV
        hvSurvivesDeleteU

/-- The asymmetric strict-cap omitted peer forces a stronger whole-class
normal form: among the five physical second-apex class sources, two are
mutually omitted.  This checked wrapper is the one-child narrowing from the
former omitted-peer obligation to the mutual-omission obligation above.
This is a compatibility wrapper over
`false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (hotherNe : other ≠ source)
    (hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False :=
  false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch_frame R
    ⟨hcard, surface⟩
    rho source hrho hfive hsourceClass hsourceInterior hsourceOutside hlateCross other
    hotherNe hotherClass hotherInterior hotherOmitted hblockersNe hsurvives

/-- The bounded-cross-incidence residue supplies a named strict-cap peer
outside the active late row.  Equality of the two actual blockers would make
their canonical supports equal, so the peer's own-row membership proves the
blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior,
      hotherOmitted, hblockersNe⟩
  exact
    false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch_frame
      R ⟨hcard, surface⟩ rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives

/-- The bounded-cross-incidence residue supplies a named strict-cap peer
outside the active late row.  Equality of the two actual blockers would make
their canonical supports equal, so the peer's own-row membership proves the
blockers are distinct.
This is a compatibility wrapper over
`false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False :=
  false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch_frame R
    ⟨hcard, surface⟩
    rho source hrho hfive hsourceClass hsourceInterior hsourceOutside hlateCross
    hsurvives

/-- The five-point-radius branch reduces to its bounded-cross-incidence
residue: three physical strict-cap hits in the actual late row are already
ruled out by two-center cap localization and the ordered-cap row bound. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionBranch_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  exact
    false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch_frame
      R ⟨hcard, surface⟩ rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside
        (actualLateRow_secondClassInterior_card_le_two
          R surface source hsourceClass hsourceInterior)
        hsurvives

/-- The five-point-radius branch reduces to its bounded-cross-incidence
residue: three physical strict-cap hits in the actual late row are already
ruled out by two-center cap localization and the ordered-cap row bound.
This is a compatibility wrapper over
`false_of_exactFourPostCardElevenInteriorDeletionBranch_frame`, which
takes the same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False :=
  false_of_exactFourPostCardElevenInteriorDeletionBranch_frame R
    ⟨hcard, surface⟩
    rho source hrho hfive hsourceClass hsourceInterior hsourceOutside hsurvives

/-- The card-at-least-thirteen residual of the no-five two-distinct-radii
branch of the post-card-eleven robust exact-four terminal.  The exact card-12
cell is discharged by the two-family CNF replay; this leaf states what remains
for every larger carrier. -/
theorem false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    False := by
  sorry

/-- The no-five two-distinct-radii branch of the post-card-eleven robust
exact-four terminal.  It retains the two disjoint exact rows and their radius
identifications.  Positivity, exact class cardinalities, and the strict-second-
cap lower bounds are reconstructed from those rows and the no-five packet. -/
theorem false_of_exactFourPostCardElevenTwoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    False := by
  rcases Nat.eq_or_lt_of_le _hcard with h12 | h13
  · exact DRExactTwelveTwoFamilyUnsat.false_of_twoRadiusBranch_exactTwelve_of_clausesUnsatisfiable
      DRExactTwelveTwoFamilyReplayIngress.clausesUnsatisfiable
      R surface rho otherRadius firstRow secondRow _hradii _hnoFive _hfirstRadius
      _hsecondRadius _hdisjoint h12.symm
  · exact false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
      R h13 surface rho otherRadius firstRow secondRow _hradii _hnoFive _hfirstRadius
      _hsecondRadius _hdisjoint

/-- The narrowed post-card-eleven robust exact-four terminal.  Its checked
radius normal form now dispatches directly to two load-bearing branch
obligations: the surviving interior-deletion branch and the no-five
two-distinct-radii branch. -/
theorem false_of_exactFourPostCardElevenRobustSurface_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R surface with
    ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
      hsourceOutside, hsurvives⟩ |
      ⟨rho, otherRadius, firstRow, secondRow, hrho, hother, hradii,
        hnoFive, hcardRho, hcardOther, hfirstRadius, hsecondRadius,
        hdisjoint, hinterior, hinteriorOther⟩
  · exact
      false_of_exactFourPostCardElevenInteriorDeletionBranch_frame
        R ⟨hcard, surface⟩ rho source hrho hfive hsourceClass hsourceInterior
          hsourceOutside hsurvives
  · exact
      false_of_exactFourPostCardElevenTwoRadiusBranch
        R hcard surface rho otherRadius firstRow secondRow
          hradii hnoFive hfirstRadius hsecondRadius hdisjoint

/-- The narrowed post-card-eleven robust exact-four terminal.  Its checked
radius normal form now dispatches directly to two load-bearing branch
obligations: the surviving interior-deletion branch and the no-five
two-distinct-radii branch.
This is a compatibility wrapper over
`false_of_exactFourPostCardElevenRobustSurface_frame`, which takes the
same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False :=
  false_of_exactFourPostCardElevenRobustSurface_frame R
    ⟨hcard, surface⟩

/-- The robust physical-second-apex outcome reduces to the checked
post-card-eleven surface.  The remaining contradiction is exposed directly
by `false_of_exactFourPostCardElevenRobustSurface`. -/
theorem false_of_exactFourPhysicalConsumerRobustOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_secondApex_robust : FullyDeletionRobustAt D S.oppApex2) :
    False := by
  rcases nonempty_postCardElevenRobustSurface_of_robust
      _hcard _ingress _secondApex_robust with ⟨surface⟩
  exact false_of_exactFourPostCardElevenRobustSurface_frame _R ⟨_hcard, surface⟩

/-- The swapped protected-exact-four terminal remaining after the checked
exact-four source reduction.  Both the original residual and the physical
common-deletion ingress are retained, so this is not a data-erasing recursive
return to the first-apex exact-four statement. -/
theorem false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress _R)
    (_swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem _R)) :
    False := by
  sorry

/-- Field-for-field adapter from the live exact-four residual to the source
residual consumed by the physical-second-apex producer. -/
private def toOriginalUniqueFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_fourClass_radius
  every_class_member_blocks := R.every_class_member_obstructs
  interior_q := R.interior_q
  interior_w := R.interior_w
  interior_q_mem := R.interior_q_mem
  interior_w_mem := R.interior_w_mem
  interior_q_ne_w := R.interior_q_ne_w
  bisector_center_mem_interior := R.bisector_center_mem_interior

/-- Checked two-way source reduction for the genuinely large-cardinality
exact-four remainder.  The former undifferentiated obligation is narrowed to
the robust physical-second-apex and swapped protected-exact-four terminals
above. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : 12 ≤ D.A.card) :
    False := by
  let original := toOriginalUniqueFourResidual R
  rcases nonempty_exactFourPhysicalConsumerOutcome original with ⟨outcome⟩
  cases outcome with
  | robust ingress secondApex_robust =>
      exact
        false_of_exactFourPhysicalConsumerRobustOutcome
          original hcard ingress secondApex_robust
  | swappedUniqueFour ingress swapped =>
      exact
        false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome
          original hcard ingress swapped

/-- Checked exhaustive cardinality dispatch for the exact-four residual.
The no-`(m,4,4)` field excludes carrier cardinality ten; the remaining cases
are the fixed card-eleven certificate ingress and the card-at-least-twelve
remainder. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    False := by
  have hge11 : 11 ≤ D.A.card :=
    carrier_card_ge_eleven_of_original_unique_four_residual
      (toOriginalUniqueFourResidual R)
  by_cases hcard11 : D.A.card = 11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
        R hcard11
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve
        R (by omega)

/-- The second physical opposite apex is one of the fixed MEC vertices. -/
private theorem exactFiveDistinct_oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A swapped unique-four frontier carries the exact-four residual fields
needed by the production eliminator. -/
private theorem nonempty_exactFourResidual_of_swapped
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (W : SwappedFirstApexUniqueFourFrontier D S H) :
    Nonempty (FirstApexUniqueRadiusExactFourResidual W.frontier) := by
  rcases
      FirstApexInteriorPairGeometry.exists_exactFour_firstApex_interiorPair
        D W.packet W.radius_pos W.firstClass_card_eq_four with
    ⟨q, w, hq, hw, hqw⟩
  have hblocks :
      ∀ x : ℝ², x ∈ SelectedClass D.A W.packet.oppApex1 W.radius →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase x) W.packet.oppApex1 :=
    ATailUniqueArmRouteAuditScratch.uniqueFour_every_classMember_blocks_firstApex
      W.firstClass_card_eq_four W.firstClass_unique_radius
  exact ⟨{
    minimal := hmin
    noM44 := hNoM44
    carrier_card_gt_nine := hcard
    class_card_eq_four := W.firstClass_card_eq_four
    unique_fourClass_radius := W.firstClass_unique_radius
    every_class_member_obstructs := hblocks
    interior_q := q
    interior_w := w
    interior_q_mem := hq
    interior_w_mem := hw
    interior_q_ne_w := hqw
    bisector_center_mem_interior := by
      intro c hcA hcApex hcEq
      exact
        FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
          hq hw hqw hcA hcApex hcEq
  }⟩

/-- At carrier cardinality eleven, a critical physical-second-apex outcome
reorients to an exact-four residual already closed by the checked
card-eleven certificate. -/
private theorem false_of_exactFiveDistinct_swapped_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11)
    (W : SwappedFirstApexUniqueFourFrontier D S H) :
    False := by
  exact
    false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven
      (nonempty_exactFourResidual_of_swapped
        R.minimal R.noM44 R.carrier_card_gt_nine W).some hcard

/-- A genuinely fresh source cannot lie in the first-apex selected class:
that class is the old first row with `deleted` removed. -/
theorem fresh_not_mem_firstApexSelectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (normalForm : ExactFiveDistinctThreeCenterNormalForm R C)
    (fresh : ℝ²) (fresh_ne_deleted : fresh ≠ deleted)
    (packet :
      ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows D fresh
        S.oppApex1 center S.oppApex2
        normalForm.firstApexClass.support
        normalForm.blockerClass.support
        normalForm.secondApexClass.support) :
    fresh ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hfresh
  have herase : fresh ∈ (SelectedClass D.A S.oppApex1 radius).erase deleted :=
    Finset.mem_erase.mpr ⟨fresh_ne_deleted, hfresh⟩
  apply packet.row₀.q_not_mem
  rw [normalForm.firstApexClass_support_eq]
  exact herase

/-- Open strict-source physical endpoint: a deletion source distinct from the
original interior deletion preserves all three exact selected rows, while the
retained source is omitted by the second row. -/
theorem false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (normalForm : ExactFiveDistinctThreeCenterNormalForm R C)
    (fresh : ℝ²) (fresh_ne_deleted : fresh ≠ deleted)
    (packet :
      ATailThreeCenterCommonDeletion.ThreeCenterCommonDeletionExactRows D fresh
        S.oppApex1 center S.oppApex2
        normalForm.firstApexClass.support
        normalForm.blockerClass.support
        normalForm.secondApexClass.support)
    (retained_not_mem_second :
      normalForm.retained ∉ normalForm.secondApexClass.support)
    (retainedPacket :
      CommonDeletionTwoCenterPacket D H normalForm.retained
        S.oppApex1 S.oppApex2) :
    False := by
  sorry

/-- Open tight-cover endpoint: the original deletion leaves exactly the
eleven points covered by the three rows, and the retained source supplies the
physical two-center continuation. -/
theorem false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (normalForm : ExactFiveDistinctThreeCenterNormalForm R C)
    (carrier_card_eq_twelve : D.A.card = 12)
    (union_card_eq_eleven :
      ((normalForm.firstApexClass.support ∪
          normalForm.blockerClass.support) ∪
        normalForm.secondApexClass.support).card = 11)
    (carrier_erase_deleted_eq_union :
      D.A.erase deleted =
        (normalForm.firstApexClass.support ∪
          normalForm.blockerClass.support) ∪
        normalForm.secondApexClass.support)
    (retained_not_mem_second :
      normalForm.retained ∉ normalForm.secondApexClass.support)
    (packet :
      CommonDeletionTwoCenterPacket D H normalForm.retained
        S.oppApex1 S.oppApex2) :
    False := by
  rcases
      ExactFiveDistinctThreeCenterTightCover.nonempty_balancedTightCoverInvariant
        R C normalForm carrier_card_eq_twelve union_card_eq_eleven
          carrier_erase_deleted_eq_union with
    ⟨invariant⟩
  rcases
      nonempty_balanced555SourceConfiguration R C normalForm invariant with
    ⟨sourceConfiguration⟩
  rcases
      nonempty_balanced555FiniteConfiguration
        R C normalForm invariant sourceConfiguration with
    ⟨finiteConfiguration⟩
  exact
    Balanced555FiniteUnsat.false_of_balanced555FiniteConfiguration
      finiteConfiguration

/-- The bi-apex-robust exact-five endpoint splits soundly into a genuinely
new three-center deletion source or the exact-twelve tight physical cover.
The common-deletion packet retains its source orientation instead of erasing
which interior source was deleted and which source supplied the blocker row.
Before the split, the actual simultaneous-deletion witness reselects the
second row so the former five-incidence alternative is not needed. -/
theorem false_of_exactFiveDistinct_threeCenterNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (normalForm : ExactFiveDistinctThreeCenterNormalForm R C) :
    False := by
  rcases
      ExactFiveRetainedDoubleDeletion.exists_secondApex_row_omitting_originalPair
        normalForm with
    ⟨secondApexClass, hretained, hdeleted⟩
  let C' :=
    ExactFiveRetainedDoubleDeletion.replaceSecondRow
      C secondApexClass hdeleted
  let normalForm' :=
    ExactFiveRetainedDoubleDeletion.physicalNormalFormWithSecondRow
      normalForm secondApexClass hdeleted hretained
  have hretained' :
      normalForm'.retained ∉ normalForm'.secondApexClass.support := by
    exact hretained
  have retainedPacket :
      CommonDeletionTwoCenterPacket D H normalForm'.retained
        S.oppApex1 S.oppApex2 := by
    exact
      (nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
        H normalForm.retained_mem_A
        normalForm.freshThreeCenter.center₀_mem_A
        normalForm.freshThreeCenter.center₂_mem_A
        normalForm.freshThreeCenter.center₀_ne_center₂
        R.firstApex_fullyDeletionRobust secondApexClass hretained).some
  rcases nonempty_strictThreeCenterAlternative R C' normalForm' with ⟨strict⟩
  cases strict with
  | distinctFresh fresh fresh_ne_deleted packet =>
      exact
        false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
          R C' normalForm' fresh fresh_ne_deleted packet
          hretained' retainedPacket
  | exactTwelveTightPhysical hcard hunion herase hmissing packet =>
      exact
        false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical
          R C' normalForm' hcard hunion herase hmissing packet

/-- The oriented robust endpoint reduces to a support-preserving three-center
normal form with the retained source's second-row incidence resolved. -/
theorem false_of_exactFiveDistinct_biApexRobust_postCardEleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (_commonDeletion :
      CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (_oriented :
      (deleted = R.interior.frontier.pair.w ∧
          center = H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) ∨
        (deleted = R.interior.frontier.pair.q ∧
          center = H.centerAt R.interior.frontier.pair.w
            R.interior.frontier.pair.w_mem_A))
    (_secondApex_robust : FullyDeletionRobustAt D S.oppApex2) :
    False := by
  exact
    false_of_exactFiveDistinct_threeCenterNormalForm R _commonDeletion
      (nonempty_normalForm R _commonDeletion _oriented _secondApex_robust).some

/-- A physical-second-apex common-deletion packet for the exact-five
distinct-center residual is terminal except at the explicit bi-apex-robust
post-card-eleven endpoint. -/
private theorem false_of_exactFiveDistinct_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (horiented :
      (deleted = R.interior.frontier.pair.w ∧
          center = H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) ∨
        (deleted = R.interior.frontier.pair.q ∧
          center = H.centerAt R.interior.frontier.pair.w
            R.interior.frontier.pair.w_mem_A)) :
    False := by
  rcases physicalSecondApex_commonDeletion_robust_or_critical C with
    hrobust | hcritical
  · exact
      false_of_exactFiveDistinct_biApexRobust_postCardEleven
        R C horiented hrobust.some
  · have hswapped :
        Nonempty (SwappedFirstApexUniqueFourFrontier D S H) :=
      physicalSecondCritical_reorients_to_swappedUniqueFour
        hcritical.some.shell hcritical.some.deletion_blocked
    rcases hswapped with ⟨W⟩
    rcases
        FirstApexInteriorPairGeometry.exists_exactFour_firstApex_interiorPair
          D W.packet W.radius_pos W.firstClass_card_eq_four with
      ⟨q, w, hq, hw, hqw⟩
    have hblocks :
        ∀ x : ℝ², x ∈ SelectedClass D.A W.packet.oppApex1 W.radius →
          ¬ HasNEquidistantPointsAt 4 (D.A.erase x) W.packet.oppApex1 :=
      ATailUniqueArmRouteAuditScratch.uniqueFour_every_classMember_blocks_firstApex
        W.firstClass_card_eq_four W.firstClass_unique_radius
    let R4 : FirstApexUniqueRadiusExactFourResidual W.frontier := {
      minimal := R.minimal
      noM44 := R.noM44
      carrier_card_gt_nine := R.carrier_card_gt_nine
      class_card_eq_four := W.firstClass_card_eq_four
      unique_fourClass_radius := W.firstClass_unique_radius
      every_class_member_obstructs := hblocks
      interior_q := q
      interior_w := w
      interior_q_mem := hq
      interior_w_mem := hw
      interior_q_ne_w := hqw
      bisector_center_mem_interior := by
        intro c hcA hcApex hcEq
        exact
          FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
            hq hw hqw hcA hcApex hcEq }
    exact false_of_firstApexUniqueRadiusExactFourResidual R4

/-- A physical-second-apex common-deletion packet closes at cardinality
eleven: robustness forces cardinality at least twelve, while criticality
reorients to the checked exact-four certificate. -/
private theorem false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    False := by
  rcases physicalSecondApex_commonDeletion_robust_or_critical C with
    hrobust | hcritical
  · have hge12 :=
      carrierCard_ge_twelve_of_secondApexRobust
        R hrobust.some
    omega
  · rcases
      physicalSecondCritical_reorients_to_swappedUniqueFour
        hcritical.some.shell hcritical.some.deletion_blocked with
      ⟨W⟩
    exact false_of_exactFiveDistinct_swapped_of_card_eq_eleven R hcard W

/-- The exact-five residual with distinct obstruction centers is impossible
at carrier cardinality eleven.  The directed surviving row and the physical
second apex form a common-deletion packet; its robust and critical outcomes
are both terminal at this cardinality. -/
theorem
    false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hcard : D.A.card = 11) :
    False := by
  let P := R.interior.frontier.pair
  rcases R.directed_crossDeletion_survival with hdeleteW | hdeleteQ
  · have hcenterA : H.centerAt P.q P.q_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.w_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.q_blocker_ne_oppApex2 hdeleteW P.w_survives with
      ⟨C⟩
    exact
      false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
        R hcard C
  · have hcenterA : H.centerAt P.w P.w_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.q_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.w_blocker_ne_oppApex2 hdeleteQ P.q_survives with
      ⟨C⟩
    exact
      false_of_exactFiveDistinct_commonDeletion_of_card_eq_eleven
        R hcard C

/-- Open exact-five residual with distinct selected obstruction centers.
This is a load-bearing production obligation for
`false_of_originalFrontierUniqueRadiusArm`. -/
theorem false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    False := by
  let P := R.interior.frontier.pair
  rcases R.directed_crossDeletion_survival with hdeleteW | hdeleteQ
  · have hcenterA : H.centerAt P.q P.q_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.w_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.q_blocker_ne_oppApex2 hdeleteW P.w_survives with
      ⟨C⟩
    exact false_of_exactFiveDistinct_commonDeletion R C
      (Or.inl ⟨rfl, rfl⟩)
  · have hcenterA : H.centerAt P.w P.w_mem_A ∈ D.A := by
      exact
        (Finset.mem_erase.mp
          (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.center_mem).2
    rcases
        nonempty_commonDeletionTwoCenterPacket H
          P.q_mem_A hcenterA (exactFiveDistinct_oppApex2_mem_A S)
          P.w_blocker_ne_oppApex2 hdeleteQ P.q_survives with
      ⟨C⟩
    exact false_of_exactFiveDistinct_commonDeletion R C
      (Or.inr ⟨rfl, rfl⟩)

/-- Reduce the exact-five common-obstruction-center residual by adaptive
strict-interior reselection.  The resulting exact-four or distinct exact-five
outcome is consumed by the existing production eliminators. -/
theorem false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    False := by
  rcases
      ExactFiveCommonAdaptiveReselection.nonempty_swapped_or_distinct R with
    hswapped | hdistinct
  · exact
      false_of_firstApexUniqueRadiusExactFourResidual
        (nonempty_exactFourResidual_of_swapped
          R.minimal R.noM44 R.carrier_card_gt_nine hswapped.some).some
  · exact
      false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
        hdistinct.some

/-- Two-arm eliminator for the exact-five first-apex unique-radius residual.
The distinct-obstruction-centers arm goes to the closed exact-five distinct
terminal, and the common-obstruction-center arm to the open common-center
residual leaf.  Once the unique-radius arm coordinator below delegates its
exact-five branch here, this theorem is the sole consumer of that leaf. -/
theorem false_of_firstApexUniqueRadiusExactFiveResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (hfive :
      Nonempty
          (FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
            F) ∨
        Nonempty
          (FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)) :
    False := by
  rcases hfive with hdistinct | hcommon
  · exact
      false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
        hdistinct.some
  · exact
      false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
        hcommon.some

/-- The protected exact-four-or-five first-apex radius alternative, with the
live minimality and no-M44 context retained. -/
theorem false_of_originalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  rcases firstApexUniqueRadius_residualCases
      F hmin hNoM44 hcard hunique with hfourResidual | hfiveResidual
  · exact false_of_firstApexUniqueRadiusExactFourResidual
      hfourResidual.some
  · exact false_of_firstApexUniqueRadiusExactFiveResidual hfiveResidual


end ATailFrontierLiveClosure
end Problem97
