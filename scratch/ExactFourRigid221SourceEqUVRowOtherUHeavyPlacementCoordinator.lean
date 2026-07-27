/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyLargeCapExclusion
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveCoordinator
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourcePlacement
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFivePlacementXuPeerU
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFivePlacementXuPeerXv
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFivePlacementXvPeerU

/-!
# Factored placement coordinator for the direct `uHeavy` residual

This file keeps the cap-growth and old/new-deletion information already
proved by the direct coordinators, but factors the remaining frontier into
independent finite dimensions:

* large second cap versus exact five;
* the two exact-five cap-growth profiles;
* first-opposite-cap growth versus the four exact point placements; and
* inside a good-source placement, the three old/new-deletion outcomes.

The first three point placements retain their existing direct packets.  The
only raw placement leaf is `goodSource = xv, omittedPeer = xu`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The two exact-five cap-growth profiles, factored away from source
placement so the coordinator does not duplicate their Cartesian product. -/
inductive ExactFourRigid221UHeavyExactFiveGrowthProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} : Prop
  | surplus
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | firstOpposite
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- All exact-five cap data common to the placement split. -/
structure ExactFourRigid221UHeavyExactFiveCapPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop where
  secondOppCap_card_eq_five : S.oppCap2.card = 5
  secondInterior_eq_named :
    S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv}
  v_not_mem_secondInterior :
    P.v.1 ∉ S.capInteriorByIndex S.oppIndex2
  deleted_not_mem_secondInterior :
    P.jointDeletion.deleted.1 ∉ S.capInteriorByIndex S.oppIndex2
  other_point_eq_xv : P.other.1 = xv
  source_blocker_eq_other_point :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.other.1
  outside_adjacent_orientation :
    (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.jointDeletion.deleted.1 ∈
          S.rightAdjacentCapByIndex S.oppIndex2) ∨
      (P.jointDeletion.deleted.1 ∈
          S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)
  growth :
    ExactFourRigid221UHeavyExactFiveGrowthProfile (D := D) (S := S)

/-- The old/new-deletion classification retained inside every good-source
placement leaf. -/
inductive ExactFourRigid221UHeavyExactFiveDeletionAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource) : Prop
  | oldDeletedInRegeneratedRow
      (old_deleted_mem_row :
        P.jointDeletion.deleted.1 ∈
            ((lateFirstApexSystem R).selectedAt
              Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∨
          P.jointDeletion.deleted.1 ∈
            ((lateFirstApexSystem R).selectedAt
              Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support)
      (new_deleted_ne_old :
        Q.jointDeletion.deleted ≠ P.jointDeletion.deleted)
  | secondJointDeletion
      (second :
        ExactFourMutualOmissionJointDeletion
          R P.rho Q.mutualU Q.mutualV)
      (second_ne_first :
        second.deleted ≠ Q.jointDeletion.deleted)
  | commonOldDeletion
      (new_deleted_eq_old :
        Q.jointDeletion.deleted = P.jointDeletion.deleted)
      (old_deleted_not_mem_u_row :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support)
      (old_deleted_not_mem_v_row :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support)

/-- Exhaustive exact-five placement frontier.  Three constructors retain
the strongest already-proved direct packet; the fourth is the sole raw
point-placement leaf. -/
inductive ExactFourRigid221UHeavyExactFivePlacementAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop
  | firstOppCapGrowth
      (firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card)
  | xuPeerU
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (deletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q)
      (goodSource_eq_xu : goodSource.1 = xu)
      (omittedPeer_eq_u : Q.omittedPeer.1 = P.u.1)
      (commonDeletion :
        Nonempty
          (CommonDeletionTwoCenterPacket
            D (lateFirstApexSystem R) P.u.1
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2)
            S.oppApex2))
      (jointDeletion :
        ∃ K : ExactFourMutualOmissionJointDeletion
            R P.rho goodSource Q.omittedPeer,
          K.deleted = P.jointDeletion.deleted ∨
            K.deleted = P.v ∨ K.deleted.1 = xv)
  | xuPeerXv
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (deletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q)
      (goodSource_eq_xu : goodSource.1 = xu)
      (omittedPeer_eq_xv : Q.omittedPeer.1 = xv)
      (strict_metric :
        dist Q.omittedPeer.1 goodSource.1 <
          dist P.u.1 goodSource.1)
      (jointDeletion :
        ∃ K : ExactFourMutualOmissionJointDeletion
            R P.rho goodSource Q.omittedPeer,
          K.deleted = P.jointDeletion.deleted ∨
            K.deleted = P.u ∨ K.deleted = P.v)
  | xvPeerU
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (deletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q)
      (goodSource_eq_xv : goodSource.1 = xv)
      (omittedPeer_eq_u : Q.omittedPeer.1 = P.u.1)
      (strict_metric :
        dist Q.omittedPeer.1 goodSource.1 <
          dist Q.omittedPeer.1 xu)
      (jointDeletion :
        ∃ K : ExactFourMutualOmissionJointDeletion
            R P.rho goodSource Q.omittedPeer,
          K.deleted = P.jointDeletion.deleted ∨ K.deleted = P.v)
  | xvPeerXu
      (goodSource : CarrierVertex D.A)
      (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
      (deletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q)
      (goodSource_eq_xv : goodSource.1 = xv)
      (omittedPeer_eq_xu : Q.omittedPeer.1 = xu)

/-- The smallest factored exhaustive narrowing of the direct `uHeavy`
residual: immediate fan-out two, with four large-cap leaves or five
exact-five placement leaves below it. -/
inductive ExactFourRigid221SourceEqUVRowOtherUHeavyPlacementResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop
  | large
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
      (narrowed :
        ExactFourRigid221SourceEqUVRowOtherUHeavyLargeCapNarrowedResidual
          R P xu xv)
  | exactFive
      (cap : ExactFourRigid221UHeavyExactFiveCapPacket P xu xv)
      (placement :
        ExactFourRigid221UHeavyExactFivePlacementAlternative P xu xv)

private theorem exactFivePlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hinterior :
      S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv}) :
    ExactFourRigid221UHeavyExactFivePlacementAlternative P xu xv := by
  classical
  let C : Finset ℝ² := SelectedClass D.A S.oppApex2 P.rho
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  have hrigid :
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Ku, Kv, Iu, Iv] using P.globalDeletion.rigid
  have hdisjoint : Disjoint Iu Iv := hrigid.2.2.1
  have huIu : P.u.1 ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, Ku, C] using terminal.named_rows.u_row_trace]
    simp
  have hxuIu : xu ∈ Iu := by
    rw [show Iu = {P.u.1, xu} by
      simpa [Iu, Ku, C] using terminal.named_rows.u_row_trace]
    simp
  have hxvIv : xv ∈ Iv := by
    rw [show Iv = {P.v.1, xv} by
      simpa [Iv, Kv, C] using terminal.named_rows.v_row_trace]
    simp
  have hxv_ne_u : xv ≠ P.u.1 := by
    intro hxv
    exact
      Finset.disjoint_left.mp hdisjoint huIu
        (by simpa [hxv] using hxvIv)
  have hxv_ne_xu : xv ≠ xu := by
    intro hxv
    exact
      Finset.disjoint_left.mp hdisjoint hxuIu
        (by simpa [hxv] using hxvIv)
  have hinteriorCard :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    rw [hinterior]
    rw [Finset.card_insert_of_notMem]
    · rw [Finset.card_insert_of_notMem]
      · simp
      · simpa using Ne.symm hxv_ne_xu
    · simp [Ne.symm terminal.named_rows.xu_ne_u,
        Ne.symm hxv_ne_u]
  have hcoord :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceCoordinator
      P xu xv terminal blocker_eq pair_interior blocker_interior
  rcases hcoord with hfirst |
      ⟨goodSource, Q, hrow, hnewNe⟩ |
      ⟨goodSource, Q, second, hsecondNe⟩ |
      ⟨goodSource, Q, hnewEq, hnotU, hnotV⟩
  · exact .firstOppCapGrowth hfirst
  all_goals
    have hplacement :=
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_placement
        P xu xv hinterior goodSource Q
  · have hdeletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q :=
      .oldDeletedInRegeneratedRow hrow hnewNe
    rcases hplacement with
        ⟨hgoodXu, hpeerU | hpeerXv⟩ |
        ⟨hgoodXv, hpeerU | hpeerXu⟩
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u
          P xu xv terminal blocker_eq goodSource Q hgoodXu hpeerU
      exact .xuPeerU goodSource Q hdeletion hgoodXu hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXu hpeerXv
      exact .xuPeerXv goodSource Q hdeletion hgoodXu hpeerXv
        hpacket.2.2.2.2.2.1 hpacket.2.2.2.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXv hpeerU
      exact .xvPeerU goodSource Q hdeletion hgoodXv hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · exact .xvPeerXu goodSource Q hdeletion hgoodXv hpeerXu
  · have hdeletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q :=
      .secondJointDeletion second hsecondNe
    rcases hplacement with
        ⟨hgoodXu, hpeerU | hpeerXv⟩ |
        ⟨hgoodXv, hpeerU | hpeerXu⟩
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u
          P xu xv terminal blocker_eq goodSource Q hgoodXu hpeerU
      exact .xuPeerU goodSource Q hdeletion hgoodXu hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXu hpeerXv
      exact .xuPeerXv goodSource Q hdeletion hgoodXu hpeerXv
        hpacket.2.2.2.2.2.1 hpacket.2.2.2.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXv hpeerU
      exact .xvPeerU goodSource Q hdeletion hgoodXv hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · exact .xvPeerXu goodSource Q hdeletion hgoodXv hpeerXu
  · have hdeletion :
        ExactFourRigid221UHeavyExactFiveDeletionAlternative P goodSource Q :=
      .commonOldDeletion hnewEq hnotU hnotV
    rcases hplacement with
        ⟨hgoodXu, hpeerU | hpeerXv⟩ |
        ⟨hgoodXv, hpeerU | hpeerXu⟩
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_u
          P xu xv terminal blocker_eq goodSource Q hgoodXu hpeerU
      exact .xuPeerU goodSource Q hdeletion hgoodXu hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXu hpeerXv
      exact .xuPeerXv goodSource Q hdeletion hgoodXu hpeerXv
        hpacket.2.2.2.2.2.1 hpacket.2.2.2.2.2.2.2
    · have hpacket :=
        exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xv_peer_u
          P xu xv terminal blocker_eq pair_interior blocker_interior
            hinteriorCard goodSource Q hgoodXv hpeerU
      exact .xvPeerU goodSource Q hdeletion hgoodXv hpeerU
        hpacket.2.2.2.1 hpacket.2.2.2.2
    · exact .xvPeerXu goodSource Q hdeletion hgoodXv hpeerXu

/-- Lossless source-clean coordinator from the direct `uHeavy` residual to
the factored placement frontier. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_placementCoordinator
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (W : ExactFourRigid221SourceEqUVRowOtherUHeavyDirectResidual P xu xv) :
    ExactFourRigid221SourceEqUVRowOtherUHeavyPlacementResidual P xu xv := by
  cases W.cap_alternative with
  | secondOppositeLarge hcard hinteriorCard hgrowth =>
    have hnarrowed :=
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_exclusion
        P xu xv W.terminal W.blocker_eq W.pair_interior W.blocker_interior
          W.row_cap_trace hcard hinteriorCard hgrowth
    exact .large hcard hinteriorCard hgrowth hnarrowed
  | secondOppositeExactFiveSurplusGrowth hcard hinterior hvNotInterior
      hdeletedNotInterior hotherEq hsourceEq horientation hsurplusCard
      hcardSum hcardTen =>
    have hcap : ExactFourRigid221UHeavyExactFiveCapPacket P xu xv :=
      { secondOppCap_card_eq_five := hcard
        secondInterior_eq_named := hinterior
        v_not_mem_secondInterior := hvNotInterior
        deleted_not_mem_secondInterior := hdeletedNotInterior
        other_point_eq_xv := hotherEq
        source_blocker_eq_other_point := hsourceEq
        outside_adjacent_orientation := horientation
        growth := .surplus hsurplusCard hcardSum hcardTen }
    exact .exactFive hcap
      (exactFivePlacement P xu xv W.terminal W.blocker_eq
        W.pair_interior W.blocker_interior
        hinterior)
  | secondOppositeExactFiveFirstGrowth hcard hinterior hvNotInterior
      hdeletedNotInterior hotherEq hsourceEq horientation hprofile hcardSum =>
    have hcap : ExactFourRigid221UHeavyExactFiveCapPacket P xu xv :=
      { secondOppCap_card_eq_five := hcard
        secondInterior_eq_named := hinterior
        v_not_mem_secondInterior := hvNotInterior
        deleted_not_mem_secondInterior := hdeletedNotInterior
        other_point_eq_xv := hotherEq
        source_blocker_eq_other_point := hsourceEq
        outside_adjacent_orientation := horientation
        growth := .firstOpposite hprofile hcardSum }
    exact .exactFive hcap
      (exactFivePlacement P xu xv W.terminal W.blocker_eq
        W.pair_interior W.blocker_interior
        hinterior)

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_placementCoordinator

end ATailFrontierLiveClosure
end Problem97
