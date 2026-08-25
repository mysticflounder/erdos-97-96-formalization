/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Ingress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Outcome

/-!
# The two-deletion coordinator

Three declarations organize the two-deletion residue into a narrowing step and
a consuming step.

`twoDeletionOutcome_of_ingress` narrows an ingress record to a
`TwoDeletionOutcome`.  Its case analysis is the one the cluster already
performs: first on whether the two deleted sources have the same actual
blocker, then on the directed cross-omission alternative, then on the seven-way
finite shell split of the four-center common-deletion packet.  Every step it
takes is a checked theorem of this cluster, so the narrowing carries no proof
obligation of its own.

`false_of_twoDeletionOutcome` consumes an outcome.  It is the only place in the
tree where the three open two-deletion terminals are applied, one per branch.

`false_of_twoDeletionIngress` composes the two.
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

namespace TwoDeletionIngress

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}

/-- The global-transport context obtained from an ingress record together with
the hypothesis that the two deleted sources have the same actual blocker. -/
def toB1GlobalTransportContext
    (I : TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H)
      (F := F))
    (hblockersEq :
      (lateFirstApexSystem I.R).centerAt I.first.deleted.1 I.first.deleted.2 =
        (lateFirstApexSystem I.R).centerAt I.second.deleted.1
          I.second.deleted.2) :
    B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F) :=
  { R := I.R, hcard := I.hcard, surface := I.surface, rho := I.rho
    hrho := I.hrho, hfive := I.hfive, u := I.u, v := I.v, huNeV := I.huNeV
    huClass := I.huClass, hvClass := I.hvClass, hvOmitted := I.hvOmitted
    huOmitted := I.huOmitted, first := I.first, second := I.second
    hdeletedNe := I.hdeletedNe, hblockersEq := hblockersEq }

end TwoDeletionIngress

/-- The four-center common-deletion packet is already exhaustively split by the
checked finite shell argument: either the common deleted source is one of the
three nonphysical carrier centers, or one of the four surviving centers forms a
bidirectional deletion-survival square with that source's actual blocker.  Both
alternatives are open terminals, so each is recorded as an outcome. -/
private theorem twoDeletionOutcome_of_fourCenterCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (P : FourCenterCommonDeletionPacket (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H)
      (F := F) := by
  have hsplit :=
    exactFour_fourSurvivingCenters_survivalSquare_split
      P.hrho P.first P.second
      P.hsecondBlockerNeU P.hsecondBlockerNeV P.hsecondBlockerNeApex
      P.crossPacket
  rcases hsplit with hqu | hqv | hqr | ha | hu | hv | hr
  · exact TwoDeletionOutcome.blockerCoincidence P (Or.inl hqu)
  · exact TwoDeletionOutcome.blockerCoincidence P (Or.inr (Or.inl hqv))
  · exact TwoDeletionOutcome.blockerCoincidence P (Or.inr (Or.inr hqr))
  · exact TwoDeletionOutcome.survivalSquare P (Or.inl ha)
  · exact TwoDeletionOutcome.survivalSquare P (Or.inr (Or.inl hu))
  · exact TwoDeletionOutcome.survivalSquare P (Or.inr (Or.inr (Or.inl hv)))
  · exact TwoDeletionOutcome.survivalSquare P (Or.inr (Or.inr (Or.inr hr)))

/-- A directed cross-omission produces an exact deleted four-point row at the
other deletion's actual blocker.  Together with the two existing packets that
is the four-center common-deletion packet, which the previous narrowing step
splits.

The two joint deletions are taken as separate arguments rather than read off
the ingress record, because the caller reaches this step once with the ingress
pair in its original order and once with the two deletions exchanged. -/
private theorem twoDeletionOutcome_of_oneWayCrossOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (I : TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H)
      (F := F))
    (first second : ExactFourMutualOmissionJointDeletion I.R I.rho I.u I.v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem I.R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem I.R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem I.R).centerAt I.u.1 I.u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem I.R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem I.R).centerAt I.v.1 I.v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem I.R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (hsecondBlockerNeU :
      (lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem I.R).centerAt I.u.1 I.u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem I.R).centerAt I.v.1 I.v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (hfirstNotMemSecondRow :
      first.deleted.1 ∉
        ((lateFirstApexSystem I.R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support) :
    TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H)
      (F := F) := by
  have hsecondBlockerA :
      (lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2 ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        ((lateFirstApexSystem I.R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.center_mem).2
  have hcrossSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1)
        ((lateFirstApexSystem I.R).centerAt
          second.deleted.1 second.deleted.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem I.R) second.deleted.2).mpr
        hfirstNotMemSecondRow
  rcases
      nonempty_commonDeletionTwoCenterPacket
        (lateFirstApexSystem I.R)
        first.uPacket.q_mem_A
        hsecondBlockerA
        first.uPacket.center₂_mem_A
        hsecondBlockerNeApex
        hcrossSurvives
        first.uPacket.survives₂ with
    ⟨crossPacket⟩
  exact
    twoDeletionOutcome_of_fourCenterCommonDeletionPacket
      { R := I.R, hcard := I.hcard, surface := I.surface, rho := I.rho
        hrho := I.hrho, hfive := I.hfive, u := I.u, v := I.v
        huNeV := I.huNeV, huClass := I.huClass, hvClass := I.hvClass
        hvOmitted := I.hvOmitted, huOmitted := I.huOmitted
        first := first, second := second
        hdeletedNe := hdeletedNe
        hdeletedBlockersNe := hdeletedBlockersNe
        hfirstBlockerNeU := hfirstBlockerNeU
        hfirstBlockerNeV := hfirstBlockerNeV
        hfirstBlockerNeApex := hfirstBlockerNeApex
        hsecondBlockerNeU := hsecondBlockerNeU
        hsecondBlockerNeV := hsecondBlockerNeV
        hsecondBlockerNeApex := hsecondBlockerNeApex
        crossPacket := crossPacket }

/-- The two-deletion exact-four residue is narrowed to the three open
terminals.  The case analysis is on whether the two deleted sources have the
same actual blocker; in the fresh-blocker arm the checked blocker-two-cycle
contradiction leaves one directed cross-omission, taken up to exchanging the
two deletions.

Every theorem this narrowing applies is a checked one, so the result carries no
proof obligation: the three open terminals are named by the outcome type and
are discharged only by `false_of_twoDeletionOutcome`. -/
theorem twoDeletionOutcome_of_ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (I : TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H)
      (F := F)) :
    TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H)
      (F := F) := by
  classical
  by_cases hblockersEq :
      (lateFirstApexSystem I.R).centerAt I.first.deleted.1 I.first.deleted.2 =
        (lateFirstApexSystem I.R).centerAt I.second.deleted.1 I.second.deleted.2
  · exact TwoDeletionOutcome.globalTransport
      (TwoDeletionIngress.toB1GlobalTransportContext I hblockersEq)
  · have hdeletedBlockersNe :
        (lateFirstApexSystem I.R).centerAt
            I.first.deleted.1 I.first.deleted.2 ≠
          (lateFirstApexSystem I.R).centerAt
            I.second.deleted.1 I.second.deleted.2 := hblockersEq
    rcases exactFour_twoDeletion_crossOmission I.first I.second I.hdeletedNe
        hdeletedBlockersNe
        I.first.uPacket.actual_blocker_ne_center₂
        I.second.uPacket.actual_blocker_ne_center₂ with
      hfirstNotMem | hsecondNotMem
    · exact twoDeletionOutcome_of_oneWayCrossOmission I I.first I.second
        I.hdeletedNe hdeletedBlockersNe
        I.first.uPacket.actual_blocker_ne_center₁
        I.first.vPacket.actual_blocker_ne_center₁
        I.first.uPacket.actual_blocker_ne_center₂
        I.second.uPacket.actual_blocker_ne_center₁
        I.second.vPacket.actual_blocker_ne_center₁
        I.second.uPacket.actual_blocker_ne_center₂
        hfirstNotMem
    · exact twoDeletionOutcome_of_oneWayCrossOmission I I.second I.first
        I.hdeletedNe.symm hdeletedBlockersNe.symm
        I.second.uPacket.actual_blocker_ne_center₁
        I.second.vPacket.actual_blocker_ne_center₁
        I.second.uPacket.actual_blocker_ne_center₂
        I.first.uPacket.actual_blocker_ne_center₁
        I.first.vPacket.actual_blocker_ne_center₁
        I.first.uPacket.actual_blocker_ne_center₂
        hsecondNotMem

/-- Each of the three open two-deletion terminals refutes its own branch.  This
is the only place in the tree where those three terminals are applied. -/
theorem false_of_twoDeletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (O : TwoDeletionOutcome (D := D) (S := S) (radius := radius) (H := H)
      (F := F)) :
    False := by
  cases O with
  | globalTransport C =>
      exact false_of_b1_global_gap_or_closed_terminal C
        (b1_globalGapOrClosedTerminal_of_counterexample C)
  | blockerCoincidence P hcollision =>
      exact
        false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence
          P.R P.hcard P.surface P.rho P.hrho P.hfive P.u P.v P.huNeV
          P.huClass P.hvClass P.hvOmitted P.huOmitted P.first P.second
          P.hdeletedNe P.hdeletedBlockersNe
          P.hfirstBlockerNeU P.hfirstBlockerNeV P.hfirstBlockerNeApex
          P.hsecondBlockerNeU P.hsecondBlockerNeV P.hsecondBlockerNeApex
          P.crossPacket hcollision
  | survivalSquare P hsquare =>
      exact
        false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
          P.R P.hcard P.surface P.rho P.hrho P.hfive P.u P.v P.huNeV
          P.huClass P.hvClass P.hvOmitted P.huOmitted P.first P.second
          P.hdeletedNe P.hdeletedBlockersNe
          P.hfirstBlockerNeU P.hfirstBlockerNeV P.hfirstBlockerNeApex
          P.hsecondBlockerNeU P.hsecondBlockerNeV P.hsecondBlockerNeApex
          P.crossPacket hsquare

/-- The whole two-deletion residue behind one ingress record: the narrowing
step followed by the consuming step. -/
theorem false_of_twoDeletionIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (I : TwoDeletionIngress (D := D) (S := S) (radius := radius) (H := H)
      (F := F)) :
    False :=
  false_of_twoDeletionOutcome (twoDeletionOutcome_of_ingress I)

end ATailFrontierLiveClosure
end Problem97
