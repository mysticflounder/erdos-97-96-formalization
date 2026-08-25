/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

/-
ATTIC BUNDLE — retained transcription oracle (W3-TD-cleanup, 2026-08-25).

Source path:   lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean
Source commit: fc4c0c7c

The eight declarations below were MOVED here verbatim, byte for byte and in
source order, out of the file named above.  Nothing was dropped or rewritten.
Their line ranges in that file at commit fc4c0c7c (docstring through the line
before the next top-level item) are:

  153-211   false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_frame
  212-257   false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
  848-974   false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame
  975-1048  false_of_exactFourMutualOmission_fourCenterCommonDeletion
  1049-1143 false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame
  1144-1215 false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
  1216-1291 false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters_frame
  1292-1358 false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters

Role: retained transcription oracle for `twoDeletionOutcome_of_ingress`, per
`proof-status/receipts/w3-td-gate-receipt.json`.  The only kernel callers these
eight declarations ever had were each other; no live obligation reaches them.

NOT COMPILED — this file is outside the Lake source tree and is not part of any
build target.  Do not resurrect these declarations as a current obligation; see
`docs/dead-ends.md`.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision

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

/-- The collision arm of the two-deletion residue.  It is now a checked
adapter: the live binders are packaged as `B1GlobalTransportContext`, the
load-bearing producer above supplies the exact global-gap disjunction, and the
source-clean B1 consumer closes each arm. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
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
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :
    False := by
  obtain ⟨_hcard, surface⟩ := frame
  let C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F) :=
    { R := R
      hcard := _hcard
      surface := surface
      rho := rho
      hrho := _hrho
      hfive := _hfive
      u := u
      v := v
      huNeV := _huNeV
      huClass := _huClass
      hvClass := _hvClass
      hvOmitted := _hvOmitted
      huOmitted := _huOmitted
      first := first
      second := second
      hdeletedNe := _hdeletedNe
      hblockersEq := _hblockersEq }
  exact false_of_b1_global_gap_or_closed_terminal C
    (b1_globalGapOrClosedTerminal_of_counterexample C)

/-- The collision arm of the two-deletion residue.  It is now a checked
adapter: the live binders are packaged as `B1GlobalTransportContext`, the
load-bearing producer above supplies the exact global-gap disjunction, and the
source-clean B1 consumer closes each arm.
This is a compatibility wrapper over
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
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
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :
    False :=
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_frame R
    ⟨_hcard, surface⟩
    rho _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
    _hdeletedNe _hblockersEq

/-- The normalized four-center common-deletion residue.  The checked finite
shell split above reduces it to blocker coincidence or a bidirectional
deletion-survival square. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
    (rho : ℝ)
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
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    False := by
  obtain ⟨_hcard, surface⟩ := frame
  have hsplit :=
    exactFour_fourSurvivingCenters_survivalSquare_split
      _hrho first second
      _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
      crossPacket
  rcases hsplit with hqu | hqv | hqr | ha | hu | hv | hr
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inl hqu)
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inl hqv))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr hqr))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inl ha)
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inl hu))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr (Or.inl hv)))
  · exact
      false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe
        _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
        _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
        crossPacket (Or.inr (Or.inr (Or.inr hr)))

/-- The normalized four-center common-deletion residue.  The checked finite
shell split above reduces it to blocker coincidence or a bidirectional
deletion-survival square.
This is a compatibility wrapper over
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame`, which
takes the same hypotheses packaged as a `PostCardElevenSurfaceFrame`. -/
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
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
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    False :=
  false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame R
    ⟨_hcard, surface⟩
    rho _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
    _hdeletedNe _hdeletedBlockersNe _hfirstBlockerNeU _hfirstBlockerNeV
    _hfirstBlockerNeApex _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex
    crossPacket

/-- A directed cross-omission produces an exact q-deleted four-point row at
the other deletion's blocker.  Together with the two existing packets this
is the four-center common-deletion residue above. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
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
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstNotMemSecondRow :
      first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  have hsecondBlockerA :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.center_mem).2
  have hcrossSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1)
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) second.deleted.2).mpr
        hfirstNotMemSecondRow
  rcases
      nonempty_commonDeletionTwoCenterPacket
        (lateFirstApexSystem R)
        first.uPacket.q_mem_A
        hsecondBlockerA
        first.uPacket.center₂_mem_A
        hsecondBlockerNeApex
        hcrossSurvives
        first.uPacket.survives₂ with
    ⟨crossPacket⟩
  exact
    false_of_exactFourMutualOmission_fourCenterCommonDeletion_frame
      R ⟨hcard, surface⟩ rho hrho hfive u v huNeV
      huClass hvClass hvOmitted huOmitted first second
      hdeletedNe hdeletedBlockersNe
      hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
      hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
      crossPacket

/-- A directed cross-omission produces an exact q-deleted four-point row at
the other deletion's blocker.  Together with the two existing packets this
is the four-center common-deletion residue above.
This is a compatibility wrapper over
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission
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
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstNotMemSecondRow :
      first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support) :
    False :=
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame R
    ⟨hcard, surface⟩
    rho hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted first second hdeletedNe
    hdeletedBlockersNe hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
    hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex hfirstNotMemSecondRow

/-- The fresh-blocker arm reduces, by the checked blocker-two-cycle
contradiction and symmetry, to one directed cross-omission residue. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters_frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (frame : PostCardElevenSurfaceFrame R)
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
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2) :
    False := by
  obtain ⟨hcard, surface⟩ := frame
  rcases exactFour_twoDeletion_crossOmission first second hdeletedNe
      hdeletedBlockersNe hfirstBlockerNeApex hsecondBlockerNeApex with
    hfirstNotMem | hsecondNotMem
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame
        R ⟨hcard, surface⟩ rho hrho hfive u v huNeV huClass hvClass
        hvOmitted huOmitted first second hdeletedNe hdeletedBlockersNe
        hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
        hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
        hfirstNotMem
  · exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions_oneWayCrossOmission_frame
        R ⟨hcard, surface⟩ rho hrho hfive u v huNeV huClass hvClass
        hvOmitted huOmitted second first hdeletedNe.symm
        hdeletedBlockersNe.symm
        hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
        hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
        hsecondNotMem

/-- The fresh-blocker arm reduces, by the checked blocker-two-cycle
contradiction and symmetry, to one directed cross-omission residue.
This is a compatibility wrapper over
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters_frame`,
which takes the same hypotheses packaged as a
`PostCardElevenSurfaceFrame`. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters
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
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2) :
    False :=
  false_of_twoDistinctExactFourMutualOmissionJointDeletions_fiveCenters_frame R
    ⟨hcard, surface⟩
    rho hrho hfive u v huNeV huClass hvClass hvOmitted huOmitted first second hdeletedNe
    hdeletedBlockersNe hfirstBlockerNeU hfirstBlockerNeV hfirstBlockerNeApex
    hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex

end ATailFrontierLiveClosure
end Problem97
